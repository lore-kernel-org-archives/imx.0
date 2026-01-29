Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013062.outbound.protection.outlook.com [40.107.159.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29853446B1
	for <imx@lists.linux.dev>; Thu, 29 Jan 2026 17:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769708386; cv=fail; b=IZLTxOL7rd+Z21Xqy/opAR8frjvAb4MPpodh9Xjy9BEMhIO1joE95nvItMcZG5NrnE2xEvOtsN9FgyCM6vzd5fTl+9knh479jYCE/N98hb1Ha41b9x2fV/Ohdsyo/r3/IlzHHIJr0aQ1sQ5oStW2ejNOQMGB2UrFn9TDMazs9kQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769708386; c=relaxed/simple;
	bh=uWHREvRU+Qo4goEGcQsuhq7yZ5MyohZm6Cx2ldz0C8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KBd9gSP7e7BaBbHRcB2SGrPt7QzXKJqTPCByea30nh+RiFhiqxD4z8Ql8L1bezgvH24UN6ewC03hcSSqeMpsC9rXmYLrvupz1Hg8OZuCHayKMP7Ksfw63Sgvq/m0JdSvlMs3LucrYZh9zVe69o8udJLUnDgLjqLZKP8vNJ9tS14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XIDWv2Sh; arc=fail smtp.client-ip=40.107.159.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XIDWv2Sh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IkRjYcxp4nhXOJ87VhVJvJUgFS68j31I69O6fn0BJjat5gS/TwT7TWBa+BGH6PPS7LeG5VEVi2HtfUUIj6jOpb5Tnk+FIywedImodWPI43/at2qBc20G8lbHemHT8acVKloqOq20TH8ggBb31jadchE3xDvcjqO+q5k6L2JSsk/YJJJ+rYFB1zfx3NAw39cUHASf2xdyGWGhQe+TWS5goUTAD1fCPvT4+7+cPny9ieXga9wxTwO8aeOtYxJBjJ2hYzAx6OFsWtOuFCOWSiFU9u1hEYOQC+zVSFInrjWxIM8jUq5BzohFKhUFCMTa2dGgQY8SdtIl1EpMMN7ZXEkiMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTFhqzFDf1hle5p0xbgMLwZtSLONnYY5hoHEcI/Bb3U=;
 b=fLLe6IrNakBpK25zX7WbFoyzrfbHmccuXDwY6LNqVl0TjfsCFgM8aZoGVpGoh98B7lk3Tx0U+qgFZT1f/FJoBhoXwQO9ydjV2YkiJqgxmmvSxChilx4DVeLKihXnAN/anpmiVcTKBRL7B/1vrrOjBGEa1c0DNWOF5PuNMUuGAsAj496070t2Ypn/KVWfBRQSoOuU7EW0obWikBMvkgUFFy2SD2MvHF8rsYFCVnWglDbF7anvdjS18qKSKysuxWfJT1st4i9BHgN4+O/g1YmjFhIxJ9o7VklcPcX1lSHqrN7hs9kKrBpIQJejL2AackoA0Ee74kCSQ61EvOZOY7Y6sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTFhqzFDf1hle5p0xbgMLwZtSLONnYY5hoHEcI/Bb3U=;
 b=XIDWv2ShluAqfjGnRRrnX1pYsOQru46M74LFHmYIyyrj5lhpqUvxC4YIlC869MiYgLSCGicbr8VKn3vV8zRVIMcnKoboXb8sVY7pjwFhf08lSvlsJtP1OZHTPQWdnJz+BFmWh1oVHe14T/QcjmSlXOMD+DD1KtYcgiqjQYAKFGiF6M43HG471opiDQAt84Y/WTP6qAMY/V3ASaBDhDrA89OyRkD3xvgeq/4TIehysUDW+NzwJ3ECSpXDgXpvAVuylh7KKGgOxRH1643SuPOF98p+bP6lx1q03zGPHvcvpWI7PJQCImC1rbsAxFaSbZI0tSU2sr540HmMomQgaEuFPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10783.eurprd04.prod.outlook.com (2603:10a6:800:267::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Thu, 29 Jan
 2026 17:39:37 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Thu, 29 Jan 2026
 17:39:37 +0000
Date: Thu, 29 Jan 2026 12:39:28 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	daniel.baluta@nxp.com, dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com, Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com, y.moog@phytec.de,
	josua@solid-run.com, francesco.dolcini@toradex.com,
	primoz.fiser@norik.com, kernel@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 4/4] arm64: dts: imx93: Add i.MX93 Wireless EVK board
 support
Message-ID: <aXubUB8zwaixNCbB@lizhi-Precision-Tower-5810>
References: <20260129084249.3079432-1-sherry.sun@nxp.com>
 <20260129084249.3079432-5-sherry.sun@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129084249.3079432-5-sherry.sun@nxp.com>
X-ClientProxiedBy: PH7P220CA0065.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::22) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10783:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b9011b5-1766-4a0c-259a-08de5f5d5fa8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|19092799006|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?TToc6/sfYmTCsTtt0RsuP94F623I/wiEMYt8HCxttjEUD+gbjL58ihcP77YP?=
 =?us-ascii?Q?uY/Aop/AwWAbdhNLg7E5dmDdFGOkHOrzYA7u0rClg0I5lGy8krrBuNbc6ksu?=
 =?us-ascii?Q?8AUk6SI3lgmfbfGL09veG27UJO5ybz8329+95cfaEX1MJXodveFkWf+2YPgR?=
 =?us-ascii?Q?+iELgteMRWsKXGnMOxuX55Y3VIAjJ86L1KDkBdDGWrinPba9/a6AcB6pShJG?=
 =?us-ascii?Q?XnZrRmeN/LxId2qZDJsB+PAtEfLuUpFpOgiUXnOu06kY04qgUplin/j3JtaM?=
 =?us-ascii?Q?lMNmPETw+3Jcdk+n7VLPtjrHYZynddI6ATbN3sP8ec5CMs3EecgqDrZQcUo4?=
 =?us-ascii?Q?RJGerAfyiRJfjhIvZa1QmhWQSxnS6WLYOubX/L5xhWioHR0YZ91FPn5ZSQcs?=
 =?us-ascii?Q?QLSfFKpPKkLBlRVT9OfhJ7Z5GT0Ujb/PBHc9lHZaEpOzhJJN+w0k5qtzS4vS?=
 =?us-ascii?Q?b3VZHQCzcUxPU9fTR4WsnxK2flCnNT55nxBAeuwrM9yxJYsTMofalXIYUiCR?=
 =?us-ascii?Q?8SwJF3CfzAER5oRUujQFFNrbuypmqHdhMs/doABddx9x6b742lLMNsZzw0o5?=
 =?us-ascii?Q?M41Wh8otoO3QTdoxY/Sq4/NX0S3/W4Py7hKUHLAFmJCDmEEL0/JpUwgAqt8d?=
 =?us-ascii?Q?2kcuoiZalYSmIf8SLfKZA0m2xlKtWGFRJUVqXunK7FGec4NowcZ+ZB2Up8PE?=
 =?us-ascii?Q?AZ2wzaPBrLNgeULo4rmEBwnXLOXuyRtXsfIzhfuta7BycifgzLcesLkTQR1U?=
 =?us-ascii?Q?hd2ZS9X5ny3sscAYhDD+rDG/4XTCzp2mABEWqMVZ3nR6LY55eSEH6UzZ2pKX?=
 =?us-ascii?Q?UUYS7PokCmee3ON5BdhYakCXQtODNUMRSLRy4Ng5Al3UyQMRyt5nCD5Dqh8Z?=
 =?us-ascii?Q?reUQvhe5q5N6PjvNIhxbw6dFOhOaSdlxBw85WFsfM9zrHp0DC6cniaXZFykP?=
 =?us-ascii?Q?MSuHpptzr7vCYNol9bG2+IU790BckZc35YugKdRgjDS6P1Q/Y2tJDdvDsbFO?=
 =?us-ascii?Q?5MzoKLPxdQHnToUmT5XsyjTAALd4hTEdKitAQtYz3PZsrk0JxjML0OSqTerQ?=
 =?us-ascii?Q?GanvEO/csxaOQaSZrIaG3nOVURXL8oWrJnfca1CjTdW3gmS0DpgR2Bcs8+s5?=
 =?us-ascii?Q?J8pRlzX1Jo/BWA+R3H3FC6vM+WXZzx86PNkReoDM7iIOb5DwJ/h72RNhD08l?=
 =?us-ascii?Q?XcfQCVSBHlI/TrTUn7+XwTyeieGSLOKMGO5RkdAOL1zwqtRY4S9vj9o3YqwV?=
 =?us-ascii?Q?U4pYARq/wV9TGTR3EV0suM3b+C4Q8Vz5hpbuctv6e+V/mxTLsc7Hf14Q/Klw?=
 =?us-ascii?Q?z3E6nbYjMiVagsdx7dx7JmA+/BAzwnE48XHkzQEu98WtQ12zZIZmmJM/6anC?=
 =?us-ascii?Q?vz24oaIv9M+FqthbDxm73F12jUdQPCsgCG2b5L9nHpB9aGh1QC3EpE+fEHyA?=
 =?us-ascii?Q?xZbcIyqjm0utQuDiD8Sm1NLE8ao+81DZ5zn0RIX2GKMf5r8ETFdR2+Eky9CA?=
 =?us-ascii?Q?dVVBS6dqtNYQbCV75erkPPMlHsWTZa0FPac/K9FiM1b2et8qYEzGQZ2Roed/?=
 =?us-ascii?Q?EoiepCPLqj6a1NSATIfpTL5qW8+QHF/N96T1NE0Nb4CtOrtZnMalRynmM9b2?=
 =?us-ascii?Q?4D/FU1CS2wnwIPe0uF3DU14=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(19092799006)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?eDhyxq00iTAQhlGcCre1K61Z8hlSzOoF2JMTg+jXo7Oit4T5qRuw1y+ZqaFV?=
 =?us-ascii?Q?X7hitT7s7pp2CwsE0VXWfzhVf8KYJMShLoOSa684aD1TDu9egS2Y7vfaRDlb?=
 =?us-ascii?Q?pdyQUD0zNo/oF/iXv/u+UoSCoFFlHoP92WJ/3DGuyRNUcI+vwsiuh8xVsFHS?=
 =?us-ascii?Q?KqCcNQSAbBoQ6sNMQ66tZDQFd8PJkVJJO8cl97mOL1dQIjPOrdqYhQkFslDS?=
 =?us-ascii?Q?javRI9dZlKc+AGKJm90+5TFD5KZLKNATW3nlgIi8YmZ/8zYxF36tY4vpNxz/?=
 =?us-ascii?Q?dakglmR9WpPIeiHQI4n7aWdPV8UkRnn7eGmkxASa5UPzOo46ZOjygqTbWFTx?=
 =?us-ascii?Q?b6Slmxe9VFE0Znv/MDbBDgWIqM/xLNWKxtlumITWageTu+kYL9NdZcWNcZ03?=
 =?us-ascii?Q?Kpfgv89//l+hPck60EnC+4SUBZRH7cSQspvbR8vZlj0OXmDEzGVlN+RANukd?=
 =?us-ascii?Q?PJGiYrWCHzkhdUN1sRakQF9UgIRCrL0N+qjnndhik5pBGZ/bHEwT7IICV31G?=
 =?us-ascii?Q?3xJt65YPxWEzUmdkTIrwW7GZuZXMa3s81EvXYfw/XhmJMPF7WMtvoH5MHgpt?=
 =?us-ascii?Q?u9JpqnoxUWrMlNdsVyZnr69U9sEviOCgq3XHpPlHurRPlGOPq3r2NStlSBaf?=
 =?us-ascii?Q?dJ0qw9kmt2DvN3Ckz9U3RIxPl841z2OBYVFgxwhv0d201XhWYjltPKPuSY1T?=
 =?us-ascii?Q?9wFKsKT2KnIlRzhhHcIpa1dbGBmLyPVugKPhcjkpidoP97HhzN2Xm3qBp3jJ?=
 =?us-ascii?Q?S4/N0l86tTJT7g+SKNYm/DZ4arqMmo/ehWngejubvCgeJVK2TIbe5TJYWPyj?=
 =?us-ascii?Q?bJDCHaKqMVfeNr4xh6KKdWHVAuBCSSLVjb13iirDs+axIgWHuWIOQNOIbEbU?=
 =?us-ascii?Q?YNM0xmvJUvVuoNJZ8zHjVe8j3bmGI6EFRYudf6hlYFl9O0hWgMBMemg4UgxO?=
 =?us-ascii?Q?nYv2eaPiJ0dZvR8Z+9VrZy32otWkWwvzo+Jpn8TYnAxCfNIilAgZoFtxBJ2s?=
 =?us-ascii?Q?EcTbiMUkCMeF6XyMGSgGHNDVXsfj7Pjgqr5fHMO5DQ0Au+NkcRJNXhbXX0ts?=
 =?us-ascii?Q?JXwZ0moBfl0AAl9t5A2zgENFWwuKLphsJVUafcxJ0c05UFMekVEKKIkrYkKN?=
 =?us-ascii?Q?ayxiA5A5exfvZyxpRfYSsoiPxvO4ZOYbids7LSJEWw/DbfSzJJRJNh0ufWog?=
 =?us-ascii?Q?EmGMa5Ty+egAwhx5KKc6mvApATLM3nS76qePXPbwRPRleSxlbmzalB4azoFy?=
 =?us-ascii?Q?e+HN8xiBF+02lZPPz9sd0POPfcpauWBGlbiB0EWJpfQ8YKQL7r2o3Mw6d4ix?=
 =?us-ascii?Q?TsavEQ1RYrp71KryvSXpB08s/vtMQl00AwvrR2Hm55wVh2lr+ZlfXdA9xPSC?=
 =?us-ascii?Q?w2TaXsP5PMk1QGmIeuxdWfB1rJyDoKvcLsO0iezkAQ5OSz1oWB1QDedFBfJK?=
 =?us-ascii?Q?dBOmTdbXDfIehGiV4ld78YvLbKEpUOsicdUAaDT78qkn7rBXGWQG1SJu6wyz?=
 =?us-ascii?Q?IhlqRH7a9zl0OtLmpaY3gKupDi1uxvSLxfNxafbfudZxE3yRXx+VzzSITVxd?=
 =?us-ascii?Q?02r2eMiWWwATMnzNCneY6OMB8T/Fzp7yf+NUhxnNB9MNFn3YQrDpyc4/4HgX?=
 =?us-ascii?Q?NpQ0eBq4YvOxf19JFJDO3od8WvHDH1zcl0unFoPDWLL7lW7XIys15dqtVlR6?=
 =?us-ascii?Q?jhhn3RMLBSURSYDtfv/z7Xfk2hbQa0/JCHSCaLv1Xl3o+iYH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b9011b5-1766-4a0c-259a-08de5f5d5fa8
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 17:39:37.6419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8kjGkwauN/X3QYG2iQjC8xQqdiJjfPVZixoWm05+DjTPnYExYOqDOSuC59hpDSQPBFAU4Ox9+jrC8kx9W4/uFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10783

