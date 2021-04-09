/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhnq.dtos;

/**
 *
 * @author Ticket 1
 */
public class HistoryDTO {
    private String historyID;
    private String email;
    private String subjectID;
    private String correctAnswerID;
    private String quizTime;
    private String grade;

    public HistoryDTO() {
    }

    public HistoryDTO(String historyID, String email, String subjectID, String correctAnswerID, String quizTime, String grade) {
        this.historyID = historyID;
        this.email = email;
        this.subjectID = subjectID;
        this.correctAnswerID = correctAnswerID;
        this.quizTime = quizTime;
        this.grade = grade;
    }

    /**
     * @return the historyID
     */
    public String getHistoryID() {
        return historyID;
    }

    /**
     * @param historyID the historyID to set
     */
    public void setHistoryID(String historyID) {
        this.historyID = historyID;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the subjectID
     */
    public String getSubjectID() {
        return subjectID;
    }

    /**
     * @param subjectID the subjectID to set
     */
    public void setSubjectID(String subjectID) {
        this.subjectID = subjectID;
    }

    /**
     * @return the correctAnswerID
     */
    public String getCorrectAnswerID() {
        return correctAnswerID;
    }

    /**
     * @param correctAnswerID the correctAnswerID to set
     */
    public void setCorrectAnswerID(String correctAnswerID) {
        this.correctAnswerID = correctAnswerID;
    }

    /**
     * @return the quizTime
     */
    public String getQuizTime() {
        return quizTime;
    }

    /**
     * @param quizTime the quizTime to set
     */
    public void setQuizTime(String quizTime) {
        this.quizTime = quizTime;
    }

    /**
     * @return the grade
     */
    public String getGrade() {
        return grade;
    }

    /**
     * @param grade the grade to set
     */
    public void setGrade(String grade) {
        this.grade = grade;
    }
    
    
    
}
