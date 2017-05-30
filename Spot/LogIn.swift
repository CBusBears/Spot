//
//  LogIn.swift
//  Spot
//
//  Created by Benjamin Hobson on 5/5/17.
//  Copyright © 2017 Benjamin Hobson. All rights reserved.
//

import UIKit
import Firebase

class LogIn: UIViewController {
    
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var login: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addbackgroundImage(image: UIImage(named: "Background8")!)
        
        //let color = hexStringToUIColor(hex: "#11BE3E")
        
        email.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
        password.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
        
        login.layer.cornerRadius = 5.0
        login.clipsToBounds = true
        email.borderStyle = UITextBorderStyle.roundedRect
        password.borderStyle = UITextBorderStyle.roundedRect
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addbackgroundImage(image: UIImage) {
        let background = image
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
    }
    
    @IBAction func login(_ sender: Any) {
        
        if (email.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" &&
            password.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" &&
            (password.text?.trimmingCharacters(in: .whitespacesAndNewlines).characters.count)! >= 6){
        
            Auth.auth().signIn(withEmail: email.text!, password: password.text!) {
            (user, error) in
            
                if error == nil {
                    self.performSegue(withIdentifier: "toRootFromFirst", sender: self)
                    //
                    UserDefaults.standard.set(self.email.text?.trimmingCharacters(in: .whitespacesAndNewlines), forKey: "Email")
                    UserDefaults.standard.set(self.password.text?.trimmingCharacters(in: .whitespacesAndNewlines), forKey: "Password")
                    //
                } else {
                    let alert = UIAlertController(title: "Oops", message:
                        "We could not find an account with these credentials.", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        else {
            let alert = UIAlertController(title: "Oops", message:
                "Make sure all the fields are filled. Your password must meet six characters.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func openSignup(_ sender: Any) {
        self.performSegue(withIdentifier: "toSignUp", sender: self)
    }
}
