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
public class questions {
    private String _questionid;
    private String _questionbankid;
    private String _question;
    private int marks;
    private String questionimage;
    
    public questions(){}

    public void setQuestionid(String _questionid) {
        this._questionid = _questionid;
    }

    public void setQuestionbankid(String _questionbankid) {
        this._questionbankid = _questionbankid;
    }

    public void setQuestion(String _question) {
        this._question = _question;
    }

    public void setMarks(int marks) {
        this.marks = marks;
    }

    public void setQuestionimage(String questionimage) {
        this.questionimage = questionimage;
    }

    public String getQuestionid() {
        return _questionid;
    }

    public String getQuestionbankid() {
        return _questionbankid;
    }

    public String getQuestion() {
        return _question;
    }

    public int getMarks() {
        return marks;
    }

    public String getQuestionimage() {
        return questionimage;
    }
    
    
}
