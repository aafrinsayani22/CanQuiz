//
//  QuestionTableViewCell.swift
//  QuestionAndAnswerUsingClasses
//
//  Created by Aafrin Sayani on 2022-04-07.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblAnswer: UILabel!
 
    @IBOutlet weak var lblImage: UIImageView!
    @IBOutlet weak var lblQuestion: UILabel!
    static let identifier = "QuestionTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // Load the XIB file inside our tableView
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
//    
//    public func setContent(question : Question)
//    {
//        lblQuestion.text = question
//        lblImage.image = UIImage(systemName: imageName)
//        lblAnswer.text = answer
//
//    }
    
    public func setContent(question: String, imageName: String, answer : String)
    {
        lblQuestion.text = question
        lblImage.image = UIImage(systemName: imageName)
        lblAnswer.text = answer

    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
