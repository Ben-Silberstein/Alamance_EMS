//
//  ViewController.swift
//  Alamance EMS PocketGuide
//
//  Created by Ryan Rudinger, Ben Silberstein on 11/27/17.
//  Copyright © 2017 Ryan Rudinger, Ben Silberstein. All rights reserved.
//

import UIKit
import PDFKit

class ViewController: UIViewController {

    let medsAndSkillsTitle = "Medications and Skills"
    let policiesTitle = "Policies"
    let proceduresTitle = "Procedures"
    let qualificationsForMedDirectorsTitle = "Qualifications for Medical Directors"
    let appendicesTitle = "Appendices"
    let appVersion = "1.0.0"
    
    @IBOutlet weak var medsAndSkillsButton: UIButton!
    @IBOutlet weak var policiesButton: UIButton!
    @IBOutlet weak var proceduresButton: UIButton!
    @IBOutlet weak var qualificationsButton: UIButton!
    @IBOutlet weak var appendicesButton: UIButton!
    @IBOutlet weak var versionLabel: UILabel!
    
    
    var buttons: [UIButton] = []
    var titles: [String] = []
    
    @IBAction func clickedSomeCategory(_ sender: UIButton) {
        
    var which = -1
        for i in 0..<buttons.count {
            if buttons[i] == sender {
            which = i
            }
        }

        if let url = Bundle.main.url(forResource: titles[which], withExtension: "pdf", subdirectory: "EMS PDF Files") {
        
            let webView = UIWebView(frame: self.view.frame)
            let urlReq = URLRequest(url: url)
            webView.loadRequest(urlReq as URLRequest)
            webView.scalesPageToFit = true
            let pdfVC = UIViewController()
            pdfVC.view.addSubview(webView)
            pdfVC.title = titles[which]
            self.navigationController?.pushViewController(pdfVC, animated: true)
            }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        versionLabel.text = "Version \(appVersion)"
        buttons = [medsAndSkillsButton, policiesButton, proceduresButton, qualificationsButton]
        titles = [medsAndSkillsTitle, policiesTitle, proceduresTitle, qualificationsForMedDirectorsTitle]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AppendicesSegue"{
            let button = sender as! UIButton
            let pfVC = segue.destination as! ProtocolFolderViewController
            pfVC.folderName = button.currentTitle!
            }
    }
    
}

