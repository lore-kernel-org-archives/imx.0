Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013003.outbound.protection.outlook.com [40.107.159.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33313BE65C
	for <imx@lists.linux.dev>; Mon, 23 Mar 2026 16:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283354; cv=fail; b=g/Hz9vLlusEZKi5xb/vUl3fRyxhnMHUjV814MlhPNt4l6BXtYJ14Mxa4yqhAVPezp0LPVvzdszs5FZBX268dZVFf08RHyGzp//aveK85LlxeYpk6LPHARUEmJOU9YKDs+ircs0KyBNTBwC+fhGWk0I7Mxd1kadHctL2DRPiNY2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283354; c=relaxed/simple;
	bh=D3SMRV8oK6/vkCv8D18ssB7jRHqsdHlHuMF9W6cbyeA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=akr/fZhj1rQ8eSLb7uCQGB1Xe9mOKgweoLYpB1OLPxs8nxXifLPFb59BHGdVK+JY1pZ80qKznZ+pJvmkxdvYe/+RrIneo9KXYUmvsXBS5yG6Y5N9IwV4uEc6Lepd+ivcJpL10F+xndw2OqZuXw+jzTc9QGRRyFqs4TFGwkimSjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oXllUQfs; arc=fail smtp.client-ip=40.107.159.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oXllUQfs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N6B7A68dowsODffxS8hFFsnF9j1RTKl79IV7fDmOseu6Wv50eHUy0pmXqiN1O8C4w8Mo5rmJvy570s6smHFCqX28+lwmLZc7CX/gH4SmATCkxeQ2BS135vVmPpC2vzD2Xf3jyP2AwkpqXi6U1Qaj1JfWss3kXxwQBk+5qAF3eMbJPQrUBfgCp9oeXu2pAlSOiFdOJyfUaGMHi2037qs89YQeeF5TH06Tu1BPdel4s0GNSm515ZzzbsPA5sg8FyDeyPWNV72DHrVfPKzT3mxYjHNtKctKiCaqx2N92bcwKTc8qF0LH7uovlqyaKnekErfdH9rmf+R/PhC2TaRp84tjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JgYqHrfaYmxyQjNbUOOu43e+MP9ai3cWJeBofItv7xA=;
 b=J52T9eSoCN9tZg2m/07TgeWKAuuDiBwuWL51sklrCCyXdn2myfwfLX3uk4SHoHctSIQt5S3AhD22Kx++xjIrDfCeOIath3qs2CuQcFxUa0vMrW0JjEx3DPju/xeKmVJocAWQ1fXhAA9AH/AlLlGiwzKvbQjrTXSQ849Cs7fGBjFIyQqF+lPdUPDyPNFv/pcUsdAi9G6P7buhtJg7jCHkZlUS6RlQg3hnewHz2YL0wuJDNWzEl+EtzQFND1Aa/2BCwJ/Gam/CMJuJy1Q47RfJsm9HXBEveFzjbOe+hVKrhOwtgMkuWb6lhD48tQ61ioR5k1HAprae3mU696MFPXtFSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgYqHrfaYmxyQjNbUOOu43e+MP9ai3cWJeBofItv7xA=;
 b=oXllUQfsIZPViW1oqfj+rc2h2GYF38rwd0nA1NmLegfcg2gIVFvRT6RXRP41TyjMZqLcfaN0spccrwvry7kVFTePWw+tnFwxCBnFadd7tnvTsJH4NIir74G0oCAO6IaC0dMipjuy7OqeEWOLf4Mgm5YAZotLSUCuQfGbz8nwzgvf7RRIIG51+2PuEaILbTdh7GTdhTeI8tirWqY6PhgoSKFmRHhUGD57jIf7RQeSUX0AOmH4DKmYek6XpBxBLZWKkBsABbf7L8zzpwmrimlKmaiVSr9O/f2jQpZOk/8tUDFRaLaZG9afM+aD6uq8eiI6eI4oYRo+QiNPggw+gOa/Tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB10773.eurprd04.prod.outlook.com (2603:10a6:150:202::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 16:28:52 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 16:29:02 +0000
From: Frank Li <Frank.Li@nxp.com>
To: soc@kernel.org,
	arm@kernel.org
Cc: Frank Li <Frank.li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 7.0 (v2)
Date: Mon, 23 Mar 2026 12:28:46 -0400
Message-ID: <20260323162849.1203617-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P221CA0090.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::25) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB10773:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cbb0e19-5f24-481d-ae83-08de88f94b44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	OEwlCUJX7cW2wdwZW7/tw1L3+Nuy9DZOBvI+ZyWObD/pNEo8CA81UpDp+ujxXw4rbw2pJ4vYXEvoPH8jw+N4iQ43/qVsB4PS+enZN4gpYNVB1Es6DGuD4R2+mpBRbsFby/tgzxn/FY4C3Zevk6447Jn2LxdYKAtLgp6dBYc0Bd4pD4FIgVPR48V4b/fPUJsMT8UpgpsMi3tFWI/DBHhh49qPGMV5jA9PE7XnpnEHonX45BUwdBf0OT6S/vT7FPwmLrPZaf1yzQcOPqV7xh3t5Gv0x2EBaW/1AnZG/StXH7VC3pVoahy0Q6TUKln12jIE0W8zVRFHKeQzq//M3LbevjwCvnhTB/UyFqQbeS/Ss7j2WrspXiyHMCOpYz1cA72TdLyQNcWhhlPUtyNfm07LWQWF4AcshAOB/+ATPfGjIcLLbs0P2ffQH2Imip2+61WpCoEO0yz9kBZqWJqJwmIi0Dvv9mpuG2aso1TXd7oEEp+v9r9Ki5B6b0ia9+A/yBy/0mdilEMs+r38GS5Ik7V4DWKtJQN2ORQKtAHxcNhYXrjoaWxrxymsOSfAFODiApPYU77tvgEkL+6qGUSlpkH8jWNrUZwbiaT14viD/Gwi09xhPi8aJOQ2khmAkwCw6HQr+2Kf3IVXYGmYtGZPwTpGXKL3fpEcmCIugSNv5T4l8Eys2mcHXOg8exhp7C4xoUJeJeMpXWuUKpZiSeiKVXLtHlrFYSI4jC9fc7DR6dZeblUrLDfMSoqjatrOm61w/5WtoniJRqNNjkAN7xZbac5IupOw8/l+kY9hsCBuF4JoN8Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?14a5TcgOlgdPD27UMvrNVTmRuFc5N7g5qC3zjbv+lkud5A0OuH+xZG6XRkNt?=
 =?us-ascii?Q?i2VBBADkTnMUtE9XN+R0oBkueLarNmBdV8htGxc/MjHTdTc/p7ohfPUe1tF7?=
 =?us-ascii?Q?+ormjB88h0Newgdh7l7fn9ECFyI3lebYUNLDF44cgyVjv10ocOBZXQOkPYL4?=
 =?us-ascii?Q?xIicVoR7Y9BlpTHXugwBbXmbXbL923yxe8GlLAyymBLyHdNRkhuCPbPDmriK?=
 =?us-ascii?Q?wAhv1gq3H3dgaYzRGnPp6jG5TO83ZcBVHF2pGOdd8+KY7dJy57JbdDjlH5xu?=
 =?us-ascii?Q?tu4fIbCw1Hd37uOeojZcwvMZ1QNCLn1zYpWk/erAU+Gj6KTmGaDM4p/3iv3l?=
 =?us-ascii?Q?rjiQ19ZC+MYzbi0e17o6Gc6CUiqSXsq7YqDboRha/aqsHFtjNajOLZ271Ots?=
 =?us-ascii?Q?wb8ue+oO26o1kblnOFckTHM3HSRPRvAZ/z+BQMNW/QhV+buq0XKIjPSl83Fj?=
 =?us-ascii?Q?/BSJhJ2jICIrEpATZ7zabS1TJpL00W2bv8vrkaKPk/0IeIzRpL6E/E7f3J0r?=
 =?us-ascii?Q?dtDi37NdpjTyGCH8sGgMXiLiNFavXEg6mDNxnAFWzCe1id3Jf8wWsboyJFwN?=
 =?us-ascii?Q?Tv7gez9v6yexIK0418FlPe2X6hjeHnplcSUwWmu3aKY7I8R2CTfRrWd5ILbz?=
 =?us-ascii?Q?zmUsJBsrxbetVlSCKG7lgTtAf9axuMR6CuIGce4AtlbLq8/A3fmYFz0YykAA?=
 =?us-ascii?Q?Qs31SS2ayJWx4OtsTlTnjgo2DVsnA8A2tD0j5OJiwgvBnd26Svo4RCB1Q41r?=
 =?us-ascii?Q?MwA6hK+hVzJT6o6VBRfZkXjynkWMY1zFZLZfChO5TM1ofaEDPepNLKASM9BL?=
 =?us-ascii?Q?BaujWpmxgRsyrMnKOh0xYyPz902LrzQc/K6zFes/6PcgeyA4WSkNNd3aOAJE?=
 =?us-ascii?Q?6QOdaGXV5LE1Otv/5gJOICC+u1crzh5CLucLZE8uTR3TmE/AfJT+h3nG1D6U?=
 =?us-ascii?Q?AETUG3FFMHuYI7JDlORf0czSi5WG5yvZV2CcG24NSb636Y+4yjlzxGJd/J9G?=
 =?us-ascii?Q?93jw4VdSlCbxwXT4PQ2ZrBjwBW8Kq/4H8mjVobUX2Y8VFVBoWogYVUD/TXBK?=
 =?us-ascii?Q?2nnuOSn57juTqY0Fp8TqhzqaYVHJND7ByJXUYXuo2vGO8jYX9qSn+VCvaVxD?=
 =?us-ascii?Q?/7SP1LlcxF5ovUBw5Dl9+qmwA8BaOBTWN8a81JRVhNAmgNVwbhb3VePDRsX4?=
 =?us-ascii?Q?PZ+LbGnK7yKJG7LEIxo9jYscoOGYfk3O9Ul3+Xspr8iTQP72LAt+PYL5vXhM?=
 =?us-ascii?Q?pfBykF4ra8CsFDSzAKSN3+aZ/GUalPc5KZc7djWWJx6mpjqkhyZjkSyv99qS?=
 =?us-ascii?Q?f3zvvUZCPkJ7/p+wOS29rozW4RyDUpUAO7+MLfRZvyoQGbUdfez4WMGfysCe?=
 =?us-ascii?Q?zcuyPwYKD8TGUVT0IdY72ZaIlrNbbZOv2Frc8adyb4+W1hnFFNm3ojUcJq8G?=
 =?us-ascii?Q?q8UjbNdyvMG0DZCmHPBWQmHU1/S4uE2N8vgnIWP9xHHZ8qr6EDAEsIim+E8y?=
 =?us-ascii?Q?DksFkDF07DBT7gAOGJLJXg5uNianAKc82iYoCzNjUP7KEGMH2cu5dZ/OBqIc?=
 =?us-ascii?Q?Lym8hx49OcL3/Z5N6vMBhgtx1KbdYMYtsQN7moSQ67CaUqBr9xHmTYcqB2kb?=
 =?us-ascii?Q?/5JwYTJoOXLZqYEXEDQJG2dQWbVRRXaPHjXujJ2YONapbS6cD0U2aEvyeR20?=
 =?us-ascii?Q?27jU/vz4iB67+azfqCFIj84a8TdVAIiXyMMsMk/2cpcBt6iA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cbb0e19-5f24-481d-ae83-08de88f94b44
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 16:29:02.5906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckQxmFwEpKbIj6YFGG7fZ022+4jp8tSfGaJo1SYnLfQaRXmWC5ociIJFA8JimhS5z4ZNCxYY5NmbvM1BSMD55Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10773

From: Frank Li <Frank.li@nxp.com>

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-fixes-7.0

for you to fetch changes up to 511f76bf1dce5acf8907b65a7d1bc8f7e7c0d637:

  arm64: dts: imx8mq-librem5: Bump BUCK1 suspend voltage up to 0.85V (2026-03-17 23:24:44 -0400)

----------------------------------------------------------------
i.MX fixes for 7.0:

- Revert the NAND property move that broke compatibility across multiple
  imx6/imx7 device trees
- Fix imx8mq-librem5 power management by bumping BUCK1 suspend voltage to
  0.85V and reverting problematic DVS voltage changes
- Correct eMMC pad configuration for imx93-tqma9352 and imx91-tqma9131
- Change usdhc tuning step for eMMC and SD on imx93-9x9-qsb
- Correct gpu_ahb clock frequency for imx8mq

----------------------------------------------------------------

V2 fixes missed sign off

Luke Wang (1):
      arm64: dts: imx93-9x9-qsb: change usdhc tuning step for eMMC and SD

Markus Niebel (2):
      arm64: dts: imx91-tqma9131: improve eMMC pad configuration
      arm64: dts: imx93-tqma9352: improve eMMC pad configuration

Max Krummenacher (1):
      Revert "ARM: dts: imx: move nand related property under nand@0"

Sebastian Krzyszkowiak (3):
      arm64: dts: imx8mq: Set the correct gpu_ahb clock frequency
      Revert "arm64: dts: imx8mq-librem5: Set the DVS voltages lower"
      arm64: dts: imx8mq-librem5: Bump BUCK1 suspend voltage up to 0.85V

 arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi    |  6 +----
 arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi       |  6 +----
 .../boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi    |  6 +----
 .../dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi    |  6 +----
 arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi    |  6 +----
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi         |  6 +----
 arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts          |  6 +----
 arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi        |  6 +----
 .../dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi     |  6 +----
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi        |  6 +----
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi     | 12 ++++------
 .../boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi | 12 ++++------
 .../boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi    |  6 +----
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts   |  6 +----
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi        |  8 ++-----
 .../arm64/boot/dts/freescale/imx8mq-librem5-r3.dts |  2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  | 24 ++++++--------------
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |  2 +-
 arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi  | 20 ++++++++---------
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts    |  2 ++
 arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi  | 26 +++++++++++-----------
 21 files changed, 56 insertions(+), 124 deletions(-)
