Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021103.outbound.protection.outlook.com [40.107.130.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629962DE1E4
	for <imx@lists.linux.dev>; Tue, 28 Oct 2025 09:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761642049; cv=fail; b=ZBmAt6Qc/VKkGbmXgBIAy9EjqN49AKyx14cAglqiaPn/1b5uypOhrZ6+/9HGmWzBbPmaIyzLIZ2Ste+4yFBoYRF16Uk/eF/CyUAmWuDJKc9Cnc5UGfklbYZ2eJ1SLs1EiT3eBWaySdw156lsGT2oGPcJOv0y5Cnrog2+WAGQlc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761642049; c=relaxed/simple;
	bh=bTlrxpH2NxVu0ZPEPB4zwcjmzvYBCXpgWA1duGVojl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=g0Zxo86lxOO9H3uXX92z8PbRYOGNHqWGpbTH86j6tQcGs26XCG8eY/VUvGsi9y4qVEuqyvzN+Mu05T9SYr/e/aAN0ScMbqDQzfqWYC6RZonrY30QEUN1IWcEm2kx7b+llnzFrPwhxvxcp56ogv6ki4Nu/zGsLWpMAtqkdg0AClc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=UoA7eqru; arc=fail smtp.client-ip=40.107.130.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="UoA7eqru"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZRTLoK3sDABi6mHhur+bBPYGcSqKV3aH9UgJvlThmVAE/S3sjyS99eoaHjadefYtSpQ31WXFY+d2EWo7nZx7mgsDSFaV0BLgpYIcQd112zGRZQKBnR198rwuz6s4Hj8hUmVIhPYrHLMyHK6aOW2OSPEMZ2K9cHZ/CVNF7dHMReanXWucygGf9WZCr9NLC95kbIxJlzi2uDCaIuCvXzHUfaUp098GCD3KUJaaS+lHr++lOw5IuREbX1gtPpjMsV2dHQ8DKQ1Bod+32RGOWj3oAY0WEs4TwqQna2JxhqVldnOjrJJNjPG88Fu9Mk23h+Xa6bBb9ivtz6vTGX2p9E4Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxZ6B3rDVE+WyBW4zofvPil9cqqLk1F1XL+KoPJcTeI=;
 b=jc4rnQaSMW/5gw15fUS0sl36T2hWScI54yMYu5mKsjtye/nd/9ww9Ljcn8U9JwOAToys3euZZEEYF808WqT17/MMh9USEA8YkJfJjieeHkEqdYMZrcIheHvN90d2WgCfdKV946PZWddZ/aPae00XKZq1CO5TU7RDhNNf5SLJc2r9K+ytYcnDmAtDanx4bUOlQ5gUWBEVzs3ljI0nFYIXrMJnmBPxa2WRFkjhjAUATiBBggcddqkuDhKCyO8L9Hrwumrl60m66zv3aMwbREu7rkweXx5yj2bziPJ6He3fRqB4n9AwCj68rF3DNEe8mlvxu7lxO2IuXLhZbBhC8aCdvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxZ6B3rDVE+WyBW4zofvPil9cqqLk1F1XL+KoPJcTeI=;
 b=UoA7eqru4LGCJtVSHxL/iwVmIY/dZmdkzAwnioMdfcYs4iI3Y9n5tTv6ML8P1vasOiRJJqVO2DPzWD9MybTkROBIBGv1IxND5rqFyZNrI+R12+WuyB7SJrLDW0A7LloCa5958b4caJOOgXWGfnNA41xxj+o01g8GcR4KZx60sbvJhcgpE0svMkX/UjtpxKwGVcqOkPQXl7knWVAgRPCeSY3oekmNey0DsHoQMqENfTye00MxaGsiIAmwN0xt5P7c2Hy8z4AlkAnmwH2vQ2bg0ylcaPOxRsKLpnaHCf8f+8HWCIHgBCcWfo/gbkS9tBt+6E9urG3NNu/ECCWasjmNGw==
Received: from DB8P191CA0022.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::32)
 by DB9P195MB1491.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:33b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 09:00:40 +0000
