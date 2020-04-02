//
//  ViewController.swift
//  Guided Project - Light
//
//  Created by Pavel Mamkichev on 02.04.2020.
//  Copyright © 2020 Павел Мамкичев. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {

    var isLightOn = true
    
    func updateView(){
        let device = AVCaptureDevice.default(for: AVMediaType.video)
        if let dev = device, dev.hasTorch {
            view.backgroundColor = .black
            do {
                try dev.lockForConfiguration()
                dev.torchMode = isLightOn ? .on : .off
                dev.unlockForConfiguration()
            } catch {
                print(error)
            }
               } else {
            view.backgroundColor = isLightOn ? .white : .black
        }
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        isLightOn = !isLightOn
        updateView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

}

