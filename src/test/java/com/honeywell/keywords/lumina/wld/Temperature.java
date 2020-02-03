package com.honeywell.keywords.lumina.wld;


// Singleton
public class Temperature{
//	private char tempUnit;
	private float temperatureVal = 0;
	private float F = 0;
	private float C = 0;
	
	public float getTemperatureVal() {
		
		return temperatureVal;
	}
	
	public float getF() {
		
		return F;
	}
	
	public float getC() {
			
			return C;
	}
	
//	public char getTempUnit() {
//			
//			return tempUnit;
//	}
	
	public void setTempF(float tempVal) {
		this.F = tempVal;
	}
	
	public void setTempC(float tempVal) {
		this.C = tempVal;
	}
	
	public void setTemperatureVal(float tempVal) {
		this.temperatureVal = tempVal;
	}
//	
//	public void setTempUnit(char tempUnit) {	
//		this.tempUnit =  tempUnit;
//	}
	
	// static variable single_instance of type Singleton 
    private static Temperature single_instance = null; 
  
  
    // static method to create instance of Singleton class 
    public static Temperature getInstance() 
    { 
        if (single_instance == null) 
            single_instance = new Temperature(); 
  
        return single_instance; 
    } 
}
