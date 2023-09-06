package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.BranchDAO;
import kr.kh.app.dao.MemberDAO;
import kr.kh.app.vo.BranchVO;

public class BranchServiceImp implements BranchService {

	private BranchDAO branchDao;
	private MemberDAO memberDao;
	
	public BranchServiceImp() {
		try {
			final String MYBATIS_CONFIG_PATH = "kr/kh/app/config/mybatis-config.xml";
			InputStream is = Resources.getResourceAsStream(MYBATIS_CONFIG_PATH);
			SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(is);
			SqlSession session = sf.openSession(true);
			branchDao = session.getMapper(BranchDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean insertBranch(BranchVO branch) {
		if(branch == null || branch.getBr_name() == null || branch.getBr_phone() == null) {
			return false;
		}
		branchDao.insertBranch(branch);
		return true;
	}

	@Override
	public ArrayList<BranchVO> getBranchList() {
		return branchDao.selectBranchList();
	}


}