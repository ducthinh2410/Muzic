//
//  SongDetailViewController.swift
//  Muzic
//
//  Created by Thinh Duc on 09/05/16.
//  Copyright © 2016 Thinh Duc. All rights reserved.
//

class SongDetailViewController: ASViewController, ASTableDelegate, ASTableDataSource {
    private var _tableNode = ASTableNode()
    private var _song: Song
    
    required init(song: Song) {
        _song = song
        super.init(node: _tableNode)
        _tableNode.view.separatorStyle = UITableViewCellSeparatorStyle.None
        _tableNode.delegate = self
        _tableNode.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"
    }
    
    //MARK: ASTableDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: ASTableView, nodeBlockForRowAtIndexPath indexPath: NSIndexPath) -> ASCellNodeBlock {
        return {
            return SongDetailNode(song: self._song)
        }
    }
}

private let kVerticalSpacing: CGFloat = 10
private let kHorizontalSpacing: CGFloat = 30
private let kThumbnailSize: CGFloat = 200

///
/// Class SongDetailNode
///
class SongDetailNode: ASCellNode {
    private let _thumbnailImageNode = ASNetworkImageNode()
    private let _artistNode = ASTextNode()
    private let _songNameNode = ASTextNode()
    private let _descriptionTextNode = ASTextNode()
    
    init(song: Song) {
        super.init()
        self.selectionStyle = UITableViewCellSelectionStyle.None
        
        //Set image for thumbnail
        _thumbnailImageNode.URL = song.songThumbnail
        _thumbnailImageNode.placeholderColor = UIColor.grayColor()
        
        //Set artist name
        _artistNode.attributedString = NSAttributedString.attributedStringFromFont(song.artistName, font: UIFont.appFont(15), textColor: UIColor.blackColor(), textAlignment: NSTextAlignment.Left)
        
        //Set song name
        _songNameNode.attributedString = NSAttributedString.attributedStringFromFont(song.songName, font: UIFont.boldAppFont(17), textColor: UIColor.blackColor(), textAlignment: NSTextAlignment.Left)
        _descriptionTextNode.attributedString = NSAttributedString.attributedStringFromFont(song.descriptionText, font: UIFont.appFont(15), textColor: UIColor.blackColor(), textAlignment: NSTextAlignment.Left)
        
        //Add all subnodes
        self.addSubnode(_thumbnailImageNode)
        self.addSubnode(_artistNode)
        self.addSubnode(_songNameNode)
        self.addSubnode(_descriptionTextNode)
    }
    
    override func layoutSpecThatFits(constrainedSize: ASSizeRange) -> ASLayoutSpec {
        _descriptionTextNode.flexGrow = true
        _descriptionTextNode.flexShrink = true
        _thumbnailImageNode.preferredFrameSize = CGSize(width: kThumbnailSize, height: kThumbnailSize)
        
        //Vertical stack
        let verticalStack = ASStackLayoutSpec(direction: ASStackLayoutDirection.Vertical, spacing: kVerticalSpacing, justifyContent: ASStackLayoutJustifyContent.Start, alignItems: ASStackLayoutAlignItems.Center, children: [_songNameNode, _thumbnailImageNode, _artistNode, _descriptionTextNode])
        
        //Insets layout spec
        let insets = UIEdgeInsets(top: kVerticalSpacing, left: kHorizontalSpacing, bottom: kVerticalSpacing, right: kHorizontalSpacing)
        let insetLayoutSpec = ASInsetLayoutSpec(insets: insets, child: verticalStack)
        
        return insetLayoutSpec
    }
}
