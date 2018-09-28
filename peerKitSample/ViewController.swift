//
//  ViewController.swift
//  peerKitSample
//
//  Created by shogo.kitamura on 9/28/18.
//  Copyright © 2018 shogo.kitamura. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //VIEWが表示される直前に呼ばれる。
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //_は戻り値を破棄する。
        ConnectionManager.onConnect { PeerBlock, _ in
            print(PeerBlock)
            print("特定の端末が接続されました")
            self.updatePeers()
        }
        ConnectionManager.onDisconnect { _, _ in
            print("特定の端末が切断されました")
            self.updatePeers()
        }
    }
    //VIEWが表示されなくなる直前に呼ばれる。
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        ConnectionManager.onConnect(run: nil)
        ConnectionManager.onDisconnect(run: nil)
        print("表示されなくなりました。")
    }
    
    private func updatePeers() {
        // TODO: コネクション一覧が更新された場合の処理を実装する
        print(ConnectionManager.peers)
    }

}

