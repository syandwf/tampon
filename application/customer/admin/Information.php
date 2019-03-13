<?php
namespace app\customer\admin;

use app\admin\controller\Admin;
use app\common\builder\ZBuilder;    //引入ZBuilder
use think\Db;
use think\Request;

class Information extends Admin
{
    public function index(){
        $btn_fh = [
            'title' => '发货',
            'icon'  => 'fa fa-fw fa-truck',
            'class' => 'btn btn-xs btn-default ajax-get confirm',
            'href'  => url('delivergoods', ['id' => '__id__']),
            'data-title' => '是否发货？'
        ];

        $data_list = db('customer_express_order') -> order('id desc') -> select();
        $company = db('customer_express_company') -> field('type,company') -> select();
        $arr_company = [];
        foreach($company as $value){
            $arr_company[$value['type']] = $value['company'];
        }
        return ZBuilder::make('table')
            ->setTableName('customer_express_order')
            ->addColumns([
                ['id','ID'],
                ['express_num','物流单号','text.edit'],
                ['express_company','物流公司','select',$arr_company],
                ['forever_id','永久订单id'],
                ['order_id','永久订单的订单id'],
                ['openid','openid'],
                ['box_id','盒子id'],
                ['box_num','盒子个数'],
                ['sum_price','总金额'],
                ['address','收货地址','text.edit'],
                ['name','收货人姓名','text.edit'],
                ['phone','收货人电话','text.edit'],
                ['status','订单状态',['0'=>'待发货','1'=>'待收货','2'=>'待评价','3'=>'交易成功']],
                ['create_time','创建时间','date'],
                ['right_button','操作','btn']
            ])
            ->setRowList($data_list)
            ->addRightButton('btn_fh',$btn_fh)
            ->addTopButton('delete')
            ->fetch();
    }

    // 发货
    public function delivergoods(){
        $data = Request::instance() -> param();
        if($data['id']){
            $express = db('customer_express_order') -> field('express_num,express_company,status') -> where('id',$data['id']) -> find();
            if(!$express['express_num']){
                $this -> error('请填入物流单号！');
            }if(!$express['express_company']){
                $this -> error('请选择物流公司！');
            }elseif($express['express_num'] && $express['express_company'] && $express['status'] == 0){
                $res = db('customer_express_order') -> where('id',$data['id']) -> update(['status' => 1]);
                if($res){
                    $this -> success('发货成功！','index');
                }else{
                    $this -> error('发货失败！');
                }
            }else{
                $this -> error('此单已发货！');
            }
        }
    }

    // 物流公司
    public function company(){
        $btn_fh = [
            'title' => '发货',
            'icon'  => 'fa fa-fw fa-truck',
            'class' => 'btn btn-xs btn-default ajax-get confirm',
            'href'  => url('delivergoods', ['id' => '__id__']),
            'data-title' => '是否发货？'
        ];

        $data_list = db('customer_express_company') -> order('id desc') -> select();
        return ZBuilder::make('table')
            ->setTableName('customer_express_company')
            ->addColumns([
                ['id','ID'],
                ['company','公司名字'],
                ['type','type缩写']
            ])
            ->setRowList($data_list)
            ->addTopButton('add')
            ->addTopButton('delete')
            ->fetch();
    }

    // 添加物流公司
    public function add(){
        if(Request::instance() -> isPost()){
            $data = Request::instance() -> param();
            if($data['company'] && $data['type']){
                $result = db('customer_express_company') -> insert($data);
                if($result){
                    $this -> success('添加成功','company');
                }else{
                    $this -> error('添加失败');
                }
            }else{
                $this -> error('图片上传失败');
            }
            // var_dump($data);die;
        }
        return ZBuilder::make('form')
            ->addFormItems([
                ['text','company','物流公司名字','请根据后面网址的快递公司列表填写https://market.aliyun.com/products/56928004/cmapi021863.html?spm=5176.2020520132.101.7.764a7218FpKkI6#sku=yuncode1586300000'],
                ['text','type','物流公司缩写(小写)','请根据后面网址的快递公司列表填写https://market.aliyun.com/products/56928004/cmapi021863.html?spm=5176.2020520132.101.7.764a7218FpKkI6#sku=yuncode1586300000']
            ])
            ->layout(['company' => 8,'type' => 8])
            ->fetch();
    }
}