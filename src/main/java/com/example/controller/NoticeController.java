package com.example.controller;

import com.example.common.AutoLog;
import com.example.common.Result;
import com.example.entity.Notice;
import com.example.entity.Params;
import com.example.service.NoticeService;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;


@CrossOrigin //后端允许跨域
@RestController
@RequestMapping("/notice")
public class NoticeController {

    @Resource
    private NoticeService noticeService;

    //获取前三条记录（最新的三条公告）
    @GetMapping
    public Result findTop3() {
        return Result.success(noticeService.findTop3());
    }

    //带分页
    @GetMapping("/search")
    public Result findBySearch(Params params) {
        PageInfo<Notice> info = noticeService.findBySearch(params);
        return Result.success(info);
    }

    //新增和编辑
    @PostMapping
    @AutoLog("系统公告管理的新增或编辑")
    public Result save(@RequestBody Notice notice) {
        if (notice.getId() == null) { //没有id 就是新增
            noticeService.add(notice);
        } else {
            noticeService.update(notice); // 否则就是删除
        }
        return Result.success();
    }

    //删除
    @DeleteMapping("/{id}")
    @AutoLog("系统公告管理的删除")
    public Result delete(@PathVariable Integer id) {
        noticeService.delete(id);
        return Result.success();
    }



}
