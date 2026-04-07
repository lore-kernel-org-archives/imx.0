Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011039.outbound.protection.outlook.com [52.101.65.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484B937E30D
	for <imx@lists.linux.dev>; Tue,  7 Apr 2026 06:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775542251; cv=fail; b=RjtPxAF/wwBE4h0AWUW3coxhdzXU8QVd3hFkEngA4vAl9vSl2htpFJDZfNxZ2XctmlPVxrXXUH//SmOGcmGG4Sse5K7Q4gTZrDQj58k8pi5gNveuXauoxCRQGAYSmlps8Q1jWdjcDCZF57iPpj6NPjnAJO8Oq+lTb1SVqEAyP4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775542251; c=relaxed/simple;
	bh=O/81sQTOm6vpEetzK2Y14yQd4OHoPdyh3Gf2buI3JPc=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qMHVhG78iGcz9LNa7Xs8IHDJtmI7xy7ES3+HDhWxCIcKrQgMxNLuRKh4+Hb9D3eOuIAptdx29ndDau3WUEQ/LigJpnNQxDzJRZzXEAJZpvNim7J/9gQbxaMkWLtfFI0Igt16g0Ag/Guz40q4oE8HyouGAIlovpQWCN5UJQkNX3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CS5bYUDD; arc=fail smtp.client-ip=52.101.65.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CS5bYUDD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=snZTkg3Thv3fku1mZbkJ740ybKERIBj9Sz3lENa8luhcoE/8YIWGM3oKUu4mFFv5cVEWntxIXENAXTC2iwYnbi+haSvCfNbujL56oCo4zmPwcPN5kqt8uyzHENwXMXwITG7hhAABbCAtj7JhlLcQtPjDer5B4a2ta/1oLseF/PY9COwV1V3iWMc7NjVCTQ1OLPpHsb3QfWPWKq1tBff9xuS7ignMGtueWvoINz04slUhsFy85XTODI0JNihcl0mYag+1LksfK4v1bTFjB1AMaxskHbOUtG1Z9kgPZ9JOmR0KrUT1hP+Q8czUxZQYMJGAhA4LFb/TI5eupDHHurjbmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pll1KIoWy34d41fNPncsKs3oQ2IkWSzfQIIpIpbw8r4=;
 b=fvwCFAbo7oZQTgDeaE9/iHJru5VylDL3t1cA8DyKiGljAVKAXr8LIbs5ooeyGexDkCwzHmfYgZofMVLEsBxikik2IUQBhl1SMyyXwKfJSs4F4H5m9qIqF39ba5vUnNQXqc8fzJCLHGs5wHkuLkinSxZECBBNj75p0SigN6Vpp0ZQmrga6pLAvcB+bl1gXJThG1XswG6u84wxgYYr/HG0HqjC5SG9CwzSv+jUOSdJHHpyYgLnuCBiZzTtcZsLBNiKi5kDXHqXxlWBpxKmw69+QudxRnd3FBMPwRbKlRwrgKum4LMFZRUqje8+yhkqf8EdBziuu2qOwXerFKx3ys0fqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pll1KIoWy34d41fNPncsKs3oQ2IkWSzfQIIpIpbw8r4=;
 b=CS5bYUDDa+ydeH3fSmOB+dNOwn/NdnDTD8rGurcI22PH5J8kuAD8RJEaZYqQuilH8ezJxlpkZy8ojGAzrqLRe4SwaRaoWmFFYuOJuX+8TdQswQFAExXt4G7cdRkF0fZp7LxwzDrpGdDxyqzDEeJvIsCo29VNPYmj2FAkaeWIVN4e2M7N08+OwCJL7owSlRCMjKenjDhwvjQ8gGv1KqvA96lh+4wtPiNeLkv3nrZLBdgTiwMjHAMcm3wDyPR0MNxCcFFKSVYd8wuk+4sQWzxD7jPbfVJ3jFBM/8mcBq3wMllxzSf8XMlBNa9nWhliA4w95OaZ91QKIj5pySJWxJmYNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by PAXPR04MB8270.eurprd04.prod.outlook.com (2603:10a6:102:1c7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 06:10:45 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9769.016; Tue, 7 Apr 2026
 06:10:44 +0000
Message-ID: <770fa3c1-a870-4fd2-a33d-b6a4ff11e8ae@oss.nxp.com>
Date: Tue, 7 Apr 2026 09:13:52 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: imx8mp-ab2: Correct interrupt flags
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@nabladev.com>,
 Peng Fan <peng.fan@nxp.com>, Fedor Ross <fedor.ross@ifm.com>,
 Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Viorel Suman <viorel.suman@nxp.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260406063810.25531-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260406063810.25531-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260406063810.25531-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P191CA0026.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::31) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|PAXPR04MB8270:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b0b08bd-ad75-4071-a9e1-08de946c66ee
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|22082099003|18002099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info:
 6i8+qQev64iY5H8YR2cU4Rrr7O/khAf/HoHVcy0vqYUPN1/BVA3shcbKEIer43pU/f9ZX6aL1RYi5MWFnhu3C4h7LrS0bPYPk4cLNWpex+l8fr+XvHkj+mWo7hJOL+SALvq9CTGwp64ZGgesvquM0ZNS4EzNxLJHqsEs0ygZQh1OZ2ptjjqtakqcRxjjORQrDGTsmuqBoxShYdl+HLm/S3yRyvOs+VOOBxuoGALKxOG8ygAUeU7w2sIMnDWPVzBSPY5Th/itO8iKyTnngK8H6iw4JSoJswLGRqhYF9UKdsI4Pl7pt60x3iPdTof5OqooXj391raAT6U6E8Kyre6+AgWip9Pn1sQzHoM7xtUXpVYlKDMolkn/TPjKIx1fc18gG9iPOyVGxb1knS1ypNQNDxj71NzmErq+BPydOq5QNnrDVLMKu1PlNJAy11EXnLz67HJffLSkVy/3Xb622hykmNRBApUKhf1sz9KBHgHqMVIireusqjpjoLiBhpSVvK/pi982Zjo+BF79kOcMDXpL5xPgr41LB4Ff5eL2NXvbnXH5YclMnxLUNCss3cCdbOS4cY2Ox7uSj370ZR3yVPzqQ6yA6lU23sP0GxmETmKPThoD72xfC4VkBkrcJVBSuddMa/T8F6F0uHNIKPV84VIjDDNY/EBKGCfWLbeW1YGYxokuMHArPdtXkHUyGFaCm2iGPmIkWBFAya6j+AWtWniECzPfSqhmg5GhAMWCwLcukprMi5Lo+4/B6i0ukCqeKqNM09/jksimA7ciclj+zGZLGA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?b0FNa0VPTmJmdHZma3ovL0JOQldBQktUNUlWM3R3RnZOWUloRVVGcG4wM0Nm?=
 =?utf-8?B?Z2Q1Nm8yNlZEYVVTcVlrRkFWejU3Y2Y0bWlaQXVEbGtZaVZXMjVJTWxVbzRF?=
 =?utf-8?B?ZVZZNjhPUW5oM0lYdXIzUUpMbG84ZWhxcmlJL3V1Ly8rWEZHUzVPV0xsTDR3?=
 =?utf-8?B?SDR3N1NmSW54b2hsRXY4VTZGUU1CL2FVZmtyY3cxR0JEM1pDVXpJVjZqNFpn?=
 =?utf-8?B?S29yeUQrRm5pdlFKa2FzSXNSazE0SWFBVHFOaGlnNHFzQTBab2NpOXMzSTJn?=
 =?utf-8?B?M2xwYWpMYStORW81cjJ1dXVsLytuM1ViN1JWMzh5VlppS01XUUNLWTNQUU5U?=
 =?utf-8?B?dzZDMHFoMGhRTkdDd0tvbjgyN2FzMWc5b1o5ZUFzYUdwanV5cW5obTB5Ulpj?=
 =?utf-8?B?dDI3Y0dIRS9CU0xJTHhJdkdlNFE1RlFURE0wY056bWhrQXFrZUlycUN6QmRx?=
 =?utf-8?B?YnE5Tk04OWVzVzI3czg1VVhsWmNkVFlEZ3h3ZEVxbm5lT3d5emxiZzU5czNz?=
 =?utf-8?B?Q0FuTHFoSitwSU5hQVkzQkhobHlIR3BpMittNWdqckpIRjk3M3F6eU1iaDNo?=
 =?utf-8?B?Yi9iZGpkcDVPVnR3SFVXZDNBWVlLSkdkVkpLZTZTbzlMaDlTeWZ4S0xpNTcw?=
 =?utf-8?B?eXphQnVoVk9RUk5JbmhOQ3Rra0ZPeEFkOXhwS2pFbThFQ1JaUGlYV3ZuaVFW?=
 =?utf-8?B?dCthem5PRnZQb05rb2NldXE0T3FmVlMxYjV6OGF3OFpVRXVRSCs3cW52MnJw?=
 =?utf-8?B?a0hnUFNKdlpmTXlRTGUwV3JuSXNET3g0NCs5WkdnYzRjbFByaytJY0dIUmQ0?=
 =?utf-8?B?RnBKTnllbEwrWVhPczhuQUE4ZlZLNFVjOFVpSUlKNjZmMXY0WDh2NmVzTE5h?=
 =?utf-8?B?OUpZWTBmcDJBRmw1cUk5bFQ2WWVPRjdhSHRpL3Z6YXFrMHgzczNNcXE4Vy9V?=
 =?utf-8?B?WUk5SHhxT1JuZE9HZUlwMEpra2VHMzNEZlozYk9RdnlvdWhscHNySjlGVDNj?=
 =?utf-8?B?UW1DdFpsS1ViazJMUEViYWk0bldKTGVHNHRQZlQ4ek5yZ2xuZ0ZFeEZaTkkv?=
 =?utf-8?B?Nm9xT0wrQUc2eGllQTlieVVDbEM2RVcxcnIrTWdRY0gxakFNSXRjZUJQY01a?=
 =?utf-8?B?SWRRcEg1OUNjcVprekl0Y3FkeTlhZHg1eFhXSmU2aVNhb1pwYVlWcE1qVWtM?=
 =?utf-8?B?M3lLVTkzMzV4WjFpMWFXbWI2dkNZR2J5MHpMM01XMkorZ2NweDlqK1U3Tktx?=
 =?utf-8?B?VUlJTjBXZURqUEJOR0x1SXljeFUzejc4T2ZxVGVkZk1KdHliT3gzOU9YSFNk?=
 =?utf-8?B?VG5yc1oyZXFGalpLWXAxQ0kwcUcrYlNRSkxaeENXMVVYeWlrWjFKQk5SbTVJ?=
 =?utf-8?B?SnFTYzAvVGdQbGRTWlR4WU5PSTMxb3AxYWpidms1QVNxYzhDT3ByakRVaHht?=
 =?utf-8?B?UmpEOWpBbTFWY2xHSTQ5L1NOcFNVWXFITzVhd2tHcTNsU2ZONWFaQVhaemhz?=
 =?utf-8?B?VUhBTndUSEpwbXQ0NHFqWGpkQW9oL0s0ckJXMXBVZk5BNnA0NTlHcXVSL1ZC?=
 =?utf-8?B?QXJxaHhjaWpsRHRIbWJRSEYySTJwZThTckZwYVFKcEsxQVR2OW51YTU4QU9q?=
 =?utf-8?B?V3JsZlJ6WXlIUFBvVWFFWHdPTHZCOFdTZXNEbmQveGZEcGNqMTZuMXRaL25u?=
 =?utf-8?B?ZDZ6K3ZGWmRPcGhPbUFacHFqNVRZSXdYVVhlVmk2dVBGenJ3MVVIengwWnBI?=
 =?utf-8?B?ZmE2eUpNYVhlQVdZdnNxZlVGVG5mQVZEY3Y2SHVqaWZvcDlPVm9zTHJtb2Z3?=
 =?utf-8?B?MHQ4N2pVUVVKL0doSTladmozUUhQb0dTV2pkRWVZaXgxbG5xYWhISStDYkFC?=
 =?utf-8?B?SFZKSE8rOFNvaThhYk1NTktWQXNPQmxPTEpBNEIzNlFhc2pJZ0Q1TURjdGlE?=
 =?utf-8?B?VTBZVWRKbDJtWnFLaFlyaDJaeGxGZ0VvSW5pMTRueXptcHBsVFpHdmxtSFBC?=
 =?utf-8?B?eE5tcVVNSHBGYjc2aE5xOXp1dWM4ZXdWK3Q3cWtTRVhWUVhOVjB4dXdKc05C?=
 =?utf-8?B?a0tyd1NQaXAzWFBONzkzS2dCblB4NjY4UFRtaWVFQ2pocXBUWjA3VURRRW5W?=
 =?utf-8?B?akFmWlArSFdRK0M0a1VwdFpBeUVtb01sMUM3OEFHcUFtN3VaMzNGTmNNTVQv?=
 =?utf-8?B?bUxqRHpOTVhOQmJKOGE2bm4zei9kTVA2bUdJcVQ1TDlyTXIvc2kzTUVNY1FD?=
 =?utf-8?B?cEZtNTlHcXRITkpocWtuWU91WFVUb2FrU0ZUbHdnUlNwZWdKYndyK3JNbFp3?=
 =?utf-8?B?ZlNDd05aMTByMzA0T09lQWlUTUxET1d5ZCtIYys5RndwY01ZVFZ4UT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b0b08bd-ad75-4071-a9e1-08de946c66ee
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 06:10:43.9601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E4PU2cKmmKNdAGxh45uVNCEcUtvma10YbFZczzgUfK6e3QIM3orn6/y/EdkHvQkbcIqcV9gI7DPdO7SWtUaxWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8270

On 4/6/26 09:38, Krzysztof Kozlowski wrote:
> GPIO_ACTIVE_x flags are not correct in the context of interrupt flags.
> These are simple defines so they could be used in DTS but they will not
> have the same meaning:
> 1. GPIO_ACTIVE_HIGH = 0 => IRQ_TYPE_NONE
> 2. GPIO_ACTIVE_LOW  = 1 => IRQ_TYPE_EDGE_RISING
>
> Correct the interrupt flags, assuming the author of the code wanted the
> same logical behavior behind the name "ACTIVE_xxx", this is:
> ACTIVE_LOW  => IRQ_TYPE_LEVEL_LOW
>
> Fixes: bf68c18150ef ("arm64: dts: imx8mp-ab2: add support for NXP i.MX8MP audio board (version 2)")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>


