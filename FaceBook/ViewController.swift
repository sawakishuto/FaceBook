//
//  ViewController.swift
//  FaceBook
//
//  Created by 澤木柊斗 on 2024/02/11.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 80
        default:
            return 250
        }
    }
}

