Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2079.outbound.protection.outlook.com [40.107.20.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF6A144D1C
	for <imx@lists.linux.dev>; Tue, 14 May 2024 14:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715696933; cv=fail; b=npMY/+rydtTex2u8vcUXIWOUgr8Y5xMfIKDiAsNJm6wp1hWaH3nsoxBt/qYEhcxHCtiW2RTai4q/SmpqNc+RRIYBKf86ARuDSnKJi5s1n0PEKqgGG3FLGkbFcUWjmzKIYea6rsoZw6t4Tf8Ml0CMx7QAGOuZfGsjI65mw2NH7VQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715696933; c=relaxed/simple;
	bh=a2u1KKRONKHnbTIAOmhqCcNyuAc63Bmgen1n4PkBgwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VC2bvoKBWS/4eMdqUI6wXPHrJYbHIjFoZLTcDtnHkiR2VR2N87GU8fISs0qWhqV4HkUOaK4GaS3bQA9ersFSSmorKm2fGwhM/cw7FDVmudyTGCPd4W8FYBrjSVJKcNU0yAgLQVcXA1QQ4eZn71Jwp7ne0XcCvNgBLGXMH3XiZsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=mmP0tqXA; arc=fail smtp.client-ip=40.107.20.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="mmP0tqXA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WuCLdQQ79moO5qkAycyck2njfaMQfgajqCnaxzyFCWjgwxkAHn9G6+sAfJ7h9TH4kchxUpJqNXlIeZ8xGAVhGgQjRQmNVnDtGEqErZ2Dl2gL5XYfL3DKPCqNBGJjgJMchfbKpsQlZy+DIjwzvZ638hS4vDRvYG6AxXGDveO+XUCRDGYSyVGpTI0ZPeGNzVpBTJza6u5V3jpTfjOfK1O4umNHZ862DAg9DZC1CKxEEziJHg7scjsQIKZ2Pp+Lose7dBulsmOC6pqwDWrderFYwH9wMlVtTgc9ZoBjmS+M8o1+ie94ID/pZfOx9qFmL+fV0i0FbP26PexqZGPFCoFb/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nSrRF6BuvkyJa6CM7kQFuym68oH+lVtRdKbDd7Niso0=;
 b=hDR3cBpU/FenRCIZvO3TPFjpVpdVHYV3Sz+0V6W7krDkvgLBWNdeC1TpT7ayQ4AN4STVXp8QKUQIJH2/iG9VthADMhErr68jxttHWPCgWOYa/jkUsPnZj1Q19e37ZimdPo/wcRMcLlr9+8dTcdIEXmp1cEuctapBBV1Lq1+6atVVev5magsGUbvDrV58ktsEdC9zycS682BZKmExhxBT+lmUzYzLzWYwJrDX5MyZE7hiWjDKZJR4LjFjLEzw6knqVbVQQxZy+nby+dgeVzQull2S3NEwwNPMCiZL4/ghq8Y0yLMhEmVu8NlCy6w8rVf9qMsPiQDldZEqN1E+sQ1dyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSrRF6BuvkyJa6CM7kQFuym68oH+lVtRdKbDd7Niso0=;
 b=mmP0tqXA9IJw87wFxKmn7J8uqhI6dm9lbX24NYlU0bu3gFye0+y+x7C6zDpQ/l0ayZiAAKQ/nVDzFJgnI11JxkN2CbZZOwZ9IGMoc/T1Cxz4UExeL60i/rsfYWZhbzrv8i4TKIQbswtnTE7vyeaLbOEJadhMJAOokU7RdDyWCzY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB7840.eurprd04.prod.outlook.com (2603:10a6:102:ce::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 14:28:48 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::1e67:dfc9:d0c1:fe58]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::1e67:dfc9:d0c1:fe58%7]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 14:28:48 +0000
Date: Tue, 14 May 2024 10:28:42 -0400
From: Frank Li <Frank.li@nxp.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: imx@lists.linux.dev
Subject: Re: [PATCH v2] PCI: dwc: Fix suspend hang when e1000e network card
 is connected
