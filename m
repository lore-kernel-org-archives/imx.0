Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795125549;
	b=Q5Be2bE7Auy2e8ECKayCeelWhtya+0SBJW96lUUgYbrLi6+A6ZAxfaLOywbwPgLMPfIt
	 QQsizA1FBOIxDzibxMfEV+Hf8ipST25pqO2iAltuqZ1+qut5+QiSWC7FrHRT6ygBh+J9Z
	 FC8a6Y+ETB5bAjnT7za2dAeV+XNV9b9AwE4++JfwNhnauyLUeXLVUnCTs76bT6bBKVdtn
	 PAUJwdBD96YxVurj3kaGiQgQDNqlOtvs50kYF7dlyTRThn3Vhs1el2U0MuKVTLL4iI44t
	 JnDpEzzvg2WJqWpMG0chk1MALzbraM8hSF+9Vl9W0ir08y58D9TaaWVHDKWGXSlXpKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125549;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=QTFT8HnJZOHrpWR9ei3rYrrfiOvmIdaTYg853ANCdzA=;
	b=IjBPnDhXGATLU/WldWzzXRv/1wWHsQKyQsOkfho3yuqRzWIVIyzXGYQDqFrCHiXwXPeR
	 9qmcT28y7pX+vKZ5tI3GJREwYfb/rvCIrPHAuCKP3dW5xmWbpG8JxX1HHNYlBtM3Kj/Ru
	 upxGJ5XRouO7dSb5+ZkhVaDIB3+BQT5xkc5Bh2+oPoutT4Qbon+K0kHUK4UMU11AGRQzM
	 poHANCs9vxXphstcrf5JUGvVpFR2rx7I/X2W5cM6Pz1JNudghJOKDzw0Yhb8TGT1uPhTA
	 y1/jk+jTGTvlyjFzSV5MOWh1arK1bst4oxjFgd8mXMgQ+AP7gUg1FgXJRppUNTghoog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ZL4v7jQH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.57
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010057.outbound.protection.outlook.com [52.101.69.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F85606A320
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 21:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52F85606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ZL4v7jQH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tvQjVl6MHuFdKgnoJ/DT+yLcqjDi2dSfQdUOg8PnIMkyK1GG6A1Aiw0JGxye2sJboib85yORJSpbUl+DH6c8SlDmVyhF8aNJtWreKI8uOMicL3SIzET5MOupwBFbS6PQraRTnzKnnpZfOIiRiFrFr+T38zLDGhdH7e6qEnho/OdNRxUDEwy71QH4Hdg6uodtq5iUwB3i0Vx2rYSYmcr4dtSQq9IG5bWWTYaXYU0vJikbgKy7hH/Kr1551RyX7TmncXwQqGjfUC1MIqa88RDbIeWh6YJzFypylZIx9AtWZ4DIGKyp1FlV8gQ1MtU86zEObl426y4yMH1RNpCQP1sz1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTFT8HnJZOHrpWR9ei3rYrrfiOvmIdaTYg853ANCdzA=;
 b=Idzviaa5x9wbtnlSDenttqk2VMS0HMIzac8Jd0antSvx80et/yviX9LOlgtM4cjL6iW/QeAxXO6dpAUGQHfBGPDXyfF1MJYQqPFPVhHWH3+P1hOI7kJIFxgFLV4czts1yxVQhv3K0uB1B9gt50yRW539fiC0DCQqnW1yl6HYdwyY6auy5cQTXR5WT4yaoYGokgJ98UqBV2/HQhgsiCmNcv3Es5kUtlRBubcvzJbPwl6zXByrV5zxrGdMKBQSseSISny96mvz1T3ylWMbrghd+jgoKSRVUsovLDdX9Oe0LRGXKwffRismMTc9JH6zFNL0pOA1Pv9Bb57F9tfCAN9OUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTFT8HnJZOHrpWR9ei3rYrrfiOvmIdaTYg853ANCdzA=;
 b=ZL4v7jQHKzKCVVhKwE14alOEdY9RWv1oA9r/RW5FqlyRSRt4qKJfprcgQds3fLi8rU4pOuq5mS/ZkF4x/pfa1GPQZFN+CZ7YdydxQPmrwNprHZ3ePb7PEvo7wizlkwr+2EgQeqdAcCbS6GCFD9egtUQmZ68TwsWeRGWBYYX6buRuq96sQI2xFI5rPCNny+DbaLl/6RL0aaTqTKyHmXgtcwwGI7W3I/3B41if94I1RjMcGBH4E/zwBwSmq5TxgedKNX9Tg5ZQmvnftvew/pnwMo05fa5EOpBQWoT6mYI0+K1UhVGXXMze9eqivS9VtkeMW9c57nCPDjMraVLrh5Op1w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI0PR04MB11918.eurprd04.prod.outlook.com (2603:10a6:800:306::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 21:59:02 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 21:59:02 +0000
From: Frank.Li@oss.nxp.com
To: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-bsp@toradex.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 00/11] arm64: dts: freescale: Add SPI aliases to Toradex SoMs
Date: Thu, 19 Nov 2026 16:58:55 -0500
Message-ID: <179512551116.1936329.866731338009326452.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112150236.164850-1-francesco@dolcini.it>
References: <20261112150236.164850-1-francesco@dolcini.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P221CA0089.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::7) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI0PR04MB11918:EE_
X-MS-Office365-Filtering-Correlation-Id: 74ca32dc-af21-4ccf-2c33-08df46885299
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|19092799006|7416014|1800799024|376014|18002099003|261009221227099003|22082099003|261009223027099003|56012099006|11063799006|260925021311599003|260925021911599003|261026140227099003|260925022911599003|10067099003|261026121527099003|261028144727099003|261022075727099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	kA7cs8iaTVRAL7aipkQ+fk02fTScsRtllGC26veo3/GfcqUJMO8av6yjc8SR7VNFlyrIAfV9ocP1QCXVNfrbnalK5QO0EiLez9OlfDBPhG6fZDMdvm2kbT7CAkl0mYp9TdB1OBE1DxBYp4TCnLgyZWwf/M1ANVUa5X2XL25LV3RSC3+tYxEVYUohdwyXWtro7Xu7lzw8DwuQ3gb+7pZzRBmznUY8X/xBaWKyDwftwYhkBzlVnR0lEx6H6UUvHWagWyhBKpOxQ9aeJbKClPZBLRYy6vtBO9m51wCpWiCCySCbjwvkqgVlzDhHfUFKPS4pw074MvSBf1qbFyYIiuhwZojjpgixNCZZEIPO+V7GZY9AyFs3mLfTogjsQkeb1lkJweC6FfEB/tUCFVS3MrW1wHCOyp57OYDJ0UGONHt71xjoOaJeQm8OZWXGOV8C4zGPn6xc3AzayAyi4c1zQYcWB5oLFPyy+gR2ddSonrsWYJk5sc87MpZWm9fyP+O34Fi4cB1Absqtdq3ca4+/zRTR7lP9y+2Bojat321u7p+uAzEPksXb5RpkOlQhA6tR9qp+jV3QPy54WT/4/Yw8QACjzO2oW0m3VbgocxIuQjbbeOm0xb6RSUEOi8nrDVvzZ/HXeOcvRjV+Eyc0nSj3LAQo1xhBpHn/iqksSLNPH8RvSj0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(7416014)(1800799024)(376014)(18002099003)(261009221227099003)(22082099003)(261009223027099003)(56012099006)(11063799006)(260925021311599003)(260925021911599003)(261026140227099003)(260925022911599003)(10067099003)(261026121527099003)(261028144727099003)(261022075727099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTRLcG9GbERaWXpOSG9EN2xMdmRqNE81SjcxTVdnU0lhZ0c3cEdHN1Y3YkFG?=
 =?utf-8?B?K0tLeEpGdERaZTYxaUFPcjVBTDlLQXQyaUw3QUFJUEh1WE1sbEJYejF1RXpI?=
 =?utf-8?B?YzhHT3hxOXBNSjRhVjg5QU5xRHhRamZ0WHN5a0VQdFltTGt2cmxndzBVY3Rw?=
 =?utf-8?B?NHgxa3RJRFRmdHVpT0pCd0dWS09yWmo2T2NKemNVeXdMWDRpQlhqUk53RENE?=
 =?utf-8?B?Tm9WSyt0MVlmMG1JS3NJWWdMS0Q1WmNvdGpudi85QW9BakRCSkhvNEpnUlky?=
 =?utf-8?B?U25IT2xtRjN3MnphREFjUUhwQWw3SEFDU3BVd0k0b293ODA5SEtLdVpteHpE?=
 =?utf-8?B?ZlBieE1xVXo4UGxIbGtmVTFOdlEzdlNJbDlmLzkxN2Q3Wm1JSmtTR25vMlo3?=
 =?utf-8?B?Vjh1TFFWMjhTa2FNdWdFNkcvM24vQnZta3poL0YxUTFWNE83Zm5NYkJjNU0x?=
 =?utf-8?B?U0FTd05kVFhnUzZxWlN0TC9lZW94SEEraDNEQ3UxQzRtcUJxZEJ2KzlrK0tD?=
 =?utf-8?B?Q3EzWDVkZHlsNXo2ZWovM1RtM3J1bmt3cGt4cEN4YWlhcU5yNEhsQUtHYXY4?=
 =?utf-8?B?TlFHaFlJUkR6UVNJU1lmZ3FhcTZ4MHpFNmJVLzRtblRsaTh2eWFWMCtnRUNy?=
 =?utf-8?B?VkRJdFlZVWUvTHF3MzBxRy9Xbm1jK3hTeXBZazB6NlBYNks4UitxOWc4M1lw?=
 =?utf-8?B?YVRSMGhnZFBOd2NrdjBZY0Z1M1VITlY0Z25maTV2Vi9tRDFBQnN1eGlIMXJw?=
 =?utf-8?B?N21GZW1DZjFHWWRZcE5KS0F2M3hIK1gzeGZnenZESVU0OXR0VGRkVzhMRkNR?=
 =?utf-8?B?cThhZlZERVFJcVhMTWZEcy9DaHBjSVVHQmJ3YldqWmg1NkVsRHgrdkZydm5L?=
 =?utf-8?B?RlBCcEprekpUejlGYWxXWlFsK1BLa3M0V2tiRkNMR1RVUmZtU2t0MFZURjZQ?=
 =?utf-8?B?aTl0MDFJUGlYU3NQZUtIQUZ3OFB5L1BjL3RSTXpHdElhR3F0WEhyWDJTV0wv?=
 =?utf-8?B?Y3VCQUJDUFhaT2lFOUorMmtwZmFzcVR4bkYzeDQ3dVJqWk1qVU9acVh4c3dj?=
 =?utf-8?B?OUhnOEowTTdqWXdjdGdCd2hGU0tBSGx5T1AyODZmZzhYQzl3b3JBTXE3RVgy?=
 =?utf-8?B?SVRnb3lYYitwRW0vUDFEN0dzU3d2dlpxL2U0VmRnUFlPOFFFdHJUNHRnVWhI?=
 =?utf-8?B?aldBUExqVGNkTkFpOVpXVC9aY2Y2S1VoOUdSelkxQisxbW9RcVVCQnE4UlZD?=
 =?utf-8?B?K0tPcHpTK0xOU0xPZWxhbW9ncnN5b3ZYWVlFYUdob01KQW9yQmY1TGNRNW9E?=
 =?utf-8?B?ME50cC9USkZoSUtNZW5Kelg4by9NV2d3aHVZNFB3QWVnVFBydkNMWUNmelJu?=
 =?utf-8?B?NU1FUGtvN1IrNGxmYXlLNjRkak1Vd0xaV1RGOHhzUXYxbTNPcXcwSXRudnU0?=
 =?utf-8?B?MkUvT0lOZjQ5ejZ0YWp2cTEyL3ZBcTRvRmJleFNPSWZkdGs5aElvL0lXNUlo?=
 =?utf-8?B?RzhWcy9YRTF5UlFZek5ldFdFbGg2SXdJMWNINXNwclRaNVgzOThEQkpjVHR2?=
 =?utf-8?B?K3ZEOWNERmJiQjRySEVTNC9iOHlWd1hjNElNUjNIa09mM252Wmx1MkkzRlZx?=
 =?utf-8?B?UXVrWFF3WkNiUytYcVI3c25vUEcrbnRWVE1aZU8vUmNKdEtUM2dWKzRhU1li?=
 =?utf-8?B?QjBTMXhqTWtBU2RENkRCTUM0LzljYVRSQWlsYWFrV216aUhQdWlvS2UzWnRq?=
 =?utf-8?B?S2xnSzA0V2c2dDdhRHhKbUpBWkFFOURaTlRTb0sxMTd0OUhYVWlFd09TLzll?=
 =?utf-8?B?MWd4azEwLzlvdE53VHBzUzc3LzMzYWNaTVZkRmFmOS9kSU5HNFdnR25Ib3pS?=
 =?utf-8?B?MEthUlNrTS9YZlFPcXpsRXdqSzRPenlHdG9DZUZIQ3V1NGZmRmJJT2ZjcXFV?=
 =?utf-8?B?NXdEeDlCMkM1SEp0WWdWcUg2aXAwdFpFaTdNMzNvS01tNmJlS3lLbEx2QmtM?=
 =?utf-8?B?VjYwbGFsUnVWNDNvNGh6eWF2UlZncjJzaWY4QXBoTk1BTUpSbElRQ25xL2FO?=
 =?utf-8?B?eG9xTUg4VVFxeHQzc0JWaVNKYnJRd2ZOQXJuM0hBQUhIeGx3OVMvOGI4bkR6?=
 =?utf-8?B?NytWUGhwelI5bXNaWFc4aW0vQmtkekRsY1NaTmZnN3VyR2dsSkpVa0JyZTFu?=
 =?utf-8?B?TE5VQk9sWTFsWFJCZUJLV0dvdzFMeCtYd1cvOGxDMzEyRW9tanhjNGp3NGNC?=
 =?utf-8?B?Y2p5b3VORFRYbDNkVE8yOUN1NHJ1RzB4eUREU3lWY1R5TWRXbU1XL0lTUVBy?=
 =?utf-8?B?UURVRXlpUkhIN1M2WUhEOHU3VTFRUXJrcnRuMnlaNC90WmFUUjFWcDFyT3NX?=
 =?utf-8?Q?H3RRBG5CFpCFIH7UtIym6kbQnMBijU4pbuN97?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ca32dc-af21-4ccf-2c33-08df46885299
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 21:59:02.6222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZfM+BMOk8pg+kO6sZEQukKOMpBzExM3ZGjBnIOk+LIe6RiD8VZmhMrRxZh7W15vYUTzdm3m8x3+4tShyEhTLlFVNjMPpYsQYxqy6qRM2jqsdwCQR73vgOJ2F5OiYqx2B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11918

From: Frank Li <Frank.Li@nxp.com>


On Thu, 12 Nov 2026 16:02:22 +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Toradex SoM families (Verdin, Apalis, Colibri, Aquila, Lino) and the
> SMARC and OSM standards define the interfaces available to the carrier
> board and their numbering or naming as part of the module pinout. The
> Linux SPI bus number instead follows the SoC dtsi aliases where they
> exist (i.MX8MM, i.MX8MP, i.MX8QM, i.MX8QXP) or is assigned dynamically
> (i.MX91, i.MX93, i.MX95), so the bus number in sysfs and the spidev
> device name do not match the module interface.
> 
> [...]

Applied, thanks!

[01/11] arm64: dts: freescale: imx8mm-verdin: Add SPI alias
        commit: 67ede8e4f5817d98872a1bb224175a61d6faec0a
[02/11] arm64: dts: freescale: imx8mp-verdin: Add SPI alias
        commit: fd2a135b8352aecf1a35489c6848f106425ce61c
[03/11] arm64: dts: freescale: imx95-verdin: Add SPI alias
        commit: 67f5f1827d8559de3d8589a39e3bdc70b02abc5f
[04/11] arm64: dts: freescale: imx8x-colibri: Add SPI alias
        commit: ff2dde060fbc8febe8284d2e7c79617a464bdd6c
[05/11] arm64: dts: freescale: imx8mp-toradex-smarc: Add SPI aliases
        commit: 782ccc9fff4394dac008a96082bfc4aaabcab3a4
[06/11] arm64: dts: freescale: imx95-toradex-smarc: Add SPI aliases
        commit: 41d378d964d35a8dfa50bbe6f4598f5a6e61f27a
[07/11] arm64: dts: freescale: imx95-aquila: Add SPI aliases
        commit: cc5bac3261178499bc158aeee21c1848e14c31f1
[08/11] arm64: dts: freescale: imx8-apalis: Add SPI aliases
        commit: 5854bd6007ca4a25a14f146a00f555c9a6f871a9
[09/11] arm64: dts: freescale: imx93-imx91-lino-common: Add SPI aliases
        commit: 7a5680d5875f8a9bf17a0c732bfaf67be947ac9c
[10/11] arm64: dts: freescale: imx93-imx91-toradex-osm-common: Add SPI aliases
        commit: fe7b0e32a0acf0072ab8289d9ff7a3a1ccd0780a
[11/11] arm64: dts: freescale: imx95-toradex-osm: Add SPI aliases
        commit: ec598555334cfb04ff734f1872f3693236a8f28a

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
