package com.jobConnect.controller;

import com.jobConnect.service.MessageService;
import com.jobConnect.entity.Message;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MessageController {
    
    @Autowired
    private MessageService messageService;

    @PostMapping("/send-message")
    public String postMessage(@ModelAttribute("message") Message message, RedirectAttributes redirectAttributes) {
        try {
            messageService.addMessage(message);
            redirectAttributes.addFlashAttribute("success", "Your message has been successfully sent.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "An error occurred while sending your message. Please try again.");
        }
        return "redirect:/contact"; // Redirect back to the contact page
    }




}
