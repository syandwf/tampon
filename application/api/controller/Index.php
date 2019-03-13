<?php
namespace app\api\Controller;

use think\Controller;
use think\Request;
use think\Db;

class Index extends Controller
{
    // 个人小程序
    // protected $appid = 'wx1ef2bb050c949665';
    // protected $appSecret = '4dbb77f35224463a2171d68067edf047';
    
    // 公司小程序
    protected $appid = 'wxcff0dfbbaf4ddfbc';
    protected $appSecret = '44c091ba6dd044cfaad53166f7fc3234';

    public function index(){
        return $this -> fetch('Index/index');
    }

    
    /*--------------------------用户部分---------------------------*/

    // 获取openid
    public function getopenid(){
        $data = Request::instance() -> param();
        $code = $data['code'];
        $appid = $this -> appid;
        $appSecret = $this -> appSecret;
        $url = "https://api.weixin.qq.com/sns/jscode2session?appid=$appid&secret=$appSecret&js_code=$code&grant_type=authorization_code";
        //通过code换取网页授权access_token
        $weixin =  file_get_contents($url); 
        $jsondecode = json_decode($weixin); //对JSON格式的字符串进行编码
        $array = get_object_vars($jsondecode);//转换成数组
        $openid = $array['openid'];//输出openid
        echo json_encode($openid);
        // var_dump($code);die;
    }

    // 用户注册
    public function register(){
        // dump(111);die;
        // dump(Request::instance() -> param());die;
        $data = Request::instance() -> param();
        $data['time'] = time();

        // $isUser = Db::name('customer_user') -> where('phone',$data['phone']) -> whereOr('openid',$data['openid']) -> select();
        $isUser = Db::name('customer_user') -> where('openid',$data['openid']) -> select();
        
        if($isUser){
            $result = array(
                'content' => '您已注册',
                'status'  => 1
            );
            echo json_encode($result);
        }else{
            $res = Db::name('customer_user') -> insert($data);

            if($res){
                $result = array(
                    'content' => '注册成功',
                    'status'  => 1
                );
                echo json_encode($result);
            }else{
                $result = array(
                    'content' => '注册失败',
                    'status'  => 0
                );
                echo json_encode($result);
            }
        }
    }

    // 获取用户信息
    public function getuserinfo(){
        $data = Request::instance() -> get();
        $res = db('customer_user') -> where('openid',$data['openid']) -> find();
        if($res['phone']){
            $res['phone'] = substr_replace($res['phone'], '****', 3, 4);
        }
        if($res){
            echo json_encode($res);
        }else{
            echo json_encode(null);
        }
    }

    // 绑定电话号码
    public function bindphone(){
        $data = Request::instance() -> param();
        if($data['openid']){
            $res = db('customer_user') -> where('openid',$data['openid']) -> update(['phone' => $data['phone']]);
            if($res){
                echo json_encode($res);
            }else{
                echo json_encode(null);
            }
        }
    }

    // 用户是否注册
    public function isRegister(){
        $data = Request::instance() -> param();
        if($data['openid']){
            $res = db('customer_user') -> where('openid',$data['openid']) -> find();
            if($res){
                $result = array(
                    'content' => '已经注册',
                    'status'  => 1
                );
                echo json_encode($result); 
            }else{
                $result = array(
                    'content' => '还未注册',
                    'status'  => 0
                );
                echo json_encode($result); 
            }
        }else{
            $result = array(
                'content' => 'openid为空',
                'status'  => 0
            );
            echo json_encode($result); 
        }
    }

    // 编辑信息
    public function edituser(){
        $data = Request::instance() -> param();
        $res = db('customer_user') -> where('openid',$data['openid']) -> update($data);
        if($res){
            $result = array(
                'content' => '编辑成功',
                'status'  => 1
            );
            echo json_encode($result);
        }else{
            $result = array(
                'content' => '编辑失败',
                'status'  => 0
            );
            echo json_encode($result); 
        }
    }


    /*--------------------------经期记录部分---------------------------*/

    // 用户是否已经设置经期
    public function isperiod(){
        $data = Request::instance() -> param();
        if($data['openid']){
            $res = db('customer_periodsetting') -> where('openid',$data['openid']) -> find();
            if($res){
                $result = array(
                    'content' => '已经设置了经期',
                    'status'  => 1
                );
                echo json_encode($result);
            }else{
                $result = array(
                    'content' => '还未设置经期',
                    'status'  => 0
                );
                echo json_encode($result);
            }
        }else{
            $result = array(
                'content' => 'openid为空',
                'status'  => 0
            );
            echo json_encode($result);
        }   
    }

    // 经期设置
    public function setPeriod(){
        $data = Request::instance() -> param();
        $data['before'] = strtotime($data['before']);
        $data['time'] = time();
        $data['age'] = 18;      //默认18岁
        $data['sex'] = 0;       //默认女生
        // var_dump($data);die;
        if($data['isown'] == 0){
            $isUser = db('customer_periodsetting') -> where('openid = :openid and isown = 0') -> bind(['openid'=>$data['openid']]) -> find();
            if($isUser){
                $this->updateSetPeriod($data);
            }else{
                $this->addSetPeriod($data);
            }
        }else{
            $this->addSetPeriod($data);
        }
    }

    // 插入月经设置
    public function addSetPeriod($data){
        $res = db('customer_periodsetting') -> insert($data);
        if($res){
            $result = array(
                'content' => '设置成功',
                'status'  => 1
            );
            echo json_encode($result); 
        }else{
            $result = array(
                'content' => '设置失败',
                'status'  => 0
            );
            echo json_encode($result); 
        }
    }

    // 修改月经设置
    public function updateSetPeriod($data){
        $res = db('customer_periodsetting') -> where('openid',$data['openid']) -> update(['day'=>$data['day'],'cycle'=>$data['cycle'],'law'=>$data['law']]);
        if($res){
            $result = array(
                'content' => '修改成功',
                'status'  => 1
            );
            echo json_encode($result); 
        }else{
            $result = array(
                'content' => '修改失败',
                'status'  => 0
            );
            echo json_encode($result); 
        }
    }

    // 获取用户经期设置的数据
    public function getPeriod(){
        $data = Request::instance() -> param();
        if($data['openid']){
            $res = db('customer_periodsetting') -> where('openid',$data['openid']) -> find();
            if($res){
                $res['before'] = date("Y-m-d",$res['before']);
                $res['status'] = 1;
                echo json_encode($res);
            }else{
                $result = array(
                    'content' => '查询失败',
                    'status'  => 0
                );
                echo json_encode($result); 
            }
        }else{
            $result = array(
                'content' => 'openid为空',
                'status'  => 0
            );
            echo json_encode($result); 
        }
    }

