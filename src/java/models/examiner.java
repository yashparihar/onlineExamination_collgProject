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
public class examiner {
   private String examinerid;
   private String examinername;
   private String loginid;
   private String examineremailid;
   
   public examiner(){}

    public void setExaminerid(String examinerid) {
        this.examinerid = examinerid;
    }

    public void setExaminername(String examinername) {
        this.examinername = examinername;
    }

    public void setLoginid(String loginid) {
        this.loginid = loginid;
    }

    public void setExamineremailid(String examineremailid) {
        this.examineremailid = examineremailid;
    }

    public String getExaminerid() {
        return examinerid;
    }

    public String getExaminername() {
        return examinername;
    }

    public String getLoginid() {
        return loginid;
    }

    public String getExamineremailid() {
        return examineremailid;
    }
   
}
