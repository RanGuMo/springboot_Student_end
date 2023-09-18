package com.example.service;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ObjectUtil;
import com.example.dao.BookDao;
import com.example.dao.TypeDao;
import com.example.entity.Book;
import com.example.entity.Params;
import com.example.entity.Type;
import com.example.exception.CustomException;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class BookService {

    @Resource
    private BookDao bookDao;

    @Resource
    private TypeDao typeDao;

    public PageInfo<Book> findBySearch(Params params) {
        PageHelper.startPage(params.getPageNum(), params.getPageSize()); // 开启分页查询
        List<Book> list = bookDao.findBySearch(params);// 接下来的查询会自动按照当前开启的分页设置来查询

        //方式一：通过java代码的方式根据typeId 查询 type表并设置字段 typeName
//        if (CollectionUtil.isEmpty(list)) {
//            return PageInfo.of(new ArrayList<>());
//        }
//        for (Book book : list) {
//            if (ObjectUtil.isNotEmpty(book.getTypeId())) {
//                Type type = typeDao.selectByPrimaryKey(book.getTypeId());
//                if (ObjectUtil.isNotEmpty(type)) {
//                    book.setTypeName(type.getName());
//                }
//            }
//        }
        //方式二：通过在xml中 编写 sql语句进行查询（我这里用的是方式二）

        return PageInfo.of(list);
    }

    public void add(Book book) {
        // 1. 图书名称不能为空
        if (book.getName() == null || "".equals(book.getName())) {
            throw new CustomException("图书名称不能为空");
        }
        // 2. 进行重复性判断，同一名字的 图书名称 不允许重复新增：只要根据 图书名称 去数据库查询一下就可以了
        Book book1 = bookDao.findByName(book.getName());
        if (book1 != null) {
            // 说明已经有了，这里我们就要提示前台不允许新增了
            throw new CustomException("该图书名称已存在，请更换图书名称");
        }

        bookDao.insertSelective(book);
    }

    public void update(Book book) {
        bookDao.updateByPrimaryKeySelective(book);
    }

    public void delete(Integer id) {
        bookDao.deleteByPrimaryKey(id);
    }

    public List<Book> finAll() {
       return bookDao.findAll();
    }
}
