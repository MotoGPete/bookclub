package com.codingdojo.bookclub.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.codingdojo.bookclub.models.Book;
import com.codingdojo.bookclub.services.BookService;

@Controller
public class BookController {

	@Autowired
	BookService bookService;

	// **************Show All****************
	@GetMapping("/books")
	public String dashboard(Model model) {
		List<Book> books = bookService.allBooks();
		model.addAttribute("books", books);
		return "books.jsp";
	}

	// **********create***************
	@GetMapping("/books/new")
	public String createBook(Model model, HttpSession session) {
		Book newBook = new Book();
		model.addAttribute("newBook", newBook);
		
		return "booksNew.jsp";
	}

	@PostMapping("/books/new")
	public String processCreateBook(@Valid @ModelAttribute("book") Book newBook, BindingResult result, HttpSession session ) {
		if (session.getAttribute("user_id") == null) {
			return "redirect:/";
		} 
		if (result.hasErrors()) {
			return "books.jsp";
		} else {
			bookService.createBook(newBook);
			return "redirect:/books";
		}

	}

	// **************update*****************
	@GetMapping("/books/{id}/edit")
	public String bookEdit(@PathVariable("id") Long id, Model model) {
		Book book = bookService.findBook(id);
		model.addAttribute("book", book);
		return "booksEdit.jsp";
	}

	@PutMapping("books/{id}/edit")
	public String processEditForm(@Valid @ModelAttribute("newExpense") Book newBook, BindingResult result,
			@PathVariable("id") Long id) {
		if (result.hasErrors()) {
			return "editBook.jsp";
		} else {
			bookService.createBook(newBook);
			return "redirect:/books";
		}

	}

	// *********show one******************
	@GetMapping("/books/{id}")
	public String bookShow(@PathVariable("id") Long id, Model model) {
		Book book = bookService.findBook(id);
		model.addAttribute("book", book);
		return "booksShow.jsp";
	}

	// *****************delete********************
	@DeleteMapping("/books/{id}/delete")
	public String processDeleteBook(@PathVariable("id") Long id) {
		bookService.deleteBook(id);
		return "redirect:/books";
	}

	// ***************combined create dash*************
//	@GetMapping("/expenses")
//	public String combined(Model model) {
//		Expense newExpense = new Expense();
//		model.addAttribute("newExpense", newExpense);
//		List<Expense> expenses = expenseService.allExpenses();
//		model.addAttribute("expenses", expenses);
//		return "expenses.jsp";
//	}

//	@PostMapping("/expenses")
//	public String processCombined(@Valid @ModelAttribute("newExpense") Expense newExpense, BindingResult result,
//			Model model) {
//		if (result.hasErrors()) {
//			List<Expense> expenses = expenseService.allExpenses();
//			model.addAttribute("expenses", expenses);
//			return "expenses.jsp";
//		} else {
//			expenseService.createExpense(newExpense);
//			return "redirect:/expenses";
//		}
//
//	}
}
