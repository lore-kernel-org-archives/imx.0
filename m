Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2040.outbound.protection.outlook.com [40.107.22.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824751392
	for <imx@lists.linux.dev>; Wed, 15 May 2024 16:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715790767; cv=fail; b=t6UHTbkVn6KQrrs3f+FMnXHs/ULdJdImKiJ9Q22qwprpeg7DjR7V6TJu1Bpz6iyzRm4HHorIG1z97kuEmeBdA1/DmvbAz9kmc1wl3Xp1tN2JASq4yIcDnEPtBRJuKClCGeB5c8E5HG9HUHwwbpfOXfjZQ4dHgGBk4JllLOtG/G0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715790767; c=relaxed/simple;
	bh=AMtMteIptNqtriP1hylsygXqLXXZ54BTVeDjEfYBNHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=W6owEp79FfhLkywHjVTACi8YBtYfSshLkWJaAejmJleR+7pHdFAhJZTvth/8UkhzrP6zoJVvwxSbbjwX18iDT4Rkb6aj/l76j5Ht8gLdR93g8ASxn2rpBeEj7bWc/Y+EgrLtZiwBSAkavFPuZKGSruFcckD4GBbxR910BPk9onE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=Gd+c745k; arc=fail smtp.client-ip=40.107.22.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Gd+c745k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n41JgSUEEWp63GFaDm1NB+2lb9WLSE5594GzzAziEaAwJMjIzks4NMRRfTO5Y9FnUtJb72HkgYidZ5lBCKVT1HQ6tPFcPUpfoFvxOJJVkJst2M3fnjRyoVnsggmI2kZ8afYNWIntKi0KCHzEjPdEC2SOOFK7/yqK5yTZzAv1Qn//FLDTOrWFFSdFfSZ1LEPOHmVkCGqjc0Qh+IBE7fkPknXNbgsykLUwAsSg4w51zUIE90gEbjO4ntDUJ3jChWAb9WSeLQUn+ySSlDOa1XNdzq2DzZPAZO074U6dkFx0Oh4vYgOGZlS1bJvofY2/7ui0WhFa1WO7v07VZmuo0OQZMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKz/8TkgOvJjf9/VTQUzUy5tXBJJivNcMw6A0/FRgP8=;
 b=Xe/wr8HbxxbYiBFDK4PDeywFBjbgvcNUpP/60L3X/n6Hd0AvdlrlkZk8WO58N3yyjdOeMmyGx141c7NGW0RPsFILt96B4OF3FMb0ZExmRRkgao4XUXlRkt+f69B9g4Bk8k1jaByNWKiIWwP0Z+2ylVEPynVDtIyXa+Kl3wBjm8wuze3aSv0Azqc91v4RHuPrgEGNPr1TZ1iNFbocNuHeGUe4fmJOjomdOtBcAn7iiZqy5WfCrSHeSAwnIcRJtz45rl/5qL0lEXGiyxZl/k5yicv1XEtb6vLs2pWxiwTi9vcSRkh7tTT2YlZCd4Qi/bw1bzo40QlwNr+TtGeH/p/Ysw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKz/8TkgOvJjf9/VTQUzUy5tXBJJivNcMw6A0/FRgP8=;
 b=Gd+c745kvEPtNgvCslcFKbxlOiiUxgY7xx2ibTOnbqRdJw3QuwmCD14x5YaQPOECBRuey81T/SIBKw6OdH76+nWN5/I8JNF/j5uBnzjvrXjPc944NTD/IwwNBvj/WBfJs52GtkOS/+7DKpnCHg/EXjuZ6lxuuabv+2fURPPvXZU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VE1PR04MB7343.eurprd04.prod.outlook.com (2603:10a6:800:1a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.25; Wed, 15 May
 2024 16:32:42 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::1e67:dfc9:d0c1:fe58]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::1e67:dfc9:d0c1:fe58%7]) with mapi id 15.20.7587.026; Wed, 15 May 2024
 16:32:42 +0000
Date: Wed, 15 May 2024 12:32:35 -0400
From: Frank Li <Frank.li@nxp.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: festevam@gmail.com, imx@lists.linux.dev
Subject: Re: [PATCH v3] PCI: dwc: Fix suspend hang when e1000e network card
 is connected
