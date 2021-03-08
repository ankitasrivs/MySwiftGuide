//
//  Constant.swift
//  MVC
//
//  Created by Ankita Srivastava on 08/03/21.
//

import Foundation
//MARK:Struct containing constants relate to application
public struct Constant{
//Place holder for view
static let namePlaceholder = "Please enter your name"
//Password for view
static let passwordPlaceholder = "Please enter your password"
//Alert view
static let alert  = "Alert"
//Regex
static let nameRegex = "(?<! )[-a-zA-Z]{2,26}"
static let passwordRegex = "^[0-9]+$"
static let validCred = "Credentials are valid"
static let invalidCredentials = "Credentials are invalid.Check if any field is empty or not"
}
