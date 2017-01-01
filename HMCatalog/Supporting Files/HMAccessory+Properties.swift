//
//  HMAccessory+Properties.swift
//  FixHomeKitNames
//
//  Created by Peter Sun on 2017/1/1.
//  Copyright © 2017年 Apple, Inc. All rights reserved.
//

import HomeKit

extension HMAccessory {
    var siriName: String {
        return siriService.name
    }
    
    var siriService: HMService {
        var allServices = self.services.sortByLocalizedName()
        
        // We are configured to only show control services, filter the array.
        allServices = allServices.filter { service -> Bool in
            return service.isControlType
        }
        
        return allServices.first!
    }
    
    public func updateSiriName(name: String, completionHandler completion: (NSError?) -> Void) {
        siriService.updateName(name, completionHandler: completion)
    }
}
