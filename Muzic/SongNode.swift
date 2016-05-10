//
//  SongNode.swift
//  Muzic
//
//  Created by Thinh Duc on 09/05/16.
//  Copyright © 2016 Thinh Duc. All rights reserved.
//

private let kThumbnailSize: CGFloat = 50
private let kRightMargin: CGFloat = 10
private let kVerticalMargin: CGFloat = 10
private let kHorizontalSpacing: CGFloat = 15

class SongNode: ASCellNode {
    private let _thumbnailImageNode = ASNetworkImageNode()
    private let _artistNode = ASTextNode()
    private let _songNameNode = ASTextNode()
    
    init(song: Song) {
        super.init()
        
        //Set image for thumbnail
        _thumbnailImageNode.URL = song.songThumbnail
        _thumbnailImageNode.placeholderColor = UIColor.grayColor()
        
        //Set artist name
        _artistNode.attributedString = NSAttributedString.attributedStringFromFont(song.artistName, font: UIFont.appFont(15), textColor: UIColor.blackColor(), textAlignment: NSTextAlignment.Left)
        
        //Set song name
        _songNameNode.attributedString = NSAttributedString.attributedStringFromFont(song.songName, font: UIFont.boldAppFont(17), textColor: UIColor.blackColor(), textAlignment: NSTextAlignment.Left)
        
        //Add all subnodes
        self.addSubnode(_thumbnailImageNode)
        self.addSubnode(_artistNode)
        self.addSubnode(_songNameNode)
    }
    
    
    override func layoutSpecThatFits(constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let verticalStack = ASStackLayoutSpec(direction: ASStackLayoutDirection.Vertical, spacing: 0, justifyContent: ASStackLayoutJustifyContent.Center, alignItems: ASStackLayoutAlignItems.Start, children: [_songNameNode, _artistNode])
        
        _thumbnailImageNode.preferredFrameSize = CGSize(width: kThumbnailSize, height: kThumbnailSize)
        let horizontalStack = ASStackLayoutSpec(direction: ASStackLayoutDirection.Horizontal, spacing: kHorizontalSpacing, justifyContent: ASStackLayoutJustifyContent.Start, alignItems: ASStackLayoutAlignItems.Start, children: [_thumbnailImageNode, verticalStack])
        
        let insets = UIEdgeInsets(top: kVerticalMargin, left: kRightMargin, bottom: kVerticalMargin, right: 0)
        let insetLayoutSpec = ASInsetLayoutSpec(insets: insets, child: horizontalStack)
        
        return insetLayoutSpec
    }
    
    override func layout() {
        super.layout()
        
        print(_thumbnailImageNode.frame)
    }
}
