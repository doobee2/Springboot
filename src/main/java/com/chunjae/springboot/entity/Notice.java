package com.chunjae.springboot.entity;

import lombok.Data;

@Data
public class Notice {
    private int no;
    private String title;
    private String content;
    private String regdate;
    private int visited;
}
