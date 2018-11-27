package com.bupt.crud.bean;

import java.util.HashMap;

public class Msg {
    //状态码，成功100，失败200
    private int code;

    private String msg;

    private HashMap<String,Object> extend = new HashMap<String,Object>();

    public static Msg success(){
        Msg result = new Msg();
        result.setCode(100);
        result.setMsg("处理成功!  ");
        return result;
    }

    public static Msg fail(){
        Msg result = new Msg();
        result.setCode(200);
        result.setMsg("处理失败!  ");
        return result;
    }

    public Msg add(String key,Object value){
        this.getExtend().put(key,value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }

    public HashMap<String, Object> getExtend() {
        return extend;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public void setExtend(HashMap<String, Object> extend) {
        this.extend = extend;
    }
}
