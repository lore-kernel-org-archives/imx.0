Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013025.outbound.protection.outlook.com [52.101.72.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6380D33D6F1
	for <imx@lists.linux.dev>; Thu, 29 Jan 2026 16:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769703461; cv=fail; b=nO3PDeUi4P6EdCzza6S5Lm7S2VtaG3ozaM7zx1w9MXsUJl40GPYnk6VAbS2V9AkwGqd1P/BnWYsp3C/rE7qY6AmYTKUWmhvlmGnE4NL7cZSF9MvsO3s5zpVGozbgn3kz3S5+OJ695/EyroAEr4sHxgcvFaf420V/XDAeSrtIKuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769703461; c=relaxed/simple;
	bh=IHqY84jyISwiNs6P6c46N6gP8Ifk7yzJQdLnevUMX5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Rm7QX5e5/4UYUn/AB0Tm5oalQf8MCxVfo02dyycRCr4W4iz6sR3xsQh83/LwNNL/TrzzBngoO7NvjAvEigLnzYlfzAYdi7QBdPi0zh7p1kq4pIHmHZvgAls3bVy0KJfVEimoixdZV5vkPaidnFU58OHIUSFVFQkq5+JbNcZvGoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VRtCz4IV; arc=fail smtp.client-ip=52.101.72.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VRtCz4IV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HiSkHfOPMSr3vQYe51lCYlWp/YI5KuwENRyiW//VRv70NWq4klbJuJpfJSrG0dYk2etWGZY8gX7zuBNtibwc/f37F4WOLttQfM0xAVR5IX0nGpR4SAZHt1Wuc2fuPGHz9WX0qfhuHPsUMga7gr6gJQWQa6bVjfk4BUrhVraYv75SE7qBwWssvVXNmWokfe1xvLurSwouGR8JEyt8J1BcHlam9q/iP3yX2ikpGjMphdelvpShnw6wdDDvJkBZr6PTUQXrpty9zOoUXlYmXUVgqZ/dl8q6qxPHD/RS4/OGZAPV8S5MVKzv41SKbYEA14orMGvrck2VokV0tQ6AcgG9wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSPI6kAEo8d6O0gFWWy9wCtnsx7wREAvzbeDone5vQo=;
 b=qivxx4tfi/DgiqIthAAb9QjgIYpYHkn//svRRPK+r2QYiCvYcVHegZeoNGoKCsvsMl3TuBERyc5qLcgTQQdrTo+b+Mp/I0003HbyxDrCKrDb0fB8j/c8x/pww+nc6v+3Yl0UvAFsQxJmByb25V8gNjHTUCm32pKSXzOOyCQ1cg/fvP9c0/cKRNeiDQtgcgNygBoqlpCUZaXZ1edf8JbN/RRh3drKgLFE0v/hnIXcAXuC5bagvFsra19/O7SnL2I7tk5A5+dkf1yrZuChSKX0rcYX2mfQgPtOSkrmpDOxJIUwGKhQHzxSpWluR7AFMSGRJH32/RGLCNLt0cEKffg7uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSPI6kAEo8d6O0gFWWy9wCtnsx7wREAvzbeDone5vQo=;
 b=VRtCz4IVZzpplmEVd9ac7kcU5SP3gbygPHGe+quCOB6StkplNB23dQzA1tdmq52Yw4s3GHAXceg9RHi8l7B0bQE1CnSEkzJPV8x3lb7njwwYUrozTetZh2ImDyWuXHSvhfVCwVxS7nBWdvZVSVW72brQdZRGP86TplyIK1NvTz981t++hrlcyrvc26y92VijXvzQDCWkQbZCHjdijdy0GBo857s3yIn/4Guj5ElXINFsikGP1tby7G3Api/zqja+vekuLQ6ZTnebg+9vuJiB4B970HTA6IELv087lQqrZpVCXAEm5InUQVa5Dqu137Bk9OPkk4oGjAgMr5xaLtsGGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB8PR04MB7146.eurprd04.prod.outlook.com (2603:10a6:10:127::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 16:17:35 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Thu, 29 Jan 2026
 16:17:35 +0000
Date: Thu, 29 Jan 2026 11:17:27 -0500
From: Frank Li <Frank.li@nxp.com>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v8 5/8] arm64: dts: add support for SolidRun i.MX8MP
 HummingBoard IIoT
Message-ID: <aXuIF2AWQuVM6jYY@lizhi-Precision-Tower-5810>
References: <20260128-imx8mp-hb-iiot-v8-0-9646a3025cf4@solid-run.com>
 <20260128-imx8mp-hb-iiot-v8-5-9646a3025cf4@solid-run.com>
 <aXpGVrpyM3nwmVN5@lizhi-Precision-Tower-5810>
 <8240379c-fe1a-4c2a-b73d-c9a17c46c863@solid-run.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8240379c-fe1a-4c2a-b73d-c9a17c46c863@solid-run.com>
X-ClientProxiedBy: PH8PR22CA0011.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::22) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB8PR04MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: 52524523-963b-47e2-d006-08de5f51e979
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?Kxj1nStEj4ARP/CV44oBzkl3EyZz5fqhojoWbGZwf60BWHDpO8n4g2UKKKAM?=
 =?us-ascii?Q?rmGPp9NG0qTE0TYxus2UWaYmiu3lDTz3X0T0W7HkJoYqGnBUQK8hGmXuEest?=
 =?us-ascii?Q?kkf6wOWVpc2JEzobOX9Pw0az40voTR25NKmZ9M//n4H/xvW8FYP8Zw5ULWou?=
 =?us-ascii?Q?tM+0J7xeTjbgio8aDlBe6f45Rf5xQcC3Rh+igSrjHvPuFq0IPNZD94SSsbC4?=
 =?us-ascii?Q?KDxRDfe/jd4+vkJt9a+XmgbOjLCJlf1j/gADAycOWs9WydEklfSHUJKoDCkQ?=
 =?us-ascii?Q?vVyH3uYcpt8+dgxXa0R6ZxFF4mkZeG9mg8ebJpJEvibOZZviojDXCDgoiqL2?=
 =?us-ascii?Q?kWkcCo3wO2ZHqPKYRN7tdBbcNcwb+6wMF51d5pXtoVW7q39GqddbMLFb9JHN?=
 =?us-ascii?Q?sbEubHq9uFMjA+7BR3wX7HEjdYb0l1jcdFUuEp3h65TjF0Q0vxzpf7E6qczx?=
 =?us-ascii?Q?id9IBchSuQ7TgVFQAVN61c+hJpcouZHmhCdZC3vt2v3LrY0du02yU/jCJLGi?=
 =?us-ascii?Q?wAn817lXN1EBzfq4f2uz15XNZGI0R8oRCeuKxNZR+M8awg0xpasyDvXrFnAa?=
 =?us-ascii?Q?ATpoIWqkrekbR9ySgl8Pi4oFetw3vaG6Hfy9zdyGPNUHTosj4hAnZuPFAjb3?=
 =?us-ascii?Q?jZl/oRSkYsM9h+zP5KnxW7dEBMMYns0dJ5XM4FHlntAd3XIOO44h+taKVHj/?=
 =?us-ascii?Q?27sCjFcIGxqFLF4Pkea75ElbDL1Jhhd9ncCNH+JKW4JIREyxbj7XhE359sCz?=
 =?us-ascii?Q?QUSn1h7hfe1EgoeIU/5JRyzAtNo0RBRcZFvVyo4fDu1MEFxNGUEukVDRG5vO?=
 =?us-ascii?Q?VwdEaPihlmq1jheB/qobUfQRiXc7HGDwj7ujwHI3pGUoae20aD/yKcnAli0Z?=
 =?us-ascii?Q?uajL3s+Lt6hLvZo2z4gcJinW39T1vN3EjlBoCCV8RgvvSHLUbB7GoXZrtMj6?=
 =?us-ascii?Q?JfB180uPiDgju7SJ69qajRvSO/1Jhj+6FZBv9Lr+1u2UcXzgQcAiPlXF6JQb?=
 =?us-ascii?Q?Tr2vknEiQfS6Xl8uRyXlrHr1XQ5LHiUItmWNuggacYzy9hgjIwMJ9Iev0fYk?=
 =?us-ascii?Q?11q5PtyKHKTJvbqiV4ABvuyCKhPcHhC5PFwCqeXM6FPDFLahCknatE5WQCKi?=
 =?us-ascii?Q?j7n0FVV5wKyfmtoJOH+be4jyshBMCHlu9/M5GQzyMtQCP3X07zks7P+uhqvA?=
 =?us-ascii?Q?9ZOf2vpNVz/iHyvYcl0GtUyXBLn9L+PQYPR4lCX2vO7uZTwdGKOYefDilomJ?=
 =?us-ascii?Q?S/jPN3XDBp+mGWAumoqRC5jLy3Pr+oB/9L4Ovy0P4hbUEZZ8qxsLAvxUPE6t?=
 =?us-ascii?Q?/XxyGfgTgP3Ba0e2kHK1a/G1xKfWTy2V7Ztl09jQ3dsL5pIi3Xe+oxkkuFal?=
 =?us-ascii?Q?s0XskU+C711aCxdOOvUg6pxcF9Cj59uF7Tr4QhZ4j1OXwtG2l4MnKtthWy1J?=
 =?us-ascii?Q?cS5/IGjFrkr7TAWSjbRSDVImmZgPoj5VOHtu3Uu4xebeEIs2nhPCwwLpcPpM?=
 =?us-ascii?Q?MgfoJxDgfKxHBQT8xGsLIs6cn8hc0IFFhrixBNWTVMKXC/805xNu3zwiIipd?=
 =?us-ascii?Q?F64VpKoAESNTD6OPhalJB+n0ZKJgFTNYvUl4LSTuselnuGI/NIFMag5r/4nx?=
 =?us-ascii?Q?3YG0srXtNiKN8xndVrYr5a0=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?gH/hKKqEFSzZSnc8U7q8OjSEYplF4zHjiCwOUr4PtATSt8ZE+SRair0X6UVe?=
 =?us-ascii?Q?XIDXQqIhs2zBErr5OqmNY71HTaXh8h6wC1nePe2mxSII41WYRuLEJyfk6Sv7?=
 =?us-ascii?Q?qdPAKxsldcJLu0MAcF5dsVCIL1Ft2byZMwhp0B9JM7SJQo4h2OpPjlnvoGmJ?=
 =?us-ascii?Q?lypl/mIGomW8MSMZ/f/RdHU/w98rJ2ow/OYLebMhcbnWmEaA+8tpU1mFE15g?=
 =?us-ascii?Q?HGzSeORHveZKYMkKPXVNVyMLs14hLSQtkggbAaOU3AqvNlZI20HpsN7+27w5?=
 =?us-ascii?Q?73M40t4fcuuxQpNVY+6NDFEPbW76ETvIFsDYkImnO40ziRg1MoBypUPQGniz?=
 =?us-ascii?Q?o0m3rCoeBg1ATwX9bUExhudmFtUaaObri3Xypho2BSta7/i5Y7F2FQ/Galgd?=
 =?us-ascii?Q?0wmnr8lVydIG7U3Uw2BiTXx3HDTVwVKOPybKx6xY/g16HO8ZUx/FWQo2LbC2?=
 =?us-ascii?Q?8Il4CuN7R1VM9F2F/tru/tWQK5b4ZXw0Edz1cTOlhfz3wFRlagLJaYZiC75+?=
 =?us-ascii?Q?M65mAyJe5OH1oterz4qL8c+RU8vpb/eSeY5/ig28KCQyU7lSe66KrTMvbvSi?=
 =?us-ascii?Q?8TIRS0jKFBb+PtGfo/4Lbt6FFj0IB6u//a6EMX3lNoEey/U3/ZLaC/T//jh5?=
 =?us-ascii?Q?sBEJASTRCtnOtQ6dCCsG+AILtrlw8DTFp/KYABC6V9EDXSHAFnsAg47lKCid?=
 =?us-ascii?Q?oL91W5NSP7FvF1YSuPJpT6mb4kqHP1ITqcbw2UggPGPc+zxF64P6XEBxQAcn?=
 =?us-ascii?Q?5nUi/IWpRW8zPKEHHK8dTC7hV7XtXitlgfVi3Vq+i+r0bM0n2ZSjEXY/MNkk?=
 =?us-ascii?Q?Qr29fzoMins08IO0FAnp6rKkOIt84JBTAj+6nKLj5FHf4wJO1JTLSYlgQivo?=
 =?us-ascii?Q?NsJzZzB1DzNVBsImroMFRPrAtM08JtiloEESJ4WnCKLhRnHVE6X3aX9IqI3r?=
 =?us-ascii?Q?KdAR7hqlE/zXR3/BkM3o0GmLbaUZ/A010PsbWH7zc7vMvDP3iD1p9Hld1HSy?=
 =?us-ascii?Q?X0Dn5GD73A2QIT82kL8bzt56dviENxPo+Zgnc/NK6UUz2zAvKKenXZ/W6I/u?=
 =?us-ascii?Q?KV9oWKUukYx9r7Tzy7L0WZthS5p/4pbGhno2T2cT6jytrT5gj7+FdE7hagFJ?=
 =?us-ascii?Q?jh0uoYcp09vIxL3h3sHYwVSdU5gk67uGte7PdXkyHNnmnSqy4LKrXE8Y1QF8?=
 =?us-ascii?Q?WklBNt0jBPe9ZfLLVZz4pNJH4Odk7cSpgEefHpVpOVpIpwFUSIgXo1goNmlf?=
 =?us-ascii?Q?b2joSAHsDSE/rZ3RMjTVk2GI2Jo3B2tj438KE/9xdkxCwH7rYxTvN92x6hwD?=
 =?us-ascii?Q?edFR61AEcuABUYS5FRcMc5+1GJOw3RKkr3Th3fVPTy2LfuH4c7Kg0RYanxw5?=
 =?us-ascii?Q?bR+ePXQo8s5eKt0D8HftM1jNTiK0sYsTSG1eCzF/3pDj7dh9UdjhT9ZOgehb?=
 =?us-ascii?Q?m0Aliat6tqiDc6kaY3+FruZa6q1aht+i3nlK0+GeYO8VtCFFNglT0LuOIgP4?=
 =?us-ascii?Q?datBkJBakfmwMqpfQPRW9d5drwTe85dtFqU6jcwWDbJ+h4K8g76KYoYWt+lF?=
 =?us-ascii?Q?r5op3QwQsNDJPWkjObYcdPAIenXz6f82a2PmJDHzBPZj9I47W35kawAyN8nH?=
 =?us-ascii?Q?osExK8YDXdVUY8pgYwwGbwrek/F7+FegfshI463YbkzgeVyHmlU2X8228s2g?=
 =?us-ascii?Q?yc4JjGGbv8DQF8zOvb+2vwOVGTzbYh6TfR3xjMXLOLpz0VMK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52524523-963b-47e2-d006-08de5f51e979
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 16:17:35.1230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDZbUwepYoG5PYUJAjE+ftlvHXXEVpln8aLzYp2Kf7xGhKdAZ6kDll9Os5UhNFp0vhDRW5t0WWUgdhQuYg4MKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7146

