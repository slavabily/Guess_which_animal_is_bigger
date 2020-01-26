//
//  Coordinator.swift
//  ProjectsOnGit
//
//  Created by slava bily on 15/1/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    var children: [Coordinator] { get set }
    
    func start()
}
