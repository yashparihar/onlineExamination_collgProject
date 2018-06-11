/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proj.operation;

public class timerState {
    
    String examStartTime;
    String examEndTime;
    int duration;
    String studentStartTime;
    String examdate;

    public String getExamdate() {
        return examdate;
    }

    public void setExamdate(String examdate) {
        this.examdate = examdate;
    }

    public String getExamStartTime() {
        return examStartTime;
    }

    public String getExamEndTime() {
        return examEndTime;
    }

    public int getDuration() {
        return duration;
    }

    public String getStudentStartTime() {
        return studentStartTime;
    }

    public void setExamStartTime(String examStartTime) {
        this.examStartTime = examStartTime;
    }

    public void setExamEndTime(String examEndTime) {
        this.examEndTime = examEndTime;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public void setStudentStartTime(String studentStartTime) {
        this.studentStartTime = studentStartTime;
    }
    
    
    
}
