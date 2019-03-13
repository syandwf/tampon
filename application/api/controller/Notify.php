<?php
namespace app\api\Controller;

use think\Controller;
use think\Request;
use think\Db;

class Notify extends Controller
{
    // 支付回调
    public function index(){
        $xml = file_get_contents("php://input");
        $log['log'] = $xml;
        $res = db('customer_order_log') -> insert($log);
        // libxml_disable_entity_loader(true);
        $objectxml = simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA);//将XML字符串转换为对象
        $xmljson = json_encode($objectxml);//将对象转换个JSON
        $xmlarray = json_decode($xmljson,true);//将json转换成数组
        if($xmlarray['return_code'] == 'SUCCESS' && $xmlarray['result_code'] == 'SUCCESS'){
            $order = db('customer_order') -> where('order_id',$xmlarray['out_trade_no']) -> find();
            // 判断金额是否相等,后期要开启下面这句话
            // $price = $order['sum_price'] * 100;
            $price = 0.01 * 100;
            if($order['status'] == 0 && $price == $xmlarray['total_fee']){
                $changStauts = db('customer_order') -> where('order_id',$xmlarray['out_trade_no']) -> update(['status' => 1,'transaction_id' => $xmlarray['transaction_id']]);
                if($order['pay_type'] == 0){
                    $forever = db('customer_forever_order') -> where('order_id',$xmlarray['out_trade_no']) -> update(['status' => 1]);
                    // 生成物流订单
                    $this -> expressOrder($xmlarray['out_trade_no']);
                }
                if($order['pay_type'] == 1){
                    $forever = db('customer_forever_order') -> field('rest_box,sum_box,sum_price') -> where('openid',$order['openid']) -> find();
                    $new_rest = $forever['rest_box'] + $order['sum_box'];
                    $new_sum = $forever['sum_box'] + $order['sum_box'];
                    $new_price = $forever['sum_price'] + $order['sum_price'];
                    $res_forever = db('customer_forever_order') -> where('openid',$order['openid']) -> update(['rest_box' => $new_rest,'sum_box' => $new_sum,'sum_price' => $new_price]);
                }
            }
            $log2['log'] = $xmlarray['out_trade_no'];
            $res2 = db('customer_order_log') -> insert($log2);

            // 返回给微信
            $return_XMl = '<xml>
                            <return_code><![CDATA[SUCCESS]]></return_code>
                            <return_msg><![CDATA[OK]]></return_msg>
                        </xml>';
            return $return_XMl;
        }
    }

    // 生成物流单,发两个盒子
    public function expressOrder($order_id){
        // $log['log'] = $order_id;
        // $res = db('customer_order_log') -> insert($log);
        $forever_order = db('customer_forever_order') -> where('order_id',$order_id) -> find();
        if($forever_order['rest_box'] >= 2){
            $express_order['forever_id'] = $forever_order['id'];
            $express_order['order_id'] = $forever_order['order_id'];
            $express_order['openid'] = $forever_order['openid'];
            $express_order['box_id'] = $forever_order['box_id'];
            $express_order['box_num'] = 2;
            $express_order['brand'] = $forever_order['brand'];
            // 单个盒子的价格
            $box_price = $forever_order['sum_price'] / $forever_order['sum_box'];
            // 物流订单的价格
            $sum_price = $box_price * $express_order['box_num'];
            $express_order['sum_price'] = $sum_price;
            $express_order['create_time'] = time();
            // 获取收货人地址、姓名、电话
            $address = db('customer_receive_address') -> where('id',$forever_order['address_id']) -> find();
            $sh_address = $address['province'].$address['city'].$address['area'].$address['address'];
            $express_order['address'] = $sh_address;
            $express_order['name'] = $address['name'];
            $express_order['phone'] = $address['phone'];
            $express_order['status'] = 0;

            $res = db('customer_express_order') -> insertGetId($express_order);
            if($res){
                $log2['log'] = $res;
                $res2 = db('customer_order_log') -> insert($log2);
                // 修改一下永久订单剩余的盒子
                $rest_box = $forever_order['rest_box'] - $express_order['box_num'];
                $rest = db('customer_forever_order') -> where('id',$forever_order['id']) -> update(['rest_box' => $rest_box]);
            }   
        }
    }

}