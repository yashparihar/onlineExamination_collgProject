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
public class questionbank {
   private String _questionbankid;
   private String _examid;
   private int _totalmarks;
   private String _examinerid;
   
   public questionbank(){}

    public void setQuestionbankid(String _questionbankid) {
        this._questionbankid = _questionbankid;
    }

    public void setExamid(String _examid) {
        this._examid = _examid;
    }

    public void setTotalmarks(int _totalmarks) {
        this._totalmarks = _totalmarks;
    }

    public void setExaminerid(String _examinerid) {
        this._examinerid = _examinerid;
    }

    public String getQuestionbankid() {
        return _questionbankid;
    }

    public String getExamid() {
        return _examid;
    }

    public int getTotalmarks() {
        return _totalmarks;
    }

    public String getExaminerid() {
        return _examinerid;
    }
   
   
}
