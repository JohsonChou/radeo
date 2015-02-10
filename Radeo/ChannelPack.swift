//
//  ChannelPack.swift
//  Radeo
//
//  Created by Johnson Zhou on 2/10/15.
//  Copyright (c) 2015 Johnson Zhou. All rights reserved.
//

import Foundation
import CoreData

class ChannelPack: NSManagedObject {

    @NSManaged var callSign: String
    @NSManaged var channelID: String

}
