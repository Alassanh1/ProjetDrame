package dao;

import jakarta.persistence.EntityManager;
import model.Formation;

class FormationDAO extends GenericDAO<Formation, Long> {
    public FormationDAO(EntityManager em) {
        super(em, Formation.class);
    }
}