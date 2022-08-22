Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80053.outbound.protection.outlook.com [40.107.8.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1F44A02
	for <imx@lists.linux.dev>; Mon, 22 Aug 2022 17:53:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqfZvzHPfdyrqjnG34kFlWRQlKP0x/bFf8HRb0KiVo/wK1txmFewz0IgtYBAsR2At0LOn2RbNq3AqlCd9MXDG1zK3Ekl7I2s60/F/5RB9YdOXDMjYJtSQXNqllkL8L0bdDNY1AgtZON8lTVufXw7uu8SaMOWIepgglDnhZomGYlP1STwTHoTAyB0feLmFoyl3wakgNUFe/yNZ5xLACVzn12Ck0pUhTlulF4F+Nh5+13t7jOSewu1clFd9U8mUC3qMhW7PZJJgbAqub8qJuqctl4bYJmp+m+pvNM2c3q+2ybAx9xDkklT6hWKYz0OzJ963ArMKC1C+F44s+mUR/FLSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRycCj1yGMhzxUcgg8CHvHKd/8mRPCJs62J5+2KVxGU=;
 b=cdhA+bvUdVNjgoi7vT+CsGbWBwWz5IhwdtWBVU8Ar2UBTcq3xwx+oj7zVtZIy5VZrHIlTjOMHsp25yEs+UpBp5Ns13oLnyrnZhoTNmItprnG8xZ2A9xnklsaZOdRZBpKlTS82Q1vbZQJlaNBT75US0O1LtrzxVrUdhP+hWU2XuF6MBT5z78j/OUJidwSaKRCMKGzLY5hKotvqRy/ma+aQVupRuzrDKl2j5lgBMVjYONVfjo+FMGO9W9fjsFlsyuo9eSIsns0hYXUd3frw/HzYBjnb8Sg4b3qgFur4lnVdohrA8I7wyhVOFc7B4KsbnfNF/CepBRx2GyeNgAqWN/gOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRycCj1yGMhzxUcgg8CHvHKd/8mRPCJs62J5+2KVxGU=;
 b=XqS2vFpzFKaTuO5yLIztQn43boYbk4E3UtroHDpw25YtEYjx0R1QlDwq+B4Cce4nMF8W+0BMdJLB5RtTk4BKA0tCbJ++tqxzbJ+NFfB4ZE8uLEl8JdsN3H9OOIBt4NjTNel4oTwheYG0vCsJCGt/NtjlI/9E2kJf33gHqUJZ7UI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8274.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::23)
 by VI1PR0402MB3790.eurprd04.prod.outlook.com (2603:10a6:803:24::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 17:53:47 +0000
Received: from AM9PR04MB8274.eurprd04.prod.outlook.com
 ([fe80::747c:397f:a003:dbca]) by AM9PR04MB8274.eurprd04.prod.outlook.com
 ([fe80::747c:397f:a003:dbca%4]) with mapi id 15.20.5546.024; Mon, 22 Aug 2022
 17:53:47 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	NXP Linux Team <linux-imx@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>
Subject: [PATCH v6 5/5] arm64: dts: freescale: add support for i.MX8DXL EVK board
Date: Mon, 22 Aug 2022 12:52:45 -0500
Message-Id: <20220822175245.222691-6-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822175245.222691-1-shenwei.wang@nxp.com>
References: <20220822175245.222691-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0177.namprd03.prod.outlook.com
 (2603:10b6:a03:338::32) To AM9PR04MB8274.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e8::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47a4130a-3545-46ea-e821-08da84674303
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3790:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b4TuWzkQUPScmELXlYK4x9pAX/BFJ9Z6QG+alU/OMjIQFz+vOR88uvOJ+HX/lA+vMh36hWNHo1u4gIiKAfuandMPYNHYKzWZt5mbhyeyhU5pqYmtmtUJreD1N9XGBbd0zWIDV3FgxF2F7l1ln9v6hfeXwwfHGC6tE7fmFb2wd/HRhbd9pLydPfK3CLPHhOKPlVYCe9E8yrCgz75Xo4yPw3QAMmCyxrdvH6xEm8kDj4BVjQR+iwdFNXKKt6n7POtI5Yy6LfUt9O4sEPKrQ9NKctwsBag/ewoPsXutC+PhN2myi+JKv6iBY6MCWi0oAG6Rk4FL4IqHI/c/YEkCtpThwiScLTpxK7oW7KxlcuGqLQAjxrN0S2Jb82zghxokxvLBugQRXYWO89agYKjbeJkaqtlU0GbosawCecZhTAnFtIxvVapFkYNo+haIahKvw1PGsQzqQYEFRkm9gWLsWAAxJtGQw3cYEuvL/CqOozgRtOaBnBgcqU/WJrlpnMSMH6ynatT8u9mAMDRQIrHfhQ/Uv0axJ7C1j1sxpsnzoapMuI4jsuh5WQiVqS+7iASoiGqmHlAo8St5oSA18n1HEsbISsOW9Zc/lN15HEd7p7k2bW/KfeivWiUA6sAti3ZJrp0EBlz1W8X2wD7WjB641TFePx4T4fCRQRWcryePDT+veU4x5FNUd2YI1gvhE3R6gcyVgTBBnNO4t5cjYm8FvjWbm3YzSnYgh0FvLwN2DGmaFirmEk9mdGMvCBFo/isvAKqUHMt3R3SDWdnPwsU6duI1acU8GtPQqa97aNMUi7/2nXR66gKyXdeMrJ384GzguUYV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8274.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(36756003)(54906003)(2616005)(110136005)(186003)(1076003)(38100700002)(86362001)(83380400001)(38350700002)(6636002)(6486002)(316002)(4326008)(8676002)(41300700001)(66556008)(66476007)(66946007)(478600001)(2906002)(52116002)(55236004)(8936002)(26005)(6506007)(30864003)(44832011)(6512007)(5660300002)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wYn2SfgGqcyPrhDDsUuAa+MF0nH43k8iraDI+4wnbRidRMzeilNoeyfLpub7?=
 =?us-ascii?Q?hMrNGCLebLhrALq8yMeev3wftDWanZaM+B08YhvstpgIeqgAIoBpSdbBXKc9?=
 =?us-ascii?Q?Q5IibsKYdUv0M7e8iUR4R8s2rEBVFsjeqNWaanzAGff5OPGiE+Pmm3k3jBmV?=
 =?us-ascii?Q?9x/uCtKAny8eh80pmG/j2kQwb+zaSwzwzyLNLC127WOTo2QwFrCX1fiIvsWo?=
 =?us-ascii?Q?/+amD/bzZP38YI0VneKz4YDyA3C77tr/wRJulp0pXX1XHxifKzwIFbCp7SVr?=
 =?us-ascii?Q?+tc3fK4e+AzI6Hbh4GDk3Eks7ldscoqZGTVsa+NcBH4j9XtgZla0/Wr8LerW?=
 =?us-ascii?Q?gV+oNGORFmVc1nYxRJXiGviwezAUQ/z8aTsX3HMb1vFU35VFMY949htOm6Dg?=
 =?us-ascii?Q?MAs6a7ZJq+o1wztDS3WUkpC78qdRMA0yqNGFqYe3/9UAiIQMZxvJBz3gRmyH?=
 =?us-ascii?Q?x520iYgjEmkCZBPilb45J8egHXkyJG5P/pEk7tLpS7TtfLw3/ubCP1K1NoyA?=
 =?us-ascii?Q?mG3dft4/jhjqAQgiCX5JQDUSreFXdCR26agW+NuWM6PHJT1bJ8dQy+tidQ1b?=
 =?us-ascii?Q?tYFn9wwJhrmXz8WyetkNPYdquCJokFcUZQ2YIgg7qGOwQdS5kEnF+2g0zceb?=
 =?us-ascii?Q?d+K7atFNgtNDw9H1qHUQgDvHLAG7dc4xdHp47STe84j6jZXI/qKfUo23Fp+9?=
 =?us-ascii?Q?vKnj0UwcAaAClRJ80gWsai3Tgac6dsDPztmzkjPYU9ZPtvxHM7KHBzTLvofV?=
 =?us-ascii?Q?UMCrjQQS/7l7zk0UE5hAkD04FWqMyoYwIAEBSE4cvgJbuPEl1Sy6FO6lYAGX?=
 =?us-ascii?Q?59q/5tfz7jTmpWQRX5qabj4tLJrr6BNMupVwGCR7mNCzeyyNOT/ATE6dOiKZ?=
 =?us-ascii?Q?GNxC9uuUcRwTkYrKpsnY/oVkDQmALd/j91I9sXLve+FlvnEYFUE1ogasLoc2?=
 =?us-ascii?Q?vP5cO0kS0A16vHqtqj+VNSc/czFyqY0XxPiIxKTQpi2/wBmvP9u+cpdBfXHd?=
 =?us-ascii?Q?ywCNBJJ7sy989yOyR7oOrhyNw6UG2FUAaRchcb3R4c2hVDBpeX2s66Q4N6tH?=
 =?us-ascii?Q?llNa5oDer2eLbujsDKEtyVqUD5v3Ywq/A8rmvTRx0KTOiJfVe5I5JfqrtKeP?=
 =?us-ascii?Q?hvYs5uPK4pTjdtwa9czlPZRmUaSwW5E/cG6noeAtFCPWdpqoTupYlbdDaSjQ?=
 =?us-ascii?Q?mvOf/OcR8OuEuMgmBRb26cOyTm3kPQVs3RYqox1UM3HRZAavIVauXnPBjDlu?=
 =?us-ascii?Q?juZ7psjNAEMhfzo/kTx3u8GoCaT8F9kZZXirv/U/cS/tHcr1rCqys7p0GvUI?=
 =?us-ascii?Q?MwvDbPm7MtujmWpYUSLnmEX9NwSMQQGhlcLFG9wo9pWW50TFz77YL9jazcEP?=
 =?us-ascii?Q?lF8yQ4SP0YVbczW6vSkPO922QVzU70qya0v7gYlWbkKkj1QG68vgMO824LSH?=
 =?us-ascii?Q?CHdnTazw6VGjotz4SqBEYxDilq22smMvd/cWJZfY55WluOEn6TJIfRSmEFzD?=
 =?us-ascii?Q?CJN2mPKUSJc4zB2jhvIKk3Q6B/R9Q1nDWiM+AobauV028LNQr1wSFvtMYo2S?=
 =?us-ascii?Q?IIcjVIfC3CAMMZPAT5h681gKIDF4liDijZtpyDXi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47a4130a-3545-46ea-e821-08da84674303
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8274.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 17:53:47.1704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hK7eHV45CNFdwRE9Q02qYrm08/NkyYdRbaFx0C9xA/TlGPnqhXeZB8TcbH7tN2TI8h4TmueJfeiEpCdiVJLzog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3790

This is to support the EVK (Evaluation Kit Board) for the i.MX8DXL.
The patch has enabled the serial console, SD/EMMC interface, and
the eqos and fec ethernet network.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts | 427 ++++++++++++++++++
 2 files changed, 428 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 8bf7f7ecebaa..2741205efe84 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -48,6 +48,7 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-qds-85bb.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-qds-899b.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-qds-9999.dtb
 
+dtb-$(CONFIG_ARCH_MXC) += imx8dxl-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-beacon-kit.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-data-modul-edm-sbc.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-ddr4-evk.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
new file mode 100644
index 000000000000..bc343d96f46e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
@@ -0,0 +1,427 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2019~2020, 2022 NXP
+ */
+
+/dts-v1/;
+
+#include "imx8dxl.dtsi"
+
+/ {
+	model = "Freescale i.MX8DXL EVK";
+	compatible = "fsl,imx8dxl-evk", "fsl,imx8dxl";
+
+	aliases {
+		i2c2 = &i2c2;
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		serial0 = &lpuart0;
+	};
+
+	chosen {
+		stdout-path = &lpuart0;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x00000000 0x80000000 0 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/*
+		 * Memory reserved for optee usage. Please do not use.
+		 * This will be automatically added to dtb if OP-TEE is installed.
+		 * optee@96000000 {
+		 *     reg = <0 0x96000000 0 0x2000000>;
+		 *     no-map;
+		 * };
+		 */
+
+		/* global autoconfigured region for contiguous allocations */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0 0x14000000>;
+			alloc-ranges = <0 0x98000000 0 0x14000000>;
+			linux,cma-default;
+		};
+	};
+
+	mux3_en: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "mux3_en";
+		gpio = <&pca6416_2 8 GPIO_ACTIVE_LOW>;
+		regulator-always-on;
+	};
+
+	reg_fec1_sel: regulator-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "fec1_supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pca6416_1 11 GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+		status = "disabled";
+	};
+
+	reg_fec1_io: regulator-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "fec1_io_supply";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&max7322 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+		status = "disabled";
+	};
+
+	reg_usdhc2_vmmc: regulator-3 {
+		compatible = "regulator-fixed";
+		regulator-name = "SD1_SPWR";
+		regulator-min-microvolt = <3000000>;
+		regulator-max-microvolt = <3000000>;
+		gpio = <&lsio_gpio4 30 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		off-on-delay-us = <3480>;
+	};
+};
+
+&eqos {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_eqos>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy0>;
+	nvmem-cells = <&fec_mac1>;
+	nvmem-cell-names = "mac-address";
+	snps,reset-gpios = <&pca6416_1 2 GPIO_ACTIVE_LOW>;
+	snps,reset-delays-us = <10 20 200000>;
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			eee-broken-1000t;
+			qca,disable-smarteee;
+			vddio-supply = <&vddio0>;
+
+			vddio0: vddio-regulator {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+		};
+	};
+};
+
+/*
+ * fec1 shares the some PINs with usdhc2.
+ * by default usdhc2 is enabled in this dts.
+ * Please disable usdhc2 to enable fec1
+ */
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec1>;
+	phy-mode = "rgmii-txid";
+	phy-handle = <&ethphy1>;
+	fsl,magic-packet;
+	rx-internal-delay-ps = <2000>;
+	nvmem-cells = <&fec_mac0>;
+	nvmem-cell-names = "mac-address";
+	phy-reset-gpios = <&pca6416_1 0 GPIO_ACTIVE_LOW>;
+	phy-reset-duration = <10>;
+	phy-reset-post-delay = <150>;
+	status = "disabled";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy1: ethernet-phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <1>;
+			qca,disable-smarteee;
+			vddio-supply = <&vddio1>;
+
+			vddio1: vddio-regulator {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	status = "okay";
+
+	pca6416_1: gpio@20 {
+		compatible = "ti,tca6416";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	pca6416_2: gpio@21 {
+		compatible = "ti,tca6416";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	pca9548_1: i2c-mux@70 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
+
+		i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0>;
+
+			max7322: gpio@68 {
+				compatible = "maxim,max7322";
+				reg = <0x68>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				status = "disabled";
+			};
+		};
+
+		i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x4>;
+		};
+
+		i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x5>;
+		};
+
+		i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x6>;
+		};
+	};
+};
+
+&lpuart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart0>;
+	status = "okay";
+};
+
+&lsio_gpio4 {
+	status = "okay";
+};
+
+&lsio_gpio5 {
+	status = "okay";
+};
+
+&thermal_zones {
+	pmic-thermal0 {
+		polling-delay-passive = <250>;
+		polling-delay = <2000>;
+		thermal-sensors = <&tsens IMX_SC_R_PMIC_0>;
+
+		trips {
+			pmic_alert0: trip0 {
+				temperature = <110000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+
+			pmic_crit0: trip1 {
+				temperature = <125000>;
+				hysteresis = <2000>;
+				type = "critical";
+			};
+		};
+
+		cooling-maps {
+			map0 {
+				trip = <&pmic_alert0>;
+				cooling-device =
+					<&A35_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&A35_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+		};
+	};
+};
+
+&usdhc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	bus-width = <8>;
+	no-sd;
+	no-sdio;
+	non-removable;
+	status = "okay";
+};
+
+&usdhc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	bus-width = <4>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	cd-gpios = <&lsio_gpio5 1 GPIO_ACTIVE_LOW>;
+	wp-gpios = <&lsio_gpio5 0 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog>;
+
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			IMX8DXL_COMP_CTL_GPIO_1V8_3V3_GPIORHB_PAD	0x000514a0
+			IMX8DXL_COMP_CTL_GPIO_1V8_3V3_GPIORHK_PAD	0x000014a0
+			IMX8DXL_SPI3_CS0_ADMA_ACM_MCLK_OUT1		0x0600004c
+			IMX8DXL_SNVS_TAMPER_OUT1_LSIO_GPIO2_IO05_IN	0x0600004c
+		>;
+	};
+
+	pinctrl_usbotg1: usbotg1grp {
+		fsl,pins = <
+			IMX8DXL_USB_SS3_TC0_CONN_USB_OTG1_PWR		0x00000021
+		>;
+	};
+
+	pinctrl_usbotg2: usbotg2grp {
+		fsl,pins = <
+			IMX8DXL_USB_SS3_TC1_CONN_USB_OTG2_PWR		0x00000021
+		>;
+	};
+
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			IMX8DXL_ENET0_MDC_CONN_EQOS_MDC				0x06000020
+			IMX8DXL_ENET0_MDIO_CONN_EQOS_MDIO			0x06000020
+			IMX8DXL_ENET1_RGMII_RXC_CONN_EQOS_RGMII_RXC		0x06000020
+			IMX8DXL_ENET1_RGMII_RXD0_CONN_EQOS_RGMII_RXD0		0x06000020
+			IMX8DXL_ENET1_RGMII_RXD1_CONN_EQOS_RGMII_RXD1		0x06000020
+			IMX8DXL_ENET1_RGMII_RXD2_CONN_EQOS_RGMII_RXD2		0x06000020
+			IMX8DXL_ENET1_RGMII_RXD3_CONN_EQOS_RGMII_RXD3		0x06000020
+			IMX8DXL_ENET1_RGMII_RX_CTL_CONN_EQOS_RGMII_RX_CTL	0x06000020
+			IMX8DXL_ENET1_RGMII_TXC_CONN_EQOS_RGMII_TXC		0x06000020
+			IMX8DXL_ENET1_RGMII_TXD0_CONN_EQOS_RGMII_TXD0		0x06000020
+			IMX8DXL_ENET1_RGMII_TXD1_CONN_EQOS_RGMII_TXD1		0x06000020
+			IMX8DXL_ENET1_RGMII_TXD2_CONN_EQOS_RGMII_TXD2		0x06000020
+			IMX8DXL_ENET1_RGMII_TXD3_CONN_EQOS_RGMII_TXD3		0x06000020
+			IMX8DXL_ENET1_RGMII_TX_CTL_CONN_EQOS_RGMII_TX_CTL	0x06000020
+		>;
+	};
+
+	pinctrl_fec1: fec1grp {
+		fsl,pins = <
+			IMX8DXL_COMP_CTL_GPIO_1V8_3V3_ENET_ENETB0_PAD		0x000014a0
+			IMX8DXL_COMP_CTL_GPIO_1V8_3V3_ENET_ENETB1_PAD		0x000014a0
+			IMX8DXL_ENET0_MDC_CONN_ENET0_MDC			0x06000020
+			IMX8DXL_ENET0_MDIO_CONN_ENET0_MDIO			0x06000020
+			IMX8DXL_ENET0_RGMII_RXC_CONN_ENET0_RGMII_RXC		0x00000060
+			IMX8DXL_ENET0_RGMII_RXD0_CONN_ENET0_RGMII_RXD0		0x00000060
+			IMX8DXL_ENET0_RGMII_RXD1_CONN_ENET0_RGMII_RXD1		0x00000060
+			IMX8DXL_ENET0_RGMII_RXD2_CONN_ENET0_RGMII_RXD2		0x00000060
+			IMX8DXL_ENET0_RGMII_RXD3_CONN_ENET0_RGMII_RXD3		0x00000060
+			IMX8DXL_ENET0_RGMII_RX_CTL_CONN_ENET0_RGMII_RX_CTL	0x00000060
+			IMX8DXL_ENET0_RGMII_TXC_CONN_ENET0_RGMII_TXC		0x00000060
+			IMX8DXL_ENET0_RGMII_TXD0_CONN_ENET0_RGMII_TXD0		0x00000060
+			IMX8DXL_ENET0_RGMII_TXD1_CONN_ENET0_RGMII_TXD1		0x00000060
+			IMX8DXL_ENET0_RGMII_TXD2_CONN_ENET0_RGMII_TXD2		0x00000060
+			IMX8DXL_ENET0_RGMII_TXD3_CONN_ENET0_RGMII_TXD3		0x00000060
+			IMX8DXL_ENET0_RGMII_TX_CTL_CONN_ENET0_RGMII_TX_CTL	0x00000060
+		>;
+	};
+
+	pinctrl_lpspi3: lpspi3grp {
+		fsl,pins = <
+			IMX8DXL_SPI3_SCK_ADMA_SPI3_SCK		0x6000040
+			IMX8DXL_SPI3_SDO_ADMA_SPI3_SDO		0x6000040
+			IMX8DXL_SPI3_SDI_ADMA_SPI3_SDI		0x6000040
+			IMX8DXL_SPI3_CS1_ADMA_SPI3_CS1		0x6000040
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			IMX8DXL_SPI1_SCK_ADMA_I2C2_SDA		0x06000021
+			IMX8DXL_SPI1_SDO_ADMA_I2C2_SCL		0x06000021
+		>;
+	};
+
+	pinctrl_cm40_lpuart: cm40lpuartgrp {
+		fsl,pins = <
+			IMX8DXL_ADC_IN2_M40_UART0_RX		0x06000020
+			IMX8DXL_ADC_IN3_M40_UART0_TX		0x06000020
+		>;
+	};
+
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			IMX8DXL_SPI1_CS0_ADMA_I2C3_SDA		0x06000021
+			IMX8DXL_SPI1_SDI_ADMA_I2C3_SCL		0x06000021
+		>;
+	};
+
+	pinctrl_lpuart0: lpuart0grp {
+		fsl,pins = <
+			IMX8DXL_UART0_RX_ADMA_UART0_RX		0x06000020
+			IMX8DXL_UART0_TX_ADMA_UART0_TX		0x06000020
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			IMX8DXL_EMMC0_CLK_CONN_EMMC0_CLK	0x06000041
+			IMX8DXL_EMMC0_CMD_CONN_EMMC0_CMD	0x00000021
+			IMX8DXL_EMMC0_DATA0_CONN_EMMC0_DATA0	0x00000021
+			IMX8DXL_EMMC0_DATA1_CONN_EMMC0_DATA1	0x00000021
+			IMX8DXL_EMMC0_DATA2_CONN_EMMC0_DATA2	0x00000021
+			IMX8DXL_EMMC0_DATA3_CONN_EMMC0_DATA3	0x00000021
+			IMX8DXL_EMMC0_DATA4_CONN_EMMC0_DATA4	0x00000021
+			IMX8DXL_EMMC0_DATA5_CONN_EMMC0_DATA5	0x00000021
+			IMX8DXL_EMMC0_DATA6_CONN_EMMC0_DATA6	0x00000021
+			IMX8DXL_EMMC0_DATA7_CONN_EMMC0_DATA7	0x00000021
+			IMX8DXL_EMMC0_STROBE_CONN_EMMC0_STROBE	0x00000041
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			IMX8DXL_ENET0_RGMII_TX_CTL_LSIO_GPIO4_IO30	0x00000040 /* RESET_B */
+			IMX8DXL_ENET0_RGMII_TXD1_LSIO_GPIO5_IO00	0x00000021 /* WP */
+			IMX8DXL_ENET0_RGMII_TXD2_LSIO_GPIO5_IO01	0x00000021 /* CD */
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			IMX8DXL_ENET0_RGMII_RXC_CONN_USDHC1_CLK		0x06000041
+			IMX8DXL_ENET0_RGMII_RX_CTL_CONN_USDHC1_CMD	0x00000021
+			IMX8DXL_ENET0_RGMII_RXD0_CONN_USDHC1_DATA0	0x00000021
+			IMX8DXL_ENET0_RGMII_RXD1_CONN_USDHC1_DATA1	0x00000021
+			IMX8DXL_ENET0_RGMII_RXD2_CONN_USDHC1_DATA2	0x00000021
+			IMX8DXL_ENET0_RGMII_RXD3_CONN_USDHC1_DATA3	0x00000021
+			IMX8DXL_ENET0_RGMII_TXD0_CONN_USDHC1_VSELECT	0x00000021
+		>;
+	};
+};
-- 
2.25.1

