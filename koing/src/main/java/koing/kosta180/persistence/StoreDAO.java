package koing.kosta180.persistence;

import java.util.List;

import koing.kosta180.domain.StoreVO;

public interface StoreDAO {
	public String getTime();
	public List<StoreVO>  locationStoreList(String s_location_no);
	//public List<StoreVO>  categoryStoreList(String s_category);
}
