Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013033.outbound.protection.outlook.com [40.107.162.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCA942E8EE
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 14:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212331; cv=fail; b=fgtf7r6mo/+BTKr923aJKHqvXz/t5HlK0qyoUU2k+a5kv7W0eRgtef1IDjtH83N44tvw1LiZOP4ppUoAXPBbd/zruy21BX7ZoRsSJ+aJhjJo+tFTb6569qGujR4vo9CvkcMdsuznNeFbVJlLNtNzmE7EmnCHHZJiIvL6G6Nt6PI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212331; c=relaxed/simple;
	bh=uhjIUhlgrXMC02J/978c7UTswK+u6dwuURC1PbvQD5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WlOo2YQtl2TtYSUvb8CZMPuhwWyFr/6qgb8wrpXyoIwfRchN0XWUZc8zNZ5S2QRmx62ZaVX27R/p+nwYV8AfnSxXmI0o5MsMpWamLPMKLA1hozBgOB0wvFSzZdq5FcpoJ8HwfZhy2ZlFgTbXP1ixIefDIpyn/UALUUom+74/MoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ux+S5Dto; arc=fail smtp.client-ip=40.107.162.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ux+S5Dto"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYwmYOzD86GCtyMNbud53g62XM+GM6/8P7x0JGto9WREDuOqOqGjVWrRh71lxuHkVU6ztmdNuq8pTiEw4Lwq8CbvTyGrXgWPCeB/WSqt6JudVLdGGjhKOC/vs57/BprlSXAbceUotI4xe/f6gZge8M6hAbLFBuAQ9y3CZaBc4jfDJcwZyqW2wNsbvttsnqEVWRRm07ubzE7Ed7zvncdn5LbYQOcKC1lLA4T9SODI/oN+/ciuNBL7PWegtrYSYzujCxm8M+hSW1M5XhlH2zuVjfDCxb5B/wCr3PmBU2uCrZ3oHZi6Rn8o3gvx3bn2p4g+h7Usrg07S99kEL1SU6TUpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4HW8V3I+UGmB0Vuvp5Lv2WM4xuUM+UbgCUuQhoBp6xg=;
 b=jF/FgUZ9dHKpYM/FkhQiIJ47a18XkQbOTA3JNSzFwqVfajT5zofVbI7OxGGOiycA10AbI2thZ7Kkc8ToQhQjtCI3+bJ3dRxq6xBiT7y2zH6SK1ilb5A4dy3lwioqmobCajNjU9UQJcNTvNnnmXdmeIbDktEynBZUTOOMI3GDEKwKGNYAP6SlfOTuLs7ew8Dk0PoGpFFm80MicRPA1WCwrVM9Uf5/MlDaGyf0yhHCDdt6HyXXIqRn/KXs/eCoYWk76PLS+nvgG2x7NiMQUTwv48TZK6y5FnbTgKihnVHarHlg9N00AgxV26sgHq45xrMXwEjuePanMa4LKhob3iqeKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HW8V3I+UGmB0Vuvp5Lv2WM4xuUM+UbgCUuQhoBp6xg=;
 b=Ux+S5DtoUm0zTdyTH+Xok9UJbfJ2iJCCF/qh07s14MFGBPKutvO4u2jm4xMMCgiZX9BetUtHInzJ9c8gTY+qvdx3iD6+vEmOmBTRcSQGyPY718htJVhHP1EQW116oTloefaTmRhhbWpOkIX2ja+yNhHBiiT4SVTDe0uDfnDqc3YXHGN0sOMahJFL32TGCvQvUf8r3u725y5n5O+q8wQidao4xWo55bzqhSzk1txy+fibvyBMu0xwN9NV1aRbFbB3GevidpbyeLQeSDFxypDsozdXOzpRw/Lxn8DueBZUV4EQWkPGl5m4ZO3tBLAWJR/0Ar8a9a4KwkY6LvEtfXrFmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBBPR04MB7961.eurprd04.prod.outlook.com (2603:10a6:10:1ee::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 14:32:02 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 14:32:02 +0000
Date: Thu, 16 Jul 2026 09:31:53 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Joy Zou <joy.zou@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] arm64: dts: imx8mq-evk: add regulator-off-in-suspend
 for VGEN1/VGEN6
Message-ID: <aljrWQc4HEpOSOKu@SMW015318>
References: <20260716-b4-regulator-pf01-v1-0-8c1519d54bd4@oss.nxp.com>
 <20260716-b4-regulator-pf01-v1-3-8c1519d54bd4@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716-b4-regulator-pf01-v1-3-8c1519d54bd4@oss.nxp.com>
X-ClientProxiedBy: SA1PR02CA0017.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBBPR04MB7961:EE_
X-MS-Office365-Filtering-Correlation-Id: 318f6202-b73a-4a3b-8cde-08dee3470080
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|19092799006|1800799024|366016|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tblAqDjFAn8keYKFkn3jodmgC3aB8AsoUkpkwgklQtcXxmyJncmDk6slENBlXfOufLiH8Hu2nWwmReHeBEoPNzporIVX5lM7kGah61pKHjToKDxaatr5VJkrY3TLnFSy5L/C2jzHHEcoHcoJ+91/TNoxTfvgAgc8BJyiz7P3bg3l6KhhKMVpz+x1PMywPb6lsp4zCwryF85H8x6+S5q+RM4Moez492lTVJlUz286EDrNAr82NQhCBnAs0o5wAO8CsRdNdAYbGcUkI4O7E1ll197aZZpr3L3WZTlJQcKyQmERIwvUSEPc+EhUNI+tfIWGLIGU9NvlfGy/H6bnAqyZWndcOzDvodqrJlqk8srz/b3K9gRLxJcrwZ4UwjxvmUdgGPLBNDTZ7EXNoYiSh76YKc3IMM0DAjvGWhGoxTrB7LGhoB6DHMI++lWQHI3PuMbQCCpWGT93WZk9XwpGa+FqceZEAJCWjSdfYqRenoaR/zQGXbFWQtytMt96mag+SnjRtKJs1O+C3CU2hpOLOQVO/NTR2Hgi0oaCiITnVHVoICwx+vMSY7LLcJEUePeqjbcPtni2DskVjwOM7/fTD7DrWAZ5qHSv1cvjXbJR7utUQPljh2FsyOa9n5r5FwQXs/zb55uTsLvSdkn1N6b9bTAXqcZ3KcatA/LEsHRIYbDqo/4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(1800799024)(366016)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YwWQTpFM2DIvLciia824QM7XcteydB9+T07nrmElKsBBCORYve/+pyeewRGi?=
 =?us-ascii?Q?QMXHkQQvdqz02UzwLRX8B49PDZ/5uUQLGUnR6aaaWHCohkV5BxtlQ2WY/GNo?=
 =?us-ascii?Q?7qfqqbqJOk1xRwxDe721psbSxi8OZ0XyVuGEoc+Jot+7iHPX3vQQkeRAD2Hz?=
 =?us-ascii?Q?DngWGAcplQ8iKZX9ZS6mNx0r03/XJycLB11NZmB67qR0PJ/kRT+CbL7z2J+2?=
 =?us-ascii?Q?/WITA/7foxU9RjBpyUjlt1Ym6nNzXybmblU0Z+mj5NHpS5ViGcZ6stqJ+07x?=
 =?us-ascii?Q?kRNoNJtOxh1qesiUlX9ZMoR6VYAsR71qhePJhRtw6/33ChMRBeBnevxqn5Mq?=
 =?us-ascii?Q?jQ0GaiVvlcQx5lYTYEqQieNq8+CGOwgMrnj5mLmKKgst8wyWedXcymyuJNfm?=
 =?us-ascii?Q?cuq7BcIQdUG3D6BD6EMtMnyHnSt09afbXkEqd8L327YN9pE2JbLtNUv77qFk?=
 =?us-ascii?Q?OW5Pjs5p5I+toKGGYH5aR6XOBBPXs9h4pU+8NK6aiK9TiHQQZWejyCBLIV/l?=
 =?us-ascii?Q?HTQLxU44eSCX4KfbWRgAbItjieOxQ4SikUk9TPN72kwJVe2Gpa2+j1ZNb9IK?=
 =?us-ascii?Q?cvv33DFFhJmmMeeWqYMkTWBdKqJN0pRtoc8jQxLWl93NB5EShKtyinFn8Y1t?=
 =?us-ascii?Q?HTB8QhkAJzBBQTchnGTGfOLCxaznsFrmQSyitj2nJ9M7SqQllnbxv1Xqy7w5?=
 =?us-ascii?Q?67QS1gU/XC9jWp93cbKYZO0f5S78+/lY5AytR1c+MhHjSyVduA0l+KIolzxx?=
 =?us-ascii?Q?dEaHwpGNxw6/rawPlE/mQ7i4cXVlhtkGlJ03Yj0Bnw7M5v4+KSkajPa+/0K8?=
 =?us-ascii?Q?3iHcOmOpNCXFQRVkz24ZZwuNlKCyHc5gvQPEd9iL1TmTNeLb11B5QsWMc9tJ?=
 =?us-ascii?Q?TOoNS9BU2rKDGnYgtUtvU+SC2g+ermj/IVE/OaRkm/83e4C8/F60eQ9KJM04?=
 =?us-ascii?Q?Jih+CT0CRQsKI3wpz9uA/DoT0e11CQ8PXoCr4irbFjaRCroU2QP9MHwQ21pq?=
 =?us-ascii?Q?l6v16C662n5Qt5RaFD1s13iHoLx7CSBAEIhikNboc6+BOThgk0Wap999EcBG?=
 =?us-ascii?Q?omnGXBsbvjZBD5twq56RnTBFkVlqMy/7hK9LDSvCHzvARGkhMmPuaIPJIkix?=
 =?us-ascii?Q?bwr4MZr7oe6UjjyZ1sU6fyG4Vn9zfN4RbsJ54ylB30zfiFpkXG2YEv+PZNFI?=
 =?us-ascii?Q?8ECxLCgptHzWjpYWTmGmGtB5duVjC8s3q766Ib0OIVSw9Ot3Z4rV0PZTQMYL?=
 =?us-ascii?Q?wLXZl8tlUhp2GytIMLswqWJVJqd50crxqkg+DH/DW3pFJ09aSHPRHyYImDIB?=
 =?us-ascii?Q?jXR1aZDlFDlKLpKyBe7RN6KnQkiALB6pWHk0OntV1Ye++YnT5j1elfiSAiXN?=
 =?us-ascii?Q?d3cO/MmNb5SFCPaOK9upZEu1Fi77YWY2UCI8bUybjvwBcuOK2MVtnrHzbyac?=
 =?us-ascii?Q?o/4um5BWNB3pgwAcWe2nDcHCntn2qQrMsESq0DFzMQn5ssNiruxhJvjPys18?=
 =?us-ascii?Q?w30iGEEvWGVFLqQ2D+fMD2ccPwpYAZrS1cXVIgzhF0z2fSVH6BhiFhND8AtX?=
 =?us-ascii?Q?UesORs72fcaCpcCcTwCJWLYyMzrELL3065Q2uUC8vSisqQlN8x2alO5hlqBe?=
 =?us-ascii?Q?ulBS5BFCcnSZMEFGZMsP2ubweHGi/euuMfikdE8MNdekRwo/Woq2aCinwZwI?=
 =?us-ascii?Q?scUp8wXnNrXzxZFQjkOIaUlI1spIENVTXyVd0KbKXd3KYrllPDd9FbqfbQqt?=
 =?us-ascii?Q?VJl5cmRYVAC7CVGEAtl1xVGRvIz8v6Bfi8nRxCUmZH6sgo/YWYwZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 318f6202-b73a-4a3b-8cde-08dee3470080
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 14:32:02.7487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v74uJu8RqF69dMdPvw2/lEqC9tcNyisxi+OE9knqnOXloVkF7ZfuMm+liPnlbzc70DIgq9j6czGtPpcm/IgxsraYHMWYzZvpMKKf4x+SvkDektjovWOEXmPKoyysWKUA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7961

On Thu, Jul 16, 2026 at 11:50:55AM +0800, Joy Zou wrote:
> VGEN1 and VGEN6 have no consumers and are not always-on, causing the
> regulator cleanup work to race with PM suspend.

why cause race? You first patch set workqueue to system_freezable_wq

Frank

> Mark them as
> regulator-off-in-suspend to disable them properly during suspend and
> reduce power consumption.
>
> Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> index 5ea04703ddd7..fc0303e44433 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> @@ -299,6 +299,9 @@ vref_reg: vrefddr {
>  			vgen1_reg: vgen1 {
>  				regulator-min-microvolt = <800000>;
>  				regulator-max-microvolt = <1550000>;
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
>  			};
>
>  			vgen2_reg: vgen2 {
> @@ -328,6 +331,9 @@ vgen5_reg: vgen5 {
>  			vgen6_reg: vgen6 {
>  				regulator-min-microvolt = <1800000>;
>  				regulator-max-microvolt = <3300000>;
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
>  			};
>  		};
>  	};
>
> --
> 2.34.1
>
>
