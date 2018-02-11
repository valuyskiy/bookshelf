package ru.valuyskiy.bookshelf.dao;

import ru.valuyskiy.bookshelf.model.Book;

import java.util.List;

public interface BookDao {
    Book findBookByID(Long id);

    void removeBook(Long id);

    List<Book> getAllBooks();

    void saveBook(Book book);

    List<Book> findBooks(Book book);

}
