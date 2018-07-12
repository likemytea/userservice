/**
 * 
 */
package com.chenxing.userservice.outeriface.schedual;

import org.springframework.stereotype.Component;

import com.chenxing.userservice.outeriface.Servicehi;

/**
 * @author HXDF
 *
 */
@Component
public class SchedualServiceHiHystric implements Servicehi {

	@Override
	public String sayHiFromClient(String name) {
		return "网络异常或被调用服务重启过程中...： " + name;
	}

}
