Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011040.outbound.protection.outlook.com [40.107.130.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07E2345753
	for <imx@lists.linux.dev>; Thu, 19 Feb 2026 16:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771516903; cv=fail; b=qH+DMwbRFTd9obmMcoKU3cHbpub0wKJoG+0vHQ8RIK0JWn9WAzoKst1NokzM7XVKs4iP+4trDN716CX8r3ITUSZpXiyvl6CfZISsGxrGx19lazoqm7pw1qh9D5XCcN99+bY/wltuiWyLdDhS+Nw6Fp3+ka43PKyzyneW+oYeB5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771516903; c=relaxed/simple;
	bh=YZ7kEAVMQ9hKolNh0PFEEuzetAWsK4j90ofk9z1gTGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=L6ijjtdfnUPtym5TfE18vlFzosWjDuj08nnq4V2JpCt6jgbUSUiLvzrFVDtxDCRYilo0wrhBy6T/C4jl7MymSP9CvJ/r1V3lyJkg5VIzOVlE6R0DpOBibhDsg+chfGb3a9GPu6KM7L5qHhuW3F7b8vBp+vJ/pfB9AlEZPWnk138=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HO0I3nz9; arc=fail smtp.client-ip=40.107.130.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HO0I3nz9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rR8CT2kN/PopFyslVGMRRmfHRHQh0pB7MFelZGwM4stGMrHVX1vOrR2iVoe1ty7DTwvip04SYC3rvhA0cMysM8+TCsKoFmPvkkENZwpvYGEDp/FL+1NHiA0urRHCZEY/aKABExwgfi25AfQGdnI90tPc7/cLs8PBtrIeQbeBhX08wutmzyGVgCVEW9bf9qiJlcrX62g+QcqjHqiUk1YDjbFZZJ8ZnvzWrqdNQOG4mp4CkSUzr3pCbTDZhqeXMV1TZBqZLDaHMIcm5mYQONUXctZTfBt5OqKC0HS/vbMiSvoOwLEJr+Z37OWPSPzpSffgQnL7xeWl8cAZg9vJFBkOFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WgVD8KDAxo1EFVJtxA7Xi6pFqBIs+5IXBvS5NtgRzp0=;
 b=cjRSfopw15mFJ3MRFqbD0Tsc9PR2zHE6sMAYKyByZMIOx04DY13wU3g+AJZSA+kh6Z3N9QwO2JEtMetlkvVVpG+HQDsDMD3i6XX0pLQOYlfGwbyB4ehbTdxn/v7NadNpuRxTlvqhVoszETC3LGkOUyesDW5q4YKhehb6MPw9IqYShmfU/AL8rZDrS/FjJ1p/T10BmcJ/trIynEmnhPWMz5tryHF3fSs81JVpXXFMgxVzZpHKyYZgcD1aboKc6woHS0LPHDzW1tOX8HRKddh86+7JAf4Dv0UsU6c3BwUWm1IUcT/c56IXOT0ge1FYP11SHZ5BIPdVf7eqkc6vtA5+HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgVD8KDAxo1EFVJtxA7Xi6pFqBIs+5IXBvS5NtgRzp0=;
 b=HO0I3nz9X9t7set0kv3W9x8WLSxesUcu9np4DvGZk9dYSTMbU04EEoxvKyVlumqpgMzZ099Eup+aMITB6H2AEtZNp0go1u/OCwyCxKRAAZW9u4kkOmE10MfvAUVqjFPx3T5OOXiZGO1Wz5+wwavRKf46mosrZ8dVgc4P6rsPzSq1CMdH4tMhPHtcG9DCfvRGRjSMYVghebOyykuNF1ebF/L+vPuBbyY2gZHlwtQKFKzzI3BZj9TO3CRI1840ST0u//oDjX9c5drE47tEsNhCxet1cgy8D06d15SCEnQ4Ep9zxEDR9KPDUlIL0jQzQlSejhAWRhq0ycrXCXODuW7krg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB7102.eurprd04.prod.outlook.com (2603:10a6:800:124::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Thu, 19 Feb
 2026 16:01:37 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 16:01:37 +0000
Date: Thu, 19 Feb 2026 11:01:26 -0500
From: Frank Li <Frank.li@nxp.com>
To: max.oss.09@gmail.com
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "ARM: dts: imx: move nand related property under
 nand@0"
Message-ID: <aZcz1vRg4KtAKUd_@lizhi-Precision-Tower-5810>
References: <20260219151157.2549198-1-max.oss.09@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219151157.2549198-1-max.oss.09@gmail.com>
X-ClientProxiedBy: BY1P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB7102:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b042c9d-a3fd-4f51-0f98-08de6fd02954
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|52116014|376014|19092799006|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?geuTlWZ5I1Jq/+m+anWcwII6d/YR4gHpON1VuTEg7EmMtnX9NvZhgL6UCbUS?=
 =?us-ascii?Q?YFqMSgUrkJaSA6srYL1UABkU5LJGvc7+Bd8jXG/pjZIp+3kszD2MP+foHwDx?=
 =?us-ascii?Q?X7CZDcmyyBj81tpAdh+yfq2CfFfxgqBPhp99Zj69i2VzKZzWxQTV/Ssbg9Cv?=
 =?us-ascii?Q?iBkIILlL3uFcbS3Z3brdG3PSB9tDmdNDxTcmq0+X2tE/ZXOLFrG4KkmeW72R?=
 =?us-ascii?Q?ehrfaPTIRyd1BFI+bSw5ijmGWCoqzdy9Kaf7op1q09ppJEmvAqZbW781gYXQ?=
 =?us-ascii?Q?K6114sY4CF6T/XT9i+SsPqaoKYJFJI3G2UTPhsF0cBuZfpzgz6V8Z63Js1VB?=
 =?us-ascii?Q?Nan//ngG6uQ08wZB1Y7f86bM8M0bjIRo7eE7DRUPtquABwJGATazM3kmEgks?=
 =?us-ascii?Q?9TlERRGEG1pMwjrRr3lwv85hb980mkrqSc5AA0sqv5nyBgSYEZGO4GYC/rzf?=
 =?us-ascii?Q?WWQKHBMOmhnbRY8iM02XXyb4qfHPn3ahc2WCt+SUpIAGdnxo4Oo4rxdv0jYt?=
 =?us-ascii?Q?dYEOmOGG4Rm8WtIRyrCReGnvO9o+9EfhM2drgFDouqt+fIcuRsJvoRFHyC75?=
 =?us-ascii?Q?ZG6FonXKB1ZY83j5Q1i3dEZ439D+J7yJhjwn8NVAV+NtXwesuJgcM2QGIij6?=
 =?us-ascii?Q?XoYfBaS+6sP4+0byrpCbmaVHrNWFYKf8b09KlSg7QWYqpWanelQBDU8xCqsi?=
 =?us-ascii?Q?cx/41df6v7lEKC41AIYYWFXwmEfpKYKUlNRR4p8QKs/4odvi25lNuY7J1Gm4?=
 =?us-ascii?Q?sdcBLd5qnw8VmOBsPi3saAI2EtFmFyGyfP5+/hs/SXEif9nxo0h7bcX1jCPs?=
 =?us-ascii?Q?DGzjDfkrGJ758razl6aG+31INWB5iXSTjGBWXTW2Zno5ajjpxuQJtAJXSN8y?=
 =?us-ascii?Q?ZAbKQXWDTzOkivh6og5KRBfsh+uHdksueod53P5Z+WLGYn/o5JHjpldXadP/?=
 =?us-ascii?Q?b9K4opCn1kdceV+O9rF2Hnfs/Q/viVToEQo7BVVBXpXT/NGOrYg+EeyjpeGV?=
 =?us-ascii?Q?VQ0YVz2HzgDnV5IWbvwEQx72KTwvUdfScp8ffs1UOBJGAWh/1sEdLTdAgUmT?=
 =?us-ascii?Q?5+g/LoGviWKyLuQSjTULVvQzDABTtSd0E+YKo9wqO105f3e8+xH75kbnWkmU?=
 =?us-ascii?Q?asNYwcX3iVjF4/LmiI2+ePSr51WxVGxgCI9NsKQbtbgkXahdXtGT5/nOsvQw?=
 =?us-ascii?Q?RgfNrPfjhkziZSoqejGbhrCEsKRgJ8Kc3jgYQuT7x5Jd9rajzXO6nKDol+KK?=
 =?us-ascii?Q?wHfTW+tSVGQ0rjsRjnz2nGZsovtFTNWWA+718wvDrvGmPKXGFs+k/1Byapmq?=
 =?us-ascii?Q?S6dbXdQN4jRWfsbFk2wZtuL1rWheTlWwRMvC8C0uolfAfgRSUL9S7KFxq+nn?=
 =?us-ascii?Q?ZDFt1E8OgleRziFH7nkWruk/vNcc8tjFCvQRR42G1Dp7NNXDvqiGfTXjY+e6?=
 =?us-ascii?Q?dSaqERRCMZUrlfVNCFaCBxexGyns5UuGvqcSd8avqOZDlfNGOSGVKgbprHAH?=
 =?us-ascii?Q?P2xmR50uJ2JVl533R86QEyW86FCq2Vw24sOU0KYwXPCcEUBK4pN2jaaQbAeG?=
 =?us-ascii?Q?pf+7qv/eTMe0s+nGxQO96o/iSE2D036Aif+f8ZCMaci7TcKmV5To5pduqx2u?=
 =?us-ascii?Q?4B+S/qBLoaF6cHbDvXAPJB0=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(19092799006)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?7+6CMsjuMHXBTsMcJBa8kVp11pJ72B1T0ymiv/ddQOByA9d06HHxIKp0u8Lp?=
 =?us-ascii?Q?yiwOGZCFWQMtk0MPXQiSJYID5zYo/ocpx5jKU/tHenrCXd/Ok2QW5ql96+G4?=
 =?us-ascii?Q?EQRVDkZNUe2PWK/j0kzYGy51xx60gZ42U5NT78mldvlXNvvYZQUiz2bUAbTl?=
 =?us-ascii?Q?dK3zYqhZlAP71qD2FrW5h1tqhuo/eQ1Bw6Z2DzH5OwbJMuhl4q2ejhGBUGPr?=
 =?us-ascii?Q?im7x1v9gEwBaPWL45N2alNBwTxiBEn9JkgT20XER6yO+K3eZ+ozkLDgQPyDU?=
 =?us-ascii?Q?O/wud3YXTLESSVivpLErv4cT3fW3ugwOt5s2gRKwfiv2LQ9mP449JZbBwIFe?=
 =?us-ascii?Q?R2DINLYXczXtZ1bpyeozNUv2y0USmUFZ3SAhVgbr6BjWA/V2GSa0/qo/KFBG?=
 =?us-ascii?Q?vH46r5dHwCT9+C04KOUgJOV2yVjfZD5PIPGgkautglgkncAQNtr3pEP94b3T?=
 =?us-ascii?Q?SRhcDUJ+7zJftVrM59+YqKLw/T1W+xn7f2z/N5XqYoTmfukRF+80kfhTShw8?=
 =?us-ascii?Q?MFRmVJBcwsejxIUE9tlAJ7rpsbmpkqistsP/QU4euRhgNHMKBU+/wXveZEq0?=
 =?us-ascii?Q?eGRNHaD7/jMQeSdN/7cFzgvyZUnh2kvwX8zezs5RyrsUUcmjzPrSrpLijrHq?=
 =?us-ascii?Q?yqHnq+H+9BvLK4F4pf8Z+w8QbqPXD7c4MVZuOPAF2FX1MQQ6wTmIek7HKTLu?=
 =?us-ascii?Q?XZsCQVFK38IP/+8qWScQN7CXb+nE+7zIuw5YN6e0IxFAn1fPfFSq5hueU1hW?=
 =?us-ascii?Q?850UGHN3TqIVjOgiOAK+tIkdKzvBqTz3/0qbraK4Vqi4ejZcBFjPGH6TjC1i?=
 =?us-ascii?Q?rVXCZUik+GgFU9jE7loOak8gdEme3fbK4KCPqEw4f8ZCH2SMFjW3UlDRMivu?=
 =?us-ascii?Q?lPd6O0pR02X5JJQOESqcl8rXibuYZSnhKXW0Z37oa82bZR4A37tuVrzlLJr2?=
 =?us-ascii?Q?277n/luwski2E/FSC/tn+sJi625SICgHoun9I0lirBetfBZKEOKRj5aMvpgT?=
 =?us-ascii?Q?oQqo6gOsLf8XD1h6sBoo42CCsVsOumXOQ8E6y1FCwxKFqDoSGm4VU+af6csA?=
 =?us-ascii?Q?acejF+gUlLUjrk6C1Uk5pn8ugcndaeMHzSdohYTHfq5ucJ1xy+Q/OaFtX3+/?=
 =?us-ascii?Q?t/Rv+zyGRe5m6cvkoqoerq0vPlYtHJz15cSX6F3+POj01bPo83c9r6Q37EUa?=
 =?us-ascii?Q?mFTdCAHvKro6nECl5FsfNANKIsN83ATffLyVAxbK5fr1+8qhKeCZ9BurZOHd?=
 =?us-ascii?Q?Sy86EMYuWnlgvHc1pi1P20hYSaMoNwM/Wjcx1IrEq4Hw3jNLRVjiFHzthEIm?=
 =?us-ascii?Q?DaBlviqz4RV4//Qfz3WroBzfJDs0k6x0Cj2kFuPA8TCQsajxk+IxaWTRGmaT?=
 =?us-ascii?Q?CMQoKkdVLMiMhw56VitgijyxqmR2pJzgQyFCT8Fr/vUZ06E195EmwuP5HMg/?=
 =?us-ascii?Q?cp0NjNEokBooziaIahoQte0gtJGH3NVuon2gXbhqGmVUJb8on3VLveTheVnH?=
 =?us-ascii?Q?xxWoe1az9eGx7lbwMjL20AKiFQs4jhl0QvM2RTyb0nkCtHLqBODQcCt4vMSw?=
 =?us-ascii?Q?AIzX0re+vxm83FV9c3uGtaqmNNVyFmh2Ydzbo+ODZ01DwXcn7wwElDKdUbs/?=
 =?us-ascii?Q?CsRe8HQPBWFl/EKwSgtF1/g9l9m9o+FAQJxjqy9MCI9i9mf9I6RcfXAKrHgA?=
 =?us-ascii?Q?XS/kF2TpL9UqYlx6KFAvfnffy+UsjnVdsPIvjrbd8wWzBotE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b042c9d-a3fd-4f51-0f98-08de6fd02954
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 16:01:37.3801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JScrR1WroT2fJQK7tSDz98v2XUX/X+Ke8FJhJKfK2EtO0cNP53ecbhKirlk9bwFOFQUgrP7F6Sqv2owX6oAbvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7102

On Thu, Feb 19, 2026 at 04:11:49PM +0100, max.oss.09@gmail.com wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
>
> This reverts commit 8124b4a4a96b57d6cc3705a9df9623c52baa047b.
>
> The change introduced a regression: at least Colibri iMX6ULL and
> Colibri iMX7 no longer boot with that commit applied, while they boot
> again after reverting it.
>
> Although this has only been verified on these two modules, the issue
> is expected to affect all device trees using the gpmi-nand driver.
>
> [    0.876938] Creating 5 MTD partitions on "gpmi-nand":
> [    0.876974] 0x000000000000-0x000000080000 : "mx7-bcb"
> [    0.879860] 0x000000080000-0x000000200000 : "u-boot1"
> [    0.884761] 0x000000200000-0x000000380000 : "u-boot2"
> [    0.886993] 0x000000380000-0x000000400000 : "u-boot-env"
> [    0.894686] 0x000000400000-0x000020000000 : "ubi"
> [    0.899054] gpmi-nand 33002000.nand-controller: driver registered.
> ...
> [    0.960443] ubi0: default fastmap pool size: 200
> [    0.960476] ubi0: default fastmap WL pool size: 100
> [    0.960500] ubi0: attaching mtd4
> [    1.636355] ubi0 error: scan_peb: bad image sequence number 1588722158 in PEB 4060, expected 1574791632
> ...
> [    1.649889] ubi0 error: ubi_attach_mtd_dev: failed to attach mtd4, error -22
> [    1.650029] UBI error: cannot attach mtd4
> ...
> [    1.670262] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,253)

