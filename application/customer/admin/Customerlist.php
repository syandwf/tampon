<?php
namespace app\customer\admin;

use app\admin\controller\Admin;
use app\common\builder\ZBuilder;    //引入ZBuilder
use think\Db;                       //引入DB

class Customerlist extends Admin
{
    public function index(){
        // dump('订单列表');
        $data_list = Db::name('customer_user') -> select();

        return ZBuilder::make('table')
            ->setTableName('customer_user')
            ->addColumns([
                ['id','ID'],
                ['openid','openid'],
                ['wx_headimg','微信头像','img_url'],
                ['wx_nickname','微信昵称'],
                ['phone','电话','tel'],
                // ['name','名字'],
                // ['age','年龄'],
                // ['sex','性别',['0' => '女','1' => '男']],
                ['price','余额'],
                ['integral','积分'],
                ['time','创建时间','date']
            ])
            ->setRowList($data_list)
            ->fetch();
    }
}