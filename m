Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011034.outbound.protection.outlook.com [40.107.130.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80212D73A1
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 09:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317727; cv=fail; b=hmyFFoaIv9OE9JWAQhz8DK4BWhtrRpblpIZ3a/t7Z+JxSD5qYCABcDU7xTQbgfbji4qqUvG9oPMiDMRJXEIO6FZTn/e0uU/c6Hc07blZGfd5HiZcOh3pES6pbzWSYXdT3vnNFJfMF0dO/4wjA7xbWYu5+5pNaNOIaTKtqgUkYjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317727; c=relaxed/simple;
	bh=dTwTx2rqfBVmJx4PbYJA8iE6fA7txrc8UkHLzJfrmeY=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=KeyBoFtsSNIxjgh0ooECiGflGMY21vwg/mMAOVSq/BnDi2NiBSWvvBjvz2IhoBh3genQMtnjKyVf98UCDGfnxElUz7XGwpdmIKOwWhXMgnuUBNerHjNaXxI6Ss9HIYxbEQ//L9WYwoMMbH+eWhX4PcsKkLPYaQNxj9vBLHuIBFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KxLoyG0H; arc=fail smtp.client-ip=40.107.130.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KxLoyG0H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EoikVUfNKYnBvCdhfFZMLrWwqmiSrHMiR0XaB7/2MDWI+SNs7Itxu0ylMYLQe4liWwFhmExgp7wbYFBU7cvmZ5KdA54vcTPRAEUrB7oXtyVKzmpdtXCxVPxYsSFFrlU7hxuxL989itZpnOvuhoeSIBVsTJYKNwGPKaCy4dqCsQV8K/h7h9DCzuT2iBKWmpoGsbVMIlLaQEJi6fmwBMQR4XxVQWbvOM/beYomTGvqW1H86puJPGFcw+f6lMoMd2O9DIDcEKTSsSLdBi476UfjN7Q0lMiD/gGkDrP8Ejvkbn468gZXmG/KTh+bFqPs430e+u0vJJeMcqfaVXhRYQASEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZcyWWfZuA/MM5ZdfjsI415bhza/UWC4HWQdQgdlEOg=;
 b=oNjUC4u7+2lp0D1hEokSOTXXPxiMrD6GKKsqzQbORh09jVPxjFVg0Dc/xk9j5/8otMbbLlmGbHSVvjRor6k6zmIbSJNCJF82p2K8V/48ygEg9393O8lcp/AsDfASw2DUfm/pvtoj8nBDTZ4GM94faXT44B6wVYknw2BiMtBD750btguSUOBHqrxultZUX8M9iikTRGdPpW9gxM3uECKfljxBJquxREKVKFQt8yyuoXOH7n5k67xiZ3yEvUNkOx7+NYKFK1BH9XEFHtSekOJqO8wcZ2/VlMFwTQqLvkmKanao5ua9uKoIapia1m5M/8xvDBVJeb651nFyu342Y6zr4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZcyWWfZuA/MM5ZdfjsI415bhza/UWC4HWQdQgdlEOg=;
 b=KxLoyG0HjX3amPWAKMiuPulYT55NoPN0pqIR578R2eHQtYS4M1+8RE2BgxB7e+D0UGGd1Vv4VmCAx2gv5ub9m1AY0jf3txU6xyE8xjyb0TK3OselLhzsWSnwXAcK2yRBt/ajdKl/e9o7N8CXmpQgzDJ4g4PrLgt552ZMJyECWRmzoY6QpsAadMd4/VcjNINSCxdxjq/D1uiF2ch5dRDZD+wWyN/Xd4/3OqZr/AcgweF+gC894505UQY7QR6oyNK9VvuNu977AJrGJ6u8eLc5WYzl5XxJqn5yNWCPNv4ArKryBlOKqM52xUopwvu4FiyRp32ZGw11QpYQ+gDi57wm5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 by MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 09:35:21 +0000
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c]) by AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 09:35:20 +0000
From: Liu Ying <victor.liu@nxp.com>
Subject: [PATCH 0/3] arm64: dts: Support a DPI panel on i.MX91 9x9 QSB
 board
Date: Wed, 29 Jul 2026 17:36:26 +0800
Message-Id: <20260729-imx91-9x9-qsb-panel-v1-0-4d22fac95e24@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJrJaWoC/yXMQQ6CMBBA0auQWTtJKSLWqxgXLR10jFboAGlCe
 neLLt/i/w2EIpPApdog0srCn1BQHyroHzbcCdkXg1b6pDptkN/J1GiSwUkcjjbQCxvX+u54HpS
 yGko5Rho4/a7X29+yuCf1876CnL/RUaXbdwAAAA==
