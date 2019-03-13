<?php
namespace app\customer\admin;

use app\admin\controller\Admin;
use app\common\builder\ZBuilder;    //引入ZBuilder
use think\Db;

class Menstrualist extends Admin
{
    public function index(){
        // dump('订单列表');
        $data_list = db('customer_periodrecord') -> order('time desc') -> select();
        return ZBuilder::make('table')
            ->setTableName('customer_periodrecord')
            ->addColumns([
                ['id','ID'],
                ['openid','openid'],
                ['before','前一次经期时间','date'],
                ['start_time','经期开始时间','date'],
                ['end_time','经期结束时间','date','无'],
                ['isEnd','经期是否结束',['0'=>'否','1'=>'是']],
                ['time','创建时间','date'],
                ['right_button','操作','btn']
            ])
            ->setRowList($data_list)
            ->addRightButton('delete')
            ->addTopButton('delete')
            ->fetch();
    }
}