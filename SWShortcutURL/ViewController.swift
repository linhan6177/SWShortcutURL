//
//  ViewController.swift
//  SWShortcutURL
//
//  Created by linhan on 16/6/6.
//  Copyright © 2016年 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{

    private var _items:[OpenEnableURL] = []
    
    lazy private var _tableView:UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setup()
    {
        _items.append(SWShortcutURL.Setting.Root)
        _items.append(SWShortcutURL.Setting.Bluetooth)
        _items.append(SWShortcutURL.Setting.Photos)
        _items.append(SWShortcutURL.Setting.Notification)
        _items.append(SWShortcutURL.Setting.General.Root)
        _items.append(SWShortcutURL.Setting.General.About)
        _items.append(SWShortcutURL.Setting.General.Date)
        
        _items.append(SWShortcutURL.Setting.Privacy.Root)
        _items.append(SWShortcutURL.Setting.Privacy.Photos)
        _items.append(SWShortcutURL.Setting.Privacy.Camera)
        _items.append(SWShortcutURL.Setting.Privacy.Microphone)
        _items.append(SWShortcutURL.Setting.Privacy.Contact)
        
        _items.append(SWShortcutURL.Setting.Location)
        _items.append(SWShortcutURL.Setting.Sounds)
        
        _items.append(SWShortcutURL.PhoneCall(number: "12306"))
        _items.append(SWShortcutURL.SMS(number: "12306"))
        _items.append(SWShortcutURL.Safari(url: "http://baidu.com"))
        _items.append(SWShortcutURL.Mail(addressee: "lwc6177@qq.com"))
        
        //蜂窝设置 prefs:root=MOBILE_DATA_SETTINGS_ID
        //辅助功能 prefs:root=General&path=ACCESSIBILITY
        //自动锁屏时间 prefs:root=General&path=AUTOLOCK
        //用量 prefs:root=General&path=USAGE
        //Facetime设置 prefs:root=FACETIME
        //键盘设置 prefs:root=General&path=Keyboard
        //icloud prefs:root=CASTLE
        //备份 prefs:root=CASTLE&path=STORAGE_AND_BACKUP
        //语言与地区设置 prefs:root=General&path=INTERNATIONAL
        //音乐 prefs:root=MUSIC
        //邮件 、通讯录、日历 prefs:root=ACCOUNT_SETTINGS
        //EQ均衡器 prefs:root=MUSIC&path=EQ
        //备忘录 prefs:root=NOTES
        //电话设置 prefs:root=Phone
        //铃声设置 prefs:root=Sounds&path=Ringtone
        //系统更新 prefs:root=General&path=SOFTWARE_UPDATE_LINK
        //STORE 设置 prefs:root=STORE
        //视频设置 prefs:root=VIDEO
        //壁纸设置 prefs:root=Wallpaper
        //Wi-Fi — prefs:root=WIFI
        //Profile（描述文件） — prefs:root=General&path=ManagedConfigurationList
        //Add Account…（添加账户…）— prefs:root=ACCOUNT_SETTINGS&path=ADD_ACCOUNT
        //VPN — prefs:root=General&path=VPN
        //勿扰模式  prefs:root=DO_NOT_DISTURB
        
        
        
        _tableView.frame = view.frame
        _tableView.delegate = self
        _tableView.dataSource = self
        _tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(_tableView)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return _items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")!
        let index:Int = indexPath.row
        var label:String = ""
        if index >= 0 && index < _items.count
        {
            label = (_items[index] as? SWShortcutURLName)?.name ?? ""
        }
        cell.textLabel?.text = label
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let index:Int = indexPath.row
        _items[index].open()
    }


}

