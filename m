Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013028.outbound.protection.outlook.com [52.101.72.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACCA37E310
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 18:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780511188; cv=fail; b=UAC1bINUv8UJPAZi4qFpFf5GTl7S3pQip4PcdY/cablq6js4T9Q0/f0iPO8JzLEpiXThPv664h/oWm6/c0jq6wQdnhgs8LuGBx75WvLGjGzQsBnZNWCYFCxWXMR2fwtdYD7p7dIbfaYJykdBap0h0VgxpvH7PhsnX54ssKNfSfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780511188; c=relaxed/simple;
	bh=mJ3i7EvcFDZVBz2vSGEctQ69zZX391oBH+FIwg33qsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RQY0f25Y1RDVUDdTPxEjVbobnWYL+Uyv8Pl2H50tbZV5ASg9siye2UyIV5oNSKuMnA59lyhTy7g6ujwImcO9InPIKKpuemo1lm0uwO9qrOYcHndsFmDNSYr7vScVK3Y/KV8VyWV1QVlcvW8guQm5RX37LlK4GRyyy/ZhI92WXEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YQ43V7nv; arc=fail smtp.client-ip=52.101.72.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YQ43V7nv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FR+w7X1tuhFRkjPxP3WXG+JTrEYJTdIgs0IKEbDSUMPUK8bSoCCvHbbMG7SG1EO9fdfZgFQaJKYfu7bX/cKX8uZVh8Vq7kJMAw30W9fVvMzPEMXF28M+l4LiHvxtix2rbGQMiA6YUo6FXQYMuPNeyOHpSMLolFdWQqr+migWUWSdQUe0NzNc7ux8vcsRS1ZuKD/V6V2jFD/f/5K6coBpCp/OhvcOANqOvPhfEGOanWuBtdGulT1iKFzq60OGuNCuX7miK73A8RYKfpCSu+XGOu7m4GUOkifxo+hmv07pyvdWWKhC857L2BUT1ro2XiWeS0qDejbkIwmZVFzSM2R5Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxdVaPaZJ7/UvA7CYo5Dv5xOgJb7qYxHUZPTKt0Rbnw=;
 b=AxoYXTstDHWlx9mMuwqTcO0OPn6vMKdAX1s5Y2SJs5D1z+K1s/3nBmH1IRHEjyDbPtRO0dwKkOWAczX1+B+yf6SIxbOHnHbkjzsLKcENA7xp7XQuELk3sIfRAIzHJuxDcTcp9aijUK+QLTinaLw/Rz/6ljyWydlGqVGo3HWt65z7Lm7wcH9YVmuiTEZiBBIrmaxM4meQYAjiNOMxzRaW4S5hZGXUpWSA4qDXn6GtscobwMURpFlFSVXEH9j2UNVjdVf9vPgrkqhpcE8LnpQQyvBNFowsyt2kWl1zZqHUmNCBiXFtfad7RzFh5V4LVily6IropHc60+z09Yqn/83HOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxdVaPaZJ7/UvA7CYo5Dv5xOgJb7qYxHUZPTKt0Rbnw=;
 b=YQ43V7nvZ37jTZBFFiwS5txJ3x3p3UlJqruiWjigkQc+jaSp4NOfzmq6JYHXeT0i9C1Z5v/WBVkfAe1qdHCwVPL7adn4Tii3qFw+2HTJabeJ5odOYPKvBjJo0Xxhdjxp2h6JpJUSSHQph7TsanXxjMHVSjDyyp62ln34Rd5SWgpi+CJbALHuQFGpbXOMMdrrRei8kijchCVbztsRJZxzY1SFDbdTa2FLWqUYE2aE3cgw5SpAbbfBRrkl887gOnk4HoDZlbS2xMSFSbe+64XUlfQYJ73HO0S0fLsQGzXpze0UNCuX0TmS56ZiUMLCKYOFvGuTaN7pcOuuVU/GxW58jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AMCPR04MB12669.eurprd04.prod.outlook.com (2603:10a6:20b:76f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 18:26:24 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 18:26:24 +0000
Date: Wed, 3 Jun 2026 14:26:17 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>,
	linux-phy@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH v3 2/5] phy: fsl-imx8mq-usb: set usb phy to be wakeup
 capable
Message-ID: <aiBxyY5UTddsbFZ2@lizhi-Precision-Tower-5810>
References: <20260603-imx8mp-usb-phy-improvement-v3-0-7afb8f89abc6@nxp.com>
 <20260603-imx8mp-usb-phy-improvement-v3-2-7afb8f89abc6@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-imx8mp-usb-phy-improvement-v3-2-7afb8f89abc6@nxp.com>
X-ClientProxiedBy: SN7PR04CA0101.namprd04.prod.outlook.com
 (2603:10b6:806:122::16) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AMCPR04MB12669:EE_
X-MS-Office365-Filtering-Correlation-Id: 97208f4b-52a7-4b1c-e6cd-08dec19d9e32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|4143699003|5023799004|22082099003|18002099003|56012099006|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	yB9f829WCnXyV0P+FruSxOIeNX1jl4UMbVqlshzkR8I7EDLoGpSpif0nHWwDxYtObgLBhXXQesZ5lMQFda0JRvlD5dxA7r1qVLrwHheIgIrJO3eo4FBaUMJIVdhviDIawRnfCe+J03abU2U8OMEMAs6MxThHByQVjfgnCUHR79b0rd+VHOqUUuYYzGscY1kpE48VZW6rmst5k8ud+Cvg4fUfyJY5FK/E1/IRj0BUc+8s04m+x9wvY8TzoJgw0+1+eP2wQjtlzLMziGw48+lK0H2wDS0ilxPARthukph4N7nPgscHvUqpZlmNUqLPmSmHFhqj/5dBZ3Fii8P7JIe0O8yUKjrbZ7bF2j/mYSKyp5m7hQxURfiYAWH716QeBSjguI2O84eyKZOWbue4duzFpeMX/KCPj2lQatjIKWJqwzWLGMNVy+jJdBJEibSY9PwL5BHhHf1wLyWGNcMGJmbLh+zIFhh6Pe1/5ERDJkMPMfEFA4/HnO93qW0VauG/dSui9LXDHw2F5p0cyuyH7uja75eUeZ/pQe5EIuAgvnUe0kNXwByu3z6fp7KP2FoUoaFqKAiA9ekfulPfEbL7DFpRkUo7vdI1xn7hseC/HInU/n0gZgwEYkyjoo5Mc5HHv26N9/qlqUfNnd7kGFqYaMkbUC8tmsBLlPFjsh56ER8vdP6PyqbuxAy4WAgHzgoU12P+uHpyfuj+Z2+QEZDcDXoror0dkWXD9W1zPPe3AImJ1nkCSETHZmZakeZXtTaHbCqW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(4143699003)(5023799004)(22082099003)(18002099003)(56012099006)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j4x3DyC2tpzf4KgqBgeYgJ7iJ1pHqT4/UMaVgYS00lrPdD/eht3YATbdGIxt?=
 =?us-ascii?Q?uBW/OKkZ8Ihi90cxVL83qqgop8Sjngg43pjX2OWziC8p95+EFpuEfYPDn5k5?=
 =?us-ascii?Q?3fweT6W0AKa3ggzlnRZX7h8DHIyBZwkpIPHxFKdDZ0G2ZmrqU9g05EW9qXit?=
 =?us-ascii?Q?wmqS1pkxU/7h0r6gqapMXyk6acIFpoyEsfeWyNZgle/bzR/Eh+svXPV6V76P?=
 =?us-ascii?Q?3MPUI9OV4VVQV1Y+bd8zIrb6P5mvgLu7EJ+CAYkq8hqIWaFGRqQMpXngnKUw?=
 =?us-ascii?Q?XZOJC4Xdg8iU4DCfnnAV8vIzBIvllpbeT7KKAzRTRYJtsttCshtx4BH9ptkb?=
 =?us-ascii?Q?5/p9jF3fpFQgz/sdUhX/fMxzvmKspySjjbu7QdDs8nW5HVPIJGibNATiA6jd?=
 =?us-ascii?Q?xklblgLn6GJl3KTldYLqlNOyqIgTrKJScnGOT2bT3R9PbFmuH24jcTmBSeYF?=
 =?us-ascii?Q?KK2HFFWILaFDjYvfn1NO4wm4htLqU+fdNP9fn+z5e221qaXH9qJVmi8rBMzE?=
 =?us-ascii?Q?P74ar4FykcxNfK/CudOW+r6ZoZohCAmSGVwrdSHcSheYSFFiWXSLW+0Ap6wm?=
 =?us-ascii?Q?9BD37VmJJ2LfR20YaB1quUveVqUT9CnPuA0MzOITpN9TyIKQ481+cxU43TGB?=
 =?us-ascii?Q?IJaZsjOvyaTawAHxiqL7lNsJR/SsWHTklQimvlSRwso1ZoFUnbLqYsK36qAt?=
 =?us-ascii?Q?ZH7U2r4Q2MpP0u0HkpxLXsIDitqiH3GUiughWcDeAAxxY3AJcUej72FaS8UU?=
 =?us-ascii?Q?V+9G7O0bPbJ8KsQ1tRZCCdFUkZ5DUakLzGr2blek4VUu3XmC7AEa1iwZiyIL?=
 =?us-ascii?Q?ACOKDzB3JMg+jshBabKtwgO1/c2/1mdGYRpxn9BTcjkObcLCE30re5MloDgq?=
 =?us-ascii?Q?Jx3qG07j9DbdQchME1vITjioOLP8fJ2jEHvUnEvfJsr6dNylTtuajvanUW8r?=
 =?us-ascii?Q?H4D1AaTgtMIBRJR2BtM6DcJvs8iUJs0KR415rzVmUojz1tkDYKdZooWfFfIf?=
 =?us-ascii?Q?ALblEGMjepv3TXNPAmNfAvH41K9KTZIMg0oX8hczqy2lKNL+fSgdvY94heIL?=
 =?us-ascii?Q?OCFv5J896calampHBPIYxtU3wDyRBOvTcXjxTqyrEu51m5+gNWB077MsJQz1?=
 =?us-ascii?Q?UYTqKWdon9Yapg5nE13yFjjMFso0pmSpm/9rUWaEbBxIpyzlraExOaI9ZTIX?=
 =?us-ascii?Q?dET8ZXnacgqwBxhYTWNcVJ3b5gdFbG9SrFTTcXF3ISzoSL4Upz0i44oJwjCo?=
 =?us-ascii?Q?09gHO+i3WpzTKrqreE4RkPndZSUGa4dDaMjL5oJ9njBOIKFHN3xErZThmdMU?=
 =?us-ascii?Q?yT94Gx2sW8AVbwx/OOMFFuiprdy/L98BhgR9ONfgfAUzs6CmPjx/Lf6QOvCt?=
 =?us-ascii?Q?wgjG6wVIutTs5Itox0s4dvac4zNDy6fdCYCapIH+vbWcwfPp1/PVF6UDYJw3?=
 =?us-ascii?Q?v5IccukO+pCygZIgS9INtMTCtoZoeMZeGbVFj606XQtCkMIRD5hsLN4nM0ul?=
 =?us-ascii?Q?w3xnlHN067UA8nsWeVaYuxi5WQsQS/JOp63xtM9D9TfAK95idDj4OYAsEOsW?=
 =?us-ascii?Q?01lavftHYessvgcQmMS4T0Gf6ZiwdXn1RVflMV7TTdFjDxrWn0KOfuCUyH/+?=
 =?us-ascii?Q?u1FqWaVBDrFC4LuJaJQU4jzhD5k/hJYAqnkXU0XsqemVAV36LaMmAE1xxPox?=
 =?us-ascii?Q?VKZHlc4aO+eQfb6gPapff5hcmTVbQbiud3xcD6fD1ymqJrgT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97208f4b-52a7-4b1c-e6cd-08dec19d9e32
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 18:26:24.2741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EHtrdbCve50yNYgRX/P4Nnr3LL8tzVZ8FzEHkB7+IDgY/9yfjVxYE5mwpxBXbHVpaKqpMWnRaorrhvsBaA1mnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMCPR04MB12669

On Wed, Jun 03, 2026 at 01:37:15PM +0800, Xu Yang wrote:
> From: Xu Yang <xu.yang_2@nxp.com>
>
> Set PHY wakeup capable because this PHY supports remote wakeup function.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v3:
>  - no changes
> Changes in v2:
>  - no changes
> ---
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index 88b804b2c982..591ddf346061 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -728,6 +728,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  					"failed to get tca\n");
>
>  	imx8m_get_phy_tuning_data(imx_phy);
> +	device_set_wakeup_capable(dev, true);
>
>  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
>
>
> --
> 2.34.1
>
