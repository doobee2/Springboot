package com.chunjae.springboot.entity;

import lombok.Data;

@Data
public class Book {
    private int bno;
    private String cateId;
    private String title;
    private String content;
    private String publish;
    private String author;
    private int cost;
    private String puser;
    private String img;
}
