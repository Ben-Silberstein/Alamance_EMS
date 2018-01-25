//
//  Protocol.swift
//  Alamance EMS PocketGuide
//
//  Created by Ryan Rudinger on 12/4/17.
//  Copyright © 2017 Ryan Rudinger. All rights reserved.
//

import Foundation
import PDFKit

class Protocol {
    
    private let name: String
    private var url: URL?
    
    init(titleOfDocument name: String, directoryInWhichProtocolIsStored directory: URL) {
      self.name = name
      self.url = nil
    }
    
    
    
}
