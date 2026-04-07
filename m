Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011010.outbound.protection.outlook.com [52.101.70.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3BA2765ED
	for <imx@lists.linux.dev>; Tue,  7 Apr 2026 14:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775572358; cv=fail; b=tQVf8tVtJRKeQ3sNAMCQ91mfrDgLzNUVu5vFUU94s4fCpNSs/PLCGhgEOyN4E8zYvN45SA99YY0S8Y73lSbGIB/DpXR3ZrdzUAvPHXsuPy4BjO4Vb13Tafd8/8jbI/1vQOv2S4zyES2btHXwGHAp6Tc88YlURcPxsyACbhPH1Xs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775572358; c=relaxed/simple;
	bh=VsVFP3hXheZa8n1Yz4ck+DU1kfUvdbHT2A9XjVFkrrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RTWCBeBods3/dxSStVQZYYfYQ3H/rCo8EbugsZkNPnAMYnFv8tSCEmTeAkTeoKTQXk3dMqOIdN0DooAkkbKcZK+QgN62Uv+WFvPFXielhX/MS+y5gX30+SqKpslyw5d0RVibiiQEgz+GinoU2bvzWHFcle7wJ5Uy+cz7JFn7ta8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qWK2P8xt; arc=fail smtp.client-ip=52.101.70.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qWK2P8xt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXgF2pT7rHlaC3P9bXwhxuK2faF0+83uqptJ9ospBiaU3ziNUpojkSb3J5QOTfFvWBdTOQbCGcl4rYTpUWxbgsvUFEINe4w9PJJ647YdmKxhTigKZPUQNyU+nAMze9ADEWS+y+4exEEIOSxTc4lecCQDAKQ5dmFrO3sDLi69j09q+f88SavczV8zjhHBO5+8nBuWAu+gKVWtdTHrek527DUa9Vo3uFobMpplcLDUkF4FPHT0OTcLvOmoP2TV4lQ97sZUs6rKI5fjp9QYkh10n3fx7TR+4zIQRe2G2tKC516BomXvYYkBBEbDp1pLk/mprH6P+imfBCbuaQh5Hv/ubw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9zD7Cf9L03T4wNI7b1CnPBJO2nihsdG6OtSNyiVOSE=;
 b=scjwfGHNKoHsqGeqCZKtSO2NysE9uND/fzLN4cmUiKsDBq9MajaAF99dhDlyBdR1HERj2/5FvoaoZ4+f3k/KnAjb7GxKBFtKwitf+oMJ6/Cca7fCFwnW4T2HbGlAxHAv/pCcXLvEfStHrdso8cWCewtmCBKmsA9atUuh1/ujfTLGxIKWqaBBQdijGLeqZFVRSaUu7sKtWTHbJgwNSuHodFFYiNe32c/g+bDTASM0RXb5A00DUxJQLLXxFfjtGfdk4bcCtsI/5kewD2Njd99ORa+s3XdIDgn5QVHveKBDae00PE0a+h2Am9AKA7I4MDtKPtGDG44qJFGrNFzIYtwbNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9zD7Cf9L03T4wNI7b1CnPBJO2nihsdG6OtSNyiVOSE=;
 b=qWK2P8xtMNYjlkUTauCLjqA0yTonjrcx9EdVp2UCsUc6+Ah1cOqg9led8zZ4GixUUvoVwLSKXc2wCKqXfQm+Iv2VlgnR1JqSs3oDpn1CtWhOLXgEIIQzCRFE65U8siW49Pr+8Up2JZhggtD11rmxAKBJdLThwc6qWu4peJok86mVcRsmcZVUZrwonFgstUC5OP+UtVNzahx05xC7vgE5Ydi3jdNF1wt2Qe93nlOIq7T9/aijgMcm9r2ADOul5xBM2Z0ycOhG24xOKMLWAbVAiy00Moe/CAJhZNfIZBtOLGx4kfUt6A+/ivWecr7vEgb47k2R2W9z0WopnInWXpuYvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by DB9PR04MB9500.eurprd04.prod.outlook.com (2603:10a6:10:361::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Tue, 7 Apr
 2026 14:32:31 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2%5]) with mapi id 15.20.9769.016; Tue, 7 Apr 2026
 14:32:31 +0000
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
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Ying Liu <victor.liu@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v21 7/8] arm64: dts: imx8mq: Add DCSS + HDMI/DP display pipeline
Date: Tue,  7 Apr 2026 14:31:31 +0000
Message-ID: <20260407-dcss-hdmi-upstreaming-v21-7-4681070ab82f@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260407-dcss-hdmi-upstreaming-v21-0-4681070ab82f@oss.nxp.com>
References: <20260407-dcss-hdmi-upstreaming-v21-0-4681070ab82f@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::17) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|DB9PR04MB9500:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f769975-be81-47de-55e3-08de94b2808f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wpIKPqBpN7lojOc9jXA0frjG2g7A7acM/92R718rA8CQGFmLH84Ro8kKWaV+8nXc70itbMyJu9ToY1u3ZnEeTaSJNLlwbJMwP++b6h1Apyjd2stv2ZB+jlcjH87YNuMClkxnD+a2THMJ8qsqO+9OQ7h0xJcuGs/fJEY/wcl2Ur9sMdVD+So09rq3GH0P26qDyRAlOeVR6D9ej7Q95krFFw48GHnm+c8Gby3CI4O1OVYVp4v5+YHhaPfQQh0Q5F2AasTI4bq3mVHi9xLM+de8Ogf8Dv63c51FjFfq8dDQfJZKUfoLODNkOQonYhkeiiJbNSNcNWJ/0plHhEQVRjSBLHSCFFn1YRw48uelmYza1e1g/pBnyr2LltxI1jAaggToBtkC54sZWDYxEDnlJypuohDp0TROygn9hJbxVNRi8/LcddAZedp3cPD7dmLJg1hHt9vKr/Tc+GM2WGN3IG9BdJjnwcwtFy7TJPZeZNYyBt5Rf7ffqWcXb1meutlw7s9K6lVwWZw9tW0+IsVqHolQS1JkFAeVRT3KVtLoaDPbeMftenMOrz2vbpZ8UzyNBo21Bn4t5YmVxoL18Q/D7LpHN3iz4qupwdFNjuR17r/HAXTK7D+g7BU3VN9MHGHcw7B1UIF4CIe/aVjmY9ldblhDh7ssCevp+B22edvL7znMWDSYrs0GNfViGzCaqQVaI8IC06EUj1G5gIcmQ3RcJfkV5cT78TwtJeXycozRriXRc0o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGdrNXRRZkpYQStnemxRdEhJMGNvdCtYKy83Qm9TcnAwRWI1UlNEMWhtSGR3?=
 =?utf-8?B?bXhZOXFRdCtIT1R5VmEraUZiRzhNZ0F5eHppd2dta05MT2FLVlNDZDdrU3hm?=
 =?utf-8?B?S0lUYVg5WVdod1orQ3VZUHo4aFNxUmhmaCtjZFBUOEFDMTRJWkV4L0szTW1I?=
 =?utf-8?B?YURwcjg1eE5lS0xkV3BMTEZLTnd5NDRIQlgwZUdDeUZ5aStaUU95bUlsV3R3?=
 =?utf-8?B?RlVLTUhmZ3VxODBQMld4MGFlQ1JVVWYvNlVTT1E1cG82ZE1Pd2ViWTJzRkQw?=
 =?utf-8?B?Vm1zK2RoZzUydTl1ZXA1L2lKT3JkOWd5VkxPcG5ncSt6WXdQUi9VbG9oWE1Q?=
 =?utf-8?B?WDZrN3lRay9ZcjE3eStxMmJETjhMbi9KU2VZSld4M3hYUHlnc0MvbzBwT1hp?=
 =?utf-8?B?bWtVQlgra1NhODFFZTJ1dHQrSXl0OEJXQTJXcjFrNWprUlp6QUxWWGl0TUNh?=
 =?utf-8?B?UWRqQ2xZaHpXZFZzZ25LY2dKSmtURUQvbFdBVmFhWmF6SDhjY2hKVGJsLzV2?=
 =?utf-8?B?OEJma1FXQzk5UnJNUHljMXBuTzJQZmVtWGpKbDFLUUNPd3puWGd1NC9memk4?=
 =?utf-8?B?cmFEU3k1SE1JaFdXQTZINkEyQ2hRYTlLV245VGZWVEN4WnZlQXhaUGhPRXB6?=
 =?utf-8?B?VVBvV3Q0OTlGQytkOTFHb1FYSmswTElyNC9XeWwvWVNSZzJ1SWlLWUVNYzIz?=
 =?utf-8?B?M0lvbE9KUlZJaVNwQ2U1YXhtd0VaNU9PZXJZaExOYkRPRWR0OEZWZU0veTZz?=
 =?utf-8?B?YVFrbnlnUmV6ZjBSOS84M01VUlo0NXlLbGRYdDVSNEI5akxUYUJvbi81Z0l6?=
 =?utf-8?B?TWNKTUdweEZpS2o4S2ZFZll6UlZ4WVc5RVpRTXRkR1pIL0FCRFg4c01iQ09G?=
 =?utf-8?B?aE1vczRmSWFqRlNEKzZ0bEdGdHRvTGJSYTBQakZVVUcyL1BJWGx2cEh5NXVl?=
 =?utf-8?B?ejZJUndpdDBaaHdLajBvL3ZVNHltemEvalhoai94ODkzL0tYL3J1eGMxd1dx?=
 =?utf-8?B?YjNsS3BjT0NSQmI3WW9EbmlQU2dRUjQzYWxTa0ZIMjNwNDhUaFd5bVFwQlA0?=
 =?utf-8?B?SjdDSEluSXRxMzlvbTZPVXk3VGYyeWFmMHpOYnUvcUJaZTVDemV1L2hEdW9C?=
 =?utf-8?B?NFdxalhkeTJ6Q256Nm4xWE1wT3RBOHdjREJUM1dxWTlPQko2bzJhL2RidTZI?=
 =?utf-8?B?WHRSRElwOW9Ibk5JV3AwSHRZUlNHMVhUZUpMLzRNWVJMZ09POG1kRG5WaHJi?=
 =?utf-8?B?bG1ZSndiWHZiVXdhQ0tCc09QTlBBVFhlRWt1ckNacXNEZkFETnBXZG5PR0k2?=
 =?utf-8?B?UWhDZ1NUdmdwSnJBZVlJVnVHRGNYQUZWOC9yNFJKTWpxQTJwTmRWaVh6bGZT?=
 =?utf-8?B?U05Mc0pBNGJEblZ2VVdhT3dYcTgrb0kxOVF3UFVlSHYwYmNURXQ4RUtjRWNY?=
 =?utf-8?B?Zysxdk9oN2RObmtab05nejh5ZnFCU3o3TW5jS1dsRWpEQlZHNy9vdVhWMXJL?=
 =?utf-8?B?bUhROHF3SkY4aXRxY0xYRzROS25ONU1BYStQNVN4REdqZFhINFdiN29ZanMv?=
 =?utf-8?B?cUh3dVN1d1I2emprd3IwZ3FVSFdwWHk0UGUwYmg3UzRMVFUrckoxRmdOZlhX?=
 =?utf-8?B?TEpYZktSc2d3S1MrWlZ3VUtmZ3ZMZVFObHFwVHVHWStrR3NwWDc0Wk96M2NS?=
 =?utf-8?B?N3dNa0VaTFliVkw0dEVmVjE4LzFEaHhhUkpuWmlYSU5MalZVWjE2SGVRa29Y?=
 =?utf-8?B?WjF3SEFQbTBrS1NhUGNlK3IvVmNaRy9RTTM1N2V3ZExOenhSNFg2RXpDTHdW?=
 =?utf-8?B?bTNUK3J1YzhMK0JHTDVpU2ZGRDdGL0ZEY00zUnJpN2NoakZhZVdoS3lrcGNz?=
 =?utf-8?B?d2VLUTEvNXR5R0pzc3NTQmRST1pJL2V1SHVsSFlZaW5VWVJKbXBuT1hlc2Jo?=
 =?utf-8?B?TldpM25ObmJWSDY1bGhFQnZ5TkFxVGc4YVQwcmV5QTVkb0xiWHFyUWFraUFr?=
 =?utf-8?B?NXdkcVFlUlFOMDYrMmVud21DSGc4Nkk0N29sOG16Z2tzSmdzTEZVT0xRcisw?=
 =?utf-8?B?V3RKL095NFV6VUk0a0JlQWhIelJvTTNpLzdzWmtaVVFFSmZBTGVFZ09jN1F2?=
 =?utf-8?B?VmlwYzcvSHhkeHVLeEtQcis5T2QxTXlsek1OSE9heVJpa2czVHQ2R2w1aVF5?=
 =?utf-8?B?bk5JWVBtb3dzWUFrYUhOUmcyemUwNVVNQ3gwMWlmUk9KVDYyMXNwZkJ2d0Ry?=
 =?utf-8?B?ZGs3Y1JmMXlhYmxnYjNWeFhwbDBUVkYvbFlvTExxWUJmWThGcjBDNENJbWpR?=
 =?utf-8?B?cG1NQWc3NWZQalZoRGRIYkRTenVWN1FTa29XUE5ZVFFYYWNnVktjZzZuNDY0?=
 =?utf-8?Q?hgGSPa6l8Q0eMKys=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f769975-be81-47de-55e3-08de94b2808f
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 14:32:31.7282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQQ5STSykzMasUbwHHmg+W3Q++ltX9O7hT5Nltt/p+9VyrLfG1en42trzol6uF+ffe0MTfZfGn2+erwWzpdNgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9500

