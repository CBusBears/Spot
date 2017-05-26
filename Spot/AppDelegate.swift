//
//  AppDelegate.swift
//  Spot
//
//  Created by Benjamin Hobson on 5/4/17.
//  Copyright © 2017 Benjamin Hobson. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var ref: FIRDatabaseReference!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FIRApp.configure()
        ref = FIRDatabase.database().reference()
        let (username, password, email) = retrieveLocalArchivedData()
        if username != "nil" && password != "nil" && email != "nil" {
            
            FIRAuth.auth()?.signIn(withEmail: username!, password: password!) {
                (user, error) in
                
                if error == nil {
                    
                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let initVC : UIViewController = storyboard.instantiateViewController(withIdentifier: "Map") as UIViewController
                    self.window = UIWindow(frame: UIScreen.main.bounds)
                    self.window?.rootViewController = initVC
                    self.window?.makeKeyAndVisible()
                    
                } else {
                    
                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let initVC : UIViewController = storyboard.instantiateViewController(withIdentifier: "SignUp") as UIViewController
                    self.window = UIWindow(frame: UIScreen.main.bounds)
                    self.window?.rootViewController = initVC
                    self.window?.makeKeyAndVisible()
                    
                    let alert = UIAlertController(title: "Oops", message:
                        "We could not find an account with these credentials.", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                    initVC.present(alert, animated: true, completion: nil)
                    
                }
                
            }
            
        } else {
            
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let initVC : UIViewController = storyboard.instantiateViewController(withIdentifier: "SignUp") as UIViewController
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = initVC
            self.window?.makeKeyAndVisible()
            
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func retrieveLocalArchivedData() -> (String?,String?,String?) {
        let userExist = isKeyPresentInUserDefaults(key: "Username")
        if userExist {
            return(
                UserDefaults.standard.string(forKey: "Username"),
                UserDefaults.standard.string(forKey: "Password"),
                UserDefaults.standard.string(forKey: "Email")
            )
        } else {
            return ("nil","nil","nil")
        }
    }
    
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }

}

