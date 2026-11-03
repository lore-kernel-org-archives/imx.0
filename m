Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793710378;
	b=r8w2VTiZRYzEea0Du04K7ZGwvFQm0y4NNgDNHG9893fEvOGk6l6JB5jAosPEXR4HqEsa
	 46Rr01FRIPbVllE0GqZ/073y5i3Cfsu1tk4MSES5PgfhawTSNxgEAI5to8VlP7JbrkI4s
	 YFvQuiu65q0/xdFh/Zj9IUhIo0oUaKSK0l+Ld7E3mgUUJFIONK60xkJZEMBWo9Pd13zFh
	 701nKng6Re2V8nfAzydXh6EZVGyIcjT6e73vBOjb6R+I4qUlYX2svzD1/qnsK5MT64Byi
	 i4ZF195/AaOrKSmQZSESu4Yu57plruan9ub0yzr45YncRVMNP8lfhj/SF0PmhkOgmcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710378;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:X-LD-Processed:
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
	bh=gB7e03UGaZ49cCEikrz2d8FRUP002vouLdebNACkA0Y=;
	b=Srxd+r60+uKGhmQRvkCeO8LpOwbj9XgIgVgmcUd76GEoKhjT7bbGXBjLRy14zsgOwAHC
	 3CDmkIxQOevS+tfOoVpAIRg7wTQ1Hk7io+2lsIoua1mimRNhi2Narmwls+3PS8Lwe6z8i
	 ouyIRiPq/a6HFApOmQfIwg7O4V2B0TCDizcxj193ODjNmC4W6FBQ2+FRbu8Jr7Omf+bqm
	 UqW4GtQvC4Xnr9mq+y43DMLzOGrzE+wdDAlkXgT+QnAhdYs7smoHxwbzD4QNeSEGfV2j3
	 HyXY/kAaVxZmsM+HhW3KuSokUp1JVwPPqI5CFNLmgj1mL8Mj2THl9PzfNxsK4aEGMUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=AUQhvntD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.46
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99896606A337
	for <imx@lists.linux.dev>; Tue,  3 Nov 2026 12:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99896606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=AUQhvntD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iC2n9XabahahOs1M4H3MHvHO6rWOAl3N8TD+ZqP5cVLKoxMwWAo/MDckxo+E90L/MQacyI3JwXkuiO9NSMnxdLK+GHt5L9+bya1MN1KA6vKbx9LMQXaKVQzKq5JG8rjkrsRP0HFpStMHaN1FR/ng7OtdaNC3KrXW0Zm+J9rGAnVnq/2rfxmjF9KJjMRxhvwto2d5ubGh0rd0jY9QEHTT9jYj9AKZtky4BfuLap+rNsTJrqObX3iNC7mYkJlk0H9mPZxlYrsJMH9JmlhFapM2Bs7GXBRjhxQ2jvok0U0+aRIUObEd4rtx9lblkr9QsAndCuoVTaLPxJTgaMI6ddzX6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gB7e03UGaZ49cCEikrz2d8FRUP002vouLdebNACkA0Y=;
 b=FrF0wtzNdFhGqW2TnOs3extLOTJrxsz+IayI3UVw4Ifo+qP+8vpLPqPJmKpzk3OqYeGXMku1yKYqYNNBDDHGkIu0u/iRfpnrgFqDJsskz2Gx9BTdEEFIyf83bip/6cDfqaU0+E37wi9k+gMSlpzjn/oQg4OVg1UVFaQIiiooK3ntr7wGcqIlp0Hcurq8opom3KSW0pnFrT8xIuPd7nn6HYCpu+6qN/Coo5vtLv0R7guCHAnoerIJqDI3JKjNx7L9J8A9a8nMCcx3GEWRlENy9YSNWtafj8Q56otZLNPurCJ5yF2dvio4gqEwZqnwNTJWWaIjpNnZjzddcfjw2BG9ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gB7e03UGaZ49cCEikrz2d8FRUP002vouLdebNACkA0Y=;
 b=AUQhvntD8pdXQoonQtnfEGczXZm3uUhTDws2Jqse54Tr5B6F7DTG/pmUgqRr6KXOWevE1PiJV7h8gSDmtgOdghBkdeh1ASF980NQPyBwXeFJvw7Jc8twzUtc/Ud0PmGk2tV/dZxZp3h9uZUXbB2MDia1YT92Epxv2AILHC/l8dCspg1c2En8X2E+a7ZY5pna4adlBwqDxMQajYWOsGHlEwyb69KUwy3DONA4AE5LyTc5KBep+nHd9aIyl8tO7/4XviokftxsBqE0RkSowPvSEpmTDj/BgQtF9rZKISPYIpLujwl24T7KYvPba5WfHMgGId0r/xpGUPEqqUio1Huehg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19) by MRWPR04MB12355.eurprd04.prod.outlook.com
 (2603:10a6:501:82::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 12:52:54 +0000
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa]) by GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa%3]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 12:52:54 +0000
Date: Tue, 3 Nov 2026 14:52:49 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] arm64: dts: freescale: imx95-aquila: Keep DP_PWR
 always enabled
