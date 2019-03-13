<?php
namespace app\circle\admin;

use app\admin\controller\Admin;
use app\common\builder\ZBuilder;    //引入ZBuilder
use think\Db;                       //引入DB
use think\Request;  

class Circlelist extends Admin{
     public function index(){
        $data_list = Db::table('dp_circle_list')->paginate(); 
        $type = Db::table('dp_circle_type') -> select();
        $type_name = [];
        foreach($type as $item){
            $type_name[$item['id']] = $item['type_name'];
        }
        $btn_state = [
            'title' => '更改审核状态',
            'icon'  => 'fa fa-fw fa-comments',
            'href'  => url('state',['uid' => '__id__'])
        ]; 
        // 使用ZBuilder构建数据表格
        return ZBuilder::make('table')
            ->setTableName('circle_list')
            ->addColumn('id', '序号')
            ->addColumn('username', '昵称')
            ->addColumn('content', '内容')
            ->addColumn('time', '创建时间', 'datetime')
            ->addColumn('type_id', '圈子类型',$type_name)
            ->addColumn('state','是否审核',[0=>'待审核',1=>'已审核'])
            ->addColumn('right_button', '操作', 'btn')
            ->addRightButton('delete')
            ->addRightButton('state',$btn_state)
            ->addTopButtons('delete') // 批量删除顶部按钮
            ->setRowList($data_list) // 设置表格数据
            ->fetch();
     }

     public function shlist(){
         //审核列表界面
         $data_list = Db::table('dp_circle_list')->where('state',1)->paginate(); 
         $type = Db::table('dp_circle_type') -> select();
         $type_name = [];
         foreach($type as $item){
             $type_name[$item['id']] = $item['type_name'];
         }
         $btn_state = [
             'title' => '更改审核状态',
             'icon'  => 'fa fa-fw fa-comments',
             'href'  => url('state',['uid' => '__id__'])
         ]; 
         // 使用ZBuilder构建数据表格
         return ZBuilder::make('table')
             ->setTableName('circle_list')
             ->addColumn('id', '序号')
             ->addColumn('username', '昵称')
             ->addColumn('content', '内容')
             ->addColumn('time', '创建时间', 'datetime')
             ->addColumn('type_id', '圈子类型',$type_name)
             ->addColumn('state','是否审核',[0=>'待审核',1=>'已审核'])
             ->addColumn('right_button', '操作', 'btn')
             ->addRightButton('delete')
             ->addRightButton('state',$btn_state)
             ->addTopButtons('delete') // 批量删除顶部按钮
             ->setRowList($data_list) // 设置表格数据
             ->fetch();
     }
     public function dshlist(){
         //待审核列表界面
         $data_list = Db::table('dp_circle_list')->where('state',0)->paginate(); 
         $type = Db::table('dp_circle_type') -> select();
         $type_name = [];
         foreach($type as $item){
             $type_name[$item['id']] = $item['type_name'];
         }
         $btn_state = [
             'title' => '更改审核状态',
             'icon'  => 'fa fa-fw fa-comments',
             'href'  => url('state',['uid' => '__id__'])
         ]; 
         // 使用ZBuilder构建数据表格
         return ZBuilder::make('table')
             ->setTableName('circle_list')
             ->addColumn('id', '序号')
             ->addColumn('username', '昵称')
             ->addColumn('content', '内容')
             ->addColumn('time', '创建时间', 'datetime')
             ->addColumn('type_id', '圈子类型',$type_name)
             ->addColumn('state','是否审核',[0=>'待审核',1=>'已审核'])
             ->addColumn('right_button', '操作', 'btn')
             ->addRightButton('delete')
             ->addRightButton('state',$btn_state)
             ->addTopButtons('delete') // 批量删除顶部按钮
             ->setRowList($data_list) // 设置表格数据
             ->fetch();
    }
    public function circletype(){
        //圈子类型列表
        $data_list = Db::table('dp_circle_type')->paginate();

        return ZBuilder::make('table')
        ->setTableName('circle_type')
        ->addColumn('id', '序号')
        ->addColumn('type_name', '圈子类型')
        ->addColumn('time', '创建时间', 'datetime')
        ->addColumn('right_button', '操作', 'btn')
        ->addRightButton('delete')
        ->addTopButtons('add,delete') // 批量删除顶部按钮
        ->setRowList($data_list) // 设置表格数据
        ->fetch();
    }
    public function add(){
        if($this->request->post()){
            $data = $this->request->post();
            $data['time'] = time();
            $shuju = db('circle_type') -> where('type_name',$data['type_name']) -> find();
            if($shuju){
                $this->error('该类型已存在');
            }else{
                $result = db('circle_type') -> insert($data);
                if($result){
                    $this->success('添加成功','circletype');
                }else{
                    $this->error('添加失败');
                }
            }
            
        }
        
        return ZBuilder::make('form')
        ->setPageTitle('添加')
        ->addText('type_name', '圈子类型')
        ->fetch();
    }
    public function state(){
        if(Request::instance() -> isPost()){
            // var_dump(Request::instance() -> param());die;
            $state = Request::instance() -> param();
            $time = time();
            $res = db('circle_list') -> where('id',$state['uid']) -> update(['time'=>$time,'state'=>$state['state']]);
            if($res){
                $this -> success('更改成功！','index');
            }else{
                $this -> error('更改失败！');
            }
        }
        $data = Request::instance() -> param();
        $info = db('circle_list') -> where('id',$data['uid']) -> find();
        return ZBuilder::make('form')
            // ->addHidden('id',$data['uid'])
            ->addRadio('state', '选择状态', '', ['0' => '待审核', '1' => '审核'], $info['state'])
            ->fetch();
    }
}