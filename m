Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011056.outbound.protection.outlook.com [40.107.130.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A253AE1B1
	for <imx@lists.linux.dev>; Fri, 20 Mar 2026 12:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774009599; cv=fail; b=XZyk0SY/qRzSusrhIL7Hh6bkIMs8vWhcd637H6e4SulgAWwajel5Vkt+uqh50VIT2ArdKcCC0sPWA/HbvXLlu9cQmSSCl9TLIPWw8rUURSL+XDAW4VFbH9q0pVImJUXmjsmeS+OTm+j1RRROeBcTTdJl2guPnLMHCno4xRAWnyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774009599; c=relaxed/simple;
	bh=YDy4L+oVvqidmG+k+xkpti8OI1atsj282EjtBcElD2I=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Bwh4n2PVLbxsZvwNAF6oz/gzdu9Jt19JWoVs1OZCEDObrMXVv2XuWXiC2rn1kKCO8rdc2kgGAw0PaYUD+VRSNrk6++59sYAuNUEt1QElxpgpvngOo7/75CAhC8GmiBqt0s/uuAk72hWwXIvVbx5AmSa128io2E+H/Ir1cCY0ZAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HN1MiHKR; arc=fail smtp.client-ip=40.107.130.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HN1MiHKR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=stzq9NcV5eo3nT77mJeEwmcuub9jEx2MGxa2BNemoIXLKPAJSm8zuIa2hTX4zriRVsBB2ufW/+OFoDh69Lx5BjtvDmoEO16cfhCJtgMqszdAjmiuaewx+Z9B40kEk+38PNJ8/IUbpHUKGdBTRvOx1G3INk/EOc9IteJPQoTSSYpLJrdHlRaZI/PSfOuxjh+P5WzwMy/cVY+Wm+LCCPuhBybXnYwJoHHQzNcMU49doRM4QEAozug7rwYSfj4f6wu/151atYrzPqWVQtRGaQ/JanWqdbncIgNwTZdwq47H6Y93SWQYLz8xvYX3y6AXKsTf9tfSZgz38wib/MfjWb39JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJqNoNrKirFcVKLkxbkuh4yIjiw3FLsHknDsNMcAV3w=;
 b=DXzeJI5wRWjCVpwUN47eChN6mCKAFU8hcnNuBoHD1lSnwvNn+uROtejSnLWOgUiDq4/Acocn/9p9z69qQzZzl8IPEYayBhGP9sNM6ZDXts6Tn6fyLGCdzri/FLTy7mtQneEV36Mz0+tSTNoFfxh4euvdTxkts9NcO3COy/Z88TCD44U9tY3cBgl0HRdbGyp1ccn28H7x3OoKq9EGAzhrxdHGRv2MQ9lSJBzAX4PVZ+HIsEKPZwkhKAQB56TzfwNAwdcrsnO6faADrqhrtnhrqkFvwd2b8rd7eXLqAGCmkQ1KqeUZxJexDlx21hnyFOqMfhRrTfjNPVE0J05CnYv6fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJqNoNrKirFcVKLkxbkuh4yIjiw3FLsHknDsNMcAV3w=;
 b=HN1MiHKRPdUcjgvpIS+o+nKz6StSdnWSW0bg2NUzvjzjfE4mEk142AsGqs2cF0fu54m+YqaIfkAzPeocDp7TO0N3oaDKH8tnyevB+Ha9j0J+azYMXga3zF0Xs3ZjI1u4yJs4T1musMxH6fn/0mrnGOYwKLv4t6wdlZnzGael5ug7lZR84CmqJvjCof4VM9S8cBbXCA1OPVT9MCjRAwR7V7F8hHCBQ4opwOQEhJwgdrlR5RESoLbOqta5ZVnKRc6zheRGDtBmqgxkA2q79Em9C5oFNC6RMBWC3SMvQ56FMYgN7GbXwwh+SEPdWAaFklWhK6PZ7W/5FtRbal1Mg8ws2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA6PR04MB11869.eurprd04.prod.outlook.com (2603:10a6:102:518::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Fri, 20 Mar
 2026 12:26:34 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 12:26:30 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 20 Mar 2026 20:27:51 +0800
Subject: [PATCH v2 3/7] arm64: dts: imx94: Add SCMI sensor/lmm/cpu nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-imx943-dts-v1-v2-3-e6eba6b3a837@nxp.com>
References: <20260320-imx943-dts-v1-v2-0-e6eba6b3a837@nxp.com>
In-Reply-To: <20260320-imx943-dts-v1-v2-0-e6eba6b3a837@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:4:197::6) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA6PR04MB11869:EE_
X-MS-Office365-Filtering-Correlation-Id: 655a08a7-585d-4b19-b9f2-08de867bea84
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|52116014|1800799024|7416014|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	Y5Ne0MDoT2XuRokg0eE4VGbpOWHI96qUSAWbupW/rG555HN1YB29HxGBYmm93TGNDGFrh5JP91TqsGo/eUDlIk/YkQeNPCpoqlSPTcSabpNfrJhdcrCsiz78d1brFBvzjGPfhSxSQoLPeYQJOLvCpqVE3M98zOw90m3jex780+tIPDYBaJzYF2xmthML+cKaBhXPyTpUEVl+pDzXGLXn3h7MXuvYvWj1ybd9JqWe4/Y5gJWMcDuFu3b6YqpJeNoRaRUBbGO5QmTBBjBunHO/WpxQQHtV1R8VuIjCjsemCuKWmu9I0pJtJfSRfk95JoaaO2aoTHarHfYdfMe4a/ueiMKOhfOHkK0iyeNBsQhz8QTjJ1SsHzKwE/Z/l3HtqOyDSb0cIm4OSy41VOcPgGnv8idXpSKg/B+K8NyfV63cVcADTNqNwPv+5ls56yIfyTyWZ8awrPxNFihalj4/xerKU1AssovT1T+CPEloVvIG4wrttxWek/cgndvVJIWrx6S8BmrsyjgOKEDIAa2uYqjZd1VB+NMQ1+XkMrsltCWeWi31i75tC/g8VXZROZHIV8wU36854oGxF0h6SXBKl7ceUgNkdEyvxS0nxDoLrAo0tvMh0jc1lVV231dM16FH3OnS3CNxDgcJpnw24wcoTlDh7H8ZOU5Gz1KlEd0io/2ucNyAo2a3z8VBoSyuxgqff0M9YZLINK+h40J7eFSYptxMrhRfsPBXrxq/Qry1c2hclZTDgXmW/2WcT4T4+ADY5cM9Gc+v2LC9BBR403cOkLkdtgoKyAaHuWObgR5CVLNRt5M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(1800799024)(7416014)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXg4MzFqUUlHT3VEdUEzbGZjOENpaFExOWRjUXVBOVM1SnBMRUZENU5yYkFk?=
 =?utf-8?B?OGlLOU0xVnNhSEtpSUJlZUlHL0NES2pLK0RoTlQxVi9PL2p0ZnJHcGpFTFEv?=
 =?utf-8?B?QVpkMUI4aU9wRmtwKzJPdXpoU3lONEJZOXNUYXprS1NaVlZ0TlhOYTM1b1BT?=
 =?utf-8?B?ZklXNDBDQnY0Rmw3VjNZOUNzalN0TGkxVHg3cWJJQjRkVHplbDc4TFpJL2RC?=
 =?utf-8?B?NkQwcWxJR1Zsek9YcnpXY2w4VWxCeDdrcVpmd1VSMzFla3EwT3Y5UkNGd1lL?=
 =?utf-8?B?ZE9aa3M0SnpYSDFDMDVwK2V6UmllTHNTTlpWYkowWFFUdncyYlFKMmN2NVB3?=
 =?utf-8?B?cXZWS2crd1lscld1cnNtME9VZnNRN0hjQThPSmRjcjRpbHZDNjBORDJVUnJ4?=
 =?utf-8?B?cmlQeHVqRVQyM1IrRVBWUEY4bHdXNWN1ZWFMQnFKdjdpWGsrS29Da0t5QVAy?=
 =?utf-8?B?K3drWm1sY3lZaGFDaHJzOVBnb0NYaXlPRXNFc0x6KzlDSGVIdmRraXVqTEZL?=
 =?utf-8?B?NTlqa1IyQXFVdENKNlN0djh1T2lVRlAvbkQ5SmFOWU1VS3RISlV6cFFtQUZB?=
 =?utf-8?B?RlBZVmwrRjlNU2Nnc3VvR3gxVHNRZGdrRUh2clBVZmpIYzJtWUtCRlJHdVYw?=
 =?utf-8?B?SVpmVjZCVVpZR3FtR2JJeXJPNEptSUNoaytaQ002b3JFVWdKOG02aERmZmdK?=
 =?utf-8?B?Wi9Fc1ZkeDhscjE4SklNMlV2L0V1cWRLSW5YeTNrbXVjYTJiYzVmd294dXlL?=
 =?utf-8?B?WUltNVN3UkNhRXl6Z1hnTUx6eHZTdVdnalFYa1hCdWsxWDZvdDg4VmN2NytP?=
 =?utf-8?B?a2dOUE9jTC9RQjd6OHJ3QkMwSVVQQmY1bHh2Y29UMk1mRG12UkFkOUV6MEJn?=
 =?utf-8?B?U2VEY2t3NWFoOXNBU2NTNmFYMzRYaWYzbk1BYmZ1WGtkdkdpbi9TWGpySUVr?=
 =?utf-8?B?SWlmc1JSQksyWVAwUkpSUDBHU0ZwMmJ6NXJFM3E3Tm5qQ3Fwb2k3YWFmMkMr?=
 =?utf-8?B?N3pSeXRxcysrc3ZZRStBbGZPYU5xSWVVb3RPNGtrSE5YUHUyVUorRU0ySkt1?=
 =?utf-8?B?dTlkbXB0VHNCMm9JcmtjbU8wSXh2cDh5V1lEMng1Z3VKQTFyNWNiNmRpVFQx?=
 =?utf-8?B?cll6bHUzOXZnd2g4WGFEVGNYbTIzN2xnZDBkS2RxS09TSlJLU1dTK2FtWHV0?=
 =?utf-8?B?OWVlai9TNWhZYWJFSlNZaXl0S3NPdXpZN3JWQzZueEFhQ1hkMjBPWE0wTHlY?=
 =?utf-8?B?RnNPcCtCZ3FPMTFQa1l6Y3B6dGV5OXYzdEY0ZTJBZ3NOVUJpbHNHeWdIWGNW?=
 =?utf-8?B?bEpJOHJMYVVkV2JLNUxMbzVwZCtTb2RjYUt1cHdtMHEwUmpnRmRYbExFclpH?=
 =?utf-8?B?VEhYSkpuajdVRGVwbkY0RUdpUm8wK1FOOFhmUENveVJkYy9YelgzMDVkRFNH?=
 =?utf-8?B?MjZJV0lNMTAzMjNUVFBZT2IybERMbk9uWVgzNWZCY0tHTXdWNXpraDk1YmJ4?=
 =?utf-8?B?Y0xHZ0o0Rk9nYlp1NmV2SlMzSEt1WlV5U29UQ0lQdXUwK29VYzlqZm91UVk2?=
 =?utf-8?B?dUtuREFWbEZhc3NldThQcVdWVTh4YU54RUg3ZU1kSTB5SThDN0lWMnEwd0wy?=
 =?utf-8?B?UjN6UGdQdllrT2E4SEJ2UnJuNHh0OXB2YnltVTgzSVUrdEJwMHp5Vk13MEJt?=
 =?utf-8?B?V2tNKzcrTjRHZTE4Wjh2WC9QVlNaWHdlY2Q0cUI4SU54dTNldzVoRUJvc3FV?=
 =?utf-8?B?YlJqK21lMVFXTkx3dEx5T3lEaDJIc3ZiQjZOQ2pJWGcyRHo1ZWtGOG9nWlNI?=
 =?utf-8?B?eEdUZjBLbTNQTjRlbGVIZFNiejcvUDRLM1laM01kblZCb2hISUVvTm1mUEdM?=
 =?utf-8?B?SjZDdlNKWm9ONmNIQUQ5TkJWUEpleUROdGgrb0dOamh1UVdPazNFTGpLc01w?=
 =?utf-8?B?RkhSUkJlNzlrYzVMWTJyUkU0YVVQS2dmaU9GcDNFL3dWZ2FOWTlUOWh6OHlu?=
 =?utf-8?B?aXFqaGdrKzl5MG5OMzBsdUNkcS9qT3JuVkYzWThqcndJNlRiMG9YSlpQYVJz?=
 =?utf-8?B?aEhyU1lpNDNvZUFMZmMxSUZUTkFjN28rbVFrN0ZmMmljTGxVcmUwM1MxSHQ1?=
 =?utf-8?B?TkcrZGplaXBnNnJXSDNNREZmRHh6NTl6OFJQTFFXdWg1ckpqQWxRaHFSOEE4?=
 =?utf-8?B?VGpmZUFnNVhoZDlBZXhrbC9EYkVtMFFwTWZDM3NrN1FndEMxMUpXZVgzYmJi?=
 =?utf-8?B?Q1Ewa3hkT1NVd1JJQ3pXZkFMcUpiZktvTi9wUmhlQU5kVElEVTZsbk51STVT?=
 =?utf-8?B?TjhZK1MzMXVZUytzWWFHb3gvZDBWOTlVZzhtemdKVXA0Zk1zUU1XQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 655a08a7-585d-4b19-b9f2-08de867bea84
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 12:26:30.8273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iukdO3cEa5l7Fqzueq+A8U3GuhDhKWATgWP5n3Ui0EM8mZIc9hd9d0B0dLa7VlknTTxIxwPlIccAqlkaLCxqHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11869

From: Peng Fan <peng.fan@nxp.com>

Add SCMI sensor/lmm/cpu nodes to allow Linux use thermal, i.MX System
Manager Logical Machine API and CPU API

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index 69ede676fc04ede23faceb8f24cf740697e40d7e..117cf2bcada44aeabd82af064f19d2377e96402c 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -94,14 +94,27 @@ scmi_clk: protocol@14 {
 				#clock-cells = <1>;
 			};
 
+			scmi_sensor: protocol@15 {
+				reg = <0x15>;
+				#thermal-sensor-cells = <1>;
+			};
+
 			scmi_iomuxc: protocol@19 {
 				reg = <0x19>;
 			};
 
+			smic_lmm: protocol@80 {
+				reg = <0x80>;
+			};
+
 			scmi_bbm: protocol@81 {
 				reg = <0x81>;
 			};
 
+			smic_cpu: protocol@82 {
+				reg = <0x82>;
+			};
+
 			scmi_misc: protocol@84 {
 				reg = <0x84>;
 			};

-- 
2.37.1

