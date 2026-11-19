Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795073277;
	b=0MuERZMKqUsBztneSTQYPK5bHrhO+cAuNRm3T4bYR1/yg0/8Jl17uxJhsG6Tx0mQaXnz
	 qQ/uyDc8DNCd91Hj/QALflRWu3GH4ehVGOwRE5Q8TJeFWm3T3k5oZnd40zgpHXHQESoU/
	 EWRDSnrX8oMc8fR+wen8MdQmIFdQ4JccNSwa+jCJau3l89CVFLZhssfu9o3nhUiDjLsSv
	 d9Rb8FYUIisE3f13o59FORTkdV0p0QHFG2uWCuLdG0dXrgG1ihChCo47nntivv07xgNAS
	 HNllLa3xx/EpnEuwii1TBGnnV38OBtV2rcpnw6ZxkkQNRGzVhHQjheN0tvedSipX49Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073277;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
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
	bh=iCmx5M7ujUm1IfWX40ZfSkMyh+Eos/Q9MDjpaPeqirs=;
	b=b3ZsRfkhmyYsmsXcGEWtpzsQkK21hs9K/dTjP3bWs4d8+y+59tw0Lpd2SQBbaVCrGNTH
	 3kBnr1TnJ1kuFQOnHDaJqlXx9/ddRclg102T1v6qyJwDxYAO74s6kbi391auFzyyX8u69
	 zt0vqyGf7ny0hhnRnMU1rPbrl/G/VCZ6iumGAkiqkTttClTvRbcZo893bdpTP5zsP36nq
	 r7NjvVBaH5l9HNZRVyByKlACaej6gP1jAOeKvRKmoFD5AVPSgHsqzkEawp+gWw+yq+ozl
	 Nec/cT2NIxI5qOV8eZqvAfzg2U+kAO0cOt7Xap/DFcv0njQtUebNsaotk9KyqK00GTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=TGNEt2kg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.24
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010024.outbound.protection.outlook.com [52.101.69.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6598606A325
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 07:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6598606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=TGNEt2kg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eNmV9s7/6se08Gp8whLIREljuSU2nhktbzIJpjczI6vuN3+nTCVyrIcByLu5f7gaR0rjqV3Eve1koKn+W7IQyVHzKsy6z3PzLV+vJ5ayD+nHdZ5rhS0799Xqb5HcwW6eW+1GfC+J6iUHGjxXrbL26PindL0cdZedB/zSRU5TLWZZNs2fUfM17KDpMq3+Q/mn7njKZ+8Q0z8LuzBQRU7qFodx3QfgwsXa7PA/AcHF6wqSyDYl7n7IAl5wwuoguPfECivEou5UISa6K7ffB/bIf3zOOpOjrhzw28w+RydrFjLS6d/87CEofXU0bw1gqCITfC9DoD0d0HyQ5G2Weig6yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCmx5M7ujUm1IfWX40ZfSkMyh+Eos/Q9MDjpaPeqirs=;
 b=dQpM0jiFmm1B1O5OUNPTnqFLWETjuJoZsmLPUxk/WS4Acb41oxSOG9QXdAqkSBZBZSGu5LL7p+Z6lu5L2W0XUZip2VdpX5bdP92x5WXdL7OPeZoywlKAJeSWs0KI4w8PejkWJb9eCDvj4Ja0v1/iatv1nYxUC98PVIKqtx560yHOXBKwxhxdKbe29b06oByosXTtKBgAE4AwUABFDEy/QEpIJWkqf0UaFabCZAl3fCGjt0PhuUdVd1GjKQxd+OcFO2quL0hT7glvaykRbLCCcTaht00JZDadAP42DyGFQx2Won4mHyp3MV4IU5dcCm0T2aTcjKRWrqZwBqXILjYl/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCmx5M7ujUm1IfWX40ZfSkMyh+Eos/Q9MDjpaPeqirs=;
 b=TGNEt2kgNa3XnRfBHo0icNxydlnCt2jxz7ufGPZQk5O7CXqEttt/kFYfSZ6RzIL75EFiR1iUUKupQjlj3yOwej2ryU+hCbaElKN6Gj9VJ+L4fZIy4tb2dS7/AP1J+39jnO6Vg49vbuTESN2XaZP+MZ4WV9mX2QiLaCveQf6P7Y+7KxjQVh/sV25KaMDja+aPC4P41KbwFQnr877xilAIFKn48C1L/DXuKVIA3+7rhNEi7ncIv/dkIC1/igO1fBrORHwt/esP90IvS6gI3Z3NTC+Osy9Ke6gPsj9OWlcHK2SUE1vCTXgjngArp6uaoN2IGQZaN2upOZhdwyKZ7c2Jgg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB7PR04MB4698.eurprd04.prod.outlook.com (2603:10a6:10:1c::21)
 by PA4PR04MB9248.eurprd04.prod.outlook.com (2603:10a6:102:2a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 07:27:49 +0000
Received: from DB7PR04MB4698.eurprd04.prod.outlook.com
 ([fe80::c571:bdf2:afe7:c03c]) by DB7PR04MB4698.eurprd04.prod.outlook.com
 ([fe80::c571:bdf2:afe7:c03c%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 07:27:49 +0000
From: Ming Qian <ming.qian@oss.nxp.com>
Date: Thu, 19 Nov 2026 16:27:14 +0900
Subject: [PATCH] media: amphion: Enable non-coherent allocation for raw
 frame buffers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-amphion-non-coherent-v1-1-c3154395e448@oss.nxp.com>
X-B4-Tracking: v=1; b=H4sIANGk/moC/yWM0QpAQBBFf0XzbGsHKX5FHlizdpSlXaTk3w0e7
 sOpe84FkQJThDq5INDBkRcvgGkCxnV+JMWDMGQ6KxGxUt28OvkoLzOLo0B+U7ZEras8LwZrQdQ
 1kOXzyzbtz3HvJzLb24L7fgCJgw+reAAAAA==
X-Change-ID: 20261119-amphion-non-coherent-f61009334dff
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Zhou Peng <eagle.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 linux-imx@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ming Qian <ming.qian@oss.nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI1PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::13) To DB7PR04MB4698.eurprd04.prod.outlook.com
 (2603:10a6:10:1c::21)
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
X-MS-TrafficTypeDiagnostic: DB7PR04MB4698:EE_|PA4PR04MB9248:EE_
X-MS-Office365-Filtering-Correlation-Id: cd09c3de-e198-463c-f450-08df460e9d8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|10067099003|11063799006|56012099006|261022075727099003|261021121427099003|261102123227099003|261009223027099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	PegijPfmB3hlck5rG9JCfJiw8qdkoV3Hzl080xDoeKO/YOTJrzjPSxSXptt3ySqOC9V0ZhclWw8OyVgQqVhGvzAByv206jkNgAw1AkjHBlNUzIA/JsAePfoUV2CKTQ2FWZ+FzpHNlmAXCrsWmvXcgFz/neIL7yCPoe7Md/MM3B6d2M1oQmqNxi8asxeqqYZ8ZEvCpvDj56oBLQD2bQyOjWhiMnyk0JcC/RNEtKvlibt2o8LwxVNyoqel42nzJw66XbmrDCtEnFanPPogz0AEWscIt5a50WwTt9WWMGxCQ3b8ZIAWU3FuPs6N/xruxrALXoqkL+r66nultWKtmqMCybCkgMfWkkXlCCrkvC52C8/Af0svlMILYX0y+DCAFHcE+tU/Tb5aiAedjZLwpsNuyMLF6igDHNww7DLJm3hKwmRX4nOaF2pbW88ie01xljGGptkVNKSLK3YgafarSNkB6iH+iyXOsAkiy2AbhS0XOAdbIvnLgZuYPRTxWbdODi2OYxNSyWo3NHe5J4J4fHKrV6y8rbPxFmpJgZD5l4P6G1Xrp/BMnnq5h6tpa7/pSHHo6mh3rRBjuCznLbE81C7LBBPuohMwSA7gRbaUgWW5HlbdFg3xhdF20MABUAnkRi2e/5gS8SbIz6i0AQV2/jMua05XErPuBqwkDUTKCc0ZEXg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4698.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(10067099003)(11063799006)(56012099006)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXR5N3FxZURsV08zak9GN1BBOTBrSFhoRExyTmw4Y1RWdHdYL0tqaHI1bkJV?=
 =?utf-8?B?MDZEeU16TmVNN05sQkw0VmhLTDhjVDZ4ZUU0RlFKbXdIang0S25NODN0Mk9I?=
 =?utf-8?B?ak1IQ0YzaEI4TWFGSXk3Z0RUMWZseWFSa3BFOHNmbElwWHp1VUxnOGpYRmwr?=
 =?utf-8?B?alRmcHlnTWEyK0pwOEtoSC9La21HWGRVTWJMMW8yRU5IZEtQaFp3N0krNUdP?=
 =?utf-8?B?bUVpRk13d3hQWWlrcC9nNGdFSG5FZVg1T1NkSG10TkJycGV3NjBTSmVKdHZG?=
 =?utf-8?B?MjFkSWo3WkExUlcveGxQZ1o4SFFHc1EzRjd4N1RXb09hSWczdGlxZ3FDN3Rk?=
 =?utf-8?B?Q09mTXIxRUJLa1lsT2RPb3pleCtyTGNhMzdjR2dnOCswRGU0SFVveVoyR241?=
 =?utf-8?B?RGNkQkFUSGlQTWtTcHU2RDNqQXVHQTVpcFBOZnhESkFjelJTd2FBVUJXWThv?=
 =?utf-8?B?a1puNzlRL2NqVnArcnpMWTNwU3ArM0RKckd5NGdXcFFBZFdhd0tZd0tGMVZE?=
 =?utf-8?B?L2ZVSGJDOW9vNVFaZ0JPQ3Ara2h4U0xDNnV3WHJtbjFqQmRjbjZHMUVKUDBp?=
 =?utf-8?B?a0xjNllrVldKaGJ1aWQrZlFYVGYwNWFhcjlZTTBFU3U4YXRKUzg2eXRObXBw?=
 =?utf-8?B?ekRKSGpkQkExdDRNL3REaTRGbzNFTS83TzQ0ZUJpU2VqcTNKWUZ3OUE1Z2pz?=
 =?utf-8?B?L0E4aGNxd0VnaC9IZENLVitqZytkaVVySTZRQ0pWVFprQklZam5Hc1gvNGw2?=
 =?utf-8?B?VitJZlJQaWhNejNmZElGWW5NbFpDT3dxcm1XREQ4ZVFzZzE5VW9KK3ZmQ1VK?=
 =?utf-8?B?TnBEdEt3NUtSNFZPcWZ4dlZpYUUxRkN4UHVZNWJJSEswTUxNV3NXZ2VTcnNa?=
 =?utf-8?B?eWxOZGFyazJzcEZCN1ZQU2xzK0RkTkpmeHpPUEhWRm9sRDhtL2NDc2V0ZW5n?=
 =?utf-8?B?VnBHcEJnMW1QYlBNQkswZUFDL3ppM1BJcjcybGlQSjJhcnA0cGJIN1d3SEpG?=
 =?utf-8?B?eGdWNDhsTVpIQy94TnZhZW1YcnE2bSt1eTd1S09SV2xOTGQzR3R1aDdwRUh1?=
 =?utf-8?B?RWh0RUw3N1FoSlNQTEp4KzFCWlk0Z3UyRkxaZUhWNGNnTjNPQkJ6NFVUTzJ5?=
 =?utf-8?B?NFVmVGs0VDc2c21DblhZc21laENSSnF1Zjl6OEVGUXZjNFovTUg5SDd4akV0?=
 =?utf-8?B?VWRxRVQyc3M1clhZa1B2enB2cDdUUzlidFdNL3ZXZ1lrRTdGaDBFSWkvSEwx?=
 =?utf-8?B?TTRhSXdpYjVPbXpKR3dSWFQxNlIwQmpicXdweXF1YnVVKzhwalpybFJXaWs5?=
 =?utf-8?B?ZUZsTnZZWWt1Zk5WdVRDTWF2QnNvM1MxbUlsSjZDZXNFZndSZ0kwOWhoYnZl?=
 =?utf-8?B?enFsck9YeUJwMWkxSU0yd3puUFEzRDQ2dDMwQkZkUVVVL1M1MUNMRkRjUVdx?=
 =?utf-8?B?Q1ljRUdhR081RWZrRzh4T0hieHVpZzVvaFFaTXVWVzlYdWljaWFoUDluNU0w?=
 =?utf-8?B?bk5ESUJMZkYvcjY4UHl4WnduS1RQUmVVbXNMdktSenowRGI4ZExvSEVRSmVo?=
 =?utf-8?B?TmJDQ0hMYTRHRGFObGlCM2FHUUZuVzB6WEJlbk5LRkdBMlBVQ3ZiUWQxZ3Nx?=
 =?utf-8?B?VFlnV2J3RnllZDlUZ2loVWY3NXB0YkIwMExMblptUCt5U0RGb25PMkpTeGJD?=
 =?utf-8?B?MG4xRGRCK2R1WjFxSWpKc3dCNUFiQWJoRFVFcFgvOEpzOENkTXlwRk81TGly?=
 =?utf-8?B?ZUNIa0xNNklIZitGY3VyYU1LYUJTVFNsL2c1VStNMk9ySE9hRHpJVTBpdnBo?=
 =?utf-8?B?MXR4VVNURXFza1Q1WFE0SWhIdTBpNHRabjRqTURyT0x3Y1UwdUlhNk1jUGda?=
 =?utf-8?B?YzMvRVQzYWVNVndIY0pZUGlRRUR0MjNVNWFZbFpkN3owT21Jd1VjR2hvand2?=
 =?utf-8?B?TmtoQXBUWFJxNjJUbTdJbytha1Vwc1o1emMvOE80dCtMemROc2hweTl2S1Z0?=
 =?utf-8?B?bGtKWk9Kd1E2Y05zRGNHendrQU1EM24wOS9XUUM1UFptd0lOWmxJN3RVZUFo?=
 =?utf-8?B?WHlQT3BvaXdYMlc2Zml0RWQvU0xOa3pGZmR1ekZGQVJCcU9xU2ZIREVubFo0?=
 =?utf-8?B?Y2tCcXQ4WXNUNW84aWRqY0lVSGhxZXYrcXlsdGlLSTR5UWtvSjlWMnBKTjBh?=
 =?utf-8?B?UnoxTVFkM2RWdjZldG9wTWdCUjlIQ2NBckFYclkrUys5dkE0SkpEeUtmSEZs?=
 =?utf-8?B?VHpMR1JPS3BKUTNmTnNzeE1LNFlBNDIrTUt2Q0dxemg3T20yUUpsVms5L1Bj?=
 =?utf-8?B?bHMwQS9Xa3ljZENTRjdrYVNqYUxwaU1CTGJjWWdNTkc0OHNaeEUxdDZjcHp4?=
 =?utf-8?Q?I1VQ/NZF6lYQUWdP0la558zIaIr1wDIH/QHcY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd09c3de-e198-463c-f450-08df460e9d8c
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4698.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 07:27:49.8503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hi4LfMty3wr+F5lAUdg2lxT3Mj9/Ou8/6KysTzmnOdoIj6pGQqPTcUXx3FLZAlKd4O0q1Vccn+x5SwxIz5E1EEUjWWPQHKxbwu1D5K9vwFYvYojd5K7ThendC4xkEJ3j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9248

Allow applications to allocate raw frame buffers with
V4L2_MEMORY_FLAG_NON_COHERENT for efficient CPU access. The required
cache synchronization is handled by videobuf2 in its prepare() and
finish() methods.

Set allow_cache_hints only for the encoder OUTPUT and decoder CAPTURE
queues. Leave it disabled for compressed bitstream queues, as the
driver may access their payloads through the CPU.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 drivers/media/platform/amphion/vpu_v4l2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
index 7cccc994fc50..c8d52f0af879 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.c
+++ b/drivers/media/platform/amphion/vpu_v4l2.c
@@ -664,6 +664,8 @@ static int vpu_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_q
 	src_vq->mem_ops = &vb2_dma_contig_memops;
 	if (inst->type == VPU_CORE_TYPE_DEC && inst->use_stream_buffer)
 		src_vq->mem_ops = &vb2_vmalloc_memops;
+	if (inst->type == VPU_CORE_TYPE_ENC)
+		src_vq->allow_cache_hints = 1;
 	src_vq->drv_priv = inst;
 	src_vq->buf_struct_size = sizeof(struct vpu_vb2_buffer);
 	src_vq->dev = inst->vpu->dev;
@@ -680,6 +682,8 @@ static int vpu_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_q
 	dst_vq->mem_ops = &vb2_dma_contig_memops;
 	if (inst->type == VPU_CORE_TYPE_ENC && inst->use_stream_buffer)
 		dst_vq->mem_ops = &vb2_vmalloc_memops;
+	if (inst->type == VPU_CORE_TYPE_DEC)
+		dst_vq->allow_cache_hints = 1;
 	dst_vq->drv_priv = inst;
 	dst_vq->buf_struct_size = sizeof(struct vpu_vb2_buffer);
 	dst_vq->dev = inst->vpu->dev;

---
base-commit: 7969a6f407cf55b5254c824c87875452655ef11e
change-id: 20261119-amphion-non-coherent-f61009334dff