X-Change-ID: 20260729-imx91-9x9-qsb-panel-3b5d748f00a2
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To AS1PR04MB9287.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9287:EE_|MMZPR04MB400504:EE_
X-MS-Office365-Filtering-Correlation-Id: 27510045-53e5-437f-e90f-08deed54b51d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|19092799006|56012099006|11063799006|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	abafFV3SExxVPARlRp0tzs5GUi3IKRagBAiusYOjOzbr/VqlNH5VdyFOdnBGMuepsXCTUkLfSebqM5DsjdXNpJMth7Be6Ah17Vt0mqZUjLRMv8lBXZ8hRn4mcnDptoKDFMtvu9JThR2IcgR2EqtCy9bHzYeeoGMIN6M+xlf9Da362RHoC5soQutNsCgGW7vjET8YHhmFGOqJohNxxofMyV9hNd2X9XHHym62xSONHfKFJnMp2lv8VHdsSbr0X5KaWdb3YSKAvnAIOUFO9amAlpI0n+QZ4J7zdxdtcXL5jL1mJ9Pd/H5k/KsaHE+NC6bhCc4QhRdxRQv3fsdub8S/LvlJrnYXAM4i86zh7tVl+XX8/ro/l9zplg3KHY+iBgjbIWaw1n9360Mx9UczZRkPHDg4akzga+0Yzy4nNbnzoNosYRUU7BVN1qyN9AU8SLOLuFMNHb72Am0YYyBYsgd8fkw4r/koV64pE57xlFF/7Q133W/fXmbrVbuKzyTbUhCH7gd9onVavUq8GF2FPLhUp5VeuoOKO65EBuct6zg/yn6W638bBNSu4o29v9+W3KH81IKazYCxQN289vn0Ei2AtS7murQ7xX/0OTWHnM8Ol4wJ4y6PfGlHStl1/vuQRmHSAQbKtarm2AaxB/uXqPxwRt4C5jKnJJaPMJIaFcd7qqI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(19092799006)(56012099006)(11063799006)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K28raUtDQ0habVVlSEJYMDVsS3N6S3dsck8xa1ljTmtzYUlITkU3bmtOWi9N?=
 =?utf-8?B?dHlSa25KUjNQcVhrSU83RWdZWk5Jam9aK0R3MUtKUHJ0S05OYnJ3bG9TMkFk?=
 =?utf-8?B?YWw2MDBGbFhkMzVxOUlEdEhsSFVtdFM3alFCNDdLbVJPa0U5dXhHRWdKQkN0?=
 =?utf-8?B?WVBoZXhzclF6cW5FSnYzeFBIK2lpTGdzenJxSVNuR0F0bGh2R1pwa0EzdXk5?=
 =?utf-8?B?dDQ0YURZbHFMMGVDZGhHQ1dTbXNPZGFWOTN2STBCcFhTKzJTR2pNUTUzTjhm?=
 =?utf-8?B?REFCMjNxa29Zc2lnWlhmNHdnK1I0YU44UElJQ3JReTJKTHRFZURndTdyVm95?=
 =?utf-8?B?M0Q1RnFIQjhvTlhEQkEwaE1LWVJKRU1tSnZlTkZYN0ltRmw5RUFJRUhIdlYv?=
 =?utf-8?B?U0g3REVHcWQzOWtSRCtqSFBxWjdNeERDRTFFZTFsZEFvMWdjVFc2WjY5cWFs?=
 =?utf-8?B?VU9Vd1Z0ZzlnUkc0VElPQ1BnTUFLaE1uTnJseHk3ZVV4S0ZLU054VkVYVFhB?=
 =?utf-8?B?S2MxMzdxSXdUUnZKZytaQ1F0RTJlaDBlWFBuWW1IRFprRkVvcHBsT2VvWm00?=
 =?utf-8?B?eXZFZXBQWlZ2R0hzalErbnVFREtTL1hkUTV6SjluRW5Tb0R3aGo3MWxhczJF?=
 =?utf-8?B?cmY1cmJuL203a2FxcWtmNytlQVEwQVRpRTVVT0x5R3BBNnF3cXU3akNQbWsv?=
 =?utf-8?B?UFJnZ3p3a2hBSmR0VlRwT0NoNUtKMkc2ajlCQzJnQmlSVXhFNEVVUC9qcnJ0?=
 =?utf-8?B?a01xeXR2M2N6NzkyWUZobkFyZ3k4ZFdOMEJKUzRVNDljQnR6bHlyUzMrU1pj?=
 =?utf-8?B?RnEvajMzNERNODNTYThCQ3F6TVd1eXp3TndOc2syeHBDeFJiYlNWckg3M01m?=
 =?utf-8?B?WFRnYzVPS2FTd2dNekxBcThZSWM1SjUwUlYvS3ZhNnR1dXVwZzhiR3NQZWh6?=
 =?utf-8?B?Z2ZEQ2NXa0dyZThiKytSbUlmTWJpR1hFT04wQ3VjS0RoUU5ESUllSTB6TVFq?=
 =?utf-8?B?bURTNEhyTlUvcU5ZdXdQU09FSmltRThZbWJmVlA1bS9jVGk0LzVjOE5qYk5k?=
 =?utf-8?B?YkpzS1d3NDROZzFlcG4zMTBGMEUzWGZnclN3UiswdWlmQ3M3N1d5SjhQckgy?=
 =?utf-8?B?MUcxT3RwZE4xQXpEL0R6U3NodlBhTmF3aG9JYUltNEl3NkNJWk9DUTFaYXZ3?=
 =?utf-8?B?eDZmRkMzazdKbndBRVBpSytwUHpYQU52WjFJMlMzUlIra1hxTzBuUmJPZm4y?=
 =?utf-8?B?YkpRK3h6ejVBRUNtb0JIaTc3eFRCT3A5akZWSzlzS2I5UVRSMXFTTHVuaEMx?=
 =?utf-8?B?ZzJNR2ZFNGhycmpwRmYyOFB6NTVFakxoeVRMeE9CV1N6R2ZLaks2bWF6QVQw?=
 =?utf-8?B?WmFNY1R4d2lLTWovMUprWE92a1JMVTIvRm1KcndyTGVqY29VaDRmZDg0Rm0z?=
 =?utf-8?B?L2hwVFpZbjdaNkl0aDY3RVdKcE9GVVFvSmZ2OWdqYldQQnBFaGs1MG8wNmR1?=
 =?utf-8?B?Rnh1Njc3VERQSjF6bkRRZVUrR2xiNWtrTkd1QklBb2twdHVkWFBmV1VKL3Zy?=
 =?utf-8?B?VTZSVllmb0Y2LzlUV3RmYjNxTmhJQ3BOT2tYTnJ5RVR6cGpYNmJwMWd4TjZO?=
 =?utf-8?B?cUtEWVM0Y3RaQVF5bmhSVTJGUDZodER2L1dsMUx5UFZMVWZXbG5zRzlCWEtD?=
 =?utf-8?B?RzcyUDFHOFZ4dEJvM3FGL3BJVzRkUkticHE4dFVVc01HUi9xRi8zSGZ3MVZv?=
 =?utf-8?B?b0FSZ2xrV1hRY0F0NlM5ZVJteUxqRzNHRlYvQjlNa2NXQjJNUTlkOEwyTFg1?=
 =?utf-8?B?LzlMNEpqK1phUXhia09jVEtyMWZPQTBzcHNxSEY3TFdFaFNKSHI5NDQ1Y1pM?=
 =?utf-8?B?YUhYbTBPRm4wclNubjFaQldZVjhoUTZmU09Id1JtamoyL2ZybHlNSmx2OG0y?=
 =?utf-8?B?VUNzdVVLb2R1QmtxMERHcDVSNC9CcUNhbDJoZk5CMzlBTVcranNWU3pjWU1p?=
 =?utf-8?B?UmFqQ1cxdDlkRWE3RzZEc2ZpUGtlalh5eFFhRHY2YlovcGtLVHlkM1pRNW5h?=
 =?utf-8?B?cXNpdHNIZDdiVWp6QWpTZURrNHJUcFM4VG5PSXllOFRjeXlxZVZqZGdUeTF0?=
 =?utf-8?B?SkNYdjFuUmkrakhpZWVzWmsxVlMyczhidk9JUEpxeXErd3lsUHQwSTB3L3hM?=
 =?utf-8?B?MGJ3WmtnSkRMSDRDbStFZFBib3NlV3lEUjVjTGFld1FERUY5QTRTT2FmVlp4?=
 =?utf-8?B?Z3piT09Db3JPUzNuVzVNVUNEc3lpdkMzTGR2SjVqdW9tdk4vQi9HQXdlNVBG?=
 =?utf-8?B?K3Mrb3M0NnZ2ZjdRaEpXdytKd1MxWTl4NytJVFo3VlRjeW84b2lYdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27510045-53e5-437f-e90f-08deed54b51d
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 09:35:20.8600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fC1uDsm28jSkSzAVwwimZH1MRqh4kZJJtSkMYTKiKuRmGTCe9OmQcgwNpVfNqjrRjkumrmzkPTMKVcSj2PJy4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB400504

