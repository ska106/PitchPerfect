//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Sudeep Agrawal on 5/2/16.
//  Copyright © 2016 Agrawal. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate
{
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!

    var audioRecorder: AVAudioRecorder!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        stopRecordingButton.enabled = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func recordAudio(sender: AnyObject)
    {
        print("Record button was pressed")
        recordingLabel.text="Recoding in Progress !!"
        stopRecordingButton.enabled = true
        recordButton.enabled = false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath,recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print (filePath)
        
        //Initiate the Audio Session
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(URL:filePath!, settings: [:])
        
        //Set the delegate of Audio Recorder to self.
        audioRecorder.delegate = self
        
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }

    @IBAction func stopRecording(sender: AnyObject)
    {
        recordingLabel.text="Tap to Record"
        stopRecordingButton.enabled = false
        recordButton.enabled = true
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool)
    {
        print("AVAudio Recorder finished saving the recording.")
        if (flag)
        {
            performSegueWithIdentifier("stopRecording", sender: audioRecorder.url)
        }
        else
        {
            print("Saving of recording failed.")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if(segue.identifier == "stopRecording")
        {
            let playSoundsVC = segue.destinationViewController as! PlaySoundsViewController
            let recordedAudioURL = sender as! NSURL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }
}
