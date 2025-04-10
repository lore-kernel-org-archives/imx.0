Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2080.outbound.protection.outlook.com [40.107.21.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7C31E991C
	for <imx@lists.linux.dev>; Thu, 10 Apr 2025 15:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744299691; cv=fail; b=vE4VcfpuHP85fauzXgl0jHwobNj9nXScK3IUHWA+L5LMujJHCTOLm1SQDv8W4GLzyC1v4ciuf7hXoUGZz+9jPJrfcN1tt8ia6/+5wLWIrlm6R+6DclOA2LJCscNDplpJLM0nsEeLvqHTskt5SayacgjD27YfoGaihd/rAv7dJsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744299691; c=relaxed/simple;
	bh=vFZPeluGMuWInGJ7jhQYdZoe7lju814/3KZVB0sagMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Wiytt9FNW2sPV+sbIwkkB5wq7U6s/71OZGlmXMSY7fxM4GzN3E4l00rDsAheRWr3tKtzYrhhPyEioUYIobiTD+XTHq7gP3lLmPq/yhITOnr0r+dEA3uUzecxprfqUc3CWxzspE+eg0wjX4g6NRI7KGU4WxWM+DE7b7Hja4kwE5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=N9HEA+wK; arc=fail smtp.client-ip=40.107.21.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="N9HEA+wK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8ba2uPoEeGxnamp642YjvZM3SiwdrJTw2vXgAFJvrkpqWlVe2KVXNV/8p3+ng3FOXQoN4jaEvIh9ZFt+JDrX5iegYnVIGnwqr5osvWHKtg5ZU089/t8clhbjvqUqj9rN/xiev41HtSkneb8uz4eo1hWMicCc4VunqeW6HRjhmvG37ovl98Q0C2M6xgViUStVf9CYmwaAgTFkHwUD3THxdIrVGFDgQzEzv6bKU9Yq17C8GKyisKLF/MfGRZd4kOi5xfdN/E7i2/m2L1HMRMEN147GDr2fqldsTEX0yuscW2QB4yjqc6ayRHf1u4iv3WV8aaoHmvPVm5UTJJUd/xhEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGvYAb6X0oPgVMFfplcn6UG7LGi0G9UPCCm6l9k3tIs=;
 b=wfkawt/WT3jJXR4omO48LvlF5B3c0fulMIf1D9ctWHScigrPGf6MzWHYE2nzxIDjrOqQArklJxVqHufwgJZwqibqjpG1Q/iy7BIFtmD5xP3ISH9V/fOHGDJI/cUdcghkJEMJ1nqxmlY92qdmcolOlQVX53UHmfShwf8WADfKpwoPIWCZGReUyygmD155BIcueSncewCB8eBWSBr91ZJc0c+491nrjUukTM37FHb0phbuNjaypz445vAysVGZKAQhPCL41Kyy/3ruraUJG4jb1BCkOUuqiva1s7pLeQQmP7dp4D6tWmZjU1fg1vM40nI+7gpmn5NZ8+ch9WRIDid1ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGvYAb6X0oPgVMFfplcn6UG7LGi0G9UPCCm6l9k3tIs=;
 b=N9HEA+wK2lqBDLjNodLsUdHAxLiFjezI/i5H142XFHqFHHI/+/njPNjp+vozFzt9iWBmqteQvo3SGMsjP+N9nfIoDXeF4Suw0TBdGkaR/Cj8mwtXXxwNQZ9xE8cu8CxTRZIg/xWRgwrAK54oTciTcetBcLTwCJJQWRCuBUKmXQOlmHWq8GJGns8wSS0e172YPEN2YQyP0T2fRabbNaSB3KqYs+FCjEKVm35Z6/NrjuE3Vf6SSdrRHvyNlJKa69NcuVuafBYgU0HO09OnSXXzYol4hftvmrQ8Pj+t5LhtIyyZDkr0rcNljEHczFfZsT2JUEHhx5hBMKLysdrRZgYY/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB9198.eurprd04.prod.outlook.com (2603:10a6:150:29::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 10 Apr
 2025 15:41:23 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 15:41:23 +0000
Date: Thu, 10 Apr 2025 11:41:16 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jacky Bai <ping.bai@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, aisheng.dong@nxp.com,
	peng.fan@nxp.com
Subject: Re: [PATCH v5 2/3] arm64: dts: freescale: Add basic dtsi for imx943
Message-ID: <Z/fmnHmYLF/TlTnA@lizhi-Precision-Tower-5810>
References: <20250410062826.3344545-1-ping.bai@nxp.com>
 <20250410062826.3344545-3-ping.bai@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410062826.3344545-3-ping.bai@nxp.com>
X-ClientProxiedBy: PH8PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::28) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB9198:EE_
X-MS-Office365-Filtering-Correlation-Id: c4aea5bf-ab6d-4ef1-f2ff-08dd784625c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AOIbJ28H5Xhkx9UmNXznYwlXPNEOATyfAcKdY2MFnQfKJVYu/mQm0SBRyo0m?=
 =?us-ascii?Q?a2u7RpjVIJI/VikgwSh5SXcvbv7EtvV+wYY2VzTXWT5DRVs63UX7C3RtUhsl?=
 =?us-ascii?Q?HTSnQknxf003y+QC7zSiqes7WHUPHlZl2XOM/nTz+HN5e5zuC3tm+eBUDf+E?=
 =?us-ascii?Q?rUmBf7p3M6GZgPu5+YCU3bDmcu3uejdaUUdsfHvEYNshuYLQTV7mYIk5CVcj?=
 =?us-ascii?Q?hDDE/FgJQdYyibxDEit563lT3LsTn9biCIntL8V5ezD5OUHyJZdbwsYhen3V?=
 =?us-ascii?Q?Fmg99w8Fy4TqU3ut62QaNHJEsBkoBM9Byu6PZIbuDXgR5qukh8ntK6oMS95T?=
 =?us-ascii?Q?L2/a3+hxHULbVxLdQ6DLEZOWla1wtVZ3C//9A12ngjsiCwated0wcebgnOEm?=
 =?us-ascii?Q?/LZPmArvC01/dyWQR66Eg7AAuYKhcm8rIrppf1OSnpMDbED93Qu8ANdMhoxy?=
 =?us-ascii?Q?Nn7Cbemo8X2X1CJ1M7cV9QUjrIblqGXkLzkORJW79BdwOxAhMMGlxyqH+ld/?=
 =?us-ascii?Q?CKcqPujng7wdoXwHH9CqaODdYQcYYUx0TuiINuX/SwFg+aSYNhGGCfCzPaHp?=
 =?us-ascii?Q?rQ0O8wMZUdEWdj6z2JHRCQc1GSagIwkPZWRUnEVuUj7J5FYIKIrVr7o/VvW1?=
 =?us-ascii?Q?NHcVgWYNvyQtBkQ5rFItHHwjzMI/Lmlteq8XrRHGVBQLHyDTh8PyUB1z6jOc?=
 =?us-ascii?Q?GCUmd2QGJIAogJ8pSL8f1LNC0/FTdVVBq7JSIEVvXb1eKRJOnq0uvykcB8lq?=
 =?us-ascii?Q?Nqedi+mbEOmsJ9pfXzpDpI9e8NwAwDgVuqMKiF4BawwstJM3lf6JCwIP4xyb?=
 =?us-ascii?Q?UdiB+cyOc1+mOP+pSmYTUNwnqfnJR1yXjrWm5f/iSBOqNHPK+ytOFWiRK9b2?=
 =?us-ascii?Q?1z5SFzw8yKEVw7Lay67m6AM0Wh0vGsYVvFCr42YOP0ddQxR67916gtFb7fDf?=
 =?us-ascii?Q?fYORV3Zmr1D455nIhjCqoVR58dH948QO+4Q/jd8G9QFNtyCAlx2IpqZC6T4Y?=
 =?us-ascii?Q?f1tPrd2XKvUBcR+dqDj1lwRhxcn/MwlhyyOKvvx1fJqefwD+vQvCJt3i2+7W?=
 =?us-ascii?Q?3mx/7MLyrdkOJZwy9H2q2xHKNjMv3z8HMqPNvdEJWs//wfhpWki2/WqjbZBV?=
 =?us-ascii?Q?3rsbLcQEl/Ck14RIvyqhL6mov4rHPOhRcW8qZB4929IjAY3qO9AecqQ//xFQ?=
 =?us-ascii?Q?yD34sggKloS9tqRJcZ+GHbLr2s7O9ABsLRCMfNh7injow4KFdCTr8FStkd6F?=
 =?us-ascii?Q?O4ZODCg1OlK0nACsunNiZ2vLDlht8fkOH9HnTG3DsFcgbmm3W06F0A8Vyh6V?=
 =?us-ascii?Q?w7w3G9wh1//jLxw2nvQhMfshr7mDtrvrbnqCtliIc11zVoq778GgCjdzNhHr?=
 =?us-ascii?Q?NCfaXxe1YEc9XoHn0YarDga1xJeWM+xqEwmIH7hh04LWLJVyzPJYYBv66DkQ?=
 =?us-ascii?Q?xSJdIy8fJmSZ2ui5uAY4HmapTfv9twMB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9cedhjNqmfITA5jCQd7FEWvnOhScj8PYjb/2D8gItz5ZRzKlED6AQxkJa/1v?=
 =?us-ascii?Q?xcSZgG+GKSTFt583zoBa09NAV/nKFDfNNQg2z0GIazA5hCg7UxZ3R8tNt0cS?=
 =?us-ascii?Q?B4k+VClObm79hLK5WswQDmG8T2nZ60E/RAPYJZyTLFBP0ucTzNn4bvBOhzuW?=
 =?us-ascii?Q?Uo3bZq8+YhjakYGf/6onQFjKFQC7N7zfW1rr3bk9EJ9SWxAZ0S1zeeLVMYsw?=
 =?us-ascii?Q?auXoLjZ3T1Q2rXt4qzOj6yS6PsCNtAXH3REQiPUHpEVV/9tIYtmsPXxzShA/?=
 =?us-ascii?Q?6u5Ocv3mn8PO8FUDL0yAXg6aD/DiYtlRNfKwS5iu/QDINlY9719sQsj/fhHr?=
 =?us-ascii?Q?NLUC7osG5j6SNlpiJsYxLRRWg+gMnRsrq8WHaoBY9Yh8jB5pdD3xRdi8EZ0h?=
 =?us-ascii?Q?fRmJHUGOreb82OjOcayDHIW/ZLcYRh6A04DPCqw0LgCjcbfL9rtH0XODLQfD?=
 =?us-ascii?Q?wJYGaBa972M+84tkpwMt1me57K07QLfcawjSjliJkB/NMUNVTQw3kmLFG74T?=
 =?us-ascii?Q?kmU3crYYYjNfS/VCTPczKV/QcQkU2607hCj4g7bN/meq40DaCRoJST6hDiCk?=
 =?us-ascii?Q?7iBMsTopfNhqvjvQ4fqX6TaGjHkg1bylxNj5TFAdCgn9AOwrJA2hKOUBF7F6?=
 =?us-ascii?Q?a0r3yEz4Q3MVMpVIwnKcM/Hh/6rxgM2EDxAPpJTe4mP3H7QKIZ81Y2hQGYND?=
 =?us-ascii?Q?GOloZJ7OHvNyxgXwHUioV5XWQVdRUZFJ5Ox6Fbazt9VPACtWr/jKw7OQeoFU?=
 =?us-ascii?Q?u6GwyBBJDnkrE/wq/FtHYcTO3bNn18uk95zAFVdMhzJ3mg17EojWOBuSLa8P?=
 =?us-ascii?Q?d++MBMg0Tp5/k+yNVQVfmRhrGHxVyjnBiyr94MHik/nGo3/xXVRL0zSqinWp?=
 =?us-ascii?Q?JMCTFYn2rTrpFQgwYGIVg1MmowaXKpDF2q7MF6sdbFQr1bZJqx1GFbn37O3d?=
 =?us-ascii?Q?lToUl6hbXer1Lpdbf2/7EyUqkfXFq1fdXhV49XoRID998GZgd//G47WpDae5?=
 =?us-ascii?Q?o+5nQp0joMAewJqWm6EkGyDFEa3unywKkidBdWQwu7/Q7lA+xHJgRJFSQK56?=
 =?us-ascii?Q?aM1dh5+ao9m+NtewDwiPEBMK0xI8O2v+k5osOmOuZ6r9iyHRzk6A2J1nHd4l?=
 =?us-ascii?Q?dQOuq7OidqG47LGt7Jg63xMzuLudxYkchl2gfCXnuLqMBsiv74JjY6/gX57a?=
 =?us-ascii?Q?U0HtXDTdBQyY4OHNdNcm0DQdjKqYWw7h7uSktUtnMI8X9D5+SfWGPlB2Tzex?=
 =?us-ascii?Q?Vlo/v1smb/aSX6wGW4CTKZBbM6ZrAdJwcbkqAmvGROcSSTGZyLhMKwzwxQtU?=
 =?us-ascii?Q?FW9pVXEmEDDOPYwV6/pddR8nYAMf7W5+PTaMle4VXrjhj+KCrWtkkVBWoWzy?=
 =?us-ascii?Q?gPLtXHzIeqMSzmkbpbql2eKYYyLTwcCtFjw9vCTWX7VhGQ8/9kz9MxkfjwjW?=
 =?us-ascii?Q?wt5hqMFHWLN0AmZgV20vuF9iT4E+Mi5wCiKSRvOZe4Q7yjLWn1xRwiaXijOh?=
 =?us-ascii?Q?hulTL4ofI9bH/Vo5GWiUkPIyk3+QjVsfV/4s0GnNjF0v9+qks80Gfcvmrbjl?=
 =?us-ascii?Q?WUrKV7g+uc9pUYiwPa7T3fXsJkR6UMB2ReP1KWSq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4aea5bf-ab6d-4ef1-f2ff-08dd784625c3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 15:41:23.7023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ugd4oT1MHSz7HWt1QgHxvEawinz9tLGRMRczARwkTiYXrwFol4lfoflZrWwexTTm3oGlh6lupgR6nHGCGuFeaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9198

On Thu, Apr 10, 2025 at 02:28:25PM +0800, Jacky Bai wrote:
> Add the minimal dtsi support for i.MX943. i.MX943 is the
> first SoC of i.MX94 Family, create a common dtsi for the
> whole i.MX94 family, and the specific dtsi part for i.MX943.
>
> The clock, power domain and perf index need to be used by
> the device nodes for resource reference, add them along
> with the dtsi support.

Please wrap at 75 char to maxium use sceen width.

>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  - v5 changes:
>   - remove the err irq of edma node as the err irq support in driver is not
>     ready. We can add it back when the driver is ready. No impact for current
>     edma support.
>
>  - v4 changes:
>   - reorder the cpu node compatible string property as suggested by Frank
>
>  - v3 changes:
>   - remove the blank line
>   - add PAD config macro define as suggested by Frank Li
>   - update the device nodes compatible strings for imx94 as suggested by Krzysztof
>
>  - v2 changes:
>   - remove the unnecessary macro define in clock header as suggested by Krzysztof
>   - split the dtsi into imx94.dtsi and imx943.dtsi
>   - use low case in the pinfunc header as Frank suggested
>   - reorder the device nodes and properties
> ---
>  arch/arm64/boot/dts/freescale/imx94-clock.h   |  195 ++
>  arch/arm64/boot/dts/freescale/imx94-pinfunc.h | 1570 +++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx94-power.h   |   41 +
>  arch/arm64/boot/dts/freescale/imx94.dtsi      | 1138 ++++++++++++
>  arch/arm64/boot/dts/freescale/imx943.dtsi     |  148 ++
>  5 files changed, 3092 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx94-clock.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx94-pinfunc.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx94-power.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx94.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx943.dtsi
>
...
> +			#size-cells = <1>;
> +
> +			edma2: dma-controller@42000000 {
> +				compatible = "fsl,imx94-edma5", "fsl,imx95-edma5";
> +				reg = <0x42000000 0x210000>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> +				clock-names = "dma";
> +				#dma-cells = <3>;
> +				dma-channels = <64>;
> +				interrupts-extended = <&a55_irqsteer 0>, <&a55_irqsteer 1>, <&a55_irqsteer 2>,
> +					<&a55_irqsteer 3>, <&a55_irqsteer 4>, <&a55_irqsteer 5>,

need align previous line "<"

> +					<&a55_irqsteer 6>, <&a55_irqsteer 7>, <&a55_irqsteer 8>,

Does it work by use

interrupt-parent = <&a55_irqsteer>;
interrupts = <0>, <1> ...

if it works, it will reduce many &a55_irqsteer.

Frank
> +					<&a55_irqsteer 9>, <&a55_irqsteer 10>, <&a55_irqsteer 11>,
> +					<&a55_irqsteer 12>, <&a55_irqsteer 13>, <&a55_irqsteer 14>,
> +					<&a55_irqsteer 15>, <&a55_irqsteer 16>, <&a55_irqsteer 17>,
> +					<&a55_irqsteer 18>, <&a55_irqsteer 19>, <&a55_irqsteer 20>,
> +					<&a55_irqsteer 21>, <&a55_irqsteer 22>, <&a55_irqsteer 23>,
> +					<&a55_irqsteer 24>, <&a55_irqsteer 25>, <&a55_irqsteer 26>,
> +					<&a55_irqsteer 27>, <&a55_irqsteer 28>, <&a55_irqsteer 29>,
> +					<&a55_irqsteer 30>, <&a55_irqsteer 31>, <&a55_irqsteer 64>,
> +					<&a55_irqsteer 65>, <&a55_irqsteer 66>, <&a55_irqsteer 67>,
> +					<&a55_irqsteer 68>, <&a55_irqsteer 69>, <&a55_irqsteer 70>,
> +					<&a55_irqsteer 71>, <&a55_irqsteer 72>, <&a55_irqsteer 73>,
> +					<&a55_irqsteer 74>, <&a55_irqsteer 75>, <&a55_irqsteer 76>,
> +					<&a55_irqsteer 77>, <&a55_irqsteer 78>, <&a55_irqsteer 79>,
> +					<&a55_irqsteer 80>, <&a55_irqsteer 81>, <&a55_irqsteer 82>,
> +					<&a55_irqsteer 83>, <&a55_irqsteer 84>, <&a55_irqsteer 85>,
> +					<&a55_irqsteer 86>, <&a55_irqsteer 87>, <&a55_irqsteer 88>,
> +					<&a55_irqsteer 89>, <&a55_irqsteer 90>, <&a55_irqsteer 91>,
> +					<&a55_irqsteer 92>, <&a55_irqsteer 93>, <&a55_irqsteer 94>,
> +					<&a55_irqsteer 95>;
> +			};
> +
> +			mu10: mailbox@42430000 {
> +				compatible = "fsl,imx94-mu", "fsl,imx95-mu";
> +				reg = <0x42430000 0x10000>;
> +				interrupts = <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> +				#mbox-cells = <2>;
> +				status = "disabled";
> +			};
> +
> +			i3c2: i3c@42520000 {
> +				compatible = "silvaco,i3c-master-v1";
> +				reg = <0x42520000 0x10000>;
> +				interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <3>;
> +				#size-cells = <0>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> +					 <&scmi_clk IMX94_CLK_I3C2SLOW>,
> +					 <&dummy>;
> +				clock-names = "pclk", "fast_clk", "slow_clk";
> +				status = "disabled";
> +			};
> +
> +			lpi2c3: i2c@42530000 {
> +				compatible = "fsl,imx94-lpi2c", "fsl,imx7ulp-lpi2c";
> +				reg = <0x42530000 0x10000>;
> +				interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&scmi_clk IMX94_CLK_LPI2C3>,
> +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> +				clock-names = "per", "ipg";
> +				dmas = <&edma2 5 0 0>, <&edma2 6 0 FSL_EDMA_RX>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +
> +			lpi2c4: i2c@42540000 {
> +				compatible = "fsl,imx94-lpi2c", "fsl,imx7ulp-lpi2c";
> +				reg = <0x42540000 0x10000>;
> +				interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&scmi_clk IMX94_CLK_LPI2C4>,
> +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> +				clock-names = "per", "ipg";
> +				dmas = <&edma4 4 0 0>, <&edma4 5 0 FSL_EDMA_RX>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +
> +			lpspi3: spi@42550000 {
> +				compatible = "fsl,imx94-spi", "fsl,imx7ulp-spi";
> +				reg = <0x42550000 0x10000>;
> +				interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&scmi_clk IMX94_CLK_LPSPI3>,
> +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> +				clock-names = "per", "ipg";
> +				dmas = <&edma2 7 0 0>, <&edma2 8 0 FSL_EDMA_RX>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +
> +			lpspi4: spi@42560000 {
> +				compatible = "fsl,imx94-spi", "fsl,imx7ulp-spi";
> +				reg = <0x42560000 0x10000>;
> +				interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&scmi_clk IMX94_CLK_LPSPI4>,
> +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> +				clock-names = "per", "ipg";
> +				dmas = <&edma4 6 0 0>, <&edma4 7 0 FSL_EDMA_RX>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +
> +			lpuart3: serial@42570000 {
> +				compatible = "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> +					     "fsl,imx7ulp-lpuart";
> +				reg = <0x42570000 0x1000>;
> +				interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_LPUART3>;
> +				clock-names = "ipg";
> +				dmas = <&edma2 10 0 FSL_EDMA_RX>, <&edma2 9 0 0>;
> +				dma-names = "rx", "tx";
> +				status = "disabled";
> +			};
> +
> +			lpuart4: serial@42580000 {
> +				compatible = "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> +					     "fsl,imx7ulp-lpuart";
> +				reg = <0x42580000 0x1000>;
> +				interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_LPUART4>;
> +				clock-names = "ipg";
> +				dmas = <&edma4 10 0 FSL_EDMA_RX>, <&edma4 9 0 0>;
> +				dma-names = "rx", "tx";
> +				status = "disabled";
> +			};
> +
> +			lpuart5: serial@42590000 {
> +				compatible = "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> +					     "fsl,imx7ulp-lpuart";
> +				reg = <0x42590000 0x1000>;
> +				interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_LPUART5>;
> +				clock-names = "ipg";
> +				dmas = <&edma2 12 0 FSL_EDMA_RX>, <&edma2 11 0 0>;
> +				dma-names = "rx", "tx";
> +				status = "disabled";
> +			};
> +
> +			lpuart6: serial@425a0000 {
> +				compatible = "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> +					     "fsl,imx7ulp-lpuart";
> +				reg = <0x425a0000 0x1000>;
> +				interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_LPUART6>;
> +				clock-names = "ipg";
> +				dmas = <&edma4 12 0 FSL_EDMA_RX>, <&edma4 11 0 0>;
> +				dma-names = "rx", "tx";
> +				status = "disabled";
> +			};
> +
> +			flexcan2: can@425b0000 {
> +				compatible = "fsl,imx94-flexcan", "fsl,imx95-flexcan";
> +				reg = <0x425b0000 0x10000>;
> +				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> +					 <&scmi_clk IMX94_CLK_CAN2>;
> +				clock-names = "ipg", "per";
> +				assigned-clocks = <&scmi_clk IMX94_CLK_CAN2>;
> +				assigned-clock-parents = <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
> +				assigned-clock-rates = <80000000>;
> +				fsl,clk-source = /bits/ 8 <0>;
> +				status = "disabled";
> +			};
> +
> +			flexcan3: can@425e0000 {
> +				compatible = "fsl,imx94-flexcan", "fsl,imx95-flexcan";
> +				reg = <0x425e0000 0x10000>;
> +				interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> +					 <&scmi_clk IMX94_CLK_CAN3>;
> +				clock-names = "ipg", "per";
> +				assigned-clocks = <&scmi_clk IMX94_CLK_CAN3>;
> +				assigned-clock-parents = <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
> +				assigned-clock-rates = <80000000>;
> +				fsl,clk-source = /bits/ 8 <0>;
> +				status = "disabled";
> +			};
> +
> +			flexcan4: can@425f0000 {
> +				compatible = "fsl,imx94-flexcan", "fsl,imx95-flexcan";
> +				reg = <0x425f0000 0x10000>;
> +				interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> +					 <&scmi_clk IMX94_CLK_CAN4>;
> +				clock-names = "ipg", "per";
> +				assigned-clocks = <&scmi_clk IMX94_CLK_CAN4>;
> +				assigned-clock-parents = <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
> +				assigned-clock-rates = <80000000>;
> +				fsl,clk-source = /bits/ 8 <0>;
> +				status = "disabled";
> +			};
> +
> +			flexcan5: can@42600000 {
> +				compatible = "fsl,imx94-flexcan", "fsl,imx95-flexcan";
> +				reg = <0x42600000 0x10000>;
> +				interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> +					 <&scmi_clk IMX94_CLK_CAN5>;
> +				clock-names = "ipg", "per";
> +				assigned-clocks = <&scmi_clk IMX94_CLK_CAN5>;
> +				assigned-clock-parents = <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
> +				assigned-clock-rates = <80000000>;
> +				fsl,clk-source = /bits/ 8 <0>;
> +				status = "disabled";
> +			};
> +
> +			sai2: sai@42650000 {
> +				compatible = "fsl,imx94-sai", "fsl,imx95-sai";
> +				reg = <0x42650000 0x10000>;
> +				interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>, <&dummy>,
> +					<&scmi_clk IMX94_CLK_SAI2>, <&dummy>, <&dummy>;
> +				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> +				dmas = <&edma2 30 0 FSL_EDMA_RX>, <&edma2 29 0 0>;
> +				dma-names = "rx", "tx";
> +				#sound-dai-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			sai3: sai@42660000 {
> +				compatible = "fsl,imx94-sai", "fsl,imx95-sai";
> +				reg = <0x42660000 0x10000>;
> +				interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>, <&dummy>,
> +					<&scmi_clk IMX94_CLK_SAI3>, <&dummy>, <&dummy>;
> +				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> +				dmas = <&edma2 32 0 FSL_EDMA_RX>, <&edma2 31 0 0>;
> +				dma-names = "rx", "tx";
> +				#sound-dai-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			sai4: sai@42670000 {
> +				compatible = "fsl,imx94-sai", "fsl,imx95-sai";
> +				reg = <0x42670000 0x10000>;
> +				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>, <&dummy>,
> +					<&scmi_clk IMX94_CLK_SAI4>, <&dummy>, <&dummy>;
> +				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> +				dmas = <&edma2 36 0 FSL_EDMA_RX>, <&edma2 35 0 0>;
> +				dma-names = "rx", "tx";
> +				#sound-dai-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			lpuart7: serial@42690000 {
> +				compatible = "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> +					     "fsl,imx7ulp-lpuart";
> +				reg = <0x42690000 0x1000>;
> +				interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_LPUART7>;
> +				clock-names = "ipg";
> +				dmas = <&edma2 46 0 FSL_EDMA_RX>, <&edma2 45 0 0>;
> +				dma-names = "rx", "tx";
> +				status = "disabled";
> +			};
> +
> +			lpuart8: serial@426a0000 {
> +				compatible = "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> +					     "fsl,imx7ulp-lpuart";
> +				reg = <0x426a0000 0x1000>;
> +				interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_LPUART8>;
> +				clock-names = "ipg";
> +				dmas = <&edma4 39 0 FSL_EDMA_RX>, <&edma4 38 0 0>;
> +				dma-names = "rx", "tx";
> +				status = "disabled";
> +			};
> +
> +			lpi2c5: i2c@426b0000 {
> +				compatible = "fsl,imx94-lpi2c", "fsl,imx7ulp-lpi2c";
> +				reg = <0x426b0000 0x10000>;
> +				interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&scmi_clk IMX94_CLK_LPI2C5>,
> +					 <&scmi_clk IMX94_CLK_BUSAON>;
> +				clock-names = "per", "ipg";
> +				dmas = <&edma2 37 0 0>, <&edma2 38 0 FSL_EDMA_RX>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +
> +			lpi2c6: i2c@426c0000 {
> +				compatible = "fsl,imx94-lpi2c", "fsl,imx7ulp-lpi2c";
> +				reg = <0x426c0000 0x10000>;
> +				interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&scmi_clk IMX94_CLK_LPI2C6>,
> +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> +				clock-names = "per", "ipg";
> +				dmas = <&edma4 30 0 0>, <&edma4 31 0 FSL_EDMA_RX>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +
> +			lpi2c7: i2c@426d0000 {
> +				compatible = "fsl,imx94-lpi2c", "fsl,imx7ulp-lpi2c";
> +				reg = <0x426d0000 0x10000>;
> +				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&scmi_clk IMX94_CLK_LPI2C7>,
> +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> +				clock-names = "per", "ipg";
> +				dmas = <&edma2 39 0 0>, <&edma2 40 0 FSL_EDMA_RX>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +
> +			lpi2c8: i2c@426e0000 {
> +				compatible = "fsl,imx94-lpi2c", "fsl,imx7ulp-lpi2c";
> +				reg = <0x426e0000 0x10000>;
> +				interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&scmi_clk IMX94_CLK_LPI2C8>,
> +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> +				clock-names = "per", "ipg";
> +				dmas = <&edma4 32 0 0>, <&edma4 33 0 FSL_EDMA_RX>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +
> +			lpspi5: spi@426f0000 {
> +				compatible = "fsl,imx94-spi", "fsl,imx7ulp-spi";
> +				reg = <0x426f0000 0x10000>;
> +				interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&scmi_clk IMX94_CLK_LPSPI5>,
> +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> +				clock-names = "per", "ipg";
> +				dmas = <&edma2 41 0 0>, <&edma2 42 0 FSL_EDMA_RX>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +
> +			lpspi6: spi@42700000 {
> +				compatible = "fsl,imx94-spi", "fsl,imx7ulp-spi";
> +				reg = <0x42700000 0x10000>;
> +				interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&scmi_clk IMX94_CLK_LPSPI6>,
> +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> +				clock-names = "per", "ipg";
> +				dmas = <&edma4 34 0 0>, <&edma4 35 0 FSL_EDMA_RX>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +
> +			lpspi7: spi@42710000 {
> +				compatible = "fsl,imx94-spi", "fsl,imx7ulp-spi";
> +				reg = <0x42710000 0x10000>;
> +				interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&scmi_clk IMX94_CLK_LPSPI7>,
> +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> +				clock-names = "per", "ipg";
> +				dmas = <&edma2 43 0 0>, <&edma2 44 0 FSL_EDMA_RX>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +
> +			lpspi8: spi@42720000 {
> +				compatible = "fsl,imx94-spi", "fsl,imx7ulp-spi";
> +				reg = <0x42720000 0x10000>;
> +				interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&scmi_clk IMX94_CLK_LPSPI8>,
> +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> +				clock-names = "per", "ipg";
> +				dmas = <&edma4 36 0 0>, <&edma4 37 0 FSL_EDMA_RX>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +
> +			mu11: mailbox@42730000 {
> +				compatible = "fsl,imx94-mu", "fsl,imx95-mu";
> +				reg = <0x42730000 0x10000>;
> +				interrupts = <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> +				#mbox-cells = <2>;
> +				status = "disabled";
> +			};
> +
> +			edma4: dma-controller@42df0000 {
> +				compatible = "fsl,imx94-edma5", "fsl,imx95-edma5";
> +				reg = <0x42df0000 0x210000>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> +				clock-names = "dma";
> +				#dma-cells = <3>;
> +				dma-channels = <64>;
> +				interrupts-extended = <&a55_irqsteer 128>, <&a55_irqsteer 129>,
> +					<&a55_irqsteer 130>, <&a55_irqsteer 131>,
> +					<&a55_irqsteer 132>, <&a55_irqsteer 133>,
> +					<&a55_irqsteer 134>, <&a55_irqsteer 135>,
> +					<&a55_irqsteer 136>, <&a55_irqsteer 137>,
> +					<&a55_irqsteer 138>, <&a55_irqsteer 139>,
> +					<&a55_irqsteer 140>, <&a55_irqsteer 141>,
> +					<&a55_irqsteer 142>, <&a55_irqsteer 143>,
> +					<&a55_irqsteer 144>, <&a55_irqsteer 145>,
> +					<&a55_irqsteer 146>, <&a55_irqsteer 147>,
> +					<&a55_irqsteer 148>, <&a55_irqsteer 149>,
> +					<&a55_irqsteer 150>, <&a55_irqsteer 151>,
> +					<&a55_irqsteer 152>, <&a55_irqsteer 153>,
> +					<&a55_irqsteer 154>, <&a55_irqsteer 155>,
> +					<&a55_irqsteer 156>, <&a55_irqsteer 157>,
> +					<&a55_irqsteer 158>, <&a55_irqsteer 159>,
> +					<&a55_irqsteer 192>, <&a55_irqsteer 193>,
> +					<&a55_irqsteer 194>, <&a55_irqsteer 195>,
> +					<&a55_irqsteer 196>, <&a55_irqsteer 197>,
> +					<&a55_irqsteer 198>, <&a55_irqsteer 199>,
> +					<&a55_irqsteer 200>, <&a55_irqsteer 201>,
> +					<&a55_irqsteer 202>, <&a55_irqsteer 203>,
> +					<&a55_irqsteer 204>, <&a55_irqsteer 205>,
> +					<&a55_irqsteer 206>, <&a55_irqsteer 207>,
> +					<&a55_irqsteer 208>, <&a55_irqsteer 209>,
> +					<&a55_irqsteer 210>, <&a55_irqsteer 211>,
> +					<&a55_irqsteer 212>, <&a55_irqsteer 213>,
> +					<&a55_irqsteer 214>, <&a55_irqsteer 215>,
> +					<&a55_irqsteer 216>, <&a55_irqsteer 217>,
> +					<&a55_irqsteer 218>, <&a55_irqsteer 219>,
> +					<&a55_irqsteer 220>, <&a55_irqsteer 221>,
> +					<&a55_irqsteer 222>, <&a55_irqsteer 223>;
> +			};
> +		};
> +
> +		aips3: bus@42800000 {
> +			compatible = "fsl,aips-bus", "simple-bus";
> +			reg = <0 0x42800000 0 0x800000>;
> +			ranges = <0x42800000 0x0 0x42800000 0x800000>,
> +				 <0x28000000 0x0 0x28000000 0x1000000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			usdhc1: mmc@42850000 {
> +				compatible = "fsl,imx94-usdhc", "fsl,imx8mm-usdhc";
> +				reg = <0x42850000 0x10000>;
> +				interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> +					 <&scmi_clk IMX94_CLK_WAKEUPAXI>,
> +					 <&scmi_clk IMX94_CLK_USDHC1>;
> +				clock-names = "ipg", "ahb", "per";
> +				assigned-clocks = <&scmi_clk IMX94_CLK_USDHC1>;
> +				assigned-clock-parents = <&scmi_clk IMX94_CLK_SYSPLL1_PFD1>;
> +				assigned-clock-rates = <400000000>;
> +				bus-width = <8>;
> +				fsl,tuning-start-tap = <1>;
> +				fsl,tuning-step = <2>;
> +				status = "disabled";
> +			};
> +
> +			usdhc2: mmc@42860000 {
> +				compatible = "fsl,imx94-usdhc", "fsl,imx8mm-usdhc";
> +				reg = <0x42860000 0x10000>;
> +				interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> +					 <&scmi_clk IMX94_CLK_WAKEUPAXI>,
> +					 <&scmi_clk IMX94_CLK_USDHC2>;
> +				clock-names = "ipg", "ahb", "per";
> +				assigned-clocks = <&scmi_clk IMX94_CLK_USDHC2>;
> +				assigned-clock-parents = <&scmi_clk IMX94_CLK_SYSPLL1_PFD1>;
> +				assigned-clock-rates = <200000000>;
> +				bus-width = <4>;
> +				fsl,tuning-start-tap = <1>;
> +				fsl,tuning-step = <2>;
> +				status = "disabled";
> +			};
> +
> +			usdhc3: mmc@42880000 {
> +				compatible = "fsl,imx94-usdhc", "fsl,imx8mm-usdhc";
> +				reg = <0x42880000 0x10000>;
> +				interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> +					 <&scmi_clk IMX94_CLK_WAKEUPAXI>,
> +					 <&scmi_clk IMX94_CLK_USDHC3>;
> +				clock-names = "ipg", "ahb", "per";
> +				assigned-clocks = <&scmi_clk IMX94_CLK_USDHC3>;
> +				assigned-clock-parents = <&scmi_clk IMX94_CLK_SYSPLL1_PFD1>;
> +				assigned-clock-rates = <200000000>;
> +				bus-width = <4>;
> +				fsl,tuning-start-tap = <1>;
> +				fsl,tuning-step = <2>;
> +				status = "disabled";
> +			};
> +
> +			lpuart9: serial@42a50000 {
> +				compatible = "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> +					     "fsl,imx7ulp-lpuart";
> +				reg = <0x42a50000 0x1000>;
> +				interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_LPUART10>;
> +				clock-names = "ipg";
> +				dmas = <&edma2 51 0 FSL_EDMA_RX>, <&edma2 50 0 0>;
> +				dma-names = "rx", "tx";
> +				status = "disabled";
> +			};
> +
> +			lpuart10: serial@42a60000 {
> +				compatible = "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> +					     "fsl,imx7ulp-lpuart";
> +				reg = <0x42a60000 0x1000>;
> +				interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_LPUART10>;
> +				clock-names = "ipg";
> +				dmas = <&edma4 47 0 FSL_EDMA_RX>, <&edma4 46 0 0>;
> +				dma-names = "rx", "tx";
> +				status = "disabled";
> +			};
> +
> +			lpuart11: serial@42a70000 {
> +				compatible = "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> +					     "fsl,imx7ulp-lpuart";
> +				reg = <0x42a70000 0x1000>;
> +				interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_LPUART11>;
> +				clock-names = "ipg";
> +				dmas = <&edma2 53 0 FSL_EDMA_RX>, <&edma2 52 0 0>;
> +				dma-names = "rx", "tx";
> +				status = "disabled";
> +			};
> +
> +			lpuart12: serial@42a80000 {
> +				compatible = "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> +					     "fsl,imx7ulp-lpuart";
> +				reg = <0x42a80000 0x1000>;
> +				interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_LPUART12>;
> +				clock-names = "ipg";
> +				dmas = <&edma4 49 0 FSL_EDMA_RX>, <&edma4 48 0 0>;
> +				dma-names = "rx", "tx";
> +				status = "disabled";
> +			};
> +
> +			mu12: mailbox@42ac0000 {
> +				compatible = "fsl,imx94-mu", "fsl,imx95-mu";
> +				reg = <0x42ac0000 0x10000>;
> +				interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> +				#mbox-cells = <2>;
> +				status = "disabled";
> +			};
> +
> +			mu13: mailbox@42ae0000 {
> +				compatible = "fsl,imx94-mu", "fsl,imx95-mu";
> +				reg = <0x42ae0000 0x10000>;
> +				interrupts = <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> +				#mbox-cells = <2>;
> +				status = "disabled";
> +			};
> +
> +			mu14: mailbox@42b00000 {
> +				compatible = "fsl,imx94-mu", "fsl,imx95-mu";
> +				reg = <0x42b00000 0x10000>;
> +				interrupts = <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> +				#mbox-cells = <2>;
> +				status = "disabled";
> +			};
> +
> +			mu15: mailbox@42b20000 {
> +				compatible = "fsl,imx94-mu", "fsl,imx95-mu";
> +				reg = <0x42b20000 0x10000>;
> +				interrupts = <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> +				#mbox-cells = <2>;
> +				status = "disabled";
> +			};
> +
> +			mu16: mailbox@42b40000 {
> +				compatible = "fsl,imx94-mu", "fsl,imx95-mu";
> +				reg = <0x42b40000 0x10000>;
> +				interrupts = <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> +				#mbox-cells = <2>;
> +				status = "disabled";
> +			};
> +
> +			mu17: mailbox@42b60000 {
> +				compatible = "fsl,imx94-mu", "fsl,imx95-mu";
> +				reg = <0x42b60000 0x10000>;
> +				interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> +				#mbox-cells = <2>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		gpio2: gpio@43810000 {
> +			compatible = "fsl,imx94-gpio", "fsl,imx8ulp-gpio";
> +			reg = <0x0 0x43810000 0x0 0x1000>;
> +			#interrupt-cells = <2>;
> +			interrupt-controller;
> +			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
> +			#gpio-cells = <2>;
> +			gpio-controller;
> +			gpio-ranges = <&scmi_iomuxc 0 4 32>;
> +		};
> +
> +		gpio3: gpio@43820000 {
> +			compatible = "fsl,imx94-gpio", "fsl,imx8ulp-gpio";
> +			reg = <0x0 0x43820000 0x0 0x1000>;
> +			#interrupt-cells = <2>;
> +			interrupt-controller;
> +			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> +			#gpio-cells = <2>;
> +			gpio-controller;
> +			gpio-ranges = <&scmi_iomuxc 0 36 26>;
> +		};
> +
> +		gpio4: gpio@43840000 {
> +			compatible = "fsl,imx94-gpio", "fsl,imx8ulp-gpio";
> +			reg = <0x0 0x43840000 0x0 0x1000>;
> +			#interrupt-cells = <2>;
> +			interrupt-controller;
> +			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
> +			#gpio-cells = <2>;
> +			gpio-controller;
> +			gpio-ranges = <&scmi_iomuxc 0 62 4>, <&scmi_iomuxc 4 0 4>,
> +				      <&scmi_iomuxc 8 140 12>, <&scmi_iomuxc 20 164 12>;
> +		};
> +
> +		gpio5: gpio@43850000 {
> +			compatible = "fsl,imx94-gpio", "fsl,imx8ulp-gpio";
> +			reg = <0x0 0x43850000 0x0 0x1000>;
> +			#interrupt-cells = <2>;
> +			interrupt-controller;
> +			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
> +			#gpio-cells = <2>;
> +			gpio-controller;
> +			gpio-ranges = <&scmi_iomuxc 0 108 32>;
> +		};
> +
> +		gpio6: gpio@43860000 {
> +			compatible = "fsl,imx94-gpio", "fsl,imx8ulp-gpio";
> +			reg = <0x0 0x43860000 0x0 0x1000>;
> +			#interrupt-cells = <2>;
> +			interrupt-controller;
> +			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
> +			#gpio-cells = <2>;
> +			gpio-controller;
> +			gpio-ranges = <&scmi_iomuxc 0 66 32>;
> +		};
> +
> +		gpio7: gpio@43870000 {
> +			compatible = "fsl,imx94-gpio", "fsl,imx8ulp-gpio";
> +			reg = <0x0 0x43870000 0x0 0x1000>;
> +			#interrupt-cells = <2>;
> +			interrupt-controller;
> +			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
> +			#gpio-cells = <2>;
> +			gpio-controller;
> +			gpio-ranges = <&scmi_iomuxc 0 98 10>, <&scmi_iomuxc 16 152 12>;
> +		};
> +
> +		aips1: bus@44000000 {
> +			compatible = "fsl,aips-bus", "simple-bus";
> +			reg = <0x0 0x44000000 0x0 0x800000>;
> +			ranges = <0x44000000 0x0 0x44000000 0x800000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			edma1: dma-controller@44000000 {
> +				compatible = "fsl,imx94-edma3", "fsl,imx93-edma3";
> +				reg = <0x44000000 0x210000>;
> +				interrupts = <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 234 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 235 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 236 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 237 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSAON>;
> +				clock-names = "dma";
> +				#dma-cells = <3>;
> +				dma-channels = <32>;
> +			};
> +
> +			mu1: mailbox@44220000 {
> +				compatible = "fsl,imx94-mu", "fsl,imx95-mu";
> +				reg = <0x44220000 0x10000>;
> +				interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSAON>;
> +				#mbox-cells = <2>;
> +				status = "disabled";
> +			};
> +
> +			system_counter: timer@44290000 {
> +				compatible = "nxp,imx94-sysctr-timer", "nxp,imx95-sysctr-timer";
> +				reg = <0x44290000 0x30000>;
> +				interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&osc_24m>;
> +				clock-names = "per";
> +				nxp,no-divider;
> +			};
> +
> +			tpm1: pwm@44310000 {
> +				compatible = "fsl,imx94-pwm", "fsl,imx7ulp-pwm";
> +				reg = <0x44310000 0x1000>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSAON>;
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
> +			tpm2: pwm@44320000 {
> +				compatible = "fsl,imx94-pwm", "fsl,imx7ulp-pwm";
> +				reg = <0x44320000 0x1000>;
> +				clocks = <&scmi_clk IMX94_CLK_TPM2>;
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
> +			i3c1: i3c@44330000 {
> +				compatible = "silvaco,i3c-master-v1";
> +				reg = <0x44330000 0x10000>;
> +				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <3>;
> +				#size-cells = <0>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSAON>,
> +					 <&scmi_clk IMX94_CLK_I3C1SLOW>,
> +					 <&dummy>;
> +				clock-names = "pclk", "fast_clk", "slow_clk";
> +				status = "disabled";
> +			};
> +
> +			lpi2c1: i2c@44340000 {
> +				compatible = "fsl,imx94-lpi2c", "fsl,imx7ulp-lpi2c";
> +				reg = <0x44340000 0x10000>;
> +				interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&scmi_clk IMX94_CLK_LPI2C1>,
> +					 <&scmi_clk IMX94_CLK_BUSAON>;
> +				clock-names = "per", "ipg";
> +				dmas = <&edma1 12 0 0>, <&edma1 13 0 FSL_EDMA_RX>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +
> +			lpi2c2: i2c@44350000 {
> +				compatible = "fsl,imx94-lpi2c", "fsl,imx7ulp-lpi2c";
> +				reg = <0x44350000 0x10000>;
> +				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&scmi_clk IMX94_CLK_LPI2C2>,
> +					 <&scmi_clk IMX94_CLK_BUSAON>;
> +				clock-names = "per", "ipg";
> +				dmas = <&edma1 14 0 0>, <&edma1 15 0 FSL_EDMA_RX>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +
> +			lpspi1: spi@44360000 {
> +				compatible = "fsl,imx94-spi", "fsl,imx7ulp-spi";
> +				reg = <0x44360000 0x10000>;
> +				interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&scmi_clk IMX94_CLK_LPSPI2>,
> +					 <&scmi_clk IMX94_CLK_BUSAON>;
> +				clock-names = "per", "ipg";
> +				dmas = <&edma1 16 0 0>, <&edma1 17 0 FSL_EDMA_RX>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +
> +			lpspi2: spi@44370000 {
> +				compatible = "fsl,imx94-spi", "fsl,imx7ulp-spi";
> +				reg = <0x44370000 0x10000>;
> +				interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				clocks = <&scmi_clk IMX94_CLK_LPSPI2>,
> +					 <&scmi_clk IMX94_CLK_BUSAON>;
> +				clock-names = "per", "ipg";
> +				dmas = <&edma1 18 0 0>, <&edma1 19 0 FSL_EDMA_RX>;
> +				dma-names = "tx", "rx";
> +				status = "disabled";
> +			};
> +
> +			lpuart1: serial@44380000 {
> +				compatible = "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> +					     "fsl,imx7ulp-lpuart";
> +				reg = <0x44380000 0x1000>;
> +				interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_LPUART1>;
> +				clock-names = "ipg";
> +				dmas = <&edma1 21 0 FSL_EDMA_RX>, <&edma1 20 0 0>;
> +				dma-names = "rx", "tx";
> +				status = "disabled";
> +			};
> +
> +			lpuart2: serial@44390000 {
> +				compatible = "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> +					     "fsl,imx7ulp-lpuart";
> +				reg = <0x44390000 0x1000>;
> +				interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_LPUART2>;
> +				clock-names = "ipg";
> +				dmas = <&edma1 23 0 FSL_EDMA_RX>, <&edma1 22 0 0>;
> +				dma-names = "rx", "tx";
> +				status = "disabled";
> +			};
> +
> +			flexcan1: can@443a0000 {
> +				compatible = "fsl,imx94-flexcan", "fsl,imx95-flexcan";
> +				reg = <0x443a0000 0x10000>;
> +				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";
> +			};
> +
> +			sai1: sai@443b0000 {
> +				compatible = "fsl,imx94-sai", "fsl,imx95-sai";
> +				reg = <0x443b0000 0x10000>;
> +				interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSAON>, <&dummy>,
> +					<&scmi_clk IMX94_CLK_SAI1>, <&dummy>,
> +					<&dummy>, <&dummy>;
> +				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> +				dmas = <&edma1 25 0 FSL_EDMA_RX>, <&edma1 24 0 0>;
> +				dma-names = "rx", "tx";
> +				#sound-dai-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			adc1: adc@44530000 {
> +				compatible = "nxp,imx94-adc", "nxp,imx93-adc";
> +				reg = <0x44530000 0x10000>;
> +				interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_ADC>;
> +				clock-names = "ipg";
> +				#io-channel-cells = <1>;
> +				status = "disabled";
> +			};
> +
> +			mu2: mailbox@445b0000 {
> +				compatible = "fsl,imx94-mu", "fsl,imx95-mu";
> +				reg = <0x445b0000 0x1000>;
> +				ranges;
> +				interrupts = <GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				#mbox-cells = <2>;
> +
> +				sram0: sram@445b1000 {
> +					compatible = "mmio-sram";
> +					reg = <0x445b1000 0x400>;
> +					ranges = <0x0 0x445b1000 0x400>;
> +					#address-cells = <1>;
> +					#size-cells = <1>;
> +
> +					scmi_buf0: scmi-sram-section@0 {
> +						compatible = "arm,scmi-shmem";
> +						reg = <0x0 0x80>;
> +					};
> +
> +					scmi_buf1: scmi-sram-section@80 {
> +						compatible = "arm,scmi-shmem";
> +						reg = <0x80 0x80>;
> +					};
> +				};
> +			};
> +
> +			mu3: mailbox@445d0000 {
> +				compatible = "fsl,imx94-mu", "fsl,imx95-mu";
> +				reg = <0x445d0000 0x10000>;
> +				interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
> +				#mbox-cells = <2>;
> +				status = "disabled";
> +			};
> +
> +			mu4: mailbox@445f0000 {
> +				compatible = "fsl,imx94-mu", "fsl,imx95-mu";
> +				reg = <0x445f0000 0x10000>;
> +				interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
> +				#mbox-cells = <2>;
> +				status = "disabled";
> +			};
> +
> +			mu6: mailbox@44630000 {
> +				compatible = "fsl,imx94-mu", "fsl,imx95-mu";
> +				reg = <0x44630000 0x10000>;
> +				interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
> +				#mbox-cells = <2>;
> +				status = "disabled";
> +			};
> +
> +			a55_irqsteer: interrupt-controller@446a0000 {
> +				compatible = "fsl,imx94-irqsteer", "fsl,imx-irqsteer";
> +				reg = <0x446a0000 0x1000>;
> +				#interrupt-cells = <1>;
> +				interrupt-controller;
> +				interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSAON>;
> +				clock-names = "ipg";
> +				fsl,channel = <0>;
> +				fsl,num-irqs = <960>;
> +			};
> +		};
> +
> +		aips4: bus@49000000 {
> +			compatible = "fsl,aips-bus", "simple-bus";
> +			reg = <0x0 0x49000000 0x0 0x800000>;
> +			ranges = <0x49000000 0x0 0x49000000 0x800000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			wdog3: watchdog@49220000 {
> +				compatible = "fsl,imx94-wdt", "fsl,imx93-wdt";
> +				reg = <0x49220000 0x10000>;
> +				interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> +				timeout-sec = <40>;
> +				fsl,ext-reset-output;
> +				status = "disabled";
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
> new file mode 100644
> index 000000000000..45b8da758e87
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
> @@ -0,0 +1,148 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#include "imx94.dtsi"
> +
> +/ {
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		idle-states {
> +			entry-method = "psci";
> +
> +			cpu_pd_wait: cpu-pd-wait {
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x0010033>;
> +				local-timer-stop;
> +				entry-latency-us = <1000>;
> +				exit-latency-us = <700>;
> +				min-residency-us = <2700>;
> +				wakeup-latency-us = <1500>;
> +			};
> +		};
> +
> +		cpu0: cpu@0 {
> +			compatible = "arm,cortex-a55";
> +			device_type = "cpu";
> +			reg = <0x0>;
> +			enable-method = "psci";
> +			#cooling-cells = <2>;
> +			cpu-idle-states = <&cpu_pd_wait>;
> +			power-domains = <&scmi_perf IMX94_PERF_A55>;
> +			power-domain-names = "perf";
> +			i-cache-size = <32768>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <128>;
> +			d-cache-size = <32768>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			next-level-cache = <&l2_cache_l0>;
> +		};
> +
> +		cpu1: cpu@100 {
> +			compatible = "arm,cortex-a55";
> +			device_type = "cpu";
> +			reg = <0x100>;
> +			enable-method = "psci";
> +			#cooling-cells = <2>;
> +			cpu-idle-states = <&cpu_pd_wait>;
> +			power-domains = <&scmi_perf IMX94_PERF_A55>;
> +			power-domain-names = "perf";
> +			i-cache-size = <32768>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <128>;
> +			d-cache-size = <32768>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			next-level-cache = <&l2_cache_l1>;
> +		};
> +
> +		cpu2: cpu@200 {
> +			compatible = "arm,cortex-a55";
> +			device_type = "cpu";
> +			reg = <0x200>;
> +			enable-method = "psci";
> +			#cooling-cells = <2>;
> +			cpu-idle-states = <&cpu_pd_wait>;
> +			power-domains = <&scmi_perf IMX94_PERF_A55>;
> +			power-domain-names = "perf";
> +			i-cache-size = <32768>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <128>;
> +			d-cache-size = <32768>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			next-level-cache = <&l2_cache_l2>;
> +		};
> +
> +		cpu3: cpu@300 {
> +			compatible = "arm,cortex-a55";
> +			device_type = "cpu";
> +			reg = <0x300>;
> +			enable-method = "psci";
> +			#cooling-cells = <2>;
> +			cpu-idle-states = <&cpu_pd_wait>;
> +			power-domains = <&scmi_perf IMX94_PERF_A55>;
> +			power-domain-names = "perf";
> +			i-cache-size = <32768>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <128>;
> +			d-cache-size = <32768>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			next-level-cache = <&l2_cache_l3>;
> +		};
> +
> +		l2_cache_l0: l2-cache-l0 {
> +			compatible = "cache";
> +			cache-size = <65536>;
> +			cache-line-size = <64>;
> +			cache-sets = <256>;
> +			cache-level = <2>;
> +			cache-unified;
> +			next-level-cache = <&l3_cache>;
> +		};
> +
> +		l2_cache_l1: l2-cache-l1 {
> +			compatible = "cache";
> +			cache-size = <65536>;
> +			cache-line-size = <64>;
> +			cache-sets = <256>;
> +			cache-level = <2>;
> +			cache-unified;
> +			next-level-cache = <&l3_cache>;
> +		};
> +
> +		l2_cache_l2: l2-cache-l2 {
> +			compatible = "cache";
> +			cache-size = <65536>;
> +			cache-line-size = <64>;
> +			cache-sets = <256>;
> +			cache-level = <2>;
> +			cache-unified;
> +			next-level-cache = <&l3_cache>;
> +		};
> +
> +		l2_cache_l3: l2-cache-l3 {
> +			compatible = "cache";
> +			cache-size = <65536>;
> +			cache-line-size = <64>;
> +			cache-sets = <256>;
> +			cache-level = <2>;
> +			cache-unified;
> +			next-level-cache = <&l3_cache>;
> +		};
> +
> +		l3_cache: l3-cache {
> +			compatible = "cache";
> +			cache-size = <1048576>;
> +			cache-line-size = <64>;
> +			cache-sets = <1024>;
> +			cache-level = <3>;
> +			cache-unified;
> +		};
> +	};
> +};
> --
> 2.34.1
>
