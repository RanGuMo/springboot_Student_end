package com.example.service;

import cn.hutool.core.date.DateUtil;
import com.example.dao.NoticeDao;
import com.example.entity.Notice;
import com.example.entity.Params;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service
public class NoticeService {

    @Resource
    private NoticeDao noticeDao;

    public PageInfo<Notice> findBySearch(Params params) {
        PageHelper.startPage(params.getPageNum(), params.getPageSize()); // 开启分页查询
        List<Notice> list = noticeDao.findBySearch(params);// 接下来的查询会自动按照当前开启的分页设置来查询
        return PageInfo.of(list);
    }

    public void add(Notice notice) {
        notice.setTime(DateUtil.now()); //设置时间
        noticeDao.insertSelective(notice);
    }

    public void update(Notice notice) {
        notice.setTime(DateUtil.now()); //设置时间
        noticeDao.updateByPrimaryKeySelective(notice);
    }

    public void delete(Integer id) {
        noticeDao.deleteByPrimaryKey(id);
    }


    public List<Notice> findTop3() {
        return noticeDao.findTop3();
    }
}
