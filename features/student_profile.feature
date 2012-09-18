#language: zh-CN

功能: 编辑学生信息
       作为一个已经登录的注册用户，我将会修改我的基本信息.

     
    场景: 学生编辑基本信息
           假如: 我已经以颜回的名字登录了
           当: 修改基本信息学号为00001 
           那么: 我的基本信息中将会有学号为00001

    场景: 没有登录的用户将不能进入编辑页面
           假如: 我没有登录
           当: 访问修改id为1的用户编辑页面
           那么: 将跳到登录页面，提示请登录