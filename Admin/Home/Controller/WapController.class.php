<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
namespace Home\Controller;
use Think\Controller;
class WapController extends Controller {
  public function index(){
    $this->assign("wap_home",M("wap_home","ea_")->field()->select());
    $this->assign("wap_trend",M("wap_trend","ea_")->field()->select());
    $this->assign("trend_text",M("trend_text","ea_")->field()->find());
    $this->assign("wap_about",M("wap_about","ea_")->field()->find());
    $this->assign("cooperation",M("cooperation","ea_")->find());
    $this->assign("shop",M("shop","ea_")->find());
    $this->display();
  }
    public function upload(){
    $this->display();
  }
  public function get_artcile($id){
    $query["id"] = $id;
    $data = M("wap_trend_article","ea_")->where($query)->field()->find();
    if(empty($data)){
      $this->ajaxReturn(array("status"=>"empty"));
    }else{
      $data["status"] = "success";
      $this->ajaxReturn($data);
    }
  }
}

