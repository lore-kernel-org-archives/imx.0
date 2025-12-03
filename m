Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013064.outbound.protection.outlook.com [52.101.83.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BAC29CB48
	for <imx@lists.linux.dev>; Wed,  3 Dec 2025 07:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764745613; cv=fail; b=nEGqDmYyTlkOEXJzMAtZOV9RHW5HH1ZiBpCAEUzP5x1pBV8TWv1Fa7fJt/IldwMy6cbkIQ/vzzL5lhrMgqroeIzuZwn+M26ITBTqbKeZtwadMiqHy7BCAM4hlgl05W2EdQ8/vmWdQAb446ppPUbAmo3dSkRnoZaEpyJW2XavueE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764745613; c=relaxed/simple;
	bh=MtENlD7Z6FIvSI8t3jiuBKvPsoDe6LRPVt5RC6M89Wc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Dfjt361JRVfGaNOzIysLndaQAuuauZGGzIYCigKIqSQNyu9RVdDP112cHGfCOmuH9dLvWeft687FCv/a4ogWKp0cSBVb9mgny7BVSCZP9LbHcUMZFk18I7uLrtrOvXCISnsSRlqZQsz4NgcmFKXEJmo2TWAO9j8WmxsUMupLNSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=W+A1RRxm; arc=fail smtp.client-ip=52.101.83.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="W+A1RRxm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t3RdstUPSigSyZ5eLgA4gZBTWEvXTJPXTk4e39L4B0kxaoNPrRbSacU1PvEjl/AKG6oHVKlqqWO+fx/Xmnio0i51XdpfZUtZONoIPxLpLfzYUeMdV+FlJgUgVz3NaLdHvWDeKvne+wdrHlZ4XBpFyZQ1XoOycvtrfAiLyHL73D5P+Y7bUoMgSFKDhOLuoA1I6UEnVPR5cNVsQw/IfL5TIOQInMmp+UXrHCTj88p51mB20RTtB/ra1mCkzSZ3kRjkFaCObJCErKT5dshLdkExzfTkBfgt6YpEjXvPXdscpiU2CBTtLQli0Ck3DHJcy032y95+KXcPH5+DSJzkBtAQ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRnzED4GC0b+hWqjPuk1RDoApSCWVC8OqwTnEp47bJY=;
 b=owkocy8DrnClu+PxGobpM8detAPcz4mpgCjahLwB8wtgHQqmIa0ngQwZ6O2KHx/kYWkWVvwR8E8pHmJQ5SpGlzS7pmGNzbhKZk8y/sAs/NMA6KA36eC430Sm6bCq+x+u6UUx3zsydYSnRAJHLrcj+1mx7jput6kk6hEtwAvviy0W08Q5J41mN7UdrSwVoXQyw3CIl3SchseAH3ntohhFUCc7q128eUhGg1fJSIotmgyxxUOZ4qhaMtQd45R/OUcfVVc+cjYKmM+UJkyMKHoC/RejWKs4cWEcBOgEV6GHzlz1FWIFSD04/TtE6OyFKadFXEaajJmpgh6htPHWGlfYfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRnzED4GC0b+hWqjPuk1RDoApSCWVC8OqwTnEp47bJY=;
 b=W+A1RRxmFauJ5w0YDFc51isYsPE6PHrk5TJ5549Ig3890/ZNkDB1uzYMusZI4UGEDObxq//b0d4L5QAIaex7WuRrHSj5FTml6ecXkOGl0OPZNOJtsLlkr6M8c3mqcU8cXevD9sviayEvmOFf2VFFAzqOp2m8SqIPY2EJfZzG7SUhuOcgvmtj4ai1Wns4T9SGY7B8jRU0+6RfOnX7MuVUqZ/05JjV6SREhHr3KL4z6l0bzThA0SkVk4oMGMbVuJeo5rxlXEznhj+5MeYrN8yOaNPeXcAiWPYstySKVEZHvAldx23hvJ1pTd5VJV9X8OkzxcdrB7Y4jxhCWicjJMAwmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by AS8PR04MB9174.eurprd04.prod.outlook.com (2603:10a6:20b:449::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 07:06:48 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%2]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 07:06:48 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] arm64: dts: imx91-11x11-evk: Add bt-sco sound card support
Date: Wed,  3 Dec 2025 16:06:02 +0900
Message-ID: <20251203070605.1868821-3-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251203070605.1868821-1-chancel.liu@nxp.com>
References: <20251203070605.1868821-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0156.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c1::16) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|AS8PR04MB9174:EE_
X-MS-Office365-Filtering-Correlation-Id: 292141db-19d3-4850-f6fa-08de323a86bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CQHJjhi4WMmZ05qNtd7nicKm8ijeNrvFGXJV8aKca6z4rDZyb551G1rVP2Ih?=
 =?us-ascii?Q?BsmIW7+Tf8CxTzPCQE5g9VMw+FdrLQsFXYhkMIii3mlDsnOWBYf+36nw3zAS?=
 =?us-ascii?Q?Ac0t+pizs03xngdywUaqyaWLrOzaHHPuw9KaKQp2FWhcVSTUdphHeOjwwVUg?=
 =?us-ascii?Q?IQ1wsWMsDUyn76Dh7hWI3uqrF2waEDhZ42R4WnlglW4jYnoULNS2HCQbEUKw?=
 =?us-ascii?Q?ulc1PFvrK318N8SZuYiDCS+Aq/r7Lbxye2hRfPzRSsh7/ECw1lk315eVevHY?=
 =?us-ascii?Q?4Sy9qPQ9ZXTtrv3K3dqjclV/G6i898jo4WlEdBkdpf49KiNwLJpyD/X6uFqa?=
 =?us-ascii?Q?jYgnD8om+s3l0iC261LwVpR9GYGXXFuOtAUBWAkhl3dkZcl9mKmAfwdqO7L2?=
 =?us-ascii?Q?sGf8u8lwsZBB3NtDRN/oqOGut77DOEM0LRtHNicViGGtUKn/AZjEwObH6r3G?=
 =?us-ascii?Q?s5TGBBkO8IFGpkgYG9qiN2DFEgblQwUMfJVRGhWPaV2wAfJRGdSffknmdXhI?=
 =?us-ascii?Q?sHBCZCCcwuLh8mJ9d5boigEsRtSvGCDb2ySwXkn87IwsTU17UdRj4f2MGxAe?=
 =?us-ascii?Q?m6EMCfP5zZDNugJi5ycI2MWEd98LoBHEE31EsN3M2N4AkcUVjqoj3pc/NDIP?=
 =?us-ascii?Q?1Nrm+xhR+j2ZR95LttLoPXYJXMVK9T6sSBgLi+vkNlyvJThHmEn0H2a9Onov?=
 =?us-ascii?Q?xZD75w5ucMWe6Ui/kCMnuY2ZEPY4+FEOnn0ZQDuJbX04FI/yy4FjncFEVPG7?=
 =?us-ascii?Q?Oddw0mnm+Y9B9X+J1OagXjP+xbFWtXnbwISp2LI2xlwZDZW7W6cOgmxY22YA?=
 =?us-ascii?Q?fCanfJGG2FXeicaw253PveYCU676r88lbXex/aXwxu4O9uAWwfjVtOJkbAR8?=
 =?us-ascii?Q?Q2EWHhiHcWn/2o2Kxh9EzUxoarmIcEo16KVp3U9YVb+1NcV1NJ/IVoufbpJB?=
 =?us-ascii?Q?M78gXkBiI77ZKkq57p8NIBwn/S89F4kxHuYP0wphB8MWFSmpBHrpW8okY6PC?=
 =?us-ascii?Q?NX90Xp5PgUQFLKnFwG2XsJcIE7XRs+YW5GPeLaXZvaaoz+IwLkwvv4J5C3RV?=
 =?us-ascii?Q?5M2IhZwxGZUi/Fv5Gke7qYYo80crdswMJZUAkf/Ii8DFpu9TwC6dadST6Xfh?=
 =?us-ascii?Q?j89M3mKHAx/x6fP5/ARCi3TL1JpnK5GDZM4QsS0KiArh1BLVgXQaO2lPlnSx?=
 =?us-ascii?Q?ayU97COmMv/ywolDcKn9QybgW6epFR+jBPC5RhMyBz/7Q6CVjvw/MP7QR+0I?=
 =?us-ascii?Q?5+2vuOjolZruCFNWlHzTYW31X4xrDkZqm14d9tbpLdMiG4J08fDcrOzZ/vPc?=
 =?us-ascii?Q?FWamXeBaaYvTh6hfQOVG7v1AB8/qM2rhQnvZHCMkn8RoWSCXpnUFIrIvNHVC?=
 =?us-ascii?Q?Xbv2guJI72MsMhqPR9J2M6PDks7VurqEQVQXLsdtNAWQBwOdWQRJkQTj+tyN?=
 =?us-ascii?Q?86x3IETjLNw1O1El7hs3aRPmVXDKFCQYVZrBahKTnIyQnVeh+qm8jqCRczzw?=
 =?us-ascii?Q?1vQMh3eo1jPlEi+BuZtc/coTdQpNMiofRO4xWprhnuZdyNOmvuAlFR6NVQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cowGnOxYDxFt5rKctRk4x7gl8ZvsNckWpG5KDLUhFTycxTgVtgfqJtfIJ1d1?=
 =?us-ascii?Q?jp1bwYKJ6SdL4Jri5LnE3PYEoP+Lts19ewKRLO3YUiino1L0f50UGOp7oMjN?=
 =?us-ascii?Q?VqmMqELqKIjazrWBzE/jxHt1dAdM+KAxL26wGH2BEy8jSaGo50Wyl1n51+IP?=
 =?us-ascii?Q?EvuD3/2n4bSjIe9ktF/ZIFHmlbs3mdNW6KdokPlfhpYCE1AtpQ66Dh685bmh?=
 =?us-ascii?Q?2k2dyo0x+MR6oiRdE5LBNaDlHo+3PKmK5Ah92VRWPnZsiNZbkifmu7+NdczG?=
 =?us-ascii?Q?6I5HBDRot/AmmC6MhVSNbB6tu6eldF8xB5zYS7cFh7E0BXRaJ5P8mXIKlU8p?=
 =?us-ascii?Q?ltn8zl56MWj68OzcxWopaa7C8oc7olarkLSipIP2OibIJIodf46+SUpqdSIz?=
 =?us-ascii?Q?ignxYrlKAWyWmyZYFqvcfguKnkvbxsYvVg4wmtPcQDWecwmnXCKd3BkNRxgp?=
 =?us-ascii?Q?uZVjkB+IZ1mOh80UKf+0VaSXKoaYUD+vDH03AijX8/Ty6Cj0GU1yxivrqDU0?=
 =?us-ascii?Q?Rezy2zHtbmp4P3+4rrZNmo1KYC4xClF6+Ewgoa/XXv1cJDlcjXn/x9SuFgLo?=
 =?us-ascii?Q?ZgpVmlW17oa0p162FpWAnTAcn0L1elguCmoom4BvqUs88cSRKAev/b721f93?=
 =?us-ascii?Q?ncJNo1NUjJpngMnr2E2gilRhpNidFDC4dMrYxo4A8hQZEmM/bOw0+0qn95Ve?=
 =?us-ascii?Q?gXNtCwuTlOKCZuvxP+E+/2wx9vVyz7nnsiQV6hLo86Is9zIC7ltIeKTRW3kU?=
 =?us-ascii?Q?AElY1NJunQtEiN5sLynl4MPVTUJJYE774rTT+zQcJMFsHr/ayt8N0sXXDaRu?=
 =?us-ascii?Q?EeZ1yqvZ1KzW8sgtPAfbi937pktgZFOVGQQnQgUmznmNFGsuJ7LslggV3xC+?=
 =?us-ascii?Q?KaPJbdfOTk9aEykVQ6t4//V4eD4nig4Yc43OgsS3C5sIMs/I5gyJfuZu+iEi?=
 =?us-ascii?Q?nUhQlf91iqUAjiHG5yXMwlZgPR0D/G6PWIiAh37Vhc49ABzqtnMe6leUd9iK?=
 =?us-ascii?Q?L30YE8Ac/vJ0TU0+iOrID4D/+fhwrCTmrNq8ZT0zoph/HLXq9PCPplkXxXkF?=
 =?us-ascii?Q?q34s/xn+1Ka5dXSorQCPfKFgk0qBLrvKP5yvc4NavDOfN+TRiy0UPgCp+GQF?=
 =?us-ascii?Q?fNAW+Htx8wPLWnpk/PKt+Uuuwp9BoU/K/ijAfhwDxfN1j/87W3J3NpDyAOe4?=
 =?us-ascii?Q?sZdKjHITVE4v+a/HNHp2rWAbjIsTKpTAvJqhRPsCT0kMe6gHbOUqRQJmDbfY?=
 =?us-ascii?Q?9n6KeNcTl6lfWhwGMc40gmdUkrDqzKO7kYU6qK1rsaFV1gTBQ0RE9vp0u6SL?=
 =?us-ascii?Q?SYAYO7Xf027RdR0BYkLP3GxSvr+DRWOpWHT28Xk8JK4ScKE1TAVZ2kQrsTg+?=
 =?us-ascii?Q?qNAE1AsOh4mUh41VKQh2Ert9Mgk9M6r/hBXqkDK/utvIGbSV69wd0EbUzn8j?=
 =?us-ascii?Q?4dVrUN95WpBJ0hq8st7tnrZHNjYugcsmn9qBPUWl/thKkQQObjsrpKA4At0R?=
 =?us-ascii?Q?v8DSgoW2wVfRgjACWT3JDAa2NcEw8+w8Ucg9VLpvJo1CLht+T+kHiit3i0pd?=
 =?us-ascii?Q?nT6midlumqo6m0QpnokoG+GtHeMpS0HW+qsnD0wy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 292141db-19d3-4850-f6fa-08de323a86bd
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 07:06:48.4875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sBAsrNkrSqGwK6feOv/5qTSJpQ6dQ8yXn13Bt9zn7FM1fSq+PINpwNKmmTum9PdPi3qjruCOtRO2FUC6dRX7Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9174