Hi,

This patch series adds tianma,tm050rdh03 DPI panel on i.MX91 9x9 QSB.
It's a panel module which can be connected with i.MX91 9x9 QSB via
a 40-pin connector and is same as the panel that can be connected
with i.MX93 9x9 QSB(already supported by upstream kernel with
imx93-9x9-qsb-tianma-tm050rdh03.dtso).  Add a DT overlay for this panel.

Patch 1 adds compatible string "nxp,imx91-pdfc" to imx91.dtsi.
Patch 2 assigns i.MX91 media_{axi,apb}_root clock parents/rates.
Patch 3 adds a DT overlay for this panel.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Liu Ying (3):
      arm64: dts: imx91: Override dpi_bridge's compatible string
      arm64: dts: imx91: Assign media_{axi,apb}_root clock parents/rates
      arm64: dts: imx91-9x9-qsb: Add tianma,tm050rdh03 panel

 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 .../freescale/imx91-9x9-qsb-tianma-tm050rdh03.dtso | 104 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts    |  51 ++++++++++
 arch/arm64/boot/dts/freescale/imx91.dtsi           |  11 +++
 4 files changed, 170 insertions(+)
---
base-commit: 3652b49adac266a3d27cb41cdfdb7d8790fc3633
change-id: 20260729-imx91-9x9-qsb-panel-3b5d748f00a2

Best regards,
--  
Regards,
Liu Ying

