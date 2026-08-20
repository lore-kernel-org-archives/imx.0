Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013035.outbound.protection.outlook.com [52.101.83.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EDF47ACE4
	for <imx@lists.linux.dev>; Thu, 20 Aug 2026 16:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787242157; cv=fail; b=Q9kQZBb9T14yAMQjJtBQXdJfWFBntTG31/JZute45v5GEF2I/ySjchDPT1jDVwiCVwlFXl1Dnb2jSaxFd0AadGWWy7yBlyrOxKJHkRJAIPp9UOsnHUyxHdg7VYN1liy+zrr4lbUfm5QuNliGFJKu5t8FrKCWK0+dsrL2CqTK45k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787242157; c=relaxed/simple;
	bh=Hlad81b7PEY0ltgPvgI6w11vRxrQersWZ7GZTxDTbuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FC8mvSiEX4gd9g7yb0zKwHaW9fhhvlCAfCSY1IOxevFiH0rNP8QS8rBbJj8xJ/dFQerSl5Ih7xV1S6kMj7ADJjWpEsRGOfmVKQ2TX5WZzze8m8GC8mnIZv+59CHq46xw5Jj5Qsa9WiS5Unzfs6VknhINaFRh7jN64mX3fP70jRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MeQGbNUW; arc=fail smtp.client-ip=52.101.83.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MeQGbNUW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+/z6/gPnH3OKZMPnkWkCbLCk6w91iGqQv+c8iK6VeWsYRT0ctM5uj1zc4UKhTMxoMfJfjCFfs/WcqcYj1Q08O9A8GDWUBnQq6ClMXrjSh6kKRQ59ZTpEAsU43HXkkwPf1PnGtvbhEKjcNZqZ2ctXvzZOP6yJwX9yDEJ+jkwcuDGMaTLld7QxYCM/tOWK3/9DKWEyOkk+GlI1jbJzJsuSz3bNLp8tU2CJCn4/90xrNb5Fg8xHe1L/7XnSbjgF9n1anEIXgDR7eDgZTlNCbCBrgUFSsv8gL7Ngq0DLOVwIuHu9zKUjxWfM/cIdeHXl4isxj9ZelgyWPN/mFsGB1qMvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xe4KodjZENY1zri6aXqLvBdBZitKcIC8oIH4TT2jano=;
 b=uueA3SWzE8+xfDOnt3JKQMWWJouU07fUfHgEWuOmIy+cBn6te6q0soljsOqqDylGF+5wq8cLJYS/ZM1SyGuBn0KX6khAHkg8xugN5DaIRxG4glqBjMh5MDpXpZqPwt0knxfBrGxuf592ItFHkHcdDEhdOgesQ33+fm2vtX5D7Qbn9ovbgRvlH+wGVbMdjpo1bx577RY42BGTqVxP18TEUvELBq3NgF+DtdDTYT44UcB9ijm+RG2ZConeYoLhNiV8EHL5ibw7NX79q7cFNKht9jalD/haKRt+L2BxMXE416TF+gomEpqN+2nM7P9JUd6p7c5o6PJ8KGmFrhRhVZMa6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xe4KodjZENY1zri6aXqLvBdBZitKcIC8oIH4TT2jano=;
 b=MeQGbNUWL3KRpMj96++0n9APXNHxaLoxZPIDL2k0mlB5EQ99s7OIHWCfj+uRa5fkXX1k+csDhKqhY0mBOdnFIjIACxGTcwPZdjpuJ4mjVYKREt5xPXeZZrlDJETf/8MYm8UL6M8xAJkCRGgInwk4u9aVgpAmVJoi6Eys2rAsSsn28RLZYrMJmsmdCr374eyrisWKerUpyBdFd+Ksx8NAdQlJVMVvF6CK87PVdaB6i08NoO+4/ojLQ6mWftGNECQb/BFjTPzjJGJyUIZu4JYQAqR4fIwAYZ/tKeWGkjxizwPDB6Szlvpimz+OG68LeZvkdOCkQUJdMOgKktI5/MLo+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB10673.eurprd04.prod.outlook.com (2603:10a6:102:480::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 16:09:11 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 16:09:11 +0000
Date: Thu, 20 Aug 2026 12:09:03 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: Re: [PATCH RFC 0/2] irqchip/ls-scfg-msi: add multi-MSI support
Message-ID: <aocmn8mkac5O3OMq@lizhi-Precision-Tower-5810>
References: <20260716-irqchip-ls-scfg-msi-add-multi-msi-support-v1-0-9795356d0ebc@westermo.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716-irqchip-ls-scfg-msi-add-multi-msi-support-v1-0-9795356d0ebc@westermo.com>
X-ClientProxiedBy: PH8PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB10673:EE_
X-MS-Office365-Filtering-Correlation-Id: f206c5d4-cd40-4130-d185-08defed55f73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|19092799006|366016|1800799024|6133799003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YA1Xi86A2mh7N8OSSgr96MoureuCWC3TKK5K/9VC29WI2gc2vY/IQxQ43VWfw4ijj/5Yr73Uv2u0Nec3QPvCaPUi+Z0TQaeC8I0gAnfuM1hWHynTpuqi6+wUeTNgDQK0vKd50ug7FpLfN5T4FZppT+dUcTbDgA21yBJct6ewR4GhUaHcUzi1CQ1q3C4IgX+sKMYl8Q2ZrPT4X4j08U++ocIieDcAIYcbfJC7ZWIFC50+mOwZgWjLU+8YUVw3KJLjoYindbc7LSXyye0YGMPSemENnpz8NlyKhN62lMnRkMnsadXsf/7/kIpxF98gq/j5W+tAGeKYuliG81VzcosecIunc+hShhn7mTC60I4d0/zS+z2bNb5rInExE/wN1acVRT/L0ZXV07wzI9MDfT/XYCWIFLthN50w1YJvPFEICNRlnWWfViNke2B233qGCqDzwNkiTqyUWcyuwb2vSLceb9DR1JaUUyBEYLbJ51CAZE5Xb02kXZ4DGxHOpuKkk0GiuvjNzK2SEDBE7WlpBnDjcISbe9OtsH3hWqIOzNHq6iuxtQfksHjTi5iPozvzKwkeEfIKkiskmUE6GWjSPP5gyQbO/9n/Z3lK9T04oF+M0ETedmCdbKzdnyL1ed72dqCDW/gdqXaSDa3lF7ue7sHY/FPlDpEpMmXZk3STrNtAU9c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(366016)(1800799024)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jKkpo+r7VsDpOyPMoSDJmuYZ1XFmcJmuS5sTZtDzdEAsGXkDpTNsPdG9Sj3D?=
 =?us-ascii?Q?TUqmfsHhtzTvHEISYEvNQWTMOC2Qql1CrYuS/isFHzWCoJeddYpeJQ/JuO5v?=
 =?us-ascii?Q?6abMygfwCAqZjxoi57rW2ZzZFg0sCWtfsiDZPQCwSCW5FmeIIqYdtkBxk4uy?=
 =?us-ascii?Q?y9oRQKheWrQhYvi47B3MdFAnIy9zLYE/BMDhVrphv8JwfIbnejli6wh4La8M?=
 =?us-ascii?Q?lIjULmL8f9m5YBLVhqdm0iyZGF7Ddnh9BktdeQgSnUCqoSAKnSRJVVV3j/5D?=
 =?us-ascii?Q?KZ0aoSRivpthnnoFTtsOuAQCbw6d4Mqz1+6Na/puiVxtFJFaI8GBeJo2mvTs?=
 =?us-ascii?Q?mUYqIr0qYyRC8mAxyy3Yu/hfjeSGB2O7KSp5xr4crfoVWG29MdLz/TvgeVGV?=
 =?us-ascii?Q?SfEQ5H0Ve0W9Lt8Jjz3Za5o4U60TbTGjKTRI904UwWgMFM1Hq3XAMyKNk7vv?=
 =?us-ascii?Q?+Ym9nMg0WOOHMyD8trkD0Szs5LPywOPnSGgjpCDSFogmZDTLzX+y+m5Wewiv?=
 =?us-ascii?Q?IjJAchIeUqiP3eCbZvxX/1bSvEwARK/3TeifHMKU4HLfrHvIbGiq3KKvANcq?=
 =?us-ascii?Q?TLwCst02ZIQd9BvEU99XNBKX5nREJHQRoTePwgF1qH1OF89Z/XiHpan6auT/?=
 =?us-ascii?Q?D/psbzjGd0gLBB5Mm53uRXFwzkw3gmNGgABPS9FwzezjqbLmelDZOudqVQ/v?=
 =?us-ascii?Q?3gjc2lD7pROCwMLvmKWS6X95wc2xnPAWfy3EQLMKfZJXjajr4tLK/2z0r2Tl?=
 =?us-ascii?Q?yNjGzmTfGD0lqzuD2d9cP5iKJITPZf6S4fZTtaMTjTwAa0X2KRDsSeIaiy6f?=
 =?us-ascii?Q?MWOjpN7uIqBKFhDr/6UGLECrUOPpdK1ULcjOefcR8xzNKh2gZ++0GVRF1uc+?=
 =?us-ascii?Q?NWEhNHC8K3NzyjdmnGdgPGeurvFFOqsJZ7Jj+wLSMgrjFCEO9IATQz8cecLq?=
 =?us-ascii?Q?N4Ud0Gl+svdJdzHUOjXp0qNWjGRuECq3KsdAwsnwGVjpdmEO7/j1KcXfeuGE?=
 =?us-ascii?Q?JZY6PdQrHOAdLTU4W2dS2mB1MU8viPQQKw/XZuAAneQEjkT1LOEjeSOnl5MO?=
 =?us-ascii?Q?Kuecyfe5i36/ZJVqOPRgR5qL9g2GjA67wnIYOaOA3lXV/0hmlbWV+QjGQKlh?=
 =?us-ascii?Q?krqPNflWQw1UBDLqVw17uACFTOrQ3D2uIlXYLCPXaW9XmQPQyGBGpVqRwr1K?=
 =?us-ascii?Q?MQMcGWI45nu4yUY4mMlmgjLU03MiTNo4b3CRDTLoc9onIGSn+njOpRFIP9LM?=
 =?us-ascii?Q?zLCmdQD9z4jopGWnjrCCQSREox2XTmDvyt3AQyOYDfIvhS+Pj1t6rCYE7Nob?=
 =?us-ascii?Q?LZGtmi+7Rq3gxW6ZaUayewYE4FH8evYezmzw3ISHlM8bh4VChp1EAwvC3M8s?=
 =?us-ascii?Q?kVGuLCD8kuZubITZ8Uez5WHI4S0PvvSemmJD+Av9SOWjvXwj4WeFF5VkCNU2?=
 =?us-ascii?Q?op8Owr4wSHCkkUOiY8JfhCf3IV8RJNLjR+57ZfuPlLkQ5qVABr8CWTqnjReh?=
 =?us-ascii?Q?Pdm+/duPFTkx23BZjctDVl3tPnlJeH/n+cqUK+wYi2iIuy8qqRhAAQRd0a1w?=
 =?us-ascii?Q?n+KP/Mdx9p/KC406N35Kn+WNroqdV8PE/Hhr5L9XMA1w+zF0P29xkEH+/qjB?=
 =?us-ascii?Q?ZsdoygMRwO7ItwU+aCZxP2rMidXsmjNxA/ei1lQKjs/gcG2aaEDOEB0XRSNC?=
 =?us-ascii?Q?CMYs0/7WgSbQX4Qb5SEfQMgpX4Z5c33ayq0wXjngFU8tG6oUhLPSfCrgbkoi?=
 =?us-ascii?Q?pd0Ymqt4+iTL52U4iuXPPTe+26AZ+kkycB86prnFVTBV6uX+ZsSM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f206c5d4-cd40-4130-d185-08defed55f73
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 16:09:11.7822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QwjkcJUDFS1E3+kj0w/JJGH6BWVcVk9zZ8/cdar8YuSVe355QdafDteHVGJ6yEo8JNcPj25Ywnx16z2/RQMwRdZk/RhC9YXYvtA1pdaHYCZJr4SjdkrdkKViWp+Q8XNo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10673

On Thu, Jul 16, 2026 at 12:14:59PM +0200, Alexander Wilhelm wrote:
> This series enables multi-MSI (nr_irqs > 1) allocation on the Layerscape
> SCFG MSI controller so PCI endpoints that request contiguous MSI vector
> blocks (for example ath12k, which asks for 16 vectors: 3 MHI + 5 CE + 8 DP)
> no longer fall back to single-MSI operation with all interrupts multiplexed
> onto one CPU.
>
> The first patch is a preparation refactor: switch the hwirq bookkeeping
> from find_first_zero_bit() / __set_bit() to bitmap_find_free_region() /
> bitmap_release_region(), release the region on iommu_dma_prepare_msi()
> error, and loop irq_domain_set_info() over nr_irqs. For the current
> single-MSI case (order 0) this is functionally equivalent; the only
> externally visible change is -ENOMEM instead of -ENOSPC on exhaustion.
>
> The second patch enables MSI_FLAG_MULTI_PCI_MSI on the parent domain, drops
> the WARN_ON(nr_irqs != 1) guard, and statically pins each MSIR's chained
> parent IRQ to its matching CPU in no-affinity mode. That pinning is
> required because affinity mode only releases every (1 << ibs_shift)-th
> hwirq and cannot satisfy aligned power-of-two allocations of size > 1;
> users of multi-MSI must therefore boot with lsmsi=no-affinity.

what's happen if not set "lsmsi=no-affinity" at boot?

Please add imx@lists.linux.dev

Add Ioana Ciornei, who have more layerscape knowledge.

Frank

>
> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> ---
> Alexander Wilhelm (2):
>       irqchip/ls-scfg-msi: refactor allocation to bitmap_find_free_region()
>       irqchip/ls-scfg-msi: enable multi-MSI allocation
>
>  drivers/irqchip/irq-ls-scfg-msi.c | 45 +++++++++++++++++++++++----------------
>  1 file changed, 27 insertions(+), 18 deletions(-)
> ---
> base-commit: 37e2f878a7a660a216cc7a60459995fefd150f25
> change-id: 20260716-irqchip-ls-scfg-msi-add-multi-msi-support-5e7538460704
>
> Best regards,
> --
> Alexander Wilhelm <alexander.wilhelm@westermo.com>
>
