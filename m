Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795709617;
	b=SeQaFcCjv2no8uilptSh73aN4XNmsjIi+irL9E9SplkME538WWQiTT2FH7obXQhYXPMI
	 MjwBdhGpqmibNHKOr1LH5HcFQdJ2t5zN32jZUb9f3Q6+I568RbcAH3JYISKKnw6o3P6Bj
	 W8PyFulrUdXTyGkkbP6GVF9LZutCG3VuK3kFS9Iapw/cbWehWPdEWOqKaMJQCCoNJRHra
	 Ckt6RbrdSUgU0SdJWcTmxZ0jU3A7Twy4T7hkvB1xUL3Xbpc5O+YePD1LGIRERxibrBZrV
	 Ij/AxbFNMXa0hDL8FFpWnbNOZ0lx55V+g1Ez8W6Xd0UfEXGAF5tjEAe8cAVkI2vlWAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709617;
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
	bh=9iQ/TusYbRpaiO1Qidhq/snb1h5UAdPzlX4FeGtUlYs=;
	b=fT8JMBrxLKoX/42/bgGdH19wkQsSeC4N6qA87mu1T55L12W66SdJeXWQ9YavVy5FnC5B
	 jgErOJ1bajFVv6RSNb9Czz4DTslL4/Ixb/6ql+tqMrW19bGdQTmAYjBOKG1pZTe3xwMH+
	 Brj8u2ae+qyQCkSAXjCe/3vPTq1X1FdymDwXbyVYzqtisOr49qvV20zTvo6q1SwtAmGQZ
	 zS9uDpOHKCeKgihe/pjFebDKx3W+O6yRqy2RE1CmyuG0EJwZsVFoySUTvkR2qjUF1CjXx
	 aixoQVBcAtA+0G9/vf+eDTLspag8zAo/ZS3tp9ZThRZUjHfAh3h0CojJ+nidN+ObgAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=oK9HwUud;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.0
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013000.outbound.protection.outlook.com [52.101.72.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB00606A31C
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 16:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FB00606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=oK9HwUud
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CbOCFGoJ0/4F/EH6uT49ZLtiyFn97XGXGlcdd1u0kKgMm2TOP6U12y59/YR5BDvD4x4Q75x15oG7t9IWLjigG4ZD3ea6FCvnCz3/ocvJmx04+mwbR1behSGvOP4XjF/9Amo7+LrgebNWWH4cyj9XWvcSKTa1AQziLxHbxIqQWx+W7bJaAqI6U9Bbhb8Q2KRjcNWbvvvCkDCm+eA87g5n6Qrz4jaOiVCZ/1tddlgNtKwkp5PLGObBNmbuoGDdApUqmD9rH+nQ3pOaq66Vrz52ueDn0xZD76U7cvmKBFNykXgHTY4DfDgYQmFBx3UBFXhZSPUQzuboPLRN2uMiJ0VqxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9iQ/TusYbRpaiO1Qidhq/snb1h5UAdPzlX4FeGtUlYs=;
 b=FYY1LFeUiojTGkeOMApQWApMi5Z4kgtiq+hgYEXJgB2lvQVy4TTXS1g6dO2pli0rf3AUpDOCKKItM8WFnfl5iwQxEN0hDBzWueGOxPnodc8Pmw1B/E1vG+yMhwfaLzQVaANypfdhhh656XJ8tolh3H5Hh2GeM61u8kv+5IyoOz7dXwYpGnCQcJTl9rAbV9MaIEOS4yHlBxpN9ye1I55e6NX1NtnJiRXwAn7tE0x9YFS6RwTerzyv3QSfim53/q4v2YACRiUdycy6XijQXDLZobxXsJM5hhv/T5ca9m+AfksBYnctIXoFr0SFX1zV6DQrWVEWZrqHH4EKM5PcKS3rZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9iQ/TusYbRpaiO1Qidhq/snb1h5UAdPzlX4FeGtUlYs=;
 b=oK9HwUudDIr2MQoq1LUGCTzt38c21KdqM7CLTNd+e76RpeW48MVih3G6vF2HnP3fc+oZdqJ3JTOTh7sRi3PZO6CUUnh297vmmbDZWbgNPKHtisujFuG+sxS0cl9zc8Q0v2D+2VQY3L6Gb60Y+tG1tr0ZJrLil58a4MFsKza6Fkm5AwKbTRx80WL4TLkyr94e7eJkS2cvt+nTgXEtq/NNkQ0AJ4hbWTKxBUJFBNJgoLMZWTL3T6OKOa7Y/HlbjAv3aQXNHsMoRhkhag/YXv0eiIGlfKe8VSvuQCJst2jXsmGYHfMT0IEyY/aZU9UK5RY/DI3dV/RFJ4nx7NI5coEIVw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MI9PR04MB923983.eurprd04.prod.outlook.com (2603:10a6:290:87::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 16:13:33 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 16:13:33 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Lukasz Majewski <lukma@nabladev.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: fsl: Add an entry for Cloos CBASE board
Date: Thu, 26 Nov 2026 11:13:22 -0500
Message-ID: <179570957583.1090217.5373063883857172988.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120094211.1742416-1-lukma@nabladev.com>
References: <20261120094211.1742416-1-lukma@nabladev.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CPCP307CA0006.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380::8)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MI9PR04MB923983:EE_
X-MS-Office365-Filtering-Correlation-Id: 0529ed48-7bf0-400c-9233-08df4bd83836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|19092799006|10067099003|11063799006|56012099006|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gFTb6i8Quc0NethtJ/ctE6dpq7LaThUU9qXTiw1qBJoGHua7TEfqanww3p+dTR9l3MW4O48EbRinKWORUxK+8XgWziz9KcGjz3O5yDNOk53HpePFWk3KXyLkc+t7wfgv2vviD+4/MtOXCwywtSfvSo/H/+joEFwY0AjwC3wMMIFGXuapBMU5Z+0bLyACohkJW+cqwF7DxRNMok2GGi8bbmC+gKiqO9pDHm97qYK2zN+98ME6ux0hA07KbVGvR5MIFpsoi9GQsN2DDyYmBw67Ui0EadxjQis2yk/1lMUSmEGxbr3EMLWBoomtmkxqBb4n68w9SqwG93IQpkKRT2JNlbZlfQU9hyQvvHzAxualwOX7l472WZF8ui8s/Exr4dEttQ3ws1zSAv3VfMNFDpw2PUm14110QUavPIFzNyC0h9HdgsG1rEx/ZVnWlM78nJGmLVMetIZW6xZeLxslzj0HRAZzogfaOIhCa1GkaQPFE27E9BxPCreJ09kRtxpmSISZm5rAJISBqi3UU0ZNliXf8DaCJv17rUQAU7Tb7PERQMr0Y0fKWuo4iBw8r0hVhngkHub8+KFOKjKHFSPkZopubuT+isa7Ev6Gw0Yft/RzvEWBTuCwlA5WnKS/g/YegcGer4mUXCqvsfpuewd0ka9BPel+rLP5uwrpAl0nyfY5wcg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(19092799006)(10067099003)(11063799006)(56012099006)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVdzTGhOZVVEZ2g3SmVwYTE0OE01cWZSVlhMQllMS0hHUkp0L2greWNzY3pM?=
 =?utf-8?B?TldsNFlFK3pWcTZvSitrV1JoVDkvcVF3ZitDUmNsSWFSU3h2TG5ZUHQwWjFs?=
 =?utf-8?B?OTc4RCtzRzZmVXJnSjJkYStuV3JETlFlLzNVaVdoVndLZ2NlMGtrWDFoRG1a?=
 =?utf-8?B?SFlTMHFwMFlrSVNYWXdEcEMvZHlSQlUvZ3dUL3FhajhjZFVCek5YaG44TFdK?=
 =?utf-8?B?RlZEMzBtc2RQT2NxWk9veWI2N2NCSUtEQkpXOW1RMVZ6OE4weDFPNDMvcjgx?=
 =?utf-8?B?QlZYM1J5NjBNbWJNS3lzVUFMN1J4YTkxb0JLOWJQTmJBUjZaZlIrWFNLelJi?=
 =?utf-8?B?ZnF3ZGExcjJpZXFLWmFkNUZnUW44TjZvMmF0SUQ1N1B0WUhkVHJBYnRRelFu?=
 =?utf-8?B?T1RlV3lsQUppWU1zQ0tFR2k4VXh1L2x0WTIvclA1NWZ3ZVhrZ3R0ZjNBU2l2?=
 =?utf-8?B?UlVSVkltTDZZOGF6V0IwZkdqdUpiYVh0SXBlT2w4S0FpSEJaSFNNcVdsOFJx?=
 =?utf-8?B?WXcvQzVEYlAyTGFtU0N3VVFSeXRJMGNvZ2FaUkVLQUtXQzFTT1MwRStkc01h?=
 =?utf-8?B?UFBoRGNLaktXYnROR3g0dGp0eFVxWndBVUh5UEdyNVY1ajNrRXVQOFhQajl3?=
 =?utf-8?B?WEpqWE0vWTF3ZjdWTUhrY0YzcmIrMDJmZjE1QVZMM1hlRlFVTVJEdjVUcEVs?=
 =?utf-8?B?VElLd1d6R3hZTTlBTUxGQytWYXZVK1BscmMvVThrNm1DTEJ1RE8zNDlZcGo3?=
 =?utf-8?B?NlF4L1NiQXZHSkNmUm00TU9SdStGOE9USFdyaUN5ZkRLTnZvMXpmd1lEOXow?=
 =?utf-8?B?WVFhUk8zM2IwOHNFMjRnK1pJbUlheDJWZlFTbGZUdVp0TStrQ1dQejRhVnI0?=
 =?utf-8?B?dXhtRm9xZnFQUVBkdVpYbFZzRm1zdDVRSmwwZ1p3Y0FiZ1QyczZxTmJKOXVW?=
 =?utf-8?B?QWF5MGhyR3poTEQ5YWV3TGQ1aXpsQ3pubGJYYllEaFhKTGUyRXdvSzBPN0Fw?=
 =?utf-8?B?b2RQUzBQT2ZyWjZUeVZoMm0xYjhkdURJSURib2ErL0tWenBycTlDbTBmaCtV?=
 =?utf-8?B?MkhrMkFuS1B6Zk1Fc1ZFSTk1dTBwSnU2cDVYYUJ0dDdUa1EydkJqOWxIdGsy?=
 =?utf-8?B?aStaclFGSFhncndBRVlGZlJ2UHdXdFcxbFp6bVhCdDVmZUw3UFBHUU1ndk1B?=
 =?utf-8?B?V3NhTll5MW9aK2k0YW1QaUFibC9iU2xKRi9ZWE05RFdrNXRKbkFOR3kzclpL?=
 =?utf-8?B?VXkvNTFEbUVnYXRMaXpyWjlWUUhWT1plWFdBQVhKVlZId3kwYTMyRmptL1hZ?=
 =?utf-8?B?dFQyK04xV2NDRVpwMzY1bGo2QlZrM283SytZRGQwS0ZSVTUvdHhVaVlPaW9h?=
 =?utf-8?B?KzVXdjZQdmkwQk5GNGtWOFdwMVd2aEludUptVGtnbE1NM3VnWkFETlAxODhy?=
 =?utf-8?B?a3lGcDJ4aGtxblFTK2N6bEQzVk5HTENLZmJoYXFseGxmZ2FmMSsrcFJtWS9I?=
 =?utf-8?B?MGd0SmFNWTF3cDVxZzhoSlRrdk5ZSmNzeHZLTlZyb282RzZXU1crbHQ2aHph?=
 =?utf-8?B?YW9rUUQ2TmY5Z05Jc3FJTTV1Wm05YTRwdkI2Sm1QMEN4T3h1VEdEUXNwY0kw?=
 =?utf-8?B?ZFVmSG9jUFNpWE1iS2pMRThBQUd3NEJMd0E1aTRzYkRSTlJsc2RmVVExT0Qz?=
 =?utf-8?B?clB4Q05mS2FmWGJtcnBmMVp0WHJ5ZUpVQjVXT1lvY3VLS3FITGJIMWdZTEZ5?=
 =?utf-8?B?ZTNqWlZQZ1pDaFpxQm52Qld4MnN5dVRCODJaN29pLzdvZk54cmlOeEhrME1J?=
 =?utf-8?B?WHF0VnIxZlljKy9OaThKMUluVk5zbEtITktXMldocWtVNjkrbkMySTBvV3JV?=
 =?utf-8?B?M05jZC9iQ1NKa1JXTnZwS01pU1FsdGJreGViOXBZdnM0THhGQ2ZuSG02ZHcr?=
 =?utf-8?B?UUZ1T1NQcWl3YmJOc3RaYk4xMkNnRGNXMXROZWZmOUxvUTZDVjg0Z3dkd0do?=
 =?utf-8?B?TG95aUVCYzhjN3c1cjV4TDd1dHVqYVpvOXdaRmpUWUR5MUc2ajY0R3pSKzc0?=
 =?utf-8?B?TVIwZDdjbVNRNHBnZ3VlR0lsUWFyNjJrTGVLZzZUWVI1V005SHowRkl6Z1Rv?=
 =?utf-8?B?QUFacFgrbU9US1lsSUh5SXhSdWE0UXAwN0QrQkNmandObDZtbTZBMXk1VHI4?=
 =?utf-8?B?Rk5pY3pVTXBtVEhsZ2E3WXRMaVQ2TlFsbG5YelNKa2NiNmxFVWlzbVA2ZnNp?=
 =?utf-8?B?VnpaUms5YlVSSDBqenVwdEprZDhmYkJJZHEwK3dENnkxeUZkQWhWUlU0R0Fo?=
 =?utf-8?B?bkhBaFVodUVsNGFWNjBSL1hYLzVWSFhTTUJ4SmNZb0lSUGFPYkd6ditDcVhK?=
 =?utf-8?Q?+1FiieS3dWG+DbaX8fygDcx7ro/7CFJp7fTeu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0529ed48-7bf0-400c-9233-08df4bd83836
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 16:13:33.8903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZ/5Bliu9oGRbhPjkKtB8wFwLohfGnvZEJWJY6NEWgoVx5aETnL/pkjRtUJxCyjwjf6r5hx5XYyCP+pAjPZVSCyg1VL0fjBsenP7GS1oqeiNE2ETD9rYkE5nkyOp48rm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB923983

From: Frank Li <Frank.Li@nxp.com>


On Fri, 20 Nov 2026 10:42:09 +0100, Lukasz Majewski wrote:
> Add an entry for the i.MX8MM Cloos CBASE board.

Applied, thanks!

[1/3] dt-bindings: arm: fsl: Add an entry for Cloos CBASE board
      commit: 07b6d12c7f2fd20424dc6c28596e807aa68999b4
[2/3] dt-bindings: hwmon: Add National/TI LM77 temperature sensor
      commit: 4e2aee441a877bc5688ead92e33d9295ef610826
[3/3] arm64: dts: imx8mm: Add Cloos CBASE support
      commit: 24154ccfd63b6d151ed5557f769865e84b26b964

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
