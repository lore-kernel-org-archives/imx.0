Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795126817;
	b=Y/jp+P9JVrnyJwiU9BtYmDhI2DkDC04U48mR9+J8/4pe4WBtRGAw+Hosz66lCT3vy9++
	 UArEmmFotDmLV5x3uYFWCYbBOH76KKF0dJT/ZwWCF+nuzaz4FbSd8rmXzy7bVQ5L6E9Hy
	 VTFZialtUCCcSCXAbqbgrxRO3cxJ1DDIPZVDsJWF/oemqw6vFxBzFW8ofMyZfTQO5Uvwy
	 ohv2rnNCAAgpwaPmTPdaelZF77PjbrA0DcLTLRZF4l3kBJG1ior7ixBx/8RBMv+UNHV0K
	 UkKwWZnjOe8wO/1O88vfFLvRusyHU/KiX0QHWiweKHlpJM1NR0kisXWtbX8RWaTQmXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126817;
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
	bh=utv9XlBaNTXTPhqHyUE2Fvyi1VZn5uiZTvMLZjHgAIk=;
	b=Mv34j4Hre3LUVgUD8r0WlCbZT6YDXRBuD4wsRNzz/5sGKeFVf40Lkz+8CNS0oeUwJ3jV
	 Hf81fn25QUYAuUOm7Xi4qAhgKATmQUK0+2g5dRnhvmzhBoqCtvWby2GpNL/yGUVmYX9xj
	 VWnbFxKgZwwuYxUQttAL7dfM4pVjewgMPAUPpr/XK4IlHb/GtmmcmDF90ikRJQXfsQJid
	 co+Zzen8somMj+8ccPaljrAwltMh2Al/A7u9C6OeMG811vHo32vv5MRJW5eoOmIO9Jr5r
	 AHpC+ShweOAst1k8r4uiQo4nyDqJXfCGPhSWk+ixKJvz2Lnoeea2qGdeAWFeB2+RpnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=FyGqyL+U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.56
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013056.outbound.protection.outlook.com [40.107.162.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03763606A325
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 22:20:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03763606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=FyGqyL+U
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LwlaXk3l/crfqtMf23NXN7+t2+vNpenictpV16k7kLy/6CKAbz3vw4FLAjcpFKjxHvPRsIzBH9Fl9wG+6LMLeuebA7964kkPWFIkxEZ3Z/6a+O5S5wFPnA8eKoa3rKwPpMIHga2QJyraQ0+6Oz3fGFtL3Z4mXz7AMONFAI2/88M0NBfMVVntZvFmX/pHFXxKdXJaUYWcnip9FVQif91HK0BzTSS7kO3lCtpHSRE0JNcGsFHYQl27xHAVx2Ea9DOg4nXE+Gf0PM9+KhHPloeiS0pboeNBIiRT6MXVqkgImS8lkkciNegrF32380AZYEVxZPsotT554Vmkw5zUVyWeLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=utv9XlBaNTXTPhqHyUE2Fvyi1VZn5uiZTvMLZjHgAIk=;
 b=fEsUQFEIebS14jJVnnBz6CWWHLD/vwH0HN110dKGYH68EviOks6x6GlrO9i5C3ff6u6D91nMVEmr/yFwhJ5PeQG7jItSxIn3SrLnMaE7F7pnQcOUJX/jxOaoKck4pStd0178yz5o2iGYT5nbpdolppJOfdUldNMdToZxbbyzgdLv5fW4yXTFjThBwP43/n+Gqa0SJF3xb63zmX9I7K8ZKfGU68iAbPBfCsTzrfD/ILbpQPWpqC2Sg4+6eSaJdKqpo2TXtUQL2JXulBtl3K8nG9P6AFSI+xRSvPmx6NG14/Bk2sqUuZmHwQ9fNbjU3nzLq2a0zZ/kyU6PvTHSGn/qEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=utv9XlBaNTXTPhqHyUE2Fvyi1VZn5uiZTvMLZjHgAIk=;
 b=FyGqyL+U5ZM5z5niczPqYUkP5TIAH/VZ3s8AI8DU/S7VMhZ6fKdsB4qSN4TkoNFSKhum/55RitgC8kNZrI6yBzbE9k0+icw6dxSwx6jjZf//4LXLtYzHTT9SNHpFh8ldirbIgi9Xq4lunhQPlNJmiQYq6JVDONSBYqwLUp9y2zHlO23HjaruXfe5A0JplL1x346KQy57uRGtQLwU1UGOLB7S27cNIM3lY2lgp7pBzGG5CEn2Y4zmaCA+7OAO6WI2ZYPe3C+li3kkP62R8RG0Ls3P9bqaD90FkuVFcELt1bNFz1eUfMu04jSQJXKSaUWOpT/0Eg/Q6kK4etYcN8S2sQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PAXPR04MB8350.eurprd04.prod.outlook.com (2603:10a6:102:1ce::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 19 Nov
 2026 22:20:12 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 22:20:12 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Leonardo Costa <leoreis.costa@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 0/3] Add Lotus Carrier Board with Aquila iMX95
