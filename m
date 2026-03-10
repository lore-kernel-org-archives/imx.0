Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013024.outbound.protection.outlook.com [40.107.159.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D64E3074B1
	for <imx@lists.linux.dev>; Tue, 10 Mar 2026 15:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773154812; cv=fail; b=RhqlGRPQ9gvjRtMboc45s3NHNPMFO65NXUXTrvzzcNaK1mRAX4mxb2aIFvG9lVG+Qs2ZgsJ0JH5mTtw6Zb3XZTtyBA1OJ1/DA4BnG1NBx1F6s5K1lQVjVM1FOgCR8Az1xMGVi552X/luI0WeGR5fwtK+J0VreULvJns/D0BBq+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773154812; c=relaxed/simple;
	bh=3M1wOYRgcdEE4BawSSJIzg6de5Dv/DXbiwdJZ7y7kmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NuZpOOz2LFd+rUt0CExr+hEPvtBeuxtCVA+HZp0a04H1tm++T/BZpFYB7/uML4gHWSXTgUnfdJ6TyboOJezbWvjNEoYFGbvY/l+35qyzHW1GKFimeg3xJf6+XaL1VGX/LBSL+7rMcep+XRf9Sn4BtXDJ10HvGk/kI/QUNrLv5cI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Q7/F69di; arc=fail smtp.client-ip=40.107.159.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Q7/F69di"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l+ucPOXkjGBSUv5Svi/GLUVLLKW6PGQeJu/ZN2LrNrSJ/DgjdQ7QEn9ojo/I2mR/ygHlUuhGexx4dgPCkIIh0b5GU8cw+zuLDVcxHzmuaUipBvsd/UdcbLcy4Mh92aRzITqOpNzqYaLquWPHGFAvTpOFNWNjNSIWqOGSrLn6fgLQAwPqpm6Ejp0Ht/N8kKZOph2otcJrxgNa2pt1RKtYXmcsnLo9cuswek8Rux/LTm3EliMKQ+UXBt1u0dj06MuYS0qoRQG3vOLegJ3TpXWFuunRRjUH5AvruH2LSWLk84G3FVA3kuFDDvzAw4yv/q3Z9h5weMpaBMhiCJ/d0fUEBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9HJnIOv/gl6gXck9N/1XQzG9e0hZX7YRN6h4E+kuow=;
 b=NBF+KOhYX7xmJe4b67LXoKiM5I7AUXs1UbeCQnpy/zyoOaoCGb4JT60t/ZRK8uIQ2QWlMAAIO6P2HXYxV5XLTYWphAw4O+WXdu4qdojnlxXRK5gX+xcxJqM4JLck4iJBDfaP9HP//5k9ST3DaCHKN2s358ZNSnUPEuj+o2Nb5GskJicOwYVerUq0YVmF37uybdCKgsVRblUzdL911B2sfSRoN92A0GuLtSbbU2aoJ90+bUDRfTXatKR8N3E/jTDH7y/cAIt6ZPzV3XI8VcZTrCSsSVvRVdZtRtG4jZD9uF6/XuMvTaNTx8mZi32dTCp4bkOEGG0jLU238ec4rBwxtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9HJnIOv/gl6gXck9N/1XQzG9e0hZX7YRN6h4E+kuow=;
 b=Q7/F69diH70Q++Ys4uVbasPgr2FbQBIB5sqJSMlTiCsFF+ngd+0LCnOa2yibr/Jof93mVNj6td7Emi4a4cl7lT+d9AqWnCUKxeRkIIQ6zr5Qj2MHKQvei/G9bUdaWFEuvvRrwboxqbvP0XDuboC9y/zvNqUBBPuFgEme0q0BbQeM0o2U90hSISN+AYm0tc03wDquw0IH1F2wLfBLONPb6mYBBRjryKJk1fVz4iRYZz5jAlaPKT/dJPcQDzUt9Mf8sjFcYS+2kIVu5OG6sIOQmXHZ6k2+676O7WKd58Gn4V7wAfLgEqxMtIzYA+Pptuh4X7uyPTM0qghhdQJXHA56bA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9107.eurprd04.prod.outlook.com (2603:10a6:102:229::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Tue, 10 Mar
 2026 15:00:06 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Tue, 10 Mar 2026
 15:00:06 +0000
Date: Tue, 10 Mar 2026 10:59:58 -0400
From: Frank Li <Frank.li@nxp.com>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/6] arm64: dts: freescale: imx95-verdin: Add Ivy carrier
 board
Message-ID: <abAx3_5SHKmeZTt0@lizhi-Precision-Tower-5810>
References: <20260305-verdin-imx95-upstream-frank-li-base-v1-0-823fad02def9@toradex.com>
 <20260305-verdin-imx95-upstream-frank-li-base-v1-4-823fad02def9@toradex.com>
 <xghf5wajmzkz3vhi565q5fmclrelczobbvywg7z2tj3gj2rzlq@idn3vyhxxsde>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xghf5wajmzkz3vhi565q5fmclrelczobbvywg7z2tj3gj2rzlq@idn3vyhxxsde>
X-ClientProxiedBy: SA1P222CA0092.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::12) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9107:EE_
X-MS-Office365-Filtering-Correlation-Id: dd2575fd-87a7-417b-6756-08de7eb5b6ff
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|19092799006|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 th2OkAotL9JfyeicUJZlAT1qO/s29In4NuVM6riZAfw1uB7w6D17MLpvm41O6UmYTD8vIdwUaHaGFIb2SyX6xl6ystgiFCbIdIZl+ag5/58AkrezcsSF1XDrm0xk2k+qTSCwWyC3oJdo2fTUTicMVDHaERXorJTMzecK4m14KGpqBVsNtUyUZocWoMzilWOVNX/p4BkE7vHCBs7ORgvs9NWYXyNxh8lCUxeo9Op5to5fYabZtJZFf1p9X7MQeq/ONOwpwAUkRa6V2x0Rmd4kIFi/HtNknQdEyTmY0GvFbhK88sEEnZZV7SWdUScBuPAhFqJbgf5wJYeC9AemSDVe08Se5Rw0e9gO8gIiV2N2D/BWCWsvpVm3w9Xo7nI3UAUYc1WnCG2lVn44qqwnezaFvndfstClriUNAju0JZQfVCrd9GcXr1XQO95CVz94VDQMdKy3TFyHkiv/XzFm9tw+gOctU7PezGPiOwGU+U5lBXojBQCluj4Sa+hz6r4CEwF+XKO/repvPDcqPYdP6T2JXm7uBWNUZPjHhPKitCtgM/VKyq37hBZNUoJuKfV1Yd216DJxnEsQJrztKM2oPUZNRzNSwmkw8+uYHme4y/B7ggR/H5msLf/AERljEmODowLl8+Xa+SUggulsryhmOfFZVD8MxpQIVw6CV5UEL2iShp2Fttl6cC+zvtJbpf/pwBNo/V7GA8lqXbabN9ItKdfWN6rYd2ZI0jZYTzXUbKTc7WUjrtwg5bpH+OSsIZEo6hddoS/vGSKOWHgLm78+yZhqCrlKv2IpHMo+/MRfWt41N0c=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(19092799006)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?1Qe/uXD4wsIgkxboWhUraVF6ExyX9S6YzL9+zttD24r1jW525GLr5ivfun4U?=
 =?us-ascii?Q?fJ/Dge8RvfrqeFC7pWy+qJl+SIEAfzdCI9GbhKjbs0YdPCrYlbP3jrg4mY0h?=
 =?us-ascii?Q?ciarF4C08mB1jlzDidhTOJOHPtgbkGt8cOVsKyqU//9FD84mXULbssJTgqE3?=
 =?us-ascii?Q?AvDiaY2uh0GFvKdSxlYi3Dp/muoxFlErEeZo4AjJsWUmN9QeF3+wpoD3inqs?=
 =?us-ascii?Q?dklAVWT2x/DqJig1jFb9MGu9NrTWTX9ADDnDorJ4kj9WRanL+wPa+79rTZAz?=
 =?us-ascii?Q?BzJ+heTtGmQoaFFitu356MAyjFwZDzWStTESKvQbcEhIFntfK1nMeI9UZvNM?=
 =?us-ascii?Q?D8ObXsAmsqjiN+L0JLrgFX0RN7CxG3AwVPIA6fT7oG0an2JePpfRVBz/KXgH?=
 =?us-ascii?Q?waZO2vfEh5JBJme8QWlSNtYUqDUDf57G4yVdA0LiP8TpwkwEXqGsVVnO1Oac?=
 =?us-ascii?Q?NjvthJCWfWzam6IKNlhoBt5ITse4HXbqERMiWDjZhhyWalntHxUARKTzgAtt?=
 =?us-ascii?Q?5CTl8XRoR6X3nnmrsTFHvF6JlZlQ9PvNdU867v9sedsDBut/rfY47lI1rQmO?=
 =?us-ascii?Q?7WQtdWhWEUuAwNvWcQWi9EcmSV73uSHOuK2xxL/mc9m6OBa02e3UmKsMgkof?=
 =?us-ascii?Q?j4ZgGQ+OhFdjlmK1/MAwIevPAkayShvOXKCNUjjBlOujNghcuviRukmjp8NZ?=
 =?us-ascii?Q?fBjd7Kcp8ieX6x4l/HTdokHuDelM0y6hqI+sDmM9qWijgqCXy3vTudNVnZL3?=
 =?us-ascii?Q?x3qN9ncnIPZb/jjZf17294bJQ5XJwSyGQy0ZG2KIjZ9hsqk5LKfLiVyNSURl?=
 =?us-ascii?Q?5qnU9zUMDVP3YbaERTOT0HXWnHo1WlD80zq+aCugYfrbQ8uIQhnt8rYgT+4i?=
 =?us-ascii?Q?U3uNZKf0nb6x4vssnyzPH/D1v04sMzRk1he2meoNSk+bzUyuVIn6FBShSexQ?=
 =?us-ascii?Q?TzntDWSecmzR0tNnssJ10PQeCuWESwj/FJUAn9USngtLlBz/drU12xHuE2jY?=
 =?us-ascii?Q?Prp8NsFIvwHFmLBImLgcV/XYQk33Rmgn3Ay/OcajaS2g+XGcPhm+UYh/nswQ?=
 =?us-ascii?Q?LsnteJxOsC3MH/i86T35pKhx/T+3Npa+IGoK5oLKz2Mx0n+mPwKMTAvcJqXs?=
 =?us-ascii?Q?Ls9n/F13wkvkVLhGGGgpvdSLZizeatgGgLP6LbZ8AHfQIjuBhrCfQGJdz/Ap?=
 =?us-ascii?Q?iPhDJTPvtCappk+5sbCkSoM/9q6wjpqLtvisYrEEB+Dx9h83twoEtT8kS9lr?=
 =?us-ascii?Q?lcSy8xb9DymmzvOt49Xo1KEJaPIJkmS7ELQDdykGpvuFICI8vUNxzRn9f/5z?=
 =?us-ascii?Q?wY4/uNC5YulHFwqOiG784uUs/5r3A8h3R2k87dCenuHKh/RD/sxVQKhmq7xo?=
 =?us-ascii?Q?ziaFXDMP+hQ5j54kQ7+gUfYWDAju0NXOdZf3vXFs08YWb8+5zYl6iZpHe/nN?=
 =?us-ascii?Q?GEd8XrYjjuiaAi9NqgBUQp1wOO7MmexwPtA11JvrS+1EeD1w/8J+bSVs7cbY?=
 =?us-ascii?Q?Cu3ATkApSDPl36FSwtMoQtAz+x3WRtoNOSW4N+apMr3TfPxoZZh9l+CmMuNF?=
 =?us-ascii?Q?875eKscHQrzZ9wSD18En7H4eyFWEBCx3Fhzx1+Jk1e73ZMwviqCslsEHJQ54?=
 =?us-ascii?Q?NikOR93+U2UN3nc6wVZjosLqRESmgyzwItUNKP8NXmpsipIMom42N1OuEA0y?=
 =?us-ascii?Q?JmvLZ52JMzuEOA8N3zUm93v0V6wAxDTnwfxrmwv/xWk5MGBWcAsYareyuPjL?=
 =?us-ascii?Q?oK+UZbh5bA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd2575fd-87a7-417b-6756-08de7eb5b6ff
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 15:00:05.9526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZktM1zHLcAYM0dbbwGaPHWA85xh4BBzqe7zHO5t7pNQwG9Wl9/ofzYMmlk+HierA6gSpc5wB9A6+TnwiApwxww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9107

