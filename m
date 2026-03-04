Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011022.outbound.protection.outlook.com [52.101.70.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F23835CB70
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 11:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772624113; cv=fail; b=dUcUxdEKtdZJoCvoXJruUMte1pd8sHuHaCnExUXZ3xeMUYLSDInO36WvNoaGevaxX58iZNsybinOFrAMCFzWvcuPSknVP16CalT7ocGYPwS9VWhieR4P7BZltle5ml0t17/yEj/GF8TY3VebreKf7me++WRWcxnPBCfoerPIHXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772624113; c=relaxed/simple;
	bh=WE/TcJkUffHrBm+4gVgKzQ4oHKOLam7o674S0I+Y4Uc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nARW4pYmfXWKXqaScpMBmz0iWamq4H51VGBGByz6I9+PvcgUhCqxzkQEJlfIQ9E5fgJiBLJ0Wdqo8gvqEJ9rm/PrHCMz58t686HXSpn+dYgax3BDT0KZE64SPNOLRpzGQT0YwxoC5o4SVwjByqbJUZYcG6Mos4Xk2iyIRSelP34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=unycttIo; arc=fail smtp.client-ip=52.101.70.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="unycttIo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xddmkU+/8a8gmrNkXd5h3i8gjkR0/v8gtTqDyIushd/IOUWxtf9IsjOjz432LRoFi+QqB1/Gz/3ecrbs3ZjrUybyUPs5xW17lRzN4skWwPyqXc8VnfjAIuACFwH7IZ4vgMIWpW4B6lKq0mF3pU2hAbCfiPNUP+YsmcOu0g+Rq4uh0ogu5B5rlJqvdOwigUiDIhyDK70wwBE+RdsTZW4N/XraoV1SgBCfGvGjBrBtlHh3DmqLyTnj2S2D2idnZoMBQsbVn9oVM4DqfbyyoG0W+ZW/nWLrTzDQraVV/Sxap3CamXDgKrEE5Mf+i3E+K8UowAQo2Ebv4G6NehvnZkMH1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHA5qcqXcY29B6gE1YPwSeWdQVOITwiLJNnmSiuQZjY=;
 b=bDwAT2u5un+C9EuGjtqxZzJ5tpe/kloS3/SGUhH0saxJIRqOlCIhTrFNESY6ti2yLcqL6JprgEKnBXJ6RxSovid6XzLSDvzoFLg+d+TBVyluF1yUbAuv1Pvpfr6irtKfXupLaqg6SBnCSl8EO1RR4Asiv12ikK4+zoVUsMAwf/I0F+vgIJDQWkzOQe0ak0cpHeSq1l+VhZzukgIn4IFctU1F2HklvQ/nKUPZZwYWTElXx1CQkbX8jLAg270cV8QdxgGK9TZjkZjaXGDJVlN8kaEQsVVWirHCIJvqERNHxKhPnueHMbjBx1kI9taypPtYaBBuYylPvepW6WfSAOKe2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHA5qcqXcY29B6gE1YPwSeWdQVOITwiLJNnmSiuQZjY=;
 b=unycttIoYCB/2FBQc+d9saqPn+fu2Xo0D6Pd1YyXYV2ARVpUt1DzvVqB7Waox3XwWMM3Lr0icgDyap4dLpkP3A5yQ5ZOqdQlXQKrOltnKXfznTC4/PgOVI3yd8BXTkn9jEw/aw0clU9Cq9tSd705lTWS/z+FVjoyn0YpeUscNTeqbRkWq1tVvT+hW2AhV6l3/aW3WMTpZaMjLejKWmMLL64CtbhGg4SXrLD5+Z7SiN0LEbrPR3T1GRkq2g50xZYVcc4ttEvko3oZu4LU08rWjeRxhft/A4vqRcBJ2OI5iexWudWougTM1xEeuQ7q4yB0Q4mVQ7jBtLvRgeX1uM5LOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by GV1PR04MB10522.eurprd04.prod.outlook.com (2603:10a6:150:1ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 11:35:06 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 11:35:06 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	Ying Liu <victor.liu@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 7/9] arm64: dts: imx943: Add display pipeline nodes
Date: Wed,  4 Mar 2026 11:34:16 +0000
Message-ID: <20260304-dcif-upstreaming-v8-7-bec5c047edd4@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260304-dcif-upstreaming-v8-0-bec5c047edd4@oss.nxp.com>
References: <20260304-dcif-upstreaming-v8-0-bec5c047edd4@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P251CA0017.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::22) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|GV1PR04MB10522:EE_
X-MS-Office365-Filtering-Correlation-Id: e0c3bf73-6709-4ddb-5959-08de79e21556
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|19092799006|376014|366016;
X-Microsoft-Antispam-Message-Info:
	xCGf5tP5R6Qa9bqvXGdg/O6aF1reNcptEE5cbpOQ5A5vtmVhKl5evvWw9vrbBjk7Bnq17QklIFQuNwEDT927fzKE1IiA49yrmD7dU+2PbcphWEUVZdEjBHoUFRi5OvyrbaxUvKdEbXZ7DUvYP1pfSe/W/ZAju77F9IQp7VEXwNB2401ofH9oHp8C4M4AcviEg3PyO1ucBMvSuQRaz6Ly8Sev1naIP63BYYUeTezYlTC9DTrPULnbUiiJbFcBKeBC8LSjw/aaaXFk1P2qCGWZxsa2DghOtEu6n28xH41hJMncD3C/MVmzIt0/eXCgB1eRy7qQEHmkN4tgaue9OVfGHt9DK8LnMhTA5t6y3QTet9DzdHWNBEu4ig55MH26OJMwJis4xmuLeZLH/U6V1rRZFubuCYVwP8djHL4a0Xz3tPp93rSrnQY0uvsIgn7I8MwLFr++Pg9b3BaWID5DHbOpUoKELuMrZGt7WtWgBeKVtLVRGtnEIo1dADh1R1O66Pm1rc0MfvzymtNw0CdMuXQH2oguUG9A5ZR80itFukE9QhJgIUZrbITj3nN/x9oKn0PTQvtYqgFU7ebeXqFIqb+3rmy5OJEts5gQWDA1NvszbO7i9gz5uFy/2DhnqVdfFQ8N0vJTUmpJcWt0qF5DLAWAHgfLab9LgYUsQMDQiblEl4L2T56hTp2N0S71AunjRnSRmAF9xON9MmtY7qGnzhUEMcHGOSCAvnK1NNbouKQWjxA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(19092799006)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkVMT3U2d3N1MnJFWmNyQ3YxK3NhUFBwR2xKUU9YS1NaY1ZESDkvV3VDaCt6?=
 =?utf-8?B?eFFxTjhIWVhjai9NV0hOcm15VXFab1ErZlpmTHI4d1djZUdvY2JORTBjbk9Y?=
 =?utf-8?B?VGNnRlhjMktZZGRJWUJxMEVhM2JVYm0weXZRR2xxVVgvSFFtN0ROOXoxOCty?=
 =?utf-8?B?Q3pNc2tETklxS3lwWWJ0dDRTUzd3VTVXcWFKak1pVzArU0l3RFdabUhZUFN1?=
 =?utf-8?B?OVBGSGF4L3dvQ3JwbGJtYndLSkVUaFJDKzNJMUx3U1NuM1BpUGFMaU9OVnpR?=
 =?utf-8?B?YnQyMzE0cjl2WnBPb1RFOGQ0M2gwZUZKWGFzM1Nqa0cyT01xdnFzblNldlhZ?=
 =?utf-8?B?by9oM1QybEtrVFJZKzZvRVVNbjdWTnVUQTI4aWJkTTF1ODhLUDlLaTh6MnpS?=
 =?utf-8?B?MWdCZlJaem1xS0JkTDg4ZWR6bml5cnZ4MHJpTThuNWNlOHorYzdGYURsQzM4?=
 =?utf-8?B?SC9HRFIvaDhkbjhaczduWmVlRXlmNnFMcWFJeWxRdFNpcEhDUVBoSzFsRkpG?=
 =?utf-8?B?Y1padm44K2pRTDFIM082bVBFWnFBSWF6NlJ1Y0JNaG9RaWliRjRYVzRsMTZO?=
 =?utf-8?B?RWlxWVgvYzFjWis0NWtheTlBZ1U2UW9EdnNkM0JFSUZJdzRWeWN4OXNhQWh5?=
 =?utf-8?B?RGUyQUUweENiRTUwZHBLbzZjM2JOcC84YlZGWFJseTlZalJ2b1d5SllxQTNV?=
 =?utf-8?B?VjE3NEl4RzhMYlYxMStPUS90NzhnR2dUYnNnQnpmaUkwSUoyOG5WSUtVNU42?=
 =?utf-8?B?ZTd6QWdrdU02bWlXTFlGV2ZMMHhNODgrdFNxTHRIZUtMa2JKTE1DNkt0TU1j?=
 =?utf-8?B?dmtpUmlkZlNWTGRwYmdGYlhaRXRLdmZQSk9yRzZheERPcmJhMFdhcW1SV2Ns?=
 =?utf-8?B?Z1dOM0lWSGl2VEVkU0JGZzlUTkVWMENlZWNBNWNWdHZhaFpudWtuUWJZd3NF?=
 =?utf-8?B?UFQxOHV3RmdKZVlNT1A1enovNko2SG5TazljWGFvTnlXeSs4cktjTCtWRTlU?=
 =?utf-8?B?SDJkSXZIQjFrSDJxS1FOL3NPNGZENjQ2S1BPcFp6NEFTV3dFcytYaHp1bDN3?=
 =?utf-8?B?MGFjZUF2VzBBSkNNVUtVR3A5enkvYWNnYmNSSUFiMWdROW1qcThtam5HbkZp?=
 =?utf-8?B?WWlad0JIcXA4S3p1UE5wWFR5MnJrNStDQ0tIME1zaHBCY0xBSjc4cGszTHhI?=
 =?utf-8?B?UXVxSVJOb2g3NGZnMVFjRmdrVWFDbiswSElveHRPRUxaY2c5NHNJYjBuNG5v?=
 =?utf-8?B?Q0pmRmdxZVljU2t3L2FRWDhsbmlKT2R0UlUzTitlTks3cHd0Q0tPMDZvM1E1?=
 =?utf-8?B?aHJBR3ArbmFoTXdkTzR6aEZEWUNObUVCZTNyLy9vdXdNb1ZnLzlGeUNuZ3pr?=
 =?utf-8?B?TDlWMVFYN3lLMUtKQ1B6YnBqTDhtR25jZFhhS1dzVTJwamE2Z1JyNmtUTG0w?=
 =?utf-8?B?cXdUelB6NlpiL0s5VWRxcS9QYktlaVAwU0F0UjhsZllMeEVKaXBabzhLZENB?=
 =?utf-8?B?b1NMWDdzNEtlWW1sSkJnU3QvemczTjlnd0RnMnNhOGtlZ1J2cld0NmxRN3Av?=
 =?utf-8?B?Y1Mwc0I5dXRPc0EzS1BPOHl0NWFYZ1Q5VFQrTWNLaXY0TXdmaDlTbjN5NzRI?=
 =?utf-8?B?U05JNzFwS29rUm4yZm5kV0lHRGFWMUJkVWM0UUc4OUVydnBUTnU3NlRUQi8y?=
 =?utf-8?B?TmYrcnZhMDY0RFB3dTc3QjNUdXlGclgrYzRYWVlvWVhLZDBQNjFCeHhESjBm?=
 =?utf-8?B?R0g4TWRwbmNGNFZEcXorV3M1aW5MU1BCL3ZQTUo5RENnQ3ZzSVQ1L0VTbzFq?=
 =?utf-8?B?OE5SR3NITnlUdTFuNXRxZ1FIQXk5RElDSlV4L3g3THhwTU4ydnNPemZhandJ?=
 =?utf-8?B?QXJRMXhrQXMyd0hvZW5lRUZRWjR5enNvMFdrQXllQjBydGJXbENMY0w0Um10?=
 =?utf-8?B?ZDZlcElnQXVUWVdLTHRJVDZjMithNzQ4WHFwZW83elZVUnIvcGpBcXY4czFI?=
 =?utf-8?B?VDRDcVlWcHVsaTFUcTFwZWhzSEFKL09mMTZ4UEZvQW5NOFZ1T296OUUxZkVK?=
 =?utf-8?B?VVJYWDdoWWtrRjc5MlBuQW12Z3pPQWVRVUhzMFdpZFZtWkRESmNNc2ozVDl5?=
 =?utf-8?B?aWQ1VjZjUWtlek9Ed2VYVm14ekV3SDhnUzNzanlVemM0TE04QWlkUkJGYWdo?=
 =?utf-8?B?WUJ1WWNkb3B0SXBqMjZPTTIwOFUyMEU2V1daOWhUVkRsZ2dnUjlVVkVuYWVX?=
 =?utf-8?B?MkJrR3hZYmJZMjRjM1BvVWlxVUxMRFI2aFhKUytRd2lWWUFKdkRoeWlaenRh?=
 =?utf-8?B?STFYTVhadGtBWGNvbXA5RlZuQ2FueFhlWjUzekdGckJ3cThkKzdzQjVuUFQw?=
 =?utf-8?Q?OPlY9Kv95CwIHzOY=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0c3bf73-6709-4ddb-5959-08de79e21556
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:35:06.2922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +EZ0g5irlcO4bH0erxdQKoM6BwZ4lXrBL6/cVubjfJNyKZ8MTWYbG/aPeuVC4Vw7DXuPmiV2qtJuEUVY4fFvgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10522

