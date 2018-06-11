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
public class department {
   private String _deptid;
   private String _deptname;
   private String _loginid;
   private String _instituteid;
   private String _deptemailid;
    
    public department(){}

    public void setDeptid(String _deptid) {
        this._deptid = _deptid;
    }

    public void setDeptname(String _deptname) {
        this._deptname = _deptname;
    }

    public void setLoginid(String _loginid) {
        this._loginid = _loginid;
    }

    public void setInstituteid(String _instituteid) {
        this._instituteid = _instituteid;
    }

    public void setDeptemailid(String _deptemailid) {
        this._deptemailid = _deptemailid;
    }

    public String getDeptid() {
        return _deptid;
    }

    public String getDeptname() {
        return _deptname;
    }

    public String getLoginid() {
        return _loginid;
    }

    public String getInstituteid() {
        return _instituteid;
    }

    public String getDeptemailid() {
        return _deptemailid;
    }
    
}