Received: from DB1PEPF000509EF.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::27) by DB8P191CA0022.outlook.office365.com
 (2603:10a6:10:130::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Tue,
 28 Oct 2025 09:00:40 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509EF.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Tue, 28 Oct 2025 09:00:40 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 28 Oct
 2025 10:00:37 +0100
From: Jan Remmet <j.remmet@phytec.de>
Date: Tue, 28 Oct 2025 09:58:09 +0100
Subject: [PATCH v3 2/6] arm64: dts: imx8mm-phyboard-polis: move mipi bridge
 to som
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251028-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v3-2-9b98f29a6bb9@phytec.de>
References: <20251028-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v3-0-9b98f29a6bb9@phytec.de>
In-Reply-To: <20251028-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v3-0-9b98f29a6bb9@phytec.de>
To: Teresa Remmet <t.remmet@phytec.de>, Janine Hagemann
	<j.hagemann@phytec.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EF:EE_|DB9P195MB1491:EE_
X-MS-Office365-Filtering-Correlation-Id: 37ccc4a8-570d-42fc-9dd6-08de16007841
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L2NVdFV2YmJPTVFFNUdrOGttbXkrY1lYcDJmckVBUXJrb1FiNmkzOWg3eXVh?=
 =?utf-8?B?Yk1GbUVDb0dXeXdYa0VtMFRYL3VveWdvRk5EdlJzVU8zdkw3d0pNMVhZSFZ3?=
 =?utf-8?B?cENXZXVFb2RvTE0xWFpwdWNqUXgwQ1lXdFVSS0FZNTMvcXplL2YwbTJaWkQ0?=
 =?utf-8?B?U1Q2SFBBbXRBdU16TXlxbWs5THpqMGFDMFZiT040c2tKTEhsSWVHN3hyYTRa?=
 =?utf-8?B?N3lpZzlYYTMyME1LR2V0ZDRtT0QrdForem8vTmdaNklFbmp6dlpTZ2Y2NDFP?=
 =?utf-8?B?ZGZ6NHhxZE50b0tDUDZHS0JhQ3FYSFNOMml5WGFzNFVsNkpVSlVEd25BYVlQ?=
 =?utf-8?B?eUhUc0Fyb0ExeHFHbnNoR1dvTndWMVlyUUpxRVdEckxySWVtNW1teFdVOTJ2?=
 =?utf-8?B?UWNNWmpMU1NCRFlYOCtYblNDT0l3dnpQVmJndkRRaE9XRnRVcit3V2NVR041?=
 =?utf-8?B?QlFFR0hjYWkrUE9YaURxc05kKzNQZEpwbVNjSnRDZVkrakFDcHVHTEtLTDVD?=
 =?utf-8?B?NllsRXcvbXRLTW9MNitVUmtrMWJBaytQbXo0YnlCcERZR0tabEFsTTVvb2lI?=
 =?utf-8?B?K2xDbU44WFRibnljUytFWUxHb3ZhNzVha3RLTVA1Mjd2OUxMVnhEdjgvVUVU?=
 =?utf-8?B?K0YvRkhRSnRETmk1cGZTNjBqR01JWFdkS1JWVk1JQ2YrQUNTREIzRlB1T1Av?=
 =?utf-8?B?NDRSWnFRUUR1b3hRU05IQmdWQmFQZ09oMDJGMHRzekhVTzZGT0ZMLzVCVE9Q?=
 =?utf-8?B?UmNxZlRSMzRWbHhUQVRXeWZOVGFmWXVINVRaNEJrUW9SYlhTS3BjOE02QStw?=
 =?utf-8?B?MEJRZE9IRnhwaTBqVHZoam5SVzA2QnpIVkEwYTlCSEpwMGhlenRLVkI3ckVU?=
 =?utf-8?B?S2JPWDdmMG0xdXBSZ2FkK0lUdTJaWXRyZjFWajYvWHEzSklDemNjNTFHazlM?=
 =?utf-8?B?MVQydlBQVXRTaUY2Mk9LeFZVK0F5Y2JCWUlWVkdCNVVuTWViWG5zWTNDWFhy?=
 =?utf-8?B?WTY2NlRDS29GTHRmdVlrUHhIcFBpSWpjR1JpQVN6alNUS0Nra2I3V2ZQYzdE?=
 =?utf-8?B?Y0VqZzRUOFc5QXFHZ2VUYWJRcmN1bzc1U2svd3Y1U2s3V1BDN3pFRGJTQWt2?=
 =?utf-8?B?STg1cHFHUjROa01TWGt5T3l3a1JpYVVtMFhrdmt1dEFRT0FmK1lOY2YrUzln?=
 =?utf-8?B?VFoyMlFoOEl4SWxNcGlETkxSakdwT3JnL0pQd0ZJZ3Z1eTRkOHZ5NitJSk1V?=
 =?utf-8?B?QkFmbkhaWnhjMzRoWDg5Rk9KOXRjNlk0ZWlMbTQzVUwzNW14RDE4WHY2TS9k?=
 =?utf-8?B?S2ltOFVaRTZTbmcxMGlVa1pOWmM5dkttUWNkS2o5QldnYklIM01vUWF6VStM?=
 =?utf-8?B?UkRzS2QwUnAwNklLckZzYWU3bGZMVzlsZjdRbDBiTEliZHR1L3YyU3F3TU9t?=
 =?utf-8?B?djhmNGEwbW1LNW5rSUdxUVlOV1NTL3hPVnc0WGI1ZG13b1pURzdBelBTZVIv?=
 =?utf-8?B?NVprWW05dVdrdm43TFJSSjY5cnVTR0dDZ0U5c01iTUxPd3RaRHZtQnh1K0hV?=
 =?utf-8?B?c0dSUlRraEZESWQ2RFJYa053Y1FjOUZzcVpaRTJCQmIwcUpSSkJFOXBVNUt2?=
 =?utf-8?B?bEpLa2ZFcFNyVkhPR2R6VVdURXdURFNEK2pMd1hHZHo0TldQS0lmOE1mRG8v?=
 =?utf-8?B?dzRaVmRhY1oyRnlWY2M2U01UWVpSTFZSYW16YWZmUXZQUm5TSUlFQVdZdFd3?=
 =?utf-8?B?MGxBZ0xxS09nelpGU2s5OFRpSlZYYlo2LzV1UXJLTEtrR2xMTEMzRTh1TGdS?=
 =?utf-8?B?dTRGUG8wcVBhTDRVL2JVZVlaVzM5SkkyWmtKS3hlNkd5bmpRQ1FSTjhQVVhH?=
 =?utf-8?B?U2VqMDFDUDQrU1htcERpNnhoSTlLaitHOWJ6aHJIWFdGNU44L0NMSVhaZUs0?=
 =?utf-8?B?eDltU2h2L01aVHhRWDlrYStWYkxGUzFDdWZGQUlNODNJTm1zZVFMMkM4Z2xG?=
 =?utf-8?B?WllVNTNud0lhMEwwU3pXSEtleHRva1d6Qi9RYjJMQUt6K3M3ekpHcnlmdjlI?=
 =?utf-8?B?ZlFtb3pOVVBUUUtNSjlyaS9KQVB3akx5WHJZQXB6alhPOURaaXN5RFRyRnZy?=
 =?utf-8?Q?loJA=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 09:00:40.5836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37ccc4a8-570d-42fc-9dd6-08de16007841
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB1491

sn65dsi83 is mounted on som. Add the static configuration there.
So it can be used by other boards too.
Use mipi_dsi_out from imx8mm.dtsi directly.

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
 .../freescale/imx8mm-phyboard-polis-peb-av-10.dtso | 40 ++++------------------
 .../boot/dts/freescale/imx8mm-phycore-som.dtsi     | 25 ++++++++++++++
 2 files changed, 31 insertions(+), 34 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
index 00da1eedf73aac1f0e87383ac3d12f21e007c4cc..7e60c96b3562f4baf19bcdda8940c2b0c52dd743 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
@@ -81,6 +81,12 @@ dailink_master: simple-audio-card,codec {
 	};
 };
 
