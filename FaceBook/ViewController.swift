//
//  ViewController.swift
//  FaceBook
//
//  Created by 澤木柊斗 on 2024/02/11.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource , PostViewControllerDelegate {



    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 250

    }

    private var timeLines: [Timeline] = Timelines.createTimelines() {
        didSet {
            tableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeLines.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TimeLineCell", for: indexPath) as! TimeLineTableViewCell
            let timeline = timeLines[indexPath.row - 1]
            cell.timeLine = timeline
            cell.selectionStyle = .none
            return cell
        }
    }
    func postViewController(viewController: PostViewController, timeline: Timeline) {
        var newTimeLines = timeLines
        newTimeLines.insert(timeline, at: 0)
        timeLines = newTimeLines
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 80
        default:
            return 250
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        if indexPath.row == 0 {
            let storybord = UIStoryboard(name: "Main", bundle: nil)
            let vc = storybord.instantiateViewController(withIdentifier: "PostViewController") as! PostViewController
            let timeline = timeLines[0].user
            let user = timeline
            vc.user = user
            vc.delegate = self
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: true)
        }
    }
    
}

