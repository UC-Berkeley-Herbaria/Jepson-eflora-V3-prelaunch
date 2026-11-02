--files needed to update Keybase filter lists

.output efloraV7_native_dist.txt

SELECT eflora_taxa.ScientificName, eflora_taxa.Status, eflora_distributions.* FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_taxa.IsTerminalTaxon = 1 AND eflora_taxa.Status like 'Nativ%'
ORDER BY eflora_distributions.ScientificName
;



.output keybase_urls.txt

SELECT eflora_distributions.ScientificName || ',http://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=' || eflora_distributions.TaxonID
FROM eflora_distributions WHERE eflora_distributions.ScientificName is not NULL
ORDER BY eflora_distributions.ScientificName
;

.output D.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_taxa.IsTerminalTaxon = 1 AND (eflora_distributions.DMtns = 1 OR eflora_distributions.DSon = 1 OR eflora_distributions.DMojexcDMtns = 1)
ORDER BY eflora_distributions.ScientificName
;


.output DSon.txt

SELECT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.DSon = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;


.output DMoj.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_taxa.IsTerminalTaxon = 1 AND (eflora_distributions.DMtns = 1 OR eflora_distributions.DMojexcDMtns = 1)
ORDER BY eflora_distributions.ScientificName
;


.output DMtns.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.DMtns = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;


.output DMojexcDMtns.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.DMojexcDMtns = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;


.output NCoRO.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.NCoRO = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;

.output NCo.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.NCo = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;

.output KR.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.KR = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;

.output NCoRH.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.NCoRH = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;

.output NCoRI.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.NCoRI= 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;

.output NCoR.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_taxa.IsTerminalTaxon = 1 AND (eflora_distributions.NCoRI = 1 OR eflora_distributions.NCoRO = 1 OR eflora_distributions.NCoRH = 1)
ORDER BY eflora_distributions.ScientificName
;

.output NW.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_taxa.IsTerminalTaxon = 1 AND (eflora_distributions.NCo = 1 OR eflora_distributions.KR = 1 OR eflora_distributions.NCoRI = 1 OR eflora_distributions.NCoRO = 1 OR eflora_distributions.NCoRH = 1)
ORDER BY eflora_distributions.ScientificName
;




.output CaR.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_taxa.IsTerminalTaxon = 1 AND (eflora_distributions.CaRF = 1 OR eflora_distributions.CaRH = 1)
ORDER BY eflora_distributions.ScientificName
;


.output CaRH.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.CaRH= 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;


.output CaRF.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.CaRF= 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;



.output GV.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_taxa.IsTerminalTaxon = 1 AND (eflora_distributions.SnJV = 1 OR eflora_distributions.ScV = 1)
ORDER BY eflora_distributions.ScientificName
;


.output SnJV.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.SnJV= 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;


.output ScV.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.ScV= 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;




.output CW.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_taxa.IsTerminalTaxon = 1 AND (eflora_distributions.SnFrB = 1 OR eflora_distributions.CCo = 1 OR eflora_distributions.SCoRO = 1 OR eflora_distributions.SCoRI = 1)
ORDER BY eflora_distributions.ScientificName
;


.output CCo.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.CCo = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;


.output SnFrB.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.SnFrB = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;


.output SCoR.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_taxa.IsTerminalTaxon = 1 AND (eflora_distributions.SCoRO = 1 OR eflora_distributions.SCoRI = 1)
ORDER BY eflora_distributions.ScientificName
;

.output SCoRO.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.SCoRO = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;


.output SCoRI.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.SCoRI = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;





.output SN.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_taxa.IsTerminalTaxon = 1 AND (eflora_distributions.Teh = 1 OR eflora_distributions.cSNH = 1 OR eflora_distributions.sSNH = 1 OR eflora_distributions.sSNH = 1 OR eflora_distributions.cSNF = 1 OR eflora_distributions.sSNF = 1 OR eflora_distributions.sSNF = 1)
ORDER BY eflora_distributions.ScientificName
;


.output SNH.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_taxa.IsTerminalTaxon = 1 AND (eflora_distributions.Teh = 1 OR eflora_distributions.cSNH = 1 OR eflora_distributions.sSNH = 1 OR eflora_distributions.sSNH = 1)
ORDER BY eflora_distributions.ScientificName
;


