//
//  ProtocolViewController.swift
//  Alamance EMS PocketGuide
//
//  Created by Ryan Rudinger, Ben Silberstein on 12/6/17.
//  Copyright © 2017 Ryan Rudinger, Ben Silberstein. All rights reserved.
//

import Foundation
import UIKit

class ProtocolViewController: UIViewController {
    
    private var buttonName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let button = sender as! UIButton
        let pfVC = segue.destination as! ProtocolFolderViewController
        pfVC.folderName = button.currentTitle!
    }
   
    
    
    
}