Message-ID: <ZkTjo0qZGu9BMYw5@lizhi-Precision-Tower-5810>
References: <1715740955-10688-1-git-send-email-hongxing.zhu@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1715740955-10688-1-git-send-email-hongxing.zhu@nxp.com>
X-ClientProxiedBy: BY5PR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VE1PR04MB7343:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ccb386b-6c3d-41b4-3700-08dc74fca4a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|1800799015|52116005|366007|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aFHi9qI+xDL33TUAfu972d9qMue+HH05c5sncwkhdZz4NTBLvpNbB90pX1M+?=
 =?us-ascii?Q?8aO08biDPo3Nfv2Nk6MiMK6PwS6XM/M301yXnsk2nMIAufkfJGgGOCX/X4Ge?=
 =?us-ascii?Q?JEPcoboG67hhM4h56fw+/vnRMzm8EXLUeANbVw7lWNMXK4fa3jpMnXF4p4ar?=
 =?us-ascii?Q?YWGv9KZKf1v5+92dH04Lrq6ymflCQen5L32TmSSSlCYqe4Jf+4PVkwSspXOG?=
 =?us-ascii?Q?d9rhh9HYH0abEKdZ9nY07hw7Cf+NTekbbJ/ZIdxQZVjTFftu5TKCDBUaRRaB?=
 =?us-ascii?Q?Ideswkct+lWymLY0/tO65E2QkH1FJsEfTMJVelNerB60RbMzb1cGHk+aPW4R?=
 =?us-ascii?Q?k7bs7624uIB/z1127/Ef/CDnYIJyp84iSlPMgdV4+XMvV7zzB3RSxyoQbJ7y?=
 =?us-ascii?Q?6Tn6Ix9Fis+8batzoalZgMOI/8Ay4xL8XtcK8d1BH4Ox8EAvgpP/W+lt7Ak+?=
 =?us-ascii?Q?R8xHIYaRxM21p6znEWTGFm3t+wZdbjjm3WXSjGM0ncerD8YKfF9hbTHrtfBH?=
 =?us-ascii?Q?kq2f1nRtjxQ7/hiVE4gE5cgUbpfGpfOo0YxDx9TPPQixF4UZuUsQzPrQeFx0?=
 =?us-ascii?Q?iyKZN9R1f2TZ+2l/VKWIEaDnkjl1pb4VCCJ/dH1GOViDPs6tnC1WBOpJFJ7r?=
 =?us-ascii?Q?oxpM8RNh4BAPMVxMKtV2bqvtnAR/Yj/ZSGtjCdsSlpjPiWXf0Xh71mGlId44?=
 =?us-ascii?Q?EostSiJ/LvnEos6hZ4E32vCdXCGFkXsFJiWuPJf27znBX+MyAouJwJ0skkTa?=
 =?us-ascii?Q?uxccRnYo8eUgVQRnGXJkrREoqFmKgs+OysUCcsC1Kq1DGrSKimKed9yE86iC?=
 =?us-ascii?Q?UxpPcaMshP4bf+HoFgbTTfXIq8pd0/KBqFoX9u04Jl9HlbwYJXizEw2VBfcM?=
 =?us-ascii?Q?dsip3uoSHqfJqXSOESJNlHHXoPfPjSC1T3CZr2UhNqqPX0Q/nbHQqbOqpO0m?=
 =?us-ascii?Q?g/kieIpjCv4E8ZWghcd1bQRzw0sqKT9PrWBFS9FWOvdvV6Sz8ZcPH907yMfm?=
 =?us-ascii?Q?rWusni9Hc9A6NjDQpD+oK2/ktqjIamOgk+cu9r2tLHb+YpQOSONb5OCLJv3L?=
 =?us-ascii?Q?B276AitFgtkgqPE7BqKcBrK4HtLQZiw0eCvwy+n44Pg4pGCEgY8z6aaUaTjJ?=
 =?us-ascii?Q?2s6XeXejMyUMVamuaMa1NaGbOpru8K40hmckb9uXRADuw9wJs5rkWFkptkBS?=
 =?us-ascii?Q?wQFU2wSE2wni/4e6bPdqnOgnOwdZzOyXjH1cdCbbiQcI5S/rSSPNKFIjKp5n?=
 =?us-ascii?Q?UsLChuhXxroanrEpiLUYkoIxwAuw9x7dzwIN+E2QhxXEU4RJ3BM02UKamCDa?=
 =?us-ascii?Q?4dV4Vu1zQcnHKqYugiss68omJuOzn4/Ai/ysEFEkcY8ArA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(52116005)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0gVAzvOM/NwMYoB5CBTl5XqfiPCl7+k/qWT38j0m/DF9BkmIs9NGD4aS9nTy?=
 =?us-ascii?Q?Q1+nYl4JUSFRtXoiflKj/nI4idsJChh9C3eF54Gnxnl6RfXlBJQMiq2pHXMy?=
 =?us-ascii?Q?VYxqGeqqyQXep8blcqUVetabKRSLd1Gf+71BnkrNlgk9v8d4ZbMPsG1ZSLNC?=
 =?us-ascii?Q?JuI9kJjcR8uxObsBa3AHh1Q+B+xWI5fRmG7gHS0uP4QOUP/KmQxH/4Gab79m?=
 =?us-ascii?Q?r9k64tghV0CwrKBIu7I44nJQ8R7SzuaXLVaFVg/gJCvmigRe1cnu0Yjhwp0x?=
 =?us-ascii?Q?1rFghElVQBQNVERLjNpR35w3npcipSmDNsREbHoJnmp/S7j8Qkmr4URfCVEU?=
 =?us-ascii?Q?jeYYTkg64P/24akRg5RKEMMStvv7YOuuICYE6Spx3fCQjgXK1RvdW1b6WzCn?=
 =?us-ascii?Q?Od6ChC8mh29+guI22RFUcy2YUhpviexxBUg5g8IcmlJTvazWcRKOb8zWYXO+?=
 =?us-ascii?Q?8I0/oGU2ccClOVg0Dq7Lzz4zmUHAOreQB+8KaZHP22raI4ZGHJCfbjgJ50Fx?=
 =?us-ascii?Q?cJN8sArz73QGei8tofW2Z4v4SBl7W1JvTuWheRnOq6bCjn1W2riCzxQk/pyo?=
 =?us-ascii?Q?g3T8WLNHcr1OKBYQTGSEZ1QjOjH3V7Z+X+T8+3nNpgYrmEmqan/fOitChVYp?=
 =?us-ascii?Q?oWwy/aSNQvCBU5XcX6uFtNEQeqnRNGubSiYaEe62sNwIQaBUh8puo6kRaof1?=
 =?us-ascii?Q?fRGhlZYMcrExtCd/VvMjizCc5m+p1IlBXlYVvfYIkKaEUslc+BvqHWR8Tduc?=
 =?us-ascii?Q?XYX2u9jscjiHbZCdQCBiXb/SoHQ0jaWjbwCP4fsMHSYeQYYBXFDWg6nDIxkh?=
 =?us-ascii?Q?0K+b0l6gmkdxGuG9LxeWE9itoU9goagPk0uGENmGG8z1YSY6BRcrVCYLVJBX?=
 =?us-ascii?Q?pPYfZyUizXNutJfhKO0VFv3duBaojaWSFu6oyGWUUVhhQetNHA+5+P2zbOP7?=
 =?us-ascii?Q?88Mo+RkugehcoEFG127sL4t847X1T8exXQQcB+z6i+BokAgaJisSSFG7M9r2?=
 =?us-ascii?Q?E9fofnYn/5W8Z4nsdMfOfs+vgKOXUJA0WsYRpWnHEXk9cv8kNZ0tKWiK0OXL?=
 =?us-ascii?Q?/iRWj/Wi7/j3IWMuhq5MzbyRhfZ8N9niScDMMWHPNE/MVrKPqwnFf9evkM/M?=
 =?us-ascii?Q?TvPaINyLgg/Wd8gtXzlTFF3+FAb0Zkvch5zLzsC4UfkJpXoKZ5OkqIg0mYYY?=
 =?us-ascii?Q?e8X8H002j/I62BmepFr7zSwE+q+c8gkuR6JcpinAsODw4HfJYKc05jKycjE7?=
 =?us-ascii?Q?Ppoq+Lc0/RKvzPtfOSgHIzWb8Wxzzee9QwZd4R8+Lmokhp6aaU3+4jWNkE1D?=
 =?us-ascii?Q?V5Io1XnpnHSIdnqcgGLAB/lzNAStqoH5VjOgp7jCnxpw/1vh4nGBD+JWhkh2?=
 =?us-ascii?Q?K33bpKBSAA7jQ6YAoukk3dCtitQCwusKeMud/+DW5qznvur8YPEzrRzKOR3B?=
 =?us-ascii?Q?iCie25q3P4RFJFq4kyOr+kMyD4bUtmM6Sb5b4BUhHiMBxyvM5Mep9BTMlulO?=
 =?us-ascii?Q?B83gbPLEoWcgpJsSMzqWGJXAdvT8/sLa9ZewrUCAEWYhHnR+Qtvp4Pp/jonI?=
 =?us-ascii?Q?vR+TMfvYts11Fl2iXz8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ccb386b-6c3d-41b4-3700-08dc74fca4a8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 16:32:42.3995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9oqebfDKjAXi0b+FFHyVpmofntzlVhs7UIOxTe94d/mnomZwNpHu2/KElwzvghJOvEeK4Kyfn4sjFsDLNmcS7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7343

