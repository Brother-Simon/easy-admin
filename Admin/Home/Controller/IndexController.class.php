<?php
namespace Home\Controller;
use Think\Controller;
/**
 * IndexController
 * 首页管理
 */
class IndexController extends Controller {
    /**
     * 网站，服务器基本信息
     * @return
     */
    public function index(){
      $this->assign("home_img_list",M("home_img","ea_")->field("img_url")->select());
      $this->assign("home_introd",M("home_introd","ea_")->field("introduce_text")->find());
      $this->assign("produce_img",M("produce_img","ea_")->field("img_url")->select());
      $this->assign("happy_see",M("happy_see","ea_")->select());
      $this->assign("cooperation",M("cooperation","ea_")->find());
      $this->assign("happy_article",M("happy_article","ea_")->field("context,img_url")->find());
      $this->assign("shop",M("shop","ea_")->find());
      $this->assign("produce_show_type",M("produce_show_type","ea_")->find());
      $this->display();
    }
    public function get_artcile($id){
      $query["id"] = $id;
      $data = M("happy_article","ea_")->where($query)->field("context,img_url")->find();
      if(empty($data)){
        $this->ajaxReturn(array("status"=>"empty"));
      }else{
        $data["status"] = "success";
        $this->ajaxReturn($data);
      }
    }
    public function save_contact(){
      $data["name"] = I("param.name","");
      $data["email"] = I("post.email","");
      $data["content"] = I("post.content","");
      $Contact = M("contact","ea_");
      $result = $Contact ->data($data)->add();
      $this->ajaxReturn(array("status"=>"success"));
    }
}
