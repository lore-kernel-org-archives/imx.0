Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013052.outbound.protection.outlook.com [40.107.159.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C6131F987
	for <imx@lists.linux.dev>; Fri, 10 Jul 2026 02:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783651344; cv=fail; b=YTV6xEBm4J+cbbYMd9H36ANtIHsMrVXKjFUanvmF/b4us2s4xI3+UL96wlpx8mAsSyzYkEDFWjTeu46QMAPaGc9ZhLHnO1FeceDkOzJZL4y32QGS8QYB7k7e/nRyd6ac14a6BEbo+6+i+NBgXRLyEk45CKRnC/YsqnVGcdyhEdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783651344; c=relaxed/simple;
	bh=IqswteEJd9UKcfEZ9Q4vE+xxqnSCQJDt1PT0sDiRnJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pa7LjeO5doWTiHdpZjYijORCRk7QTudRW7EAH+xQiLExZugPoWwikJHITiB15guMw182fi/N9024Jm4/6TfXuY3DliDZ9rCCQOmbNZF7JUSajGvZhfGLHmPcK3C972hiC/Gxe5swLA9sDXQFJbaQoNNI3zCUMnmqJs4OJPzuaA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ip7C38zd; arc=fail smtp.client-ip=40.107.159.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ip7C38zd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xADXknen0SdELBkYJb7JUj1mtoe5XjSCwRuPbOegCPEZIfOL9LH16WB8UP0BLuc67DyRuvBwrUVaP9Pi6ri8jLXecVxfAAs5tanp3pztJYPvCBZJfCX8kIOkHsLAbN/bcF+MiP9Fr5rk+5wsUMYmlF6yId8wP2y3BGB3+ktLn1q92bxCpM/Ox8ipufCnUdwjjuI3wLHcQUEdpHRMn9YOgMfu5Ln9EKgqFMEecQWjaMgWBUziXoExEs9R3KWwz0J/Yn2vP0yPrRx98oaatmrWi+OictBj+D4Dx2RMjFYqENgSVhDB/dl0faIlxUicjCpuQwWZayn8OsMlAgAgog9NLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJ1KZYBEi8ROIOz6ZtXfbKVo5SDtnqwy5IlaLTTjJIQ=;
 b=y6ghzBIO2016cjPJ2B6nXPybDbxdc0nd3B+3D9gjv/N6IgAwPpUTv4QyB6UbplqydQd2KmSG8Wy/KhcJeRsX3xlMpzdVWjyNlnCzihqElAJPwTW0FODo2P4qYNLnZXZTgF2F2ctADO97MLxbU7ZSCK0AVq2okmzkX11QESwHfoGQkxN+rOYmL0docViVr7vippAfPTc+ZSfVxkruHfaukidwqp9IKq7NAAx2SduIHntt/hRZrKDu+M1j70GBzPrZXHw3sufEIFdkQZR8RuqFnYmhRmoUP3PFhxVwTqgo9u/l5Q2JaLO8/yY20Cr63yLGPUPqK5Tbc4SAlAIg+Ybv8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJ1KZYBEi8ROIOz6ZtXfbKVo5SDtnqwy5IlaLTTjJIQ=;
 b=Ip7C38zdAf/0++cSpXDTSd9WUynzkDfAYGSsA4VJX4MGSnAYgKQTVEUSlodeX7rEnOn6NaKEuga4brdrdkYu+FmjCaLUwOwHfJoQV3OsiVH7b/2TdFuran+8fyC3jYGB0q3XxELB4vpExu3AdEWRw527NogusylW4XYNSt8EdBYfmYeb5I3OFzIsldc5eccF/yBiGoYuFJjQ76yh1YGxMaFFhqq/fNs7Ai6XhxW2hWNNmsGavGl6nZj25yE3ZDiEvhwedPaL8MOYHe56u5Y/G7pFyMzE6Sc3n0UiJrWvSRWI9Y1v55Eq9t+ZKOMxLfSHpMJa7WrmCmbf1+EVNSnqMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM8PR04MB7841.eurprd04.prod.outlook.com
 (2603:10a6:20b:244::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 02:42:19 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 02:42:19 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/3] arm64: dts: imx91-9x9-qsb: Add audio-related board muxes
Date: Fri, 10 Jul 2026 11:42:02 +0900
Message-ID: <20260710024204.3462444-2-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260710024204.3462444-1-chancel.liu@oss.nxp.com>
References: <20260710024204.3462444-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0026.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:114::10) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM8PR04MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c3ed526-b69e-43ff-392e-08dede2cdcad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|19092799006|6133799003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	LUjH4JSVBcUzFb9oWoubmyhzQWBQvMURC+EEKhBkff4I/uDNIUXFXQV8uGiv8tOmoZw7uXoYkIiAJ0/vIfgi9AI8qIONALLJwL02bU09dQvW9If6WlZUyJs4KjqNa+R1W7wZBb/88mzeRonCQN1GspJJ7SaDXaWu1qTBFGQCM2Vx2wJHEBKvtztXb/PpcK+B64hVCQl6q/H+aOjdC2HQV0l5RuiI2dMfdzWW0IfbiMI5NHdMjRcUkH18e0QlY4BhkjLGXROjCPxD4+BJ1JHPI5OS1buOUuaYZZpPZDYCXW9z8cS8IlBFuZ6MlZZXUm8SvBEVG00j+k4gJL55h2HkPqG6FKEvkz65Ge1vHU8L0z0f3uORdQLepjtD2G3Ot++sTW91nm7WvBdXs15yQKmYfuHGOSqy+wKzToM8ZJFruxb3UvUfru7+XYx7ilrktz2QJVccFCZMdXHdMzhQT9e68lkk6iATDaVmAdlCd5z6knihNHWGSJDIOaHACq1beY6Rcjp9iwgOMH4YKWVCzMlOQW+NpjsQmONOUZTormP2igYwwC3J1wYyaWI8YLKxKAVK+5+Mwc+1X0aLZqd7z6wIc6NqIHjlp8919vzQyQ3pzGU0XgUV/9Qxq7+GsbczNj1oFWkUd9pey3S239KSGYZfOQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(19092799006)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eiXGI+g4XROz1YOtA5sfrdcfqE/FREiRryduFivzsFVAh2qGEOssyX/LdVzm?=
 =?us-ascii?Q?4KIIU0rZ/lskiI/+uFSA1DPVkM+zN2QDLzoum3JAfr1HH6ghK9rQqLZ/wwMU?=
 =?us-ascii?Q?2EMtP3TXUlqzByqvxurHXP+3Ygd9NLpEEkbmjz3DvTyJ5du7q8tpQh2sOczC?=
 =?us-ascii?Q?XYG65BZhhsUTJEUbdP+AWlbT7ALGIkJPW5kHK6yR46vAjJN1bKoORzBY4oKc?=
 =?us-ascii?Q?My3ZqZySPZ33W2JZKc0PyecwZsuOqUFNeyzaQWtzAMJkgQUkOXIFFV8+oMO3?=
 =?us-ascii?Q?zyno1/sXU/Xf9FTUvHIvbm+K4/JYwdbj2HLF6qYiPnXK1tkCs/tAo8qYeRqy?=
 =?us-ascii?Q?3mztdUneAD9mYU9ko5zPS57SjvQSxa/DqfdENWSFJ5JCDN1sN+C5DTQnRSL4?=
 =?us-ascii?Q?AmkU3hO9florYTTCRQD94pg3vBBHNOnzA6C3gU4U4EDIcGUhL6F7oknFNZb1?=
 =?us-ascii?Q?T/x2YtspCx2SV7uTnD29Pi4iCe0A42wJUHk79zFRMjmC53T+Kyi27q4QGCCX?=
 =?us-ascii?Q?rFZH2PLBUQPHNsfcO3k5eGSij2Wr/Imcxsa5g0jDnxprRjTiHbtyaoVZJ2Od?=
 =?us-ascii?Q?a12S9HUrbA1lWbm720wOLMC/JI/jyF6Q5JAgm+w680upzA2PDWdqxHA8PCAL?=
 =?us-ascii?Q?917cxAaUxijjN+HdK4tfEPXKOs1Lx3JKgcaHv47atM+BrAQ7IGPXWlwX9Pla?=
 =?us-ascii?Q?2E3cJyuVK3kDTUds0qYb2JLgzbalPNKCPBpcftjB9PDwX2CN4esSQO37FUKZ?=
 =?us-ascii?Q?Y337NdeJkqDvOVD5qINh5AA0JZFAFW7jxcWpCy4MDMcePqxSpWIB2TqO9Glf?=
 =?us-ascii?Q?oxNRXLousnEcW7CRUxsVG9BNQK4R7GAYFJJfbO1Cc7deIPxviSPvHzErKSqM?=
 =?us-ascii?Q?GF+SxgbIANeBckBNODHSQfei53bRnlxoJwXGMY6MGPHaa1xQiVafP4NCMqGz?=
 =?us-ascii?Q?IGgic5d1O/jI5xYF2/DE42wJvo7c8oIIKgkAQBiAWqCg2Hdu39huS6mry5u+?=
 =?us-ascii?Q?aYVMtvLzZAbSz8WsQ3k++ybGiNiFTNyGLXVM9DMm922yC9L2/EhaOyt1sUYf?=
 =?us-ascii?Q?uaJ6N0R0fDUfhWlatClFt75bXgCVFfFElP9UcMpreru1HpSNIFdFjKjmkFwP?=
 =?us-ascii?Q?OTpZcFda5pTagLRe6LylorWh+qSKalpTGUOl91TR9AkOG0mJLh2MkkmphdF0?=
 =?us-ascii?Q?TM0alkRpDXwHLNT35vpAh3+VZhFU801+vR0l7AexinoSBHe/GNt3Dz+tWUfU?=
 =?us-ascii?Q?0zmsbXQLjZ0KCKMRIN0TV92gPL3GoqHTdcC8Us+SDMKlHV5FvEUgUpGfqjin?=
 =?us-ascii?Q?QAwBPl2VgjGS0jt22F09KrKU2JH2dBfgwHA0dhcI00O/a7hTp+s0+C4Ka4DX?=
 =?us-ascii?Q?gb+h/rRmD3dQe+avaG/JuN3sizS07M9d5rU2MuCG6MZuQTCkp3tNkZVjbw9/?=
 =?us-ascii?Q?IRGzbv7z8rqUyNYbE3jv9b+Ch+f28rzT7/bFQfPwccVGVPDq7Pb1AvezJuLi?=
 =?us-ascii?Q?PU4pxQZTh2HY+NZQR0k/ra5A1t77OAnrfGRyncVMt9XruOENMg64gRk1FS/o?=
 =?us-ascii?Q?OWKJPGSDngbRduyxPOywZc7zzVO2qhATW1QyDcvwBBsOa2myg2PWGCHin0Ml?=
 =?us-ascii?Q?mgYRPwUFKUepHKcmxwu+aFqujNEnXom73MCqV+pMQAxwSYHHu12dTECgZx3r?=
 =?us-ascii?Q?PHMLphzozFvTnV/jnLUu1ksH6GVcJDzcL0wTiQbZZ3XZdn/UK3hqKrrZQto3?=
 =?us-ascii?Q?KiCHw5zs6qfdfZ4A0315rUBz7jE539geUMPBFwyTucrLiWjBia/C?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c3ed526-b69e-43ff-392e-08dede2cdcad
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 02:42:19.6987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zpl/T2gLc1TNlPI2d+4xkD0e7xzQQ+0ZqiGpgqF1blunZuvb7evld0RFELy/qoB+yXTM3+wXJ5Ek0tHfaV8fDrOB8r6brw/bUk5awQdz716VojRhhHCx7ZC49Hck0ZW5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7841