Can you help found the real reason why not boot?
nand@0 is preferred format for MTD raw nand.

Frank
>
> Fixes: 8124b4a4a96b ("ARM: dts: imx: move nand related property under nand@0")
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
>
> ---
>
>  arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi      |  6 +-----
>  arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi         |  6 +-----
>  arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi |  6 +-----
>  .../boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi |  6 +-----
>  arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi      |  6 +-----
>  arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi           |  6 +-----
>  arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts            |  6 +-----
>  arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi          |  6 +-----
>  .../boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi  |  6 +-----
>  arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi          |  6 +-----
>  arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi       | 12 ++++--------
>  .../boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi   | 12 ++++--------
>  arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi |  6 +-----
>  arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts     |  6 +-----
>  arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi          |  8 ++------
>  15 files changed, 22 insertions(+), 82 deletions(-)
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> index f452764fae00..547fb141ec0c 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> @@ -36,12 +36,8 @@ &clks {
>  &gpmi {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> +	nand-on-flash-bbt;
>  	status = "okay";
> -
> -	nand@0 {
> -		reg = <0>;
> -		nand-on-flash-bbt;
> -	};
>  };
>
>  &i2c3 {
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> index 58ecdb87c6d4..9975b6ee433d 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> @@ -172,12 +172,8 @@ eth_phy: ethernet-phy@0 {
>  &gpmi {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> +	nand-on-flash-bbt;
>  	status = "okay";
> -
> -	nand@0 {
> -		reg = <0>;
> -		nand-on-flash-bbt;
> -	};
>  };
>
>  &i2c1 {
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> index 6f3becd33a5b..aa9a442852f4 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> @@ -102,12 +102,8 @@ ethphy: ethernet-phy@0 {
>  &gpmi {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> +	nand-on-flash-bbt;
>  	status = "okay";
> -
> -	nand@0 {
> -		reg = <0>;
> -		nand-on-flash-bbt;
> -	};
>  };
>
>  &i2c1 {
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> index f2140dd8525f..85e278eb2016 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> @@ -73,12 +73,8 @@ ethphy: ethernet-phy@3 {
>  &gpmi {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> +	nand-on-flash-bbt;
>  	status = "disabled";
> -
> -	nand@0 {
> -		reg = <0>;
> -		nand-on-flash-bbt;
> -	};
>  };
>
>  &i2c3 {
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> index 131a3428ddb8..c93dbc595ef6 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> @@ -260,14 +260,10 @@ fixed-link {
>  &gpmi {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> +	nand-on-flash-bbt;
>  	#address-cells = <1>;
>  	#size-cells = <0>;
>  	status = "okay";
> -
> -	nand@0 {
> -		reg = <0>;
> -		nand-on-flash-bbt;
> -	};
>  };
>
>  &i2c3 {
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> index d29adfef5fdb..57297d6521cf 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> @@ -252,13 +252,9 @@ etnphy: ethernet-phy@0 {
>  &gpmi {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> +	nand-on-flash-bbt;
>  	fsl,no-blockmark-swap;
>  	status = "okay";
> -
> -	nand@0 {
> -		reg = <0>;
> -		nand-on-flash-bbt;
> -	};
>  };
>
>  &i2c1 {
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> index 40d530c1dc29..2a6bb5ff808a 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> @@ -133,12 +133,8 @@ ethphy1: ethernet-phy@1 {
>  &gpmi {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> +	nand-on-flash-bbt;
>  	status = "okay";
> -
> -	nand@0 {
> -		reg = <0>;
> -		nand-on-flash-bbt;
> -	};
>  };
>
>  &i2c1 {
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> index 776f6f78ee46..e34c8cbe36ae 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> @@ -101,12 +101,8 @@ ethphy0: ethernet-phy@0 {
>  &gpmi {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> +	nand-on-flash-bbt;
>  	status = "disabled";
> -
> -	nand@0 {
> -		reg = <0>;
> -		nand-on-flash-bbt;
> -	};
>  };
>
>  &i2c1 {
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
> index 27e4d2aec137..a3ea1b208462 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
> @@ -63,12 +63,8 @@ ethphy1: ethernet-phy@1 {
>  &gpmi {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> +	nand-on-flash-bbt;
>  	status = "disabled";
> -
> -	nand@0 {
> -		reg = <0>;
> -		nand-on-flash-bbt;
> -	};
>  };
>
>  &i2c1 {
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> index dc53f9286ffe..1992dfb53b45 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> @@ -296,13 +296,9 @@ &fec2 {
>  &gpmi {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> +	nand-on-flash-bbt;
>  	fsl,no-blockmark-swap;
>  	status = "okay";
> -
> -	nand@0 {
> -		reg = <0>;
> -		nand-on-flash-bbt;
> -	};
>  };
>
>  &i2c2 {
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> index eaed2cbf0c82..ec3c1e7301f4 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> @@ -160,15 +160,11 @@ &gpmi {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_gpmi_nand>;
>  	fsl,use-minimum-ecc;
> +	nand-on-flash-bbt;
> +	nand-ecc-mode = "hw";
> +	nand-ecc-strength = <8>;
> +	nand-ecc-step-size = <512>;
>  	status = "okay";
> -
> -	nand@0 {
> -		reg = <0>;
> -		nand-on-flash-bbt;
> -		nand-ecc-mode = "hw";
> -		nand-ecc-strength = <8>;
> -		nand-ecc-step-size = <512>;
> -	};
>  };
>
>  /* I2C3_SDA/SCL on SODIMM 194/196 (e.g. RTC on carrier board) */
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> index 3dfd43b32055..43518bf07602 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> @@ -43,15 +43,11 @@ ethphy0: ethernet-phy@0 {
>  &gpmi {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> +	nand-ecc-mode = "hw";
> +	nand-ecc-strength = <0>;
> +	nand-ecc-step-size = <0>;
> +	nand-on-flash-bbt;
>  	status = "okay";
> -
> -	nand@0 {
> -		reg = <0>;
> -		nand-ecc-mode = "hw";
> -		nand-ecc-strength = <0>;
> -		nand-ecc-step-size = <0>;
> -		nand-on-flash-bbt;
> -	};
>  };
>
>  &iomuxc {
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> index fc298f57bfff..83b9de17cee2 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> @@ -60,12 +60,8 @@ ethphy0: ethernet-phy@0 {
>  &gpmi {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> +	nand-on-flash-bbt;
>  	status = "disabled";
> -
> -	nand@0 {
> -		reg = <0>;
> -		nand-on-flash-bbt;
> -	};
>  };
>
>  &uart1 {
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> index 8ec18eae98a4..2d9f495660c9 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> @@ -25,12 +25,8 @@ usdhc2_pwrseq: usdhc2-pwrseq {
>  &gpmi {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> +	nand-on-flash-bbt;
>  	status = "okay";
> -
> -	nand@0 {
> -		reg = <0>;
> -		nand-on-flash-bbt;
> -	};
>  };
>
>  &snvs_poweroff {
> diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> index a41dc4edfc0d..8666dcd7fe97 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> @@ -375,14 +375,10 @@ &gpio7 {
>  /* NAND on such SKUs */
>  &gpmi {
>  	fsl,use-minimum-ecc;
> +	nand-ecc-mode = "hw";
> +	nand-on-flash-bbt;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> -
> -	nand@0 {
> -		reg = <0>;
> -		nand-ecc-mode = "hw";
> -		nand-on-flash-bbt;
> -	};
>  };
>
>  /* On-module Power I2C */
> --
> 2.42.0
>
