Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013039.outbound.protection.outlook.com [52.101.72.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165AA3093B5
	for <imx@lists.linux.dev>; Wed,  6 May 2026 05:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778046686; cv=fail; b=uDth2iOJMQ+fwtb2EAXJcNvp1g5mNd4wfO47hC2BYqpxyfXO7ThP3amrgx0Rq4v/gmKHhzYSvTgcxUTUVgiK7uu3gM1QBOI64LV1uSnnR/CQaNoGaiw5j5MdxKuUGkTdwuO39fPfforcE84L6v2QEfK2D5d5ekr1kjyh08MuusY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778046686; c=relaxed/simple;
	bh=De+fPImLIuPNCx546sniVER25tGs1LxNRhqZSHswRnw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=opPbqo8Yvp1jG9bta/e8qb5qCdEO6Ugy7MlQYdMIvmoYVyoLm6Gqm9bs/lxt54k35G+g0wrmtWz0P0qI+544t/iNK6xy79uWLP6hrZelHAq9XdiJ82XU7QpmdtuJY8+x5cT/qfHtiArsaLVdrCiNoecpk/np0xGLA9lQr6Ica/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OYk2K26m; arc=fail smtp.client-ip=52.101.72.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OYk2K26m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVSinYMCr2xKWAmTv4PSuEH91TZNh5jYgdfnenx2wJ8zvZ+d55HDZW9kj7u7eHbfoQx8K+Q7X/pspM7dSLRRRYp6gER0TyrSnT1Piyu8+3AIRwKBkp+v97nCVKwuqHGUal15lTZw7IxrNlMb/xNeIkuvPpRdZEEYSujgIMqn1d4wkv+qhk3aVcTqH2RrAGWWnVXRXGTc/gVbNM3iwlVymlhESMRPodETlhB5gUmn4PahtnCwCSxeRfzHoZvirSTu05emEdYCzrhDSezWju9bgsulNtzQDE7RCw1YzPqHJkCYkJDMNOmgX9bQ81aWpmKQiqvWxLpqAYLnwiGHyd3SqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Etc6iKW1+1b2BGsMKnSX0jzEGw5SUomrB/VlUjSrA0=;
 b=BkE5a3ku1iRxfE6Ep7FiJxOB8a2KKnMIUUT6rOKAJSdQSoWSMN41lXGxHatI2h8tFDMzTwqtnZGE4UPrk3Dgm9PjCUF1983JMUPjIluumngIyq8KqU8wnVsW3Uduf64E9i9qyDPOjl3E7brStQEwa7v8JIDUKGeivh4WUEejHWSiBJwmoi3YcSBf6+Bb6iGv1afMzUZS3wofp+nrDEsKgQlWi/oGQYjbdUuTIrh0j4cY7lYQIWFFQY7ro5fcXfYL44RDwivOhOZFI7WsNDbqrg68TpR2tpuQLWmlRj1fGQWcFVhriTFDLoLGghKL52uDmQSsfnfE7d4HaiXcaeMFqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Etc6iKW1+1b2BGsMKnSX0jzEGw5SUomrB/VlUjSrA0=;
 b=OYk2K26mK2XmJWiAxUfN25lBgJ4ChZsRzbIteNcU+4tuIx4AWxxCi2NzKCwBZoDrPltjvqmR6smPwXASgRMn0UaP86cLBECa/Vt053O+LsTYwe7eoF8/sWGqu7snyw9aEVW4PJGkVs80OsVfdNu6iB57/2ezPoPbsc5c8+0vmAEt3qb+dqDuEE+veIyonJqoAmFBMKGEguIWyDEkyM2g2ozGjRx9GpIVlZPvDHUAy7c7YHKEAPSlVVqYSzJFeLBpZw5vrm8LMbMQwmvkqDlLMAjgKAKFRTeJsb2VvXC/9r36dctExbDKSLnmBvhVIQpeEcQyoccarMktML8wTvF5rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 (2603:10a6:150:30c::14) by DBBPR04MB7834.eurprd04.prod.outlook.com
 (2603:10a6:10:1ee::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 6 May
 2026 05:51:22 +0000
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe]) by GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe%4]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 05:51:22 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: robh@kernel.org,
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
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v9 2/3] arm64: dts: imx943: Add pcie1 and pcie1-ep supports
Date: Wed,  6 May 2026 13:53:15 +0800
Message-Id: <20260506055316.2798693-3-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260506055316.2798693-1-hongxing.zhu@nxp.com>
References: <20260506055316.2798693-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0085.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::19) To GV2PR04MB12019.eurprd04.prod.outlook.com
 (2603:10a6:150:30c::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12019:EE_|DBBPR04MB7834:EE_
X-MS-Office365-Filtering-Correlation-Id: 6821d3c8-13c7-49c7-233e-08deab3380ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|19092799006|7416014|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	RfKwL68lwy/95JVERlp2ID6DWT4+rH+uBbxRWk9VbC8t38jTjQkH0p4qJRaL9R3vGbquWdcwkVar/J+y6Sa73NXZEof+5HKv4oMqUBzdHZEQ+PkmZKv+X1cOcfsOA7AQqyLvk27bgFFtMh4G83bMUccN/AXYP39pA1I9nWZKjCEpKUUIXW0I4VG76Nl+Wq1ndv59qwxliV5grGGvFksLXjau+BHQH77MNseb1bIp2saxu+DCUUJKLVTPRGg01tDRBzo6vkq3/Im202O+V4Ng1boNwm7Y5S+Y5PB2awuiSRYiXFtvEnaSdXe1Scce/GKGx7iagrY/qjdFP2R/EH/L5Vfv3GUth5OSMvWJ96VrzxfL9UCLrI/YsUm/0ivB0P7PTXp1EiHudw3cnw2dqtFqa2lzyt/Rs+9acf8r80X01FRL4Aqo1EDTZ8OqyFpOsa8icbdurHqBEqW/LcgmlpDfyQKKvB1ZCs8SLN9N9sJiCTZXjzqHe38ANhihgyDiDOYIZpxUMHUpSOYlxKT93Y8/+C4d5CpL6LewBDgByUoH8vgqz6F1q2yJ0yjQF9Ij8Nt0NmMxyOai6lmXoER9D8GwYWtQc7VqaPXlodW3XTpKlnGSJZIM63GNWHUGvtpRtjd80jeXJ/cICyh3Pp9QawXLWVNcyVAvzJbL3disBbhSqtC+70S5H/ENOKMVA44q7s66AeKLEE8lkGTLppUig5SbpU63JgUmb+f+SvIEWECpJ6ZDz34tZm5KNC2mnh3D/sA3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12019.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(19092799006)(7416014)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9Rc8sPTq9EDvS2sD+uSjNaHm3+Asj1EfhO910U1MkPHgAPAkRGRdT57VSxej?=
 =?us-ascii?Q?UPQYeGVbHvxOR3cvvbbLpVRlRE7RHymwQlqCL3WhDbh5cCqf3bpHTdDJj9LU?=
 =?us-ascii?Q?grEXyofgbIRGNC7ciGksaGvmHrLPv+Z4b+PKn3IpI2XkKOw6nJQhxK8WTlPp?=
 =?us-ascii?Q?UrFUNZBRb/5K6m5BegnHzU8jQ0PYZgzPc/BZ2V8go4v/c190K5t8hPe8cONJ?=
 =?us-ascii?Q?KdlOdWoThraXk0LlblfF6rnoNtr28Ep2RAEnHxOJftYf/oChFuesCCFRmnM0?=
 =?us-ascii?Q?GMpJCpp+OKWTv7+w5EPGvucN0y+jMeMPHrNdnZaQ/HjTTTfle/UJeAwDa7Se?=
 =?us-ascii?Q?MXF6fnldIJsslazogY6pS2xMaU/ygkoSykrPLDR3kgTsmz6aGxyryG7rDfSQ?=
 =?us-ascii?Q?AAz49Mi/MVurdVA2Q2FoBEYCjmQZpYrFEgHEwHpHGtF4ijL8W3f/Y14HRHjU?=
 =?us-ascii?Q?a8bc3y/o4P67UB29Ynlw1PcJugY5tfG1aNpF1g+Ij3lJn4xa49UKxSt+2/a6?=
 =?us-ascii?Q?/UwDh7xfEKs6bhodI61I2TqHJkLR+M3+q2WBrHrlMYqOcjBVrrVx2K+Bt1YJ?=
 =?us-ascii?Q?7tfB1ccaVyxZnKAaxcYVd1/ur2mnWVGIEwmZuEVoMvlmm8mM7OXe6DZCGETG?=
 =?us-ascii?Q?tBjOfN2LHKX0IBnSwryKulBdiLdNH2tw7oG9/pXm4iM9KTMdrNwz4sGawTqc?=
 =?us-ascii?Q?jw/C3zUX9t3KDhrTqAt11wwJlXUdbY1+c2j2ceHLm9Wi6aEIyNmN7i2Ovyvr?=
 =?us-ascii?Q?Bd9x9jo32MN4Fg9e9tq3jPTfOztbukbPJ0dK+3CPdWdGnpDL1HwN3/4szmqF?=
 =?us-ascii?Q?zJ6wDNRowemqfKKCBp6nQAZtz7HC5D9WgtStA8+6WohWOpod8Ol1pF2hIU0a?=
 =?us-ascii?Q?nnGQEJ2XHmXOVLTvUrOKduR5H6CwB4xd7/GPTAeRTKbwS5Qa502H4Ko2LUOY?=
 =?us-ascii?Q?SFN9F8uP8pIVBiD+UQRF4SPwTaivL1jtpoBcXKPtzm4H4fmYTNaW4AMa44R5?=
 =?us-ascii?Q?oq9EjLC30tKm7V7Wd/032J5+45ojcyn/jyIEKbTgUGdTMWORf/mf5hHtCXHu?=
 =?us-ascii?Q?JnRv5Sf8hE8KiWRSXiA9ofL629Dq7y/8JH3Yklgx0kCFS/A97WlbsdS1zgFk?=
 =?us-ascii?Q?wkFDd8NJrcKi8dZEIcRajS7TSs9J/W3DQA/lRAN1yUiPAJhKRKedM/VJDZSy?=
 =?us-ascii?Q?B/8iZ/w4N8PZDxsP21HiultocOY1JWtSCRybHYBffhxmkhcv2FvNQKILF7AU?=
 =?us-ascii?Q?/S0Snt60Iu4MuzdBLOwDbGp8VVrLFxPDuf0ARx8bLWN5bRlYx6cCL211ijS+?=
 =?us-ascii?Q?YVG/WDLGpUqe6D1YrSlt/91s1H3D5lc+L1dpxyzs5wqkFepCrMctbpGxN/zG?=
 =?us-ascii?Q?iu1i5+TFxjV+ul1u9H+y8EH8yBTfSJOjQpZbTjbwB0fQLdYaj098yNxmW1Na?=
 =?us-ascii?Q?tvYPzqKV+NI+OzKN7RG91VQxGN6Ewnl1LToirX0G6BX6PLzvISIH/xJ2mjY9?=
 =?us-ascii?Q?F0rsouP0HO4sA2wwMOL9y/UM9gEv/fNaMubAj+pvY5H8Jo1hMfZI3qeoBYAH?=
 =?us-ascii?Q?hDVCpGO/t+FH4X9CVCLeBmgqbjUe6W0cXeMo0v+IEB+0TGVaqcE3Mcdtfa7S?=
 =?us-ascii?Q?HhwmGK94OoLN65/DaAvJHq5cbCdjL+CQjnKMxl0t1eCjb+rB7Pf7hss4QYBn?=
 =?us-ascii?Q?oe/24h9J59ytEvCS+C5/3fUfv0vi6CczROjF8RVDqdCCFbUvoRP1s6B+ppFY?=
 =?us-ascii?Q?S0JKX+xLog=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6821d3c8-13c7-49c7-233e-08deab3380ae
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12019.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 05:51:22.4624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ujlJjK7fCkkABGfKBUEhHiV9XhgK9wmIPAP9c9ZM6hYFmKbKA8QUY1c6Vrs6cLJ9vxBM/AcyxbstInRvimXzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7834

Add pcie1 and pcie1-ep supports.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943.dtsi | 75 +++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
index dfd956ece2e38..ed030d4bc7bd9 100644
--- a/arch/arm64/boot/dts/freescale/imx943.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
@@ -209,4 +209,79 @@ map0 {
 			};
 		};
 	};
