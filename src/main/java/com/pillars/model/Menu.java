package com.pillars.model;

import java.util.Date;

public class Menu {
    private Long id;

    private String title;

    private String code;

    private String parentnode;

    private Byte havechild;

    private String link;

    private Date datecreated;

    private Date lastupdated;

    private Integer rank;

    public Menu(Long id, String title, String code, String parentnode, Byte havechild, String link, Date datecreated, Date lastupdated, Integer rank) {
        this.id = id;
        this.title = title;
        this.code = code;
        this.parentnode = parentnode;
        this.havechild = havechild;
        this.link = link;
        this.datecreated = datecreated;
        this.lastupdated = lastupdated;
        this.rank = rank;
    }

    public Menu() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public String getParentnode() {
        return parentnode;
    }

    public void setParentnode(String parentnode) {
        this.parentnode = parentnode == null ? null : parentnode.trim();
    }

    public Byte getHavechild() {
        return havechild;
    }

    public void setHavechild(Byte havechild) {
        this.havechild = havechild;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link == null ? null : link.trim();
    }

    public Date getDatecreated() {
        return datecreated;
    }

    public void setDatecreated(Date datecreated) {
        this.datecreated = datecreated;
    }

    public Date getLastupdated() {
        return lastupdated;
    }

    public void setLastupdated(Date lastupdated) {
        this.lastupdated = lastupdated;
    }

    public Integer getRank() {
        return rank;
    }

    public void setRank(Integer rank) {
        this.rank = rank;
    }
}