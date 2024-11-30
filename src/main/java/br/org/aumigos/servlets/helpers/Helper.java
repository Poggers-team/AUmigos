package br.org.aumigos.servlets.helpers;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface Helper {
    Object execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
