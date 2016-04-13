//
//  ViewController.swift
//  tapper
//
//  Created by Ajmal Ahmady on 4/13/16.
//  Copyright © 2016 FrontierGroup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Properties
    var maxTaps: Int = 0
    var currentTaps: Int = 0
    
    //Outlets
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var tapsLbl: UILabel!
    
    //Actions
    @IBAction func onPlayBtnPressed(sender: UIButton!) {
            if howManyTapsTxt.text != nil && howManyTapsTxt.text != "" {
                logoImg.hidden = true
                playBtn.hidden = true
                howManyTapsTxt.hidden = true
                tapButton.hidden = false
                tapsLbl.hidden = false
                
                maxTaps = Int(howManyTapsTxt.text!)!
                currentTaps = 0
                updateTapsLbl()
        }
    }
    
    @IBAction func onCoinTapped(sender: UIButton!) {
        currentTaps = currentTaps + 1
        updateTapsLbl()
        if isGameOver() {
            restartGame()
        }
    }
    
    func updateTapsLbl() {
        tapsLbl.text = "\(currentTaps) Taps"
    }
    
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps {
            return true
        } else {
            return false
        }
    }
    
    func restartGame() {
        maxTaps = 0
        howManyTapsTxt.text = ""
        logoImg.hidden = false
        playBtn.hidden = false
        howManyTapsTxt.hidden = false
        tapButton.hidden = true
        tapsLbl.hidden = true
    }
    
    //This function makes the keyboard disappear when anywhere outside of the keyboard is clicked
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}