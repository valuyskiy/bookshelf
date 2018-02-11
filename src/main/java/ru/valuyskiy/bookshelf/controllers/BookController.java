package ru.valuyskiy.bookshelf.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import ru.valuyskiy.bookshelf.model.Book;
import ru.valuyskiy.bookshelf.service.BookService;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/")
@ComponentScan("ru.valuyskiy.bookshelf")
public class BookController {

    @Autowired
    private BookService bookService;

    @RequestMapping(value = {"/", "/books", "/list"}, method = RequestMethod.GET)
    public String listBooks(@RequestParam(required = false) Integer page, Model model) {

        List<Book> books = bookService.getAllBooks();

        PagedListHolder<Book> pagedListHolder = new PagedListHolder<>(books);
        pagedListHolder.setPageSize(10);

        model.addAttribute("maxPages", pagedListHolder.getPageCount());
        if (page == null || page < 1 || page > pagedListHolder.getPageCount()) {
            page = 1;
        }
        model.addAttribute("page", page);

        if (page == null || page < 1 || page > pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(0);
            model.addAttribute("listBooks", pagedListHolder.getPageList());
        } else if (page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page - 1);
            model.addAttribute("listBooks", pagedListHolder.getPageList());
        }

        model.addAttribute("books", books);
        model.addAttribute("book", new Book());
        return "books";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addNewBook(Model model) {
        model.addAttribute("book", new Book());
        return "editBook";
    }


    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String showEditBook(Model model, @PathVariable("id") long id) {
        model.addAttribute("book", bookService.findBookByID(id));
        return "editBook";
    }

    @RequestMapping(value = "/show/{id}", method = RequestMethod.GET)
    public String showBook(Model model, @PathVariable("id") long id) {
        Book book = bookService.findBookByID(id);
        model.addAttribute("book", book);
        return "showBook";
    }

    @RequestMapping(value = "/take/{id}", method = RequestMethod.GET)
    public String takeBook(Model model, @PathVariable("id") long id) {
        Book book = bookService.findBookByID(id);
        bookService.takeBook(book);
        model.addAttribute("book", book);
        return "redirect:/show/" + id;
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String deleteBook(Model model, @PathVariable("id") long id) {
        bookService.removeBook(id);
        return "redirect:/books";
    }


    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String saveBook(@ModelAttribute @Valid Book book, BindingResult bindingResult, Model model) {

       if (bindingResult.hasErrors()){
           model.addAttribute("book", book);
           return "editBook";
       }

        Book savedBook = book;

        if (book.getId() == null) {                                                // новая книга
            savedBook = bookService.saveBook(book);
        } else {
            bookService.updateBook(book);
        }
        model.addAttribute("book", savedBook);
        return "redirect:/show/" + savedBook.getId();
    }

    @RequestMapping(value = "/find", method = RequestMethod.POST)
    public String findBooks(@ModelAttribute Book book, Model model) {
        List<Book> books = bookService.findBooks(book);


        model.addAttribute("listBooks", books);
        model.addAttribute("findBook", book);

        return "find";
    }

}
