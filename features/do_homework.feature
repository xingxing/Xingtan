#language: zh-CN
功能: 学生提交作业

背景: 我是一个学生
    假如: 学生已经登录了系统
    而且: 已经有一门课程 诗
    而且: 已经有一项作业叫做 学而时习之     

     
     场景: 查看各科发布的作业题
        假如: 我访问发布作业页面
        当: 我选择 诗 这个课程
        那么: 学而时习之 将出现载页面中

     场景: 选择上传作业
        假如: 我访问发布作业页面
        当: 我选择 学而时习之 这门功课的 上传作业
        那么: 应该跳到上传作业页面

     @wip
     场景: 选择上传作业
        假如: 我访问发布作业页面
        而且: 我选择 学而时习之 这门功课的 上传作业
        当: 上传文件
        那么: 发布作业页面上应该显示 已交付
