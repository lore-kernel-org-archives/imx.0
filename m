Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023088.outbound.protection.outlook.com [40.107.162.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0FE31A068
	for <imx@lists.linux.dev>; Wed, 10 Dec 2025 15:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765380030; cv=fail; b=grehSYRx1JxWeO5naSEQHu07FJLEOHWPlRI7YZMhm8ovUaP4B+MgCkzDojve4EAXGUyZo74+TuwcMVflV+ZV3ZKO3+64tO5D/qx8FEWatpNRbOQ1upUGAptqYDkeSzhKHN+sEMoaTDBMEND1xJD4C0kiwnFSsuCsM4GVtAxG3DQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765380030; c=relaxed/simple;
	bh=yBref/AZwu6pgOZMRs83ElRYvornogsTNti67ViqWjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UQ7O3vjAooeQUabpt2/QZ3xVBKCFfO5OxlEjc9Ujvu6T8ZALAZaBRBR5EnYyT/j5Jb94VbL+fiLOAfqmEbyLkwB1rLFM/xRuKOtyL/IKq28PopooaSfr77x4MrvLzSNkVzZ6Jgjt6ntHQXzZ7njTmnO/QfAcd98vuE4eRtriOX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=variscite.com; spf=pass smtp.mailfrom=variscite.com; dkim=pass (2048-bit key) header.d=variscite.com header.i=@variscite.com header.b=Jbo2rqZQ; arc=fail smtp.client-ip=40.107.162.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=variscite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=variscite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=variscite.com header.i=@variscite.com header.b="Jbo2rqZQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQTlogr5puEKMTtjzLGdeF+H/jDtTNFesno6nxQrQ1ULuC8BUR6+VYSaTgU8Nup59XG7LRldPI/YmOV9tLGOeleQoDJrwL3gN5j6vEzXOrkiYQyGneXCYvOpn1xiq0P0y1Ch+049sFEuXqJLR9iocPFL0IFvUjRDRrI/lHZZekbNxCbFDp0wXg09HP6Whhx7zPAA88soViCoWb/z61tAsnmch1MyDshIBhj8j2PS3rGx7rOFMggaRc5FZvhDZdYZEKQbvmx9JpOnJNzJ7tAlln9FTrbaRH41PVSiy55VPZiU55POOo2g98gGyPZ5YrpbS5NWMNmF+uJ/Jxl9Kcj+2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFBu7h1JZxFW4pexj6Ke1Y08ewGv0xJ1I7XQdP6xSOY=;
 b=MQzK0GseN43OCLM/QzoHZMoFqdiV8Tn9WrtAIGe7mLYCVQwvdzrFjJwsscbYNmHiNWhsf5kwWCuzCs1+reVDYOXj7HN+xp+2lWs3W4hXYL59J/1WDPLAfdxwDhZlvxAxgYDevNtUSFcK9DllOLMKN9UmBoCPJht7JlZPqnE4+pGqvtVbnYoNgcEVXh40CgyUZn1dGae8c5wXFLCMx3BWO5juQSf4GBVcPAgAj/mxf+Mg7L+AImVcBsBmh9d+AriwI0PsKfwwY1pP7pRrV0Ny9yq/IZBUtGbyIbAxXOFRMZTrKboNY6mtnxtH13dCsZgoPm7havQHffFW+rMUZ2glog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=variscite.com; dmarc=pass action=none
 header.from=variscite.com; dkim=pass header.d=variscite.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=variscite.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFBu7h1JZxFW4pexj6Ke1Y08ewGv0xJ1I7XQdP6xSOY=;
 b=Jbo2rqZQINDu7YSYfRoPBF3T6T+vz9uzzx7KbYFcdZYZMF+rdRDpfJj3jrNwmQ7/spj+Ds0gU6ae7i+8hwX4jPXZZaSRxJBKvSXS9AsGjvTowJo6el+ZUzJoR9EuYf0j1GKbPuDXHVSQcC9HL8TYxwRTaRREGYBtsKLj/60dRe4rC9h6TsGmQCVSQ4qCmcoTKenaJIbhL848wrAeqYMMJWJ3LXl7FPTQ7sk5rT0+AhRz5niY4jzeomzxHC16FhU7nukhlrBvKLdH4f9s8pGFIJ9bPW0/ikFBgsFArdWc95zY95Qj/p0aLj4igq1zqY7co44+i244deO98mVw5BbBsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=variscite.com;
Received: from DB4PR08MB10341.eurprd08.prod.outlook.com (2603:10a6:10:3ff::18)
 by DU0PR08MB8347.eurprd08.prod.outlook.com (2603:10a6:10:409::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 15:20:13 +0000
Received: from DB4PR08MB10341.eurprd08.prod.outlook.com
 ([fe80::24bb:a230:6690:f824]) by DB4PR08MB10341.eurprd08.prod.outlook.com
 ([fe80::24bb:a230:6690:f824%6]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 15:20:13 +0000
From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 6/6] arm64: dts: imx8mp-var-som: Add support for ADS7846 touchscreen
Date: Wed, 10 Dec 2025 16:19:58 +0100
Message-ID: <20251210152000.42265-7-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251210152000.42265-1-stefano.r@variscite.com>
References: <20251210152000.42265-1-stefano.r@variscite.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0007.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::17) To DB4PR08MB10341.eurprd08.prod.outlook.com
 (2603:10a6:10:3ff::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB4PR08MB10341:EE_|DU0PR08MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: 415f09ca-c7b5-4b2a-2f03-08de37ff9d4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ExRSE8CGtEuaRsmqCrvn4D0V2YFCk7ia8kpimIastVtxKNoGdmVbEhjEfUVL?=
 =?us-ascii?Q?oVfZTidgi15DTzgjZ3uMOTfpT8nuueE0hHIjm+CXK+lKAnQ/yyYqY8R2yyUF?=
 =?us-ascii?Q?N3xUn7gSI5p2do3msLgIHK5pucUhBYf0tvaaWZuQWrpIv5WHHnNnhTKJVxEe?=
 =?us-ascii?Q?rQkPe/sfQmS2Hh98aMQRMNLJFd4lRjIfO/pD/V/T/bihpYr/CIdM+lRlgZux?=
 =?us-ascii?Q?kn95gXJk+yelnMB3eBElImqRfOBA8u2UQVkfOyphWZyAjb0/EDdHK6TPlVyo?=
 =?us-ascii?Q?J1Oa4IDN1dZnOqlPsDxksunSTKvYJ8m8/Q1p18yMIOaC7hQdB3k5razAE58f?=
 =?us-ascii?Q?lKOyqXUNaKhi66xI4RDI8dOqQo0Mkx7Q17LSgCF8eum/Yynz2nwQjqjqND3M?=
 =?us-ascii?Q?BqVCC8/Hqqtstj0Lsbv3hjQ4OXjXIGLZX2gkreURJpvYSpA83kdnILfg+rmE?=
 =?us-ascii?Q?hVPQ+HDQiJcNc9NOvJSHQxEip0t4JxdZ1JivY3j6EqN+wgzxqrWdBhYZGDMA?=
 =?us-ascii?Q?soJs7cHJVVZRS7ZT15trLlU4o62coN72q/tLIOHZznWBL7G53UL+ohD2Rjn6?=
 =?us-ascii?Q?P2KwWdeXtsPywJHW6/h+p9mkQfTyASuTVs7AZtVJqL3UhSUem6V/GcuyYtQC?=
 =?us-ascii?Q?IJy89X6W9Uy33InXv9lQFrSVP0/LHA5GY+ogxCxKJSegBeTT3eZxYnDT5xAF?=
 =?us-ascii?Q?sgphR5/fwPGFjb+cP1vSonNLY0zp13PR5ZyjTJIBceF9tNC7AQDbkPYSD4x6?=
 =?us-ascii?Q?8Ai0NvUJUgtA2/GWBBz00LLmpdaA/DVUvr1jruBjhPN9hxXymhjEoJiMCXM3?=
 =?us-ascii?Q?PrafgJ3ZEFjX+WjvxYNHGwjh3i6VYVzmq1czDk3PePIoQu3kjVJRXldBJ09x?=
 =?us-ascii?Q?WR254KSlezrnowLpI67GgiV87MD5S6QsztV0bE8hGUoaCsCUl0p9fOTiXCFC?=
 =?us-ascii?Q?ORA9CB2DwovPmP7GLMJtFcHQ7FYujAZ4hv/72r2wbaQIGr5mWsDeTAIOLSag?=
 =?us-ascii?Q?WJWnA5D9cc3OUNUjC7N/xwM2XB5ltQzJKyxJT9gLO8Y799AAm8nhcotX4zo2?=
 =?us-ascii?Q?SGjeKcjbd6eYg/GC8KlTgOZZjIEjHoaLTWppwNB82cBk6YwCv57BmShUfJEF?=
 =?us-ascii?Q?5IZI3DYFU2JAI6WAGBbe+Kfh1CIPtwL4A1Cv6GPPdN0wDZixSqQKEnfIKUNY?=
 =?us-ascii?Q?c82sGHXYohUr8qjGf0+IuDW+2tg2C0QVQQpE3j5P28tAoa0X67CeiXZlfyk2?=
 =?us-ascii?Q?Bel7zBzymwTdMpVn5MrJn4efDPQ0QCZ4aw03MZO6jyCCopqPsTK+PqnszYu7?=
 =?us-ascii?Q?MkNOuMV+EyTDdNmxT4c13gKIQsiswwmz2bjW48IG/vOZ4gPWkB3tTO06Og5H?=
 =?us-ascii?Q?jKXW+PLxmyp7oii/4L75uaSzkSqBZ8s1+xKfo+7gw8JXph3jqlS86hlYtrz7?=
 =?us-ascii?Q?hwFiM6NF4z2ca7DBjuH2XRNGsCSXHxlA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR08MB10341.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DmW2LydFCUTfg9BMA/2GGf/LdxcDYEebTLh8QDPyWcZZ+u0KSx/TN2QB3OGN?=
 =?us-ascii?Q?Jr7FxiXkYEi6VXJC8s9LwcffBCyfnrAyjDcaXPaGJw7iwRFtRLoDsOMVkLII?=
 =?us-ascii?Q?xY40SDRqXODRne+nOtJizJjAdAo6F68mhcBAplS5sqlEteuni5IhZqxSswLX?=
 =?us-ascii?Q?8+o4jDLkGAfDos8pIMg+qYsHa6QqRWaqHI6ri0hqplVckqNJwRnbfSLSmfnp?=
 =?us-ascii?Q?+SqVzT+8YakKpkqSlXqDAnm9NGQDXxP6ZjQe3qlm4+tr1YTkhw3FuMcmgvZy?=
 =?us-ascii?Q?VxT9ZYOQ2RyB3nZOwlhLlhowhiXEOCQjenAIQcSxzXtisrSwD/iqUcfcfbL4?=
 =?us-ascii?Q?6+29ewy4MEH8FpvEPhYBxqfjTNPBIS1uGMEJFgN5mgUlHqPconYGUzbfbfjZ?=
 =?us-ascii?Q?DXG2MDNcSq6MsL7wqnXQaaRdxJr1hlP8fW2NnrpCdOhN4vriMAJ9cjWDffrV?=
 =?us-ascii?Q?1gx5qr2lvVOLwbv/sRyFcp3t3q24vp8XitI0NOLgykuYwW+nNBSeACDCVTcr?=
 =?us-ascii?Q?/2EbG2tBb8B6S/Ye3cy/S1RcLC6SAUJWnjMNBT7uQPKjW/UFzUiB+Wo9WJ4X?=
 =?us-ascii?Q?4qBMop0ZNqpBY42X1svfaj+Oag/br31Yxw7RdJpPnvDd5/KluRk2XN7R9JRB?=
 =?us-ascii?Q?ctP/IkaidxZ2gaXagg6wOXFSRnnph/O9tUiOM77V1gzmDsNmFuaLOqR4i1TV?=
 =?us-ascii?Q?mk3SFI6/M2FQoCgoumtOvge2BUz/pjShfzrpWY6r3UAmKoPJp58lceV9ofYH?=
 =?us-ascii?Q?YT/q8Flw8Vu12UV8Qn424z6B+iRlqTcU+aAY6A7P70MxmZLxibe17ppqYTMU?=
 =?us-ascii?Q?IQMn64LMgsmt9rm06U8jnWvNcwQvIGnsr1wjfma18XzZW8tbDIdbdU70RYJS?=
 =?us-ascii?Q?Efvyx4xquw43AytxjGT8NJ8aMNqRe9FRcS6hqYJyEgqzIDQKoZuFPOs+c1vL?=
 =?us-ascii?Q?xS6iJA7T/e20Z0HAMKLSwSoUUWh4BVj641q5zPsFvtUTWoTjF1fuKX3w48OP?=
 =?us-ascii?Q?voum+I0BlbP5pdZmHjwnF95pWEWPDIMbSTAk/4XrebUIhAcUBe3k8j1siyJM?=
 =?us-ascii?Q?S8RogSpurXtVvCsJ9iYlk6bx7MiK6tXUdJtgNmG0FdeduOgB4UGEdM9HfKTU?=
 =?us-ascii?Q?/ZdK00uSauycHZXws2OXPSCIg0XcjZSejyQiy6hfnwkb8pVXK6YWDWhAZLfe?=
 =?us-ascii?Q?JHSk26MvCdTEhVf7NllX0vGKThJ2XrHADrglP7is9aGIqROORsSJCLKaeVN5?=
 =?us-ascii?Q?bzK9Ep850wOKiahpfnTYUVFMvCv+tvQ4atFxDNcDBCp79jXrNBkl8wk8ElVj?=
 =?us-ascii?Q?So/EOl3eCs+OCg1+WmiWHzaQHj8hBQmM2jgbD4QfIyOLx3VAXOBTi+vLPf4Q?=
 =?us-ascii?Q?IWHlSJnPWysg/JS23AP2JuGC9AORJ1mvcHUxxReO0yrESTj0dIfnvV1X0hx8?=
 =?us-ascii?Q?3agfwj+yhkFZaACNFCTw6Cji5l11XgnY7Rk3C59Cx4hc6d1+pX5/ve5wmXzA?=
 =?us-ascii?Q?wWdKh3vVN8dkhHVxlbpvIna5BEwIz/tWIwsv+iqZvl/7L8b1+BlMiWVyZ2nF?=
 =?us-ascii?Q?u0lvE6EA5bUwseaABiJwjWmkviEsQB0aWhH4Y92M?=
X-OriginatorOrg: variscite.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 415f09ca-c7b5-4b2a-2f03-08de37ff9d4b
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB10341.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 15:20:12.9619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 399ae6ac-38f4-4ef0-94a8-440b0ad581de
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KDQRdhFc5LI0JAYOWVps4OpzZYptiPPfzyX6h7TUNVbsK0vw+aRBNHWqD778xrzEWSkCY7LjbtUhj9Gpmnbm9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8347

The VAR-SOM-MX8MP integrates an ADS7846 resistive touchscreen controller.
The controller is physically located on the SOM, and its signals are
routed to the SOM pins, allowing carrier boards to make use of it.

This patch adds the ADS7846 node and the appropriate SPI controller.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 169fc6a9c8cb..ebe615a84150 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -101,6 +101,37 @@ &A53_3 {
 	cpu-supply = <&buck2>;
 };
 
+&ecspi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi1>;
+	cs-gpios = <&gpio5 17 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	/* Resistive touch controller */
+	ads7846: touchscreen@0 {
+		compatible = "ti,ads7846";
+		reg = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_restouch>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
+		spi-max-frequency = <1500000>;
+		pendown-gpio = <&gpio1 12 GPIO_ACTIVE_LOW>;
+		ti,x-min = /bits/ 16 <125>;
+		ti,x-max = /bits/ 16 <4008>;
+		ti,y-min = /bits/ 16 <282>;
+		ti,y-max = /bits/ 16 <3864>;
+		ti,x-plate-ohms = /bits/ 16 <180>;
+		ti,pressure-max = /bits/ 16 <255>;
+		ti,debounce-max = /bits/ 16 <10>;
+		ti,debounce-tol = /bits/ 16 <3>;
+		ti,debounce-rep = /bits/ 16 <1>;
+		ti,settle-delay-usec = /bits/ 16 <150>;
+		ti,keep-vref-on;
+		wakeup-source;
+	};
+};
+
 &eqos {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_eqos>;
@@ -348,6 +379,15 @@ MX8MP_IOMUXC_SD1_RESET_B__GPIO2_IO10                            0xc0
 		>;
 	};
 
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C1_SCL__ECSPI1_SCLK                              0x12
+			MX8MP_IOMUXC_I2C1_SDA__ECSPI1_MOSI                              0x12
+			MX8MP_IOMUXC_I2C2_SCL__ECSPI1_MISO                              0x12
+			MX8MP_IOMUXC_I2C2_SDA__GPIO5_IO17                               0x12
+		>;
+	};
+
 	pinctrl_eqos: eqosgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x2
@@ -382,6 +422,12 @@ MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
 		>;
 	};
 
+	pinctrl_restouch: restouchgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12                             0xc0
+		>;
+	};
+
 	pinctrl_sai3: sai3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SAI3_TXFS__AUDIOMIX_SAI3_TX_SYNC                   0xd6
-- 
2.47.3

