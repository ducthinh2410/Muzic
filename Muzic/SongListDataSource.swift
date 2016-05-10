//
//  SongListDataSource.swift
//  Muzic
//
//  Created by Thinh Duc on 09/05/16.
//  Copyright © 2016 Thinh Duc. All rights reserved.
//

class SongListDataSource: NSObject, ASTableDataSource, ASTableDelegate {
    private weak var _tableNode: ASTableNode?
    private var _songs: [Song]!
    private weak var _viewController: UIViewController?
    
    init(tableNode: ASTableNode, viewController: UIViewController) {
        super.init()
        
        _tableNode = tableNode
        _tableNode?.dataSource = self
        _tableNode?.delegate = self
        
        _viewController = viewController
        
        //Build the songs array here
        _songs = [Song]()
        for _ in 0...99 {
            let song = Song()
            song.artistName = LoremIpsum.name()
            song.songName = LoremIpsum.wordsWithNumber(Int(rand() % 4) + 1) //Song name's number of words range is 1...4
            let size: CGFloat = CGFloat(rand() % 100) + 300 //Size range is 100...199
            song.songThumbnail = LoremIpsum.URLForPlaceholderImageWithSize(CGSize(width: size, height: size))
            print(song.songThumbnail)
            song.descriptionText = LoremIpsum.wordsWithNumber(40)
            
            //Add song to array
            _songs.append(song)
        }
    }
}

//MARK: ASTableDataSource
extension SongListDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _songs.count
    }
    
    func tableView(tableView: ASTableView, nodeBlockForRowAtIndexPath indexPath: NSIndexPath) -> ASCellNodeBlock {
        let song = _songs[indexPath.row]
        
        return {
            return SongNode(song: song)
        }
    }
}

//MARK: ASTableDelegate
extension SongListDataSource {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        //Do something here
        let song = _songs[indexPath.row]
        let viewController = SongDetailViewController(song: song)
        _viewController?.navigationController?.pushViewController(viewController, animated: true)
        
    }
}