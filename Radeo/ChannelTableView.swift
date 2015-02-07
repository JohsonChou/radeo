//
//  ChannelTableView.swift
//  Radeo
//
//  Created by Johnson Zhou on 2/7/15.
//  Copyright (c) 2015 Johnson Zhou. All rights reserved.
//

import UIKit

class ChannelTableView: UITableViewController {

    required init(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    var channelPacks:NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channelPacks.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:ChannelCell = tableView.dequeueReusableCellWithIdentifier("channelCell", forIndexPath: indexPath) as ChannelCell
        return cell
    }
    
    
    
}