On Tue, Mar 10, 2026 at 11:06:08AM +0100, Ernest Van Hoecke wrote:
> On Thu, Mar 05, 2026 at 06:24:32PM +0100, Ernest Van Hoecke wrote:
>
> Hello Krzysztof,
> Hello Frank,
>
> Thanks for your review so far. I noticed that the node order here is
> also wrong and not alphanumeric on node name. I will fix some of them,
> but for some it could mean that for example, 'ain2_voltage_unmanaged:
> voltage-divider-ain2' is far from 'ain2-voltage', which is unfortunate
> since they are related. Together with the the current-sense and
> mux-controller nodes they form something of a logical group and it seems
> undesirable to have them be separated by a long 'leds' node and the
> regulator nodes.
>
> Would it be acceptable to keep the "group" together and sort
> alphanumerically within it, or is it preferred to sort all nodes
> alphanumerically?

Previous happen insert duplicated nodes many times because try "group"
function togeter or random order.

It is hard to define "group".  Use alphanumerically is easily to folllow
and it can use tools to check.

Now I take over freescale dts tree. there are over 500 dts under arm64
freescale. I want to use simple and straingforward rule to manage it.

ref use label (free nameing), you can use nice label name to keep good
orders.

Frank

>
> Kind regards,
> Ernest
