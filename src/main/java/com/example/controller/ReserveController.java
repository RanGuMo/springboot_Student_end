package com.example.controller;

import cn.hutool.core.date.DateUtil;
import com.example.common.AutoLog;
import com.example.common.Result;
import com.example.dao.HotelDao;
import com.example.entity.Hotel;
import com.example.entity.Reserve;
import com.example.entity.Params;
import com.example.service.ReserveService;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;


@CrossOrigin
@RestController
@RequestMapping("/reserve")
public class ReserveController {

    @Resource
    private ReserveService reserveService;
    @Resource
    private HotelDao hotelDao;

    @GetMapping("/search")
    public Result findBySearch(Params params) {
        PageInfo<Reserve> info = reserveService.findBySearch(params);
        return Result.success(info);
    }

    @PostMapping
    @AutoLog("酒店预约")
    public Result save(@RequestBody Reserve reserve) {
        // 1. 酒店剩余房间是否为0，大于0的时候，才可以被预定
        Hotel hotel = hotelDao.selectByPrimaryKey(reserve.getHotelId());
        if (hotel.getNum() == 0) {
            return Result.error("酒店该房间以预定完，请预定其他房间");
        }

        // 2. 往预定表里插入一条预定记录
        reserve.setTime(DateUtil.now());
        reserveService.add(reserve);

        // 3. 对应的酒店房间剩余数量减一
        hotel.setNum(hotel.getNum() - 1);
        hotelDao.updateByPrimaryKeySelective(hotel);

        return Result.success();
    }

    @DeleteMapping("/{id}")
    @AutoLog("酒店预约的删除")
    public Result delete(@PathVariable Integer id) {
        reserveService.delete(id);
        return Result.success();
    }

}