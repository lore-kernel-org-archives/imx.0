Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013060.outbound.protection.outlook.com [52.101.83.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951A4383C78
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 03:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773287286; cv=fail; b=i0nuXSytwsVP12i4I7kvrJR0p9Cx13K+s7Ix/2SNeFr7htQDfopIrLNfYOkq+SxIwXh62rNgOtH6Htvrh1q1GJE9x1Ed2c7+tWXq5vWuvrO8+tOk8rgLFnY2FD3I6zOsYlsXtyxGh5ZWznVfW4twUKZTS5XxJRdoFbyu4/eIz9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773287286; c=relaxed/simple;
	bh=j7uDLVfi/70/h1xAlNpYQgE0PStw3EnMSMnh7Zp+6Nc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g/aolQVSgOKvKwkEnXPPiXgcrTOMaDJ8mNSCXMFDmHwd7owE1RUVxjo6X7pkajoRp69sqslx0E10aQR28ck1lfdtqg/cr1xbkMDUdmF4gGI5r81VkErn1vuVENObSppxwRDK7mrvF/juH3EANoVPSWVoToWEWvo6oISUyH6ZCUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fdGH4kMQ; arc=fail smtp.client-ip=52.101.83.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fdGH4kMQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8oduM5S7hQGMD3cnuCJifoGPNUa1HGwHIf7Xfquf/lmCkpTDoYoI1GcR3FE//sz1bs1CBHuRPtpFFgRyvw1izBV8eaw+TzmgvsT+ZL4PGoZ2L7SotZorWCIzEE1WjumPLP3Z6SRWuzqiKIDMJz7a0gaeL/zDjp5QN14cG7IML+UvU5iQqCQhE5nBhaeZpdGyEAVsnIF20N7HNH6jl4u9z0tJcnnM3p1O5jhJCZbPygibj2tWqQZlsw+Zpj3ov1Me0E2JslwnwGna0svZDbnaay/JslBykfUOinooPak8qnTV0R2UGam5Tmo8YS1Po+q5TOdn0uSXfpFr9PL0r3aoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQx30goStKkLKXd9n3mIbq56HMFm9Mds3/8OSiRJ0Nc=;
 b=K0KtYS1spK1SIbeqUPANXvlFYqo+sVze24oQbUlAgPyasD6kvtA6k+d1MoWoQNVGRR0Puhi+ippP6IJxqus8oj6DRzGZds5ZbUQjVVz75FwR/BExn6h54znsLRb44LFMpZyJp6m2gbSkSgiv0uEU1YaEd/np64lUxpCj2jDMhMCHm2ZyN8b0dqi5dSaX3abwQHYI2eln21oOtNJKMWARWMtmDkUpJom15L3aX7KO8FcMWiqbR67DRvDIOpKWkOeWvQotwCU6OvmEe5yCbde7lteLjwJeo1b4cpWpVlHaA+D6+IEfty8nEKpVfvOhfkr5yZf8ad0bfxpryexp+n5mGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQx30goStKkLKXd9n3mIbq56HMFm9Mds3/8OSiRJ0Nc=;
 b=fdGH4kMQJymknsKl3d5Mtwog/ApDiVp5DS4pjh5Zbv2+L9aFEoViVZiWc2/r8ghNTSRoFi1fWdK99hSZ84DWi7jY88G4ZZz0v78SQWuGRa/oPVA7ww5iNrCb7zqFgRZ3rccY7MBatnSQA6zckMLJXbsU36WM4RU8An0L9v76LccV3Gd7tKtBxsWVKPLitqj2G0rlFoyoPthi6y99bbUdUAZxdpF5pSnDo1XjGFNdXvnKl2GTSuKbtLR+2hUuv9U5n/ohivHgacNkX7L8oDVJym9n0WYjplNDy2sHOZepp/BrGOe959l59jEYtZPhHMgZYM3tn3rrdUzgcEJOis+ZdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM9PR04MB7636.eurprd04.prod.outlook.com (2603:10a6:20b:281::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 03:47:58 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 03:48:00 +0000
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
Subject: [PATCH 4/4] arm64: dts: imx952-evk: Add PDM microphone sound card support
Date: Thu, 12 Mar 2026 11:49:12 +0800
Message-Id: <20260312034912.4007057-5-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260312034912.4007057-1-shengjiu.wang@nxp.com>
References: <20260312034912.4007057-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::11) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM9PR04MB7636:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b18d4f4-ed0f-47f0-7fa2-08de7fea27d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|52116014|376014|1800799024|38350700014|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	kXsOTTp149FxJlSBDcvkFJoBhvXn4c3azgSBD0NkiK1uB697EwMwrwTuAX1V4vOOkdzWk96ki7cvIYbHy3B5AnYKRBJ9WrYff9+M60JgQ9JgCuRBxAeQajJ/VIe7GRbKnrzI2C/BTrVWTESV0A/Yey7ZG+vKMOrTC4VliYSAjhpQosR6uwZ7Xl2FxWwJff/kFfbt0nk8T10VNplDP/NmF9O9kjfJ9KrAXdcW6uI7OormmQyceSeKb1aQyfP2uh7l+QQReld69r1+ZL6dTu1E5bZCwOwtDei1xK97WDwXg9XzEiI+xCiO6xseMdnLFlIe8vVUOamCxSLvbfp5TM3rapnNSPeNOEFZvuKpL4O9osgjjRd7UmMTR62KxF5syQXDV/nLMAcPuJHsac4rQl9E52eZajgl8tj5REoS7+PSrloCctiDB2IuFaRTcPN/mPTBNOUVcJSnK8cLY4bcbm8n11lY1Pz+DMVjpf/R/oEPauHiJ/OwjM2K3Lcm5QdNthnPpre1QmsON+KE3mJOXUkpzLj8IS04Hj9OoO7B6AhiyY463D9kQydsgrl3TdQekc5jah1G5pJZO9cXcvoBpxNyYV8Mu2qfnt4tVJsudHmhjEZ+6RpOw8Uv7LXRlylq26sNiJqmnMKRJvZvrUvgERoPeDGMXJpIe1piAnELY3L2kr+9pgG+khJXjYcDvs0+cvcgqP3eZXCELXdq7JbUhh4eLiqlePHGgM30CNUiR20dlrc8/r+wX8IEYYveBZaxBDIKQJbeyo6iw0olpc1j65cTsHE5WnpZoKAedGpIjcYAk1E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(52116014)(376014)(1800799024)(38350700014)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YWdJV/5PNIH0bhb7+sHKfpq9dNOsxr8CDk81TXjiHmKc8MjMUtipuBR/KjyV?=
 =?us-ascii?Q?vxog0OcePyGDK9zopuNqYrtEsATkudBm5gSIFEim873AOmhB8HbHH1FsFwSO?=
 =?us-ascii?Q?PoJphlqYXGco7wScf/8ZMTYo+UGjvGwJXbzBXOVlmGlcJVj4fkHCBZCwMf94?=
 =?us-ascii?Q?9eWCIHdVwKXnqV4GhTBNT8cGDbgUpCItuvVxKVzae0crrfngO4KnxzVX0juS?=
 =?us-ascii?Q?cJCmFOan8TodDVNXvrHCGqOemC8upBKbtAa66psC2ZuWc50gcFHJJRJ5Y2hV?=
 =?us-ascii?Q?yR+feJDLB/GhFrjf1T9Cel2mVAevw7iOEjRCNDbxIqF/BSUY/iAwCkStgUz5?=
 =?us-ascii?Q?ERpIjT8jug22WpGwEsj2xdSXmm5GchcrMR8nBOBOFvm2GkFDE8TD0BvxSdtW?=
 =?us-ascii?Q?fMpc4xvN20a3kCKzPlqIjWh1t7uXaXTmbXRB0y8ASrvQXJFjMPvoJU/0AQQX?=
 =?us-ascii?Q?omQqXrDKoEXQXqNAzmDgFgLTDSdhFSavExdISSKoXwmL0RiklEk8T4J0LrK2?=
 =?us-ascii?Q?+u4pIGQzCa34HG89ViQc5tV2sTMSNLLjpuuCq3Ecsskg//+1mWldSZkaC+fY?=
 =?us-ascii?Q?zucI7oYnk0FjTSg9SSu4Wq53PRgMlAMHNSfppUDfom/jTBR9579zM5nMdux7?=
 =?us-ascii?Q?z23hYguaHu1pdW48MZ3GTVMYEcB9X9GDdme35X0ZED9nSU5ibQ/gOLh/Hix2?=
 =?us-ascii?Q?BwPE/WHry3rj7BoRoiaVfG3c1FPU3s8d+d4E5MQrhGF4jc9VV/CwP+l8cIOz?=
 =?us-ascii?Q?n/xjtQumbn27a+WAcw9oRVOcvJ4uzDgZshUgiMqRMVAbYVdOfpJXbeWwVvzm?=
 =?us-ascii?Q?DjtjPezX6U6C9kjskencSxxekVJ4MTB7IbSZjGoyuPOZGo1sBEFjkHcXNkgw?=
 =?us-ascii?Q?0rmKU2MJZcfpF8LlYIFFZgW+lXy2Knu7pbRWsOwiYcO6k9uRak7PAFWW1s7g?=
 =?us-ascii?Q?DIBDiW13NBIrgZe4GNbUYX3yaWn0St4pzbGdZSx5bIiX+cvtiUC4XbhAtsWv?=
 =?us-ascii?Q?TuqTHj2PGIOSc7UMlFOlmquJ10KApoGMTO9BpvJ6/pJgqlz13ncrho9u9Ra0?=
 =?us-ascii?Q?N0SbDraRQjwM+dgjtF1k7b93csv/mWEqrgryWYTmAd++0dI1rhmyOB4XXYR4?=
 =?us-ascii?Q?u0i3oWBk64F1UhM1iQsjr9Ykk07dpCU3WU+FSZYZt4Nsu91tKs60aEFZ6Jx4?=
 =?us-ascii?Q?Hq4DcQ9JjnqRIS3h4+v9nGx8cX8ya2QYmy396DRV0g0A68dkUg3VGExIS6gt?=
 =?us-ascii?Q?j6Y0jI7Kfe6tiKKlUMwyYzwgOe3xMtZUmTWotEc1bFJbhjS5F80FmpJi0XAM?=
 =?us-ascii?Q?pW8JT7l2Ox5hzXR6nVOyS2QtKg5nG61WIngBFKoN3VhViqQY3FO7ekSuQMpB?=
 =?us-ascii?Q?2KxVPLPiY0OZy9tdvpW6CCXlm+4YLm9k3bPU3yWASHJIw+8i5n32O04KWHSL?=
 =?us-ascii?Q?n+izVsFxHTywWbdfpw73+Qch+GIdDuW1/kUD2Wf0XyGFkofmufxMZ90GQK5P?=
 =?us-ascii?Q?Aj+Jt4TErbYWGo9Rr3zr3Vg8LFGaaigoyVFcytWCDugEr5kbG4QDTiyq3yAi?=
 =?us-ascii?Q?p+Oz8x3O+cGnbQPHe/MX/1RhIOoXe1M3MeCXdLvSYw6EX4s+ZKLg9nSC7/1I?=
 =?us-ascii?Q?bckyvH4Hy2yBUOiVVu2hThWNi0YGYtuJxhutcpwBBLVK5OB7LioXJlAY13ZX?=
 =?us-ascii?Q?UegfwLIkM2ONb/WIprIKQ5gz4Uq6966Tu40Jj5AOn49jp2+4+42hxen/tYY0?=
 =?us-ascii?Q?MijCIFeNyw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b18d4f4-ed0f-47f0-7fa2-08de7fea27d3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 03:48:00.2715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D1q7LuTm519RJ3XSsgvB7/OTZuhBPgL388o/TrJN+BYRtQ/+a8jq7+N7G3fUbkeJV7HvRySlq2Y3vzeYFfGlPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7636

Add PDM micphone sound card support, configure the pinmux.

This sound card supports recording sound from PDM microphone
and convert the PDM format data to PCM data.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 54 ++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index 2615fbb63145..62d1c1c7c501 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -52,6 +52,12 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	dmic: dmic {
+		compatible = "dmic-codec";
+		#sound-dai-cells = <0>;
+		num-channels = <2>;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0 0x80000000>;
@@ -164,6 +170,24 @@ btcpu: simple-audio-card,cpu {
 		};
 	};
 
+	sound-micfil {
+		compatible = "fsl,imx-audio-card";
+		model = "micfil-audio";
+
+		pri-dai-link {
+			format = "i2s";
+			link-name = "micfil hifi";
+
+			codec {
+				sound-dai = <&dmic>;
+			};
+
+			cpu {
+				sound-dai = <&micfil>;
+			};
+		};
+	};
+
 	sound-wm8962 {
 		compatible = "fsl,imx-audio-wm8962";
 		audio-asrc = <&asrc1>;
@@ -411,6 +435,22 @@ &lpspi7 {
 	status = "okay";
 };
 
+&micfil {
+	assigned-clocks = <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX952_CLK_PDM>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				<&scmi_clk IMX952_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>, <3612672000>,
+			       <393216000>, <361267200>, <49152000>;
+	pinctrl-0 = <&pinctrl_pdm>;
+	pinctrl-1 = <&pinctrl_pdm_sleep>;
+	pinctrl-names = "default", "sleep";
+	status = "okay";
+};
+
 &sai1 {
 	assigned-clocks = <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
 			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
@@ -604,6 +644,20 @@ IMX952_PAD_GPIO_IO36__WAKEUPMIX_TOP_GPIO5_IO_16		0x31e
 		>;
 	};
 
+	pinctrl_pdm: pdmgrp {
+		fsl,pins = <
+			IMX952_PAD_PDM_CLK__AONMIX_TOP_PDM_CLK				0x31e
+			IMX952_PAD_PDM_BIT_STREAM0__AONMIX_TOP_PDM_BIT_STREAM_0		0x31e
+		>;
+	};
+
+	pinctrl_pdm_sleep: pdmsleepgrp {
+		fsl,pins = <
+			IMX952_PAD_PDM_CLK__AONMIX_TOP_GPIO1_IO_8		0x31e
+			IMX952_PAD_PDM_BIT_STREAM0__AONMIX_TOP_GPIO1_IO_9	0x31e
+		>;
+	};
+
 	pinctrl_ptn5110: ptn5110grp {
 		fsl,pins = <
 			IMX952_PAD_GPIO_IO34__WAKEUPMIX_TOP_GPIO5_IO_14		     0x31e
-- 
2.34.1

