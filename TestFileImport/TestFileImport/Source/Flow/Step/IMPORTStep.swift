//
//  IMPORTStep.swift
//  TestFileImport
//
//  Created by 박준하 on 2023/02/03.
//

import Foundation
import RxFlow

enum IMPORTStep: Step {
    
    case loginIsRequired
    case homeIsRequired
    case signupIsRequired
}
