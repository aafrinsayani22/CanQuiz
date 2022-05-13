//
//  ViewController.swift
//  QuestionAndAnswerUsingClasses
//
//  Created by user203175 on 8/22/21.
//

import UIKit

class ViewController: UIViewController {

    var questions : Array<Question> = []
    var questionIndex : Int = -1
    var score : Int = 0

    
    @IBOutlet weak var lblQuestion: UILabel!
    
    @IBOutlet weak var lblAnswerExtraInfo: UILabel!
    
    @IBOutlet weak var lblQuestionNumber: UILabel!
        
    @IBOutlet weak var lblScore: UILabel!
    
    @IBOutlet weak var btnNextQuestion: UIButton!
    
    @IBOutlet weak var btnTrue: UIButton!
    
    @IBOutlet weak var btnFalse: UIButton!
    
    @IBAction func btnTrue(_ sender: Any) {
        checkAnswer( answer : true )
    }
    
    @IBAction func btnFalse(_ sender: Any) {
        checkAnswer( answer : false )
    }
    
    @IBAction func btnNextQueston(_ sender: Any) {
        
//       if (questionIndex >= questions.count)
        if(questionIndex == 0)
        {

        }
        nextQuestion()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(questionIndex == 0)
        {

        }
    }
    
    
    @IBAction func btnAllQuestions(_ sender: Any) {
//        questions = Provider.loadQuestions()
//
//        performSegue(withIdentifier: "toQuestionsViewController", sender: nil)

        
    }
    

    
    func customizeTheme(){
        
        let cornerRadius : CGFloat = 10
        
        btnTrue.layer.cornerRadius = cornerRadius
        btnFalse.layer.cornerRadius = cornerRadius
        btnNextQuestion.layer.cornerRadius = cornerRadius
        
        lblAnswerExtraInfo.layer.masksToBounds = true
        lblAnswerExtraInfo.layer.cornerRadius = cornerRadius
    }

    
    func resetView(){
        lblAnswerExtraInfo.isHidden = true
        btnNextQuestion.isHidden = true
        btnTrue.isHidden = false
        btnFalse.isHidden = false
    }
    
    func nextQuestion(){
        
        resetView()
        
        questionIndex += 1
        if questionIndex >= questions.count {
            // restarting
            questionIndex = 0
            score = 0
        }

        lblScore.text = "Score : \(score)"

        lblQuestionNumber.text = "Question \(questionIndex + 1) of \(questions.count)"
        
        lblQuestion.text = questions[questionIndex].question + "?"
        
    }
    
    func checkAnswer( answer : Bool ) {
        
        if !lblAnswerExtraInfo.isHidden {
            // user is answering after the answer is presented - don't count!
            return
        }
        
        // adding right answer to score
        answer == questions[questionIndex].answer ? score += 1 : nil
      
        lblAnswerExtraInfo.text =  "This is " + String(questions[questionIndex].answer).uppercased() + ".\n\n" + questions[questionIndex].answerExtraInfo
        
        lblAnswerExtraInfo.isHidden = false
        
        if questions[questionIndex].answer == true {
            btnFalse.isHidden = true
        } else {
            btnTrue.isHidden = true
        }
    
        btnNextQuestion.isHidden = false
        
        lblScore.text = "Score : \(score)"

       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        customizeTheme()
        
        questions = Provider.loadQuestions()
        
        nextQuestion()
        
        
        
    }


}

