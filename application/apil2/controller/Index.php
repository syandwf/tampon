<?php
namespace app\apil2\Controller;

use think\Controller;
use think\Request;
use think\Db;

class Index extends Controller
{
    protected $appid = 'wx9541cf83bcfbd5b7';
    protected $appSecret = '1dbc4a346bb97b8d8aab521f5cfe7dea';

    public function index(){
        // dump('111');die;
        return $this -> fetch('Index/index');
    }
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
                'content' => '您已注册！',
                'status'  => 1
            );
            echo json_encode($result);
        }else{
            $res = Db::name('customer_user') -> insert($data);

            if($res){
                $result = array(
                    'content' => '注册成功！',
                    'status'  => 1
                );
                echo json_encode($result);
            }else{
                $result = array(
                    'content' => '注册失败！',
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

    // 编辑信息
    public function edituser(){
        $data = Request::instance() -> param();
        $res = db('customer_user') -> where('openid',$data['openid']) -> update($data);
        if($res){
            $result = array(
                'content' => '编辑成功！',
                'status'  => 1
            );
            echo json_encode($result);
        }else{
            $result = array(
                'content' => '编辑失败！',
                'status'  => 0
            );
            echo json_encode($result); 
        }
    }

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
                'content' => '设置成功！',
                'status'  => 1
            );
            echo json_encode($result); 
        }else{
            $result = array(
                'content' => '设置失败！',
                'status'  => 0
            );
            echo json_encode($result); 
        }
    }

    // 修改月经设置
    public function updateSetPeriod($data){
        $res = db('customer_periodsetting') -> update($data);
        if($res){
            $result = array(
                'content' => '修改成功！',
                'status'  => 1
            );
            echo json_encode($result); 
        }else{
            $result = array(
                'content' => '修改失败！',
                'status'  => 0
            );
            echo json_encode($result); 
        }
    }

    // 添加收货地址
    public function receiveAddress(){
        $data = Request::instance() -> param();
        $res = db('customer_receive_address') -> insert($data);
        if($res){
            $result = array(
                'content' => '添加成功！',
                'status'  => 1
            );
            echo json_encode($result); 
        }else{
            $result = array(
                'content' => '添加失败！',
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
        // 预测的经期日期
        $forecastDate = [];
        // 预测的经期
        $forecastPeriod = [];
        if($data['type'] == 0 || $data['type'] == 1){
            // $res = db('customer_periodsetting') -> field('before,day,cycle,law') -> where('openid',$data['openid']) -> find();
            if($res){
                $before=0;
                if($data['beforePeriod']){
                    $before = strtotime($data['beforePeriod']);
                }else{
                    $before = $res['before'];
                }
                $period = date("Y-m-d",$before);
                $nextMonth = date("Y-m",strtotime("+1months",strtotime($data['curMonth'])));
                // 经期长度
                //$day = $res['day'];
                // 周期
                //$cycle = $res['cycle'];
                // 预测的经期日期
                //$forecastDate = [];
                // 预测的经期
                //$forecastPeriod = [];
                for($i = 1;$i <= 3;$i++){
                    $period = date("Y-m-d",strtotime("+".$cycle."days",strtotime($period)));
                    // 1、如果预测经常大于下个月 2、预测的经期大于本月小于下个月 
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
                $period = date("Y-m-d",$before);
                $prevMonth = date("Y-m",strtotime("-1months",strtotime($data['curMonth'])));
                for($i = 3;$i >= 1;$i--){
                    $period = date("Y-m-d",strtotime("-".$cycle."days",strtotime($period)));
                    // 1、如果预测经常大于下个月 2、预测的经期大于本月小于下个月 
                    if(strtotime($period) < strtotime($prevMonth)){
                        break;
                    }
                    else if(strtotime($period) < strtotime($data['curMonth']) && strtotime($period) >= strtotime($prevMonth)){
                         array_push($forecastDate,$period);
                    }
                }
                if(count($forecastDate)>0){
                    for($i=0;$i<count($forecastDate);$i++){
                        $maxPeriod = date("Y-m-d",strtotime("+".$day."days",strtotime($forecastDate[$i])));
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
                // 经期长度
                $day = $res['day'];
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
                    $res3 = db('customer_periodsetting') -> where('openid',$data['openid']) -> update(['before'=>strtotime($data['date'])]);
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
                $curTime = strtotime($data['date']);
                $day = (int)ceil(($curTime-$lastRecord['start_time'])/86400);
                if($day >= 3){
                    // 本次经期结束
                    $res = db('customer_periodrecord') -> where('id',$lastRecord['id']) -> update(['end_time'=>$curTime,'yc_end_time'=>$curTime,'isEnd'=>1]);
                    // 更新用户的月经长度、周期长度
                    $cycle = (int)ceil(($curTime - $res['before'])/86400);
                    $user = db('customer_periodsetting') -> where('openid',$data['openid']) -> update(['day'=>$day,'cycle'=>$cycle]);
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
                    $ret_before = db('customer_periodsetting') -> where('openid',$data['openid']) -> update(['before'=>$lastRecord['before']]);
                    $res = db('customer_periodrecord') -> where('id',$lastRecord['id']) -> delete();
                    if($res){
                        $result = array(
                            'content' => '删除成功,小于3天的经期不记录',
                            'status'  => 1
                        );
                        echo json_encode($result); 
                    }else{
                        $result = array(
                            'content' => '删除失败,小于3天的经期不记录',
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
            $record = db('customer_periodrecord') -> field('isEnd') -> where('openid',$data['openid']) -> order('id desc') -> find();
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
            $record = db('customer_periodrecord') -> field(['start_time','end_time','yc_end_time']) -> where('openid',$data['openid']) -> order('id desc') -> select();
            $periodDate = [];
            $periodDay = [];
            $curMonth = strtotime($data['curMonth']);
            $nextMonth = date("Y-m",strtotime("+1months",strtotime($data['curMonth'])));
            if(count($record)>0){
                for($i = 0;$i < count($record);$i++){
                    if($record[$i]['start_time'] >= $curMonth && $record[$i]['start_time'] < strtotime($nextMonth)){
                        array_push($periodDate,$record[$i]);
                    }
                }
                if(count($periodDate) > 0){
                    for($j=0;$j<count($periodDate);$j++){
                        // var_dump(strtotime($nextMonth));die;
                        if($periodDate[$j]['yc_end_time'] < strtotime($nextMonth)){
                            $day = (int)ceil(($periodDate[$j]['yc_end_time']-$periodDate[$j]['start_time'])/86400); //86400 = 60s*60min*24h
                            for($k=0;$k<$day;$k++){
                                $pStartTime = date('Y-m-d',$periodDate[$j]['start_time']);
                                $pDay = date("d",strtotime("+".$k."days",strtotime($pStartTime)));
                                array_push($periodDay ,$pDay);
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
            $res = db('customer_periodrecord') -> where('openid',$data['openid']) -> order('time desc') -> select();
            if($res){
                $period_record = [];
                for($i=0;$i<count($res);$i++){
                    $period['year'] = date("Y",$res[$i]['start_time']);
                    $period['start_time'] = date("m-d",$res[$i]['start_time']);
                    if($res[$i]['end_time']){
                        $period['end_time'] = date("m-d",$res[$i]['end_time']);
                    }else{
                        $period['end_time'] = '';
                    }
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

    // 是否怀孕
    public function ispregnant(){
        $data = Request::instance() -> param();
        $data['preproduction_date'] = strtotime($data['preproduction_date']);
        $res = db('customer_periodsetting') -> where('id',$data['id']) -> find();
        if($res['ispregnant'] == 0){
            $res2 = db('customer_periodsetting') -> where('id',$data['id']) -> update(['ispregnant' => 1,'preproduction_date'=>$data['preproduction_date']]);
            if($res2){
                $result = array(
                    'content' => '已怀孕！',
                    'status'  => 1
                );
                echo json_encode($result); 
            }
        }else{
            $time = time();
            $res2 = db('customer_periodsetting') -> where('id',$data['id']) -> update(['ispregnant' => 0,'before'=>$time]);
            if($res2){
                $result = array(
                    'content' => '未怀孕！',
                    'status'  => 0
                );
                echo json_encode($result); 
            }
        }
    }

    // 用户留言
    public function leaveMessage(){
        $data = Request::instance() -> param();
        $data['time'] = time();
        $res = db('customer_leave_message') -> insert($data);
        if($res){
            $result = array(
                'content' => '留言成功！',
                'status'  => 1
            );
            echo json_encode($result); 
        }else{
            $result = array(
                'content' => '留言失败！',
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

    public function daochu(){
        // $age=['20-30','30-40','40-60'];
        vendor("PHPExcel.PHPExcel");
        vendor("PHPExcel.PHPExcel.Worksheet.Drawing");
        $objPHPExcel = new \PHPExcel();
        $objWriter = new \PHPExcel_Writer_Excel2007($objPHPExcel);
        $objActSheet = $objPHPExcel->getActiveSheet();
        // 水平居中（位置很重要，建议在最初始位置）
        $objPHPExcel->setActiveSheetIndex(0)->getStyle('A')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $objPHPExcel->setActiveSheetIndex(0)->getStyle('B')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $objPHPExcel->setActiveSheetIndex(0)->getStyle('C')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $objActSheet->setCellValue('A1', 'id');
        $objActSheet->setCellValue('B1', '名字');
        $objActSheet->setCellValue('C1', '电话');
        // 设置个表格宽度
        $objPHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth(50);
        $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(15);
        $objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(15);

        // 垂直居中
        // $objPHPExcel->setActiveSheetIndex(0)->getStyle('A')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        // $objPHPExcel->setActiveSheetIndex(0)->getStyle('B')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        // $objPHPExcel->setActiveSheetIndex(0)->getStyle('C')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $data = db('customer_daochu') -> select();
        for($i=0;$i<count($data);$i++){
            $objActSheet->setCellValue('A'.($i+2),$data[$i]['id']);//ID
            $objActSheet->setCellValue('B'.($i+2),$data[$i]['name']);//OPENID
            $objActSheet->setCellValue('C'.($i+2),$data[$i]['phone']);//微信头像
            // 表格高度
            $objActSheet->getRowDimension($i+2)->setRowHeight(80);
        }
        // foreach($age as $k=>$v){
        //     $where['age'] = array('between', explode('-', $v));
        //     $mancount=db('fuser')->where($where)->where('sex',1)->count();
        //     $womencount=db('fuser')->where($where)->where('sex',0)->count();
        //     $k +=2;
        //     if($v=='40-60'){
        //         $v='大于40岁';
        //     }
        //     if ($v=='20-30'){
        //         $v='20岁-30岁';
        //     }
        //     if ($v=='30-40'){
        //         $v='30岁-40岁';
        //     }
        //     $objActSheet->setCellValue('A'.$k, $v);
        //     $objActSheet->setCellValue('B'.$k, $mancount);
        //     $objActSheet->setCellValue('C'.$k, $womencount);
        //     // 表格高度
        //     $objActSheet->getRowDimension($k)->setRowHeight(80);

        // }

        $fileName = '用户表';
        $date = date("YmdHis",time());
        $fileName .= "_{$date}.xls";
        $fileName = iconv("utf-8", "gb2312", $fileName);
        //重命名表
        // $objPHPExcel->getActiveSheet()->setTitle('test');
        //设置活动单指数到第一个表,所以Excel打开这是第一个表
        $objPHPExcel->setActiveSheetIndex(0);
        ob_end_clean();
        // header('Content-Type: application/vnd.ms-excel');
        header('Content-Type: applicationnd.ms-excel');
        header("Content-Disposition: attachment;filename=\"$fileName\"");
        header('Cache-Control: max-age=0');
        $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        $objWriter->save('php://output'); //文件通过浏览器下载
        exit;
    }


    public function chaxun(){
        $data = Request::instance()->param();
        $res = db('circle_test')->where('id',$data['id'])->find();
        if($res){
            echo json_encode($res); 
        }else{
            $result = array(
                'content' => '查无此人！',
                'status'  => 0
            );
            echo json_encode($result); 
        }
    }
}