.output SNF.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_taxa.IsTerminalTaxon = 1 AND (eflora_distributions.cSNF = 1 OR eflora_distributions.sSNF = 1 OR eflora_distributions.sSNF = 1)
ORDER BY eflora_distributions.ScientificName
;



.output nSN.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_taxa.IsTerminalTaxon = 1 AND (eflora_distributions.nSNF = 1 OR eflora_distributions.nSNH = 1)
ORDER BY eflora_distributions.ScientificName
;


.output cSN.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_taxa.IsTerminalTaxon = 1 AND (eflora_distributions.cSNF = 1 OR eflora_distributions.cSNH = 1)
ORDER BY eflora_distributions.ScientificName
;


.output sSN.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_taxa.IsTerminalTaxon = 1 AND (eflora_distributions.Teh = 1 OR eflora_distributions.sSNF = 1 OR eflora_distributions.sSNH = 1)
ORDER BY eflora_distributions.ScientificName
;


.output Teh.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.Teh = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;


.output nSNF.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.nSNF = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;


.output cSNF.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.cSNF = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;


.output sSNH.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.sSNH = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;

.output nSNH.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.nSNH = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;


.output nSNF.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.nSNF = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;


.output cSNF.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.cSNF = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;

.output cSNH.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.cSNH = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;


.output sSNF.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.sSNF = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;


.output SW.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_taxa.IsTerminalTaxon = 1 AND (eflora_distributions.SCo = 1 OR eflora_distributions.nChI = 1 OR eflora_distributions.sChI = 1 OR eflora_distributions.WTR = 1 OR eflora_distributions.SnBr = 1 OR eflora_distributions.SnGB = 1 OR eflora_distributions.SnJt = 1 OR eflora_distributions.PRexcSnJt = 1)
ORDER BY eflora_distributions.ScientificName
;


.output SCo.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.SCo = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;


.output ChI.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_taxa.IsTerminalTaxon = 1 AND (eflora_distributions.nChI = 1 OR eflora_distributions.sChI = 1)
ORDER BY eflora_distributions.ScientificName
;


.output nChI.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.nChI = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;


.output sChI.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.sChI = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;


.output TR.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_taxa.IsTerminalTaxon = 1 AND (eflora_distributions.WTR = 1 OR eflora_distributions.SnBr = 1 OR eflora_distributions.SnGB = 1)
ORDER BY eflora_distributions.ScientificName
;


.output WTR.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.WTR = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;


.output SnBr.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.SnBr = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;


.output SnGB.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.SnGB = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;


.output PR.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_taxa.IsTerminalTaxon = 1 AND (eflora_distributions.SnJt = 1 OR eflora_distributions.PRexcSnJt = 1)
ORDER BY eflora_distributions.ScientificName
;


.output SnJt.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.SnJt = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;


.output PRexcSnJt.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.PRexcSnJt = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;





.output GB.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_taxa.IsTerminalTaxon = 1 AND (eflora_distributions.WaI = 1 OR eflora_distributions.SNEexcWaI = 1 OR eflora_distributions.Wrn = 1 OR eflora_distributions.MPexcWrn = 1)
ORDER BY eflora_distributions.ScientificName
;


.output MP.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_taxa.IsTerminalTaxon = 1 AND (eflora_distributions.Wrn = 1 OR eflora_distributions.MPexcWrn = 1)
ORDER BY eflora_distributions.ScientificName
;


.output Wrn.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.Wrn = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;


.output MPexcWrn.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.MPexcWrn = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;


.output SNE.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_taxa.IsTerminalTaxon = 1 AND (eflora_distributions.WaI = 1 OR eflora_distributions.SNEexcWaI = 1)
ORDER BY eflora_distributions.ScientificName
;


.output WaI.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.WaI = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;


.output SNEexcWaI.txt

SELECT DISTINCT eflora_distributions.ScientificName FROM eflora_distributions, eflora_taxa
	WHERE eflora_distributions.TaxonID = eflora_taxa.TaxonID AND eflora_distributions.SNEexcWaI = 1 AND eflora_taxa.IsTerminalTaxon = 1
ORDER BY eflora_distributions.ScientificName
;
--these files need to be uploaded into Keybase
