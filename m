Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011048.outbound.protection.outlook.com [52.101.70.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC20B30C610
	for <imx@lists.linux.dev>; Mon, 16 Mar 2026 02:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773627009; cv=fail; b=nfeJDuYKPIUQ+4Nht8WgGx036Q5DJUtqBwoOZvsFfh80ZMv/IGWk+XG2Uufb7PWwUapZVTOQwROWxSRJfPNifWj0TB/sQR/R9dFZv93HxTtN+nHMd63yEw6m3KdZ1Sxy4bVYvf70yyBROe3DrK4kxcP5KwZWfQMYcDIQw7vKl3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773627009; c=relaxed/simple;
	bh=KRqIlU/DWGGJeT2HYb2sm4u0QxuWFKTiSGbcwAagSXw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OG4K0keUJ05VFLX6QwGKlXHX1mMR0/m8qCkPKs7/Iv/3BxDy1uIvVZFcIDJ7RDCzR1HOG9oAp16zvvyV/rQOKixyEuwOksMA56aqkt6P9PFnhwU019FBI4Yar+R54hwt3pxIHOV1lfNbU7DM6YY7ldb+sJo+f68h8dxXvIfAlak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=U6+9YkI2; arc=fail smtp.client-ip=52.101.70.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="U6+9YkI2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBuZLCg1AtbCLIgWSyet8u/FD11nojvHixve51QT17b0HIZBAUFWLEX4h9QJ1CPJab82bCDF5zbQtDuMJUMAvtemHmWOBD19JjUCPflOhzR8RPM1HPPFZMMTxYAEVu8jOXYzdG7oFf/MnTydSq0GKH16fp9Eql5auShzIhqKydFe0vdg2TYozSx6OsbnMZFZREUwCvNC6J9VGUfaa+q/OksW6xQSY++lsFU0/hNYryT9yI4DMXveLbOkvY6sFOiPn9V7sciYt83ht1tUyDrhNDhCuUkzzzO1dj0nmIehSqhR+0CrenEnIeWQBN0n9hRRY+oVxeTfceZo7UQ4K48mQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOVRy2tcnDwfdZy9IY2tbEuVaH/ldifaSVn6yn0Jaik=;
 b=QDVBiyys691ZzbLQwXGJpB3spyVEffzrN3iPHKIVyrn1DwxSYz4XBcr80ModvUpTyFsvrWYnjKipBXo8pNC2H6OlFpuzIRhuPUlhKNv6Ov0a8gdR8/366I9Sm16AmiJPqG0XZNqPlZkxSZRggwMNKV8mLSqJ3wPuRl+/RGJiDx50S6dEWubcQJw93A0hLxL1rxY76i+bITndPVMqURLGf5SkLb1wV39Axl7kFPaf9aX5i3+4p8bI4UbYFkroR3/dqcBGdf5Onw+9ds52C3ZqP85p+bQEfGGdSy4+9I3WJKHxF5u/f137iJF5+eAYuYq0RArlUYmtjK/iTI/q3pzRgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOVRy2tcnDwfdZy9IY2tbEuVaH/ldifaSVn6yn0Jaik=;
 b=U6+9YkI2f6aGJvjS0R7vc+dZNOSHVpVYZr4zOxhYNCdYOvxkTPr8ZXDBex95ZNplnnsDIJszxRx1suw/D+0ob3CuAVOBLMtVuN4FDTxxiHdEgBhvGOopDzaqNUbWgNebsCou/9h3ljbSusEB36RergtLnSnLPqu+KeqErzDm4xwlQmane6aRioNmn25ltqsMsU8nkdt1bQrBmCaGz7N10LKfLVE2hy1TEataMF44291tFl6r9I1RYW3v7ls0s51lVUCa15lKJ3fYpSBvfLsocP1ROWPHzBLJR4begHkk/tR7FGHeJnpEhT3+Uo1q9KaZ6BW9bsnyFoG3BuBH7t9sew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA4PR04MB8047.eurprd04.prod.outlook.com (2603:10a6:102:cf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 02:09:38 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%4]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 02:10:05 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: imx952-evk: Add bt-sco sound card support
Date: Mon, 16 Mar 2026 10:14:38 +0800
Message-Id: <20260316021439.2971610-4-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260316021439.2971610-1-shengjiu.wang@nxp.com>
References: <20260316021439.2971610-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0043.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::6) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PA4PR04MB8047:EE_
X-MS-Office365-Filtering-Correlation-Id: e8881116-5f6a-40dc-3b32-08de8301239d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|56012099003|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	K5VQndT8ChbqbcOQykRKt/v7d5Der0BW5AY4VmfHT8GT7s86i4cdeZbgd9CmQaaGd0p70TD7TFkvsWtJP+LMlWUK5nIkwh27lKgIXoiWV7QGO0vqoyfHVld8QsEo3CCHv5y6QnRc2Fu+YzrKnlFeePhSxJCIhUUx9jkR6JRf1d+lZBPDiwfp6Kmko5c5ldL+PAWPkxii8BlDeTdEilT8FLsuYPxMyZkeeCV0x2/tIhmv2YRbO1pC9wVxtxAuw30iVQyyERdwznHmCwJ/5xfyBWqm+pOOTjvQC+CtUXU+/Z1HV39oigweRGLkioqL4aO/rGDRDQiRLRXUA/z4mfqB5JJRn9XQTJGszeMT4Q8d6iAyVIpUJMZMUi6i8zf/G3n0FAOlsASJVx8RYrlQdQwxWTmdDAtHQRziYZ9vLOcUIx83bZXyjIUFdPZ40b7pdQRUPrbx1vrsesghdbwgWCTwVfTe/0ROpdnQIPLCYfTG+cEYvzy2p+hLDPkJhLcQYWVVYWtEdGqzixv/qg36+giAJfCMbiZq+Vi2552W5j+3fJSdxza0vaY5BpCm0HTGXkd4ElRKUDJupImAWp/10XYt5IaCAMHxF32z6juevOAa6z3HcnLiegpRy4MftKdtk4f3qotBEV8P+D2mDr+KdlIsNRKzmA0Rtp+lBoWdsWAOhtp5xBjKnJGLkQGn0Y+U6NPMe7acjqydidjOSiX7JWQ+XZltvJhXGXVRVmeI56RyU/ooJD95jyrPIyfvchbtSnoKL1QghOjKjZAIUO12r2RecxsuN0gdSv0U0X3QEVHU4pZYjV+fGYr70Qa1DD/1vyry
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(56012099003)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?99OH8rclkwV8Zy5Jr+nXY2z6q9BUDS4SgVfzt++E0/W8fB7OVwBJekqpXk0Q?=
 =?us-ascii?Q?X1vYbZ2lFFNEIg9gbi/zq1ORLj4iyquqf46YOOEMfGOFlViPey99RERHUuti?=
 =?us-ascii?Q?/qOP3OMGYlyzYRP2zfiZpudHXcx3j2fxNNyVaUN1cUuTd27OO3UwmwRc2+yH?=
 =?us-ascii?Q?lBa59BgaVo1siE5TOlXaO8JOj+D4s0WCA4YLSEXAKBeq9QZ9xw+Xy5L4JE+c?=
 =?us-ascii?Q?0Crm2oueHyRPd1CiahMS2NO8dHTj6fH5TcpNChEz7RsQg+m8R+8wQhNUUuH9?=
 =?us-ascii?Q?vQclyjVNjwZnvUKCXi3ENz/TuyQBIUFt73Ft/cW4/HPImgsld1Hig9AHXi1U?=
 =?us-ascii?Q?y19MjlNoLNXL/ZVtni00uP1Ki0YBBx/p+diKIMpmDi/V6Qnrp2BK+0YK7Ngt?=
 =?us-ascii?Q?VREh4tpMURs85iDmdqF7o659qxn+fgXtBh/UiITTrYRWSUQ5YMDdlhlflX7r?=
 =?us-ascii?Q?MvdUFfntDzoggJrSiVlXqlDjzUiQ+y+wG4UmHbMzPVm/OegVAYNAliaQXpdL?=
 =?us-ascii?Q?oSjd2jlhrm09ss4Z35D++UDKwJMPRrsb/sXESZ5oZucaEd2nw8Ojn9m1p5VL?=
 =?us-ascii?Q?aYfi1ZjDzzMIF1/4fZp55Ib37wMZ7hUL1zsPf1/tWK2eVLtnEm0q/oqM/6QM?=
 =?us-ascii?Q?k2JQrI6GgaUWeW8Z+iWYTQ/GKDQD5RSXqGJtSL+O4n62g9O6CoCBtMnedZU5?=
 =?us-ascii?Q?iahL+2XtkSClb65JH17s2j/BU5yKqQQ00gto35gaU1fydmzkWEAEanVkpSt6?=
 =?us-ascii?Q?1SDzrEQ8FnCZgAZxHxMM5nZxVwAjrpaTDbmptz5+aFmTfXKv7o/xSPifACzr?=
 =?us-ascii?Q?d1qxcSm6l45/ryQ0i2VsmXe/mTd25yD5hFiRwNdvpcvE43PXNU4GNGeRvqLz?=
 =?us-ascii?Q?EXKo78qAmS5yPvDciiTu8zhBgCJ1vWpOVkR+2a+yfIhWbxwMZ345hpW0jI5L?=
 =?us-ascii?Q?4fRQFNSyzUZ0vJNjgiGFxSCyyWa5SlZ6vAeOk+d+aYxMISkFTzIr5EE4dwaX?=
 =?us-ascii?Q?NpnJ2gBNjX3F4xiiJ+79Qt9QR6c2XgjiFudBWswQWZidLwNBNI6UYGKA70rR?=
 =?us-ascii?Q?u03QTE1TMdEU0EI+iffImJNT/eEg/d5vx/uO4bpBNVtp6K+oK+Ldj5a0qDSI?=
 =?us-ascii?Q?gUfewF6eUvVxVL/C9AatMjAkRASs56Anyz4SlFxTQ29T1P8JJem38tcQbgl0?=
 =?us-ascii?Q?LsPKQ3At09SIPfxQNmrknvfrmVtztq6yoh/W3zywLvrDwB5VS8bdtgn/PVYn?=
 =?us-ascii?Q?kuoVjDwVZ8aJZChaIrVadEz/NlZ0Vxz+6lpU0g2aBvbUB9LTUTaOwOlvJ/Pl?=
 =?us-ascii?Q?Iyy+csaqOSeSoUa1bi6K+Ur/23SxuspMbKJFG2LK1CCl82GO/E9gKq+hoXKW?=
 =?us-ascii?Q?+Tv5Lj+t0oo6qKCgoJ6Yz7BKUfPJeK/efW1deVNmaNq7ahSgewLhTR2EFurh?=
 =?us-ascii?Q?2ia742ktZicvFQHvmq1naLlvWjS9RGJpIYC7SOHUc88NZO06dtrZH7ALCDPw?=
 =?us-ascii?Q?cyBjT+vcyrKhIR+uJTbQ8JP/f3EW8IqTElCwE2DaG20sZ2tYhKmSIOO0sHoJ?=
 =?us-ascii?Q?8cGfHjeSvy2AXPrqT0PblzyO1+lEF8pvnBy7lHib31Y9C0I//biCcvstBfDy?=
 =?us-ascii?Q?K/+rTUbJvYYvj2yPQDMJBASODBFILmWOfLn7sj7cfpmdk/4nGfdYxDhXfKmz?=
 =?us-ascii?Q?FLMu1q9orhA4nrzTxqmQ3ZcFLO5uo66zoIH+L2m4m5VCM5uj7epkVwrgA52M?=
 =?us-ascii?Q?EKhjgFu6Mw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8881116-5f6a-40dc-3b32-08de8301239d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:10:05.1145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FBMbGMa7AVJ00T5uzP123a1NC/9ipC3PDvoJI1uPHE5RtjRNq2o6hIVdBn/t90Gbpkw80ONjLOgw6V7580BpCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8047

