Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013051.outbound.protection.outlook.com [52.101.72.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A74F34E75D
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 02:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787538128; cv=fail; b=mHVilXx3vx/cn6NTkJGdUdj9bBimNgmMQS1OhfE6VPNF8OlJ4/BVjMLVACq1ktbUBDXjoHkXf89vGvx6yG0DacIo8GPraz2YfhKn12wC1jSBMiM2tDWN9/uJ5RDo0P4A6mPdWdFxM4ZX/RIadObvC2GWrN+G/BNd48B+Ym+qvF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787538128; c=relaxed/simple;
	bh=FRT209kUF1JO43VkIJ83VBfboXdzeFnQtemxebVRNZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mu/5uTv92lv2SxUempqJ9tite3MH/CIuXESMDP4MPndonrb57CsopSYCItVOyfz9Qd6duv65hSU9j+uJj9+i1q4cO2vOPnRmEZESjMqVrD2jsmDXRIG6cZWcy/kdsaFSqnalELCrFgA+oYIpejBDYJqBdY/JqoSJ7mricTcv3ZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FJU72HHT; arc=fail smtp.client-ip=52.101.72.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FJU72HHT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vGGpxYPxvtLsVjFCcp2q5Hu0Ais5o9cuPRclJh27sUOxOhwRMoqWIkFho91QVO84jmSkLiwgTi0iSo6VDhDIenOuUofM0UM/WUkTgs/BPmhCUR8B8CkwSNguNw1m6HAkhQMQc4q3hWAUQxKqRf4JGffCVpGeNOeYai7cKHbMyD+Oz36fVc/yQSkvpId+N0hN4JUGkhWGqBEO3A79YlB4oTn8qmMo15OrmB2UNbtV9/a9KppGWZOMzbSnf+ODEmnk0HYTpsIns7g69HuOtoCTBMd25rITTtpdQUnmc67Wnm1DXfL9dH2mYk6wyyq0fvdG1SqPEMYzqX9uWR1yxOaMqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6ZNwKrky/lThoffrrbm+MLvOMXr8hXSrmvT/j22RwY=;
 b=jMopwIz0atF8kmO6kBLbd+wqY/d0A0eNiaPnWx5pSX6Yi0sWCDLK/pkuNmk0lArgc2jKqaTG/05s+qQqMTRlUIgKtpETzNOPfCjwHkrBqCSKh7mi7A9fhU0z+Q3PMIiDBc1tDM7ITKI2XXR6WM21XpJIOio2syVxjJftdy51+3NCFJ5WyIwAAVSYNBOuysBzi4mdJv+/5M1a04zJCwWObTbEabdXb1eAIiOWZhCCGBZyYEgkw9ykEJPjHKVt5+kf8gZT1BSx6JWjJ19u+oXuun4OSF6XIEdW9LafIzyq3FNd801qwN6b7OJktD4jUWyeeLAsNleww3ehxOn5SOGvfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6ZNwKrky/lThoffrrbm+MLvOMXr8hXSrmvT/j22RwY=;
 b=FJU72HHTMwXqq4WjxPTOiRMvjD6P/RqpKkypPP1Pm8xrr8cNGkIUvH1x8yxk53UTzcswC5Ms183g/J11BZlPgXS021UIt1sJjg2MDCxj0uHjFb5apPoFW6RgE9CMjytyBS02+/PT36ILFL5LcL24cxojPQAUGNzj2ZzvDHzz7tEukn165Ce4d9nPKkeyZOejmqJhOiJW0dTx9VVJgemgGBwiYfi/8wqkkySrwh4/Na042nafhxyquMOxALiK5tz000MhjCe+L5jZKoXTjDUukTzDPk586lwO4IcioTyUXlEb9pVV0wyZz39VePzckBBrZNQZ/7XtvJn+bzfmRC4RYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AS8PR04MB8562.eurprd04.prod.outlook.com
 (2603:10a6:20b:421::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 02:22:04 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 02:22:04 +0000
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
Subject: [PATCH v3 14/17] arm64: dts: imx952: Add AONMIX MQS device node
Date: Mon, 24 Aug 2026 11:20:17 +0900
Message-ID: <20260824022020.2812810-15-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
References: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0074.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bc::10) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AS8PR04MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f6619e0-fefc-4d13-a02d-08df01867d1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|23010399003|366016|3023799007|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zXMhshKn1RsAM6aKy91RZj+KVtclV8GGQOF/g9Fn2lmRawaVO25Yhzk9aibwn66J2UZ1ZpDIqNa0r1fs3xUuw3vwVpAqWaHfRX1Q41JVO82uF8Fkv+1Ry5uB3HETBcXnDbQnf7gOeM0tXGdgb6YxIz8xOSMhlTK3oLdthx3/sFXhpLqfMHd4I4G/ScYvhZbuycyd4taaDT71xRHZQFRREYCCDn/BBZSnxU7p0ZexAtP3H8b6DM0ZPShRR65VkePOyOLxsSypWjXDm4HvDZpmnZF70p5ZkEStI9oO3qWJJL4rinH4AahoyTDVcqb3cNHpKuwkZ89j/bbf8+VkTfl5v8N8F1uWYML0JHeMLfUHAyPuLbH3+RiRJlSz4q5sUhBvWAry0uxchU07dYVyBTq5m8VG/RsfN1jek6y1GhvUhsebetLyD+DcuwVs/iFYFWC+56HT4m9M6fSwY/vjDl654H73na6lv5n3xXsBrE5E8xhMzR+UuYooMxSGu+UNLoi/N20ridZNT3++U5Nra0bjn1lGmmYdXSjtvR4CjyVSSIfjHIq0HgWhahVfILGHLFpizJEsu13RTZEoAP+A3gStBWcDIKbGwtYBdJZizz2tFL3OqbV7W80FQ6MJDuPf3lLv/luUmNgTh/bfFTooa0OhSk90wxXpAsvFI+Pk8p06GTo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(23010399003)(366016)(3023799007)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zPk7IKVPrXbwf13WU60qu1bIDE0VYQM9h/f2WjS7SMAzG0eHy0gAVNijVUBv?=
 =?us-ascii?Q?+LutcjA4jyRvb0eMOrEnfHDj5IjhSOZVzqUh7Tu3D2X1siBzaZFD7M8uyMci?=
 =?us-ascii?Q?5cDtP+dHdUcqEn5f+jctJnoqHl63AU+FvzrUaVvD1X4sIpWFdV7OW+KHk5FL?=
 =?us-ascii?Q?TRnuJr/HySMg41pH7ex6ksQ+yajPGUfn+MKkwzNSeQM4ng+epCYAkU7gJoiO?=
 =?us-ascii?Q?dh+KLNusjEe2iONDVNpMqExsTwZ1YyoT22LJGweHhEfX+xWy+PFR+/2z/Eo1?=
 =?us-ascii?Q?L4aZaCTTbZkt4QzbmiOOkDdWPbkaJ9wTGHyKbB6ZIZMMCW8s2bxrlZ7ZrKt9?=
 =?us-ascii?Q?jPurkGBA7puws/ooKAQNrW1Lhn0orXJIt3gS/n2gwFhOY+rSu55PnyGEPrur?=
 =?us-ascii?Q?nxa2kWjsbnK7DHmXGh4Eh7ut5Qg2Jez58FGk9aYXjcQkpMLTJDJ4zNeEgPH7?=
 =?us-ascii?Q?QV7qDOUyOVLmaGGgtnXXYk27qq3V4xomHcpJZ57/uYnKC9cDmJSnzwylS1qh?=
 =?us-ascii?Q?snbm2sZYvdGZMWCDHD0qPlnEfMrSSW7DvwUGLtqmfTtYTyfL9pd+AgUILsvF?=
 =?us-ascii?Q?iV688l/a0rZSBW/7wP8FuA0DnD/SDwYhwgqc1J8wxAGyolrrO6bV9kn4nkQ8?=
 =?us-ascii?Q?VJAxelEm1Vc6zeG9d/6dL8iGL3Zxjrc0vkLsnGDlDyd/LYQ0gffZ4VqKWbbd?=
 =?us-ascii?Q?bRO2cf2J9v4wk0rCLNMayO+cm7x1b9AlV/pviKKeyrvSL35kbCdmNKVkeuGR?=
 =?us-ascii?Q?uA1LFVkZsbua3cINX2fryO13oqNF36sQ5o3FvZmA7si/l9faWyAw1mwOc3oD?=
 =?us-ascii?Q?uC1aMe1evevGBd6W3ZRnMqRB/RtfNRg5y1++sbtEdxpDRVo5l0lvU9pOVL1C?=
 =?us-ascii?Q?KduAqW9S8LkyBPfZvl3Uw1MqJurZZMpPQQI7COorwZWny3TZlPGhJjwh61Z1?=
 =?us-ascii?Q?OK5GjjZSSVN434qeDuxLdEs4PURCM/Eq9MP0+UlVlwwFo2hzCdp9WB/Ci+J0?=
 =?us-ascii?Q?2Dl8LTGJFfSWhsuWe0/uVoLUxI3Kxu/MXtKrzMjWZ9A7iloQZnzAMUBKcXFF?=
 =?us-ascii?Q?mtjvR4sYkjez0aGXZ5pfdUrTLhRCi9uxwVL7K78n4hCfbZDvqQcm7x5essfP?=
 =?us-ascii?Q?bPsSUv8NaAXQsyTj2KxQID8zQ2IfjltD2Cfn4LjaIfhGhmVtL+NaI2TWlQQR?=
 =?us-ascii?Q?WXRUIPvexiYUAAetinRPO9aeKilI80NPullSP1vrRZhx5/9oy3y1bpYngV/Z?=
 =?us-ascii?Q?AbEJIB87GgjwrF4cz17KYONhxq1KSJjWuSvvg3lixOp2CTBSxxEVruZiCbpz?=
 =?us-ascii?Q?WxB4cfZBsjPPdb0PD0IqOq8qRNTESyUNeVHZE2ildxI0jvD9vWvqHERvKFnR?=
 =?us-ascii?Q?EspdXBo4yfQ4T67KLu/I5srqMpVotcewx4fjdI4LuDoAw5O7XfGQOQ7BoY1L?=
 =?us-ascii?Q?pqwxfaCaLRwa9Bv15QgtKS5fCO7qnxqrZpR5Ad8CS2iYmaaH7HviCkBjHGo6?=
 =?us-ascii?Q?yeY5Dw2R9I2jWMeabxmOAaifcspTsEwnvutpNwieh+vJkF+PyVAoFkDHU40j?=
 =?us-ascii?Q?+gp/r0Y1o+cCiSGf6Zs+jklyqbq0XB6PfOZ2Q5xcWr0ducHfs7M0Q7qGEQ01?=
 =?us-ascii?Q?40WGeLFwQudP0M+cjQ+MzgxeRZ2U24Y55tuXf+fIN3nNp3wZSCHgxcY859FV?=
 =?us-ascii?Q?kCEFXp8c7C5GC6Iy5uGRoA6FX5LIh1JgaZzT5V+R1ExOR7KIUZO8dlrkebIm?=
 =?us-ascii?Q?JuWEfBTf65CSqKOGnqdi8Uiy02WmGjwDndi8I+gX7yazbghwSVmL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f6619e0-fefc-4d13-a02d-08df01867d1b
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 02:22:04.7346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0LMs/DWV88+T01l2913uiZSGlpl4HVfz2kUeep4L6MWbVQCZ4dbyaqN6V0UjQgBKR+DRjGAZMc8EZR4Te/9qewlWY1ALA2BHq0LURvgwTBa9uYnPwBv+6h3d8TOsX1yw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8562

From: Chancel Liu <chancel.liu@nxp.com>

Add DT node for AONMIX MQS (i.e. MQS1).

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boot/dts/freescale/imx952.dtsi
index 020de00e8285..54dc793a2f69 100644
--- a/arch/arm64/boot/dts/freescale/imx952.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
@@ -261,6 +261,14 @@ scmi_misc: protocol@84 {
 		};
 	};
 
+	mqs1: mqs1 {
+		compatible = "fsl,imx95-aonmix-mqs";
+		clocks = <&scmi_clk IMX952_CLK_SAI1>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
+		status = "disabled";
+	};
+
 	gic: interrupt-controller@48000000 {
 		compatible = "arm,gic-v3";
 		reg = <0 0x48000000 0 0x10000>,
-- 
2.50.1

