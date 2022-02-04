package travel.t_board.service;

import travel.t_board.dao.T_boardDAO;
import travel.t_board.vo.T_boardVO;

public class T_boardUpdateService {

	public int service(T_boardVO vo)throws Exception{
		T_boardDAO dao = new T_boardDAO();
		return dao.update(vo);
	}
}
