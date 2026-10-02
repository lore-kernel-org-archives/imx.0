Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013009.outbound.protection.outlook.com [52.101.83.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FD22D9797
	for <imx@lists.linux.dev>; Fri,  2 Oct 2026 14:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790951349; cv=fail; b=C+bsHNBk0uSR8BoplpnxCJ/Cgc4Pe/bCY+VP+7mwE0OFfIakV+BPZcEkv4kkthkosZaCb0k8W30cfZK1YWukOze7LAGOQ9ja9mwI61jVsWsO7Su68xL6hXpJLeRUVHJXVBiwzcTooTblSaxPBwe2KrY835oraCYtU1wT2TwL1Ic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790951349; c=relaxed/simple;
	bh=8ZOgNRgENpAd+1CqdPpFI3VOZG5NuEgRz5i/B/ld9X8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=k/Wxq6DjJc342t5Rv5NPsyUOyKnAnXCdkbfCHXZds9Mnumtka+SskfdYljRjJpGOEzb9basTFtDPUWn1611/d5D7N0Kwsp7IdAN2WiQWHX4W2Mw8DJx3z3Mi5iMwLTby3bm8KQuPPmtc5u7OIPhoZTzhGHpr4DYFwLEDTjga3JE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PlNA/khd; arc=fail smtp.client-ip=52.101.83.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PlNA/khd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WUPUgwy/iS5HwheIFTk1nnpAyOqpku++8mguQQKSFDRWHNxWcFjuNm3RZ9CGtEJTh8K3VWVyy9dtp/O+tRwXFYANxPvrJxKr82cHlJmLS3a1UlShuBBO1GSGrzpv66AIAG7La2wZ76jptXtTYi04/o9sfTl5zRW0VhJULvp/9ls/yYsyoKMkQtpTSuWtU3rL5rgLUV/bT3R3Zbg8q3yH3G3lKNHGpWldGX+e/NDqMiZS9bMQ85eGWXms5ySo2PO9MvWdyS0l/mFfE32HhF+dADISjRJTgnSb8OuqGPYSQ1/w0n6LK4DE7jDTuNXCJtQ2TY7aS57jQo9gnBsvfjtnLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VR4vdLwurwof/MdOyBAyJqD+SUB5TvouZeMuA6zRi7Q=;
 b=qoGdLxpMz0UCDsGCvEABqLhR6IT2d0QTwcTBtCryt769Ot1VOp2uXLzplg8r5sqIFvvbolKZryp8Ahp029O8WXGwI6mj29cFqJ+jdslh6MG3jiPysZ1icuCTPaPYcEqhb/PiINZER09gjdK0bPN9b2ViFz/sJ3cKlFakxBQdbj+3VtULcm+JFdDp/fd9+zilXPY7PGuGRchoRl/9ToJR60cD2pqICpL4uvIq9hyZEGejJOHaC3fSNb9JAgDgjEF/IZiHZlXcZs8Xp/6TtI5GlYZCS/KyCqbAbQP6j8shWNVin39TmFZr22oByr4qsAu7Sse1/Vp0xMkMGiPrMNLiCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VR4vdLwurwof/MdOyBAyJqD+SUB5TvouZeMuA6zRi7Q=;
 b=PlNA/khd5DT619k3nwS2016Vctbd0wFX9rYRiJGuO/nw73kIl2Umc6nXz4e+vj3a4li0yEygmdAfmD9ZhJ0njIiKwl2wYFRpJ3iHlx2OBQK0sa2xe8M0QDqwtX+KXo9RkHO0WtcM3SuYnk2iBJx8wUorIRSAKMTT3EA0AEtceBrEPhg9sYHtFEG0cjBUIaxpxy2vgY2GeApydwo5sruTHQvLCAoD8edxusjmWPX0LHaYdL9ThcAqHXV8JcaYzfRZEqHvXGUXEr2ptMr/w1PkhKIJ9HUBPbgmK0T3qdEwvlKP30EKj8QNngGvVXjFHlu39zXfdcO+c899YYMVvZd84w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10440.eurprd04.prod.outlook.com (2603:10a6:800:218::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 14:29:01 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 14:29:00 +0000
From: Frank.Li@oss.nxp.com
To: soc@kernel.org
Cc: Frank.Li@nxp.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	alexander.stein@ew.tq-group.com,
	antoine.gouby@toradex.com,
	chancel.liu@nxp.com,
	francesco.dolcini@toradex.com,
	franz.schnyder@toradex.com,
	frieder.schrempf@kontron.de,
	haibo.chen@nxp.com,
	hongxing.zhu@nxp.com,
	joy.zou@oss.nxp.com,
	krzysztof.kozlowski@oss.qualcomm.com,
	laurentiu.mihalcea@nxp.com,
	marex@nabladev.com,
	Markus.Niebel@ew.tq-group.com,
	maud_spierings@hotmail.com,
	mehmet.fide@screeningeagle.com,
	oualid.derouiche@kontron.de,
	peng.fan@nxp.com,
	primoz.fiser@norik.com,
	qijian.guo@nxp.com,
	robh@kernel.org,
	sherry.sun@nxp.com,
	stefano.r@variscite.com,
	victor.liu@nxp.com,
	vjardin@free.fr
Subject: [GIT PULL] i.MX arm64 dts updates for v7.4
Date: Fri,  2 Oct 2026 10:28:50 -0400
Message-ID: <20261002142852.3968477-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0071.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::33) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10440:EE_
X-MS-Office365-Filtering-Correlation-Id: 218afa5a-06bb-43c6-97c9-08df20918053
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|23010399003|366016|7416014|376014|56012099006|18002099003|6133799003|10067099003|3023799007|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	hwK0MOejtcubJiroMBY6Ac3wqi8CHLs9OndwfctgyBFeqTLYNqnLKhO7SYUgrxIsoQBvFcrabLTTcpxUc59XK10djpoMQmNEUDv6rAQzKZrVngJEGoYm2UT8HWDsCIU/G1loV51RjuL++ahZ8NKR9sZa4e8aKNoYir7dlJKedFBsS98dYQ9Yooo2SKMYojWwkg+hlzLs4Ym6DAYD+wcGxaeK3mY3s/2hkmaRibOu8L7TpVZVc9u1k9Fr8wI+QeKRdooTNdRXJN0XvQucPt3cONnibuYeC2hM/w0kb7RU5vao1KEpNnFa3JrCkObQiXhHcxrRkxNuZIirbJQaUpqYxKk5Z2FmJfYbMrwkCQQdrXfwQmvkd5vQNsHu7Y1pY8CQc+d1llThTNest1ZHX+77keCecg0CJ/A1dpyqhnvHRs2qyjUbIPGWP9PsXR03THjtWvDRj/j7PhEa9L2CHbWknFsiY+o7jlElPYGe1obcq3FiH5eKd9unkRvy4/NimzVgZ89DekJBA/FH+BQO8Mn3d1H48fxNH4iLd+tYLdR3qQiCO1xcWVZUz8wcCZIt6k2LpAIT31tx89AEuxdEEC8V03YxxwdAca19TA0n7epj/Zfxx6Pm71HX2EgjAgyZKmqx50YSlB0oy8kkHQo3bsMXxOFds6kn/sjrMUXW2gMtgC8s23ZAeC6k/CWo04F91PgxqvKwYqBxilhfRVzWFZP5GaWkQ1jT7Di5PMs/YvXuErY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(23010399003)(366016)(7416014)(376014)(56012099006)(18002099003)(6133799003)(10067099003)(3023799007)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JDSBLhhzntqBjyjyE87lrBTYrSA8NAOK6uZ3KJVsVP4uV7fpCg8sn+0MseNg?=
 =?us-ascii?Q?SvIssMTeCPl7QInX/8Gy4cgg4WQC+bHIJsTKZm99ZQcJheQ8BVpARJLuxSgy?=
 =?us-ascii?Q?D6+CoHp5r5UmShGF9uIGJC6Oqv7x4mUq9AvbXWHRCKM6Rgc80BHTRhCc2S4a?=
 =?us-ascii?Q?dEgzUVrYpNAbaeAHsEv0ms6+Io00WorfSu51zQyq4DrqqAA1uEqN3t7Ei53b?=
 =?us-ascii?Q?GfvoLoVT9zBgdaih0heY+STCYiTJVUM+DfV8om3DW+CUjPHZHQkcfAECgTNO?=
 =?us-ascii?Q?LRBDBaV0tUPrO4Nq2m9BHO9/hMdVgSf7gkdxZlJPx0c1bFLS+CekQX3trtRx?=
 =?us-ascii?Q?YeeTx5Y9E54ZW06yCrghPuBPBVfttjjzcUAiNp5Ya3EI308T490REM1J3YaZ?=
 =?us-ascii?Q?1F7nQpNAq2TV5wsSju1GPSf9lhNgbFJx1XPTzBQxYIzvtk2ge0Irl/8igxZz?=
 =?us-ascii?Q?Ji41eQO6VcnnGDj8wugxeTd3wtkCfrIeGbg6/pcSj5s/gc8jzvcUZW2hp6fT?=
 =?us-ascii?Q?8QTOZczjlS1aQyH1ndxVnADVEoQ6p1oOxngu8qsmZDOouMsIO7YmLxkOsp+7?=
 =?us-ascii?Q?CgWhQ0x3WTLM2j2JsqnJ5hHBaIE2buOFnvXMVkXLjPcklNZFUHIDKibsQhii?=
 =?us-ascii?Q?SZWHqxr4RQd+6yp+fn02Ix2X4tW4PbOH7fgnMq94P3i6Ce6g4ltmWKTt92dK?=
 =?us-ascii?Q?+rrhysxGaZ+u5XPfxghJLUqNkB/Z5sDIFWwgyD2+k1t8lRRPkH8lUkzyfNjV?=
 =?us-ascii?Q?Nees/zArxwpIuG4P4TeCQbdQp9APq484z0vJEVqInGkmcMiVn06BfMmRoJuI?=
 =?us-ascii?Q?fQkdRiap6upbA7Q1jc3zIJrvImJWsgQNRtLGKEhJTj2ZFriFkFLYo2lw7Obp?=
 =?us-ascii?Q?U1mGKDlw73Guq7H4NGBK+V83c045f8i4EnARgbzx8XruoV3DXZ/p0jwTNsFp?=
 =?us-ascii?Q?QyBy8xuapASdUZzDK6Qf5t7qBtph7aI2Dyh+VKnQXirA3QFhvXDhmnaZa5Bq?=
 =?us-ascii?Q?C8BB1GkuhG/7HpuQlfGXM9+5q+UKTRs3lb+IyDxSWxEgrMs4K4UYRXm2shGm?=
 =?us-ascii?Q?TXzibQzmmT4fV5PNxDEv/DgcYQoQHTzbiMhAu4hu9f/33PL7NYeQxkvmZAQC?=
 =?us-ascii?Q?e0FLpRVCwHG86PL28BcbHiU/SUoCvvoAnUPdBoI2uN6DMg6LlOlf/7ZJ3xdf?=
 =?us-ascii?Q?rd55cUetdPa1Xwiiqx/ao7uiQF0ooD7B2WlsrCTLMKxCWTnVvfRIcpvpuMH0?=
 =?us-ascii?Q?1zlHqoBKjuUb2C+1+XMrwcfQsZc8jUGCYHsP+Gw6EZV2Jffzm5n83cBowXQ6?=
 =?us-ascii?Q?5Z2C+wwbtrJrYvUnJOSeNmFS3xF8FUIg9eDEAOZ74R6IHAGHT2d1AeSh7du+?=
 =?us-ascii?Q?O5wP3EZW1GOo2y4coKxCIJvPcCJJL0dwm9+DfWK1f92Mn1mRJ9eUa0YbfaQS?=
 =?us-ascii?Q?DjC0l9Q/wdqOl2bndjyKEoRLMGjXD9DK2Ig72wnZh3UyvQVrddseLhc1Gq+V?=
 =?us-ascii?Q?7ZwBtefYl6U/YfYW52fd+YSAbXqtT7RFe5bLT6NCNvbwRyNQSLBhoXii20zU?=
 =?us-ascii?Q?rupv2In8bQauJdY5oRJMJ0V5wbqtRCk6t4pkEIIPtNATTcp1tyeP4Xkyust8?=
 =?us-ascii?Q?9QtZTPvmP7TMe8Q7LNlec2LpOc5syAZ9a6iUiKbzMq5gbqYmXlvXsA169ooF?=
 =?us-ascii?Q?G6c1K8zjbiULgt3UtwnIURM78ZewAiceDLTIQl6/n0CIgroT9Wz6rxLu/2eh?=
 =?us-ascii?Q?GzeriC8rarj1P+qqm/0fqUJlkDzc2x8jW13z5+BzfoEYkrhSTUl+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 218afa5a-06bb-43c6-97c9-08df20918053
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 14:29:00.8581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hkNEhgOFduLc3hN2kgt/ZNMRgP7jdfp7stAuYBd16+GhtGNbgk9YKBokuEHep4RGL+ZtDgV7ziBAdqP4fOTPN4v1t7r0BOQuBEl/H/zumsgT3FgEQ+qRnu7E8ZNk2Mod
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10440

From: Frank.Li@nxp.com

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-dt64-7.4

for you to fetch changes up to 7f47e8eafbf55a2ad0697e5d28f5e6cff2fa42f9:

  arm64: dts: imx95-tqma9596sa: Add thermal zones (2026-10-01 10:53:11 -0400)

----------------------------------------------------------------
i.MX arm64 dts updates for v7.4

New board support:
  Add i.MX952 FRDM, i.MX93 Wireless FRDM, Toradex OSM iMX91, iMX93, iMX95,
  Lino iMX91 and iMX93 (with dahlia), MR-NAVQ95, Free Mobile Nodebox v3 CPU
  Module Data Modul i.MX8M Mini/Plus eDM SBC DT overlays (LVDS, HDMI, CM,
  FIO1, FIO1-Audio, legacy board), ifm VHIP4 EvalBoard EEPROM layout DTOs
  for i.MX8MN

MQS1 sound support:
- Add MQS1 pinmux, clocks and board muxes on i.MX91, i.MX93, i.MX94, i.MX95
  EVKs and FRDM boards, i.MX952 AONMIX MQS device node.
- Add one MQS1 DT overlay shared for all i.MX9 platforms.

PCIe updates:
- Describe PCIe M.2 Key E connector on i.MX95-19x19-EVK and i.MX943-EVK
- Avoid 32-bit PCIe window System RAM overlap on i.MX95, i.MX94, i.MX943
- Move PCIe PERST# and vpcie supply to Root Port node on i.MX95-15x15-FRDM

Display/media:
- Add tianma,tm050rdh03 panel on i.MX91-9x9-QSB, Assign media_{axi,apb}_root
  clock parents/rates on i.MX91, Override dpi_bridge compatible string on
  i.MX91, Enable I2C_3_DSI1 on i.MX95 Aquila Clover board

Fixes and cleanup:
- Fix usbphynop2 power-domain and add #phy-cells
- Fix reserved memory node names across i.MX93, i.MX95, i.MX8QM, i.MX8QXP,
  i.MX8DXL, i.MX8ULP EVKs
- Fix LVDS clock frequency for DL device on i.MX8MP Kontron
- Fix GPIO4_IO29 usage and USB-C connector mode on i.MX93 Kontron
- Fix gpio-line-names on i.MX95 Aquila, i.MX8MP/i.MX8MM Verdin/Toradex
- Fix duplicated can-phy node names on i.MX95-15x15-FRDM
- Fix RTC aliases on i.MX93-11x11-FRDM
- Fix reserved memory node names for remoteproc (multiple boards)
- Drop unsupported opp-hz-real in OPP tables on i.MX95
- Drop undocumented "hardware" root node properties

Other additions:
- Add HSIC usb@5b0e0000 node and usbotg3 iommu information
- Add Apalis i.MX8 USB HSIC support
- Add ENETC port 2 in SGMII mode on i.MX95 Aquila and Toradex SMARC
- Add thermal zones on i.MX95-TQMa9596SA
- Add boot phase properties on i.MX95-15x15-FRDM
- Add RTC1 alias for PCF2131 on i.MX91/i.MX93 EVK/QSB
- Add PEB-WLBT-07 expansion board for i.MX8MP phyBOARD-Pollux
- Add phyBOARD-Pollux PEB-AV-10 SAI master fix
- Add Wi-Fi SD interface on i.MX95 Toradex SMARC
- Add EEPROM nWP GPIO, label and layout on i.MX8MM/i.MX8MP
- Add TPM support and SAI3 sync RX mode on i.MX8MM VAR-DART
- Add SPI EERAM, GPIO labels, ethernet PHY LEDs on i.MX8MM Kontron
- Set #pinctrl-cells on lx2160a pinmux node
- ARM: vf610/vf500: describe L2 cache geometry and Cortex-A5 L1 caches
- i.MX93-11x11-FRDM: factor out common parts into dtsi
- i.MX8MQ-EVK: add regulator-off-in-suspend for VGEN1/VGEN6
- i.MX8MP: add DT label to SPBA5 bus

----------------------------------------------------------------
Alexander Stein (1):
      arm64: dts: imx95-tqma9596sa: Add thermal zones

Antoine Gouby (2):
      dt-bindings: arm: fsl: Add Toradex OSM iMX95
      arm64: dts: freescale: Add Toradex OSM iMX95

Chancel Liu (17):
      arm64: dts: imx91_93_common: Add clock and sound-dai-cells properties for MQS
      arm64: dts: imx91-11x11-evk: Add board muxes to select between PDM and MQS1
      arm64: dts: imx91-11x11-evk: Add MQS1 pinmux, clocks and mark conflicting devices
      arm64: dts: imx93-11x11-evk: Add board muxes to select between PDM and MQS1
      arm64: dts: imx93-11x11-evk: Add MQS1 pinmux, clocks and mark conflicting devices
      arm64: dts: imx93-14x14-evk: Add board muxes to select between FlexCAN1 and MQS1
      arm64: dts: imx93-14x14-evk: Add MQS1 pinmux, clocks and mark conflicting devices
      arm64: dts: imx94: Add clock and sound-dai-cells properties for MQS1
      arm64: dts: imx943-evk: Add board muxes to select between CAN1/PDM and MQS1/MIC
      arm64: dts: imx943-evk: Add MQS1 pinmux, clocks and mark conflicting devices
      arm64: dts: imx95: Add clock and sound-dai-cells properties for MQS1
      arm64: dts: imx95-15x15-evk: Add board muxes to select between PDM and MQS1
      arm64: dts: imx95-15x15-evk: Add MQS1 pinmux, clocks and mark conflicting devices
      arm64: dts: imx952: Add AONMIX MQS device node
      arm64: dts: imx952-evk: Add board muxes to select between CAN1/PDM
      arm64: dts: imx952-evk: Add MQS1 pinmux, clocks and mark conflicting devices
      arm64: dts: fsl: Add DT overlay to build MQS1 sound cards on i.MX9 platforms

Francesco Dolcini (14):
      arm64: dts: freescale: imx8mm-verdin-ivy: fix DIGI_1/DIGI_2 gpio-line-names
      arm64: dts: freescale: imx8mp-verdin-ivy: fix DIGI_1/DIGI_2 gpio-line-names
      arm64: dts: freescale: imx95-aquila: fix gpio-line-names padding
      arm64: dts: freescale: imx8mp-toradex-smarc: fix SMARC_SLEEP# gpio-line-names typo
      arm64: dts: freescale: imx8mp-verdin-yavia: fix external GPIOs
      arm64: dts: freescale: imx95-toradex-smarc: enable Wi-Fi SD interface
      dt-bindings: arm: fsl: Add Lino iMX91/iMX93
      dt-bindings: arm: fsl: Add Toradex OSM iMX91/iMX93
      arm64: dts: freescale: Add Lino iMX93
      arm64: dts: freescale: imx93-lino: Add dahlia
      arm64: dts: freescale: Add Lino iMX91
      arm64: dts: freescale: Add Toradex OSM iMX93
      arm64: dts: freescale: Add Toradex OSM iMX91
      arm64: dts: freescale: imx8mm-verdin: add gpio-line-name for CTRL_SLEEP_MOCI#

Frank Li (5):
      arm64: dts: imx8qm-ss-conn: add usbotg3 iommu information
      arm64: dts: imx8qm-ss-conn: Add HSIC usb@5b0e0000 node
      arm64: dts: imx8qm-ss-conn: add #phy-cells for usbphynop2
      arm64: dts: imx8qm-ss-conn: update usbphynop2's power-domain to IMX_SC_R_USB_1_PHY
      arm64: dts: imx8mn-solidsense-n8-compact: drop undocumented adi,led-polarity

Franz Schnyder (4):
      arm64: dts: apalis-imx8: Add USB HSIC support
      arm64: dts: freescale: imx95-toradex-smarc: Add ENETC port 2 in SGMII mode
      arm64: dts: freescale: imx95-aquila: Add ENETC port 2 in SGMII mode
      arm64: dts: freescale: imx95-aquila: Enable I2C_3_DSI1 on Clover board

Frieder Schrempf (2):
      arm64: dts: imx93-kontron: Adjust GPIO4_IO29 usage
      arm64: dts: imx8mm-kontron: Describe the ethernet PHY LEDs

Haibo Chen (1):
      arm64: dts: imx95-15x15-frdm: fix duplicated can-phy node names

Joseph Guo (6):
      arm64: dts: imx93-11x11-frdm: factor out common parts into dtsi
      dt-bindings: arm: fsl: Add i.MX93 Wireless FRDM board
      arm64: dts: imx93: Add i.MX93 Wireless FRDM board support
      dt-bindings: arm: fsl: add i.MX952 FRDM board
      arm64: dts: freescale: add i.MX952 FRDM Board support device tree
      arm64: dts: imx95-15x15-frdm: add boot phase properties

Joy Zou (3):
      arm64: dts: imx8mq-evk: add regulator-off-in-suspend for VGEN1/VGEN6
      arm64: dts: imx91-evk/qsb: add rtc1 alias for external PCF2131 RTC
      arm64: dts: imx93-evk/qsb: add rtc1 alias for external PCF2131 RTC

Krzysztof Kozlowski (3):
      arm64: dts: freescale: Correct white-space style
      arm64: dts: imx8mq: Replace spaces indentation with tabs
      arm64: dts: imx95: Drop unsupported opp-hz-real in OPP tables

Laurentiu Mihalcea (2):
      dt-bindings: arm: fsl: add MR-NAVQ95 board
      arm64: dts: freescale: add MR-NAVQ95 basic board support

Liu Ying (3):
      arm64: dts: imx91: Override dpi_bridge's compatible string
      arm64: dts: imx91: Assign media_{axi,apb}_root clock parents/rates
      arm64: dts: imx91-9x9-qsb: Add tianma,tm050rdh03 panel

Marek Vasut (10):
      arm64: dts: imx8mp: Add DT label to SPBA5 bus
      arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
      arm64: dts: imx8mm: imx8mp: Add legacy board DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
      arm64: dts: imx8mm: imx8mp: Add HDMI DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
      arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
      arm64: dts: imx8mm: imx8mp: Add FIO1 DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
      arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
      arm64: dts: imx8mn: Expand EEPROM description on ifm VHIP4 EvalBoard
      arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard configuration EEPROM layout DTOs
      arm64: dts: imx8mm: imx8mp: Update EEPROM with nWP GPIO, label and layout

Markus Niebel (1):
      arm64: dts: imx95-tqma9596sa-mb-smarc-2.dts: improve SD reset pulse

Maud Spierings (2):
      arm64: dts: imx93-11x11-frdm-common: fix the rtc aliases
      arm64: dts: imx93-11x11-frdm: add missing vcc-supply

Mehmet Fide (2):
      ARM: dts: vf500: describe the Cortex-A5 L1 caches
      ARM: dts: vf610: describe the L2 cache geometry

Oualid Derouiche (4):
      arm64: dts: imx93-kontron: Make USB-C connector "device-only"
      arm64: dts: imx8mm-kontron: Add GPIO labels and comments
      arm64: dts: imx8mm-kontron: Add SPI EERAM on BL device
      arm64: dts: imx8mp-kontron: Fix LVDS clock frequency for DL device

Peng Fan (12):
      arm64: dts: imx8dxl-evk: fix reserved memory node names for remoteproc
      arm64: dts: imx8qm-mek: fix reserved memory node names for remoteproc
      arm64: dts: imx8qm-mek: fix dsp reserved memory node names for remoteproc
      arm64: dts: imx8qxp-mek: fix reserved memory node names for remoteproc
      arm64: dts: imx8qxp-mek: fix dsp reserved memory node names for remoteproc
      arm64: dts: imx8ulp-evk: fix reserved memory node names for remoteproc
      arm64: dts: imx93-11x11-frdm: fix reserved memory node names for remoteproc
      arm64: dts: imx93-14x14-evk: fix reserved memory node names for remoteproc
      arm64: dts: imx93-9x9-qsb: fix reserved memory node names for remoteproc
      arm64: dts: imx8dxl-sr-som: fix reserved memory node names for remoteproc
      arm64: dts: imx93-11x11-evk: fix reserved memory node names for remoteproc
      arm64: dts: imx95-15x15-frdm: fix reserved memory node names for remoteproc

Primoz Fiser (2):
      arm64: dts: imx8mp-phyboard-pollux-peb-av-10: Fix SAI master assignment
      arm64: dts: imx8mp-phyboard-pollux: add PEB-WLBT-07 expansion board

Richard Zhu (3):
      arm64: dts: imx95: Avoid 32-bit PCIe window System RAM overlap
      arm64: dts: imx94: Avoid 32-bit PCIe window System RAM overlap
      arm64: dts: imx943: Avoid 32-bit PCIe window System RAM overlap

Rob Herring (Arm) (1):
      arm64: dts: freescale: Drop undocumented "hardware" root node properties

Sherry Sun (3):
      arm64: dts: imx95-19x19-evk: Describe the PCIe M.2 Key E connector
      arm64: dts: imx943-evk: Describe the PCIe M.2 Key E connector
      arm64: dts: imx95-15x15-frdm: Move PCIe PERST# and vpcie supply to Root Port node

Stefano Radaelli (4):
      arm64: dts: imx95-var-dart-sonata: correct UART8 header pins
      arm64: dts: imx8mm-var-dart: configure SAI3 synchronous RX mode
      arm64: dts: imx8mm-var-dart: add TPM support
      arm64: dts: imx8mm-var-dart: increase PHY reset deassert delay

Vincent Jardin (4):
      dt-bindings: vendor-prefixes: add Free Mobile
      dt-bindings: arm: fsl: add Free Mobile Nodebox v3 CPU Module
      arm64: dts: freescale: add Nodebox v3 CPU Module
      arm64: dts: lx2160a: set #pinctrl-cells on the pinmux node

 Documentation/devicetree/bindings/arm/fsl.yaml     |   40 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 arch/arm/boot/dts/nxp/vf/vf500.dtsi                |    6 +
 arch/arm/boot/dts/nxp/vf/vf610.dtsi                |    3 +
 arch/arm64/boot/dts/freescale/Makefile             |  267 ++++-
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |    2 +-
 .../arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts |   34 +
 .../boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi      |  330 +++++++
 arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi      |    1 +
 .../arm64/boot/dts/freescale/imx8-apalis-eval.dtsi |    6 +-
 .../boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi |    6 +-
 .../boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi |    6 +-
 .../arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi |   16 +-
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      |   14 +-
 arch/arm64/boot/dts/freescale/imx8dxl-sr-som.dtsi  |   14 +-
 .../dts/freescale/imx8mm-beacon-baseboard.dtsi     |    2 +-
 .../imx8mm-data-modul-edm-sbc-overlay-cm4.dtso     |   56 ++
 ...odul-edm-sbc-overlay-edm-mod-imx8mm-common.dtsi |   59 ++
 ...-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi |   99 ++
 ...-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso |   79 ++
 ...-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtsi |   69 ++
 ...-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso |   59 ++
 ...-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi |   94 ++
 ...-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso |   17 +
 ...edm-sbc-overlay-edm-mod-imx8mm-lvds-common.dtsi |  118 +++
 ...l-edm-sbc-overlay-edm-mod-imx8mm-lvds-dual.dtsi |   32 +
 ...sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtsi |   12 +
 ...sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso |    7 +
 ...bc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtsi |   12 +
 ...bc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso |    7 +
 ...bc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtsi |   12 +
 ...bc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso |    7 +
 ...bc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtsi |   12 +
 ...bc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso |    7 +
 ...sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtsi |   12 +
 ...sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtso |    7 +
 ...c-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtsi |   12 +
 ...c-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso |    7 +
 ...verlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtsi |   12 +
 ...verlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso |    7 +
 ...edm-sbc-overlay-edm-mod-imx8mm-lvds-single.dtsi |   20 +
 ...-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi |   22 +
 ...odul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtso |   18 +
 ...imx8mm-data-modul-edm-sbc-overlay-lvds-3v3.dtsi |   19 +
 ...imx8mm-data-modul-edm-sbc-overlay-lvds-5v0.dtsi |   19 +
 ...mx8mm-data-modul-edm-sbc-overlay-lvds-dual.dtsi |   29 +
 ...data-modul-edm-sbc-overlay-lvds-g070y2-l01.dtsi |   31 +
 ...ata-modul-edm-sbc-overlay-lvds-g101ice-l01.dtsi |   31 +
 ...ata-modul-edm-sbc-overlay-lvds-g121xce-l01.dtsi |   31 +
 ...ata-modul-edm-sbc-overlay-lvds-g156hce-l01.dtsi |   31 +
 ...data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi |   30 +
 ...ta-modul-edm-sbc-overlay-lvds-mi0700a2t-30.dtsi |   31 +
 ...modul-edm-sbc-overlay-lvds-mi1010z1t-1cp11.dtsi |   31 +
 ...8mm-data-modul-edm-sbc-overlay-lvds-single.dtsi |   13 +
 .../dts/freescale/imx8mm-data-modul-edm-sbc.dts    |   64 +-
 .../arm64/boot/dts/freescale/imx8mm-kontron-bl.dts |  107 +-
 .../imx8mm-tx8m-1610-moduline-iv-306-d.dts         |    1 -
 .../imx8mm-tx8m-1610-moduline-mini-111.dts         |    1 -
 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi |   21 +-
 .../boot/dts/freescale/imx8mm-verdin-ivy.dtsi      |    4 +-
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |    2 +-
 .../dts/freescale/imx8mn-solidsense-n8-compact.dts |    2 -
 .../freescale/imx8mn-vhip4-evalboard-common.dtsi   |    3 +-
 .../dts/freescale/imx8mn-vhip4-evalboard-v1.dts    |    8 +
 .../dts/freescale/imx8mn-vhip4-evalboard-v2.dts    |   28 +-
 .../imx8mn-vhip4-overlay-eeprom-1000.dtso          |  103 ++
 .../imx8mn-vhip4-overlay-eeprom-1100.dtso          |  103 ++
 .../imx8mn-vhip4-overlay-eeprom-2000.dtso          |  107 ++
 .../imx8mp-data-modul-edm-sbc-overlay-cm7.dtso     |   57 ++
 ...-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso |   67 ++
 ...-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso |   46 +
 ...-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso |   17 +
 ...sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso |    7 +
 ...bc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso |    7 +
 ...bc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso |    7 +
 ...bc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso |    7 +
 ...sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtso |   11 +
 ...c-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso |    7 +
 ...verlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso |    7 +
 ...-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi |   35 +
 ...sbc-overlay-edm-sbc-imx8mp-lvds-g070y2-l01.dtso |   24 +
 ...bc-overlay-edm-sbc-imx8mp-lvds-g101ice-l01.dtso |   24 +
 ...bc-overlay-edm-sbc-imx8mp-lvds-g121xce-l01.dtso |   24 +
 ...bc-overlay-edm-sbc-imx8mp-lvds-g156hce-l01.dtso |   32 +
 ...sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtso |   36 +
 ...c-overlay-edm-sbc-imx8mp-lvds-mi0700a2t-30.dtso |   24 +
 ...verlay-edm-sbc-imx8mp-lvds-mi1010z1t-1cp11.dtso |   24 +
 ...edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtso |   41 +
 ...edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtso |   14 +
 ...-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi |   79 ++
 ...odul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtso |   97 ++
 ...odul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtso |   69 ++
 .../dts/freescale/imx8mp-data-modul-edm-sbc.dts    |  176 +++-
 .../dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dts  |    2 +-
 .../boot/dts/freescale/imx8mp-icore-mx8mp.dtsi     |    2 +-
 .../boot/dts/freescale/imx8mp-kontron-dl.dtso      |   11 +
 .../imx8mp-phyboard-pollux-peb-av-10.dtsi          |    5 +-
 .../imx8mp-phyboard-pollux-peb-wlbt-07.dtso        |   76 ++
 .../boot/dts/freescale/imx8mp-toradex-smarc.dtsi   |    2 +-
 ...8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtso |    2 +-
 ...8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtso |    2 +-
 .../imx8mp-tx8p-ml81-moduline-display-106.dts      |    1 -
 .../boot/dts/freescale/imx8mp-verdin-ivy.dtsi      |    4 +-
 .../boot/dts/freescale/imx8mp-verdin-yavia.dtsi    |    7 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |    2 +-
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts       |    6 +
 .../boot/dts/freescale/imx8mq-librem5-devkit.dts   |    4 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |    4 +-
 arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts  |    2 +-
 .../arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi |   16 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |  168 ++--
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |   32 +-
 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi  |   39 +
 .../boot/dts/freescale/imx8qm-var-som-symphony.dts |    2 +-
 arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi  |    6 +-
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |   20 +-
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |    4 +-
 arch/arm64/boot/dts/freescale/imx9-mqs.dtso        |   57 ++
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts  |   55 +-
 .../boot/dts/freescale/imx91-11x11-frdm-s.dts      |    2 -
 arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts |    2 -
 .../freescale/imx91-9x9-qsb-tianma-tm050rdh03.dtso |  104 ++
 arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts    |   52 +
 .../dts/freescale/imx91-lino-verdin-dahlia.dts     |   24 +
 .../boot/dts/freescale/imx91-lino-verdin-dev.dts   |   24 +
 arch/arm64/boot/dts/freescale/imx91-lino.dtsi      |  305 ++++++
 .../boot/dts/freescale/imx91-toradex-osm-dev.dts   |   22 +
 .../boot/dts/freescale/imx91-toradex-osm.dtsi      |  303 ++++++
 arch/arm64/boot/dts/freescale/imx91.dtsi           |   11 +
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi |    6 +
 .../boot/dts/freescale/imx93-11x11-evk-common.dtsi |    5 +-
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts  |   54 +-
 .../dts/freescale/imx93-11x11-frdm-common.dtsi     |  681 +++++++++++++
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts |  682 +------------
 arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts  |   59 +-
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts    |    7 +-
 .../dts/freescale/imx93-imx91-lino-common.dtsi     |  536 ++++++++++
 .../freescale/imx93-imx91-lino-verdin-common.dtsi  |  175 ++++
 .../imx93-imx91-lino-verdin-dahlia-common.dtsi     |  198 ++++
 .../imx93-imx91-lino-verdin-dev-common.dtsi        |  216 ++++
 .../freescale/imx93-imx91-toradex-osm-common.dtsi  |  526 ++++++++++
 .../imx93-imx91-toradex-osm-dev-common.dtsi        |  324 ++++++
 .../boot/dts/freescale/imx93-kontron-bl-osm-s.dts  |    6 +-
 .../boot/dts/freescale/imx93-kontron-osm-s.dtsi    |   32 +-
 .../dts/freescale/imx93-lino-verdin-dahlia.dts     |   24 +
 .../boot/dts/freescale/imx93-lino-verdin-dev.dts   |   24 +
 arch/arm64/boot/dts/freescale/imx93-lino.dtsi      |  359 +++++++
 .../boot/dts/freescale/imx93-toradex-osm-dev.dts   |   22 +
 .../boot/dts/freescale/imx93-toradex-osm.dtsi      |  357 +++++++
 arch/arm64/boot/dts/freescale/imx93w-frdm.dts      |   23 +
 arch/arm64/boot/dts/freescale/imx94.dtsi           |    5 +-
 .../boot/dts/freescale/imx943-evk-sdwifi.dtso      |   25 +
 arch/arm64/boot/dts/freescale/imx943-evk.dts       |  138 ++-
 arch/arm64/boot/dts/freescale/imx943.dtsi          |    2 +-
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts  |   48 +-
 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts |   38 +-
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  |   55 +-
 .../boot/dts/freescale/imx95-19x19-frdm-pro.dts    |    2 -
 .../boot/dts/freescale/imx95-aquila-clover.dts     |   23 +
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts |   18 +
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi    |   15 +-
 arch/arm64/boot/dts/freescale/imx95-navq.dts       |  228 +++++
 .../boot/dts/freescale/imx95-toradex-osm-dev.dts   |  404 ++++++++
 .../boot/dts/freescale/imx95-toradex-osm.dtsi      | 1032 ++++++++++++++++++++
 .../boot/dts/freescale/imx95-toradex-smarc-dev.dts |    8 +
 .../boot/dts/freescale/imx95-toradex-smarc.dtsi    |    8 +
 .../dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts  |    2 +
 .../arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi |   75 ++
 .../boot/dts/freescale/imx95-var-dart-sonata.dts   |    2 +-
 arch/arm64/boot/dts/freescale/imx95.dtsi           |   18 +-
 arch/arm64/boot/dts/freescale/imx952-evk.dts       |   77 +-
 arch/arm64/boot/dts/freescale/imx952-frdm.dts      |    9 +
 arch/arm64/boot/dts/freescale/imx952-frdm.dtsi     |  726 ++++++++++++++
 arch/arm64/boot/dts/freescale/imx952.dtsi          |   19 +-
 arch/arm64/boot/dts/freescale/s32g2.dtsi           |    2 +-
 arch/arm64/boot/dts/freescale/s32g3.dtsi           |    2 +-
 176 files changed, 11020 insertions(+), 1070 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-dual.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-single.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-3v3.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-5v0.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-dual.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g070y2-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g101ice-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g121xce-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g156hce-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-mi0700a2t-30.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-mi1010z1t-1cp11.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-single.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-1000.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-1100.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-2000.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-cm7.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g070y2-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g101ice-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g121xce-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g156hce-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi0700a2t-30.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi1010z1t-1cp11.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-wlbt-07.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx9-mqs.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-9x9-qsb-tianma-tm050rdh03.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-lino-verdin-dahlia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-lino-verdin-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-lino.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-toradex-osm-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-toradex-osm.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-lino-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-lino-verdin-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-lino-verdin-dahlia-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-lino-verdin-dev-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-lino-verdin-dahlia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-lino-verdin-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-lino.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-toradex-osm-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-toradex-osm.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93w-frdm.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-navq.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx952-frdm.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
