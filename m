Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011040.outbound.protection.outlook.com [52.101.70.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A68C31D362
	for <imx@lists.linux.dev>; Tue,  6 Jan 2026 09:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767692329; cv=fail; b=jV7RuR16A8tueZe0J6b4qi2xaTjrmH0/ojv2fmfyhRSbZiJ91xjZwQ/8kUo5X9EdpPKpK4AceIvMoCpqnHswDsHliEKAoG3iP9B2XdFfhKL5NpJQwq1P+p0hkaXa4aMqwq1HBp4giCS+9zwOyo/s33ZV1HEy5Fi72eAMBx3qUNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767692329; c=relaxed/simple;
	bh=FVTD3Htj7rCGFfJ0Oi6/A5A7dLppRB4avQ5+g/LxlYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iiaEl0XisW0yeGAme4mVsC106lttTzqO3FQWPqeuHXG7pXqm4SPGfRbWfrfbMuzQWLTTPQOkA3jBLuyOkv/ubAgmbf7lNj4Cl4L6BliH+p0dVchInNyMSmrb85WxvDJVUZPriD+oemoIK+eaB3MdG3Br5Gt0D6JNhSaEyVPXVnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UfWbCY1n; arc=fail smtp.client-ip=52.101.70.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UfWbCY1n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iG6XlkyjmyP0npJPTqd3PBRKTCYeF9P/KBCFBSYHPrwUHJPUnqSU0neM8wfyzaEmqhnV3rGV7fLg66IzbTJ0kl+QYGwdWN25HDj11Z6yx30mYUgBEFsUMr9Kul9qBAjaGqMTQRrKPedJSrmGJAcg9J8+z3VR5PVnbV6EEvNN6bgbFlQpRgYdYMNPQm0W6tx6Cre0YKRyPhphsetXJCtHQWoCTcHQR/qY2PB/9yLMtLh1RED5up2ODHeHhno8qaXjVXSlPd6T2ONY+BkOn1509aWWqaCuYHj4v5PBAbPZdalNaVY1JBvv2t+/lP/BbNiIPi3t/vUjCgDLjUp9aI5HzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVTD3Htj7rCGFfJ0Oi6/A5A7dLppRB4avQ5+g/LxlYc=;
 b=D1hfeLE7qjcgwnroEbQnSdZFz1X7+af0jpHEtoJVGPNlgkwzKCFdki71GR0D2hhA5gzvGjf3WWglFRcvabqcZbixBkLuB8m6LGsGVpPWJCzdc7RU7Orn6NeuMDPYkakbGZ6fcyAxEjrGiYyAsaDgrUU3o3C2bjwOg5XFiyLsb5kupvRpSAfOXfBfjf/FnSWndLdPnHEEMjjMND9YSbrlLB+njh988l/qesBIyp0uDKwfFL3qO6dCFLLN7uAD0a9Et/vv9b9xA2dz5LlkxXu+fcqlPLBP7p47HVSZbXJonjlAOGXqu4W9mNA6lEkpVRg0Ns3QBUVNX1K9vXpTW7Y/Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVTD3Htj7rCGFfJ0Oi6/A5A7dLppRB4avQ5+g/LxlYc=;
 b=UfWbCY1nBXbKC3gwqBGkz/RFdqDC7U7VednZh33GSD2CfHpfd4Ll3M+X+3hx2xjMJkyYvD6MFKT76Orl+fTVjHCRc0cVYZgubGmKNnxKmsV84Zf8pDQk+ui86xtiLsl5eLv9fnKjNGfiYTU5DfV5Jxjk2oqgJuD3RcogA0RpWfuZw7AP8EnzRgSMbYuAvVUMUXRpaoOj6FBlwActWtGPns4t1AoriSdp4hxoOKewYIBcW3MaZkA0JtumdfG1zCAg79PXGnV/CSeIUMddtlSl09hIOwGkvghXxgTEpinlGntVxiESuUAfBOt1eoRjAiqjZ5STmd9rOOmiLX5wWqez/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by GV1PR04MB10655.eurprd04.prod.outlook.com (2603:10a6:150:207::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 09:38:41 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 09:38:41 +0000
Date: Tue, 6 Jan 2026 17:40:10 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: sebastian.krzyszkowiak@puri.sm
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel@puri.sm
Subject: Re: [PATCH 3/6] arm64: dts: imx8mq-librem5: Enable SNVS RTC
Message-ID: <aVzYeor/+k2mbOef@shlinux89>
References: <20260105-l5-dtb-fixes-v1-0-f491881a7fe7@puri.sm>
 <20260105-l5-dtb-fixes-v1-3-f491881a7fe7@puri.sm>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-l5-dtb-fixes-v1-3-f491881a7fe7@puri.sm>
X-ClientProxiedBy: SI1PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::18) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|GV1PR04MB10655:EE_
X-MS-Office365-Filtering-Correlation-Id: c99ee4f9-05d6-419a-c0ab-08de4d07604d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KgfLJzstxq9B4b1K48fPtjLkhtApRx5Gtvc124ggKdswF5zb2c3CbPWzljwf?=
 =?us-ascii?Q?gfDr4m0Acti6dn6QnOpe4Z/1eBsmMREWmyvyXpRYJEmO1WqiQNeBsZZn8StW?=
 =?us-ascii?Q?ap+1sMT5RvF4XF9RZwXzdeF3CAMhih+wWa5odPvi0ExrVpaCN4gezOFHbBKT?=
 =?us-ascii?Q?QMnTXty/9/jh1cXkwxlyDETtzCjzT3Zw6c+4fIHxinOvLEyd4Ht2P/hwQ4CF?=
 =?us-ascii?Q?8uwtFejUpjRlyWijbvN5EnGEoRqjJpMf8dK08J8AI9LF29aFMoa0Z9rk5NZ/?=
 =?us-ascii?Q?g//tKPuAoRLv2BrSgBlw4DXoKGbnBKO0I9tCEdk/KAX1ZYQ8QIbRkuP9cOel?=
 =?us-ascii?Q?trSs9V2aH9KxbKL8ipJi4HR211DOjXSQzBcLqD/41x8LEICt5jvYf2Iy4p9/?=
 =?us-ascii?Q?Cg260txH1+5nyDVdY1j+WOibIjZ9CBxNp1n/+NmBzISg8WvyA9EQLJhekVgK?=
 =?us-ascii?Q?hElIwlf4dKLdFIoVQ9Of+CU7/cbBWifabbXZEYmam/Mk3QFcinflWfvkMrUO?=
 =?us-ascii?Q?vP259gHT+EBuEPE9sOCpY4mxJG+aM07a8FYfHok9Xrr0w7XZY8RaLbYqzv9E?=
 =?us-ascii?Q?MKXy1J60gZWwoFmIuYIZwfwDNpI5IuR3HPZUBLhVxwOm641Acoc5oDotOvFv?=
 =?us-ascii?Q?EQFrKytFzrLxtL9hArpYgNkU7ZZe86THFomsVe+P85jgqzcp3ao8pz27YnQu?=
 =?us-ascii?Q?2Bh+mI7J1gZfV6k6IwUqM45lL7lWq0Zkj3rLJyDxP9RKhkFpcrdzgditu2Ho?=
 =?us-ascii?Q?QS82ygfofzprn+fFQwCHN5VupL2exFD/6pSS+3km95/o4/DclR2DEHJlm2hs?=
 =?us-ascii?Q?ET76ig8CHstpOLOJIV/CQ4wJv7V6+X+qy3F+bCc76NXCJAbNwQ0TpbY3NldC?=
 =?us-ascii?Q?PwOjz/ZYUFmPDS+4MxRlHWmmWU06wodBB8xYO4d97gg22ZHLLZHsdBEzHzFM?=
 =?us-ascii?Q?m8rz/oAymdRY6XFxZ+dWGHwjV0sDaJ37Vzv9A3pjQ9dA5HFONI+BjhISK7sr?=
 =?us-ascii?Q?3Y5o28Ta6HV0bd2Gp6nJXU+9H/xanOR9XNZvF85QdKHBgic47mgQHvqNpE4b?=
 =?us-ascii?Q?kWyXz8Q+pAIeNsbM7zrPaZvknJMfU1VKYowUO62+V5UAFuyzLoMaYfBW9s2i?=
 =?us-ascii?Q?BG1pvxEpEZWndWIy64w9NVwXWnHeoltagD56837G7xPXRnD3vi0xjXAhxM7v?=
 =?us-ascii?Q?sl7vAr6whf+nQw5Tj4TykY9yWUdUc7wUO3yuE9itiSxWe5aQd3eoNVrT905W?=
 =?us-ascii?Q?EOVZvW+QY20Be8djJlPjthRmUxUgWXWDAzASJTHA1nr4DirIKFMKCqAVaedT?=
 =?us-ascii?Q?YLO3GNwQ6JAMTHWML9pYW5w1V1vOvyUDo0KcSLc4xXT+uMrbQHd3qzydS6v3?=
 =?us-ascii?Q?q3JC598HCkuVXiMtVPpOXZMsyeMReRvY6JSJLb9Gw0uupNrE49Q7bKFI7wzk?=
 =?us-ascii?Q?Sks1kKwre+cAbVf6tS1XwuDZZ/2vtOKbYpaufEazJUBy7ERzu44mZcp8QqqZ?=
 =?us-ascii?Q?TsP4C09TkYlP3/WQ2fPAueLEKZYzapSXvhuB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Pf7ApasIJEl7teyq5b7eLtPz6IdyH+jmN3EQacaVjLpwoht2fdzzBGD48DjJ?=
 =?us-ascii?Q?hWZ67s3THuU5ahqHOz0QkuNamYOnUjr5bD9p6EiZz8/QcEYtK3FGs/+L+sYo?=
 =?us-ascii?Q?VnrFPkpowOTAhnWOn+/s57QgSjZvaMjj+xTOaWTVw5vWzgT3jYhlSswhgAvI?=
 =?us-ascii?Q?uR4vKxwgd/Opi3BpuYWQQFUFx6lKlwlZtDiJyr3Y13KUAkFKaP8YzXEN1VxH?=
 =?us-ascii?Q?JoN7Czsy76arEbu5WUy2rll+4Cg9Bf/zmCFPgtmEkvNqZRc8cmvO5R9MXNQt?=
 =?us-ascii?Q?Ki8wBV9wde3BmufR33LPFdXs2J/oHcjWjWzQxqfQ0QWasR2QINLTsk7B26KE?=
 =?us-ascii?Q?zQ146V0OisNc8OOzrgssfzy6nWtFvWBOqS1zxraEQrSGrFNzJgmCUhWkkeMo?=
 =?us-ascii?Q?cWzgU1EW31mRAXuJPAfSvsIVP9uGhoIuBhPl+6rQhUzlIsjbjTzJ+GpBng7/?=
 =?us-ascii?Q?QmxnY1H514MdOgXqJ+vbpH2SMssZVzGQcR1jEOXk4pq9SZEDu6NTI1Dx3S9K?=
 =?us-ascii?Q?TqeMTP2dgyuC3igJCivFihLd6HXTsg/mcBFvqLfrt7+MydTDidUxDGfOYbk9?=
 =?us-ascii?Q?5S1ZLMG8M46fDdBWwnqJEqg6x42mzqOXOw/SV1cayW1nkvVQLhXvSO3CKz9y?=
 =?us-ascii?Q?n9uq7M1Y7eW1E4NwjeEa8RVjk3uOHhnW4V70ZOEnSZEIO82wyiIqM4H3aJ5o?=
 =?us-ascii?Q?VUPDfOpWcKWw3bzaC/Hb2R+CO4TNC/RmWfnxUuH2+iVPUybt9McZmjjFtxjl?=
 =?us-ascii?Q?io5pUzxR/rve/i4gs4fjjQaD+Muz8qc3MHV3PAB73kuCKf1s6VHvU/cay1pR?=
 =?us-ascii?Q?M3FJ706GipsfR97DI/nGAYTjHdxwk/ZCc08qu13MWuInJcaBu3lxm8nUy7YO?=
 =?us-ascii?Q?ZE0DzKhqieZCZv9mtCJsVcl+6Ks2iA9ey/A17g+kOInm0Y94TXdXoS3asZjv?=
 =?us-ascii?Q?Xp3E8zW15RLUu+P6LF2k1CayZZQ7YDc+yl0Oc/7iA+4kpL8fAicbnluDzp2Q?=
 =?us-ascii?Q?7TuJ+X7TdCLB5hWRZxKHusSmZAAD+J4swaUcyPiyUvy6KXNuzzIl4xU3rH82?=
 =?us-ascii?Q?xQ7R3HdyjIMkxJmZDrNc8lFTcFLzk/ZK07oJTVOaNYchsDq/fJ0sMwUFmZ4e?=
 =?us-ascii?Q?0V5j7Gj1AUQVuY+ycthXmRFQeVASQ/Co9VGquBXZnqNfXVQwN4T/nrJoERuJ?=
 =?us-ascii?Q?7T6O5RV+3PKW5GYcKtwN+CTv17m6g8yd5PNOpMNnLkrBnc0Oyk+tWlf+5QHI?=
 =?us-ascii?Q?vn/m9CKgd7ahlvFo/Gpd4Uil92mElFbGiivjXdb97eZMntwuCKFRwZb+J3UI?=
 =?us-ascii?Q?NxWq0mCoHKiYGc3I+Mb61qAGkqmDu6gW1UVKrovrbzOXFKiTaAL9zVaCjCaJ?=
 =?us-ascii?Q?OrTFeJJ04WsyavJnkC4twm8MtMj3RlmO1HBwCNIt+gHNmjS8nGxTxoTg+/3H?=
 =?us-ascii?Q?vGMIWp//gzTmK2bvixYjOOnYfTzzIVcAT91hDybdMMhDqY+V+OzV6WXnAtPM?=
 =?us-ascii?Q?HIgCKafwOda900k9GGQgcGlQPAdMLH/le7qFV9j6Q/R5ZeNp7pL6p5RzIztV?=
 =?us-ascii?Q?dxs0S2bINJfCPTsCAK3kFTbPU1ux0O1virhn3tgwiBJb3ZXxsiGhqM77OWQR?=
 =?us-ascii?Q?qJultob7XOFmI1MSw3sdpmWdAyXNDKxQeKDAD51yXo8NuScaa/TKIPaW9V0B?=
 =?us-ascii?Q?+SXhGCKb9hctJSdE4Ydg1JytRqGGXl5mp9avtl4VFNFAB1OjL9tmwZLfKFCy?=
 =?us-ascii?Q?QQZiMD5yOQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c99ee4f9-05d6-419a-c0ab-08de4d07604d
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 09:38:41.0551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XIM31FP7WA68PQ7gQrXLnkCnscycJznY1KIRxkj8V4nthZEVrYbkpxRmPrYtQArabg9n9+lGSQD1x4dFffqLbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10655

On Mon, Jan 05, 2026 at 09:39:40PM +0100, Sebastian Krzyszkowiak via B4 Relay wrote:
>From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
>
>It has been disabled because it was being used for system clock instead
>of the discrete RTC. However, SNVS has some features that the discrete
>RTC does not, such as being able to turn the device on. Solve that issue
>with aliases instead and reenable SNVS RTC.
>
>Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
