Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2083.outbound.protection.outlook.com [40.107.22.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A628D1F1308
	for <imx@lists.linux.dev>; Tue,  7 Jan 2025 15:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736264381; cv=fail; b=gI5eZ9Yo2OzsImdwKGcePv/9GcmEBEE+0V5aH8ETHVfjZqiyLNxk5JcUmTpAHNAPYjWMpc9xI17wI09Nfh839QhRZcX9x9abVBuAssVRnDaMfDJToXEl/VIbEzk9QQggRa0FGJMNAWnQl10bErYCHuhComHhn52poUTyIxV5hmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736264381; c=relaxed/simple;
	bh=PyPVfC0r5QB1FScS6zdJbIqusSgv2r8SO8EllCJDHQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ciTSIpRj13AplfuRkjg5825gwAUiU6EIm9KHV/N02pBtysQYLAj83SkkhPgcfck6Vt/r4o4tsipu4tB3Z/i8+TeaKcElvp/TgIbFqSeFsrRBk8BH4tLcsZXpHnOGH93vLgO+NJuYL4J3n+q5plWojw+uPkmtn8tM5/bYKGJNUgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Xtc3mojD; arc=fail smtp.client-ip=40.107.22.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Xtc3mojD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vx1mZ7Xd9/wTXAoI6iyIuz8g/xa/XPMW4KpAmCicFNOEGGdL5Hwh8JPODYq3EI4Ea1twWnGC9wKTEnnCD+XgSo79UllaXaysp5OkFNXsWRYJwDiye1sknCnqWzlNMAxHxiu8JDiffM/7/6o6M7+dxdnJaK1qaqxZNRLobH8dvkIH4uBZtwYLjXzm2GJ98Ggf2vyv9WV+TgebAm4ahpKrw3gD1T24Z/QnZN2TEs/EIcDtqtc9UAhJaCpaH4oVtGMhYjVce1LJ/BSbb3P3cJuNQbHuVDXFdskbHTvWX8ySteqB4Fn99dI6k6rjI7AjvkU756eYQ8wlrNRu0a2DtwjE5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxGyfo1KbXNlMfyjLGLZPj8l9ijZy76fKhL2MoUszA0=;
 b=WKaQd2e6N0n9+b85My9JApyBmrMEyjwbstIUVYvzupgB6lGNI1VZJCNY02s+75+K0YI8xVmKsI6ZmLGQ7ZJrKGaIJJzLwAoSGV8m3T0ZSoUvQDtFZeJqyPy461I9+iPJapziF4XeLb9mt+YZhI4hwTw1k4WTI4sr+JUk3bYaU3JjvhP4by7zvpV35w6Y33E7UYZ4pxuG/7CKTsgd8YOrmr4vDXLc8EhSuofdUBNUKU9UEtG2DoL513u34CBZWdrwVC+iGPasnd5wEsm7bX7qbHd8tvqmdVSPpqtZlDMXKQWzA0O9jJ4cckvVaLikKfu5TUysUMTYE8f4EpDDQyY6Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxGyfo1KbXNlMfyjLGLZPj8l9ijZy76fKhL2MoUszA0=;
 b=Xtc3mojDGM3rJGzxrIXh1tqVSgZ5s9G/HkQZE03lMS0zhDucZ/wOOibJIoEqjYf+eJCsVySYrKQPoN7tJ4el0ZpDFsiPeOYcWMFWC2pGd10EdGDqaH1QNiVcIsVKKMa7VWI1XvnazOnfyv/eDnIH0/XoKgeDn8EQzs2ppTtJ9DEdQtzv4OvsfV5D/TvrM/NHfSogfxFni+96g+GytCiLL5rxd+/k2EGpl2Ce//+dYDOJjIgph/LzIQ5OiZXidKY30l8Ns6OhdiqryJ89FKj1tk2BiNniaUOiRNwVkspEkzER6AroYoyUF7q1gDgjrL/Bg+05zAo6w6jcmYSgwTeCag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU6PR04MB11229.eurprd04.prod.outlook.com (2603:10a6:10:5c4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Tue, 7 Jan
 2025 15:39:35 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8335.010; Tue, 7 Jan 2025
 15:39:34 +0000
Date: Tue, 7 Jan 2025 10:39:25 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH 1/5] arm64: dts: imx8-ss-hsio: Wire up DMA IRQ for PCIe
Message-ID: <Z31KrdxPULx8K5ao@lizhi-Precision-Tower-5810>
References: <20250107140110.982215-1-alexander.stein@ew.tq-group.com>
 <20250107140110.982215-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107140110.982215-2-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: SJ0PR05CA0112.namprd05.prod.outlook.com
 (2603:10b6:a03:334::27) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU6PR04MB11229:EE_
