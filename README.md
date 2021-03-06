Joomla Sphinx Search component tutorial
========

This is fork of [https://github.com/Ivinco/Joomla-Sphinx-Search-component](https://github.com/Ivinco/Joomla-Sphinx-Search-component)

Description
--------
Joomla Sphinx search component enables the Sphinx-powered search with high-performance and more relevant search results.

### Features:

 *   Included Joomla Sphinx Search component to use power of MVC architecture;
 *   Included 6 Sphinx Search plugins for each type of content;
 *   Google-like search syntax;
 *   High searching performance;
 *   Improved search result relevance;
 *   Supports friendly URLs SEO settings;
 *   Supports morphological word forms dictionaries;
 *   Supports stemming (English, Russian and Czech are built-in);
 *   Supports stopwords;
 *   Supports both single-byte encodings and UTF-8;
 *   And many other Sphinx features

### Plugins support

Provide Sphinx Search plugins  for:

 *   Articles
 *   Categories
 *   Contacts
 *   Newsfeed
 *   Sections
 *   Weblinks

### Requirements:

 *   Sphinx Search 0.9.9 or higher
 *   Joomla 1.5

### Installation

Check out installation instruction at [tutorial](http://www.ivinco.com/software/joomla-sphinx-search-component-tutorial "Joomla Sphinx Search tutorial page") page.

### Support
This component is developed by [Ivinco](http://www.ivinco.com "Ivinco High performance search solutions"). If you need commercial support, or if you’d like Joomla Sphinx Search component customized for your needs, [we can help](http://www.ivinco.com/contact-us/ "Ivinco contact").

### Make package

To make package type `make` in root component directory. The package will be created in `build` directory.

### Добавлена поддержка русского языка

Порядок установки описан ниже.

Создание пакета: ввести `make` в консоли, в каталоге `build` будет создан zip файл пакета. Установить штатными средствами Джумлы.

Скопировать файл в `sphinx-ru.conf`, являющийся доработкой `sphinx.conf`, в корень сайта (настройки базы данных подтягиваются из `configuration.php`).

    cp sphinx-ru.conf /path/to/site/

Если Sphinx еще не настроен, переместить `etc-sphinx.conf` в `/etc/sphinxsearch/sphinx.conf` (потребуются права `root`, как и для многих других операций ниже):

    cp etc-sphinx.conf /etc/sphinxsearch/sphinx.conf

В этом файле хранятся базовые настройки `indexer` и `searchd`.

После этого при переиндексации документов будут опрашиваться все конфигурационные файлы из каталога `/etc/sphinxsearch/configs/`, который необходимо создать.

    mkdir /etc/sphinxsearch/configs/

В этом каталоге необходимо сделать симлинк на конфигурационный файл `sphinx-ru.conf`, который был скопирован в корень сайта, например:

    ln -s /path/to/site/sphinx-ru.conf site.conf

Теперь необходимо запустить переиндексацию.

    indexer --rotate --all

Перезапуск Sphinx:

    service sphinxsearch restart

Далее необходимо отключить все штатные поисковые плагины, и включить установленные, указав в настройках каждого параметры, если они отличаются от предустановленных.

В файле `administrator/components/com_search/helpers/search.php` желательно подправить лимиты на поисковый запрос, в методе `limitSearchWord` и части кода, где есть пометка

    filter out search terms that are too small