Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010049.outbound.protection.outlook.com [52.101.84.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D5940A92B
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 07:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692100; cv=fail; b=oxOdfE1e/hNdHM5fwKUAUkpkIyoxbwZai+jXwaM6IllyGHXjx9Qj42RbChxrQHIrZl+kyqx+EDmhmzcdxnek3/KGvOeQDApK6gf3gPM3Fbr/9bRvPSaeF67ELRJkwPAeKsD7nwXJXZZyoakt43gaZvyYKjluwDD3cloBSBaBZYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692100; c=relaxed/simple;
	bh=hgV7SRYAHVxnbMfzOujFJ1AidQ/wTA3K3PvUZsd/R8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J4Dn7lCLFzgWg3hRYq1SGb+512n/W63KHg1tPTIcON0FN59FLIRplmlfQCf9Im6i+UDd3LbiE859iCCEyzBnq0Boae9eR1tGVp9XJC910Brh3jKHJabkgzi1+rM2vWlmCgBthPPHELTWUJPeK/wAZ751ylCv0fc//YQvDLSelPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ck5dOmlK; arc=fail smtp.client-ip=52.101.84.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ck5dOmlK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QynsJZzpZViwKDUtJXPm8i7NLWRrKcx6KStT5lcgkABwarXIsCoV76aeWjMcGBdYK5tX70JtJcqQyraG/m8TYeCCmTvALSekR8Gbmdv0OdMNi0wK3M53DUFjoVy6hLO1x53H8RkqQsheco/NE8TGVnrVmmby4e14lCNPu13EW0DhfOp76BD5BjxZYWYvMtPR+H9DjD0KVQS/OZ5iN0u8Ee9O66zTSZpCxvv0wcHHtz3AMsjs4txrgF2TYpylBJULzkMCo6GtD2pnxO5G+k3tUl2jCyqfXIr8aZ4INNKBqv1YDlRvpET1hl63OoFez06jXsgYGBSmNGuolF2TfeHoJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lrcjEBbbblSnUzf9sHH7EdMvdf+8u8U8CsBClnqodg=;
 b=TXSljZoa80NoeU3AowiTOFgANyQjJ8UmNUndhnWLv5oNcSwrdhJZaF+5BLLJw8pdwEetJ/HUwKQBn4WPOdrzwpDn8/dODEu1lCwTrJZIp82iHS7ymhK/QiFycN2PIaQttbMpHGoyFajIsqyP9SEU1fVOk4Ct2cTOcJX2qQtJz28E3kBiK0/ZnO58FbbTrALdHuPZs/IDy+ULJhNksr1iDVdeLWikBRTlPgLxZE722Tx42RhqYGChmbyIFhROUVwgClHaOmvu65YLpDmaG6xdxKbuNN1RRcdXWlP+d7hCEB2vGm9Q1XRt6Y4W1yav0CqYcZyZvIDj/GX7otFR3aC74Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lrcjEBbbblSnUzf9sHH7EdMvdf+8u8U8CsBClnqodg=;
 b=Ck5dOmlK+qqMoOtoCqwJwMC3lUyto5gSm3HGEyx2LOOStR5v4lYqQ5AeT4oHDteQcZbAZQ466iMs8JsjGgdW39byMpCGQkOb4hiI7utNvTN+mSi9hIXbmihcZ7qvtXrvBQXkOZxTpoRCNB6Clgk+R46iYHfnpp4bkiANoesBK86Ipgdrq8F74CwffQdG/Bw3+k5aDVVNyEUHY0pH2OLeGubAkjGFBw6PW24FxGwUNWwrYO+jv0tKg+8wGZfV3xX1Lv28woRTCM08tf+tGUUwGhDB2an/SPms6lYDT2nkxg57UfSr2y31aoQeJgShdi7wfrPrCXrH5w4K2TGXOZ6vRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AMDPR04MB11650.eurprd04.prod.outlook.com
 (2603:10a6:20b:716::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 07:21:36 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 07:21:36 +0000
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
Subject: [PATCH 09/17] arm64: dts: imx943-evk: Add board muxes to select between CAN1/PDM and MQS1/MIC
Date: Fri, 14 Aug 2026 16:20:13 +0900
Message-ID: <20260814072022.4064009-10-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
References: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0015.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b6::9) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AMDPR04MB11650:EE_
X-MS-Office365-Filtering-Correlation-Id: 1549ff22-ab1e-4a37-7008-08def9d4ad07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|19092799006|6133799003|3023799007|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nbcHWpj0nZc/x+2VWj9bb07hkbfzq8CgTua8NZaWt8JHB3dOTBnxySwRYQairmPUSuVVFLfgMK5mQfxomsGhi7aZlxquYshG/tueQkiztgVnW/PqEsu2VexMcoGdCPSyd6XUrNX7q+xk0r2VpZBxYrj7iQ5UVaxnmyr0UvCOM4n05R11ObA+MjK1A/zdQBH71ELqNJQ4d0sTfNrNtZuIrJk2RFmrPqlFz0GNTPXUWfqZ71TXDkeNKRZt/6MmcRfgWRLOQjgSFlXdX0/vddjEdeyxk7/SNky2GcK9fmWUEFC+JHus7HDn+ed01eLPQ+L0VA0tDAcLDdDWhL1yAqkInN9i5tccjs2yFi+OUKrs8b373aOf247nTYswsjxzW9w00I//qSYYPaHYtT8PS1WTMMMXOfesstmC1evFsZlgp3vTdcHJEimrJa/Mx13QV2pCjLKJbO4/cky4w6GVQKb1UEUNNNTfjmKsBNElTU2r9tSEFNqQQQfC6aSsx7WWA0OQlOD5/I+oDoIMxA9BtkV7ZYl3Km1+kR+2jAxHx67fqvJQWZiXFBvCH0RrJqRvn5F7l9sxvjv9xotR+92xdXLoM0B7810G49hEOLTClGyHtCe5Z1Md3Q6IDOMlCYkW6YzPaUVcZGpxydHVrteCdRf7keS4VdOI1g300yRtcX1Vmek=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(19092799006)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qFLMlu7a7wGADKh7k7rL24gt+Yb88J3F4y1E6tIR3GcLtOyJTXLel+T990ge?=
 =?us-ascii?Q?J6Y5HgzihyniYbn3ZVEd8qeAbNqfgwxp31rsqVL06josfgnJUgu912O3gQLH?=
 =?us-ascii?Q?kyOhISlycrVgFrNaoZAPgGMqSKxc9mu+7z4Hdp7wFrMVT2ak221pg9IlSepQ?=
 =?us-ascii?Q?ormmvFW4G1e4WHzQezteQOQg+44SZJ6J/jwdJxrZ950jxb50VKwgCI1+dcqy?=
 =?us-ascii?Q?2z1LViycK+awH1vC6YCKiwXlkR5Lx1ny9s6/n+cH2MFtVPD50IZfqkVU9/W5?=
 =?us-ascii?Q?oS2osuV10Dgyxq7pwIKhUilddJ4xzijdv4nZsOXNXFYS9yihd7Yzb3gRIWMR?=
 =?us-ascii?Q?+i+cFbVaVj8x53GS/Hyn9IYNcR+MxNtoIm/5LQT+FCoCyhrMBPRYFA0mDIYN?=
 =?us-ascii?Q?hctO4qwWyw91ZWEPI0evvwQqrSw3qXiAqwcN8SQIDfGBCYMOQT0JWjzhotOj?=
 =?us-ascii?Q?FJ9tLMkS0jMejqu+o3JHo+RhKTsg3HFVmTr55opjzjCa5bbnYNXcQ11zc8AS?=
 =?us-ascii?Q?gI/rb2xcQeattBFf1VMJmqsE8LrTi0m9OWAdAGOMBgiwxlu7pidyR4AbCnaK?=
 =?us-ascii?Q?z6u0JLTStZR4/sm4KmVhadnK/kY7Trt/oOg8Yf7bYfOUkk4itLIWndICZ1o6?=
 =?us-ascii?Q?DjFpxiOIT+ku72vntIfLVu6uHx6bB1FeVB6D07ylVs2UZ7DDR8HtaktxRFax?=
 =?us-ascii?Q?DxccVjz2vPZxPQR3B7A/KlXZ9bwCzfAaznUVRO+fyHADhfTVciC4khJ0Sw2p?=
 =?us-ascii?Q?COKQGn577IxYCMcAcFrQqXtZfXW2VXNkRMcESVyrtKdiwXPgDZ6TXV+umGdi?=
 =?us-ascii?Q?ysAdemfuwr+N1/zHKx/A155lFlHx3QcHrjWAIFOCu3K8yCxphGmZtkeMG9t4?=
 =?us-ascii?Q?BwycnyshAnofUmH0+UsxGwKL2R6diXIptzSXdwDDVuvIPkqk5qXBGK783L3i?=
 =?us-ascii?Q?m6fgdwEta6juca8ACLwANeoQS97j1XeUfjIqGq6CAbAliYgB8sQ7Av/Yrbs1?=
 =?us-ascii?Q?vaES+vHHRokEYnEa4muLfqA90oJoTsA4HyEa4jHW/LxsUhg2dTD/hMkd/hvY?=
 =?us-ascii?Q?q31jIF0vS7hG7l8/9W/KRK0YB2/ArN4khJEH88LXZi1wxWypUB7WXxZJInMo?=
 =?us-ascii?Q?7dPx2axl5q9/EbxXWLWFhPwqUmHU8TB+LQXK0kFHTCq+NWvhOvcxpJc2CNBR?=
 =?us-ascii?Q?303FZiGquYBWn/r8y15hhGFFdWvmSrR5bZyuixl2huI5dEDJSjbwii+263xh?=
 =?us-ascii?Q?qg2JvKx2CA0Sd0pTXi6Ffme4KVklG0YYrIlzfCorYojZt9xcMD3PaT1pQh1A?=
 =?us-ascii?Q?Fg0FO/B9ozWFucXRDou8/2h9ZUYpCoO0gHNJR02LC7wPtI1A/d1APstt842H?=
 =?us-ascii?Q?0I31JspAL3Z/gUyQyUBJDPZTOnJVyuZkgHu47UpU1pKJYbkonLhnOuDeaxtB?=
 =?us-ascii?Q?qxhIEzKBmBIYJjrrg/O4XLG2v0GlGVyXoMl/6Y3FtHe+14OXOL9KBH90qzRX?=
 =?us-ascii?Q?f2NYJaogYhIcxJj3LN9gzxnH5wbqsl1GVxL0ASKdFBu9pIJEIdFajv+8xb3L?=
 =?us-ascii?Q?sWKvwrDQBYpdr1+2mk0soLctcsKe6pATv/lYW3jDQnJJGQ8AWHQbw4G2T8sA?=
 =?us-ascii?Q?qoenZx0XWeoCi7MF+pR0ds8aD4zp1rshYPhS1mrnzkOAAn14DTI/+J6xr24o?=
 =?us-ascii?Q?EoT1cugS2CCuentUc1uSw836o9CuI7yu/P2Uf8Dshy6hHP5V/A7SuVrVV6ux?=
 =?us-ascii?Q?L8TvfAKKD1UhuA4lq4w0xjfqodUM8VSk7vMGvpDLn4T/xPZnLzCi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1549ff22-ab1e-4a37-7008-08def9d4ad07
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 07:21:36.6051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rd/6PSTn/5m63xiV0CSh0A8t4KcCGxskZaRuVt7YzoBS8tShPgTfR61Iiv4vIM8DAH0C6Nk75RwHBd9rCRj5lJcseYhV2XqqZZHdQ0a9heDVH/9A5Ed9494As1sfmikl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11650

From: Chancel Liu <chancel.liu@nxp.com>

CAN1 has pin conflict with PDM, and MQS1 has pin conflict with the
MICFIL function. Replace static gpio-hog settings with GPIO-controlled
board muxes using the pinctrl-multiplexer framework, so that the
conflicting functions can be selected at runtime.

Update the MICFIL node to select MICFIL function via PINCTRL.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 49 ++++++++++++++------
 1 file changed, 35 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index 64660f94f4e9..07b782ef698a 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -38,6 +38,40 @@ bt_sco_codec: bt-sco-codec {
 		#sound-dai-cells = <1>;
 	};
 
+	can1_pdm_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6416_i2c6_u44 12 GPIO_ACTIVE_HIGH>;
+	};
+
+	mqs1_mic_mux: mux-controller-1 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6416_i2c3_u171 11 GPIO_ACTIVE_HIGH>;
+	};
+
+	pinctrl-gpiomux {
+		compatible = "pinctrl-multiplexer";
+
+		can1_fun: can1-grp {
+			mux-states = <&can1_pdm_mux 1>;
+		};
+
+		mic_fun: mic-grp {
+			mux-states = <&mqs1_mic_mux 0>;
+		};
+
+		mqs1_fun: mqs1-grp {
+			mux-states = <&mqs1_mic_mux 1>;
+		};
+
+		pdm_fun: pdm-grp {
+			mux-states = <&can1_pdm_mux 0>;
+		};
+	};
+
 	flexcan2_phy: can-phy0 {
 		compatible = "nxp,tjr1443";
 		#phy-cells = <0>;
@@ -535,12 +569,6 @@ audio-pwren-hog {
 					gpio-hog;
 					output-high;
 				};
-
-				mqs-mic-sel-hog {
-					gpios = <11 GPIO_ACTIVE_HIGH>;
-					gpio-hog;
-					output-low;
-				};
 			};
 		};
 
@@ -651,13 +679,6 @@ pcal6416_i2c6_u44: gpio@20 {
 				#gpio-cells = <2>;
 				gpio-controller;
 
-				/* pdm selection */
-				can-pdm-sel-hog {
-					gpios = <12 GPIO_ACTIVE_HIGH>;
-					gpio-hog;
-					output-low;
-				};
-
 				sai3-sel-hog {
 					gpios = <11 GPIO_ACTIVE_HIGH>;
 					gpio-hog;
@@ -710,7 +731,7 @@ &micfil {
 	assigned-clock-rates = <3932160000>,
 			       <3612672000>, <393216000>,
 			       <361267200>, <49152000>;
-	pinctrl-0 = <&pinctrl_pdm>;
+	pinctrl-0 = <&pinctrl_pdm>, <&mic_fun>, <&pdm_fun>;
 	pinctrl-names = "default";
 	status = "okay";
 };
-- 
2.50.1

