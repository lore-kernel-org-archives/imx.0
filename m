Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013026.outbound.protection.outlook.com [52.101.72.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322FC477E40
	for <imx@lists.linux.dev>; Fri, 15 May 2026 11:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843388; cv=fail; b=p1cdqwEuq3MsTORWcxCK9fsgHlXx9DycjMg9Ix+T8Gek31wtKv0aGZ2/mAYtmotko00CCYbvpI2H73eZr5M7PuP8RmjTTsjOTz5mVVvuYxAYB6jP/X6nZ9PHqxgeoRsNLYnpmAEvH+GVqw087N8UA1E0gNJUtiwJAisysxMt53g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843388; c=relaxed/simple;
	bh=j74CTOb4l7GdQL9QtkYF7jF+F4GGr3oAkidoV9rYLsI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=t5cnfcMv3ISLnvTaLSL7v+s1W7XqBZHQsi5KIAtmY4hGeuQKgdcWmpvjI0Fa8/JFgg34Qp55kJpscPq4Zo/em9ey7HOyEYc/zOJ+aWG4KOUlrVMWcqW5XiQ6oU6NYmB2z/A88F/NcyTuO/YytdegvjiPD62VUO4TPcWJmDBlvb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=A0/03CW2; arc=fail smtp.client-ip=52.101.72.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="A0/03CW2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CNlaZO/lAhc5i6gBRpGG3rPwVaPIy3M4Yvympnl7Z2ifQemUf/8rf5Rbo/z8zIQdwCo5QGwsorYGPBOZZ/M0BhpJPNZs+s3Ssck58WDt2w3wsw6v4taAsatrtJ5eH3liOFExv5RLggr6i/4sV3T+ldK5NctaIvSsy63Y+c6pGu/ZgTcGgLKbC07RuK2951cK8CjdOV5fiMuGVCW+nc0oaf9D3j37iizfVRUtJTcDRZN89QdfktFeXRYSKtjZMEMg6/7yV28tggaUTqGAjwrAymJfyY8Th3/zKz08AqArRwOpGshLKU+2WaMi4TfSoV5JJoRxMuw8X0c6mhR6cM4EVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kk1ENA1HZKkWJ8tgwVCrFxsAbWEnh1Uur9/Zv6lMvLk=;
 b=PvjUieSpb2om25jrkubBv4bRrjAQ8GUix/JqxPaK3grS/6m+o5nCur3F61ll2pZfPxHUCsmIe5cXtg7hID1C/sxEVdjFDALlJ33BrWF8w5ZJye0EROSBb7tYMPOKAZS/c+iJ6yHbUtgJW/NviU9Tdj4HaC2Hn0xaWUm8uZ1iU2PpCw2NGpbQ1IuLFBmSEnhglap4L6vC90rPfILkdDAPCfW58K5MUXveJPRmgZTirQvC1dxaG2df5aTAX+YfwiRlh934dvuM1mM/4cXTUhococHIuQx+krVx1r4NBCHunBXlnIbRA0qK5rVTt3tz+aDBavNmzQIGI3Y5mR6gobN3Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kk1ENA1HZKkWJ8tgwVCrFxsAbWEnh1Uur9/Zv6lMvLk=;
 b=A0/03CW2YUOTWnY6L5LDeH7gkLWDBG0EupcG0kkLUhYSyJfdeA5xCwWZ9jERv6dfK+ilyr9eNBmT2TFLm6GK7ZEoVkc5RvaoYcvTWIVJ8YuLzF5yDDk63xFW2wdQaRU0WPONKvnL8ayzNqVdSgoVHWaIN1Js+WgjKnk6+PL4uhCgS6shn32HaS3fKmYvqXdyXfdvrNORg+dBjjnKnND057sUX4FLHTaY94hQQQu6KriJ260GLUn9fqLth/7jZmCzOU3b8anzIxZr3t35OJLVHyUMPQDkc8GkNwJhI5sYgPSM/2BpK5lL3audWaLxMp0COWKqJjK9joRzNOKIhjto0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5)
 by AM7PR04MB7031.eurprd04.prod.outlook.com (2603:10a6:20b:116::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.13; Fri, 15 May
 2026 11:09:43 +0000
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50]) by PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50%5]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 11:09:43 +0000
From: Robby Cai <robby.cai@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	sebastian.krzyszkowiak@puri.sm
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] arm64: dts: imx8mq-evk: Enable MIPI CSI and dual OV5640 cameras
Date: Fri, 15 May 2026 19:11:43 +0800
Message-Id: <20260515111143.2980956-1-robby.cai@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To PA4PR04MB7821.eurprd04.prod.outlook.com
 (2603:10a6:102:c5::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7821:EE_|AM7PR04MB7031:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aadc919-c751-4e61-7c1b-08deb2727741
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|19092799006|18002099003|56012099003|38350700014|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	I+F4hIUcRFsyld+qCNkHUTcWSssG7E0Fx0PQiGFa008NiTL6G4fwCSBfwzu5WyesZptevVnRAILAhkJRjGFN5O7DJTVlIv4AZILBI++e9tk3eJWPc0E6hprMx+oT91s0iKldgZSw/KZh6ebaa9JytB1ms924xgT3gfGnJEqgGqQMgUywvK2pth9R+Qw2VbZ+NDWQNxZq57JCXebnP6JtN0njyBY9q/Lnsr5KdkemINaEaDWksqXJC7hvU5SqBNwFA67eZ6TpcChzup1UBhsQ9dxb8sM9ROm40IsS8tHTw5To1dy5JAgfOuPVA5/yz+kBKjqELL6nCdqaddqH6rrHl7RbKlK97jBE4H6NwltnMl1pnUnVPC7cfIfSFSX6JyhOwLnSEh9kjwlzj44I20mYRMYuBCsKy2X5Fqdrxr8xvIU0ddAHZ1mQY368Eb9BHP7aFxoH9IC0PxozomOw9+K3b19Kn+UomvxfpqMTF3ApDtx8269VyV3GYUL3e0PxIoP/Vy68fmFU+IYN/A0B+dn5qUVmWN6t6JFEsso5TKbAAgTkHZac7K4yZvtDHOdiEV4mUvW1q+HZTVNaWHCnLbyAU4Fgxk1/eTdGdwg7SjqgrVjab1KYUDxkpOC2LIDw48nHofMAypPkSZg53NereoK/sNmvW7o8id5zp1/zI6JK/1vGLAl4m6QFJcWo9O/QF+tbCaEHg9GBoXUFuSXxssYTbQjhaFi1NV4YhiW9wIBIQVgpQRMrH4ZSOY5MwaV97/PM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7821.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(19092799006)(18002099003)(56012099003)(38350700014)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cFp1qI+AN1muKZYXlF9xKRMeRJbEJ+MEmDZKarJM0Xvp+KlXGF1B9hem90F2?=
 =?us-ascii?Q?Hfdy0sWRYkQmYPsoSOcey3yj++j3DxEuKXvbkgE1EMz3j7KNn2xs29c7FqLc?=
 =?us-ascii?Q?1F6jgbJUm2Tj3pj0LgLvSsunSr6I8wNoa65JCkDPU5/lIpTNXklCnY1lUyp6?=
 =?us-ascii?Q?3+1ozraUmJjl+SuI7gbfRmecdpP3ua+25emPqazGcnYHR4d9CB1IJRyYZSoI?=
 =?us-ascii?Q?cn0CtzNxadMOiDBR2Cst8WQhGIN81UZRHHAbKFfLncRwQlvF4OeSK3qasYNi?=
 =?us-ascii?Q?qsXoNEF37GkShBOG2jstapmn5UR2nHbVtufdXZ8NoUDiCJ0Efx7r3uk4+XSJ?=
 =?us-ascii?Q?KisByKpvsNTP/ew3+HHCBK5yVYZ4vQICxcVOEcoEnQ+H3aw+jQeI4BlvDXcc?=
 =?us-ascii?Q?POoein+FHw4qB4eRUPv3JSYfGC0l3+Q+xeCuCvgH10VKGK2RfRM3rzlTRZck?=
 =?us-ascii?Q?8ZgOTDJv9YDub8mJEiPWOuJLnFwRRD1cRNH8QEcVrl+UWBWt+ecUihcSAVYp?=
 =?us-ascii?Q?jvfzcTtX7FrwXp6eJFyYGBbP/NiOoA6jnzqz0SNGVCtMisopvs9ltZMl9PJe?=
 =?us-ascii?Q?f5gmZGIKlXKOs6PAoEGckpt1nF6UBLU9tsmPyeJRF0IJH4K/ElY1u2VZ+suX?=
 =?us-ascii?Q?oZbbiPAVtEXT5Dx2uMMUYKj4sfsaKDrJqdkxEHmNKFvA8ahP4DQc6emG/F3H?=
 =?us-ascii?Q?3x3a/EPikswfOjCMFuZIeWMLNZ5OQ34JMTUh8wnILMm2SJQP5pnb+W49puo/?=
 =?us-ascii?Q?N5equd5Us4b/O7FecL2+V9t6X/M00HiihWsALSDErUhrUzOQ3iY2snXNa06p?=
 =?us-ascii?Q?dcLOKtdTiCH9NyupctYcI2rhhlKoCpXnKxa1m+gzac36IB9FHJEZunik4Q0A?=
 =?us-ascii?Q?+2E8NL4pzU4D9obLRcHa+JhQqOgjkvMQhAxOSxNSsXsk7oLDy0rfsZBWpXl9?=
 =?us-ascii?Q?eajpQRI4OXXf5/SPiVS7O6VI9JBTRm/wTQSmuxKpCXxlh20ik+Rc7NiktBQk?=
 =?us-ascii?Q?ldjA4wUIEJUPpA8h3woxwgRQsBXxXDLL8IrH/K9AXbFLnh2cnd2y2Pgen/Rp?=
 =?us-ascii?Q?tkQr8ogC8ypaBciMbd+XriDohasQayI8m4AWsP0CmYiylT6VJKTSN0c57zM6?=
 =?us-ascii?Q?BADkQuTuEWfxpBZgIIc+ORA4RuSfwlk0RkT8mDPqZTTijpdwrqtx86jUDvQF?=
 =?us-ascii?Q?ThYYDB4+J46osucBU3VXUGyoGAi/Csp6H6VDc5N15qdrL42IJqntgahiYYAp?=
 =?us-ascii?Q?DlPT9zaonIj+f76k88xLMJtb74y9nyLi6Oc8gvSkhLoFf2sQBcxbmPMqm96a?=
 =?us-ascii?Q?5kFRf8RNrBFuUFIpQ8IHPEpMoIoMEmC7gU/GuYLJHNHHBe94e0otTiBkrzQq?=
 =?us-ascii?Q?UYuNVEbh/qRZ9luIVVxbtUR98+PxpCcY09M1nwkehPRbtjxS9bXyGVXNiQTJ?=
 =?us-ascii?Q?jVw6S5JRZC52pFyw0FdcnqOtRvAlgB7o7/OQuvHZjreZeehNbFRVKDlBKmqK?=
 =?us-ascii?Q?ghcRWarvW2oRYCT6D3nO6Tn4ANnrlHaUapxI0QfOXiMRvi9GVYEwo48KZSJt?=
 =?us-ascii?Q?rGspK2W+X54CUu8/pkT+fSpqIfPMjstkg6W4sSKOegqBKqPEWaQ69pGkAlji?=
 =?us-ascii?Q?P4kRMc5q3HAiMhniSbSGOwWbhbB958IF15qaj6cTpyWWjlkpyi4pLrFQDjKq?=
 =?us-ascii?Q?BGTegsuV4YBA5FbD0bvIJLE2/qW3eCUXdDGrYlkq1Xc4S5ucu1jfEjPXG2/V?=
 =?us-ascii?Q?3a24tPOMvA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aadc919-c751-4e61-7c1b-08deb2727741
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7821.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 11:09:43.2855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XWc0YCaTQu0HaXco7rMKTTsCfMHPnOg1zQ0ZA52oiFt/zRgZukxfLbZXsPpcD0xppyjxHhsn0O/KG2Ax8cGbmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7031

Enable the MIPI CSI bridges and corresponding CSI-2 host interfaces
on the i.MX8MQ EVK, and add two OV5640 camera sensors.

The sensors are connected via I2C1 and I2C2, each with proper
endpoint descriptions to form complete media pipelines.

The resulting pipelines are:

  - OV5640 (I2C2) -> MIPI CSI1 -> CSI1 bridge
  - OV5640 (I2C1) -> MIPI CSI2 -> CSI2 bridge

Both pipelines have been validated on the i.MX8MQ EVK using the
upstream OV5640 driver.

Both OV5640 sensors share a single reset GPIO on this board,
which prevents independent hardware reset when both cameras
are enabled. As a result, the reset line is kept deasserted
via a GPIO hog, and sensor reset is performed via software.

This reflects a hardware limitation of the i.MX8MQ EVK design,
which does not provide independent reset control for the two
image sensors.

Both sensors also share a single MCLK source (CLKO2). The clock
is configured identically for both devices to match the board
design.

Signed-off-by: Robby Cai <robby.cai@nxp.com>
---

Changes in v2:
- Address comments on MIPI clock configuration (Frank, Sebastian):
  drop the first patch and consolidate the correct clock configuration
  into the second patch
- Address comments from sashiko:
  * Use MEDIA_BUS_TYPE_CSI2_DPHY instead of a literal value
  * Fix a probe-order dependency related to reset handling. Switch to
    software reset, as the shared hardware reset line prevents
    independent reset when both cameras are enabled due to a board
    design limitation
  * Fix incorrect voltage value in the reg_2v8 node

Link to v1: https://lore.kernel.org/imx/20260417110200.753678-1-robby.cai@nxp.com/



Note:
This patch relies on commit 6d79bb8fd2aa ("media: imx8mq-mipi-csi2: Explicitly release reset")
and patch [1]. These two changes are interdependent and must be
applied together for correct behavior. Applying only one of them
is insufficient and may result in incorrect operation.

[1] https://lore.kernel.org/imx/20260417080851.489303-1-robby.cai@nxp.com/



Validated with following commands:

On CSI1:

media-ctl -d 0 -l "'ov5640 1-003c':0 -> 'imx8mq-mipi-csi2 30a70000.csi':0 [1]"
media-ctl -d 0 -V "'ov5640 1-003c':0 [fmt:YUYV8_1X16/640x480 field:none]"
media-ctl -d 0 -V "'imx8mq-mipi-csi2 30a70000.csi':0 [fmt:YUYV8_1X16/640x480 field:none]"
media-ctl -d 0 -V "'csi':0 [fmt:YUYV8_1X16/640x480 field:none]"
v4l2-ctl -d 0 --set-fmt-video=width=640,height=480,pixelformat=YUYV --stream-mmap

On CSI2:

media-ctl -d 1 -l "'ov5640 0-003c':0 -> 'imx8mq-mipi-csi2 30b60000.csi':0 [1]"
media-ctl -d 1 -V "'ov5640 0-003c':0 [fmt:YUYV8_1X16/640x480 field:none]"
media-ctl -d 1 -V "'imx8mq-mipi-csi2 30b60000.csi':0 [fmt:YUYV8_1X16/640x480 field:none]"
media-ctl -d 1 -V "'csi':0 [fmt:YUYV8_1X16/640x480 field:none]"
v4l2-ctl -d 1 --set-fmt-video=width=640,height=480,pixelformat=YUYV --stream-mmap


---
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 165 +++++++++++++++++++
 1 file changed, 165 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
index d48f901487d4..2311a05b88c5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -6,6 +6,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/media/video-interfaces.h>
+
 #include "imx8mq.dtsi"
 
 / {
@@ -50,6 +52,20 @@ reg_usdhc2_vmmc: regulator-vsd-3v3 {
 		enable-active-high;
 	};
 
+	reg_1v5: regulator-1v5 {
+		compatible = "regulator-fixed";
+		regulator-name = "DVDD_1V5";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+	};
+
+	reg_2v8: regulator-2v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "AVDD_2V8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+	};
+
 	buck2_reg: regulator-buck2 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_buck2>;
@@ -172,6 +188,14 @@ &A53_3 {
 	cpu-supply = <&buck2_reg>;
 };
 
+&csi1 {
+	status = "okay";
+};
+
+&csi2 {
+	status = "okay";
+};
+
 &ddrc {
 	operating-points-v2 = <&ddrc_opp_table>;
 	status = "okay";
@@ -230,6 +254,19 @@ vddh: vddh-regulator {
 	};
 };
 
+&gpio1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_camera_reset>;
+
+	/* deasserted: logical 0 -> physical 1 via ACTIVE_LOW */
+	camera-reset-hog {
+		gpio-hog;
+		gpios = <6 GPIO_ACTIVE_LOW>;
+		output-low;
+		line-name = "camera-reset";
+	};
+};
+
 &gpio5 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_wifi_reset>;
@@ -330,12 +367,101 @@ vgen6_reg: vgen6 {
 			};
 		};
 	};
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_camera2_pwdn>;
+		clocks = <&clk IMX8MQ_CLK_CLKO2>;
+		clock-names = "xclk";
+		assigned-clocks = <&clk IMX8MQ_CLK_CLKO2>;
+		assigned-clock-parents = <&clk IMX8MQ_SYS2_PLL_200M>;
+		assigned-clock-rates = <20000000>;
+		powerdown-gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>;
+		DOVDD-supply = <&sw4_reg>;
+		AVDD-supply = <&reg_2v8>;
+		DVDD-supply = <&reg_1v5>;
+
+		port {
+			camera2_ep: endpoint {
+				remote-endpoint = <&mipi_csi2_in_ep>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	status = "okay";
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_camera1_pwdn>;
+		clocks = <&clk IMX8MQ_CLK_CLKO2>;
+		clock-names = "xclk";
+		assigned-clocks = <&clk IMX8MQ_CLK_CLKO2>;
+		assigned-clock-parents = <&clk IMX8MQ_SYS2_PLL_200M>;
+		assigned-clock-rates = <20000000>;
+		powerdown-gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;
+		DOVDD-supply = <&sw4_reg>;
+		AVDD-supply = <&reg_2v8>;
+		DVDD-supply = <&reg_1v5>;
+
+		port {
+			camera1_ep: endpoint {
+				remote-endpoint = <&mipi_csi1_in_ep>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
 };
 
 &lcdif {
 	status = "okay";
 };
 
+&mipi_csi1 {
+	assigned-clock-rates = <266000000>, <200000000>, <66000000>;
+	status = "okay";
+
+	ports {
+		port@0 {
+			reg = <0>;
+
+			mipi_csi1_in_ep: endpoint {
+				remote-endpoint = <&camera1_ep>;
+				data-lanes = <1 2>;
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+			};
+		};
+	};
+};
+
+&mipi_csi2 {
+	assigned-clock-rates = <266000000>, <200000000>, <66000000>;
+	status = "okay";
+
+	ports {
+		port@0 {
+			reg = <0>;
+
+			mipi_csi2_in_ep: endpoint {
+				remote-endpoint = <&camera2_ep>;
+				data-lanes = <1 2>;
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+			};
+		};
+	};
+};
+
 &mipi_dsi {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -532,12 +658,37 @@ &wdog1 {
 };
 
 &iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mclk>;
+
 	pinctrl_buck2: vddarmgrp {
 		fsl,pins = <
 			MX8MQ_IOMUXC_GPIO1_IO13_GPIO1_IO13		0x19
 		>;
 	};
 
+	pinctrl_camera1_pwdn: camera1pwdngrp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x19
+		>;
+	};
+
+	pinctrl_camera2_pwdn: camera2pwdngrp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_GPIO1_IO05_GPIO1_IO5		0x19
+		>;
+	};
+
+	/*
+	 * Shared reset line for cameras on CSI1 and CSI2.
+	 * Configured as GPIO and held high; sensors rely on software reset.
+	 */
+	pinctrl_camera_reset: cameraresetgrp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_GPIO1_IO06_GPIO1_IO6		0x19
+		>;
+	};
+
 	pinctrl_fec1: fec1grp {
 		fsl,pins = <
 			MX8MQ_IOMUXC_ENET_MDC_ENET1_MDC			0x3
@@ -565,12 +716,26 @@ MX8MQ_IOMUXC_I2C1_SDA_I2C1_SDA			0x4000007f
 		>;
 	};
 
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_I2C2_SCL_I2C2_SCL			0x4000007f
+			MX8MQ_IOMUXC_I2C2_SDA_I2C2_SDA			0x4000007f
+		>;
+	};
+
 	pinctrl_ir: irgrp {
 		fsl,pins = <
 			MX8MQ_IOMUXC_GPIO1_IO12_GPIO1_IO12		0x4f
 		>;
 	};
 
+	/* Shared MCLK for cameras on CSI1 and CSI2. */
+	pinctrl_mclk: mclkgrp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_GPIO1_IO15_CCMSRCGPCMIX_CLKO2	0x59
+		>;
+	};
+
 	pinctrl_mipi_dsi: mipidsigrp {
 		fsl,pins = <
 			MX8MQ_IOMUXC_ECSPI1_SCLK_GPIO5_IO6		0x16
-- 
2.37.1

