package com.example.service;

import com.example.dao.TypeDao;
import com.example.entity.Book;
import com.example.entity.Type;
import com.example.entity.Params;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service
public class TypeService {

    @Resource
    private TypeDao typeDao;

    public PageInfo<Type> findBySearch(Params params) {
        PageHelper.startPage(params.getPageNum(), params.getPageSize()); // 开启分页查询
        List<Type> list = typeDao.findBySearch(params);// 接下来的查询会自动按照当前开启的分页设置来查询
        return PageInfo.of(list);
    }

    public void add(Type type) {
        typeDao.insertSelective(type);
    }

    public void update(Type type) {
        typeDao.updateByPrimaryKeySelective(type);
    }

    public void delete(Integer id) {
        typeDao.deleteByPrimaryKey(id);
    }

    public List<Type> findAll() {
       return typeDao.selectAll();
    }
}
