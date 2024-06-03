package mission01.api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class OpenApi {
	static final String KEY = "54766b68726a6f6f3130304562465871";

	static Statement stmt = null;
	
	static ResultSet rs = null;
	static ResultSet rs2 = null;
	
	static Connection conn = DBConnection.getConnection();
	
	public static int getTotal() throws Exception{
		URL url = null;
        HttpURLConnection con= null;
        JSONObject result = null;
        StringBuilder sb = new StringBuilder();
        int start = 1;
        int end = 1;
        String baseUrl = "http://openapi.seoul.go.kr:8088/" + KEY + "/" +
                "json/TbPublicWifiInfo/"+ start + "/"+end+"/";

        try {
            url = new URL(baseUrl);
            con = (HttpURLConnection) url.openConnection();

            con.setRequestMethod("GET");

            con.setRequestProperty("Content-type", "application/json");

            con.setDoOutput(true);

            BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
            while(br.ready()) {
                sb.append(br.readLine());
            }
            con.disconnect();
        }catch(Exception e) {
            e.printStackTrace();
        }

        result = (JSONObject) new JSONParser().parse(sb.toString());


        JSONObject data = (JSONObject) result.get("TbPublicWifiInfo");
        int total = Integer.parseInt( data.get("list_total_count").toString());

        return total;
	}
	
	public static void deleteInfo() throws Exception{
      PreparedStatement ps1 = conn.prepareStatement("delete from info");
      ps1.executeUpdate();
	}
	
	public static void getWifiInfo(int total) throws Exception {
		

		int start = 0;
        int end = 0;
        int cnt=0;
        
        int pageEnd = total / 1000;
        int pageEndRemain = total % 1000;
        
        for (int k = 0; k <= pageEnd; k++) {
            start = (int) Math.pow(10, 3) * k + 1;

            if(k == pageEnd){
                end = start + pageEndRemain - 1;
            }
            else{
                end = (int) Math.pow(10, 3) * (k+1) ;
            }

            String baseUrl = "http://openapi.seoul.go.kr:8088/" + KEY + "/" +
                    "json/TbPublicWifiInfo/";

            baseUrl = baseUrl + start + "/" + end + "/";

            URL url = null;
            HttpURLConnection con= null;
            JSONObject result = null;
            StringBuilder sb = new StringBuilder();


            try {
                url = new URL(baseUrl);
                con = (HttpURLConnection) url.openConnection();
                con.setRequestMethod("GET");
                con.setRequestProperty("Content-type", "application/json");
                con.setDoOutput(true);


                BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
                while(br.ready()) {
                    sb.append(br.readLine());
                }
                con.disconnect();
            }catch(Exception e) {
                e.printStackTrace();
            }

            result = (JSONObject) new JSONParser().parse(sb.toString());

            JSONObject data = (JSONObject) result.get("TbPublicWifiInfo");
            JSONArray array = (JSONArray) data.get("row");

            JSONObject now;
            

            String sql = "insert into info values (? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,?)";
            PreparedStatement ps2 = conn.prepareStatement(sql);
            conn.setAutoCommit(false);
            for(int i = 0; i<array.size(); i++) {
                now = (JSONObject) array.get(i);
                
        		ps2.setString(1, (String) now.get("X_SWIFI_MGR_NO"));
        		ps2.setString(2, (String) now.get("X_SWIFI_WRDOFC"));
        		ps2.setString(3, (String) now.get("X_SWIFI_MAIN_NM"));
        		ps2.setString(4, (String) now.get("X_SWIFI_ADRES1"));
        		ps2.setString(5, (String) now.get("X_SWIFI_ADRES2"));
        		ps2.setString(6, (String) now.get("X_SWIFI_INSTL_FLOOR"));
        		ps2.setString(7, (String) now.get("X_SWIFI_INSTL_TY"));
        		ps2.setString(8, (String) now.get("X_SWIFI_INSTL_MBY"));
        		ps2.setString(9, (String) now.get("X_SWIFI_SVC_SE"));
        		ps2.setString(10, (String) now.get("X_SWIFI_CMCWR"));
        		ps2.setString(11, (String) now.get("X_SWIFI_CNSTC_YEAR"));
        		ps2.setString(12, (String) now.get("X_SWIFI_INOUT_DOOR"));
        		ps2.setString(13, (String) now.get("X_SWIFI_REMARS3"));
        		ps2.setString(14, (String) now.get("LAT"));
        		ps2.setString(15, (String) now.get("LNT"));
        		ps2.setString(16, (String) now.get("WORK_DTTM"));
        		
        		ps2.addBatch();

        		cnt++; 
        		if ((cnt % 5000) == 0) {
        			ps2.executeBatch();
            		ps2.clearBatch();
            		conn.commit();
                }
            }
            ps2.executeBatch();
    		ps2.clearBatch();
    		conn.commit();
			
            conn.setAutoCommit(true);

            
        }
	}
}
