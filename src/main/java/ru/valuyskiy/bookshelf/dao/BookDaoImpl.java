package ru.valuyskiy.bookshelf.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ru.valuyskiy.bookshelf.model.Book;

import java.util.List;

@Repository("bookDao")
public class BookDaoImpl implements BookDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public Book findBookByID(Long id) {
        Session session =this.sessionFactory.getCurrentSession();
        Book book = (Book) session.get(Book.class, new Long(id));
        return book;
    }

    @Override
    public void removeBook(Long id) {
        Session session =this.sessionFactory.getCurrentSession();
        Book book = (Book) session.get(Book.class, new Long(id));

        if (book !=null){
            session.delete(book);
        }
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Book> getAllBooks() {
        Session session =this.sessionFactory.getCurrentSession();
        List<Book> bookList = session.createQuery("from Book").list();

        return bookList;
    }

    @Override
    public void saveBook(Book book) {
        Session session =this.sessionFactory.getCurrentSession();
        session.persist(book);
    }

    @Override
    public List<Book> findBooks(Book book) {
        Session session =this.sessionFactory.getCurrentSession();
        boolean isNull = true;

        StringBuilder query = new StringBuilder();
        query.append("FROM Book B WHERE LOWER(B.author) LIKE '%"+book.getAuthor().trim().toLowerCase()+"%' AND " +
                "LOWER(B.title) LIKE '%" +book.getTitle().trim().toLowerCase()+"%'");

        if (book.getReadAlready() == true) {
            query.append(" AND B.readAlready=0");
        }

        if (book.getPrintYear() != null) {
            query.append(" AND B.printYear=" + book.getPrintYear());
        }

        List<Book> bookList = session.createQuery(query.toString()).list();

        return bookList;
    }



}
