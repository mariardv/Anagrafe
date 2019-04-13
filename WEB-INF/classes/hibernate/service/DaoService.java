package hibernate.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import hibernate.model.ClientForm;

public class DaoService {

	private HibernateTemplate s;

	public void setS(HibernateTemplate s) {
		this.s = s;
	}
	
	@Transactional(readOnly=false)
	public boolean addUser(ClientForm ut) {
		
		try {
			
			//s.save(ut);
			s.saveOrUpdate(ut);
			
		} catch (Exception e) { return false; }
		
		return true;
	}
	
	@SuppressWarnings("unchecked")
	public List<ClientForm> loadUser(){
		
		List<ClientForm> list = (List<ClientForm>) s.findByCriteria(DetachedCriteria.forClass(ClientForm.class));
		
		return list;
	}

	@Transactional(readOnly=false)
	public void deleteUser(int id) {
		
		ClientForm c = s.load(ClientForm.class, id);
		s.delete(c);
	}
	
	public ClientForm findUser(int id) {
		
		ClientForm c = s.get(ClientForm.class, id);
		
		return c;
		
	}
}
