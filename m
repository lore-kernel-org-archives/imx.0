Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013045.outbound.protection.outlook.com [52.101.83.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9B5213E89
	for <imx@lists.linux.dev>; Mon, 30 Mar 2026 14:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774880111; cv=fail; b=Ffp9wwxXvvI5o/OPtHDsWkbvfjCsQRqlwDB8cP+5wJCEW7JTZ3ZcmTGaWR2IruGYqyE5Y+D9sj+vuZDyottiAV56Oq4IZROEyJMJxzc1PYPPl/8+bCObRv1twOmr1UP859Yal9uXjUlie4y8jRL3rpXSIe8J//4EPmmX4nmN4qQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774880111; c=relaxed/simple;
	bh=jLmXCeMrdI42yiMQRGH2c1HtuisThy7mLeIHDeGADKw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=MOGFrcqtrmTXwuUTA0Kk3GpljByZVac6+GmqL5IQGf1H4XaODDJxJ8FNHOnfr0V9yeCwltzBBeZ7uyZ5C2AmaLfnY7D3WmdRE0IhgJg6DuUUlFvBQNvVjtZx1wLXs6zncrlYzMhqugenRICaL5XvKyTI4c82vPt84we5/jXgPY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TyYgh+Rw; arc=fail smtp.client-ip=52.101.83.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TyYgh+Rw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m9gDEASAV3xWpoukDr7Yf1iXiLHqgfLQvEL8T1AMUN2oJrrTMUspETmSsmOB8dXjPbL4ue19gKg93bd/FZ05WzA2HqWi2zUDxa2JGNO+xodB7f26qBTglMJhQdzKMQvUlNH4LGU2ulsxoVN6ZSmv42O7j5ksJIBBTxZNKWJQNhSOWwan3/+AM5ObLLh7sEjxA3fe7PlMv7YFoYpthz8QVZ5Jul5d6hLgLLZoEmZ9v4BvxH8JcyAFpXH8Shnsv8b6Ad4rlTgW/spRDL4XmRLpX+09wgbQs1LKMabDkMypZezgaUjL8JzX+wwh5ApJcZ9vhn759dURanrN+QWee9qvPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44hlU2jwjJLzw2tAfS5LC4Q7lBxT3bNSTDF668Fue54=;
 b=g4HIXgNoBo8TOMqf2fqSk8Bg7BOSNd2iZIjOehs8sqMAYm1LMMQF1YEnFlt5hNAsANXATuQiE8IX8tk+zqIQUV7lQ1VDvUoFGgrZQVjVJhnqkdDo+xPXrGe690PvLgGAiacqLV9Q5AOJvXVVXY0x55696TwXsYb5D7/3pA2gls5DiTBLvSIsRVIZ43iD/2dKaIXcm8Z/KCGnST2LA4rkL17guabRFDSS8BKA8xxBEut5PKhJxD4Rmu+FecfbFk2TJEEP4gbIhCmpNDL7jt5cJaVvWRKQ6gK6L7lj9LVMlrgeUjEAHSPuhMNW+NoqP4jrxbFz58NQMtIcpXMNpZvqrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44hlU2jwjJLzw2tAfS5LC4Q7lBxT3bNSTDF668Fue54=;
 b=TyYgh+RwaTToTZdw5P2Ck/uDhP908NnlE+te/BaFdORhYqsc0tOw6E+9S27+il400Px4tkfCBMrKDi+gF4Q1ZK5HVK3zstgcNbqsOmRD1xC8UHlHM1gu1YFO1xJ7fead2JmtEo2yUaKvF5GsHnZK8EFnCUUthN4y2tjrIcuhgqu7wavLJaDO2jH7rN7C7gEVZ5zq1BNEy69QYzwTPpt62A7yz4rrXMImshP5xLQO4CPGYRdsUHzqQbODs8f6G2aQ1By3JKds7Np+booNy7kJEli28cPFuI0t8phNnffwa+plCos38Tc8KhYj2kyCP+h21ZwZYE+4F4QLCWpDa81VqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB12223.eurprd04.prod.outlook.com (2603:10a6:102:55f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.24; Mon, 30 Mar
 2026 14:15:04 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 14:15:04 +0000
From: Frank Li <Frank.Li@nxp.com>
To: soc@kernel.org,
	arm@kernel.org
Cc: Frank.Li@nxp.com,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/4] i.MX dt binding changes for v7.1
Date: Mon, 30 Mar 2026 10:14:36 -0400
Message-ID: <20260330141444.3789193-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-Office365-Filtering-Correlation-Id: 5e7f4b6a-d6e7-45ad-7664-08de8e66bd18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|376014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	5FwibVvILJoDLziwe7J0AIhDv3/5gpLj+eqYhR8//bQ+wjEBBbB6tKX8Fe3Tvh2HXjgXirko3ibD5aedgqDz70bYE5CYYmDff76P4tOdCJvvPnqs3fm51ZAtDcLPJbAHdagNeaCBjDRl859V2oKRbk8SZ/ZcINUjC4WnLitgLm+KvBfOwJdX+XlphIFO9Xpvkb/dvPQqPxZz8jHWbnVeQ8lHInlxs+o/oy1iPAiY/0K6HyUQ9eXuuZEm9yp9wIPPiW5QqHEolyXYbbf78SE5usuESazd8HNk53MBmpERZHW+cs9OR4P09qfoDFpFoleKQPxjCTP2qzeolTl5e+x0BPs7iBThFkT8FEtJXUFuVGBsQmSX/iajdpHJglAUpCIGe7tDIrRCJgkJPbBs3PHoMhJqHm/PsEJAf58oHxRud2T/hcU2xJ2CXXnAdw0fIVUShgrEaD6kPQYpOgLEMV9xKPJQgiSP5aeJsT9OSYMijnFHUS9RRhPEnj186uQ9fHN4G6ZEf3QovOZTTGsF5DPdUfXYs2a5iuefymH7IKj1wekEeJy8ewk2tSaXQwzhDf+xjWVtMyTTSOpw0ISDrb0rPl+wOPJszq9vKVRPGw1zB0bz/+oIJVETt6rN+ta/pHZkytS7PMeFxPEDVEbDQNlvztNObs2lmMKBGteMMIk03fiPVd7D0v+bsUwtL6yeqW6C9Gi9f8GHn4KxbWwM5UGcBIBXzpe07yspUv2yoakbm1XMlOYGVD1s3iOgRgvAuJI54BKwsKhbI6xf9/DkO/qdEjrZzrmBefsehf70U+glDOo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(376014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OKx7sjT7lbKRjXK12wplKPiqvp/wDWlhWA3V+XlCQPWdd6AmgIF+MP3ry5js?=
 =?us-ascii?Q?NCO57bLYwjyLb2nwfd9TsI2bXatOwpjqPP68KVuPMtfz0XevwaQNbF/tQING?=
 =?us-ascii?Q?Bk8RmeqcYZJS2ZABEJj07vCPYfW5Ykvlqmm7lcYLoJDXUAVX+ipll8ZUlF5C?=
 =?us-ascii?Q?O1ETRbGv3NsdSpVAMrNM1ca2VDfovcfiyvPrBi2BvVb3PW+e2KAZMdDh3NIK?=
 =?us-ascii?Q?2rUHUj7U83ungc2rmIE2Rmgpg3EfybF0u5DEF+Isl7jhD85WaY6gqtd2+uhR?=
 =?us-ascii?Q?MRO77LotuOx7qubrRxS4zFhn3Zo1bfQiGBGjKkpd9/qXIJCzli10ifYuyu3l?=
 =?us-ascii?Q?q4EEqRxAIbW5VLh1vhczC/lvutK8l1epY7KiuLrKMyIqTqtJbEm8/S9etuLZ?=
 =?us-ascii?Q?UsAQyqJL77rZa5srlJwMFmgqbsQfeWUYNZSB6zToUmhVuFdXPowB8XF/OSi+?=
 =?us-ascii?Q?wXr820yX0LBpHikK5OEoCmp8MHXnvTe/HZ8znP+OjFoUWO8W7GZiF8b7NKXH?=
 =?us-ascii?Q?Yl/ppQjbMxx60X/HW9QoLqgdKuLKG1XRRBcbVeur/EAtyMyu9KgZGthuSVfA?=
 =?us-ascii?Q?8UH+HHCz2iDGoBtWT2eg/l9vgcdEa4qW+oUycsr9/96JIQBcZ/Z8cKm1BT+r?=
 =?us-ascii?Q?bd/gcFKfXe8vOUNfhOvwPoZB1S6CkauIA4rNeO+mOWTyvM8SG7NWkVmPnNxA?=
 =?us-ascii?Q?r5aWMlePwhiqNMnSZ0ubIWSVb5hiCNxJw3CXLYTh3tIHE9aA4QxNNyVSRwj7?=
 =?us-ascii?Q?058VWdHltvwlVXddY9h9ZGJF78UOM7woPPMn30GQoogDh9uG3tmOcIfLZfkV?=
 =?us-ascii?Q?jkQbc6SXIOG7uGuEpyQlbj+/hNBdTbHsGbCOOWqvtPYuzKEOH/JhYGIOLBUK?=
 =?us-ascii?Q?1JsE/algY6zd9yROUoi1nAGCxJJ75Rv/gV1MGAtLLXEdU1DmVcIkwTp0ltbQ?=
 =?us-ascii?Q?46ZkaWa/bvvj+//76MhljJKONjFQf2rt0ytR1VILZXnj21EVI9nx7J24XNBI?=
 =?us-ascii?Q?oeihmcgtFPIZrEAltrdMAL/K41D841ZjlQG9Sa5b6Pr206alZP3MvqR+8MsN?=
 =?us-ascii?Q?QasUTDsZilxceRCFtEKsTIc+Lvx3Q0CYZwOzDyW5Scx6IPhO03P3pzAWk0KB?=
 =?us-ascii?Q?w5vnKZ0cp/wY34oTJ3KBPKAWM6ddOVo3O4mGEqT+R/q1625cFk8YhuRKGJhH?=
 =?us-ascii?Q?yd5BGFTGUupFF645EU77BNL/BnkyMX/w9DYyJnlhEENk3BxjumAHTVEwkgLF?=
 =?us-ascii?Q?5mYXmCP5IU0a3zsFPGFid5a2yJcXyS7A8qBDdMRuoIaQgH7WkDFkA0TvmvEu?=
 =?us-ascii?Q?+8aVjled5GADU+f4AhqqaCFGgYCt+BKXqP083HCOt6/1vT4s4MI+XDcdAuz6?=
 =?us-ascii?Q?WXzozyCiRsm6d1DM1Qq73VtUhnLtegrYFB1MaVQ2/dGDctrVhOy72PowVAPJ?=
 =?us-ascii?Q?kZsSsw1eEXt/xVQlvRlY0uZiMPeaAHj56OdCcURJTxHLuh5lcyY0+5fhAoml?=
 =?us-ascii?Q?uyXh+owRV/ty1kpwGHB73hFweQXDTyDK2BjlSH5NYdIhmNSBVK3c+ZL1gkrk?=
 =?us-ascii?Q?nqIRwIUc4FNqLe7ptNbPfmH4NC6Hx8h5J3AY2HcHk6gZ1kMsl5DP7ZxCienL?=
 =?us-ascii?Q?ckPszEnwtEzz/zeUNfUlqaZaJSV6pPm8jt2Ep+uwqxkHqQVYKVDyac7ihQk7?=
 =?us-ascii?Q?vwA/wfgsUk7XfPAGO3QC2MHkj2fuG/CiXmxP+Vdrc3apJEWo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e7f4b6a-d6e7-45ad-7664-08de8e66bd18
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 14:15:04.5157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jYp2a16gZ/1A3pISaWh+Sie7LG88jS36FLVTfLY73uEutZLFvekPLKSx8JI+PTcfRd6NCuv4f+w3Rx1IRqe7Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB12223

From: Frank.Li@nxp.com

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-bindings-7.1

for you to fetch changes up to e54390aae6887151ff67526af45382beb889f99a:

  dt-bindings: arm: fsl: add Verdin iMX95 (2026-03-26 12:17:45 -0400)

----------------------------------------------------------------
i.MX dt-bindings update for 7.1:

- New board support: Verdin iMX95, MBa93xxLA-MINI, TQMa95xxLA, S32N79
  SoC/RDB, i.MX8MP audio board (version 2), SolidRun i.MX8M, TQMa8x,
  GOcontroll Moduline IV/Mini, FRDM-IMX91S, Variscite DART-MX91,
  i.MX93 Wireless EVK, Variscite DART-MX95.
- fsl,irqsteer add nxp,s32n79-irqsteer support.
- fsl,imx93-media-blk-ctrl add dbi-bridge.

----------------------------------------------------------------
Alexander Stein (1):
      dt-bindings: arm: fsl: add bindings for TQMa8x

Ciprian Marian Costea (2):
      dt-bindings: interrupt-controller: fsl,irqsteer: add S32N79 support
      dt-bindings: arm: fsl: Add NXP S32N79 SoC and RDB board

Ernest Van Hoecke (1):
      dt-bindings: arm: fsl: add Verdin iMX95

Frank Li (1):
      dt-bindings: arm: lpc: add missed lpc43xx board

Josua Mayer (1):
      dt-bindings: arm: fsl: Add various solidrun i.MX8M boards

Liu Ying (1):
      dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC subnode to schema and example

Markus Niebel (1):
      dt-bindings: arm: add bindings for TQMa95xxLA

Martin Schmiedel (1):
      dt-bindings: arm: fsl: add MBa93xxLA-MINI

Maud Spierings (1):
      dt-bindings: arm: fsl: Add GOcontroll Moduline IV/Mini

Peng Fan (1):
      dt-bindings: fsl: imx7ulp-smc1: Add #clock-cells property

Shengjiu Wang (1):
      dt-bindings: arm: fsl: Add compatible for i.MX8MP audio board (version 2)

Sherry Sun (1):
      dt-bindings: arm: fsl: Add i.MX93 Wireless EVK board

Stefano Radaelli (2):
      dt-bindings: arm: fsl: add Variscite DART-MX95 Boards
      dt-bindings: arm: fsl: add Variscite DART-MX91 Boards

Yanan Yang (1):
      dt-bindings: arm: fsl: Add FRDM-IMX91S board

 .../bindings/arm/freescale/fsl,imx7ulp-pm.yaml     |  5 ++
 Documentation/devicetree/bindings/arm/fsl.yaml     | 86 ++++++++++++++++++++++
 .../devicetree/bindings/arm/nxp/lpc32xx.yaml       | 22 ++++++
 .../interrupt-controller/fsl,irqsteer.yaml         |  4 +-
 .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 78 ++++++++++++++++++++
 5 files changed, 194 insertions(+), 1 deletion(-)
