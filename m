Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011050.outbound.protection.outlook.com [52.101.70.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA9B26B75B
	for <imx@lists.linux.dev>; Mon,  6 Apr 2026 02:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775441340; cv=fail; b=I9mAid0ZaxkuMZXFAjOI5jfR5OJBqYn8QgLYnFbav/g6PlCvWW8+Wznc2OMzBBhOAj8hUDJtziWe8weLwFU45o67fOllzk1JqJgyOYp8V2/ZhrAOjcqaFFdZ5tUCMcK2HvV95kiODgT3GtUQuhsgKuZNmWeMSxnI5r77zMFUwio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775441340; c=relaxed/simple;
	bh=JtkpiTlg80JPh3ZQF+7/0Ps0lOUVmJLUj2U/LMgilq8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OIldZ8RVqLjtjES9lmNk43xuea39O79Ak52oSgnseLm9VCO9QsK9gQV3CZTn0dFyGRjBJj/VzyLg5H5qAgxLDLqq33L2SJuwFViHQKmTYUJD9PwtRXWe8X0xnXHj8uF7m3KoTWYeeaK8R7+LjZghKfW50Mkyt/SzpuV3G2co6wc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=X3anRmUf; arc=fail smtp.client-ip=52.101.70.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="X3anRmUf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bxTNEW71LaNPQujLzPNmCGsLcQksly0f1V1z7otRqN76XdbHjVnlsaajpQBZ2KkbWK9dES3mtXUzgG5yWDXErIlK0QhzVZ0pX/1YWyEifbfH1aW4+xSE4W1Z8iuvCFpdxpkJlOHuG8II/Vp+IB+bDHDAeMTgyZqb9e5lON5IcxAFhd7PtFFF3XZfTk3xe3CO65FnXSIlahhtpKaWGYCZ/CdXoPM6e94MYMIgvjfjy26l9zozMnMCyEgb7Xy5lPI1CuOQHbnx8L4iRmjOFlxudeCHGSzVyEnOjPDh4lCVzBVvh3l83RCZa6Plpu3OkNW0EtgEJBNV5i6BE10UVQjMtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjJ5XyHjpdgzIr2NmwSxYGuuYJdMzb2UNu6A8GBnjDo=;
 b=T6cOTuHFn7OLdFfs2tU+80kus3bCV6/xBn5BaBbydxN7fc0dQ2MaOcaytji502SwRmUDllweMXk3YLLWf0Nk0q7wDmeOhWI3OOhbS86qxyahQbXC4M8Z3qQ/H1Cnjf0Amjl0z+2rGQUNVFV5mHU50e2gWHNCrdnulyun1uYUWxLSMNpEt27VAfzhZlFGhm4GSppNcJCmr1//XnIdvn/So/og+jhSv76UaloHeHBQVggttKC9h3DfAP6NP4uFyTZ9D5T+UXt/zZWLFqkK7oyqTxWNhIxXLk4vuD3yDBrrV6PeMUsy0SR2SF3iAWwhgzOAytghDoMCVAgrb5KHrkjYSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjJ5XyHjpdgzIr2NmwSxYGuuYJdMzb2UNu6A8GBnjDo=;
 b=X3anRmUfCp5t76y5krPF0bxQ8asyQLmIze8/kb4SFOHANzMDoR7qIKQF5o9ScqSJvvTHbXy36AubXMO6W1unY9ub7UrFf+CeooowshPah6FKUarSd5U0aQ1LMNsvk8jL2+jTqQsPKit28jjUkqIEY/G4Y41UxAEdcv2bjVjt5DXBDtpbVPdtH0/tNlpGhKaB/bxb7eforZ+f/uHfO8bDj7ABr4JF6pHSIRlcke2g2QKFU6HPaNDydcREdIe64Y6tWeIe61feau3LBGJwYnul1iXWYpQRbZ8KeZrLODU4l1mcI5ON3Nc+4ycLPWqwUXrzGrzmivX/UBefmqUnpjqJ0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9518.eurprd04.prod.outlook.com (2603:10a6:102:22d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 6 Apr
 2026 02:08:55 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Mon, 6 Apr 2026
 02:08:55 +0000
From: Frank Li <Frank.Li@nxp.com>
To: soc@kernel.org,
	arm@kernel.org
Cc: Frank.Li@nxp.com,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX arm dts changes for v7.1 (V2)
Date: Sun,  5 Apr 2026 22:08:08 -0400
Message-ID: <20260406020819.2812877-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:806:21::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9518:EE_
X-MS-Office365-Filtering-Correlation-Id: 74b0e7d8-ecc3-4344-1a63-08de93817496
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|52116014|366016|1800799024|56012099003|38350700014|18002099003;
X-Microsoft-Antispam-Message-Info:
	vaE7KiMjVHeZM/YMCJOZzFsNQYDJlmjhDs/YQBY0oOjR/eGH/F+ImN4DAjak9SXcPcA7xIqXkkElTjw2VVzMXjGesOoSS5q4h+dTxmPSZEylPx8BNqDxxcefM8CDJWjgVRU4O99dAvNMAI9I2ihyTEmWnWk9ciJoWkZFQ0jpNH4vsRoo3SnVwJsSBAs9XHAbZJouy46qTcMW6QRlbnK8WrzSWBA3DIFWL1zaAi+m7m172rW5QqaAeTiuoOU9tHbzTVIbupyEooeJr2TVL6N+fGvBllzjEVXb9S4gp+ZCDJo2WB/oQFux/SOE6XeYN7QAt8639l5ueEipBYIUn8Bt57sjC0vNFh/vTDBTM60JGmOlEGxgJosk3kEucIPEHHsIHCAdycPug6JhKBayJ7p0VKP3pyQ7pxDuwdQLszDupjrdviqkVY+74u8Tg7zR5bhyEePj91+BiKRcsqty3eQGlDMTN5fLA7QAc/Rt9uSmDlzBYSsder65ycZBlEVEmwg8c2224hzdqSuLll1XF+xPF5ug2+d9HlHmdhRh5yy0HEOxu6JAK6AiY0KssQHt3/7Bm0qGDKIeTlgV2MUAtkNlOjBSW2PACeeG0x+a31HGA37+My8OoGzeVdrAuyhUyscYxqJu+aImYquHraRdzB637JlzVNZGQMbLiRMi/B54HzBFg8iPVXbnhXdu7G+5b7L0FPcSB4+lMRjbGlnvRsjCobftrYFFEEa47nnnb2xVYvaNgARd6OI3mLXTOhAGKU/3+2l0x3DXs+uAZA9N2/f0ZqxDj9FT50tEhJ9CfIIqbgA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(366016)(1800799024)(56012099003)(38350700014)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3RCWUlTdVcyTS9BNGkrbUZiaVZ1ZHdQeHppQjJtVkFWaVpwMThQLzlkM0FM?=
 =?utf-8?B?SHhib2hqS0U1L05NelFsaGh0Q3F6NGl0aUJuMFh5Wk1UaWZhQjlVa0VnMW9h?=
 =?utf-8?B?bmQvMEJjSEk0ek9hc2NTaXQrbERwNXNJcitjZjZTYlJidmNqY25MUERxcHN4?=
 =?utf-8?B?U0svWDRFSmdCcDA0Um9XNE9YYzRwbzBlQ1NTdlQ4YTVyZ2pTaVUrazhmM01X?=
 =?utf-8?B?Q0wvbFdtRnRQZ0Rnbmw2OXJtWlBKclV6bzEySTJBdFNVT3c2Yk1vbW5VcWxi?=
 =?utf-8?B?Z04vQ3RhWVkzYUF2bTRpNEdCUGltSXR5ajBGZE15bWR0WHhkQ0htck9ZSGph?=
 =?utf-8?B?MHVObnFhTDU1OENuWklQWktPM0hEc2JybnRkcDVmWUp1MVptRG5NOWNXWFNI?=
 =?utf-8?B?V0xWakF1Z3JBVC9YTzFVN3BCYTNvSEo3bWhseVhFcTNmZXJ0TFBhZENKcGFk?=
 =?utf-8?B?OU1NTEV5MFh2NVRaUE9aa2J5WXJTdkpPOVEwd0Q3Q2Qrc3pxN080S3pkcUZN?=
 =?utf-8?B?U2NDT2dHdlhvYUMweUlVNlFPalFxQXF0ak1hcVM5TFl4L2l6cGJHNzFyOHZ2?=
 =?utf-8?B?cXp6anU1bGNBY3hwcXUyQVdSQnFyWFAyZmpYUlh1ZDZuWW9neWZwL3V0THlx?=
 =?utf-8?B?NnNvQXQwZTRRMVFkWlN4eE9iSmtXT29kandOM1I4MVJRVWR6RFlEVEVKeERZ?=
 =?utf-8?B?bFVNQ2FtQmR5TzRIbWNTanpTdDdEa3lEaEJ5RXJrY3VKOVlCTy9YNlA5TThO?=
 =?utf-8?B?b2FRSHRsakRKL1hGOWs1WlZqV2dVWVZUVXdPZG9TaVo4T0pvNFl1c01rRTEx?=
 =?utf-8?B?Sk41dE0wTENEZDdBazRHWjNyN0hTTy9wUTd3cjcvWGd0VDgvdWd4K0FCMks1?=
 =?utf-8?B?bHpFV29VLzQ1bGtKOWtFWjVLRjlKdXdkeDdKSnNiOWRJa0lNQ2g2aDllTEFt?=
 =?utf-8?B?eFRBWEpjU1NmNTN4cUl6WDAwTndtVFVkdFJPRkNkVmpDa1RFOVdidW8rNlVK?=
 =?utf-8?B?RW5zWkhjeTNmL3FWd3k4b2NnL1dXdDROdkhXdzRINEkvUGJKbVF1Vkt3dERh?=
 =?utf-8?B?RFdOdlpPK0FpTmJNNW9TQXF0clVvcmZhbzVSTUQ3enQ2RERnVEIrK1VGM1hO?=
 =?utf-8?B?ZXhpNmU5NXlEbWMrYVV4OURQcjMxQnhJTnpGMHRlVXJtc3dzUDNCb0pLSG9z?=
 =?utf-8?B?TzZwN1RNS0VmTGJtdUorY0pKRHQyakVTMTd5dVlpanIxdEltZTFxVUgzVHQ0?=
 =?utf-8?B?eDRMWHNWWEdDNnozYW9SSnl5d3FiNll6aVFrMDFiNWRCdmtobkJOeHJDVGVN?=
 =?utf-8?B?YnNmQnB4UHlaSVlmcFloNlJLQTk2cTlXKzFqcVU1bmpuZTBTZU15Q3lOTm9q?=
 =?utf-8?B?VmNISDJDR3ZPL3MxUFBwSXkvZWNXVE52bmpYcncyVFBFKzM5U1hMK0hDMXcz?=
 =?utf-8?B?cW1yYkZLWVg1d0gzOWQ5VnJEYVZqN2FncTFzQmFVK1Faa1huNFFHdldaYUgy?=
 =?utf-8?B?Mk5ySmJLc09qd1N3UHJoZGl5UTFrMHhQU2dFNjhzbDdiWWozQmlBbkJvVGtv?=
 =?utf-8?B?WE9VRWF5YlN3TXFXRUw1SFJHcW5QZzByZGtCNjZGZ1lZM0pYZVZuaUFueG1S?=
 =?utf-8?B?VUxPRGxNWnJBWEYyTUdMWm9pc2l6VGVJMk1sa3R2dGxla1RMS2w4cmIzRGNq?=
 =?utf-8?B?c1ljMTZZVzBLWllVbzdJV1BJYmtkODJYZEtPSkc5WGFaanlEcTNicWpGRTJP?=
 =?utf-8?B?aSs2b2NMa1REQUVadDk0MHBQd1hJbEVtMUpsRUh4SnFTYURSeEFzc0dIVDZO?=
 =?utf-8?B?UmIvczJwQWRYNUdhZU8zYzlySlhYS09kM1VWK0x2NXk2bUs3SnVKMVVrcTZl?=
 =?utf-8?B?V1E5anlMMy9WYWQ5dEU5bGFsQ2dyaXdrQ3YvRjR4QVk5M01tUFkxQzNiNzFj?=
 =?utf-8?B?WWtwTm5oUHQrT0hIKzRwUVh4ZjFlbVhIV1c5WGtydEFzdkNiNUUzM3prVzV2?=
 =?utf-8?B?cUJGSy84Mmx0eUtMc0JIZjFnN3NTMWdTQkRUNGxqOVJmZjRhYmxGd0hpTVR4?=
 =?utf-8?B?dGNGelB6cTZvR0NobFNGcmp4SmtlOE1leVJ1NFNVMFpzWnV4MEU4UUh3WDdv?=
 =?utf-8?B?NzZFZ2FnOW0xL05TZ1ovSFA2eUJ4ZHFsSzlSYlpDc2lUY0xUUngyRzZHSUxX?=
 =?utf-8?B?NndPUm1GNWFqazllWWpDaTQ2YkVCYXhhbUIyL3I3bXZaWmJxUVU3NUJBa3VO?=
 =?utf-8?B?dlFZQys3MDdvZkZ3SEd0d0ZVUlNkbjdJWHo2N3BOVldhRGNLM2p0YlE0UDdQ?=
 =?utf-8?Q?1exIGsZoMp7druvZ2W?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74b0e7d8-ecc3-4344-1a63-08de93817496
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 02:08:55.1138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MowQ7P/+aPDsfB3CRA9Ilo4pfxeacGKJR75mKrMPLYo0oBailsJbZ8f/+7+fQe0xFKImNmVNv5D/zIp0Itjqig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9518

From: Frank.Li@nxp.com

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-dt-7.1

for you to fetch changes up to 0037d16644b15686eec420a90f05bcd2804edf6d:

  ARM: dts: imx: Add DT overlays for DH i.MX6 DHCOM SoM and boards (2026-04-05 21:35:41 -0400)

Changes in v2:
  drop patch: ARM: dts: imx53: drop fallback compatible "dlg,da9052"

----------------------------------------------------------------
i.MX ARM device tree changes for 7.1:

- Device Tree Schema Compliance Fixes

  Fixed numerous CHECK_DTBS warnings across multiple i.MX SoC families
  Renamed nodes to match schema requirements (tcq→touchscreen,
  uart8250→serial, iomuxc→pinmux, etc.). Fixed node naming conventions
  (added "led-" prefix, proper addressing formats).

  Corrected compatible strings and removed undocumented fallbacks. Added
  required properties (clocks, clock-names, power supplies,
  #sound-dai-cells).

- New Hardware Support

  Added DT overlays for various expansion modules (i.MX6 DHCOM PDK2,
  PicoITX display boards). Added support for muRata 1YN WiFi chip
  (replacement for 1DX) on i.MX6ULL DHCOR board.

  i.MX7ULP: Added CPU clock and OPP table support for frequency scaling.

- Boot Phase Properties
  Added bootph.yaml properties to multiple TQ-Systems boards and SoCs:
  imx7s, tqma7, mba7 imx6ul/ull, tqma6ul/ull, mba6ulx imx6qdl, tqma6, mba6.

- Bug Fixes & Corrections

  Fixed interrupt property usage (interrupts→interrupts-extended where
  needed). Corrected spelling ("TQ-Systems" with hyphen). Removed redundant
  intermediate nodes in pinmux hierarchy. Fixed clock references and
  naming.

----------------------------------------------------------------
Alexander Feilke (3):
      ARM: dts: imx7s: add boot phase properties
      ARM: dts: tqma7: add boot phase properties
      ARM: dts: imx7-mba7: Deassert BOOT_EN after boot

Dario Binacchi (1):
      ARM: dts: imx6ull-engicam-microgea-bmm: set touchscreen glitch threshold

Frank Li (23):
      ARM: dts: imx35: rename emi to emi-bus to fix CHECK_DTBS warning
      ARM: dts: imx35: rename i2c clock-names to ipg
      ARM: dts: imx35: remove simple-bus 'usbphy'
      ARM: dts: imx51-ts4800: rename fpga@0 to fpga@0,0
      ARM: dts: imx51-babbage: rename at45db321d@1 to flash@1
      ARM: dts: imx6qdl-sr-som-ti: use fixed-clock instead of clock-frequency
      ARM: dts: imx53-smd: Add power supply node for fsl,sgtl5000
      ARM: dts: imx7s-warp: Remove data-lanes and clock-lanes for ov2680
      ARM: dts: imx: rename iomuxc to pinmux
      ARM: dts: imx: remove redundant intermediate node in pinmux hierarchy
      ARM: dts: imx27-eukrea: replace interrupts with interrupts-extended
      ARM: dts: imx27-eukrea-cpuimx27: rename uart8250 to serial
      ARM: dts: imx27: remove fsl,imx-osc26m from fixed-clock node
      ARM: dts: imx23: fix interrupt names for dma-controller@80024000
      ARM: dts: imx23/28: add "led-" prefix to LED subnodes
      ARM: dts: imx28: rename gpios-reset to reset-gpios of hx8357
      ARM: dts: imx28-sps1: remove undocumented fallback compatible "mr25h256"
      ARM: dts: imx28-tx28: rename compatible to "edt,edt-ft5206"
      ARM: dts: imx28-tx28: remove undocumented aliases
      ARM: dts: imx6qdl: add label for system clocks
      ARM: dts: imx: add required clocks and clock-names for ccm
      ARM: dts: imx25: rename node name tcq to touchscreen
      ARM: dts: imx6sx: remove fallback compatible string fsl,imx28-lcdif

Ian Ray (5):
      ARM: dts: imx: bx50v3: Configure switch PHY max-speed to 100Mbps
      ARM: dts: imx: bx50v3: Configure phy-mode to eliminate a warning
      ARM: dts: imx: b850v3: Use alphabetical sorting
      ARM: dts: imx: b850v3: Define GPIO line names
      ARM: dts: imx: b850v3: Disable unused usdhc4

Marek Vasut (2):
      ARM: dts: imx6ull-dhcor: Handle both 1DX and 1YN WiFi on i.MX6ULL DHCOR
      ARM: dts: imx: Add DT overlays for DH i.MX6 DHCOM SoM and boards

Max Merchel (8):
      ARM: dts: imx6qdl-tqma6: add missing labels
      ARM: dts: imx6qdl: add boot phase properties
      ARM: dts: imx6qdl-tqma6: add boot phase properties
      ARM: dts: imx6qdl-mba6: add boot phase properties
      ARM: dts: imx6ul/imx6ull: add boot phase properties
      ARM: dts: imx6ul[l]-tqma6ul[l]: add boot phase properties
      ARM: dts: mba6ulx: add boot phase properties
      ARM: dts: tqma6ul[l]: correct spelling of TQ-Systems

Peng Fan (1):
      ARM: dts: imx7ulp: Add CPU clock and OPP table support

 arch/arm/boot/dts/nxp/imx/Makefile                 |  37 ++++
 arch/arm/boot/dts/nxp/imx/imx1-ads.dts             | 108 +++++----
 arch/arm/boot/dts/nxp/imx/imx1-apf9328.dts         |  92 ++++----
 arch/arm/boot/dts/nxp/imx/imx1.dtsi                |   2 +-
 .../boot/dts/nxp/imx/imx25-eukrea-cpuimx25.dtsi    |  38 ++--
 .../imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts  |   6 +-
 .../nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dts   | 134 ++++++-----
 arch/arm/boot/dts/nxp/imx/imx25-pdk.dts            | 190 ++++++++--------
 arch/arm/boot/dts/nxp/imx/imx25.dtsi               |   4 +-
 arch/arm/boot/dts/nxp/imx/imx27-apf27.dts          |  58 +++--
 arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dts       | 194 ++++++++--------
 .../boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi    | 244 ++++++++++-----------
 .../nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts   | 196 ++++++++---------
 arch/arm/boot/dts/nxp/imx/imx27-pdk.dts            | 132 ++++++-----
 .../dts/nxp/imx/imx27-phytec-phycard-s-rdk.dts     |  92 ++++----
 .../dts/nxp/imx/imx27-phytec-phycard-s-som.dtsi    | 174 ++++++++-------
 .../boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts  | 206 +++++++++--------
 .../boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi | 154 +++++++------
 arch/arm/boot/dts/nxp/imx/imx27.dtsi               |   4 +-
 arch/arm/boot/dts/nxp/imx/imx31.dtsi               |   2 +-
 arch/arm/boot/dts/nxp/imx/imx35.dtsi               |  30 +--
 arch/arm/boot/dts/nxp/imx/imx51-babbage.dts        |   2 +-
 arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts         |   2 +-
 arch/arm/boot/dts/nxp/imx/imx53-smd.dts            |  18 ++
 arch/arm/boot/dts/nxp/imx/imx6dl-alti6p.dts        |   4 +-
 .../boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts   |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-lanmcu.dts        |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-plybas.dts        |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts        |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts        |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi         |   5 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts        |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts         |   1 +
 arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts         |   1 +
 arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts         |  53 +++--
 arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi        |   4 +
 arch/arm/boot/dts/nxp/imx/imx6q-prtwd2.dts         |   4 +-
 ...mx6qdl-dhcom-overlay-panel-dpi-ch101olhlwh.dtsi |  75 +++++++
 .../nxp/imx/imx6qdl-dhcom-overlay-panel-dpi.dtsi   |  61 ++++++
 .../imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtso    |  28 +++
 ...dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtso |  26 +++
 .../imx6qdl-dhcom-pdk2-overlay-531-100-x21.dtso    |  32 +++
 .../imx6qdl-dhcom-pdk2-overlay-531-100-x22.dtso    |  32 +++
 .../imx6qdl-dhcom-pdk2-overlay-560-200-x12.dtso    |  39 ++++
 ...com-picoitx-overlay-626-100-x2-ch101olhlwh.dtso |   8 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-som.dtsi   |   6 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi        |  12 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi    |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-ti.dtsi   |   8 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi       |  11 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi      |   5 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi      |   6 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi             |  24 +-
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi              |   4 +-
 .../boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi    |  10 +
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2.dtsi     |   1 +
 .../boot/dts/nxp/imx/imx6ul-tqma6ul2l-mba6ulx.dts  |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l.dtsi    |   1 +
 .../boot/dts/nxp/imx/imx6ul-tqma6ulx-common.dtsi   |   1 +
 .../boot/dts/nxp/imx/imx6ul-tqma6ulxl-common.dtsi  |   1 +
 arch/arm/boot/dts/nxp/imx/imx6ul.dtsi              |   7 +
 arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi   |   4 +-
 .../dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts   |   1 +
 arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2.dtsi   |   1 +
 .../dts/nxp/imx/imx6ull-tqma6ull2l-mba6ulx.dts     |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi  |   3 +-
 arch/arm/boot/dts/nxp/imx/imx6ull.dtsi             |   1 +
 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi           |  13 ++
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi          |   5 +
 arch/arm/boot/dts/nxp/imx/imx7s-warp.dts           |   2 -
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi               |   5 +
 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi             |  28 +++
 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi             |   6 +
 arch/arm/boot/dts/nxp/mxs/imx23-olinuxino.dts      |   2 +-
 arch/arm/boot/dts/nxp/mxs/imx23.dtsi               |   6 +-
 arch/arm/boot/dts/nxp/mxs/imx28-apf28dev.dts       |   2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-apx4devkit.dts     |   2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts       |   2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10049.dts       |   2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10055.dts       |   2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10056.dts       |   2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-duckbill-2-485.dts |   4 +-
 .../boot/dts/nxp/mxs/imx28-duckbill-2-enocean.dts  |   6 +-
 arch/arm/boot/dts/nxp/mxs/imx28-duckbill-2.dts     |   4 +-
 arch/arm/boot/dts/nxp/mxs/imx28-duckbill.dts       |   4 +-
 arch/arm/boot/dts/nxp/mxs/imx28-evk.dts            |   2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dts         |   4 +-
 arch/arm/boot/dts/nxp/mxs/imx28-sps1.dts           |   2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts           |   9 +-
 89 files changed, 1607 insertions(+), 1140 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-overlay-panel-dpi-ch101olhlwh.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-overlay-panel-dpi.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-531-100-x21.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-531-100-x22.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-560-200-x12.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtso
