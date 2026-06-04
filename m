Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013024.outbound.protection.outlook.com [40.107.159.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A41F356746
	for <imx@lists.linux.dev>; Thu,  4 Jun 2026 02:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780539689; cv=fail; b=jeDBeOHKPbcE4jTkZpu/PeRZtwfHKQYr15hPveGKulVznkT2Y86XPZiw5SACw/vPFK4U4cpHl9YqomPCf1MpL/MUQ9Zhyl9zd7iNFsD55YAquCC//zenY4ArCPIsehGInOSIYc6i6mnLDHJDCj3yirsFeJ08MhXEutoojONDdPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780539689; c=relaxed/simple;
	bh=t+6EBsoDMP/wcy/ZNYTw3R5FKyAudmQ2JajFvCuAijY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=eYENUmMfCtFpuq4trQpXwNaG+/5meWDgxnP4hzHfmauz5T6A3qiM1r7OzpUpqil6UmLIiGdgQPlRxYIv5/+PfC3YcrPAbYWG5EtjT5BQZJG+0d9LfeGayG+JM0WyfidUj0337qjs8Nq186qGaUXUyxt5Sbqc06oGZsUJrR1my7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gvxbt7BU; arc=fail smtp.client-ip=40.107.159.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gvxbt7BU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v2qF6geRm1ouCaI+uwa+/yt5PnYQ3dZ0fShhfIkEZm/ANBGzzQFTYZHbydHumTz73KXOFZXS6Nmqbq2P3jPszcf6slmLDgxadNDtRHKBQx0kmNent7ODG/3aAI7IM5q7ITnn5O/kJNKO2RcfJMpNbaP36gXvOMwElSkgXyH2traZZsh109su9MuJwh/mnwS2oLzySkWybv1H25bH8B1tX+qJBjUntuLev+2yhjJShG7noYWgKWeNzH6yfd8MefuHfyWVHzBVMT6gvjGb39U9QywqlE3tvrP/cIXeEo5VElpmTdblss8y/WpdM01rhwB0aa9BsIYxq7KHa8bgKrcxcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxC9BP8N/AZEZlUW04dB553torofxtHAOcB6RV6LRI4=;
 b=LtXrDN9qEjkX4vYHxx7v/OG8/vWYn/IjlwSVQhA79kE7h9Pqw0SyznyhbTPN4dNFmQ5dsPvx+VzUKR6VqC6QwO6XF87eEJzmsgv+NFBZ+KopT9BQ/nwYXXzeu03NUyPvVo3k1vhDCoj9Hkb/FH+t5A6/pjqGl8nPrY94LfxXtcrkO1dffGDP3BD1nNFj9BivIsEIXZjllN0Ru46oMIRVy6y0VAxcNKh7y2a8zzQNh8bGyXzypoM8D3KGeIHaYHoEda2ZZ2Ru8P7o7M7fmRi0x6qoO70SYwxqzOqWMZ+la8B307mKVJr7VvXPQ0lokbAO7MpDbqZOBNNkdcnDoRjUEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxC9BP8N/AZEZlUW04dB553torofxtHAOcB6RV6LRI4=;
 b=gvxbt7BU/Y0WwLw75Iv7klJyZmmm5RmDK27Rfd0d+MY1lH6oLlOU/jJAd1q0q1a2uj9zA1DyNwLofSKF2733T/1v5zka3Wf+sSpIgyNBZxXyMonOneZEVBl7zfVACM+zeyud+OhVMafvkwhh59x4NYeb16CePj1TUoG13cRvfUNMz4RG8UUtLAzjIy7KCeRRIvsDnb3uUGDJySqQ872t6eGptQwyt89/i4HoDxcE4FyI0KqCo/avWXaB2pPBCDNBB4XxgBDJ1Oj6Cr/U0w6H0IVyHWb1Sap2kcL2Zyw6J9w9IMKxFyPZWczVz/Xu2NwdrLFU+Vzl1detzp84xAnKQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
 by PA1PR04MB10119.eurprd04.prod.outlook.com (2603:10a6:102:45d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 02:21:22 +0000
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d]) by PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d%6]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 02:21:21 +0000
From: hongxing.zhu@oss.nxp.com
To: sherry.sun@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@oss.nxp.com>,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v1] arm64: dts: imx94: Add Root Port node and PERST property
Date: Thu,  4 Jun 2026 10:24:20 +0800
Message-Id: <20260604022420.120294-1-hongxing.zhu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0036.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::22) To PAXPR04MB8096.eurprd04.prod.outlook.com
 (2603:10a6:102:1c7::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8096:EE_|PA1PR04MB10119:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e12092f-f36f-4e20-d858-08dec1dff80f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|376014|1800799024|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	fYqme2Eqg6gMXoweDwFjK6BlfqbpJtd8n0RykKhoGUs/Ak4+Re3PzVVcrQI6ZjeRq25oLtU2SGM87g6VdvP7OcUlEEJcMmkKqGkxsAL30LpKOWXbWHO6IxsJJxlP6pSYNEyMMHozvrHxG6x6ru2iq/xT4VskW8jIE3BfuAmXAXnOE0cJiEQnaf+qrO8YbyFoahECjjrIP3vBoCfNThnInJunizejsAxO57AFAefkUMhU2peO8vq3JEGQzij8+kcS/0zoW+m9c9GANm+HhK5tJxgwFHRV/nbr7iBBQuf67vOl1lccI5kL5f1vJx4BWg+oYxsvcjLAkBh5iTLT8jIv5LtH7MiWUBf036oVa7gziKcS1XLp0UY0DownmOoABGeuDGkIbT3uWZROOkIVdi4/MBEATd9jWuMXkgBltIgnAauU03FYpoBl0JMaU7TxrWHw3VjT5/aGh8lTKKwMqy4Sup5iRq0Xq04O7fQxJNf2Q0GmMCtjBHTwTAI+Cs2AUJ9lnvvv7M/uZHP0Z0DjF5A1tOBWXH/bImXeMZwk3xFerLWBgb3Pj1sDpYgeHwZJ279L/SbmdgOsd1aLcaIGieN+s7X9OhRmZtpktQxb9AD38hMvMNQaTWqQEKPVn1G/rYnbyFarY0LyWmafjlnMABU32nbQiC1b988ZqLbPfoAT1mVOHxwc0WOf/qajYAIOEHKG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8096.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?goEEt0ovHDY/EtGUTwNZ/6wo8xsCnTlv8aadVZ1WGLDB02jyu2i1EDFcLC/Z?=
 =?us-ascii?Q?pMR0o6UiHdUCtTnDsNNNpxGFu2FKdCu6TIIZOzXj3Ee0BWqrCENxhV6TNTOf?=
 =?us-ascii?Q?cAsdQByiiQ1hC39Aba7jkP5khw41wF70IJM7r34F6oGUJtwZWD9wrrNhqDUv?=
 =?us-ascii?Q?p/IJPpuVflluEcdgs918DZMVQluXgzqTixkpoos85mR5zKDtn1ccOE+0yff7?=
 =?us-ascii?Q?QyDCyZxLdbsN5dJZbP5Wef+ygq4e3KfodsHi0wso1Gx9HL8nOd2XWmPzlOYr?=
 =?us-ascii?Q?DXN/rXn/aYGb8BtTih6QCeTmu1zmhXp7lKpOftbp4w8JBuoivb3cqh+kQkqg?=
 =?us-ascii?Q?eJOQcyrzOzHDKK4uRoQ4ymNPNXxdvxRAOvp9uBNV3kiZIMDbJSlg67CoPODK?=
 =?us-ascii?Q?yjzif3GAnVM+PqokMWlDA4dVbpKuVvGqRatEsW0THdguRF36uhvSRMDzAfDc?=
 =?us-ascii?Q?hK+vio1ixymTMZSWdf0nqrloDzWaEsncxdw0XRIKlc6NpmTjSm8TPF3S9IrF?=
 =?us-ascii?Q?H43sJEquxC0qbsHq2WZQG42qsjdIRVj92a6GxRpOoYYnbdoUiWr4rcyMKszm?=
 =?us-ascii?Q?3wt6fi/Ey/AHEYXes69iCMmd79j5I2FiM4SXwz30zQteQhZUXUajPUN9/o3X?=
 =?us-ascii?Q?uc3vQsnPr0dRrXqA5FeaQn2L9ZTDR3kVnpLrcKo6rvgHsM4uvDYOlptYNsUu?=
 =?us-ascii?Q?IX+//hI4bUOIz/bvVptvkWbJK9cAgjXeqsGjJDs9I42M4zYEGzIAlWUxJQeC?=
 =?us-ascii?Q?uKDz+jX9DEqAYO/ZLyyBbI9g2Nt+mu1mp98FkwvlAMnbbnmTX96d2kzbL3Ii?=
 =?us-ascii?Q?7P6jvqpH4i9IdHoxWQV+szblczXkGYj6O8tHP3JbL6fxiBAEW+C7xAnO4cV2?=
 =?us-ascii?Q?PunupwDKjJTLw7vGVF32Ufpqs9s8tji/piVLdDvDpMDpkxtAFkub05NTd4n5?=
 =?us-ascii?Q?oQDjecpEVGmR6VtHskU+urTUsk/2lqdMqU/Hw1EvM4J7MKeSUjR1hzErNRFd?=
 =?us-ascii?Q?K3CHOGonewTk6FPKYPO/2y5EVDWf1xhg7gmL+ms4FuwJFuKdzhC/9FBYe74U?=
 =?us-ascii?Q?VsqWQ9sJPxwfEfUD71uUj3XcbmJAKkJcL6nwpDtZk8qHHn8+wOxKwnMOMKei?=
 =?us-ascii?Q?0cIEpFAmeAMlyMGucObgywKWr2oBPSm6e/gIYaNmix93nmSfxnWImhYGn6Ye?=
 =?us-ascii?Q?lZiYh3t6SwlXHzltkrzAB6AvXHHqR7AFQowVifaK9E0Dbvq1lUEKCmb5prZL?=
 =?us-ascii?Q?rtFJ4KiIFBdsdIrS1vJTD6wPigpFiQy5TJrzxdnFXPA5gCVPItBEl9/HpeEg?=
 =?us-ascii?Q?A+2N04Pb+6QueyWfdSnkTrmaWh2TcuGf/I4X736e16E3TY284YsBkFIUgS9w?=
 =?us-ascii?Q?m0nGzt/MmKlxpl7utBJN4sgiJRC8rqyV36UzXRnULsczqRWBpxW0hefv2CLH?=
 =?us-ascii?Q?FgKack9kAWwZRzK1Zy3n78Ay7EjJXkh7S4hcR+cppro6r3lu61tBt7Ebf16k?=
 =?us-ascii?Q?DK11q+FRNMU9j8qcEBdCRaknoKRl/aSSrmuhAyi0x1jmGVInwWY88cTBEIYb?=
 =?us-ascii?Q?XAlaf0cZwUjhDEWMaYb3KlU+fNZfGe1wK73TVQFxa/SdJ7YkIw1Iyvpka8aU?=
 =?us-ascii?Q?cjo6xFfV029MDIXGDDSIeKZ62W4i7e1e/+gsgDkECpIW/WfyCoWRqh75R9AS?=
 =?us-ascii?Q?tkM/gOCxju/0+shlTsNsMNLWZqKVV0PQ2YVpNwcXv9WKqt4rb2iQb55Ko2m+?=
 =?us-ascii?Q?D051XoKJB2xz2ls2RWU3KF5K7JDMf2HJcxUoaQU9We+NtkOkuJqq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e12092f-f36f-4e20-d858-08dec1dff80f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8096.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 02:21:21.9111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZuXmggQds1Jg9jO2Brx5ZI4U0DOp444OC4Che/xW09fgq3EZZ+J6dEKT8zV6142YqXSQVVkY/3enHyiEFJwpSgDNIyI/6ilIvJ5qEe+4BaVwAMhD8l+hDjILTWYigYG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10119

From: Richard Zhu <hongxing.zhu@oss.nxp.com>

Since describing the PCIe PERST# property under Host Bridge node is now
deprecated, it is recommended to add it to the Root Port node, so
creating the Root Port node and add the reset-gpios property in Root
Port.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi     | 11 +++++++++++
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 10 ++++++++++
 arch/arm64/boot/dts/freescale/imx943.dtsi    | 11 +++++++++++
 3 files changed, 32 insertions(+)
---
Since the patch-set [1] issued by Sherry had been landed. Add according
changes on i.MX943 board too.
[1] https://lkml.org/lkml/2026/6/1/1461

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index 1f9035e6cf159..dfbb73603cb24 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -1411,6 +1411,17 @@ pcie0: pcie@4c300000 {
 			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
 			fsl,max-link-speed = <3>;
 			status = "disabled";
+
+			pcie0_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie0_ep: pcie-ep@4c300000 {
diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index 7cfd424689507..ed3abd3e76e56 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -1034,12 +1034,17 @@ &pcie0 {
 		 <&pcie_ref_clk>;
 	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
 		      "ref", "extref";
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&pcal6416_i2c3_u46 3 GPIO_ACTIVE_LOW>;
 	vpcie3v3aux-supply = <&reg_m2_wlan>;
 	supports-clkreq;
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpio = <&pcal6416_i2c3_u46 3 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_ep {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	pinctrl-names = "default";
@@ -1058,12 +1063,17 @@ &pcie1 {
 		 <&pcie_ref_clk>;
 	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
 		      "ref", "extref";
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&pcal6416_i2c3_u46 1 GPIO_ACTIVE_LOW>;
 	vpcie3v3aux-supply = <&reg_slot_pwr>;
 	supports-clkreq;
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpio = <&pcal6416_i2c3_u46 1 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_ep {
 	pinctrl-0 = <&pinctrl_pcie1>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
index cf5b3dbb47ff7..01152fd0efa5e 100644
--- a/arch/arm64/boot/dts/freescale/imx943.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
@@ -255,6 +255,17 @@ pcie1: pcie@4c380000 {
 			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
 			fsl,max-link-speed = <3>;
 			status = "disabled";
+
+			pcie1_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie1_ep: pcie-ep@4c380000 {
-- 
2.34.1

