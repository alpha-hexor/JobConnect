package com.jobConnect.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

@Service
public class FileStorageService {

    private static final String UPLOAD_DIR = "C:/uploads/";

    public String saveFile(MultipartFile file) {
        try {
            // Generate a unique filename to avoid overwriting
            String fileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
            Path path = Paths.get(UPLOAD_DIR + fileName);
            Files.createDirectories(path.getParent()); // Ensure the upload directory exists
            file.transferTo(path.toFile());  // Save the file to the filesystem
            return fileName; // Return the filename to save in the database
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