Date: Thu, 19 Nov 2026 17:20:03 -0500
Message-ID: <179512678808.1971208.6622429673624449917.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>
References: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR07CA0031.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::11) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PAXPR04MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: e4811d1a-9513-469f-6b5e-08df468b4742
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|7416014|23010399003|1800799024|22082099003|18002099003|11063799006|56012099006|261026121527099003|261022075727099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	+OQUzjnC3imeyYgLjPPK6j3HzPBecVKIFG8LO7VK0mnlYeyVqxq8mC19JUUP6rLxb8IRIFw6ZxnNTJ50Z4n75KA6bYImaMfjv+QObY0kgcOC5plFFGznTUz+dX/xuSZQ3sA4DydBHGRwCYE2v/PD9HLrwPEGqnrRvz6UJ0oGEQKIFGCatRmOBJdkthmIpqKbHz/viwD0cX2Rec1hOjAX8myZa634dAdLTUpQmzbq6H3pVPiY6bQ9S8p/U36pSKQb6Z0pn3fPoS6jLq9OnhhG4NVv+4rC32NFvVWo7FLltQEsk9/qD4CCLSUSeHHuVwUpiOh4lY/aKdJuHvdlvJ64MNPOcMT96DCOuqe03hDSA37JxVHAoMwFQZGDeXCBB+EFzNkOvzSbFt1A4Oz4dEz+epNl8Um33LTkwuLtFVvb5/Uj357eqxFxYLQjtoSJrugt5THcK/iSrg74DCiU/eCnCnO/ussYxsAoNKkkj+q1jlGKhPE8YsWlGTiFB4i1/ZIpJCusze3u07+b7zrZrKFtoXOPukGRx0Hyv0agJYg7Y6vAPEUYh9zIaHgdEbmoJZFjeXpun/Hy6OPh5beKBYBsphCuh9habUf+RmsLqlDqESmUNFcbvlSk9RQtEa0TExG6z72tBuIsykqLo4OPGKtR1nxuU2t5aOHS0MEXoGPLkdc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(23010399003)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(261026121527099003)(261022075727099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YW1pRGpyTHdXL3cxWUdCc3A5M3FidGpYQTAxcTFFbDNhVVdDNm1jQTVSL1hQ?=
 =?utf-8?B?a2lsZ1pxT1ZmNlI5NnlLT3ZLWkI0eEs4L2NPNituZnh4eU1XWHQ5ZlUvZ0I3?=
 =?utf-8?B?RGRnV0JXclJUdkVlb21tN0lNc1JsRDVhZDdOTkVnb3dPcC8wbElPRjM1ajBB?=
 =?utf-8?B?bHk1eGk1d0paRjZ5MkVkZnN3TUZWeHlpVTJpejE1TnJLbUNvVm5oZTV6MVRX?=
 =?utf-8?B?NUk3WmlBek9RTForUG11akdwOGRjdTJrczVJZ3JBcWhkbVhpbnRhOHBhWkow?=
 =?utf-8?B?VjhzaHUrR3FRdUNqRVV1WnNoUEUreVZLcGhNSVpZMzVzTHA5VFZYL3VxdG42?=
 =?utf-8?B?bHh0MnIrK2Q4blRaNElRdTRpaE1DcmxjTERLTTRkaXNUdDVnd0l3WE9FSDN5?=
 =?utf-8?B?dFRWelJjdmdjQy9QZEExRkNXaTJXRkQ2bGlmbnVuZGI1UGgxVCtnM3N2VnJR?=
 =?utf-8?B?TmVSSlRleXMvTlFTeXljdXlRV2s4L0wwR09pWmNqYjBhcUFKa1FGRkZQWkQ2?=
 =?utf-8?B?YWlEcDFGd2duOFdDUHhkdTlaZTIxZm01UXZoNkk5SXlnU3E1S2RCS3lHVEJO?=
 =?utf-8?B?eFlPTzBUZ2E1bFVleVBmK1EwaGM0YkNPSnFmejkxUTR5bkdTLzBCZ2IvRVZx?=
 =?utf-8?B?Y3lxRldXK1U3N1BIckNzRHR3ZzAxcVZZbW1oZHMxMUJRM1VGQlFhMHVrS1hs?=
 =?utf-8?B?c2FXZjRZbzlnMCswVWZad0YzWCtCUWZnVU9VZ0ROWGRua3VuTUVEZm1HS3JX?=
 =?utf-8?B?RFU3WDNRbkMwUndNeklSbVBwSE1Wd1ZZT2dXVHNDNFRvNmIyNkQ0SXNmb1BJ?=
 =?utf-8?B?TXRGc3cvUjgvc3NCMmIxZGo3QzYySmpWc0pTeFhNRmh0RzlCY0R2d1FMUGJ2?=
 =?utf-8?B?bjB6YWtIMEdTQzZkTUJjWk1MYVdPUFJUYW54VjEwYllTa21aT1pMNGY3ZVAw?=
 =?utf-8?B?V01WK2JnSkhncXpRZ09QeHY3eElYTkVSNDA5UjFHRnAxakFrc0ZCWXNWVmNB?=
 =?utf-8?B?K3k0Smswd2dxZ2tVam1EN0ZzNmxPTExqaVpBeERIejRYQndPUDdkQnA1d0tz?=
 =?utf-8?B?NDU3dmtxQTl3c2Q2SGZIN1cwWkx4SEVGTldwNmZvVlFHWlZ1cEpqMTIzR2tz?=
 =?utf-8?B?Uzk4dk95VmNNbmpBZ0xuaGxyNXl4bHlSbSt0NjV4R1c4d01NMG1ZRk95Vm41?=
 =?utf-8?B?c3BsRHZPWjVCMVJKWUlUUHhyUGlBMjBUc2xTYzV0WDA4MEdsd1RwSkdSU2pE?=
 =?utf-8?B?ZkJSM1MwcExMbHdBQ0EwZXo4NmRDbWtMTlQzRWY3VENIVXpTMURpWkthOVVs?=
 =?utf-8?B?R0VkQnJSRXRyTjNuNVdSYytwWVh1Ly9ZdHh4NmtteGVaY1ozQ2trbEZLVnYx?=
 =?utf-8?B?cU1nME52NnFMSStSZEpYaHZyZmpYRWRLMEdsZnFnLzFTZ2hSME44VWxSK0VP?=
 =?utf-8?B?VHdtRFN1aVRsbDh0d3VQaXVTTTJ3eTMzYXFSTXE4VmQvenJGeldMZDRRMk9J?=
 =?utf-8?B?Ui9DdWVxTVBybGUwRjdhUEp0bkl5NEc0bVVlZHVsN3kxSzdVK2ZyN2Z2VzQ4?=
 =?utf-8?B?OVh4QU95a1FyVjdyd0pGaTE2STFQUUVTektTNFBrUFNTMXkvUDM3YzlMT3Jr?=
 =?utf-8?B?RDNNYmM2WEtwd3FscEdONUsrSVI3dFlEbG04WnhFYU5zdVQxMExxcys3eDNZ?=
 =?utf-8?B?a1RLWElhMkY1SzByV04yVVBpOVo5NHNpVGE5dWlPOHNyRDdocjJRY1cvSVcy?=
 =?utf-8?B?RkpYSnA1dnY5QnJnMGJCVFM3NjI5N28vRnVYMmY4Q1Z0S1d5WHlFYWJGMFEw?=
 =?utf-8?B?R1loMHpsWGpyMWZCTzRRaUU5eHRIejJBMVZWSnFwVnROV1dPVmVpVUI1OGNK?=
 =?utf-8?B?bTN6RzVBY0NiQ1IzemFzdDB5S1NDWENqTC80UkxDV1BISUpOTjR4NFQ5YnV3?=
 =?utf-8?B?ZGhFY3JtVWhiVTNaaGUzZVN5YnZmQWdhallJaXQ1Y3Y3UDJXdzIzM1B3QUY2?=
 =?utf-8?B?cmhBUS9Wck5sdW5ESUV4T0piR3JOclNsRyt5cnRDZVlXdXZacHZVRFNTRHlS?=
 =?utf-8?B?WDRxN1VzOVJwOUpVbVRCU3o1ZG53SUM0dFhuU0d4cnpzYWJ5OUdwbTZnWWov?=
 =?utf-8?B?RWxuWVNQb1RSQ01JN2lJRm5NUVBCdUZNcHIxOXlxZWsrRVJYZ21uNEpnRndq?=
 =?utf-8?B?NlZTUkNWeGRSdUNVbUhBd3ViWWZ5bk9hM2VtTHFNQm1lZGljYUMwQmp4SHVZ?=
 =?utf-8?B?dmtKWmxWZVFZbHVBU0o4MXhFVkxPdUFKcGlDandEOVNFclJHcWljdGU0S09a?=
 =?utf-8?B?cVQ1VTIxd0NDT2VLVHpqYURYb0JjOVRJNTBuOHdQNURsQURmRTRpc3dXK2JC?=
 =?utf-8?Q?RF06z9uMs2jLfxKZbjKjjN+5IfCOaJjsiWqph?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4811d1a-9513-469f-6b5e-08df468b4742
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 22:20:12.0926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qRlRTX8gqH3rdakCFiAGflEXfZyL2I6MQzb/XwUtz57QTn38ckcdh+S5+VDg2hXO6tt7KUkQ00Mh+k79hgTHEOGPRY8sdDK7g+N1lP+JLYnCNHBsa+yMMgVzWyKa4wgX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8350

From: Frank Li <Frank.Li@nxp.com>


On Thu, 12 Nov 2026 11:37:32 -0300, Leonardo Costa wrote:
> This patch series adds support for the Lotus Carrier Board with the
> Toradex Aquila iMX95 SoM. Lotus is a carrier board for the Aquila family
> featuring a small form factor (Nano-ITX 120mm x 120mm) and built for
> volume production.
> 
> The board features:
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: fsl: Add Aquila iMX95 with Lotus board
      commit: 4c01c1f40ce6173662cad84ceb92239d9a4040cb
[2/3] arm64: dts: freescale: imx95-aquila: Add GPIO pingroups for the Lotus Carrier Board
      commit: 5096ccca696ed13249ada5b271c8a15b881445dc
[3/3] arm64: dts: freescale: imx95-aquila: Add Lotus Carrier Board
      commit: feda8a3590ccfb9febbb70a95d763e7775b167a3

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