From: Alexander Stein <alexander.stein@ew.tq-group.com>

This adds DCSS + MHDP + MHDP PHY nodes. PHY mode (DP/HDMI) is selected
by the connector type connected to mhdp port@1 endpoint.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 68 +++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 6a25e219832ce..9d320881e2631 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -1598,6 +1598,74 @@ aips4: bus@32c00000 { /* AIPS4 */
 			#size-cells = <1>;
 			ranges = <0x32c00000 0x32c00000 0x400000>;
 
+			mdhp_phy: phy@32c00000 {
+				compatible = "fsl,imx8mq-hdptx-phy";
+				reg = <0x32c00000 0x100000>;
+				#phy-cells = <0>;
+				clocks = <&hdmi_phy_27m>, <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+				clock-names = "ref", "apb";
+			};
+
+			mhdp: bridge@32c00000 {
+				compatible = "fsl,imx8mq-mhdp8501";
+				reg = <0x32c00000 0x100000>;
+				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "plug_in", "plug_out";
+				clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+				phys = <&mdhp_phy>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mhdp_in: endpoint {
+							remote-endpoint = <&dcss_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mhdp_out: endpoint {
+						};
+					};
+				};
+			};
+
+			dcss: display-controller@32e00000 {
+				compatible = "nxp,imx8mq-dcss";
+				reg = <0x32e00000 0x2d000>, <0x32e2f000 0x1000>;
+				interrupt-parent = <&irqsteer>;
+				interrupts = <6>, <8>, <9>;
+				interrupt-names = "ctxld", "ctxld_kick", "vblank";
+				clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>,
+					 <&clk IMX8MQ_CLK_DISP_AXI_ROOT>,
+					 <&clk IMX8MQ_CLK_DISP_RTRM_ROOT>,
+					 <&clk IMX8MQ_VIDEO2_PLL_OUT>,
+					 <&clk IMX8MQ_CLK_DISP_DTRC>;
+				clock-names = "apb", "axi", "rtrm", "pix", "dtrc";
+				assigned-clocks = <&clk IMX8MQ_CLK_DISP_AXI>,
+						  <&clk IMX8MQ_CLK_DISP_RTRM>,
+						  <&clk IMX8MQ_VIDEO2_PLL1_REF_SEL>;
+				assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_800M>,
+							 <&clk IMX8MQ_SYS1_PLL_800M>,
+							 <&clk IMX8MQ_CLK_27M>;
+				assigned-clock-rates = <800000000>,
+						       <400000000>;
+				status = "disabled";
+
+				port {
+					dcss_out: endpoint {
+						remote-endpoint = <&mhdp_in>;
+					};
+				};
+			};
+
 			irqsteer: interrupt-controller@32e2d000 {
 				compatible = "fsl,imx8m-irqsteer", "fsl,imx-irqsteer";
 				reg = <0x32e2d000 0x1000>;

-- 
2.51.0
