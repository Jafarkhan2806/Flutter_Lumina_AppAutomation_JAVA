package com.honeywell.devicepoolfilter;

import org.json.JSONObject;

import com.honeywell.commons.coreframework.FrameworkGlobalVariables;
import com.honeywell.commons.coreframework.TestCaseInputs;
import com.honeywell.commons.devicepool.DevicePoolFilters;

public class ResourceOnlineFilter implements DevicePoolFilters{

	@Override
	public boolean filter(TestCaseInputs inputs,JSONObject result) {
		
		
		JSONObject accInformationObject = result.getJSONObject("accountInformation");
		
		String userName = FrameworkGlobalVariables.BLANK;
		String password = FrameworkGlobalVariables.BLANK;
		
		if(accInformationObject.has("USERID")){
			userName = accInformationObject.getString("USERID");
		}else{
			FrameworkGlobalVariables.logger4J.logError("Device pool filter : UserID is not provided");
			return true;
		}
		
		if(accInformationObject.has("PASSWORD")){
			password = accInformationObject.getString("PASSWORD");
		}else{
			FrameworkGlobalVariables.logger4J.logError("Device pool filter : Password is not provided");
			return true;
		}
		
		try(ChapiUtil chapiUtil = new ChapiUtil(inputs)){
			if(chapiUtil.getConnection(userName, password)){
				return chapiUtil.isAllDevicesOnLine();
			}else{
				FrameworkGlobalVariables.logger4J.logError("Device pool filter : Not able to connect to Chapi.");
				return true;
			}
		} catch (Exception e) {
			FrameworkGlobalVariables.logger4J.logError("Device pool filter : Not able to connect to Chapi.");
			return false;
		}
	}

}
