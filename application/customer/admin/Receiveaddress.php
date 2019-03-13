<?php
namespace app\customer\admin;

use app\admin\controller\Admin;
use app\common\builder\ZBuilder;    //引入ZBuilder
use think\Db;                       //引入DB

class Receiveaddress extends Admin
{
    public function index(){
        $data_list = Db::name('customer_receive_address') -> select();

        return ZBuilder::make('table')
            ->setTableName('customer_receive_address')
            ->addColumns([
                ['id','ID'],
                ['openid','openid'],
                ['name','联系人姓名'],
                ['phone','联系人电话'],
                ['province','省'],
                ['city','市'],
                ['area','区'],
                ['address','详细地址'],
                ['is_default','默认地址','yesno'],
                ['time','创建时间','date']
            ])
            ->setRowList($data_list)
            ->fetch();
    }
}