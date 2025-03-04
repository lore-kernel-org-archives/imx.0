Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013070.outbound.protection.outlook.com [40.107.162.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9655D27D794
	for <imx@lists.linux.dev>; Tue,  4 Mar 2025 15:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741102573; cv=fail; b=hA7OS81uuKkiWvbN6Z+o+nER667AiqXr71PWlTLHcnqKXM7oup2sdAzFVHPkTWH0rql3jJF6wOYHPUXmFqxhVbncs+0UqSwJbAugAnrtz4AuAPBzYIVx91SoGF6w+8zPIDO/qAodL0czYdSoq4VS4AS4i/FAi2PJwkbtnyCROis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741102573; c=relaxed/simple;
	bh=ZT3FBg1qKmaZT9yBBQRY197j4CfDMqU3PxVSftRRwuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NsLNSOJBo+JOZTl02HHd5y9fCX2mLSveVFfXwW9BEMeGr9zldVk22eOGTFISN2PdGVWPZP0mZmoYNHKemM1Sjottj/+sFxga284oXOXRzd5ula0v6Y79gn2T5cG/pmPcY/XD70TaDChhqaVrTyuFtiWIY+e7HJwLW4QLYI838mw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NjUW+e0Q; arc=fail smtp.client-ip=40.107.162.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NjUW+e0Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mPd91iU3+lY1oI0DQnkOBlpjuUpxKm8ngx8YrDLFNRJlbOQ3EAw6rTgcl4iVm1RLRjd5q4mM6hQETuq1UPkvx1w1gh1oHPXkrnaQJSkkXM4q2QBq6gKQTZXWaLsJbX9fprcDdxums3TzgMcxgbPUoI0atLZI7aR3spIsx2F379WFL9bFBD+5lh41Q+txPxe+6mvMPLRWR9rPmbZGkoWWpweEJzbyGlivd2St5rgwFWG+CVbZe2qdeUl0ZOlHHnVVZXvoyRFjdpochIOnX9BcO3LHGpFPulA4yvmxTZA284cBqtx9BmVoW14gmJHHxrIsGpbAxdUDNAIkS21uG2pxZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJjDoCBdAgnrX5KoRE18lsVqo7c3HouZwhE+aJyilfU=;
 b=aI3WDObgqXwK5JNiZbFfXnhLPbv4KXDi6iZJiFP87s51KeHeszTuMxH1I/bRM0HDmytjMEbClX5jbVaYEqCofYT0HS8897B3SsSx8oCuydRJoFkM+T6xV3AqfL7Tz6xdNYhoU0A2wf8qPwjIYyOsKPAGMdLibNS7lzL1Cpgg8Voi/iK03dvAkli/fjEejDzL2Z0oR/wBKszod4Uh338ifPaBmiRhZ3wBPhQDg71HrwsZUmxMWb/euAoImAGkATC+5L0hiM6+GWA+EEByCH/pLZ1Qr0Y8Gww7bKjOTWolSf+8IJYI5A/JMsXXj58KOduqEe29Zm1CZ7DjemxhWd/2VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJjDoCBdAgnrX5KoRE18lsVqo7c3HouZwhE+aJyilfU=;
 b=NjUW+e0QLmnyvUe1SJ2QLyMcXcdhwfBioN5Nk9n1VzMcH1tPhsBwnXhfPC38kVkVALM4Ow6f58MU5LnS7nPWci9fZbQofyiYk5SxnmVExm3LuDv3JgjDBsHBRm63rMiZGNniDxcKQNPV64DkFJRI8wJaiGiPj/rrcmvdt0ufT89g6PKxA4RbAWRb1Wrw0Qy3pqrUWoVQXOcTCMgB9LYR7NgvrePVSDvDA3XGAs7QIFA9u2W2F80u/9TqV6oNNMiL28uTPLLoCeRQwIJM6YGj6rPjgfnQ/f710rKH/gobzoumBMLwXWgwIpdBPiqX9DtsLtngNxtf8spknkj96li8zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8575.eurprd04.prod.outlook.com (2603:10a6:102:216::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Tue, 4 Mar
 2025 15:36:06 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8489.019; Tue, 4 Mar 2025
 15:36:06 +0000
Date: Tue, 4 Mar 2025 10:35:59 -0500
From: Frank Li <Frank.li@nxp.com>
To: Jacky Bai <ping.bai@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, aisheng.dong@nxp.com,
	peng.fan@nxp.com
Subject: Re: [PATCH v2 3/4] arm64: dts: freescale: Add basic dtsi for imx943
Message-ID: <Z8cd33Aw3tpPBism@lizhi-Precision-Tower-5810>
References: <20250304093127.1954549-1-ping.bai@nxp.com>
 <20250304093127.1954549-4-ping.bai@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304093127.1954549-4-ping.bai@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0113.namprd05.prod.outlook.com
 (2603:10b6:a03:334::28) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8575:EE_
X-MS-Office365-Filtering-Correlation-Id: 4351b4db-560a-49bc-e963-08dd5b3247a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6OYC0V5Q6PZ8u9319lkBN6CxTp2Uy1DC3dWlNDHro4kXO0ox7wu7TetaH/qy?=
 =?us-ascii?Q?IIqP/0UXyMlhcUvMISBm+ZvetVa4iVqX8ppZWNU/z6oiLSCkeU6QbnGyfH9g?=
 =?us-ascii?Q?rjZTc9gaKWULZ1qF5zMvRGYC9xvvo85ZGosbbKFUhQs95ly7BS2AfJQoav/t?=
 =?us-ascii?Q?4JADGXKbfXQJX6GpSlUXoM+s/hBmREl+HvZoXB0OyvIN7SqhHQME0jtxA+S0?=
 =?us-ascii?Q?x7GsZMkYbQB0xYvE0HUn8/0msvgQjJlvLoTMe68Mi3myJMTqzdkWa4zWhoJm?=
 =?us-ascii?Q?6BkxU3ck+Ty+eAqqcJ+pLudwOp4e/T2Rrtb+baYaJkBhgoV1072Tb49+Nsrk?=
 =?us-ascii?Q?gBdAIXhk69fdauEuO7usNR8e00wIvT73vpPzCsOqFePcrlhEyQh9DqsObjx3?=
 =?us-ascii?Q?0PPydcy0y2eZatxKQx/7q041qcwB0+jkSQFjnObcREq63U1GMrPkcxMMHA9f?=
 =?us-ascii?Q?xhh0uTtEnVrbizByaA2ElVZAjAiYTeNgXzkbqRWCdbGcT7TSETs8gJ+wjzgb?=
 =?us-ascii?Q?EHzCSYhoaL58dew8hVC4dQinYQEhJsc3Or0RSqGuqWXUFtXn1D4h1vqBRxOE?=
 =?us-ascii?Q?fXSxFbW7qsjRSoho1kTPigw7dJ6pOkmrHn9ussS8ealGnqUUACyS0kfwi+6q?=
 =?us-ascii?Q?CfCQl7UmJOfYjMwNyFfBJZf/wBZsz/Qn5z4/AB7I12915gatV5SijWjHSRA2?=
 =?us-ascii?Q?TiRxPXGu6PogP+lMU5XRrF5NO1PR75vbP6f6nAXqKXi2+wiwctyUDE1mCc73?=
 =?us-ascii?Q?RfnE3On812HPojHokTsmU8mbF8QdE+vbS0LUJrUvLuuv1JJ7KAl41ax1DQ0k?=
 =?us-ascii?Q?fcyWSaUeP5IkymcRPHrsyfNGdOuxM/46les+VEx6u7hgEBfnrRjsn104KG02?=
 =?us-ascii?Q?7ZLJm6OiYyyBRWD3yxivyk1iMPb07lD8p0JQ2W4r7fiP7/2ofmJEoZ4EX+ts?=
 =?us-ascii?Q?WHM0OtrPR8NQfAPdkhydXsuyRnp+6AvKdA6hQwt6npYrmve35CZ4qynWHe+R?=
 =?us-ascii?Q?/GFLFl7RS1D6HPGmusjR1vdPkWpGyiz9Kv8kZpHU+OWHBB8lebMS6ndFfl6x?=
 =?us-ascii?Q?fKzDt65YbAleDAHK1UdRRgEpic6JI5ScICg/tEzTUpjjrxa3KJEsIEdZbN9n?=
 =?us-ascii?Q?+jSzvqnw3XRl1KTcbYap44ft7Z0iDkZNGpyczB887s23W9LMFFrnGG4lQ0Ly?=
 =?us-ascii?Q?VjrgxsYI32qB3zz0SF9qWHDdxG9to+5XlrULvAiFDWGpTSCpl/ZPEmSWo9FR?=
 =?us-ascii?Q?TqYvub8hcnIgJ5U+phfbTwgspTwl0sX/fDDPy0kKU4T/VZoD6N4aQlAiIPy2?=
 =?us-ascii?Q?u1q8qgh7CH2fvy2fzKuomFvrwwLGJHJa5hupPIVL3BI5agHwzdtdnk/DDDAO?=
 =?us-ascii?Q?YnFDMszn+861AuNL/CsyA9DE+AEKA2rl5ICQwJjJJGf7hoYRkemMo7rVYIQd?=
 =?us-ascii?Q?vGKdUUNaYfQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8xbRl9+ZL3aos+QfkGXZb3dUgHnw7ZRZ2SJPzei9KEbCedJo4zbRKkw9GL49?=
 =?us-ascii?Q?sWiVlbkFhXrebrQig2E9sWR594ZfT49iWvBkF5QD/ufjmihb6PuGbLZRiOOw?=
 =?us-ascii?Q?YCav3yOg5T0/Hz8l/ISKwZeN8/0jG3kQ/+5ZOahJlRI1U41+reII1owQDif9?=
 =?us-ascii?Q?msRkGcrCtvRyvokgCCtV0dccPvl3NBTCinb3PfMm75xBpczBxQJ5pA6ltWKB?=
 =?us-ascii?Q?e9E7bdMFyTqkF4P0FxqEd0XgjtTTT2P2ceBEM3OQgpwoZbLBomLda5FZQgnY?=
 =?us-ascii?Q?pngaNnUrhyhmvO3J8e8TbIB4Z6R7SQWMe3OMGeNN3iEjd2QD5qu9phN1Df51?=
 =?us-ascii?Q?9uDS1qH8PsqmYHswZs4UN8d83a2tVv5t+Qd7WLvqlFwr4M+BGs44qjc78x6E?=
 =?us-ascii?Q?OJFAb2f2rM3LtOYrpScWewdLwHHUdX0SoQsyL4scztAgKG0lc7gBpYFu08JP?=
 =?us-ascii?Q?x2bEHV1l5QM8NgHVQji4hbqBwgnmpkC7XRHX9vuY+fr94jXEHMjihIblmmqD?=
 =?us-ascii?Q?Yqj6FthSM+VRK9WLnLD4Igj/Z+opcEih+ctju3st1KwVADDyuzwypgEftmCd?=
 =?us-ascii?Q?QbrFGpOodNdT39QBxtMC9v0yEkxKkT4nTfLPONakpNjcUeWStkU1r0LNJrLf?=
 =?us-ascii?Q?P9pOk+/f0N3P7JI0zeK7S1k6OxcqMRD/LkHk58utSW6oqdgbrYaa0T32EGaW?=
 =?us-ascii?Q?gUbTWv/zG3eEBDsQ1vqh/N3ac9kU5HHsd6O7quQ2gchEaoSPXHrLM6bYPjVD?=
 =?us-ascii?Q?55W8XvJ49gbYI2uecuVvHumQem8Fo7E30cm2FCqgf2Zc1EgQPmvdX36wWYuu?=
 =?us-ascii?Q?UsP4ZBaBofUTXudHoR1/2V17eH4dRh1kJ7+7s3Bi3MWmNqyOCfGI0iEQj7fe?=
 =?us-ascii?Q?QrrMWle+R+NxWxe4c7cEmevTth6laSmd9qu6YO+3c7OBAm17QkFz9GLgqc2t?=
 =?us-ascii?Q?DNb9eCy6GO8ExOBAM8ymSVK9pnHD0Pp24mPQXy7Z7BD6LPHXWpiMXCb7iZtM?=
 =?us-ascii?Q?XypOH7dLEpnJxNKeax7M5KtLUqJhs33fZuAZQ+6f08kZzAGCRRBoKrO1p/U8?=
 =?us-ascii?Q?hgfCDR2Jw7KjqCrPxiuPzfzT6qkr6mACkDZZVxn0ZjJ5xvQbZ3+hUyWVMFzt?=
 =?us-ascii?Q?fwDEM9pAa0ddv6n9lYkL2A68aWl36/Z9M3+8ZSEYizhqJ3nT2klGFeuiafl3?=
 =?us-ascii?Q?61Xqe2dlQ9GfAxCZjLCsMh1PivQrpSbsNdm3U7+T4DufdfWlLbYo3yEf98ZQ?=
 =?us-ascii?Q?kLHE6843B15SNNTyBEQig61v2/PMAQvIARiRVUN7P4TO1QmpVfyIKuF789Th?=
 =?us-ascii?Q?dtJB24ATlpcJgd/WL+KUwJcpZ2GOvQstLbX77RF11We8rmaDSNXlabfyNIRy?=
 =?us-ascii?Q?3xX6UhQHEuftGC1cCmIyjYCxt7fgYhPqr+gn0vi8Hyly+7KZS9OYTcceD9EJ?=
 =?us-ascii?Q?A3BIPOLBLcn08YsFEm6PDyROCaDvVhO0ZzTRugk4FarEW9YDJrpudKFTzNZj?=
 =?us-ascii?Q?6NDoVX7rMUVZzM86gWfaN767Wg8CiXnKqZuTOAzFQ8lxtl8KgeeeuiKWbRcI?=
 =?us-ascii?Q?sIpNaBWXZBPqPbfP4FPV5AwVIyJgiMuPLm5Ju6oX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4351b4db-560a-49bc-e963-08dd5b3247a6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 15:36:06.7982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L39Q6ioXp2k5qUcxIzbtc84GyikSy1iW489VG0f0U1PWb7aSeMZ2DraVs54Ievg0hkFY2UegUVRJPjLd4V1Jdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8575

On Tue, Mar 04, 2025 at 05:31:26PM +0800, Jacky Bai wrote:
> Add the minimal dtsi support for i.MX943. i.MX943 is the
> first SoC of i.MX94 Family, create a common dtsi for the
> whole i.MX94 family, and the specific dtsi part for i.MX943.
>
> The clock, power domain and perf index need to be used by
> the device nodes for resource reference, add them along
> with the dtsi support.
>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  - v2 changes:
>   - remove the unnecessary macro define in clock header as suggested by Krzysztof
>   - split the dtsi into imx94.dtsi and imx943.dtsi
>   - use low case in the pinfunc header as Frank suggested
>   - reorder the device nodes and properties
>   - resolve Krzysztof's other comments
> ---
...
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +		clock-output-names = "osc_24m";
> +	};
> +
> +	dummy: clock-dummy {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <0>;
> +		clock-output-names = "dummy";
> +	};
> +
> +	clk_ext1: clock-ext1 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <133000000>;
> +		clock-output-names = "clk_ext1";
> +	};
> +
> +	sai1_mclk: clock-sai1-mclk1 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <0>;
> +		clock-output-names = "sai1_mclk";
> +	};
> +
> +	sai2_mclk: clock-sai2-mclk1 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <0>;
> +		clock-output-names = "sai2_mclk";
> +	};
> +
> +	sai3_mclk: clock-sai3-mclk1 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <0>;
> +		clock-output-names = "sai3_mclk";
> +	};
> +
> +	sai4_mclk: clock-sai4-mclk1 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <0>;
> +		clock-output-names = "sai4_mclk";
> +	};
> +
> +	firmware {
> +

Remove empty line here.

Frank
> +		scmi {
> +			compatible = "arm,scmi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			mboxes = <&mu2 5 0>, <&mu2 3 0>, <&mu2 3 1>, <&mu2 5 1>;
> +			shmem = <&scmi_buf0>, <&scmi_buf1>;
> +			arm,max-rx-timeout-ms = <5000>;
> +
> +			scmi_devpd: protocol@11 {
> +				reg = <0x11>;
> +				#power-domain-cells = <1>;
> +			};
> +
> +			scmi_sys_power: protocol@12 {
> +				reg = <0x12>;
> +			};
> +
> +			scmi_perf: protocol@13 {
> +				reg = <0x13>;
> +				#power-domain-cells = <1>;
> +			};
> +
> +			scmi_clk: protocol@14 {
> +				reg = <0x14>;
> +				#clock-cells = <1>;
> +			};
> +
> +			scmi_iomuxc: protocol@19 {
> +				reg = <0x19>;
> +			};
> +
> +			scmi_bbm: protocol@81 {
> +				reg = <0x81>;
> +			};
> +
> +			scmi_misc: protocol@84 {
> +				reg = <0x84>;
> +			};
> +		};
> +	};
> +
> +	pmu {
> +		compatible = "arm,cortex-a55-pmu";
> +		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>;
> +		clock-frequency = <24000000>;
> +		interrupt-parent = <&gic>;
> +		arm,no-tick-in-suspend;
> +	};
> +
> +	gic: interrupt-controller@48000000 {
> +		compatible = "arm,gic-v3";
> +		reg = <0 0x48000000 0 0x10000>,
> +		      <0 0x48060000 0 0xc0000>;
> +		ranges;
> +		#interrupt-cells = <3>;
> +		interrupt-controller;
> +		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		dma-noncoherent;
> +		interrupt-parent = <&gic>;
> +
> +		its: msi-controller@48040000 {
> +			compatible = "arm,gic-v3-its";
> +			reg = <0 0x48040000 0 0x20000>;
> +			#msi-cells = <1>;
> +			dma-noncoherent;
> +			msi-controller;
> +		};
> +	};
> +
> +	soc {
> +		compatible = "simple-bus";
> +		ranges;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +
> +		aips2: bus@42000000 {
> +			compatible = "fsl,aips-bus", "simple-bus";
> +			reg = <0x0 0x42000000 0x0 0x800000>;
> +			ranges = <0x42000000 0x0 0x42000000 0x8000000>;
> +			#address-cells = <1>;
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
> +					<&a55_irqsteer 6>, <&a55_irqsteer 7>, <&a55_irqsteer 8>,
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
> +					<&a55_irqsteer 95>, <&gic GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +			mu10: mailbox@42430000 {
> +				compatible = "fsl,imx95-mu";
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
> +				clocks = <&scmi_clk IMX94_CLK_I3C2SLOW>,
> +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> +					 <&dummy>;
> +				clock-names = "pclk", "fast_clk", "slow_clk";
> +				status = "disabled";
> +			};
> +
> +			lpi2c3: i2c@42530000 {
> +				compatible = "fsl,imx95-lpi2c", "fsl,imx7ulp-lpi2c";
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
> +				compatible = "fsl,imx95-lpi2c", "fsl,imx7ulp-lpi2c";
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
> +				compatible = "fsl,imx95-spi", "fsl,imx7ulp-spi";
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
> +				compatible = "fsl,imx95-spi", "fsl,imx7ulp-spi";
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
> +				compatible = "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
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
> +				compatible = "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
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
> +				compatible = "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
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
> +				compatible = "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
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
> +				compatible = "fsl,imx95-flexcan";
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
> +				compatible = "fsl,imx95-flexcan";
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
> +				compatible = "fsl,imx95-flexcan";
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
> +				compatible = "fsl,imx95-flexcan";
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
> +				compatible = "fsl,imx95-sai";
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
> +				compatible = "fsl,imx95-sai";
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
> +				compatible = "fsl,imx95-sai";
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
> +				compatible = "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
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
> +				compatible = "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
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
> +				compatible = "fsl,imx95-lpi2c", "fsl,imx7ulp-lpi2c";
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
> +				compatible = "fsl,imx95-lpi2c", "fsl,imx7ulp-lpi2c";
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
> +				compatible = "fsl,imx95-lpi2c", "fsl,imx7ulp-lpi2c";
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
> +				compatible = "fsl,imx95-lpi2c", "fsl,imx7ulp-lpi2c";
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
> +				compatible = "fsl,imx95-spi", "fsl,imx7ulp-spi";
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
> +				compatible = "fsl,imx95-spi", "fsl,imx7ulp-spi";
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
> +				compatible = "fsl,imx95-spi", "fsl,imx7ulp-spi";
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
> +				compatible = "fsl,imx95-spi", "fsl,imx7ulp-spi";
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
> +				compatible = "fsl,imx95-mu";
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
> +					<&a55_irqsteer 222>, <&a55_irqsteer 223>,
> +					<&gic GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
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
> +				compatible = "fsl,imx95-usdhc", "fsl,imx8mm-usdhc";
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
> +				compatible = "fsl,imx95-usdhc", "fsl,imx8mm-usdhc";
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
> +				compatible = "fsl,imx95-usdhc", "fsl,imx8mm-usdhc";
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
> +				compatible = "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
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
> +				compatible = "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
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
> +				compatible = "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
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
> +				compatible = "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
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
> +				compatible = "fsl,imx95-mu";
> +				reg = <0x42ac0000 0x10000>;
> +				interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> +				#mbox-cells = <2>;
> +				status = "disabled";
> +			};
> +
> +			mu13: mailbox@42ae0000 {
> +				compatible = "fsl,imx95-mu";
> +				reg = <0x42ae0000 0x10000>;
> +				interrupts = <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> +				#mbox-cells = <2>;
> +				status = "disabled";
> +			};
> +
> +			mu14: mailbox@42b00000 {
> +				compatible = "fsl,imx95-mu";
> +				reg = <0x42b00000 0x10000>;
> +				interrupts = <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> +				#mbox-cells = <2>;
> +				status = "disabled";
> +			};
> +
> +			mu15: mailbox@42b20000 {
> +				compatible = "fsl,imx95-mu";
> +				reg = <0x42b20000 0x10000>;
> +				interrupts = <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> +				#mbox-cells = <2>;
> +				status = "disabled";
> +			};
> +
> +			mu16: mailbox@42b40000 {
> +				compatible = "fsl,imx95-mu";
> +				reg = <0x42b40000 0x10000>;
> +				interrupts = <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> +				#mbox-cells = <2>;
> +				status = "disabled";
> +			};
> +
> +			mu17: mailbox@42b60000 {
> +				compatible = "fsl,imx95-mu";
> +				reg = <0x42b60000 0x10000>;
> +				interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> +				#mbox-cells = <2>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		gpio2: gpio@43810000 {
> +			compatible = "fsl,imx95-gpio", "fsl,imx8ulp-gpio";
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
> +			compatible = "fsl,imx95-gpio", "fsl,imx8ulp-gpio";
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
> +			compatible = "fsl,imx95-gpio", "fsl,imx8ulp-gpio";
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
> +			compatible = "fsl,imx95-gpio", "fsl,imx8ulp-gpio";
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
> +			compatible = "fsl,imx95-gpio", "fsl,imx8ulp-gpio";
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
> +			compatible = "fsl,imx95-gpio", "fsl,imx8ulp-gpio";
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
> +				status = "okay";
> +			};
> +
> +			mu1: mailbox@44220000 {
> +				compatible = "fsl,imx95-mu";
> +				reg = <0x44220000 0x10000>;
> +				interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSAON>;
> +				#mbox-cells = <2>;
> +				status = "disabled";
> +			};
> +
> +			system_counter: timer@44290000 {
> +				compatible = "nxp,imx95-sysctr-timer";
> +				reg = <0x44290000 0x30000>;
> +				interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&osc_24m>;
> +				clock-names = "per";
> +				nxp,no-divider;
> +			};
> +
> +			tpm1: pwm@44310000 {
> +				compatible = "fsl,imx7ulp-pwm";
> +				reg = <0x44310000 0x1000>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSAON>;
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
> +			tpm2: pwm@44320000 {
> +				compatible = "fsl,imx7ulp-pwm";
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
> +				clocks = <&scmi_clk IMX94_CLK_I3C1SLOW>,
> +					 <&scmi_clk IMX94_CLK_BUSAON>,
> +					 <&dummy>;
> +				clock-names = "pclk", "fast_clk", "slow_clk";
> +				status = "disabled";
> +			};
> +
> +			lpi2c1: i2c@44340000 {
> +				compatible = "fsl,imx95-lpi2c", "fsl,imx7ulp-lpi2c";
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
> +				compatible = "fsl,imx95-lpi2c", "fsl,imx7ulp-lpi2c";
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
> +				compatible = "fsl,imx95-spi", "fsl,imx7ulp-spi";
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
> +				compatible = "fsl,imx95-spi", "fsl,imx7ulp-spi";
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
> +				compatible = "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
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
> +				compatible = "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
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
> +				compatible = "fsl,imx95-flexcan";
> +				reg = <0x443a0000 0x10000>;
> +				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";
> +			};
> +
> +			sai1: sai@443b0000 {
> +				compatible = "fsl,imx95-sai";
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
> +				compatible = "nxp,imx93-adc";
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
> +				compatible = "fsl,imx95-mu";
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
> +				compatible = "fsl,imx95-mu";
> +				reg = <0x445d0000 0x10000>;
> +				interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
> +				#mbox-cells = <2>;
> +				status = "disabled";
> +			};
> +
> +			mu4: mailbox@445f0000 {
> +				compatible = "fsl,imx95-mu";
> +				reg = <0x445f0000 0x10000>;
> +				interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
> +				#mbox-cells = <2>;
> +				status = "disabled";
> +			};
> +
> +			mu6: mailbox@44630000 {
> +				compatible = "fsl,imx95-mu";
> +				reg = <0x44630000 0x10000>;
> +				interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
> +				#mbox-cells = <2>;
> +				status = "disabled";
> +			};
> +
> +			a55_irqsteer: interrupt-controller@446a0000 {
> +				compatible = "fsl,imx-irqsteer";
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
> +				compatible = "fsl,imx93-wdt";
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
> index 000000000000..a9877fcfd896
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
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
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
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
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
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
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
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
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
