def build_key (book_id, book_name, customer_id):
    return 'book-{id}-{name}-{c_id}'.format(id=book_id, name=book_name, c_id=customer_id)