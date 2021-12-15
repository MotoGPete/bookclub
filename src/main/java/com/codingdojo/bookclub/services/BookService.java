package com.codingdojo.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.bookclub.models.Book;
import com.codingdojo.bookclub.repositories.BookRepository;


@Service
public class BookService {
	 // adding the book repository as a dependency
		private final BookRepository bookRepository;
	 
		public BookService(BookRepository bookRepository) {
			this.bookRepository = bookRepository;
		}
		// returns all 
		public List<Book> allBooks() {
			return bookRepository.findAll();
		}
		// creates
		
		public Book createBook(Book book) {
			return bookRepository.save(book);
		}
		// retrieves one
		public Book findBook(Long id) {
			Optional<Book> optionalBook = bookRepository.findById(id);
			if(optionalBook.isPresent()) {
	         return optionalBook.get();
	     } else {
	         return null;
	     	}
		}

		//deletes
		public void deleteBook(Long id) {
			bookRepository.deleteById(id);	
		}
		//updates
		public Book updateExpense(Book book) {
			return bookRepository.save(book);
		}
	}


