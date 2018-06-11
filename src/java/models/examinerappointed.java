/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 *
 * @author Yash
 */
public class examinerappointed {
    private String examinerappointedid;
    private String examinerid;
    private String deptid;
    private String examid;
    private String appointed;
    
    public examinerappointed(){}

    public void setExaminerappointedid(String examinerappointedid) {
        this.examinerappointedid = examinerappointedid;
    }

    public void setExaminerid(String examinerid) {
        this.examinerid = examinerid;
    }

    public void setDeptid(String deptid) {
        this.deptid = deptid;
    }

    public void setExamid(String examid) {
        this.examid = examid;
    }

    public void setAppointed(String appointed) {
        this.appointed = appointed;
    }

    public String getExaminerappointedid() {
        return examinerappointedid;
    }

    public String getExaminerid() {
        return examinerid;
    }

    public String getDeptid() {
        return deptid;
    }

    public String getExamid() {
        return examid;
    }

    public String getAppointed() {
        return appointed;
    }
    
    
}
