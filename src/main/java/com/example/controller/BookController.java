package com.example.controller;


import com.example.common.Result;
import com.example.entity.Admin;
import com.example.entity.Book;
import com.example.entity.Params;
import com.example.service.BookService;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

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
    public Result delete(@PathVariable Integer id) {
        bookService.delete(id);
        return Result.success();
    }

}