    // (上个月或者下个月)经期预测 
    // type=0 next、prev等于当前月 type=1 next大于当前月    type=2 prev大于当前月
    public function forecastPeriod(){
        // $now = '2019-1-31';
        // $time = date("Y-m-d H:i:s",strtotime("+28days",strtotime($now)));
        // echo json_encode($time);
        $data = Request::instance() -> param();
        $res = db('customer_periodsetting') -> field('before,day,cycle,law') -> where('openid',$data['openid']) -> find();
        // 经期长度
        $day = $res['day'];
        // 周期
        $cycle = $res['cycle'];
        // 上上次周期
        $cycle_b = ($cycle * 2) - $day;
        // 预测的经期日期
        $forecastDate = [];
        // 预测的经期
        $forecastPeriod = [];
        if($data['type'] == 0 || $data['type'] == 1){
            // $res = db('customer_periodsetting') -> field('before,day,cycle,law') -> where('openid',$data['openid']) -> find();
            if($res){
                $before=0;
                $nextMonth = date("Y-m",strtotime("+1months",strtotime($data['curMonth'])));
                // 在当前月的时候不传日期，在其他月的时候都会传前一次的经期
                if($data['beforePeriod']){
                    // 如果有传上个月经期日期，判断一下加上 经期长度是否在下个月内
                    $minDate = date("Y-m-d",strtotime("+".$res['day']."days",strtotime($data['beforePeriod'])));
                    if(strtotime($minDate) >= strtotime($data['curMonth']) && strtotime($minDate) < strtotime($nextMonth)){
                        $minDate_s = strtotime($minDate);
                        $curMonth_s = strtotime($data['curMonth']);
                        $minDay = (int)ceil(($minDate_s - $curMonth_s)/86400);
                        for($m=0;$m < $minDay;$m++){
                            $periodDate_s = date("d",strtotime("+".$m."days",strtotime($data['curMonth'])));
                            array_push($forecastPeriod,$periodDate_s);
                        }
                    }
                    // 前一次的经期
                    $before = strtotime($data['beforePeriod']);
                }else{
                    $before = $res['before'];
                }
                $period = date("Y-m-d",$before);
                // 经期长度
                //$day = $res['day'];
                // 周期
                //$cycle = $res['cycle'];
                // 预测的经期日期
                //$forecastDate = [];
                // 预测的经期
                //$forecastPeriod = [];
                for($i = 1;$i <= 6;$i++){
                    $period = date("Y-m-d",strtotime("+".$cycle."days",strtotime($period)));
                    // 1、如果预测经期大于下个月 2、预测的经期大于本月小于下个月 
                    if(strtotime($period) >= strtotime($nextMonth)){
                        break;
                    }
                    else if(strtotime($period) >= strtotime($data['curMonth']) && strtotime($period) < strtotime($nextMonth)){
                         array_push($forecastDate,$period);
                    }
                }
                if(count($forecastDate)>0){
                    for($i=0;$i<count($forecastDate);$i++){
                        $maxPeriod = date("Y-m-d",strtotime("+".$day."days",strtotime($forecastDate[$i])));
                        // 如果最大的日期小于下个月展示所有的天数，否则 用下个月1号-当前预测经期的日期的天数
                        if(strtotime($maxPeriod) <= strtotime($nextMonth)){
                            for($j=0;$j<=$day-1;$j++){
                                $periodDate = date("d",strtotime("+".$j."days",strtotime($forecastDate[$i])));
                                array_push($forecastPeriod,$periodDate);
                            }
                        }else{
                            $nMonth = strtotime($nextMonth);
                            $cDate = strtotime($forecastDate[$i]);
                            $addDay = (int)ceil(($nMonth-$cDate)/86400); //86400 = 60s*60min*24h
                            for($k=0;$k<=$addDay-1;$k++){
                                $periodDate = date("d",strtotime("+".$k."days",strtotime($forecastDate[$i])));
                                array_push($forecastPeriod,$periodDate);
                            }
                        }
                    }
                }else{
                    // 如果没有预测的经期再把 (微信端传进来前一次的经期)赋值给 预测经期的数组
                    $period1 = date("Y-m-d",$before);
                    array_push($forecastDate,$period1);
                }
                $result = [
                    'forecastDate' => $forecastDate,
                    'forecastPeriod' => $forecastPeriod
                ];
                echo json_encode($result);
            }
        }else if($data['type'] == 2){
            if($data['beforePeriod']){
                $before = strtotime($data['beforePeriod']);
                $prevMonth = date("Y-m",strtotime("-1months",strtotime($data['curMonth'])));
                // 判断一下 上上 个月的经期 + 经期长度是否在上个月内
                $maxDate_p = date("Y-m-d",strtotime("-".$cycle_b."days",strtotime($data['beforePeriod'])));
                if(strtotime($maxDate_p) >= strtotime($prevMonth) && strtotime($maxDate_p) < strtotime($data['curMonth'])){
                    $maxDate_ps = strtotime($maxDate_p);
                    $curMonth_p = strtotime($prevMonth);
                    // var_dump($maxDate_p,$curMonth_p);die;
                    $maxDay = (int)ceil(($maxDate_ps - $curMonth_p)/86400);
                    if($maxDay > $day){
                        $maxDay = $day;
                    }
                    for($m=$maxDay;$m > 0;$m--){
                        $periodDate_p = date("d",strtotime("-".$m."days",strtotime($maxDate_p)));
                        array_push($forecastPeriod,$periodDate_p);
                    }
                }
                // 判断一下 上 个月的经期是否在上个月内
                $period = date("Y-m-d",$before);
                for($i = 6;$i >= 1;$i--){
                    $period = date("Y-m-d",strtotime("-".$cycle."days",strtotime($period)));
                    // 1、如果预测经期大于下个月 2、预测的经期大于本月小于下个月 
                    if(strtotime($period) < strtotime($prevMonth)){
                        break;
                    }
                    else if(strtotime($period) < strtotime($data['curMonth']) && strtotime($period) >= strtotime($prevMonth)){
                         array_push($forecastDate,$period);
                    }
                }
                // 如果一个月内有两个经期的话，把小的放在前面  array_reverse() 数组倒序
                $forecastDate = array_reverse($forecastDate);
                // 如果有经期的话，去找到在当前月的日期
                if(count($forecastDate)>0){
                    for($i=0;$i<count($forecastDate);$i++){
                        $maxPeriod = date("Y-m-d",strtotime("+".$day."days",strtotime($forecastDate[$i])));
                        // 经期 + 经期长度 < 下一个月全部展示 否则 展示下个月的1号 - 经期日期的长度
                        if(strtotime($maxPeriod) < strtotime($data['curMonth'])){
                            for($j=0;$j<=$day-1;$j++){
                                $periodDate = date("d",strtotime("+".$j."days",strtotime($forecastDate[$i])));
                                array_push($forecastPeriod,$periodDate);
                            }
                        }else{
                            $cMonth = strtotime($data['curMonth']);
                            $cDate = strtotime($forecastDate[$i]);
                            $addDay = (int)ceil(($cMonth-$cDate)/86400); //86400 = 60s*60min*24h
                            for($k=0;$k<=$addDay-1;$k++){
                                $periodDate = date("d",strtotime("+".$k."days",strtotime($forecastDate[$i])));
                                array_push($forecastPeriod,$periodDate);
                            }
                        }
                    }
                }
                $result = [
                    'forecastDate' => $forecastDate,
                    'forecastPeriod' => $forecastPeriod
                ];
                echo json_encode($result);
            }
        }
    }

    // 比较两个月的大小
    public function compareMonth(){
        $data = Request::instance() -> param();
        if($data['nowMonth'] && $data['curMonth']){
            $nowMonth = strtotime($data['nowMonth']);
            $curMonth = strtotime($data['curMonth']);
            if($nowMonth == $curMonth){
                $result = array(
                    'content' => '等于当前月份',
                    'status'  => 0
                );
                echo json_encode($result); 
            }else if($nowMonth < $curMonth){
                $result = array(
                    'content' => '大于当前月份',
                    'status'  => 1
                );
                echo json_encode($result); 
            }else{
                $result = array(
                    'content' => '小于当前月份',
                    'status'  => 2
                );
                echo json_encode($result); 
            }
        }
    }

    // 经期记录(添加与删除)
    public function periodRecord(){
        $data = Request::instance() -> param();
        // 0、删除经期记录或者经期结束1、添加经期记录
        if($data['status'] == 1){
            $res = db('customer_periodsetting') -> field('before,day,cycle,law') -> where('openid',$data['openid']) -> find();
            if($res){
                //上一次月经
                $before = $res['before'];
                if(strtotime($data['date']) < $before){
                    $before = '';
                }
                // 经期长度
                $day = $res['day'] - 1;
                // 周期
                $cycle = $res['cycle'];
                $yc_endTime = date("Y-m-d",strtotime("+".$day."days",strtotime($data['date'])));
                $record = [
                    'openid' => $data['openid'],
                    'before' => $before,
                    'start_time' => strtotime($data['date']),
                    'end_time' => null,
                    'yc_end_time' => strtotime($yc_endTime),
                    'isEnd' => 0,
                    'time' => time()
                ];
                $res2 = db('customer_periodrecord') -> insert($record);
                if($res2){
                    if($before){
                        $res3 = db('customer_periodsetting') -> where('openid',$data['openid']) -> update(['before'=>strtotime($data['date'])]);
                    }
                    if($res3){
                        $result = array(
                            'content' => '插入成功',
                            'status'  => 1
                        );
                        echo json_encode($result); 
                    }else{
                        $result = array(
                            'content' => '插入成功,上一次经期没变',
                            'status'  => 1
                        );
                        echo json_encode($result); 
                    }
                }else{
                    $result = array(
                        'content' => '插入失败',
                        'status'  => 0
                    );
                    echo json_encode($result); 
                }
            }
        }else{
            // 判断用户是不是按错，如果关闭的时间 减去 开始的时间小于3天记录无效
            $lastRecord = db('customer_periodrecord') -> field('id,before,start_time') -> where(['openid'=>$data['openid'],'isEnd'=>0]) -> order('time desc') -> find();
            if($lastRecord){
                // $dateTime = date("Y-m-d",strtotime("+1days",strtotime($data['date'])));
                // $curTime = strtotime($dateTime);
                $curTime = strtotime($data['date']);
                $day = (int)ceil(($curTime-$lastRecord['start_time'])/86400);
                $day += 1;
                // var_dump($day);
                if($day >= 3){
                    // 本次经期结束
                    $res = db('customer_periodrecord') -> where('id',$lastRecord['id']) -> update(['end_time'=>$curTime,'yc_end_time'=>$curTime,'isEnd'=>1]);
                    // 更新用户的月经长度、周期长度
                    $cycle = (int)ceil(($curTime - $lastRecord['before'])/86400);
                    $cycle += 1;
                    if($cycle >= 15 && $cycle <= 40){
                        $user = db('customer_periodsetting') -> where('openid',$data['openid']) -> update(['day'=>$day,'cycle'=>$cycle]);
                    }
                    if($res){
                        $result = array(
                            'content' => '经期记录成功',
                            'status'  => 1
                        );
                        echo json_encode($result); 
                    }else{
                        $result = array(
                            'content' => '经期记录失败',
                            'status'  => 0
                        );
                        echo json_encode($result); 
                    }
                }else{
                    // 小于3天的经期不记录
                    // 把上一次开始的经期时间还原回去
                    if($lastRecord['before']){
                        $ret_before = db('customer_periodsetting') -> where('openid',$data['openid']) -> update(['before'=>$lastRecord['before']]);
                    }
                    $res = db('customer_periodrecord') -> where('id',$lastRecord['id']) -> delete();
                    if($res){
                        $result = array(
                            'content' => '删除成功,小于3天的经期不记录',
                            'status'  => 1
                        );
                        echo json_encode($result); 
                    }else{
                        $result = array(
                            'content' => '删除失败',
                            'status'  => 0
                        );
                        echo json_encode($result); 
                    }
                }
            }
        }
    }

    // 判断记录页面（姨妈来了、怀孕）按钮的值
    public function btnRecordStatus(){
        $data = Request::instance() -> param();
        if($data['openid']){
            $user = db('customer_periodsetting') -> field('ispregnant') -> where('openid',$data['openid']) -> find();
            $record = db('customer_periodrecord') -> field('isEnd') -> where('openid',$data['openid']) -> order('time desc') -> find();
            $isPregnant = 0;
            $isEnd = 1;
            if($user){
                $isPregnant = $user['ispregnant'];
            }
            if( $record){
                $isEnd = $record['isEnd'];
            }
            $result = [
                'isPregnant' => $isPregnant,
                'isEnd' => $isEnd
            ];
            echo json_encode($result);
        }
    }

