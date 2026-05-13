Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013012.outbound.protection.outlook.com [40.107.162.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65784388E5E
	for <imx@lists.linux.dev>; Wed, 13 May 2026 10:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778666486; cv=fail; b=CPJvEltyb2NhylwfX2XfWIyQ+QZk08ldDwaooadgUw4tMOSbLB2y3Z95zzYr0pIV+tIkkLqOhjo/HNcZCPVz1W/iPEbPAiWsbqPbHu86tkujI8stiZPOSF59D8nlBeOtyCzs2XXZrx599ouCSUmv0sSh5FjbCl1rz4znpdxl3xk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778666486; c=relaxed/simple;
	bh=s2dpyeSxHdu/qqIlW2QpPzM8pOpZReU4RoLzXYnW1O8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rKpSIPg+ooh1c6An/6mno5JLrRxm5cCy1NF9dJmrpY4IN3QUArXNNxVilD4iP2g8ntH8omBOHaNez5703sRZBZhASn5yrFlorQ1kIeOVOZ8Y2uLfkBHDcDfCpQuiU3AMRdSQ+uAJon+LQzf9VCM/7ffO/xinH+yjCVIbVfZKOfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GW+JxLvM; arc=fail smtp.client-ip=40.107.162.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GW+JxLvM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vwp0GPcs7VwMSCTtgMXDnEIpEN9XHB+enOw2LxJt5OF3fyyhckBDGu6Bo8RpraQ+2upjqXqeJOX4Q+JosHh5ZNkWZCYiY8koyieMsp/Z6TBZNvhx3rtmh7BQWctPi8wI8t/DjV92krEr72JhTVTqhy8EaElBYjVW7SR2h6DeEkRMHBQwrR+MBSyzhe9x1MhqqBSS7ar8VDvTWcMzBFHlXaNCqt0mB7J8XQqAaTVaE1GZnchPv0uuqmOSLfW8Nm8YHLHNRiLqsAROptgsTz+HdG0St+zfZk8WFar/aksvSWJwArxyhiZcHYhAEnJQXWDfdh1dlh1ktWpqh+gJLoUYZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NT9djEAuWrArasplqlAFNDXcFnTnY0kN6e1Cl1pKWAw=;
 b=o0uQ0e6LX7kgjAFbH+RanE6OiettetUErNj8yRSMxWUILrKp4dIaO7+NiijIdVOeE63DyO7RNoJGjQ2qXe62Mnz3odnOx7syazEeEW81A9WYppC/MZD1EPB6J2oZr8RfTB/Ar42XcYI0ERtaQpxPOJubzwUDPmBbmUz46J6Nerppd8XheTp791sXMCEdlatcgdzbqwcKJLzBVUPxFrpEJrh/fA8XVi9jiZLvd5AXhM8APFWvKoYKPx4shPWgeh7Xfe26pJXmsF3Qdd6d3B8/2ed/y6QvsX6lgiCqG22Yyg6RGpDlmnuUpuTqIjH1src1jwScUyv4pQYqwrLUzt2R/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NT9djEAuWrArasplqlAFNDXcFnTnY0kN6e1Cl1pKWAw=;
 b=GW+JxLvM45xPXQNiUq7VxZ9ZstGgbyQ0HMoWc0OLtaiP/3JrMvwud/oOYUQOilmcex/6cKWUh56kC/wYbnoXflqSvENX2M/EZt+XExNR6jlD9+aydXcMyfizfGV/wY9hcISYPusA/Gh62cqPn03OVZ7jLnmWxnyn6VBu/N/+m/fkVX7D0hcW0BEb8jIlaQq0Zzi4077mzrT7VB4omkS+IIgZ9LD2tcTirffBJk7a8nMl2E6FvZ55AA7Bz9FsstTnBv8+Zq4IZvaXIKReTdc/oLfhmIMRYEwCGfE5IvUob+zIp71TOw5V0W8kl8AnOxLJEMANrto/IxpXnMTFM8L1UQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 by VI1PR04MB7134.eurprd04.prod.outlook.com (2603:10a6:800:12e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 10:01:19 +0000
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c]) by AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c%3]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 10:01:19 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Wed, 13 May 2026 18:02:16 +0800
Subject: [PATCH 3/3] arm64: dts: imx93-11x11-evk: Add DY1212W-4856 LVDS
 panel
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-imx93-ldb-v1-3-d11c5c3cc197@nxp.com>
References: <20260513-imx93-ldb-v1-0-d11c5c3cc197@nxp.com>
In-Reply-To: <20260513-imx93-ldb-v1-0-d11c5c3cc197@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA0PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::16) To AS1PR04MB9287.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9287:EE_|VI1PR04MB7134:EE_
X-MS-Office365-Filtering-Correlation-Id: 81b1898d-a89e-4aca-d752-08deb0d69463
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|19092799006|11063799003|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	dMYT5i3SdSkCerMK0HI4dqxH1uoj5/OkVL2fQkzEwStB470rIAuTGmIrZJcBN+FubCNaX3qpPb60Qlvor3epsVlnVM7DslaiMFE5rtZfMkoXKGSB661qT8I4KAEFop01T+ZB9/+CDQVpNTSRA7I2TI5fkhcqtC/6q+WEaVBoELwjF2cxv8Xa2Zd30h7nVnl2JqPs2vzCG88E3MbG37FOhUUa78jyFwaeZay8yUj+7Eybtz3PWFVQFv3UYAmCg6w9Ko/8iSlqA/eVeh9i0lZH6TWS1uhd6kebZUVMSyASExhu4C4hqXLexlYU9CGSyeN01LpvFp1jEqi/kQUIM7jNuvaqQbKoQlkp0Vqing3a1a16tVBgIlSdRYXLXmobnH1VV0HYcBy5TjKXe/DBTp1l5KgJi0Noo4lMSyXCq0Z4jkV1iSPU4GyAACaA2g1DbjL14ZrPR2PAlk1lVfkbA3uqaU3ppVdv3mMEf26OY6dB8Wvmx2EaPhcuZrEVViTgVjiadsZmPsJfpzZS1Om+S0s5u1HWsk+x01RHCX1xlvbsY5RFGLgNktSxDPLBm3iKcWvw+fyfSEOVjvQPD2ZTgbU23wfUKYdhPCaOVDifUxgbpzrCegJceiJlfwnOczv6B63kjIpeincoasyFFTklcaACB2Ho2J5a8FGt1eW6sYYSdg1nhdU0maJ/vmzBSaJ3FBea5kPISPsPMxSOQJ4K0ky2Avqu7oZ313CEdwxB/XhEefwehtbbYPHjxyLzYCQIkar+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(19092799006)(11063799003)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d011eXMwMm9BcmNtMGx0cWtHbk9nbE5XaWF1NWRtdjg0NG1UNklNb3ZMdEdl?=
 =?utf-8?B?M1Z2U21UY2YzMDJtYXJaMEVTZjFDTVVlYTFadldyMVBDMHhEWmdrbTd2MFRo?=
 =?utf-8?B?amllZDc2VEtQTEdTUkpvc21pbno3bSs0SFB6RnJhM1hkc3ZxS3d2dDZiQWVq?=
 =?utf-8?B?elhud3lkZVZiWWVVYjR1QkVLY21Gdmo5ZEhGWTBpRTNKTGlxVXhDTmI3SURF?=
 =?utf-8?B?Y2RKUGpZYUlUUGZSY1BCbHBkNVFnSDRjekZtTldFbjkwNlN4eDVoNjhnek1o?=
 =?utf-8?B?UWJrQWJ3OGhza0h6eHc3SGJmWU42U3c5Q2kyZHRwU2dERnJpOWRkS1VKWkdi?=
 =?utf-8?B?aXl5c3h4a2F0VmR0Tk0wYXUrNnVXU0MwbGJodWlXWEt4b091dmh4d2hwejBk?=
 =?utf-8?B?MUN4WWpxRlBNa3hwQ2huaiszdmJDalRncmlpUFJTOWIwZnBibFpiWExPOStC?=
 =?utf-8?B?dDMrYXZBbjFjZnJGUzRJN2ZLdmpZWVZYY2RsRDAxUTQ4a2tPYThLVEFoVXVX?=
 =?utf-8?B?UldsVitqK3hvRjg4WGEyMy9OQmo0bklBNjhFcUZEZ2IxUS9sRTVpekR1OFJC?=
 =?utf-8?B?RVc3enVuQmhjeDNlZFIzRlY0RTlxSWxoTmdvdUdQUG1tWXo2NlJGMkcxMVAx?=
 =?utf-8?B?VHBMaUFtVjdWZi9VVW1ReGJLN2luYlh3UWdTUW5NVVRSQm8xRXdSRS9YRDZR?=
 =?utf-8?B?MU5MdUVJekk2WkhNS3VMbWZZTlJPZS9RSzNCakd6am5iZ2NncjdtbFpDSENL?=
 =?utf-8?B?MSt0bUFINFp4SHBoSzhPK1g0SmtOK3BZdnJTYXNqVlFMZllhN2M4TXVVMC83?=
 =?utf-8?B?bUt3WWNLaHVEeVFvVWd2T3g5OFMzMUNkeG9HZ3Fkc1dTNkpwV3Q1S3lIQ1h6?=
 =?utf-8?B?ZmllQ3ZYS0tNVDhJcjFzWUQ0bWpSME9ZRnRkUG1LWjNkZmNqZ0oxTzQxbzJ1?=
 =?utf-8?B?VTFZOVJZMUFtVi9SZW5oY0p0UVdXTnBSSklhd283L2JSS0IyY0pzTk5uK3Fu?=
 =?utf-8?B?RVluUVFsbS9mQVYxMGwvRVJrU2VZak1Td3dLekM0MGlONlZMMXkxRVlIdHNs?=
 =?utf-8?B?emR1YUNNTnpWUHdiS2RQTWpFNzVpQUwrMTVOd2RpUmN6M2k5WkZpZ3I1WS9a?=
 =?utf-8?B?OU9QR3VvWmpBbXBjQjJKWTJMYXJLUkVFaFNZL2ZrSG44Z3hZaFV2VzhZVGFD?=
 =?utf-8?B?NUxFWXArdnVHSEtjczl1K21CMjc0QzN4K3RzeWdBcmlvVmhNRXUyeklnV2F6?=
 =?utf-8?B?TURxTkkxMnkycGtFU3lFVytmQXF5WGpBZHo5S1lVaUtXS3F2SUJRUGZieHho?=
 =?utf-8?B?NDVWR2tUSEJRM2JDSVNXUHh1MkNabnVmU05Xc1Q4UTFxQ3R0Zzc0VGxHZ1Zy?=
 =?utf-8?B?Z1lZL0YvNmM2RjU4amprdk9VMVQyWjFOV1dWZlFTN3UrMytsclZ0YTNoVi9C?=
 =?utf-8?B?TVFxMGhkTzllQW9GQkNQbjNqWlJRQ0hpU3BoYzJnYzB3Ui94VkNiNm9NeGR3?=
 =?utf-8?B?bGdoMVpER1lFZlBEK2ZPZGhZVFV1Wmx6Z1lWS3VxaDNLT0VBaS9nakRMRDJz?=
 =?utf-8?B?Z0FFcmlqL1ZMelN0ZHFyVDdoQjc5bHpTb1M2dy93ZWdKVnFFR3MrL2tIOHh1?=
 =?utf-8?B?RjFJM2JKYjBxUDFDQzdTS0RjNTBMQk9TSElDWlBoZ09wSktwRVN0aXFiSFo4?=
 =?utf-8?B?MXlUU3Z3TElTcmwzRjRxN3dPMHI0Q2hBZmtGd1RSaStCTytRSVgyaU1EaW5K?=
 =?utf-8?B?TUpiRW5OKzU3OEFwVTNadEJGVEI1T1laWjFYU3EzSnN5NEsrSXFzM081eHBF?=
 =?utf-8?B?SzI2V3dLeDZwV3UwOHhlODY0YlhJRmZGWHVQL0ZOY3AyOUxXZlFoeGZHd2Zz?=
 =?utf-8?B?elE4clB1aWZWN1hOSEltNXZqbFMrWWdYZE40eU1TMXJqeEFIeC9oZXNEWmpp?=
 =?utf-8?B?UHJGSVgwei9lbzB4YWVIdVpnNDEvREdwSkc3WDJUaG1iY1RleXNpd0cvMmUz?=
 =?utf-8?B?T2NWbmlKT0VhQjVLM2M4VXFnZ0kvb0JOaU80OXBWc2NEYjdFM3hjTlVDUDhx?=
 =?utf-8?B?RkV5b0poVm9vVUR3T3kyYXNnellqRk81cHZOb1cwckpPd2MyZllYYjFZVEtF?=
 =?utf-8?B?SjIrNTVoa0hRZ0tFS21jbitxRTAzVTBXdFVHS0JLblZkL2FwT1I0NVBFQzMr?=
 =?utf-8?B?eVpUSy9hQlpTbVZrcmtwbWpiR1ozbm9oWHhXWHNZZE5iY1pySTAzcE1XNTV6?=
 =?utf-8?B?WW4yN25IUVJzWktJME5jaEdVSWpqclRpa3YvUjdQQkRHWXowa1F2SkUzRHpk?=
 =?utf-8?B?NHJkektKY1N0NXUvUkVsbWNaMGFjMHJrOVFSK2R5am9XS3FhbHFtdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b1898d-a89e-4aca-d752-08deb0d69463
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 10:01:19.4315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gc6oD7d/X/C8ZbhgFKH56iYHof7OrwKu+waeab6Syk1TqukgW976YkVXNLSy0xOHtuNsKlerv0W+NZUwK2Wqlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7134

