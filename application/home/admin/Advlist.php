<?php
namespace app\home\admin;

use app\admin\controller\Admin;
use app\common\builder\ZBuilder;    //引入ZBuilder
use think\Db;
use think\Request;

class Advlist extends Admin
{
    public function index(){
        // dump('订单列表');
        $data_list = db('home_advlist') -> order('id desc') -> select();

        $btn_uppershelf = [
            'title' => '上架',
            'icon'  => 'fa fa-fw fa-arrow-up',
            'class' => 'btn btn-xs btn-default ajax-get confirm',
            'href'  => url('uppershelf', ['id' => '__id__']),
            'data-title' => '是否上架？'
        ];

        $btn_lowershelf = [
            'title' => '下架',
            'icon'  => 'fa fa-fw fa-arrow-down',
            'class' => 'btn btn-xs btn-default ajax-get confirm',
            'href'  => url('lowershelf', ['id' => '__id__']),
            'data-title' => '是否下架？'
        ];
        $status = [0=>'下架',1=>'上架'];

        return ZBuilder::make('table')
            ->setTableName('home_advlist')
            ->addColumns([
                ['id','ID'],
                ['name','轮播图名字'],
                // ['filepath','微信头像','img_url'],       外部图片链接
                ['fileId','轮播图','picture'],
                ['status','状态',$status],
                ['time','创建时间','date'],
                ['right_button','操作','btn']
            ])
            ->setRowList($data_list)
            ->setHeight('auto')
            ->addRightButton('delete')
            ->addRightButton('uppershelf',$btn_uppershelf)
            ->addRightButton('lowershelf',$btn_lowershelf)
            // ->addTopButton('add')
            // ->addTopButton('delete')
            ->addTopButtons(['add','delete'])
            ->fetch();
    }
    // 添加
    public function add(){
        if(Request::instance() -> isPost()){
            $data = Request::instance() -> param();
            if($data['filepath']){
                // 通过$data['filepath]的id,去系统表'dp_admin_attachment'找到相应的路径
                $img = db('admin_attachment') -> where('id',$data['filepath']) -> find();
                $adv = [
                    'name' => $data['name'],
                    'fileId' => $data['filepath'],
                    'filepath' => $img['path'],
                    'status' => 0,
                    'time' => time()
                ];
                // var_dump($adv);die;
                $result = db('home_advlist') -> insert($adv);
                if($result){
                    $this -> success('添加成功','index');
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
                ['text','name','轮播图名'],
                ['image','filepath','上传图片']
            ])
            ->layout(['name' => 5])
            ->fetch();
    }
    // 上架
    public function  uppershelf(){
        $data = Request::instance() -> param();
        // var_dump($data);die;
        $adv = db('home_advlist') -> where('id',$data['id']) -> find();
        if($adv['status'] == 1){
            $this -> error('已上架');
        }else{
            $adv_num = db('home_advlist') -> where('status',1) -> count();
            // var_dump($adv_num);die;
            if($adv_num >= 3){
                $this -> error('上架个数不能超过3个');
            }else{
                $res = db('home_advlist') -> update(['id'=>$data['id'],'status'=>1]);
                if($res){
                    $this -> success('上架成功','index');
                }else{
                    $this -> error('上架失败');
                }
            }
        }
    }
    // 下架
    public function lowershelf(){
        $data = Request::instance() -> param();
        $adv = db('home_advlist') -> where('id',$data['id']) -> find();
        if($adv['status'] == 0){
            $this -> error('已下架');
        }else{
            $res = db('home_advlist') -> update(['id'=>$data['id'],'status'=>0]);
            if($res){
                $this -> success('已下架');
            }else{
                $this -> error('下架失败');
            }
        }
    }
}