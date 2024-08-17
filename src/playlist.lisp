(defun make-playlist (creator-data initial-playlist)
  (list :curator creator-data :songs initial-playlist))

(defun make-curator-data (name)
  (list :name name))

(defun song (title album artist genre)
  (list :title title :album album :artist artist :genre genre))

(defun add-song (playlist song)
  (let ((songs (getf playlist :songs)))
	(setf songs (push song songs))))
  
(defun save-playlist (playlist filename)
  (with-open-file (out filename
					   :direction :output
					   :if-exists :supersede)
	(with-standard-io-syntax (print playlist out))))

(defun load-playlist (filename)
  (with-open-file (in filename)
	(with-standard-io-syntax
	  (read in))))
