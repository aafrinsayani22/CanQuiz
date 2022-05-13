//
//  AboutViewController.swift
//  QuestionAndAnswerUsingClasses
//
//  Created by Aafrin Sayani on 2022-04-13.
//

import UIKit

class AboutViewController: UIViewController {
    
    public var About: String = "Canada is a country in North America. Its ten provinces and three territories extend from the Atlantic Ocean to the Pacific Ocean and northward into the Arctic Ocean, covering 9.98 million square kilometres, making it the world's second-largest country by total area.";
    @IBOutlet weak var lblAbout: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        lblAbout.text = About
      
    }
    



}
