#language: zh-CN
功能: 有关课程的相关功能，只有教师才可以创建、修改课程的信息

背景: 我是一个教师
    假如: 教师已经登录了系统

      场景大纲: 创建课程
    	  假如: 我访问创建课程页面
          当: 创建课程"<课程名称>"
          那么: 在课程列表中会出现"<课程名称>"
          例子: 
             | 课程名称 |
             | 诗       |
             | 书       |
             | 礼       |
             | 乐       |
             | 易       |
             | 春秋     |

     场景: 删除课程
        假如: 已经有一门课程 诗
        当: 我在课程列表，点击删除该课程时
        那么: 会跳出确认信息: 你确定删除诗这门课吗？
        而且: 点击确认
        而且: 诗将不会存在在课程列表中

     场景: 编辑课程
        假如: 已经有一门课程 诗
        当: 我在课程列表，点击编辑该课程时
        那么: 跳到编辑页面
        而且: 修改课程简介为 中国最古老的文献之一
        而且: 课程显示页面会出现 中国最古老的文献之一