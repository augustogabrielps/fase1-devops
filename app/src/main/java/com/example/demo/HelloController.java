package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/api")
public class HelloController {

    @GetMapping("/hello")
    public Map<String, String> hello() {
        return Map.of("message", "Hello, DevOps World!", "status", "ok");
    }

    @GetMapping("/info")
    public Map<String, String> info() {
        return Map.of(
            "app", "demo",
            "version", "1.0.0",
            "description", "Spring Boot Demo for DevOps Pipeline"
        );
    }
}
