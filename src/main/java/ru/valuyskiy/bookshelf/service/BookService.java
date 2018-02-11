package ru.valuyskiy.bookshelf.service;

import ru.valuyskiy.bookshelf.model.Book;

import java.util.List;

public interface BookService {
    Book findBookByID(Long id);

    void removeBook(Long id);

    List<Book> getAllBooks();

    Book saveBook(Book book);

    void updateBook(Book book);

    void takeBook(Book book);

    List<Book> findBooks(Book book);
}
