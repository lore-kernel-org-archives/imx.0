Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011009.outbound.protection.outlook.com [52.101.70.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D043254A8
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 07:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774511513; cv=fail; b=hlw1575GV3olloXqCY8Hu8mgTCC46517eFOQxePkg29jcWxl0zEjbGREsT2X0GfqmBOdbk+w6E954gIpnv2LBBcLMKFMuLzeE9Cd3nlDp8X8oJYExAIuIpDWJMkyzFndpUX2U1k3CH07RPKfScLzEepmG0Rmu80aa1yKna8Sv5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774511513; c=relaxed/simple;
	bh=C+6u0sdf5s4PYgjhYI+LD0Fw1+LvT0PGl4J+q6o6MD0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=OJuJOfY/ak7IKkhkySuiqZPp3wM+AuVyIC1OP2XS2NS/TUEh/jPgrsWXyMKd1SlMdj/VBx5fpDLHLiJEvvq/TWpIgxhXsVKLh/QLq/Jsh0xUy0ybGP77VI8KBwbNXG9berIMXHIdlGEw5FNXEXdGPM4tGUN+QzYbLLiQv6T8v/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VDPDe9Sw; arc=fail smtp.client-ip=52.101.70.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VDPDe9Sw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZH78CdLZQOJlOlvshtldMF5jbKfgUc2QK4+gPKOV/w++tTQxnXXyvE0cP/Wkl5oGnS6SHRqxeDNNAQ+850eGwc2HC54WCGbizp3mKP41LgIoRbDj4aR0VaASo6q0ASLyEcVwkYNheNQkojvae8vmN4FANskZ4srMNQJz7tXI3xaNKbpMnG0RwYUqYYD4inX6lsR2tN9WJH6H4JzeYJhkXKeHD7oL6fqZlbayFYyBuTYil+pUS7FOut0SK1wZS0n6S4iz9OS7kdoDbDNSVftx8DsEpcwI2yj7UfsWjRSBbggMfL6z3htC31wvoFpUOx4NyBzqPIgemYsz3WKIbe3nsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQPehqMsMelsGXHDbvv95DZ6XtjZOLBZpX9RJgo7Yyo=;
 b=rhG940K9+R5RRw2FC0ElSszKADAj1cqcfEgJmQMde1XT1pYUkhB6ylu6qhT5TeoMYWLcMAO/Ex2yLIKzZNg+yzvBtJmiqx2IuBorPYW7AXGtXG2sROa0QFL9DfhVJyJhPpHLNFEfiExpf1OE0uLico/JIng9n7LseceYrcZo/jz36eAyOD7FRhc7WStJYSE4meYWI1PJfZNA9D71BzlAVuJCJ0BQ73fQDPS5TToytaEB4IJOtamtTuoFVtiI20ESWmOOknlte49+nd+bd3opdZrpKu/AezKzsnh5wcXm8wEpVy7G65/lL/hkrh8dumMrNRWFgDEpGIfXr7g9Hw42Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQPehqMsMelsGXHDbvv95DZ6XtjZOLBZpX9RJgo7Yyo=;
 b=VDPDe9SwiF51NR5pqCOdbdFhJ9Skvml8AR8ETEgsj34fffPJ+G2tUaaLRU3xTW2wWsaqWAXQbH8HRQVnOQ2Ept1XC8n+fxd3G1RpjUC3LBJ2M7xqaYxJPBgsI3E0nZnghkqRY0Tr5sT2jgykCSb1TK+v4rQHWRiQxNUca6LIPyFW3QCcwk1DdOOAaeQpe30KM9tzM0zwsTzmxYWlxf9R6M01uB+BgRJSmcglXu5lCijaFRp5udEasEQKqxRaEhqbPBvc5NWc+MnKBbjfnFHFXJB0O57O5MdIVnkDePteoRIy9zvmu15QPvDriJZ6CUPgX65UzUw8QGki1JN2kRRXTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by PA1PR04MB10444.eurprd04.prod.outlook.com (2603:10a6:102:448::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Thu, 26 Mar
 2026 07:51:16 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::1fdb:9c8f:5400:8bdb]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::1fdb:9c8f:5400:8bdb%4]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 07:51:47 +0000
