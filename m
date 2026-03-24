Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013001.outbound.protection.outlook.com [40.107.159.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159EB38839B
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 05:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774330987; cv=fail; b=o75q9qxSq1C6o5PgeYLJh6L+X7OpClyvfhpJDDkxaMcssYL8AC3K46uBeRIdpFlpUi7RbJU3RTihwDoEsld3rJxjnCm8C5noRYwDSjC88M56ynlI9ectnlPENT7W//fUmypQOczOMxLTSr5uGpi6UXelX+HEYC+BqAM/TGtxsuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774330987; c=relaxed/simple;
	bh=TuBIpYjL1dagwF1AZdk+hUFnY4bDjwzDL+iRS8JhmsY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UqqS/6L97JOc5h45uPglqHG+SCm+pcOaeI5FEGeq1CrICITJ9azUNBKuIN57+4+ryguvIbDvXoR3TmmIdOYM5Ane5q94HDWp+/Ndx1OIuX8vUVMlna8gnS282oDCIhh1L5T0L5z2hK7kiterZA3ZBjRHNrTvyABFoeI2UmRZGwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lGw6V4p+; arc=fail smtp.client-ip=40.107.159.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lGw6V4p+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pxqvxjO3VCFKxkorN53pm6TxoDYbcAX1GQ8DcEUgU2fXZBcHvfjgprFLqd8j3KKbD0C4UnMz8AwP9s5aglCPizZITfHkB7100EiKyWSO31lf0dpwflBlbnKSA0P2yRUUqkpW0oHGEbrqXPg+gVX4MX8w7MSmrkeTS8c5XfDp+jspDV6uh3yUxDjO8wfSSB/aW15Wifhx+hCKSPcOrISLI0QAfGiu6VKPuR6iHQVWZMJ5jCd3iV3AP672/e4A6CSlSQocd2QE6JpYGsw10UKtYnkfP/kTJeSGbgiYhDURg0SGwXJXVd0jH0AxyZZhyDDfP5McaeadbZrXmGwn+snQjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1gVhTlzQzFUEeffgzXNX8iFvH4HpP3vABABab79mn0k=;
 b=ab+k8HgZYCAS/ZCujVAVroKf7vF3KZsgc0eN+a0JPFyZrdA1Ww+CAkWSgDgFERh/R/4NJymHTF4KDmg8FKT0u8QtCHakyHrK6dozqZOFyzqURyUwqzveC9MfjjxxlgBQtU5An5RP4ZmZwlGAd70tO46hHwpf3SDeM24JOzvR4GcJt85BrJ365MhWaru7H4FSQsEsndXvkoREbVHUODOKsUWoCr/rAHo8IrG1bqDgaKJD/hc4IIFN/RTS99XaC2+Cu4xDu4oP4FbXE9wq6eOD8HMvFp7qwZi9WhLF6F3Dw2dDkQ2NsrGRE4JRd5dRLGjrFZh7pudXekXKyEbBT92AtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gVhTlzQzFUEeffgzXNX8iFvH4HpP3vABABab79mn0k=;
 b=lGw6V4p+LR7csfwLGTtB1GFxOeE7cQt9h0+YeDAZH85TwUoQ8mLu01Xfyf7sF7WXBo6Rf/agf/t1pzQHyblDNR13TN85PBOAU+pRoDyVY0rCMUzTcJEQD6JnT38chH3R62vGk0BuCCnItbA2AAC5XqzZ83JDuWBhZACwJXxJ+UBQlv6y7D18H8/296XVATgzUnydGUjpb5RggAtVYycWVzsDG1ZntOFMHGrOy1FbqPAyYQH6K7N56eqrMmyrEnrSJPtZLz5fsz+iaL1ofxRvYVv2Pmh2YWqzqAQVEelcIzl3Ocat5YVhajYrU829mJa17HlkdqCh5xKDPwmxqvOSUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8967.eurprd04.prod.outlook.com (2603:10a6:10:2e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 05:43:06 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 05:42:43 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 24 Mar 2026 13:44:13 +0800
Subject: [PATCH v3 7/7] arm64: dts: imx943-evk: Add pf09/53 thermal zone
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-imx943-dts-v1-v3-7-b33bf1f1c254@nxp.com>
References: <20260324-imx943-dts-v1-v3-0-b33bf1f1c254@nxp.com>
In-Reply-To: <20260324-imx943-dts-v1-v3-0-b33bf1f1c254@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:4:197::22) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB8967:EE_
X-MS-Office365-Filtering-Correlation-Id: a06fdc7b-2dd3-49d1-ad06-08de89682bb7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|19092799006|1800799024|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	UAxJ2qhD0V2gRnzF8yLjFUFGZxNMXQ8x5bF4dr0Kk5N2X4coQSdmQ0olo7aKsXLNbVTvqnCJTxZWra4wrryjEN1fQv9ybdb1nnjH9cWJhqpXFqwvNpy9kbPL3qpkw4/MBfoxaCuMzQHUZVOs9sy6rsh12AOgx2Gri969mGv89lMjBcwc7nReWgvBzDbcBmA4SpJfJZYygw5p9lqWC2Apx+GxTFcTCHSef0Rm0u7wKvej16TydIMxc+YLQLSivxf5Ngg5zQAqMgBA2dLgLjR9O3uX9z8C9U0KVCrUBuwUmCzS3YZldLvl490057OFfOM8o/Uw2h+cN0nGWQOxtdHNQv0uLZVLbDs7EOh4sEN8ZtQvbnhcmitDlrHQ9+JB0yY7ucSkY4iEwXlohYru8MI9S3g1On39HPiEC/vH3ESNUD9dUSBAICJtG/Xw0ajrjGSkhddfKJwpesJl49fWarYheARoyruiAaLVTd7QE+av3OykYChk/Z6yaRomhvwg6kTs2P0QRtDUsl1WZU3bviw01BAlsAqU3ZpdffSMl/aJn8TlEWIpb8u49PuRMKTGP1cGWzU2PTyPwJmAQk/1ImuNvm6epKizs2RKPN8t2ErEgPRy2fVM/QSyG9nZf6SIkIxkxOXZTv99ZxXA/G1KVSDgP11R2EVTM0ECI/Hcq85hyg8ZR/dz/1+iKFnzGpMdlDKGRNI+rAgrr8BQdUagYYdUdz7Rt43BvUJbWuf/dEVC7TI9LXK+2Vz3Azg/uUMV167UtrJnnhaqwGwIugqllRYHHxsPKdeJBuLGMjsXIPn/ub4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(19092799006)(1800799024)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGlkVjlaMVhqMmVOekhDQ1BhZzJXZmJGWDJTL2Q0eTVhZnpSVUZvbFpSQmsv?=
 =?utf-8?B?ekltcVUzZzRtTUZiQnRGTnFJTnE3WkYwYktYK0JseEhOTCsvRTFaUVRCOEZk?=
 =?utf-8?B?M2h3SW1WV2dTck83Z1JaVmsxSS84WUJxaW9ZM2hCcUJQemN3c0pzcnFBUHdB?=
 =?utf-8?B?NWs4d1MxQ0dySEs4aHhMbHpsak9ZaWtzd2x2eXZnYXpDSHQwanNRMHJ4ZjBV?=
 =?utf-8?B?MTJoMDVFYk5oZmxWSER5YnpxODFscDhqWUpuZWZtck1aOGdJRVl5T3RCWGc3?=
 =?utf-8?B?Zm11NU5ZS0JPNzRMNHJibDJLZWh0YlJHRkhydmo1Q2owcER0VGo4djdtWmQv?=
 =?utf-8?B?YzJTRDJLMlNvRlVlOVVDalRGanoxdWQyNStHN3BFc1RvVVBRNG1ETktiU3lM?=
 =?utf-8?B?bVJmdTBRN3dNT1NrbUZGK3RqYzdlN1lNQlhuVHpOZmc1cVJkYmIybDZ4dVho?=
 =?utf-8?B?eVY1NE5OUXJmK29OaC82T0RMSEhUKzZGMUthMVhPMlQzV0VQZTN1Uk9qYTMr?=
 =?utf-8?B?aFFpZVVlZE1UNEUrUE5zOEw5V2hCUW9XYW1QVlRkUkNJN1lFQzhjTXZJUUho?=
 =?utf-8?B?WmZ0SkRGbFlTZlBsTlg5UVY2WC96TmNBdXN0SDNzL1lsSVhMOEs1MWZtQmQ2?=
 =?utf-8?B?YlROMzRUVVUxRFV1cHArNWZzWUhzanlKc3dLcllWZkNNc0JIbzBwSlp5a2hN?=
 =?utf-8?B?cmZnYmxjTGduL29WeE5FZHFOMFR5ejdwUDF3KytoYWtxRnd5U2Z2VSt1WW1v?=
 =?utf-8?B?dk02WmdOdVllTDc0RWJQdDJrRmJacXpNaW9VeGN6WVovVzVQOFNUVktGZEFq?=
 =?utf-8?B?UDhHaXV1dG1kVkViZGZUeW5vemdIaTVSQmt2aWF2UW9vMXhIQmdSQk1HQ1RL?=
 =?utf-8?B?R01PME5zRk1aVS81MlhSRTlWT2lSeVhnVGpLdUM4K3FYaVlUMld3cmE3bnBE?=
 =?utf-8?B?QUdxZnM4aWlOcWtvZkZVR28yQTlLMzZIdXVUd05EdzlBdnVVRnhOZXN6aWVT?=
 =?utf-8?B?UHdrR2hkVC9LUjF0OXBUdWMxWFJhcjNtdGdBZVJqckp6ZHVCcFFwcnlnQzls?=
 =?utf-8?B?aHpSRTdtS3VSSGRpZTFOQkF1Q0NOQjhidEE1OFN0eURKTTc1bGhLTCsvZE1G?=
 =?utf-8?B?SGRYb1ZPZk9zMW8rN0dZTU1ITHdSMTliTUJJcmx6R0tpaFpKTzl5Uy9xZ1cw?=
 =?utf-8?B?bVNGWENrQ01JMlU0b2xwZ1NBQW1mM3I0ejJ1Z1BmeGpLZkJoeER1YXo1TkYz?=
 =?utf-8?B?L1JaZnBHMVd0RVcwRTZDOVN0UmpqZzJQeXlHak9jYzhON0xZYkwrbXI5R2dt?=
 =?utf-8?B?cy9NbmlBTDZaaHhTekdZZDBFUDV4d3VobFJ0R0xzMHpVQkE3Um5YSnNyNzgr?=
 =?utf-8?B?SE5DRW1iRnZMUTFCOE5KWE1SK1pvWXhCZC9JeGlHN3RNVUlhUnNlQi9jWHc5?=
 =?utf-8?B?bmxNald0YjA4NHFIYnZJaFZ0UzNVLzA5ODFtTHlSd05NU2xXWVdMdENDdFd2?=
 =?utf-8?B?TTI1NTlIbEhWUXpvdHV2OHY4bjFhSlRubGZWUEVta0NNYjFUL09XVDBtMGM3?=
 =?utf-8?B?UFFhaXFCSVZyQmNZUWlNYlBpTGg0UVdWeGlxWWNzYWhxM3p4NkdOWGhuWUpB?=
 =?utf-8?B?RW1RajlVaG5IWE9xc1VjMVJTSlFVYVFaM1FyRzl1d2dHWHI5dWlqM3RMR0pC?=
 =?utf-8?B?MU05OUkwN2lKZjhSQjM1Vk1vSHdnejRIVU95YVM0MlFKWkE2MEFkZFRYYnR1?=
 =?utf-8?B?bmU3ckFPeVZTRWl6QnZ3Tm5YZWd5alVFYnJOUm83bTF1dmNNeXpSbkMyNnZY?=
 =?utf-8?B?bWM1OG9sSDRkRHVKYXdzSmMxV2dIa012UVhXV0xyMWNpV0o5SGlDWE1tNUds?=
 =?utf-8?B?blRUYzdSRmZKUzdsTVJTckQ5WXJNZjBlY2s3aE0rTEJqYnd2cHFERVFJMXcz?=
 =?utf-8?B?ZjNPcDdJalhOVkFqaStqRFJOcDRhWlI3cDU1clZuY0plTUw0ajlwaUdMZnRk?=
 =?utf-8?B?WHYvQ0ZvV2l4OTVHOU5xNThIRVlhUHdlY280TjZlb1FiWmRKNml1Rk54NlJV?=
 =?utf-8?B?bitGcmtBVjQ2Tm9uTG8reGUreUxmZnBPdHZPeU1RNkRORXg3UStwczNVN2lq?=
 =?utf-8?B?YmV0bG1TdVEwNit1RTB6MHVPQ25DUlZXcUl2MUFKTkU5ZUNkSDMzSUFac2RT?=
 =?utf-8?B?aGhTRHlWaHRnODdhazJrVURxUER3WExKK1k4cjN6RlRNT3VtVjhuV1JiMmNG?=
 =?utf-8?B?T294UGlDd05naHNLVm9SZGZRWlc2YUhDbEo3UG54RU4wZjR1ZzNjcTdVQXlq?=
 =?utf-8?B?b2liUmhVcFkzVG9TSktMMDQ2VWM2RFhqZXZUNFR1NGtHR0VnRzhNUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a06fdc7b-2dd3-49d1-ad06-08de89682bb7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 05:42:43.7183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5+enNou1kSmPvXccwuCcRlk+S7+dlM2by7efoenLXeY+Blpr5jGaYMIUTsFOAslqNCGq5uFktjDx5yUy2Sohg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8967

From: Peng Fan <peng.fan@nxp.com>

Add PF09 and PF53 thermal nodes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 38 ++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index 7125c7fc6e32999fd279b9d01af0b210d1ab843d..0fd142f19ed2c99c9d555f4f2b9e6b8259131fb9 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -946,6 +946,44 @@ map3 {
 			};
 		};
 	};
+
+	pf09-thermal {
+		polling-delay-passive = <250>;
+		polling-delay = <2000>;
+		thermal-sensors = <&scmi_sensor 2>;
+		trips {
+			pf09_alert: trip0 {
+				temperature = <140000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+
+			pf09_crit: trip1 {
+				temperature = <155000>;
+				hysteresis = <2000>;
+				type = "critical";
+			};
+		};
+	};
+
+	pf53soc-thermal {
+		polling-delay-passive = <250>;
+		polling-delay = <2000>;
+		thermal-sensors = <&scmi_sensor 3>;
+		trips {
+			pf5302_alert: trip0 {
+				temperature = <140000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+
+			pf5302_crit: trip1 {
+				temperature = <155000>;
+				hysteresis = <2000>;
+				type = "critical";
+			};
+		};
+	};
 };
 
 &usb2 {

-- 
2.37.1

