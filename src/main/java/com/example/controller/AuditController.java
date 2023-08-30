package com.example.controller;


import com.example.common.Result;
import com.example.entity.Audit;
import com.example.entity.Params;
import com.example.service.AuditService;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@CrossOrigin //后端允许跨域
@RestController
@RequestMapping("/audit")
public class AuditController {

    @Resource
    private AuditService auditService;


    //带分页
    @GetMapping("/search")
    public Result findBySearch(Params params) {
        PageInfo<Audit> info = auditService.findBySearch(params);
        return Result.success(info);
    }

    //新增和编辑
    @PostMapping
    public Result save(@RequestBody Audit audit) {
        if (audit.getId() == null) { //没有id 就是新增
            auditService.add(audit);
        } else {
            auditService.update(audit); // 否则就是删除
        }
        return Result.success();
    }

    //删除
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        auditService.delete(id);
        return Result.success();
    }




}
