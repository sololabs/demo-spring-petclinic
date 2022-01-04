package org.springframework.samples.petclinic.system;

import org.springframework.web.filter.CommonsRequestLoggingFilter;

public class CustomRequestLoggingFilter extends CommonsRequestLoggingFilter {
    
    public CustomRequestLoggingFilter() {
        super.setIncludeQueryString(true);
        super.setIncludeHeaders(true);
        super.setIncludePayload(false);
    }
}
