Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013048.outbound.protection.outlook.com [52.101.67.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4331DF247
	for <imx@lists.linux.dev>; Thu, 27 Feb 2025 17:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740678232; cv=fail; b=M10GKRYYNTUi5N3NmVN8jdgqDzOjE5x0npXwwoBQ6OUM/LZd4FN52vFqYtxRyJnlitNvvNVX2u5aGjk9mh0djmXOBhDuzHg7nEB+5i888N2t8gnumapmxEL1W/SvlPKa+ddxpAr1kiZXAjOlMm5wDkdVwJ5JS9oashxkHt9Cq34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740678232; c=relaxed/simple;
	bh=Mdjmml7RnXnBepJUYdF3G2CJRe2zWxlM/c8cDs85e7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Zj00qMRDpzUW3xKjVfnpkjulAAKilPaJMkenAAgW6Vyj30UXZ6z3zTB8cis3kcO8x+QRpMHderutCsR5Bu4cbDJcQTqEq984q9Acos8q7QZ+VxKA+ydsaZZ5+uLxUTynfa/ngwq7UV3z8JH7DocxY8ZW+kASiml8gLyVmuOWzGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=A5pXjeUM; arc=fail smtp.client-ip=52.101.67.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="A5pXjeUM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emjgMNTGa0YzAvgL7oSSvot16fiFGmsh4pXtSccPkrnMXCN8/Po82QVZZ9aq7o3hfsycE36n0+mDY5gw3CoCITsiSyeJqeXGwy+rvHzbKXoEAsaadAsCNdELkEbwyMidxaiRXs0vXfeg/fdD99GUju3DlEdQ/8WZyE40Z1UNVsjzLFAHUrDeJfTAPCdNtUSwWtMY/GREaDED/41U2CoV+oc18Z046HDu3qRZkXhhd+i9rTSnkUz6BaQModVNBR/ZZug3kCVX/trPQWOUTkb8antK27kzFi+i+8ITSjDo7UnGN12RhizBF6xQ8cwbexXzq+n/KWxHFY/LqWfq5KExLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CiVRQjPWW2H0Nocpg5xLIO2Md1QMkhz6T0WohFmNoCc=;
 b=zOluwRlvR6Nc6YDB612pLdHQq2dQp2wlUQcQSmKch9wErvocBlqCG5djVkkPYPaPeKWH9HXU5RKrenw/CGdkHPWElRHIf8eu4Sfk7IsyqCB3VJ/D8/5uqsVpNIXURaWdzMK9KecCeYXBhVl6A5scGn+kFs/xw9E+JUsLaTcJE+oWmzqxRhDB0glG1T5pQpzTF3IT800x/lVxjt1uZm+hO/mtoMdR+BiHAxUigxyq48mjGQyeoSbhyuxSJ8Enx0T4O5LIRVGiUvlQthWfWy3DtjVTq6uNH3Dwq5pIbYleol7HrJ4+IvCDPROB6/xPbpZAYA4a/4MsETeYavJyqIRPxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CiVRQjPWW2H0Nocpg5xLIO2Md1QMkhz6T0WohFmNoCc=;
 b=A5pXjeUMQwv0JvDnXQF1DwGyfH8IL2kNMnIBbc8bUSyjM1Xv3goqsvuBSXeK6Qek3RMY2T7+8+v+5QwDeGHJ9JlxYOKhpvBMjcQXmWEghreQm2N30P/NKsXlXEPifD4sg7r/b1ImtacfKrhL2G7qMlGgvWKFMsjwk6M51ciVXZ5rwYgVGE43KjR4lYS+UvQm0qVZASDpli/r3clol7NUWyDIikpyg2NH5qbPmMnHSUhtwt4dUf0hbLJiCG8EexThoFNqbk6O2HLgRzLHNa2czFar0ujcN0eugrm5Ibrctp8Zk4Vn4mU6BUJVY2lMN6lLyDAXxuITSUjc2rrkqi5U5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB7639.eurprd04.prod.outlook.com (2603:10a6:20b:23e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Thu, 27 Feb
 2025 17:43:47 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 17:43:47 +0000
Date: Thu, 27 Feb 2025 12:43:37 -0500
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Price <steven.price@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev
Subject: Re: [PATCH 9/9] arm64: dts: imx95: Describe Mali G310 GPU
Message-ID: <Z8CkSUry5puMu6Mx@lizhi-Precision-Tower-5810>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-10-marex@denx.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227170012.124768-10-marex@denx.de>
X-ClientProxiedBy: SJ0PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB7639:EE_
X-MS-Office365-Filtering-Correlation-Id: 749c9952-9c57-477f-aa34-08dd5756498a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EheXE7nqdKrtUjwnggSxjAsJ47nlwQxE7SwNApHX3xSrGRR8PxtjPYjoAhu3?=
 =?us-ascii?Q?I04do9lNxtZVZUBqrwveD72lKxgsm8PEx0TQUJ+KyEeIwIJppJ/MkNjg+bnJ?=
 =?us-ascii?Q?B5CH64Sv2/m6VmZuMujSXXDcdzCaqldAbD4y/Emv4AQCFyGp/gtjb/Rq+xRA?=
 =?us-ascii?Q?foCbByZnIF3yvj71zc8CeERqrkk7HlTZkdRunK69b3rS8Ygq8sn/XBW8pLCR?=
 =?us-ascii?Q?q22LhNME2cqJFSdi2XrCeARi1KjqEYyxlohFBm2hrAXr6TRtfGOesiHV4o3u?=
 =?us-ascii?Q?MajFstNRwBzhswkwWTA0ewuDXX8Q7qTZelz88AHNlwpls6edQFoRYUuaASw9?=
 =?us-ascii?Q?5A06Lk/KLVdmdYVIzZ/D/D1y8nivToR46WoMk6XQkRJO3aeTt1bXL06GdZHR?=
 =?us-ascii?Q?fGkujw29nlOoVq/WyGaenkNk8yxuvBo/y+biK3ocRpXqB0cGQZUKnK1T8qk8?=
 =?us-ascii?Q?61N3iTLr9EY6EWX7PNHoB9wLVCJeyGtHkbbLx+DEo5yOw3Segb4LX+k+NkR+?=
 =?us-ascii?Q?f2I1AzyqF1paDO8OJBUzSkbw1QeuN+eAnZMf97i+441vwslKntA0AKUaY9hY?=
 =?us-ascii?Q?Una5C0sBLcxCth5dw5BX0piD8mHaSAPoW7atIYY/qMzRLwDkEl95Be+U5E73?=
 =?us-ascii?Q?wKvJcTeF0YRUWzyEyGu3JCbK7n5nMXJ+Vf9532niwxUIjRwmz95H1zBz2hmC?=
 =?us-ascii?Q?lLAY5/k55//jX2Opz8rAGxCVgLji9L5YAcG54xY/4+J6wcbKpYxTjj4AJi7S?=
 =?us-ascii?Q?dGEtdK8X2lRMpWSxGwLSPVMMwUxo+qikLpfjZViCJ4S+gJwqO44TD/YRy0gJ?=
 =?us-ascii?Q?f/fWwpv+osqw2n5FZyrb+x19B4C5SKEx4CPMJA6OwXxOz8aBGQI29t2iGetz?=
 =?us-ascii?Q?NomKdM/dANCdsiVvRO8MG7hfv5UqZuSpvkIz76ATGG9z/NK8YpUqDtcPgOha?=
 =?us-ascii?Q?RkwjkbvLd5nsRMQPdPHRaWAlFcMouugvyi6/oroBHxfdgB1KxTVpBlTmzzo1?=
 =?us-ascii?Q?c03lLNB7u9LENQ4p8pukvfbrghLaMhxoD7HJF3M2V46J0KhHev+uzQfPnSTU?=
 =?us-ascii?Q?4vLu/PrJizrjG/hgEnpzQgVbYIUbDdssZ/EdJQVpeLwHCMO2Cod5FF76S3Rv?=
 =?us-ascii?Q?+LacFo4k38FfZ3ALI2ZoqL78KkL9uEdsL7g+s2qX4azFUfyoj8Q8rcX3XelK?=
 =?us-ascii?Q?8lHcCWfGdLbm/kikLxsZGaei1qw/4Fr3r8QOn8cjGLs63an9s8UUtQbzMZ6T?=
 =?us-ascii?Q?CpcV7dIE++qJYDqtLB5doXZeo1H0ilnSHhFkz4i0ozurgv0YwAZOMR6lU+pJ?=
 =?us-ascii?Q?AdyBDtvwbR7Hx1td0cGF7VbguAQQBE1a9p5lSN5M5pKWrCgH8nUGOAEzhe7b?=
 =?us-ascii?Q?bM07JJ7vhkQ7tjCTSTbPIJm01E1HHD+DUdsabbLEeirnH/c6tDrGFrNx5dVV?=
 =?us-ascii?Q?T9SnEiLKGJociA3wdF9BqNgyAeON9hu5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ieX0MMLDMcNny5BIfrzHJNcU1b1TZ3Va12X2Z9N5jNB1/AYzDipjoZm/lhBH?=
 =?us-ascii?Q?TmFp0sKkA0RoqbkmIESaiGT8KR05DQF82pXK9gxhYh+VjEyBX1Z7ghg/fNMD?=
 =?us-ascii?Q?MqhZ1In4p+6JFyUJ3IOn8Q/OGqI9yHsMYGkuOHhWj6D3WOm6BCFOfRv0mdc2?=
 =?us-ascii?Q?C66m6nxCdgCvlUkYTRFQKH05iKmYc1ktn1moSv1QMMb4qSBxkomNroGe6epF?=
 =?us-ascii?Q?3Waadsn5X61M3dpeZu61+T7npMyACzkvAJkuIQHcTckRJ3H6y/1rOlHXku7q?=
 =?us-ascii?Q?kOdKwEdf86tj/1zJwSF16a6rkYGIgKRM5nD7cZg0OQ75u3Q9vc0VgZkT07RC?=
 =?us-ascii?Q?ks5yo5/Mjez5CT9mE2+LF/YNiwycjVCE8sMwRs/SO3XndA97CyNWr6VdBaAT?=
 =?us-ascii?Q?38Bn11vMbCLgC8CRfYDdlCBbuIgQxYiNIAtAGEIn2Ug86W9k/aeEGaRJKcCX?=
 =?us-ascii?Q?LlbHEuqbaIzpOvrVR3w3WXdtOJoX9zlavQQHGmIIxiyJW4ns0BY01YgSe9Wj?=
 =?us-ascii?Q?zOurRisJ5J7VUuClgvjZobQGr0tq8jpi+4w7cY15Ib4S5NhBZH+YBz3bXvMS?=
 =?us-ascii?Q?PzcXxk8vM1Lr7v32omMfSCc+f50H84O0qdU58GMdMF4SG9seiJGTyC/V/vjw?=
 =?us-ascii?Q?MBc7q8uIovVwrWTlXiwxrxZM9x7nvbM1wl8W7vMriHRQUGCUBcJ5WlYFUwhG?=
 =?us-ascii?Q?QCbXZgOs7uLJFpZktGlL9Rw0Ee2LzShnBkC3A5/5o7MCQE2yQSGirY5id2jW?=
 =?us-ascii?Q?GdeA9GaWHPuxOdrVa3x5lZZ3LA61zVNMuVF8qCNg1QypoMCgjt1USM+MMZUv?=
 =?us-ascii?Q?zUPecZdFHuf3GKoeREtkhsZ9mdOYqCnj3arh4DFDiCFAZYsRyo3MBI2Dxje6?=
 =?us-ascii?Q?HYpgAr473l8pvviDgJ4BLOspU7MwDl94AsWdAwcKAm4qAHjV9KRJ9cM/wEDO?=
 =?us-ascii?Q?szS3CT5/r0NDOVgR7R1LtisdEqRt4aCahQfizUrio6GHCpp520TiQ12B/g+7?=
 =?us-ascii?Q?PhXvzy7mE6IBqgRUgDRI1TBm0ES+zKxVtYFeB46wp5bosZW+Gthu2Ye0WiqY?=
 =?us-ascii?Q?pgbAvDkw7z7qd8pAVO6y2T5z5+g4BJgwiFqJ8FBEqGq77k41ILuhimXYszz1?=
 =?us-ascii?Q?5HtpODDWP6nWmVl8XRZAvHeqoPFGIQupt5MRYyPLU5osmemfAlaCKyfqgHtu?=
 =?us-ascii?Q?+O+eAzQMWbAMqey7aQa5rXk2uPstNuBB3NlP2ywZ6On22o2cbpidvOBRZ6XY?=
 =?us-ascii?Q?nW/2pYNAXUN+cPblXsTFr7QMAqnWS9oxEpQl7YOpQ5cvCaNPS9YZc/mIamzg?=
 =?us-ascii?Q?k3fL0+tOvl8mB6TsxhNNMvYJeFY0niWZDrgsE+U+E7EygfiIhYoDbVnI9sX2?=
 =?us-ascii?Q?vnMFLM/G7sv3Ez5MMpG6p7Bu6YxIc9bfCO5rhkYnhX5PTO/zoOVfOb0q8cSw?=
 =?us-ascii?Q?EusZynbwMPW6bMd4xKbDcdva/vbii/f3Tsthc8jzl6rQaxvlBe7NbstLFBWR?=
 =?us-ascii?Q?kQM/PyI/1Dl3Emd/ebNfs1hucHvS/thhdW5UFm2LiHRoNiRuJE8Y1dS4Ktv8?=
 =?us-ascii?Q?gYAdK7xVZ4Aklg/COhY6WsBv5Nv657/L9pmDBQU5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 749c9952-9c57-477f-aa34-08dd5756498a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 17:43:47.1532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /2vG5eeaCXcmVY69WijHGDsjjiG4F0bUoZnYJ6D9dTKw4LfH4oveFxZBvHPbIudx8uPOAbpuz3LnooPYpir/8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7639

On Thu, Feb 27, 2025 at 05:58:09PM +0100, Marek Vasut wrote:
> The instance of the GPU populated in i.MX95 is the G310,
> describe this GPU in the DT. Include description of the
> GPUMIX block controller, which can be operated as a simple
> reset. Include dummy GPU voltage regulator and OPP tables.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 62 ++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 3af13173de4bd..36bad211e5558 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -249,6 +249,37 @@ dummy: clock-dummy {
>  		clock-output-names = "dummy";
>  	};
>
> +	gpu_fixed_reg: fixed-gpu-reg {
> +		compatible = "regulator-fixed";
> +		regulator-min-microvolt = <920000>;
> +		regulator-max-microvolt = <920000>;
> +		regulator-name = "vdd_gpu";
> +		regulator-always-on;
> +		regulator-boot-on;

Does really need regulator-boot-on and regulator-always-on ?

> +	};
> +
> +	gpu_opp_table: opp_table {
> +		compatible = "operating-points-v2";
> +
> +		opp-500000000 {
> +			opp-hz = /bits/ 64 <500000000>;
> +			opp-hz-real = /bits/ 64 <500000000>;
> +			opp-microvolt = <920000>;
> +		};
> +
> +		opp-800000000 {
> +			opp-hz = /bits/ 64 <800000000>;
> +			opp-hz-real = /bits/ 64 <800000000>;
> +			opp-microvolt = <920000>;
> +		};
> +
> +		opp-1000000000 {
> +			opp-hz = /bits/ 64 <1000000000>;
> +			opp-hz-real = /bits/ 64 <1000000000>;
> +			opp-microvolt = <920000>;
> +		};
> +	};
> +
>  	clk_ext1: clock-ext1 {
>  		compatible = "fixed-clock";
>  		#clock-cells = <0>;
> @@ -1846,6 +1877,37 @@ netc_emdio: mdio@0,0 {
>  			};
>  		};
>
> +		gpu_blk_ctrl: reset-controller@4d810000 {
> +			compatible = "fsl,imx95-gpu-blk-ctrl";
> +			reg = <0x0 0x4d810000 0x0 0xc>;
> +			#reset-cells = <1>;
> +			clocks = <&scmi_clk IMX95_CLK_GPUAPB>;
> +			assigned-clocks = <&scmi_clk IMX95_CLK_GPUAPB>;
> +			assigned-clock-parents = <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
> +			assigned-clock-rates = <133333333>;
> +			power-domains = <&scmi_devpd IMX95_PD_GPU>;
> +			status = "disabled";
> +		};
> +
> +		gpu: gpu@4d900000 {
> +			compatible = "fsl,imx95-mali", "arm,mali-valhall-csf";
> +			reg = <0 0x4d900000 0 0x480000>;
> +			clocks = <&scmi_clk IMX95_CLK_GPU>;
> +			clock-names = "core";
> +			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "gpu", "job", "mmu";
> +			mali-supply = <&gpu_fixed_reg>;
> +			operating-points-v2 = <&gpu_opp_table>;
> +			power-domains = <&scmi_devpd IMX95_PD_GPU>, <&scmi_perf IMX95_PERF_GPU>;
> +			power-domain-names = "mix", "perf";
> +			resets = <&gpu_blk_ctrl 0>;
> +			#cooling-cells = <2>;
> +			dynamic-power-coefficient = <1013>;
> +			status = "disabled";

GPU is internal module, which have not much dependence with other module
such as pinmux. why not default status is "disabled". Supposed gpu driver
will turn off clock and power if not used.

Frank

> +		};
> +
>  		ddr-pmu@4e090dc0 {
>  			compatible = "fsl,imx95-ddr-pmu", "fsl,imx93-ddr-pmu";
>  			reg = <0x0 0x4e090dc0 0x0 0x200>;
> --
> 2.47.2
>
