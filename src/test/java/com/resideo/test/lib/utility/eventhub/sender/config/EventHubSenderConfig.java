package com.resideo.test.lib.utility.eventhub.sender.config;

import java.io.File;
import java.io.IOException;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class EventHubSenderConfig {

	private String connectionString;
	private String partitionKey;
	
	public EventHubSenderConfig (String configFilename) throws JsonProcessingException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		JsonNode root = mapper.readTree(new File(configFilename));
		connectionString = root.get("ConnectionString").asText();
		partitionKey = root.get ("PartitionKey").asText();
	}

	public String getConnectionString() {
		return connectionString;
	}

	public String getPartitionKey() {
		return partitionKey;
	}
}