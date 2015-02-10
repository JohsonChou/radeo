//
//  AddChannelViewController.swift
//  Radeo
//
//  Created by Johnson Zhou on 2/10/15.
//  Copyright (c) 2015 Johnson Zhou. All rights reserved.
//

import UIKit
import CoreData

class AddChannelViewController: UIViewController {

    @IBAction func dismissAdd(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var callSign: UITextField!
    @IBOutlet weak var channelID: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // hiding the keyboard if touching elsewhere
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        let touch = event.allTouches()?.anyObject() as UITouch
        if (callSign.isFirstResponder())&&(touch.view != callSign) {                // if not touching callSign, resign
            callSign.resignFirstResponder()
        } else if (channelID.isFirstResponder())&&(touch.view != channelID) {       // if not touching channelID resgin
            channelID.resignFirstResponder()
        }
        super.touchesBegan(touches, withEvent: event)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //saving to CoreData
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton == sender as? UIBarButtonItem {
            return
        }
        if (channelID.text.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) == 8)&&(callSign.text.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) > 0) {  //check if it is okay... adding alert view later
            
            let appDelegate = AppDelegate()
            let newItem = NSEntityDescription.insertNewObjectForEntityForName("ChannelPack", inManagedObjectContext: appDelegate.managedObjectContext!) as ChannelPack
            newItem.callSign = callSign.text
            newItem.channelID = channelID.text
            var error : NSError?
            if(appDelegate.managedObjectContext!.save(&error)) {
                println(error?.localizedDescription)
            }
        }
        
    }

}
