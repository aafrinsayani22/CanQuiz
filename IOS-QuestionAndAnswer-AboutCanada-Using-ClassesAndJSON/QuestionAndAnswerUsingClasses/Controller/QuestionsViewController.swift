//
//  QuestionsViewController.swift
//  QuestionAndAnswerUsingClasses
//
//  Created by Aafrin Sayani on 2022-04-07.
//

import UIKit

class QuestionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Provider.all = Provider.loadQuestions()
        
        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(QuestionTableViewCell.nib(), forCellReuseIdentifier: QuestionTableViewCell.identifier)


    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Provider.all.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let question = Provider.all[indexPath.row]
//        let question = Provider.all[indexPath.row]
 
        let cell = tableView.dequeueReusableCell(withIdentifier: QuestionTableViewCell.identifier, for: indexPath) as! QuestionTableViewCell
        
        if (question.answer  == false) {

            cell.setContent(question: question.question, imageName: "checkmark.square", answer: question.answerExtraInfo)

            return cell

        } else {
            

            cell.setContent(question: question.question, imageName: "xmark.rectangle", answer: question.answerExtraInfo)
            
            return cell
            
        }
      
}
}