Add bt-sco sound card, which is used by BT HFP case.
It supports wb profile as default.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx91-11x11-evk.dts    | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
index 313ebc7e8a9c..55d2ccafc376 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
@@ -31,6 +31,11 @@ aliases {
 		serial4 = &lpuart5;
 	};
 
+	bt_sco_codec: bt-sco-codec {
+		compatible = "linux,bt-sco";
+		#sound-dai-cells = <1>;
+	};
+
 	chosen {
 		stdout-path = &lpuart1;
 	};
@@ -77,6 +82,25 @@ linux,cma {
 			linux,cma-default;
 		};
 	};
+
+	sound-bt-sco {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "bt-sco-audio";
+		simple-audio-card,format = "dsp_a";
+		simple-audio-card,bitclock-inversion;
+		simple-audio-card,frame-master = <&btcpu>;
+		simple-audio-card,bitclock-master = <&btcpu>;
+
+		simple-audio-card,codec {
+			sound-dai = <&bt_sco_codec 1>;
+		};
+
+		btcpu: simple-audio-card,cpu {
+			sound-dai = <&sai1>;
+			dai-tdm-slot-num = <2>;
+			dai-tdm-slot-width = <16>;
+		};
+	};
 };
 
 &adc1 {
@@ -372,6 +396,17 @@ bluetooth {
 	};
 };
 
