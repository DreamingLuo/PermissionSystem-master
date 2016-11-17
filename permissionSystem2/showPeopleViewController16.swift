//
//  choosePeople.swift
//  permissionSystem2
//
//  Created by phiic on 16/9/19.
//  Copyright © 2016年 luogang. All rights reserved.
//

import UIKit
import SwiftyJSON

import Alamofire
import MJRefresh
import SwiftDate


//model

//class itemsModel1: NSObject {
//
//    var documentSize = ""
//    var documentName  = ""
//    var uploadName = ""
//    var uploadtime = ""
//    var documentImage = ""
//    var documentUrl = ""
//    var uploadDetailTime = ""
//    var pName = ""//文件所在文件夹
//
//}


class showPeopleViewController16: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var showDocument=showDocumentViewController()
    
    var documentPath:String!
    
    var documentName=""
    
    var uploader=""
    var uploadTime=""
    
    var json:JSON!
    
    var model1:itemsModel!
    
    
    
    var jsons=[]
    
    var spreadButton: SpreadButton!
    
    var create_dateUrl:NSURL!
    
    var loadMoreEnable = true
    
    var timer: NSTimer!
    
    var dataDic=NSDictionary()
    
    var dataArrays=NSArray()
    
    
    
    
    //回到顶部button
    
    var returnTopBtn=UIButton()
    
    var url:NSURL!
    
    let footer = MJRefreshAutoNormalFooter()
    
    let header = MJRefreshNormalHeader()
    
    var tableView=UITableView()
    
    var peoples:[String]=[]
    
    
    var sizeArray:[Int]=[]
    
    var sizeArray1:[Int]=[]
    
    var jsonArray:NSArray=[]
    
    var refreshControl = UIRefreshControl()
    
    var loadMoreView:UIView?
    
    
    
    let  cellIdentifier="Cell"
    
    //数据
    
    var dataArray = [itemsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //cell的分割线
        
        self.tableView.separatorStyle=UITableViewCellSeparatorStyle.init(rawValue: 10)!
        
        footer.setRefreshingTarget(self, refreshingAction: "footerRefresh")
        self.tableView.mj_footer = footer
        
        //加载数据
        
        getData(0)
        
        
        
        //下拉刷新
        
        header.setRefreshingTarget(self, refreshingAction: Selector("headerRefresh"))
        // 现在的版本要用mj_header
        self.tableView.mj_header = header
        
        
        
        
        
        //self.tableView.rowHeight=100
        
        
        self.view.backgroundColor=UIColor.whiteColor()
        
        tableView.frame=CGRect(x: 0, y: 5, width: SCREEN_Width, height: SCREEN_HEIGHT-60)
        
        
        //cell自适应
        
        self.tableView.estimatedRowHeight=100
        
        self.tableView.rowHeight=UITableViewAutomaticDimension
        
        
        
        tableView.delegate=self
        tableView.dataSource=self
        
        
        
        let nib = UINib(nibName: "DocumentTableViewCell", bundle: nil) //nibName指的是我们创建的Cell文件名
        self.tableView.registerNib(nib, forCellReuseIdentifier: cellIdentifier)
        
        //加载回到顶部button
        
        
        self.view.addSubview(tableView)
        
        AddreturnTopBtn()
        
        
        
    }
    //加载回到顶部button
    func AddreturnTopBtn()
    {
        
        returnTopBtn.frame=CGRect(x: 5, y:SCREEN_HEIGHT-210, width: 100, height: 50)
        
        
        
        
        returnTopBtn.backgroundColor=UIColor(red: 22/255, green: 164/255, blue: 174/255, alpha: 0.95)
        // returnTopBtn.backgroundColor=UIColor.greenColor()
        
        
        
        returnTopBtn.setTitle("回到顶部", forState: UIControlState.Normal)
        
        returnTopBtn.addTarget(self, action: "returnTopBtn_F", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(returnTopBtn)
        
    }
    
    func returnTopBtn_F()
    {
        
        
        tableView.setContentOffset(CGPointMake(0,0), animated: true)
        
        
        
        
    }
    
    //下拉刷新
    func headerRefresh(){
        print("下拉刷新")
        
        self.dataArray.removeAll()
        
        
        getData(0)
        
        tableView.reloadData()
        
        
        // 结束刷新
        self.tableView.mj_header.endRefreshing()
    }
    
    
    //上拉加载
    var index = 0
    func footerRefresh(){
        index=index+1
        
        
        getData(index)
        
        tableView.reloadData()
        
        
        tableView.mj_footer.endRefreshing()
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        let model = self.dataArray[indexPath.row]
        
        let url = prefixUrl + model.documentUrl
        
        let url1=NSURL(string: url)
        
        print("shwodocument:\(url1)")
        
        
        showDocument.webView.loadRequest(NSURLRequest(URL: url1!))
        showDocument.documentHeader.text=model.documentName
        
        showDocument.peopleName.text=model.uploadName
        
        
        let ns2=(model.uploadtime as NSString).substringToIndex(10)
        
        
        showDocument.documentTime.text=ns2
        
        
        
        self.navigationController?.pushViewController(showDocument, animated: true)
        
        
        
        
        
    }
    
    
    func getData(page:Int)
    {
        
        // let url=NSURL(string: "http://10.10.10.201/doc/Main/ListDoc_Mobile/?rows=8&page=0&userId=guowen&sort=create_date&order=desc&fk_bizId=c_gDoc&fk_id=8D3B8E11-BB13-4610-B27E-5EE91AE9115A&sk=phiic" )
        
        let URLstring1=String(format: "http://10.10.10.201/doc/Main/ListDoc_Mobile/?rows=8&page=%d&userId=guowen&sort=create_date&order=desc&fk_bizId=c_gDoc&fk_id=917F728D-90A3-483B-BA93-0130393A8676&sk=phiic",page)
        
        
        
        print(URLstring1)
        
        let url=NSURL(string:URLstring1)
        
        
        
        
        //访问网络
        
        
        let jsonData=NSData(contentsOfURL: url!)
        
        
        
        json=JSON(data: jsonData!)
        
        let data =  json["rows"].array
        
        
        
        for dataDic in  data!
        {
            
            
            
            let model =  itemsModel()
            //  ?? 这个符号，我怕有初学者忘记了的提醒一下，A ?? B  这是一个 NIL合并运算符，它的作用是如果 A 不是NIL 就返回前面可选类型参数 A 的确定值， 如果 A 是NIL 就返回后面 B 的值！A和B之间类型的注意点我就不说了，忘记了去看书，，哈哈哈
            
            
            //  print("size:\(dataDic["size"])")
            model.documentSize = dataDic["size"].stringValue
            
            //  print("model.documentSize=\(model.documentSize)")
            model.documentName = dataDic["name"].string ?? ""
            model.uploadName = dataDic["create_byName"].string ?? ""
            model.uploadtime = dataDic["create_date"].string ?? ""
            
            model.documentImage=dataDic["imgUrl"].string ?? ""
            
            model.documentUrl=dataDic["url"].string ?? ""
            
            
            model.pName=dataDic["pname"].string ?? ""
            self.dataArray.append(model)
            
            
        }
        
        
    }
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        print("haha")
        
        
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier, forIndexPath: indexPath) as! DocumentTableViewCell
        
        
        let model = self.dataArray[indexPath.row]
        let urlImg=NSURL(string: prefixUrl+model.documentImage)
        
        
        
        let  dataImage=NSData(contentsOfURL: urlImg!)
        
        if dataImage==nil {
            cell.documentIIcon.image=UIImage(named:  "documentIcon")
            
            
            
            
        }
        else
        {
            
            cell.filePath.text=model.pName
            
            cell.documentIIcon.image=UIImage(data: dataImage!)
            
            
            cell.documentName.text=model.documentName
            
            cell.documentSize.text=model.documentSize
            
            cell.uploadName.text=model.uploadName
            
            let ns1=(model.uploadtime as NSString).substringWithRange(NSMakeRange(11, 5))
            
            let ns2=(model.uploadtime as NSString).substringToIndex(10)
            cell.uploadTime.text=ns2
            
            cell.uploaddetailTime.text=ns1
            
            // 2016-10-28T14:22:08.093
            
        }
        
        
        
        return cell
        
        
    }
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataArray.count
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}