Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013013.outbound.protection.outlook.com [40.107.162.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FFE3E959F
	for <imx@lists.linux.dev>; Fri, 27 Feb 2026 06:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772173770; cv=fail; b=jD4ZIa4VMuVCuuFjflO8vF6pBSZlo7zLLTSQJ3U1o2r0CwtYondNkf6SW40hV7VtUHiRkH4e4+ZmC4Jf/BPmEHpEjlGWssbMyq9XRdlD29xkWhdYFEcn/PIIXWc1MBboOvQJ2wtLpnhQ6OTgxy6jMdew9ottZMjSTbZXhjB1UQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772173770; c=relaxed/simple;
	bh=s1gAtU06weceHFlv4eR/aHiBZYsXZRLgwZXwxLL2ALQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bpKR88nEtYuBxjSBZNgnRa77K8Pfk+a6B2zvJ7WL0Z9dDNFsW0lT0cz0PYg+jbsATYFnWO2skrx7E8K+NKBTPBbtCL4LTK3Ov+Tz6gbiTKK7ZYkVsvOfN+ftyYLLhEteov7kQgxD9U5Vip3iu1g2mtNU5ZqhFPJxsp3YgrCl/+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wb5Epq0V; arc=fail smtp.client-ip=40.107.162.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wb5Epq0V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4BKcFJPCB1jM2KnxO7hLZvZHuzVz9xIqV0nO0KCrso0RsBOYfEW6yH0nWbvQpz79VUDD/uCsfNBJSHWtPKADx+I0lNAI+kj3E2WldxMA2RlY2jckrpGdmuNXG51vHT6EHN6zZFiD3kclEMtgvyLqFrKeg7SVbpfbcYQQQmrLdAMDHnr6nCDXXgkWkQYcBJGj5H3s76hGL1EFA6KyLg6/pqcchmNFoWeEKJyHX6qjCagXsyHMV9J078PcG1Wh2sXlhmwAHefSXcIVsSo5CZQNYHp+aN9oLRA09K3VHq4sczNbIFVwmL9JBlpjT62qCSMMTMGDZuKCpWQcqSm3mLVuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wadq2m+FmgXvrzGESbTc/1jxM8gXxmwbUbtOvbfuNBk=;
 b=vDzlTVzur6vXJcH6vHi46HGpSb1ShaVk7PFnoFVnMXPCNSDJOrGuDdtArU9zXloVbFaul046dNSmLUGi+Om6kjr3SINAGUnNPrBDky+PSM3enx4uhNAv4QLDP+HBNGWjg7lVIkBuUI/cTU5CSGdDSijUNwdy7BvxGxmla51WRtNloW5KWgBTXQRxBy4NC2p7uzncrgSkBHN+xktJfztt1x96cOCN3fjAeQDYwK1387OYipIvaks2uRQ4vxKX0zCIfEDPMHUWl0KrxkBY1/7rNfCy48QJHeh4pRcyQSRupmSaz42IbdICOgaQ5WqzEEY/TlTmDr5p5/tqMxUGGQ6/ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wadq2m+FmgXvrzGESbTc/1jxM8gXxmwbUbtOvbfuNBk=;
 b=wb5Epq0V2i8VCuUi73z7ely4kToqdU1ENNBDRI1PbDwSjApzYTNUFSv1bLx/WTXbzebEHAb8bzkY25UQNkwq9IqKfpNz4J9gz06cRACzMENiPIQFINvEbiQiTuwQJMAf0q/9kelBdIuEOw0FXGuO0GTIHS2S2JIqt0TbRvi3hgoDFi96/1P2tQjGMdyoqCCx/J5hUZdy373dKQuTtDejZe89FkNO8kUgaRo3DEXAlIiyAbqrGWtrjEGVmRBXippZdUCYSmSYa+PvASOMATOFnUvnJ/PBDltkUU1ts1i6h69eQAdk5iWa7u4wm23YAodTWrTM4uE3TkMUX+i845t9Ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBBPR04MB7817.eurprd04.prod.outlook.com (2603:10a6:10:1ef::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 06:29:25 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Fri, 27 Feb 2026
 06:29:25 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 27 Feb 2026 14:30:44 +0800
Subject: [PATCH v2 2/2] ARM: dts: imx7ulp: Add CPU clock and OPP table
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-imx7ulp-v2-2-1c7fa8862ebc@nxp.com>
References: <20260227-imx7ulp-v2-0-1c7fa8862ebc@nxp.com>
In-Reply-To: <20260227-imx7ulp-v2-0-1c7fa8862ebc@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, "A.s. Dong" <aisheng.dong@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR02CA0071.apcprd02.prod.outlook.com
 (2603:1096:4:54::35) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBBPR04MB7817:EE_
X-MS-Office365-Filtering-Correlation-Id: 198e09bc-d982-45d6-eb4c-08de75c98d96
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	ZsnAuWev2Z5yC/N4irkdDkF4sAwI8QIzwFvPvq5fdG0/ebViZQJNclWf/L4Xj7Qf+8BwNIz0mJSl8fz+4QTLynBfIZxS5zV92YZtRrWkTYCoELLzoAFdKeO0ZSkw1Tx05brwzdtNF9yONFmN64c+d/vinTtqIuBxFc6wcii7nFRx9X8/V9S1T+fmEd7iI0fpmhMF5BnA4ePh+DtkI+BMhMLIJsTsY+AS/UtBg6/TMENfdeX21WaKesfeZKEdg72qvK5I/wy+E+8JKSldvAXfy+fe/P7ly+UcB4DdMnjPExyRd44jUyzRHOKxiEtAMxHqRd9KlP7JYdM3vo9DFMzPUyLLKm2cFOp43VN+KD3oXj9hLlDENPAAxmD7TNL5F1RMCSp1duC95GlE3ubFMLl9Ye/hEB/a9DwZvafZpxGjeDwlwA+YAc7lq+U1G+1AIC2uN9p3RyOdM2/afN5NhFs8HRo5E7eLOUlS7XBD0X615rNAkH/mUgZicCMOHUvURaQnA8vuBlNRlN/KUYkv9Nz5gzUbDyPI63VgDUvkkwpwozi4FA5mBZxdtru8inqb5GobFGyCrDxZWJsEfJRGFolIcN0AzkHV6F/OcGdnPvhm+Co6Y3XdAOtbCe4nOOUNCslCHCKXO7A3rOw30PRf2qekWbRXrXe1axZxGdTwqrGwYEMeUgtgb/7+iz6nZATFvEw9pl/UZrFhqnZYAQpuQ/dIXBJbVlLiZwlT3QFZ5I5fz2bx82ot2js/MyyQp6y1LbJ+IS48sKXMWZx33b+ZpOmfxti4oD/CKeALjJbJKLW/enQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTlUSDBmd0RUZll4UkNmcVAyR3RGSW5YMG4rS0xjSUpmTHAwT3dpQkh2eDFC?=
 =?utf-8?B?Q2JVMEo5d0NmcFJwSWgzaFdXRXhya2d0MmFMSmo2OERBYjVPc1NXSzdZYWFx?=
 =?utf-8?B?ekdiQXFzd1FSUXBQRkVVSWhUWlNQaUljRnFWbFBPcTRPeENPTWRuMUtzaDRW?=
 =?utf-8?B?YzQwa2tiaFhGbHhGaFdYRGlsR3FtVWYrTCtVVkNaTmtsSXJmSmdwNnpLd3hv?=
 =?utf-8?B?OEpBaTEvRUVSRXBjdGlSTkVxM0xjN2RYc3Nhb3U0dHlmWHFHYUY2T21vQTla?=
 =?utf-8?B?Y0VZeGlERmhhb3A1Zkp3aUVTZHRWR2xSZVZHYlpLVHpZQ2dTdzFCZEppOVBC?=
 =?utf-8?B?YzNRMDN5MjdIeDJKVXY2bUZBRnFmREFncmx3dy9ZMnQxcEpFMFBkWWd5aDJD?=
 =?utf-8?B?ZDAxNVFRR0M0ODUxTEhWaFJ4bXluamR1NUdwQ010RDhKSm1iQ0NJeVp2Qm9U?=
 =?utf-8?B?WDA2V3B4bWtwQmw1dGlFWWdtb3ZiMHpNM0s1clcydGs3N0V4cXAvRGswT2o2?=
 =?utf-8?B?STN0eWJyZExmenlzdGJ0eVV6a0UvSGV3RW81TlgvVEJ6aE1ac3VaZXpFQjhT?=
 =?utf-8?B?SVBEc0JJY3pYMTdLdTE5dGZ2cm1kR1AzSW14dy9ya1RKSm5jNnk4UGpDbHBE?=
 =?utf-8?B?anpCbG1oUGJXb2hpVnpyMW5hU0g3bWtZWDNBRmh0dEdYRnBmelhRM1RISlQ2?=
 =?utf-8?B?YzkwRTFKOFVIYkNORVJheEY2OXgrRi9VU2tBaTl3dmJLMEo3SG1LVjVnK1pJ?=
 =?utf-8?B?b1U0c0E3ZDU2RmtRRVdnaTdyV01XWm96M2lJMnNHVi9RVHp3eXFNVDgwRDky?=
 =?utf-8?B?ZE1CTVB0TEdyNGVBNU5TVlQzRy9Lc0RjU0NXbnVieGZ2aEJhVUxlR1V6TkMr?=
 =?utf-8?B?QnovL1BYOEZXci9NM2JERFZkeWV6SER1MnhYSkxldE9QSnVRNlAwcDZaU3Vz?=
 =?utf-8?B?aTJkU2RoekRlZHV3Mi9KTmErdjFPbEtDTFlqWGJsRDNoeWpSbHhzdzc4YUYy?=
 =?utf-8?B?SkhvbGtMMDF0S0srYlJ5V0FJT0M4dXgwRWQ0UUw0bS83Z1Jua1FsUVplRjdU?=
 =?utf-8?B?OXVLVHNyVHJiR1gvYStXTzUyVFV3c1dsUTF5LzJKSVZkVGVSMGNYa3hFN1RN?=
 =?utf-8?B?cWFQTlE0RUpXNFJXZGRDSDRGR1ovOHZPUXlab2lYNkZGNHNDQjArR09jVHda?=
 =?utf-8?B?T1g2MTVBbFRyNVhtOTJtVTUrNXlqQldpM2lGZGRDYmFMVng0V2l1T2lqRlk1?=
 =?utf-8?B?eWVOTmRCcVRMbWt0dVhyYjk0RVV2NWRkbURFRit1b010YTlIbXhwNUNFSStR?=
 =?utf-8?B?Z2xIa0lDemJHZ3hBb3pTT2RiV3pURG9WZ0FzTzhpRXkxN0QyVjhkcGNmZjlV?=
 =?utf-8?B?bEp6NTduNXMzOUY4aHVUcGJUamdSWmloTUpuemMvRWJzd1BIbVVWOUtkbisr?=
 =?utf-8?B?OWMwY2ZRVFZHSjVHcHhPMUU0SWsrZVFOQlQ0MnFXczVZeC9zMEVxMmZFZU1j?=
 =?utf-8?B?dUV3QTdrRm1RKy91Z1NUVXN1c0M2SVNmekxaUGZRMXhqa2p4YzV6THVMWm4v?=
 =?utf-8?B?ZXBrQmY1Y0xTc3BqZGxKeEF5SEdFM2lZenpObzZseW9pcHkyMlFyYnZkc04z?=
 =?utf-8?B?V2cxVi9tb3VudFhkK0tBME50Y3lvcld0S01HOEZwUnNoT0UycTMzeWpOeEpM?=
 =?utf-8?B?dWlVM0hCdmtEQWJHRFB6SWVueGNOMDZQUXFUMnNYT0lucGh2R0xOVkpIVVpL?=
 =?utf-8?B?NFEwZGlmNUQwWUw1a0pWc2ZOREw0ZmQ3TEFtWnBwOE5sSWh6K2J5T0pqTUlk?=
 =?utf-8?B?RXRLZ3VoZ1NOZ3lJMFFDdjB4K3l0MTQ4QXp2QTFEekQyMVV0Qm1qQ1UybVB3?=
 =?utf-8?B?VlUyQ1BXODdYYi9MVW9UOUpXclJXQStOcmhqbnd1cjYxdVpPWXdhdDdCY0hh?=
 =?utf-8?B?dnZPMnNZVjhoSDRxcFlIKzRYa1V4NzRYR2lQUXo5ci9hUGZPU0M0YVNzVGUz?=
 =?utf-8?B?YVJySUZwMGl6SjVIZGtXZnRSVmU4cFU4SmJYekFINjgySzRRWkIvSVU4d0Fl?=
 =?utf-8?B?UTUzWnlrcmdrYTFkUElQVHJBY2kvdGd1cnlpMDJBRW1tTnFObW1RMlU3TnRh?=
 =?utf-8?B?NHhvanV0bFQ4bEQ2RUMrRytrZWp4bE9LOWcwcjh6Q0g3SzhpeFgzV25nL1Nm?=
 =?utf-8?B?cisrT1ZRTmd0dENiTWs3Snlvb2pSdmxmRHFzNTh2dndiZlVGeDZJRkRoOHgy?=
 =?utf-8?B?azc3UGJVbTZ3aEhCTVpGNXp0ZU5vL2FpWDRwMC9IcW9la2lGWGRGVnJWUXNQ?=
 =?utf-8?B?OHdOWVZlWkFnd2lzc292c0NPZThQa1B6U2pZMUY2bTBtRE1UTjFlUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 198e09bc-d982-45d6-eb4c-08de75c98d96
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 06:29:25.8563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y8XaGqysJtO/WTOmZ1zJs0WyxORKhPk77LNwyOwWOUkZVmQLT2uxFHVIYVKLCUW+nB8aeR36iztjx6HyxKXK7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7817

From: Peng Fan <peng.fan@nxp.com>

Add missing CPU clock definitions and operating-points-v2 table for the
Cortex-A7 on i.MX7ULP to enable proper CPU frequency scaling and
integration with the cpufreq/OPP frameworks.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
index 880b9a4f32b0846a773dbf9ad30715c84ac2fda6..1355feda1aa72d88dcf56033dfdeaae631c108f8 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
@@ -41,6 +41,34 @@ cpu0: cpu@f00 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <0xf00>;
+			clocks = <&smc1 IMX7ULP_CLK_ARM>,
+				 <&scg1 IMX7ULP_CLK_CORE>,
+				 <&scg1 IMX7ULP_CLK_SYS_SEL>,
+				 <&scg1 IMX7ULP_CLK_HSRUN_CORE>,
+				 <&scg1 IMX7ULP_CLK_HSRUN_SYS_SEL>,
+				 <&scg1 IMX7ULP_CLK_FIRC>;
+			clock-names = "arm", "core", "scs_sel",
+				      "hsrun_core", "hsrun_scs_sel",
+				      "firc";
+			operating-points-v2 = <&cpu0_opp_table>;
+		};
+	};
+
+	cpu0_opp_table: opp-table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-500210000 {
+			opp-hz = /bits/ 64 <500210000>;
+			opp-microvolt = <1025000>;
+			clock-latency-ns = <150000>;
+			opp-suspend;
+		};
+
+		opp-720000000 {
+			opp-hz = /bits/ 64 <720000000>;
+			opp-microvolt = <1125000>;
+			clock-latency-ns = <150000>;
 		};
 	};
 

-- 
2.37.1

