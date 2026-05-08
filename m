Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011040.outbound.protection.outlook.com [52.101.65.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C5737BE6A
	for <imx@lists.linux.dev>; Fri,  8 May 2026 16:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778256239; cv=fail; b=WxLeKl4OvOqQmDh9X7AVynNZjuueSl3dOYDUiRBrDc+6qNP5rZlzQ6KAongEks24duBXgI5A45k38w1/hgFnO8/2tr70ixcsU3MRBAMiwmj1k6V0B7aDa9KW7kW5fN2h7Lsx+V2akvC7muo0P/nuMTIHmAFfb/2lU8ij5CL9h4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778256239; c=relaxed/simple;
	bh=KxN6S9c64IOcESIBvy9Gy/qr/fFE5DrRUukklyBUy5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UJ0TxtxBk44uuomkFLPmgDot8vA4Ir/17+WOUdvFjwXq19Z14nbqfFuXcQyjxtTD1vttCKbFt2yB0OjDgPCcSJ+mGCOWupVBkfBDd5uASriUnNHHyDShAblLHMdovL2IgNt2zHKXNIeicISNsTLiLcWu7/goHAL7C5CiWSAQcp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gw9gGw/c; arc=fail smtp.client-ip=52.101.65.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gw9gGw/c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JvERttKvUceoy4fm7MysvM/+MjJtlLptiqTuUcpt8Ynn7kdYTXgYaL4YRJXSdHJNul02aLht3tSYNyvtF2jcN0rcnEMYw1ksXy4lPhNFMoSwGpJYS70khGnR51WXZvhOs1ckfx5f6v3OmfpWj5x7pnu+6pV/4+IJF6RuS00PnuXT4BGC9Se5Tp6ThHed6EL0RJUsiIAeanWpnbu+GR1EtzH3jG0iA/TuBmbyqlCrsYnOyhuCFpvOK8184Sv+SAkTXWvOKwySnGPfrifY0Im8HI50oF9msnbLBoBLq1K8iRyOjOlbmpYOw4o2W1jen3+NAmfExMmOLxWw3e0F2ZYhng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XfYilw1iJyDrYprFoIp9qUbZbN1JNqc3piND+pugE7M=;
 b=Dd5CK50dnnYy/XmvtGWU2CWspNkBjjjyijfjSs82AoRm6xsdXYmG3fDwBZcd8QUoTmJtcjEqi/aeHvpi/bI8XbVbIsQfmDDw2u9yKPPe6G6hGU7w8WLGz7KDqOS585CXY/CjEMqcvCqMe/Xj+1YdWUNQ7eEoei8OafhLWIZtmNV4Z5DrW0EaUwXoWYNi7zvqqFBxIp2AUVdrwgQQnATU2WxPV8QRKlAAZ7+LrYBsES8nmZvsZjle+dkXnJk3p16GQ//2Z/RHP0OjuPtZLqxLiXYVLWzh8pe2STW7wpCpjDz2ruzygKzAzsyObaBynkNrmohRqGuZYwYA207EPKk4fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfYilw1iJyDrYprFoIp9qUbZbN1JNqc3piND+pugE7M=;
 b=gw9gGw/cyo97bDgFAhwII1R38v+CL4nSvrD/hHDKvr8Pqe/9oTHy64iLr9xkY8+zGGhJHqB0eEIx9CnbJ4vGRg9m0IsNQg331iOJzDXpbvhG/gku2nqMh6PfCwzg9S8/zTUogpEanV/HdqIPvrniS2IP3VXiahS/WvQRet/CnEuydAB/NRcGIuyHGrN8kGKEYyO7WQ2mrndfkQRDYKHw480K+V1335vZuZJOdATy8iCyphppCdhm8FzHrBJg7rGADLrqs8PfofBc8yJcXOk0SdK4hvdBBXKSRaztEyjJZ646+XxOsnj+XM7W5hdq7opD+DI4117nyiHLOndwt5MjSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBAPR04MB7463.eurprd04.prod.outlook.com (2603:10a6:10:1ad::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Fri, 8 May
 2026 16:03:55 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 16:03:55 +0000
Date: Fri, 8 May 2026 12:03:48 -0400
From: Frank Li <Frank.li@nxp.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, kernel@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: imx95: Increase PCIe outbound address
 space to 2GB
Message-ID: <af4JZFGrzbudJU9s@lizhi-Precision-Tower-5810>
References: <20260508022857.1500938-1-hongxing.zhu@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508022857.1500938-1-hongxing.zhu@nxp.com>
X-ClientProxiedBy: PH7P220CA0136.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::8) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBAPR04MB7463:EE_
X-MS-Office365-Filtering-Correlation-Id: 40e8ecde-fbda-4278-a45b-08dead1b67f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|19092799006|7416014|18002099003|38350700014|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7RtUVEfOKtktAIy/fG9SYJLe/WCsCAkSekIe+91yk1ED85KjkH5UgTF+pI9nhQWQr6zGG6gzJ9o9yqyAHi+tfis48THnZbjkfKRFk+55BdTuzcebaZy0P3jNWEiiydBmWeCj86RQNYsBL8ALOTD0RtOJoOZbGWf/fCzdOdCsOPAFzvR13g97EMu16Csn7wcN5H434B9dKGYD03FlI2zVAt/yQ4kcs2VE/9a/dCWQBDagkfSMUKZvF7S/kWdU/K7+es7GqYpo0UVrI5v6h9iwbMKSD+SWcKl+eu32tlT8u5GHbracUDMxnCOhA9Koaa+Y/iVFEDOuJV0sDNE66mbiQQ/QwmSkSDCDWQ077b820Z0iClX5u8M7iI3wkueDky5q1wJHDaTVdJ+xSj+2BHXpuLCaCYlM6iQdtdbSHUo2yeWnzvtB1EW9t4hQW7S7yBKMee39HlwmuUqeHH2hC9IuzZ/S4sZXbvSLrpoDL04pHwCi1PCJCuskWjRD0Ztq7x9RGo8Kyd2eKcR+ZDvE9ZoGs9fz5pq8lYRwU5rSPU9j3oj8tsHk0EyAuTloCU+mk7Ysj2152rSTWS6LrbXM+rj5nDsxcUiKN8ThP60Z6vjow/4uEojZAKpIYZl4xzkYg7RuvFBcocUc+5D6yz1E/c767Djw3i/2gY2h1Vhew+RQ11eRWiY+rnOoUm8cdAWzcSCVy0vFqApwNxjkgbYMAQVJSQVJ77zlxm0rKJ43WIB1IxjdZjCdWyZp/bd3KkxoR0ts
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(19092799006)(7416014)(18002099003)(38350700014)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+BOT7/vJSldadrgtT+wSsXJ0e/ZFOgSowM1jZxAf9u9HB7b1WXbtF1xCvNar?=
 =?us-ascii?Q?94lNxus3ymhayFUCzCa8DN/xa81LOoIs8ENWottD0IkFn15D/2jbQ/7yixXw?=
 =?us-ascii?Q?SV37DZwkge+E4/j/UpyMpD00+NcdEVrufKZvzNsNZgX5d2zvflxF3Mvigtzq?=
 =?us-ascii?Q?au/mMBsvqWvkh3vJx3oxZFgHv/bmDw30mu5a5w2TBUV873q39u8KEAQBXP6m?=
 =?us-ascii?Q?pAFuJ06gxbLxoyLrtmO4gvySsu+dfa7zjC+VYnMkazu8R+Ko2PIMxV409Gyw?=
 =?us-ascii?Q?DnGAvc3w2DL3DT5uC0jBSQ/1wR3AwScDyP5lxFtnfBB70XbaAsaMq47fE3xI?=
 =?us-ascii?Q?nEWp33digM+Q2ntpWtVVkoa4k7bwQbV91Yb1bESH9cFPfNO5pzbt0p11FYo0?=
 =?us-ascii?Q?+aouQEP6FFGPOnlf42OmBpwq1vt6MW2YlVod3lgkGXQKe9tHwakH8ztgcwxb?=
 =?us-ascii?Q?R7yShHUXZM0hAKYCcxbTlH3UQJUJJ+hc5PzIvLIMYSFq0uethHHICil/L3Fi?=
 =?us-ascii?Q?f5/0V8U3bIx9Wl4cWj1axcoGbsX7+/E9VJKAdUjJyiym1/PJttq2Z0L4d852?=
 =?us-ascii?Q?Q5Ou8rwyQycG+ZTMm0sQZku5pE8hSDYi07/E7tIHFbUAyFynz3BC1nW/cvlu?=
 =?us-ascii?Q?J6/MwMxxHHwA2rXXRnLvCJuCKMnLGudS2hZ2X9wxEHI+HOBuItZQq2kukh3f?=
 =?us-ascii?Q?nby9FTCeXalOjttQvY1H3y7O0/Q1XF9MOuqg9ebDU6XYdfoMEmiIowOmcfRM?=
 =?us-ascii?Q?5IlzscCIxCvyKiByhqKOybMDMBVH55L1XYBfBc8L2qM6rVThBlkD30XvU+An?=
 =?us-ascii?Q?l2UDS4hNfGiyoKsKChTH5Nw+JXM99lGmQidsSXibjNSsLKALkFyDwTQYc7Ha?=
 =?us-ascii?Q?TmP2rjqPjAthrF5NHYyVlnBrT7PDFEa3F8K4/gStGzJSZs0PiTfiOIyfp9uf?=
 =?us-ascii?Q?UOIV030iKG8h0kludWhwPqwPq/jMLGvG3jP6gunhOBJrwKLALRMxmha0kB6e?=
 =?us-ascii?Q?65JbgvJkfNWocscSvcBtFNm6iQnHYf9cmpx3mWDn8+2wtNXWmbU9R4VbKNHL?=
 =?us-ascii?Q?O7eou70L2AptxeKICn5NR5ofX3/qrKRJjv2J6OxE0GiXdIxfQ+TNmYcjhigN?=
 =?us-ascii?Q?eavxwoy2C6k9fQXN02mK0TYCu2uV47Nuw5e+8KqyU1zmBNLgi8m5pdZxnELT?=
 =?us-ascii?Q?Vvjoilp4uH8ou5P92q4Rou76DyG0A+4QdelSQ47jInC/dIAkZaV+ILu4NsMH?=
 =?us-ascii?Q?rFYWLj9l7VmS/yiiYb8zLzITZUNrbUXeOqB+Z2EausrzhCMZtfpFKQOK15H2?=
 =?us-ascii?Q?Y/f8bDccL6ppo18yme7uvaLDGJK/BUFSyQjPWzOUb7JGKVG+1ZTpXx/vUTiY?=
 =?us-ascii?Q?MnHZB1AjljKe8aTZSTE0nnGe0aksJj8RN1//NCDzrxYU6UWHXH4eYa2WyryO?=
 =?us-ascii?Q?M0TfrAZpZCRmz92mvAzbt/T/Yca+GGXXja9//yhJZrTBkf6bRrP+TQql905T?=
 =?us-ascii?Q?yokUjpqFsOsjNv9j2N6iZl8CsqTp7QLE0tFwySwYPYvh42xIkHeSh/Q2omGE?=
 =?us-ascii?Q?UnqRImJGX14Z82ncRwtpZG/bf9W8aD/8Ehy3BtNVzAH4eFScoRzylPrzLvVG?=
 =?us-ascii?Q?vzJ7ZY11TfK+rOzZxujtJBDnKTdVG17eL4WtvAFODeWjFmnHJ/GrGqwjFc4P?=
 =?us-ascii?Q?YlsBuX1cjuLOMwODvnc2BJmFnSXXeCzH4f5sfSYPQtD/96qXBSbAO3SiLpiE?=
 =?us-ascii?Q?mKLMycTImA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40e8ecde-fbda-4278-a45b-08dead1b67f2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 16:03:55.3967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VXgPvOOEbPGCceT/3Ei9OVERaOBD6PPAYnbew+fhMHPHlWwSb2dsbo1t3kfUx0fj9TuOIt8jlZBkD1yiTon20Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7463

On Fri, May 08, 2026 at 10:28:57AM +0800, Richard Zhu wrote:
> Expand the PCIe outbound memory region from the current size to 2GB
> to support devices requiring larger address spaces.

Fix the PCIe outbound memory region size to 2GB, which is the actual
hardware-supported memory space. The size was incorrectly set to 256MB
during bring-up.

Fix tags heres

Frank

>
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index adcc0e1d3696b..201c0eae13948 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1940,7 +1940,7 @@ pcie0: pcie@4c300000 {
>  			      <0 0x4c340000 0 0x4000>;
>  			reg-names = "dbi", "config", "atu", "app";
>  			ranges = <0x81000000 0x0 0x00000000 0x0 0x6ff00000 0 0x00100000>,
> -				 <0x82000000 0x0 0x10000000 0x9 0x10000000 0 0x10000000>;
> +				 <0x82000000 0x0 0x10000000 0x9 0x10000000 0 0x80000000>;
>  			#address-cells = <3>;
>  			#size-cells = <2>;
>  			device_type = "pci";
> @@ -2015,7 +2015,7 @@ pcie1: pcie@4c380000 {
>  			      <0 0x4c3c0000 0 0x4000>;
>  			reg-names = "dbi", "config", "atu", "app";
>  			ranges = <0x81000000 0 0x00000000 0x8 0x8ff00000 0 0x00100000>,
> -				 <0x82000000 0 0x10000000 0xa 0x10000000 0 0x10000000>;
> +				 <0x82000000 0 0x10000000 0xa 0x10000000 0 0x80000000>;
>  			#address-cells = <3>;
>  			#size-cells = <2>;
>  			device_type = "pci";
>
> base-commit: d570a0d019a3d84832bfc6867647d3581b0052f3
> --
> 2.37.1
>
