//
//  Character.swift
//  pgroop-assignment
//
//  Created by Diaz Orona, Jesus A. on 3/30/16.
//  Copyright © 2016 Diaz Orona, Jesus A. All rights reserved.
//

import Foundation

class Character {
    private var _name:String = "Name"
    private var _hp: Int = 100
    private var _attackPwr:Int = 20
    
    var name:String{
        get{
            return _name
        }
    }
    
    var hp:Int{
        return _hp
    }
    
    var attackPwr:Int{
        return _attackPwr
    }
    
    var isAlive:Bool{
        if _hp >= 0 {
            return true
        } else {
            return false
        }
    }
    
    init(name:String, hp:Int, attackPwr:Int){
        _name = name
        _hp = hp
        _attackPwr = attackPwr
    }
    
    func attemptAttack(attackPwr:Int) -> Bool{
        _hp -= attackPwr
        return true
    }
    
}