From: Joy Zou <joy.zou@nxp.com>
Date: Thu, 26 Mar 2026 15:51:41 +0800
Subject: [PATCH v2 5/5] arm64: dts: freescale: add i.MX91 9x9 QSB basic
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-b4-imx91-qsb-dts-v2-5-b991b81639e6@nxp.com>
References: <20260326-b4-imx91-qsb-dts-v2-0-b991b81639e6@nxp.com>
In-Reply-To: <20260326-b4-imx91-qsb-dts-v2-0-b991b81639e6@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Joy Zou <joy.zou@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2P153CA0045.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::14)
 To AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|PA1PR04MB10444:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dd4cd1e-ef1b-4f27-e44c-08de8b0c87bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|52116014|1800799024|366016|921020|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uMQKcFZGf1U8eFB5LklZJQqajx+2AvvXSHvnGfTRozOx5IuhMeqWJZ6BdcBEkfa5hd7m/Sg1NGhrPMEzyHyNHrgTy2R18OPq1JBAx1Fsqwc3erlyenFSkssxT3Vd0S2saNIqPHZhm7kLQD1lTiLIK+RhugdM1etEdlTH/8AUFwkAPlXid3b9xESqML0NJ2puY1YKEDFal0YMPZhFx9Y6XmBQQLpz71wwDEAm7ESRDYdX58uG1BIgwyDFcwsi+f5BTB0n2G7qZQHxk58c0+gU49aKPz4lRphh4ljkBZFLojP9His5OqilUaXlEzrv2pfIpriRemwevM2zg4rM+eaQM9kK6SpAEnrY1+JxeZgqa6/SByBX9NnvBlYTdAHn6bH8Tdw06hpzMCi+hNJkCYcK32JK1FHedFxj/s7CnOZyjRW98A6/GbBM3QAA09pN7QVzdTVb3V2xAyKDmqv2kklWWpzKUKAdQSXSSW1NzO07YvEk/Ug4POGLRLAcRm2nj327fFV5lEjcY7fNzHR36tXsiM5vNboKL7THLaTDCpOFPBcD7/27yVCE2RfDcj7TX/dCmfS/69Eo0BbVKDgLpkJygvICn+FB1sUor1cfYRd1fpA64aKR58VgOEX1ry1J4ZYMSnilnVFY95mGP2pext7jXWpxayabKvypFU7R4VaAJOqXMfmFdqiPtE+ZdvI09fOxbiy0doibENXBBXKUGAs7vTPieWB9lEgD0wf0een0g/xvSO57qQWRrhCAg8cP2Fl/vZ4EY76upInbyhCv6IMERiJ1nWerfpNAm7xEzfzVGqZPlsQOyzb69ebyp8dBFfxA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(52116014)(1800799024)(366016)(921020)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFVGRWJBQXJqS1VoTDZpZERXVlEvRzluUHF6SGFzdUZoUWQ2ZkRHSDgwWnVU?=
 =?utf-8?B?WFZiTHVLaFdIY3dpWGxSZFgrMFpxL2RQUytXOVdxUng4YjEzLzZYQnRRR0hU?=
 =?utf-8?B?VjgvdzBicGZNRFE2MTJLMGRkbUFSQkN6M0s4VVJLN1FzMGExcmkvS3E3a2pZ?=
 =?utf-8?B?ZkFJWEkxWGU1QTlQVHF3dEhHc0hMUi9xRjF1L2t3blZ1MVBKOEtteTZrSysx?=
 =?utf-8?B?cVNlRFFIdEtsbVZnSVVBTWRSN0lENmJrbnU3bnRKNG53cElFRjBTQm9DeEVK?=
 =?utf-8?B?c1V6eUZUTVYyUWtTQWRaQk93Q3ZFZXpsQ3FkWDYvMnZTRUdBdW9xZXJTdEZF?=
 =?utf-8?B?Rmxtd3dWcSs4SHhrMk85T1RwRm5raXM2ZWhsbDJVc2hlSzNndWhwSUc2VzYz?=
 =?utf-8?B?cTRuWkNWRHNXOUYvN1MxYkUyVmwyNHlReFBQOUNFeXg2MWhUVXNoR2JyZEll?=
 =?utf-8?B?dkNuTEUrL3lYOU11a1REVE5MMEdNWXJiTGYwajZZMTNtZUl5NEgzRlpYYTZX?=
 =?utf-8?B?TDIyd1hXS3h4d25xalMzWXliSmIxOHRnT2dhckx1dWgveGJORXBxMHBZS2dF?=
 =?utf-8?B?V3F2MVFCaS9lcElaNmNneUdZajErQUNPS2FXSVdKN2lLaHQ0RzcvY0dsUUFs?=
 =?utf-8?B?ZnVkNUJTUFUzbmJ4SWU5NFBNREpZSWVBVXZ3a0FWMmlnc05ZRXIvNGg4bkVq?=
 =?utf-8?B?WElvWThIOUZNUzByVDFFdzNmU1lndnhMckdSaEE5eFVlc054TlZ4dDN1TTlX?=
 =?utf-8?B?Z2N3ZjR2UlZ4NVJ4KzNIOGJ3RUJ6cGtmSjNMbG9vaE1UbktqT3MxV2x3dkhG?=
 =?utf-8?B?ZlpSdU5vUmFIR292TDVoWnFSYU9vUmdhMW51Mys3ME5HRGh4a2FzSENWV1FO?=
 =?utf-8?B?Y2RsQnBiczlpbFlaaEo4OFloN0NwNlNqWjdJQThPK1dZai9KL2FFcjdac3Y4?=
 =?utf-8?B?M2FESWRhZVpxOVJOam0vclVDeVJ5Mng3RFE4SU9ZN0VaWDVPN0YxYUpNMFp6?=
 =?utf-8?B?clc2ZkNhRlFJOXZvMG9ZODlXbjBnVzFEblVUREtnYlZvSDU0UzhkRVEzQ3Nt?=
 =?utf-8?B?NWFndHA2cTBpOUJGdUxKcUpvb25xSlF4OTJXSDB0dUc5Y0pLY0Fja2NaVGhD?=
 =?utf-8?B?d0pGM01ic0p2a0UwVUp1Y2NFUFRsYTE4cXdETTV4dVVTMDZwRlBObzFubzAy?=
 =?utf-8?B?eXZUM2tkNGdYWEVTS3lYOFhoUnFTRWY0U3daSDhoOXh6V21ENTdudmoreU92?=
 =?utf-8?B?WUhOdVNFSzAwR1g0bFZENEZ3UytOUkxUcFVyQklTUVM5RWZseW0rMkJjZ1dk?=
 =?utf-8?B?THFSdTc0eVljb3VYUHN6ZEgvTTdLVytwRzJuSnNyc2NlbVhmd3RaR2F2UkNC?=
 =?utf-8?B?ZzNaN1grazRPS2pORG5MajllZW1QWGgyWXlEYVc3dzhRNm1xeEZHL0tCT1Za?=
 =?utf-8?B?ZmVlM0pHb0tUSVl3eWRtUGloVmNoaUVIWDdrcmNWWm1HTmFzV0ZHSXZYVnZj?=
 =?utf-8?B?NzdHZERRcjZMM1N1aisxK3piYW05d1JEY2VoTUI1d2xtenVsZXNkbEVSQW9j?=
 =?utf-8?B?TkRjZkI1R0xzd2VsbmN2TmhMZEJVbFd1SHF4MDdBWk42cUdOeHB3K25GMnk0?=
 =?utf-8?B?eEhiRk1OaVB6OVNGVzNkc2FyQnUzT2trVE5lcmg2RGN4V2dlbWZXN3hzN3Rt?=
 =?utf-8?B?b2hQeXJhR2VzL2xCZkFrUGQzeUErNTUzUVdaNlViU1o2TTBSaXRRVm1vUHFa?=
 =?utf-8?B?OEQwK21zQ1UvOHpsNWlnK2w4TGFHL2JCcEoyenVobDhKRmsrR1p5N1J5Q2o0?=
 =?utf-8?B?aGlGNXlNZkZtdExJUUN2M1ROSnRSVGx4ZHo2aW9mUk5iWWFZWExhWUtzM1NX?=
 =?utf-8?B?eWhaNmt4MUtjVCtyc1RoVEVuUFNNVnBVVnU2M0FINGI0WkNOc1Q3SjN5R01F?=
 =?utf-8?B?ZUtXTzllV0VKUmg1dHBTUmJPRzd6QjZKOHV6T0VJd1Q2NWVrd2FLNXNZRkV3?=
 =?utf-8?B?NGJjWU15a050WGdNSys2bDBHeENZTjZFNW1DNkZaU3ZIL3AyODg0bjVwRGl0?=
 =?utf-8?B?REc4eXMrVHNtSXB6VU90bjhNTzRHUGw2WWxzY3VvajFWR2thTXZiTVZSTlBq?=
 =?utf-8?B?c3BXRXNZRm5LWWFDQWNzd2RzbnNHMlM1TFFiV2tpcEU0Q3l3dmxuSHBGVGhO?=
 =?utf-8?B?YTdXdTd2dUtrRE1tdEZKSzU5cFpabkNjelRpelFvanZPaG8xYlV2OW81WUZs?=
 =?utf-8?B?QmZBRjE3S2JVS3g2dEE1Z0tzNEFqQUg0WkppQ1hZY2QzRVZqVTBNVSsyNmNz?=
 =?utf-8?B?bUdBTGNzNDlrLzlLeEwwNG9oY0hLTmlqRWRwNEJlZVJGVHZzb1JsQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd4cd1e-ef1b-4f27-e44c-08de8b0c87bd
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:51:46.7958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wChVbPwOXOaY+4kz3nxP62WPvREqpt7F1K4MRtCbPeaqeuICtqgz8SgdYbv73Q+i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10444

