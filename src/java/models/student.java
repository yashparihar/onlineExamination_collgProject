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
public class student {
    private String _studentrollno;
    private String _studentname;
    private String _deptid;
    private String _loginid;
    private String _studentemailid;
    private int _totalexamenrolled;
    private String _studentdob;
    private String _studentpicture;
    private String _studentaddress;
    private String _studentmobileno;
    private String _gender;

    public String getGender() {
        return _gender;
    }
    
    public student(){}

    public void setGender(String _gender) {
        this._gender = _gender;
    }

    public void setStudentmobileno(String _studentmobileno) {
        this._studentmobileno = _studentmobileno;
    }
       
       
    public void setStudentrollno(String _studentrollno) {
        this._studentrollno = _studentrollno;
    }

    public void setStudentname(String _studentname) {
        this._studentname = _studentname;
    }

    public void setDeptid(String _deptid) {
        this._deptid = _deptid;
    }

    public void setLoginid(String _loginid) {
        this._loginid = _loginid;
    }

    public void setStudentemailid(String _studentemailid) {
        this._studentemailid = _studentemailid;
    }

    public void setTotalexamenrolled(int _totalexamenrolled) {
        this._totalexamenrolled = _totalexamenrolled;
    }

    public void setStudentdob(String _studentdob) {
        this._studentdob = _studentdob;
    }

    public void setStudentpicture(String _studentpicture) {
        this._studentpicture = _studentpicture;
    }

    public void setStudentaddress(String _studentaddress) {
        this._studentaddress = _studentaddress;
    }


    public String getStudentrollno() {
        return _studentrollno;
    }

    public String getStudentname() {
        return _studentname;
    }

    public String getDeptid() {
        return _deptid;
    }

    public String getLoginid() {
        return _loginid;
    }

    public String getStudentemailid() {
        return _studentemailid;
    }

    public int getTotalexamenrolled() {
        return _totalexamenrolled;
    }

    public String getStudentdob() {
        return _studentdob;
    }

    public String getStudentpicture() {
        return _studentpicture;
    }

    public String getStudentaddress() {
        return _studentaddress;
    }

       public String getStudentmobileno() {
        return _studentmobileno;
    }
    
}
