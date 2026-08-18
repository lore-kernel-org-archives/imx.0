Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011060.outbound.protection.outlook.com [52.101.65.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BF23B2FDC
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 03:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787022200; cv=fail; b=SNWLwnzScadm4uHRMj2EbXIatZX8/x6uwrMUfUKuIq1M52Ha3ZWBwyNwE41fAfvaGVGVUYEW1CHvE0ygQUZguL4A6JsZ4Ob9FmLSsFY1qod0lPWx6qrtb+a32udU7c7DpmhI3FTdDElkHtlGNSVOuLisGMqjIDXUFmuPZtZ5cn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787022200; c=relaxed/simple;
	bh=QUEfyhOGEue+vA+tTo5IWsfqdnD4uweIxc3eGZOwVcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rvxanGkA1EtB3OZnZ4QstYAOMAtD79XCLo5vTLEwMH/XAnXVYDuPHPRbdcm1aS5KGq5LbeXZLQHK2OZJxi6EGkj5EcmMJi6jh2E5bymY/VKhI4mtjLWQNql7BcSQUG3SGyjx0eseHVu1SxUA7erg4mqOzhmWOouor/WSJ88VoD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dsiJUEvL; arc=fail smtp.client-ip=52.101.65.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dsiJUEvL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ErF4m4G/1e2WZ6CtTrdeJJC8RxfTEGkcMDiiRHKOMwRKAcWDGvuBZKikRDSj2/wxpURh3rXCxyJMM5DC4/g9ttKQWg63XPenDszfC7/ZSOWP0zcJHiofy/o9J5HgttBdPYlJTwVRQQntEnao+j7GbNH7sAacp24bIR0VV5uKgjpSIowy6ZJOdEiMeSeKm1p7LK+q4swlngukG2S5DHosLWV1hMaP62Z45FyoBfI8xM6N74dQtEK3aOJB8mtN+gS2QNOVB0DYg+779UxvkeoSTW7EnXAgvYe4wK9dRphpKoR0SnlvY30fFu7HWrSmU3ribG86CDdKjqHhfb5AyfRyww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKblbpvEPoGNw1d4n7q5l+WmQP3qQjyj4xgG868rZXk=;
 b=YuVNaYnlcd+v/o59WzjFCoK8SU+7rXqaPJJ4mvAR6OnBrnFqHKszp/VUyng396mSpB0gW2NOPErIPk4DGCXzocsRuAfhmQA8g34Kf9lrPzi2COji4Nuypw4wp5OEvNh22tZmuaqsAocz1vM06F2NEYPJz1/Oqy4wnf9cjkNgQo3CumNgk59ypzuWjha4u0Nx/NqoV/nPRNcW2/VIOewo2Mh/ezzApeAB0wpmW+laTgULazvBLBQyqi0d252Zz3KdTUX2QYIOys9Xox3SkQI86O7bhXP4GC29P80Hfm0wXBnwmuhpVAafLwgnYjUBfuN6B9Nt4Td4F1IUn5asnJixxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKblbpvEPoGNw1d4n7q5l+WmQP3qQjyj4xgG868rZXk=;
 b=dsiJUEvLtpC0/dcqqXKjmWPN2kCzX4n6ZEgJhrcVOdsa8peohM6OIIMkwhdx2GqldoZR/4FOeqTLLNZ87ZO4V1eP5UJMQzgKByIlUTqu2KbVR++KE6zHn8ALu8XhO5XfyOkVz0HqFUkzRAr4/Fq8NC3lmBSCkTiV+Lr+JWjEEW89LqUT5FHzT8lJae1yAfuM71okWR/RRWMTcL7ejYH/srwIS0L9CjbZnGcToDrj7JAMqqGSOc3TpFm2ndxLIBZxMprXeN4Z1xMliUa2g/2x/M6bV0Akg0H4jb8D0theK5rwvldYBM27MxmTZSop2l9t0ZgUWZZ4sW5N4wvc59jcnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM0PR04MB12144.eurprd04.prod.outlook.com
 (2603:10a6:20b:744::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 18 Aug
 2026 03:02:55 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 03:02:55 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	imx@lists.linux.dev
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/17] arm64: dts: imx93-14x14-evk: Add board muxes to select between FlexCAN1 and MQS1
Date: Tue, 18 Aug 2026 12:02:00 +0900
Message-ID: <20260818030211.3141710-7-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
References: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0123.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::12) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM0PR04MB12144:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bd738ac-5f5a-4f30-d36f-08defcd53334
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|23010399003|1800799024|7416014|10067099003|18002099003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	CuLZmLxt3a41ZnjUi97qJ4+Tl4KV9a30B43BWPWQR3MsDHYRE7tsjdPxVxvg/BoQ7O333CJlwdnrL496cOaQOOtDL5FjqBZOHdKq+wPUs25ttORwPZz1g5iYwl4E7t9zYAId00XWJrxppdPzsOdPEjROyW9w+T6PZ68OSJChKR2YkHjaN6SVvwpxCX+cf9doBEEcC78DNncThPuORDDPlZwHUaDBuANzsFIVVyzUpj9zIg/n34lqJdKdlY+a23bY8g57nQAXrbjzs+RkjHX8Bs+gZiejBEv8plLDRk0zhLtGqtORinEewJOqJDqXWLT8ed8OKWeZ7Miz8HeEwPX85Bv7rel2haGRJZ8VjBoq9nAtehepdm8t5KphrqO/Jyx1WZQioC3fwTBFjAtyzEL+DC9+K3QO+jqOvikMqmprdBA9ikZQ6UCFb5onrPTtKhy64P8Cj8yWGwLmwoV8p5rXxvDOprIBmLt/6nL3nG66dStc/kQhKIOwnYzjRjU53qw78JT11u6c0xCR/9oi25SiL1VjIr8aL1i7PdGMjcwgImXZkuyH2wZvUO4VdMtqHF87jb3nBfjyPn2Y6h3alJfa4ph3alUVhCOWSETKzYF+KVCf6rKY81j3iqEwVbokRvxMAU6DFovE6cJcP6scClY3OSxnQ+Jlhl3uWX76jLtBK30=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(23010399003)(1800799024)(7416014)(10067099003)(18002099003)(56012099006)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7NKqys4J/GMS3dSppP6a8qg8PzdoYa5DpyxUOz8L/Ti8I1rS8qVuF+J8xlhZ?=
 =?us-ascii?Q?ycfIKDuu4Luuvu5nOvbQVT6tTuAbGxQRALXC/QnYwhAMduvOH97l16vNJVKR?=
 =?us-ascii?Q?o7W8KBEwL6AVO7k+X0/PNpsVYiv+aM+xAdNqmpMg16Oqghd/HW4AZ9s7a8+l?=
 =?us-ascii?Q?YVIjYKhNEYh1U1K6Ju3oMvTrUuXKDPkDQTE7Ls6vMYuJcdWPAAMcWdekD4Kw?=
 =?us-ascii?Q?cGzoDL6a1CASMSSXURT1AQ35RHTK00ijZF4ipYiwC7mVT6Ne+I8vzrfJFGny?=
 =?us-ascii?Q?zzZqzGtp5UQlYgs9tzaunEbQEDrjklvPqhhZ6J9W2aq2ptQakNlmilAD2qzv?=
 =?us-ascii?Q?NYtHHQYXPKcayVTjzXdOZOVCUvpGuvyVBPZFy+Clkv8CiWAfm8sdPI+2pL+0?=
 =?us-ascii?Q?S9x79GTM7/XqfxXqp/6FJ+vWag9pMV1X7xGRi3+vTIYce5zqPID+bgcLOYnP?=
 =?us-ascii?Q?avfwaRJIK3NeRZB9aOD+ymZDdwQ8OvRP16tFPNCjPZt01w8HUA3vTWQqt+5p?=
 =?us-ascii?Q?jYXayYKVrVgG20OpoMzY3Q0G5k42iKNDNrbFWRIUNRr9IUgZjI73YHd/vTaX?=
 =?us-ascii?Q?Wf9DfhgWHSH/AJVk5T9BffvdYJYRmmwFB1hnwWHOOSu1nQJfgAh1x8NJepry?=
 =?us-ascii?Q?gGi13fxb6crarBzUeZoQCPbEuJBHqwupwC2GsnsMq39K2ynlosMUTFrhm6jc?=
 =?us-ascii?Q?y9UpILcdxJ2hqz84n+m5GmqQaPzH3R1tVzIqOeHgoGH2j6kplYpmSFtdWKdM?=
 =?us-ascii?Q?GqYocm3VKrDrhTMZr8b4XF4IaVQ203C2Wf/FYrf5WUNeH9EiA2cukz7wZlCx?=
 =?us-ascii?Q?ECfxQ0p+jMRJUTLQGFZdmdzKiOeXE+MtgzXz9gh7UkwaUrOTvey+2DA4R4ak?=
 =?us-ascii?Q?N5KxS++uu0fjbWltEBfiALAwMPRLuX2soUnMYPHy0wPQLmfK5kfxGzcJl4qk?=
 =?us-ascii?Q?uq2D6CJWi1299jNGOQoyt6X8MuQCRgixczihB8OPUewOeaZAwsJrXPDzHv84?=
 =?us-ascii?Q?WCCZJTnx3Cy7ZlAlK/7Hcs6E2iw46sR05GvZdEUvYUbLYeDKnBXm5ExDpifk?=
 =?us-ascii?Q?bCI3ACjwhX3F/MLaEm2egsXD5PSXWGnC8VntoGknHvfkL+ciJwCtXjhxBTgR?=
 =?us-ascii?Q?9gw1/O2IPZhxHtFwZ5mt7zTw9dwl9YIZGwREzzDbawzoIgc2OWhvKbCw6fK3?=
 =?us-ascii?Q?l/vEkvoj2Q9vtb0IaP9OhL8GX6qeOtKoOw+njHCiYCALFF052qOMqpKyfEZ1?=
 =?us-ascii?Q?gN+kV3iqLzfX8gF5HMkf1p5hVtjqdPvYYV1EZk7WooMZZ/aILpu502RAEJ1Z?=
 =?us-ascii?Q?sDMPaobhPcB+kULugj49+8tY4Yzesb6A6fqt6AKCGdlDBp3JY/kkdoRb7r/7?=
 =?us-ascii?Q?/BLiqeamRP4CHqGNlB3UGF31DS3RuzOPQB/7cgop7IsjS2zdQlrUUKK4sbz5?=
 =?us-ascii?Q?4Zl+pZhqYFyhzq5w6QBMY2NIliSPnWgO9A2m0YqnqdGUJhRkshr8TteBOGSA?=
 =?us-ascii?Q?gnR+XWNrZeOy0MgkOKFLePsbuyyqweEk5spXhMI+OvSNOVKiyCeLBoWGg+bI?=
 =?us-ascii?Q?lVEkS57dRq7vddQQqJa8Vv0jv/sZB2fwp0srZHa6n1MOdqgR13e04a5Xt9xy?=
 =?us-ascii?Q?oh5CugNhpCi8rJ8o4vfTQGAgH7E3Ak5YgI865wDwssLgvv/HNdWRCjmu3jEs?=
 =?us-ascii?Q?yuJvLJqkNo1bT7JWh6qSSL77DfxPKZaDoQjKV6+UHzg/TVDfd7nkq29X2Bn7?=
 =?us-ascii?Q?n6lqx4tqoIKkS1s0NNw4wgoyyqXYOry7nL0hGUWk6Hrj4QQswdzU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd738ac-5f5a-4f30-d36f-08defcd53334
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 03:02:55.2018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TG0s9uz0J1jVXb3T2QgBqEXN4SoI4fxeCN9KBD/qIl3QbxkZ2HxnzdmloaKYgvUxU27nC4AsSPqWzOUfrY5KMKlEoxPhvS+lReFYQ9e8EJaLThpzhoji7phVL5kzNnCr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12144