On Wed, May 15, 2024 at 10:42:35AM +0800, Richard Zhu wrote:
> In dw_pcie_suspend_noirq() and after the PME_TURN_OFF messgage is sent out,
> one PMC version2.0 endpoint device E1000E network card hangs in LTSSM stat
> polling and L2 stat check.
> 
> To avoid this hang issue after the PME_TURN_OFF message is sent out.
> Only poll and check LTSSM L2 stat if the EP's PMC version is 3 or later,

Do you have any spec document show PME_TURN_OFF require PMC version >= 3?
PMC register show how PCI function device require PME#(in PCI), in PCIe it
is PM_PME message, which is difference with PME_TURN_OFF.

PCIe spec require all devices have to reponse PME_TURN_OFF message.

Does miss PME_TURN_OFF_ACK cause dw pcie controller hang?

Frank

> 
> Fixes: 4774faf854f5 ("PCI: dwc: Implement generic suspend/resume functionality")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
> v2:
> - Add a new help function dwc_get_devices_pmc_version() to get devices PMC
>   versions.
> v3:
> - Fetch the correct PMC versions, and get the minimum of them.
> 
>  .../pci/controller/dwc/pcie-designware-host.c | 52 ++++++++++++++++++-
>  1 file changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index cb8c3c2bcc790..a064972b36b7a 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -884,6 +884,48 @@ int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_setup_rc);
>  
> +static int dwc_get_devices_pmc_version(struct dw_pcie *pci)
> +{
> +	int ret;
> +	u16 pmc, ver = 0;

ver = PCI_PM_CAP_VER_MASK;

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
> +			/*
> +			 * Check device's PM ability version, the fetch the
> +			 * minimum.
> +			 */
> +			pci_read_config_word(pdev, ret + PCI_PM_PMC, &pmc);
> +			pmc &= PCI_PM_CAP_VER_MASK;
> +
> +			if ((ver == 0) || (ver > pmc))
> +				ver = pmc;

ver = min_t(u16, ver, pmc);

> +		}
> +	}
> +
> +	return ver;
> +}
> +
>  static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
>  {
>  	struct dw_pcie_ob_atu_cfg atu = { 0 };
> @@ -924,7 +966,7 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  {
>  	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
>  	u32 val;
> -	int ret = 0;
> +	int pmc_ver, ret = 0;
>  
>  	/*
>  	 * If L1SS is supported, then do not put the link into L2 as some
> @@ -933,6 +975,8 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
>  		return 0;
>  
> +	pmc_ver = dwc_get_devices_pmc_version(pci);
> +
>  	if (dw_pcie_get_ltssm(pci) > DW_PCIE_LTSSM_DETECT_ACT) {
>  		/* Only send out PME_TURN_OFF when PCIE link is up */
>  		if (pci->pp.ops->pme_turn_off)
> @@ -942,7 +986,13 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
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
