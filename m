Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013026.outbound.protection.outlook.com [40.107.159.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82DD3B8BD9
	for <imx@lists.linux.dev>; Tue, 10 Mar 2026 02:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773111388; cv=fail; b=NduB1Ygky2TURNDXPPLJ0IWrv+4ZC7QmxS3xLDd85yf2sKdKxl46hKGUYZPSXaaS8R5LfB7GjDUmjJjwkIQ6g9bd3PXl2yLR1dZ9+epndJcyGIf7AEjyXEa675XwWczPbKPDDnxq74L0OA1T6V2CsnjpmkaKXYtJ3ujGqQLT8aI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773111388; c=relaxed/simple;
	bh=8y0s6r52Rs/cRskhHLHLcbIblDqKpRDBo77JB3Z5UJg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ce7o0D0o/HM9pOto+lc/CLIMwS/y1QPHh9uJNidWQXGKqe9sfyOAceU7jsSD2b/xjDUoK5C9s1BwbhzUesqgATmLz0dxZl+lb87GxGZOr09aAN3wsU6LTW3JqiptS7bFtg0a4TjShMI6BcFSsPh/7KN44LKYPIPomZxmPlpBG/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PE2Jg7ls; arc=fail smtp.client-ip=40.107.159.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PE2Jg7ls"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tlTPlYgZ/2dEmvY2waFAIEKFINZatgTAnByc1vcaSuzl+mncVeDLGNjHT9/GUFlkcxW2IAUsKakaTb5tHRCkwsR0a9t0G1g93m233FNcf7yMBJ17iOwT8czy1wYFHxwNbkkiDE4By/7JVBbsAsDWYanFjtnWOWVMkdVSvNdRXVESKN8xY8xc+rOptXvLcXSKrlNB9LfcLct/AiI+AktuKDwP8Hwap745JdEqx/p+qcI1Xef5BgXxI8W0ZKtyKFdnyWT9RNENE1iByGGM3/Uf5GP4dkYtp8vTVyVp6+Wanz8XdBB1TfHrA1U5M97QuI0Lo0JFmM2CqVFRAmt4KgVD8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4Mc7EWz04URkw8Ms/9iaGWoTsmbni5zZSlTfhonv3g=;
 b=JVO+ReCCfAWjmAnn8tvn6lY8zzCLkHWebFIeWDF9Yh040/lVnfQ+WPEawxAaTAVOoVLgLRBLwDIT1bctg+Du2pR66AKUX5DaYRx06rsln/VOBLbKFPz6gVSZOy7wWeU7c9uZhLM9oAtD1AgFH0pCbD0L+toABwxbxlzO0zlOcZVGxr26WOw9nB8vreERM0L94eerOg/mAegJNJiEQvvSy37lvceOVvEVWEYLmPo1ZYf/8jiwVi9483/LX1KqX21nqWUt85l2EFk13Zf+uoeM2qCkNrD7ktLnc2T6wNLO+8Dmj4izuT0BPA+Ir3XARMojVUDPHV6HmWHWEmQjHQkw3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4Mc7EWz04URkw8Ms/9iaGWoTsmbni5zZSlTfhonv3g=;
 b=PE2Jg7lsgzdEtBfXYUhmf+4UT2PYxNkrcc7kLnFcrJBnyPCTsWiyVyp4uV8D8mOSVJJdBF6aA+U9/s4JEWAV+XCT0JejEDvZjnnBc10vi7qdrUlONFcjy2vvDQgM6BuutwzXQG1zU++T6PYYKbxKRW2vZpw0HrHneQN7ZOg5dmT1sIaJo3NcnjJD7D1cQTpMee/furPoqdVyk+VLA2/fCk40znZgyho4KkUSQ495p12QDMVVsO2S1dGnCKI9HxqIX7u3wk9fiVqrdzDGVX/MYMZ++1yUMuaX8sbevRxsqHB/rDo56+JPziwrzWzFgSx9TtA+c/ANvD6Z7ZjX76dRvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB11071.eurprd04.prod.outlook.com (2603:10a6:800:262::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Tue, 10 Mar
 2026 02:56:21 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%3]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 02:56:20 +0000
Message-ID: <33e09cc9-69bd-468b-8361-b92a50686f74@nxp.com>
Date: Tue, 10 Mar 2026 10:57:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/3] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
To: Marco Felsch <m.felsch@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 luca.ceresoli@bootlin.com, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20260303-v6-18-topic-imx93-parallel-display-v11-0-1b03733c8461@pengutronix.de>
 <20260303-v6-18-topic-imx93-parallel-display-v11-2-1b03733c8461@pengutronix.de>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20260303-v6-18-topic-imx93-parallel-display-v11-2-1b03733c8461@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:4:197::8) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB11071:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b18a93b-a996-4661-5142-08de7e509bb3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|19092799006|366016|921020;
