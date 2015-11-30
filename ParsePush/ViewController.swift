//
//  ViewController.swift
//  ParsePush
//
//  Created by Tanmay Bakshi on 2015-11-26.
//  Copyright © 2015 Tanmay Bakshi. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var currentInstallation: PFInstallation = PFInstallation.currentInstallation()
        currentInstallation.addUniqueObject("testchannel", forKey: "channels")
        try! currentInstallation.save()
    }
    
    override func viewDidAppear(animated: Bool) {
        if self.view.frame.height < 736.0 && self.view.tag == 0 {
            self.performSegueWithIdentifier("to6", sender: self)
        }
    }
    
    @IBAction func sendMessage() {
        try! PFPush.sendPushMessageToChannel("testchannel", withMessage: "Hello iOS Programming")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}