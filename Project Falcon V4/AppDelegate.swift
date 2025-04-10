//
//  AppDelegate.swift
//  Project Falcon V4
//
//  Created by Frank Ratmiroff on 8/30/24.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

<<<<<<< Updated upstream

    
=======
    var window: UIWindow?
>>>>>>> Stashed changes

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Display loading screen while initializing app
        showLoadingScreen()
        
        // Perform other initialization tasks here
        simulateLoading()

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Return the default scene configuration
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    // MARK: - Loading Screen

    private func showLoadingScreen() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let loadingVC = LoadingViewController()
        window?.rootViewController = loadingVC
        window?.makeKeyAndVisible()
    }

    private func simulateLoading() {
        DispatchQueue.global().async {
            // Simulate loading delay
            sleep(3)

            DispatchQueue.main.async {
                self.transitionToMainApp()
            }
        }
    }

    private func transitionToMainApp() {
        // Replace with your main view controller
        let mainVC = LabelController() // Adjust to your main app's entry point
        let navController = UINavigationController(rootViewController: mainVC)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }

    // MARK: - Core Data Stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Project_Falcon_V4")
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                // Handle the error appropriately
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    // MARK: - Core Data Saving Support

    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
