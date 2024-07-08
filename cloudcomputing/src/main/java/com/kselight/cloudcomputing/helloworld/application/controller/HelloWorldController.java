package com.kselight.cloudcomputing.helloworld.application.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorldController {
    @GetMapping("/hello/world")
    ResponseEntity<String> helloWorld() {
        return ResponseEntity.ok("Hello World");
    }
}