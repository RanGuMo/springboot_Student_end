package com.example.controller;

import com.example.common.AutoLog;
import com.example.common.Result;
import com.example.entity.Log;
import com.example.entity.Params;
import com.example.service.LogService;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@CrossOrigin
@RestController
@RequestMapping("/log")
public class LogController {

    @Resource
    private LogService logService;


    // 新增
    @PostMapping
    public Result save(@RequestBody Log log) {
       logService.add(log);
        return Result.success();
    }

    // 分页查询
    @GetMapping("/search")
    public Result findBySearch(Params params) {
        PageInfo<Log> info = logService.findBySearch(params);
        return Result.success(info);
    }

    // 删除
    @DeleteMapping("/{id}")
    @AutoLog("日志管理的删除")
    public Result delete(@PathVariable Integer id) {
        logService.delete(id);
        return Result.success();
    }

}