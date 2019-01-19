//
//  EmojiArtViewController.swift
//  EmojiArt
//
//  Created by Carlos Arenas on 1/18/19.
//  Copyright © 2019 Polygon. All rights reserved.
//

import UIKit

class EmojiArtViewController: UIViewController {
    @IBOutlet weak var dropZone: UIView! {
        didSet {
            dropZone.addInteraction(UIDropInteraction(delegate: self))
        }
    }
    // This is for the background image
    @IBOutlet weak var emojiArtView: EmojiArtView!
    
    var imageFetcher: ImageFetcher!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension EmojiArtViewController: UIDropInteractionDelegate {
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: NSURL.self) && session.canLoadObjects(ofClass: UIImage.self)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        imageFetcher = ImageFetcher() { (url, image) in
            // This function does not respond in the main Main Queue, but we need to update the UI so we need to update it.
            DispatchQueue.main.async {
                self.emojiArtView.backgroundImage = image
            }
        }
        session.loadObjects(ofClass: NSURL.self) { nsurls in
            if let url = nsurls.first  as? URL {
                self.imageFetcher.fetch(url)
            }
        }
        session.loadObjects(ofClass: UIImage.self) { images in
            if let image = images.first  as? UIImage {
                self.imageFetcher.backup = image
            }
        }
    }
}