+&sai1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_sai1>;
+	pinctrl-1 = <&pinctrl_sai1_sleep>;
+	assigned-clocks = <&clk IMX93_CLK_SAI1>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
+	assigned-clock-rates = <12288000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
 &usbotg1 {
 	adp-disable;
 	disable-over-current;
@@ -528,6 +563,24 @@ MX91_PAD_I2C2_SDA__LPI2C2_SDA                           0x40000b9e
 		>;
 	};
 
+	pinctrl_sai1: sai1grp {
+		fsl,pins = <
+			MX91_PAD_SAI1_TXC__SAI1_TX_BCLK			0x31e
+			MX91_PAD_SAI1_TXFS__SAI1_TX_SYNC		0x31e
+			MX91_PAD_SAI1_TXD0__SAI1_TX_DATA0		0x31e
+			MX91_PAD_SAI1_RXD0__SAI1_RX_DATA0		0x31e
+		>;
+	};
+
+	pinctrl_sai1_sleep: sai1sleepgrp {
+		fsl,pins = <
+			MX91_PAD_SAI1_TXC__GPIO1_IO12			0x51e
+			MX91_PAD_SAI1_TXFS__GPIO1_IO11			0x51e
+			MX91_PAD_SAI1_TXD0__GPIO1_IO13			0x51e
+			MX91_PAD_SAI1_RXD0__GPIO1_IO14			0x51e
+		>;
+	};
+
 	pinctrl_lpi2c3: lpi2c3grp {
 		fsl,pins = <
 			MX91_PAD_GPIO_IO28__LPI2C3_SDA                          0x40000b9e
-- 
2.50.1

