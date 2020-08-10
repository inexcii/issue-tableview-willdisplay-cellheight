//
//  ViewController.swift
//  TestCellUpdate0810
//
//  Created by Yuan Zhou on 2020/08/10.
//  Copyright © 2020 ZhouyuanWork, Inc. All rights reserved.
//

import UIKit

struct Constants {
    static let title = "This is a one-line title."
    static let message =
    """
    This is the message.
    It contains multiple lines.
    This is the first line.
    This is the second line.
    This is the third line.
    And so on...
    """
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// static-cell tableview
class TestTableViewController: UITableViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        label1.text = Constants.title
        label2.text = Constants.message

    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        // bug
//        label1.text = Constants.title
//        label2.text = Constants.message

    }
}

// dynamic-cell tableview
class TestDynamicTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TestCell

        cell.label1.text = Constants.title
        cell.label2.text = Constants.message

        return cell
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        // bug
//        if let testCell = cell as? TestCell {
//            testCell.label1.text = Constants.title
//            testCell.label2.text = Constants.message
//        }
    }
    
}

class TestCell: UITableViewCell {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!

}
