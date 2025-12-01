Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011001.outbound.protection.outlook.com [52.101.70.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91D3288C3F
	for <imx@lists.linux.dev>; Mon,  1 Dec 2025 07:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764572428; cv=fail; b=K4ZnOgZoF6ElhtdeaWyxgXcY1e8Bb31EOIL4gfbic4gLafLnXtDMADjVGXQ4WN6MiJqmpNxUiNRU1aAlakJTkTwwaBUnu22fdIlBAs4GciUBcGHgn10QK1gNjt23hboFQf3IkbCG2fjDqjLqsno5mWghrvOTLwk9ufqPODEwzmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764572428; c=relaxed/simple;
	bh=a/jQfLELH7wztgwCwgw2rlL6lbfi72pzjdhnNbXRdyE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mc4n0IRCliGV56TO7I0Wc25aBn47gcfh9nb4wAXsExofI9MD6Md/nt2fNLCKa12Awtr5NfdZUg2il5hRTNHl7cRdNYEaMniwtbp/6h+rP3HHabeufqaKzWLTAA//KGdMXEQT2JXXBu02DWOkk8JGt7AYKR5MdirWIUyoCT1wBsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MNvuben9; arc=fail smtp.client-ip=52.101.70.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MNvuben9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7qNEnpEPVqWqIhFkG68EjrHeFuHX6JYa+5gjnuduZ7xpmz4l47uebv5/pPFRMgcbN/Nt9wOAl7RMVsWaNdGcosT7rd8J0A6jY9+WxqrRJ6i96dzD7KlTnO7VYmpovkIBI/i0OdBXYR1250iHkpb6whLSlGHRXZ9a9zcOU/5it46Ln98sWR7rWMayNMKgyyEER1maE5/fVx+FTg9wwzVqrSG4pT/Lxg+Ts5cRATBhXDozmks0jyRl3+6wDHqbwGx7mDUJ8oOvFFX2xzjLxmu5mtF8bV/AKgRjHO0LF3wZzw7qMvvbbJJPpngQRrDqLRho2om/uD34WJgAQutecmXiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYhuke6AubSVU7LUxXmfH/wTUMQs3Aw37If5dzCs0Qo=;
 b=he6QJGy007i0WGY2w8POG2egrwCOXCEQ9hFJwKtkAPvH3d6M30n/hvg8a+FH55Wu19KjInQzIaFiprpQxRKjdBWmvaKdBzZAD48GdHhlf1Ixc+nnlrEFrgJ8zEUOMM0LJ8ZiHqv2j7rdOnY8pz7Whzp3FLzweadlH7PIsNI1zDb5il7nSIMZgIapZKcriG1HQAaP+MGMz9LQd0S+vGtcQG0Om5gx5qiDmcZMrNhZStrOP2x/zy8yVimLoIv71mQrIVP40cPmEL8oZp8PU3CKBvH2VCCKLW2e45nP33xcWIMVxERzMHgc830yIv16GApDlAof76U0PWd0U4L+2oeX8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYhuke6AubSVU7LUxXmfH/wTUMQs3Aw37If5dzCs0Qo=;
 b=MNvuben9NO1uLhP9CBO/8oF0y5UCkcRRVlCz/mpV89a7SnKH3Qu3o0hZOdZNvgfvpJISalQnv/FYmMUSQv/7qTKYjeF0OPMnjjMB+hiovK07iX/FWnKmgNFbT4n42hr2fU13lc0ZlnqA1ysKQOQ/xL68CRzOp9NiGv8F44GG3Gx4clwyx2bOPRR1jihJwDIhWWS10+FIYuT/ZHWpLvoH90x4ADoyQe/HTX6BgctAaOjVR4lUJtS2GkUbrKIY/8aHOaCPEur6zooZ6CU3Qj35zNQKZR9spq14uKbT0gM8giWMa2GEcYXQ1T8Lr+zpV5+Ii7A9Txusr0Wn+IEN+ka9bQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by OSKPR04MB11416.eurprd04.prod.outlook.com (2603:10a6:e10:9b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 07:00:24 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%2]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 07:00:23 +0000
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
Subject: [PATCH 1/2] arm64: dts: imx93-14x14-evk: Add bt-sco sound card support
Date: Mon,  1 Dec 2025 15:58:43 +0900
Message-ID: <20251201065844.3823323-2-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251201065844.3823323-1-chancel.liu@nxp.com>
References: <20251201065844.3823323-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0086.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bf::16) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|OSKPR04MB11416:EE_
X-MS-Office365-Filtering-Correlation-Id: d40d0008-206c-42d6-12a3-08de30a74cb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rThDOPIqrvI8XIKuTazERzoWsE9PUh7EwZAmCbksFlupGWhSraSIi35Si5Xc?=
 =?us-ascii?Q?SVfbKQlbOPp6xeymZy9Fzs7c3sD2a4/h5GIJNJZpkIuUhGdsJ0PAGuD1MclZ?=
 =?us-ascii?Q?3zsbNNK36x1hsQTIZ8I0Wv5hTj9jMi9qx4RhjxmbnS7hYIj10t+jtS8FDhx6?=
 =?us-ascii?Q?lLfj3dUhftB2Y3GFlNPZ52f4adR+zLZrQh1okHRpWoW2e3epuUY2aeNw9Qrq?=
 =?us-ascii?Q?y48kKdpIvhN1EDx03RY2TRnXAkmM42z3HPfM8X7FIgtr9SPXoqxpF+rAKL2M?=
 =?us-ascii?Q?i2FA4SORmX8ttWwWM4IQJIS5pWxEBVUFS12enW6w+V/7LRuTh8V+Zs0fmUf6?=
 =?us-ascii?Q?RYoAap297SPhCtkAHGxDmcnsOHOu6xh92ReyFi6ICFI/UgvQrm7tgFZ5HqzL?=
 =?us-ascii?Q?lN8F5d3nqGjrW4lAD0THOm0+UC7yny2UHziRJWV7TLgXbbdd8R6SWwAsfjTO?=
 =?us-ascii?Q?I0gvwyKKESMqDWX6hJzma2cygJ4lbQZ+CTAQm+M4K/Ft+IWwxMLr5mQZRqU+?=
 =?us-ascii?Q?MioJgIRb2pIhtV7fx5cKuAUE6UliVtAkWBDcAjDVlBXcxpkfWId1CXtBFgaD?=
 =?us-ascii?Q?Qer9eHRGF+1cm8JObmQkTbVfM+13LAypPLkFpqij8AKKxtIWQuw+Tc/sK0nr?=
 =?us-ascii?Q?iUWtuelX6FCiti1hqsKMb145TI2VcIrtBlogRYgS5GcT48FmcpFf/TLYL8S8?=
 =?us-ascii?Q?6jQbJ9VnptStoHI0PtfpkTOjLsMbNiFxql9JagWdlmpOPBWWm/w/vjMzb/PJ?=
 =?us-ascii?Q?cZ7oTgCwDeRY5X8Qiq8cq4J2X6aHDVrBqxa/FUUlUFysFDHYxBqms5u+qEgN?=
 =?us-ascii?Q?jpB42GY7O3Zgt0h9+E9DNEbMJx5H7AtobOub7jGyghMh9nlcIx+4HTm5A18/?=
 =?us-ascii?Q?ICwt7kLQEPrysqrB+SVlnWwSTdKT+AC9PQ9Og/ZQw3TBcRYzSqDTsz9Jvo1S?=
 =?us-ascii?Q?zh9BbftzzTb5jGEktwmUAisdkSE/bHsAAUbynn0yWoXIu5RdvJiPrymEI0dE?=
 =?us-ascii?Q?2U4/tvXn4LCh9vjD/ErZJLsQedcTFnHtmVz6opbVEUoBKCYgBMOQPOpTdKCh?=
 =?us-ascii?Q?MruC4HEfZXKz5D+ZsyVfSOFKj4bxOuwzFkkC8oGO6qi9RKLwTKJE8ORB6tfo?=
 =?us-ascii?Q?z4zwSut8snVy3m2jFb3mu0JeZX0rkjVqlVx6ut9iQ/ZdULIFTVxe/Ciz6v2t?=
 =?us-ascii?Q?8csY6MHHh848PCQwCm0SwiWqyjOSPOCIJO+wLWQLNkaA9o5OJVRsrp3JXSYN?=
 =?us-ascii?Q?1Dyq+k2cxsXK37XgxyOI22D9Jn1Tq7TUzJiSYkvs6Etpc35jHsKGugjlJrzd?=
 =?us-ascii?Q?ruW6a2jZ8a7wr9At5vHQoHcbV4FKWB3BCqLb2W7CVPKGvSo9c85cnSe2XNeI?=
 =?us-ascii?Q?BfIEAGXzdIk6If/0fikOMqYsm/LBl3w5/2FcvPFveKL2PSCoRyG8JwbE2UrV?=
 =?us-ascii?Q?i+uBzLsn2FvVpInX15Tc30d7rmdFz5ZuXKjI98UZPmjluE/rh9QYPdYJWXJG?=
 =?us-ascii?Q?1BTpFR3olQGdekEqADtmu4x2q1NyycNJWNq8jbmi9Vyx9vO7BrQYQ8TUUw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ji1MOXg/Bw1SNs0NBDiOFvD0GyfPgHCa2OqAMm7z7/xrDg6w1Dcx84eV3jSh?=
 =?us-ascii?Q?Uzp8fTrkI3UrKCjpawHfv8baAFziIWVpFePS+YI+Si2Unl3GZsYc8eQI8WNS?=
 =?us-ascii?Q?xhVHDxDNwNS/5J9T8pUfmAz+ZSST9xaYx6E2O2Z03PL3ESytLgt2KmYqN5NE?=
 =?us-ascii?Q?grhA65/Mkb+4CdkYHBtQVhwM1LVj8JErj5Qbu8KhhcRA1cTAjeS7n0WjWkJ7?=
 =?us-ascii?Q?lfmw+G9w+LtIA6PsJaDCqTy4P+/aEMLUW+ZYYdZMUzZdsGpyAiFhpg5jwJKl?=
 =?us-ascii?Q?8zRGBngAgZXDGYy3KiXu5HuOUrcq11HbIzkUK+JhJB7DynWd7tfdZE/P3fBT?=
 =?us-ascii?Q?x74e1FE1swpmurxrmeIEDEbbrhDEpM12mCLQtl+77Ue6nmoYmvmJIHvKG1YD?=
 =?us-ascii?Q?AxyXXXSGWl3ETQGIIkX1g5e0iJzcwJpAWsUP919A2hTokiPNopA56XfaJZJK?=
 =?us-ascii?Q?KHgwulDbA128t/rgsV1f/gp/h0TX61wcSZ43HbulVdePrbIe9wsMm+MLsS9m?=
 =?us-ascii?Q?sLujiZO7fHU81fpBSF1xbxWQLs9g1AvumJhSAOEfU8adCwaPS9iUOkCuTYuF?=
 =?us-ascii?Q?ehgwSRxTOkeP8OdZmkbZ8Uim1rKTWrhL69tgKX90033qGRj5De7mRxkvAlWZ?=
 =?us-ascii?Q?pc9R7CL4vxrvY/K/6kWuy5b7Y62jHW6YfA5AnezfHnSN6ND+VIvtt47vYxVU?=
 =?us-ascii?Q?5Do5Smoc6+5AVYG73PCh2PuqulTILA0xRHHo+sES8xtK0/lIiuU0xwRcoHHO?=
 =?us-ascii?Q?dTpXwrIKa3stQF+gWELjSZ8rhHv8d0txbsTcs1DN5wC3S0G+LvDIqavPKxba?=
 =?us-ascii?Q?/1QgVUfPJZXA+KKkI37hrGpkCFVHYtGsz4scLJqCLIHuGVpf0h5q6llg98sl?=
 =?us-ascii?Q?fY0yIGnajE5FI0Cv2melSKUI7qnnI/AHt+b1/5FEekxn+2+kWXnSrcmd3SQT?=
 =?us-ascii?Q?UmykjhE82fK+0qjQw0JX8rWnNCfOqjCfdLgpzj5hbbeN8HsI2bWjl879icQG?=
 =?us-ascii?Q?TbwczKQIslyhmdFC4vqmCWhC6JUcqhm4fVm6AH8nGCkz5ZEEeaq+j1RKg2vY?=
 =?us-ascii?Q?Pm/zPFUzLW36jWeVJpS+EcsfAF+rJ7UVtOcYA1bHBPc9PZEEi0M7vwNDL3+K?=
 =?us-ascii?Q?9JHvqvNYyfXVEVi3k4UPvApsUamuZXdf2o2MVdem5JfAQoVuMZnFuj1A/CAO?=
 =?us-ascii?Q?AGmBfYrpR3XPGcw5PDKh1vkE80AQ5LbznEGn8nEn+01p46RaK8z19Mglq+T3?=
 =?us-ascii?Q?YphFCJTYOqxOoWa2wNiUB1/Wp5uiON9qTcKnT9xVWOeOV7bH3pExtxD+HiGn?=
 =?us-ascii?Q?viWYwZkuDNCc/NzxG+XhBj5TZswqFukXePvFPg81F3vkQRH5O+ekfoYcwXru?=
 =?us-ascii?Q?PQMGECADo4cuaEEQa1HEV8uDSz9WSzrezHqXytq0DyPnQdwreENiRKrrHanL?=
 =?us-ascii?Q?0bOr06A/RcFIx85vZGLcGgVOfR72WQhGqGubutPiDAfoImoXh87WqnZ7+ilT?=
 =?us-ascii?Q?5foq8hJeXCf5rnXa1+doH/DftaV57PrUmbVu0YLaCjqTaXT8NEJaA54u0QSE?=
 =?us-ascii?Q?v8XFoMQyVQSbrD2hRGZqsnZUw1CUxPmSEzcpDaJ3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d40d0008-206c-42d6-12a3-08de30a74cb1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 07:00:23.8912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 47tDDKEwnua84OW1STtkiP8M5kJifIABucwgUJNbaOSFC/opCqAtxE7awseTpOIbmT6sthlWrOusSk1gx77gnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11416

