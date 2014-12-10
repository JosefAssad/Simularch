Simularch is an enterprise grade system which models the entire apparatus which concerns the delivery of computer based business functionnality to the organization.It is based on Semantic Mediawiki.

# Prerequisites
1. Debian Wheezy (Stable at the time of writing)
2. Apache, MySQL, and php from the standard Debian repositories
3. Mediawiki (hereafter MW) 1.23.3
4. Semantic Mediawiki (hereafter SMW) 2
5. The Data Transfer extension to SMW version 0.6 at http://www.mediawiki.org/wiki/Extension:Data_Transfer

# Installation
1. Install Semantic Mediawiki
2. Install the Data Transfer extension to SMW; follow the instructions in the extension documentation
3. Disable property caching in SMW: in SemanticMediawiki.settings.php change the line `'smwgPropertiesCache' => true,` to `'smwgPropertiesCache' => false,`.
4. In SMW Special:Import, import the file structure.xml
5. Optionally to insert demo data, on Special:ImportCSV import all of the csv files provided in the Simularch distribution.
6. On the command line, navigate to the MW maintenance extension directory and execute the command: `php runJobs.php`