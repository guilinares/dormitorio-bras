package com.rge.dormitorio.rgeallocator.adapters.controller.input;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserRegisterBody {
    private String firebaseUid;
    private String email;
}
