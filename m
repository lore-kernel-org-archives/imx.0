Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013009.outbound.protection.outlook.com [52.101.83.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18C713B293
	for <imx@lists.linux.dev>; Wed, 17 Dec 2025 15:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765986648; cv=fail; b=S7IMCEnT9w60fCIIMrCA8f/IkLIcMKWSCv331WIscHoTNIrFJHMW52j8UCAYQ7TPt+ZUTEsuMx+t+hSxQwjnwiOm9jNfD5GEkj6RwuTC3pGYc8978+QyfnTpEoQuPJ+x2roFqYCApF2NLSwCpnIIUwwqHJ3QezIe5x0QDA7BWVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765986648; c=relaxed/simple;
	bh=gfSGhFfkRJXm8XzyazRxRjSvQiqmEvaU+z5zYdjVS/A=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sDPhuqN0tFo6a3s1ytWMgsLcN9zwSXhZwmDj1E+stm3FjqX+thWBfSJRVG8+jR/6QzjDLpLhd5kmIXmL+Sru718o5DX1vm/tdpAR6GtRR74IhbJ7Kd2uZAu74e76WPtx2ZFPyjZsF29YZAwm0K8xF4MbUJTYoheIx6Ttot4L+AU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=O6ugsI7N; arc=fail smtp.client-ip=52.101.83.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="O6ugsI7N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6XTQYNaebDETYpMlMmsISqqNdqAsCFZ0q5N/YtQP+KXhpyHiXfdUfDTd6p7TAtxRw+uL/D9QuxUEV7o3QroBEMrioK4njkiBVF+aM9/9q5Po3inhfhHt+vI0WMkyiqInFdD0Tb5cHUFpKZ1GQT+3lV+XxcVO26I3NCLYfuejlG7PrC2dcQmPWMSbHX1XnryR2T3x71ehvciqPHErWVM+7Q4Y26A9Z9BmBzgh87IvpwRtanC8xIeVtrNWV8hD1xm8c2P+EkhVr4lo30TOUsmehOS7oQKxuyuJRhZ4iV9zC1r9XbvzZCGKZhGJQC/pGqNc6URIg0cLmqi83kXcPXqSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+cTA1V2LD6m2Fasii7fegyF6L/zOAD7lApcWvAS7jjw=;
 b=sc591zYvWv+FgHP6YRJL1d8JQXJf/b356yZERfT3Zi2MuNiS6Rk2IQOb2V+SNdTuI1dLFLHvQ0++prkSFAH17Tb2PRdqlh7bmbyQGZWodPeHdn4RMxOR984w/3giZjzkcxTB+7w/msEqHfxEa4hK1yoq4GFUAhPh12uHviJWc36VsN+8y0QKl6MNO3q8GV0HRYHeTkoebCwzSEDutXo6JY0F0pOjjZ2DdXUz7fRgwh8LhzKEA5AHNGrHMlJ46xLhAyqdImi2ltiyFnsDwQMKnfkLrtRakVpyfEXESm89jeq52/XxE2043DrMfOJhuo1H1V0Lop1NGn/sxlXdoYVE7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+cTA1V2LD6m2Fasii7fegyF6L/zOAD7lApcWvAS7jjw=;
 b=O6ugsI7NvMccksPEFlNdtq6j+v2qIVM6tvMeIeYXSkzqUXbCuJxIucwn5Xl291BMoHuCGGbCtoB6O5iztD4n7dcSbZ6lGmckWv58je2l0IDSRy1BOvTvs+8eOyZwIxAnJM5Q6UjnK0nl+bllY3KR7z4zlGF+cyVGgTdLpQ7VZsdEbWVYZDzFAzqKzsWQcXgkhAYYB8sLRqz29krYedYTuHZeX9UfX+32llygifjbDhAsE5yqZ+Zju/LXKwUSPUji/ZFWkyoqltuGInBPkF1X8jPKaBfewu5VTAK51fJCVYYxsUTeJF1e/F0f60myEjjPB/i66p27YH+yXUKHFpz8lQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB7508.eurprd04.prod.outlook.com (2603:10a6:20b:283::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Wed, 17 Dec
 2025 12:42:44 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 12:42:43 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 17 Dec 2025 20:42:09 +0800
Subject: [PATCH 3/3] soc: imx: Spport i.MX9[4,52]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-soc-imx9-fix-v1-3-0c763c2dbe29@nxp.com>
References: <20251217-soc-imx9-fix-v1-0-0c763c2dbe29@nxp.com>
In-Reply-To: <20251217-soc-imx9-fix-v1-0-0c763c2dbe29@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGXP274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::19)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB7508:EE_
X-MS-Office365-Filtering-Correlation-Id: 11c81f3f-31fc-486f-eea7-08de3d69c5d3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TE9iUmZnMkFpNkF3NUVXNUMvWUQ1VUdJVTJTQzFrcnROTzZiSE9PZERHOTFW?=
 =?utf-8?B?VzFrbFRJS2JzeWRVYURQc2lNMXZ0K3d6UHBON1V5YW5GR1pKMnBqdXZybEF3?=
 =?utf-8?B?aEd2bVA4NDJFeXdrdVI4bmw2bFg2S2MrYkkyNzhnTEpHbUlKWjJzR1RJVFd6?=
 =?utf-8?B?ZXJDUFdGamh0akNwQXFPRmtUUlNuL21PRkwreGY0dlh0Y3pjdEliRU9aNUg0?=
 =?utf-8?B?TUQ2QnFaaHRRdFI2NkNMaFk1MXFuS05qTmwySWJacEpXNkd4Q3dXa3lHQ2VF?=
 =?utf-8?B?NU0zMUM5M2ZuamJRcnF4UG92YVp3QnZzVEh6eUlHN2JhM0pCeGZWbk42REE5?=
 =?utf-8?B?YjlmSlJ0SXVTc3VEZmlxK3kxczE2Qm5oS3ViM0dNOTJKNkNCY0RwdjRMNkIv?=
 =?utf-8?B?c3JvWFZ0cjl0T05BWk1PSk9IYlhtMVVaSzNwdW56UjU2b0Zkb1o2YXdtTUEw?=
 =?utf-8?B?UjhiVWxqbEhBMmsvSFQ4RTBKZ0orOExkN0ZvRERndE5lS0VLNTNIK0t2NFRm?=
 =?utf-8?B?ZEowY0xaQ015MXZINkRqLzNRWDFVbVdpeG5ydEZoRzYyTkNGbkVXdUxVV0Q3?=
 =?utf-8?B?aE5MWDI1OW1YZHNVZHFXanpjQ0wxa3BNb1ZuWVFtYURuTTcvbTNLcEREdktS?=
 =?utf-8?B?K2RjY3hrQy9wWHVkRWcwam9kTHZnUzhYRDJNK2F6ZzVHYTBRaWxhMWFEYnBi?=
 =?utf-8?B?TU14TXUvMlpOaC9tUkZsL2dwaHpLbWRTNnpzbHdFazhwNlFWZVhCSHhoVDBP?=
 =?utf-8?B?bnoxMCtsNEc4QmxCcEVvblJqcWtqd1FxcVhxLy96NldFMjdLMXhCSjlKYkdo?=
 =?utf-8?B?cHNzRTcyVEduVXZXUVVJUUZrdjE3T0dOTHhKc1piWFg1di9ZVHFFRHh0Nk5h?=
 =?utf-8?B?cDVMVDRxWnZESSt3bHhFMHlWcU5qVmJ6bUxRdnBPckJrTndMQ1BjMWlOTExi?=
 =?utf-8?B?VmRYRFNQT29Zc2hpQ0hyM3pGdnhvZCttTGh3eE9tTFpscGlYSlowQUoyeGFu?=
 =?utf-8?B?bERxZGF4MERsckJTdDR1ZDY3bnNrQ1U3VjA1ekUzd0ZkQWg0SDM2NXhFNXNJ?=
 =?utf-8?B?SnFldi94OTFEMlNwaUVydTVpK29jazJLQlhiZHRJTS9XYzcrdE5jRkpFQ2c0?=
 =?utf-8?B?NStrSmJzREVNM2JMQVdjelBNOXM4SDJoOEpWTUFQMUZ4Q083aTdnd29PN2VP?=
 =?utf-8?B?aXRyTFNvY2VvMnVsQURkbkQrbmM2R3JjdHZaQ2s3L3R1STl3MDU4NENHVDcw?=
 =?utf-8?B?WU0wRjhRWnRPZDJPWHN2OStOcnBHcmlobnRLZXRUZlZaMkVBd2I2dG4xaE0x?=
 =?utf-8?B?Z29nMDc2ZWhYSnFKZ1QrZ0llNTBwdmZpREE4bDJqWjc4eEZyc1ZPdFJIZGZE?=
 =?utf-8?B?N3VxZVgrbDlaT09rU25BQ1ZBWVlzRDFkK3FTT0R1bjZwWDIrSE4wblZNbjFB?=
 =?utf-8?B?ZXEwbitaK0gwWDluRVM3WDZXZW5VTGtNalNZTVgvZmwxUGxsM3RHSXlSL1pF?=
 =?utf-8?B?UVhwUHVDWUNqUUdBYldDdEc4aTIzTEVJYjhMOElqM1pPNjkzNnNKQUdJZmlB?=
 =?utf-8?B?ZlVNQkthTXhTWGpubjZyQS9LeXNyL0d0MG9EOGhxbGZQWHdjRWJnOHNGNlBH?=
 =?utf-8?B?dWh6cWZnVmNNQ3FMMk1YRkxOSnYxbGs2K1ZVd3ZtdEg1TGFTdWZoaTV6WWVZ?=
 =?utf-8?B?UFh1cEgwOHl6S2YxZ3NWR2w2QW1MTFBocFQ0SkxQQ0VIYnFPSlMrMjhyK0sx?=
 =?utf-8?B?NGFYQWlqcjhoQlRHUzJ3NW9lT3BYZ0FoRlU4SFZaWHI2STcvcFpGQWdjMTNR?=
 =?utf-8?B?WmlHbkJ2QWpRTVBWOXpBQ1dxT28rN2gwVFRMc3lFV2JJTUJZeW1ybkdLWFZU?=
 =?utf-8?B?Z3dCNmZVL2dBYnhkTnFTN1czT2E3bVdDZEV2Umk4R3Z0UG1GQnVOWExKMkJa?=
 =?utf-8?B?ZFJmMENZR0dSVW5RNFg4eWFBQWdCNVBYeExQYlArV0UwdU5nYTlBUmtNN3F2?=
 =?utf-8?B?dXRsWHJpSjl2bktoUFdpMXFlRnMxMEZCYXFoZzVYOG1yNnRJQ2tscjV1ZG1Q?=
 =?utf-8?Q?4tGOie?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VCtpb1d5OE5BMXJNMEFoM0dnS0FMTHpjdmtobVVxR0xvSHg2YllQYzRjTFJJ?=
 =?utf-8?B?aEFlOG42cm5EYWVOOU53Vlc5aGZnVjNtMkN5YTlyVEhWM2M5Nm1BYjBKU3RZ?=
 =?utf-8?B?bWUvK1JBN0IwVVJBNmZ2V3FBTm9lTmdtMTdtbC9OZmZ5OHc3TW02bWdZemtv?=
 =?utf-8?B?aUh3Q0VBYmlaWGNRVWc4ay9nK2hhVERXaXpHUmVCZ05Cbmd5R25YOG5CSEJo?=
 =?utf-8?B?VEVraWlnKy9xdVVsME9FZ3VwdFRPOFNMNGhZWTAxbDVvVVh0ajJHeHlBTUFw?=
 =?utf-8?B?dTVocHcxaUR2azU5dVpTL0lZTlpCVHFXaHQ2aHpHQmgvd1U0cGJJWll3M2JC?=
 =?utf-8?B?TnQ4c0lUdUozVHFLVUQ0c3BkQnRkbFkrdDBoRU90RGlOMCs5a0lwTEJnSG5s?=
 =?utf-8?B?RXc0UXowYkhhM1dWNTBGVDdKTlVjZzhlNE1VclVRZ2Z0SUpDSUdyRitoTkoz?=
 =?utf-8?B?cjZXTVBhY2F3MTNZSWYzbWE5M0drV2lWOHNkSExMTVBEN0pLS0kvM0tqQWUr?=
 =?utf-8?B?eldoQlBzbU5CT3U0VmxHb3RSZHB2OFlxZHdmSHBKVXRQOHVHWXpvTE44OWth?=
 =?utf-8?B?elJLaXlEUmNRNGVtVnJpL1RZbXpQcVpiR0JqN3JkVmswbVVPOVdXeWk5M2hW?=
 =?utf-8?B?OHdYNmNpQ0Y3dHRETEl2NWRpY1pkWjZDMlRzYmpldkdHb0wrQkFzZnNycDFU?=
 =?utf-8?B?WEluMlpvOFlhY0xsK1Zpa3R2TGRhT0xBek1ZNUNFTjRrbldNbHNTaU1ZNW9q?=
 =?utf-8?B?OGlTT1prZWRzZGhzY0NkckVqVTRPb3p4WmVGUFEyTnRaRkRoTnhYdGErTUVI?=
 =?utf-8?B?WURXM1NFTnlVNzZBL3hueUJRVk9kUG4rM1lISW1vaE1aUkRydHg4Q2xEWjV2?=
 =?utf-8?B?UEdwRGZQZVBjMGQrdC9aU1h4UUpYaE53YTJ3Rm1pMVBhMmdHaFdHNjllOTRT?=
 =?utf-8?B?L3FmSWlBQzJ5TWwzdjFyejBnWEplVFdGWkZOQUs5dkNyeEk5OFlFWVNzWEl3?=
 =?utf-8?B?U1VyMWd0ZGZMWWZiTnpncTZIc2wvcUcwSloxV2IzNi9xOTFHdEo4emYvaERB?=
 =?utf-8?B?YmI3WG9Ya2M2L0p6d1RVc09jYWJvZmVzRVQ2SG9pQXBFeVgvaTZtNUFoTlZv?=
 =?utf-8?B?R0hqZG9UYUhUd0RRSFAzdjZzYjl0WVB1L2NlTUt6ZklXQUdWNEV1V1JHMC9K?=
 =?utf-8?B?YmNXK1huV3Q5cVFJUThLNXZFMjNZWkNHclAveERFN0U4ekE1Mkp3L0k2aGhT?=
 =?utf-8?B?TUNvcXY3dVVReEJPVGtwaDN6VWJ4MzVqRmFhN09iN052RXBBMUNBN3FZeldG?=
 =?utf-8?B?S2FhdVQ5c2pBQVJqb0dqU2NYV3Q3Zi84T0xkRDZiMUJIdG1BUUpmRjZWbEw5?=
 =?utf-8?B?NHBOM3hiQU1LTE5FWmNEUHNsUmRSYW0xYmo2b2hoN0NZdDdiaFlCcVF6Qzh0?=
 =?utf-8?B?STJqMk9TNzUzYVpjNExLZUVIZzBielR0TDcxNzBGNVhpS0o1S1hIWkc5a2VH?=
 =?utf-8?B?RHpBSi9SemR0NDJYRkk2NjNtY0hpem5WTzliMTVERitsd1ZaMk4vZXJaRmxE?=
 =?utf-8?B?UWVOOXJzeml4bzBkM1pFSWNVWVk1QVZUSGNpTWFkVEZydVViWWI0OGpkMzNF?=
 =?utf-8?B?ZnRiUGcwc095NUI3ZWp1MkM0ZmZrT0JpRksyaWJ3R200QndQTFZnV3pobjFU?=
 =?utf-8?B?SWdIblFLWitZbm9Ebm5UNlN6TEJhR2J6YVhmS1BXMjhCYVBrY3pCdkZnY0FP?=
 =?utf-8?B?VVpINE9PN21HWGZGWmF4RzFXZHlYM0FUTGVoN1lQclVXdERzMDZpWVBKSVMw?=
 =?utf-8?B?ME9paHI3bGgvaG1XcXdRTFhBN1VGSGtzeGxtdEhPS050UGN3ZEViOFdXczVs?=
 =?utf-8?B?ZE9IUTVXUEt4bWc5Yk5sM3JwNEs5VUFqT2ZFUWdYWU5SL2RjbTJPUlFOQWRv?=
 =?utf-8?B?SGJxY2EvNyt0UjRmc0FETTNTYVcvTDBDei9Ya3Irb1U2KzhPLzdwejBpVGRV?=
 =?utf-8?B?UU9WdlRrTDYyQ3FPZGVjVFJFNDMxRFdEWTZpRGkvb2dXSU1maTNVcUFqdHJG?=
 =?utf-8?B?SVl2bDlBNUEvNkZ6eit0bDJHam1XaVc5dmRoVzF0NVVXNHRKck5uam1HNVJx?=
 =?utf-8?Q?rOFLynV+PR4qbOcLGTPXZH9Ud?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c81f3f-31fc-486f-eea7-08de3d69c5d3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 12:42:43.4970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aUMV4zjHq1X9628fT41OIQ6uT3rW5oyDS6+f//JJvm9fMzd9gsbKL5J6BWDOIgUZxFVlU2x4epNmPKjOWXXXpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7508

From: Peng Fan <peng.fan@nxp.com>

Add i.MX9[4,52] machine compatible to allow soc device could be created.

SOC_ID is 16bit format data:
 - i.MX943: 0x9430
 - i.MX952: 0x9520
Update SOC_ID macro to get the accurate data.

Co-developed-by: Jacky Bai <ping.bai@nxp.com>
Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/soc/imx/soc-imx9.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/imx/soc-imx9.c b/drivers/soc/imx/soc-imx9.c
index d9a686299c5f710bb9988c55ed601fc9d9f19229..d67bc7402b10e2966ff77cbf3b15c087540bd377 100644
--- a/drivers/soc/imx/soc-imx9.c
+++ b/drivers/soc/imx/soc-imx9.c
@@ -12,7 +12,7 @@
 #include <linux/sys_soc.h>
 
 #define IMX_SIP_GET_SOC_INFO	0xc2000006
-#define SOC_ID(x)		(((x) & 0xFFFF) >> 8)
+#define SOC_ID(x)		(((x) & 0xFF) ? ((x) & 0xFFFF) >> 4 : ((x) & 0xFFFF) >> 8)
 #define SOC_REV_MAJOR(x)	((((x) >> 28) & 0xF) - 0x9)
 #define SOC_REV_MINOR(x)	(((x) >> 24) & 0xF)
 
@@ -68,7 +68,9 @@ static int imx9_soc_probe(struct platform_device *pdev)
 
 static __maybe_unused const struct of_device_id imx9_soc_match[] = {
 	{ .compatible = "fsl,imx93", },
+	{ .compatible = "fsl,imx94", },
 	{ .compatible = "fsl,imx95", },
+	{ .compatible = "fsl,imx952", },
 	{ }
 };
 

-- 
2.37.1

