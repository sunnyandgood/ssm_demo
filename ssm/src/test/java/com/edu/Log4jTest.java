package com.edu;

import org.apache.log4j.Logger;
import org.junit.Test;

public class Log4jTest {
    @Test
    public void testLog4j(){
        Logger logger = Logger.getLogger(Log4jTest.class);
        logger.trace("trace级别");
        logger.debug("debug级别");
        logger.info("info级别");
        logger.error("error级别");
    }
}
