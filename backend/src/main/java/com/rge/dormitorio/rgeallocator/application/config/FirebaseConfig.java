package com.rge.dormitorio.rgeallocator.application.config;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;

import jakarta.annotation.PostConstruct;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.io.FileInputStream;
import java.io.IOException;


@Configuration
public class FirebaseConfig {

    @Bean
    public FirebaseApp firebaseApp() throws IOException {
        String firebaseCredPath = System.getenv("FIREBASE_CREDENTIALS_PATH");
        if (firebaseCredPath == null || firebaseCredPath.isEmpty()) {
            firebaseCredPath = "src/cred/firebase-adminsdk.json"; // padrão para local
        }

        FileInputStream serviceAccount = new FileInputStream(firebaseCredPath);

        FirebaseOptions options = FirebaseOptions.builder()
                .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                .build();

        return FirebaseApp.initializeApp(options);
    }
}