From: Chancel Liu <chancel.liu@nxp.com>

The board uses GPIO-controlled muxes to route shared signals between
different functions.

Add the audio-related mux states for:
- selecting PDM or CAN1
- selecting SAI1 or M.2
- enabling the SAI1 audio path or not

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx91-9x9-qsb.dts      | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
index ea8cf14e0bc6..4821ac312ab2 100644
--- a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
@@ -30,6 +30,55 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	can_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6524 17 GPIO_ACTIVE_HIGH>;
+	};
+
+	sai1_mux: mux-controller-1 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6524 18 GPIO_ACTIVE_HIGH>;
+	};
+
+	sai1_en_mux: mux-controller-2 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6524 9 GPIO_ACTIVE_HIGH>;
+	};
+
+	pinctrl-gpiomux {
+		compatible = "pinctrl-multiplexer";
+
+		can_fun: can-grp {
+			mux-states = <&can_mux 1>;
+		};
+
+		m2_fun: m2-grp {
+			mux-states = <&sai1_mux 1>;
+		};
+
+		pdm_fun: pdm-grp {
+			mux-states = <&can_mux 0>;
+		};
+
+		sai1_disable: sai1-disable-grp {
+			mux-states = <&sai1_en_mux 1>;
+		};
+
+		sai1_enable: sai1-enable-grp {
+			mux-states = <&sai1_en_mux 0>;
+		};
+
+		sai1_fun: sai1-grp {
+			mux-states = <&sai1_mux 0>;
+		};
+	};
+
 	reg_vref_1v8: regulator-adc-vref {
 		compatible = "regulator-fixed";
 		regulator-name = "vref_1v8";
-- 
2.50.1