+&bridge_out {
+	remote-endpoint = <&panel_in>;
+	ti,lvds-vod-swing-clock-microvolt = <200000 600000>;
+	ti,lvds-vod-swing-data-microvolt = <200000 600000>;
+};
+
 &i2c3 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default", "gpio";
@@ -128,19 +134,7 @@ &lcdif {
 };
 
 &mipi_dsi {
-	samsung,esc-clock-frequency = <10000000>;
 	status = "okay";
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		port@1 {
-			reg = <1>;
-			dsi_out: endpoint {
-				remote-endpoint = <&bridge_in>;
-			};
-		};
-	};
 };
 
 &pwm4 {
@@ -168,28 +162,6 @@ &sai5 {
 
 &sn65dsi83 {
 	status = "okay";
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			reg = <0>;
-			bridge_in: endpoint {
-				remote-endpoint = <&dsi_out>;
-				data-lanes = <1 2 3 4>;
-			};
-		};
-
-		port@2 {
-			reg = <2>;
-			bridge_out: endpoint {
-				remote-endpoint = <&panel_in>;
-				ti,lvds-vod-swing-clock-microvolt = <200000 600000>;
-				ti,lvds-vod-swing-data-microvolt = <200000 600000>;
-			};
-		};
-	};
 };
 
 &iomuxc {
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
index 54f724e1774c2c718cddd1ddc7378054f2b2f638..3d66c6701342ae20839254674261c8264beccde5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
@@ -287,6 +287,23 @@ sn65dsi83: bridge@2d {
 		reg = <0x2d>;
 		vcc-supply = <&reg_vdd_1v8>;
 		status = "disabled";
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				bridge_in: endpoint {
+					remote-endpoint = <&mipi_dsi_out>;
+					data-lanes = <1 2 3 4>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				bridge_out: endpoint {};
+			};
+		};
 	};
 
 	/* EEPROM */
@@ -304,6 +321,14 @@ rv3028: rtc@52 {
 	};
 };
 
+&mipi_dsi {
+	samsung,esc-clock-frequency = <10000000>;
+};
+
+&mipi_dsi_out {
+	remote-endpoint = <&bridge_in>;
+};
+
 /* eMMC */
 &usdhc3 {
 	assigned-clocks = <&clk IMX8MM_CLK_USDHC3_ROOT>;

-- 
2.43.0

