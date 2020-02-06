package com.resideo.lumina.relayutils;

import java.io.PrintWriter;
import java.util.Scanner;

import com.fazecast.jSerialComm.SerialPort;
import com.resideo.lumina.utils.Glv;

public class SerialComm extends Glv {
	public SerialComm() {
		SerialPort[] ports = SerialPort.getCommPorts();
		for (int i = 0; i < ports.length; i++) {
			System.out.println(ports[i].getDescriptivePortName());
			if (ports[i].openPort()) {
				System.out.println("Port opened successfully.");
				int count = 0;
				while (dataRead == null) {
					sendData(ports[i], "V\r");
					count++;
					if (dataRead == null)
						sendData(ports[i], "test");
					if (count == 6)
						dataRead = "null";
				}

				if (dataRead.equalsIgnoreCase("EBBv13_and_above EB Firmware Version 2.0.1")) {
					usePortEBB = ports[i];
					System.out.println(ports[i].getDescriptivePortName() + "Port assigned EBB board");
					dataRead = null;
					delay(2000);

				}

				else if ((dataRead.equalsIgnoreCase("Devices")) || (dataRead.equalsIgnoreCase("V"))) {
					usePortDevice = ports[i];
					System.out.println(ports[i].getDescriptivePortName() + "Port assigned ISMV");
					dataRead = null;
					delay(2000);

					// }
					// }
				} else {
					System.out.println("Unable to open the port.");
					dataRead = null;
				}
			}
		}
	}

	public static void main(String[] args) {
		new SerialComm();
		// int count = 0;
		// enrollSensor("ISMV");
		enrollSensor("OSMV");

		// SerialComm.Trigger("OSMV");

	}

	public static String recieveData(SerialPort port) {
		dataRead = null;
		@SuppressWarnings("resource")
		Scanner data = new Scanner(port.getInputStream());
		// while(usePort.bytesAvailable()<=0);
		while (data.hasNextLine()) {
			// System.out.println(data.nextLine());
			dataRead = data.nextLine();
		}
		return dataRead;
	}

	public static String sendData(SerialPort port, String writeData1) {

		PrintWriter write1 = new PrintWriter(port.getOutputStream());
		write1.print(writeData1);
		write1.flush();
		write1.close();
		delay(1500);
		String data = recieveData(port);
		System.out.println(data);
		return data;
	}

	public static void enrollSensor(String sensor) {
		String data = sensor.toLowerCase() + "_prog";
		System.out.println(data);
		sendData(usePortDevice, data);
		System.out.println("Enrollment5 triggered");

	}

	public static void Trigger(String sensor) {
		String data = sensor.toLowerCase() + "_trigger";
		if (data.equalsIgnoreCase("ismv_trigger")) {
			sendData(usePortDevice, "ismv_trigger");
			delay(20000);
			sendData(usePortEBB, "SM,1000,0,1150\r");
			delay(3100);
			sendData(usePortEBB, "SM,1000,0,-1150\r");
			delay(4100);
			sendData(usePortDevice, "AllOff");

		}

		else if (data.equalsIgnoreCase("osmv_trigger")) {
			sendData(usePortDevice, "osmv_trigger");
			delay(10000);
			sendData(usePortEBB, "SM,1000,0,-1200\r");
			delay(3000);
			sendData(usePortEBB, "SM,1000,0,1200\r");
			delay(3000);
			sendData(usePortDevice, "AllOff");
		} else if (data.equalsIgnoreCase("Door_trigger")) {
			sendData(usePortDevice, "Door_trigger");
			sendData(usePortDevice, "Door_trigger_restore");

		}

		else if (data.equalsIgnoreCase("Door_trip_trigger")) {
			sendData(usePortDevice, "Door_trigger");

		}

		else if (data.equalsIgnoreCase("Door_trip_restore_trigger")) {
			sendData(usePortDevice, "Door_trigger_restore");
		}
	}

	public static void delay(long x) {
		try {
			Thread.sleep(x);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
