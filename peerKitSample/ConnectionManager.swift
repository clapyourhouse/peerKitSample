//
//  ConnectionManager.swift
//  peerKitSample
//
//  Created by shogo.kitamura on 9/28/18.
//  Copyright © 2018 shogo.kitamura. All rights reserved.
//

import Foundation
import PeerKit
import MultipeerConnectivity

struct  ConnectionManager{
    //接続されている端末一覧
    static var peers: [MCPeerID] {
        return PeerKit.session?.connectedPeers as [MCPeerID]? ?? []
    }
    //接続の作成
    static func start() {
        PeerKit.transceive(serviceType: "com-jpsim-myApp")
    }
    //接続された
    static func onConnect(run: PeerBlock?) {
        PeerKit.onConnect = run
        print("接続")

    }
    //接続が切れた
    static func onDisconnect(run: PeerBlock?) {
        PeerKit.onDisconnect = run
        print("接続切れ")

    }
}
