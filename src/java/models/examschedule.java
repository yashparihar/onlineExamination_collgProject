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
public class examschedule {
   private String _scheduleid;
   private String _starttime;
   private String _endtime;
   private int _duration;
   private String _date;
   
   public examschedule(){}

    public void setScheduleid(String _scheduleid) {
        this._scheduleid = _scheduleid;
    }

    public void setStarttime(String _starttime) {
        this._starttime = _starttime;
    }

    public void setEndtime(String _endtime) {
        this._endtime = _endtime;
    }

    public void setDuration(int _duration) {
        this._duration = _duration;
    }

    public void setDate(String _date) {
        this._date = _date;
    }

    public String getScheduleid() {
        return _scheduleid;
    }

    public String getStarttime() {
        return _starttime;
    }

    public String getEndtime() {
        return _endtime;
    }

    public int getDuration() {
        return _duration;
    }

    public String getDate() {
        return _date;
    }
   
   
}
