//
//  ViewController.swift
//  MenuList
//
//  Created by Parameswaran on 26/08/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var playerContainer: UIView!
   
    @IBOutlet weak var btnList: UIButton!
    
    let dataSource = ["780","480","380"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configure()
        self.btnList.setTitle(dataSource[0], for: .normal)
    }
}

fileprivate extension ViewController {
    
    func configure() {
        self.title = "UIMenu Sample"
        setMoreButton()
    }
    
    func setMoreButton() {
        let actionClosure = { (action: UIAction) in
            print(action.title)
            self.btnList.setTitle(action.title, for: .normal)
        }
        var menuChildren: [UIAction] = []

        for fruit in dataSource {
            menuChildren.append(UIAction(title: fruit, handler: actionClosure))
        }
        
        btnList.menu = UIMenu(options: .displayInline, children: menuChildren)
        btnList.showsMenuAsPrimaryAction = true // Important; otherwise, if false the dropdown will not be visible when clicking the button.
        btnList.backgroundColor = .red
    }
}
