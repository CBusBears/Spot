//
//  SignUp.swift
//  Spot
//
//  Created by Benjamin Hobson on 5/4/17.
//  Copyright © 2017 Benjamin Hobson. All rights reserved.
//

import UIKit
import Firebase

class SignUp: UIViewController {
    
    @IBOutlet var email: UITextField!
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var repassword: UITextField!
    @IBOutlet var signup: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addbackgroundImage(image: UIImage(named: "Background8")!)
        
        //let color = hexStringToUIColor(hex: "#11BE3E")
        
        email.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
        password.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
        username.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
        repassword.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
        
        signup.layer.cornerRadius = 5.0
        signup.clipsToBounds = true
        email.borderStyle = UITextBorderStyle.roundedRect
        password.borderStyle = UITextBorderStyle.roundedRect
        username.borderStyle = UITextBorderStyle.roundedRect
        repassword.borderStyle = UITextBorderStyle.roundedRect
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
    @IBAction func openLogin(_ sender: Any) {
        self.performSegue(withIdentifier: "toLoginFromSignup", sender: self)
    }
    
}
