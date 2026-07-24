Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013019.outbound.protection.outlook.com [40.107.159.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C623CD8BF
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 08:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784880947; cv=fail; b=r6N96IBKyECHgQ09FBVzzKHFC4y15Nd2EvNuh48Nkh+gOWaYlRKuLzXFFxQ7Xi0wUjgvFI+5vU3FZb6AC2ZPAD+9KXIk104u1NqfCpqAkT/Jc1Ggrv/Wf19Wjbj03CK/J4ksbOIGj6UR2Z3GVfxrWg9BliCyrgcdqgwsmbEk3+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784880947; c=relaxed/simple;
	bh=eisH3ZzrDh+hLBa9c2zZk17ChWgErwwFwnskuaDb/2s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GfW+LND+Tk642ln1o851l6ZmPxR/nOq4Xlsady08q+qeeQkRVq4q/yNk5kCP4OMLESvJkf7ilaNW6cz9uZkwqiyO0OLR0WBrZj09x+hQa2jzlPZe8Q3pFsQ7EX4px/sB1xUCWW0w6rwWTIZaS14mjomswbbQTWgiayJNF+X/n+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=B21Gnk7s; arc=fail smtp.client-ip=40.107.159.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="B21Gnk7s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQykeI00FJubxMZIqbKEPAu1Qcc/hbuQGldY1TEPI5dKNE99gZqFR/p7QLUBjCtBzOzU07/lKqpJ4bEEuDkClYPiFZwwMRx+FWfWdDU6CJShjIrjJDgI25W+KwQFlCRNVCqiIWtI4123m540zmqAoeb5qxjlHz4GAjYHHrafYG4HhMvBG2/kdSZ7eeO0mRIaMbhdEvzDfN62I+Ot6XpYOIjKAgUTByfXJXj+Fqo1A2sHBVA19lLCd3GjMLHvcuyZP8c58kYKgWkLq325hSLfN/euV+CTSguNcIdojluN62+J/3rEz7JhX/MTORgR0TmiNtW+reibVjyj30oPZvDKBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKjiIt9hYDPiE/hdIlDvt855PXBC9SRffRl/W4QGM1E=;
 b=qF9p7Vrwvva0vYrknxSMSJT+o0eu091fUR/hU5L5FWaP0eH3lqvkpESVFSQxzlV/AlE4bxsoZMnxceFwjxL63t4sScatmG+cTAfa4OsyWQ3PsqcUzjdRW7RX0MWWQ2ygXP1uLc2xqNawi5j/2uuX5W7ytZrINzfEX91e81dTe+QtrLrSz1h+EXuxNCGmwsLBg7lbIpkP6MTmfNCmtPN0sH8+OT8MjaDDGeGw59riop3jAeBvE+KU7wLr/Kye7EKinnjLJuOeqvt4Eoi6Btagod8JEBueiPkiHKz12+cRhv9qwfC79TNEyEfz0+RCNRXRUIcRNUJxaIA9QtNZghGkjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKjiIt9hYDPiE/hdIlDvt855PXBC9SRffRl/W4QGM1E=;
 b=B21Gnk7s8WeSK1v6g29WVfKjLfvRWLVHA+ox2CKiNORdItG7WdHmgBkv90wanLkciYT4Q40wKylF0zvTlh/aCP3Vm7xVIqwpEQAPnrHMhbKlaHl8LRbSTwuWkwvbI1UnltlywDCwV42OdvfIWNxZJdXQfmF74fh45QNsHmWZcVo46f4fDeM7A4gaGXYjSRP6rslC1qrXAbIktHJSMv477vHrna4Fp/AMA2DZtqlwfzpyla3DhoWEQ1n2qAM5gep31+rFeRCHCAFK84pDfyf4nsyTtxVacSXmXkK+a0HMj3qw6PsWg/9GAPO5f9uY0U6yh0sHrpSC5+LOKPZBfEKNEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AS8PR04MB9048.eurprd04.prod.outlook.com (2603:10a6:20b:443::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 08:15:16 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 08:15:16 +0000
From: pankaj.gupta@oss.nxp.com
Date: Fri, 24 Jul 2026 14:35:14 +0530
Subject: [PATCH v30 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-imx-se-if-v30-6-ce8ba256692c@nxp.com>
References: <20260724-imx-se-if-v30-0-ce8ba256692c@nxp.com>
In-Reply-To: <20260724-imx-se-if-v30-0-ce8ba256692c@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784883913; l=1315;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=/Cm38yt4M/hkBFoKCi0zK1fscSGHpPw358A2kZ01vrY=;
 b=rv0Rvd13zQ4u1FlMyMd4zpfxLVpXePDUdu+NCvJx7+vHqMCqGbAtUoxsaJxYgmExfRXmcFZiG
 1Wbqxur+lZSD0KXtSXCqycxRtvx76m3mifM/vhT1mRboOS/wb9tnMm8
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA5P287CA0251.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::12) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AS8PR04MB9048:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d1f9e4f-22e6-459a-c9f6-08dee95bb1b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|376014|7416014|1800799024|921020|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	3W9kiIAbO+zmCIdZA2QIaST0ImxuXPfgyzfpR+1lzpjU1bbEfcu2Ik64LrbvHBcr0toOTka+10KLCxr2EmzXJAhiRviv3CHsoaNvD/9mnrw/eFb3huOjdzCG+681Gq6QENg+fDT6qPqpA2lfcQXMpsadzGJi7+WqVPk3WKdR+cVDWVDaRMOJUvTtytU+HavJL9ckWRhJqT3sVT6jp0y9URB92pz5FbPcqQOyAuRpLClMBYwxzqijM1r+E7DIbvnmaWStDMoVZDJCQM7IDT78y8rrW0LvZ6o2/UPKmd/qz2pbS8ZGPp5n47JRvqGWgSuc5a6AjeYi70Lh2T6ojzxIn+wdSAhnvj5HsbpT4WWqaT6iSYzsxru034JPOHX0LjgORgFxZP3c8q2Www6J2p1clyRmBbc0l8Ifa5cfUttqO6CDZhSZEi8szjBHGKt4idAxjxOSpho5ym8E5vrhw0m4pS097mM1FvIeXN4VSC5Pk6lWdgvdbOCKX74W3jbxclrkVakvIX3Hh8P8Qr1hcj+SH4GY/3hGLGKNE2YjILgHnc2NN2/ZobgbGuXevxEDCcXQzVpis3kF/7uAgYPev1RxH+VFvJm6pvBpVNSW+00c+lrtXnFtzLukzdzTvcS9R4Ka0C4Qnj22WLgLCPO/w5uIz9HxtmTSq0M9FqyOlrGr4BoZbV7+iqDW8PvAISgR5ijHkixxBw5RPoCf2Hx4kw4cSQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(376014)(7416014)(1800799024)(921020)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGVoMzVSRzNvTmhuZ2VCSHV3cWZlU29yUjB4YjdWc3lCU1ViZUgrSmZnQjI2?=
 =?utf-8?B?UFM1NndLRnpwZ3VhK25oRHFOenN4VXpZSDlST3pVZEN0eTI0Y0k0RnBmL1dU?=
 =?utf-8?B?VjJmVmFRaDNIbXdPdlJVcU9COThYQXJQVlZkYU5YSXNUZXhNc3VMZDl6S05B?=
 =?utf-8?B?dzdmYUwrbkR1VkVaSGpoZUdtMHlsR092QlE4QmdnUTQzZkhyeXI4VmNaR3B0?=
 =?utf-8?B?dDNDM1JBeUpMaHhhYUdSU3FGMVZRQzA0YVg3cGhCdHpzcUpsRGYvYVVhZmhO?=
 =?utf-8?B?MmhBcFQrci9NWGFxZ0Mxa2Q5azFTeU4wRHhUaVNReDlIajJzVkM5dWF6WW5j?=
 =?utf-8?B?NFZWUVcydmNhS3BaL3Ewd1RzSXFXbXJmVjJ1YUJ6cFRTa2lLRzlVRDZIWWsx?=
 =?utf-8?B?S24wNmZNczkxblRmRDZvNjFKc1BQSGkwZkF5S28rdzdnRmZWMjBqOVEydnV1?=
 =?utf-8?B?SHVaRVA1RVlpMmo2SHZCakMyTmVqOHEvUDRHVnV1WS9mRUozeGhKenB2Y0gv?=
 =?utf-8?B?SXBuSmNKWkZZVUxzSTlJU3JjUWRVS0l5aXNLMkFIZEVjZ2VUeURXQzViUUcr?=
 =?utf-8?B?NFZMdHRRd1VhRHFUZ3pzeS83ZWVrSGpHN1dUdGVNcklDWHZEOUJIUEZRTmFn?=
 =?utf-8?B?OTBrMWovaldOcEFqS004dVJFZTJuSHlJSUs5bTIzSjdGdGdPLzNEWlFRVytV?=
 =?utf-8?B?dnlUQ2xhT2drdjdoWW84Wnl3N1hEY1BGRk5CTFAzZnd5a3o4dXg1RTRibVZk?=
 =?utf-8?B?UmJicUwxTHlYNnN4TERRZkdLOFBzQmdialR2dUlvTUlrcGk3THJpMVZsUk9W?=
 =?utf-8?B?V2phdlRkajJZMWFBZUovemtiOHBoVW93cDAyOEQ1WXl3V3ZFa2RWS3RhRnVu?=
 =?utf-8?B?YnN4YjJLNGxhLzk1S28vTDVpR1F2bU9iaE5BaityOEM2UWd1OEpib3N3T2wy?=
 =?utf-8?B?bW03UGRxbm1rbGhqUEZQUlBPYjRNLzJwSmhSK1o2ZGpPdkVXS2hBN1ZsQXZ5?=
 =?utf-8?B?bzdxeEh3Y2JxdkFrcTBXTkZDYUluR3ptanZaZ1NpSEJrSmhVQ1dMclJnbnBj?=
 =?utf-8?B?NEVxZStKMWR4TENVQWpJYjF3VHdyS3RPYTdzai9Nc3B3U0NlaTBuOXNxRU5h?=
 =?utf-8?B?YSt5MU1lUVZhek0xUWw1b3JjVGVtL25WZ0h3S2p6RTlFL1FCYUNVTEltRW95?=
 =?utf-8?B?MUNrZSs3Q0VCa3VEdCtDZURvc1FZMVlPSUJvanZhT20wMEhFM1JGK21UcDBq?=
 =?utf-8?B?dnMxckw2cnZZMXN3Qk55ZVpFUzVQSEpCUWFJeTFOUEtVOTBaamRYZDBoZnZw?=
 =?utf-8?B?YmM5VHR5dmFIVU5GazFpY3E2ekIycUdVbFhTTldnbVRoL0ZEenN4WXd3Nkdo?=
 =?utf-8?B?UDliN292VG45L2VNTWtzYnNpOUloaW5PbzJETWRiNmpFRkNOQnRjbzA5eHlh?=
 =?utf-8?B?WWFqS1FkajJVby9haEIyVjdxVGFNWkw3cktRaDdBRzF1THNtMjhUY001YnJx?=
 =?utf-8?B?akwwbCtXb1B0SWdzNGR5dXNTRVBJMEdUTDFEbkc2cUdaRGtyMjZUZU45cjMz?=
 =?utf-8?B?R0x6TUI2QjdSUnFuZjQ5c0pqV3crZUtDT0kvM1B5ZTJzOEdlb1Jwci9ZSmVy?=
 =?utf-8?B?MEw0TVppWDNxa3k1ZWd2eUM2dExMT1R3UHR6Y3Z5UUt3d29XOGhXWENydm91?=
 =?utf-8?B?SGZhQUdITytCbzBuUmd6OXFNN1VEcmN1Y1I5ZDJFL1A3S1hmL2h5SFl3Y0x0?=
 =?utf-8?B?cVVKbklPOVkzWS82N1ZaV3ZLaktBWjVESWFNVzlIVHBwTUVJMHRkS3RpY3ox?=
 =?utf-8?B?dVZHUDhseHNHU2NTOEcrN1JwQlZzeWZTblB5VTgwOTdtdWg4V0NLRCtRa0Fr?=
 =?utf-8?B?OXlVZUxlM2JnTDc0RTd4TnBHQlBEaWZ4NVRxSENuamdHcy9JWHhXS1pDbC91?=
 =?utf-8?B?YjFPOUFOM0FucEFQNXp0ZDNyQlFiWkFmS0lPZjJCN3hjU2JyeXFQVDRTY1FN?=
 =?utf-8?B?MFJMVHJOYjNoZnNpV2dramtYMDcvcG9jai9WTjJpZktyL2U1b0JHVTZSNVAr?=
 =?utf-8?B?QmhVMlQ0TWNYYkNzbWQ3VlhhcjFVOFNKMDU4U2I1WnVRbWtNSjNaL3dBL21x?=
 =?utf-8?B?Z0dGTStISjRNaG5mMENpWmJiVkl4K2t2cnZOY25zandVL1NVMktiNlMxZGZ6?=
 =?utf-8?B?NElzQlFTYlNoeWo3Q1V1LzBhb3hVZ0U3cG8xZkdFeWhoZk1uYkxyMzh3YllQ?=
 =?utf-8?B?N1REaC9TTHY5NSs5UnoyYTNoMTQ2K3Bxbzc5WnNyeXI4cVN5OVpEakg0b2pZ?=
 =?utf-8?B?dEJZeWpLRXBOZFBhNjdQWjBBVXJWQXdWa1lKdkVPU0lxR09FSjRvRGV1V0dl?=
 =?utf-8?Q?XgghJSXRYs1aPBYKPbuTK3ZtEwkKMumcPylv7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d1f9e4f-22e6-459a-c9f6-08dee95bb1b9
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 08:15:16.7225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z6/Dq3dc2mo+QXM931HHPPM+tDvq+f076RtBYg2sW9laFQt9PCgEbbdpCfgs1G5AjNP8CeeN/Y7qzKXI1o6br5HU8Wm/7FkGhvsBU22wdqx0oOZio34nmAEeQ6yWPqzS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9048

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add support for NXP secure enclave called EdgeLock Enclave firmware (se-fw)
for imx8ulp-evk.

Add label sram0 for sram@2201f000 and add secure-enclave node

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index c6d1bb9edf38..182f1444b643 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 #include <dt-bindings/clock/imx8ulp-clock.h>
@@ -153,7 +153,7 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@2201f000 {
+	sram0: sram@2201f000 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x2201f000 0x0 0x1000>;
 
@@ -185,6 +185,13 @@ scmi_sensor: protocol@15 {
 				#thermal-sensor-cells = <1>;
 			};
 		};
+
+		hsm0: secure-enclave {
+			compatible = "fsl,imx8ulp-se-ele-hsm";
+			mbox-names = "tx", "rx";
+			mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			sram = <&sram0>;
+		};
 	};
 
 	cm33: remoteproc-cm33 {

-- 
2.43.0