Add display controller and LDB support in imx943.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943.dtsi | 53 ++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
index 657c81b6016f2..9a91beef54e86 100644
--- a/arch/arm64/boot/dts/freescale/imx943.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
@@ -148,7 +148,7 @@ l3_cache: l3-cache {
 		};
 	};
 
-	clock-ldb-pll-div7 {
+	clock_ldb_pll_div7: clock-ldb-pll-div7 {
 		compatible = "fixed-factor-clock";
 		#clock-cells = <0>;
 		clocks = <&scmi_clk IMX94_CLK_LDBPLL>;
@@ -174,9 +174,60 @@ dispmix_csr: syscon@4b010000 {
 		lvds_csr: syscon@4b0c0000 {
 			compatible = "nxp,imx94-lvds-csr", "syscon";
 			reg = <0x0 0x4b0c0000 0x0 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
 			clocks = <&scmi_clk IMX94_CLK_DISPAPB>;
 			#clock-cells = <1>;
 			power-domains = <&scmi_devpd IMX94_PD_DISPLAY>;
+
+			ldb: ldb@4 {
+				compatible = "fsl,imx94-ldb";
+				reg = <0x4 0x4>, <0x8 0x4>;
+				reg-names = "ldb", "lvds";
+				clocks = <&lvds_csr IMX94_CLK_DISPMIX_LVDS_CLK_GATE>;
+				clock-names = "ldb";
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						lvds_in: endpoint {
+							remote-endpoint = <&dcif_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+					};
+				};
+			};
+		};
+
+		dcif: display-controller@4b120000 {
+			compatible = "nxp,imx94-dcif";
+			reg = <0x0 0x4b120000 0x0 0x300000>;
+			interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "common", "bg_layer", "fg_layer";
+			clocks = <&scmi_clk IMX94_CLK_DISPAPB>,
+				 <&scmi_clk IMX94_CLK_DISPAXI>,
+				 <&dispmix_csr IMX94_CLK_DISPMIX_CLK_SEL>;
+			clock-names = "apb", "axi", "pix";
+			assigned-clocks = <&dispmix_csr IMX94_CLK_DISPMIX_CLK_SEL>;
+			assigned-clock-parents = <&clock_ldb_pll_div7>;
+			power-domains = <&scmi_devpd IMX94_PD_DISPLAY>;
+			status = "disabled";
+
+			port {
+				dcif_out: endpoint {
+					remote-endpoint = <&lvds_in>;
+				};
+			};
 		};
 	};
 };

-- 
2.51.0