DY1212W-4856 [1] is a 12.1" (WXGA) TFT LCD panel with LVDS interface.
The panel's 40-pin connector allows it to be directly connected to
i.MX93 11x11 EVK board.

Link: https://www.nxp.com/design/design-center/development-boards-and-designs/dy1212w-4856-tft-lcd-panel-with-lvds-interface:DY1212W-4856 [1]
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  4 ++
 .../freescale/imx93-11x11-evk-dy1212w-4856.dtso    | 81 ++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index d1bb303962db..42f655986987 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -467,6 +467,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
+
+imx93-11x11-evk-dy1212w-4856-dtbs += imx93-11x11-evk.dtb imx93-11x11-evk-dy1212w-4856.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk-dy1212w-4856.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
 
 imx93-11x11-frdm-pixpaper-dtbs += imx93-11x11-frdm.dtb imx93-11x11-frdm-pixpaper.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk-dy1212w-4856.dtso b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-dy1212w-4856.dtso
new file mode 100644
index 000000000000..35f7c5699e3a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-dy1212w-4856.dtso
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx93-clock.h>
+
+&{/} {
+	panel-lvds {
+		compatible = "boe,ev121wxm-n10-1850";
+		backlight = <&backlight_lvds>;
+		power-supply = <&buck4>;
+
+		panel-timing {
+			/*
+			 * Set clock frequency to 71142858Hz to accommodate
+			 * IMX93_CLK_VIDEO_PLL rate at 498000000Hz in a rate
+			 * table.
+			 */
+			clock-frequency = <71142858>;
+			hactive = <1280>;
+			vactive = <800>;
+			hfront-porch = <48>;
+			hback-porch = <80>;
+			hsync-len = <32>;
+			vfront-porch = <3>;
+			vback-porch = <14>;
+			vsync-len = <6>;
+		};
+
+		port {
+			panel_lvds_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&backlight_lvds {
+	status = "okay";
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&lvds_bridge {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&panel_lvds_in>;
+			};
+		};
+	};
+};
+
+&media_blk_ctrl {
+	assigned-clocks = <&clk IMX93_CLK_MEDIA_AXI>,
+			  <&clk IMX93_CLK_MEDIA_APB>,
+			  <&clk IMX93_CLK_MEDIA_DISP_PIX>,
+			  <&clk IMX93_CLK_VIDEO_PLL>;
+	assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1>,
+				 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
+				 <&clk IMX93_CLK_VIDEO_PLL>;
+	/*
+	 * Set IMX93_CLK_MEDIA_DISP_PIX rate to 71142858Hz to accommodate
+	 * IMX93_CLK_VIDEO_PLL rate at 498000000Hz in a rate table.
+	 */
+	assigned-clock-rates = <400000000>, <133333333>, <71142858>, <498000000>;
+	status = "okay";
+};

-- 
2.43.0

