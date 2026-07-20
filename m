Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010006.outbound.protection.outlook.com [52.101.84.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E207A40D598
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 14:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556525; cv=fail; b=BbZQPX6CspvgSclbrgI3G8oO0IaKfBeftUc02MwMqdYduTKo2Tu4hVXTvQgjM/kUfm5TxZOuLTtS0B4rkivvB2A8QDSTjFr2yc2a7/02ujrz+e3ZB+LA5diynHTUOi8nXGw+ipQsip6frPpiZR1F4XzNNXNmEmj5WAvL7wEVOSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556525; c=relaxed/simple;
	bh=Tcf5Zg6Cusm3BOxdSq1rE/XKeG2MZaUIWFWOn3XXYNY=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=h16I04IRaZCyav8iGPURe/6nMdEM1XMdkXESKlSOMAlGDwLyDLPhQAIk5Z4TVmabogRZOgNZ1adNU+klWF3sGfr9t/RydSw/cwHSHP8TpSu1cLvuzxzEBwuGzyKxEzZMwzDXhZgaKudAov29OZkrNCpO+vkrtW2w9ClBwkj8mNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NX9sYFd2; arc=fail smtp.client-ip=52.101.84.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NX9sYFd2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dWMpZjoxWctER4POifEw9QrF9QLqRMo5CMRD6/5SieYPM9KLz2y9zzINT9ck6Gb4eiO10tJs90mU9ZcZdW2mFwyx+I12laVVQOIC56sOXsGtwj6adoPIrJIM6o9rTKVMQrHhBvd8aM7vnVo/DoyCNL4Znny956csUvxQninGRkmskB+ugjAPKXKbbDY7mD2EBmcneQLJ1SkqOjUZIR2vtAwTL+76jSoCHp3uPNnzJSlQRLNcWR/UmNj6pg0Mr4d1MkIj/znWskLXwAEWE1ljiCQeapqy8fJvaXQHhElhM1Oa5qaxhUXSGOSp2IFaE0yGjcpp3UxIlNrypCaaVR8BOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HaJ8nN59NTgzkyeoYddSe5RBaS6OE/hl0/rx8V4/HxY=;
 b=o6l8vS7xzg3RrOA102XNXy/U5oW03/YWgkaAikIXc+bJJxkQ38IHnYId6jW6AY5PmP6axAPH64SMuOcwJkT/TGOmjgbQXHU6L6x5IW+rrhHThnUv2Vs7rh0NXzEpd5SXD9ly25SIaNDE38r+ieJGcB/TUq6Pg3Du7pS+hoHD/oJwCD5shGb5xuioIqRt0PQ3kgG346y8wvzGeUSh+WAvWsSRQmgyBd2p0FNrrOeQJKFLf18qncmAT1+wL/gkSrIdMePt71RCyMPY9jdnXVf7nraiJTILSX2cxVrHBeWI4VPG7wDvhICzUOlCh/iKMZamNPEwq/rHMTJ44q8JSm2eBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HaJ8nN59NTgzkyeoYddSe5RBaS6OE/hl0/rx8V4/HxY=;
 b=NX9sYFd29UgSMGmoQWwbGbp2KYy64g/aRW0oR9uQVazJkFfDrNt9tK3glG/sSWQEeuHTvKq9sADVYezE1ULA2a27yufQp/oaxxz5s5POF0AoPiT1t0Mq2/YvkBxaSUuiFX1/ALVOyTG0NRRgxWzTNocxtO7ttOj309oUKC+yGVzEDGre7xtCI+LEFkvM+V6DrBOJa29/qhEAVuK1ao+dVJi/iMIFnDnw15eMYOkmmxmpO3cX8I3IcP6ac9W8O3ffYpoapP/ZdJVHJcyiFEcCKbU7N/tx74jEcNeaz6UEx3gEJmpm+/VT+6l6BuuW8ZB4GLvSJrctdbyOyX0nghaSDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS4PR04MB9412.eurprd04.prod.outlook.com (2603:10a6:20b:4eb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 14:08:40 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 14:08:40 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v2 0/9] arm64: dts: imx8ulp: Device tree updates for i.MX
 8ULP EVK boards
Date: Mon, 20 Jul 2026 22:12:08 +0800
Message-Id: <20260720-imx8ulp-dts-v2-0-d05c67676f53@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALksXmoC/22NQQ6DIBQFr2L+ujRAA4WuvEfjogjU31Q0gMbGe
 Pei3XY5ybx5KyQX0SW4VStEN2PCIRTgpwra7hGejqAtDJxySa9MEOwXNb1HYnMiUnttvObKcg9
 lMUbncTlq9+bHaTIv1+Y9sRsdpjzEz3E3s937X54ZoYRpKdhFKCO0rsMyntuhh2bbti+683fot
 gAAAA==
X-Change-ID: 20260715-imx8ulp-dts-69f9bf928d2f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Sherry Sun <sherry.sun@nxp.com>, 
 Wei Fang <wei.fang@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI3PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::17) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS4PR04MB9412:EE_
