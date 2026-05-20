Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011027.outbound.protection.outlook.com [52.101.70.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236D930E84E
	for <imx@lists.linux.dev>; Wed, 20 May 2026 02:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779244666; cv=fail; b=QzJy95IYXNI6KJBuEvgSi9emidTBiCDFIzMeRBYHKBokoEH6YmbRYFEIHyMSdY6cGk+Jkl2Urmsx6DLmjk5F6YHDVZRP2hJBeWvvAh3fXsPykxUtVl7j13JAsn5janMv2ErtOe/nA37zBrJZXs51INCFlrQtXeCdBAXSxvKeNfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779244666; c=relaxed/simple;
	bh=X00bStrazWawRXVPvkOtfvl+BbADB9G/z2AiZB/IGfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LAQo3FiAbVipcK0AGsXIUlPmUJijMRZnR3F8yFmBwNICF8xpi84Di5B+0q0p7vX+TwSnQ8gWcP/Y0PZsB5phTMN+hmXuaxCdaKwyE5G++2NrvP0yeyDgeFt2t+SToGVIno7bnD3emmaGdFJUVnDorQ668djGPf7fF0td8zG/M38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mWBfUzO6; arc=fail smtp.client-ip=52.101.70.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mWBfUzO6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bKSAYhTiaGZZRSYB0LU3EiWHukbFKEmZbsHLD5/v4J3Qdj4sqMhB09QxOuYK5O/qp85uP3zH1kKxpNeoLWEhMFWaq3EXq9pkr4PjgH29LIaSJJn9SQcRUBCxX0ngNa8nIuaCQw7dg2SMuX/P4ZE/yJATJMuk4RkXCapQZ1+00uMbNUWWprByvJ6HTm75h6mNSkEA2cLY8bM3JlOq8lrsDkWYJr9X7LyFfi76Mct42Cm+M5lGGvW0xg+h24XqAFCAnadE9yBb212AeNiDaHYbekLc3YKd8Jhu/TrEPXtvubjwke7izfaMIg+LHZlI+CaK04kKk53hIkbB3TNVrLcuiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxGZg9Abr5+8t0n/zRL2XZxlKedkBGQ620RQVUURTxQ=;
 b=vMHvv5b3ivJBCiVcTVZEV+W4kW2r3SPmxKE5D7gP105uu6HyoIpoyzLVlli9TbzR9BATcu3RyTB1kku22qeouTFHA4JnoLskq0iMhBJDe+dU1z98BHHmVGsQX5VPT4fpLlsiQmr6XcLAoimWU7GExf5hbF02CqHZa+ANDLZLuWUuYyYtBhtkJue7byUyrq1eF/lQx/jBu3M74d1g3ich79GzQbSV7osR6BBZva64/YRZoY22bPiTh4+TOSQodY4gikhgWh6t+4Xp7Y/HdqeGEFNOXlB1XSczj1Po3uVLJMOHumRn5WSTxlOBEHhvLneHDSEqXblQ86N4WEnrRMeMFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxGZg9Abr5+8t0n/zRL2XZxlKedkBGQ620RQVUURTxQ=;
 b=mWBfUzO6tIwcE+3grYsD0xCC/UEzo26QUgvdP9QV5U4vejKwXMvajhfIFR43+wzurtDJ3x3TmLGqeGrdomD1sP79L/qN+8crOxzN/nIGPuOYxV6GwGB2YIOU4hRmaza14cUHworwPSTUpNS8/5KniX8/3TmqmPeXaDbjLuSG5QGctgrnR0k5OQbzYV425vJ9qIOgdF6lQjpAvsbIL0rgzxUDRYRiE6T548GlFTANq5Yz6/73dA/CeMy/aKMI3En0FoDXj9NgFT38Trtvbhuzi9rRcKrR5hPIeUtewXCQzdzr8X+6PFXOnAU7oVXdcNu+gKYYNnSakGhdZPKLibeziQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA3PR04MB11179.eurprd04.prod.outlook.com (2603:10a6:102:4b2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Wed, 20 May
 2026 02:37:40 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9891.019; Wed, 20 May 2026
 02:37:40 +0000
Date: Wed, 20 May 2026 10:36:40 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: alice.guo@oss.nxp.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, festevam@gmail.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: imx94: fix DDR PMU interrupt number
Message-ID: <cb4ow44rhze2o2d7pszxqf3awex25ud2ogien5fn4ag2e2whqv@dzemye6pgthy>
References: <20260519105517.3638614-1-alice.guo@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519105517.3638614-1-alice.guo@oss.nxp.com>
X-ClientProxiedBy: AS4P192CA0020.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::6) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA3PR04MB11179:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e590674-b9bf-4945-50c0-08deb618c329
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|19092799006|18002099003|22082099003|56012099003|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	hIabuoKyqH3UaNDl5pjBqlo76oPkDwS2gaXtHNZVTkymoEC7lb/dtsR+wcmvGKiD0vk14eQbvhnOwzRO6tqiB41AfR8qV2JcqKMmn0mjRKZyGt/LUgYYuyYulBj0lZ/BCODmNBkqtNY9QFAR05Ih8NRAt3uJ9wm55ozHxt0pGSe68WyFkNFvGBXAeguTlnUkpXTfXXqcqYCCLDmaSQogzYlqi4KpykMsrhWZzu2gxhZ6Z3pa/KdJ7G6B+PLVA9cmad7MCVkiRVbrQsZkNeYp8vL4UBjp98O7Te6LtU/qywyt2s0RRrhD/Ww4xk8kzgiOenxMEh772hfTdftrS4B0pQgSWS6PRn+dYYRJZfDDN3x/urW3eYnEdqrtkUSw2QwBApUDPIzeypHz7lsEANzgmj0V5+Bpw1zk59Sl2+hryAlm3oYRPh4E9ZS+qMACSUrS2+Ovy+gdiih3JbJoCZ6WzdTHYAJtAwpyV3oUeXK7bmRwH9Xa1dAEVn0g+EgdHQex1oq4vvQccX69MF0X1IzkcagSBiepKw0pqsgq1wxx4xPRASHTQG/olwcT8jE7H3kUU/fcgyg0ip98PeUSvZqQsTx/HWE0S6bdVE9oq4zVK8G1VC1xjyF7tx1Rji99SrxmShwl0xoEKhRMe5zO1D5hzca6OQqIVI3AVGJVFHaOm/MEMK7vxGl+wiNNYwbliZaY/i5y0TBFz94FhO0SlK1ppkZ0ogeZMa7Fg4OEmFuQ0LHOBHNLQaYN6o5y1l3x4Ru6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(19092799006)(18002099003)(22082099003)(56012099003)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AnRuO3v/ipY0meNxqeNSm2wUf+iX03bjex/mxxcHMC65A/cA7TOor654+O5S?=
 =?us-ascii?Q?a/55F15muFgpGiOjicwkerZLZTJRVKjwpqWfG/eJIx9wvy5o5AuSTPBwWseP?=
 =?us-ascii?Q?wHxZqR4GO5yEU2NYAdoyDGj/eBiFCB3p/9ir8wZDNANVZXBlyIMHTAw3LBxi?=
 =?us-ascii?Q?lk5BuQKZ5LUDfkZH/IFWvl1C+TR+/5aKuhEUxYFSocix6UucoL7thiQr7/pp?=
 =?us-ascii?Q?NssKOBWAElawTIwn47VPcTC/kkYT5xnpPnnOMUNc8B9vq8Us8MGZtgkosrPX?=
 =?us-ascii?Q?OvSf0Uei3e1Ndji++VwvP6JKrSFz3K336FFnwXkzMoKzGmBqsJte2TJD5KfD?=
 =?us-ascii?Q?ruFQSHghe6K+hGB9OnbHoC+hnNTdM3ecvHC/D6IbxTXdcBrrDwLpeC4ambBo?=
 =?us-ascii?Q?nhyPJyAcOBWppa4b7hUhRV6drVCeikJJsL0uH+Kx6tNT21C2JSjaw6YKdol1?=
 =?us-ascii?Q?dZ0CXwyDzqMiAX1wNWgZABog7BxGAk2b8sB2h887isvV50g+mjwNwUx/HfZR?=
 =?us-ascii?Q?U4eCBpA/+qLsMCv8h7jeLKiXDe+8Nushkk+9beGGRQKT3T2ZFG6FIrZzhvu3?=
 =?us-ascii?Q?kJMTe6tYER6ocMAY7G+GVQSjVR/qWfSaBeB3mmlOeon3LP9Pb3prueguMzDX?=
 =?us-ascii?Q?OgkBQh66kbwxd/L6ZFx8IylQiJw8sjAZtPEBqsXHrsD0fFnH800kbkyDVgBV?=
 =?us-ascii?Q?sPuWdtGXSZ0md6oYAbIz5bY5Iz0LCheLDLIefGAreD+sNA9XPS1PYx5nSO+G?=
 =?us-ascii?Q?appYOlGvnd6RkS1L7gNhVaJYjCLXXwKK8g+gevhdQ3cVPKVu+4/irTV1HZDG?=
 =?us-ascii?Q?gRihTVlufZJffEOmHJD3R/3hEi89uzfOIZcUyyAR+PlBnXhWBAISzh/cTZpt?=
 =?us-ascii?Q?1WN1OkNF7xcVucorDIRSWt3gxQH8yExKR7HlDw8uO0xmt6LFNcy+VchWO6/8?=
 =?us-ascii?Q?e30mxZDIO//LlZ0DeSxemkGW9bapRe7Bdbs4cbJa1F97mPWfGfMClqAzM4vM?=
 =?us-ascii?Q?yW3VitupS1kL9c2HX98uw8IQysNrbUraLywbSB1bkVUfna0Yc05ciSdaXLVt?=
 =?us-ascii?Q?i6iH7YSIh9Mq+sy/1ifNuU9MhLgXeMCr3+fMhVU7/HBz+lynASdHCZCs/YMr?=
 =?us-ascii?Q?b18ffdLSefaPbm2n2/ocxF4uOjp4SjKPlmC7zULI+GOdKIud8xmaVO84ZO7j?=
 =?us-ascii?Q?UEF9Ul7gPqjSXxhrW/3MoenA4hZenILeDJp3DUs54NSCCmFySe1Lk28EiB3h?=
 =?us-ascii?Q?Ls2gkmJyp7jyZLJveJenalV29fOQxN2eGF1llWcsNs2yRGcLI32lkxs3chDn?=
 =?us-ascii?Q?eq5B5z2FxUUPHyrS9JfLyF1qk1kK8nxWwWMjHl9ioJhxK8OOQzELjuU/cHEJ?=
 =?us-ascii?Q?n6WvuGOLJ4+Jawi/ah+0b1y5nJSiXTwm1BMfbQvBfu651jQJOiLR+SGec06f?=
 =?us-ascii?Q?qlwAEoHVuRZHaqC5897I5O+VL8gFFsCVm6OL0CR/LnDWVraOIw8BwIfh29yw?=
 =?us-ascii?Q?8kTTgiFZ6Erw1Qwq8DT5o4JsmMmr5mo8liEdSNz+o8eTZyuo4irMj/0iuLZ/?=
 =?us-ascii?Q?xxqjOfvW2i03OYbwIdT6drtZHc1Sunw4lzudNtB8Saft3hitvK/Ookk4hM7V?=
 =?us-ascii?Q?kGzpdaf/b0n/e0/+1VbJT1W8dL/8j5Q0ecOW+5TgNGhty5qgqQl56VZ2SBvP?=
 =?us-ascii?Q?qiWzFyOVlEowq1AcsfzubazZRxtNQD9Xc3fRvlAXlAbzpT1SIZKK7k0o0ZCS?=
 =?us-ascii?Q?UsAHuEmh5A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e590674-b9bf-4945-50c0-08deb618c329
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 02:37:40.5670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VAn0c3n/FVZ8ao4S/d3LxSA+Qjd+UDMsGVGTiUQwFUsFVzlDbqlclvWxzM0mR+Uo6azjNc54aWlQ+3DlCve/mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR04MB11179

On Tue, May 19, 2026 at 06:55:15PM +0800, alice.guo@oss.nxp.com wrote:
> From: Alice Guo <alice.guo@nxp.com>
> 
> The DDR Performance Monitor node was added with incorrect interrupt
> number 91, which actually belongs to the wdog4 watchdog. Fix it to the
> correct interrupt number 374.
> 
> Fixes: e918e5f847b3 ("arm64: dts: imx94: add DDR Perf Monitor node")
> 
> Signed-off-by: Alice Guo <alice.guo@nxp.com>

Thanks for the fixes!

Reviewed-by: Xu Yang <xu.yang_2@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/imx94.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
> index c460ece6070f..379429b3072a 100644
> --- a/arch/arm64/boot/dts/freescale/imx94.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
> @@ -1481,7 +1481,7 @@ netc_emdio: mdio@18,0 {
>  		ddr-pmu@4e090dc0 {
>  			compatible = "fsl,imx94-ddr-pmu", "fsl,imx93-ddr-pmu";
>  			reg = <0x0 0x4e090dc0 0x0 0x200>;
> -			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  	};
>  };
> -- 
> 2.34.1
> 