    // 判断当月是否有经期记录
    // next、prev等于当前月 next、prev小于当前月
    public function isPeriodRecord(){
        $data = Request::instance() -> param();
        if($data['openid'] && $data['curMonth']){
            $record = db('customer_periodrecord') -> field(['start_time','end_time','yc_end_time']) -> where('openid',$data['openid']) -> order('start_time desc') -> select();
            $periodDate = [];
            $periodDay = [];
            $curMonth = strtotime($data['curMonth']);
            $nextMonth = date("Y-m",strtotime("+1months",strtotime($data['curMonth'])));
            if(count($record)>0){
                for($i = 0;$i < count($record);$i++){
                    if($record[$i]['start_time'] >= $curMonth && $record[$i]['start_time'] < strtotime($nextMonth)){
                        array_push($periodDate,$record[$i]);
                    }else if($record[$i]['start_time'] < $curMonth && $record[$i]['yc_end_time'] >= $curMonth){
                        array_push($periodDate,$record[$i]);
                    }
                }
                if(count($periodDate) > 0){
                    for($j=0;$j<count($periodDate);$j++){
                        // var_dump(strtotime($nextMonth));die;
                        if($periodDate[$j]['yc_end_time'] < strtotime($nextMonth)){
                            if($periodDate[$j]['start_time'] >= $curMonth){
                                $day = (int)ceil(($periodDate[$j]['yc_end_time']-$periodDate[$j]['start_time'])/86400); //86400 = 60s*60min*24h
                                // var_dump($day);
                                for($k=0;$k<=$day;$k++){
                                    $pStartTime = date('Y-m-d',$periodDate[$j]['start_time']);
                                    $pDay = date("d",strtotime("+".$k."days",strtotime($pStartTime)));
                                    array_push($periodDay ,$pDay);
                                }
                            }else{
                                $day1 = (int)ceil(($periodDate[$j]['yc_end_time']-$curMonth)/86400);
                                for($l=0;$l<$day1;$l++){
                                    $pStartTime1 = date('Y-m-d',$curMonth);
                                    $pDay1 = date("d",strtotime("+".$l."days",strtotime($pStartTime1)));
                                    array_push($periodDay ,$pDay1);
                                }
                            }
                        }else{
                            $nMonth = strtotime($nextMonth);
                            $day = (int)ceil(($nMonth-$periodDate[$j]['start_time'])/86400); //86400 = 60s*60min*24h
                            for($k=0;$k<$day-1;$k++){
                                $pStartTime = date('Y-m-d',$periodDate[$j]['start_time']);
                                $pDay = date("d",strtotime("+".$k."days",strtotime($pStartTime)));
                                array_push($periodDay ,$pDay);
                            }
                        }
                    }
                    echo json_encode($periodDay);
                }
                // var_dump($periodDate);die;
            }else{
                echo json_encode(null);
            }
        }
    }

    // （我的经期记录）判断是否有经期记录
    public function havePeriodRecord(){
        $data = Request::instance() -> param();
        if($data['openid']){
            $res = db('customer_periodrecord') -> where('openid',$data['openid']) -> order('start_time desc') -> select();
            if($res){
                $period_record = [];
                for($i=0;$i<count($res);$i++){
                    $period['id'] = $res[$i]['id'];
                    $period['year'] = date("Y",$res[$i]['start_time']);
                    $period['start_time'] = date("m-d",$res[$i]['start_time']);
                    if($res[$i]['end_time']){
                        $period['end_time'] = date("m-d",$res[$i]['end_time']);
                    }else{
                        $period['end_time'] = '';
                    }
                    $period['isEnd'] = $res[$i]['isEnd'];
                    array_push($period_record,$period);
                }
                $result = array(
                    'period_record' => $period_record,
                    'content' => '有记录',
                    'status'  => 1
                );
                echo json_encode($result); 
            }else{
                $result = array(
                    'content' => '没有记录',
                    'status'  => 0
                );
                echo json_encode($result); 
            }
        }else{
            $result = array(
                'content' => '没有openid',
                'status'  => 0
            );
            echo json_encode($result); 
        }
    }

    // 删除经期记录
    public function recordDel(){
        $data = Request::instance() -> param();
        if($data['id']){
            $res = db('customer_periodrecord') -> where(['id' => $data['id'],'openid' => $data['openid']]) -> delete();
            if($res){
                $result = array(
                    'content' => '删除成功',
                    'status'  => 1
                );
                echo json_encode($result); 
            }else{
                $result = array(
                    'content' => '删除失败',
                    'status'  => 0
                );
                echo json_encode($result); 
            }
        }
    }


    /*--------------------------主页部分---------------------------*/

    // 获取轮播图列表
    public function getAdvList(){
        $data = db('home_advlist') -> field('filepath,jumpurl') -> where('status',1) -> select();
        if($data){
            $advlist = [];
            foreach($data as $value){
                $cur_adv = [];
                $filepath = 'https://www.ai-quick.com/'.$value['filepath'];
                $cur_adv['filepath'] = $filepath;
                $cur_adv['jumpurl'] = $value['jumpurl'];
                array_push($advlist,$cur_adv);
            }
            // var_dump($advlist);die;
            echo json_encode($advlist);
        }
    }

    // 获取盒子列表
    public function getBoxList(){
        $box = db('home_boxlist') -> select();
        if($box){
            foreach($box as $key => $value){
                $box_minprice = db('home_boxprice') -> field('price') -> where('box_id',$value['id']) -> order('month asc') -> find();
                $box_minprice = explode('.',$box_minprice['price']);
                $box[$key]['price'] = $box_minprice[0];
                $box[$key]['cover_img'] = 'https://www.ai-quick.com/'.$value['cover_img'];
            }
            echo json_encode($box);
        }
    }

    // 获取盒子详情
    public function getBoxDetails(){
        $data = Request::instance() -> param();
        if($data['boxId']){
            $box_details = db('home_boxlist') -> where('id',$data['boxId']) -> find();
            if($box_details){
                $display_img = explode(',',$box_details['display_img']);
                foreach($display_img as $key => $value){
                    $display_img[$key] = 'https://www.ai-quick.com/'.$value; 
                }
                $box_details['cover_img'] = 'https://www.ai-quick.com/'.$box_details['cover_img'];
                $box_details['display_img'] = $display_img;
                echo json_encode($box_details);
            }
        }
    }

    // 获取盒子价格
    public function getBoxPrice(){
        $data = Request::instance() -> param();
        if($data['boxId']){
            $box_price = db('home_boxprice') -> field('month,name,price') -> where('box_id',$data['boxId']) -> order('month asc') -> select();
            if($box_price){
                echo json_encode($box_price);
            }
        }
    }

    // 获取盒子默认的品牌 
    public function getBoxbrand(){
        $boxId = request::instance() -> param();
        if($boxId['boxId']){
            $res = db('home_boxbrand') -> where(['box_id' => $boxId['boxId'],'is_default' => 1]) -> find();
            if($res){
                $res['content'] = explode('。',$res['content']);
                echo json_encode($res);
            }
        }
    }

    // 获取盒子所有品牌的信息
    public function getBoxAllbrand(){
        $boxId = request::instance() -> param();
        if($boxId['boxId']){
            $res = db('home_boxbrand') -> field('id,brand,content') -> where(['box_id' => $boxId['boxId']]) -> select();
            if($res){
                foreach($res as $key => $value){
                    $res[$key]['content'] = explode('。',$value['content']);
                }
                echo json_encode($res);
            }
        }
    }

    // 获取盒子的评论
    public function getBoxEvaluate(){
        $data = Request::instance() -> param();
        if($data['box_id']){
            $evaluate = db('home_box_evaluate') -> field('id,openid,box_brand,content,img_url,time') -> where('box_id',$data['box_id']) -> select();
            $evaluate_num = db('home_box_evaluate') -> where('box_id',$data['box_id']) -> count();
            if($evaluate){
                foreach($evaluate as $key => $value){
                    $arr_img = [];
                    $arr_num = 0;
                    if($value['img_url']){
                        $arr_img = explode(',',$value['img_url']);
                        foreach($arr_img as $key2 => $value2){
                            $arr_img[$key2] = 'https://www.ai-quick.com/uploads/images/'.$value2;
                        }
                        $arr_num = count($arr_img);
                    }
                    $evaluate[$key]['com_img'] = $arr_img;
                    $evaluate[$key]['com_img_len'] = $arr_num;
                    $evaluate[$key]['time'] =  date("Y-m-d",$value['time']);
                    $user = db('customer_user') -> field('wx_headimg,wx_nickname') -> where('openid',$value['openid']) -> find();
                    $evaluate[$key]['user_img'] = $user['wx_headimg'];
                    $evaluate[$key]['user_name'] = $user['wx_nickname'];
                }
            }
            $res = [
                'evaluate_list' => $evaluate,
                'evaluate_num' => $evaluate_num
            ];
            echo json_encode($res);
        }
    }


    /*--------------------------订单部分---------------------------*/

    // 是否有永久订单
    public function hasForeverOrder(){
        $data = Request::instance() -> param();
        if($data['openid']){
            $res = db('customer_forever_order') -> where('openid',$data['openid']) -> find();
            if($res){
                $result = array(
                    'content' => '已下单',
                    'status'  => 0
                );
                echo json_encode($result); 
            }else{
                $result = array(
                    'content' => '未下单',
                    'status'  => 1
                );
                echo json_encode($result); 
            }
        }
    }

    // 生成普通订单
    public function generateOrder(){
        $data = Request::instance() -> param();
        if($data){
            // 订单id 利用当前的时间，加随机机补全的方法生成，把时间精确到秒级
            $data['order_id'] = date('Ymd').str_pad(mt_rand(1, 99999), 5, '0', STR_PAD_LEFT);
            $data['status'] = 0;
            $data['time'] = time();
            if(!$data['address_id']){
                $address = db('customer_receive_address') -> field('id') -> where(['openid'=>$data['openid'],'is_default' => 1]) -> find();
                if($address){
                    $data['address_id'] = $address['id'];
                }else{
                    $data['address_id'] = 0;
                }
            }
            if($data['pay_type'] == 1){
                $box = db('home_boxprice') -> field('month,price') -> where('box_id',$data['box_id']) -> order('month asc') -> find();
                if($box){
                    $data['sum_box'] = $box['month'];
                    $data['sum_price'] = $box['price'];
                }
            }
            $resId = db('customer_order') -> insertGetId($data);
            if($resId){
                $forever_id = 0;
                if($data['pay_type'] == 0){
                    // 生成永久订单
                    $forever_id = $this -> forverOrder($resId);
                }
                $result = array(
                    'content' => '下单成功',
                    'id'  => $resId,
                    'forever_id' => $forever_id
                );
                echo json_encode($result);
            }
        }
    }

    // 获取普通订单(我的永久订单/全部订单)
    public function getGenerateOrder(){
        $data = Request::instance() -> param();
        if($data['openid']){
            $res = db('customer_order') -> where('openid',$data['openid']) -> select();
            foreach($res as $key => $value){
                $box = db('home_boxlist') -> field('name,cover_img') -> where('id',$value['box_id']) -> find();
                $res[$key]['box_name'] = $box['name'];
                $res[$key]['cover_img'] = 'https://www.ai-quick.com/'.$box['cover_img'];
            }
            if($res){
                echo json_encode($res);
            }else{
                echo json_encode(null);
            }
        }
    }

    // 生成永久订单
    public function forverOrder($id){
        // $data = Request::instance() -> param();
        if($id){
            // 订单id 利用当前的时间，加随机机补全的方法生成，把时间精确到秒级
            // $data['order_id'] = date('Ymd').str_pad(mt_rand(1, 99999), 5, '0', STR_PAD_LEFT);
            // 获取对应的订单
            $data = db('customer_order') -> where('id',$id) -> find();
            $forever['order_id'] = $data['order_id'];
            $forever['openid'] = $data['openid'];
            $forever['box_id'] = $data['box_id'];
            $forever['sum_box'] = $data['sum_box'];
            $forever['rest_box'] = $data['sum_box'];
            $forever['sum_price'] = $data['sum_price'];
            $forever['menstrual_volume'] = $data['menstrual_volume'];
            $forever['brand'] = $data['brand'];
            $forever['status'] = $data['status'];
            $forever['address_id'] = $data['address_id'];
            $forever['time'] = $data['time'];
            $resId = db('customer_forever_order') -> insertGetId($forever);
            if($resId){
                // $result = array(
                //     'content' => '下单成功',
                //     'id'  => $resId
                // );
                // echo json_encode($result);
                return $resId;
            }
        }
    }

    // 获取永久订单(我的永久订单/盒子订单)
    public function getForeverOrder(){
        $data = Request::instance() -> param();
        if($data['openid']){
            $res = db('customer_forever_order') -> where('openid',$data['openid']) -> select();
            foreach($res as $key => $value){
                $box = db('home_boxlist') -> field('name,cover_img') -> where('id',$value['box_id']) -> find();
                $res[$key]['box_name'] = $box['name'];
                $res[$key]['cover_img'] = 'https://www.ai-quick.com/'.$box['cover_img'];
                $arr_brand = $this -> getForeverBoxAllbrand($value['box_id']);
                $array = [];
                foreach($arr_brand as $key2 => $value2){
                    array_push($array,$value2['brand']);
                    if($value2['brand'] == $value['brand']){
                        $res[$key]['brand_index'] = $key2;
                    }
                }
                $res[$key]['brand_arr'] = $array;
            }
            if($res){
                echo json_encode($res);
            }else{
                echo json_encode(null);
            }
        }
    }

    // 获取盒子所有品牌的信息
    public function getForeverBoxAllbrand($boxId){
        $res = db('home_boxbrand') -> field('id,brand') -> where(['box_id' => $boxId]) -> select();
        return $res;
    }

    // 下单时获取订单信息
    public function getOrderInfo(){
        $data = Request::instance() -> param();
        if($data['order_id']){
            $res = db('customer_order') -> where('id',$data['order_id']) -> find();
            $box = db('home_boxlist') -> field('name,cover_img') -> where('id',$res['box_id']) -> find();
            $res['box_name'] = $box['name'];
            $res['cover_img'] = 'https://www.ai-quick.com/'.$box['cover_img'];
            if($res){
                echo json_encode($res);
            }else{
                echo json_encode(null);
            }
        }
    }

    // 盒子改变时修改订单
    public function changeOrder(){
        $data = Request::instance() -> param();
        // var_dump($data);die;
        if($data){
            $before = db('customer_order') -> field('order_id,box_id') -> where('id',$data['id']) -> find();
            if($before['box_id'] == $data['box_id']){
                $result = [
                    'content' => '盒子相同',
                    'status'  => 0
                ];
                echo json_encode($result);
            }else{
                // 盒子价格
                $box_price = db('home_boxprice') -> field('price') -> where(['box_id'=> $data['box_id'],'month'=>$data['sum_box']]) -> find();
                $box_band = db('home_boxbrand') -> field('brand') -> where('box_id',$data['box_id']) -> find();

                $new_data['box_id'] = $data['box_id'];
                $new_data['sum_price'] = $box_price['price'];
                $new_data['brand'] = $box_band['brand'];

                $res = db('customer_order') -> where('id',$data['id']) -> update($new_data);
                // 判断一下是不是第一个订单
                $is_first = db('customer_forever_order') -> where('order_id',$before['order_id']) -> find();
                if($is_first){
                    $res2 = db('customer_forever_order') -> where('order_id',$before['order_id']) -> update($new_data);
                }
                if($res){
                    $result = [
                        'content' => '修改成功',
                        'status'  => 1
                    ];
                    echo json_encode($result);
                }
            }
        }
    }

    // 品牌改变时修改订单
    public function changeBrand(){
        $data = Request::instance() -> param();
        if($data){
            $before = db('customer_order') -> field('order_id,brand') -> where('id',$data['id']) -> find();
            if($before['brand'] == $data['brand']){
                $result = [
                    'content' => '品牌相同',
                    'status'  => 0
                ];
                echo json_encode($result);
            }else{
                $new_data['brand'] = $data['brand'];
                $res = db('customer_order') -> where('id',$data['id']) -> update($new_data);
                // 判断一下是不是第一个订单
                $is_first = db('customer_forever_order') -> where('order_id',$before['order_id']) -> find();
                if($is_first){
                    $res2 = db('customer_forever_order') -> where('order_id',$before['order_id']) -> update($new_data);
                }
                if($res){
                    $result = [
                        'content' => '修改成功',
                        'status'  => 1
                    ];
                    echo json_encode($result);
                }
            }
        }
    }

    // 永久订单时候更换品牌
    public function changeBoxBrand(){
        $data = Request::instance() -> param();
        if($data['forever_id'] && $data['curBrand']){
            $res = db('customer_forever_order') -> where('id',$data['forever_id']) -> update(['brand' => $data['curBrand']]);
            if($res){
                $result = [
                    'content' => '修改成功！',
                    'status'  => 1
                ];
                echo json_encode($result);
            }else{
                $result = [
                    'content' => '修改失败！',
                    'status'  => 0
                ];
                echo json_encode($result);
            }
        }
    }

    // 价格改变时修改订单
    public function changePrice(){
        $data = Request::instance() -> param();
        if($data){
            $before = db('customer_order') -> field('order_id,box_id,sum_box') -> where('id',$data['id']) -> find();
            if($before['sum_box'] == $data['sum_box']){
                $result = [
                    'content' => '月份相同',
                    'status'  => 0
                ];
                echo json_encode($result);
            }else{
                $box = db('home_boxprice') -> field('price') -> where(['box_id'=>$before['box_id'],'month'=>$data['sum_box']]) -> find();
                $new_data['sum_price'] = $box['price'];
                $new_data['sum_box'] = $data['sum_box'];
                $res = db('customer_order') -> where('id',$data['id']) -> update($new_data);
                // 判断一下是不是第一个订单
                $is_first = db('customer_forever_order') -> where('order_id',$before['order_id']) -> find();
                if($is_first){
                    $new_data['rest_box'] = $data['sum_box'];
                    $res2 = db('customer_forever_order') -> where('order_id',$before['order_id']) -> update($new_data);
                }
                if($res){
                    $result = [
                        'content' => '修改成功',
                        'status'  => 1
                    ];
                    echo json_encode($result);
                }
            }
        }
    }

    // 收货地址改变时修改订单
    public function changeAddress(){
        $data = Request::instance() -> param();
        if($data){
            $before = db('customer_order') -> field('order_id,address_id') -> where('id',$data['id']) -> find();
            if($before['address_id'] == $data['address_id']){
                $result = [
                    'content' => '收货地址相同',
                    'status'  => 0
                ];
                echo json_encode($result);
            }else{
                $new_data['address_id'] = $data['address_id'];
                $res = db('customer_order') -> where('id',$data['id']) -> update($new_data);
                // 判断一下是不是第一个订单
                $is_first = db('customer_forever_order') -> where('order_id',$before['order_id']) -> find();
                if($is_first){
                    $res2 = db('customer_forever_order') -> where('order_id',$before['order_id']) -> update($new_data);
                }
                if($res){
                    $result = [
                        'content' => '修改成功',
                        'status'  => 1
                    ];
                    echo json_encode($result);
                }
            }
        }
    }