X-MS-Office365-Filtering-Correlation-Id: 34281501-38a4-4359-7365-08dee6686669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|19092799006|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	MITw9J2OK+DjyNWW3JFRBmUHu97RWW/xmH5zDXEwy4hSObnxVbVZaLt+gt+P6mhcZmtWaAboPCzDTVYHTHTJCFRupNi50YD3pWtj2aHmAKqu1pKdBxYHm8kUtjFI0un1ALNXND01xMpIVr6dcZS2bF4bmn4XNk6qNMliopgjBsN6dazFmyz8Ev8hsPRZUrXBBIcijDzULW2JPuBdJOTwD49WjEY79iaS5WhUbAyGkwSue4MQLTOOq9DD+JgjKTG+V+Vlj53fL/4f8hDm7cw99w+44GFEQ2yJjhdXVkkZVe1X4f2tMUQk3PaoyJYov635thNd1QLehqHoKaDlsfC29P8zUOc3H8sT/Bj7t+2bR5O16+dz4BGAit4MLrB/uJUxMf5W72ODhyfeaD4J5hOIrD2AcS+w5X4he1ooQ42riDnh9n6YC2eJVru0cY56Irx4X8+p7UTax7IV6TEGTpxJoswMxFJKQUVUMKnY5L/Jj9p64sW+uYgABh4gt/40GQeXNk46rH/XT0oJBdAnlYQqvmK6UbBbkz9rSNVOpX/aCcqi8ys8pXTiewP3g68uQH3SaPt1A+5SR6cSngc82YvjzzBvQq6F8bp77h+JEvURjlgmesNcy0MwW3JddHiqdqNN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(19092799006)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkUrZGxpaGp6M1dQZUFZbjVmQTRSa0NiNDJmaHRNb1pidmpuNzYzNytyOXdF?=
 =?utf-8?B?cTJCUldtL2JhcURObC9UNFZpVGRrT0dQWW1aWDhUMHpPQTlSZWN4OWd1cU9N?=
 =?utf-8?B?eERXM0Q2NTlNOGJaSzVjZVlYUVZmc0R1dkxFOVJ6ei9IcDVOZk84YWtSU0hN?=
 =?utf-8?B?bkdML0tYaS9uekZIWnRadXRtRVdZVDdRQ3pSanZMUVVMbG4vRmV5aGhlQ05S?=
 =?utf-8?B?dGU1Y1liSVA3d2g3amZYZVlJckdsTDFzWnpkQ2puTlE3QWRLNUxYZ3NjbEFH?=
 =?utf-8?B?R3JVaGZXdEg1VzJtcS9ScnhITUNIMlZuT05wUis4SGhpaXBqNDJZNTNsbTVv?=
 =?utf-8?B?UndOR0xERHBDQUpMTnp3T0JYSkc3SWtqdmpJR2hYZWkwdVhKaDNzdDRhWDJn?=
 =?utf-8?B?TUJLaE9hanJaT3BiV2dENEhOam9lZ2h1K0huMlV4a2c3Mk9JYlU0RmV0cUVI?=
 =?utf-8?B?em13d2dMZWYxRXIxTTJzQnN2K2xtZytGTVAxZ1pXaWdJZHVqQWZ0KzZjZXU3?=
 =?utf-8?B?ekhaWEhiME5zbExlVSszUWc1WEJUdkkzNkc1NkhLeGpVWnJEc2UwTTR3U0s2?=
 =?utf-8?B?eVFwb1lyWGhCaldHU3RyNzNKSWtvOG4wc2k2KzVLSVZLVWhXWGt5QlJQaEI4?=
 =?utf-8?B?UFAxaTZ0WDNHdmpjSkh1K21aUG9ZZlB2aVI4anIycFVPOU1NV29VRTVuMjgx?=
 =?utf-8?B?S0w3ekYxQ0QwY1ZZaHF5cXFQK3ZVZFRrUWRZYnllbUYzZ2tRVzdGditvTGFW?=
 =?utf-8?B?UzlZZ0ZrQnJDMXNjcEpick45SnpIN2R1UTdyTCtEVm5hdUZseVBZL0JpQU5C?=
 =?utf-8?B?Snp6QURnZFJuNWtXc1FPWDdXbUVJaWExVEFaRlcvNXUzaEtMTExLcW1mNnB4?=
 =?utf-8?B?ZTY4NUZnUmxvdWZWZC9VRkNCc3c1Mk43UXRNWkFTU3gxQyszWExOcHVLenlG?=
 =?utf-8?B?LzBycEhraWlUWGE5cTZIQXQ3M1AzOHMvU1d2bHlWOFJRZHhwSXlMZmFZMldD?=
 =?utf-8?B?UzFEUzNJR1VJTEJEVVJLelYvRlVqaU1NbW9iWkU4STJMQzlCQjNaM3dzblJF?=
 =?utf-8?B?d1BiUmdlemYvckJheVZQVnNITWltY3grT2ZEWERsVjBVYXpraEZQeG1lbHZO?=
 =?utf-8?B?cGxvaXEyK29tdlYxOTNjMDZTOG1JRG9qc1JSODl0cWVuNlN1L0xibjh1dEtU?=
 =?utf-8?B?MVh5RDlsN3pNT3Joc0owYlRtWnB6clRxR0ZFL2NaQ3lwa0h2M2dzdGQvR3lh?=
 =?utf-8?B?b2hUaGZNTVpqWGlQcXN3NVN5Mm12MDY5c29TTXNNaHhIT1hMREFVZk1INkZk?=
 =?utf-8?B?bnYycnlVSjdKa0NpdkhvZEJyOWJid2NRckdWTHFOdnZkd1RlSWZXT1djbXh5?=
 =?utf-8?B?SXZHcm55Uit6cWhjS3ZCY3Q4enhnNnlYZGQxMjFRcVdBRzlmNlB0TUhVbDNh?=
 =?utf-8?B?cFRUcGZ4K25YSzNxUFIwelVFMyt4MkZYRHVVcFNhcllTdS9DaHVpTkZFTG9p?=
 =?utf-8?B?Qk9Mc3VOY2pvK29jUTRkSVVrSUlmeTlTYnY5dENaN0tkNDNkWllRV05RcjFD?=
 =?utf-8?B?L21Rbll4LzZ6RDFtMjVWV3FMbU83aEkvdlQzeFoxT3ZUczk4REZaTm5peC82?=
 =?utf-8?B?SGJOdEIxZmhXdzhhTmdVOW01bElMMllYQTBiV3JFenZyTzI0UE1Qd1l6dTk1?=
 =?utf-8?B?TGgwSmh3VGpWb2tTY2sxZEpRQWg1UXZrZHVLemY4MXpaV1VhT2gzQzJNTmYv?=
 =?utf-8?B?QzZDNmJVU2NmVFVndTdJVkZOQkRFcS9oTUg4STdqSnJSendDbEt2VEQ2SHNa?=
 =?utf-8?B?YUJMcENNeUV4eDVURjZURmpsb2NiSVJmZTBNT0FqRWpZc204LzZqb1hvYnV1?=
 =?utf-8?B?ZGNWaXlOZUdhOUIva0tRMkFJb0VVNzNLMGt1a1VYUlFFTWdVQ0xHNVpsblVk?=
 =?utf-8?B?Yk5qV3lneFlxUUZhYkMvaEludlZxNzAzOFRVVkY4dkY2U1l6Y1QweXJvZUpj?=
 =?utf-8?B?WGh1VXhwVHFNV2hFNGlSRVA2YmlYTDBsTzErck9EMmJaUGNCaDRCdzdVeG9y?=
 =?utf-8?B?QjV4VVUrcVlLMTh6MmI0cG1iRVhkb2JaMzlEcGtIa1RyVGdENUo1NFZrYkN4?=
 =?utf-8?B?dmtqWW0xOS9yTEV3cjFIS1ZSeGNhaS9kNWhxS2RDMlExNlhENFRUQm53ZXRN?=
 =?utf-8?B?Q3VpZ2VXS1Yxc1p1NnROVUs4YUVEQ2pIZmpubjJkS2RJclJ6ajljNTdCdkli?=
 =?utf-8?B?eWZyRVcwWjhtd0ZUTFlkK1JQQVpHMEZPT3JGemJWOGc1aDE0eFhLU0JkeHd4?=
 =?utf-8?B?NVdXdzBuekNqQ1g1Zi9Sa3RqNGF6MXp0eEsyZ2l1azI2a1BWdlgvLy9HVGJL?=
 =?utf-8?Q?kySeWno2JZ5v+2bS9C9mPxAPRF6U5qNP9/+AV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34281501-38a4-4359-7365-08dee6686669
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 14:08:40.7226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NiS5C5kJswuIJQjm5hF8t3TgTrxmEMThIWlzAqO0pDFGf3uVkZVnzjDRlQvd4BOcp1mTjOZ/bEfDd2QyhZXXiSjKI0avNj5+ci4hRPZ8z5/pweTQAWESso/k22LqdZDg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9412

