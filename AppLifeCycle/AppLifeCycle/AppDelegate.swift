//
//  AppDelegate.swift
//  AppLifeCycle
//
//  Created by lee on 2018. 1. 3..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        //앱을 실행할 때 최초로 실행할 코드를 작성하면 좋습니다.
        print("willFinishLaunchingWithOptions")
        return true
    }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //앱의 화면이 사용자에게 보여지기 직전에 최종 초기화 작업을 진행할 수 있습니다.
        print("didFinishLaunchingWithOptions")
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        print("applicationWillResignActive")
        //앱이 Foreground에서 다른 상태로 전환이 될것임을 알려줍니다. 앱이 조용한(quiescent) 상태로 변환되는 작업을 여기서 진행하세요.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        print("applicationDidEnterBackground")
        //앱이 Background에서 돌아가게 될 것임을 알려줍니다. 그리고 언제든지 Suspended상태로 변환이 될 수 있습니다.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
         print("applicationWillEnterForeground")
        //앱이 Background에서 다시 Foreground로 돌아오게 될 것임을 알려줍니다. 하지만 아직 앱이 Active상태는 아닙니다
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        print("applicationDidBecomeActive")
        //앱이 이제 Foreground로 갈 것이라고 알려줍니다. 최종 준비작업을 하세요.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        print("applicationWillTerminate")
        //앱이 종료될 것임을 알려줍니다. 만약 앱이 Suspended상태라면 이 메소드는 호출되지 않습니다.
    }


}

