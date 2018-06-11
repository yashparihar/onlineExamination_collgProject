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
public class options {
    private String _optionid;
    private String _questionid;
    private String _option;
    private int _correct;
    private int _isitcorrect;
    private String _optionimage;
    
    public options(){}

    public void setOptionid(String _optionid) {
        this._optionid = _optionid;
    }

    public void setQuestionid(String _questionid) {
        this._questionid = _questionid;
    }

    public void setOption(String _option) {
        this._option = _option;
    }

    public void setCorrect(int _correct) {
        this._correct = _correct;
    }

    public void setIsitcorrect(int _isitcorrect) {
        this._isitcorrect = _isitcorrect;
    }

    public void setOptionimage(String _optionimage) {
        this._optionimage = _optionimage;
    }

    public String getOptionid() {
        return _optionid;
    }

    public String getQuestionid() {
        return _questionid;
    }

    public String getOption() {
        return _option;
    }

    public int getCorrect() {
        return _correct;
    }

    public int getIsitcorrect() {
        return _isitcorrect;
    }

    public String getOptionimage() {
        return _optionimage;
    }
    
}
