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
public class exam {
   private String _examid;
   private String _examname;
   private String _deptid;
   private String _scheduleid;
   private String _examinerid;
   private int _totalmarks;
   private int _isitapproved;

    public exam() { }

    public void setIsitapproved(int _isitapproved) {
        this._isitapproved = _isitapproved;
    }

    public int getIsitapproved() {
        return _isitapproved;
    }

    public void setExamid(String _examid) {
        this._examid = _examid;
    }

    public void setExamname(String _examname) {
        this._examname = _examname;
    }

    public void setDeptid(String _deptid) {
        this._deptid = _deptid;
    }

    public void setScheduleid(String _scheduleid) {
        this._scheduleid = _scheduleid;
    }

    public void setExaminerid(String _examinerid) {
        this._examinerid = _examinerid;
    }

    public void setTotalmarks(int _totalmarks) {
        this._totalmarks = _totalmarks;
    }

    public String getExamid() {
        return _examid;
    }

    public String getExamname() {
        return _examname;
    }

    public String getDeptid() {
        return _deptid;
    }

    public String getScheduleid() {
        return _scheduleid;
    }

    public String getExaminerid() {
        return _examinerid;
    }

    public int getTotalmarks() {
        return _totalmarks;
    }
   
   
   
}
