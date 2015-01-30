package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;


@WebFilter(filterName = "EncodingFilter", urlPatterns = { "/*" }, 
           initParams = {
		            @WebInitParam(name="requestEncoding",value="utf-8"),
		            @WebInitParam(name="responseEncoding",value="text/html;charset=utf-8")
		            }
)
public class EncodingFilter implements Filter {
	private String requestEncoding;
	private String responseEncoding;

	@Override
	public void destroy() {
		

	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		arg0.setCharacterEncoding(requestEncoding);
		arg1.setContentType(responseEncoding);
		arg2.doFilter(arg0, arg1);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		requestEncoding=arg0.getInitParameter("requestEncoding");
		responseEncoding=arg0.getInitParameter("responseEncoding");
	}

}
