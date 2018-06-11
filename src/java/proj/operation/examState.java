/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proj.operation;

//(String examid ,String  enrollid ,int questionno ,String questionidList[]   )

import java.util.ArrayList;

   
public class examState {
   String examId;
   String studEnrollId;
   int questionNo;
   String examName;

    public void setExamName(String examName) {
        this.examName = examName;
    }

    public String getExamName() {
        return examName;
    }
   ArrayList<String> QuestionIdList=new ArrayList<String>();

   
   
   public String getQuestionId(){
       return QuestionIdList.get(questionNo);
   }
   
    public void setQuestionIdList(ArrayList QuestionIdList) {
        this.QuestionIdList = QuestionIdList;
    }

    public ArrayList getQuestionIdList() {
        return QuestionIdList;
    }

    public void setExamId(String examId) {
        this.examId = examId;
    }

    public void setStudEnrollId(String studEnrollId) {
        this.studEnrollId = studEnrollId;
    }

    public void setQuestionNo(int questionNo) {
        this.questionNo = questionNo;
    }

public void addQuestion(String ques){
    QuestionIdList.add(ques);
}

    public String getExamId() {
        return examId;
    }

    public String getStudEnrollId() {
        return studEnrollId;
    }

    public int getQuestionNo() {
        return questionNo;
    }

 
   
}
