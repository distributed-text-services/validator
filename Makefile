SHELL:=/bin/bash

UBHD_DTS_API?=https://digi.ub.uni-heidelberg.de/editionService/dts/
DRACOR_DTS_API?=https://staging.dracor.org/api/v1/dts
DoTS_DTS_API?=https://dots.chartes.psl.eu/demo/api/dts/
Py-DTS-API?=https://py-dts-demo.onrender.com/api/dts/v1

REPORTS_DIR?=reports
MOCK_REPORTS_DIR=$(REPORTS_DIR)/docs/
UBHD_REPORTS_DIR=$(REPORTS_DIR)/ubhd/
DRACOR_REPORTS_DIR=$(REPORTS_DIR)/dracor/
Py-DTS-REPORTS_DIR=$(REPORTS_DIR)/pydts/
DoTS_REPORTS_DIR=$(REPORTS_DIR)/dots/

##################################################
#    Tests on mock data + examples from docs     #
##################################################

test:
	pytest -s --html=$(MOCK_REPORTS_DIR)/report.html

test-entry:
	pytest tests/test_entry_endpoint.py -s --html=$(MOCK_REPORTS_DIR)/report-entry.html

test-collection:
	pytest tests/test_collection_endpoint.py -s --html=$(MOCK_REPORTS_DIR)/report-collection.html

test-navigation:
	pytest tests/test_navigation_endpoint.py -s --html=$(MOCK_REPORTS_DIR)/report-navigation.html

#####################
#    DraCor API     #
#####################

test-dracor-all:
	pytest --entry-endpoint=$(DRACOR_DTS_API) -s --html=$(DRACOR_REPORTS_DIR)/dracor_all_report.html

debug-dracor-all:
	pytest --pdb --entry-endpoint=$(DRACOR_DTS_API) -s --html=$(DRACOR_REPORTS_DIR)/dracor_all_report.html

test-dracor-entry:
	pytest tests/test_entry_endpoint.py --entry-endpoint=$(DRACOR_DTS_API) -s --html=$(DRACOR_REPORTS_DIR)/dracor_entry_report.html

test-dracor-collection:
	pytest tests/test_collection_endpoint.py --entry-endpoint=$(DRACOR_DTS_API) -s --html=$(DRACOR_REPORTS_DIR)/dracor_collection_report.html

test-dracor-navigation:
	pytest tests/test_navigation_endpoint.py --entry-endpoint=$(DRACOR_DTS_API) -s --html=$(DRACOR_REPORTS_DIR)/dracor_navigation_report.html

test-dracor-document:
	pytest tests/test_document_endpoint.py --entry-endpoint=$(DRACOR_DTS_API) -s --html=$(DRACOR_REPORTS_DIR)/dracor_document_report.html

test-dracor-strict:
	pytest --entry-endpoint=$(DRACOR_DTS_API) -W error::DeprecationWarning -s --html=$(DRACOR_REPORTS_DIR)/dracor_report.html

#####################
#    UBHD API       #
#####################

test-ubhd-all:
	pytest --entry-endpoint=$(UBHD_DTS_API) -s --html=$(UBHD_REPORTS_DIR)/ubhd_all_report.html

test-ubhd-entry:
	pytest tests/test_entry_endpoint.py --entry-endpoint=$(UBHD_DTS_API) -s --html=$(UBHD_REPORTS_DIR)/ubhd_entry_report.html

test-ubhd-collection:
	pytest tests/test_collection_endpoint.py --entry-endpoint=$(UBHD_DTS_API) -s --html=$(UBHD_REPORTS_DIR)/ubhd_collection_report.html

test-ubhd-navigation:
	pytest tests/test_navigation_endpoint.py --entry-endpoint=$(UBHD_DTS_API) -s --html=$(UBHD_REPORTS_DIR)/ubhd_navigation_report.html

test-ubhd-document:
	pytest tests/test_document_endpoint.py --entry-endpoint=$(UBHD_DTS_API) -s --html=$(UBHD_REPORTS_DIR)/ubhd_document_report.html

test-ubhd-strict:
	pytest --entry-endpoint=$(UBHD_DTS_API) -W error::DeprecationWarning -s --html=$(UBHD_REPORTS_DIR)/ubhd_report.html

#####################
#    DoTS API       #
#####################

test-dots-all:
	pytest --entry-endpoint=$(DoTS_DTS_API) -s --html=$(DoTS_REPORTS_DIR)/dots_all_report.html

test-dots-entry:
	pytest tests/test_entry_endpoint.py --entry-endpoint=$(DoTS_DTS_API) -s --html=$(DoTS_REPORTS_DIR)/dots_entry_report.html

test-dots-collection:
	pytest tests/test_collection_endpoint.py --entry-endpoint=$(DoTS_DTS_API) -s --html=$(DoTS_REPORTS_DIR)/dots_collection_report.html

test-dots-navigation:
	pytest tests/test_navigation_endpoint.py --entry-endpoint=$(DoTS_DTS_API) -s --html=$(DoTS_REPORTS_DIR)/dots_navigation_report.html

test-dots-document:
	pytest tests/test_document_endpoint.py --entry-endpoint=$(DoTS_DTS_API) -s --html=$(DoTS_REPORTS_DIR)/dots_document_report.html

test-dots-strict:
	pytest --entry-endpoint=$(DoTS_DTS_API) -W error::DeprecationWarning -s --html=$(DoTS_REPORTS_DIR)/dots_report.html

#####################
#    UNIL FTSR API  #
#####################

test-pydts-all:
	pytest --entry-endpoint=$(Py-DTS-API) -s --html=$(Py-DTS-REPORTS_DIR)/pydts_report.html

test-pydts-entry:
	pytest tests/test_entry_endpoint.py --entry-endpoint=$(Py-DTS-API) -s --html=$(Py-DTS-REPORTS_DIR)/pydts_entry_report.html

test-pydts-collection:
	pytest tests/test_collection_endpoint.py --entry-endpoint=$(Py-DTS-API) -s --html=$(Py-DTS-REPORTS_DIR)/pydts_collection_report.html

test-pydts-navigation:
	pytest tests/test_navigation_endpoint.py --entry-endpoint=$(Py-DTS-API) -s --html=$(Py-DTS-REPORTS_DIR)/pydts_entry_report.html

test-pydts-document:
	pytest tests/test_document_endpoint.py --entry-endpoint=$(Py-DTS-API) -s --html=$(Py-DTS-REPORTS_DIR)/pydts_document_report.html