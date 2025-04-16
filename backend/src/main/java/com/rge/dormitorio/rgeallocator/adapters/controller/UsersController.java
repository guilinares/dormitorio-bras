package com.rge.dormitorio.rgeallocator.adapters.controller;

import com.google.firebase.auth.FirebaseAuthException;
import com.rge.dormitorio.rgeallocator.adapters.controller.input.UserRegisterBody;
import com.rge.dormitorio.rgeallocator.adapters.database.entity.UserEntity;
import com.rge.dormitorio.rgeallocator.domain.services.UserService;
import com.rge.dormitorio.rgeallocator.domain.utils.FirebaseTokenUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor
public class UsersController {

    private final UserService service;

    @CrossOrigin("*")
    @PostMapping("/register")
    public ResponseEntity<UserEntity> register(@RequestBody UserRegisterBody request) {
        UserEntity user = service.saveIfNotExists(request.getFirebaseUid(), request.getEmail());
        return ResponseEntity.ok(user);
    }

    @CrossOrigin("*")
    @GetMapping("/me")
    public ResponseEntity<UserEntity> me(@RequestHeader("Authorization") String token) throws FirebaseAuthException {
        String uid = FirebaseTokenUtils.extractUidFromToken(token);
        return service.findByFirebaseUid(uid)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
}
