package com.example.controller;


import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ObjectUtil;
import com.example.common.AutoLog;
import com.example.common.Result;
import com.example.entity.Book;
import com.example.entity.Params;
import com.example.service.BookService;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@CrossOrigin //后端允许跨域
@RestController
@RequestMapping("/book")
public class BookController {

    @Resource
    private BookService bookService;

    //    带分页
    @GetMapping("/search")
    public Result findBySearch(Params params) {
        PageInfo<Book> info = bookService.findBySearch(params);
        return Result.success(info);
    }

    //新增和编辑
    @PostMapping
    @AutoLog("新增或编辑图书信息")
    public Result save(@RequestBody Book book) {
        if (book.getId() == null) { //没有id 就是新增
            bookService.add(book);
        } else {
            bookService.update(book); // 否则就是删除
        }
        return Result.success();
    }

    //删除
    @DeleteMapping("/{id}")
    @AutoLog("删除图书信息")
    public Result delete(@PathVariable Integer id) {
        bookService.delete(id);
        return Result.success();
    }

    //echarts 饼状图
    @GetMapping("/echarts/pie")
    public Result pie(){
      // 查询出所有图书
        List<Book> list = bookService.finAll();
        Map<String,Long> collect = list.stream() //转为stream流
                .filter(x-> ObjectUtil.isNotEmpty(x.getTypeName())) //过滤空的TypeName，留下不为空的TypeName
                .collect(Collectors.groupingBy(Book::getTypeName,Collectors.counting())); // 统计TypeName出现的次数
        //最后返回给前端的数据结构
        List<Map<String,Object>> mapList = new ArrayList<>(); // [{name:'生活类图书',value:2},{}] 这种数据结构
        if(CollectionUtil.isNotEmpty(collect)){
            for (String key : collect.keySet()) {
                Map<String,Object> map = new HashMap<>();
                map.put("name",key);
                map.put("value",collect.get(key));
                mapList.add(map);
            }
        }
        return Result.success(mapList);
    }

     // echarts 柱状图
    @GetMapping("/echarts/bar")
    public Result bar(){
        // 查询出所有图书
        List<Book> list = bookService.finAll();
        Map<String,Long> collect = list.stream() //转为stream流
                .filter(x-> ObjectUtil.isNotEmpty(x.getTypeName())) //过滤空的TypeName，留下不为空的TypeName
                .collect(Collectors.groupingBy(Book::getTypeName,Collectors.counting())); // 统计TypeName出现的次数
        //最后返回给前端的数据结构
        List<String> xAxis = new ArrayList<>();
        List<Long> yAxis = new ArrayList<>();
        if(CollectionUtil.isNotEmpty(collect)){
            for (String key : collect.keySet()) {
                xAxis.add(key);
                yAxis.add(collect.get(key));
            }
        }

        Map<String,Object> map = new HashMap<>();
        map.put("xAxis",xAxis);
        map.put("yAxis",yAxis);
        return Result.success(map);
    }

}
