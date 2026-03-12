Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011025.outbound.protection.outlook.com [40.107.130.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF85388E4A
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 06:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773298092; cv=fail; b=YLQuOm/QVSWF1NsREIwR5hzed25dXRaulaYSbfspsmkQIdcJ9vUBfwm3DkRbjvDiMGm7iiPUOrehlEMdrv+jgHypKOrZVSHeEfb4woszOY163dg7GKBzxACvNTjbYlwM//qoSHoSNEzBM0DnvSs2jk28SPZSvrLwl6I7QRLtjAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773298092; c=relaxed/simple;
	bh=eH6ERna65dDcgo8yumjhNpsGOeKhGYkhufeLhiWyjyw=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IxeVfk+gUNBEfAVixGXHKs3b05fBsJGmxD4gjixSjN2Emk7xWAeJbjLetOB7YJZh6V8vzm1UhOaffxyrW/SFQD6Pdm/sNtO7MK29PguO9ISlG8tJZBrpqdox8ZAvTOl2YAU6khpVYrXdYqKEEh8tw+AD7ixz11AH9P3At8gZbL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CjkS93Sm; arc=fail smtp.client-ip=40.107.130.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CjkS93Sm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDM4eqjP0g/EB2FC8k//9ATRjImhVuqZv4Xn2OHqmZdjJ9E6obh5ag3D1RaYAZ+SKoQayQPZmRf2yW4rPNxJTTJiOUf6scfbQGWDUCLspgX5i05ksjS1lcyObZlWqS/xQuAPsuhxRH4Oc+oopr4oXTzaM47DZ0riElggnk58746f4Sei6CtpU9Tn4wolqjACaZ6sNIbWjpsrZDbQOD775KEeh5RaBNxfBQO1vWTWsYJKXbh6o38QX4obq0BZWtWjmdqt3SwjxzRZXCVDz160ICNc55V0ZzbzCJAUSHl0VdBHTds+bZpFsijQkTB70HbLVZdm4e1bdynLtsJxbDERpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eH6ERna65dDcgo8yumjhNpsGOeKhGYkhufeLhiWyjyw=;
 b=inM/eje4tJ6RCQn5UAmeTwGFXQLCghi+xc8oGqAUQ4vOurKWpmUtKmPkip/eZu9ifh9dJ9raWwhxbXlADz3SYd+BU/6ZwDQ01op5IGiH9WhJcqFC7VaLbsXsBlPx5PZWg2LmibMCmf0ImEJfNwpD5XN3+nIJb7oQtd0R3e3Ssf1IGhP8TbrXXou9qayacBPKGLJlUY1/NHG///GfX5STglxh4PUQI0rpZfVgEZIxsErIX1M7MmzN8yM+IKgVqpwinBWzUm7FFfxAc/L0MGggb9D4wH1wJeLVIpBFt2DGy8uXDNojkWgkhJfEYiQ0OTtpjapMzexPxN9+3M9cY25oMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eH6ERna65dDcgo8yumjhNpsGOeKhGYkhufeLhiWyjyw=;
 b=CjkS93Sm/EkYGERgF+nNIcHd2gissxVUjD446lQXTTde6MBcAGzB+B/b/S4RHXn5hH+FcZVZL73jeqOR8vPCUwuFkDEmtYOldTxeNfGfLmA/UAd1s0BCk2tJ6kTguFDCBStxQQFdxbYBtUzWQQLUaOy6CK0eXHFbA9C28OoJbrOsMf/xQ5wXwsSi2MlBZLb0or1qxAXunsrqaxnBpXTqRKkVfuTBE/45MhCa0fdRIIbLDT0xGfzVG3FOrQnXCbe384sOJyQd7GmVv6TasM24Ri2CYhpEMLTLz19B5+HCW+esOONrjPanjEg4K5JnPywZ0Nesqk+HBlPNzcpXTJVgsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AM0PR04MB7171.eurprd04.prod.outlook.com (2603:10a6:208:19c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 06:48:04 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 06:48:06 +0000
Message-ID: <d411facf-65e1-4322-bd27-11983f42ad92@oss.nxp.com>
Date: Thu, 12 Mar 2026 08:51:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: imx952-evk: Add sound-wm8962 support
To: Shengjiu Wang <shengjiu.wang@nxp.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260312034912.4007057-1-shengjiu.wang@nxp.com>
 <20260312034912.4007057-3-shengjiu.wang@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260312034912.4007057-3-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::10) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AM0PR04MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: 501cf8a2-3074-4f99-bc33-08de80035115
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WIWlXEqaXDpe37IY1ZRLwrlSEa612jFacBT+29nxuWMTx7qbLI5U30iHtAmw/LQJha704QitmtxUkn/9GL/+DfJNGP4LbG1Mk8TLcbp8QUGLET6M1RD/VOXRUxiHMkh5k9hZIdGKJrG7I/QbIgo07MxeG/oHZ3h8UZwMEZ/lgjxiZY/ycihFJUzh9rNOgO6cat/BvzZFNL4V+nqcNEdmBQcIv+eghfc6ZoTxeONwns3mPL8X2X3AgYFCdKVRTOwfvCRBLLF0Ln0+nIKMLLLW7oP/4BOmjTg1B3ndF1A+IKg1hqIKVnqqDyJIXDlkb23+X+BzrYhaiBQpw29a82RIhpzTho5WHlbDFasGXKC5yfbhm0mQ/3DZ1XOJY5Cia3e9l9NLQIm65zitNCGe+g70j+vRdQvzsZDgb/w/0eAL8v9YnGx87Yh7lSFXAY9SAaZiqzo8SlcktgiDE7zRE6WfifIPe5D4xv1L66xy3fpKnUHoIKOgOn0EFx4zO92dBKcSlAZkvelYsKi+Q+rlBYy3xi3eK6K6onMV7uaBIAq2XNQsSN+CR1Ho3KoXKr/VE4YdIB2TwR+r5u6D6/5tMj+HpVLocCfV8ri2GiepkHNlD98rPnc+MAue9NTPamSA9x28vMqGl18JPA0yNLHeMJGmQGp1N05NZMCmglP8vaHOt+oWt8XhrioSnxSddzTB7NiswnQHJlneX8EzfDn612582sCB2IJ5xSsmu3q1/5j2dV9jQHtx2pvUyIjyP0t5D7H1E+HoPso7eL0uHn414Swf0Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1VBVnlTLzl3L0VKdHpraXMwTUVOK0hyZmloMHozdDNHMVRkK0ZJMUJMYmFI?=
 =?utf-8?B?NUtJUjQ2OVFWRjBYampBc3ltSDU5Z3RyTC9Fc1BSU1BpNmtXaldUaFlZaGRS?=
 =?utf-8?B?WlhwUUlKWU0rMmVPV3cyVGR0RnRCVmtJeHdIUWFldVVOdkI0bm8yd1VFT2pu?=
 =?utf-8?B?WkJtdE5NZTVDZmxEZGtkZTlGSzRwdTU3M1VabmluWEtOV2MvYVYyUkZIUEph?=
 =?utf-8?B?YjdVZktVdUQzTnNiMCttNXFzOEZNV0w3aE51dXB4UVI3OXgrMy9vbTI5bmlX?=
 =?utf-8?B?dmR6bmd0alk1VjgzOFZ1cUZrUXZzc01tZ0NLSGF5VEhLdnNpaGZVRFg5ZmpI?=
 =?utf-8?B?a1ZFVmhwVC9NWUxtbUlFRUNwZXV0cmZjaGZramdTRXRicW15Y21LSUx6OFF4?=
 =?utf-8?B?KzBzN0pJVWRyQlI0RlBMQzJOTjJBSlA1YTlObE55N3M2Qm9QY2VlY1RpUGtn?=
 =?utf-8?B?aU5kaHlFY1g3amkyK2hIYTM1S3VkZm9yZUwrdUJtbEt2c285RHZqN1RGUzZH?=
 =?utf-8?B?cWNQaG5hS1hCdC9sOXcwMTY0TjM1bGlpWkNLdXJNM1FXUEFpd05FTGFqa2RF?=
 =?utf-8?B?Tm5LQWhEclNsdDdWR1VIaWl5eEs2NEJaaEhOSm9OeVNMbndLYlVraDlMTVdr?=
 =?utf-8?B?NWxyZUNvbE1uVDNIY2ZtMnpFTW1aRjZWVVJWL2VuWTBtTnlJMFl3ZzNsWlcv?=
 =?utf-8?B?UlE5QllZUEd5YkRSYzNJdml2UlZzSURiMVpJZkluZE1SSDZmNEFoU1pUQ3Nn?=
 =?utf-8?B?c3JlSzNPcGV3em5DejA2TTAyRmxZcTZ6UlBrdUM4ZHEwR2JBb2JHY1dQakxG?=
 =?utf-8?B?MXVWdXV4QjRJQ2RMczVyT2VQU3ZWVnR1OGk2K3dWQXAwbkxxcEk4ZTlXTFpu?=
 =?utf-8?B?aUJiV2RxbHJGQk5YWU10QXVPWDM4UjBpT01pMjlmRnNOK25Sek5tM2x3Z3VD?=
 =?utf-8?B?QjAxOXh3c3NPSkRSSWUvbzVIL1ExbzA5VmVGNFZvOEJGK3c5TlU2NGZQdTJH?=
 =?utf-8?B?RDJEZGY5emVVQWNQQ29VSnRhZnQ5YkxtM3NXei9FWVlTU1d1cXJjaVZjTHJm?=
 =?utf-8?B?RXlwR3dxbVloc3BkOEk4SGdISGRGWEFvMUo0YXlFZS81SEE0djJnT2VLNWtB?=
 =?utf-8?B?R0pNL2pYV205Q2ZZbjM5MndVOEpBQlo5WjJzN0Zpb24yWkp5eTFiRVRxWFFW?=
 =?utf-8?B?R1ByQ3J4dksrdWREUGVsZDM3c3MvMmJXNjNyZ0tudW9NRm4vNjBSZXNBMkxs?=
 =?utf-8?B?MmNhN3lzRFJyUGU2bDhqaEdlZHBXYlduVTRoNkpCa2Z0Q3dOUzNMaE5pWTdB?=
 =?utf-8?B?ckx5QmdPcTJFbU9Yb2ZUQy91WlphcUVZQjUwQkRRVDJTNzZHdEdqOUVMbHcx?=
 =?utf-8?B?RytmTTMwZk9FWjg0L2xiaXQrRmxITnFjelR0bjlRRzlQQXB1OXFEdEJxdkF0?=
 =?utf-8?B?bUtqditkSjlHUEZ3cG1weG1YTWMrMnowbmtvdE94Y3RISUszMnJkakpBc2pp?=
 =?utf-8?B?RkZDZU9tRHFjOEVXQjZSZklFSVgvWGs3T2duMW82VHpVSS8vaXh5NkhIUnV3?=
 =?utf-8?B?aFV2SkhubHNIT1Y4YlQxNjl6Vkt6M2Y4SThuVXdZanpTbVpBc1V1ZkQ3SG5G?=
 =?utf-8?B?b05MWGN0RFZlblY1TERib00wTld4NG5CTlN5bm1RSGtLM0hwS2RvcGNUMUdv?=
 =?utf-8?B?WWh1bUtRRlBiQmVDb0l2d0dCdTVkMGk4ckVHcXN4elM2OURGSkxnU1VVaS9K?=
 =?utf-8?B?SkJxZTcrODdBRlZjM2x6NVNDTnZMQ2VnWmdpUTF1K2dzSWNCems1L2ZJci9l?=
 =?utf-8?B?OHFFcDlaMER5c3pCWncrVEpBZnhaZnFVVGNXU0JzMmRVMVU1WGlQY0MwU0xC?=
 =?utf-8?B?TmJ1anhRb3B2QUNoa2hlZERIOG9iUXpoZ1h2ekZIdXg5azhXajkzRjZORDdq?=
 =?utf-8?B?amNubEZRcGhWMEhCWWJTNk1zMEN1NFpRUnIyQzlBNGZFcWRPTWp5RGxCOUo5?=
 =?utf-8?B?VUgvN3lRME52NnZFclJMU2RzbFA0QUQxZkNZYUJDVE91RWFoalZwbitXem9S?=
 =?utf-8?B?ZlJJNTFIeWRmNzVkRHVONmNvYzZVa1lMMEwzSXUraUhxak5kQXNjVHBmRmI0?=
 =?utf-8?B?NWY4Q1lKYzU5VHJ5dUFSMjZ4TWxBWWFuNG8wMjVPQlhZaGZiaGxZZUFzVjlr?=
 =?utf-8?B?RUtTZFZqODBkSkNlLzBPejM1bmZXcGYxNFMvcmFjYVRDTEFBUTBmNFJFYWQ2?=
 =?utf-8?B?RE5DMnFXRDN4M1V3R3k3U1ZjTlZmYXBsWE9TK0hkaEMwSnZ3NDN3VVJaTFNS?=
 =?utf-8?B?TXp3YktTbzI2RlFaY25UbEhMWEZxMEdISzIrejVjTHQ2ZDdqOW9BUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 501cf8a2-3074-4f99-bc33-08de80035115
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 06:48:06.7881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y4stDlwYOiNQdSg1HN0oSLe2rQVG/X2h0eTMdtWWMNnmNUzqmDQxPtvB46uhBrvdeVDhr/4cpCfaYSzjvAQwFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7171

On 3/12/26 05:49, Shengjiu Wang wrote:
> Add wm8962 sound card. By connecting with ASRC1, the sound card support
> sample rate conversion.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

