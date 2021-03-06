//
//  ViewController.swift
//  ArmyOfOnes
//
//  Created by Arvin San Miguel on 12/2/16.
//  Copyright © 2016 AppRising. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    var isSwitched = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        add(asChildViewController: currencyTableVC)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    private lazy var currencyTableVC : CurrencyTableViewController = {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var vc = storyboard.instantiateViewController(withIdentifier: "CurrencyTableVC") as! CurrencyTableViewController
        self.add(asChildViewController: vc)
        return vc
        
    }()
    
    private func add(asChildViewController viewController: UIViewController) {
        
        addChildViewController(viewController)
        containerView.addSubview(viewController.view)
        viewController.view.frame = containerView.bounds
        viewController.view.backgroundColor = UIColor.clear
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParentViewController: self)
        
    }
    
    @IBAction func testButton(_ sender: Any) {
        
        let graphVC = GraphViewController()
        graphVC.currencies = currencyTableVC.currencies.selectedCurrency
        graphVC.modalPresentationStyle = .overCurrentContext
        graphVC.modalTransitionStyle = .crossDissolve
        present(graphVC, animated: true, completion: nil)
        
        
    }
    
}





