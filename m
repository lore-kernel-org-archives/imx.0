Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023088.outbound.protection.outlook.com [40.107.162.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0175F324B0C
	for <imx@lists.linux.dev>; Wed, 10 Dec 2025 15:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765380017; cv=fail; b=shdwZ6169VyjglY0HkYToiBdfMZlm4IIoIhqYkmMhVNkNOxrONeLC6iia/k7u5j7eHu9XKtypjOHC+Jg7nuyN0pIkuJSASeKzt6C9vbWid/ou1Rjq2LQO+QavRibJ888VyqqC3p/kwcT6G6fAswKVWULOc5HgXnDs6KAuh9MmIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765380017; c=relaxed/simple;
	bh=pNQvghduFHMd6glLQt8SA9sLLhXVC3PCDcALb+7LlCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aylSMoBKer75xfC033YmK7qJ3mMQzzrhfv27sCvNEH3PUPco0sa28BxbU+/V/iM4Q5/yqy+mIHhyYJmOGMNR210vkQ+9PigNbZsFW9l5CTMLo0L0AwTN9/qSiYW4XpyqrzSED9QVC0BXag+pChVMSTWmBICAn3Y+kPXLwzpc8TM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=variscite.com; spf=pass smtp.mailfrom=variscite.com; dkim=pass (2048-bit key) header.d=variscite.com header.i=@variscite.com header.b=iq87W2t/; arc=fail smtp.client-ip=40.107.162.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=variscite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=variscite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=variscite.com header.i=@variscite.com header.b="iq87W2t/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lchltsjCwJqWNAz0Rfnz2Y4ICo0ut0w5v9niUvKwB7AjtYB/4hOPQFM+r2DCuVZRxp42wmapxk+lEiI671XeFmTj+IKesabpRnte+XM+tP7uqD8HBHO6wkV2yS7Rh9BplTONPXvmhsHKleCOvfOoXVAZ2hdzw3TgJ2xJ9kL2r588/CE3axdFUyndjoxDVeI1nGHVHJ+g+I00zhzHltcE3upDwC1K10w236nv45BF0wksHiB3OPv+TBKUXsubEihfV8OGNuT397v8IPLtND52j0NWn9kJ/yUORWxaIv9gZlLgd6XT9j0r8QVTJmf41EDzGx6fc4OASuWmu5D4FW3IfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2R2NrHEhPqzaerJtqVvgNompr9dbXzGQpw5wDr9YxJ8=;
 b=INpX+SY7KWMqyKGg0QeLIzMI4UMCCiVteUOioM9RJOknujq1mE/Cc6mPSA2A8UIP4bzBTg1KpRzzObHmajF+x1YXRe+21QjJhFlPkfNSOjW5p2616nlIm9rot73dblpu+YWP0qjckkVobdeq7JEUv9sV6Sw12zT3rGSdE8PnSM0I8szaOOq5H8CXchcnqklC8KsVyGlc4nFfR20Ahxb+akaiJ2kKGSTw+guOi12j3fqudk09H34y9pGptea0R1M6xzV65b++PDvYISoH269gLTTUYJFFDDQTK8skHFbIMKlK8Q4bmND6VMRh9SJjvATvlklU2ylPO6YtP1UTTRRN8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=variscite.com; dmarc=pass action=none
 header.from=variscite.com; dkim=pass header.d=variscite.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=variscite.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2R2NrHEhPqzaerJtqVvgNompr9dbXzGQpw5wDr9YxJ8=;
 b=iq87W2t/o63P+EnAjx35+YnnKQLMcvI1zuXjbYlxa6Ov3ngXGzO1TtBorfxvvBPI97+zQMmaP9inbz3BM2/jX6vovSknOyjEAph5X/QPUpaJ0oKLSfl4uE3f2MH3jHeMo8snNwMWtcv6XnXFr3Ioh7l0Mj5/QxYbMsrxaQTRbnM1oo+mvsk6vkpOpLcCfkJOikYnlubcYIeiOGK4vrHg7CWptf/LT5shRzAcyWhS+XyWfwFTY0vMOXhXw5gN2Yncf/EkXVv6UUongYWmeyoeJRj4VbZSIRoMEe44e/Gjimb/PrhQ18AnKg1WLEP3QV3Uoydl23O/euMOUw+230L49A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=variscite.com;
Received: from DB4PR08MB10341.eurprd08.prod.outlook.com (2603:10a6:10:3ff::18)
 by DU0PR08MB8347.eurprd08.prod.outlook.com (2603:10a6:10:409::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 15:20:06 +0000
Received: from DB4PR08MB10341.eurprd08.prod.outlook.com
 ([fe80::24bb:a230:6690:f824]) by DB4PR08MB10341.eurprd08.prod.outlook.com
 ([fe80::24bb:a230:6690:f824%6]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 15:20:06 +0000
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
Subject: [PATCH v1 2/6] arm64: dts: imx8mp-var-som: Remove PCA9534 GPIO expander
Date: Wed, 10 Dec 2025 16:19:54 +0100
Message-ID: <20251210152000.42265-3-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251210152000.42265-1-stefano.r@variscite.com>
References: <20251210152000.42265-1-stefano.r@variscite.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0054.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::23) To DB4PR08MB10341.eurprd08.prod.outlook.com
 (2603:10a6:10:3ff::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB4PR08MB10341:EE_|DU0PR08MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: e2a589e8-050e-4bff-15d6-08de37ff9988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7J8gwmbwxc3uO7IbQKVFqWIU01aKHEDoBW95qSOD6N0pXlhHSppX2OOtcDU5?=
 =?us-ascii?Q?dPN+ioy1o9rsZED1IgdbZ9hJ2c1Mru+AcEbprqlV+XcbXUFxhxp5NSxXQEKY?=
 =?us-ascii?Q?qEFEj9UImrLIEYN6umYV8TagmZDhAQ31DXugqiiZ5rP4ABcNHEOf5/2jTsDh?=
 =?us-ascii?Q?hsOgrlVSISSjqWEkTiUSY0lp88pNSB5BnYBEbATf5f/RWxFU4NqydPNoz8k8?=
 =?us-ascii?Q?/FN5H+LIN75v4CnrheBW7aEZiGm4Yyc10JKN2QO5+yNUyUqbha2MSaWRQ8ju?=
 =?us-ascii?Q?zLSwuMne0Gz9TOLtkYD2k2vx1IGLf2TIAPUucVzrg1pWEBfDFQwLYDCy9ztw?=
 =?us-ascii?Q?RUbj+Wb3Ug1jx/ddD883UAk2z0cMINug+A93vggqjeVsvMoHeU7Iv/KrgkVn?=
 =?us-ascii?Q?XIy/cnbNuAlx61+V3E4RPS7gEUgO0+vJr0VZ3P7PmArST7BB4xtcoZXfzzeR?=
 =?us-ascii?Q?2okOqXJk0XMijrvhJ7geC+o6hoowsQPqHMWNy7dNJIO25zBs+IkyPka8EVod?=
 =?us-ascii?Q?d0gBOIMQWxtenX0QR7XM2kw3oYvSxYaIEdMRNDnBO5GxFYnWfo+opIOf4Zn7?=
 =?us-ascii?Q?PF/2fBXXIddMoHcDW8lmNltMiGvhpkYZ3PWXJncxLHVaDl9uKzPY2QzPX5nZ?=
 =?us-ascii?Q?Lo8qyeIiDsE5Qi8XVSjmiitteF4As9WP7SfNzzAJcYDF8aj3nOW4gqWGbVwy?=
 =?us-ascii?Q?pSMkpqGhdLB6zz8O0Tkl7JrOWAWO7Olk5dYwfZ/he+3KnLY44qP3GV5cACKS?=
 =?us-ascii?Q?2rhuDoo3GjHFPG184Fiej6DGgw1s+4D9JJmlnxKxt6vmXUys4QCjOxpz8nFA?=
 =?us-ascii?Q?tmpRVcxmyaO15A7EZ4GA6v9BJfZP2sRZU6iCn43CDanb3zclBmslvEv94pey?=
 =?us-ascii?Q?4iwIaDqRY2jd0anMNMecmeFgjoFkY3CxSIHEFe/SEkCM0xNW1mmcdXR3LgN7?=
 =?us-ascii?Q?kzSjYFcSciafG5Fn/g15u6t1sQqRvLPiTEJF0OgtN0EL9kT1S6FMMrgtGlCR?=
 =?us-ascii?Q?HSlDBRQzGVQiVU8QF6u+cDS2hOZVSyrVfvNAgZaqAXkNVGbyDESLKfoMO6ls?=
 =?us-ascii?Q?kVwpkLMuQLqGn2LdPFuhB5gHnXNrYlqZefmIgliW4nEbUhYcimU7JenKnu9w?=
 =?us-ascii?Q?z4FMhdZXWe45s1oNE0iLQG3gJBcuc3pQvLdsNP5S0JlK83pPOc34NWhB9GUM?=
 =?us-ascii?Q?ZcKyBhIed5TH2QP+/Bjz6MUyFROv7/auRtcDsYI7MJ2wN7MKLiWW96A1ivR4?=
 =?us-ascii?Q?+aKZ48gV61LoNgGN9K99SmBVtovvCPXY/HlANUtezzYgKXQ/HmMt+YeuxWDY?=
 =?us-ascii?Q?eLflGYeHiVQgPyo9dx3wYvGNZjbHB/4gwsKEG60+3CXH1UrVO5N7e0O+TB6a?=
 =?us-ascii?Q?x2HNDwZJCXaMd2ITq3IRu/ofZ/2tT9tVx9gHfqZf3xiXdiF5qKSh39ElNjrx?=
 =?us-ascii?Q?+On0CjdpU+jhAFOCs4pVAm69UoRyBqNe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR08MB10341.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?awtbbznGzRF7SYZmdI6zTECSG6TZG9SEpvU4CqT5Fu1+zHtepzHc7fhC+FEb?=
 =?us-ascii?Q?IsSiA3rQpTUdYe6In9kwbmhf9h3I9tUHsh0a4VUGOZN+vfrprxN0BFtX711S?=
 =?us-ascii?Q?4as5XkOiZ484f4nSs8mdTqAH1sAkDID/iBWreX4YiN0QqU085VdUeAAZTeO4?=
 =?us-ascii?Q?Kz8C6RQISQEgLbU7rhxW+FsGpamT8mQKq4pEeQXr0mAVWfdhLn/vqnvwoZn3?=
 =?us-ascii?Q?06YAgcEkJ8/TFN/l4TRqTG4s1Ek8S8Ya3RuHGX1PTyEueGISOdKsw7tFETI7?=
 =?us-ascii?Q?Pne2v7pmewfEv0x2amcyUKX3vGLVSLOwzx9N4apzIDngo7GBvIEeANaKVsMH?=
 =?us-ascii?Q?j5/9lLi0lYLbEhvG+jsjq97Wy82t5EiSc/vRUurPJb75GHMCLxvmHqYo84E+?=
 =?us-ascii?Q?dAO1L22jOGNc+fl063fFx98sUQ7kuP+DdlgOllETi9B559+sQRwLw8uafU/b?=
 =?us-ascii?Q?QZwO7x+eUeeJVVohipA9sX0MlUXaIUUfKScSeG9qLWU0dIb2y9JwbOIak92k?=
 =?us-ascii?Q?fH7cp5CXdJkSUHbRrD+K0/MCc7+PqnTUkLlmTZa5/8fb6t0JyxqyRetWU2cQ?=
 =?us-ascii?Q?lGMk0Tunn9Ec22XqI9n5zKU0eLutKBGpsgUMzIXhJFiGZsJT2GjTzSFFOnKm?=
 =?us-ascii?Q?EdkD01/EcbTqgj0j7UBjubIyO4gJ/In/wZsnUWPoLdLYNgwZEz0YtyBAvMYV?=
 =?us-ascii?Q?lAcnM/8pWmXdfU8ha7UI0lZJUDxGJdnoH1wuAEboK+26WpWVz7uUeSQQTLxF?=
 =?us-ascii?Q?48p/XXBKDNPAgdQ9Q8pE5t+f56U8JuXDbbjODHV3Vu69Y3V9+8rxL7+NGbqy?=
 =?us-ascii?Q?PlQ5olerCg9yg3deAmmtFVj16NEjincTaLDsUNQ5vz8IJVoNAZg+vGQZIuED?=
 =?us-ascii?Q?Yc+XGXLhHw+FQtteuZSqImVQOrECtl6VR/xOdSBFOh4m5AifB/XI72G3Dmy0?=
 =?us-ascii?Q?NSUA8u3gx7Tq6jcKbtJECXUZW6KKVUn5BJzO92y2K0Y4bHvbumF+1t2OkJkm?=
 =?us-ascii?Q?h871Da8Xx00EQajb1rywPrC3PwW6fxotW0bHrKhaZeP9VnrR5uh4wAyCVdjt?=
 =?us-ascii?Q?sPUv0lDmV0mhY01VbqmW/jDu/F3NbqijbH5y8wNZyLBSSwLGG0bzAzBmxQiC?=
 =?us-ascii?Q?3iNdCj26XaYY9kz9KBNioPh7Hy1KllXP/mSEU3kSMvDto3XRveM08d2RxcNs?=
 =?us-ascii?Q?gEMIVaKVMxq+V24ugHFddx5gjFnoumaSNiUUvdknH9ZSznGQl4KjOdoqWApg?=
 =?us-ascii?Q?6L6aoovK6bmVnLalX65gSvm16km9Nqybjap9z8BEqBMien0B8nxjIbFs0nd2?=
 =?us-ascii?Q?idtlxZ1C/ZDLZny4HV2eDyjR/6Q7FlBVBiMlQREkwuNCY4Wkl1HnOhGGQ7DO?=
 =?us-ascii?Q?NmNP5yT3nlzezGgHbwyEwXbKcATzz2a9ONUbCEZxr/5ZBWwe4eiv2eINr9si?=
 =?us-ascii?Q?n1Dz2H4u15OhOSKqKREYgoIFZZcBAoWO6/KrSBXjgV35e+q3qZYGmtUfOK9X?=
 =?us-ascii?Q?Sa8qVv0QKGUsFh3y3WdYSqtczjE54XVeYp+ZqRviHU0GZntQ4Wdmt/CC/1rZ?=
 =?us-ascii?Q?ENOFyFxjgnnDj29o7shnyl22X8fjWshcYLKjMDLf?=
X-OriginatorOrg: variscite.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a589e8-050e-4bff-15d6-08de37ff9988
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB10341.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 15:20:06.6158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 399ae6ac-38f4-4ef0-94a8-440b0ad581de
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EehPNCxEplirAsqI2XY05uQyqeHWUh7eCG+cCrGe0y5HzA7cw01RIZtmI4f7hU60aLup0QQk6qeFRfUeurL/ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8347

The VAR-SOM-MX8MP module does not include the PCA9534 GPIO expander nor
the LED connected to it. These components are present only on the
Symphony carrier board and may vary depending on the final carrier
design.

Since the PCA9534 is not part of the SOM hardware, its node and related
LED definition do not belong in the SOM dtsi and are removed.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 50 -------------------
 1 file changed, 50 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 949d9878f395..158a78ec9656 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -19,16 +19,6 @@ chosen {
 		stdout-path = &uart2;
 	};
 
-	gpio-leds {
-	        compatible = "gpio-leds";
-
-	        led-0 {
-	                function = LED_FUNCTION_POWER;
-	                gpios = <&pca9534 0 GPIO_ACTIVE_HIGH>;
-	                linux,default-trigger = "heartbeat";
-	        };
-	};
-
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0 0xc0000000>,
@@ -216,33 +206,6 @@ ldo5: LDO5 {
 	};
 };
 
-&i2c3 {
-        clock-frequency = <400000>;
-        pinctrl-names = "default";
-        pinctrl-0 = <&pinctrl_i2c3>;
-        status = "okay";
-
-	/* GPIO expander */
-	pca9534: gpio@20 {
-	        compatible = "nxp,pca9534";
-	        reg = <0x20>;
-	        pinctrl-names = "default";
-	        pinctrl-0 = <&pinctrl_pca9534>;
-	        gpio-controller;
-	        #gpio-cells = <2>;
-	        interrupt-parent = <&gpio1>;
-	        interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
-	        wakeup-source;
-
-	        usb3-sata-sel-hog {
-	                gpio-hog;
-	                gpios = <4 0>;
-	                output-low;
-	                line-name = "usb3_sata_sel";
-	        };
-	};
-};
-
 /* Console */
 &uart2 {
         pinctrl-names = "default";
@@ -298,19 +261,6 @@ MX8MP_IOMUXC_SD1_DATA5__I2C1_SDA				0x400001c2
 		>;
 	};
 
-	pinctrl_i2c3: i2c3grp {
-	        fsl,pins = <
-	                MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL                                 0x400001c2
-	                MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA                                 0x400001c2
-	        >;
-	};
-
-	pinctrl_pca9534: pca9534grp {
-	        fsl,pins = <
-	                MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                             0xc0
-	        >;
-	};
-
 	pinctrl_pmic: pmicgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
-- 
2.47.3

