package ru.valuyskiy.bookshelf.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.valuyskiy.bookshelf.dao.BookDao;
import ru.valuyskiy.bookshelf.model.Book;

import java.util.List;

@Service("bookService")
@Transactional
public class BookServiceImpl implements BookService {

    @Autowired
    private BookDao bookDao;

    @Override
    public Book findBookByID(Long id) {
        return this.bookDao.findBookByID(id);
    }

    @Override
    public void removeBook(Long id) {
        this.bookDao.removeBook(id);
    }

    @Override
    public List<Book> getAllBooks() {
        return this.bookDao.getAllBooks();
    }

    @Override
    public Book saveBook(Book book) {
        this.bookDao.saveBook(book);
        return book;
    }

    @Override
    public void updateBook(Book book) {
        Book tmpBook = bookDao.findBookByID(book.getId());
        if (tmpBook != null && !book.equals(tmpBook)) {
            tmpBook.setTitle(book.getTitle());
            tmpBook.setDescription(book.getDescription());
            tmpBook.setIsbn(book.getIsbn());
            tmpBook.setPrintYear(book.getPrintYear());
            tmpBook.setReadAlready(false);
            tmpBook.setReading(book.getReading());
        }
    }

    @Override
    public void takeBook(Book book) {
        Book tmpBook = bookDao.findBookByID(book.getId());
        if (tmpBook != null) {
            tmpBook.setReadAlready(true);
            tmpBook.setReading(!book.getReading());
        }
    }

    @Override
    public List<Book> findBooks(Book book) {
        return  this.bookDao.findBooks(book);
    }
}
