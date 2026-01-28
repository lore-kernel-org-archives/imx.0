Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010062.outbound.protection.outlook.com [52.101.69.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD61335077
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 05:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769579937; cv=fail; b=IOo2hbZNdlW0i0WK20sxym2EF4fa67LReUofBvmbZ2Y+y1KhmsAWECHXlPhvAmFBwTANXiKwkJCS7eD/Rx+RcJWsG7mfACf7s72oS9m/Tmyt4GgQJmtajqo5Uc6s9gz3Y22+ivw4Xdk/bZhc9HJeHwFakdhPz1N9OOF7XRYNKq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769579937; c=relaxed/simple;
	bh=s5xkShy/BfO+92y9ASRFlH7kK0mKvrv4nWFydqB6HzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LDQ1JLU3vfigXwZxqITtf6ZaAyPqOJU1hLODm5IPF0ppY7Uf5CW2jx+9FmHNZ3sFFFe7zu1/wcGcPHIFp8/irHaozRIPKjaKvHAqCckACABp8WvVzOCw6Qoo0bGL3FbOA8FoD23Io7pAtbLyiON8M73v32yFwCDaqtbDRRtrWog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XmnhDugF; arc=fail smtp.client-ip=52.101.69.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XmnhDugF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pfReAHradtKCG/kCwwv8nlfsC3cl0pyDF4YWccrpFdmN9oenCiHus1Yu3P+2A7bM6QI5o03imHt7LSn1gmI0undo3UJc2F8v7NPFLGjLK68Zw1aSId2jnw9UocaAq+xKZ635ajtqz1VW1VrK3bVrew4aidfJjz5ETPtxFYLPHSyIq2MrU4m24Svfya/ePnK2n8r8WgnrnvCYVWHq+4QWNsqtim+G0gqYxC3Lab/k4A9GZSAGxBAFZJL3/OTAiJc6ZUK6StAELd4DmePthWHH1v7eQZd5ihyVFyxThFINEToCtiSIwEnzzmvrBFL60LbCukNg8Q0r+20oiqCJXfkA6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5xkShy/BfO+92y9ASRFlH7kK0mKvrv4nWFydqB6HzA=;
 b=mMPe1QQHWsvdODpjVNrS/cFHT2t5Sz8K86bkmyMqIZJi/XjbCvwZeSv/iZB2e5+7N8zAn1Owlzvi984aBa3BB5WE/XwYU0DPnVI0TP2k2BR1v8zh+/nQzZtEy7Kt3aVWl6WwCRi52SVmfH/ly4FFqEaE3nstC3402UvlgsMTK89R2XEMJZqiDpkXnBWq6iKUEGGqA/b4ob4vRMO7iEqZfgrphMyzrrmpkDs5paT+r/GlOB/uwdvg3t231HyuA2WKKSOb0QWTqLXyx+RLbkMy22a0dg3l7KA8Z8nbCe12zDUdvfYU1Q1Y3zfKEnGEHzrTZf3FCUCjKm0FxBtLyRxq/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5xkShy/BfO+92y9ASRFlH7kK0mKvrv4nWFydqB6HzA=;
 b=XmnhDugFzME/ziTsTXqIInfnRWqJXl3CA3RCyHPO8MUyBv6aH57g33lTJ/g6Gwvh+n0hr9B6qIBqNZrvU/WbX5g0oneoc2CpGLPTyEN/ZWfo5rPL/ryTGiOfe9QlSGH61U5tkTSX3ahUkJZHCFGFlFNSVo/CmiHit32dk3IH5ByHrukPHh9H+TdQgEXAjFXz+bU/4ZqnLaH2KkB93boWNQ86hcWtZ96f7mzFpB3whB3DHvB1k4AS4W9R3ADIdJvKeo+/3OvgSKhAZITYUyJxQrOb+P3Uk2jShQWjLDUR6zsqoJcV9mnyTU/C1/yc0+09mr/oeIT3NfEoKJqsKxiVYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8450.eurprd04.prod.outlook.com (2603:10a6:20b:346::5)
 by AM9PR04MB8603.eurprd04.prod.outlook.com (2603:10a6:20b:43a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Wed, 28 Jan
 2026 05:58:53 +0000
Received: from AS8PR04MB8450.eurprd04.prod.outlook.com
 ([fe80::d3ed:eac:1f17:e9bd]) by AS8PR04MB8450.eurprd04.prod.outlook.com
 ([fe80::d3ed:eac:1f17:e9bd%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 05:58:53 +0000
Date: Wed, 28 Jan 2026 13:58:50 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel@puri.sm,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2] arm64: dts: imx8mq: Set the correct gpu_ahb clock
 frequency
Message-ID: <aXmlmgPwXpfKPTIj@shlinux89>
References: <20260128-imx8mq-gpu-ahb-clock-v2-1-f32548d46188@puri.sm>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-imx8mq-gpu-ahb-clock-v2-1-f32548d46188@puri.sm>
X-ClientProxiedBy: SG2PR06CA0187.apcprd06.prod.outlook.com (2603:1096:4:1::19)
 To AS8PR04MB8450.eurprd04.prod.outlook.com (2603:10a6:20b:346::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8450:EE_|AM9PR04MB8603:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c8e4258-b396-4978-ccc4-08de5e32507e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|52116014|376014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HwBDITzwTsV891bUkLRGIpeZb0OwBEFk1mnHxhovoTldS6tyPeyZp6rALFT0?=
 =?us-ascii?Q?T2/yJspj1ktEWCU9sGd4O99Ysc93XQBccq7SG8nqxv1aNRqFBhw+13hXJE9z?=
 =?us-ascii?Q?/sZhQXSbu9GPWbcDS7esg2nO1CZQpKgHPe01rxuNvW5te+nc0noh/puZZ0D4?=
 =?us-ascii?Q?ny6XW+0DZZzZfZISsoFbgt9B8g8U4ThOsQCOGrKcna+iqY2hBJYc/s+v+ccX?=
 =?us-ascii?Q?TPFxYVYMBg0akCivpJwgxai3eOgaSUJnVsTcXFTBwheup1R/YBc3jZ9fW9lW?=
 =?us-ascii?Q?cn7Rsrn5kDa+F/uDBcCgM5JO0MrHRN+AiSCZQA9eWZifJiHYLcqCZKfGoP0n?=
 =?us-ascii?Q?eRjWP3TFgLuEKCztLQJ6NiSiywd2dn8Svo18u4z/0LWOeWyLVRArtezWjtw2?=
 =?us-ascii?Q?ZHoJ5Y19jQPRfj/zO8DEOLopMBRsBhAe9vTyEAfYevkfxHWI+dXJyR6JHF2m?=
 =?us-ascii?Q?tzW+Hw2tosP2RzwlyYVwMvvfor05j35hkYh4NmEcC1fJSREc0HWkrBFZBqJ7?=
 =?us-ascii?Q?jUNbPJ0qsh+4+hw5MecDBMLsloCnGe+PgSZ07WQJIqc/9D8Z3qJJi9ALeppa?=
 =?us-ascii?Q?cwCbNA/VWfJEv5yCJB4BU0Nzx6ZSFuMlKQb8ghpqKJd1Hq/k277dPvx9ou3y?=
 =?us-ascii?Q?eND8sol7nON33x816kjuPRVm/wGWMJc0n+hghGoNz4IasbeOIgGqNMO6wiGq?=
 =?us-ascii?Q?h8ViqhD1QwBdcOXC9xQaWkAzuonHMeZEe3W3o2YX7L5gCHi7+MJOMDERHPYv?=
 =?us-ascii?Q?bxxaJXQW2++ifkP5qPX7JfoCd46EV+KS5wixLAHzLTTUR8HA/42MqHjUUKUn?=
 =?us-ascii?Q?QKjIOAubGDi47EeW5I4+X8sDedBuLr/TL+4T6uBBYjVRRH253R0/S5GhNhBh?=
 =?us-ascii?Q?pNxm3/4S1WmmzClVdY82mypWejZGqvmyEY5XfvslkMxcm3LhBXwMh+fWXxTs?=
 =?us-ascii?Q?QgqjjSy4dSCNPN0LfUIVs7VsS4iL4gyR/SVSFPe/xf3flqQhIp9TOX2cgs55?=
 =?us-ascii?Q?mIVEKJZXjXk2iQEnG7/hsAeOM9EmBgoe+ECG7K+7Z+xez4VnZXhznPwzpRFM?=
 =?us-ascii?Q?B+NWyvmsGE8FsXh+zmKkCs/xnO5SLZZWzH8C6BVTSuiZU4Qbv3//rkMCiefe?=
 =?us-ascii?Q?4Cz2vcXw8anmJweQAATNXMXrtTFMrrUmJ2tvZySpm4vCyRVG/FtZKgixYVh5?=
 =?us-ascii?Q?PF6sgczSUuUnz/HUG+4ti+d4MggHjqOwk9JzauHkpTjOiLK277VTH49BQgqq?=
 =?us-ascii?Q?mNgfOh+pZbWO99OG+sTauc7Kt52Zadatw3u5GuDSJLAH9m6BhhM4f0urbZoZ?=
 =?us-ascii?Q?cqTX1FbL58efXWWqddjMRPUHJzzIZeNv6UqT/IuboZKlQnkisIO2FWur5dtp?=
 =?us-ascii?Q?DfSNK2Ej6wAs//AboMkefz3XfpAzBUWtgMKlC1PWQkR6Zy9QvSykoqAAmZP5?=
 =?us-ascii?Q?QL75L5AjolAF0lyX/UVJXwUkTQHBMERYg7CC2jTDtGeYOECXTtaqwKWFSOIt?=
 =?us-ascii?Q?ZIwgwP2Z4hWn9+EAKRsclGncEo4zFr9trA1cGWAG6oJavNIE7ZZKvK+U6wLe?=
 =?us-ascii?Q?tZeGpqwjLcFYXjhSh2JitGxNBcuUc2kGuXvRKP+RyUhZJ484bESj600Q1Gsy?=
 =?us-ascii?Q?TDehgQjo/fK/uIFKjVCngOY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8450.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(52116014)(376014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rJx+eCMRySbQTU+7tTZ4tirVRmwjIPz6HN9+wo6Kigkb5R/Z7Fex8n5OkTEH?=
 =?us-ascii?Q?HltoLOC+7iv9cyKpKwah0K8v0OoaBfb+seNexauAeVHAOWQQu6T6plYVRipi?=
 =?us-ascii?Q?hcd7NXrajSsH6stOBUV35b0is3JJmtY8MlrCXbfUH/fHLzFm10zW/3NEFbph?=
 =?us-ascii?Q?UruhnnVJIGcNUH79rtYRdulT6EIF6LFbLzY1aqJa1QJMK8iaZfbibq23Govs?=
 =?us-ascii?Q?YtIjKutW1eu4fL89CV5BAQjvClMDg7GrZ8PcWmuZQfsV4JvuHTXAz9jZsq+s?=
 =?us-ascii?Q?PIQInZakXng+owaed8keH3TL7OEoMy2+7wnlOrjp+4R4GLHD3nkMNcPe6S8x?=
 =?us-ascii?Q?Qz7rGxZjn5Kd3p1MdHibrjtan6Deja+BKXzn35DVQGjU53Hi28tDKQI0EXYM?=
 =?us-ascii?Q?0uiO9fSBpN9TwVOAEbofju+83JHMSk2VqHxFI9GoNMY+tE//NGPsoxWzxE5m?=
 =?us-ascii?Q?uyP/Tjv9OgPq2WsbQly4w9FVUVNRPaSO95xhAcT6v5wrNusPG+5WCIuiGA9S?=
 =?us-ascii?Q?1r6ganvIt+AzUQMgAN+4Jn7FKKgKAtDJGneMRMyp6DMUtwZ9h14ZecHCEuAp?=
 =?us-ascii?Q?PFtoPOTCxS7mG/6aOvz1VxiMjTubB0tN6KzUEGlQl5iUuvKEj3f0HynBJd28?=
 =?us-ascii?Q?NPe3rUSy4qy0JN49+yWLXHIdbgrHGteUY2O1nq4A6ZKvzWb/T+mrvPWbcnzS?=
 =?us-ascii?Q?+lWlO8i/o0kCmNUbP7lne53lfKL6wkVhoucXfDqjTFArSuJdM2JpviFlkuvz?=
 =?us-ascii?Q?SEctEQAz55+pr4TGozq+BPugPjDMvSY41WhlHIMTLsBgIBClvS8CtPck+Kwl?=
 =?us-ascii?Q?LtbUnX7yP3dr2Yr/onX+cOQyqTRm+dU7tKWEgwhyHptYF4OZd0oSbWpAAEtD?=
 =?us-ascii?Q?q1UwJmoZiPJV5z5WHDRkeTnC2MBmQfSt7RotPhk+Affo6WLCzlK2HqWZWyd+?=
 =?us-ascii?Q?k8SKqDgL5IfSBzNYWZfuL5G+fD4Q1lLOwz0WkiIZWA9ZK1bMT6JJTfLKh5wE?=
 =?us-ascii?Q?klt9WF0gy8+wEDHwjXXiH3ryJ4sOp3wSPXsei7sGDzeR8L2Nb6Z8WMiDCjbP?=
 =?us-ascii?Q?2xd1FN20UFCLr9YpWprY+OPyHhfuB1MvpRGP7tb61U2x27MD1xfKp9dxbd8j?=
 =?us-ascii?Q?dpJ529Q0R0Hs8BLK8ZpwQ2UatWMKUPre7ZxdbmCw2F/TGv5pSeVzMygyovBC?=
 =?us-ascii?Q?O3fUUwDVI4IjJS+T5QMgqzwkNVEsOlaOvZqJwOgTLDVT5ABCx+g5XVeh8fxK?=
 =?us-ascii?Q?/hibPPkZQcnqtEAtLjxcnkNqOXusLOLylVto7Zst3hNZRjdif+Fkoo3csyCi?=
 =?us-ascii?Q?P54DPBqzy+ytCFkgr3KBe7wkndnl+g4EitNW8E2S8hTwZxYBGz5BDNzM69xQ?=
 =?us-ascii?Q?n/ZDTyMb1uRfaMWINCmtbXnhHPK9Az/eOuT9PJmiNVaDk2YuIJHQTvCD6Kzc?=
 =?us-ascii?Q?mGoEa7wCb5PyozfIIMqvp8pBF6vuSwVkAn8zP58x3ksOaqVE1k+lVzF1NP8X?=
 =?us-ascii?Q?yKfj0dtW0HEFfw+HT2a6gsvZvNFOyr1aNqs/te1DeJ4wMW3k2QDGXGtTcB2t?=
 =?us-ascii?Q?kzOj6W77fz1dfmHCmCYTEgnnlUhl9YpnGQdQom0D6257ePAGo48q1TX7TNdp?=
 =?us-ascii?Q?QQ7HDWajbKNQDPgtzJdJnTxLzLSl9om0hEW2nsSyHtWm5RRqvlVVSvdY8aDt?=
 =?us-ascii?Q?QfP+LYp/9Ca46qrfFKEE7cJZ9DgJ/GFv5CWh184rBScm0PopYLzjMzdvPvlM?=
 =?us-ascii?Q?TWEmeyK4xg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c8e4258-b396-4978-ccc4-08de5e32507e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8450.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 05:58:53.1084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ITE/jXtxEcQgiXLo5k10srFYX06o68lacPkwReQnJxSUznZtMH/SY0eg5oi9BCo5uzDV2qc2sN/9iI7rlG6wcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8603

On Wed, Jan 28, 2026 at 12:28:28AM +0100, Sebastian Krzyszkowiak wrote:
>According to i.MX 8M Quad Reference Manual, GPU_AHB_CLK_ROOT's maximum
>frequency is 400MHz.
>
>Fixes: 45d2c84eb3a2 ("arm64: dts: imx8mq: add GPU node")
>Reviewed-by: Frank Li <Frank.Li@nxp.com>
>Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
