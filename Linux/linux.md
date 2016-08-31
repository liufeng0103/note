## Linux配置使用mail命令发送邮件

服务器使用阿里云安装的CentOS7， 配置外部邮件服务器，使用mail命令发送邮件

1. 使用管理员账号编辑/etc/mail.rc,添加如下配置:  
set from=liufeng0103@163.com  
set smtp=smtp.163.com  
set smtp-auth-user=liufeng0103@163.com  
set smtp-auth-password=xxxx  
set smtp-auth=login  
2. 使用mail命令发送邮件:
```sh
echo "邮件内容"|mail -s 标题 xxx@163.com
mail -s 标题 xxx@163.com < file
```