A collection of device tree fixes and additions for the i.MX 8ULP SoC
and its EVK boards:

SoC-level (imx8ulp.dtsi):
- Add DMA channel properties to LPI2C, LPUART and LPSPI nodes and
  replace hardcoded eDMA direction flags with FSL_EDMA_RX /
  FSL_EDMA_MULTI_FIFO macros for SAI and SPDIF nodes.
- Add the I3C2 controller node (Silvaco IP).
- Correct the SRAM node base address and size to cover the full 64 KB
  SSRAM P2 partition instead of only the last 4 KB.
- Add assigned-clock properties to LPUART4-7 so the clock framework
  configures the input clock automatically during probe.

Board-level (imx8ulp-evk.dts):
- Add a gpio-keys node for the power-on button (PTF31).
- Enable LPUART6 with flow control for NXP 88W8987 Bluetooth.
- Enable LPUART7 for the FT4232 PortD serial on proto1B boards.
- Reduce ENET pad drive strength and slew rate on PTE14-17/22/23 to
  fix signal overshoot.

Board-level (imx8ulp-9x9-evk.dts):
- Rename the model string from "EVK9" to "9x9 EVK" to follow the
  i.MX die-size naming convention.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- I3C2 patch: update commit message to clarify slow_clk uses a dummy clock.
