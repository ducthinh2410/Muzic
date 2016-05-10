//
//  ViewController.swift
//  Muzic
//
//  Created by Thinh Duc on 09/05/16.
//  Copyright © 2016 Thinh Duc. All rights reserved.
//

class SongListViewController: ASViewController {
    private var _tableNode: ASTableNode!
    private var _dataSource: SongListDataSource!
    
    init() {
        _tableNode = ASTableNode()
        super.init(node: _tableNode)
        _dataSource = SongListDataSource(tableNode: _tableNode, viewController: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        _tableNode = ASTableNode()
        super.init(node: _tableNode)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Songs"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

