package com.example.service;

import cn.hutool.core.util.ObjectUtil;
import com.example.dao.AdminDao;
import com.example.dao.AuditDao;
import com.example.entity.Admin;
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

    @Resource
    private AdminDao adminDao;

    public PageInfo<Audit> findBySearch(Params params) {
//        这个开启必须跟着你你需要的查询语句，因为他只对开启后的第一个查询生效，第二个查询就不会生效
        PageHelper.startPage(params.getPageNum(), params.getPageSize()); // 开启分页查询，
        List<Audit> list = auditDao.findBySearch(params);// 接下来的查询会自动按照当前开启的分页设置来查询
        for (Audit audit : list) { //遍历结果
           if(ObjectUtil.isNotEmpty(audit.getUserId())){
               Admin admin = adminDao.selectByPrimaryKey(audit.getUserId()); //查询用户表，找对对应的用户名字
               if(ObjectUtil.isNotEmpty(admin)){
                   audit.setUserName(admin.getName());//塞到UserName中，返回给前端
               }
           }
        }
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
