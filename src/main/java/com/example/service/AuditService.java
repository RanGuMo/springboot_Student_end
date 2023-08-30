package com.example.service;

import cn.hutool.core.util.ObjectUtil;
import com.example.common.JwtTokenUtils;
import com.example.dao.AdminDao;
import com.example.dao.AuditDao;
import com.example.entity.Admin;
import com.example.entity.Audit;
import com.example.entity.Params;
import com.example.exception.CustomException;
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
        Admin user = JwtTokenUtils.getCurrentUser();
        if (ObjectUtil.isNull(user)) {
            throw new CustomException("从token中未解析到用户信息，请重新登录");
        }
        // 如果角色是学生就只能查看自己的请假信息，其他角色可以查看所有请假列表
        if ("ROLE_STUDENT".equals(user.getRole())) {
            params.setUserId(user.getId());
        }

//        这个开启必须跟着你你需要的查询语句，因为他只对开启后的第一个查询生效，第二个查询就不会生效
        PageHelper.startPage(params.getPageNum(), params.getPageSize()); // 开启分页查询，
        List<Audit> list = auditDao.findBySearch(params);// 接下来的查询会自动按照当前开启的分页设置来查询
//        for (Audit audit : list) { //遍历结果
//           if(ObjectUtil.isNotEmpty(audit.getUserId())){
//               Admin admin = adminDao.selectByPrimaryKey(audit.getUserId()); //查询用户表，找对对应的用户名字
//               if(ObjectUtil.isNotEmpty(admin)){
//                   audit.setUserName(admin.getName());//塞到UserName中，返回给前端
//               }
//           }
//        }
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
