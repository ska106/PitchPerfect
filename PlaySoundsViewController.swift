//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Sudeep Agrawal on 5/8/16.
//  Copyright © 2016 Agrawal. All rights reserved.
//

import UIKit

class PlaySoundsViewController: UIViewController {

    @IBOutlet weak var snailButton:UIButton!;
    @IBOutlet weak var chipmunkButton:UIButton!;
    @IBOutlet weak var darthVaderButton:UIButton!;
    @IBOutlet weak var echoButton:UIButton!;
    @IBOutlet weak var rabbitButton:UIButton!;
    @IBOutlet weak var reverbButton:UIButton!;
    @IBOutlet weak var stopButton:UIButton!;
    
    var recordedAudioURL:NSURL!;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSoundForButton(sender: UIButton)
    {
        print("Play Sound Button Pressed.");
    }
    
    @IBAction func stopButtonPressed(sender: AnyObject)
    {
        print("Stop Audio Button Pressed.");
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}