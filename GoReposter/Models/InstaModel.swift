import UIKit
import Foundation


// MARK: - INSTA RESPONSE MODELS
struct JustText: Codable {
    var text: String
}

struct NodeCaption: Codable {
    var node: JustText
}

struct MediaCaption: Codable {
    var edges: [NodeCaption?]
}

struct PostData: Codable {
    var graphql: Graphql
    
    
    func reconfigureModel(uri: String) -> ContentModel?{
        if let _ = self.graphql.shortcode_media.edge_sidecar_to_children {
            return createMoreContent(uri: uri, content: self)
        } else {
            return createContent(uri: uri, content: self)
        }
    }
        
    func createMoreContent(uri: String,content: PostData) -> ContentModel?{
        var contentArray = [ContentItem]()
        if let moreContent = content.graphql.shortcode_media.edge_sidecar_to_children {
            for item in moreContent.edges {
                let newContent = ContentItem.init(type: item.node.is_video ? .video : .image,
                                                  contentUrl: item.node.is_video ? item.node.video_url ?? "" : item.node.display_url)
                contentArray.append(newContent)
            }
        }
        
        let content = ContentModel.init(
            uri: uri, fromAccName: content.graphql.shortcode_media.owner.username,
            formAccImage: content.graphql.shortcode_media.owner.profile_pic_url,
            content: contentArray,
            caption: content.graphql.shortcode_media.edge_media_to_caption.edges.first??.node.text ?? "", stories: false)
        return content
    }
        
    func createContent(uri: String,content: PostData) -> ContentModel?{
        let contentItem = content.graphql.shortcode_media
        let content = ContentModel.init(
            uri: uri, fromAccName: content.graphql.shortcode_media.owner.username,
            formAccImage: content.graphql.shortcode_media.owner.profile_pic_url,
            content: [ContentItem.init(type: contentItem.is_video ? .video : .image,
                                       contentUrl: contentItem.is_video ? contentItem.video_url ?? "" :contentItem.display_url)],
            caption: content.graphql.shortcode_media.edge_media_to_caption.edges.first??.node.text ?? "", stories: false)
        return content
    }
}

struct Owner: Codable {
    var profile_pic_url: String
    var username: String
}

struct InstaContent: Codable {
    var display_url: String
    var is_video: Bool
    var video_url: String?
}

struct NodeContent: Codable {
    var node: InstaContent
}

struct SidecarChildren: Codable {
    var edges: [NodeContent]
}

struct Shortcode_media: Codable {
    var owner: Owner
    var video_url: String?
    var display_url: String
    var edge_media_to_caption: MediaCaption
    var edge_sidecar_to_children: SidecarChildren?
    var is_video: Bool
}

struct Graphql: Codable {
    var shortcode_media: Shortcode_media
}


//MARK: - App model
struct ContentModel: Decodable, Encodable {
    var uri: String
    var fromAccName: String
    var formAccImage: String
    var content: [ContentItem]
    var caption: String
    var stories: Bool
    
    
    func reversedContent() -> ContentModel{
        return ContentModel.init(uri: self.uri,
                                 fromAccName: self.fromAccName,
                                 formAccImage: self.formAccImage,
                                 content: self.content.reversed(),
                                 caption: self.caption, stories: self.stories)
    }
}

struct ContentItem: Decodable, Encodable {
    var type: UserContentType
    var contentUrl: String
}

enum UserContentType: Int, Decodable, Encodable{
    case image
    case video
}
