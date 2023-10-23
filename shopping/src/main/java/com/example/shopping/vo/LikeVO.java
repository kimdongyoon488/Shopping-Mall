package com.example.shopping.vo;

public class LikeVO {
    private int like_no;
    private int product_num;
    private String member_id;
    private int like_cnt;

    public int getLike_no() {
        return like_no;
    }

    public void setLike_no(int like_no) {
        this.like_no = like_no;
    }

    public int getProduct_num() {
        return product_num;
    }

    public void setProduct_num(int product_num) {
        this.product_num = product_num;
    }

    public String getMember_id() {
        return member_id;
    }

    public void setMember_id(String member_id) {
        this.member_id = member_id;
    }

    public int getLike_cnt() {
        return like_cnt;
    }

    public void setLike_cnt(int like_cnt) {
        this.like_cnt = like_cnt;
    }
}