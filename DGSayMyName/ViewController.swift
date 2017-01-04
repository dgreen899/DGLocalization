//
//  ViewController.swift
//  DGSayMyName
//
//  Created by Dameon Green on 1/2/17.
//  Copyright © 2017 ApptasticVoyage. All rights reserved.
//

import UIKit
import ContactsUI

class ViewController: UIViewController, CNContactPickerDelegate {

    @IBOutlet weak var firstNameField: UITextField!
   
    @IBOutlet weak var lastNameField: UITextField!
    
    @IBAction func getContact(_ sender: Any) {
        let cn = CNContactStore()
        cn.requestAccess(for: CNEntityType.contacts) {
            (success:Bool, error:Error?) -> Void in
            DispatchQueue.main.async() {
                if (success == true) {
                    self.showPeoplePicker()
                }
                }
            }
        }
        
        
    @IBAction func sayContact(_ sender: Any) {
      var personName : String = "You have chosen "
        if let forename = firstNameField.text {
            personName += forename
        }
        
        personName += " "
        
        if let lastname = lastNameField.text {
            personName += lastname
        }
        
        TextToSpeech.SayText(input: personName)
      
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        firstNameField.text? = contact.givenName
        lastNameField.text? = contact.familyName
        
    }
    
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        print("cancelled")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func showPeoplePicker() {
        
        let picker: CNContactPickerViewController = CNContactPickerViewController()
        picker.delegate = self
        
        self.present(picker, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