    // 删除普通订单
    public function orderDel(){
        $data = Request::instance() -> param();
        if($data['order_id']){
            // 判断一下是不是第一个订单,第一个包括永久订单
            $is_first = db('customer_forever_order') -> where('order_id',$data['order_id']) -> find();
            if($is_first){
                $res1 = db('customer_forever_order') -> where('order_id',$data['order_id']) -> delete();
                $res2 = db('customer_order') -> where('order_id',$data['order_id']) -> delete();
                if($res1 && $res2){
                    $result = [
                        'content' => '删除成功',
                        'status'  => 1
                    ];
                    echo json_encode($result);
                }else{
                    $result = [
                        'content' => '删除失败',
                        'status'  => 0
                    ];
                    echo json_encode($result);
                }
            }else{
                $res = db('customer_order') -> where('order_id',$data['order_id']) -> delete();
                if($res){
                    $result = [
                        'content' => '删除成功',
                        'status'  => 1
                    ];
                    echo json_encode($result);
                }else{
                    $result = [
                        'content' => '删除失败',
                        'status'  => 0
                    ];
                    echo json_encode($result);
                }
            }
        }
    }


    /*--------------------------微信支付部分---------------------------*/
    public function wxpay(){
        // 引入wxpay.php
        import('wxpay', EXTEND_PATH);

        $data = Request::instance() -> param();
        $appid = $this->appid;
        $openid = $data['openid'];
        // 商户号
        $mch_id = '1526828241';
        // appsecret
        $key = 'EC768017B11E2102797B95C7528A0EA2';
        // 查找订单
        $cur_order = db('customer_order') -> field('order_id,sum_price') -> where('id',$data['id']) -> find();
        // 订单号
        $out_trade_no = $cur_order['order_id'];
        $body = "订单支付";
        $total_fee = $cur_order['sum_price'] * 100;
        $total_fee = 1;      //测试
        $weixinpay = new \WeixinPay();
        $return = $weixinpay -> pay($appid,$openid,$mch_id,$key,$out_trade_no,$body,$total_fee);
        echo json_encode($return);
    }


    /*--------------------------我的部分---------------------------*/

    // 添加收货地址
    public function addReceiveAddress(){
        $data = Request::instance() -> param();
        $is_default = 0;
        $res_default = db('customer_receive_address') -> where('openid',$data['openid']) -> find();
        if(!$res_default){
            $is_default = 1;
        }
        $data['is_default'] = $is_default;
        $data['time'] = time();
        $res = db('customer_receive_address') -> insert($data);
        if($res){
            $result = array(
                'content' => '添加成功',
                'status'  => 1
            );
            echo json_encode($result); 
        }else{
            $result = array(
                'content' => '添加失败',
                'status'  => 0
            );
            echo json_encode($result); 
        }
    }

    // 编辑收货地址
    public function editReceiveAddress(){
        $data = Request::instance() -> param();
        if($data){
            $res = db('customer_receive_address') -> update($data);
            if($res){
                $result = array(
                    'content' => '编辑成功',
                    'status'  => 1
                );
                echo json_encode($result); 
            }else{
                $result = array(
                    'content' => '编辑失败',
                    'status'  => 0
                );
                echo json_encode($result); 
            }
        }
    }

    // 获取收货地址列表
    public function getAddressList(){
        $data = Request::instance() -> param();
        if($data['openid']){
            $res = db('customer_receive_address') -> where('openid',$data['openid']) -> order('id asc') ->select();
            echo json_encode($res);
        }
    }

    // 获取当前收货地址
    public function getCurAddress(){
        $data = Request::instance() -> param();
        if($data['id'] && $data['openid']){
            $res = db('customer_receive_address') -> where(['id'=>$data['id'],'openid'=>$data['openid']]) -> find(); 
            if($res){
                $arr = [];
                array_push($arr,$res['province'],$res['city'],$res['area']);
                $res['region'] = $arr;
                echo json_encode($res);
            }
        }
    }

    // 获取当前用户的默认地址
    public function getDefaultAddress(){
        $data = Request::instance() -> param();
        if($data['openid']){
            // 判断一下是否有传address_id,如果没有获取默认地址
            if($data['address_id']){
                $res1 = db('customer_receive_address') -> where('id',$data['address_id']) -> find();
                if($res1){
                    echo json_encode($res1);
                }else{
                    echo json_encode(null);
                }
            }else{
                $res = db('customer_receive_address') -> where(['openid'=>$data['openid'],'is_default' => 1]) -> find();
                if($res){
                    echo json_encode($res);
                }else{
                    echo json_encode(null);
                }
            }
        }
    }

    // 删除当前收货地址
    public function delAddress(){
        $data = Request::instance() -> param();
        if($data['id'] && $data['openid']){
            // 判断一下是不是默认地址
            $is_default = db('customer_receive_address') -> field('is_default') -> where(['id'=>$data['id'],'openid'=>$data['openid']]) -> find();
            if($is_default['is_default'] == 1){
                $result = array(
                    'content' => '不能删除默认地址',
                    'status'  => -1
                );
                echo json_encode($result); 
            }else{
                $res = db('customer_receive_address') -> where(['id'=>$data['id'],'openid'=>$data['openid']]) -> delete();
                if($res){
                    $result = array(
                        'content' => '删除成功',
                        'status'  => 1
                    );
                    echo json_encode($result); 
                }else{
                    $result = array(
                        'content' => '删除失败',
                        'status'  => 0
                    );
                    echo json_encode($result); 
                }
            }
        }
    }

    // 修改默认地址
    public function changeDefaultAddress(){
        $data = Request::instance() -> param();
        if($data['id'] && $data['openid']){
            $arr_addressId = db('customer_receive_address') -> field('id') -> where('openid',$data['openid']) -> select();
            $addressId = [];
            foreach($arr_addressId as $value){
                array_push($addressId,$value['id']);
            }
            if($addressId){
                $ret = db('customer_receive_address') -> where('id','in',$addressId) -> update(['is_default' => 0]);
                if($ret){
                    $res = db('customer_receive_address') -> where('id',$data['id']) -> update(['is_default' => 1]);
                    if($res){
                        $result = array(
                            'content' => '修改成功',
                            'status'  => 1
                        );
                        echo json_encode($result); 
                    }else{
                        $result = array(
                            'content' => '修改失败',
                            'status'  => 0
                        );
                        echo json_encode($result); 
                    }
                }
            }
        }

    }

    // 是否怀孕
    public function ispregnant(){
        $data = Request::instance() -> param();
        $data['preproduction_date'] = strtotime($data['preproduction_date']);
        $res = db('customer_periodsetting') -> where('id',$data['id']) -> find();
        if($res['ispregnant'] == 0){
            $res2 = db('customer_periodsetting') -> where('id',$data['id']) -> update(['ispregnant' => 1,'preproduction_date'=>$data['preproduction_date']]);
            if($res2){
                $result = array(
                    'content' => '已怀孕',
                    'status'  => 1
                );
                echo json_encode($result); 
            }
        }else{
            $time = time();
            $res2 = db('customer_periodsetting') -> where('id',$data['id']) -> update(['ispregnant' => 0,'before'=>$time]);
            if($res2){
                $result = array(
                    'content' => '未怀孕',
                    'status'  => 0
                );
                echo json_encode($result); 
            }
        }
    }

    // 物流

    // 获取物流信息
    public function getInformation(){
        $data = Request::instance() -> param();
        if($data['openid']){
            if($data['tab'] >= 0){
                $res = db('customer_express_order') -> where(['openid'=>$data['openid'],'status'=>$data['tab']]) -> select();
            }else{
                $res = db('customer_express_order') -> where('openid',$data['openid']) -> select();
            }
            if($res){
                foreach($res as $key => $value){
                    $res[$key]['create_time'] = date("Y-m-d",$value['create_time']);
                    $box = db('home_boxlist') -> field('name,cover_img') -> where('id',$value['box_id']) -> find();
                    $res[$key]['box_name'] = $box['name'];
                    $res[$key]['cover_img'] = 'https://www.ai-quick.com/'.$box['cover_img'];
                }
            }
            echo json_encode($res);
        }
    }

    //查看物流
    public function viewLogistics(){
        $data = Request::instance() -> param();
        if($data){
            // 获取access_token
            // $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=$appid&secret=$appSecret";
            // //通过code换取网页授权access_token
            // $access_token = file_get_contents($url);
            // $jsondecode = json_decode($access_token); //对JSON格式的字符串进行编码
            // $array = get_object_vars($jsondecode);//转换成数组

            $access_token = $this -> get_access_token();
            var_dump($access_token);
            $url_express = 'https://api.weixin.qq.com/cgi-bin/express/business/path/get?access_token='.$access_token;
            $post_data['order_id'] = $data['order_id'];
            $post_data['openid'] = $data['openid'];
            $post_data['delivery_id'] = 'BEST';
            $post_data['waybill_id'] = $data['waybill_id'];
            $content = json_encode ( $post_data, JSON_UNESCAPED_UNICODE );
            $res = $this->postData($url_express, $content);
            var_dump($res);die;
        }
    }