X-MS-Office365-Filtering-Correlation-Id: d58bf638-fea1-4008-0477-08dd2f317c97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BYnZBsRZOFIOhJz6agiBdlWdm/E0KpFVQ1VyeLQo4v3bVfDf7TljY11NCfQk?=
 =?us-ascii?Q?y6T7QphqPQm5J5WAyIT8x+CWksqfJFas/MQe7LGS8KWYKx+/OsqNon9cjdn0?=
 =?us-ascii?Q?N2An1yzzbmmKyKo7ROrERJN+ako+qcFgIZBXuhkcZj28oGIeUPHn1/ZyucUo?=
 =?us-ascii?Q?6JVLCKjBy4ho/z9IGgmJThfk2E5kJ9s/vkhgLYffNgu1R91rAoqBtT2nUhbB?=
 =?us-ascii?Q?GlFMSqfnYyx8566Y6zamMblLht9HzfNXhrR2ELijrQOJETnqAbId6xT/F9zY?=
 =?us-ascii?Q?aadQ03FVYJ7f9dUDKtEvZB87BRKASHPsOZvrdOC1i5PvdaKLmOX797YPFuOu?=
 =?us-ascii?Q?niPCoBKVeg9vdJ2gzGy/OlqAN2arjksqSQBS/h4GweHiGdpwMNMMpZtUeEk6?=
 =?us-ascii?Q?v4lRGWD7BSFUQ00a4sGdtjqrRofQDz3Lknzm+2YTxrhIx4Znk+PwstCpkFqV?=
 =?us-ascii?Q?4QNYfSOiBctKWBB5A+9wcB1asYsTKIXUmiiHiIquhva722bGNTkTnuzhcUYl?=
 =?us-ascii?Q?IAT7sxqFOhOMrTA0VgZyG6GKe3lSE0cDq7Bz+6fn6KpzrgiTY1m7rFxNHHMw?=
 =?us-ascii?Q?WEq4KSWfgvT1yJtbefSdl4dfqUQqx6GoWB9tI0uCRZzd0nO6RsUlmDFcQTZZ?=
 =?us-ascii?Q?Tt8tYN+iuX0BXmtQsjqiNKz9RIszw+DG/j8aSZjETruc4LaLE2FFiUWZdHhr?=
 =?us-ascii?Q?gDylhTKfb4ndRelrYhx8oHfbUFlOeMFrSRc0vGgVkHwylI9EXCU3obFP4eL+?=
 =?us-ascii?Q?33k9wCZaf3lrHKVV/C0NilrhOtiY2pKILitmixC3ZDkqkY1ImEXaCXixpOZ3?=
 =?us-ascii?Q?wil6iON0iEfsFBKYOdSLpfcPJRY6mugiqueWqyQEzEMGUWXIjd3f3MTYaAuc?=
 =?us-ascii?Q?rR/TBw0PkQrnNAp2Uq0LYBm5hb0+J2nV/UbeH0DQ5u8D2WK+MGKA95AqJLjI?=
 =?us-ascii?Q?SRFSJTAjMOzAaPD1LUyV9SacgFyxqTL0HRVuQqcicREz5v0Av5nPYlNEZCqX?=
 =?us-ascii?Q?sY9wsc1yreJhV5d/bWNRVCdDVULR15JIp/vcJapKFsiTCzqAltwBtJmSe3sv?=
 =?us-ascii?Q?bUVuWJWhu029VqE4nDXnLviWiy5dxF+p6tfyc16DoESYNkXnEmk+ys4cJz5T?=
 =?us-ascii?Q?yDpIkPwnPFR2jNsLU54abLPqiUlxYaXvgttD6TfjLCZeCcEUbhle7Dd/ijIG?=
 =?us-ascii?Q?1hzKuOkJu7ENdhuMn4dcgm0qyTVGoFMmJYHsILPafI6XzKrKdFQqhmAqzU6S?=
 =?us-ascii?Q?PxXc+LpwYBVkvR08qeeJRkJNqJ4MdKr5Unnap5ct7VwUGO6RkC/bGaaF5JDR?=
 =?us-ascii?Q?LN9NOexxQ7Rtu+QP6Vm7vxTlzhW+Fjg1mslAY5s1QpwMpvdHFaYt94TFNonL?=
 =?us-ascii?Q?LmsnREqsmHkPKeMK7j9awK3iPvgqJEy5Z3wwEd2kCDKFykL0mXR/RcgByqd5?=
 =?us-ascii?Q?JOw7kezOz94GFNZOLXRoBLAexqhXx15W?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bz2U8ybAAA65+QoFhpFvvwFUE6UZq1QTVsgEMCBojAbRzuC2r3J3qIhDZRYs?=
 =?us-ascii?Q?dDoS+aJNbsfZW/tXpNfaMNDSPBkNtLh6m8/xBTC826rcJXtkBfrw8FzCVcic?=
 =?us-ascii?Q?/TfbqMX9t6E9kbkq+GTrmmMSuPdKEPOiP5I5NYSCQ9vCElf2S6U+D2+eFBpH?=
 =?us-ascii?Q?B6RLNOypmBorxWYflB/K/Zt8owkNUMWiPJPW2j2LGT/IPv8Vs3wDtp9JB84V?=
 =?us-ascii?Q?geNpAMHzB/Q5+aEnaDgzWVnocp9czxn+EjYExPUMfpiPqxiWxaJny4jFl12l?=
 =?us-ascii?Q?EVvIUHh6zp3staLEbqZdsHJmhSK9B7VLneLOsLDQuangJ0IeITYUhbqhD2h+?=
 =?us-ascii?Q?cpeGaBlzh2ZLKkkuv3Z2t3AyRDfDx04w3/arlxbrI1HOyeh0JMEvsyv4Qs+c?=
 =?us-ascii?Q?OdJ8Q2mEyuXtePNqaqlC0WAnxFTgj1u7wTrVSMuuGpduSDM0sHhC3Iy6vITs?=
 =?us-ascii?Q?bLA+rpXgE7DbDzOkd7oEtjWXqNHCJ8Yi541uNQyzgreM51TCSb9KthbU4xwY?=
 =?us-ascii?Q?+MA3qglGi5sKuIoM12/gbUUXlM8Udf8xTno4EaaYy+kMvdIGHh3ktuc95K78?=
 =?us-ascii?Q?3ywqEOmwp7lAWjjbjIrFEQ1/bT4OLia/GdSUBdlf4O6Cgk2sPisOUyyHKHu9?=
 =?us-ascii?Q?/xa+9MzOJ9Jp0OH7b8T2ZZVpEOnqp105NS3ytXJfFyKIKONsBfGWG/y4cu15?=
 =?us-ascii?Q?DcMXh10jc1qaRuumWgosNUS8u1EbzzRkIteKL2+Hn3DEmEs9oGhN6zZtHViu?=
 =?us-ascii?Q?+QzwUjqgDnWHvi7K6UnD8JXcKRREg/gWdSZvvTxgARHT4nQyZR4FlTpjtGQg?=
 =?us-ascii?Q?YlUgwDUIiM2NzElf7Y2zLMiUPzc6EL9MhWae4RGpjK5iSPCRIcFWoGPHD+wc?=
 =?us-ascii?Q?Elm/k7pm/Wk0AeO3BguFhMZRT7TyPBm2QmeiUnLbN55UhzoRHODV7y5h6C8D?=
 =?us-ascii?Q?MDDwiZzx1vX9wh2jwunD9NOWYtagIwIYUsesl6ktHZGLv0ITcJUdpod/MZbq?=
 =?us-ascii?Q?+QCqct8D7yObdrEyK+m16jLMF6QhzuMucjEOV2naX60OsaXKcaKR5jVNhaSX?=
 =?us-ascii?Q?rVj8aqJKzSf/eGuoX/26YMFYlyxZIWPNs2YGx4AxY0dvudqqp4Q7/zNpiLVQ?=
 =?us-ascii?Q?sdDtqY969tV/uxKYQeNIKvYp62lamequddM/uoWjnsLArqPH4R+h5orBC/CT?=
 =?us-ascii?Q?DI7qTx+16uGBm+16vAsWYd/CKYqpzJAIkZmR3g/KCE1HRc3572dqC+NA4GGf?=
 =?us-ascii?Q?MGzf6fr2rW45fvqj9WID9vRF9S5ky/rGvZcKo9nbY6bM3zd1Pi5paERcQ8Kn?=
 =?us-ascii?Q?uNfNSC8ApyraETj8I9XToHh0jUSK8AcebsHCM/hBIrqtGyOC1jPWpExAmPVL?=
 =?us-ascii?Q?gdCEaCcQYRoKOEhQ1z6GQqfkZ3JGqJBW4bcTGlesp0NbGbflE/2mPUoKmRxN?=
 =?us-ascii?Q?VTtwlaPONqgjo7vktO7DPJi68oPof0yjtMpTGp/p0u7XZeZ+4JShOV+5MnQp?=
 =?us-ascii?Q?v1jnjl60+LCicfAyGTzvsEkZ2AJzO8F1Y4KEr1JJYmX6NbJdUXNRsMH9ouLQ?=
 =?us-ascii?Q?ywUnqQ6+P6nMhei1nIZxMxUHoBq56tl7QOR6xRmZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d58bf638-fea1-4008-0477-08dd2f317c97
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 15:39:34.7760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wvZMAEriMG+FdGEKMyEF84F6rrotuCm4xxLIOo19Jb8eUb6qE0N9vS22lj+iI/rH3O6rAcZ0ssJtmfEBm04GZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11229

On Tue, Jan 07, 2025 at 03:01:06PM +0100, Alexander Stein wrote:
> IRQ mapping is already present. Add the missing DMA interrupt.

PCI host side have not use bridge's DMA yet although hardware support it.

Frank

>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
> index 70a8aa1a67911..4bdfc15487cbc 100644
> --- a/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
> @@ -57,8 +57,9 @@ pcieb: pcie@5f010000 {
>  		ranges = <0x81000000 0 0x00000000 0x8ff80000 0 0x00010000>,
>  			 <0x82000000 0 0x80000000 0x80000000 0 0x0ff00000>;
>  		#interrupt-cells = <1>;
> -		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
> -		interrupt-names = "msi";
> +		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "msi", "dma";
>  		#address-cells = <3>;
>  		#size-cells = <2>;
>  		clocks = <&pcieb_lpcg IMX_LPCG_CLK_6>,
> --
> 2.34.1
>
