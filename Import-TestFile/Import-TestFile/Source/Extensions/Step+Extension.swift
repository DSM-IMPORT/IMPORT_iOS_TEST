//
//  Step+Extension.swift
//  Import-TestFile
//
//  Created by 박준하 on 2023/02/03.
//

import RxFlow

extension Step {
    var asIMPORTStep: IMPORTStep? {
        return self as? IMPORTStep
    }
}
