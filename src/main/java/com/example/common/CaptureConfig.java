package com.example.common;

import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@Component
public class CaptureConfig { // 全局存储 验证码的key 和 value值
    public static Map<String, String> CAPTURE_MAP = new HashMap<>();
}