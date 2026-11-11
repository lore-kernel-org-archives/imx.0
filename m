Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794429274;
	b=h5txaoNypLTqajnpHrg/OA+VhMPQzwgYqC9xD9IMOjTy/0Qv0rzl/56ohBsxviTmiSnQ
	 NPmo6kmfYCeeu7VHZyWdDeu8lMs0f8O+cjXs32v2xd5VweHREcRAWpRJRZaFUe9G7gEk6
	 cJt18RTrCtzk5XgNq4fagnm2DGr00oWvsvM0xvSoHdEiYFgIG5Iq6rit0XFQ7OxrG+u1g
	 wDTev1uj93PrQYZrkxPC0Jkcwg9/c5/qzk2sbNvLt4NM0pdW8DhurpWflXZT45Bg9XtB3
	 NNNbRjPjB2iYunjx0Hn1L1KGI47vFwgNbn+t/BQQMLsIhtqLF4Icb4jLaGBgTiXpIsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794429274;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=KyoqTNy7bxX3Me6Ez31zjv9OTpj3oJRO96bdfIYoy1U=;
	b=o6pBfw4lp/DycLUopSANtJ954q++7podNx4ZB3WVzjiVxdHWmGMr3JVUo2UdKAEwMQ8h
	 rSi4dr2k78l8IveIxZVPlCUHYzPhQbVR3TO32AF1c+DmslV14darcPti5Up+zI1Ay3tOH
	 8wgVdi7gJKMJDKZTfhE3r0lSI05+nKDHoAqQgRHIvg+UtWi85Uoq3wfhzNQk08sPTFVRM
	 EepoMKuZxmqbLRcyfjQvLdip+QpGBpWN1+30D/f7tCzDSgyY5OfdIxZXn8bPlaMbggNNN
	 5vOxIlO7welKhBIXBY5py7kBvps2LFsbs75wotEjlebcfAZ6LdK49t/HxWU4Q9O0Mug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=lR49rZKs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.28
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012028.outbound.protection.outlook.com [52.101.66.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D530606A31C
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 20:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D530606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=lR49rZKs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FUKabxTthRN96sdYZB85kxGrw9fYHOwPE8T/UgPJe+hHT/n5gYwPS9Ur88aqAYgymnzzXjtYegKiRGuTvnX10WVmNKQr46o4ndzOgxfiGCQyZ1qSlHFbgPf7GC8XdBcMAbdYg0QtJ9dTMdNoI0mZZW1uIj0oZ/UBoQ3/Bs4NL3BZhHoVvtANyJIhDjEbs80HPNFaE5tovHGsyEefYJr+TS69fRarryZJ8sT932ZQHI+jpBYjRUzgqeZUue0yDYeVIc9uRLqutwNvsZ/wqZXnlachfUWMERFqQFr2aQJYGTHJJEfoMcw12xf0N2D7tftGAG8W7gpncGhBJpP99TTe4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KyoqTNy7bxX3Me6Ez31zjv9OTpj3oJRO96bdfIYoy1U=;
 b=deZKIt7h8jBN7sA+CWWo9AK5ggEHSgA7ecdSN1PnBNs3KL8f0gAIFKpUO0GjxcvNq7oyJZyb2P3SQzBrxprfA/a2jxq6cQEoV7PLOWe9XCp0fxopCsRLonpOnOsWfw3krm7N91LJh0ngCz03Rx1+gfk+JPVwDCDiTLJVCdgPiAUAyOLOZfnhZhjH2fPRHlR8heqfS1G5oWtqORk3dpXOnPnusGROEkTpcIwCY7ofPq4DhA8bju6mC2MPVfXcpTaPVWkMhKHHi21HRoGLG8Qwrwp/R9JghDwqdp+KHTsCOY4elgBKWSahGwnATqOQK5gNRSo7Ot583H2fqOqBPDRSAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyoqTNy7bxX3Me6Ez31zjv9OTpj3oJRO96bdfIYoy1U=;
 b=lR49rZKs/NN4Qt+WPbb3nRTEeatyvU/cqoD0LbLo8HVDCiGq5si0UStFJDjgFPGdG/BoJA8uZxDb5XHQho5JAuzXU7IvQhPaYwQBV03rDS8EeBpT5wuj2GzD+/z8V4MBuNs+vRuvpQ8L+hSkMbMPZPQouMPs0uiWLeyFWBS17Q0N1OdP74eQWpzmaCqp0KogoGOSqP1nJlwG/gQrvRjeWB3DRq6H4K4sBAAOPcm1MRtuyrmkSsVxdF5ZzOBRBwRTZhxPv8icnOpSfJSuURItHi4koioSxjgaspr1ZJHxI4ztiZHf40Zz0V5/v6+bL9CTR0EfnkKGQ5dPq07cFSMETg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by CPJPR04MB921366.eurprd04.prod.outlook.com (2603:10a6:380:20c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 20:34:30 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 20:34:30 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kaiwen Zhang <kaiwen.zhang@cn.bosch.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	HaoNing Cheng <Haoning.CHENG@cn.bosch.com>,
	Jihu Si <Jihu.SI@cn.bosch.com>
Subject: Re: [PATCH 0/2] arm64: dts: imx8mn-bsh-smm-s2/pro: Update thermal and backlight settings
Date: Wed, 11 Nov 2026 15:34:19 -0500
Message-ID: <179442924267.3894326.13724982262383960904.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105-b4-bsh-s2-dts-v1-0-8586d0ba44dc@cn.bosch.com>
References: <20261105-b4-bsh-s2-dts-v1-0-8586d0ba44dc@cn.bosch.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0102.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::12) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|CPJPR04MB921366:EE_
X-MS-Office365-Filtering-Correlation-Id: 970ad128-003b-432b-b6ff-08df4033303a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|23010399003|1800799024|366016|18002099003|22082099003|10067099003|261026140227099003|11063799006|261028144727099003|261022075727099003|261022105027099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	8PjD7w0pPScW4TfNKD68k7eM7VsaTJwCIh8l5+xrnazylSkVhMQn6vtGoBZLYpXeb72DsSm7CheSqmujwMH4RHJyt98NtolnHP6vhz7fUiGWEbuuOZi7xKWWc6FWsYCcOnrgByOeZOuN294I36G864JSImzRdPlOb5Wd1ZbAo5MFpY6GydhJPgGoxT+5oPyz3N6LMIophkpWdiPTNJbBLHQuqcCrKVsfoUPaI5pEXsfWT4hg+oNERCc30Prr0h2VhMd32SKdw/xgFVKsrivwwIyOM3D/XaR0rI2KA8wgjL9SWPlXqa4PfE03iY8Ui1AZdGxmtIWlJphjBRK7kzedqMZc3CQngIOs32aZ25B4rQxNHrZOQ+PoucPBxqViPCApnmUmQQmCEoMB53N9anpGmL0JYSdsdzK8gxn856umf5HWE4TxBWxEWDJpJzqbrpKaPI2l4KnK3IfWocO9N81/lvdc2yUJKvvXcFO9FP/qD2UIiBDYordKvJsTuw/PN1HyN0ygwdNPzseUXzHMY7u1/W+qD6LtSq0jwkziDBfnIThMuR0TZPyUd52yPR+pCheuSuOPVB7KY376es2I8JY4Iu3plgqRb2vcj2K7pOCli8lXNq2XRtlqhUJM2FVZQg1L05vuMqY8B887NNAVW1jyYw4UzMMlphcQXrVGMu+gIXY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(10067099003)(261026140227099003)(11063799006)(261028144727099003)(261022075727099003)(261022105027099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjIrYVRQTDBCanUrczBVY21TMVp4UHlDZHRoWkNxNU8xLy9ielpMamE5WERl?=
 =?utf-8?B?c0JhR245ZU9DSWhJd1BwWnp6eW9hZWNsL1ZINFJkWXBackwxU2k0MnZPNU51?=
 =?utf-8?B?L0tSbXYvbEtzQVF6SFlCZzJjRWFqYUsrSWVrMkplUG5sT1JSN0JNeEZ5YXAv?=
 =?utf-8?B?Qi9yVUVNTFUwenk3K1hjbTA0eElNRVNaTmRtaE1vdytib0xEenZRdTRZSng4?=
 =?utf-8?B?VU1wSmkyc2gvN24vT01BcCtaNzZ3Y3FkdHgyTjBEYkdJc3ViNWFYUjJtcXNv?=
 =?utf-8?B?TStnNjBENlZ6UElwQ2lYNGJUUkUySzdVbEo0NmxCbERMRVJEYnlaK0RNY3hh?=
 =?utf-8?B?SThCNG1pcUtzRTNRdGxJVFhBb2tIMDNKZW51TldVTlMyUEpwQ2hucmMrWHJl?=
 =?utf-8?B?dmVtOU9iMFJnQXBsT0lxTlJTKzhDUlAvU2p3eXRwZHBuRmhkd0dEcFRCQ0J6?=
 =?utf-8?B?bEk2OXpXcC9kbXlyN2FMMDF0Y1lJMTJubVVsVy9nZnNuZGJBejV2TnAzQ0Yv?=
 =?utf-8?B?aE1wcmVEOStXMW43QjJBWVhuQlBMbDhuVWphU3BEbVptWHRrbDdFMjY2QW5h?=
 =?utf-8?B?UTN1Z25oMmtCdU5wUktuL1BBU2VtTU5nWkZvQUNMR0RqRFBsRzRkT1pJaStj?=
 =?utf-8?B?a291eGFuWEw2VGlBWS8vYjExelgyQStsOGY2SmlYQ2ptQ2VVZjFWcGVPbnls?=
 =?utf-8?B?dVVTNjlWL2Voai9XMzRxcFdFOW1kM1BWUHNyL3U0dVQwSk5pcGd5UjBHejhh?=
 =?utf-8?B?UTduSEp3L0NaSWw0S0xjUk9tdnBRNUZlWFRaWjRtTXZaODZZM3R4ZW1VbkJJ?=
 =?utf-8?B?UmxwZ3BuVURIQ1JXS05mL0dwZzN4Z25abXVPaFRSdEJ5WHNnWWhQUms2Z3Jh?=
 =?utf-8?B?ZWZDZWxubmJ3ZGtHTnlBcUlkTkRpWlY3ZEUwSFNVUTJtZlUrVU1wNFU5M01R?=
 =?utf-8?B?NjhUWUF2dmFhb3c4anBGMUJISVBOS1BSNm5tQitpTzVESmZkeWNna3VSWm4v?=
 =?utf-8?B?cnhuQkpWVEtiTy9GQ3VWODdzZnVwVEIxdHU3TVRWd1BNamVSU3JjVFZBUzBI?=
 =?utf-8?B?UGxQQXJDNHVxemJHVEhEd0FxbXdmMnpSSFZyQVR3SFM4QlhBWEpld1RRVXdq?=
 =?utf-8?B?Q0M4V2JNKzRBWUdsMVZva1pKUzRGTFZBTDkvMSs0RHprVlpwTzYwREtLbVR0?=
 =?utf-8?B?c1lOdStYL1VnNWdKZHdIQnc5c2hOdFNWTDY5NHcrWGhocXdBZy8vVEVpbytu?=
 =?utf-8?B?Y1FrOVJwdEs0d2luM0R1YklrWjRvYVV2SkxBTERhRUV1aSt3cHBnVUFXUzY1?=
 =?utf-8?B?Mm5ISVB2UVYzV3F5V0xvdS9WL0VqYlVmQUpLSlpOUTBHcVVMRU52OVVuLzhR?=
 =?utf-8?B?clVRRGVOaVJNUEdVcFJ1R2dVVWI4TVJ1STNvVXhvaW4ySHlOM1hJSnZHdXlW?=
 =?utf-8?B?S0IzcmFxWFdtemVPN0tQSlV5dWlzZjFzTTVwWXVseGZManZUWTVIY3Y0VzRh?=
 =?utf-8?B?dmVnYXpqN091VjdaajdjTUk0VFRsMmJPcS83OHh3ZFZaUU40Y1k4UGZHWGov?=
 =?utf-8?B?RDZZU3ZQL001cUpVMU9jNTZoLy9MbHZVNzZucjFqYjc2Q3l1THJwWEhGVXhy?=
 =?utf-8?B?UmRHaU9HdjRLakh2MWpGd0c4ZTVHc1lqOGVhQ3RhSXliQUhJdlFlZWUvSHl0?=
 =?utf-8?B?dVNDNWdGUlNpSVA4SG1UTk9QUDIyN2VRZzl2MkdqMUF4dDk5SkNKZm1iRmI1?=
 =?utf-8?B?WlZWQlNzQ25jRWQwUjNLL21MYzRhM1RZdW1qTW1YU1ZUZVVmZGJFTElqVDkx?=
 =?utf-8?B?NGFaUHVKbzg5SDN1K256YTg5VkNvbjZJYUsyaldNZXRsMnh6Z2toVHVYNVBR?=
 =?utf-8?B?aSs5L1FLV3Q4V0N4UDhULzU2SGRlZjJLbXd3V0V5ZE4xRmlodDNpRG5MQk5V?=
 =?utf-8?B?TTZhc3NxQ0xMbTVoWXFkZjIvSjRacGdWRmI0U1VuZzdRWEM0STFyQUQ2RnVw?=
 =?utf-8?B?QktGTCtVR2xSME10WFdzNWduR1UyeHY4TlBLMWFqL3VwemVMRUNFYXcwSkFj?=
 =?utf-8?B?S1crVGl2cWdZbFFZa28yYTMvVDN6bXQ0QUp6S3lZaUNETWtTWTJqVnBTQ0Zl?=
 =?utf-8?B?NlljUUw4NkZOQU8yUUJGTU1rWHZHM2FMWitlRzBHZTVBRkZCeUVjUlNYSVJn?=
 =?utf-8?B?WG4wWlZ2VDBqUEIrZ0JXN2pYNHlkamd1blYvSXBjaFhzWWhPMmQ3VE5Dbk5M?=
 =?utf-8?B?NU5TZkJraTBBYUhReE03RHdvSDdyblBveWtlV1k3YnEzMmZ0bFUxOFZJTGxn?=
 =?utf-8?B?U09mZDFiR1d4YXlNaEZJaWd5T0M5M1FDNlE2UmVyRGcyRDBoSGV4SnBFSVR2?=
 =?utf-8?Q?Vq2bDebmAurtq3HQFI9lF0qBpduQuOSF8uJYn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 970ad128-003b-432b-b6ff-08df4033303a
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 20:34:30.7186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /VmbM5sk6BsPEA+fDFnrdhYIB2PyovQ5tSSBg+vJNIY9KmbO8q83e9S9moKD976Vr98599jELRCb+1n2WjiovD1zO2dj6UZnFORTuLgiDKDx0rLYvrQ5yyDvMnOGpf6z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPJPR04MB921366

From: Frank Li <Frank.Li@nxp.com>


On Thu, 05 Nov 2026 10:20:25 +0800, Kaiwen Zhang wrote:
> This series updates the shared device tree settings for the BSH SMM
> S2/pro boards to reflect hardware thermal qualification and reduce the
> risk of backlight flicker.
> 
> The first patch raises the CPU passive trip temperature from 85 to
> 101 degrees Celsius, increases its hysteresis from 2 to 9 degrees
> Celsius, and raises the critical trip temperature from 95 to 107 degrees
> Celsius. These settings match the qualified thermal limits and avoid
> premature throttling during peak operation.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: imx8mn-bsh-smm-s2/pro: Adjust CPU thermal trip points
      commit: 3992e1c9ab39f4ba0ba994549cdd6abb723da68a
[2/2] arm64: dts: imx8mn-bsh-smm-s2/pro: Increase backlight PWM frequency
      commit: b67b9a3fee5374d4c6ff39c757ff4953501d5b65

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
