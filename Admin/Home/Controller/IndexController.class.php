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
      $this->display();
    }
}
