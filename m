Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013066.outbound.protection.outlook.com [52.101.72.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597EA31A065
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 17:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770138694; cv=fail; b=cISV5SjGEdAu05biREOfM4mAn8s+ccVP3lNr9kbvPcDG1byLc37TuzXm0AZX2RbW2TVAaFRBT7Jz9tatjFSJrlJnHQ43tLLE7zytWlzHnF/i1SSuD3w9rrRThnoXrL3D9uewpeF2Asf+pNppVv8v7TVew4IEC+VtoL0vtuuoG7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770138694; c=relaxed/simple;
	bh=8z2i/QbKnTWFxbvrGUlcJzadg8bmPZ2KFM15+y/42Fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VSy3AS1RtxsQYJiIPYdqcjg6nTwgAH6EplWyppEwZEM7L582oacfz6pg8THEHQi0lzvmLIvcu3RUimtiArNINzyeouZ2+UsSNkVzjFu3D57o7srp3SkPHhz2X+beHZ0Iu+o+Yjhg4R1odEe2ZpKauQ3NAFl7eA52fGtTOJ2yiew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YVP8GjUV; arc=fail smtp.client-ip=52.101.72.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YVP8GjUV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H1qrN8KMhVckCikS0QPzjSmoj/JOjxljKXkgNvFkbG8OIk9HyUdmY2ZbvGpxsBaEKI7hnnnrzaWnrwM+bVPsCO4+l59/05csz/DsFi3Q/ZJUGmSAQjK68Fp6MhsMGt0LnXTW0u2LeicqZX07syIBmhWkdch4HU8mQokc7KapfzA2R4ooZlHSjX+7G14wFRR+VGFSW1dD1ka1Ru4Z47bKTgK1YtoW/7ijjTBvfT8mFz3QhjeF9q97FUin68TvbfIeEOslD6GDLjQd6KxbkoYBKtma6JE8Ab4Eo4jZ34YE3Rofk0oyItuAp80/snYnPiFUlkfjnzn/i0z9F/yF+3wNug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9rF8Xt+7zTBS2wG4AFt0m3mXaP3gtnarqVxiYblcKk=;
 b=q/6und8RLhKK0f4W0oxamhfIUF42lWE71wFtzr0siDui3AmptplPUVbz13fHoGVM4bLMzp/d+2jhypDhOdnn9YPXjpxMCYAoVKWzELaN2u0oMQZQBn7Nb6Uq7oePArqwsODs6nZRA1vu/BA+LL6tXg+aQuieiqMBSZkrmvUxWpg9Q6Ann9zCk6LoFNYrGyouZo0jCuHFS/+Mf/4CleYgy4EedMd/o8Zo/ZWfBK80RiPaeF40pvZJJagThlKM2aMMCMQhFWEHn3Z8cneuiWMOtQ4dYN2aCEUlzHs7vQ8uNPdyjzvtM1ABnzQq7s6WSs7TsSfZXRWR7u1kEu9EfqvO1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9rF8Xt+7zTBS2wG4AFt0m3mXaP3gtnarqVxiYblcKk=;
 b=YVP8GjUV7IWwvv+1quOnOjEOmh/vtH2coV2f2cjjSeQG7G0nag316iGtFsp7E5/GQEKPJBfWwnzdxqAU087Zfo7ltoIVoldsBhQtJgCKNjolh7Zem/VgBiD8jK3U0gTKE1aNH2DbUb9pSZIJCNvdQHMjRMr5oYn7G5bSXPoyn31RbFG+3Jor/Gie4r3gPEVKEf2+2gRdYtbyq2C3+l3nxPRKSOkdLESa48ix7delqNbFrUsB2DnoS1IDZCxk27kBLrlgfe0BX8nIukf8JtkHC32+712dCiftXxY5KUEFGgI8jwHSPNSmfKpdBACq0CQDtRVcXJbanvu19XLtV3hUDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM7PR04MB6838.eurprd04.prod.outlook.com (2603:10a6:20b:10a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 17:11:28 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 17:11:27 +0000
Date: Tue, 3 Feb 2026 12:11:19 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
	daniel.baluta@nxp.com, dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com, Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com, y.moog@phytec.de,
	josua@solid-run.com, francesco.dolcini@toradex.com,
	primoz.fiser@norik.com, imx@lists.linux.dev, kernel@pengutronix.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V5 5/5] arm64: dts: imx93: Add i.MX93 Wireless EVK board
 support
Message-ID: <aYIsN90NALJuw1ly@lizhi-Precision-Tower-5810>
References: <20260203080137.1492376-1-sherry.sun@nxp.com>
 <20260203080137.1492376-6-sherry.sun@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203080137.1492376-6-sherry.sun@nxp.com>
X-ClientProxiedBy: PH8P222CA0014.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::20) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM7PR04MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: 7979611d-0a39-4652-93eb-08de63474466
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|52116014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?IQQlF3gt0urledypyFUlbfYaEK/WfSSopCE6S2TSFyYdjOH6FkwLJmzKjkM5?=
 =?us-ascii?Q?oQT7Izd5/YDEICucp1xLgY8voy2DJXJqIFGRc2AwC0wwleLKuEng6mMUWba9?=
 =?us-ascii?Q?aBYRNTsI5BvIk+0TV6V0nBJqh7z3oTcTfzYC2ncQDJN4SpDwu/OW1qIGrHaK?=
 =?us-ascii?Q?hVybfiVg65SuRXl9P77ewQ0AoD+/0pqOsM17iQAn5yZJM8CtS8gak9gjbycS?=
 =?us-ascii?Q?oe/LAUlXVhQwUpS3fGJqHjCy5S5fmCZh63mw0JhdJjGI9y2DNEuBwp86KeX5?=
 =?us-ascii?Q?YvPyW3tv4K+89mHt39DP3mrLPAKbNqwC/5ouLQeR4nUWhB/m0Pmzvut8HxEB?=
 =?us-ascii?Q?O1bqyQnBmhWnRuCmLE912hlbiYmhvMPnu4XKIkTKaWAF07SckpulO8QYF4I0?=
 =?us-ascii?Q?nJ9pKJdu5zL60543lxgo0U2LFhFj1NAUJLQuRrsjrOLhCSUxShdF5sZlfyVG?=
 =?us-ascii?Q?t4eBP8sZYQRyncYfn9e2ok9QtIbVR/KUq5ngNBtYaVFYos9QEJ2muHgrj8WJ?=
 =?us-ascii?Q?tZTg7Ei6pfxwQ2RMpQMVgKbWovmopig2Wvoa3j6QdiT1QbPNI4hovVT82uhS?=
 =?us-ascii?Q?KMuci7EdzezkdfGo/QWVTyrZvp56UBf+1NgyBcGrTdtu9kac/oPvxr9uvejq?=
 =?us-ascii?Q?nTaAe+qnfEEPqmXfDt1svHkl4pG13Cp7zm2aWzTXnsE52XgzdRxbqsGXAO31?=
 =?us-ascii?Q?1vU8U5NF/4X4iyd6YdW7lz+4rJLHnWz+Pg7TBtpQbX2CkiNuBp4lD4bCzgVR?=
 =?us-ascii?Q?oUaSQPP1yjglriNcXdZD4r0xx6i4ZAdYyh08tHAMsGSIWq7xK/E5b8GnVA6J?=
 =?us-ascii?Q?+yOB9TLroMWIv9dwd/Zql1PA/M6tS3z8Ogiq2bsD4XW68jAscF9OJZKyoE1L?=
 =?us-ascii?Q?4nUfaAerqIc2tC97qXlBIOKDZdllsoxNzPnMarxtPCo1lh/fXB/aVVu+I7K8?=
 =?us-ascii?Q?3R4vKw4cu8uC+fj72iI1wsSxD88JjjSEPKOKsr3ljBIqTLEtuRKYkjG7zxuQ?=
 =?us-ascii?Q?RRVxLscaCh9ZJvctzrePPSx1UJEWVYTzPk68vJ4+GZve1FaJhD9+kbCA188U?=
 =?us-ascii?Q?Ekq8WuRxfKpRYcNMCdtZynVhBZ7vV9fk6nk5AsbtgNeMxCuFL26R1HcoawLU?=
 =?us-ascii?Q?NZW8t4Sb6JUd68fsOL2q3UcO8KPd4r4AQcJMfSYgMTxbw0wUpdGopEtpYsvl?=
 =?us-ascii?Q?0y8YlStAQ/FPrvIBViG67Gx9N6wikxxdCBLwa1LeQdgsPMt1kVQt8YQBD7I0?=
 =?us-ascii?Q?SdakYtl224z1YKTR8vI8m4wrY6sVrSZO8BbLKYzrCbEAiL8ls5KPQ0740AzX?=
 =?us-ascii?Q?CVFKqxMGMIUr23q3li6zEKesgqoFibFpatQyuKpSOiMjdZQZUZ6Y23qrmoIO?=
 =?us-ascii?Q?O1hV4xYON9cMY61QBj1t72qAigFrtvOSPGoKrXVI7HNnpu27A6ji7/u45HV4?=
 =?us-ascii?Q?YsbtzJy3tTvOS844WhoN9oKNKGQwsnhy0GXKROc0wGla9ZqdRMAHM2EsAmSg?=
 =?us-ascii?Q?5PvwADVuweCjaAhk61mbirRqWvltmnEAHBykCHPHDH9tSOe5NsGsaB6KnS76?=
 =?us-ascii?Q?iRF8rvFybBBAlPJTgn5X8M6QTKqy1Z6gg9qEsCxuFt25KfnST70FvL5EoqTu?=
 =?us-ascii?Q?QI4GTNj2lHE8D+D6LrP4L2A=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?fnStxpLX3jBdLr6kO6M5YtqmijadRn0xUhcqxbssEy/D7fi/m7mMJ//jPgbk?=
 =?us-ascii?Q?xw7EIQrB7FZ5qmIW8Zo6DDWBusx6LBFCeVFmK+RD/Y9+WtHP6gLDV3PTVNt6?=
 =?us-ascii?Q?LDKjTgQsIGptRdZh2snj0xR8Yniy3Up6dbSO8+L9sN8u8z1s8SNMYWLQ2RwJ?=
 =?us-ascii?Q?V6e1adwGFfSOC2Nz1nY0GVXyf1QPo/kEduU4AqLACy44xSDAR8azdy3HYGzY?=
 =?us-ascii?Q?nzGznaW2ahTqqnYj+21Cgo4aGtkW0uo5TChwFpuElcDrRZp+BxO0KIJ5zsbk?=
 =?us-ascii?Q?ZoqEobvN9/+RIR2a/yOjmDoxpGxxBOi6OuaknPAuM+nAHa4DWC3bc5y9wuNQ?=
 =?us-ascii?Q?CEm4lZRbyMDT01ARReA6m7iLJMSn9VBEbXOE0vyHJu39/UhgnhZaKcPfqpQi?=
 =?us-ascii?Q?exyDYH1cZxIjt/cA10+Nxa6p3mWobE/OOeKeoZjx765O7ZMR1vR3UsPGU5Zq?=
 =?us-ascii?Q?HOKhsnJjBHFiugIATuFUniDogwMnvoyCI2X8gWvwfNuhkY13LyHwyLprkhqj?=
 =?us-ascii?Q?OCl0MenmOVEiIrrHMZKlqk3DC4xj0TRq7su6ltLKJuTPoMaC4CwMWkNINi21?=
 =?us-ascii?Q?3B7jBu7rPQ5hGOlhxm1i2y4V8MPyI6BV82Y626dNpTOBO5Hwta8Do6KDejGG?=
 =?us-ascii?Q?FIPkGgi/gLEJhBG/9kr+fLKwsDAvDQLyc5zNXOnHOKCEE77OJvKih8IuAIot?=
 =?us-ascii?Q?WYfX1rjKOhIJJ+6q57P9013JOLVfiBIpmvjm6s2UwRyuTKNTmG2T79yTEub4?=
 =?us-ascii?Q?psKYJshNoUGkb4QCYrUQQYse5ivjmGuv2WfxEgOfpWztO9xybH7N8+ibDB2v?=
 =?us-ascii?Q?EJAmecdBv/mjyjiYmCAUPZj7s4+K8uAs6klpCexrAMmErlEBifxaHhV0t28V?=
 =?us-ascii?Q?/pG5EgbUMXliBBL6FzpaWSchAZA+JKR2pURm2NYQ6Tv/brHpnUKgJFWaLshq?=
 =?us-ascii?Q?21spm2Pduwo25a53nIJ5BMYNXZM/I6cLXnzMJveiPQ7itQ27PMDGn/+silaq?=
 =?us-ascii?Q?Xo3hk3gIqPRsozNLJqsag62URJJYjVmvwVpCz/M97Lde3yOuJdBtJC6cCzR1?=
 =?us-ascii?Q?AZs7OVJemlQDjiBq91cwep9dp6ZS9bum5+YxsOfYQvW5wrybIyZ9Y22eQPQa?=
 =?us-ascii?Q?8iiGLnjz4xO9cxOMuLH7DiTTMGTVxdhv+qucLRhwuF4KvYh6yWhw853wF2vc?=
 =?us-ascii?Q?GSrza7LVCjnyY4Z1xtBwXBgFLVsA7H5R92zylHMuwKfwq+UxVh2+zVS2C3J+?=
 =?us-ascii?Q?nP3cKpr1HMdjVMJs3bg72jY9fUTxw0Ics0si1Kj+nxPyaRyoofHZdik81J6F?=
 =?us-ascii?Q?CurhhNvZonT7THsKGKvc9H7jL0FONXrzWaP/Wtkdk9qJkYgPAIMgWsUvuT00?=
 =?us-ascii?Q?pZ3cmRHfDUWBNMJy1RC9OhYPbx64+JsOjlX6GIixl3EIKBZf6KaxwSNXfDZw?=
 =?us-ascii?Q?AyQ2cYkaUazX2vWnSHdP6hoUAalXu9Tkzz5syTcIPcZcBnmGCMNsaW8ve+iF?=
 =?us-ascii?Q?DPfDfzCuafsH1rFyyZTf4JyyxsyyZ2C8ceGMKNqizKMoG/Adx6EWcZmcorxn?=
 =?us-ascii?Q?gqRN82VTS4LRKy/SXLkEBS/2dicnQ3sMGyDjn3+NmXZewB4q3tZIqHKPa2nr?=
 =?us-ascii?Q?vR1D7tR8bh9bRP5faid9UA4hsWLeAtP/CvjUYUG39HIRydxMMBOB5trGUkZY?=
 =?us-ascii?Q?mClt65FaEOIiwwJnd0XbysOoI3zGugylWvxV7l/XxEnwGtA8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7979611d-0a39-4652-93eb-08de63474466
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 17:11:27.8078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VYfkpHHIVrAAHF77pFnl97rr4dYpTwWLPo3r4NvxTOeKnCOhltno0FqtL3ACsCuiMc7X44bB7gErRBEAZINsoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6838

On Tue, Feb 03, 2026 at 04:01:37PM +0800, Sherry Sun wrote:
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
> index 700bab4d3e60..8837d7ec4f3e 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -439,6 +439,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba91xxca.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx93w-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx943-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
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
> +

&lpi2c3 {
	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_lpi2c3>;
};

Although it is small reduntant, it help understand how pinctrl_lpi2c3 used.

Frank

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
