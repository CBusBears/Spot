//
//  Profile.swift
//  Spot
//
//  Created by Benjamin Hobson on 5/4/17.
//  Copyright © 2017 Benjamin Hobson. All rights reserved.
//

import UIKit

class Profile: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHeader(color: "#00a5ff", textColor: "ffffff", font: UIFont(name: "Futura", size: 25)!, title: "Profile")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setHeader(color: String, textColor: String, font: UIFont, title: String){
        navigationController?.navigationBar.barTintColor = hexStringToUIColor(hex: color)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: hexStringToUIColor(hex: textColor), NSFontAttributeName: font]
        self.title = title
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: CGFloat(1.0))
        
    }
    
}
