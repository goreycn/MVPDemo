//
//  ViewController.swift
//  MVPDemo
//
//  Created by Gorey on 2017/6/23.
//  Copyright © 2017年 GG. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GreetingView {

    @IBOutlet weak var lbTitle: UILabel!
    
    @IBAction func onClick(_ sender: Any) {
        self.presenter?.showGreeting()
    }
    
    var presenter: GreetingPresenter? = nil
    var model : Person? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
   
        model = Person(firstName: "Grubby", lastName: "Gao")
        presenter = GreetingPresenter(view: self, person: self.model!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setGreeting(greeting: String) {
        self.lbTitle.text = greeting
    }

}

