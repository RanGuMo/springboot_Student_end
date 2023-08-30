package com.example.service;

import com.example.dao.AuditDao;
import com.example.entity.Audit;
import com.example.entity.Params;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service
public class AuditService {

    @Resource
    private AuditDao auditDao;

    public PageInfo<Audit> findBySearch(Params params) {
        PageHelper.startPage(params.getPageNum(), params.getPageSize()); // 开启分页查询
        List<Audit> list = auditDao.findBySearch(params);// 接下来的查询会自动按照当前开启的分页设置来查询
        return PageInfo.of(list);
    }

    public void add(Audit audit) {
        auditDao.insertSelective(audit);
    }

    public void update(Audit audit) {
        auditDao.updateByPrimaryKeySelective(audit);
    }

    public void delete(Integer id) {
        auditDao.deleteByPrimaryKey(id);
    }

    public List<Audit> findAll() {
       return auditDao.selectAll();
    }
}
