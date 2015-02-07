Simularch represents an experiment in the employment of Mediawiki and its Semantic Mediawiki extension to create a model of a complex enterprise systems portfolio.

The objective of this implementation has been to implement the basic object model and then evaluate the system's capability in terms of:

1. The ease of establishing and maintaining data currency
2. How much basic functionality comes free with Mediawiki and/or Semantic Mediawiki
3. The system's ability to adequately provide the required analytics functionality

At the time of publishing this repo, the status of this experiment is summarised below.

# Status and Key Conclusions

2. Implementation of the data model in Semantic Mediawiki is reasonably straightforward. It doesn't appear to be meaningfully more or less onerous than if done in an ORM.
3. Data entry for a systems portfolio of a non-trivial size is reasonably easy. Initial data seeding is easily achieved using csv imports. Semantic Forms make it easy to enter new data or maintain existing data.
4. Production of analytical elements is excellent for very simple analytics. For analytical elements of non-trivial complexity it is problematic. The querying language is non-standard but easily picked up; it is not a portable or widespread skill, however. Like SQL, queries are declarative and easily human parsable for simple cases. Query nesting is the key problem; a sufficiently sophisticated data model will prompt extensive and quite deep subquerying, which SMW is not ideal for. Tooling to support development of complex queries is nigh on non-existent (I have uploaded a modified emacs extension here: https://github.com/JosefAssad/smw.el).
5. Data model extensibility is superb.
6. Basing on an established system like Mediawiki is a significant plus when it comes to data interchange with arbitrary external systems. Data export is superb as represented by the Semantic query output formats; Mediawiki bulk data export is also good. Assuming that Semantic Mediawiki satisfies functional requirements with minimal custom development, the cost of switching is superb.
7. Graphical representation of query results is superb (primarily the consequence of the existence of a Semantic Results).
8. For data models of sufficient complexity, with analytics needs resulting in sufficiently complex and deeply nested queries, Mediawiki/Semantic Mediawiki caching causes non-trivial data consistency problems. This bug is an excellent example: https://phabricator.wikimedia.org/T24751. There are workarounds (see for example further down, in the prerequisites section; the instruction to install the refresh.sh script is one such imperfect and frankly ugly workaround) but they are not complete and not elegant.
1. Mediawiki and Semantic Mediawiki appear to be reasonable choices for prototyping relatively simple data models. When prototyping a data model, the key required capability is to be able to enter objects and see if it feels complete and correct; for this purpose, Semantic Mediawiki is a good choice. I do not feel like a prototype needs to demonstrate complex queries, but if it did, Semantic Mediawiki would be a poor choice.
1. No further work will be done on this implementation. The author has migrated the data model to the django python framework which does not suffer from the data currency and querying limitations in Semantic Mediawiki.

# Prerequisites
1. Debian Wheezy (Stable at the time of writing)
2. Apache, MySQL, and php from the standard Debian repositories
3. Mediawiki (hereafter MW) 1.23.3
4. Semantic Mediawiki (hereafter SMW) 2
5. The Data Transfer extension to SMW version 0.6 at http://www.mediawiki.org/wiki/Extension:Data_Transfer
6. The ParserFunctions extension to MW version 1.6.0 at http://www.mediawiki.org/wiki/Extension:ParserFunctions
7. The Semantic Result Formats extension to SMW from https://semantic-mediawiki.org/wiki/Semantic_Result_Formats
8. Copy smw_refresher.sh to /root/ and install it in cron with `*/1 * * * * sh /root/refresh.sh`. This is required so data updates are somewhat timely.

# Installation
1. Install Semantic Mediawiki
2. Install the Data Transfer extension to SMW; follow the instructions in the extension documentation
3. Disable property caching in SMW: in SemanticMediawiki.settings.php change the line `'smwgPropertiesCache' => true,` to `'smwgPropertiesCache' => false,`.
4. In SMW Special:Import, import the file structure.xml
5. Optionally to insert demo data, on Special:ImportCSV import all of the csv files provided in the Simularch distribution.
6. On the command line, navigate to the MW maintenance extension directory and execute the command: `php runJobs.php`
