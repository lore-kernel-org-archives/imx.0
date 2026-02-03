Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013067.outbound.protection.outlook.com [52.101.83.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D766833D6EB
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 17:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770138198; cv=fail; b=PU1YGFSNlshnjNk3u4YZjJPjTEgY8JgMY+eYfdyq/qrUtgNXihNEG5ZenSz0Hl4D90PoTCfJWNXocBuDOT9v34bbmLRnMqakZ4GXPmXwAksHRvbbUuVeUbvdzXDk+30ntMC/4+l0RIX+WZAHsgdUeV2b6cAri+MQf23M5ICNUcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770138198; c=relaxed/simple;
	bh=nqag2WUAeexgRXOEjurhrERdhcpSgQfVSz1Z8RCiT1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VXc0tMS8MM9DI+BGelJ/fTeMfD95rShBX9zQ65/vu+T44uoBSxSmHNr/lhpFq/Hu5ZivvZM5kpclCHXwt7Bh3Qlg71+kahu8DUdW015NOj02OerHwHZbY1JqaEglNAXwbksV3Em+TJ28GjI9SGmMh9e+fKZfMOYY9e72IRB54ic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lwChivLN; arc=fail smtp.client-ip=52.101.83.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lwChivLN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YhwaARNrDxTPYzG0lh0yDv60OOqAtsiNly0GpEe2K5q6tlcj9ZH7s5njOoYkLIVBT9dpp0zHm1SU2TcvgXuxYJtrlvCwRClTLkWydqEVx9ERtSe057QWEvFl2rJjJNPkT+PEiey1QlBKGIUsPsvfIu6AUQNC30HF+MpMydtjzyz0lj8lcaHa+WVnu6ZD0ekE9NzpOuTNq9txDOAKofu0aaNwc3lkxkibOr2tJ1y88ts7t/sYlW21gv3BmqU8ISNcB7ANczV/mMWdlg5HM6QwlaH/RWYgG7BsUylFXpTZ+a6bnThnzgJ20haovQk8InIIWjE9LO2HPRAzDvWTIU+8/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LgcGxUcLKmst5wqWB0/O0VQQnBFb9HSaRCg5u6jm1bo=;
 b=TxUW6S/vuNVNDUqD3+lZFXFjXhN2miojsD9NMPkHdRqrTMj+rFjAQ9qGIA1H6fBb0CTuVk2U6K+GLKfZTyv4AyMG6D7UInUrTcVT75/gjJAK6kH35uJ8VeqSA7wWWovu/LkbX/RYB6OxEtCSenCHdwvibQS87kwyKYy/K9apLLqYn8v+tCHtLYlf4oe8fBhEy4OrUUXqQQxYzcVQFdblxPwBFFelTdm0HbIYuPz99H9HS+AZbli4k0DBcyMez7oZH6DAnY/SzOT+zVKTrn4QLGY0SQYeyTBclEcOp/MTuiJoZNZZtWgmqQsHypeLncz9jZ1EJ3y/UfnsMVdGTUejcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LgcGxUcLKmst5wqWB0/O0VQQnBFb9HSaRCg5u6jm1bo=;
 b=lwChivLN6rI61JtDXilmH2tVTUCikcGfbbsbwYPtp+g/ObyAjEIxtI7DqmQP1U4A7mKb1kSiCLG2YcG6oPENCceHK9a/ZrXwbw7wuC4DzdMld1DBBpoClaUyEN2i/dNwCfHP15Emv6tiZCGR2scVfqf5Mr+X5dCAZRwgyc1GAxHgi+T59sTm62TKp+SyrYn1ktTN1s3YzgF1NjErlT4HDyk4bs/VhFSlO2YxEStEgSJENUVfkzGyuTHk+nwzXcWk9X8+uIoJ/wmpUabOPTclMkzaMBLkubvxdGB1PoQzm/ixS8UQI/DTe7y5JaAjH28S+I3o54/FpQvR/9ABSITUPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI2PR04MB11276.eurprd04.prod.outlook.com (2603:10a6:800:296::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 17:03:04 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 17:03:04 +0000
Date: Tue, 3 Feb 2026 12:02:55 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
	daniel.baluta@nxp.com, dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com, Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com, y.moog@phytec.de,
	josua@solid-run.com, francesco.dolcini@toradex.com,
	primoz.fiser@norik.com, imx@lists.linux.dev, kernel@pengutronix.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V5 2/5] arm64: dts: imx93: Rename imx93-11x11-evk.dts to
 imx93-evk-common.dtsi
Message-ID: <aYIqPyC4Tya8CgzM@lizhi-Precision-Tower-5810>
References: <20260203080137.1492376-1-sherry.sun@nxp.com>
 <20260203080137.1492376-3-sherry.sun@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203080137.1492376-3-sherry.sun@nxp.com>
X-ClientProxiedBy: SA9PR13CA0108.namprd13.prod.outlook.com
 (2603:10b6:806:24::23) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI2PR04MB11276:EE_
X-MS-Office365-Filtering-Correlation-Id: daf18e69-a190-4d34-de07-08de63461723
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|1800799024|7416014|376014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?goqdpR0kQpYfQEokWc/VioaIkj77WamSnqlmQJiyCXL4mLkQKvKbt6Rz5a3e?=
 =?us-ascii?Q?VhkxIGhOc9uUpO6LlQesFiGzmwQScjmVVBcd2vgySPCLqMR5JFM3Nyfs74CH?=
 =?us-ascii?Q?K87JoS1xlodZunQX9MSG/16hn/jvvZSIf5/EMYlJBcMV8mNDDboW+esp+qfN?=
 =?us-ascii?Q?HXtI6ltzX33naw0Bw8AbOByMDV1JuiIC9MLPf3lBpsU+wxBoB/fqDRorkZR2?=
 =?us-ascii?Q?8O4uMwD/g0/i1uavKiY5Y73NqKBAUQHmrTd19dDqXj5DUMaxpJT3V2Uc2Wl/?=
 =?us-ascii?Q?wFUDfbLqbpvQj2YCccpC3xWBhziF8L7zisBqLU5X5IoLFT31c1kMrWQscTYk?=
 =?us-ascii?Q?AZLgzgTs9FOJ6cllzVIWg4khWaR6+VkWi+QaSSz7VeCrslpbKfu8pzDkPbFW?=
 =?us-ascii?Q?gw99HpKE/aX4+RLeWKvPoSW40nsGIryDIqW0fzs4V6hGC0uoiBT1X9E0pRsL?=
 =?us-ascii?Q?HZGurZ7FlZX/8J5PBoue5Ibdi1uBiZesW31IWqYvZ9PxXhrU8v6ZE9+i4i7g?=
 =?us-ascii?Q?I3i+qyegBWa9uDDb3UTVOWdni+kOwDlPa5MSmrJsXxY/UJF2yFcbzSqIazdm?=
 =?us-ascii?Q?UhsEjE8jUyWrEPovmHN6LyLWlaMXMXR+QWcmrBR/7Dgf6VjbnAycZbV4tGFw?=
 =?us-ascii?Q?DDnT4xX0G8cL+icrr/ssFSfSPjGRyDi3u5w6GdUHLfibeu0A2fG1PlPWTXV0?=
 =?us-ascii?Q?fCV/MlE4Fktbs/3h1+UQQrdYETmekWKs1ualZ1kEQ8PBsSar7JFCjMAYQZlz?=
 =?us-ascii?Q?HgxjXxmsO0D2Rc8RPMsj63ipmlmSLgzBR51nd6C8l4T0FvXPPGYZwDD53BJi?=
 =?us-ascii?Q?25EBVcHdoeeHoEG7VOlevM7cggqy1PV1BsNqFhiK4Tec9n+yYJhc81QXUuj4?=
 =?us-ascii?Q?23mdCMn8ritd4EcB8cIC1H84ou2vnAnWANV9DjON3Gh67OhvBkmfC8jkhzFM?=
 =?us-ascii?Q?lNvuiXETgqf2VP+YbsVjIZkeKswuLoLMd7gFvVf/AkLZQUNRqH4Pk9ZtdFIO?=
 =?us-ascii?Q?E5w4IyOz/g0v5taj5rY64uc7GiePLxB2i/LpCSEoCT329cTitKJI6bAD862p?=
 =?us-ascii?Q?G7t+Weme6cL12X/9w6Jn5sztGckyMCJsLoSjUnnxq39NiVM8VSROBEerTDkN?=
 =?us-ascii?Q?e1i1GxjrnNNHeeocGEBhNpx3fMM8dZ9cmyYnN9IHcsXD4N9jKAzj2xdl7HFI?=
 =?us-ascii?Q?TXWa7fP8TmgALClJLWWdDSu2raMKlPwLgzkcymC+qjkNJ2MI92WPbSqd+H3e?=
 =?us-ascii?Q?z0SclnV4mYbs5KDH14pYWt49ywAp20cXvRmsv7jbDAaSI2LZUih992axjB79?=
 =?us-ascii?Q?0bX7rIYimQ19ODDPxTZpcAJunxRxovQO2/dxLUm3xv+1UPmhyD1aq0tjN51W?=
 =?us-ascii?Q?+q/R8qJ8VqMO3GKUAN8uMWQDX3PnbxxFSECmis7TaSAwq22edbpv8D4JGxsF?=
 =?us-ascii?Q?X3vJjeYtFVMx2O2BFHV18O+WsjPI6AsjmTcoc1mJZF+LKZ7ooZxoF7QW/CYZ?=
 =?us-ascii?Q?uLAff24GoC5tlUZxPWUikTv8DqhfdZwUqetTTr7uBBVVEVxj9SDq1Ycou235?=
 =?us-ascii?Q?AAi8N9Nc6qlOjdSXlnuKQoie9tAG8wAll59u+zIPeoZM4EL7pHA8VhqGB+VV?=
 =?us-ascii?Q?cDHCu5+ww9QhGonV0EyNoBU=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(7416014)(376014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?lsfN9Q7YoOUgkwvgyALg5mduCCzq9NT/BKPV04iurUL3pVLLzLNEYadKyNgM?=
 =?us-ascii?Q?C3HytRpvEUql8phyb2lSX4kODYctDGUnVOktXB4YzrttHr7lslE0nUvrO1WR?=
 =?us-ascii?Q?NpUPEb26JmqIhJB9jaGd7G6cLo34Ga0k/C5+ovLEhxXo22JfOUXQ2X/LIKmc?=
 =?us-ascii?Q?1UfyEDlFS03pVUQP39bOWghrY8zNecVVLPNat3laZWEFIW+P7smL+JVLzjeb?=
 =?us-ascii?Q?97rUy8Ngj8zNJK2jn12AGCiFyoAHaVDdicyLoeDBmcQy1zykwfHw8NKg+Btv?=
 =?us-ascii?Q?SDLzhb9se8x9D11juLfkIOLTT5bVH0iuz3Exu3YFhTwkLaALRp+4lWmOTe92?=
 =?us-ascii?Q?uh0X/pXPdztCztg6SDC2Rh34FyFT5gKDN7vyAWM9OggqvBfAoPRcZmQ5agwe?=
 =?us-ascii?Q?WoqmFutSzD3TeBcJbsk12v4eSo5k8tIn80WkCAUUMDg4xOvk79lJTA3P2rM5?=
 =?us-ascii?Q?Db8QyE9mxw/g+IwvY2iHbTVcJ03FfhVlrIJSrp0tlNZTlxlNlnOpyCH5p1zJ?=
 =?us-ascii?Q?Kqm3TCJ2ZoPNJhEVRW/EkkL58gd1ewPQT8vPhtz4tOcllGaQDlqYcppQrJAv?=
 =?us-ascii?Q?a5P/wvGTFcjEQxSttKUdRFGLHnltMLJk0YA+bBAoH+37btVnAwcQAW8opYKI?=
 =?us-ascii?Q?yqC+DWLQwvzv4smx88cYW7AAh7H43SQXGBrtc6I584Nl1bhCWH5uyl0Igm7N?=
 =?us-ascii?Q?am+TejDH+mgKMSYpldvbrUJDPAiHBcrzlCPpguqaGJfaVtigjqdYFJsSN+Wk?=
 =?us-ascii?Q?yYSbBdfF3cBkKQ1rMQUnKlnBJph725jA0ifi5lA0LrwOpGUk6dU2Omg6k/Qj?=
 =?us-ascii?Q?gGYeSPG9Ldwf4a/NiOTgzhsmYNkgLAmKeZY4cvOiQp5aSlbzqbUj+4hzmnNU?=
 =?us-ascii?Q?/g2zuGzRp5lOtJaa6i7nly2zE9Iz6u7bLr/RrWJo+N8o8spzgbm0Ft/JMMu8?=
 =?us-ascii?Q?aBQeYI5LfR9EjL8hXyRx8PazdMX53gnJNvo9MUyAQx8QfFyWCrmVcKaluJ5m?=
 =?us-ascii?Q?zOSI7q04xRblr5u8iAstkc0xZ1p8NQY3xrO0NVsbqJaR51ByeoSZxVFNWsKj?=
 =?us-ascii?Q?9B+5tJJRZknT1ZcpHMuVsyCV8twEuIBIaHiUnxIsiPCH2H/PDJxsXZ+QVk6N?=
 =?us-ascii?Q?JGnB8Df637gKAKXZVU4XBSDOZNHcsGt9t4Xe4CJAQy98CL+VbQkQOuWJwWaN?=
 =?us-ascii?Q?thhbPyVK0d+jnJjGp1OcKbrrYNsgigS2bYtWHN7Gf7YNslleTcx6BETJbhWl?=
 =?us-ascii?Q?byS1y4vzyUYZTM3+4iIIs1MuelN4xFjb8pfILZt17Xbtf2wlTYsDEliWU+ny?=
 =?us-ascii?Q?1O2nim3h/pX2shjVaQA7caLhypmfQMj9WppPx4+nfLA4VJYjnRKYUrHoMh6w?=
 =?us-ascii?Q?/jNxc7IG+WZUBy4E4S+NGk5oWiWE8m/FdTQT1vJ1x4sQbWkUwaKqSW1AMiUs?=
 =?us-ascii?Q?1aZcl4g9fn7C+MohYMfCXKw95mo1unLp6GUujJbG/jzVUpN+3ymLu6JmEQlB?=
 =?us-ascii?Q?DsksT2ZB7mLkxilE7E0fuU0M6fHAc3DtUpgb9pHBMVJ/PPoLHiPmpkSKjRxd?=
 =?us-ascii?Q?KcMTUHi2Stpp2zwus0ATNzwsqx/jH/7ER5b3zpG6C8NKJ/WBZuvEG0LHEi/k?=
 =?us-ascii?Q?k4vEr6Nbx/ecsxlhXFYLUKCK7IqnmTofvOILoMybBetH9ecI0IXm5i8Hunz4?=
 =?us-ascii?Q?3J+xfT28MC8WhnNlIM6yUxYfOhexIVskeO3Z6OIvTQmIo92fqqbiDG9oXStW?=
 =?us-ascii?Q?kVryReFVmw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daf18e69-a190-4d34-de07-08de63461723
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 17:03:03.6532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fnbNpJc5F1r/PeXiWfs9Zp2/Ms+uf3unXp/1AF6KCd8odRSJfiG+qS0za3wHPA5b0Oa64xgcHsAITxnwWqgsAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11276

On Tue, Feb 03, 2026 at 04:01:34PM +0800, Sherry Sun wrote:
> The i.MX93 Wireless EVK board reuses most of the design of the 11x11
> EVK. To avoid duplication and DTS-to-DTS include, need to extract the
> common parts into a new imx93-evk-common.dtsi, which will be included
> by both the 11x11 EVK and the Wireless EVK DTS files.
>
> Prepare for extracting common parts of the 11x11 EVK into
> imx93-evk-common.dtsi. This patch contains only structural changes,
> with no functional impact intended.

Avoid use words "this patch".

ARM: dts: imx93: extract common EVK description into shared dtsi

The i.MX93 Wireless EVK reuses most of the 11x11 EVK design. To avoid
duplication and DTS-to-DTS includes, extract the common parts into a new
imx93-evk-common.dtsi shared by both boards.

Rename imx93-11x11-evk.dts to imx93-evk-common.dtsi and include it from
imx93-11x11-evk.dts.

Only structural changes are introduced, with no intended functional
impact.

>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  .../boot/dts/freescale/imx93-11x11-evk.dts    | 1053 +----------------
>  ...93-11x11-evk.dts => imx93-evk-common.dtsi} |    8 +-

imx93-11x11-evk-common.dtsi incase 9x9 need common file later.

Frank


>  2 files changed, 3 insertions(+), 1058 deletions(-)
>  copy arch/arm64/boot/dts/freescale/{imx93-11x11-evk.dts => imx93-evk-common.dtsi} (99%)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> index acb160d3186c..cca923f4ac7a 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> @@ -1,1063 +1,14 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  /*
> - * Copyright 2022 NXP
> + * Copyright 2022,2026 NXP
>   */
>
>  /dts-v1/;
>
> -#include <dt-bindings/usb/pd.h>
>  #include "imx93.dtsi"
> +#include "imx93-evk-common.dtsi"
>
>  / {
>  	model = "NXP i.MX93 11X11 EVK board";
>  	compatible = "fsl,imx93-11x11-evk", "fsl,imx93";
> -
> -	aliases {
> -		ethernet0 = &fec;
> -		ethernet1 = &eqos;
> -		gpio0 = &gpio1;
> -		gpio1 = &gpio2;
> -		gpio2 = &gpio3;
> -		i2c0 = &lpi2c1;
> -		i2c1 = &lpi2c2;
> -		i2c2 = &lpi2c3;
> -		mmc0 = &usdhc1;
> -		mmc1 = &usdhc2;
> -		rtc0 = &bbnsm_rtc;
> -		serial0 = &lpuart1;
> -		serial1 = &lpuart2;
> -		serial2 = &lpuart3;
> -		serial3 = &lpuart4;
> -		serial4 = &lpuart5;
> -	};
> -
> -	chosen {
> -		stdout-path = &lpuart1;
> -	};
> -
> -	reserved-memory {
> -		#address-cells = <2>;
> -		#size-cells = <2>;
> -		ranges;
> -
> -		linux,cma {
> -			compatible = "shared-dma-pool";
> -			reusable;
> -			alloc-ranges = <0 0x80000000 0 0x40000000>;
> -			size = <0 0x10000000>;
> -			linux,cma-default;
> -		};
> -
> -		vdev0vring0: vdev0vring0@a4000000 {
> -			reg = <0 0xa4000000 0 0x8000>;
> -			no-map;
> -		};
> -
> -		vdev0vring1: vdev0vring1@a4008000 {
> -			reg = <0 0xa4008000 0 0x8000>;
> -			no-map;
> -		};
> -
> -		vdev1vring0: vdev1vring0@a4010000 {
> -			reg = <0 0xa4010000 0 0x8000>;
> -			no-map;
> -		};
> -
> -		vdev1vring1: vdev1vring1@a4018000 {
> -			reg = <0 0xa4018000 0 0x8000>;
> -			no-map;
> -		};
> -
> -		rsc_table: rsc-table@2021e000 {
> -			reg = <0 0x2021e000 0 0x1000>;
> -			no-map;
> -		};
> -
> -		vdevbuffer: vdevbuffer@a4020000 {
> -			compatible = "shared-dma-pool";
> -			reg = <0 0xa4020000 0 0x100000>;
> -			no-map;
> -		};
> -
> -	};
> -
> -	flexcan_phy: can-phy {
> -		compatible = "nxp,tja1057";
> -		#phy-cells = <0>;
> -		max-bitrate = <5000000>;
> -		silent-gpios = <&adp5585 6 GPIO_ACTIVE_HIGH>;
> -	};
> -
> -	reg_vdd_12v: regulator-vdd-12v {
> -		compatible = "regulator-fixed";
> -		regulator-name = "VDD_12V";
> -		regulator-min-microvolt = <12000000>;
> -		regulator-max-microvolt = <12000000>;
> -		gpio = <&pcal6524 14 GPIO_ACTIVE_HIGH>;
> -		enable-active-high;
> -	};
> -
> -	reg_vref_1v8: regulator-adc-vref {
> -		compatible = "regulator-fixed";
> -		regulator-name = "vref_1v8";
> -		regulator-min-microvolt = <1800000>;
> -		regulator-max-microvolt = <1800000>;
> -	};
> -
> -	reg_audio_pwr: regulator-audio-pwr {
> -		compatible = "regulator-fixed";
> -		regulator-name = "audio-pwr";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -		gpio = <&adp5585 1 GPIO_ACTIVE_HIGH>;
> -		enable-active-high;
> -	};
> -
> -	reg_m2_pwr: regulator-m2-pwr {
> -		compatible = "regulator-fixed";
> -		regulator-name = "M.2-power";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -		gpio = <&pcal6524 13 GPIO_ACTIVE_HIGH>;
> -		enable-active-high;
> -	};
> -
> -	reg_usdhc2_vmmc: regulator-usdhc2 {
> -		compatible = "regulator-fixed";
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
> -		regulator-name = "VSD_3V3";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
> -		off-on-delay-us = <12000>;
> -		enable-active-high;
> -	};
> -
> -	reg_usdhc3_vmmc: regulator-usdhc3 {
> -		compatible = "regulator-fixed";
> -		regulator-name = "WLAN_EN";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -		vin-supply = <&reg_m2_pwr>;
> -		gpio = <&pcal6524 20 GPIO_ACTIVE_HIGH>;
> -		/*
> -		 * IW612 wifi chip needs more delay than other wifi chips to complete
> -		 * the host interface initialization after power up, otherwise the
> -		 * internal state of IW612 may be unstable, resulting in the failure of
> -		 * the SDIO3.0 switch voltage.
> -		 */
> -		startup-delay-us = <20000>;
> -		enable-active-high;
> -	};
> -
> -	usdhc3_pwrseq: usdhc3_pwrseq {
> -		compatible = "mmc-pwrseq-simple";
> -		reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
> -	};
> -
> -	backlight_lvds: backlight-lvds {
> -		compatible = "pwm-backlight";
> -		pwms = <&adp5585 0 100000 0>;
> -		brightness-levels = <0 100>;
> -		num-interpolated-steps = <100>;
> -		default-brightness-level = <100>;
> -		power-supply = <&reg_vdd_12v>;
> -		enable-gpios = <&adp5585 9 GPIO_ACTIVE_HIGH>;
> -		status = "disabled";
> -	};
> -
> -	bt_sco_codec: bt-sco-codec {
> -		compatible = "linux,bt-sco";
> -		#sound-dai-cells = <1>;
> -	};
> -
> -	sound-bt-sco {
> -		compatible = "simple-audio-card";
> -		simple-audio-card,name = "bt-sco-audio";
> -		simple-audio-card,format = "dsp_a";
> -		simple-audio-card,bitclock-inversion;
> -		simple-audio-card,frame-master = <&btcpu>;
> -		simple-audio-card,bitclock-master = <&btcpu>;
> -
> -		btcpu: simple-audio-card,cpu {
> -			sound-dai = <&sai1>;
> -			dai-tdm-slot-num = <2>;
> -			dai-tdm-slot-width = <16>;
> -		};
> -
> -		simple-audio-card,codec {
> -			sound-dai = <&bt_sco_codec 1>;
> -		};
> -	};
> -
> -	sound-micfil {
> -		compatible = "fsl,imx-audio-card";
> -		model = "micfil-audio";
> -
> -		pri-dai-link {
> -			link-name = "micfil hifi";
> -			format = "i2s";
> -
> -			cpu {
> -				sound-dai = <&micfil>;
> -			};
> -		};
> -	};
> -
> -	sound-wm8962 {
> -		compatible = "fsl,imx-audio-wm8962";
> -		model = "wm8962-audio";
> -		audio-cpu = <&sai3>;
> -		audio-codec = <&wm8962>;
> -		hp-det-gpio = <&pcal6524 4 GPIO_ACTIVE_HIGH>;
> -		audio-routing =
> -			"Headphone Jack", "HPOUTL",
> -			"Headphone Jack", "HPOUTR",
> -			"Ext Spk", "SPKOUTL",
> -			"Ext Spk", "SPKOUTR",
> -			"AMIC", "MICBIAS",
> -			"IN3R", "AMIC",
> -			"IN1R", "AMIC";
> -	};
> -
> -	sound-xcvr {
> -		compatible = "fsl,imx-audio-card";
> -		model = "imx-audio-xcvr";
> -
> -		pri-dai-link {
> -			link-name = "XCVR PCM";
> -
> -			cpu {
> -				sound-dai = <&xcvr>;
> -			};
> -		};
> -	};
> -};
> -
> -&adc1 {
> -	vref-supply = <&reg_vref_1v8>;
> -	status = "okay";
> -};
> -
> -&cm33 {
> -	mbox-names = "tx", "rx", "rxdb";
> -	mboxes = <&mu1 0 1>,
> -		 <&mu1 1 1>,
> -		 <&mu1 3 1>;
> -	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
> -			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
> -	status = "okay";
> -};
> -
> -&eqos {
> -	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&pinctrl_eqos>;
> -	pinctrl-1 = <&pinctrl_eqos_sleep>;
> -	phy-mode = "rgmii-id";
> -	phy-handle = <&ethphy1>;
> -	status = "okay";
> -
> -	mdio {
> -		compatible = "snps,dwmac-mdio";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		clock-frequency = <5000000>;
> -
> -		ethphy1: ethernet-phy@1 {
> -			reg = <1>;
> -			reset-gpios = <&pcal6524 15 GPIO_ACTIVE_LOW>;
> -			reset-assert-us = <10000>;
> -			reset-deassert-us = <80000>;
> -			realtek,clkout-disable;
> -		};
> -	};
> -};
> -
> -&fec {
> -	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&pinctrl_fec>;
> -	pinctrl-1 = <&pinctrl_fec_sleep>;
> -	phy-mode = "rgmii-id";
> -	phy-handle = <&ethphy2>;
> -	fsl,magic-packet;
> -	status = "okay";
> -
> -	mdio {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		clock-frequency = <5000000>;
> -
> -		ethphy2: ethernet-phy@2 {
> -			reg = <2>;
> -			reset-gpios = <&pcal6524 16 GPIO_ACTIVE_LOW>;
> -			reset-assert-us = <10000>;
> -			reset-deassert-us = <80000>;
> -			realtek,clkout-disable;
> -		};
> -	};
> -};
> -
> -&flexcan2 {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_flexcan2>;
> -	phys = <&flexcan_phy>;
> -	status = "okay";
> -};
> -
> -&lpi2c1 {
> -	clock-frequency = <400000>;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_lpi2c1>;
> -	status = "okay";
> -
> -	wm8962: codec@1a {
> -		compatible = "wlf,wm8962";
> -		reg = <0x1a>;
> -		clocks = <&clk IMX93_CLK_SAI3_GATE>;
> -		DCVDD-supply = <&reg_audio_pwr>;
> -		DBVDD-supply = <&reg_audio_pwr>;
> -		AVDD-supply = <&reg_audio_pwr>;
> -		CPVDD-supply = <&reg_audio_pwr>;
> -		MICVDD-supply = <&reg_audio_pwr>;
> -		PLLVDD-supply = <&reg_audio_pwr>;
> -		SPKVDD1-supply = <&reg_audio_pwr>;
> -		SPKVDD2-supply = <&reg_audio_pwr>;
> -		gpio-cfg = <
> -			0x0000 /* 0:Default */
> -			0x0000 /* 1:Default */
> -			0x0000 /* 2:FN_DMICCLK */
> -			0x0000 /* 3:Default */
> -			0x0000 /* 4:FN_DMICCDAT */
> -			0x0000 /* 5:Default */
> -		>;
> -	};
> -
> -	inertial-meter@6a {
> -		compatible = "st,lsm6dso";
> -		reg = <0x6a>;
> -	};
> -};
> -
> -&lpi2c2 {
> -	clock-frequency = <400000>;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_lpi2c2>;
> -	status = "okay";
> -
> -	pcal6524: gpio@22 {
> -		compatible = "nxp,pcal6524";
> -		reg = <0x22>;
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&pinctrl_pcal6524>;
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -		interrupt-controller;
> -		#interrupt-cells = <2>;
> -		interrupt-parent = <&gpio3>;
> -		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> -
> -		m2-pcm-level-shifter-hog {
> -			gpio-hog;
> -			gpios = <19 GPIO_ACTIVE_HIGH>;
> -			output-high;
> -		};
> -	};
> -
> -	pmic@25 {
> -		compatible = "nxp,pca9451a";
> -		reg = <0x25>;
> -		interrupt-parent = <&pcal6524>;
> -		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
> -
> -		regulators {
> -			buck1: BUCK1 {
> -				regulator-name = "BUCK1";
> -				regulator-min-microvolt = <610000>;
> -				regulator-max-microvolt = <950000>;
> -				regulator-boot-on;
> -				regulator-always-on;
> -				regulator-ramp-delay = <3125>;
> -			};
> -
> -			buck2: BUCK2 {
> -				regulator-name = "BUCK2";
> -				regulator-min-microvolt = <600000>;
> -				regulator-max-microvolt = <670000>;
> -				regulator-boot-on;
> -				regulator-always-on;
> -				regulator-ramp-delay = <3125>;
> -			};
> -
> -			buck4: BUCK4 {
> -				regulator-name = "BUCK4";
> -				regulator-min-microvolt = <1620000>;
> -				regulator-max-microvolt = <3400000>;
> -				regulator-boot-on;
> -				regulator-always-on;
> -			};
> -
> -			buck5: BUCK5 {
> -				regulator-name = "BUCK5";
> -				regulator-min-microvolt = <1620000>;
> -				regulator-max-microvolt = <3400000>;
> -				regulator-boot-on;
> -				regulator-always-on;
> -			};
> -
> -			buck6: BUCK6 {
> -				regulator-name = "BUCK6";
> -				regulator-min-microvolt = <1060000>;
> -				regulator-max-microvolt = <1140000>;
> -				regulator-boot-on;
> -				regulator-always-on;
> -			};
> -
> -			ldo1: LDO1 {
> -				regulator-name = "LDO1";
> -				regulator-min-microvolt = <1620000>;
> -				regulator-max-microvolt = <1980000>;
> -				regulator-boot-on;
> -				regulator-always-on;
> -			};
> -
> -			ldo4: LDO4 {
> -				regulator-name = "LDO4";
> -				regulator-min-microvolt = <800000>;
> -				regulator-max-microvolt = <840000>;
> -				regulator-boot-on;
> -				regulator-always-on;
> -			};
> -
> -			ldo5: LDO5 {
> -				regulator-name = "LDO5";
> -				regulator-min-microvolt = <1800000>;
> -				regulator-max-microvolt = <3300000>;
> -				regulator-boot-on;
> -				regulator-always-on;
> -			};
> -		};
> -	};
> -
> -	adp5585: io-expander@34 {
> -		compatible = "adi,adp5585-00", "adi,adp5585";
> -		reg = <0x34>;
> -		vdd-supply = <&buck4>;
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -		gpio-reserved-ranges = <5 1>;
> -		#pwm-cells = <3>;
> -	};
> -};
> -
> -&lpi2c3 {
> -	clock-frequency = <400000>;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_lpi2c3>;
> -	status = "okay";
> -
> -	adp5585_isp: io-expander@34 {
> -		compatible = "adi,adp5585-01", "adi,adp5585";
> -		reg = <0x34>;
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -		#pwm-cells = <3>;
> -	};
> -
> -	ptn5110: tcpc@50 {
> -		compatible = "nxp,ptn5110", "tcpci";
> -		reg = <0x50>;
> -		interrupt-parent = <&gpio3>;
> -		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> -
> -		typec1_con: connector {
> -			compatible = "usb-c-connector";
> -			label = "USB-C";
> -			power-role = "dual";
> -			data-role = "dual";
> -			try-power-role = "sink";
> -			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> -			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> -				     PDO_VAR(5000, 20000, 3000)>;
> -			op-sink-microwatt = <15000000>;
> -			self-powered;
> -
> -			ports {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
> -				port@0 {
> -					reg = <0>;
> -
> -					typec1_dr_sw: endpoint {
> -						remote-endpoint = <&usb1_drd_sw>;
> -					};
> -				};
> -			};
> -		};
> -	};
> -
> -	ptn5110_2: tcpc@51 {
> -		compatible = "nxp,ptn5110", "tcpci";
> -		reg = <0x51>;
> -		interrupt-parent = <&gpio3>;
> -		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> -
> -		typec2_con: connector {
> -			compatible = "usb-c-connector";
> -			label = "USB-C";
> -			power-role = "dual";
> -			data-role = "dual";
> -			try-power-role = "sink";
> -			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> -			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> -				     PDO_VAR(5000, 20000, 3000)>;
> -			op-sink-microwatt = <15000000>;
> -			self-powered;
> -
> -			ports {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
> -				port@0 {
> -					reg = <0>;
> -
> -					typec2_dr_sw: endpoint {
> -						remote-endpoint = <&usb2_drd_sw>;
> -					};
> -				};
> -			};
> -		};
> -	};
> -
> -	pcf2131: rtc@53 {
> -		compatible = "nxp,pcf2131";
> -		reg = <0x53>;
> -		interrupt-parent = <&pcal6524>;
> -		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
> -	};
> -};
> -
> -&lpuart1 { /* console */
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_uart1>;
> -	status = "okay";
> -};
> -
> -&lpuart5 {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_uart5>;
> -	status = "okay";
> -
> -	bluetooth {
> -		compatible = "nxp,88w8987-bt";
> -	};
> -};
> -
> -&micfil {
> -	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&pinctrl_pdm>;
> -	pinctrl-1 = <&pinctrl_pdm_sleep>;
> -	assigned-clocks = <&clk IMX93_CLK_PDM>;
> -	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
> -	assigned-clock-rates = <49152000>;
> -	status = "okay";
> -};
> -
> -&mu1 {
> -	status = "okay";
> -};
> -
> -&mu2 {
> -	status = "okay";
> -};
> -
> -&sai1 {
> -	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&pinctrl_sai1>;
> -	pinctrl-1 = <&pinctrl_sai1_sleep>;
> -	assigned-clocks = <&clk IMX93_CLK_SAI1>;
> -	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
> -	assigned-clock-rates = <12288000>;
> -	fsl,sai-mclk-direction-output;
> -	status = "okay";
> -};
> -
> -&sai3 {
> -	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&pinctrl_sai3>;
> -	pinctrl-1 = <&pinctrl_sai3_sleep>;
> -	assigned-clocks = <&clk IMX93_CLK_SAI3>;
> -	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
> -	assigned-clock-rates = <12288000>;
> -	fsl,sai-mclk-direction-output;
> -	status = "okay";
> -};
> -
> -&usbotg1 {
> -	dr_mode = "otg";
> -	hnp-disable;
> -	srp-disable;
> -	adp-disable;
> -	usb-role-switch;
> -	disable-over-current;
> -	samsung,picophy-pre-emp-curr-control = <3>;
> -	samsung,picophy-dc-vol-level-adjust = <7>;
> -	status = "okay";
> -
> -	port {
> -		usb1_drd_sw: endpoint {
> -			remote-endpoint = <&typec1_dr_sw>;
> -		};
> -	};
> -};
> -
> -&usbotg2 {
> -	dr_mode = "otg";
> -	hnp-disable;
> -	srp-disable;
> -	adp-disable;
> -	usb-role-switch;
> -	disable-over-current;
> -	samsung,picophy-pre-emp-curr-control = <3>;
> -	samsung,picophy-dc-vol-level-adjust = <7>;
> -	status = "okay";
> -
> -	port {
> -		usb2_drd_sw: endpoint {
> -			remote-endpoint = <&typec2_dr_sw>;
> -		};
> -	};
> -};
> -
> -&usdhc1 {
> -	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> -	pinctrl-0 = <&pinctrl_usdhc1>;
> -	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
> -	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
> -	bus-width = <8>;
> -	non-removable;
> -	status = "okay";
> -};
> -
> -&usdhc2 {
> -	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> -	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> -	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> -	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> -	pinctrl-3 = <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_gpio_sleep>;
> -	cd-gpios = <&gpio3 00 GPIO_ACTIVE_LOW>;
> -	vmmc-supply = <&reg_usdhc2_vmmc>;
> -	bus-width = <4>;
> -	status = "okay";
> -	no-mmc;
> -};
> -
> -&usdhc3 {
> -	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> -	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
> -	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_wlan>;
> -	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_wlan>;
> -	pinctrl-3 = <&pinctrl_usdhc3_sleep>, <&pinctrl_usdhc3_wlan>;
> -	mmc-pwrseq = <&usdhc3_pwrseq>;
> -	vmmc-supply = <&reg_usdhc3_vmmc>;
> -	bus-width = <4>;
> -	keep-power-in-suspend;
> -	non-removable;
> -	wakeup-source;
> -	status = "okay";
> -};
> -
> -&wdog3 {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_wdog>;
> -	fsl,ext-reset-output;
> -	status = "okay";
> -};
> -
> -&xcvr {
> -	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&pinctrl_spdif>;
> -	pinctrl-1 = <&pinctrl_spdif_sleep>;
> -	assigned-clocks = <&clk IMX93_CLK_SPDIF>,
> -			 <&clk IMX93_CLK_AUDIO_XCVR>;
> -	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>,
> -			 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
> -	assigned-clock-rates = <12288000>, <200000000>;
> -	status = "okay";
> -};
> -
> -&iomuxc {
> -	pinctrl_eqos: eqosgrp {
> -		fsl,pins = <
> -			MX93_PAD_ENET1_MDC__ENET_QOS_MDC			0x57e
> -			MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO			0x57e
> -			MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x57e
> -			MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x57e
> -			MX93_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x57e
> -			MX93_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x57e
> -			MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x58e
> -			MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x57e
> -			MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x57e
> -			MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1			0x57e
> -			MX93_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x57e
> -			MX93_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x57e
> -			MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x58e
> -			MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x57e
> -		>;
> -	};
> -
> -	pinctrl_eqos_sleep: eqossleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_ENET1_MDC__GPIO4_IO00				0x31e
> -			MX93_PAD_ENET1_MDIO__GPIO4_IO01				0x31e
> -			MX93_PAD_ENET1_RD0__GPIO4_IO10                          0x31e
> -			MX93_PAD_ENET1_RD1__GPIO4_IO11				0x31e
> -			MX93_PAD_ENET1_RD2__GPIO4_IO12				0x31e
> -			MX93_PAD_ENET1_RD3__GPIO4_IO13				0x31e
> -			MX93_PAD_ENET1_RXC__GPIO4_IO09                          0x31e
> -			MX93_PAD_ENET1_RX_CTL__GPIO4_IO08			0x31e
> -			MX93_PAD_ENET1_TD0__GPIO4_IO05                          0x31e
> -			MX93_PAD_ENET1_TD1__GPIO4_IO04                          0x31e
> -			MX93_PAD_ENET1_TD2__GPIO4_IO03				0x31e
> -			MX93_PAD_ENET1_TD3__GPIO4_IO02				0x31e
> -			MX93_PAD_ENET1_TXC__GPIO4_IO07                          0x31e
> -			MX93_PAD_ENET1_TX_CTL__GPIO4_IO06                       0x31e
> -		>;
> -	};
> -
> -	pinctrl_fec: fecgrp {
> -		fsl,pins = <
> -			MX93_PAD_ENET2_MDC__ENET1_MDC			0x57e
> -			MX93_PAD_ENET2_MDIO__ENET1_MDIO			0x57e
> -			MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0		0x57e
> -			MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1		0x57e
> -			MX93_PAD_ENET2_RD2__ENET1_RGMII_RD2		0x57e
> -			MX93_PAD_ENET2_RD3__ENET1_RGMII_RD3		0x57e
> -			MX93_PAD_ENET2_RXC__ENET1_RGMII_RXC		0x58e
> -			MX93_PAD_ENET2_RX_CTL__ENET1_RGMII_RX_CTL	0x57e
> -			MX93_PAD_ENET2_TD0__ENET1_RGMII_TD0		0x57e
> -			MX93_PAD_ENET2_TD1__ENET1_RGMII_TD1		0x57e
> -			MX93_PAD_ENET2_TD2__ENET1_RGMII_TD2		0x57e
> -			MX93_PAD_ENET2_TD3__ENET1_RGMII_TD3		0x57e
> -			MX93_PAD_ENET2_TXC__ENET1_RGMII_TXC		0x58e
> -			MX93_PAD_ENET2_TX_CTL__ENET1_RGMII_TX_CTL	0x57e
> -		>;
> -	};
> -
> -	pinctrl_fec_sleep: fecsleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_ENET2_MDC__GPIO4_IO14			0x51e
> -			MX93_PAD_ENET2_MDIO__GPIO4_IO15			0x51e
> -			MX93_PAD_ENET2_RD0__GPIO4_IO24			0x51e
> -			MX93_PAD_ENET2_RD1__GPIO4_IO25			0x51e
> -			MX93_PAD_ENET2_RD2__GPIO4_IO26			0x51e
> -			MX93_PAD_ENET2_RD3__GPIO4_IO27			0x51e
> -			MX93_PAD_ENET2_RXC__GPIO4_IO23                  0x51e
> -			MX93_PAD_ENET2_RX_CTL__GPIO4_IO22		0x51e
> -			MX93_PAD_ENET2_TD0__GPIO4_IO19			0x51e
> -			MX93_PAD_ENET2_TD1__GPIO4_IO18			0x51e
> -			MX93_PAD_ENET2_TD2__GPIO4_IO17			0x51e
> -			MX93_PAD_ENET2_TD3__GPIO4_IO16			0x51e
> -			MX93_PAD_ENET2_TXC__GPIO4_IO21                  0x51e
> -			MX93_PAD_ENET2_TX_CTL__GPIO4_IO20               0x51e
> -		>;
> -	};
> -
> -	pinctrl_flexcan2: flexcan2grp {
> -		fsl,pins = <
> -			MX93_PAD_GPIO_IO25__CAN2_TX	0x139e
> -			MX93_PAD_GPIO_IO27__CAN2_RX	0x139e
> -		>;
> -	};
> -
> -	pinctrl_uart1: uart1grp {
> -		fsl,pins = <
> -			MX93_PAD_UART1_RXD__LPUART1_RX			0x31e
> -			MX93_PAD_UART1_TXD__LPUART1_TX			0x31e
> -		>;
> -	};
> -
> -	pinctrl_uart5: uart5grp {
> -		fsl,pins = <
> -			MX93_PAD_DAP_TDO_TRACESWO__LPUART5_TX		0x31e
> -			MX93_PAD_DAP_TDI__LPUART5_RX			0x31e
> -			MX93_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B		0x31e
> -			MX93_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B		0x31e
> -		>;
> -	};
> -
> -	pinctrl_lpi2c1: lpi2c1grp {
> -		fsl,pins = <
> -			MX93_PAD_I2C1_SCL__LPI2C1_SCL			0x40000b9e
> -			MX93_PAD_I2C1_SDA__LPI2C1_SDA			0x40000b9e
> -		>;
> -	};
> -
> -	pinctrl_lpi2c2: lpi2c2grp {
> -		fsl,pins = <
> -			MX93_PAD_I2C2_SCL__LPI2C2_SCL			0x40000b9e
> -			MX93_PAD_I2C2_SDA__LPI2C2_SDA			0x40000b9e
> -		>;
> -	};
> -
> -	pinctrl_lpi2c3: lpi2c3grp {
> -		fsl,pins = <
> -			MX93_PAD_GPIO_IO28__LPI2C3_SDA			0x40000b9e
> -			MX93_PAD_GPIO_IO29__LPI2C3_SCL			0x40000b9e
> -		>;
> -	};
> -
> -	pinctrl_pcal6524: pcal6524grp {
> -		fsl,pins = <
> -			MX93_PAD_CCM_CLKO2__GPIO3_IO27			0x31e
> -		>;
> -	};
> -
> -	pinctrl_pdm: pdmgrp {
> -		fsl,pins = <
> -			MX93_PAD_PDM_CLK__PDM_CLK			0x31e
> -			MX93_PAD_PDM_BIT_STREAM0__PDM_BIT_STREAM00	0x31e
> -			MX93_PAD_PDM_BIT_STREAM1__PDM_BIT_STREAM01	0x31e
> -		>;
> -	};
> -
> -	pinctrl_pdm_sleep: pdmsleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_PDM_CLK__GPIO1_IO08			0x31e
> -			MX93_PAD_PDM_BIT_STREAM0__GPIO1_IO09		0x31e
> -			MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10		0x31e
> -		>;
> -	};
> -
> -	pinctrl_sai1: sai1grp {
> -		fsl,pins = <
> -			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK			0x31e
> -			MX93_PAD_SAI1_TXFS__SAI1_TX_SYNC		0x31e
> -			MX93_PAD_SAI1_TXD0__SAI1_TX_DATA00		0x31e
> -			MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00		0x31e
> -		>;
> -	};
> -
> -	pinctrl_sai1_sleep: sai1sleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_SAI1_TXC__GPIO1_IO12                   0x51e
> -			MX93_PAD_SAI1_TXFS__GPIO1_IO11			0x51e
> -			MX93_PAD_SAI1_TXD0__GPIO1_IO13			0x51e
> -			MX93_PAD_SAI1_RXD0__GPIO1_IO14			0x51e
> -		>;
> -	};
> -
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc1: usdhc1grp {
> -		fsl,pins = <
> -			MX93_PAD_SD1_CLK__USDHC1_CLK		0x1582
> -			MX93_PAD_SD1_CMD__USDHC1_CMD		0x40001382
> -			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x40001382
> -			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x40001382
> -			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x40001382
> -			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x40001382
> -			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x40001382
> -			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x40001382
> -			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x40001382
> -			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x40001382
> -			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x1582
> -		>;
> -	};
> -
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD1_CLK__USDHC1_CLK		0x158e
> -			MX93_PAD_SD1_CMD__USDHC1_CMD		0x4000138e
> -			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000138e
> -			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x4000138e
> -			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x4000138e
> -			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x4000138e
> -			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x4000138e
> -			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x4000138e
> -			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x4000138e
> -			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x4000138e
> -			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x158e
> -		>;
> -	};
> -
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD1_CLK__USDHC1_CLK		0x15fe
> -			MX93_PAD_SD1_CMD__USDHC1_CMD		0x400013fe
> -			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x400013fe
> -			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x400013fe
> -			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x400013fe
> -			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x400013fe
> -			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x400013fe
> -			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x400013fe
> -			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x400013fe
> -			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x400013fe
> -			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x15fe
> -		>;
> -	};
> -
> -	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x31e
> -		>;
> -	};
> -
> -	pinctrl_sai3: sai3grp {
> -		fsl,pins = <
> -			MX93_PAD_GPIO_IO26__SAI3_TX_SYNC                0x31e
> -			MX93_PAD_GPIO_IO16__SAI3_TX_BCLK                0x31e
> -			MX93_PAD_GPIO_IO17__SAI3_MCLK           0x31e
> -			MX93_PAD_GPIO_IO19__SAI3_TX_DATA00              0x31e
> -			MX93_PAD_GPIO_IO20__SAI3_RX_DATA00              0x31e
> -		>;
> -	};
> -
> -	pinctrl_sai3_sleep: sai3sleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_GPIO_IO26__GPIO2_IO26			0x51e
> -			MX93_PAD_GPIO_IO16__GPIO2_IO16			0x51e
> -			MX93_PAD_GPIO_IO17__GPIO2_IO17			0x51e
> -			MX93_PAD_GPIO_IO19__GPIO2_IO19			0x51e
> -			MX93_PAD_GPIO_IO20__GPIO2_IO20			0x51e
> -		>;
> -	};
> -
> -	pinctrl_spdif: spdifgrp {
> -		fsl,pins = <
> -			MX93_PAD_GPIO_IO22__SPDIF_IN		0x31e
> -			MX93_PAD_GPIO_IO23__SPDIF_OUT		0x31e
> -		>;
> -	};
> -
> -	pinctrl_spdif_sleep: spdifsleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_GPIO_IO22__GPIO2_IO22		0x31e
> -			MX93_PAD_GPIO_IO23__GPIO2_IO23		0x31e
> -		>;
> -	};
> -
> -	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
> -		fsl,pins = <
> -			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
> -		>;
> -	};
> -
> -	pinctrl_usdhc2_gpio_sleep: usdhc2gpiosleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x51e
> -		>;
> -	};
> -
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc2: usdhc2grp {
> -		fsl,pins = <
> -			MX93_PAD_SD2_CLK__USDHC2_CLK		0x1582
> -			MX93_PAD_SD2_CMD__USDHC2_CMD		0x40001382
> -			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x40001382
> -			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x40001382
> -			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x40001382
> -			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x40001382
> -			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> -		>;
> -	};
> -
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD2_CLK__USDHC2_CLK		0x158e
> -			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000138e
> -			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000138e
> -			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000138e
> -			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x4000138e
> -			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x4000138e
> -			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> -		>;
> -	};
> -
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD2_CLK__USDHC2_CLK		0x15fe
> -			MX93_PAD_SD2_CMD__USDHC2_CMD		0x400013fe
> -			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x400013fe
> -			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x400013fe
> -			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x400013fe
> -			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x400013fe
> -			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> -		>;
> -	};
> -
> -	pinctrl_usdhc2_sleep: usdhc2sleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD2_CLK__GPIO3_IO01            0x51e
> -			MX93_PAD_SD2_CMD__GPIO3_IO02		0x51e
> -			MX93_PAD_SD2_DATA0__GPIO3_IO03		0x51e
> -			MX93_PAD_SD2_DATA1__GPIO3_IO04		0x51e
> -			MX93_PAD_SD2_DATA2__GPIO3_IO05		0x51e
> -			MX93_PAD_SD2_DATA3__GPIO3_IO06		0x51e
> -			MX93_PAD_SD2_VSELECT__GPIO3_IO19	0x51e
> -		>;
> -	};
> -
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc3: usdhc3grp {
> -		fsl,pins = <
> -			MX93_PAD_SD3_CLK__USDHC3_CLK		0x1582
> -			MX93_PAD_SD3_CMD__USDHC3_CMD		0x40001382
> -			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x40001382
> -			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x40001382
> -			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x40001382
> -			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x40001382
> -		>;
> -	};
> -
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD3_CLK__USDHC3_CLK		0x158e
> -			MX93_PAD_SD3_CMD__USDHC3_CMD		0x4000138e
> -			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x4000138e
> -			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x4000138e
> -			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x4000138e
> -			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x4000138e
> -		>;
> -	};
> -
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD3_CLK__USDHC3_CLK		0x15fe
> -			MX93_PAD_SD3_CMD__USDHC3_CMD		0x400013fe
> -			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x400013fe
> -			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x400013fe
> -			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x400013fe
> -			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x400013fe
> -		>;
> -	};
> -
> -	pinctrl_usdhc3_sleep: usdhc3grpsleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD3_CLK__GPIO3_IO20		0x31e
> -			MX93_PAD_SD3_CMD__GPIO3_IO21		0x31e
> -			MX93_PAD_SD3_DATA0__GPIO3_IO22		0x31e
> -			MX93_PAD_SD3_DATA1__GPIO3_IO23		0x31e
> -			MX93_PAD_SD3_DATA2__GPIO3_IO24		0x31e
> -			MX93_PAD_SD3_DATA3__GPIO3_IO25		0x31e
> -		>;
> -	};
> -
> -	pinctrl_usdhc3_wlan: usdhc3wlangrp {
> -		fsl,pins = <
> -			MX93_PAD_CCM_CLKO1__GPIO3_IO26		0x31e
> -		>;
> -	};
> -
> -	pinctrl_wdog: wdoggrp {
> -		fsl,pins = <
> -			MX93_PAD_WDOG_ANY__WDOG1_WDOG_ANY	0x31e
> -		>;
> -	};
>  };
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-evk-common.dtsi
> similarity index 99%
> copy from arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> copy to arch/arm64/boot/dts/freescale/imx93-evk-common.dtsi
> index acb160d3186c..6279b8eb4ea7 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-evk-common.dtsi
> @@ -1,17 +1,11 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  /*
> - * Copyright 2022 NXP
> + * Copyright 2022,2026 NXP
>   */
>
> -/dts-v1/;
> -
>  #include <dt-bindings/usb/pd.h>
> -#include "imx93.dtsi"
>
>  / {
> -	model = "NXP i.MX93 11X11 EVK board";
> -	compatible = "fsl,imx93-11x11-evk", "fsl,imx93";
> -
>  	aliases {
>  		ethernet0 = &fec;
>  		ethernet1 = &eqos;
> --
> 2.37.1
>