- SRAM patch: update ranges and scmi-sram-section child offset/name to match new base address.
- LPUART6/7 patches: drop redundant "sleep" pinctrl state.
- DMA patch: fix trailing whitespace on lpuart4/5 dmas lines.
- Link to v1: https://patch.msgid.link/20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com

---
Peng Fan (6):
      arm64: dts: imx8ulp: Add DMA channel properties and use eDMA flag macros
      arm64: dts: imx8ulp: Add I3C2 controller node
      arm64: dts: imx8ulp: Correct SRAM node address and size to cover full SSRAM P2
      arm64: dts: imx8ulp: Add assigned clock properties for LPUART nodes
      arm64: dts: imx8ulp-evk: Add gpio-keys node for power button
      arm64: dts: imx8ulp-9x9-evk: Rename model string to reflect die size

Sherry Sun (2):
      arm64: dts: imx8ulp-evk: Enable LPUART6 for Bluetooth
      arm64: dts: imx8ulp-evk: Enable LPUART7

Wei Fang (1):
      arm64: dts: imx8ulp-evk: Change the values of some PCRs of ENET

 arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts | 37 +++++++++++-
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts     | 65 +++++++++++++++++++--
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi        | 70 +++++++++++++++++++----
 3 files changed, 155 insertions(+), 17 deletions(-)
---
base-commit: cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5
change-id: 20260715-imx8ulp-dts-69f9bf928d2f

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

