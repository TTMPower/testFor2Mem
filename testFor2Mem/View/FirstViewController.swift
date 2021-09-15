//
//  ViewController.swift
//  testFor2Mem
//
//  Created by Владислав Вишняков on 14.09.2021.
//

import UIKit


class FirstViewController: UIViewController, UITextFieldDelegate {
    
    var network = Network.task
    
    @IBOutlet weak var findTextfield: UITextField!
    @IBAction func pressButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondViewController = storyboard.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else { return }
        network.getJsonData(findkey: findTextfield.text!, complition: { [weak self] results in
            let newArray = self!.network.filter(array: results.results!)
            secondViewController.imageURLs = newArray
        })
        show(secondViewController, sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        findTextfield.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return (string.containsValidCharacter)
    }
    
}

extension String {
    
    var containsValidCharacter: Bool {
        guard self != "" else { return true }
        let hexSet = CharacterSet(charactersIn: "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM")
        let newSet = CharacterSet(charactersIn: self)
        return hexSet.isSuperset(of: newSet)
        
    }
}

