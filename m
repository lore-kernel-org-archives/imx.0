Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011060.outbound.protection.outlook.com [52.101.65.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1051B3ABD9F
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 03:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787022252; cv=fail; b=m9rZKelaD98kgy8nTB4SHI6uGtEGVx76H+9S5MI5HonMbNgxLjE50fLDiW7uMLcyrxA9Vx4FBLv/QSMfSx6LAwQ7oVqSPeTM15jLYw0Bc03s16Xpi2nA72PSvqpFs4sTJ04mQ8Rw9nzukyKoty8atoHECHQceLzxj9WJLGIPI1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787022252; c=relaxed/simple;
	bh=XpwhU7qVJBsxhul2MA0RKb64QZSyTlkB0FrZZedUx8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UYSOwCW4rFmnxC2UREwtNke0Jqqvzhn3eZIfMuSGQOBHc7G63eOc4G4VYZC+FcWDHIifLdlfifSGUVgSbyA7GFg2P7CgcRzbB1pwbbb9j9oJ6zuUm4XhDUVMUqUo1+lY+5vNcB2NztHfGACjSa3jAxcF70CbVHELYcS8pJZ+ORQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UoDvZYR3; arc=fail smtp.client-ip=52.101.65.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UoDvZYR3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d5rAk+nFVK9GJQQxZH5Ehw6wcnOdHng5MVlbJKt5/GhnAC+bBZZ6hLxzHe/BOSrVCVrLVC+ZEajogNLhlFP8G08yrKwUn8dLaGGFQF1QfF80c2pcJKGcK1sxnF4s5aePp9sM9vatwcLQI8+BjoZ87RComgWlczk5BYNowiDWbWy5D6Yd21M/cBNg0VMNHVBfGH+Pb3fnOrcRGw1V8uvNQ66lV1yVDLx6xzP08mDSFgZiXOl6OLjGsubJYrOH7Db4iL4a5yfrXTHhj4vT/ROqffMZAiIUNd+ULq5sXle7rfFy3xQzqD+Movy+cQIdyVAW/ElyPO2pDTWhx3qY7vEvsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XdRaZ33/gudCCa0mw8fSJ5zYvszJllH2CtHRgiWlYQ=;
 b=BBFQc4ZnT2UlwTLv1a+z6HwKD/l2wLor9fDuuspGYqjulmFuuKXt6EsG1El06GfVqxCbcrisqJJXdh8KPoQ3s/bFfObGg/bgWEgPO+CNkRyaMoqz7YM1UkoD68drJuIqloKgoD1gnutGwQf24/qe0lLAVLmv2g9iGVPgJhyNLC7vtbCwTXcFjgoKDttgPrazO6Jhr9u1o/s5B0PrGoQJAovNApNdyuZs3zDoQykZ5UD8I0eS1M4vlCx3n25m64loV+cfQu+cvzRJLusu4DpHmWg5F6u7MXEX1ae8/jyG9omQ0sVswEmmTuFPVRS2sVcjdcsT0qqC62xZDyhxgJ35Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XdRaZ33/gudCCa0mw8fSJ5zYvszJllH2CtHRgiWlYQ=;
 b=UoDvZYR3zoUuThXc9qvSigksvJdZIhI/gkUTOamvNniB3jKmhhgdUSwMVgn62b56QxcdlaLR9BEHjfy3Ij1uIulfDTzME0Jork5Y4CfH8vye7m3DcJpl9C0Ne8wzKKe9GFEp6Uk/an85npbEJV3gf8I+EGAnshqQkU9rYryFx9tQM5PuE6Wsvo4xlNy53bQEA5uEVx1a17QcqVh+lPPHLvFXrfFjtaey4mlIx06gHUz4fN0gNZtl2KQhnJnFIsrl2rsVhoYs5MGJBlGMivbr+qse9Ia7tEcSFKQPRnKt7tvePzwqpNBcCSyXtmw4mltc0kJIvHHf3urxEUd8vh3n4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM0PR04MB12144.eurprd04.prod.outlook.com
 (2603:10a6:20b:744::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 18 Aug
 2026 03:03:37 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 03:03:37 +0000
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
Subject: [PATCH v2 12/17] arm64: dts: imx95-15x15-evk: Add board muxes to select between PDM and MQS1
Date: Tue, 18 Aug 2026 12:02:06 +0900
Message-ID: <20260818030211.3141710-13-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
References: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0174.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::11) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM0PR04MB12144:EE_
X-MS-Office365-Filtering-Correlation-Id: de98cb8a-3eb0-4017-95e6-08defcd54c62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|23010399003|1800799024|7416014|10067099003|18002099003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	apJZZ9zoUmL6kY3tSr4KUVbAUUFY89L1WdwLD/B/N81JXqO6d0LOJt9q1wZIs8XLnsptXi2Qy1MQ6dhlqZWULvB816GCbfE95K9iO8xZNidFAKLDl1MytLNLIsTUld2knn8P0K5pAA4SIeX9GMd8xQqrwaAZH9ZQ1yroyzaCxfwjOKnGhiWSf8hnCYPl0MjI55UDapl+cZJgJK0PYLpmMAZlxNc2OM8txjAEkacI9/oGJOVtSNTQTD04yUmIeyIWEWEYBC9jP7vvziiCO5c5t6ivk9bcwdTf0TU9J1P9SHhA12a+KPqUtIErRecE3yN0QKBywuBYO7N2bJ/zTfiil2IlK1iiuXFemFk3DcfEeoaVTS8ofGGl/PmCAyRTJcxPJp0UQWWZJ6WtqMrkg+CiMVrwMd1CEiiJZE6ZSOT+HnnZ2KjUQJE/232sDZ/ZE61ciXQy+PiXOx+XNp+JDOW4oNOuQNBdGqEjqev3uD8+HePL1H78Lw89xDLRklOfM9iVtQPTuISqZn+7r7u4HTVnP1QXjb4tWTDFz6YAmbE06ddU9F0naMsxz/+SJeDNlk3BTuswu3b2IyGn10coXHSscQI/1Z1kWOlakHTxM/L07ZzYM97QhHxXzabyWaHJ8iUz0tDrJL0Xo+T6cCCN7onTaespwPV3EnrV4ox7SfUFLBY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(23010399003)(1800799024)(7416014)(10067099003)(18002099003)(56012099006)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gott4tdK9swooWyJfYhxG32TDFuwvLfnOTcJGqASCKeht2e/401orFumKd1/?=
 =?us-ascii?Q?vFd4riCjvJ7UfdG+M5ePbI6E9XFSg9U4AFq6/bp1YGYJKj6V4MtZTSSIZ/qA?=
 =?us-ascii?Q?AcWepWHxCSf7tkYAmr5uVGIxtPuMDktQRx381YmcuxoGZQHHJYSnEXDs9s/t?=
 =?us-ascii?Q?zqa9dVcm4tAfkh87hYb27BVGJkZ5NVZML/zwH7l4nDkPQOZt8+L8Ypn+qoyg?=
 =?us-ascii?Q?e3HQ/8sFhlkA7yUioPdRkexgO1Q54tZP2SeUY9+lSrn0uEuDcnTmT5dQqX1f?=
 =?us-ascii?Q?2EIwAW6GCNpXkHSzZlEbSpKjdslbrxaUoKUuMg2L4MUkCoo4xmx9R69piUCr?=
 =?us-ascii?Q?hvyBA4b8GRINUaWuWjL0NtT0I7i2lurHckcZHRlsPljKLZ0JDIXDoq9f4lir?=
 =?us-ascii?Q?y/JeLbsvSi+PyRYX5mznfWwn53Kat1qvk2+/6VZxmy2H9LCZ9HUTMqkti2rT?=
 =?us-ascii?Q?kg2yjOEMNbqM8+eOBvgWH2BFZWGb8BZeVjhN7uASVWdfskc/AMIG2DoHfW7+?=
 =?us-ascii?Q?jTuAL/TyFC5aw8R7TBHcja4B4dGKkhPUmLYVvEUxLcBqH/iyk02RQZVY5/RF?=
 =?us-ascii?Q?okXio70YW9AOYFEM3GLOlHR83jV66r57xWMXpX/KkBj9iBtLNKSrfEUjErak?=
 =?us-ascii?Q?H4z58a7MMm7RFrjf2ScCh/X0oZwIxGWDJpZxQmO6swegCVq32LglHJBlnIA/?=
 =?us-ascii?Q?8OuDdXSuhLWxf9Eo7jAbMloU/psCt8ymIZnYn1j4XjLT6XqmGlD9ZndNrODq?=
 =?us-ascii?Q?gc88tpCgOihqxiy/DKmmCmINocn49fivY4jhY3T7tiRI59HVTBePveVG2o86?=
 =?us-ascii?Q?WYaeyOZ9zoeUJ/f/IFuq14f4RCzreJm41cZCDsGiV1XLoFo5Z1ZXIl1ysxvk?=
 =?us-ascii?Q?QvF7j0Jvq60qNBjvykrmRy2SrpgSiT3EQHMVCnzHFFLwqZ84HoApJOUs9SCt?=
 =?us-ascii?Q?iDF//ft/zQOD41wOhZiN6bPLCwDpPHmAVi6i/F2IhztyhJQbRnc/lG2EkPpM?=
 =?us-ascii?Q?d7+8ypdRYKFjkBH7KnlaNEn6z47frjPxrvWg11zGd6BjyDMp063tvmJEDLsU?=
 =?us-ascii?Q?mG5HCFNRanbwBE34bB3Xy0CI5uOITPGfTrRgU1xq9Wz+8XSKFm4W+pxBCJOJ?=
 =?us-ascii?Q?vz5n/cHvoBhir2Czobr16bCymwBQ+3mTQVstK/1U45KA9oHe/5jnFSHuKlwt?=
 =?us-ascii?Q?Tq59cSZqZxtYGm2m3azG7/Q3RXFm+h5BnTsmizOv18NqeckmGDpuRZdd/nXj?=
 =?us-ascii?Q?rtbLfJotAheVdch82z6rMKPeG85urEjKI+XdHO2a020/9US6KTUVPfrO6IZz?=
 =?us-ascii?Q?8725EzAH9khXAx8+jfL31Og8hrocVpTUUL274wEJXOUp109a7tT+bimOKniu?=
 =?us-ascii?Q?zfe2jOSwhHAQSJz3MLlAFVQn+7ZTnZhp2hyMcbiLDphf7k0TVOe5MwALe0fc?=
 =?us-ascii?Q?5hmaFrtuk3JcCVFW0w9jGucYYERbkUnKuYMcn8e1bU5zuQByRxXH3a3dDl31?=
 =?us-ascii?Q?VoC8OuphttDs07b8HwnW+Q2ZBvVPFlV9ZbCdnckHKADgLueG6xySbeu6GyEt?=
 =?us-ascii?Q?KJ4ixIuc1Ge85HBufZIxuczGnzCf1UjlJ4ULzn6jyNE96y622z7+7eFbTFu4?=
 =?us-ascii?Q?H/jShYfxqyGr484+8gTeiHivVhC5V7i9clQAbrK0k4OR+RpHQkNFkhyBdyQd?=
 =?us-ascii?Q?W2OzXGW2a4gzV6k/ny27LI8n7Oi8voLJyAaWltDJz+txvV8lR7r1iJCO2rwr?=
 =?us-ascii?Q?TbYTAo5lODIPFax7siagY2ld3oEK3U4iurgFdD7/SgdJKsbBtvkE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de98cb8a-3eb0-4017-95e6-08defcd54c62
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 03:03:37.6754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CwfuhoCRIc4w4/qU3Maq+QXRoCOPqJlxMl16K4r08h8rQJnbatIMJanKQL2eh1ksYUAsAKss+EUv/TKAujOgiPhuUpEkSXOla00IEPmujxA3N8rJUjWup7F8CEnkEll0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12144

From: Chancel Liu <chancel.liu@nxp.com>

PDM has pin conflict with MQS1. Add GPIO-controlled board muxes to
route shared signals between PDM and MQS1.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx95-15x15-evk.dts    | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
index 6aedcbbe915a..aaa2608793bf 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -114,6 +114,25 @@ flexcan2_phy: can-phy {
 		silent-gpios = <&pcal6524 14 GPIO_ACTIVE_HIGH>;
 	};
 
+	pdm_mqs1_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6524 20 GPIO_ACTIVE_HIGH>;
+	};
+
+	pinctrl-gpiomux {
+		compatible = "pinctrl-multiplexer";
+
+		pdm_fun: pdm-grp {
+			mux-states = <&pdm_mqs1_mux 0>;
+		};
+
+		mqs1_fun: mqs1-grp {
+			mux-states = <&pdm_mqs1_mux 1>;
+		};
+	};
+
 	reg_m2_pwr: regulator-m2-pwr {
 		compatible = "regulator-fixed";
 		regulator-max-microvolt = <3300000>;
@@ -488,7 +507,7 @@ &micfil {
 	assigned-clock-parents = <0>, <0>, <0>, <0>, <&scmi_clk IMX95_CLK_AUDIOPLL1>;
 	assigned-clock-rates = <3932160000>, <3612672000>, <393216000>, <361267200>, <49152000>;
 	#sound-dai-cells = <0>;
-	pinctrl-0 = <&pinctrl_pdm>;
+	pinctrl-0 = <&pinctrl_pdm>, <&pdm_fun>;
 	pinctrl-names = "default";
 	status = "okay";
 };
-- 
2.50.1

