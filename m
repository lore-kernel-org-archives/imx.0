Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010051.outbound.protection.outlook.com [52.101.69.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDEA36F909
	for <imx@lists.linux.dev>; Thu,  4 Jun 2026 17:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780592565; cv=fail; b=E141U0U0NoBcf6z9h6zSNXdsEzU0Kt70Iq+pvoTromVrDwMnFEcDheiLNxE/Yuw5HRnMj6EcC9eFbUr/sqCEE+r2QJR4ZpjrMm3d1ms71GPMgQ8lQlkE4VgXSqLjruEYGLYRs0rK21wfS3JHylkJutb6XT82aZu7M637nq3DB9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780592565; c=relaxed/simple;
	bh=hKcyb4Dt1a7iwu7shX5Z1Mr5WYqU+fwW2XQzeA0FCmY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=eW1uCLEvhuQGosb8HhCOs4V9x2hY8ZbPu8r/1Dztw731QYCB2dy4fAodDElULK21xkJRcNQDuBe2Yb+IN0DWLoUzLch3yFwuxgeLrNvu5yi5yAzvSuRFXvuesv5zPei6rKAlzVStYdqpzBwygZ04CBRLpyrSLInUVa+yHn69Zlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SmCPiGSe; arc=fail smtp.client-ip=52.101.69.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SmCPiGSe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDscSreIhdxRu8B6t5VlOqj+D6qZCSg2845MWyiPYUo2VIScCqjor+otgYMT4zwe6d7muDk4TMV3NcX5Ro6SsEdZEa1p5ihe8N1qfxmLwEhuVE0ToMPbwpQPu4b9xCgxoerwb7oJy5fDFL9gnnVTYixzSCnucvdKnp3SRVgW+kS2gTRP48aXX623oZiz4K347ecoKPEpqASbLargmn9vIDedM+qpRH2DQg5mTuf7uob9BHA7jD31IKzw5QG+CAxYZXHiTsnluCig6DsMRjJDAokQdV9E52aKwkuJpBhwbIglioE1XsJzHBa5sW0JaN78n8hn1+X3G5BN1Cko23j2NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83kNtpQCvgEEFU5CEHcKi9fKtzhKxwTAuCFD3ytEj6Y=;
 b=WFR8azg9gh4OcwOt6mit/P+vVaQUbzBxuRvbTLoQuQhDy9MK7f9bEQcPcjacMiQdnhLq95tEimA/OsWVgxA8E9PRwpwaYSoxPa1/Q0dTYEepUqItVPQptHkNLPS4B+q5i5lZRHa1KW54HB7lPTe0sgVEBOi7ckxlYAToOsn+dPjUEkkgeUuiuc04016mTmML5GofMP+RGR1z4ntjAMm3dbmbV5lqyvJ+LSGVLXn4RCEB9xsCkJ9eNXdE2BlWWugxNwuXUFClOghcaicO4NQiy4RUFYL77jZoIo6BROv8HzMMjKLAogg6hJtMw6SuCfQuEVMrGH/oTvO6qM4NzOjk/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83kNtpQCvgEEFU5CEHcKi9fKtzhKxwTAuCFD3ytEj6Y=;
 b=SmCPiGSefR2LXjEzxNha3J9/X86VFXxkJcVDEYdK3A0hZKAJVmhWctWPdxCOGq6LegEigqm5RSiM0xjhvD85jo6livaAYdIRalIYnznoxhMGD5daCSKEWq8/QsSlkjK3V3kEBgkeWV/3QGsL7nBQsyj1RoEXu3M0xGBgRn/NOTE+J9BNnVZyeQSaYUmM+c4QUxNAqmsIDdeVGr9VLkW4qFbx67K9D649CS6XKPj0iP97O1beTk1S32tpElwygAEMWg9aFyYZLY3sVLoS4KRjPV4gTDkL5Mfjl/yikwS4o603YYXmbcrZjMvANmzK2pGRUE+fg14EMYPRVyXHgpRpUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8088.eurprd04.prod.outlook.com (2603:10a6:20b:3f7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 17:02:41 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 17:02:40 +0000
From: Frank.Li@oss.nxp.com
To: soc@kernel.org,
	arm@kernel.org
Cc: Frank.Li@nxp.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX ARM device tree changes for v7.2
Date: Thu,  4 Jun 2026 13:02:32 -0400
Message-ID: <20260604170234.1660270-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR07CA0026.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8088:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c261976-89f4-400e-43f3-08dec25b1661
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|6133799003|3023799007|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	3Jf3gUI7ipxHUwAiAGATL6yIgkH4zizgbcQ8oYerLdwai3Cz/A0pNCLE6eEPgUrSAt8SamYzWXOnW6VObVytWx8m02HdXSpmpt7+MzdR6DepwdrPMVbjqoh+aAmy5j/VVceFkFXyRiGRDPMg3XZLJ2Q+1S2vCnujhXlrJWF/oVn8YnErrFYGouCEvmqhD/ovjgzK5FanBNc/4NZcukCOc1HqGQbFAci1vthSDlQBcBxIlL4Kz1EZKSIyxQlHRqgW38MZ2qM7gqIYWp5B/xVvSv2Sv+Zwnz1tchMjEtPdBE3G1CV9FQl2554UWFz0pNbQVH+T6a1JT1+Jc3K9RInECwEAzrXNudo3XstwuAdnY36iHwX0+KsAZJ5zP+s8yaJ3z7nduG4b6+eHwemTJfzqnekmjlO66sb/oqrPy8MH45lx8pU8vLEJfMcf0H2nJc1iZcs+CVwZkvN0yF4Tf26z/i0BSPcCRePjohpi+EQowlq6hYsKAKxSnpuk9fD3lwek22GdVa8+e8rMg3Hw7Lo0KL5JeMtdC2LuHInq4lKfl0w6F72G5Z8berhI4UAfnvhT3hnU7o7O4UDd//3sgDXobzz4/HOlPzU6DVdfsw5qmwc/Jthbj5FMRFOzBBWjQVII4efQOI3AUM7KTqQ0uzlP4moMKMxpR01sBaJr6o3w36GGR2s861bXtFwu+VNjAO7l
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(6133799003)(3023799007)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3KC3F2Ig7TyJwmySUSLU34GD6fPUYWLuOBz5DazUjy+YnwtuManDHiavuWwL?=
 =?us-ascii?Q?AYNCacv+Fgc0jSgGbMVKENtD833l8lL78SJYG5OLcXhpmBFbv0L96LuowWYH?=
 =?us-ascii?Q?S8f40v9eTVP03mrakbMwhc7g7n0VYc7fQLG/HIbI595sSCmyzphosz89fjtK?=
 =?us-ascii?Q?yuUEqJZh46FUTQaf7oWu/pWqO8dlrSDubHPUOBkRRpLzmjCLzzKZ0bdEYNhW?=
 =?us-ascii?Q?Z4uTBS8ncFLQeWPD8k5MRbmH3hrPIFZ7CE+CSPufUnbTYseAim9609+QOb5u?=
 =?us-ascii?Q?VhOJfcAQgETOTlzkhpzyKRjcOD0zY5nz4T24BbMqh52HZSxywP7dR8AIbNZI?=
 =?us-ascii?Q?vzT+4kinZk1Y/s2Bp3Amn6jsIvxtzn4bqbJMU1RDyPxl1c3ZLhelBY0c2bfg?=
 =?us-ascii?Q?1Ry/VUy25NELlkUlIBEW977bUBCUXkV97FePf29xm3zXtsrjIV0gdX5TMtkI?=
 =?us-ascii?Q?N2/11SF384OrlpuXeYh9JCej1LRUgW1JmfgeMGl19wGlkbwt2+JXGJp5Ian+?=
 =?us-ascii?Q?JjlshkRX383BOFHZ8teWHWY5Owgag0zhJ83KAUdL3mbBy0Vhw1MiXoSQvQCU?=
 =?us-ascii?Q?e+zHG5t4FAz9MGrUyQu43AaukHvrq9O2mj5asCoTbcRI19P5D2e/ivOhC9b7?=
 =?us-ascii?Q?1XNFS88szk8giU2ksuEMj7mFoH7rT3Hue86A8StQN7A3/oX5fMvQNoUnl2Qx?=
 =?us-ascii?Q?CoOlJO8TW2dh116NjvjdUjyWiyuyo5xUSS+K4lvAFOlKold9sDo5ZnipvrhC?=
 =?us-ascii?Q?RW0K6gNG/pqh99b33RIRd3QLZq+n3jxdoyu08+5ffoGjxtQ36TLfy7jeO3Hw?=
 =?us-ascii?Q?rOY+1tvNDCp1wlmdnGcHInuWc2dDp52ADIq3iIx6Nc/m0sR/YNdxs87iIaM4?=
 =?us-ascii?Q?bnLUw+3g5WiX/t9B9l2nCbKMA67fAkKvyj6jdb5qXXwoEGqP/t7HkdlQsvzH?=
 =?us-ascii?Q?3qUmowyM8fy0XL0bLsV0LouiTsIqXwduOoVb7az4UHnekEXqoIt4bpWWqxJN?=
 =?us-ascii?Q?qSYTVgA6lRqFKH2AZk9y23bh/MkjEZTENlIMc73O3uKKJfmasDkLn7lgGIy4?=
 =?us-ascii?Q?x8zt/FHQGh9h1/ZN78zBy6FOdbIQVqbGdcM+ZNjhq/FXoq/rnrAZRMWV1AMc?=
 =?us-ascii?Q?hHOa5a5pBLU9PXBxAFCqobvIV/y2sJU4FK5kmyAodK6PmlHecntC99CZJ5Do?=
 =?us-ascii?Q?VeFNrORS5gPIjOM41Xfm04goJtgx5+bTr6HoruIskAjvGlv2TZbViP/AaOTa?=
 =?us-ascii?Q?7M2EmEcSPDCogGZvmI9IdBLlfJoJ/cyfZOMkMW+7BgdGbLScF4SbEZ5UlOtM?=
 =?us-ascii?Q?n2iIgS1aHRm7Z66U+8h14EaEqPA3fZBpk6vsW8Ktu10M6wKOK1Z+k9xdAVm2?=
 =?us-ascii?Q?rkUFJIJORCkw1QGkTpAFiydztxPviu+wvZ4FQxcXCKFt60AqUikawDkC/aKb?=
 =?us-ascii?Q?pA1CWyENit69NlzJnOQAGYXLOaOiaFKudD7JK+sTrLoK4bH45abEpa+ACXsJ?=
 =?us-ascii?Q?RXaDi6u35VykorKzdVGr6QoQIQe6LgkDaEw/jgxSHWSSdHVR0qTN5AFGVpRg?=
 =?us-ascii?Q?C+1s7oUR/DWFB4LpfuHWiNoTcIdrdW6Y2VaoVV7ZIh3bopnZaHZdxR9GCDjf?=
 =?us-ascii?Q?9KoyaKJaszNfPoto9NX3CmNaeQbX9tvGj75MCwnBB0n2Lla1Dtew2EeJ+oyz?=
 =?us-ascii?Q?W+Vkmh16S9f2QixehqnuTvDkLwt/XJa13MaMfpOhILaRvveI6E3KxfCdHpIB?=
 =?us-ascii?Q?CTyYbNNP0tgzlACHrYrVNPZe6pjM+Gs=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c261976-89f4-400e-43f3-08dec25b1661
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 17:02:40.8848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LzMCKC7Ql0CR/27qvlKX7+cqMdoATuAP8oL6jqEdWvROSYDOvJlpj5IIGuE3nHzh3Xsqu85h38rVl0jQyRuEPHS9UYmCdugm9aAUIYv+zCbMTSTT1u6Shc8Ho9qYR2kV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8088

From: Frank.Li@nxp.com

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-dt-7.2

for you to fetch changes up to 8772e1f64c7d69986821d71d8e58fd10594c9aa1:

  dt-bindings: soc: imx: Add fsl,aipi-bus and fsl,emi-bus (2026-06-04 12:47:24 -0400)

----------------------------------------------------------------
i.MX ARM device tree changes for 7.2:

DT Binding Cleanup:
- Replaced undocumented compatible strings with proper ones:
  * edt,edt-ft5x06 -> edt,edt-ft5206
  * marvell,88E1510 -> ethernet-phy-ieee802.3-c22
  * karo,imx6qdl-tx6-sgtl5000 -> simple-audio-card
- Fixed incorrect VAR-SOM-MX6UL references (corrected to VAR-SOM-MX6)
- Added missing required properties:
  * #phy-cells for usb-nop-xceiv
  * #io-channel-cells to ADC nodes
  * bus-type for ov5642/ov5640 cameras
  * ti,deskew = <0> for ti,tfp410
- Added missing supply properties (power-supply, vdd-supply, dvdd-supply, avdd-supply)
- Removed redundant/empty properties (bus-width for video-mux, empty clock-names)
- Fixed boolean property warnings and non-existent property references
- Converted TS-4800 watchdog to DT schema
- Renamed wdt nodes to watchdog for consistency

New Features Added:
- PCIe Root Port nodes and PERST property for imx6qdl, imx6sx, and imx7d
- OV5645 camera support for imx7d-pico-pi
- LVDS display panel support for imx6ul-var-som
- WiFi and Bluetooth support for VAR-SOM boards
- nvmem-layout support for imx7
- New bus bindings: fsl,aipi-bus and fsl,emi-bus
- New board binding: variscite,var-som-imx6ull

Code Refactoring:
- VAR-SOM-MX6UL/ULL: factored out common parts for CPU variants
- Separated audio, ethernet (ENET1/ENET2), and SD card support into reusable components

----------------------------------------------------------------
Alexander Feilke (1):
      ARM: dts: imx7: add nvmem-layout

Alice Guo (1):
      ARM: dts: freescale: add bootph-all to i.MX7ULP watchdog nodes

Eduard Bostina (2):
      dt-bindings: watchdog: Convert TS-4800 to DT schema
      ARM: dts: nxp: imx51-ts4800: Rename wdt node to watchdog

Frank Li (12):
      ARM: dts: imx35: remove empty clock-names for nand-controller@bb000000
      ARM: dts: imx25: remove empty clock-names for nand-controller@bb000000
      ARM: dts: imx: add ti,deskew = <0> for ti,tfp410
      ARM: dts: imx53-qsb: add dvdd and avdd supply for panel sii,43wvf1g
      ARM: dts: imx53-ppd: add '#phy-cells' for usb-nop-xceiv
      ARM: dts: imx: add (power|vdd)-supply for related node
      ARM: dts: imx: remove redundant bus-width for video-mux
      ARM: dts: imx: Add bus-type for ov5642/ov5640
      ARM: dts: imx6qdl-tx6: remove undocumented karo,imx6qdl-tx6-sgtl5000 and keep only simple-audio-card
      ARM: dts: imx: replace undocumented compatible string edt,edt-ft5x06 with edt,edt-ft5206
      ARM: dts: imx6-display5: replace marvell,88E1510 with ethernet-phy-ieee802.3-c22
      dt-bindings: soc: imx: Add fsl,aipi-bus and fsl,emi-bus

Hugo Villeneuve (14):
      ARM: dts: imx6ul-var-som: fix warning for non-existent dc-supply property
      ARM: dts: imx6ul-var-som: fix warning for boolean property with a value
      ARM: dts: imx6ul-var-som: change incorrect VAR-SOM-MX6UL references
      dt-bindings: arm: fsl: change incorrect VAR-SOM-MX6UL references
      dt-bindings: arm: fsl: add variscite,var-som-imx6ull
      ARM: dts: imx6ul-var-som: Factor out common parts for all CPU variants
      ARM: dts: imx6ul-var-som-concerto: Factor out common parts for all CPU variants
      ARM: dts: imx6ul-var-som-concerto: order DT properties
      ARM: dts: imx6ul-var-som: factor out SD card support
      ARM: dts: imx6ul-var-som: add proper Wifi and Bluetooth support
      ARM: dts: imx6ul-var-som: factor out ENET2 ethernet support
      ARM: dts: imx6ul-var-som: add support for EC configuration option (ENET1)
      ARM: dts: imx6ul-var-som: factor out audio support
      ARM: dts: imx6ul-var-som: add support for LVDS display panel

Lech Perczak (1):
      ARM: dts: imx7d-pico-pi: add OV5645 camera support

Markus Niebel (1):
      ARM: dts: imx6ul: add #io-channel-cells to ADC

Sherry Sun (3):
      ARM: dts: imx6qdl: Add Root Port node and PERST property
      ARM: dts: imx6sx: Add Root Port node and PERST property
      ARM: dts: imx7d: Add Root Port node and PERST property

 Documentation/devicetree/bindings/arm/fsl.yaml     |   8 +-
 .../devicetree/bindings/bus/fsl,spba-bus.yaml      |   4 +
 .../bindings/watchdog/technologic,ts4800-wdt.yaml  |  40 +++
 .../devicetree/bindings/watchdog/ts4800-wdt.txt    |  25 --
 arch/arm/boot/dts/nxp/imx/Makefile                 |   3 +
 arch/arm/boot/dts/nxp/imx/imx25.dtsi               |   1 -
 arch/arm/boot/dts/nxp/imx/imx35.dtsi               |   1 -
 arch/arm/boot/dts/nxp/imx/imx51-babbage.dts        |   1 +
 arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts         |   2 +-
 arch/arm/boot/dts/nxp/imx/imx53-cx9020.dts         |   1 +
 arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts       |  11 +-
 arch/arm/boot/dts/nxp/imx/imx53-ppd.dts            |   2 +
 arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi    |  10 +
 .../boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4.dtsi |   1 +
 arch/arm/boot/dts/nxp/imx/imx53-sk-imx53.dts       |   7 +
 arch/arm/boot/dts/nxp/imx/imx53-smd.dts            |   2 +
 arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dts      |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dts        |   2 -
 arch/arm/boot/dts/nxp/imx/imx6dl-gw53xx.dts        |   2 -
 arch/arm/boot/dts/nxp/imx/imx6dl-gw54xx.dts        |   2 -
 arch/arm/boot/dts/nxp/imx/imx6q-display5.dtsi      |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dts         |   2 -
 arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dts         |   2 -
 arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dts         |   4 -
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dts         |   1 +
 arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts    |  18 +-
 .../boot/dts/nxp/imx/imx6q-var-dt6customboard.dts  |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi      |   2 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi      |   2 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi      |   2 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi   |   2 +-
 .../boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi    |   2 +-
 .../boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi   |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6x.dtsi  |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi        |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi   |   2 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi     |   5 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi         |   5 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi             |  11 +
 arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts     |   5 +
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi          |   5 +
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi              |  11 +
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi    |   1 +
 arch/arm/boot/dts/nxp/imx/imx6ul-pico-hobbit.dts   |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-pico-pi.dts       |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi        |   2 +-
 .../arm/boot/dts/nxp/imx/imx6ul-var-som-audio.dtsi |  30 ++
 .../boot/dts/nxp/imx/imx6ul-var-som-common.dtsi    | 187 ++++++++++++
 .../nxp/imx/imx6ul-var-som-concerto-common.dtsi    | 215 ++++++++++++++
 .../dts/nxp/imx/imx6ul-var-som-concerto-full.dts   |  22 ++
 .../boot/dts/nxp/imx/imx6ul-var-som-concerto.dts   | 318 +--------------------
 .../arm/boot/dts/nxp/imx/imx6ul-var-som-enet1.dtsi |  44 +++
 .../arm/boot/dts/nxp/imx/imx6ul-var-som-enet2.dtsi |  79 +++++
 .../dts/nxp/imx/imx6ul-var-som-lvds-panel.dtsi     | 112 ++++++++
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi   |  27 ++
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi |  75 +++++
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi      | 215 +-------------
 arch/arm/boot/dts/nxp/imx/imx6ul.dtsi              |   1 +
 .../dts/nxp/imx/imx6ull-var-som-concerto-full.dts  |  22 ++
 .../boot/dts/nxp/imx/imx6ull-var-som-concerto.dts  |  21 ++
 arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi     |  36 +++
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi          |  10 +
 arch/arm/boot/dts/nxp/imx/imx7d-pico-dwarf.dts     |   2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts        |  68 ++++-
 arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts            |   5 +
 arch/arm/boot/dts/nxp/imx/imx7d.dtsi               |  11 +
 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi             |  12 +
 67 files changed, 1143 insertions(+), 594 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-audio.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet1.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet2.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-lvds-panel.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi
