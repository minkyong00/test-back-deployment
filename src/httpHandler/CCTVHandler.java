package httpHandler;

import java.io.IOException;

import com.google.gson.JsonArray;
import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;

import util.HandlerUtil;
import util.APIUtil.CctvAPI;

public class CCTVHandler implements HttpHandler {

	@Override
	public void handle(HttpExchange exchange) throws IOException {
		
		String cctvStr = "";
		HandlerUtil.optionsEquals(exchange);
		
		JsonArray cctvs = CctvAPI.getCctvArray();
		cctvStr = cctvs.toString();
		
		HandlerUtil.sendResponse(exchange, cctvStr);
	};

}
