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
public class QuestionAndAnswerDTO {
    private String questionContent;
    private String answerContent;

    public QuestionAndAnswerDTO() {
    }

    public QuestionAndAnswerDTO(String questionContent, String answerContent) {
        this.questionContent = questionContent;
        this.answerContent = answerContent;
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
    
    
}
