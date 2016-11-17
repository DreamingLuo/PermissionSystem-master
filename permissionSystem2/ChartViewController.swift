//
//  ChartViewController.swift
//  Frame
//
//  Created by luogang on 16/8/29.
//  Copyright (c) 2016年 luogang. All rights reserved.
//

import UIKit


class ChartViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    var textlables=["医疗机构","回款","代理商","核心竟品","发货","经销商","药店"]
   
    
    var logoimages=["o.png","k.png","l.png","s.png","f.png","t.png","t.png"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       // let nvc:UINavigationController=UINavigationController()
        
       
        
        self.view.backgroundColor=UIColor.orangeColor()
        
        
        let tableView:UITableView=UITableView(frame: UIScreen.mainScreen().bounds)
        
       
        
        self.view.addSubview(tableView)
        tableView.dataSource=self
        tableView.delegate=self
        tableView.rowHeight = SCREEN_pixels*160
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textlables.count
    }
    
 
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let row = indexPath.row
//        print(row)
//       switch(row)
//       {
//       case 0:
//        let medicalVC:MedicalViewController=MedicalViewController()
//          self.navigationController?.pushViewController(medicalVC, animated: true)
//        
//       case 1:
//        let backmoneyVC:BackMoneyViewController=BackMoneyViewController()
//        self.navigationController?.pushViewController(backmoneyVC, animated: true)
//       case 2:
//        let agentVC:AgentViewController=AgentViewController()
//        self.navigationController?.pushViewController(agentVC, animated: true)
//       case 3:
//        let coreVC:CoreViewController=CoreViewController()
//        self.navigationController?.pushViewController(coreVC, animated: true)
//       case 4:
//        let deliverVC:DeliverViewController=DeliverViewController()
//        self.navigationController?.pushViewController(deliverVC, animated: true)
//       case 5:
//        let dealerVC:DealerViewController=DealerViewController()
//        self.navigationController?.pushViewController(dealerVC, animated: true)
//       case 6:
//        let pharmacyVC:PharmacyViewController=PharmacyViewController()
//        self.navigationController?.pushViewController(pharmacyVC, animated: true)
//        
//        
//        
//        default:
//        print("出错")
//        
//        
//        
//        }
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let initIdentifier = "Cell"
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: initIdentifier)
        //下面两个属性对应subtitle
        cell.textLabel?.text = textlables[indexPath.row]
        cell.detailTextLabel?.text = "这里会有东西"
        cell.imageView?.image = UIImage(named: logoimages[indexPath.row])
        
        //添加照片
//        cell.imageView?.image = UIImage(named: babyImage[indexPath.row])
//        cell.imageView!.layer.cornerRadius = 40
//        cell.imageView!.layer.masksToBounds = true
        
        //datail button
        cell.accessoryType=UITableViewCellAccessoryType.DisclosureIndicator

        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

