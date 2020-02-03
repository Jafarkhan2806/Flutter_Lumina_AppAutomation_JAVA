package com.resideo.lumina.relayutils;
import java.util.concurrent.TimeUnit;
import jssc.SerialPort;
import jssc.SerialPortEvent;
import jssc.SerialPortEventListener;
import jssc.SerialPortException;


public class SerialDriverCore {

	public static SerialPort serialPort1;
	public static StringBuilder buffer = new StringBuilder();
	public static float Max0 = 1490, Max1 = 1480, Max2, Max3, Min0 = 1000, Min1 = 1190, Min2, Min3;

	public static void initialize() throws Exception {
		String[] portNames = SerialPortList.getPortNames();
		String ZWaveController;
		if (System.getProperty("os.name").toLowerCase().contains("mac")) {
			ZWaveController = ZWaveConstants.ZWAVERelayBoardTTYPort;
		}
		else
		{
			ZWaveController =ZWaveConstants.ZWAVERelayBoardCOMPort; 
		}
		if (portNames.length == 0) {
			throw new Exception("No Serial Port Detected");
		}
	
		
		if (portNames.length == 0) {
			throw new Exception("No Serial Port Detected");
		}
		serialPort1 = new SerialPort(ZWaveController);
		//System.out.println("Port selected " + ZWaveController);

		try {
			if(serialPort1.isOpened()){
				System.out.println("opened");
				serialPort1.closePort();
			}
			serialPort1.openPort();
			serialPort1.setParams(SerialPort.BAUDRATE_9600, SerialPort.DATABITS_8, SerialPort.STOPBITS_1,
					SerialPort.PARITY_NONE);
			serialPort1.setFlowControlMode(SerialPort.FLOWCONTROL_NONE);
			serialPort1.addEventListener(new PortReader(), SerialPort.MASK_RXCHAR);
		} catch (SerialPortException ex) {
			System.out.println("Error writing data to port. Error Occurred: " + ex.getMessage());
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

	public static String getDimmerIntensityPercentageRange(String ch) throws Exception
	{
		int[] intensities = {1495,1330,1258,1212,1186};
		int intensity = getDimmerIntensity(ch);
		int i=0;
		while(i<3)
		{
			if(intensity<intensities[4])
			{
				intensity = getDimmerIntensity(ch);
			}
			else
			{
				break;
			}
			i++;
		}
		
		if(intensity>=intensities[4] && intensity<=intensities[3])
		{
			return "75-100";
		}
		else if(intensity>intensities[3] && intensity<=intensities[2])
		{
			return "50-74";
		}
		else if(intensity>intensities[2] && intensity<=intensities[1])
		{
			return "25-49";
		}
		else if(intensity>intensities[1] && intensity<=intensities[0])
		{
			return "0-24";
		}
		else
		{
			return "Invalid";
		}
	}
	
	public static int getDimmerIntensity(String ch) throws Exception {
		try {
			buffer = new StringBuilder();
			serialPort1.writeString("getdmr");
			TimeUnit.MILLISECONDS.sleep(50);
			serialPort1.writeByte((byte) 0x0D);
			TimeUnit.MILLISECONDS.sleep(50);
			buffer = new StringBuilder();
			serialPort1.writeString(ch);
			TimeUnit.MILLISECONDS.sleep(50);
			serialPort1.writeByte((byte) 0x0D);
			TimeUnit.MILLISECONDS.sleep(50);
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
		int result = Integer.parseInt(temp);
		return result;
		
		/*float res = (float) result;
		float result1 = 0;
		switch (ch) {
		case "0":
			result1 = ((res - (float) Min0) / ((float) Max0 - (float) Min0)) * 100;
			break;
		case "1":
			result1 = ((res - (float) Min1) / ((float) Max1 - (float) Min1)) * 100;
			break;
		case "2":
			result1 = ((res - (float) Min2) / ((float) Max2 - (float) Min2)) * 100;
			break;
		case "3":
			result1 = ((res - (float) Min3) / ((float) Max3 - (float) Min3)) * 100;
			break;
		}
		int res1 = 100 - (int) result1;*/
		//return res1;
	}

	public static String getstatus(String ch) throws Exception {
		try {
			buffer = new StringBuilder();
			serialPort1.writeString("getinp");
			TimeUnit.MILLISECONDS.sleep(300);
			serialPort1.writeByte((byte) 0x0D);
			TimeUnit.MILLISECONDS.sleep(300);
			buffer = new StringBuilder();
			serialPort1.writeString(ch);
			TimeUnit.MILLISECONDS.sleep(300);
			serialPort1.writeByte((byte) 0x0D);
			TimeUnit.MILLISECONDS.sleep(300);
		} catch (SerialPortException e) {
			throw new Exception(e.getMessage());
		}
		return buffer.toString().trim();
	}

	public static boolean DimmerCalibration(String ch) throws Exception {
		try {
			buffer = new StringBuilder();
			serialPort1.writeString("getdmr");
			TimeUnit.MILLISECONDS.sleep(300);
			serialPort1.writeByte((byte) 0x0D);
			TimeUnit.MILLISECONDS.sleep(300);
			buffer = new StringBuilder();
			serialPort1.writeString(ch);
			TimeUnit.MILLISECONDS.sleep(300);
			serialPort1.writeByte((byte) 0x0D);
			TimeUnit.MILLISECONDS.sleep(300);
			String temp = buffer.toString();
			temp = temp.replace(".", "");
			char[] array = temp.toCharArray();
			temp = "";
			for (int i = 0; i < array.length; i++) {
				if (!((int) array[i] == 0)) {
					temp = temp + array[i];
				}
			}
			int result = Integer.parseInt(temp);
			float res = (float) result;
			switch (ch) {
			case "0":
				Min0 = res;
				break;
			case "1":
				Min1 = res;
				break;
			case "2":
				Min2 = res;
				break;
			case "3":
				Min3 = res;
				break;
			}
			buffer = new StringBuilder();
			serialPort1.writeString("getdmr");
			TimeUnit.MILLISECONDS.sleep(300);
			serialPort1.writeByte((byte) 0x0D);
			TimeUnit.MILLISECONDS.sleep(300);
			buffer = new StringBuilder();
			serialPort1.writeString(ch);
			TimeUnit.MILLISECONDS.sleep(300);
			serialPort1.writeByte((byte) 0x0D);
			TimeUnit.MILLISECONDS.sleep(300);
			temp = buffer.toString();
			temp = temp.replace(".", "");
			array = temp.toCharArray();
			temp = "";
			for (int i = 0; i < array.length; i++) {
				if (!((int) array[i] == 0)) {
					temp = temp + array[i];
				}
			}
			result = Integer.parseInt(temp);
			res = (float) result;
			switch (ch) {
			case "0":
				Max0 = res;
				break;
			case "1":
				Max1 = res;
				break;
			case "2":
				Max2 = res;
				break;
			case "3":
				Max3 = res;
				break;
			}

		} catch (SerialPortException e) {
			throw new Exception(e.getMessage());
		}
		return true;
	}

	public static void main(String[] commandLineArguments) throws Exception {
		String ch = "0:1,1:1,2:1";
		initialize();
		setrelay(ch);
		resetrelay(ch);
		closePort();
	}
	public static void setrelay(String ch) throws Exception {
		try {
			/*
			 * 0:0
			 * 0:1
			 * 1:0
			 * 1:1
			 * 2:0 tampered
			 * 2:1
			 * 3:0
			 * 3:1
			 */
			buffer = new StringBuilder();
			serialPort1.writeString("setrly");
			TimeUnit.MILLISECONDS.sleep(3);
			serialPort1.writeByte((byte) 0x0D);
			TimeUnit.MILLISECONDS.sleep(3);
			buffer = new StringBuilder();
			serialPort1.writeString(ch);
			//TimeUnit.MILLISECONDS.sleep(3);
			//serialPort1.writeByte((byte) 0x0D);
			TimeUnit.MILLISECONDS.sleep(3);
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
