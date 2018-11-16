//
//  AppDelegate.swift
//  Keynes
//
//  Created by Loïc Carr on 16/11/2018.
//  Copyright © 2018 dimtion. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {


    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        if flag {
            return false
        } else {
            for window in sender.windows {
                window.makeKeyAndOrderFront(self)
            }
            return true
        }
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

