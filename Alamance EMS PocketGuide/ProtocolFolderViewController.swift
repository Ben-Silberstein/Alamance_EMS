//
//  ProtocolFolderViewController.swift
//  Alamance EMS PocketGuide
//
//  Created by Ryan Rudinger, Ben Silberstein on 12/6/17.
//  Copyright © 2017 Ryan Rudinger, Ben Silberstein. All rights reserved.
//

import Foundation
import UIKit

class ProtocolFolderViewController: UIViewController {
    
    var folderName = ""
    var filePaths: [String] = []
    var fileNames: [String] = []
    var buttonList: [UIButton] = []
    var directoryPath: String = ""
    let appendicesTitle = "Appendices"
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = self.view.frame.size
        
        if folderName == appendicesTitle {
            directoryPath = "EMS PDF Files/Appendices"
        } else {
            directoryPath = "EMS PDF Files/Protocols/\(folderName)"
        }
        getFilePathsInDirectory(folderPath: directoryPath)
        getFileTitles()
        trimNames()
        createButtons()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func printNames() {
        
        for i in 0..<filePaths.count {
            print(filePaths[i])
        }
    }
    func createButtons() {
        
        var yPos = 1
        let spacing = 10
        let buttonHeight = 38
        let buttonWidth = scrollView.frame.width
       
        for i in 0..<filePaths.count {
            
            let button: UIButton = UIButton(frame: CGRect(x: 0, y: yPos, width: Int(buttonWidth * 1.2), height: buttonHeight))
            button.backgroundColor = UIColor.lightGray
            let actualName = (fileNames[i] as NSString).lastPathComponent
            button.setTitle(actualName, for: .normal)
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            scrollView.addSubview(button)
            button.titleLabel?.numberOfLines = 2
            
            yPos += buttonHeight + spacing
            buttonList.append(button)
            
        }
    }
    
    @objc func buttonAction(sender: UIButton!) {
      
        var numButton = 0
        for i in 0..<filePaths.count {
            if sender == buttonList[i] {
                numButton = i
            }
        }
        let pdf = URL(fileURLWithPath: filePaths[numButton])
        let req = NSURLRequest(url: pdf)
        let webView = UIWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        webView.loadRequest(req as URLRequest)
        self.view.addSubview(webView)
        
}
    func getFileTitles(){
        for i in 0..<filePaths.count {
            let actualName = (filePaths[i] as NSString).lastPathComponent
            fileNames.append(actualName)
        }
    }
    func getFilePathsInDirectory(folderPath: String) {
        filePaths = Bundle.main.paths(forResourcesOfType: nil, inDirectory: folderPath)
        filePaths.sort {$0.compare($1, options: .numeric) == .orderedAscending }
        
    }
    func trimNames() {
        for i in 0..<fileNames.count {
       
            let str = fileNames[i]
           
            if let range = str.range(of: "Final") {
                let substring = str[..<range.lowerBound]
                fileNames[i] = String(substring)
            }
        }
    }
}
