//
//  AppDelegate.swift
//  Work_with_Siri
//
//  Created by Maksim on 02.02.2021.
//

import UIKit
import Intents

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
//    func application(_ application: UIApplication, willContinueUserActivityWithType userActivityType: String) -> Bool {
//
//        guard let intent = userActivity?.interaction?.intent as? INStartWorkoutIntent else {
//            print("AppDelegate: start workout intense - false")
//            return false
//        }
//
//        DataService.instance.startWorkoutIntent = intent
//
//        NotificationCenter.default.post(name: NSNotification.Name("workoutStartedNotification"), object: nil)
//
//        print("APPDelegate: Start Workout Intent - true")
//        print(intent)
//        return true
//    }
    
    private func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
            guard let intent = userActivity.interaction?.intent as? INStartWorkoutIntent else {
                print("AppDelegate: Start Workout Intent – FALSE")
                return false
            }
            
            DataService.instance.startWorkoutIntent = intent
            
            NotificationCenter.default.post(name: NSNotification.Name("workoutStartedNotification"), object: nil)
                    
            print("AppDelegate: Start Workout Intent – TRUE")
            print(intent)
            return true
        }
    
}

