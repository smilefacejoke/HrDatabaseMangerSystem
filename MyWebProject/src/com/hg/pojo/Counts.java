package com.hg.pojo;

public class Counts {
    private int userCount;
    private int deptCount;
    private int jobCount;
    private int employeeCount;
    private int noticeCount;
    private int uploadfileCount;

    public int getUserCount() {
        return userCount;
    }

    public void setUserCount(int userCount) {
        this.userCount = userCount;
    }

    public int getDeptCount() {
        return deptCount;
    }

    public void setDeptCount(int deptCount) {
        this.deptCount = deptCount;
    }

    public int getJobCount() {
        return jobCount;
    }

    public void setJobCount(int jobCount) {
        this.jobCount = jobCount;
    }

    public int getEmployeeCount() {
        return employeeCount;
    }

    public void setEmployeeCount(int employeeCount) {
        this.employeeCount = employeeCount;
    }

    public int getNoticeCount() {
        return noticeCount;
    }

    public void setNoticeCount(int noticeCount) {
        this.noticeCount = noticeCount;
    }

    public int getUploadfileCount() {
        return uploadfileCount;
    }

    public void setUploadfileCount(int uploadfileCount) {
        this.uploadfileCount = uploadfileCount;
    }

    @Override
    public String toString() {
        return "Count{" +
                "userCount=" + userCount +
                ", deptCount=" + deptCount +
                ", jobCount=" + jobCount +
                ", employeeCount=" + employeeCount +
                ", noticeCount=" + noticeCount +
                ", uploadfileCount=" + uploadfileCount +
                '}';
    }
}
