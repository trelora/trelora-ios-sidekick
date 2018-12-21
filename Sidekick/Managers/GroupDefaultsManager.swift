//
//  GroupDefaultsManager.swift
//  Sidekick
//
//  Created by Rolly Sarmiento on 11/28/17.
//  Copyright © 2017 Rolly Sarmiento. All rights reserved.
//

import Foundation

class GroupDefaultsManager {
    
    static let shared = GroupDefaultsManager()
    
    let keyEnvironment: String = "keyEnvironment"
    let keyEnvironmentApiHost: String = "keyEnvironmentApiHost"
    let keyEnvironmentWebHost: String = "keyEnvironmentWebHost"
    let keyAllEnvironments: String = "keyAllEnvironments"
    
    lazy var environments: [Environment] = {
        return getAllEnvironments()
    }()
    
    private var preloadedEnvironments: [Environment] = {
        return [Environment(name: "Production", apiHost: "", webHost: ""),
                Environment(name: "Trylora", apiHost: "http://www.trylora.com/api", webHost: "http://www.trylora.com"),
                Environment(name: "Applelora", apiHost: "https://www.applelora.com/api", webHost: "https://www.applelora.com"),
                Environment(name: "Googlelora", apiHost: "http://www.googlelora.com/api", webHost: "http://www.googlelora.com"),
                Environment(name: "Localora", apiHost: "http://www.localora.com:3000/api", webHost: "http://localora:3000")]
    }()
    
    var groupDefaults: UserDefaults! = {
        return UserDefaults(suiteName: "group.com.trelora.environmentkeys")
    }()
    
    func getAPIHost() -> String {
        return groupDefaults.url(forKey: keyEnvironment)?.absoluteString ?? ""
    }
    
    func setEnvironment(withEnvironment environment: Environment) {
        let url = URL(string: environment.apiHost)
        groupDefaults.set(url, forKey: "keyEnvironment")
        groupDefaults.set(environment.apiHost, forKey: keyEnvironmentApiHost)
        groupDefaults.set(environment.webHost, forKey: keyEnvironmentWebHost)
    }
    
    func add(environment: Environment) {
        environments.append(environment)
        saveEnvironments()
    }
    
    func remove(environmentAtIndex index: Int) {
        environments.remove(at: index)
        saveEnvironments()
    }
    
    private func getAllEnvironments() -> [Environment] {
        guard let data = groupDefaults.object(forKey: keyAllEnvironments) as? Data else { return preloadedEnvironments }
        guard let array = NSKeyedUnarchiver.unarchiveObject(with: data) as? [Environment] else { return preloadedEnvironments }
        return array
    }
    
    private func saveEnvironments() {
        let data = NSKeyedArchiver.archivedData(withRootObject: environments)
        groupDefaults.set(data, forKey: keyAllEnvironments)
    }
    
}
