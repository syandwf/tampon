<?php
namespace app\api\Controller;

use think\Controller;
use think\Request;
use think\Db;

class Index extends Controller
{
    protected $appid = 'wx1ef2bb050c949665';
    protected $appSecret = '4dbb77f35224463a2171d68067edf047';

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

    // 经期设置
    public function menstrualrecord(){
        $data = Request::instance() -> param();
        $data['before'] = strtotime($data['before']);
        $data['time'] = time();
        if($data['isown'] == 0){
            $isUser = db('customer_periodsetting') -> where('openid = :openid and isown = 0') -> bind(['openid'=>$data['openid']]) -> select();
            if($isUser){
                $result = array(
                    'content' => '主账号已添加！',
                    'status'  => 0
                );
                echo json_encode($result); 
            }else{
                $this->addMenstrualrecord($data);
            }
        }else{
            $this->addMenstrualrecord($data);
        }
    }

    // 插入月经设置
    public function addMenstrualrecord($data){
        $res = db('customer_periodsetting') -> insert($data);
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
}