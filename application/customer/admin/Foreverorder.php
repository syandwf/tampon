<?php
namespace app\customer\admin;

use app\admin\controller\Admin;
use app\common\builder\ZBuilder;    //引入ZBuilder
use think\Db;

class Foreverorder extends Admin
{
    public function index(){
        // dump('订单列表');
        $data_list = db('customer_forever_order') -> order('id desc') -> select();
        return ZBuilder::make('table')
            ->setTableName('customer_forever_order')
            ->addColumns([
                ['id','ID'],
                ['order_id','订单号'],
                ['openid','openid'],
                ['box_id','盒子id'],
                ['sum_box','盒子总个数','text.edit'],
                ['rest_box','剩余盒子个数','text.edit'],
                ['sum_price','总价格'],
                ['menstrual_volume','月经量','text.edit'],
                ['brand','品牌','text.edit'],
                ['status','是否支付',['0'=>'未支付','1'=>'已支付']],
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