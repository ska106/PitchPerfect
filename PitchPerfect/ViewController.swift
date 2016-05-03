//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Sudeep Agrawal on 5/2/16.
//  Copyright © 2016 Agrawal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(sender: AnyObject)
    {
        print("Record buttons was pressed");
        recordingLabel.text="Recoding in Progress !!";
    }

    @IBAction func stopRecording(sender: AnyObject)
    {
        print("Stop Recording button was pressed");
    }
}

