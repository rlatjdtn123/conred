package com.hk.conred.daos;

import com.hk.conred.dtos.SDto;

public interface ICListDao {
	public boolean insertCList(SDto sdto,String[] clist);
}