Add i.MX91 9x9 Quick Start Board support.
- Enable ADC1.
- Enable lpuart1.
- Enable network eqos.
- Enable I2C bus and children nodes under I2C bus.
- Enable USB and related nodes.
- Enable uSDHC1 and uSDHC2.
- Enable Watchdog3.

The board description can refer to the following link:
https://www.nxp.com/design/design-center/development-boards-and-designs/IMX91QSB

Signed-off-by: Joy Zou <joy.zou@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
---
Changes in v2:
1. Correct GPIO pin number typo: <&gpio3 00 GPIO_ACTIVE_LOW> to <&gpio3 0 GPIO_ACTIVE_LOW>.
2. Add whitespace before brace in BUCK4 node.
3. Remove one level of indentation for rtc node.
4. Remove clock-frequency property from mdio node.
5. add Reviewed-by tag.
---
 arch/arm64/boot/dts/freescale/Makefile          |   1 +
 arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts | 425 ++++++++++++++++++++++++
 2 files changed, 426 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index bae24b53bce6d33a6929d7c6b3f8c1a70911c5d0..382094fa220ab6c388d182be179a82eefed74b45 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -412,6 +412,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-9x9-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx91-9x9-qsb.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-frdm-s.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
new file mode 100644
index 0000000000000000000000000000000000000000..1239bbf579da44ab3f4be2dc566c53a1e5db6c05
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
@@ -0,0 +1,425 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/usb/pd.h>
+#include "imx91.dtsi"
+
+/ {
+	compatible = "fsl,imx91-9x9-qsb", "fsl,imx91";
+	model = "NXP i.MX91 9x9 Quick Start Board";
+
+	aliases {
+		ethernet0 = &fec;
+		ethernet1 = &eqos;
+		gpio0 = &gpio1;
+		gpio1 = &gpio2;
+		gpio2 = &gpio3;
+		i2c0 = &lpi2c1;
+		i2c1 = &lpi2c2;
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		rtc0 = &bbnsm_rtc;
+		serial0 = &lpuart1;
+	};
+
+	chosen {
+		stdout-path = &lpuart1;
+	};
+
+	reg_vref_1v8: regulator-adc-vref {
+		compatible = "regulator-fixed";
+		regulator-name = "vref_1v8";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		regulator-name = "VSD_3V3";
+		off-on-delay-us = <12000>;
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0 0x10000000>;
+			linux,cma-default;
+		};
+	};
+};
+
+&adc1 {
+	vref-supply = <&reg_vref_1v8>;
+	status = "okay";
+};
+
+&eqos {
+	phy-handle = <&ethphy1>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&pinctrl_eqos>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clock-frequency = <5000000>;
+
+		ethphy1: ethernet-phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <1>;
+			realtek,clkout-disable;
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX91_PAD_ENET1_MDC__ENET1_MDC                           0x57e
+			MX91_PAD_ENET1_MDIO__ENET_QOS_MDIO                      0x57e
+			MX91_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0                  0x57e
+			MX91_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1                  0x57e
+			MX91_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2                  0x57e
+			MX91_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3                  0x57e
+			MX91_PAD_ENET1_RXC__ENET_QOS_RGMII_RXC                  0x5fe
+			MX91_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL            0x57e
+			MX91_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0                  0x57e
+			MX91_PAD_ENET1_TD1__ENET1_RGMII_TD1                     0x57e
+			MX91_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2                  0x57e
+			MX91_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3                  0x57e
+			MX91_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK  0x5fe
+			MX91_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL            0x57e
+		>;
+	};
+
+	pinctrl_lpi2c1: lpi2c1grp {
+		fsl,pins = <
+			MX91_PAD_I2C1_SCL__LPI2C1_SCL                           0x40000b9e
+			MX91_PAD_I2C1_SDA__LPI2C1_SDA                           0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c2: lpi2c2grp {
+		fsl,pins = <
+			MX91_PAD_I2C2_SCL__LPI2C2_SCL                           0x40000b9e
+			MX91_PAD_I2C2_SDA__LPI2C2_SDA                           0x40000b9e
+		>;
+	};
+
+	pinctrl_pcal6524: pcal6524grp {
+		fsl,pins = <
+			MX91_PAD_CCM_CLKO1__GPIO3_IO26                          0x31e
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		fsl,pins = <
+			MX91_PAD_SD2_RESET_B__GPIO3_IO7                         0x31e
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX91_PAD_UART1_RXD__LPUART1_RX                          0x31e
+			MX91_PAD_UART1_TXD__LPUART1_TX                          0x31e
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX91_PAD_SD1_CLK__USDHC1_CLK                            0x1582
+			MX91_PAD_SD1_CMD__USDHC1_CMD                            0x1382
+			MX91_PAD_SD1_DATA0__USDHC1_DATA0                        0x1382
+			MX91_PAD_SD1_DATA1__USDHC1_DATA1                        0x1382
+			MX91_PAD_SD1_DATA2__USDHC1_DATA2                        0x1382
+			MX91_PAD_SD1_DATA3__USDHC1_DATA3                        0x1382
+			MX91_PAD_SD1_DATA4__USDHC1_DATA4                        0x1382
+			MX91_PAD_SD1_DATA5__USDHC1_DATA5                        0x1382
+			MX91_PAD_SD1_DATA6__USDHC1_DATA6                        0x1382
+			MX91_PAD_SD1_DATA7__USDHC1_DATA7                        0x1382
+			MX91_PAD_SD1_STROBE__USDHC1_STROBE                      0x1582
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD1_CLK__USDHC1_CLK                            0x158e
+			MX91_PAD_SD1_CMD__USDHC1_CMD                            0x138e
+			MX91_PAD_SD1_DATA0__USDHC1_DATA0                        0x138e
+			MX91_PAD_SD1_DATA1__USDHC1_DATA1                        0x138e
+			MX91_PAD_SD1_DATA2__USDHC1_DATA2                        0x138e
+			MX91_PAD_SD1_DATA3__USDHC1_DATA3                        0x138e
+			MX91_PAD_SD1_DATA4__USDHC1_DATA4                        0x138e
+			MX91_PAD_SD1_DATA5__USDHC1_DATA5                        0x138e
+			MX91_PAD_SD1_DATA6__USDHC1_DATA6                        0x138e
+			MX91_PAD_SD1_DATA7__USDHC1_DATA7                        0x138e
+			MX91_PAD_SD1_STROBE__USDHC1_STROBE                      0x158e
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD1_CLK__USDHC1_CLK                            0x15fe
+			MX91_PAD_SD1_CMD__USDHC1_CMD                            0x13fe
+			MX91_PAD_SD1_DATA0__USDHC1_DATA0                        0x13fe
+			MX91_PAD_SD1_DATA1__USDHC1_DATA1                        0x13fe
+			MX91_PAD_SD1_DATA2__USDHC1_DATA2                        0x13fe
+			MX91_PAD_SD1_DATA3__USDHC1_DATA3                        0x13fe
+			MX91_PAD_SD1_DATA4__USDHC1_DATA4                        0x13fe
+			MX91_PAD_SD1_DATA5__USDHC1_DATA5                        0x13fe
+			MX91_PAD_SD1_DATA6__USDHC1_DATA6                        0x13fe
+			MX91_PAD_SD1_DATA7__USDHC1_DATA7                        0x13fe
+			MX91_PAD_SD1_STROBE__USDHC1_STROBE                      0x15fe
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			MX91_PAD_SD2_CD_B__GPIO3_IO0                            0x31e
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX91_PAD_SD2_CLK__USDHC2_CLK                            0x1582
+			MX91_PAD_SD2_CMD__USDHC2_CMD                            0x1382
+			MX91_PAD_SD2_DATA0__USDHC2_DATA0                        0x1382
+			MX91_PAD_SD2_DATA1__USDHC2_DATA1                        0x1382
+			MX91_PAD_SD2_DATA2__USDHC2_DATA2                        0x1382
+			MX91_PAD_SD2_DATA3__USDHC2_DATA3                        0x1382
+			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT                    0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD2_CLK__USDHC2_CLK                            0x158e
+			MX91_PAD_SD2_CMD__USDHC2_CMD                            0x138e
+			MX91_PAD_SD2_DATA0__USDHC2_DATA0                        0x138e
+			MX91_PAD_SD2_DATA1__USDHC2_DATA1                        0x138e
+			MX91_PAD_SD2_DATA2__USDHC2_DATA2                        0x138e
+			MX91_PAD_SD2_DATA3__USDHC2_DATA3                        0x138e
+			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT                    0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD2_CLK__USDHC2_CLK                            0x15fe
+			MX91_PAD_SD2_CMD__USDHC2_CMD                            0x13fe
+			MX91_PAD_SD2_DATA0__USDHC2_DATA0                        0x13fe
+			MX91_PAD_SD2_DATA1__USDHC2_DATA1                        0x13fe
+			MX91_PAD_SD2_DATA2__USDHC2_DATA2                        0x13fe
+			MX91_PAD_SD2_DATA3__USDHC2_DATA3                        0x13fe
+			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT                    0x51e
+		>;
+	};
+};
+
+&lpi2c1 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c1>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	p3t1085: temperature-sensor@48 {
+		compatible = "nxp,p3t1085";
+		reg = <0x48>;
+	};
+
+	ptn5110: tcpc@50 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x50>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
+
+		typec1_con: connector {
+			compatible = "usb-c-connector";
+			data-role = "dual";
+			label = "USB-C";
+			op-sink-microwatt = <15000000>;
+			power-role = "dual";
+			self-powered;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+				     PDO_VAR(5000, 20000, 3000)>;
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			try-power-role = "sink";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					typec1_dr_sw: endpoint {
+						remote-endpoint = <&usb1_drd_sw>;
+					};
+				};
+			};
+		};
+	};
+
+	pcf2131: rtc@53 {
+		compatible = "nxp,pcf2131";
+		reg = <0x53>;
+		interrupt-parent = <&pcal6524>;
+		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
+&lpi2c2 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c2>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pcal6524: gpio@22 {
+		compatible = "nxp,pcal6524";
+		reg = <0x22>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupt-parent = <&gpio3>;
+		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		pinctrl-0 = <&pinctrl_pcal6524>;
+		pinctrl-names = "default";
+	};
+
+	pmic@32 {
+		compatible = "nxp,pf9453";
+		reg = <0x32>;
+		interrupt-parent = <&pcal6524>;
+		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+
+		regulators {
+			buck1: BUCK1 {
+				regulator-name = "BUCK1";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1140000>;
+				regulator-min-microvolt = <1060000>;
+			};
+
+			buck2: BUCK2 {
+				regulator-name = "BUCK2";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <900000>;
+				regulator-min-microvolt = <610000>;
+				regulator-ramp-delay = <12500>;
+			};
+
+			buck3: BUCK3 {
+				regulator-name = "BUCK3";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3450000>;
+				regulator-min-microvolt = <1650000>;
+			};
+
+			buck4: BUCK4 {
+				regulator-name = "BUCK4";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3450000>;
+				regulator-min-microvolt = <1650000>;
+			};
+
+			ldo1: LDO1 {
+				regulator-name = "LDO1";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1650000>;
+			};
+
+			ldo2: LDO2 {
+				regulator-name = "LDO2";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1890000>;
+				regulator-min-microvolt = <760000>;
+			};
+
+			ldo_snvs: LDO-SNVS {
+				regulator-name = "LDO-SNVS";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1950000>;
+				regulator-min-microvolt = <1650000>;
+			};
+		};
+	};
+};
+
+&lpuart1 {
+	pinctrl-0 = <&pinctrl_uart1>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&usbotg1 {
+	adp-disable;
+	disable-over-current;
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	usb-role-switch;
+	samsung,picophy-dc-vol-level-adjust = <7>;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	status = "okay";
+
+	port {
+		usb1_drd_sw: endpoint {
+			remote-endpoint = <&typec1_dr_sw>;
+		};
+	};
+};
+
+&usdhc1 {
+	bus-width = <8>;
+	non-removable;
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	fsl,tuning-step = <1>;
+	status = "okay";
+};
+
+&usdhc2 {
+	bus-width = <4>;
+	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	no-mmc;
+	no-sdio;
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	fsl,tuning-step = <1>;
+	status = "okay";
+};
+
+&wdog3 {
+	fsl,ext-reset-output;
+	status = "okay";
+};

-- 
2.37.1