On Thu, Jan 29, 2026 at 04:42:49PM +0800, Sherry Sun wrote:
> i.MX93 Wireless SiP is created by integrating i.MX93 and IW610 WLCSP
> (Wi-Fi + BLE + 802.15.4). And i.MX93 Wireless EVK board with the i.MX93
> Wireless SiP basically reuse the i.MX93 11x11 EVK board, with some minor
> functional and pin connection differences. Reuse the new
> imx93-evk-common.dtsi and add the board-specific changes here.
>
> Here are the detailed differences between i.MX93 Wireless EVK and i.MX93
> 11x11 EVK board.
>
> Function differences:
> Function	i.MX93W EVK			i.MX93 EVK
> WIFI/BT		IW610 in i.MX93W		IW612 M.2 module
> MQS		N				Y
> PDM MIC		N				Y
> M.2		N				Y
> RPi 40-pin HDR	Limited support(pin conflict) 	Y
>
> Pin connection differences:
> Function  Signal name	i.MX93W EVK		i.MX93 EVK
> WIFI/BT	  SPI_FRM	SAI1_TXFS (spi1.PCS0)	GPIO_IO08 (spi3.PCS0)
> 	  SPI_TXD	SAI1_TXC (spi1.SIN)	GPIO_IO09 (spi3.SIN)
> 	  SPI_RXD	SAI1_RXD0 (spi1.SOUT)	GPIO_IO10 (spi3.SOUT)
> 	  SPI_CLK	SAI1_TXD0 (spi1.SCK)	GPIO_IO11 (spi3.SCK)
> 	  SPI_INT	CCM_CLKO1		on-board IO expander
> 	  NB_WAKE_IN	PDM_CLK			on-module IO expander
> 	  WL_WAKE_IN	PDM_BIT_STREAM0		on-module IO expander
> 	  IND_RST_WL	PDM_BIT_STREAM1		on-module IO expander
> 	  IND_RST_NB	GPIO_IO28		on-module IO expander
> 	  PDn		GPIO_IO29		on-module IO expander
> 	  NB_WAKE_OUT	GPIO_IO14		on-board IO expander
> 	  WL_WAKE_OUT	GPIO_IO15		CCM_CLKO1
> I2C3	  I2C3_SDA	GPIO_IO00		GPIO_IO28
> 	  I2C3_SCL	GPIO_IO01		GPIO_IO29
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile       |  1 +
>  arch/arm64/boot/dts/freescale/imx93w-evk.dts | 23 ++++++++++++++++++++
>  2 files changed, 24 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93w-evk.dts
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 700bab4d3e60..d0ea746c59b8 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -418,6 +418,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx93w-evk.dtb

keep alphabet order

>  dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx93w-evk.dts b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
> new file mode 100644
> index 000000000000..9832b82b6ce2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 NXP
> + */
> +
> +/dts-v1/;
> +
> +#include "imx93w.dtsi"
> +#include "imx93-evk-common.dtsi"
> +
> +/ {
> +	model = "NXP i.MX93W EVK board";
> +	compatible = "fsl,imx93-wireless-evk", "fsl,imx93";
> +};

Put &lpi3c node here, which use below pin mux.

Frank

> +
> +&iomuxc {
> +	pinctrl_lpi2c3: lpi2c3grp {
> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO00__LPI2C3_SDA			0x40000b9e
> +			MX93_PAD_GPIO_IO01__LPI2C3_SCL			0x40000b9e
> +		>;
> +	};
> +};
> --
> 2.37.1
>
