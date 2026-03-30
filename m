Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013045.outbound.protection.outlook.com [52.101.83.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533C23D88EF
	for <imx@lists.linux.dev>; Mon, 30 Mar 2026 14:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774880114; cv=fail; b=Po2yoOJttgHuSRHP5uesWECpWyN/D/6WFGKqg0XY5O+LOTcsYb0bagRuFQh2gB/rTG68oo9oNkDpPM6t9UvtGdm+Nxg+WSblMZGexsmnXxWhH9QiphARvPt45rM56Ks2n3l7WYc5GCUqlOwaG9d2hxrhqpw+diM5WM5wuqKEH4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774880114; c=relaxed/simple;
	bh=vYHOTRBX4GrSkFzkCLR7avN1IisF7tHBJ2VmOFokOww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fViaH3s+lWl+/88mnKlg9nAXEQ3Ine1/ZWM09JfksQk+G/QXS8n3tuD9nbnUmPM8rR8HQ06cUNjP8xyDuiJ7IzFyyzcN+WTn13MzUAffV8ARSkJTv9gNwehtQkyoN/p8DcP2ge2AQVt6zlSjFza31dpNWQev9rBVaEOEBsj4gY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZMXWipAe; arc=fail smtp.client-ip=52.101.83.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZMXWipAe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I1KnO+d4TDmf6Y/ZyKgbj8ywomcRq1IEe7p9g5MDW1dRe+jR94LPfNjpXq65p+3VqVP2Vf+r656/eX5/pCg7Sq1SpxMz1voBGhuuZYm3Iy716jYCgJq5bXIsuedkozVAJkDrd2maYb3WAmf/r3eAobsquxJ7NXpsb/R8nmvlmisAo6U7siupVupox0KPXXC8rm8Hz+El2qGcFYq1F+1HsIek8boooUpBgfl+Ez4nfuoXUWY0MWWhPBJh5IBVJQGbTNa1sgXv82ezU7PmjlydX7/MPK7PLf5Un+N5mxNTHPq7vYE7GKix7ZVn+V6X4RJa7UDgOoqySc+v2FYHmXc7lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1LsVUBUl6FkBIZIGq0sMdu+8pFX/GzKGSBD/4z+LqA=;
 b=HAgehJ0bi/pNz+5FFfEY1huM3CqWhweoYxkB8k+npmoa8Q4yFPZ4KJgZuTILxzp5i547AFCZfT3zFnxYXDMCXRR6iOvFUnqbJPFZMbGqCvhuI6RtV4m9WanDWgs410sEuA0Y5mX4p1XMDOK9Y8oQwZpWRy1WzT2qnhHDgifnWNggFCfczYq98Bz3lGyT/5oSiDDZSsnsC4Ww9v9NubdnczoQHLLq/iKVV/+xN7i8/eYOVwYKNPf78GqBIJY2q4oTE52y3HvnJXP2yft8oKUp1amvBo7Rz+cRy3nU0l58zjQpW5G7Xu1Kxp/2Vx3yA/tNLRjam2Nh992ESZ37qB72LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1LsVUBUl6FkBIZIGq0sMdu+8pFX/GzKGSBD/4z+LqA=;
 b=ZMXWipAekWrhEmnM4D0dQOvngkSMhWdaI4ywVDxx6iMJ3HDUXipdH7S4b8uPmugXM9KH2/RwRMNSkd2Bgt7Gq97FjnhGyqiO4bLjBASg9pqfXRHH1Fh4/QbK4V2VzNTs0G6mg8utb5qgqZhhgcyHwI7i3do2WzR24Tt05HVylgi2MHo6gR+9NNv9bf32uRvZeDZoT4dUQQ+NLsKxwJHEaw/mnULnBRH6bY9CyfsaNF9vAyohs22peVf3J1VKttEfUkJgHgHiNWVahzVsVmqLKHb0OqvgOgUhE3RgYc2OKRhtH65oWPJycXmZb2SkK+gKmPzrH9Va3ywozU5K+wog5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB12223.eurprd04.prod.outlook.com (2603:10a6:102:55f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.24; Mon, 30 Mar
 2026 14:15:07 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 14:15:07 +0000
From: Frank Li <Frank.Li@nxp.com>
To: soc@kernel.org,
	arm@kernel.org
Cc: Frank.Li@nxp.com,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/4] i.MX arm64 dts changes for v7.1
Date: Mon, 30 Mar 2026 10:14:37 -0400
Message-ID: <20260330141444.3789193-2-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330141444.3789193-1-Frank.Li@nxp.com>
References: <20260330141444.3789193-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR22CA0023.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::21) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB12223:EE_
X-MS-Office365-Filtering-Correlation-Id: 40c522bd-541e-4345-a1f5-08de8e66be6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|376014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	feOiAFkHVhl9MDZMqIvwHHBehmWBPObVFzZBpCTAfJYa2cUP2GDtJBQx22HBiovuLDz+S6qEMOoQFdGzrRSFHZXf6psfmgPppyLhaRG1Hedkp3eah8Yv8YYdIbNJw+aBZIbMGAVNSlAKGrYhJ3itwHUKxVO/igJGEIa7SMiOxDDtfivjH7QPv9HVOlIl+4+w6lSUOckVecd2Rtw2VsZ+VYtun16SlIXP+Qw8rRbiqhmd+Kl3cuRS5cVaOQKCmbDrNVfsXg9XzcnpRSvDfSdHRTdFq7vsxK7Anpv2flfdbzsqSjgG7wuf/8dalMKwoIb8vaPWAC2+VlDFi9Ty9MdMCAJHMMUIh11L3NmU4liJfvikAp/yG8q7/Sas2ANycEC79FrVA+PMMfxHGbgzyfVW2cpRhQpc8NnYiD9xe0g5XkVdbQ3DFAPqe5YNj502jlvPJA7VkT8GyJVfBBF/PfxBremgpzCY0DSE27bIQgcpUrKdNzWrbPcYyRpcb30fCutyR0OI7tueASNvOTOZR7qHv425ftRqVafZHd4tKc662vOpAtADDlC6yaK3eDmn6IYGXxETpfpXCKS1IdhtPmgItQVxtAA/AGutGMRMtQOl1Gcww7YsgBgAn4fNlqvfrB3vcR1D4Ae4uA6U5pgpg7QxaCgBP3sYmALFX0xJdztJ1CxTJLneHoim5JzKfokr4H9Fxkm9xMMonBYcpXytcAHh1CR4u/1nUq0tp069spGWryw0wd3DCa5AeHZGRRG1czwSnGIzsW10UN3zP1kyB/K8ogaMj7nL7EcKx95wH/hJZhI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(376014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5SWybk1q3fRaZ0PU1OLVZPyMfV519D80TluZyEj5lx+GsDa8IOlDLe+uGxga?=
 =?us-ascii?Q?4feyi7WCKS5Jf8LjZhnMr/CKYxsDPWhybWK17KUmCE5MipaWQsk6ADadi+Gn?=
 =?us-ascii?Q?RgW9W0DqmvvV6ijhJIpqlmuzkTzO8yZx2ZyVyVEXQHFLSw+h6/VCvXAnunQ+?=
 =?us-ascii?Q?dS2TNlAbQizWBWI92k+zuAo/xGp2nZwn7wfcePERy6L9xyZAlyqRcIKg6xmm?=
 =?us-ascii?Q?e8mHghoH9QEa5WNmHn35fpSvp8W5h4pZtnwLOZWbmg1EIzOFu//VRnr5+jEa?=
 =?us-ascii?Q?PTeukZAowx3+HQwZY/wzdwBh2zAroj6MpzqYjd+5/jW8YGP5bBAItXZe9i+f?=
 =?us-ascii?Q?NnKJGYC96SAac5MPoe3OvVSPbrLhFemmdaQlmDWTf1jsmzR3IuakiktntlLp?=
 =?us-ascii?Q?inqBHpntp4njuoVjOfI+5XEMZeD/FThm5J2obfYkLzwXWzJOAu/CaHxrafWQ?=
 =?us-ascii?Q?ndyri7JrDd1ckgANI6U8izYXVUzPFQ8Ukyn48PHZIgHWtHEb32eoUxgZngDc?=
 =?us-ascii?Q?Yn7z6teO+u8goeXI/5OzjFdzH1hEgzECdWrsIHCorFxmZm5EZaeDOpapM45H?=
 =?us-ascii?Q?bt0xGaCcnH7FqyM92VhphgaBEk2hKzpzuYLbVJTwWQLRLuqBruWVogfB8qDr?=
 =?us-ascii?Q?aImNUGQ2bECyIBr7GE2BO9sPb0GtFffPEfJnxw7f24XZ74VqmCs+r/i1v0Ld?=
 =?us-ascii?Q?M/u2bNiC9rbMCEIMGgAhzLdGgQ05fFNaX8Z4mW56kj7ali64KNA/bSl8oBiV?=
 =?us-ascii?Q?qnnLc1XkV+9sBW5UNch1+2p9RB8Y+c6t67Eu3L7P17B0JFlcbPxHHOLhYb+l?=
 =?us-ascii?Q?jxEDWWZ2Z8/M/GFYxCTCbe/FmW2+MvTsUaBNef8sRuP3gl2hBCbJceFiynaP?=
 =?us-ascii?Q?r0PSSFJnjxgG6k3jAKKTGXpj/PilyLv8tvrx99Zvqqz3Y6AwGtOTaaUMMc8H?=
 =?us-ascii?Q?px5kGufcTW15vD5yccb/yIm5WjJ34z7PVTuwOu71rU7ZikFQQYWShXfeYhsR?=
 =?us-ascii?Q?e7Ul3KJmRqInFgWwUhXEJp4zDR7xJ1qeJAiNOSufn7q8Bg0UCLADzig6WVWQ?=
 =?us-ascii?Q?v+oESP3JJFYD1j3+DbRCiFPCufdt5LLKM2sqoHsFPuF88SSqTiiK+/aXbVJS?=
 =?us-ascii?Q?MMSOOB7imwWtleEPC8gYsxx0h7vGms41DVC+MvUMyFMtxE6D44B84p6VrRgL?=
 =?us-ascii?Q?upSKNjBvrUPFqPrjIYeFfAQa4UWmbqn615xdqEiq+hnbWZE6W4HVDXbRxRTd?=
 =?us-ascii?Q?j9qYN1eyHdYwy5kxc3J3a4fQEG6x/49BenelXufUoQfwTBKBIC3DHhniXT2z?=
 =?us-ascii?Q?798jaMFKxPMg01FfGqgiwU1XbOtGJ9x9XQGClKSMcvDClB5rFwO3wTiol5II?=
 =?us-ascii?Q?QLso3+yrMur80CU/+rsKOGk1raMhskvBhQlLiVnQ5TZAQdNgGz0FyO+a2Gf+?=
 =?us-ascii?Q?v6kBdvI9IUBlJLYWPhQ2IPUer6cZs3lhDw026r5qokJR7wRa4r2dfVFBILRf?=
 =?us-ascii?Q?kjcNJbcKyCO/mMjf0t6ZwS7HwvidXEN+K3u8iyyJBxBXK4wcHPGY8pJWXuDK?=
 =?us-ascii?Q?35uPrcLIZpXmJO06/SVj3gfGRbu86egWHQj2812ad9DaxqzEJKEQHkhjjyJh?=
 =?us-ascii?Q?Pe1BBY3b9g6OfdKKwHMVoFsueNx4KREixf2FroQUySBvUvLGq1jToLZcPoMB?=
 =?us-ascii?Q?qT4CAJa0PHbCj16HG1Du9AfUivdqP9nyRzNKAij6VXqM1LQC3xuwqBESrsdS?=
 =?us-ascii?Q?vvZW3mcXBA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c522bd-541e-4345-a1f5-08de8e66be6f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 14:15:06.9836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UKSePtNKGflHSeMI6l5K/oNHqlUuPYoeNeZZdaoZXbotQG/oAPSIEeLSC0WdrYDKmXHX4uK1HQytBh34hVh+cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB12223

From: Frank.Li@nxp.com

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-dt64-7.1

for you to fetch changes up to 825b8c7e1d2918d89eb378b761530d1e51dba82e:

  arm64: dts: imx8qxp-mek: switch Type-C connector power-role to dual (2026-03-27 09:53:32 -0400)

----------------------------------------------------------------
i.MX arm64 device tree changes for 7.1:

- New Board Support
  S32N79-RDB, Variscite DART-MX95, DART-MX91 with Sonata carrier boards,
  Verdin iMX95 with multiple carrier boards (Yavia, Mallow, Ivy, Dahlia)
  TQMa93xx/MBa93xxLA-MINI, SolidRun i.MX8MP HummingBoard IIoT,
  SolidRun i.MX8MM SOM and EVB, SolidRun SolidSense-N8 board
  Ka-Ro Electronics tx8m-1610 COM, GOcontroll Moduline IV and Moduline Mini,
  NXP FRDM-IMX91S board, i.MX93 Wireless EVK board with Wireless SiP,
  NXP i.MX8MP audio board v2.

- USB & Type-C Support
  Type-C and USB nodes for imx943, correct power-fole for
  imx8qxp-mek/imx8qm-mek.

- Audio Enhancements
  PDM microphone, bt-sco, and WM8962 sound card support for i.MX952. AONMIX
  MQS for i.MX95. Use audio-graph-card2 for imx8dxl-evk. WM8904 audio codec
  for imx8mm-var-som.

- Thermal & Cooling
  PF09/53 thermal zone, fan node, active cooling on A55, SCMI
  sensor/lmm/cpu for imx943/imx94.

- Display Support
  Multiple LVDS and parallel display overlays for TQ boards (imx91/imx93).
  Parallel display for i.MX93. ontat,kd50g21-40nt-a1 panel for
  imx93-9x9-qsb. pixpaper display overlay for i.MX93 FRDM.

- Networking
  Multiple queue configuration on eqos for TQMa8MPxL.
  MaxLinear PHY support, MCP251xFD CAN controller for imx8mm-var-som.
  SDIO WiFi support (imx91-evk, imx8mp-evk, imx943-evk)

- Bluetooth Support
  imx943-evk, imx93-14x14-evk, imx95-19x19-evk, imx8mp-evk, imx8mn-evk,
  imx8mm-evk.

- Miscellaneous
  xspi and MT35XU01G SPI NOR flash for i.MX952.
  V2X/ELE mailbox nodes, SCMI misc ctrl-ids for imx94.
  eDMA channel reservation for V2X, Cortex M7 support for imx95.
  Ethos-U65 NPU and SRAM nodes for imx93.
  Wire up DMA IRQ for PCIe for imx8qm-ss-hsio.

- Bug Fixes & Improvements
  Complete pinmux for rcwsr12 to fix I2C bus recovery affect other module
  pinmux for layscape platform.
  Multiple bug fixes for GPIO polarity, IRQ types, pinmux configurations.
  GICv3 PPI interrupt CPU mask cleanup across multiple SoCs.
  Fixed Ethernet PHY IRQ types on TQ boards.
  Fixed UART RTS/CTS muxing issues.
  Fixed SD card issues on Kontron boards.
  Fixed touch reset configuration.
  Removed fallback ethernet-phy-ieee802.3-c22 where appropriate.
  Move funnel outside from soc.
  TMU sensor ID cleanup.
  Change usdhc tuning step for eMMC and SD.
  Hexadecimal format, readability improvements, duplicate removal.

----------------------------------------------------------------
Alexander Stein (23):
      arm64: dts: tqma8mpql-mba8mpxl: Configure multiple queues on eqos
      arm64: dts: tqma8mpql-mba8mp-ras314: Configure multiple queues on eqos
      arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe
      arm64: dts: tqma9352-mba93xx*: Change Ethernet PHY IRQ to IRQ_TYPE_LEVEL_LOW
      arm64: dts: tqma9352-mba91xxca: Change Ethernet PHY IRQ to IRQ_TYPE_LEVEL_LOW
      arm64: dts: imx91: Remove TMU's superfluous sensor ID
      arm64: dts: imx8mp-tqma8mpql-mba8mpxl-g133han01: Remove compatible from overlay
      arm64: dts: imx8mp-tqma8mpql-mba8mpxl-tm070jvhg33: Remove compatible from overlay
      arm64: dts: imx8mq-tqma8mq-mba8mx-tm070jvhg33: Remove compatible from overlay
      arm64: dts: imx8mn-tqma8mqnl-mba8mx-tm070jvhg33: Remove compatible from overlay
      arm64: dts: imx8mm-tqma8mqml-mba8mx-tm070jvhg33: Remove compatible from overlay
      arm64: dts: imx93-tqma9352-mba91xxca: Add parallel display overlay
      arm64: dts: imx93-tqma9352-mba91xxca: Add LVDS display overlay
      arm64: dts: imx91-tqma9131-mba91xxca: Add parallel display overlay
      arm64: dts: imx91-tqma9131-mba91xxca: Add LVDS display overlay
      arm64: dts: imx8mm: Explicitly set DSI_PHY_REF clock as a child of CLK_24M
      arm64: dts: imx8mm-tqma8mqml-mba8mx: LVDS overlay: Reduce DSI burst clock to 600Mhz
      arm64: dts: imx8mn-tqma8mqnl-mba8mx: LVDS overlay: Reduce DSI burst clock to 600Mhz
      arm64: dts: imx95: Move funnel outside from soc
      arm64: dts: mba8mx: Add DSI->LVDS bridge IRQ
      arm64: dts: freescale: tqma8mqml/tqma8mxnl-mba8mx: Add dual-channel LVDS overlay
      arm64: dts: imx8mp-tqma8mpql-mba8mp-ras314: add vcc supply for BT device
      arm64: dts: imx8mp-tqma8mpql: Add DT overlays to explicit list

Andrej Picej (1):
      arm64: dts: imx93-phyboard-segin: Add peb-av-02 overlay

Annette Kobou (1):
      arm64: dts: imx8mp-kontron: Fix boot order for PMIC and RTC

Ciprian Marian Costea (2):
      arm64: dts: freescale: Add NXP S32N79 SoC support
      arm64: dts: freescale: Add NXP S32N79-RDB board support

Daniel Baluta (2):
      arm64: dts: imx8mp: Make MX8MP_I2C_DEFAULT independent on drive strength
      arm64: dts: imx8mp-frdm: Use symbolic macros for IOMUXC_SW_PAD_CTL_PAD

Eduard Bostina (1):
      arm64: dts: imx8mp-dhcom-pdk3: Use symbolic macro for IOMUXC_SAI2_TXC__GPIO4_IO25

Emanuele Ghidoli (2):
      arm64: dts: freescale: imx95-toradex-smarc: fix PMIC_SD2_VSEL label position
      arm64: dts: freescale: imx95-toradex-smarc: Support Cortex M7

Ernest Van Hoecke (5):
      arm64: dts: freescale: Add Verdin iMX95 support
      arm64: dts: freescale: imx95-verdin: Add Dahlia carrier board
      arm64: dts: freescale: imx95-verdin: Add Ivy carrier board
      arm64: dts: freescale: imx95-verdin: Add Mallow carrier board
      arm64: dts: freescale: imx95-verdin: Add Yavia carrier board

Fabian Pfitzner (1):
      arm64: dts: imx8mp-frdm: add sd, ethernet, wifi, usb and hdmi support

Florin Leotescu (1):
      arm64: dts: imx943-evk: Add fan node and enable active cooling on A55

Francesco Dolcini (3):
      arm64: dts: imx8-apalis: Disable the audmix
      arm64: dts: imx8-apalis: Remove obsolete TODO comment
      arm64: dts: imx8-apalis: Fix LEDs name collision

Frank Li (3):
      arm64: dts: imx8mm-evk: replace space with tab
      arm64: dts: imx8mp-evk: replace space with tab
      arm64: dts: imx8mp-beacon: remove fallback ethernet-phy-ieee802.3-c22

Frieder Schrempf (3):
      arm64: dts: imx8mp-kontron: Fix touch reset configuration on DL devices
      arm64: dts: imx8mp-kontron: Drop vmmc-supply to fix SD card on SMARC eval carrier
      arm64: dts: imx8mp-kontron: Use GPIO/IRQ defines in DL devicetree

Fugang Duan (1):
      arm64: dts: imx8mm-evk: add uart3 port

Geert Uytterhoeven (2):
      arm64: dts: fsl-ls1028a: Drop CPU masks from GICv3 PPI interrupts
      arm64: dts: freescale: imx: Drop CPU masks from GICv3 PPI interrupts

Haibo Chen (2):
      arm64: dts: imx952: Add xspi node
      arm64: dts: imx952-evk: add MT35XU01G spi nor flash

Josua Mayer (17):
      arm64: dts: imx8mp-hummingboard-pulse/cubox-m: fix vmmc gpio polarity
      arm64: dts: imx8mp-hummingboard-pulse: fix mini-hdmi dsi port reference
      arm64: dts: imx8mp-sr-som: build dtbs with symbols for overlay support
      arm64: dts: freescale: add support for SolidRun i.MX8MP HummingBoard IIoT
      arm64: dts: imx8mp-hummingboard-iiot: add dt overlays for muxable ports
      arm64: dts: freescale: add support for solidrun solidsense-n8 board
      arm64: dts: freescale: add support for solidrun i.mx8mm som and evb
      arm64: dts: lx2160a-cex7/lx2162a-sr-som: fix usd-cd & gpio pinmux
      arm64: dts: lx2160a: change i2c0 (iic1) pinmux mask to one bit
      arm64: dts: lx2160a: remove duplicate pinmux nodes
      arm64: dts: lx2160a: rename pinmux nodes for readability
      arm64: dts: lx2160a: add sda gpio references for i2c bus recovery
      arm64: dts: lx2160a: change zeros to hexadecimal in pinmux nodes
      arm64: dts: lx2160a: complete pinmux for rcwsr12 configuration word
      arm64: dts: lx2160a-cex7: add rtc alias
      arm64: dts: lx2162a-sr-som: add crypto & rtc aliases, model
      arm64: dts: lx2162a-clearfog: set sfp connector leds function and source

Joy Zou (3):
      arm64: dts: imx95: Reserve eDMA channels 0-1 for V2X
      arm64: dts: imx95-evk: update the dma-channel-mask property
      arm64: dts: imx943: Add thermal support

Laurentiu Mihalcea (2):
      arm64: dts: imx95: add AONMIX MQS node
      arm64: dts: imx95-15x15-frdm: support AONMIX MQS

Liu Ying (2):
      arm64: dts: imx93-9x9-qsb: Add ontat,kd50g21-40nt-a1 panel
      arm64: dts: imx8mp-evk: Specify ADV7535 register addresses

Luke Wang (2):
      arm64: dts: imx91-11x11-evk: change usdhc tuning step for eMMC and SD
      arm64: dts: imx93-11x11-evk: change usdhc tuning step for eMMC and SD

Marco Felsch (1):
      arm64: dts: imx93: Add parallel display output nodes

Martin Schmiedel (2):
      arm64: dts: freescale: add initial device tree for TQMa93xx/MBa93xxLA-MINI
      arm64: dts: freescale: imx93-tqma9352-mba93xxla-mini: Add WLAN/BT overlay

Maud Spierings (4):
      arm64: dts: imx8mm: Add pinctrl config definitions
      arm64: dts: freescale: add Ka-Ro Electronics tx8m-1610 COM
      arm64: dts: freescale: Add the GOcontroll Moduline IV
      arm64: dts: freescale: Add the GOcontroll Moduline Mini

Nora Schiffer (1):
      arm64: dts: freescale: imx8mp-tqma8mpql-mba8mp-ras314: fix UART1 RTS/CTS muxing

Peng Fan (4):
      arm64: dts: imx94: Add V2X/ELE mailbox nodes
      arm64: dts: imx94: Add SCMI sensor/lmm/cpu nodes
      arm64: dts: imx943-evk: Add nxp,ctrl-ids for scmi_misc
      arm64: dts: imx943-evk: Add pf09/53 thermal zone

Primoz Fiser (1):
      arm64: dts: freescale: imx93-phy{core,board}: Add i2c bus recovery

Ranjani Vaidyanathan (1):
      arm64: dts: imx94: Update pin headers

Rob Herring (Arm) (1):
      arm64: dts: freescale: imx93: Add Ethos-U65 NPU and SRAM nodes

Shengjiu Wang (7):
      arm64: dts: imx8mm-evk: correct the spdif compatible string
      arm64: dts: imx8mp-ab2: add support for NXP i.MX8MP audio board (version 2)
      arm64: dts: imx952: Add audio device nodes
      arm64: dts: imx952-evk: Add sound-wm8962 support
      arm64: dts: imx952-evk: Add bt-sco sound card support
      arm64: dts: imx952-evk: Add PDM microphone sound card support
      arm64: dts: imx8dxl-evk: Use audio-graph-card2 for wm8960-2 and wm8960-3

Sherry Sun (16):
      arm64: dts: imx8mm-evk: add uart1 and bluetooth node
      arm64: dts: imx8mn-evk: add bluetooth dts node
      arm64: dts: imx8mp-evk: add bluetooth dts node
      arm64: dts: imx93-evk/qsb: add m2-pcm-level-shifter-hog to enable BT HFP
      arm64: dts: imx95-19x19-evk: enable lpuart5 for Bluetooth support
      arm64: dts: imx93-14x14-evk: enable lpuart5 for Bluetooth
      arm64: dts: imx943-evk: enable lpuart6 for Bluetooth
      arm64: dts: imx93: Extract common EVK description into shared dtsi
      arm64: dts: imx93: Move 11x11 EVK specific parts back to imx93-11x11-evk.dts
      arm64: dts: imx93: Add imx93w.dtsi for i.MX93 Wireless SiP
      arm64: dts: imx93: Add i.MX93 Wireless EVK board support
      arm64: dts: imx943-evk: add usdhc3 for SDIO WiFi support
      arm64: dts: imx8mp-evk: Enable pull select bit for PCIe regulator GPIO (M.2 W_DISABLE1)
      arm64: dts: imx8mp-evk: Add usdhc1 for SDIO WiFi support
      arm64: dts: imx91-11x11-evk: Add usdhc3 for SDIO WiFi support
      arm64: dts: imx95-15x15-evk: remove regulator-always-on for reg_m2_pwr

Stefano Radaelli (15):
      arm64: dts: freescale: imx8mm-var-som: Move UART4 description to Symphony
      arm64: dts: freescale: imx8mm-var-som: Align fsl,pins tables
      arm64: dts: freescale: imx8mm-var-som: Update FEC support with MaxLinear PHY
      arm64: dts: freescale: imx8mm-var-som: Add support for WM8904 audio codec
      arm64: dts: freescale: imx8mm-var-som: Add MCP251xFD CAN controller
      arm64: dts: freescale: imx8mm-var-som: Rework WiFi/BT and add legacy dts
      arm64: dts: imx8mm-var-som-symphony: Move USB configuration from SOM
      arm64: dts: imx8mm-var-som-symphony: Enable uSD on USDHC2
      arm64: dts: imx8mm-var-som-symphony: Add TPM2 support
      arm64: dts: imx8mm-var-som-symphony: Enable I2C4
      arm64: dts: imx8mm-var-som-symphony: Enable PCIe
      arm64: dts: freescale: Add support for Variscite DART-MX91
      arm64: dts: imx91-var-dart: Add support for Variscite Sonata board
      arm64: dts: freescale: Add support for Variscite DART-MX95
      arm64: dts: imx95-var-dart: Add support for Variscite Sonata board

Wig Cheng (1):
      arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM

Xu Yang (5):
      arm64: dts: imx94: add USB nodes
      arm64: dts: imx943-evk: add Type-C and USB related nodes
      arm64: dts: freescale: imx8mp-moduline-display-106: add typec-power-opmode property
      arm64: dts: imx8qm-mek: switch Type-C connector power-role to dual
      arm64: dts: imx8qxp-mek: switch Type-C connector power-role to dual

Yanan Yang (1):
      arm64: dts: freescale: add NXP FRDM-IMX91S board support

 arch/arm64/boot/dts/freescale/Makefile             |   74 ++
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |   15 +-
 .../arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi |   10 +-
 .../dts/freescale/fsl-lx2160a-clearfog-itx.dtsi    |    2 +
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |  183 ++-
 .../boot/dts/freescale/fsl-lx2162a-clearfog.dts    |   10 +
 .../boot/dts/freescale/fsl-lx2162a-sr-som.dtsi     |   19 +-
 .../arm64/boot/dts/freescale/imx8-apalis-eval.dtsi |    4 -
 .../boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi |   10 +-
 .../boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi |   10 +-
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      |  114 +-
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      |   78 +-
 .../dts/freescale/imx8mm-hummingboard-ripple.dts   |  335 ++++++
 arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h     |   33 +
 arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi   |  393 +++++++
 .../imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtso    |   86 ++
 .../imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso  |    9 +-
 .../boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts |    1 -
 .../imx8mm-tx8m-1610-moduline-iv-306-d.dts         |  799 ++++++++++++++
 .../imx8mm-tx8m-1610-moduline-mini-111.dts         |  687 ++++++++++++
 .../arm64/boot/dts/freescale/imx8mm-tx8m-1610.dtsi |  444 ++++++++
 .../freescale/imx8mm-var-som-symphony-legacy.dts   |   19 +
 .../boot/dts/freescale/imx8mm-var-som-symphony.dts |  214 +++-
 .../freescale/imx8mm-var-som-wifi-brcm-legacy.dtsi |   12 +
 .../freescale/imx8mm-var-som-wifi-bt-iw61x.dtsi    |   45 +
 arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi  |  366 +++---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |   19 +-
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi      |    4 +
 .../dts/freescale/imx8mn-solidsense-n8-compact.dts |  851 ++++++++++++++
 .../imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtso  |    7 +-
 .../boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts |    1 -
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |   11 +-
 arch/arm64/boot/dts/freescale/imx8mp-ab2.dts       |  912 +++++++++++++++
 .../arm64/boot/dts/freescale/imx8mp-beacon-kit.dts |    3 +-
 .../boot/dts/freescale/imx8mp-beacon-som.dtsi      |    3 +-
 arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts   |    2 +-
 .../arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts |    2 +-
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |   98 +-
 arch/arm64/boot/dts/freescale/imx8mp-frdm.dts      |  538 ++++++++-
 ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso |   67 ++
 ...ummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso |   97 ++
 .../imx8mp-hummingboard-iiot-rs485-a.dtso          |   18 +
 .../imx8mp-hummingboard-iiot-rs485-b.dtso          |   18 +
 .../dts/freescale/imx8mp-hummingboard-iiot.dts     |  716 ++++++++++++
 .../imx8mp-hummingboard-pulse-common.dtsi          |    2 +-
 .../imx8mp-hummingboard-pulse-mini-hdmi.dtsi       |   11 +-
 .../boot/dts/freescale/imx8mp-kontron-dl.dtso      |   26 +-
 .../boot/dts/freescale/imx8mp-kontron-osm-s.dtsi   |    6 +
 .../imx8mp-kontron-smarc-eval-carrier.dts          |    1 -
 arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h     |    2 +-
 .../freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts   |   72 +-
 .../imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtso  |    6 +-
 ...imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso |    6 +-
 .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts    |   67 ++
 ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso |    1 +
 .../imx8mp-tx8p-ml81-moduline-display-106.dts      |   16 +-
 .../arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi |    8 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |   11 +-
 .../imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtso    |    6 +-
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |   10 +-
 arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi  |    5 +-
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |   10 +-
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |    3 +-
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts  |   98 ++
 .../boot/dts/freescale/imx91-11x11-frdm-s.dts      |  769 +++++++++++++
 .../boot/dts/freescale/imx91-var-dart-sonata.dts   |  471 ++++++++
 arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi  |  468 ++++++++
 arch/arm64/boot/dts/freescale/imx91.dtsi           |    2 +-
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi |   64 +-
 .../boot/dts/freescale/imx93-11x11-evk-common.dtsi |  861 +++++++++++++++
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts  |  855 +-------------
 .../dts/freescale/imx93-11x11-frdm-pixpaper.dtso   |   50 +
 arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts  |   12 +
 .../imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtso       |  110 ++
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts    |    6 +
 .../boot/dts/freescale/imx93-phyboard-nash.dts     |   12 +-
 .../freescale/imx93-phyboard-segin-peb-av-02.dtso  |  146 +++
 .../boot/dts/freescale/imx93-phyboard-segin.dts    |   12 +-
 .../boot/dts/freescale/imx93-phycore-som.dtsi      |   12 +-
 .../imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtso |   56 +
 .../imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtso  |   66 ++
 .../dts/freescale/imx93-tqma9352-mba91xxca.dts     |    4 +-
 .../dts/freescale/imx93-tqma9352-mba93xxca.dts     |    4 +-
 .../imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtso |   35 +
 .../freescale/imx93-tqma9352-mba93xxla-mini.dts    |  598 ++++++++++
 .../dts/freescale/imx93-tqma9352-mba93xxla.dts     |    4 +-
 arch/arm64/boot/dts/freescale/imx93.dtsi           |   36 +
 arch/arm64/boot/dts/freescale/imx93w-evk.dts       |   28 +
 arch/arm64/boot/dts/freescale/imx93w.dtsi          |  110 ++
 arch/arm64/boot/dts/freescale/imx94-pinfunc.h      |   12 +
 arch/arm64/boot/dts/freescale/imx94.dtsi           |  127 ++-
 arch/arm64/boot/dts/freescale/imx943-evk.dts       |  292 +++++
 arch/arm64/boot/dts/freescale/imx943.dtsi          |   64 ++
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts  |    1 -
 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts |   73 ++
 .../boot/dts/freescale/imx95-19x19-evk-sof.dts     |    7 +-
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  |    2 +-
 .../boot/dts/freescale/imx95-toradex-smarc.dtsi    |   49 +-
 .../boot/dts/freescale/imx95-var-dart-sonata.dts   |  595 ++++++++++
 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi  |  425 +++++++
 .../boot/dts/freescale/imx95-verdin-dahlia.dtsi    |  270 +++++
 .../arm64/boot/dts/freescale/imx95-verdin-dev.dtsi |  250 +++++
 .../arm64/boot/dts/freescale/imx95-verdin-ivy.dtsi |  515 +++++++++
 .../boot/dts/freescale/imx95-verdin-mallow.dtsi    |  223 ++++
 .../dts/freescale/imx95-verdin-nonwifi-dahlia.dts  |   21 +
 .../dts/freescale/imx95-verdin-nonwifi-dev.dts     |   21 +
 .../dts/freescale/imx95-verdin-nonwifi-ivy.dts     |   21 +
 .../dts/freescale/imx95-verdin-nonwifi-mallow.dts  |   21 +
 .../dts/freescale/imx95-verdin-nonwifi-yavia.dts   |   21 +
 .../boot/dts/freescale/imx95-verdin-nonwifi.dtsi   |   16 +
 .../dts/freescale/imx95-verdin-wifi-dahlia.dts     |   21 +
 .../boot/dts/freescale/imx95-verdin-wifi-dev.dts   |   21 +
 .../boot/dts/freescale/imx95-verdin-wifi-ivy.dts   |   21 +
 .../dts/freescale/imx95-verdin-wifi-mallow.dts     |   21 +
 .../boot/dts/freescale/imx95-verdin-wifi-yavia.dts |   21 +
 .../boot/dts/freescale/imx95-verdin-wifi.dtsi      |   50 +
 .../boot/dts/freescale/imx95-verdin-yavia.dtsi     |  217 ++++
 arch/arm64/boot/dts/freescale/imx95-verdin.dtsi    | 1162 ++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi           |  109 +-
 arch/arm64/boot/dts/freescale/imx952-evk.dts       |  273 +++++
 arch/arm64/boot/dts/freescale/imx952.dtsi          |  232 +++-
 arch/arm64/boot/dts/freescale/mba8mx.dtsi          |    4 +-
 arch/arm64/boot/dts/freescale/s32n79-rdb.dts       |   70 ++
 arch/arm64/boot/dts/freescale/s32n79.dtsi          |  362 ++++++
 124 files changed, 16770 insertions(+), 1337 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-hummingboard-ripple.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-iv-306-d.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-mini-111.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-legacy.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-brcm-legacy.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-bt-iw61x.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-solidsense-n8-compact.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-ab2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-a.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-b.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93w-evk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93w.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-dahlia.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-dev.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-ivy.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-mallow.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-ivy.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-mallow.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahlia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-wifi-ivy.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-wifi-mallow.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-wifi.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-yavia.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/s32n79-rdb.dts
 create mode 100644 arch/arm64/boot/dts/freescale/s32n79.dtsi
