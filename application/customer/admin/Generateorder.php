<?php
namespace app\customer\admin;

use app\admin\controller\Admin;
use app\common\builder\ZBuilder;    //引入ZBuilder
use think\Db;

class Generateorder extends Admin
{
    public function index(){
        // dump('订单列表');
        $data_list = db('customer_order') -> order('id desc') -> select();
        return ZBuilder::make('table')
            ->addColumns([
                ['id','ID'],
                ['order_id','订单号'],
                ['transaction_id','微信支付交易单号'],
                ['openid','openid'],
                ['box_id','盒子id'],
                ['sum_box','盒子总个数'],
                ['sum_price','总价格'],
                ['menstrual_volume','月经量'],
                ['brand','品牌'],
                ['status','订单状态',['0'=>'未支付','1'=>'已支付','2'=>'退款','3'=>'作废']],
                ['pay_type','订单类型',['0'=>'购买盒子','1'=>'续费盒子','2'=>'升级盒子']],
                ['address_id','收货地址id'],
                ['time','创建时间','date'],
                ['right_button','操作','btn']
            ])
            ->setRowList($data_list)
            ->addRightButton('delete')
            ->addTopButton('delete')
            ->fetch();
    }
}