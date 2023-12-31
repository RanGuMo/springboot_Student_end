package com.example.controller;

import com.example.common.AutoLog;
import com.example.common.CaptureConfig;
import com.example.common.Result;
import com.example.entity.Admin;
import com.example.entity.Params;
import com.example.service.AdminService;
import com.wf.captcha.utils.CaptchaUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;
import com.github.pagehelper.PageInfo;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Api(value = "用户接口", tags = {"用户接口"})
@CrossOrigin //后端允许跨域
@RestController
@RequestMapping("/admin")
public class AdminController {

    @Resource
    private AdminService adminService;

    //    登录
    @PostMapping("/login")
    @AutoLog("登录该系统")
    @ApiOperation("登陆接口")
    public Result login(@RequestBody Admin admin, @RequestParam String key, HttpServletRequest request) {
        // 判断验证码对不对
        if (!admin.getVerCode().toLowerCase().equals(CaptureConfig.CAPTURE_MAP.get(key))) {
            // 如果不相等，说明验证不通过
            CaptchaUtil.clear(request);
            return Result.error("验证码不正确");
        }
        Admin loginUser = adminService.login(admin);
        CaptureConfig.CAPTURE_MAP.remove(key); //删除map中的数据
        return Result.success(loginUser);
    }

    // 注册
    @PostMapping("/register")
    public Result register(@RequestBody Admin admin) {
        adminService.add(admin);
        return Result.success();
    }


    @GetMapping
    public Result getAll() { //查询全部数据
        List<Admin> admin = adminService.getAdmin();
        return Result.success(admin);
    }
//   带条件的查询
//    @GetMapping("/search")
//    public Result findBySearch(Params params) {
//        List<Admin> list = adminService.findBySearch(params);
//        return Result.success(list);
//    }

    //查询带分页
    @GetMapping("/search")
    public Result findBySearch(Params params) {
        PageInfo<Admin> info = adminService.findBySearch(params);
        return Result.success(info);
    }

    //新增和编辑
    @PostMapping
    public Result save(@RequestBody Admin admin) {
        if (admin.getId() == null) { //没有id 就是新增
            adminService.add(admin);
        } else {
            adminService.update(admin); // 否则就是删除
        }
        return Result.success();
    }

    //删除
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        adminService.delete(id);
        return Result.success();
    }

}
