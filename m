Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012052.outbound.protection.outlook.com [52.101.66.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D25D41835A
	for <imx@lists.linux.dev>; Thu,  6 Aug 2026 19:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786045748; cv=fail; b=uNaYreHiN9m4Ze7sfWBRqRmUdslj+Jl29qV/ym2Jk/AMTgUTPCqaeXDmv76Wja6AAedDzTrzaUqNKdpsTNHq6fA6+W1kfqYNlxDS/LLJFWZCiN++6F9/2+nVXT4es2WX+3dKaq+dSU6Hq/ibSrOgQAE4reXQWruPCshUmIEvcpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786045748; c=relaxed/simple;
	bh=q3iMWjYxVrfkQzA+rJzDyW3fqNdzLs3L1D2EO7GnzAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lHQoRcJJfzq8x+VECFr3OA4CuRDaT/jP/4/Wfd+Cp0ja1Mjsf4BL70ybqcJaGNaixSsiSI0pZSyK4teVK3I93A7AkaIWKMVetZ8PNM4aMpwRPu8GX/oBudOvXc8BOaAxrvDLiiXCrFV3aUB9QlslfGAi0VFae+QJjLNjw2KwDmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=B5CYjXRQ; arc=fail smtp.client-ip=52.101.66.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="B5CYjXRQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LfpmydukdBhD94eyt8elYkpvgRPnxcF3mn1S3Tp907+X1hE3h8kQOp12UdG+xwQHPsFTUKwUB+iRaYJadskG03v/EQCHazolfIa/32bAih1+sRsH4QLH20wYs3sMamcjAeSITGyEAzhiBFQOjbbIMN+WiQfL6slWEYPHgvG3tlqb6h69MhV1yDexbq6Voo6jHgaMIzsatzHoF49b1+pgJtjfMBxRktJ889VvbJtyuD2GVfQdS8tIJ+//p6Li7OIDDh8RWaAJKLdWH5oq4qh8DKnRVPCsZqs6ieDJKyskaprowIL/CedI0v9EZuchyyOshzdk/aiCo3jH0z20YLQvLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9TQm26Tr74CH73UFksYG3f41RR+dzeP/TP8Q+7bhujM=;
 b=E+ossKzjWcjRzPKmfsAIdXZxzOS8x/nDqWZdSSI2GvatjX3v7n0OssXKg7fA7Wdoghmuo4N5vfQeyZSgjxPiYLa22usZjhn8HU72mbrpzwWgePqqKxPI9KhYlJ7nz9If4nisoeB1GT9Ckf+u/uP27n0iyLwIRchoZ00/GdqLCMfkA0LFQrX7nUtEnnV6sQkzJaJAXhXeWiCvAOGlUi9tOraQkwrKKKRxdeKXwE7LDCNQRJVtSWx4klPP+6/6NzvyojTUxS+MsM1LDaVdWECZMTYlL4YSJ+edI/gKBdv6Odl3jP5is5K1RroR91dTqP8n6AohHcOtZ8iR5p7npV6wJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9TQm26Tr74CH73UFksYG3f41RR+dzeP/TP8Q+7bhujM=;
 b=B5CYjXRQgMQSM/kudkIKl0vLr88Rzeqmc5hPDrcrrgw7HJEX8lkU/TjpY1RgXlJNdIkScIt3z5ujrkA7KV1pyRFXgEhIPjRgyIGZJ3rUhzcUDk4G5CqaJ2/n6un/l49ODoTUi4y4EvIqf0Su9g30LzFExICOyBak3es4Lhj9e9rf6OiPWdtBMqbnz3xwrY3bmL2huBvxNxwJLlPIjO+RulnQXOuCjcQGrNYfDecvDWGcKnOlsg3d0/qZ/IONHDcHogq1hQppMlyGGfAfrB1A288Pi1Lvgt5rk/m2jnEFxytAqmmKtLFozH4ZBvTSyedZpw3Q7z9mI1i2m5gG5tMZYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB9205.eurprd04.prod.outlook.com (2603:10a6:20b:44c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 19:48:55 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 19:48:55 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Joseph Guo <qijian.guo@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	justin.jiang@nxp.com,
	xinyu.chen@nxp.com,
	qijian.guo@oss.nxp.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] Add i.MX93 Wireless FRDM board support
Date: Thu,  6 Aug 2026 15:48:45 -0400
Message-ID: <178604568699.425665.14745542223242634942.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723-imx93w_frdm-v2-0-b108a76b2e40@nxp.com>
References: <20260723-imx93w_frdm-v2-0-b108a76b2e40@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9P221CA0016.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB9205:EE_
X-MS-Office365-Filtering-Correlation-Id: 67f0687e-8a29-48d1-377d-08def3f3bf9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|19092799006|376014|23010399003|11063799006|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	5ph+2GIZnZVsxCGF916xmhMacGI6ZcmTb5motnMIHo9gKTTCRvJ2fAz8R4RBPEWLzdXWqI7RTEeEeizuzqbnW9Tnze25Y2us42fbb08S/IAolQJuq9z+hPkX+KFSWQpAJE10RMBqNuDBz5PHEEm6Nav7njbT953pbj9PyCQYmoqK1Or0KrZbOMjf76ECKftAvlrcB7zSc17ynqTO8Byl5+SLsxP+prb2q58HsCz/lTS63I7IVTqItruVJrkIygxMwvWvA5w7RSHDSR7jksZPPpeOsi49LR5ZXFG3n0vFfFK26W0djGxCRK7nN7yWMxWEFipeBBn6fLzfXmekA/Ih7Nf+rSYPGcT9GzzaxI6kVx0L+7Mh8Pw7edwPvYgqlpLm2gdHamU8gyn1c3+CivrOpQ6p1171q7kf+WVo3umcqWfQuRWbPb9l6YDIwVGm2ec+9hbXRDSBdQua8/9eSEiX/dCLu7lmuQhywo2TareouI2ZpijM6eY5SVmjbcvjJ9ztdS6rdwaOtoP1Qi4cYFKg+IKI6M73JDSGCR0kJ9tJJ97fo1y0J2ZfdkDygzVIjQwUWLRyH9JhvAUITrnsc42XE55ZKeA0uN8QyZPy5VJ8APH6t4VcUEF/QZYCC2lK56AGRmYVarzteCMtOlKFgJFAV85lNqSiS1R5NIrXd55F8fI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(19092799006)(376014)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlpTZUI5c1M5M0tHdVhyaTdRWlBlY2YrNXpCaU5RaklERHNjekxHZnFjUXhS?=
 =?utf-8?B?TDhQK1d2bU5BY2hqRU1oTEZqS1pTbGlTRnlLREdiRlFKblhadUsrd21USXRp?=
 =?utf-8?B?UXVVLzlJU1ZQSXRibEhWK1czRUlOam9GczB1UEFFNTFOOWpxRExBSXFpWWY2?=
 =?utf-8?B?ZjBLZnhhNm5tVlN6Q2pxciszQ3JFL2xHRm1BUi9aNnRKSmgzQm9CREU1OGRZ?=
 =?utf-8?B?bnhrMzhMaUQxcENCK1ZiVW53ZkpiWkNvMUtTU0Rhc054R3pZRVpUZGVMcFlZ?=
 =?utf-8?B?QnEzM05SdjF1WGRQQ1h6bC9IaEJPNW9acCt6U2xoV2tIMTRqbFNVcGhIeGZm?=
 =?utf-8?B?NmdLZU0zQjZOaDRuOGdJa2NCK3dNekJidGJDNTBxR0IvMm8vM3I2czhpWHQ5?=
 =?utf-8?B?Wkpncm9ram9scDlGRDVXcGdjUFBoK2c4d3N1WFdXVFd6blFvUWZPamtISE9o?=
 =?utf-8?B?b2RHanh0d0FRa25sdWhWbU9EaTJQY24yRU44NlVkYXJnRDJoNTFXM2N5RmpU?=
 =?utf-8?B?ZkhMdm1oMFhjSXc1WHJhdGpEUWh5T0hBOHdsQkJqTG9HN3JrbEpCdVdaaElY?=
 =?utf-8?B?YXBpa29tbHhCV2RtY2xldlFpd2pwU2YveUV6OUcwMlFta0Jhdzd0RjNBOVVO?=
 =?utf-8?B?Mk9uQjc3OFVNbDBMWDVScWdzRTdoMzlVN00xc1JIUU04Rnl3YVdhdml4cTFt?=
 =?utf-8?B?bTVqenRFM0hRbFRtbjRMNERxMWV4TDhkSWdsbENlQTdod2RzRUZaZHEwNGF0?=
 =?utf-8?B?WjFwTlBrTFJxSkNEanBsRUtUUWdPWFBoTFJDUEwvKzlKY0s0b0h1dnlsMlBq?=
 =?utf-8?B?dnRDenFuRVZweC9oMHc0RVlnMGFiblYxYm9VR2lBNFdmaWVWMERIMzQrTjEw?=
 =?utf-8?B?TkpTcmtFTERqUUpCSStxYmFBZndXSnJ1S1NCcE92RXJoQmdQMS9JT1pyTWdO?=
 =?utf-8?B?dFB1RWJQeWM5WWYrVHA1Uzg0TkttcXpnc0IvWFN4WlZrcXRhaVhlRjJNMzBh?=
 =?utf-8?B?QlpoS2k5YmltbUpiQVpWTjhobXovek5VeHhaVkNSWU9iUUZNcFBDa0h1OXhu?=
 =?utf-8?B?bUJvWDY3MVlxS05aRmlLeEVGVnRLUlhTNkltK1ZSeXRESmJNZzhmNkhyT0JH?=
 =?utf-8?B?d2JrWERMYjNsRERUcnk2OEVjZTkxRXRrbk9HTzhlN0RtTHVLZDIyZW1NVlht?=
 =?utf-8?B?YnViMERsNlc5ajNWN3ZVMW02UWZ2ZVpXREJ4Z2QwTmlVSnRueUV3enRRVFZ0?=
 =?utf-8?B?QUlVRXpSUlFaaHVZZGhQYURLZTZMZis5Q1ozdWJZYVRWVnM4NDliMncrbDVV?=
 =?utf-8?B?NGhuSnRZZmVzTkYreVFtU0hqSGVhMmNJQnN1U21vN3krTXM4cXBUYzVxTnpp?=
 =?utf-8?B?b2h2OUREME01MWU2dnh4K01lTitncDQzc0cwWGwwYTByMHNWcnhCdk9pR0NT?=
 =?utf-8?B?M005Y3FaMEZGbTFjQ1U2Y0hPZXM1dHJCSjFVem1vZCtOMXFHajZENlZ2QTlG?=
 =?utf-8?B?WVI0SGtvUzF0Yis4YVlYdUNVdzkvcTgxOW95cWtsRmxlblBsNWNjWkxyK3lI?=
 =?utf-8?B?WndCSTdTZERSQUZubE16b2wvb2lRSGRJNnJHZHFKVTczUkN3SDRvZ1FvUXo3?=
 =?utf-8?B?Nk0vQkpQSkNjZmdUZUcvOFovYmpZcmdBQW16ekNCQ01obGxhVWFPdTVEQjNM?=
 =?utf-8?B?NUFzajV2YnVRZHJuNUI2SFVGdlRXQmFUVjFiV2NnNnM2bHBlTkZlenJiZThh?=
 =?utf-8?B?bzlidmhlMDlsQTdnR3Btb1M3S1FMRkRNYlpuSzRVUFR3N0NwR2c4QmJaMko3?=
 =?utf-8?B?c1BtLzh3Slp0MWxwcEdJVENqbnY2SlF2Zk5zeStkMUNuYStvU3BvMFhaYWhx?=
 =?utf-8?B?U2lmTG16Q2luRzAyRjlrbEp0ZUUxeEU1Z2o1MllmMmtzbDIzU0p0TGNIWDRn?=
 =?utf-8?B?bTBqNWluR3FkZTlibnc4UFpPS3RCcFlvMU5ZMjNmSTJNZERsQnBJNjlwSGdI?=
 =?utf-8?B?dU5adUQ3dGN1ZUNBNHRZS0tBVUQxcWNTaXRZUTM0Qk1MMi9SakdPQTJsVlN2?=
 =?utf-8?B?TUk1Q3BJZE1ETURvVG56bmZzRHlzRHRORDg5dmxzRGN4aUV3K0xzSGM4WnI1?=
 =?utf-8?B?dzZMUGVJYlNvTnhyVXJUTHByT0xMSlBUREpUTGNQd1dPNDJQUzgwK0ZJYlpj?=
 =?utf-8?B?QkNwOXFIcnA3anBMcHVaZ1FrVmJ0QmVZUTdlSHBUZXlRNTRNcTJxSmY0TmpV?=
 =?utf-8?B?MVdhbUVmNEZLaXk2YnBZYkZJVm5zTDEzcW9pV2w5ZFVZektHSXZJZys4dUZB?=
 =?utf-8?B?SzlUS0hpcy9HL3FoTDBZb1NFL091V3FYc2drcmlObVNjZDRaQjhVYk1aZEx5?=
 =?utf-8?Q?AVt/+QfJ71OV/587YIzPAExTHpnZaMxHZa854?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f0687e-8a29-48d1-377d-08def3f3bf9d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 19:48:55.3441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KeRp93r1tPhs6KXQ6mTPSxxi2tm3fJmpOtuJbBGUNG7inLq73BmchRnZ4tQc7Nnp62DWWBXpMTpgA5jdFwvJDA+keDFqbAU6g40k0qiBerdi32+BvvKVwZ95u03RcBcQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9205

From: Frank Li <Frank.Li@nxp.com>


On Thu, 23 Jul 2026 16:13:20 +0900, Joseph Guo wrote:
> i.MX93 Wireless FRDM board(FRDM-IMX93W) is a low-cost and compact board featuring
> the i.MX93W applications processor
>
> FRDM-IMX93W board basically reuse the FRDM-IMX93 board, with some minor functional
> and pin connection differences. Factor common parts of FRDM-IMX93 and FRDM-IMX93W
> into imx93-11x11-frdm-common.dtsi and add the board-specific changes.
>
> [...]

Applied to imx/dt64-intend, thanks!

[1/3] arm64: dts: imx93-11x11-frdm: factor out common parts into dtsi
      commit: 6feee64127065826f4b057654fe2e7b045db8c35
[2/3] dt-bindings: arm: fsl: Add i.MX93 Wireless FRDM board
      commit: 5d923b90668180c8bb0fbd70f87584e352f0e4b3
[3/3] arm64: dts: imx93: Add i.MX93 Wireless FRDM board support
      commit: 2528cbc1fdc07cfbfbded7c612cc93567fe2c121

Best regards,
--
Frank Li <Frank.Li@nxp.com>