Add bt-sco sound card, which is used by BT HFP case.
It supports wb profile as default.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx93-14x14-evk.dts    | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
index f9eebd27d640..e47fee24471a 100644
--- a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
@@ -27,6 +27,11 @@ aliases {
 		serial0 = &lpuart1;
 	};
 
+	bt_sco_codec: bt-sco-codec {
+		compatible = "linux,bt-sco";
+		#sound-dai-cells = <1>;
+	};
+
 	chosen {
 		stdout-path = &lpuart1;
 	};
@@ -168,6 +173,25 @@ reg_vref_1v8: regulator-adc-vref {
 		regulator-max-microvolt = <1800000>;
 	};
 
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
+
 	usdhc3_pwrseq: usdhc3_pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
@@ -371,6 +395,16 @@ &mu2 {
 	status = "okay";
 };
 
+&sai1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai1>;
+	assigned-clocks = <&clk IMX93_CLK_SAI1>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
+	assigned-clock-rates = <12288000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
 &usbotg1 {
 	dr_mode = "otg";
 	hnp-disable;
@@ -568,6 +602,15 @@ MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x31e
 		>;
 	};
 
+	pinctrl_sai1: sai1grp {
+		fsl,pins = <
+			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK		0x31e
+			MX93_PAD_SAI1_TXFS__SAI1_TX_SYNC	0x31e
+			MX93_PAD_SAI1_TXD0__SAI1_TX_DATA00	0x31e
+			MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00	0x31e
+		>;
+	};
+
 	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
 		fsl,pins = <
 			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
-- 
2.50.1

