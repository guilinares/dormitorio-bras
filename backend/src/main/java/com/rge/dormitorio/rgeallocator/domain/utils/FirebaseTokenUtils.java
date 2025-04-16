package com.rge.dormitorio.rgeallocator.domain.utils;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.FirebaseToken;

public class FirebaseTokenUtils {

    public static String extractUidFromToken(String authorizationHeader) throws FirebaseAuthException {
        String token = authorizationHeader.replace("Bearer ", "");
        FirebaseToken decodedToken = FirebaseAuth.getInstance().verifyIdToken(token);
        return decodedToken.getUid();
    }
}
