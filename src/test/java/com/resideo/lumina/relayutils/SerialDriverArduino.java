package com.resideo.lumina.relayutils;
import java.util.concurrent.TimeUnit;
import jssc.SerialPort;
import jssc.SerialPortEvent;
import jssc.SerialPortEventListener;
import jssc.SerialPortException;


public class SerialDriverArduino /*extends SerialDriverCore*/ {
	public static SerialPort serialPort1=null;
	public static StringBuilder buffer = new StringBuilder();
	public static float Max0 = 1490, Max1 = 1480, Max2, Max3, Min0 = 1000, Min1 = 1190, Min2, Min3;

	public static void initialize() throws Exception {
		String[] portNames = SerialPortList.getPortNames();
		System.out.println(portNames);
		System.out.println(portNames[0].toString());
		String SensorController;
		
		if (System.getProperty("os.name").toLowerCase().contains("mac")) {
			SensorController =RelayConstants.RelayBoardTTYPort; 
			System.out.println(SensorController);
		}
		else
		{
			SensorController =RelayConstants.RelayBoardCOMPort; 
		}
		if (portNames.length == 0) {
			throw new Exception("No Serial Port Detected");
		}
		serialPort1 = new SerialPort(SensorController);
		//System.out.println("Port selected " + ZWaveController);

		try {
			serialPort1.openPort();
			serialPort1.setParams(SerialPort.BAUDRATE_9600, SerialPort.DATABITS_8, SerialPort.STOPBITS_1,
					SerialPort.PARITY_NONE);
			serialPort1.setFlowControlMode(SerialPort.FLOWCONTROL_NONE);
			serialPort1.addEventListener(new PortReader(), SerialPort.MASK_RXCHAR);
			Thread.sleep(1000);
		} catch (SerialPortException ex) {
			throw new Exception("Error writing data to port. Error Occurred: " + ex.getMessage());
		}
	}
	
	public static void closePort() throws Exception
	{
		serialPort1.closePort();
	}

	private static class PortReader implements SerialPortEventListener {
		@Override
		public void serialEvent(SerialPortEvent event) {
			if (event.isRXCHAR() && event.getEventValue() > 0) {
				try {
					String receivedData = serialPort1.readString(event.getEventValue());
					buffer = buffer.append(receivedData);
				} catch (SerialPortException ex) {
					System.out.println("Serial Port Exception. Error Occured : " + ex.getMessage());
				}
			}
		}

	}


	public static void main(String[] commandLineArguments) throws Exception {
		//String ch = "0:1,1:1,2:1";
		initialize();
		/*0  enroll 3
		1 tamper 4
		2 open 5*/
	//	setrelay("0:0,1:0,2:0,3:0,4:0,5:0,6:0,7:0");
	//	Thread.sleep(5000);
	//resetrelay("0:0,1:0,2:0");
	//	closePort();
	}
	public static void setrelay(String ch) throws Exception {
		try {
			serialPort1.writeString(ch);
			TimeUnit.SECONDS.sleep(1);
			System.out.println("Sent com port command "+ ch);
		} catch (SerialPortException e) {
			throw new Exception(e.getMessage());
		}
	}

	public static void resetrelay(String ch) throws Exception {
		try {
			buffer = new StringBuilder();
			serialPort1.writeString("rstrly");
			TimeUnit.MILLISECONDS.sleep(1);
			serialPort1.writeByte((byte) 0x0D);
			TimeUnit.MILLISECONDS.sleep(1);
			buffer = new StringBuilder();
			serialPort1.writeString(ch);
			TimeUnit.MILLISECONDS.sleep(1);
			serialPort1.writeByte((byte) 0x0D);
			TimeUnit.MILLISECONDS.sleep(1);
		} catch (SerialPortException e) {
			throw new Exception(e.getMessage());
		}
		String temp = buffer.toString();
		temp = temp.replace(".", "");
		char[] array = temp.toCharArray();
		temp = "";
		for (int i = 0; i < array.length; i++) {
			if (!((int) array[i] == 0)) {
				temp = temp + array[i];
			}
		}
	}
}
