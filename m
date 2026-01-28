Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011020.outbound.protection.outlook.com [52.101.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8288236BCD7
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 15:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769613341; cv=fail; b=le5suFEy2clklBKS34XQeKD8ZUTVW+66XvP6fwFQ2lK7LeRIS06c2UA8FziY/1sCW3fisoYeQcmjxx8+Yc663VQghEzPw9Ri1bLwHBKVJXbC1/aeU7ddW+O7qglHgIFFL01BwukG2fIdafpifU5B2bfN6Wbak9Kgo2Lm8NGAaEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769613341; c=relaxed/simple;
	bh=ZXaLqYAD6nFmLdT1iAhvznN0DR1VwBk4E1vVb2kWmLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=vBtywXGCFOI8PATfZTI+Yu9tF1Ff72b4YcBZnXGTV4r+oPIpIznNFWGAYVy1c93XgAGabd9Y3i2euPUjDQQoI1H1LmRAArneAo1RRq9T0KTbtQY4qzlZdvcrzJKrIu+u2TB70OUqlSdJCGvwONY7PFt1MLbXYCMbL4kvkyxAaj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KyqCes94; arc=fail smtp.client-ip=52.101.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KyqCes94"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JvUJAjdOdBY41jiUYj1YTEWQ7+qblAC/VypX1t8KvFo/9EE2XK/KJwoACVZevJDkzm8DQ2p4vaDw66hhL/xq7X5Rrf0ejc3t86/AjRT6WUucxaIp+DOA5ZRfv7rRyfJj0X3Eu36YLt0Qi1tX7q1K9HOiXj+/uTCdriPAWPGTlMQVNeqWFxHvPjpvQKNMkHhGDxj4iBn6v01VmvBdaU8faGPsPsmG2R7pHEKysuoil/Js8PvtJkJrsaU6xqo4To8b/q3uspOKfo/a2dHIkhnvyrEUPVL3FbrlO20gqeStO9OaxX4Pd4xEIBioSeEyYDJOl5AkxQRvH1wjRUbxChKwYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPXzzUDRZoZNhuUBJaah5Y+sSEzog4ReHk8FNxLENzg=;
 b=UJuEwyf8IxMSW1RASaz5/e13bNa8K09Iw7N+6hQfXs4feG+akuQcNJz5512hI7YW0RbgIxbKBvNJWRjbE5+tBM4FYl58AkGvOh6GeX1eRA2/VLc8r64qsVhs4C45DtYQzIGfSD12FizktV4Dvisy8oL0IdX09XFGfaTIiAMbrFrQ7NLNnQ11+cXEtXiCbgOwHwcCT/+QJo8TlepI8tuN/66K9P6Y/yhpE3TkwiseAvoByL6JWbUQ+0HHxu+XvYMqBB84GPUyC9xllyQk1L1XiqmRLWwcQiAep6zHVVvUKIwnAl/jk1OI5NVDkfk5LZ3n7l8sSWf7u08sZdI6MUeM0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPXzzUDRZoZNhuUBJaah5Y+sSEzog4ReHk8FNxLENzg=;
 b=KyqCes94He6fkU+aW7o5bcDaUCbw2qf2SadT5Uyhy8tv0YEQWBRBV5WaX4qWPPVqgNuGVSktq69U/6OwjT7o6G0nSH9WERsgsx3UMLGFfRbl+QjL8BEE+h+uBuyCgrKal2a59b2KE/5XeLZ8HBNMn2ut8kfBdN9Z8UjsS+nMWcope9D8YKY7R8I0DBj5Qjf3iccFXP2LOog2KK+scfRJrdh4xhi4Ig8Nonkv62ePFCdCRmHRIhnEQvxjVbBUEaftHRkJ0fSvsdIpIZ+uUwDJcPA7y67M8CW4kbdzpsF8jPmgFBO5saLOD/gTuziDodDgj0gVuZQkoa0NUwCIhQq/CQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB10135.eurprd04.prod.outlook.com (2603:10a6:150:1c0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 15:15:33 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Wed, 28 Jan 2026
 15:15:33 +0000
Date: Wed, 28 Jan 2026 10:15:25 -0500
From: Frank Li <Frank.li@nxp.com>
To: Wig Cheng <onlywig@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	zaq14760@gmail.com
Subject: Re: [PATCH v2 1/1] arm64: dts: freescale: add pixpaper display
 overlay for i.MX93 FRDM
Message-ID: <aXooDQaec35BaCxg@lizhi-Precision-Tower-5810>
References: <20260127025740.2601841-1-onlywig@gmail.com>
 <20260128050549.3337279-1-onlywig@gmail.com>
 <20260128050549.3337279-2-onlywig@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128050549.3337279-2-onlywig@gmail.com>
X-ClientProxiedBy: BY5PR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB10135:EE_
X-MS-Office365-Filtering-Correlation-Id: 66bdb372-da92-426e-e608-08de5e801502
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|19092799006|7416014|376014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9BGyeiIwqMedype4kidRNzkAh9naSGGCzXLRUKBS09iE3tiLmJEMDl6aWTO+?=
 =?us-ascii?Q?Dl11+u7jqhprOvfqFukNg0/T4gwCVOFC3kc72crt1/FSguo61wNie03KaTpI?=
 =?us-ascii?Q?xDRRWX97FFUW9dWCPMdXY1MNoFwMBG057OU0XkDm560GfzB8JB9kgaRAtzUM?=
 =?us-ascii?Q?aCSh0Uu8AY/enOco82eaY74PUp8qi4RF1RXwdwuqL67AVpjBXdULmKz4kKP+?=
 =?us-ascii?Q?8lrw52RoJ3VsV6RN8qepKp63Uk+IFtEdm2WOb1l/pSeDrV9JVW1S63W5w0Mm?=
 =?us-ascii?Q?Kax4PEk91nvWn0xtOC2RYH+fl0KHvdjXKZ444TdMNoJypnq0HItbxs6eC+As?=
 =?us-ascii?Q?c74aOdCpYuzlAgvbK+MVob+1oo/1lIe10bK376d8H7q/tXS+Ftqal7gVKlMv?=
 =?us-ascii?Q?+jKka4rKfGx4aMYnsA49Jv0cSQxHtERhLjYxJlfFvD4ntHDdz9inbI09kB2Y?=
 =?us-ascii?Q?s935hyE5sRvdaih4grHYWLOhmma9DeVNihqQBw8SNQSEZItP4od4CKuivvvH?=
 =?us-ascii?Q?hEeZbn8uGB8F/+RUkbulv+OMirVJCU4K+ripPkn/jErdO2R8NnbZEDnVELLS?=
 =?us-ascii?Q?L3T+dioORuyMfBfsMRJmrP+Sojreuy6nqeB/j6f+vfkla5nvUGkr5u9M5SMI?=
 =?us-ascii?Q?wbyxDb1hRsPsb47Bdj6WFIXVopnvGEx6pKPjnAtV5hQP0kblRbyCIvC4h7zA?=
 =?us-ascii?Q?9gkZM/JJHXYSEhucaOejrLGeSl7kbGUIpvylBGiBi62FIFT7I5FLJYA+bvGo?=
 =?us-ascii?Q?cMHNrPz/tRY5MIF02NFjUeRJMkI0Nfkv45xBUDkzrIwvAx02Xd0vJA14TIKA?=
 =?us-ascii?Q?zur+KaUxEZjUBut+2Wlyn3O7ltEfgyYSmAhtg/C7zZJ/THqSRvvC+ZbTJp49?=
 =?us-ascii?Q?2Rr3RmZDLxXMicyeddTDwE8MaIOX3ZLT+WndleOeDQIUOWqt8DqSEyCnMBHv?=
 =?us-ascii?Q?/F0zXpyUA9+u92RobjlESU844YZnsF7fbQRn7OQ4CW//FBVN7oU2obNDEg1I?=
 =?us-ascii?Q?qgZ/dw+5TkAywifTaxr2/u8PzwFRaCEGATYQvhuANa8iSW202rmCLj61qudg?=
 =?us-ascii?Q?2b8aAKKY2Y2IabK01EbJr4xdVDRF+/M3vyJ+aH20sjgjcNouemxguQUGyyVH?=
 =?us-ascii?Q?+9sgTC8dJUnHDFHDdOYNrU5JB6e611zEA3PhuE3NBiZcPRCBLXZmx/jXK24P?=
 =?us-ascii?Q?900gqBZO6tPZMW0zdf+FRQuDjrU9UtNj/pwA4tFWRwQU9Z2LkEKNpuyqz7W1?=
 =?us-ascii?Q?XVNw7KHlVRFoqK1SmhsCK+d8UM/PHQFnHLC6u+Y2Luom6YHRB51L4O9zXPTT?=
 =?us-ascii?Q?iNQOXhsD8FQqHpkkQP/Rt2defAS4TUC8VloKMEwnpzexyGq9nrdLMls1bjVd?=
 =?us-ascii?Q?4drA8ClQbmjo/K/AsS3n0l2LefacHd+s3iUlEujnvNsNlhtogW21Tfpk55z+?=
 =?us-ascii?Q?yu9OOBM6eTT6JsGtYKkbkDCXqDncPI/9WbEPQtIpv/ewkBpnAmWnsJBJKoip?=
 =?us-ascii?Q?OJdURJ+hCE0fgc3YMlsh5WXndAOceDMP6OUlZuPuMToIApPUr3xKYskcDnB8?=
 =?us-ascii?Q?lxVxPs8Mnd4bt4RzXIo+Trq72+lV19AiCL5jFRCivBhe2cbMKKfrA9n6AVM0?=
 =?us-ascii?Q?rxi4YwIJhsh7IijL/ZTXPxk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(19092799006)(7416014)(376014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cndSb0zEw34nv0gH3mJPNMuZYXUurRWAXXzkir2RaEVT5/14qxvP9WEOWdTo?=
 =?us-ascii?Q?VqR0Ytp2qEVgEjH/MBXxz1N6Yiljr/aNXfa5LiT7EEagLf+a8zy75YbE7lZ4?=
 =?us-ascii?Q?qwWxdTQjpycEh57ZBjyjiOKoVIrxs445UvWAByLbMIvFEClIpAGJpt/CukI9?=
 =?us-ascii?Q?feEyAPQ0q6O/2/3rH06zjbdJAJIAcdTEgCMll2QRnW1gczTwZ4tTRCtHvhWm?=
 =?us-ascii?Q?V26UXPgkHjPQbwX2rcjFFSmjmLW/TmqqTHor/8zN4bk0zNd4BrRTY7eGn/Z2?=
 =?us-ascii?Q?00ywT2iRYxouK5BYscAWys6UmZyeQiGIl8GIvhvWs20dM0oDtFdjk5OfR06m?=
 =?us-ascii?Q?yjRIIuKwpEo+4Ry4PuaAN2y/0alaBzsBS7RkH9MS5PhW3WKlDFwn63QGGX9Y?=
 =?us-ascii?Q?ikbJJN+eEWQnchKBTs7fWb8blzswnQwKHhBYg09ApN5XvMlF/bFQE92TWNSF?=
 =?us-ascii?Q?ceKbMsJIPT/KavW3mFDU6FemvF8DON+mGQzn6DJUKcyEJ0LDht2OFYeedOa5?=
 =?us-ascii?Q?2wB/Kn8q1suotJlXgEnnZRDlONDZDirQ4DzCuPuWMyXTxnP1/s/X0cf+MiKE?=
 =?us-ascii?Q?5ZF3IP4x1JLvrBlf3XdlN1uJEhf9H+pu5bsunEBDIpn8pj47X4c4iXRdrD3f?=
 =?us-ascii?Q?aXo8b8XG13H+kff8Xn1T1pOESPqZl1QPKFXXsdybbzAFyOWing1tKg41+n0u?=
 =?us-ascii?Q?V4lSSJwzpN/NZEQ8dyKr3ClBMS1uX3nxXRd0HDRe88mnJaQBaN7rh2ntuwe4?=
 =?us-ascii?Q?gLwJZI8w9KKe7qtyYb3rcvJzc3ln2162v2a2737lupD95O+5hXQwAMpxKASX?=
 =?us-ascii?Q?lfixLTQZr2XRX07jud18a0NzCjQ1vwhNcLwDLMJ4DDHJmBur+iIoUu555Wpo?=
 =?us-ascii?Q?SUjLHsv26m97T2i0RvVLTFY7iOoTKMfT3e59eIuG+PCpwOOkhCP0gCC4INc2?=
 =?us-ascii?Q?mc4msgncy3+JXCk/p/vLBOOVCMgkKFOcdmMOeNfizgS/j+ecmu9ae7pMrkVz?=
 =?us-ascii?Q?CEcrBiq36SmNJlS8rwrvB9k2uNQ2snW65oUxN3Fd+NTajcRD7nbpq5vphNjj?=
 =?us-ascii?Q?32I+Q2+JjvNxTmgGbg/OTm/FAuyQkT+LE4Co+JmPO25katS23Q5n5Qq42zO8?=
 =?us-ascii?Q?4P/HG9mJ/BbU9855ggLW3jqHL/jkfKLrLykv5e1NGDoNwemMSX+RMJIx+X8a?=
 =?us-ascii?Q?dFQTk1yDojl04GvijBsQWBOdfTN06QeQ8dbzeebxnR+dDn6TiW1C4/jws0i5?=
 =?us-ascii?Q?CBjHDMQuQznGQIoUdvYa9ipKi6rGny2Q/ikGDV2ocRJZAq4tURAyGHqIPSw2?=
 =?us-ascii?Q?tM58p7m9kfH8XnMuWnmnpLWnZPsCKGaK3Mjdn1UwKB5qVK3rmMnT+kLABu8V?=
 =?us-ascii?Q?8kmvZmKH1cOefueLWlWSaMX7X6y2YAlzcxtc0ATOBMl/2vIBUWDqn+Zmte2K?=
 =?us-ascii?Q?vIz6+vx2aqj5Phx5Dh/YgIJbafGwMqjHsbWn46hnV6GPkLF+CDqtK5dgQf4z?=
 =?us-ascii?Q?ck8nqTiGU5UqeyQtbuLcoBpol0VMYJMakJFQoxFLQig4DFFSpmXMzfH53+E+?=
 =?us-ascii?Q?qZr+2zSLyO47ujMgmpJJOIvhg+pTkqQH0GsQvUxH6Z3Ef6CeVhNHaafMSORX?=
 =?us-ascii?Q?tjOHzOAxKjctTvYDSgLJhZMPvk6M3y7XXGpmCINJDzb0mldQIyPXHfuCiR2m?=
 =?us-ascii?Q?ZpIvjcrev2nFbzWUB3emVvj53hYhACJANgvWJHNy8IGWi3NQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66bdb372-da92-426e-e608-08de5e801502
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 15:15:33.6761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pUf9vtAIf7jtLJ7B3SU4MKWsIiG9GPfVYSYRFqLaV+WmvqPQY/63SNjLSKB3xZEU8UtwmWAyoJz/lo0R3pNhIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10135

On Wed, Jan 28, 2026 at 01:05:49PM +0800, Wig Cheng wrote:

"Add device tree overlay to support the MayQueen PixPaper e-paper display
on the NXP i.MX93 FRDM board. The display is connected via LPSPI3
interface and uses GPIO pins for reset, busy and DC control.

The overlay configures:
    - LPSPI3 pinmux for SPI communication (MOSI, MISO, CLK, CE0)
    - PixPaper display device with proper GPIO assignments
    - SPI frequency set to 5MHz for stable operation
"

Sorry, My means just replace 3rd paragraph. First 2 paragraph is good.

Frank

> Enable Open-EP Community pixpaper-213-c support on NXP i.MX93.
>
> Signed-off-by: Wig Cheng <onlywig@gmail.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |  4 ++
>  .../freescale/imx93-11x11-frdm-pixpaper.dtso  | 51 +++++++++++++++++++
>  2 files changed, 55 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index ce8f937c2315..c2727f8061e2 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -398,6 +398,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
>
>  dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
> +
> +imx93-11x11-frdm-pixpaper-dtbs += imx93-11x11-frdm.dtb imx93-11x11-frdm-pixpaper.dtbo
> +dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm-pixpaper.dtb
> +
>  dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
> new file mode 100644
> index 000000000000..1111503b08af
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Overlay for Mayqueen (Open-EP Community) pixpaper display
> + * support on NXP FRDM i.MX 93 Development Board
> + *
> + * Copyright (C) 2026 Wig Cheng <onlywig@gmail.com>
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include "imx93-pinfunc.h"
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&iomuxc {
> +	pinctrl_lpspi3: lpspi3grp {
> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO08__GPIO2_IO08		0x3fe /* SPI3 CE0 */
> +			MX93_PAD_GPIO_IO09__LPSPI3_SIN		0x3fe /* SPI3 MISO */
> +			MX93_PAD_GPIO_IO10__LPSPI3_SOUT		0x3fe /* SPI3 MOSI */
> +			MX93_PAD_GPIO_IO11__LPSPI3_SCK		0x3fe /* SPI3 CLK */
> +		>;
> +	};
> +
> +	pinctrl_epd_ctrl: epdctrlgrp {
> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO05__GPIO2_IO05		0x31e /* DC pin */
> +			MX93_PAD_GPIO_IO06__GPIO2_IO06		0x31e /* RESET pin */
> +			MX93_PAD_GPIO_IO26__GPIO2_IO26		0x31e /* BUSY pin */
> +		>;
> +	};
> +};
> +
> +&lpspi3 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lpspi3>, <&pinctrl_epd_ctrl>;
> +	cs-gpios = <&gpio2 8 GPIO_ACTIVE_LOW>;
> +	fsl,spi-num-chipselects = <1>;
> +	status = "okay";
> +
> +	display@0 {
> +		compatible = "mayqueen,pixpaper";
> +		reg = <0>;
> +		spi-max-frequency = <5000000>;
> +		reset-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
> +		dc-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
> +		busy-gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> --
> 2.43.0
>
