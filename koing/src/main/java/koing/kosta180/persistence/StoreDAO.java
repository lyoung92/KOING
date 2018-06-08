package koing.kosta180.persistence;

import java.util.List;

import koing.kosta180.domain.StoreVO;

public interface StoreDAO {
	public void insertStore(StoreVO vo) throws Exception;
	
	public List<StoreVO> listStore(String s_category)throws Exception;
	
	public StoreVO detailStore(String s_no)throws Exception;
	
	public void updateStrore(StoreVO vo)throws Exception;
	
	public void deleteStore(String s_no) throws Exception;
	
	public String getTime() throws Exception;
	
	public List<StoreVO>  locationStoreList(String s_location_no)throws Exception;
	
	//public List<StoreVO>  categoryStoreList(String s_category)throws Exception;
	
	public void addFile(String fullName) throws Exception;
}
