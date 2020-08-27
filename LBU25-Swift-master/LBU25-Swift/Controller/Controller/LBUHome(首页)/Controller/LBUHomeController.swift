//
//  LBUHomeController.swift
//  LBU25-Swift
//
//  Created by liubo on 2019/5/11.
//  Copyright © 2019 刘博. All rights reserved.
//

import UIKit

class LBUHomeController: LBUPageController {
     convenience init(titles: [String] = [], vcs: [UIViewController] = [], pageStyle: LBUPageStyle = .none) {
       self.init()
       self.titles = titles
       self.vcs = vcs
       self.pageStyle = pageStyle
   }
    var currentRed:CGFloat = 0.0,
    currentGreen:CGFloat = 0.0,
    currentBlue:CGFloat = 0.0,
    currentAlpha:CGFloat = 0.0,
    
    nextRed:CGFloat = 0.0,
    nextGreen:CGFloat = 0.0,
    nextBlue:CGFloat = 0.0,
    nextAlpha:CGFloat = 0.0,
    
    currentEndRed:CGFloat = 0.0,
    currentEndGreen:CGFloat = 0.0,
    currentEndBlue:CGFloat = 0.0,
    currentEndAlpha:CGFloat = 0.0,
    
    nextEndRed:CGFloat = 0.0,
    nextEndGreen:CGFloat = 0.0,
    nextEndBlue:CGFloat = 0.0,
    nextEndAlpha:CGFloat = 0.0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let vcss:LBUHomeCommentController  = self.vcs[0] as! LBUHomeCommentController;
//        vcss.myBloc
        vcss.myBlock = { offset, index,colors in
                let images = UIImage(named: "nav_bg")?.withColor(UIColor.hex(hexString: colors[index]))
                   
                self.navigationController?.navigationBar .setBackgroundImage(images, for: .default)
               }
        
    }
    func setCurrntColor(color:String)  {
       let colorss:UIColor = UIColor.hex(hexString: color)
        colorss.getRed(&currentRed, green: &currentGreen, blue: &currentBlue, alpha: &currentAlpha)
         colorss.getRed(&currentEndRed, green: &currentEndGreen, blue: &currentEndBlue, alpha: &currentEndAlpha)
    }
    func setNextCurrntColor(color:String)  {
        let colorss:UIColor = UIColor.hex(hexString: color)
               colorss.getRed(&nextRed, green: &nextGreen, blue: &nextBlue, alpha: &nextAlpha)
         colorss.getRed(&currentEndRed, green: &currentEndGreen, blue: &currentEndBlue, alpha: &currentEndAlpha)
    }
    
    
    
    override func configNavigationBar() {
        super.configNavigationBar()
        let images = UIImage(named: "nav_bg")?.withColor(UIColor.red)
        
        navigationController?.navigationBar .setBackgroundImage(images, for: .default)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_search"),
                                                            target: self,
                                                            action: #selector(searchButtonClick))
    }
    
    @objc private func searchButtonClick() {
        navigationController?.pushViewController(LBUSearchController(), animated: true)
    }

}