    // 获取access_token
    public function get_access_token() {
        $appid = $this->appid;
        $appSecret = $this->appSecret;

        $timeout = 5;
        $ch = curl_init ();
        $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=$appid&secret=$appSecret";
        curl_setopt ( $ch, CURLOPT_URL, $url );
        curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, 1 );
        curl_setopt ( $ch, CURLOPT_CONNECTTIMEOUT, $timeout );
        curl_setopt ( $ch, CURLOPT_SSL_VERIFYPEER, false ); // 这个是重点。
        $access_token_res = curl_exec ( $ch );
        // 检查是否有错误发生
        if (curl_errno ( $ch )) {
            log_think ( __METHOD__ . __LINE__ . curl_error ( $ch ) );
        }
        curl_close ( $ch );
        $access_token = json_decode($access_token_res,true);
        return $access_token['access_token'];
    }

    // post请求
	public function postData($url,$content){
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL,$url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER,0);
		curl_setopt($ch, CURLOPT_POST,1);
		curl_setopt($ch, CURLOPT_POSTFIELDS,$content);
		$data = curl_exec($ch);
		curl_close($ch);
		return $data;
    }
    
    // 查看物流阿里云版本
    public function aliViewLogistics(){
        $data = Request::instance() -> param();
        if($data['waybill_id'] && $data['type']){
            $host = "https://wuliu.market.alicloudapi.com";//api访问链接
            $path = "/kdi";//API访问后缀
            $method = "GET";
            $appcode = "fa2de444990f4e14a33fdd900da0ff5c";//替换成自己的阿里云appcode
            $headers = array();
            array_push($headers, "Authorization:APPCODE " . $appcode);
            $querys = "no=".$data['waybill_id']."&type=".$data['type'];  //参数写在这里
            $bodys = "";
            $url = $host . $path . "?" . $querys;//url拼接

            $curl = curl_init();
            curl_setopt($curl, CURLOPT_CUSTOMREQUEST, $method);
            curl_setopt($curl, CURLOPT_URL, $url);
            curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
            curl_setopt($curl, CURLOPT_FAILONERROR, false);
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($curl, CURLOPT_HEADER, false);
            //curl_setopt($curl, CURLOPT_HEADER, true); 如不输出json, 请打开这行代码，打印调试头部状态码。
            //状态码: 200 正常；400 URL无效；401 appCode错误； 403 次数用完； 500 API网管错误
            if (1 == strpos("$".$host, "https://"))
            {
                curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
                curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
            }
            // var_dump(curl_exec($curl));die;
            echo curl_exec($curl);
        } 
    }

    // 确认收货
    public function confirmReceipt(){
        $data = Request::instance() -> param();
        if($data['id']){
            $res = db('customer_express_order') -> where('id',$data['id']) -> update(['status'=>2]);
            if($res){
                $result = array(
                    'content' => '收货成功',
                    'status'  => 1
                );
                echo json_encode($result);  
            }else{
                $result = array(
                    'content' => '收货失败',
                    'status'  => 0
                );
                echo json_encode($result); 
            }
        }
    }

    // 立即评论
    public function ImmediateEvaluate(){
        $data = Request::instance() -> param();
        // var_dump($data);die;
        if($data){
            $box = db('customer_express_order') -> alias('o') -> field('o.box_id,f.brand') 
                    -> join('customer_forever_order f','o.forever_id = f.id') -> find();
            $img_url = '';
            if($data['images']){
                $img_url = implode(',',$data['images']); 
            }
            $evaluate['express_id'] = $data['express_id'];
            $evaluate['openid'] = $data['openid'];
            $evaluate['box_id'] = $box['box_id'];
            $evaluate['box_brand'] = $box['brand'];
            $evaluate['content'] = $data['content'];
            $evaluate['img_url'] = $img_url;
            $evaluate['status'] = 0;
            $evaluate['time'] = time();
            $res = db('home_box_evaluate') -> insert($evaluate);
            if($res){
                // 更新状态
                $status = db('customer_express_order') -> where('id',$data['express_id']) -> update(['status' => 3]);
                if($status){
                    $result = array(
                        'content' => '评论成功',
                        'status'  => 1
                    );
                    echo json_encode($result); 
                }
            }else{
                $result = array(
                    'content' => '评论失败',
                    'status'  => 0
                );
                echo json_encode($result); 
            }
        }else{
            $result = array(
                'content' => '没有接收到数据',
                'status'  => 0
            );
            echo json_encode($result);
        }
    }



    // 用户留言
    public function leaveMessage(){
        $data = Request::instance() -> param();
        $data['time'] = time();
        $res = db('customer_leave_message') -> insert($data);
        if($res){
            $result = array(
                'content' => '留言成功',
                'status'  => 1
            );
            echo json_encode($result); 
        }else{
            $result = array(
                'content' => '留言失败',
                'status'  => 0
            );
            echo json_encode($result); 
        }
    }

    // 查询快递
    public function InquiryExpress(){
        $waybill_no = input('waybill_no');
        $exp_company_code = input('exp_company_code');
        // var_dump($waybill_no,$exp_company_code);die;
        $app_id = '101734';
        $method_name = 'express.info.get';
        $api_key = '2d5ce17c743df0ed83a57fff055d55205f24921d';
        $ts = time();

        $sign = md5($app_id.$method_name.$ts.$api_key);
        var_dump($sign);die;

        $host = "https://kop.kuaidihelp.com/api";
        $method = "POST";
        $headers = array();
        //根据API的要求，定义相对应的Content-Type
        array_push($headers, "Content-Type".":"."application/x-www-form-urlencoded; charset=UTF-8");
        $querys = "";
        $bodys = [
            "app_id"=>$app_id,
            "method"=>$method_name,
            "sign"=>$sign,
            "ts"=>$ts,
            "data"=>'{ "waybill_no":'.$waybill_no.', "exp_company_code":'.$exp_company_code.',"result_sort":"0"}'
        ];
        $bodys = http_build_query($bodys);
        $url = $host;
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_CUSTOMREQUEST, $method);
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($curl, CURLOPT_FAILONERROR, false);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_HEADER, true);
        if (1 == strpos("$".$host, "https://"))
        {
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        }
        curl_setopt($curl, CURLOPT_POSTFIELDS, $bodys);
        var_dump(curl_exec($curl));
    }


    /* --------------------------圈子部分--------------------------- */

    public function photoupload(){
        //上传发布圈子的照片
        $file = request()->file('file');
        if($file){
            $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads/images');
            if($info){
                $result = [
                    'content' => '上传成功',
                    'info' => $info->getSaveName()
                ];
                echo json_encode($result);
            }else{
                $result = [
                    'content' => '上传失败',
                ];
                echo json_encode($result);
            }
        }
    }
    
    public function photoadds(){
        //发布圈子
        $data = Request::instance()->post();
        //var_dump($data);
       if($data['user_id']){
            $data['openid'] = $data['user_id'];
            $data['time'] =time();
            $data['type_id'] = $data['circletype'];
            if($data['images']){
                $shuzu = $data['images'];
                $data['photofile'] = implode(",",$shuzu);
            }else{
                $data['photofile']='';
            }
            $res = db('circle_list')->insert($data);
            if($res){
                $result = [
                    'content' => '发布成功',
                    'status' => 1
                ];
                echo json_encode($result);
            }
            else{
                $result = [
                    'content' => '发布失败',
                    'status' => 0
                ];
                echo json_encode($result);
            }
        }else{
            $result = [
                'content' => '请先登录',
                'status' => 2
            ];
            echo json_encode($result);
        }
    }

    public function navinfo(){
        //导航栏信息
        $navinfo = db('circle_type') -> select();
        //var_dump($navinfo);
        $type_name = [];
        foreach($navinfo as $k => $v){
            //$type_name[] = $v['type_name'];
            array_push($type_name,$v['type_name']);  
        }
        //var_dump($type_name);
        if($navinfo){
            echo json_encode($type_name);
        }else{
            $result = [
                'content' => '导航栏搜索失败'
            ];
            echo json_encode($result);
        }
    }

    public function circlelistinfo(){
        //圈子内容信息

        //查询当前数据总条数
        $total_count = db('circle_list')->where("state=1")->count();
        $limit_count = 4;

        $page = 0;
        if ($total_count && $total_count >= $limit_count ) {
            $page = rand(0, $total_count - $limit_count);   
        }

        if (!empty($_GET['status']) && $_GET['status'] != 'down') {
            $page = 0;
        }

        $data = db('circle_list') -> where('state=1') -> limit("$page,$limit_count")-> select();
        if($data){
            $openid = [];
            foreach($data as $k => $v){
                if($v['heart_num']){
                    $heartnum_arr = explode(",",$v['heart_num']);
                    $data[$k]['heart_num'] = count($heartnum_arr) - 1;
                }else{
                    $data[$k]['heart_num'] = 0;
                }
                //var_dump($data[$k]['heart_num']);
                $photoarr = explode(",",$v['photofile']);
                $data[$k]['photofile'] = 'https://www.ai-quick.com/uploads/images/'.$photoarr[0];
                $openid[] = $v['openid'];   
                $userinfo[$k] = db('customer_user') ->where('openid',$v['openid'])->find();
                $data[$k]['nickname'] = $userinfo[$k]['wx_nickname'];
                $data[$k]['avator'] = $userinfo[$k]['wx_headimg'];
        }      
        //var_dump($data);die;
            echo json_encode($data);
        }else{
            $result = [
                'content' => '圈子内容获取失败'
            ];
            echo json_encode($result);
        }
    }

    public function jiazai(){
        //下拉加载
        $limit_count = 4;
        $page = $_GET['curr_page'];
        $data = db('circle_list') -> where('state=1') -> page("$page,$limit_count")-> select();
        if($data){
            $openid = [];
            foreach($data as $k => $v){
                if($v['heart_num']){
                    $heartnum_arr = explode(",",$v['heart_num']);
                    $data[$k]['heart_num'] = count($heartnum_arr) - 1;
                }else{
                    $data[$k]['heart_num'] = 0;
                }
                //var_dump($data[$k]['heart_num']);
                $photoarr = explode(",",$v['photofile']);
                $data[$k]['photofile'] = 'https://www.ai-quick.com/uploads/images/'.$photoarr[0];
                $openid[] = $v['openid'];   
                $userinfo[$k] = db('customer_user') ->where('openid',$v['openid'])->find();
                $data[$k]['nickname'] = $userinfo[$k]['wx_nickname'];
                $data[$k]['avator'] = $userinfo[$k]['wx_headimg'];
        }      
        //var_dump($data);die;
            echo json_encode($data);
        }else{
            $result = [
                'content' => '圈子内容获取失败'
            ];
            echo json_encode($result);
        }
    }

    public function heartadds(){
        //爱心增加
        $data = Request::instance()->param();
        if($data['id']){
            $res = db('circle_list') -> where('id',$data['id']) ->find();
            if($res['heart_num']){
                $userarr = explode(",",$res['heart_num']);
                if(in_array($data['userid'],$userarr)){
                    $data_userid[]=$data['userid'];
                    $new_userarr = array_diff($userarr,$data_userid);
                    $num = count($new_userarr)-1;
                    $heart_num = implode(",",$new_userarr);
                    $result = db('circle_list') -> where('id',$data['id']) -> update(['heart_num' => $heart_num]);
                    
                    if($result){
                        $is_gz = 0;
                        $info = [
                            'status' => 1,
                            'is_gz' => $is_gz,
                            'num' => $num,
                            'content' => "取消成功"
                        ];
                        echo json_encode($info);
                    }else{
                        $is_gz = 1;
                        $info = [
                            'status' => 0,
                            'is_gz' => $is_gz,
                            'num' => $num,
                            'content' => "取消失败"
                        ];
                        echo json_encode($info);
                    }
                }else{
                    $new_userarr = array_push($userarr,$data['userid']);
                    $num = count($new_userarr)-1;
                    $heart_num = implode(",",$new_userarr);
                    $result = db('circle_list') -> where('id',$data['id']) -> update(['heart_num' => $heart_num]);
                    
                    if($result){
                        $is_gz = 1;
                        $info = [
                            'status' => 1,
                            'is_gz' => $is_gz,
                            'num' => $num,
                            'content' => "点击成功"
                        ];
                        echo json_encode($info);
                    }else{
                        $is_gz = 0;
                        $info = [
                            'status' => 0,
                            'is_gz' => $is_gz,
                            'num' => $num,
                            'content' => "点击失败"
                        ];
                        echo json_encode($info);
                    }
                }
            }else{
                $heartnum = $data['userid'].",";
                $result = db('circle_list') -> where('id',$data['id']) -> update(['heart_num' => $heartnum]);
                if($result){
                    $is_gz = 1;
                    $info = [
                        'status' => 1,
                        'is_gz' => $is_gz,
                        "num" => 1,
                        'content' => "点击成功"
                    ];
                    echo json_encode($info);
                }else{
                    $is_gz = 0;
                    $info = [
                        'status' => 0,
                        'is_gz' => $is_gz,
                        "num" => 0,
                        'content' => "点击失败"
                    ];
                    echo json_encode($info);
                }
            }
        }else{
            $result = [
                'content' => '请先登录',
                'status' => 2
            ];
            echo json_encode($result);
        }
    }

    public function detailsinfo(){
        //圈子详细内容
        $data = Request::instance()->param();
        $res = db('circle_list') -> where('id',$data['id']) -> find();
        $userinfo = db('customer_user') ->where('openid',$res['openid']) -> find();
        $photoarr = explode(",",$res['photofile']);
        $arr = [];
        foreach($photoarr as $k => $v){
            $arr[] = 'https://www.ai-quick.com/uploads/images/'.$v;
        }
        if($res){
            if($res['heart_num']){
                $heartnum_arr = explode(",",$res['heart_num']);
                $res['heart_num'] = count($heartnum_arr) - 1;
            }else{
                $res['heart_num'] = 0;
            }
            if($res['focus']){
                $focus_arr = explode(",",$res['focus']);
                if(in_array($data['userid'],$focus_arr)){
                    $res['isGz'] = 1;
                }else{
                    $res['isGz'] = 0;
                }
            }else{
                $res['isGz'] = 0;
            }
            //$res['photofile'] = $photoarr;
            $res['photofile'] = $arr;
            $res['nickname'] = $userinfo['wx_nickname'];
            $res['avator'] = $userinfo['wx_headimg'];
            $res['time'] = date("Y-m-d H:i",$userinfo['time']);
            echo json_encode($res);
        }else{
            $result = [
                'content' => '添加失败'
            ];
            echo json_encode($result);
        }
    }

    public function focusadd(){
        //关注
        $data = Request::instance()->param();
        if($data['userid']){
            $evaluateinfo = db('circle_list') -> where('id',$data['circleid']) -> find();
            if($evaluateinfo['focus']){
                $focusarr = explode(",",$evaluateinfo['focus']);
                if(in_array($data['userid'],$focusarr)){
                    $data_userid[]=$data['userid'];
                    $new_focusarr = array_diff($focusarr,$data_userid);
                    $focus = implode(",",$new_focusarr);
                    $result = db('circle_list') -> where('id',$data['circleid']) -> update(['focus' => $focus]);
                    if($result){
                        $info = [
                            'status' => 1,
                            'content' => '点击成功',
                            'isGz' => 0
                        ];
                        echo json_encode($info);
                    }else{
                        $info = [
                            'status' => 0,
                            'isGz' => 1,
                            'content' => '点击失败',
                        ];
                        echo json_encode($info);
                    }
                }else{
                    $new_focusarr = array_push($focusarr,$data['userid']);
                    $focus = implode(",",$new_focusarr);
                    $result = db('circle_list') -> where('id',$data['circleid']) -> update(['focus' => $focus]);
                    if($result){
                        $info = [
                            'status' => 1,
                            'isGz' => 1,
                            'content' => "点击成功"
                        ];
                        echo json_encode($info);
                    }else{
                        $info = [
                            'status' => 0,
                            'isGz' => 0,
                            'content' => "点击失败"
                        ];
                        echo json_encode($info);
                    }
                }
            }else{
                $focus = $data['userid'].",";
                $result = db('circle_list') -> where('id',$data['circleid']) -> update(['focus' => $focus]);
                if($result){
                    $info = [
                        'status' => 1,
                        'isGz' => 1,
                        'content' => "点击成功"
                    ];
                    echo json_encode($info);
                }else{
                    $info = [
                        'status' => 0,
                        'isGz' => 0,
                        'content' => "点击失败"
                    ];
                    echo json_encode($info);
                }
            }
        }else{
            $info = [
                'content' => '添加失败',
                'status' => 2
            ];
            echo json_encode($info);
        }
        
    }

    public function evaluateinfo(){
        //获取评论信息
        $id = Request::instance()->param();
        $evaluateinfo = db('circle_evaluate') -> where('circle_id',$id['id']) -> select();
        $evaluatenum = db('circle_evaluate') -> where('circle_id',$id['id']) -> count('circle_id');
        //$evaluateinfo['evaluatenum'] = $evaluatenum;
        foreach($evaluateinfo as $k => $v){
            if($v['fabulous_num']){
                $fabulousnum_arr = explode(",",$v['fabulous_num']);
                $evaluateinfo[$k]['fabulous_num'] = count($fabulousnum_arr) - 1;
            }else{
                $evaluateinfo[$k]['fabulous_num'] = 0;
            }
            $evaluateinfo[$k]['reply_num'] = db('circle_reply') -> where('evaluate_id',$v['id']) -> count('evaluate_id');
            $userinfo[$k] = db('customer_user') ->where('openid',$v['openid'])->find();
            $evaluateinfo[$k]['nickname'] = $userinfo[$k]['wx_nickname'];
            $evaluateinfo[$k]['avator'] = $userinfo[$k]['wx_headimg'];
            $evaluateinfo[$k]['time'] = date("Y-m-d H:i",$evaluateinfo[$k]['time']);
        }
        if($evaluateinfo){
            $result = [
                'evaluateinfo' => $evaluateinfo,
                'evaluetanum' => $evaluatenum
            ];
            echo json_encode($result);
        }else{
            $result = [
                'content' => '评论内容获取失败'
            ];
            echo json_encode($result);
        }
    }

    public function evaluateone(){
        //单条的评论信息
        $id = Request::instance()->param();
        $evaluateinfo = db('circle_evaluate') -> where('id',$id['id']) -> find();
        if($evaluateinfo['fabulous_num']){
            $fabulousnum_arr = explode(",",$evaluateinfo['fabulous_num']);
            $evaluateinfo['fabulous_num'] = count($fabulousnum_arr) - 1;
        }else{
            $evaluateinfo['fabulous_num'] = 0;
        }
        $userinfo = db('customer_user') -> where('openid',$evaluateinfo['openid']) -> find();
        $evaluateinfo['nickname'] = $userinfo['wx_nickname'];
        $evaluateinfo['avator'] = $userinfo['wx_headimg'];
        $evaluateinfo['time'] = date("Y-m-d H:i",$evaluateinfo['time']);
        if($evaluateinfo){
            echo json_encode($evaluateinfo);
        }else{
            $result = [
                'content' => '评论内容获取失败'
            ];
            echo json_encode($result);
        }
    }

    public function evaluateadd(){
        //添加评论
        $data = Request::instance()->param();
        if($data['userid']){
            $data['time'] = time();
            $data['openid'] = $data['userid'];
            $data['circle_id'] = $data['circleid'];
            $res = db('circle_evaluate') -> insert($data);
            if($res){
                $result = [
                    'status' => 1 ,
                    'content' => '评论成功'
                ];
                echo json_encode($result);
            }else{
                $result = [
                    'status' => 0 ,
                    'content' => '评论失败'
                ];
                echo json_encode($result);
            }
        }else{
            $result = [
                'status' => 2 ,
                'content' => '请先登录'
            ];
            echo json_encode($result);
        }
        
    }

    public function replylist(){
        //回复列表
        $id = Request::instance()->param();
        $replylist = db('circle_reply') ->where('evaluate_id',$id['id']) -> select();
        $replynum = db('circle_reply') -> where('evaluate_id',$id['id']) -> count('evaluate_id');
        if($replylist){
            foreach($replylist as $k => $v){
                if($v['fabulous_num']){
                    $fabulousnum_arr = explode(",",$v['fabulous_num']);
                    $replylist[$k]['fabulous_num'] = count($fabulousnum_arr) - 1;
                }else{
                    $replylist[$k]['fabulous_num'] = 0;
                }
                $userinfo[$k] = db('customer_user') ->where('openid',$v['openid'])->find();
                $replylist[$k]['nickname'] = $userinfo[$k]['wx_nickname'];
                $replylist[$k]['avator'] = $userinfo[$k]['wx_headimg'];
                $replylist[$k]['time'] = date("Y-m-d H:i",$replylist[$k]['time']);
            }
            $result = [
                'status' => 1 ,
                'replylist' => $replylist
            ];
            echo json_encode($result);
        }else{
            $result = [
                'status' => 0 ,
                'content' => '获取回复列表失败'
            ];
            echo json_encode($result);
        }
    }

    public function replyadd(){
        //添加回复内容
        $data = Request::instance()->param();
        if($data['userid']){
            $data['time'] = time();
            $data['openid'] = $data['userid'];
            $data['evaluate_id'] = $data['evaluateid'];
            $res = db('circle_reply') -> insert($data);
            if($res){
                $result = [
                    'status' => 1 ,
                    'content' => '评论成功'
                ];
                echo json_encode($result);
            }else{
                $result = [
                    'status' => 0 ,
                    'content' => '评论失败'
                ];
                echo json_encode($result);
            }
        }else{
            $result = [
                'status' => 2 ,
                'content' => '请先登录'
            ];
            echo json_encode($result);
        }
        
    }

    public function zanadd(){
        //评论点赞增加
        $data = Request::instance()->param();
        $res = db('circle_evaluate') -> where('id',$data['evaluateid']) ->find();
        if($res['fabulous_num']){
            $fabulousarr = explode(",",$res['fabulous_num']);
            if(in_array($data['userid'],$fabulousarr)){
                $data_userid[]=$data['userid'];
                $new_fabulousarr = array_diff($fabulousarr,$data_userid);
                $num = count($new_fabulousarr)-1;
                $fabulous_num = implode(",",$new_fabulousarr);
                $result = db('circle_evaluate') -> where('id',$data['evaluateid']) -> update(['fabulous_num' => $fabulous_num]);
                if($result){
                    $is_gz = false;
                    $info = [
                        'is_gz' => $is_gz,
                        'num' => $num,
                        'content' => "取消成功"
                    ];
                    echo json_encode($info);
                }else{
                    $is_gz = true;
                    $info = [
                        'is_gz' => $is_gz,
                        'num' => $num,
                        'content' => "取消失败"
                    ];
                    echo json_encode($info);
                }
            }else{
                $new_fabulousarr = array_push($fabulousarr,$data['userid']);
                $num = count($new_fabulousarr)-1;
                $fabulous_num = implode(",",$new_fabulousarr);
                $result = db('circle_evaluate') -> where('id',$data['evaluateid']) -> update(['fabulous_num' => $fabulous_num]);
                if($result){
                    $is_gz = true;
                    $info = [
                        'is_gz' => $is_gz,
                        'num' => $num,
                        'content' => "点击成功"
                    ];
                    echo json_encode($info);
                }else{
                    $is_gz = false;
                    $info = [
                        'is_gz' => $is_gz,
                        'num' => $num,
                        'content' => "点击失败"
                    ];
                    echo json_encode($info);
                }
            }
        }else{
            $fabulousnum = $data['userid'].",";
            $result = db('circle_evaluate') -> where('id',$data['evaluateid']) -> update(['fabulous_num' => $fabulousnum]);
            if($result){
                $is_gz = true;
                $info = [
                    'is_gz' => $is_gz,
                    "num" => 1,
                    'content' => "点击成功"
                ];
                echo json_encode($info);
            }else{
                $is_gz =false;
                $info = [
                    'is_gz' => $is_gz,
                    "num" => 0,
                    'content' => "点击失败"
                ];
                echo json_encode($info);
            }
        }
    }

    public function fabulousadd(){
        //回复点赞增加
        $data = Request::instance()->param();
        $res = db('circle_reply') -> where('id',$data['id']) ->find();
        if($res['fabulous_num']){
            $fabulousarr = explode(",",$res['fabulous_num']);
            if(in_array($data['userid'],$fabulousarr)){
                $data_userid[]=$data['userid'];
                $new_fabulousarr = array_diff($fabulousarr,$data_userid);
                $num = count($new_fabulousarr)-1;
                $fabulous_num = implode(",",$new_fabulousarr);
                $result = db('circle_reply') -> where('id',$data['id']) -> update(['fabulous_num' => $fabulous_num]);
                if($result){
                    $is_gz = false;
                    $info = [
                        'is_gz' => $is_gz,
                        'num' => $num,
                        'content' => "取消成功"
                    ];
                    echo json_encode($info);
                }else{
                    $is_gz = true;
                    $info = [
                        'is_gz' => $is_gz,
                        'num' => $num,
                        'content' => "取消失败"
                    ];
                    echo json_encode($info);
                }
            }else{
                $new_fabulousarr = array_push($fabulousarr,$data['userid']);
                $num = count($new_fabulousarr)-1;
                $fabulous_num = implode(",",$new_fabulousarr);
                $result = db('circle_reply') -> where('id',$data['id']) -> update(['fabulous_num' => $fabulous_num]);
                if($result){
                    $is_gz = true;
                    $info = [
                        'is_gz' => $is_gz,
                        'num' => $num,
                        'content' => "点击成功"
                    ];
                    echo json_encode($info);
                }else{
                    $is_gz = false;
                    $info = [
                        'is_gz' => $is_gz,
                        'num' => $num,
                        'content' => "点击失败"
                    ];
                    echo json_encode($info);
                }
            }
        }else{
            $fabulousnum = $data['userid'].",";
            $result = db('circle_reply') -> where('id',$data['id']) -> update(['fabulous_num' => $fabulousnum]);
            if($result){
                $is_gz = true;
                $info = [
                    'is_gz' => $is_gz,
                    "num" => 1,
                    'content' => "点击成功"
                ];
                echo json_encode($info);
            }else{
                $is_gz =false;
                $info = [
                    'is_gz' => $is_gz,
                    "num" => 0,
                    'content' => "点击失败"
                ];
                echo json_encode($info);
            }
        }
    }

    public function searchcircle(){
        //搜索
        $data = Request::instance() -> param();
        $searchdata = $data['content'];
        //var_dump($data['content']);
        $circleinfo = db('circle_list')->where('state',1)->where('content','like','%'.$searchdata.'%') ->select();
        if($circleinfo){
            $openid = [];
                foreach($circleinfo as $k => $v){
                    if($v['heart_num']){
                        $heartnum_arr = explode(",",$v['heart_num']);
                        $circleinfo[$k]['heart_num'] = count($heartnum_arr) - 1;
                    }else{
                        $circleinfo[$k]['heart_num'] = 0;
                    }
                    //var_dump($circleinfo[$k]['heart_num']);
                    $photoarr = explode(",",$v['photofile']);
                    $circleinfo[$k]['photofile'] = 'https://www.ai-quick.com/uploads/images/'.$photoarr[0];
                    $openid[] = $v['openid'];   
                    $userinfo[$k] = db('customer_user') ->where('openid',$v['openid'])->find();
                    $circleinfo[$k]['nickname'] = $userinfo[$k]['wx_nickname'];
                    $circleinfo[$k]['avator'] = $userinfo[$k]['wx_headimg'];
            }      
            //var_dump($data);die;
                echo json_encode($circleinfo);
        }else{
            $info = [
                'status' => 0,
                'content' => '搜索失败'
            ];
            echo json_encode($info);
        }
    }

    public function switchCircle(){
        //切换内容
        $data = Request::instance() -> param();
        $type = $data['type'];
        //var_dump($data['content']);
        $circleinfo = db('circle_list')->where('state',1)->where('type_id',$type) ->select();
        var_dump($circleinfo);
        if($circleinfo){
            $openid = [];
                foreach($circleinfo as $k => $v){
                    if($v['heart_num']){
                        $heartnum_arr = explode(",",$v['heart_num']);
                        $circleinfo[$k]['heart_num'] = count($heartnum_arr) - 1;
                    }else{
                        $circleinfo[$k]['heart_num'] = 0;
                    }
                    //var_dump($circleinfo[$k]['heart_num']);
                    $photoarr = explode(",",$v['photofile']);
                    $circleinfo[$k]['photofile'] = 'https://www.ai-quick.com/uploads/images/'.$photoarr[0];
                    $openid[] = $v['openid'];   
                    $userinfo[$k] = db('customer_user') ->where('openid',$v['openid'])->find();
                    $circleinfo[$k]['nickname'] = $userinfo[$k]['wx_nickname'];
                    $circleinfo[$k]['avator'] = $userinfo[$k]['wx_headimg'];
            }      
            //var_dump($data);die;
                echo json_encode($circleinfo);
        }else{
            $info = [
                'status' => 0,
                'content' => '切换失败'
            ];
            echo json_encode($info);
        }
    }
}