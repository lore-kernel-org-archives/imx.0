Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023091.outbound.protection.outlook.com [40.107.162.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A895D2874E3
	for <imx@lists.linux.dev>; Tue,  7 Oct 2025 08:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759824783; cv=fail; b=tlyQ61b4fr8i37GfBD1byTGu+7nDIq3mG6HSN/VMah7tDvxgHZfkJxj/4ULiSyhT1dhPUB+D4EicRyD4qZ8y1FStPaCY6AV+6pTuY5mSzcbEa99BET1uI6MED4cmtMscbe8RtkRouf+lOK6rzHdLFrL9fTPY5TSS6pU/oLYLosg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759824783; c=relaxed/simple;
	bh=dKEHu/RO2mNjOYc2e4/2+jYKRKNDpHvSVQpa+yB0/9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ahkzNwJHr5Y8J747I19AJBAcAgBO6RY6fDwRkxtltwzdHTw5uAGAE2OfrIaUmeoXJ944vcnNNrInHyKTdnBU37syfn0dTnhLBbzHqm+jaayk0B2912Fgyd8g1aeC8yoBgCLMSpZyUfRImJTvi9FW5V2XS9DDai62jifJQXne46E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=Sil2XPok; arc=fail smtp.client-ip=40.107.162.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="Sil2XPok"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NLIAXxN72a/VtkJoLmsrRa8D+roHHchMCofvvkRRA13FHKqk9e5CIytBmV77ktg54NKl0IhXJBPIrXDXdCWPzZo4hjh69rH3kuM4Klv42bJ8QfP+vB1bnl3eEuBVKTGaq0yBInBocZgTfEOB/WtFxquoT4xhasTqQGuAQbqrJrQmywAN+vhPK3UAuuMaJo/p5oEXhRw5rJfLeDErtQx99XG+meU5/bmGRz7fXxPtrekP5yUe4Jjo5tJLziLq+Q8fbwWl6Oy6Xtp0uuuz+DugZf9DgRWQwwMX7mv/vdZ4oVtqHaFaUy1+vlIcOFcPC36EUxVs1wT8WN23NfBiI/6b3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEPhkkigx6uuKXqydRqGUBvWn+iveSU+r9XNSCxFjFM=;
 b=tFcRfJUq9eU4+BhXoGnmb0euFB1oyybtj8GT2LJ9SKmaz8K3E+9X/lz7yh/sSOBysOtz/2Ts36D/qEug8sLbIuq+5CEKNV83FrXADp0Wf8q62QeUy3pCB0b67lbZfg09RGbLHdQibEPFxmUjxi/tdnoF900GmNthyDXWdXkyerrN9+NsVtq1L6qOknZMwqZ9xM39lfPdTxbh5eTTff3Jeqrw48v3MVN9Gcd5JmqfpDyvtoAfd6jENnseKcDf/jaT2JJ/yXhW7RvFYWXqItzCrPcyDVmBmIvzqZXP9bG3DYN03sxtT0C8p0xAwBCTiPQhv90B14uag6w1fNL1lnbVtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEPhkkigx6uuKXqydRqGUBvWn+iveSU+r9XNSCxFjFM=;
 b=Sil2XPokbTcPBYxEmPjtXOBTj0sz/zjjs+3houS+ArpySmt+Ipi+n8/WMsP6CGDvn87+uc3gvzYgzU0l6b2xSrncXVUpDYKLiLfEKWYJCx1jusarSlrvPobJuDLtrM37yyORH+ayI0oh0M9TCEIKTorNtlMN0UhfdfmJnsOY64daclus8UsnpyTjA8d6Qa31dPY535h3FZP7KRk0n9aKE30jhkB21ctBdt1xKOM2riOoR/E72TbJ6SWEMJqtwJE2K4htd6ALjMi9jCmhO1mtjMGleQ5DauB2C8qZIDszF22Q4MFgRrnt+ZCkuvT3JjcUP0l79p5JFxfmFnxT4wxlQg==
Received: from DUZP191CA0010.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::27)
 by DU7PPF366CD9CFC.EURP195.PROD.OUTLOOK.COM (2603:10a6:18:3::bcf) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 7 Oct
 2025 08:12:53 +0000
