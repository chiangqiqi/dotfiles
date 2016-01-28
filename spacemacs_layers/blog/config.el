;; configuration for blog layer


;; (require 'org2blog-autoloads)           

(setq org2blog/wp-use-sourcecode-shortcode t)

(setq org2blog/wp-blog-alist
      '(("wordpress"
         :url "http://tintin.blog.ustc.edu.cn/xmlrpc.php"
         :username "tintin"
         :default-title "Hello World"
         :default-categories ("org2blog" "emacs")
         :tags-as-categories nil)))
