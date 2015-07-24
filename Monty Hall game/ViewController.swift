//
//  ViewController.swift
//  Monty Hall game
//
//  Created by MBPRO on 6/27/15.
//  Copyright (c) 2015 MBPRO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model = montyModel()
    var firstTime = true
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet var doors: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func doorSelected(sender: UIButton) {
        if firstTime{
            firstTime = false
            model.firstDoorSelected(sender.tag)
            doors[model.goatIndex].setTitle("Goat", forState: UIControlState.Normal)
            lblMessage.text = model.msg
        }
        else{
            if model.finalOption(sender.tag){
                lblMessage.text = "Congratulations you have won!"
                doors[model.prizeIndex].setTitle("Car", forState: UIControlState.Normal)
            }
            else{
                lblMessage.text = "Wrong door :("
                doors[ 3 - model.goatIndex - model.prizeIndex].setTitle("Goat", forState: UIControlState.Normal)
            }
            
        }
        
    }

    @IBAction func btnReset(sender: UIButton) {
        model = montyModel()
        firstTime = true
        lblMessage.text = ""
        doors[2].setTitle("3", forState: UIControlState.Normal)
        doors[1].setTitle("2", forState: UIControlState.Normal)
        doors[0].setTitle("1", forState: UIControlState.Normal)

    }

}

