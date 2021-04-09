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
public class AnswerDTO {
    private String answerID;
    private String answerContent;
    private boolean status;
    private String questionID;

    public AnswerDTO() {
    }

    public AnswerDTO(String answerID, String answerContent, boolean status, String questionID) {
        this.answerID = answerID;
        this.answerContent = answerContent;
        this.status = status;
        this.questionID = questionID;
    }

    /**
     * @return the answerID
     */
    public String getAnswerID() {
        return answerID;
    }

    /**
     * @param answerID the answerID to set
     */
    public void setAnswerID(String answerID) {
        this.answerID = answerID;
    }

    /**
     * @return the answerContent
     */
    public String getAnswerContent() {
        return answerContent;
    }

    /**
     * @param answerContent the answerContent to set
     */
    public void setAnswerContent(String answerContent) {
        this.answerContent = answerContent;
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
    
    
    
}
