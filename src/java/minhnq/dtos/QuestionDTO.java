/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhnq.dtos;

import java.util.Date;

/**
 *
 * @author Ticket 1
 */
public class QuestionDTO {
    private String questionID;
    private String questionContent;
    private Date createDate;
    private boolean status;
    private String subject;
    private String email;
    
    private String studentAnswer; 
    

    public QuestionDTO() {
    }

    public QuestionDTO(String questionID, String questionContent, Date createDate, boolean status, String subject, String email) {
        this.questionID = questionID;
        this.questionContent = questionContent;
        this.createDate = createDate;
        this.status = status;
        this.subject = subject;
        this.email = email;
    }

    /**
     * @return the questionID
     */
    public String getQuestionID() {
        return questionID;
    }

    /**
     * @param questionID the questionID to set
     */
    public void setQuestionID(String questionID) {
        this.questionID = questionID;
    }

    /**
     * @return the questionContent
     */
    public String getQuestionContent() {
        return questionContent;
    }

    /**
     * @param questionContent the questionContent to set
     */
    public void setQuestionContent(String questionContent) {
        this.questionContent = questionContent;
    }

    /**
     * @return the createDate
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * @param createDate the createDate to set
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * @return the status
     */
    public boolean isStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(boolean status) {
        this.status = status;
    }

    /**
     * @return the subject
     */
    public String getSubject() {
        return subject;
    }

    /**
     * @param subject the subject to set
     */
    public void setSubject(String subject) {
        this.subject = subject;
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
     * @return the studentAnswer
     */
    public String getStudentAnswer() {
        return studentAnswer;
    }

    /**
     * @param studentAnswer the studentAnswer to set
     */
    public void setStudentAnswer(String studentAnswer) {
        this.studentAnswer = studentAnswer;
    }
    
    
}
