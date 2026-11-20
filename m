Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795194733;
	b=J1HfG1Uv0YmBXIGUnF3evT0pJYK4qfanqluak3qdChML4uIMhegTtrFSy0c6RlEvXtGc
	 6VcJ2z8FaChU982WDGDmEpWRkv5nivakmjtvzrcqzuTIznBCY6FLMeHROa+o0ZqUvKpCB
	 HJJZAbQR4ZOwhVXwM4NwqyY8EpyZyAy9shBALAmsv0yIgwQ9c0+L8e5iivBj4TFQwH8/g
	 Z+xMN8z6uAKtztIwUpCjq274yImS/LimlM6mNXhd6L9uLQR1NSQbi3wkA5aModRBVOftD
	 lQ+qA2Ow1i+ibRQCCFGg9pcSsWV13/Q+eSQh2xnXxwha+EXS0pJIqS7fv5zKZ3fNMAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194733;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=SQnftGsXAm///5imGQTngI7R5mRTJQU0XUIDw+FhOUo=;
	b=Boo3s72dE/RQMhU6tYf5DSvddO67CA7YkYTb0ql8weVqybpbmTdf2DnSuginx75btB+B
	 +myT0kD1rsHn5ZRnP1UC5HI4s/mjCTfgwp9+HUCd85FUKcin9nF4UbUlZP3R37IfIbttC
	 2cC+VXIN9wnPFSLSlrQw2dtFacukG2S4Vb5ZV3mYrADvEfBymhcG1GO4pPttimed2VtjT
	 5+UcQvZHDhWMyxs8mYmxz9wFYpIFVgq8BarFgomJ6F3TnC7eRqI2z8D4x+2bdY4uR8sp/
	 jPNjWIOFcjU9wKZh+7QtREwtvnmuRNLgGzDMKuLljTow6FQIaY496mv6gUhmzX1aQRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=i0pIveu5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.53
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010053.outbound.protection.outlook.com [52.101.84.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675B6606A333
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 17:12:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 675B6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=i0pIveu5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lozJLD0/X5ZXCTSRn7vbwkqGOHrTU5BHAw+8iGHkol6BplJZc28wRF6bEhIy4CdWjc3ZuMc6zcSaY4zBG9EzUSMdMvNDE8K5Vwp3z7ddNsklgDF0Yp+MLX2m1qJDwZoP4c0aCmFlclr43KXwjcgTb7XKBzvquLdDoLdoEBjO83GdM2vqHWMMfi/KxwXD2TpUhWJa4YsnS74M1o3FG4GDtQ0UP6ZOytC5AL6nWPvco1oUWyZeDZtLrA1GMFRoCJ4NEjY19JRD5u7qhUkn9oZNY6Q+Pi4fYphqahtDKdOvQHwihp9wZKO85IYM9C9Dzbwx73t/bqqLTmG/sryPaOomcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQnftGsXAm///5imGQTngI7R5mRTJQU0XUIDw+FhOUo=;
 b=qqzGtSwORuDl8yUxgzxnWPlFgBfXULOZkRX9N608YNKxelWVe9jH+1ppG4RZccNS+TfjDB9DaTnOUP7xFClR5U/xdKJ/vp5Rl2YWwFjqW0crnJg2P9v1VLPxghlMdQ5nBzIcLVOQD507cnfADIDQ3nDA1eWoDEWvjp7YgpNSCJSdeUpGRTXPTDPeAd8/Uv7IaX8uBzPJ6rYUEj/+oDlaJsL3mGN6s5CXUKggD8875Zai6fkkthEapyeORfe31J9ZHAtFCCXV4wIQmS1/BPuZ3o54evWeU1fsEGikIQdzdGiKRS8xUsU+p2hiC2IHekTd1y3BdUaHfNbvHHyXovKdjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQnftGsXAm///5imGQTngI7R5mRTJQU0XUIDw+FhOUo=;
 b=i0pIveu5IeJFrmWGbOJxCr5+zzes1Ar/m6VQZJ9xnBxZRL/l7j3oPM9wWg228dxV26LxcyRUWQgrTLw2KxyVfc3NCoJqoJPEt6fftIIpci7JKSNaCh5ls8T9c61m+9phRkN6cxNBVF5e1wiVyqIKvojJrQ34NM23OdRN6Nv5OgAAPhK7uhbSuXIR5CMDQ7aTTQB+s5SnLjNxKHRhNp7H6IDLPh0NTRYO/rDOl2mRDN06eC37uCxXHe0YJXsv4RhBgbr68tZVwt6rGwRT3eQcBKQ+rwuUKiSnLpt7jxL7mnCtAbXPTTmbCoywiRiopYMgeMQ7S63EAs5mmdp3TqedXQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DBBPR04MB7628.eurprd04.prod.outlook.com (2603:10a6:10:204::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 17:12:07 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 17:12:06 +0000
Date: Fri, 20 Nov 2026 11:11:56 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Joy Zou <joy.zou@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: fsl: add i.MX937 FRDM board
Message-ID: <awB_XD_umRtZ5wm_@SMW015318>
References: <20261120-b4-imx937-frdm-v2-0-5e27ceec02df@oss.nxp.com>
 <20261120-b4-imx937-frdm-v2-1-5e27ceec02df@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-b4-imx937-frdm-v2-1-5e27ceec02df@oss.nxp.com>
X-ClientProxiedBy: PH8PR21CA0021.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DBBPR04MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e9d3ac0-878a-49b3-f834-08df47296762
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|1800799024|376014|7416014|18002099003|22082099003|261009223027099003|11063799006|56012099006|4143699003|261102123227099003|261026121527099003|261022075727099003|261022105027099003|261026140227099003|261021121427099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	J/kN30NyOlUgkhEHQxcEDKDU0vihUEMF+xDFyvnVUZrYkSWzVeefdsniEUy2TgCTtfNDEcu5lqizBMK/SA1InJXQ733gsMl4fiFCCjy3mYY+8eWbcWLypp1uLStDoapXu9lzqw2LbwV51NQOrnNqK02FoNXZiFIHUmGZXOJgKPp4bnsZe6M1v+KBjalLQ1PwxBbYYYP3CIACikA5woMx4fD7M37QkEaVlvojOOQR+r582oizIEeZkcxIXp1cRiQBufoi/A3EzDMy8fjh/ikMWIVtK+H0GhoUVwGwl8kg8jbrRuhBJ4rpbZ/pCFcRUrjfJyEHeiqvjGaOfiq+0p20DP8IgvFsuLonfCwg5huidRxuJjdm6J0f627WmtTIxTIkkqwqpwXh1suSi1KfJTIDVpBUPLUmSYsALPz0SDPTj2bne8tKwlvtEXJslQN6HoQGu6uPnHbaKRs0zKq9s47Rgp0TvatYnFUHd90vXJMjWMGnP4ORTBTgfWugjufE8npQ6x4C2ntNy4t165WX5ZOsAKPCKd4ExYtOPT6eqOOMckZQ+7XShNdgp1/i/NR/f5PYFKHzEzv1HFA91kIbVS8kGiXTvbFwFnEEODW05B24+KuxpAa6ZKAs1iLFqxwBE5Ttd4b7XG9Uz2mc4a5loVm0mhIz+MxI5Rb6nwx8Cca3SJE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(1800799024)(376014)(7416014)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(4143699003)(261102123227099003)(261026121527099003)(261022075727099003)(261022105027099003)(261026140227099003)(261021121427099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XQ0Cg+XaMROwyA4cl+oCSKu925giAoDL4tSLij5xDNwQMkUomoeO5KHMdgsH?=
 =?us-ascii?Q?RnTdBL7bfw62MaPSn0Pzj2BJTr8buVtBck07freVWL33Fvd9dhR2UGrW5+Xp?=
 =?us-ascii?Q?NfEgAP0SBoImpHDAKEo3zqOPPP3/c/FHhzlcE2HwVpAoyhb5WcfiraksP0ii?=
 =?us-ascii?Q?xx78aJ6pI5WM6LkToQXT31OD76LNruMblh/7cBA5rGyOzg3/9ExB12DLFeqH?=
 =?us-ascii?Q?TE3ihkS1KXdNORs0K3wLu3/poWScRB5O4dXzWvkhYMcCbmqb214yWEJ7ThDF?=
 =?us-ascii?Q?D2iB6ZLA9gxPjTYwcr3Cp5i5kw6fZNvPbSFw66/nyAQZBDp4JT/cwEdrPJfA?=
 =?us-ascii?Q?LFR1xRNCeQq3gBFb5h1Pub6qIW/7yBERY0UJDJG2CQVtGbaPgsuqsJz/oXNm?=
 =?us-ascii?Q?ITELsI/FAD0VbfsVcI1QTZZ8P1Pbk5Z1PcB6cdeuAdbX29U1U2vvhtoKJtcN?=
 =?us-ascii?Q?CwSsr1Dhl4pfm41j7QawcIleQA5achUMgTxaXEp/8g5PqgRU5iuLeUV8KxUX?=
 =?us-ascii?Q?rbka8FVEgkNH3IgnZCyiJ+5LEX+4XgwGk/4cOEG9hRkalaiB6DCLVqAyjH6o?=
 =?us-ascii?Q?E1gMit8k85zRmae87p+YCwaxZCe2sYYcgDUTuWMQ65Fs/H/WCFy7NqVUnp6B?=
 =?us-ascii?Q?4KhCSI5CDHWxfENJn4YMhQMbqxgxJ1Og9X+YhjfWv6cUO2bSNlthRdSUCrdV?=
 =?us-ascii?Q?nblLDpYFYvfLNYbaORDPIN2nO5RIY81KqWy0gdc/ohbJNpAmUPjMvOWXBZm4?=
 =?us-ascii?Q?YkUsKtIVO8OxYfjkqxHI54Zvp1FPcUL4FwgfQeC+RG5oNvoGbXOyKoCZ8HrJ?=
 =?us-ascii?Q?WdrukAxHenkfTpHgkxB66ehJRrNTzdrSfFkGq7GTN27ZDnd0MiUcCj8A4oLu?=
 =?us-ascii?Q?eymayeZr166yibzrRMY8NtWgSrMu4LuA6Dhgmr2/0X359RqDitpb1uA7nR3h?=
 =?us-ascii?Q?QhrqoL3yB6NPpt1qqrssMWXjQBAwBWQxoqSHreTTippiV5FRw2a7RGituzqX?=
 =?us-ascii?Q?Mm7dbuKZgHRnu3lyZl0g8+v0S18Jw6q95kdTdcWx3Ksz9FCshfTM22kvpYQH?=
 =?us-ascii?Q?MACvLZ7ikpbXVj1cIZNZXXo3yj4ek6Q6opr6E11I5oweO22iJlBKy9hrb9dy?=
 =?us-ascii?Q?Rf4W/vFXtnShDDGEWt9LgGDPfKJQoUmcf93BsX7SegCA7I/Fjd3Sz3xrKPLy?=
 =?us-ascii?Q?JJHCC2s+mr6YdCSzlAMBHHAxvue+BPRDb6kwVEK5uUPTdgAySEJXITFtDy+g?=
 =?us-ascii?Q?mxu1NMUA35Bd6zS3A5QTtXPtfgVawqChdWHWUDMWwg8dU4txIeszmiKSXg6z?=
 =?us-ascii?Q?9e6AXe9ZmNMpFzDejmqcGWJJW8Dg1GAq5mpbGOIsHZVcuZxCL65ax9LrX2OS?=
 =?us-ascii?Q?fNXOREUtsrllLvdQCWu20kLpJC/jkvc5qp46etShj5ph2VMEEGVUhVW73Rrt?=
 =?us-ascii?Q?oyDXbzFeQWDyFPB2HjGpiMWHmT18vzuLimmHJapzMg2MTCnU5OY3CZFbUjMY?=
 =?us-ascii?Q?8y1lff1OkZjtbf0utJFyCNsyv/EvkGjVcohfDe8xcYas6iUwLIj1NXGAfMpz?=
 =?us-ascii?Q?GTi4RRj00AtJZTjKo4r25mzh2Sc/mwmvnaKthw08hEAyUfy6Tt8Tu9AjI/P+?=
 =?us-ascii?Q?V7gs8swzwuBj5e8fgHvqVEqBy7ewuZObiHX1b65WVTmJq3Pn8ZPgQEAa6HDh?=
 =?us-ascii?Q?V6ts/1zkOpwDRbFY+nfMfLGhiFXunN2SJeV+t6deR66e/X783SlO2eM+DtDg?=
 =?us-ascii?Q?3iSqItYXkGL+sl3cI58VgI6PHWqE137+0PQ0ul1BYVj8kfb0SAtv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e9d3ac0-878a-49b3-f834-08df47296762
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 17:12:06.5909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5r86U2Jt/lyIcf8nnhWW06ZwPHl+lZk46Q4v2erZmVjX/y8dwcWdSITTidgiwyMNo/PuibXsSzEHC9tbrE3h86M20ZiLMm5xMFSV9g3U62GyDp2U5WgW+wHvmhH2Itqr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7628

On Fri, Nov 20, 2026 at 07:09:48PM +0800, Joy Zou wrote:
> Add DT compatible string for NXP i.MX937 FRDM board.
>
> Most software on the i.MX937 is compatible with the i.MX952
> including SCMI and pinctrl.
>
> Add the fsl,imx952-frdm compatible string to reuse the existing
> support and avoid code duplication.
>
> Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v2:
> 1. add description explaining why the i.MX952 compatible string is included.
> 2. remove document for imx952-frdm compatible string.
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 00930fb49b63..b67d4504c34e 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1572,6 +1572,13 @@ properties:
>            - const: toradex,osm-imx93
>            - const: fsl,imx93
>
> +      - description: i.MX937 based Boards
> +        items:
> +          - enum:
> +              - fsl,imx937-frdm           # i.MX937 FRDM Board
> +          - const: fsl,imx937
> +          - const: fsl,imx952
> +
>        - description: i.MX94 based Boards
>          items:
>            - enum:
>
> --
> 2.34.1
>
>
