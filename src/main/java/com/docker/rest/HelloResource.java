package com.docker.rest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by sherry on 2017/12/20.
 */
@RestController
public class HelloResource {

    @RequestMapping("/")
    public String home() {
        return "Hello Docker World. <br />"
                + "Welcome to <a href='http://waylau.com'>waylau.com</a></li>";
    }
}
