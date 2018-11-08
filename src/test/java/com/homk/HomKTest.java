package com.homk;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.junit.runner.RunWith;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * 启动程序
 * 
 * @author ruoyi
 */
//@RunWith(SpringRunner.class)
//@SpringBootTest
public class HomKTest
{
    public static void main(String[] args) {

        String a = new Md5Hash("admin" + "123456" + "09f8b5").toHex().toString();
        System.out.println(a);
    }
}