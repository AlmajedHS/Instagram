//
//  AppDelegate.swift
//  Instgram
//
//  Created by Hussain Almajed on 2/4/18.
//  Copyright © 2018 Hussain Almajed. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        Parse.initialize(
            with: ParseClientConfiguration(block: { (configuration: ParseMutableClientConfiguration) -> Void in
                configuration.applicationId = "Instgram"
                configuration.clientKey = "helloworldwelcometocs490"  // set to nil assuming you have not set clientKey
                configuration.server = "https://quiet-scrubland-28333.herokuapp.com/parse"
            })
        )
        if let currentUser = PFUser.current() {
            print("Welcome back \(currentUser.username!) 😀")

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
            window?.rootViewController = mainViewController
        }
        
        NotificationCenter.default.addObserver(forName: Notification.Name("didLogout"), object: nil, queue: OperationQueue.main) { (Notification) in
            
            print("Logout notification received")
            self.logOut()
            
        }
        NotificationCenter.default.addObserver(forName: Notification.Name("goMain"), object: nil, queue: OperationQueue.main) { (Notification) in
            
            print("goMain notification received")
            self.mainView()
            
        }
        NotificationCenter.default.addObserver(forName: Notification.Name("goPost"), object: nil, queue: OperationQueue.main) { (Notification) in
            
            print("goPost notification received")
            self.postView()
            
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
    
    func logOut() {
        // Logout the current user
        PFUser.logOutInBackground(block: { (error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Successful loggout")
                // Load and show the login view controller
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let loginViewController = storyboard.instantiateViewController(withIdentifier: "Login1ViewController")
                self.window?.rootViewController = loginViewController
            }
        })
    }
    
    func mainView(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
        self.window?.rootViewController = mainViewController
        
        
    }
    func postView(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let cameraViewController = storyboard.instantiateViewController(withIdentifier: "CameraViewController")
        self.window?.rootViewController = cameraViewController
    }


}

