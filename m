Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011063.outbound.protection.outlook.com [52.101.65.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A882A2F7EFC
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 16:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783959001; cv=fail; b=VliVvL4X39QmyChIHIUDNgXpaDpLsD/30NRLYGHulJ+YYv1JgKAAMCuCUxh22s8ZXiVIGRct5osRShumfq8q8dr1eoFMbxgCMg7/MIIq7NaEp9elA2NVINZhJBVViZjAwqHaKjA4fFKzL5GfZiLabtupoaVqLqZw2q7LtnXev3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783959001; c=relaxed/simple;
	bh=vUIUTiAUWMYPwG2o7t0ARAfQnF5Mn1UmMoeVIBweT78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HOHdx8sTGzb1JkdOPhr7BN7Wx05kzlLfTIwmPfNp/3EPauckEQ3T7C3xSi2CP72H3nw2j8O1KOzTxIk6NDF4nBAQ6atQ2aHXJJnbQpJhZBfkHJCL4E8nkxbmKpEhf2v5T7Mn5zaeS6HWN6eG2JlYP2ONQx2U3yMaESReR9ReQ28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=B9QrNwkp; arc=fail smtp.client-ip=52.101.65.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="B9QrNwkp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pyVcWgJLdtBP8yIFDoOwmvpvwlPxrtg4foID2tn8dr0HO2FfkzogYYr6RhtVzmeJYJiue34KjVZBfKNSyWCEDeHq6UX6SZmLvi6j2e0VLmD5Z706wJ/L08M52hlX2wQC6R1YAajhqijUGjZbZ1FF+Jl1uAncCsOjzXiCz0s/QmYTo3HGFAbf5HiKtsXMLRUXqFsuZFQiw8Ep8miV9aJYhWCjai94WDzTdl2bmfXf0Y746qwSAUQi17d8PJ3MuCiW2F/yqb+82VcZAOo2jEYomn2xDNdJhXcKDg2nXKLaZSAU5nEZU82ROuLgzh8hLVRjDIcey3YQvSSBNhSuSRJUPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6E9PBujV17hOQsz+J2zqnoRch8f/V25Kqy1JVE8crKY=;
 b=v6l/Pg8cLJl6/aWLIs5tGRrl0kJQst8Yv2tHvZc/ewlbdiSJMvhi2/sBxqO4c7TjF5iI9x/Dp0ieGz2BnBQpswdHS5N0xK36Wk/S/0AWuKab9r2l3lWrlbxIF1DwNejLHBMHaJsp/D/cyUIzJG1yaHNPXIZQI+Q/LzvTpLv/X4+6DFPnfGU2wpjoPGy/4OVKuFlEHi2cpHM9RlzCX47nXhxeX1nNq0KAOdLGZOLO6kMS8k2wgaHzHM0Jzc5SD3As0gF6fiGW1ObzZsiQwhbnKJCswLO4ILj48swBKplLYDrLIY0wFbcH/8kE1CPOMQbBs+U2cTR+YXK8nlfFzRAlag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6E9PBujV17hOQsz+J2zqnoRch8f/V25Kqy1JVE8crKY=;
 b=B9QrNwkpB0gBDXD3+61ybVSa0RDoCt49d+ioDWobGNFRyJL8MH/f6p+PPjxhuRSxsBcIqjJXlgnJqKrQx7qZtgp1aC347UYNKdoMc46hC5BgBHUNa4eZpO8ANpF19HLbt+lfHXK7RlnU3T+CEwX74oIzlTmj1SLkqcH5k70cuB4CQzcloG/nnsdEwKUYovXYDPr1L1zy8N91yNB4tcEvLh4S2QVRVznRVjveCMrcCsVv/oi+XbhWch39BI1+7DahNXPBI8YjudcHrfWlLqJxNOlKA0DiHt+wRtAFE2Q+R+hAjAd7rvMr21TRGanwyTesePEjvUPq487MODzU3L8teQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB11388.eurprd04.prod.outlook.com (2603:10a6:10:5ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 13 Jul
 2026 16:09:58 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0181.019; Mon, 13 Jul 2026
 16:09:58 +0000
From: Frank.Li@oss.nxp.com
To: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] soc: imx9: devm_kasprintf error handling
Date: Mon, 13 Jul 2026 12:09:51 -0400
Message-ID: <178395898693.439075.14345726199854786283.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026070610-regime-badge-e99b@gregkh>
References: <2026070610-regime-badge-e99b@gregkh>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR17CA0036.namprd17.prod.outlook.com
 (2603:10b6:510:323::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB11388:EE_
X-MS-Office365-Filtering-Correlation-Id: 39314a17-51a5-4641-a8b5-08dee0f92f63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|19092799006|23010399003|18002099003|22082099003|56012099006|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	H5vc4XZMA2BNa62GCWHUok3DW3UYwUtGRs1UyX98LurNf2SAsxBTKiPpL3etUgo1+I5xORU1x+Yj0RVma4HSD50beHYnBM7MZngkWNcuGklftHx0P4cOx7ziJuLjnUAYe8fyZdn4yqpCNCi+4oVCyZ0aAh/rfoZAT4nyXBDYfQWJivHDrHoGroiR/qWCUNG9OzJoBgOghWeo1k5mDw2yD9YV7VZIg2yAO1olSzwvh29EFtUhP3dI+W732SavcYgfyT9Qj5VQ8HDtFIOQZZvDZ2n8ZJpQvERzmQz807uGiAxwuvxH3xfUX3kb8wEXO6wYj1spR3t9Tn291Lk66u7roJGtUym31NgHVJH0uycLxNBnv5+BUmGpSH0VeuaIAZkfbIdg6iJdPVy3LQS+W64jLmdlzScqCT/JcPeCLf8wxfN28qE9CloX9ocrGgkR6Atm+e70p8iKWNhQKfJNVLkYrZ+jazX1Vc36YbIVcWuJKUhE1kVw59PM8v4hzazb7yO6XUH5+BMZlg92VgFVlkatOUuu4zVpSd6Mgekr9KdM8soBrj9UGbe4LNjMKqWq01p+MF9XAv4t2PSS34GjrU3ve66MBEbm4MFjcKRlKni2NLJo7RDR4SrSmV9nmL20ApllRLjMu0nqs2JFpNHLKa29sbo2nbegLmGP9k4h0zLV0kc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(19092799006)(23010399003)(18002099003)(22082099003)(56012099006)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkxYNEN2YTZLOXArSkRsaFV1N3B2SmlFMThPVW5YODV1OElveTFkZXJnVnB6?=
 =?utf-8?B?RUFacDM5WVNBNXRHQkVVbTJKUXRQbWM2M0lSY2VwcnVPRjJmakU3SkV5UUVJ?=
 =?utf-8?B?WTFSSkZVbVUvUXRxUG92Q3g2YzJkZHpEQStFZHV6S0oxT1ZxVk53Yk0zK1Fk?=
 =?utf-8?B?QmYvaWdib3pWRElHM21QVGlaWTJuS3RBQjA5M2ZsSnFUTkQ4TDVzQ2hoQWY0?=
 =?utf-8?B?L2N2VUN0S2NsVnV1ODhsN0RuOEk4S2FRYlhoK1JZSGorZ0pyelFVS0wzR200?=
 =?utf-8?B?ZjFzeFMzQmhUcldzNW5xUTNRQnNRTnMzMmlUN2NrTUhoaUY4QkVPVHlieWE1?=
 =?utf-8?B?MUk0TVZ3TWlwSll6ZEpySmZ5NWNNVU5ML3c3NHdneEhmcWdaZjRIZTFLbUQw?=
 =?utf-8?B?MkFLNW1RNUtXbzlOOXQvMmxYYXNQZXZHNktZRTNUTVl2SVVxc1NiZTVZVmJv?=
 =?utf-8?B?dEh2VmxSTjA0R01yTUtVQ0ZoWjFjL2FVRS95eHhFckd2RTZ6WUhpNFBRMUlR?=
 =?utf-8?B?dzArbWpzQVpLbWtTZUhMWFAzQzUzSllQWXhsUDVYVWYxQ29XNXBYcGFCbVYw?=
 =?utf-8?B?azVqbGhsanJNNkFqUUJkeFlyVHVyWFlxOFAzVWNDT1U1QmVWdVdVNmJnNDdY?=
 =?utf-8?B?clExYmxOL2ZkTGJyaUx2QlR2WHdyNzVzR0VoOE4yMERYSUFRS2ovcDR0SXZo?=
 =?utf-8?B?TUNWZEt3Z3o2UndlTlAxekM5WXJYMHZmSE9HWnlZZWR6citQcHYwcWpBVmFE?=
 =?utf-8?B?N0NZenhCZ3IzUXdQVzVSeklTR2FEdXVGSmlLRWQ2RzN3QmZCTWdsSHNEY3pQ?=
 =?utf-8?B?VTNXODNlZ01GT2QxWjZtcms1V1h5dmpLa21IM2MzWFVlaTV1eEdja1ZPSmRx?=
 =?utf-8?B?VlFzMjFmNGxEMnVkU1RLRk9jU2NqcTlKYnZ5eHMzYTk2WjF3QWNFUHlyTjIx?=
 =?utf-8?B?ZlplZ2NnY0VwcEVmS3Z6ZUxMOHFMYW5KYlZlQ2pxWXlUQ0hpbmthTENJZExM?=
 =?utf-8?B?ckxhdUJoYjRoNFdUYWlLZHRPSWp3OVg0N3pYM3E4dFhXaVFOcVJteGgrazhV?=
 =?utf-8?B?TWxlZE5wVWNuVkw2amFNdVo3dEsrWW9WT2Q2a25QRyttcUxBam1VdGwySm83?=
 =?utf-8?B?aHB6Z3EyOTNka2tlWjdEaUFBd1dCSFJHajVTVmZWaHRwSzJPOVpJNHJtVlJn?=
 =?utf-8?B?UitzOFJJVm9QZFU1bzZNLzJpeEEvV1RHK3UxeDBDMXRXdnlUQnJoMWx5VEhL?=
 =?utf-8?B?elBDT3AwbzBRcW5Pc25iQWI5eWQyMW12enJ2MGs3eTRjVEYxWDJMRFlBQlFt?=
 =?utf-8?B?eFJWeWZkRFB5bHZkVVBjcDg1M1lEWW1nay9TQittM3V2ejdoSnJTUHZ1bFhX?=
 =?utf-8?B?UEJzenBVTFUvcnJvSEJCd0VDSXZDTUI3OXB6TzI3SXRXc2d3cGtON291azNu?=
 =?utf-8?B?ZkxqTGFHcXoveW0xeFdNOHBMVWRaT1Q4ZC9LcUpRSjZWd1hQOWVrbGtBNmo0?=
 =?utf-8?B?a1ZrOWFvUlNtSDIrRHI2aDZheG1kTE55STZZdmxBQndDT1hmZndla0lpSGZV?=
 =?utf-8?B?WEdudXBnZm5DUVF2NmJBMkNCdzR0RXFoOUthT3IzYXZOUzB4Q21vbGVlZDMw?=
 =?utf-8?B?VWticGpuRllIODdiV1lnbWhTNmgyOERlYVU2VVNFb09GOVRkdGJQQ29yeDhR?=
 =?utf-8?B?MmRnd2VVU2d4WFJVSU9MUnZTa1Awa240U0czUEVxL1BUbVRNa1NkOWJ3c1V0?=
 =?utf-8?B?dUxVeStSY0dNbS9YUHRNdkt3bHBlYlRUMXlCZGUycFNjTk5VME9oUWJWQ3Zx?=
 =?utf-8?B?RXo5OFF3SUgrbHNQMFY5VE1QaE1NdlRmUHJ4OG9YMCtRcXVJUGRYRzc3ZTRH?=
 =?utf-8?B?dG45a1liamVYNC80azZuck8xb3hNT3Vrd2R2RmhQakc4TmVWS1VkRE5sV1pP?=
 =?utf-8?B?K054R3lMRjBIa2VOQ0xKVDYyVHZFVVAxY015NWMySnE4OUxWajJGK09panhU?=
 =?utf-8?B?NElEVlN0MGxtWTY5bVJaMTdiWWpMVlNrUXRkekpoQ0NLaWxkU3I1THF2U3FR?=
 =?utf-8?B?WW5pNHlyVVJsNS9BdmJ0OWRkTTlEZXJLL2dmT0NCUDZjZHBrdGFhWXgzdW9M?=
 =?utf-8?B?WHI0d2Evb3VDY2RMWWhhMUF1ZG1nbkVQSzdEekk5S2FzYmRrdTRuRC8vWkhT?=
 =?utf-8?B?QUVsYmhnR1MzaktjcHVlb0srSzdIejJaYnJtamVNeDgvNE9OT2Y3WTFZS1Vm?=
 =?utf-8?B?bkswdnl5eVVyWmRFRFJpZllTTysyeEVESndHcG5Ndm5aVlE2c3NUUkpJYzBC?=
 =?utf-8?B?Y2hDRXVXMm9qNXRVUFdwUjBMRXZJMW5DZWlRWHhaNFlzOENyY1dnTmhSeGxm?=
 =?utf-8?Q?azpi89tt11XuBKAMJMFfWDXkBELSpqKA+iuIY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39314a17-51a5-4641-a8b5-08dee0f92f63
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 16:09:58.1424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQKZikztF1vT0457TBkPZabwBOy3QnYvW6HCt1bPWEKcjUw+ISxM9yHQQicPAFtd9Yfn+g8tdkO3D1BVv9JZ16SBhLUTVF6H4H2qf8J1Tp+/YcxVDWDzkQTIYI1PHCV6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11388

From: Frank Li <Frank.Li@nxp.com>


On Mon, 06 Jul 2026 17:01:11 +0200, Greg Kroah-Hartman wrote:
> Add error handling to devm_kasprintf functions in imx9_soc_probe().

Applied, thanks!

[1/1] soc: imx9: devm_kasprintf error handling
      commit: 116165611d4d287ae58992528ba779133e7c72b3

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
