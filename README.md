# Muzic

## CocoaPods
AsyncDisplayKit
Lorem ipsum

### AsyncDisplayKit
AsyncDisplayKit is a powerful framework that lets the app respone smoothly. 
AsyncDisplayKit's layout engine is also a most unique feature that provides great way of specifying a custom node's size and layout of its sub-nodes (Node is a unit of AsyncDisplayKit)
Why should I use this?
AsyncDisplayKit allows the app to run smoothly. All stuffs relating to rendering are off from the main thread which greatly result in the app's responsiveness.
AsyncDisplayKit's layout engine is a replacement of Auto Layout and easy to use.

### Lorem ipsum
This is the source of data used in the project.

## Data model
```Swift
class Song: NSObject {
    var songName: String!
    var artistName: String!
    var songThumbnail: NSURL!
    var descriptionText: String!
}
```
## Custom cell
```Swift
class SongNode: ASCellNode {
    private let _thumbnailImageNode = ASNetworkImageNode()
    private let _artistNode = ASTextNode()
    private let _songNameNode = ASTextNode()

    init(song: Song) {
        super.init()
        /*
        ...
        ...
        ...
        */
    }
    /*
    ...
    ...
    ...
    */
}
```
## DataSource
```Swift
class SongListDataSource: NSObject, ASTableDataSource, ASTableDelegate {
    private weak var _tableNode: ASTableNode?
    private var _songs: [Song]!
    private weak var _viewController: UIViewController?

    init(tableNode: ASTableNode, viewController: UIViewController) {
        super.init()
        _tableNode = tableNode
        _tableNode?.dataSource = self
        _tableNode?.delegate = self
        /* 
        ...
        ...
        ...
        */
    }
    /*
    ...
    ...
    ...
    */
}
```
