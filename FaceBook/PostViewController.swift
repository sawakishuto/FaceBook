//
//  PostViewController.swift
//  FaceBook
//
//  Created by 澤木柊斗 on 2024/02/11.
//

import UIKit

protocol PostViewControllerDelegate {
    func postViewController(viewController: PostViewController, timeline: Timeline)
}

class PostViewController: UIViewController, UITextViewDelegate {

    var user: User!
    var delegate: PostViewControllerDelegate!
    @IBOutlet weak var postTextView: UITextView!
    @IBOutlet weak var postButton: UIBarButtonItem!
    @IBOutlet weak var placeholderLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        postTextView.delegate = self
        postButton.isEnabled = true
        postButton.tintColor = UIColor.lightGray
        // Do any additional setup after loading the view.

    }

    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func PostButtonTapped(_ sender: UIBarButtonItem) {
        let timeline = Timeline(id: 100, user: User(id: 100, name: "しゅうと", imageName: "yuzushio"), body: postTextView.text, commentCount: 0, likeCount: 0, isLiked: false)
        delegate.postViewController(viewController: self, timeline: timeline)
        dismiss(animated: true)
    }
     func textViewDidChange(_ textView: UITextView) {
        if textView.text == "" {
            postButton.isEnabled = true
            postButton.tintColor = UIColor.lightGray
        } else {
            placeholderLabel.isHidden = true
            postButton.isEnabled = false
            postButton.tintColor = nil
        }
    }
        
}
