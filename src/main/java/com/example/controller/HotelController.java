package com.example.controller;

import com.example.common.AutoLog;
import com.example.common.Result;
import com.example.entity.Hotel;
import com.example.entity.Params;
import com.example.service.HotelService;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;


@CrossOrigin
@RestController
@RequestMapping("/hotel")
public class HotelController {

    @Resource
    private HotelService hotelService;

    @GetMapping("/search")
    public Result findBySearch(Params params) {
        PageInfo<Hotel> info = hotelService.findBySearch(params);
        return Result.success(info);
    }

    @PostMapping
    @AutoLog("新增或编辑的酒店管理")
    public Result save(@RequestBody Hotel hotel) {
        if (hotel.getId() == null) {
            hotelService.add(hotel);
        } else {
            hotelService.update(hotel);
        }
        return Result.success();
    }

    @DeleteMapping("/{id}")
    @AutoLog("根据id删除酒店管理")
    public Result delete(@PathVariable Integer id) {
        hotelService.delete(id);
        return Result.success();
    }

}