Received: from DB1PEPF000509EE.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::2a) by DUZP191CA0010.outlook.office365.com
 (2603:10a6:10:4f9::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Tue,
 7 Oct 2025 08:12:48 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509EE.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Tue, 7 Oct 2025 08:12:53 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 7 Oct
 2025 10:12:45 +0200
From: Jan Remmet <j.remmet@phytec.de>
Date: Tue, 7 Oct 2025 10:12:27 +0200
Subject: [PATCH v2 2/6] arm64: dts: imx8mm-phyboard-polis: move mipi bridge
 to som
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251007-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v2-2-7e5de62c79bf@phytec.de>
References: <20251007-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v2-0-7e5de62c79bf@phytec.de>
In-Reply-To: <20251007-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v2-0-7e5de62c79bf@phytec.de>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EE:EE_|DU7PPF366CD9CFC:EE_
X-MS-Office365-Filtering-Correlation-Id: 585d51b8-6463-43f6-46af-08de057950c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|1800799024|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MWt3VVBPWnN5VStMZFJZZnNQNEYwOGJXT2xPN3NWUHNCVVMyQlJhM2dUdTZn?=
 =?utf-8?B?c3ovblhCSFBRelhXbVJPbDlBcU5KZFNqUDNaMmZJZmc4VmNlK0xMQU8vNFF5?=
 =?utf-8?B?cTdpUGNjdnlTeVB5Mm9XWGhNRFo5d0RJNnVuVHJ2amZyNmtuNG5jUHRPZlpu?=
 =?utf-8?B?T0JJYm5YK3hEdmJvcTBaY1RxR2trT05UYUdmZloxNlJhNTJ4a0pHTW5LTjEx?=
 =?utf-8?B?ZWFzOVdKRUtQS2lNOWh1bEtGaDgrUHUxN3JJbDhTZlZ1NHRCV1NYUFpheGQv?=
 =?utf-8?B?U3J3OFpPUVo5VU9jWkxTeFBpVnRLaWFOZFFYMUZsNGt1a2pkYXhpQzZuaFZn?=
 =?utf-8?B?K0oxTElYYkR4aUlmcXF0QXlOaHFCdVZSTkIvTnJTcjJrSjZwN3lESG0weWM5?=
 =?utf-8?B?WU9TdGl2WkM4Rk9yTlBsaXhXZVFMdmJBV1lmeExsQkdMbm1RdXd3ZjE2R29r?=
 =?utf-8?B?eXNUaXQ1TDcwRWkzR1IwOTFIU1hFVVRkZEVFZW5oK1oweFZ4a1NiQ2pIbjQ3?=
 =?utf-8?B?YXprRTZVd3JPWDJ1Slo4WlhEY3VsQTZiMmM3VzNXZEpSSGRYb0lZZ1J0WXJF?=
 =?utf-8?B?ZmdPcTVhVXZ1WVFNTlVZNkpPcjlUcm5uTVZoWHdEeHFiYlBNVXk4bjR3aTlI?=
 =?utf-8?B?YVQ1L3BwRllDOFdXZmM1TWpwdEd0Q3dQNFZEZm9oZGt2ZTdPM2pabGIxdWEz?=
 =?utf-8?B?RmpaTGNqSVJleHFINFVNMTZHK0x6L25vZ3ZJQzVIWEoxNUJiUXAwRjFteW1T?=
 =?utf-8?B?dk1aQ3p1NkY3Y0F3Z2JpS25PVy93MVFvWHdJT2tCR0wrV0NIUi9UUEV1Z1hS?=
 =?utf-8?B?bWJpRmtTd2hoenRxekM2VU9iWDFNdGZXOFRZLzdKM2FrSWNCU1FrdmI1VjBw?=
 =?utf-8?B?eXRUcWFZTVFzVy9BQ1ZKRkZRUHlTanRBc2dPN2c5bGlrcTVUR1hxaG0wYnA5?=
 =?utf-8?B?ZVYzTHlnRnNqQmN5M0tjZjM1RW1hbzlBdXAvWkhsQVZCM05WWk90WHpMajBB?=
 =?utf-8?B?cEptZUZ2bW94RTVhTmdjd205bGxDNUV5dzE3Y1I0amRwSCtLWWZGMy9IUTVZ?=
 =?utf-8?B?ZGNJTEJKckZ2NktOZWpqU3BxNUJ5bEVBOUFGc2p2UlpJbmFQMXh4RytHVW9Q?=
 =?utf-8?B?aHRRSExGemxpM2FVQ2ZpOXJZY3NKb2Jicmc2WVU2SlcveGZnZVFvRElYalV4?=
 =?utf-8?B?aGdVVUl6Q0FKbExPZkpRVFJRZkFycWRQc251RDdwMnlITG1XSFp4WGNqOG9O?=
 =?utf-8?B?ZHpKN3U1M0NkUHlRRU5rTG1WWWc1dWM0eUtKZFo4Y1hVbktLSTJMbk04S3Zh?=
 =?utf-8?B?R3ZsYkpyKytMWDl3c20vRk9lbU9yRm42a2R2VEgvVG8rOUQwZlMvS2V5ekl0?=
 =?utf-8?B?N3lNNlZkQ3JIUXlqbUFxY3kxbElxVlQxbzlDZVFuTytUL3NPdHJMYWVyb0NR?=
 =?utf-8?B?akZNc2s5ZkNtUnZUL3ZEQTRzVndpeG9JNE1HK3ZCK2FkSzRXazlsWktnbkRs?=
 =?utf-8?B?a084T2JnczQrTFZtYUxhL0U0VkR6OFYyR29mdnB5ZGZiYXFmQXBlQTArUEcx?=
 =?utf-8?B?UDhBcUV5YTdXbis4MmlUTjk2eFlMOTVoQ0NvQWdLejBTdmNJUmROUXplZU5q?=
 =?utf-8?B?SFE4NUthdWs1MnFGOHVXVXpQODdpQVU5djcrb2kxRSthVnpJWCt6cVc4V0Rt?=
 =?utf-8?B?cW81dUs3MUtUZE5PVXh6Q1B3UUVjSWppeXRXUmM5L2QvWHkvbWhyazJnTjF5?=
 =?utf-8?B?NlBHRWc5K3BhWDNxK09VWm85a2lWSTZudDk1anlDRXl4QjF4SXUxOWRQOEQr?=
 =?utf-8?B?MUY4clFYZjBpQmpLa2RBU3RyZERiQUxNQXNVbWFRNHVYQ3E2NDVydEdjL1F1?=
 =?utf-8?B?VU55WU12QlpacUdxUjc2UE9LdENFSnRER0tHY3d6M1NxNEZlbEFiWUR0NmR3?=
 =?utf-8?B?K3RCaERDeHk2cHF2RjJEVm8wUXh4YisrM3pzWS9tQTVRb2E4TitiZFkvWmsr?=
 =?utf-8?B?aVowMzQyZzB3a1Q0SnZQd0xrbG45c0NaWkk5YmcyK2R1d21yYlNaMU9NYUR4?=
 =?utf-8?B?MHlMUGY5bEtQLzU4Y01LYjRTeTBaU2RTWmZFTDE5eVlmZ2VkRXVxVlUySWNk?=
 =?utf-8?Q?EEn0=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(1800799024)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 08:12:53.6489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 585d51b8-6463-43f6-46af-08de057950c1
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPF366CD9CFC

sn65dsi83 is mounted on som. Add the static configuration there.
So it can be used by other boards too.
Use mipi_dsi_out from imx8mm.dtsi directly.

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
 .../freescale/imx8mm-phyboard-polis-peb-av-10.dtso | 40 ++++------------------
 .../boot/dts/freescale/imx8mm-phycore-som.dtsi     | 25 ++++++++++++++
 2 files changed, 31 insertions(+), 34 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
index 5955d48e19ad0035038ea4ad7838b3e09d10b2ec..5d4f6a9c348b57ee903c7b74f8c8e2b318060945 100644
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
index 1c472e9012c3ad3445fc0b17e0393a9c0e243329..e7f9fe7ecd8cf147a6b47b2036d71073008da390 100644
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