X-Microsoft-Antispam-Message-Info:
 GozEzNpMx+BsVEMz6iE8RrWkIiAy/DbADF/w8VeY4l0hrCx2dYXI7n6Ltsrar6rE/XpF0JhPQUBwH0G1fwm27beFhE4ynLVbzVauqCBcG6QD1P09oROS/W0lEBj4dVzWJL3/R8MBycRyCR/SgCmNiZY6WRCjb7Mb+kXoou83JefrU+6ymUdkHUR9YuOFoG9PvyEDZ1uRIGmAmkRDsflogY3TKi8X82XxHgTLfM9ldkSjhh0InZ41DS8um8XSCNzAAZuTJvhYIR9+37/2ymy/E6fcjk54UcXY4kvENl89rCPzFVjOsgY3OoDbLySq4FJDtT6beiKk0EfEbwjb+U0CX5DVxmYaltpwJ9z6DahS14aYL6ClWlR54/WoImi+tYoYbpfRGqCgE7oHx1m/pJLcpHnoI88wtdHe0og/llhwW4cGLRcQI9DUzyHbsgDbxx8vm6wVhIXZn1c8SirnYgeRNQpJt0tvxdVcDGudoAt6W1Aa6M0z2QFMMhKWc5Kst4TwqnZviZEisafsBQ6rBcNutDFMzwdlhC3URMzBYAEuFhYlu0O0EaykmeykDu9GVs30yMSaTaTjo28x8xLdA8j98zU4xS2FWqbsNzQS9koMn0ueaqXOWN+s1c5oUeEkS+mxTYbFu9mP3FfUmSDjrSjrAduNc/EBSOdx7uYQmnGkcht5BbyBE7QBrdp3TP1XCqQHb/OyzK7eJmBZy4EslMc9B9ocGvb7r0eNtqwp2ICswd32ClpY6wQkugTouC0V7WZT7agzjGGMkyfaTgRrz8xktWuzBudD4Edj9VAuxl0bzMo=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(19092799006)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?eTBCOTdSWWprUVYvTnlBenNQcTUxZEtSSFU3TlgvMlhvYVVKN0U3K1RmT2Zo?=
 =?utf-8?B?bk9wQndKekFuNXN5T0J3MkpkeTgyRlIvdmo5MkNkV1N4MHlSZGZSR3BYelNF?=
 =?utf-8?B?aFI1eEdpWkl0VE82cjNuaU5kRUVQQ3pUTURnbWxvOTFTL0NqS3V3WXh2NkM1?=
 =?utf-8?B?V2dZWDZkcWE3NzlEMUp6WDBuY2pRRC9LVXQwanE3YkVrcVZHOTFWUDM0aXVy?=
 =?utf-8?B?d3JjQXc2TmpVcTF6bktFalVsVHd5UmpjTkNiV2ZBSGx6ZkJHTlc4cUZZM2Fn?=
 =?utf-8?B?TGhWb215cjlWeDNiejRVOGJBdStXU1VteUsxM2RObUN6ZFkxZkt5aTQ2eTJW?=
 =?utf-8?B?a3VJQTc5NkQ2N1h0T2ZvMkN3bHVGQU1UaVdvMVdMd3owVG00MURhYThFalZG?=
 =?utf-8?B?dnNieWNVYUo2TzBzY2h3NXltSjlCQXVvTXh4MzhSQlg0VFoxUTBYZVIxKzlH?=
 =?utf-8?B?UFlYQjRxZGxIc0l3cFRWbkdxQW0vclN4M3diMFNPZUxqRjF3dy9IeURLRTMv?=
 =?utf-8?B?MGZ1UlpsK0FrNmlOZUdTSnFyMkt2ZkN3Z3hqQlFSbGVUTDVHU2NUbFZUdXFp?=
 =?utf-8?B?RHVaRmVITzBkc01XaDVtWWhqalFZb1l1WnltS08zeEJZOWhTem5lYUkwQ0tC?=
 =?utf-8?B?dk5iK2xacGtINWdMTzBZRHpwRjhvRTNOQ08xUCtjb2JYUWhaNFZjTWtRTFJI?=
 =?utf-8?B?RXJ0elBNdk1ZYkxRc3ZCVTFBVmpoSDFYWFBSNCsyRlVMQXdQRzR5RlJ4NmF3?=
 =?utf-8?B?RktiK2ZEbkwzdGp2dU1KMXhXZS9WcFpORGZDaUEyZzE2aHVuNjRreVg0UEt4?=
 =?utf-8?B?M242dHEyaElpTDRqSUpxQkF6aTdsMXo3YUFGaTcrNU1CSGs5M211ZG5iUHFl?=
 =?utf-8?B?UU1kekVka05rSFArT3lpZERsRURVazhjb3JGZWxWYzBTeW9LU3hvTVh4dEdj?=
 =?utf-8?B?bW5FRklmSUJwT2E5WnMzM0JxRGxWcUlnTm9WL3hyUzVUZmZKSlJLSExwQnly?=
 =?utf-8?B?M0x6UFdiSk9wdGNFanFCdzI2SlJjbjRWNGxjMStTNVdrWHl5OXh0ZXpxdXVh?=
 =?utf-8?B?bEpoZ3lXOU9aMldsQm5zY2IwZThhb2hMUURQZkVnUmNUUFI4Z0pIWVVvVlhk?=
 =?utf-8?B?eW52R2MxajJPNDAzaW54RlZXL2xWUXBQSThuSzhNSE0reHZTQ2h0c1lUK0pG?=
 =?utf-8?B?bVFYMVgzc2NzR3k1WHVZUEhWWWJhOFM5N1pjTXlmZUNrenB1ckhlRjd0c2VC?=
 =?utf-8?B?dG1pQ2NHNXRDVDRxbk1EclhvU0xCQm8wRXR6eEpwZ2lOSmd1SU41eHM5Q09t?=
 =?utf-8?B?cjc1K1ZRazRDWDJXRDl4aVE4WFhza0RmaGo5dzBBWWJYRWlvNnRwdHd2bmtm?=
 =?utf-8?B?VFdWTCsrMDUxejhUbE5PaFRBbHFUd3FUSnFGMXF5Z0dEYktwaGw4aFQvYU1v?=
 =?utf-8?B?dFQrQmljZHNsdkRZVThCK0hPYTZTN0J2cCtydVVmT3h3eUpQd0d4Nzc3OXpX?=
 =?utf-8?B?cEs1U21BbG1UZlFMdWVPQ3RhVkQ4cWRHQ0lNRGt5MERVZUUvUmtWc1dZc3NZ?=
 =?utf-8?B?N3lGREVFL1lPQmZibGNnNmhpU2dwSkUveXZEMEFaaitDL1oyZUVHVmNvTWts?=
 =?utf-8?B?RExTUExVZHh4R1lQVnA0UHlkNWl2WklFb0t5dFhzUXA2Z1dROEFFSUJBdnI5?=
 =?utf-8?B?VFN0Q1Z6KzZ5cGQzV2g2MDNXT2xEM3pxMWNlVmZkMXMrMmZuOGF5TEVqSlBa?=
 =?utf-8?B?OVNPYkcza0JGV2dGd2cxQnNUaExNa202WW1SZWZTQ1hOaTlrc2JoSHNQM0NJ?=
 =?utf-8?B?Y0gwWWVFZjZEdmc4ZG9FNnY1eVZ5T0R0MHpkL2czeU9DWjZuYnJjcEo4WUFY?=
 =?utf-8?B?LzlJWUxtcjAxMVJMSElpWVpaUmY2MG9venJFKzFleU81TEtZWDJQZVlBMTlF?=
 =?utf-8?B?TXNpSVZkTDhtVFlncjlzamN2LzJaT0JsVEVhNnk1WnZNRVZWd01POERFejVW?=
 =?utf-8?B?aGRFNCtHU0JxOTJhSm5pSkJVdFNnWW9KWUF5RXBUQ3IydEYvdmRDdHhMb3Yy?=
 =?utf-8?B?cTg2RzBsZ3p5c2VGcFBsVXJRaDVZMEM2UjFGa0FVZGpPWGRRbStLK0Zua0s4?=
 =?utf-8?B?QjFQc2N5V0Z2Rnh6aVdFNHZ0TExMMEVJUmNYVnlDZjFCN2VZcjAyQmM3L3Jq?=
 =?utf-8?B?N0I2K1c2MEw1cFlsZ1JITW1EVmhkbGM1Y1dwWEV5QmY5N1VMQVJwdjB2MHBB?=
 =?utf-8?B?dzVOdnBYcDBnVGZycTh5NE53MmVVRDUvZlBOdjNQbXNtRUZ1dlUwZDMwcWdw?=
 =?utf-8?B?TEtOdVpwVXJPSVhHUWVkK2d0ZXpoWk9Bb012eExrSVFTdisvS0g2dz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b18a93b-a996-4661-5142-08de7e509bb3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:56:20.9373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YUdzhQ/Ajl/qbXh2FUVj8C3SM1+wHXXGvNya1pp/wBzGC+VkRsLGE0NCEIOx6Sttr3XAeyueHZ8CO9ZU7D2S3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11071

Hi Marco, Luca,

On Tue, Mar 03, 2026 at 11:34:27AM +0100, Marco Felsch wrote:

[...]

> +	next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> +	if (IS_ERR(next_bridge))
> +		return dev_err_probe(dev, PTR_ERR(next_bridge),
> +				     "failed to get next bridge\n");
> +	pdfc->dev = dev;
> +	pdfc->bridge.of_node = dev->of_node;
> +	pdfc->bridge.type = DRM_MODE_CONNECTOR_DPI;
> +	pdfc->bridge.next_bridge = next_bridge;

When I was reviewing another patch[1], I was aware of the necessity of
calling drm_bridge_get() for next_bridge to balance the next bridge's
refcount put from __drm_bridge_free() for this bridge.  I'd be good if
Luca may confirm this is correct.  Sorry for bringing this up late.

[1] https://lore.kernel.org/all/5edd40f3-f83e-4a1b-99d4-1e595fc0e4cb@nxp.com/

-- 
Regards,
Liu Ying
