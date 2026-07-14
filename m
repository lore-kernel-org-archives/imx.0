Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011047.outbound.protection.outlook.com [52.101.65.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC0537E5E4
	for <imx@lists.linux.dev>; Tue, 14 Jul 2026 20:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784061226; cv=fail; b=I0h6wH6JFP6JMiRUkxj5bprsv1OZVJaEaztvMt9CZbhCVxjBW4c+0DBnH2VG1VdqSPQV6Sq9gB73sm6mISYYydcKiQEh4hgMfrXO3R4g9jKIOSdTldNiabFOXU5P0iJiLNeF4uSz8V+loTSd2MDnp3HRwc/8haSFEoLlpqJ7yy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784061226; c=relaxed/simple;
	bh=m5cJblXxDlzGVDdUwdLV8xgFHC3JLr5wDEYDS7NbCaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Nb11+C/hkGb/fKtYbhxmhkmKK7/wicKei5Na3tAgzGpebY3OrK4t/knqYsi+BtWTEYeFv4GYCfIofN0eRv4WufzlZWDliRjwwTyREipXvEmd68OYfIJ/U1OCIYgrcD4qjCI2IowCY7gkiWgcBwgtFR2kiCct5MU9bEQODggHVOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rhLog645; arc=fail smtp.client-ip=52.101.65.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rhLog645"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bYnTI3IRB8AeiTgiAShfpSgop65q5/Ihb3GVmYNdeHFS7OoxoVK1k2KmY5Rz63svfRiHvdD8LnK21ixcaGns8IyDKSrat90Vtbqd+5h2P6n+MFzJr9m76dgfSkLGgt3jIrvRiA/rKcn1+MNqmY5gv3+LAhOGq5klDtii/A2irCcpbQweFnUnAZBHe3Fn4YNbNJ6mY03o6/QW+ilhEIyvQzD6je25mpk675Idi/lBFlCEG5d8MlLGFDeiJgcI7azcPrilJpeIYgcsvseizOWnaNGM+Nyzf8A0u/sj0iJ02/ZEsFbWN2PYCsfh4DDIQNEhgJhre1uArGktN2LEwVOM4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWvYsvqfOjBM3XTs52reve5cF6WpKK98y+DFSa9rO8E=;
 b=xNHF9LQLwobwxG6H8NUmSMDAcX7JpzwSf5rBCpkUUHyf5iAC7YogA9BLXVJKFjwBbcujRzHspLxqvAIMNKYUObLf7ZY4vGwpzqnFiAbu3oENCnEZbOtGLhWvGK48BftBcierVFdQEEB9oOsB8daIxiwAo6anKqaCbWgiA5ppK2zS3RaDusHOkfiFPUddSIS5W1k2GEnwKgUsFLwCiERLT4kdl1SC9n5mwVA3ZeVXvd2C0kliX/HB26wzQLeD++K9b23eywWdWNXltsuCFYR1O9Z741Zt1jFSWvJNM3cIXEXhgm7UZNh4rRhF8AnwzuHfM6Yn75yEropf0tvYT7E66g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWvYsvqfOjBM3XTs52reve5cF6WpKK98y+DFSa9rO8E=;
 b=rhLog645LkBZsZwjBzFRQnuf1QCaL1h2ffWXiYEdkL0GV+Qh93qMuJ4DkR4jlW6t6Ui4DuSuv/ZWW7f3/oVGdC0X7MR7B6e/rZJEyT1peOrGflEn8MuPib38LpldEHgkxIy3WcXOf+FycHsmDvS2Ds/kod+2dfmzBxd6bsaIUqKLwiQ6mxCLVyEWANjHIbfncwf7dquIJ6Il9cvoTeuVGumjO1G8+buZrDKrttzXIxU6OCH+AYrl6LK1685d9oPXhWOf+rIGEuRTVbFn897C/Nwe/42mApQNlkVVuwQpy+UXnL7SGnHER2JEX4/69H9XB/ILFuRhSbDmLucHf7VUpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7793.eurprd04.prod.outlook.com (2603:10a6:20b:240::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 20:33:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 20:33:42 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH v3 0/3] Add support for Variscite DART-MX8M-MINI and Sonata board
Date: Tue, 14 Jul 2026 16:33:34 -0400
Message-ID: <178406120321.1837865.3331872270821661159.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784046629.git.stefano.r@variscite.com>
References: <cover.1784046629.git.stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P221CA0056.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::30) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7793:EE_
X-MS-Office365-Filtering-Correlation-Id: 24e18de1-91cb-4e4d-4e5a-08dee1e731ca
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|19092799006|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 OxI8QA0BaZcVQZ8FiAyVR2gLW5b6UjjNwRI1H7J22Yg5h/9sGwbYEuAYdl1yBbUjp+zDR2ORU9vRBykVsvXx2vCIxH+FrqdyVXeckToetMH1qRyJU1+wzlyAAmq9mKJjmkFhPWgDfw65mta46M5ZKa7urf2S5cUtzm1lI9Tpz1ujySZW9noS03LI00HR09KRAaULoYcSP0PACu7WbQQR0mhOJUNtNETBpf/foVIAyQV+gTKjYySI0MOJFxxm12JNIvlq2t8SqMjdGTUqIm1tePsyneZr0cgqQd8nhpkQz7nBnV3dqqhtVEXWcx3T6siMMDP4v6TyqihCewIwEb6LBcutebZSJwqzXER+S30qN4JpOKonSYec/mnlGEReLKAqcax8Y0B275Qbb2yiok+1yeKa/mvwh5srHsuugIkT2RG7Pdq6DQE8fvyUPHSCsbRd1kCkutB6IytKCUXN59lLK5NGNTlRYyDJlnOSLCe91xSMxy81XO1xFPvWHWPRAwJ7ZZKZT1KzSLpmh33X2amniqn47uDK2epsiXfv82/E1f+5By7Pwcossc7aHlx91CQMzgLnMVB5RYHlwOvQU1nljHiym6Ifx7HhCx2Ub5aTRdbGiGuCHAcCqgyDA0o0IZz1Wghljga6I7/BJWplVyFfKng+RPATxHskM38EvN5+Su0=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(19092799006)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RWNhbFVmTE1zUXJuSGdCT05LYUtzYkgvNVJKSTl3dE1xbWhmQnBUc3RjM08z?=
 =?utf-8?B?SHJ1MGJ5UEs2U2QySkFKQ3N4QmhWa0t0N1NiMGpiYXZ4Z0hjS0JYaVJCcGN3?=
 =?utf-8?B?eTZpbVBwcGQrbjNMcXBZaEJCMTI2Kzh2RkJOVUI2MGdNWnl2bkw5ZzZzL3hE?=
 =?utf-8?B?WjlGZ0ZrZGRodHU4VmY3TDZrdmpnbzBxeHU4NkFZelNENEVHeFE3RVBBc2Vt?=
 =?utf-8?B?ZDk1TXRNTE1uUTNhc0FlVWt1TFNQV0prcnFXWGNnRWVGSlBtMGszVU1oTmtJ?=
 =?utf-8?B?SW5VR2t3enY2QUtlcEhOSjU2dXZyUXExNzdSc05iNlRRM2ZvTXdBM0QxcEc5?=
 =?utf-8?B?OVVzQ1NwaFhOd3pRS1UxenhNcHhZM0I3MTJJS21GSW5NdmJHZyt5LzJsWm5P?=
 =?utf-8?B?UjFWcXNnS08rWGtmRlRBeVhseS9tMVdsdG1qM2swZnNaVjZaT1NhcXBmOGZU?=
 =?utf-8?B?bjYra0JCV3Fxc09WUHRNNjNHbzdINEZRSG4raXBUaUQrTDM2dlYxZ0ZwS2po?=
 =?utf-8?B?Mk1IUFVCcndGZ3pkZ3RHaG1GcGpLUk5QZzIrM1N6MjF2OVIyTTNLcnBRTkJW?=
 =?utf-8?B?bnpYdE1kK3RFTGI0bUxhZUN6UkdTd3ZTazU0L3QwVEpyVUpzMnJCWEsxRFBG?=
 =?utf-8?B?M1l2czBiVGwzNmZTbStxcVlYcExuckRDOHEzemUzTTRQTjhDeEg3eUJ2Ykg0?=
 =?utf-8?B?UWtrV2FWMUZhK3BWdEY5blRnUU1SeldZSTBLQURjUFVRVi9sRlJ1ZHZPWWFK?=
 =?utf-8?B?RWt4L05FTVRpSE1wYk1wc0h5WlllRkFCSm9SMjlIODJGWk5EeG8rcVA5YU0r?=
 =?utf-8?B?TGVHL09ub25kZVhhZ1B5bGFZVzcwS2JXUCtqRldCaFhSM0lXeE5OR3BndFhs?=
 =?utf-8?B?UWcvWm9rMnUxWW9EV2JWTDhkSGdWR0NQT0duTVdQZjNpMEU5TTZGcmU1S2xj?=
 =?utf-8?B?OFNjdzBqUVVTdk8yVXBWTW1vZWNiQ2x4UVpNMmxIRktqVVJ2Tjk2VGFZY1Fi?=
 =?utf-8?B?ZGVvUEtEZlloOFI3TnhJV3dZRGRCM25ONWIwdnRzRXJ1R2tWY1FyUnJ0bTBP?=
 =?utf-8?B?UjloL25SNW1MTU9PcDRFUmY5QTNkRVQ1M2xiL2NWRDNINmlLRDE4VGhMcDFB?=
 =?utf-8?B?aW1xZWRUOFpLOTlDUWNHdDZ3alpQbnh1M0dubDR2Z2xuM0Vxa3h4T29CNmQw?=
 =?utf-8?B?aG9vS3l0THFoYmhWSHdQZFU2azBiVllLc3A2RVBSTTQxNXpXVFd2YkhtMmV6?=
 =?utf-8?B?K3FsUm1QWDBOdXEveDFGL3Z3K1REQWsySkZ1Y0FwN0pzRXQ1TDVJdDVKL25O?=
 =?utf-8?B?Mlo0T0E0dXdtblBoVzN6L0RxVERlRmRlYmJIWTI2WGo5c2xMV3FTRnYvSGNK?=
 =?utf-8?B?UVN0NG9PeWllQmU3WlN6SEZTVnJhL01jVGFZQ3ZyajkrNTBmTzVhVXhlYTNE?=
 =?utf-8?B?M05jYldpUkxXVjJnMG1XS2tEMlRlZEV0YnFZalRybyszbm1iWWxIaDVpM2NF?=
 =?utf-8?B?a1ZtaXF3R21wZ3FIRUlGQkNkamxRV2Z4ZXkzODEzZXdwQWdhSnIrUDBrdG1y?=
 =?utf-8?B?d1Axd1RYNnFaRXpzelB5cVdrV2RObXNQU2k2QXZqNVlrV2RKdUpsVjVPNity?=
 =?utf-8?B?ZCtUREU1RkhBYmtWZUd6Qlp6Zzd1Q1RuWnh3RGpjMUdnQjBRTzluSEFwc2k2?=
 =?utf-8?B?ZzVvcGhPdFZWZ3FzclBEMHBvSEdZMExoT25HL1FJZUQrL3hCZ0JYZy9kc2Ir?=
 =?utf-8?B?Y1pNU0ZEdG1OZlVSaHFMbWQzbTYyMHRjWDJzNHJYYTZZNDdXUVk1dlZlREk3?=
 =?utf-8?B?MWFmSHVPUVJqeGtYTlNyZkhaR0Q3Y0dhSXNJWkdYOVQvYTRKNThkYzBPbzYy?=
 =?utf-8?B?N0twY29sQU5td0MyVnF6VUVqbXhhalNENnlXRDNQRWRTTjVsMDdNYWdmSXVa?=
 =?utf-8?B?TXRsMEpMM1VtZkZOV1ZUbzNPOHFHN3VaTzdIWXFqb21ZM0tWOVBuYWlPWG5S?=
 =?utf-8?B?SHg2c3c2TEtvcG5zaWRNNkdxcFBSb01mbnFwdStQUFR1ekNDYWtRQ0swVWQy?=
 =?utf-8?B?TUdIMytwTHNJNmx6aFZrRXJNajZ5RlVCOVQ4eFV4dGh0NXNLazQzQ0VGZllh?=
 =?utf-8?B?ejMrZHR1aVNLOVJiOWluVDlHaUhCdHpLczgya1BjQTVYZHNZeGpFUXVVNUU3?=
 =?utf-8?B?RE5QdE1wMWYyMmRuRW1KaXdBRkpKdzRIVnNYR2d6Ym1KNWVoNlBuTk45L2Fr?=
 =?utf-8?B?V1piSlphcktDU04rc2xicDJoTzQzVVpCWERqRG9oK0o1UG8rbHp4R0V6eGZm?=
 =?utf-8?B?N2FFMTZ4Z29DTGJtaGdCRm9zWmhkcVlnUEhCL040USs3TXl4QVIyL1Z4TGo4?=
 =?utf-8?Q?T6i0pGUR5MBUZ57PdC7RRU94L/MMhqBUJ2L6J?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e18de1-91cb-4e4d-4e5a-08dee1e731ca
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 20:33:42.4067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7qkU/XXWv1mr5kOn208agIBhoTvc6eO7fuzjUl4nkD9ZUZtvmDZqo+GXSvuoIkTRxEznG0I6dOYFM5ceICARbdaUGfJECrEEuJ2buSQDVt+LDY/IvCFUAau6sYiWi8+X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7793

From: Frank Li <Frank.Li@nxp.com>


On Tue, 14 Jul 2026 18:33:50 +0200, Stefano Radaelli wrote:
> This patch series adds support for the Variscite DART-MX8M-MINI
> system on module and the Sonata carrier board.
> 
> The series includes:
> - SOM device tree with on-module peripherals
> - Sonata carrier board device tree with board-specific features
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M-MINI Boards
      commit: 949e5a6a8f349ff3098f4dc2aa3483723e4209c1
[2/3] arm64: dts: freescale: Add support for Variscite DART-MX8M-MINI
      commit: 5297deef08bc3ddc1a27b3518b770dbc3a14da81
[3/3] arm64: dts: imx8mm-var-dart: Add support for Variscite Sonata board
      commit: 770aba46ea0fad62631848d4cf2c0c8a5fac7ba5

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
