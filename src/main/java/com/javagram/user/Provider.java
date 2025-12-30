package com.javagram.user;

public enum Provider {
    LARAVEL,
    OTHER;

    public static Provider from(String value) {
        if (value == null) {
            return LARAVEL;
        }
        return Provider.valueOf(value.toUpperCase());
    }
}