+
+	soc {
+		pcie1: pcie@4c380000 {
+			compatible = "fsl,imx943-pcie", "fsl,imx95-pcie";
+			reg = <0 0x4c380000 0 0x10000>,
+			      <8 0x80100000 0 0xfe00000>,
+			      <0 0x4c3e0000 0 0x10000>,
+			      <0 0x4c3c0000 0 0x4000>;
+			reg-names = "dbi", "config", "atu", "app";
+			ranges = <0x81000000 0 0x00000000 0x8 0x8ff00000 0 0x00100000>,
+				 <0x82000000 0 0x10000000 0xa 0x10000000 0 0x80000000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			linux,pci-domain = <3>;
+			msi-map = <0x0 &its 0x98 0x1>,
+				  <0x100 &its 0x99 0x7>;
+			msi-map-mask = <0x1ff>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <1>;
+			num-viewport = <8>;
+			interrupts = <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi", "dma";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &gic 0 0 GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &gic 0 0 GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &gic 0 0 GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX94_CLK_HSIO>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+				 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>,
+				 <&hsio_blk_ctl 0>;
+			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
+			assigned-clocks = <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+					  <&scmi_clk IMX94_CLK_HSIOPLL>,
+					  <&scmi_clk IMX94_CLK_HSIOPCIEAUX>;
+			assigned-clock-rates = <3600000000>, <100000000>, <10000000>;
+			assigned-clock-parents = <0>, <0>,
+						 <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
+			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
+			fsl,max-link-speed = <3>;
+			status = "disabled";
+		};
+
+		pcie1_ep: pcie-ep@4c380000 {
+			compatible = "fsl,imx943-pcie-ep", "fsl,imx95-pcie-ep";
+			reg = <0 0x4c380000 0 0x10000>,
+			      <0 0x4c3e0000 0 0x1000>,
+			      <0 0x4c3a0000 0 0x1000>,
+			      <0 0x4c3c0000 0 0x4000>,
+			      <0 0x4c3f0000 0 0x10000>,
+			      <0xa 0 1 0>;
+			reg-names = "dbi", "atu", "dbi2", "app", "dma", "addr_space";
+			num-lanes = <1>;
+			interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dma";
+			clocks = <&scmi_clk IMX94_CLK_HSIO>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+				 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>;
+			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
+			assigned-clocks = <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+					  <&scmi_clk IMX94_CLK_HSIOPLL>,
+					  <&scmi_clk IMX94_CLK_HSIOPCIEAUX>;
+			assigned-clock-rates = <3600000000>, <100000000>, <10000000>;
+			assigned-clock-parents = <0>, <0>,
+						 <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
+			msi-map = <0x0 &its 0x98 0x1>;
+			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
+			status = "disabled";
+		};
+	};
 };
-- 
2.37.1

