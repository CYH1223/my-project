package com.qf.pojo.po.vo;

import java.util.List;

public class UserVO<T> {
    private int currentPage;//当前是第几页
    private int totalPage;//总页数
    private int pageCount;//每页显示的用户数量
    private int totalCount;//用户总数
    private List<T> data;//当前页的用户数据集合

    public UserVO() {
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

}
