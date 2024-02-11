//
//  TimeLineTableViewCell.swift
//  FaceBook
//
//  Created by 澤木柊斗 on 2024/02/11.
//

import UIKit

class TimeLineTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var CommentCountLabel: UILabel!
    @IBOutlet weak var LikedCountLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    var timeLine: Timeline! {
        didSet {
            profileImageView.image = UIImage(named: timeLine.user.imageName)
            userNameLabel.text = timeLine.user.name
            bodyTextView.text = timeLine.body
            if timeLine.isLiked {
                LikedCountLabel.text = "You and \(timeLine.likeCount - 1) others liked"
            } else {
                LikedCountLabel.text = "\(timeLine.likeCount) people liked"
            }
            CommentCountLabel.text = "\(timeLine.commentCount) comment"
        }
    }
}
