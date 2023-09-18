package com.example.dao;

import com.example.entity.Book;
import com.example.entity.Params;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

@Repository
public interface BookDao extends Mapper<Book> {


    List<Book> findBySearch(@Param("params") Params params);

    @Select("select * from book where name = #{name} limit 1")
    Book findByName(@Param("name") String name);

    @Select("select a.*,b.name as typeName from book a left join type b on a.typeId = b.id")
    List<Book> findAll();

}
