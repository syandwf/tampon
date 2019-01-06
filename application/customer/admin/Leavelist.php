<?php
namespace app\customer\admin;

use app\admin\controller\Admin;
use app\common\builder\ZBuilder;    //引入ZBuilder
use think\Db;                       //引入DB
use think\Request;                  //引入请求

class Leavelist extends Admin
{
    public function index(){
        // dump('订单列表');
        $data_list = Db::name('customer_leave_message') -> select();

        $btn_reply = [
            'title' => '回复',
            'icon'  => 'fa fa-fw fa-comments',
            'href'  => url('reply',['uid' => '__id__'])
        ];

        return ZBuilder::make('table')
            ->setTableName('customer_leave_message')
            ->addColumns([
                ['id','ID'],
                ['openid','openid'],
                ['content','留言内容','text.edit'],
                ['time','留言时间','date'],
                ['status','是否回复',[0=>'未回复',1=>'已回复']],
                ['reply','回复内容','textarea.edit','无'],
                ['reply_time','回复时间','date','无'],
                ['right_button','操作','btn']
            ])
            ->setRowList($data_list)
            ->addRightButton('reply',$btn_reply)
            ->fetch();
    }

    // 回复
    public function reply(){
        if(Request::instance() -> isPost()){
            // var_dump(Request::instance() -> param());die;
            $reply = Request::instance() -> param();
            $time = time();
            $res = db('customer_leave_message') -> where('id',$reply['uid']) -> update(['reply' => $reply['reply'],'reply_time'=>$time,'status'=>1]);
            if($res){
                $this -> success('回复成功！','index');
            }else{
                $this -> error('回复失败！');
            }
        }
        $data = Request::instance() -> param();
        // var_dump($data);die;
        return ZBuilder::make('form')
            // ->addHidden('id',$data['uid'])
            ->addTextarea('reply','回复内容')
            ->fetch();
    }
}