On Thu, Jan 29, 2026 at 10:49:14AM +0000, Josua Mayer wrote:
> On 28/01/2026 19:24, Frank Li wrote:
> > On Wed, Jan 28, 2026 at 06:21:29PM +0200, Josua Mayer wrote:
> >> Introduce support for the SolidRun i.MX8MP HummingBoard IIoT platform.
> >> This board is a new design based on the i.MX8MP System on Module and
> >> does not share much hardware with previous HummingBoard variants.
> >>
> >> It comes with some common features:
> >> - 3x USB-3.0 Type A connector
> >> - 2x 1Gbps RJ45 Ethernet
> >> - USB Type-C Console Port
> >> - microSD connector
> >> - RTC with backup battery
> >> - RGB Status LED
> >> - 1x M.2 M-Key connector with PCI-E Gen. 3 x1
> >> - 1x M.2 B-Key connector with USB-2.0/3.0 + SIM card holder
> >> - 1x LVDS Display Connector
> >> - 1x DSI Display Connector
> >> - GPIO header
> >> - 2x RS232/RS485 ports (configurable)
> >> - 2x CAN
> >>
> >> In addition there is a board-to-board expansion connector to support
> >> custom daughter boards with access to SPI, a range of GPIOs and -
> >> notably - CAN and UART. Both 2x CAN and 2x UART can be muxed either
> >> to this b2b connector, or a termianl block connector on the base board.
> >>
> >> The routing choice for UART and CAN is expressed through gpio
> >> mux-controllers in DT and can be changed by applying dtb overlays.
> >>
> >> Signed-off-by: Josua Mayer <josua@solid-run.com>
> >> ---
> >>   arch/arm64/boot/dts/freescale/Makefile             |   2 +
> >>   .../dts/freescale/imx8mp-hummingboard-iiot.dts     | 721 +++++++++++++++++++++
> >>   2 files changed, 723 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> >> index f99a24ad115a..0847347786fa 100644
> >> --- a/arch/arm64/boot/dts/freescale/Makefile
> >> +++ b/arch/arm64/boot/dts/freescale/Makefile
> >> @@ -213,6 +213,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk3.dtb
> >>   dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-picoitx.dtb
> >>   dtb-$(CONFIG_ARCH_MXC) += imx8mp-edm-g-wb.dtb
> >>   dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
> >> +DTC_FLAGS_imx8mp-hummingboard-iiot := -@
> >> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot.dtb
> >>   DTC_FLAGS_imx8mp-hummingboard-mate := -@
> >>   dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-mate.dtb
> >>   DTC_FLAGS_imx8mp-hummingboard-pro := -@
> >> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dts b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dts
> >> new file mode 100644
> >> index 000000000000..c4dc32621f6d
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dts
> >> @@ -0,0 +1,721 @@
> >> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> >> +/*
> >> + * Copyright 2024 Yazan Shhady <yazan.shhady@solid-run.com>
> >> + * Copyright 2025 Josua Mayer <josua@solid-run.com>
> >> + */
> >> +
> >> +/dts-v1/;
> >> +
> >> +#include <dt-bindings/leds/common.h>
> >> +#include <dt-bindings/phy/phy-imx8-pcie.h>
> >> +
> >> +#include "imx8mp-sr-som.dtsi"
> >> +
> >> +/ {
> >> +	model = "SolidRun i.MX8MP HummingBoard IIoT";
> >> +	compatible = "solidrun,imx8mp-hummingboard-iiot",
> >> +		     "solidrun,imx8mp-sr-som", "fsl,imx8mp";
> >> +
> >> +	aliases {
> >> +		ethernet0 = &eqos; /* J10 */
> >> +		ethernet1 = &fec; /* J11 */
> >> +		gpio5 = &tca6408_u48;
> >> +		gpio6 = &tca6408_u37;
> >> +		gpio7 = &tca6416_u20;
> >> +		gpio8 = &tca6416_u21;
> >> +		i2c6 = &i2c_exp;
> >> +		i2c7 = &i2c_csi;
> >> +		i2c8 = &i2c_dsi;
> >> +		i2c9 = &i2c_lvds;
> >> +		rtc0 = &carrier_rtc;
> >> +		rtc1 = &snvs_rtc;
> >> +	};
> >> +
> >> +	gpio-keys {
> >> +		compatible = "gpio-keys";
> >> +
> >> +		wakeup-event {
> >> +			label = "m2-m-wakeup";
> >> +			interrupts-extended = <&tca6416_u21 11 IRQ_TYPE_EDGE_FALLING>;
> >> +			linux,code = <KEY_WAKEUP>;
> >> +			wakeup-source;
> >> +		};
> >> +	};
> >> +
> >> +	flexcan1_flexcan2_b2b_mux: mux-controller-0 {
> >> +		compatible = "gpio-mux";
> >> +		/*
> >> +		 * Mux switches both flexcan1 and flexcan2 tx/rx between
> >> +		 * expansion connector (J22) and on-board transceivers
> >> +		 * using one GPIO: 0 = on-board, 1 connector.
> >> +		 */
> >> +		mux-gpios = <&tca6416_u20 3 GPIO_ACTIVE_HIGH>;
> > where use label flexcan1_flexcan2_b2b_mux?
> The label can be used by dtb overlays describing addon boards
> connected to the board-to-board connector. HB-IIoT is the base
> board without addon.
> > how to guarantee gpio-mux is
> > probe before flescan driver?
> It is not (currently) guaranteed.
> I recently became aware that can-transceiver driver supports mux-state
> reference to a single mux, but I have not tested it.
> Further in this case two muxes are needed (see below mux-controller-1).

Good, there should have enough time before next merge windows.

Frank

> >
> > Frank
> >
> >> +		/* default on-board */
> >> +		idle-state = <0>;
> >> +		#mux-control-cells = <0>;
> >> +	};
> >> +
> >> +	mux-controller-1 {
> >> +		compatible = "gpio-mux";
> >> +		/*
> >> +		 * Mux switches can bus between different SoM board-to-board
> >> +		 * connector pins which is used to support different SoMs.
> >> +		 * i.MX8M Plus uses J7-12/16 and J9-54/56 for 2x flexcan.
> >> +		 */
> >> +		mux-gpios = <&tca6416_u20 4 GPIO_ACTIVE_HIGH>;
> >> +		idle-state = <1>;
> >> +		#mux-control-cells = <0>;
> >> +	};
> >> +
> >> +	spi_mux: mux-controller-2 {
> >> +		compatible = "gpio-mux";
> >> +		/*
> >> +		 * Mux switches spi bus between on-board tpm
> >> +		 * and expansion connector (J22).
> >> +		 */
> >> +		mux-gpios = <&tca6416_u21 0 GPIO_ACTIVE_HIGH>;
> >> +		/* default on-board */
> >> +		idle-state = <0>;
> >> +		#mux-control-cells = <0>;
> >> +	};
> >> +
> >> +	uart3_uart4_b2b_mux: mux-controller-3 {
> >> +		compatible = "gpio-mux";
> >> +		/*
> >> +		 * Mux switches both uart3 and uart4 tx/rx between expansion
> >> +		 * connector (J22) and on-board rs232/rs485 transceivers
> >> +		 * using one GPIO: 0 = on-board, 1 connector.
> >> +		 */
> >> +		mux-gpios = <&tca6416_u20 0 GPIO_ACTIVE_HIGH>;
> >> +		/* default on-board */
> >> +		idle-state = <0>;
> >> +		#mux-control-cells = <0>;
> >> +	};
> >> +
> >> +	uart3_rs_232_485_mux: mux-controller-4 {
> >> +		compatible = "gpio-mux";
> >> +		/*
> >> +		 * Mux switches uart3 tx/rx between rs232 and rs485
> >> +		 * transceivers. using one GPIO: 0 = rs232; 1 = rs485.
> >> +		 */
> >> +		mux-gpios = <&tca6416_u20 1 GPIO_ACTIVE_HIGH>;
> >> +		/* default rs232 */
> >> +		idle-state = <0>;
> >> +		#mux-control-cells = <0>;
> >> +	};
> >> +
> >> +	uart4_rs_232_485_mux: mux-controller-5 {
> >> +		compatible = "gpio-mux";
> >> +		/*
> >> +		 * Mux switches uart4 tx/rx between rs232 and rs485
> >> +		 * transceivers. using one GPIO: 0 = rs232; 1 = rs485.
> >> +		 */
> >> +		mux-gpios = <&tca6416_u20 2 GPIO_ACTIVE_HIGH>;
> >> +		/* default rs232 */
> >> +		idle-state = <0>;
> >> +		#mux-control-cells = <0>;
> >> +	};
> >> +
> >> +	v_1_2: regulator-1-2 {
> >> +		compatible = "regulator-fixed";
> >> +		regulator-max-microvolt = <1800000>;
> >> +		regulator-min-microvolt = <1800000>;
> >> +		regulator-name = "1v2";
> >> +	};
> >> +
> >> +	reg_dsi_panel: regulator-dsi-panel {
> >> +		compatible = "regulator-fixed";
> >> +		gpios = <&tca6416_u20 15 GPIO_ACTIVE_HIGH>;
> >> +		regulator-max-microvolt = <11200000>;
> >> +		regulator-min-microvolt = <11200000>;
> >> +		regulator-name = "dsi-panel";
> >> +		enable-active-high;
> >> +	};
> >> +
> >> +	/* power for M.2 B-Key connector (J6) */
> >> +	regulator-m2-b {
> >> +		compatible = "regulator-fixed";
> >> +		gpios = <&tca6416_u20 5 GPIO_ACTIVE_HIGH>;
> >> +		regulator-always-on;
> >> +		regulator-max-microvolt = <3300000>;
> >> +		regulator-min-microvolt = <3300000>;
> >> +		regulator-name = "m2-b";
> >> +		enable-active-high;
> >> +	};
> >> +
> >> +	/* power for M.2 M-Key connector (J4) */
> >> +	regulator-m2-m {
> >> +		compatible = "regulator-fixed";
> >> +		gpios = <&tca6416_u20 6 GPIO_ACTIVE_HIGH>;
> >> +		regulator-always-on;
> >> +		regulator-max-microvolt = <3300000>;
> >> +		regulator-min-microvolt = <3300000>;
> >> +		regulator-name = "m2-m";
> >> +		enable-active-high;
> >> +	};
> >> +
> >> +	vmmc: regulator-mmc {
> >> +		compatible = "regulator-fixed";
> >> +		pinctrl-0 = <&vmmc_pins>;
> >> +		pinctrl-names = "default";
> >> +		regulator-max-microvolt = <3300000>;
> >> +		regulator-min-microvolt = <3300000>;
> >> +		regulator-name = "vmmc";
> >> +		startup-delay-us = <250>;
> >> +		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
> >> +		enable-active-high;
> >> +	};
> >> +
> >> +	/* power for USB-A J5003 */
> >> +	vbus1: regulator-vbus-1 {
> >> +		compatible = "regulator-fixed";
> >> +		regulator-max-microvolt = <5000000>;
> >> +		regulator-min-microvolt = <5000000>;
> >> +		regulator-name = "vbus1";
> >> +		gpio = <&tca6416_u20 14 GPIO_ACTIVE_HIGH>;
> >> +		enable-active-high;
> >> +	};
> >> +
> >> +	/* power for USB-A J27 behind USB Hub Port 3 */
> >> +	regulator-vbus-2 {
> >> +		compatible = "regulator-fixed";
> >> +		regulator-always-on;
> >> +		regulator-max-microvolt = <5000000>;
> >> +		regulator-min-microvolt = <5000000>;
> >> +		regulator-name = "vbus2";
> >> +		gpio = <&tca6416_u20 12 GPIO_ACTIVE_HIGH>;
> >> +		enable-active-high;
> >> +	};
> >> +
> >> +	/* power for USB-A J27 behind USB Hub Port 4 */
> >> +	regulator-vbus-3 {
> >> +		compatible = "regulator-fixed";
> >> +		regulator-always-on;
> >> +		regulator-max-microvolt = <5000000>;
> >> +		regulator-min-microvolt = <5000000>;
> >> +		regulator-name = "vbus3";
> >> +		gpio = <&tca6416_u20 13 GPIO_ACTIVE_HIGH>;
> >> +		enable-active-high;
> >> +	};
> >> +
> >> +	rfkill-m2-b-gnss {
> >> +		compatible = "rfkill-gpio";
> >> +		/* rfkill-gpio inverts internally */
> >> +		shutdown-gpios = <&tca6416_u20 10 GPIO_ACTIVE_HIGH>;
> >> +		label = "m2-b gnss";
> >> +		radio-type = "gps";
> >> +	};
> >> +
> >> +	rfkill-m2-b-wwan {
> >> +		compatible = "rfkill-gpio";
> >> +		/* rfkill-gpio inverts internally */
> >> +		shutdown-gpios = <&tca6416_u20 9 GPIO_ACTIVE_HIGH>;
> >> +		label = "m2-b radio";
> >> +		radio-type = "wwan";
> >> +	};
> >> +};
> >> +
> >> +&ecspi2 {
> >> +	pinctrl-names = "default";
> >> +	pinctrl-0 = <&ecspi2_pins>;
> >> +	num-cs = <1>;
> >> +	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
> >> +	status = "okay";
> >> +
> >> +	ecspi2_muxed: spi@0 {
> >> +		compatible = "spi-mux";
> >> +		reg = <0>;
> >> +		#address-cells = <1>;
> >> +		#size-cells = <0>;
> >> +		/* mux bandwidth is 2GHz, soc max. spi clock is 166MHz */
> >> +		spi-max-frequency = <166000000>;
> >> +		mux-controls = <&spi_mux>;
> >> +
> >> +		tpm@0 {
> >> +			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
> >> +			reg = <0>;
> >> +			spi-max-frequency = <43000000>;
> >> +			reset-gpios = <&tca6416_u21 1 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
> >> +			interrupts-extended = <&tca6416_u21 9 IRQ_TYPE_LEVEL_LOW>;
> >> +		};
> >> +	};
> >> +};
> >> +
> >> +&flexcan1 {
> >> +	pinctrl-names = "default";
> >> +	pinctrl-0 = <&can1_pins>;
> >> +	status = "okay";
> >> +
> >> +	can-transceiver {
> >> +		max-bitrate = <8000000>;
> >> +	};
> >> +};
> >> +
> >> +&flexcan2 {
> >> +	pinctrl-names = "default";
> >> +	pinctrl-0 = <&can2_pins>;
> >> +	status = "okay";
> >> +
> >> +	can-transceiver {
> >> +		max-bitrate = <8000000>;
> >> +	};
> >> +};
> >> +
> >> +&i2c2 {
> >> +	i2c-mux@70 {
> >> +		compatible = "nxp,pca9546";
> >> +		reg = <0x70>;
> >> +		/*
> >> +		 * This reset is open drain,
> >> +		 * but reset core does not support GPIO_OPEN_DRAIN flag.
> >> +		 */
> >> +		reset-gpios = <&tca6416_u21 2 GPIO_ACTIVE_LOW>;
> >> +		#address-cells = <1>;
> >> +		#size-cells = <0>;
> >> +
> >> +		/* channel 0 routed to expansion connector (J22) */
> >> +		i2c_exp: i2c@0 {
> >> +			reg = <0>;
> >> +			#address-cells = <1>;
> >> +			#size-cells = <0>;
> >> +		};
> >> +
> >> +		/* channel 1 routed to mipi-csi connector (J23) */
> >> +		i2c_csi: i2c@1 {
> >> +			reg = <1>;
> >> +			#address-cells = <1>;
> >> +			#size-cells = <0>;
> >> +		};
> >> +
> >> +		/* channel 2 routed to mipi-dsi connector (J25) */
> >> +		i2c_dsi: i2c@2 {
> >> +			reg = <2>;
> >> +			#address-cells = <1>;
> >> +			#size-cells = <0>;
> >> +
> >> +			tca6408_u48: gpio@21 {
> >> +				compatible = "ti,tca6408";
> >> +				reg = <0x21>;
> >> +				/*
> >> +				 * reset shared between U37 and U48, to be
> >> +				 * supported once gpio-pca953x switches to
> >> +				 * reset framework.
> >> +				 *
> >> +				 * reset-gpios = <&tca6416_u21 4
> >> +				 *                (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;
> >> +				 */
> >> +				gpio-controller;
> >> +				#gpio-cells = <2>;
> >> +				gpio-line-names = "CAM_RST#", "DSI_RESET",
> >> +						  "DSI_STBYB", "DSI_PWM_BL",
> >> +						  "DSI_L/R", "DSI_U/D",
> >> +						  "DSI_CTP_/RST", "CAM_TRIG";
> >> +			};
> >> +		};
> >> +
> >> +		/* channel 2 routed to lvds connector (J24) */
> >> +		i2c_lvds: i2c@3 {
> >> +			reg = <3>;
> >> +			#address-cells = <1>;
> >> +			#size-cells = <0>;
> >> +
> >> +			tca6408_u37: gpio@20 {
> >> +				compatible = "ti,tca6408";
> >> +				reg = <0x20>;
> >> +				/*
> >> +				 * reset shared between U37 and U48, to be
> >> +				 * supported once gpio-pca953x switches to
> >> +				 * reset framework.
> >> +				 *
> >> +				 * reset-gpios = <&tca6416_u21 4
> >> +				 *                (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;
> >> +				 */
> >> +				gpio-controller;
> >> +				#gpio-cells = <2>;
> >> +				gpio-line-names = "SELB", "LVDS_RESET",
> >> +						  "LVDS_STBYB", "LVDS_PWM_BL",
> >> +						  "LVDS_L/R", "LVDS_U/D",
> >> +						  "LVDS_CTP_/RST", "";
> >> +			};
> >> +		};
> >> +	};
> >> +};
> >> +
> >> +&i2c3 {
> >> +	/* highest i2c clock supported by all peripherals is 400kHz */
> >> +	clock-frequency = <400000>;
> >> +
> >> +	tca6416_u20: gpio@20 {
> >> +		/*
> >> +		 * This is a TI TCAL6416 using same programming model as
> >> +		 * NXP PCAL6416, not to be confused with TI TCA6416.
> >> +		 */
> >> +		compatible = "nxp,pcal6416";
> >> +		reg = <0x20>;
> >> +		gpio-controller;
> >> +		#gpio-cells = <2>;
> >> +		gpio-line-names = "TCA_INT/EXT_UART", "TCA_UARTA_232/485",
> >> +				  "TCA_UARTB_232/485", "TCA_INT/EXT_CAN",
> >> +				  "TCA_NXP/REN", "TCA_M.2B_3V3_EN",
> >> +				  "TCA_M.2M_3V3_EN", "TCA_M.2M_RESET#",
> >> +				  "TCA_M.2B_RESET#", "TCA_M.2B_W_DIS#",
> >> +				  "TCA_M.2B_GPS_EN#", "TCA_USB-HUB_RST#",
> >> +				  "TCA_USB_HUB3_PWR_EN", "TCA_USB_HUB4_PWR_EN",
> >> +				  "TCA_USB1_PWR_EN", "TCA_VIDEO_PWR_EN";
> >> +
> >> +		m2-b-reset-hog {
> >> +			gpio-hog;
> >> +			gpios = <8 GPIO_ACTIVE_LOW>;
> >> +			output-low;
> >> +			line-name = "m2-b-reset";
> >> +		};
> >> +	};
> >> +
> >> +	tca6416_u21: gpio@21 {
> >> +		/*
> >> +		 * This is a TI TCAL6416 using same programming model as
> >> +		 * NXP PCAL6416, not to be confused with TI TCA6416.
> >> +		 */
> >> +		compatible = "nxp,pcal6416";
> >> +		reg = <0x21>;
> >> +		gpio-controller;
> >> +		#gpio-cells = <2>;
> >> +		interrupt-controller;
> >> +		#interrupt-cells = <2>;
> >> +		pinctrl-names = "default";
> >> +		pinctrl-0 = <&tca6416_u21_int_pins>;
> >> +		interrupts-extended = <&gpio1 15 IRQ_TYPE_EDGE_FALLING>;
> >> +		gpio-line-names = "TCA_SPI_TPM/EXT", "TCA_TPM_RST#",
> >> +				  "TCA_I2C_RST", "TCA_RS232_SHTD#",
> >> +				  "TCA_LCD_I2C_RST", "TCA_DIG_OUT1",
> >> +				  "TCA_bDIG_IN1", "TCA_SENS_INT",
> >> +				  "TCA_ALERT#", "TCA_TPM_PIRQ#",
> >> +				  "TCA_RTC_INT", "TCA_M.2M_WAKW_ON_LAN",
> >> +				  "TCA_M.2M_CLKREQ#", "TCA_LVDS_INT#",
> >> +				  "", "TCA_POE_AT";
> >> +
> >> +		rs232_shutdown: rs232-shutdown-hog {
> >> +			gpio-hog;
> >> +			gpios = <3 GPIO_ACTIVE_LOW>;
> >> +			output-low;
> >> +			line-name = "rs232-shutdown";
> >> +		};
> >> +
> >> +		lcd-i2c-reset-hog {
> >> +			/*
> >> +			 * reset shared between U37 and U48, to be
> >> +			 * supported once gpio-pca953x switches to
> >> +			 * reset framework.
> >> +			 */
> >> +			gpio-hog;
> >> +			gpios = <4 (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;
> >> +			output-low;
> >> +			line-name = "lcd-i2c-reset";
> >> +		};
> >> +
> >> +		m2-m-clkreq-hog {
> >> +			gpio-hog;
> >> +			gpios = <12 GPIO_ACTIVE_LOW>;
> >> +			input;
> >> +			line-name = "m2-m-clkreq";
> >> +		};
> >> +	};
> >> +
> >> +	led-controller@30 {
> >> +		compatible = "ti,lp5562";
> >> +		reg = <0x30>;
> >> +		/* use internal clock, could use external generated by rtc */
> >> +		clock-mode = /bits/ 8 <1>;
> >> +		#address-cells = <1>;
> >> +		#size-cells = <0>;
> >> +
> >> +		multi-led@0 {
> >> +			reg = <0x0>;
> >> +			label = "D7";
> >> +			color = <LED_COLOR_ID_RGB>;
> >> +			#address-cells = <1>;
> >> +			#size-cells = <0>;
> >> +
> >> +			led@0 {
> >> +				reg = <0x0>;
> >> +				color = <LED_COLOR_ID_RED>;
> >> +				led-cur = /bits/ 8 <0x32>;
> >> +				max-cur = /bits/ 8 <0x64>;
> >> +			};
> >> +
> >> +			led@1 {
> >> +				reg = <0x1>;
> >> +				color = <LED_COLOR_ID_GREEN>;
> >> +				led-cur = /bits/ 8 <0x19>;
> >> +				max-cur = /bits/ 8 <0x32>;
> >> +			};
> >> +
> >> +			led@2 {
> >> +				reg = <0x2>;
> >> +				color = <LED_COLOR_ID_BLUE>;
> >> +				led-cur = /bits/ 8 <0x19>;
> >> +				max-cur = /bits/ 8 <0x32>;
> >> +			};
> >> +		};
> >> +
> >> +		led@3 {
> >> +			reg = <0x3>;
> >> +			chan-name = "D8";
> >> +			label = "D8";
> >> +			color = <LED_COLOR_ID_GREEN>;
> >> +			led-cur = /bits/ 8 <0x19>;
> >> +			max-cur = /bits/ 8 <0x64>;
> >> +		};
> >> +	};
> >> +
> >> +	light-sensor@44 {
> >> +		compatible = "isil,isl29023";
> >> +		reg = <0x44>;
> >> +		/* IRQ shared between accelerometer, light-sensor and Tamper input (J5007) */
> >> +		interrupts-extended = <&tca6416_u21 7 IRQ_TYPE_EDGE_FALLING>;
> >> +	};
> >> +
> >> +	accelerometer@53 {
> >> +		compatible = "adi,adxl345";
> >> +		reg = <0x53>;
> >> +		/* IRQ shared between accelerometer, light-sensor and Tamper input (J5007) */
> >> +		interrupt-names = "INT1";
> >> +		interrupts-extended = <&tca6416_u21 7 IRQ_TYPE_EDGE_FALLING>;
> >> +	};
> >> +
> >> +	carrier_eeprom: eeprom@57{
> >> +		compatible = "atmel,24c02";
> >> +		reg = <0x57>;
> >> +		pagesize = <8>;
> >> +	};
> >> +
> >> +	carrier_rtc: rtc@69 {
> >> +		compatible = "abracon,ab1805";
> >> +		reg = <0x69>;
> >> +		abracon,tc-diode = "schottky";
> >> +		abracon,tc-resistor = <3>;
> >> +		/*
> >> +		 * AM1805 RTC used on this board has only nTIRQ pins wired,
> >> +		 * which is for countdown timer irqs only.
> >> +		 * Driver does not support this, disable for now.
> >> +		 *
> >> +		 * interrupts-extended = <&tca6416_u21 10 IRQ_TYPE_EDGE_FALLING>;
> >> +		 */
> >> +	};
> >> +};
> >> +
> >> +&iomuxc {
> >> +	can1_pins: pinctrl-can1-grp {
> >> +		fsl,pins = <
> >> +			MX8MP_IOMUXC_SPDIF_RX__CAN1_RX			0x154
> >> +			MX8MP_IOMUXC_SPDIF_TX__CAN1_TX			0x154
> >> +		>;
> >> +	};
> >> +
> >> +	can2_pins: pinctrl-can2-grp {
> >> +		fsl,pins = <
> >> +			MX8MP_IOMUXC_SAI5_MCLK__CAN2_RX			0x154
> >> +			MX8MP_IOMUXC_SAI5_RXD3__CAN2_TX			0x154
> >> +		>;
> >> +	};
> >> +
> >> +	ecspi2_pins: pinctrl-ecspi2-grp {
> >> +		fsl,pins = <
> >> +			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK		0x140
> >> +			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI		0x140
> >> +			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO		0x140
> >> +			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13		0x140
> >> +		>;
> >> +	};
> >> +
> >> +	tca6416_u21_int_pins: pinctrl-tca6416-u21-int-grp {
> >> +		fsl,pins = <
> >> +			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15		0x0
> >> +		>;
> >> +	};
> >> +
> >> +	/* UARTA */
> >> +	uart3_pins: pinctrl-uart3-grp {
> >> +		fsl,pins = <
> >> +			MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX		0x140
> >> +			MX8MP_IOMUXC_ECSPI1_MOSI__UART3_DCE_TX		0x140
> >> +			MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09		0x140
> >> +		>;
> >> +	};
> >> +
> >> +	/* UARTB */
> >> +	uart4_pins: pinctrl-uart4-grp {
> >> +		fsl,pins = <
> >> +			MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX		0x140
> >> +			MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX		0x140
> >> +			MX8MP_IOMUXC_ECSPI1_MISO__GPIO5_IO08		0x140
> >> +		>;
> >> +	};
> >> +
> >> +	usdhc2_pins: pinctrl-usdhc2-grp {
> >> +		fsl,pins = <
> >> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x190
> >> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d0
> >> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d0
> >> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d0
> >> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d0
> >> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d0
> >> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x140
> >> +			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B		0x140
> >> +		>;
> >> +	};
> >> +
> >> +	usdhc2_100mhz_pins: pinctrl-usdhc2-100mhz-grp {
> >> +		fsl,pins = <
> >> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x194
> >> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d4
> >> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d4
> >> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d4
> >> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d4
> >> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d4
> >> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x140
> >> +			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B		0x140
> >> +		>;
> >> +	};
> >> +
> >> +	usdhc2_200mhz_pins: pinctrl-usdhc2-200mhz-grp {
> >> +		fsl,pins = <
> >> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x196
> >> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d6
> >> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d6
> >> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d6
> >> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d6
> >> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d6
> >> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x140
> >> +			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B		0x140
> >> +		>;
> >> +	};
> >> +
> >> +	vmmc_pins: pinctrl-vmmc-grp {
> >> +		fsl,pins = <
> >> +			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19		0x0
> >> +		>;
> >> +	};
> >> +};
> >> +
> >> +&pcie {
> >> +	reset-gpio = <&tca6416_u20 7 GPIO_ACTIVE_LOW>;
> >> +	status = "okay";
> >> +};
> >> +
> >> +/* M.2 M-Key (J4) */
> >> +&pcie_phy {
> >> +	clocks = <&hsio_blk_ctrl>;
> >> +	clock-names = "ref";
> >> +	fsl,clkreq-unsupported;
> >> +	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_OUTPUT>;
> >> +	status = "okay";
> >> +};
> >> +
> >> +&phy0 {
> >> +	leds {
> >> +		#address-cells = <1>;
> >> +		#size-cells = <0>;
> >> +
> >> +		/* ADIN1300 LED_0 pin */
> >> +		led@0 {
> >> +			reg = <0>;
> >> +			color = <LED_COLOR_ID_GREEN>;
> >> +			function = LED_FUNCTION_LAN;
> >> +			default-state = "keep";
> >> +		};
> >> +	};
> >> +};
> >> +
> >> +&phy1 {
> >> +	leds {
> >> +		#address-cells = <1>;
> >> +		#size-cells = <0>;
> >> +
> >> +		/* ADIN1300 LED_0 pin */
> >> +		led@0 {
> >> +			reg = <0>;
> >> +			color = <LED_COLOR_ID_GREEN>;
> >> +			function = LED_FUNCTION_LAN;
> >> +			default-state = "keep";
> >> +		};
> >> +	};
> >> +};
> >> +
> >> +&uart3 {
> >> +	pinctrl-names = "default";
> >> +	pinctrl-0 = <&uart3_pins>;
> >> +	rts-gpios = <&gpio5 9 GPIO_ACTIVE_HIGH>;
> >> +	/* select 80MHz parent clock to support maximum baudrate 4Mbps */
> >> +	assigned-clocks = <&clk IMX8MP_CLK_UART3>;
> >> +	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
> >> +	status = "okay";
> >> +};
> >> +
> >> +&uart4 {
> >> +	pinctrl-names = "default";
> >> +	pinctrl-0 = <&uart4_pins>;
> >> +	rts-gpios = <&gpio5 8 GPIO_ACTIVE_HIGH>;
> >> +	/* select 80MHz parent clock to support maximum baudrate 4Mbps */
> >> +	assigned-clocks = <&clk IMX8MP_CLK_UART4>;
> >> +	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
> >> +	status = "okay";
> >> +};
> >> +
> >> +&usb3_0 {
> >> +	status = "okay";
> >> +};
> >> +
> >> +&usb3_phy0 {
> >> +	fsl,phy-tx-preemp-amp-tune-microamp = <1200>;
> >> +	vbus-supply = <&vbus1>;
> >> +	status = "okay";
> >> +};
> >> +
> >> +&usb3_1 {
> >> +	status = "okay";
> >> +};
> >> +
> >> +&usb3_phy1 {
> >> +	status = "okay";
> >> +};
> >> +
> >> +&usb_dwc3_0 {
> >> +	dr_mode = "host";
> >> +};
> >> +
> >> +&usb_dwc3_1 {
> >> +	dr_mode = "host";
> >> +	#address-cells = <1>;
> >> +	#size-cells = <0>;
> >> +
> >> +	hub_2_0: hub@1 {
> >> +		compatible = "usb4b4,6502", "usb4b4,6506";
> >> +		reg = <1>;
> >> +		peer-hub = <&hub_3_0>;
> >> +		reset-gpios = <&tca6416_u20 11 GPIO_ACTIVE_LOW>;
> >> +		vdd-supply = <&v_1_2>;
> >> +		vdd2-supply = <&v_3_3>;
> >> +	};
> >> +
> >> +	hub_3_0: hub@2 {
> >> +		compatible = "usb4b4,6500", "usb4b4,6504";
> >> +		reg = <2>;
> >> +		peer-hub = <&hub_2_0>;
> >> +		reset-gpios = <&tca6416_u20 11 GPIO_ACTIVE_LOW>;
> >> +		vdd-supply = <&v_1_2>;
> >> +		vdd2-supply = <&v_3_3>;
> >> +	};
> >> +};
> >> +
> >> +&usdhc2 {
> >> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> >> +	pinctrl-0 = <&usdhc2_pins>;
> >> +	pinctrl-1 = <&usdhc2_100mhz_pins>;
> >> +	pinctrl-2 = <&usdhc2_200mhz_pins>;
> >> +	vmmc-supply = <&vmmc>;
> >> +	bus-width = <4>;
> >> +	cap-power-off-card;
> >> +	full-pwr-cycle;
> >> +	status = "okay";
> >> +};
> >>
> >> --
> >> 2.43.0
> >>
> >>
>
