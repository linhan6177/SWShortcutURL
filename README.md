# SWShortcutURL
iOS 设置相关项 快捷方式打开


//打开设置-》隐私-》相册
SWShortcutURL.Setting.Privacy.Photos.open()

//打开设置-》隐私-》通讯录
SWShortcutURL.Setting.Privacy.Contact.open()

//打开设置-》通知
SWShortcutURL.Setting.Notification.open()

//拨打电话
SWShortcutURL.PhoneCall(number: "12306").open()

//Safari中打开网页
SWShortcutURL.Safari(url: "http://baidu.com").open()