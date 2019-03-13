<?php
namespace app\home\admin;

use app\admin\controller\Admin;
use app\common\builder\ZBuilder;    //引入ZBuilder
use think\Db;
use think\Request;

class Boxlist extends Admin
{
    public function index(){

        $data_list = db('home_boxlist') -> order('id desc') -> select();

        $btn_addprice = [
            'title' => '添加盒子价格',
            'icon'  => 'fa fa-fw fa-yen',
            'class' => 'btn btn-xs btn-default ajax',
            'href'  => url('addprice', ['box_id' => '__id__'])
        ];
        $btn_addbrand = [
            'title' => '添加盒子品牌',
            'icon'  => 'fa fa-fw fa-diamond',
            'class' => 'btn btn-xs btn-default ajax',
            'href'  => url('addbrand', ['box_id' => '__id__'])
        ];

        return ZBuilder::make('table')
            ->setTableName('home_boxlist')
            ->addColumns([
                ['id','ID'],
                ['name','盒子名字'],
                ['introduce','盒子简介'],
                ['tags','盒子标签'],
                ['content','盒子内容'],
                // ['filepath','微信头像','img_url'],       外部图片链接
                ['cover_imgId','封面图片','picture'],
                ['display_imgIds','介绍图片','pictures'],
                ['time','创建时间','date'],
                ['right_button','操作','btn']
            ])
            ->setRowList($data_list)
            ->setColumnWidth(['id'=>30,'display_imgIds'=>180])
            ->setHeight('auto')
            ->addRightButton('delete')
            ->addRightButton('edit',['href' => url('edit',['id' => '__id__'])])
            ->addRightButton('addprice',$btn_addprice)
            ->addRightButton('addbrand',$btn_addbrand)
            // ->addRightButton('edit')
            ->addTopButtons(['add','delete'])
            ->fetch();
    }
    // 添加
    public function add(){
        if(Request::instance() -> isPost()){
            $data = Request::instance() -> param();
            if($data['cover_imgId'] && $data['display_imgIds']){
                // 通过$data['cover_img']的id,去系统表'dp_admin_attachment'找到相应的路径
                $cover_img = db('admin_attachment') -> where('id',$data['cover_imgId']) -> find();
                $display_img = db('admin_attachment') -> where('id','in',$data['display_imgIds']) -> select();
                $arr_display = [];
                if($display_img){
                    foreach($display_img as $value){
                        array_push($arr_display,$value['path']);
                    }
                }
                $arr_display = implode(",",$arr_display);
                // var_dump($arr_display);die;
                $box = [
                    'name' => $data['name'],
                    'introduce' => $data['introduce'],
                    'tags' => $data['tags'],
                    'content' => $data['content'],
                    'cover_imgId' => $data['cover_imgId'],
                    'cover_img' => $cover_img['path'],
                    'display_imgIds' => $data['display_imgIds'],
                    'display_img' => $arr_display,
                    'time' => time()
                ];
                // var_dump($adv);die;
                $result = db('home_boxlist') -> insert($box);
                if($result){
                    $this -> success('添加成功','index');
                }else{
                    $this -> error('添加失败');
                }
            }else{
                $this -> error('图片上传失败,请重新上传');
            }
            // var_dump($data);die;
        }
        return ZBuilder::make('form')
            ->addFormItems([
                ['text','name','盒子名字'],
                ['text','introduce','盒子简介'],
                ['text','tags','盒子标签','请输入4个字的盒子标签'],
                ['textarea','content','盒子内容'],
                ['image','cover_imgId','上传封面图片'],
                ['images','display_imgIds','上传介绍图片']
            ])
            ->layout(['name' => 7,'introduce' => 7,'tags' => 7,'content' => 7])
            ->fetch();
    }
    // 编辑
    public function edit($id = ''){
        if(Request::instance() -> isPost()){
            $data = Request::instance() -> param();
            if($data['cover_imgId'] && $data['display_imgIds']){
                // 通过$data['cover_img']的id,去系统表'dp_admin_attachment'找到相应的路径
                $cover_img = db('admin_attachment') -> where('id',$data['cover_imgId']) -> find();
                $display_img = db('admin_attachment') -> where('id','in',$data['display_imgIds']) -> select();
                $arr_display = [];
                if($display_img){
                    foreach($display_img as $value){
                        array_push($arr_display,$value['path']);
                    }
                }
                $arr_display = implode(",",$arr_display);
                $box = [
                    'id' => $data['id'],
                    'name' => $data['name'],
                    'introduce' => $data['introduce'],
                    'tags' => $data['tags'],
                    'content' => $data['content'],
                    'cover_imgId' => $data['cover_imgId'],
                    'cover_img' => $cover_img['path'],
                    'display_imgIds' => $data['display_imgIds'],
                    'display_img' => $arr_display,
                ];
                $result = db('home_boxlist') -> update($box);
                if($result){
                    $this -> success('编辑成功','index');
                }else{
                    $this -> error('编辑失败！您没有修改');
                }
            }
        }
        $get = Request::instance() -> param();
        $data = db('home_boxlist') -> where('id',$get['id']) -> find();
        return ZBuilder::make('form')
            ->addFormItems([
                ['hidden','id'],
                ['text','name','盒子名字'],
                ['text','introduce','盒子简介'],
                ['text','tags','盒子标签','请输入4个字的盒子标签'],
                ['textarea','content','盒子内容'],
                ['image','cover_imgId','上传封面图片'],
                ['images','display_imgIds','上传介绍图片']
            ])
            ->setFormData($data)
            ->layout(['name' => 7,'introduce' => 7,'tags' => 7,'content' => 7])
            ->fetch();
    }
    // 盒子价格列表
    public function boxprice(){
        $data_list = db('home_boxprice') -> order('box_id,month asc') -> select();

        foreach($data_list as $key => $value){
            $box_name = db('home_boxlist') -> field('name') -> where('id',$value['box_id']) -> find();
            $data_list[$key]['box_name'] = $box_name['name'];
        }

        return ZBuilder::make('table')
            ->setTableName('home_boxprice')
            ->addColumns([
                ['box_name','盒子名字'],
                ['month','月数','text.edit'],
                ['name','中文月数','text.edit'],
                ['price','价格','text.edit'],
                ['time','创建时间','date']
            ])
            ->setRowList($data_list)
            ->setHeight('auto')
            // ->addRightButton('edit')
            ->addTopButtons(['delete'])
            ->fetch();
    }
    // 添加盒子价格
    public function addprice(){
        if(Request::instance() -> isPost()){
            $post_data = Request::instance() -> param();
            $isAdd = db('home_boxprice') -> where(['box_id'=>$post_data['box_id'],'month' => $post_data['month']]) -> find();
            if($isAdd){
                $this -> error('该盒子的此月数已经添加过');
            }else{
                $boxprice = [
                    'box_id' => $post_data['box_id'],
                    'month' => $post_data['month'],
                    'name' => $post_data['name'],
                    'price' => $post_data['price'],
                    'time' => time()
                ];
                $res = db('home_boxprice') -> insert($boxprice);
                if($res){
                    $this -> success('添加成功','boxprice');
                }else{
                    $this -> error('添加失败');
                }
            }
        }
        $get = Request::instance() -> param();
        $box_data = db('home_boxlist') -> field('name') -> where('id',$get['box_id']) -> find();
        $box['box_name'] = $box_data['name'];
        return ZBuilder::make('form')
            ->addFormItems([
                ['hidden','box_id',$get['box_id']],
                ['text','box_name','盒子名字'],
                ['number','month','月数'],
                ['text','name','中文月数'],
                ['text','price','金额','', '', ['<i class="fa fa-fw fa-yen"></i>', '.00']],
            ])
            ->setFormData($box)
            ->layout(['box_name' => 7,'month' => 7,'name' => 7,'price' => 7])
            ->fetch();
    }
    // 盒子品牌列表
    public function boxbrand(){
        $data_list = db('home_boxbrand') -> order('box_id asc') -> select();

        foreach($data_list as $key => $value){
            $box_name = db('home_boxlist') -> field('name') -> where('id',$value['box_id']) -> find();
            $data_list[$key]['box_name'] = $box_name['name'];
        }

        $btn_setdefault = [
            'title' => '设置为该盒子的默认品牌',
            'icon'  => 'fa fa-fw fa-check-square',
            'class' => 'btn btn-xs btn-default ajax-get confirm',
            'href'  => url('setdefault', ['uid' => '__id__']),
            'data-title' => '是否要设置为默认品牌？'
        ];

        return ZBuilder::make('table')
            ->setTableName('home_boxbrand')
            ->addColumns([
                ['id','品牌ID'],
                ['box_name','盒子名字'],
                ['brand','品牌名字','text.edit'],
                ['content','品牌盒子内容','textarea.edit'],
                ['is_default','盒子的默认品牌','yesno'],
                ['time','创建时间','date'],
                ['right_button','操作','btn']
            ])
            ->setRowList($data_list)
            ->setHeight('auto')
            // ->addRightButton('edit')
            ->addTopButtons(['delete'])
            ->addRightButton('setdefault',$btn_setdefault)
            ->fetch();
    }
    // 添加盒子品牌
    public function addbrand(){
        if(Request::instance() -> isPost()){
            $post_data = Request::instance() -> param();
            // var_dump($post_data);die;
            $isAdd = db('home_boxbrand') -> where(['box_id'=>$post_data['box_id'],'brand' => $post_data['brand']]) -> find();
            if($isAdd){
                $this -> error('该盒子的此品牌已经添加过');
            }else{
                // 判断此盒子是否有添加过品牌
                $isbrand = db('home_boxbrand') -> where('box_id',$post_data['box_id']) -> find();
                $is_default = 0;
                if(!$isbrand){
                    $is_default = 1;
                }
                $boxbrand = [
                    'box_id' => $post_data['box_id'],
                    'brand' => $post_data['brand'],
                    'content' => $post_data['content'],
                    'is_default' => $is_default,
                    'time' => time()
                ];
                $res = db('home_boxbrand') -> insert($boxbrand);
                if($res){
                    $this -> success('添加成功','boxbrand');
                }else{
                    $this -> error('添加失败');
                }
            }
        }
        $get = Request::instance() -> param();
        $box_data = db('home_boxlist') -> field('name') -> where('id',$get['box_id']) -> find();
        $box['box_name'] = $box_data['name'];
        return ZBuilder::make('form')
            ->addFormItems([
                ['hidden','box_id',$get['box_id']],
                ['text','box_name','盒子名字'],
                ['text','brand','品牌名字'],
                ['textarea','content','品牌盒子的内容','一段话结束后需要换行添加[。]（句号会换行），如果不需要换行不用添加[。]']
            ])
            ->setFormData($box)
            ->layout(['box_name' => 7,'brand' => 7,'content' => 7])
            ->fetch();
    }
    // 设为该盒子默认品牌
    public function setdefault(){
        $data = Request::instance() -> param();
        // var_dump($data['uid']);
        $is_default = db('home_boxbrand') -> field('box_id,is_default') -> where('id',$data['uid']) -> find();
        if($is_default['is_default'] == 1){
            $this -> error('此品牌为该盒子的默认品牌！');
        }else{
            $brand_id = db('home_boxbrand') -> field('id') -> where('box_id',$is_default['box_id']) -> select();
            // var_dump($brand_id);die;
            $arr_brandId = [];
            foreach($brand_id as $value){
                array_push($arr_brandId,$value['id']);
            }
            $retDefault = db('home_boxbrand') -> where('id','in',$arr_brandId) -> update(['is_default' => 0]);
            if($retDefault){
                $res = db('home_boxbrand') -> where('id',$data['uid']) -> update(['is_default' => 1]);
                if($res){
                    $this -> success('设置成功','boxbrand');
                }else{
                    $this -> error('设置失败');
                }
            }else{
                $this -> error('设置失败');
            }
        }
    }
}