Message-ID: <ZkN1GgczTvzAwYDQ@lizhi-Precision-Tower-5810>
References: <1715666198-9140-1-git-send-email-hongxing.zhu@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1715666198-9140-1-git-send-email-hongxing.zhu@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0118.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::33) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB7840:EE_
X-MS-Office365-Filtering-Correlation-Id: 89020bca-1d19-4a35-a31f-08dc74222b44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|52116005|366007|376005|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VlXph02qWDBG+ZR8YeNrroObvoo88yC78Uh/MZjBKWPbVOzdYQVBrP2DXhmT?=
 =?us-ascii?Q?Jqt8oCdb9D8wHnd3kIPjcJ1WILveNAGMbKO1V8+sHkE+qJOrQHXF2cKebggF?=
 =?us-ascii?Q?XjtX4Y6QQr8DWwPD/jrMX0htQQonNtd3Eqv7cl3pZ9q99JlR8xFjOMZl3ijk?=
 =?us-ascii?Q?mRngeRz3VYRJcw7owLNlA2QQ9YmUgC2ydSFBEZGf/7i2TxwOSN+iu+2lZtvP?=
 =?us-ascii?Q?B4K0woA1UM7W53/sRqN8pswYWXCMQLpearxcwmaWi7ab/HnNSGoHF6ARhUsv?=
 =?us-ascii?Q?g2rnaFtdgqv/HV9LGnHHcXE+rjHsDUm5u+5Rg8VSwMOzHmUg/Z+9om7//ZA+?=
 =?us-ascii?Q?62GrW1g4bDhnp4+7WGmreMQeJrOEZ4xP8OggU7Q1ZlVFlZW0ayHwVJwrMvxw?=
 =?us-ascii?Q?8sJuvLVOPKLH96oJYTfGndgyghzjzHGZB7x4gm1muQ7oI9LRPG7e3QqWjCyV?=
 =?us-ascii?Q?4UUqWUbkNzQVrRhPN9nheQbKjbStsjpf6eOPnEXfQ7Y3+ykirKeQbpSlGvnD?=
 =?us-ascii?Q?TkLbKcTSlyS+/RN41D7I+CPVo9wyycFdhwmFTV0GQ7pls/PZPgz2itLqZGlX?=
 =?us-ascii?Q?oICXpdE5AzDsuQp1WaLuwio255VmDjhqbI0vJPCyX2wfaeJxmIKdTT4J1WeC?=
 =?us-ascii?Q?rpLpRn35muxJcKsxy40P9bMxGJrPS0V74hVV1Ko89YTtuaHCCEWMoBXlD0tF?=
 =?us-ascii?Q?RpDUnnFHTyMIHbNDC0h+h6c6eixsTavaEi3vGaX3Dzo6f+GBMZrkbcIMXDEc?=
 =?us-ascii?Q?3qWhLWtsICGHtWX2IVb7Dv/9yQFDi+VBzeWoLFmf4Nl9TCBdKmA15uCmnAIf?=
 =?us-ascii?Q?BChFzkGm1SZfa6p9ueY3SqIlfEUBtzWmkUtmA+JpWmaXVkVEDBZknrgbu41a?=
 =?us-ascii?Q?AzFeR+1b493sOWTTx37wNeVA+M6mOIsW/vnuQWqGv9SoZL9WrexXE2CdGr5i?=
 =?us-ascii?Q?qedo92goIhCV9leoFgHF+APxxk9bHPB95svlVV7ZXqeqV/Nq7iSMBRwr/3UF?=
 =?us-ascii?Q?EnbSm1C2Sq70oA0/Ex5Sz/E+Vtfg93CRn647lD9JIabnicD25MpmnCCicMd3?=
 =?us-ascii?Q?N1fU4OzViAO4Kn4wwxDtkQNAJ7DUFYg1iW6TLEZ5kFGTDdPySdARs1B6F78k?=
 =?us-ascii?Q?JGC07ydYt6P/qRNv26gV33f3DM/GhjkxrXNOFFH73Hkp0P53gOHNb4er083s?=
 =?us-ascii?Q?qDjMYFRabd/cWzlLlvnNFW1YA54oOmEYmqzO/3P0Zr7TAdpYPArK3INs3D6P?=
 =?us-ascii?Q?Igyk+Yb7ncZ09LQq0Pb8ro+CkPXmaH1Kwdo4qqbgaolMaK6z5OCwGywaN8Ye?=
 =?us-ascii?Q?G6xjISyHMeDIZTYDkrSoVxDAVROmQyyHCjQ82blOXnbSwg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(52116005)(366007)(376005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H0P5Rs7fdIq2T3e/+C5mwJqGMQRoQrU2Zfkjnj/ABWOF9THUkONazeceuVNR?=
 =?us-ascii?Q?kkBMwQaphNNnk4Oad/6ra2jdPUGLgqMweL6j8IGJBIE1/VyD7y9NqZCyzVu6?=
 =?us-ascii?Q?Cs2jlAdefoPnv2ar9/ZuG6g1D4RsVk4i2Z6PaHCFWA4bQtcklu9BkAudHt/g?=
 =?us-ascii?Q?WGJqbdi/x2ApS4MMZnhSyPCjARGZD406YAcbQrd79KbNsEEX4MyLBCmpms1W?=
 =?us-ascii?Q?DcDx3D5Eshqr+KWv0jduuwqNCaRELh6cVaX4lO2L6W1O43rpXEsxcfKucg8W?=
 =?us-ascii?Q?u1MyMadbQ9qtfFRCT4ckrMffe/X1dhZANWBHCt0CR2gnJIoUZ9EcUKGt0jYL?=
 =?us-ascii?Q?H1wGlAUgEwNblZ/7NqxRnA08Fx+Ef4QYZa3oNvom3sCGyZ3FCk1BL74HjkwU?=
 =?us-ascii?Q?3eZekP9rZ8jxMkMrye6VVK4nBbeOMYoKFsPJmoKlidJDfUfWl2vNermr6Urs?=
 =?us-ascii?Q?Ao78ybkbdwgrA0OMNWPKOsX0ez/TfjXHVHR2bhum/xsv6ptGlNVIz6yRSGDL?=
 =?us-ascii?Q?e76xOYOGXASQAO7GSW/YkZ4tK3oTObtOoFVnmhg+yHmylY0QdMOqt2TVn73i?=
 =?us-ascii?Q?Hrut5FQVBHqU35LVaLexo2vSWkK0X+qLrrRNPDgmEx1vgXH13xJt239Y2O7H?=
 =?us-ascii?Q?OC8Y6pfenhwyNGGGiw1v4DPjlrxXiEspNshsNYnhmInpkJaa8jPzpJH5h6Am?=
 =?us-ascii?Q?YxhNMVwP9A3gikQZ/0CRlqu+6T2MUfToEEWn+r9rltHkTGpCvhWWet6bCenp?=
 =?us-ascii?Q?sdpVD3xbg9NdQMo8EQKVGFdfiiQXmC0Vi9tfz4H30zKqi4TDJUScKcLBKqt0?=
 =?us-ascii?Q?Dv2rHmME+o6nt0QFiZagqS2acZjMZUgYmby0KIqH+mR490UK1IDfhmV47O5h?=
 =?us-ascii?Q?yD4tijB2QRmzK/5pUMeQWVGCObxErtNM44vOAR7J1mYxLplA8GaNsguV+jdg?=
 =?us-ascii?Q?I0XM+iZ3UeUYR6+C07+65x3BzN1Ha+vWmfuerJh9Z3UvGW5o3Rj5UbG957xH?=
 =?us-ascii?Q?4vlPrW32+l6fRxtCwuJ2mgSQMNqbaJkydvb2rs0NOGuyRJxxNibfduSfH70i?=
 =?us-ascii?Q?m++L0CuPA+cDuPMI3AF4A+GevuFaMOBPbPbHPAzV10/V27mvUNhqBG0aNLNR?=
 =?us-ascii?Q?fFDvTeIgIBwYLB4bCk3HCEb85oRjCIsvEir6uqvL10wuvWf4/JioVqK0aSW3?=
 =?us-ascii?Q?8fuI2kZeKgltZeIXCd+CvvEkLCG5QTzY5smTSQjsHR1Ig868GCZrlEca6aRm?=
 =?us-ascii?Q?EglT+pl15TwAidTSNwfCgiQU6UA//iLf4IjlZRwbrbnufC+eqBYRSe/k+rq4?=
 =?us-ascii?Q?C5s4xuGYrM3nsWUrlWv2VSJ3G8f9LnBTMXA0oxvCbYbmtC18R/r0lYbOsyNf?=
 =?us-ascii?Q?raBgEwrPm6VCTxySYnBSFLwAJNK87ewDVUCSyECw0kOwF+Kku+6A/QjuHNeG?=
 =?us-ascii?Q?phcSzeixChvheBXT9ZsxbrjbV+aWS26ZPJIhcf7L122pc8HIJOS5eTJNX+1R?=
 =?us-ascii?Q?bkm2lm7Bg/vedTpSIdJlmOoFgxKsKjGwVcBe+PrYoM+vUnMY+UaaYBk77x0Z?=
 =?us-ascii?Q?Ut7cQZf8plez2E/LKVA/DOx6EmERCi3FUIQWLU0R?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89020bca-1d19-4a35-a31f-08dc74222b44
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 14:28:48.4318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QVijhkuGb3og9S+QyiHdBf6G8BmMVqQJOyUG2XVYw3uLLdE4EulJBZiGRBUsEYv9vGDn0Y9aMNMD1Ghhme2bWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7840

On Tue, May 14, 2024 at 01:56:38PM +0800, Richard Zhu wrote:
> In dw_pcie_suspend_noirq() and after the PME_TURN_OFF messgage is sent out,
> one PMC version2.0 endpoint device E1000E network card hangs in LTSSM stat
> polling and L2 stat check.
> 
> To avoid this hang issue after the PME_TURN_OFF message is sent out.
> Only poll and check LTSSM L2 stat if the EP's PMC version is 3 or later,
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
> - Add a new help function dwc_get_devices_pmc_version() to get devices PMC
>   versions.
> 
>  .../pci/controller/dwc/pcie-designware-host.c | 46 ++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index cb8c3c2bcc790..0c2794e7bcf0a 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -884,6 +884,42 @@ int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_setup_rc);
>  
> +static int dwc_get_devices_pmc_version(struct dw_pcie *pci)
> +{
> +	int ret;
> +	u16 pmc, ver = 0;
> +	struct dw_pcie_rp *pp = &pci->pp;
> +	struct pci_bus *child, *root_bus = NULL;
> +	struct pci_dev *pdev;
> +
> +	/* Check the remote EP's PMC version */
> +	list_for_each_entry(child, &pp->bridge->bus->children, node) {
> +		if (child->parent == pp->bridge->bus) {
> +			root_bus = child;
> +			break;
> +		}
> +	}
> +
> +	if (!root_bus) {
> +		dev_err(pci->dev, "Failed to find downstream devices\n");
> +		return -ENODEV;
> +	}
> +
> +	list_for_each_entry(pdev, &root_bus->devices, bus_list) {
> +		if (PCI_SLOT(pdev->devfn) == 0) {
> +			/* find PCI PM capability in list */
> +			ret = pci_find_capability(pdev, PCI_CAP_ID_PM);
> +			if (!ret)
> +				return ret;
> +			/* Check device's PM ability version */
> +			pci_read_config_word(pdev, ret + PCI_PM_PMC, &pmc);
> +			ver &= pmc;

ver is 0.  so ver will be always 0 by '&='.

By the ways, in 7.5.2 PCI Power Management Capability Structure
I have not found version info.

Frank 

> +		}
> +	}
> +
> +	return ver;
> +}
> +
>  static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
>  {
>  	struct dw_pcie_ob_atu_cfg atu = { 0 };
> @@ -924,7 +960,7 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  {
>  	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
>  	u32 val;
> -	int ret = 0;
> +	int pmc_ver, ret = 0;
>  
>  	/*
>  	 * If L1SS is supported, then do not put the link into L2 as some
> @@ -933,6 +969,8 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
>  		return 0;
>  
> +	pmc_ver = dwc_get_devices_pmc_version(pci);
> +
>  	if (dw_pcie_get_ltssm(pci) > DW_PCIE_LTSSM_DETECT_ACT) {
>  		/* Only send out PME_TURN_OFF when PCIE link is up */
>  		if (pci->pp.ops->pme_turn_off)
> @@ -942,7 +980,13 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  
>  		if (ret)
>  			return ret;
> +	}
>  
> +	/*
> +	 * PMC Ver2.0 device e1000e NIC hangs in LTSSM polling and L2 check.
> +	 * Only do the L2 check when PMC version is Ver3.0 or later.
> +	 */
> +	if (pmc_ver >= 3) {
>  		ret = read_poll_timeout(dw_pcie_get_ltssm, val, val == DW_PCIE_LTSSM_L2_IDLE,
>  					PCIE_PME_TO_L2_TIMEOUT_US/10,
>  					PCIE_PME_TO_L2_TIMEOUT_US, false, pci);
> -- 
> 2.37.1
> 