Message-ID: <aunY8rHDhs-04HmQ@vm>
References: <20261103105323.2394012-1-francesco@dolcini.it>
 <aunOT21BZmGkJQ25@vm>
 <aunUon2a8W0mcele@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aunUon2a8W0mcele@francesco-nb>
X-ClientProxiedBy: FR4P281CA0400.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::20) To GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12318:EE_|MRWPR04MB12355:EE_
X-MS-Office365-Filtering-Correlation-Id: 96338858-d61d-40ed-0c98-08df39a9605d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|7416014|376014|1800799024|261022105027099003|11063799006|261026140227099003|261026121527099003|261028144727099003|4143699003|22082099003|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	L1GwuBPZ0e03p2xVNmRoPw3fFRrsc7hsdF9P44UZqXjACkl+wfWVJzlWJRhkZtw1S0JxLz5Kzc8ykvfj2gKpN3rRoL284gaBLQzP70JFvZv1QyTbY14BJBT8D4oRY5tkVFHVk6NKiUpmHFOYkvmL3j7XzAu9053jt7Gl+4Q/WfLbLhEKBZ5tqoh2Uk0teXURhMHX0hnoZPvSSZ8Mgis2fEljiihb4LCGBe8Uu6UMxB18VUxL9/DpCB8UQFDCP2OgwCbWMZQxlp0uA8Vc5QzwL/b3Mz6d94Rp871xYgOXb4XqvRlKT/fcAwAwLuj6JlnbW3hSC9ZoCg5ye50bBCA6g0pnJkVRF1Nh6ruQINevza8x5612oLbfzNaxCRbwAiip3bH+/39Cj63iz8jPeLNwQewNG8/BGH0t8VAqZw5RoWTeeWesUeCgVTrMUCbAYcrSRJ9DAFqinlTwzWQ+yMg5CusCkRwxQmhv6brgU+fTXRXUV7vKWhXysNmAQEOs9Ppc+NHlIEZnp8J4QbNxV5j7tgbDKjbMJsnm83IHNec2pmO2tgzpyiWpNuJuRjbJ1Hsh9KHlzkdT6PHcaa0bHU+VW7EHpKTYPVDj3odd9vH0gdMarg/SD5Clnxkah5S+6UmGHiAlFsu1lQhFRLjHdiVtVizgRY6ldjoYE3vrRJrugXo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12318.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(7416014)(376014)(1800799024)(261022105027099003)(11063799006)(261026140227099003)(261026121527099003)(261028144727099003)(4143699003)(22082099003)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+NhnTOYPu1JaT9BJEUEV9KF7wCo21eraAtoOCJLYVr73J32Sls/sDlLcqdod?=
 =?us-ascii?Q?DbJiaTejuFPEuiK/BbLhPrz6XedW1AM6GkDeGbbsx1Zu4vLtuB8pGJuwEy8c?=
 =?us-ascii?Q?Z2k02Z8VIS5CWnItsl+X9HCOh7vjGjihQXZVOJXsM5nWGM48tMEocToBQrhm?=
 =?us-ascii?Q?SvBDEXI+BpdRba1XmxpcDFO62nTGuRtFSr2kxKuj6oOYwJDDuNQxu6JuPdtQ?=
 =?us-ascii?Q?6e2KjNEmnebaJq9+SjsYq9mJ4drQh6LMFU0CJBexGd0JkH6G4awxpw7Ue8ag?=
 =?us-ascii?Q?0xIlu381ZHiO0g6i6xfFT3/ZIbRhVmBB6Mq8EU5kLTNDYFZNMkAc4Kr1qj2m?=
 =?us-ascii?Q?yakvseezWwpZQQF9TpTdUwOLdSrSqGYE/I0fgQDr4ZELk4X/wlr1B/Dv6iYm?=
 =?us-ascii?Q?s6nfh3wC7a6iT/pbGy4V4KdDYCzElS/lRC2gFemvtA1iVpC7JeQcVlbjL0kM?=
 =?us-ascii?Q?UQdUxrPXJggUU8rqVOy/FurcOfsw448Qo9N/JSTlzVL9fvWI9XX3H/Viea/a?=
 =?us-ascii?Q?t/B1L7DH0V+vTqj7493Eiob/bLMiE9bz7Vasjz+8xGpK5piJUhszgWL10DT4?=
 =?us-ascii?Q?7PNteTBfCu6fy9DZGKJ42HG7pHfSW+Q8QD1D4fdOP8Rpo1AS7LzlV+N3ET1q?=
 =?us-ascii?Q?dWo7WPp7oW247b14Q6wlqV7eNFt2TQAO2ywia0Cd7aoks98iCLdFw8LvksxN?=
 =?us-ascii?Q?ZR6sPBX+0gU41NOlv2td0qEzwDaZ+BfgSg0JOVG1TVOb8SX7TatXiEzmZ+Zr?=
 =?us-ascii?Q?N1iLKP3s+wUPpXNFlI/HAOjTNVrxiWeOU3KRPJO5ZbZrUPy5xfvAGxWZN4iS?=
 =?us-ascii?Q?VZISDnTGDElWa4FHloElmXkxMYv4rax6LAKlJosInXtm5HghzTMIYdnllFP1?=
 =?us-ascii?Q?b0UfmFJsOowcgWCsJT6hWuqfCot1n76xzDoZstpMignk7lD7LFVC1r4CnyEq?=
 =?us-ascii?Q?NpXEwmi+QTpoWzzBXJW1q/GYbaKAIon7RyQskGFt1tAhinAtNr/Cn8ybYEJ4?=
 =?us-ascii?Q?WWs1MKLY59u36D/6Z0oWat9EHJTS5dUagLoXnfyc4KBZFXAa3IOKvsfBi0qL?=
 =?us-ascii?Q?NItF4mXJuH5S+NLzx+iqBdftscXPi2Up8TInzHX6rflFguN2E5vkTVmU37VR?=
 =?us-ascii?Q?2cFc3YjdqKsTfFO92sDpXd6R5WB4I5Sb+/2wjJNexnKNqicd1s805VvIteip?=
 =?us-ascii?Q?qTsAQF7weGRfZu8vY9CGGJ6izbxjRVQV9uzMAdCqnICoyiUTaSOrDGZMl9uw?=
 =?us-ascii?Q?Uj5mPCTf6P7DmlJMh7p81EtOmJgo1hmWt3JlO0uOhateItABUARs6wB98rlp?=
 =?us-ascii?Q?NoSHYhUd0xnJFnxblEOG3dhSF6kD6ZQcCemwLz5rRUM8g6Exc2mNCkajlgeI?=
 =?us-ascii?Q?FXJpTGbmBcxGgBPJGHuemSw0E0poYs+MHLJVqnatyzocMNzPqa6EwKThRONU?=
 =?us-ascii?Q?jiVkhzyi450Fn0USBifHCfkUi2U9dGn/NnpIFsM/NCFgLtifCShf5FdnM4RL?=
 =?us-ascii?Q?OdtnY2jmSvdCQbVZumpbOCr2AR019GikwRb1zW6nnnJNOvrgqArGEw7lxuvQ?=
 =?us-ascii?Q?DBOIqJD+zC1bTJBFrj1OruByX0wt6dUHB2BjZvIVICFJsh8dU8WOu343qf4b?=
 =?us-ascii?Q?B3KBfkV6XUVdTwuvhhSQVEkN3GdESUbsVCbbJreBTIPsCQxurwFCCkhakGVM?=
 =?us-ascii?Q?xb1Cx2KdsbaKDqwHYcqCrpc5CXJ7qj4B6hZPB7PEfpvXcXjPWRZyDvGiS7hE?=
 =?us-ascii?Q?o8NI9p4MQjEQEWB5z/bYZcLqPc49HOI=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96338858-d61d-40ed-0c98-08df39a9605d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12318.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 12:52:53.9940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sBREZoRDBDOrbR8tkQO3xRqwVzr4GYMDYTfTBgzKETc8ftdSvxGRBhLzG8NzcIm9upKf/pH5oipANl0zo/PI+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12355

On Tue, Nov 03, 2026 at 01:33:38PM +0100, Francesco Dolcini wrote:
> On Tue, Nov 03, 2026 at 02:25:02PM +0200, Laurentiu Palcu wrote:
> > Hi Francesco,
> > 
> > On Tue, Nov 03, 2026 at 11:53:14AM +0100, Francesco Dolcini wrote:
> > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > 
> > > DP_PWR on the DisplayPort connector powers active DP cables and
> > > adapters, which do not work without it. Keep it always enabled, and mark
> > > it boot-on so that the firmware, e.g. U-Boot, enables it at boot,
> > 
> > I believe this "mark it boot-on so that the firmware, e.g. U-Boot,
> > enables it at boot" sentence is a bit misleading. AFAIK, u-boot does not
> 
> It's not.
> 
> We use OF_UPSTREAM, this is the single DT file that both U-Boot and
> Linux (and maybe other projects) use.

Thanks for clarifying.

-- 
Thanks,
Laurentiu