From: Chancel Liu <chancel.liu@nxp.com>

FlexCAN1 has pin conflict with MQS1. Add GPIO-controlled board muxes to
route shared signals between FlexCAN1 and MQS1.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx93-14x14-evk.dts    | 32 ++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
index ec78c03f4788..6dcfbca65cbd 100644
--- a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
@@ -37,6 +37,36 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	can1_mqs1_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6524_2 2 GPIO_ACTIVE_HIGH>;
+	};
+
+	mqs1_amp_en_mux: mux-controller-1 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6524_2 1 GPIO_ACTIVE_HIGH>;
+	};
+
+	pinctrl-gpiomux {
+		compatible = "pinctrl-multiplexer";
+
+		can1_fun: can1-grp {
+			mux-states = <&can1_mqs1_mux 0>;
+		};
+
+		mqs1_amp_en: mqs1-amp-en-grp {
+			mux-states = <&mqs1_amp_en_mux 1>;
+		};
+
+		mqs1_fun: mqs1-grp {
+			mux-states = <&can1_mqs1_mux 1>;
+		};
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -254,7 +284,7 @@ ethphy2: ethernet-phy@2 {
 
 &flexcan1 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_flexcan1>;
+	pinctrl-0 = <&pinctrl_flexcan1>, <&can1_fun>;
 	xceiver-supply = <&reg_can1_stby>;
 	status = "okay";
 };
-- 
2.50.1

