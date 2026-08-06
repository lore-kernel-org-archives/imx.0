Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010001.outbound.protection.outlook.com [52.101.69.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92494D8DBA
	for <imx@lists.linux.dev>; Thu,  6 Aug 2026 19:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786046214; cv=fail; b=O+L0kj5jiwfNCLqp0K3a6GZvcf9AAYthL+BCyOS+rb5t6KZqeRMeYrsbY3QJVUAHoPevdJr5YxI6eFmFc1nr1LqM4ptaMaq5FyxBQSzdBf8GRW3Poxbr1hRcaR/3T5MNSNvVChP2lV302R9YW9/ifQl9E0zSFgsPlySiroZA+Nw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786046214; c=relaxed/simple;
	bh=FYfGucDaB068tlYjeT84jPFipumPkremeC6vb2BIYu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SGAzOLP+/tovkoMcEOK/9C1BJ6MUlD83eEqT3tyX+3hLIvHmP1HfzJiX9+0D2DoAISUipMUux2ParZm3SBEGxIgwvAvUkV9JKYlA7N1ORtQsysgRZFWm0AOE60P9kyGCKKB1bIy6nRJ4YMXrEI16yreSqjK2AeGZ2aBNybhI1/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ig1IlxgP; arc=fail smtp.client-ip=52.101.69.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ig1IlxgP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=poSLF8RRsxVinA9cwHGb6kznkG2Yqz46K7XwYDrL6c8LX40Msgt1WXmZSPud6Ucj20TNPOdD2gUlVGeCjQ6d0V0KeratAl+MWDzSDlNYtTucOpJuCrOTA6oAuwpkdztVh0OsB7Tayktd4hyAHSCW592gFb4BIGkS9xIKCEmYyAhXxmTmyQAs2kpB3rM0hVAHJZyAyo50D6ZTEXf8TPS4tqb1GoLak3oEQ6O+8NsPYOXYceECyJYfqnyBGalWJmJTMFUuPdttFKq98T2HFkYNvDwEhv1QT24q/RIb35b+SCRU8fFC1D3VHpc165rrZEFRyA8slZlCo4+vLFrZN56+gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3TmK+8ru3Hkq5+SnLnZDOYJrvYg4u67uv7Tv9+uzUkE=;
 b=rA6CrxsEG5TE8Io/qUV1w9OuOtRczIrpWSQBNeJvhI/65oo1fuF8yMeCk9e664m1B1OFNVKXnYOiA+GJwetlgxb7SqH8v/3rLyRkwqBEAOMKBkvMoxq52B8HGI2Yyf3r+8zghr8NgSGRgHyLl9BQLISY2+iK5HsTNaOoYUO+4QZPwmvTYlL6xT0XsFaZBg8sy/2LSpVbS9zLosjljoZySok2fDDxEVxOmaOq55YycWeBYuumHtxxBl2FHgXNTBWOGtnp+EDr0y31IxUVWbVUuCFZx829Ckh8oCFLtKXqlBr//bbJBxEMrCaXYO7kwJ8YHZZDQPcZTa0FLzWoDd20PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3TmK+8ru3Hkq5+SnLnZDOYJrvYg4u67uv7Tv9+uzUkE=;
 b=ig1IlxgPdgis+HjasHSbu/8WpjAo3X4IkCcMAP6F7hSlkqZIOs63TMYOH4zzq72DmIq6H7HJxYAzaJZF/SP9uFMorYMEvyJRq9GZtknUBxOA4R4cgyzH/bwy78SeByJJwTKqpbpOihIKck/upvs5tdkPzPfhBFIc3Ur4EUj6NQYrbHkm0sZogRGZpiyFSAdbXXBHpFSeGcdNl8fgMCGt7Bbax/kNy3R40CUuUDGifJ7fIqt1v+ais/tLAsnOQgd2yOuQdi4QbEvlglRXzALIwJXQukXbcOUYXEpi4u4eQBLnINW/T5gdNuhRjH6jZhg1YVYKxLSUcFfAPaWEH4TdaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB9907.eurprd04.prod.outlook.com (2603:10a6:800:1d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 19:56:49 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 19:56:49 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Frank Li <Frank.Li@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/3] ARM: dts: imx7d-colibri-emmc: Add Toradex Displays 7" Parallel
Date: Thu,  6 Aug 2026 15:56:41 -0400
Message-ID: <178604616242.431490.2877142775301570674.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723105225.194366-1-francesco@dolcini.it>
References: <20260723105225.194366-1-francesco@dolcini.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0080.namprd04.prod.outlook.com
 (2603:10b6:806:121::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB9907:EE_
X-MS-Office365-Filtering-Correlation-Id: 05c6be6b-33f1-405d-a6a5-08def3f4da0f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|23010399003|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	FN2z9Eku/AR/v+BomkUDus4PiPRT6jAXTL83IbKOTC5v/Ux5HewsCEP6LCfRuPMqsctOCuCIzriJUoclGepPMQxhYdp8P3O47zU3t/bWTIE1MKXlwPaTiBzLULJ/1vACj/YLbElBAw9BLwqXV6rOC15OidOqNzncNUwI1k+sOGliFRM6UF+JeosCRxRJuR7J/MMrZwK1t5BI7Riq2+2lOa2qjGWw/b5kz3X1Mbu5wJVLv6qaXxbviApXfppw43yaX3DOtrkcT7D8kY8YLxKLqQr20RAbewuhZ3RkqhkViSrncNz+bkjdHkR95KEGe0KgjXyI4n/tBRkkmKdHWD29IuryN0R7brcKXiO68mfg/Bje1MPfhDTH60Wn8FgujXqy7WobQvVdQxOCTKfMpf1lPBI/E9PWKj1R7yrtAS798/gb98AF9sM0dg26L0eQHGHN7Sm36zI6TutmTXR0sMNDDN50mN9sKyPXwdRp2Hk90XEZ8SsHHhExLraXfhFwDrPX8ujbFQ0FDNl4b1zjtd3zNepC/+N2SHONd7ytdNrcFoNTxZp4L9Vtqmcj6iffT1q6lx5E3pRVgbn+PAynK7bDHiXjumdvMlLyN2HZYr2m534GKW5JIjZQRHRxdBZY+VN+eQsJ7GUNV4/sxuhQ2YtBA4Wtw2gYeMUwGfDaJ+C0GjY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2lJN2dUbS9zemdVblZ0SEZxZStmUFJ5bUhHclZaMFRaVWZqalFnMUN4TkFH?=
 =?utf-8?B?bUZYVlVrZnY3UHdyUE43V3k2VUlBUlRQYmFQenhVUHZ3R1ArOUVoaGZzVGFl?=
 =?utf-8?B?NlBrSWxxSjNCbTZuM1hHKzYySkEvcm0rM2QxY010Z2krMDMwZ3Q4UDF4eEdi?=
 =?utf-8?B?QUM2N0pRbmVNUzdtWmVyWmFoRXg3OGl3bjdSMVlaWTljQzk5RjRCTjN5Q1dQ?=
 =?utf-8?B?S216ckV5Tnp4WXZSRkRqQ3BTc3kzUUVRalVMVzd0UHZja1Q5ZnFUcXZ0ZGxw?=
 =?utf-8?B?clkyOVFjRjQ5SThjSEY4Tzg4K3RGd0NzNWd0R2xtMXhVNkJWcmNQWnJvMVNN?=
 =?utf-8?B?eTRBaDJQdmVXMW5wbXlmS21BZ3N6YSthYWxRbHI4Ly93Wnlsb3M3aTNsbTlx?=
 =?utf-8?B?N3FSaHRKR2ZQQlVSdCsxOEduclVHU2N0YjVFTVRTVEt0R0tVTjFkbnM3dUlj?=
 =?utf-8?B?VnBjeklObStYUE5IVVhZMHFUYzk3SE1XL2VuOHR1UlVkb3JUUGp6OTdON1R5?=
 =?utf-8?B?eFowbTFKUjB3V24vL01pQm5KTXpndUF6NUVwMVNnSnBuNU92cHVUNDlMQ2Nn?=
 =?utf-8?B?V3cvTUxlVnl0V0JCcjcyK0k3WTlEOHVtTGU5eE8wdHd4QjE4SDJsYzJiSHIz?=
 =?utf-8?B?d0U2c1RTTE9aMEVNNXZ2R2FNamI3QVJiRVFKc1lHUUJoNTQ5SUNqYkZvb3pZ?=
 =?utf-8?B?UkhzKzV0WGp1K1MxZGZDUHZZSGZETVhiaTNsQ1E0UjJvSUZuMFBseEx5UThW?=
 =?utf-8?B?S2VSK0tKT1lKYU8vdEg2OWVEcWlOYTJ0cENhS043TmVWNHh6djJGWjhFV2dv?=
 =?utf-8?B?MnQwc0ZIY09ZQWV1Ylg2SlBGdk9hcjd5V0xYQ3ZFTlV3RDNXV2tyeFdQckFS?=
 =?utf-8?B?UVJQOVV3SDJHTXBVb0hhWGdRRW1xbG5ib1FjMTYvVHlVaFhoSzdISVRuN1E3?=
 =?utf-8?B?emsxS2VaUHI0NTVncTl5eFYyM1kzZ0ludU82RTVFbFNrRjJER2FZL3ZGWFU4?=
 =?utf-8?B?a3VhU3RhcDhxMG9Kbzd1L1l6Z0drVmNMazFmZk8xWVNQK3RiYnBJdy9ZRGhB?=
 =?utf-8?B?SFMyaTVTcWIxek9FbHBrTDQwWTdOekxKeEE5dUd6bEJFRDFLQWRNZ2t6eFVi?=
 =?utf-8?B?b0VVNXpSZHhTTXNHeEVuUm5COFh2T1JMT0tCN1FxSHNHV3F5U3VHaWo5Nlc3?=
 =?utf-8?B?ZitwUHhxQUgzelF6R21ORDJGMWVjT3dZSU9RWE5GWFFCenhheTlhS0ZCTTZ4?=
 =?utf-8?B?RmJkL1RLeXpLUHpmLzNIcmllcWpDWHlmSmZST2gyZGMrTjhqeThTS2hWdUZZ?=
 =?utf-8?B?NnlEcDdtVUI4WnpTeU5nNVBkNDdLM21kMUN4MGJwckV5VnZHL2w3SzQvcGIy?=
 =?utf-8?B?L05lOHVCS2dWMld5cFBCeVczMGNScWpSYTM2OW5DMWlQK212eDFXK1Z5TWNK?=
 =?utf-8?B?c0hNa0hTMlJzNHZpWDJLdWJRVW9sVlo1Y29vM1ZwbitOUTZ3QXNNSWRZL0N1?=
 =?utf-8?B?RStPbGFobzdLNmtsNW0zcXpvVUdwTWt4TC9JVEEzMEhpaTd0M3I0ZXYxT1Y4?=
 =?utf-8?B?UHJiVDVMeUVzaDhPMnIzaW5mZjlQSnZMR3Y3b1ZwMlgzT29pZ2dkZGR1dG5I?=
 =?utf-8?B?amRMNCt1bFBucjlaSUF1Nzk0NjNkUjY1Z1VKdXBkUVFnVlZIUHhBNU9vTFhl?=
 =?utf-8?B?aE4ybHE0ZHBaYmh3YWcyQ1RKWVpOeEhHMXlseVpDV2hQMkZYUDJDZkszSC9X?=
 =?utf-8?B?aWlCNG4yNHRxajFIbTA1QS94STVIK2JoK0RlbU9GRTZaZ2E4VmlLWDlOcHJz?=
 =?utf-8?B?TUhtdTliOXkwZDRkc1lwK1Y2N2FxWi9ieE9WS202Y2JkWEIrNTduZ0JraU1B?=
 =?utf-8?B?SmVEL1pjaGtyUGFsT0FFckUrNFBVdEdsM0V6RkpHTHpNNzFXY2U5RHR4MzBl?=
 =?utf-8?B?cTJHcU11eVJMczBRODNPcjErWXdCUlpXbk1GN1YyckdBRnpkOUpRTU4wdnc2?=
 =?utf-8?B?VVY2MmxnRnJTZVRtNG5Vb0krdjhKZHVRQXVRbTFHbllEbmJJUmlYeG05eVJH?=
 =?utf-8?B?VXpOTUM3WXVhTjNHNVI3aCtJYUUzQmpWVzJqTFI3SXRjVzE5QUVZNDZzK1pN?=
 =?utf-8?B?d1N2YXA2VmZoejNYMmVPSzVCeEo0ZlV4NkFBOE5sL3hzU3pNdTE3QkxvQTZl?=
 =?utf-8?B?ZmYzM3dpVU85TVRhS2hWSHRoSEpydC9aMWtvbXE2NnAxUlo4SnB3OXlXcDBs?=
 =?utf-8?B?MzY5azVuRWNzalljd0cwbmxmOWlML1EyQ2Fkd01IUUJ3QUdsc2dOc0hCL200?=
 =?utf-8?B?L3NrQlo4WTZhN2lsN0lZMEZWeUhmRjBicFBzT3lybkhWYnNBZFBvMHJHQWIw?=
 =?utf-8?Q?JcSQoxOZBg2O7m59sO+FRKpI6ZRY1ikPsYKYF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05c6be6b-33f1-405d-a6a5-08def3f4da0f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 19:56:49.1375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ofp14Y9FPZ2oXj+3QWytz5ah1pDWOQI8itRVQ5fPLXNnKKufmR9ET7WNFMWf0LeVKTADVC2a+zXzv6JE3Xht7qCy4D4GmyYwp2UXCoGWxnyPv+9cWmRzaxzuA2Bkdij
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9907

From: Frank Li <Frank.Li@nxp.com>


On Thu, 23 Jul 2026 12:52:16 +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> This series adds device tree overlays to support the Toradex 7" DPI displays to
> the Toradex Colibri iMX7 SoM (eMMC variant).
>
> Francesco Dolcini (3):
>   ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display 7"
>     Parallel
>   ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display 7"
>     Parallel with Touch Adapter
>   ARM: dts: imx7d-colibri-emmc: Add Toradex Resistive Touch Display 7"
>     Parallel
>
> [...]

Applied to imx/dt-indend, thanks!

[1/3] ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display 7" Parallel
      commit: b83637163279a2a69a559c8789cd2197d9ae0104
[2/3] ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display 7" Parallel with Touch Adapter
      commit: ce580e453d27327c79ac8e95dd3533a325cd4202
[3/3] ARM: dts: imx7d-colibri-emmc: Add Toradex Resistive Touch Display 7" Parallel
      commit: f37a9b80fad87bf39b66a3f5b4dcf0d0d91c9994

Best regards,
--
Frank Li <Frank.Li@nxp.com>
