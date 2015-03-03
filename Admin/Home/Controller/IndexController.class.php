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
      $this->assign("home_introduce",M("home_introduce","ea_")->field("introduce_text")->find());
      $this->assign("produce_img",M("produce_img","ea_")->field("img_url")->select());
      $this->assign("happy_see",M("happy_see","ea_")->field("title,img_url")->select());
      $this->assign("cooperation",M("cooperation","ea_")->find());
      $this->assign("happy_article",M("happy_article","ea_")->field("context,img_url")->find());
      $this->assign("shop",M("shop","ea_")->find());
      $this->display();
    }
}
