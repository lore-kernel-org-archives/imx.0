Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013015.outbound.protection.outlook.com [40.107.162.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441414D2EE0
	for <imx@lists.linux.dev>; Mon, 11 May 2026 21:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778533531; cv=fail; b=rQ4nQIOWwBX1XFqwjE/bjs7GzVtIHInGph4riNhtbIPgUhRNVDaxsa+Z9e6FiRae0ia9zA+bdFPXaeB3yGtWlQexNOW/sBMfP5ODk/iYgGstQJ+wsUS5LIu218Cdz1sew0WdEzcW+zXFc+hEnzmWs83n1T5lILG9iBSAKBBGvI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778533531; c=relaxed/simple;
	bh=f3g/uVYR0fR5RkQw+9HZXBWywGq6hGMQ8GTJJCYxX10=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=oWjeCZldBSSskLbJ+brMVG3NXjv5Xx0jmgyt7423Uu4UaE+KK73agYvYAMiOW2VK7/BuGJvT8kPjOy6eZNI6T04mwxEskyIKA9Imgz7Vs/4LDsX+2snTt4YdVumax+4ijzPU3eazxdtAJkmPWK2f/4QXyIJthytmxHaxBRwfJUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GyGcELtK; arc=fail smtp.client-ip=40.107.162.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GyGcELtK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9p0QHwqeHnxmUzyFCUMMUa1a+OHSxPZ9QGOlac/lClBpdr5PFzCZY3G3pIOwVHbOyUlwv8/pOQw181wWdtCZj76cnRddWq9e951n1qOsOV5m6b5QR6PA0ChMIMOJgShzox6Vr6bgy1qaf524S2u2MouRbruX0JZDtSMZU/ls/QFsmDjkagBPCe1USWNHw3oahI/MoGVrujFkIcGT0BwLGygJZi3zbKc94YDx1jOWUs5NXXZhE3i3Irgg48ud7eTFNdLLVQncHYQ1gnyDvY/Rnfwb4eYGUePBV97VVLWefqeL5r9aFqWzH7XzaM9U+z7xX4mX1lgmw1VHvZ1bnx21Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uW6eHmIZQCf/kvVlO6H8DMFaQ00Sxwm2o01ylJhZQR8=;
 b=Myzo4RNKIkHqjbznKjkZZzz8UuADZdL3GUFuC1ZDU7MgScYysbQ2RJA8chv3mmq0wjxxQMW+PaP4dgD260zitk/E85sy2dpH4JQ03hYuD6/aeOVB0B23Yw4YRvpV1PpwjigjFNmGPsdxKm8TzGXxiNbSqopmUTca33HpQj9Yjjy8CGCWepJROzXheu7b7T09up1pt38qdaptudcovmhpk6cgg1FMaKCkVl9axkDYVaGGujm1N2csaWxrrZ0iGJ4yNlHh2HothanpeZkOfsi0t5KdPh7iUhnXnABDCdfSqDqTHP5O7reh+3BP+PbUT57UF0qaEsX3K9fQx866gIcNYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uW6eHmIZQCf/kvVlO6H8DMFaQ00Sxwm2o01ylJhZQR8=;
 b=GyGcELtKZmgF3VymrOPIdXaiDTRG/8MZlbLoMQiiG5iLn79+C3Uj7ItQN68yVHrFuTKpGVrXxHWZ8yKz8GfdLd3aEbPomb1DZs3jY87blhzbQsaFmE8QQJvNqOBsoGyGE1/YrtE/YeidOuAORYEzwo1QpctVvy4jPN6WDlWevRKVNnuLVaLArU8FStzr8FIawiubOT7tU1TsAex6ATQdXG6PaFR5uaSOM37lKDtcWe7hg9dBVamAXsTI69WqNH03q9WiyNEuoo8RRBat7JuYZpUBx0096MMi042SFJPblkwikk65q4oUVAHAbY/0CCNGhfLXigDVd154Htnp/SZNzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9155.eurprd04.prod.outlook.com (2603:10a6:102:22e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 21:05:23 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 21:05:23 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 11 May 2026 17:04:59 -0400
Subject: [PATCH 4/4] ARM: dts: imx53-ppd: add '#phy-cells' for
 usb-nop-xceiv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-b4-imx25_dts_simple_warning-v1-4-01b855a5ce25@nxp.com>
References: <20260511-b4-imx25_dts_simple_warning-v1-0-01b855a5ce25@nxp.com>
In-Reply-To: <20260511-b4-imx25_dts_simple_warning-v1-0-01b855a5ce25@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778533510; l=1130;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=f3g/uVYR0fR5RkQw+9HZXBWywGq6hGMQ8GTJJCYxX10=;
 b=jSCm1oueHsBc1uUKB5c19PYH/azf3cxGqFKEDrSTCltrc2CIsY3AG8qm3uGPk2Pu0Bc3OZNvP
 k+xsF/sqHl+AKyBZ5hhdxKb8nW65A8q7EGuYtuyITtKxORBHge+FOAN
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SN7P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9155:EE_
X-MS-Office365-Filtering-Correlation-Id: f4931d4e-8a33-4763-5ea5-08deafa10469
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|376014|7416014|1800799024|56012099003|22082099003|18002099003|38350700014|11063799003;
X-Microsoft-Antispam-Message-Info:
	rLYZYih7Yt06CTtA69kH9SJMrgMenXkgAKFlAAtLCvvt9m1fpj4A4xs+NleiZY4lO2AzQ+qVOtk0GCzza/R1TXPdDo6khgJ7j9FrMK9tMl28foVdSMXQY8DkxRkqYx7QNoq2sK+uma8qLORb+uXsoypbv2Dstf07sHnG+7jlbdYCPBVyq3sT5GRtW9//PO0JubBcbEzmIcRC/lgv2qdlUfqwo7ccZLlqwRRwf4OG+KN2wdmj5JuZ0C452nv5ItUWyqc2RU9sXduYT0WE1ASE4MY1un6+IAUdCMrPPBXUsfU7H5RjIApEwfNBOSn3KxH9yxKlDlUZvQJ5YTm3iCYRWku3O0vM6uLFSgW/By3aqJe3CJ4Up/aMx3U/kh2RK5w19alfva6V5LmzraUoxULnE6/K8zXGkyADv5yuCGEsSPOHdxTCTGto9xfutSguZv7RGEUKszB8Hw7wJvwTITJzCt4MZSOE+9RKRlvU1kiLGMA/uqLODZe94bk71gwr1/hTP3UoP9bt0aK6U47I7AZiG+YTT+KhnpVO/OBMXiiTxgaHJD9y8yYgFYX0NGVXePkPV0XHb9y/J0oPmAyWXUpPB0OKUkVGhoAFk28svlZXZsaGixoC5+YcpPMUfxzEY51XTMfTw+TE6OThgwEsnOevkG9eqSGgukBM2/pub5zILitX7IUVNq0desyBVw2h5a7NRXc+/8yYwTV4nEdZCly3+XF61Ia0M7jpaQmKa88FrSvXx+zdFB54111rLGPkNNGj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(376014)(7416014)(1800799024)(56012099003)(22082099003)(18002099003)(38350700014)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUZwYUlWci9pWm4yOFE0RjNjTkIyaHg4UUNNTm9BWEU2Ky9GVUlmUVFMZk4v?=
 =?utf-8?B?Z2pXeFl1QlFHSWlGVlcwZTJTbzNqTEFjc3ZwblNudGdJNWxtWittNnByMVVH?=
 =?utf-8?B?ZlZoUmdma0ZFWjhqKzYyTkJVRVNwZFh5L3pnckw4RFdyNSs1Zmd2eHJUOXZo?=
 =?utf-8?B?cXl4UXhLYTRLRGc5L1JWL0hLMXh0OVlaNjU0RHJrTHBxYWQrYjk3MzN1WXVz?=
 =?utf-8?B?ODJ2S2xhc2ZSaXRmN2JuQ1FUU2hWa1hQRFZpWTZ0MmZrL3Y1TVJuMnVkNUxk?=
 =?utf-8?B?cmwyRDZuRGVCWHpNc3JFRzRQRTU5ZnU1b0VXWDZNVVNRWWJuYVUyeWFKb2pH?=
 =?utf-8?B?UGRTdHJwMExkTWlKMUlMNkNaMFgwUW5ydVBpa2xyTURmcXUzZlliL0dnUDk5?=
 =?utf-8?B?eEkxdVZ0Nzl5MWF5a3NkNDFGNU5McGNVOEhaMlJMNnBQTjZGZkxIVU92a05m?=
 =?utf-8?B?TEVUMXZJaUhmaytKa0tLVU1KL3BDT1YxZHJXTzFBVDFHSkhsM0FQWmZwM1or?=
 =?utf-8?B?QVQyY1Q3WGJ4U1JKTkNZT3ZpaVpubXlML2FLaUtQRnlqSEdjQkJ0NWJ5Z2Ir?=
 =?utf-8?B?TlNiakVyd2o5Si96WFNjSDh0Ny9pdUdYODVsbnN2KzdBc0pnd2g1RkxnWnh0?=
 =?utf-8?B?OCtwTlF0TTd6R0JBMTY3d1d0MVZVUGhmL2xJUmhTaWMyd3RhSE4rL0NOcFhh?=
 =?utf-8?B?S2lhVk5JNG1CK3RQWUZjY2w4bmxGaytZOGpSV0ZLUXRnM3o4eDZDL1BadUxB?=
 =?utf-8?B?OXNYb0hTQU9jRzNKVzZhaFJGMkRIV2hmNU9pQUo5a01uVDlMQlc2RkpOZGs3?=
 =?utf-8?B?QXhZZzVJOFdwOGJDYXl3UlBJWlZJQmh6WFpWVTdHTlViVHN4OHZMeVFJTUJx?=
 =?utf-8?B?MC9MQllXdngzZDM1NnAyaFVoQ2t2S0s0RGxWb1VIdEMrb0pZZ2w0Z0krOFdz?=
 =?utf-8?B?QzQzS1lJNlpVRjJpeWw5WnBGclBSRzJMSDF5VEF4d2N3d0kzVkwxWmdRMkZs?=
 =?utf-8?B?S0ZMRUx4ZTlwaXRmYldVSStjaTExUG9ELzBoLzVWY240dVRBR2YzZ0tpV3Nw?=
 =?utf-8?B?L0RTamxNSVk5OUYwR2VQUjdkcFhGb05EKzIvV2h1blNhYVNyc25iUHlzdThY?=
 =?utf-8?B?SnV1RnpBQnJKbkNjRkMySW9WbVZ6SzkxbDJBRVVUV0Y1d1g3bGNVbzJzalM2?=
 =?utf-8?B?eDYxMG96UDlYdmFtN3pvSXhLMmdRYmhQbkJrb1NCZGNvTmtKaXplK09mTDRP?=
 =?utf-8?B?MDJ5MkdRb2dldlg3Z0RFZ0dtNHdFYjJscTVOWU9MMExDRmVkQnUxVkEyMytK?=
 =?utf-8?B?bDRqS2pWcUNKc3VHQktuendwUUc3S284VWhwOHl1Kzk5c2ZTYUVicVpBNE1H?=
 =?utf-8?B?cWxDM3hJVWVqT2tscWc1b3pOcmxIbVRFdDhOQlMrdWthN2ZJcm9FRXJXM3JC?=
 =?utf-8?B?R0FJTklUei9LaTBDRDJ5QXVMbTlpdklaNFZuUm9yU2tDaktabGpTSWNyVnBU?=
 =?utf-8?B?cU9sSlRRZm1vSk1BY0JWWkZsMWFWa1puTXJVWG1jdGc2Z3B3ZmZuekkyMGti?=
 =?utf-8?B?RWZ5Y0hSQmxEblVGcDFDbXZyTmZWbzhMVUprZkxQbm95QUY5Rm1mMDVISHZE?=
 =?utf-8?B?R09mdk9RL2F1Q0F1ZG41c2F6NThEQWhxRjljL2JGME1iWEVqbjVRb2hJZjBX?=
 =?utf-8?B?eUx6ZkVmZGZDdEhobHhxSkVHZlhKTzRUTXROR1dHVVJUUVJxK0xDTFdIZFEw?=
 =?utf-8?B?RGxlYjdKWndNK3lhSTRnV1ZlRUJGZHlXSDRpNnJSUm12RnJsTTh6QTlqMENU?=
 =?utf-8?B?TGdtUzJFK3diVUdNeGgvSVRTUVlNbFpDeFExeXZNVGplVDhMeWl5N1ZvVGp4?=
 =?utf-8?B?dmNBL0ZBeHZhWTVMbkpOV3YrNUJQZnNFdE9rWEM5Z1UrT2dIcGZnTEhpOTlT?=
 =?utf-8?B?M2xCNUxBcUNQK01WcnJUbG9ENTlKUGNMcXA1TFM2ZTdWQnh0V2FSdi8rcHMy?=
 =?utf-8?B?U1k3cElUbG82MUsweFdpVEdKbFRKby95K2R4R0RjN2prN0x3dlplT3E2NVNM?=
 =?utf-8?B?ejMxUTdVSENCeXlNYjdHS1NYbUlGQ0J6ZEFFNndYVFQ1T1B3UXBLbkZSN01B?=
 =?utf-8?B?WXI5UWpXRXBxQThoYmp6Wkl5RHdTbWtJNlBOTmFSQnRBYmZUTk93MGwzK0tm?=
 =?utf-8?B?MmNOQzJpaEtiSk5GOWhoSlRQU2ZRM0x0ZGcxUVhYVFRsSnl2ZXI2b0VRbFRm?=
 =?utf-8?B?bW81aTJFb3dlU3ZHci9zWm5lUGk0aEYyNTZPM0tGbnZrVDBtK2JTUzZvWnlq?=
 =?utf-8?Q?ULGuhX7DynqZ8rr8CW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4931d4e-8a33-4763-5ea5-08deafa10469
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 21:05:23.3185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DpeVxgVeCsO749A2FQgsPrVZp60ti6P4ae/js1uOAe1bopk2lu2993ljyUNSY7ZqxaxnZXVW5SOIyIoISYn3Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9155

Add '#phy-cells' for usb-nop-xceiv to fix below check_dtbs warnings:
    usbphy-2 (usb-nop-xceiv): '#phy-cells' is a required property

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx53-ppd.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx53-ppd.dts b/arch/arm/boot/dts/nxp/imx/imx53-ppd.dts
index e45a97d3f449de9a82ecd9171bcedb0f5f41346b..f0fb88c14171919ccdd68a90c453a5d2dbaa126d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-ppd.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-ppd.dts
@@ -258,6 +258,7 @@ usbphy2: usbphy-2 {
 		clock-names = "main_clk";
 		clock-frequency = <24000000>;
 		clocks = <&clks IMX5_CLK_CKO2>;
+		#phy-cells = <0>;
 		assigned-clocks = <&clks IMX5_CLK_CKO2_SEL>, <&clks IMX5_CLK_OSC>;
 		assigned-clock-parents = <&clks IMX5_CLK_OSC>;
 	};
@@ -270,6 +271,7 @@ usbphy3: usbphy-3 {
 
 		clock-frequency = <24000000>;
 		clocks = <&clks IMX5_CLK_CKO2>;
+		#phy-cells = <0>;
 		assigned-clocks = <&clks IMX5_CLK_CKO2_SEL>, <&clks IMX5_CLK_OSC>;
 		assigned-clock-parents = <&clks IMX5_CLK_OSC>;
 	};

-- 
2.43.0

