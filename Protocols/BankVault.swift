//
//  BankVault.swift
//  Protocols
//
//  Created by Papa Roach on 8/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//
protocol ProvideAccess {
  
  func allowEntryWithPassword(_ password: [Int]) -> Bool
}

class BankVault {
  
  let name: String
  let address: String
  var amount: Double = 0.0
  
  init(name: String, address: String) {
    self.name = name
    self.address = address
  }
}

extension BankVault: ProvideAccess {
  
  func allowEntryWithPassword(_ password: [Int]) -> Bool {
    guard !password.isEmpty else { return false }
    guard password.count <= 10 else { return false }
    
    // Every other digit needs to be even
    for (index, digit) in password.enumerated() {
      switch index {
      case 0, 2, 4, 6, 8, 10:
        if (digit % 2 != 0) {
          return false
        }
      default:
        break
      }
    }
    return true
  }
}





