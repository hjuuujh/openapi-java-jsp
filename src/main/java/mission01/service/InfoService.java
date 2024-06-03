package mission01.service;

import java.sql.*;
import mission01.api.*;

import java.util.*;
import java.util.stream.*;

import mission01.model.Info;
public class InfoService {


	private String sql = "";
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	static Connection conn = DBConnection.getConnection();

	
	public List<Info> getInfoList(String x, String y) {
		
		List<Info> infoList = new ArrayList<>();

		try {
			
			sql = "select * from info";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {

				String X_SWIFI_MGR_NO = rs.getString("X_SWIFI_MGR_NO");
				String X_SWIFI_WRDOFC = rs.getString("X_SWIFI_WRDOFC");
				String X_SWIFI_MAIN_NM = rs.getString("X_SWIFI_MAIN_NM");
				String X_SWIFI_ADRES1 = rs.getString("X_SWIFI_ADRES1");
				String X_SWIFI_ADRES2 = rs.getString("X_SWIFI_ADRES2");
				String X_SWIFI_INSTL_FLOOR = rs.getString("X_SWIFI_INSTL_FLOOR");
				String X_SWIFI_INSTL_TY = rs.getString("X_SWIFI_INSTL_TY");
				String X_SWIFI_INSTL_MBY = rs.getString("X_SWIFI_INSTL_MBY");
				String X_SWIFI_SVC_SE = rs.getString("X_SWIFI_SVC_SE");
				String X_SWIFI_CMCWR = rs.getString("X_SWIFI_CMCWR");
				String X_SWIFI_CNSTC_YEAR = rs.getString("X_SWIFI_CNSTC_YEAR");
				String X_SWIFI_INOUT_DOOR = rs.getString("X_SWIFI_INOUT_DOOR");
				String X_SWIFI_REMARS3 = rs.getString("X_SWIFI_REMARS3");
				String LAT = rs.getString("LAT");
				String LNT = rs.getString("LNT");
				String WORK_DTTM = rs.getString("WORK_DTTM");

				Info info = new Info();
				double distance = info.calculateDistance(x, y, LAT, LNT);
				distance = Math.round(distance*10000)/10000.0;
				info.setX_SWIFI_MGR_NO(X_SWIFI_MGR_NO);
				info.setX_SWIFI_WRDOFC(X_SWIFI_WRDOFC);
				info.setX_SWIFI_MAIN_NM(X_SWIFI_MAIN_NM);
				info.setX_SWIFI_ADRES1(X_SWIFI_ADRES1);
				info.setX_SWIFI_ADRES2(X_SWIFI_ADRES2);
				info.setX_SWIFI_INSTL_FLOOR(X_SWIFI_INSTL_FLOOR);
				info.setX_SWIFI_INSTL_TY(X_SWIFI_INSTL_TY);
				info.setX_SWIFI_INSTL_MBY(X_SWIFI_INSTL_MBY);
				info.setX_SWIFI_SVC_SE(X_SWIFI_SVC_SE);
				info.setX_SWIFI_CMCWR(X_SWIFI_CMCWR);
				info.setX_SWIFI_CNSTC_YEAR(X_SWIFI_CNSTC_YEAR);
				info.setX_SWIFI_INOUT_DOOR(X_SWIFI_INOUT_DOOR);
				info.setX_SWIFI_REMARS3(X_SWIFI_REMARS3);
				info.setLAT(LAT);
				info.setLNT(LNT);
				info.setWORK_DTTM(WORK_DTTM);
				info.setDistance(distance);

				infoList.add(info);
			}
			
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		return infoList.stream()
				.sorted(Comparator.comparing(Info::getDistance))
				.limit(20)
				.collect(Collectors.toList())
				;

	}
	
	public Info getInfo(String mgrNo) {
		Info info = new Info();
		try {
			
			
			sql = "select * from info where X_SWIFI_MGR_NO = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mgrNo);
			rs = ps.executeQuery();

			while (rs.next()) {

				String X_SWIFI_MGR_NO = rs.getString("X_SWIFI_MGR_NO");
				String X_SWIFI_WRDOFC = rs.getString("X_SWIFI_WRDOFC");
				String X_SWIFI_MAIN_NM = rs.getString("X_SWIFI_MAIN_NM");
				String X_SWIFI_ADRES1 = rs.getString("X_SWIFI_ADRES1");
				String X_SWIFI_ADRES2 = rs.getString("X_SWIFI_ADRES2");
				String X_SWIFI_INSTL_FLOOR = rs.getString("X_SWIFI_INSTL_FLOOR");
				String X_SWIFI_INSTL_TY = rs.getString("X_SWIFI_INSTL_TY");
				String X_SWIFI_INSTL_MBY = rs.getString("X_SWIFI_INSTL_MBY");
				String X_SWIFI_SVC_SE = rs.getString("X_SWIFI_SVC_SE");
				String X_SWIFI_CMCWR = rs.getString("X_SWIFI_CMCWR");
				String X_SWIFI_CNSTC_YEAR = rs.getString("X_SWIFI_CNSTC_YEAR");
				String X_SWIFI_INOUT_DOOR = rs.getString("X_SWIFI_INOUT_DOOR");
				String X_SWIFI_REMARS3 = rs.getString("X_SWIFI_REMARS3");
				String LAT = rs.getString("LAT");
				String LNT = rs.getString("LNT");
				String WORK_DTTM = rs.getString("WORK_DTTM");

				

				info.setX_SWIFI_MGR_NO(X_SWIFI_MGR_NO);
				info.setX_SWIFI_WRDOFC(X_SWIFI_WRDOFC);
				info.setX_SWIFI_MAIN_NM(X_SWIFI_MAIN_NM);
				info.setX_SWIFI_ADRES1(X_SWIFI_ADRES1);
				info.setX_SWIFI_ADRES2(X_SWIFI_ADRES2);
				info.setX_SWIFI_INSTL_FLOOR(X_SWIFI_INSTL_FLOOR);
				info.setX_SWIFI_INSTL_TY(X_SWIFI_INSTL_TY);
				info.setX_SWIFI_INSTL_MBY(X_SWIFI_INSTL_MBY);
				info.setX_SWIFI_SVC_SE(X_SWIFI_SVC_SE);
				info.setX_SWIFI_CMCWR(X_SWIFI_CMCWR);
				info.setX_SWIFI_CNSTC_YEAR(X_SWIFI_CNSTC_YEAR);
				info.setX_SWIFI_INOUT_DOOR(X_SWIFI_INOUT_DOOR);
				info.setX_SWIFI_REMARS3(X_SWIFI_REMARS3);
				info.setLAT(LAT);
				info.setLNT(LNT);
				info.setWORK_DTTM(WORK_DTTM);
				info.setDistance(0.0000);

			}
			
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		return info;
	}
}
