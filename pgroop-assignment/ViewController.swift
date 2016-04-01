//
//  ViewController.swift
//  pgroop-assignment
//
//  Created by Diaz Orona, Jesus A. on 3/30/16.
//  Copyright © 2016 Diaz Orona, Jesus A. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var attackPlayerButton: UIButton!
    @IBOutlet weak var attackEnemyButton: UIButton!
    @IBOutlet weak var hpPlayerLbl: UILabel!
    @IBOutlet weak var hpEnemyLbl: UILabel!
    @IBOutlet weak var messagesLbl: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var restartLbl: UILabel!
    var player:Character!
    var enemy:Character!
    var timmer:NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareGame()
    }
    
    func prepareGame(){
        player = Character(name: "player1", hp: 100, attackPwr: 15)
        enemy = Character(name: "Enemy", hp: 100, attackPwr: 13)
        hpPlayerLbl.text = "\(player.hp)"
        hpEnemyLbl.text = "\(enemy.hp)"
        messagesLbl.text = "Let's fight"
        restartButton.hidden = true
        restartLbl.hidden = true
        attackEnemyButton.enabled = true
        attackPlayerButton.enabled = true
    }
    @IBAction func restartGame(sender: UIButton) {
        prepareGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func attackButtonPressed(sender: UIButton) {

        sender.enabled = false
        timmer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: Selector("disableAttackButtons:"), userInfo: sender, repeats: false)

        if sender.tag == 1 {
            print("attack enemy")
            if enemy.attemptAttack(player.attackPwr){
                hpEnemyLbl.text = "\(enemy.hp) HP"
                messagesLbl.text = "\(player.name) attacked \(enemy.name) with \(player.attackPwr)"
            }
            if !enemy.isAlive {
                messagesLbl.text = "\(player.name) WON".uppercaseString
                hpEnemyLbl.text = ""
                gameEnded()
            }

            
        } else if sender.tag == 2 {
            print("attack player")
            if player.attemptAttack(enemy.attackPwr) {
                hpPlayerLbl.text = "\(player.hp) HP"
                messagesLbl.text = "\(enemy.name) attacked \(player.name) with \(enemy.attackPwr)"
            }
            
            if !player.isAlive {
                messagesLbl.text = "\(enemy.name) WON".uppercaseString
                hpPlayerLbl.text = ""
                gameEnded()
            }
        }
    }
    
    func gameEnded(){
        timmer.invalidate()
        restartButton.hidden = false
        restartLbl.hidden = false
        attackEnemyButton.enabled = false
        attackPlayerButton.enabled = false

    }
    
    func disableAttackButtons(val : NSTimer?) {
        
        if let sender:UIButton = (val?.userInfo)! as? UIButton {
            print(sender.tag)
            
            if sender.enabled == false {
                sender.enabled = true
            }else{
                sender.enabled = false
            }
        }
    }
    
}

