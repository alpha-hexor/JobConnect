package com.jobConnect.Wenconfiguration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Map the /uploads/ URL path to the C:/uploads/ folder
        registry.addResourceHandler("/uploads/**")
                .addResourceLocations("file:///C:/uploads/");
        
     // New mapping specifically for profile pictures
        registry.addResourceHandler("/uploads/photos/**")
                .addResourceLocations("file:///C:/uploads/photos/");
    }
}