Add bt-sco sound card, which is used by BT HFP case.
It supports wb profile as default.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 59 ++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index ef0058b98573..2615fbb63145 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -43,6 +43,11 @@ aliases {
 		spi6 = &lpspi7;
 	};
 
+	bt_sco_codec: audio-codec-bt-sco {
+		#sound-dai-cells = <1>;
+		compatible = "linux,bt-sco";
+	};
+
 	chosen {
 		stdout-path = &lpuart1;
 	};
@@ -140,6 +145,25 @@ reg_usb_vbus: regulator-vbus {
 		enable-active-high;
 	};
 
+	sound-bt-sco {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-inversion;
+		simple-audio-card,bitclock-master = <&btcpu>;
+		simple-audio-card,format = "dsp_a";
+		simple-audio-card,frame-master = <&btcpu>;
+		simple-audio-card,name = "bt-sco-audio";
+
+		simple-audio-card,codec {
+			sound-dai = <&bt_sco_codec 1>;
+		};
+
+		btcpu: simple-audio-card,cpu {
+			dai-tdm-slot-num = <2>;
+			dai-tdm-slot-width = <16>;
+			sound-dai = <&sai1>;
+		};
+	};
+
 	sound-wm8962 {
 		compatible = "fsl,imx-audio-wm8962";
 		audio-asrc = <&asrc1>;
@@ -387,6 +411,23 @@ &lpspi7 {
 	status = "okay";
 };
 
+&sai1 {
+	assigned-clocks = <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX952_CLK_SAI1>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX952_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>, <3612672000>,
+			       <393216000>, <361267200>, <12288000>;
+	pinctrl-0 = <&pinctrl_sai1>;
+	pinctrl-1 = <&pinctrl_sai1_sleep>;
+	pinctrl-names = "default", "sleep";
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
 &sai3 {
 	assigned-clocks = <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
 			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
@@ -575,6 +616,24 @@ IMX952_PAD_SD2_RESET_B__WAKEUPMIX_TOP_GPIO3_IO_7	0x31e
 		>;
 	};
 
+	pinctrl_sai1: sai1grp {
+		fsl,pins = <
+			IMX952_PAD_SAI1_RXD0__AONMIX_TOP_SAI1_RX_DATA_0		0x31e
+			IMX952_PAD_SAI1_TXC__AONMIX_TOP_SAI1_TX_BCLK		0x31e
+			IMX952_PAD_SAI1_TXFS__AONMIX_TOP_SAI1_TX_SYNC		0x31e
+			IMX952_PAD_SAI1_TXD0__AONMIX_TOP_SAI1_TX_DATA_0		0x31e
+		>;
+	};
+
+	pinctrl_sai1_sleep: sai1sleepgrp {
+		fsl,pins = <
+			IMX952_PAD_SAI1_RXD0__AONMIX_TOP_GPIO1_IO_14		0x51e
+			IMX952_PAD_SAI1_TXC__AONMIX_TOP_GPIO1_IO_12		0x51e
+			IMX952_PAD_SAI1_TXFS__AONMIX_TOP_GPIO1_IO_11		0x51e
+			IMX952_PAD_SAI1_TXD0__AONMIX_TOP_GPIO1_IO_13		0x51e
+		>;
+	};
+
 	pinctrl_sai3: sai3grp {
 		fsl,pins = <
 			IMX952_PAD_GPIO_IO17__WAKEUPMIX_TOP_SAI3_MCLK			0x31e
-- 
2.34.1

