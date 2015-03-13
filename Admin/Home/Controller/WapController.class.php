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
    $this->display();
  }
    public function upload(){
    $this->display();
  }
}

