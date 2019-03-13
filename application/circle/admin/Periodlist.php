<?php
namespace app\customer\admin;

use app\admin\controller\Admin;
use app\common\builder\ZBuilder;    //引入ZBuilder
use think\Db;

class Periodlist extends Admin
{
    public function index(){
        // dump('订单列表');
        $data_list = db('customer_periodsetting') -> order('id asc') -> select();
        return ZBuilder::make('table')
            ->setTableName('customer_periodsetting')
            ->addColumns([
                ['id','ID'],
                ['openid','openid'],
                ['name','姓名','text.edit'],
                ['age','年龄'],
                ['sex','性别',['0'=>'女','1'=>'男']],
                ['isown','是否本人',['0'=>'是','1'=>'否']],
                ['before','上次月经时间','date'],
                ['period','月经天数'],
                ['cycle','月经周期'],
                ['law','月经规律',['0'=>'早来','1'=>'正常','2'=>'晚来']],
                ['ispregnant','是否怀孕',['0'=>'否','1'=>'是']],
                ['preproduction_date','怀孕日期','date','无'],
                ['time','创建时间','date'],
                ['right_button','操作','btn']
            ])
            ->setRowList($data_list)
            ->addRightButton('delete')
            ->addTopButton('delete')
            ->fetch();
    }
}