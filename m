Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010017.outbound.protection.outlook.com [52.101.69.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0881D3603EC
	for <imx@lists.linux.dev>; Sun, 29 Mar 2026 12:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774789140; cv=fail; b=g0nRBfANSYT7hAoYfOpwzinmpWB8z0AyQ9oF+dw3S0Rilp3KHxMw0/+DKuW1Czb7GnOM9MhI9uvZ2bzY7jxcV24AVUwNXEXbSL6pjcHxCZWpuUJVgxJ4G9uO6eovy00apqMelMHwKTOJDgHaNid4jBBFXJXfQmVcJjoQQhbF4cw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774789140; c=relaxed/simple;
	bh=hTbpaJLz2AcGOGNERZ2C8vG7gl7gms40P2RnbMOpnlw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=cQTx07QF1uEoQDf0VyknO/9PJ+vGNqf2szb6og1MJcdzlvLNAATvR8DWw0LppT0xBpSIJSt09JuPXNW9an27tguWgySWT5dCp1B//54mwDxEFlyJw+buTHl7vv1VF/mkkqYg6+cAinaCo1ui8S4+0Hx0IfhzyulJx8Mw9vNMyYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ftj64SGV; arc=fail smtp.client-ip=52.101.69.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ftj64SGV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVrZcTO106b3d/cjfJpR6PUaHc18lxzqhJyczJE3Y657c7y9ie9ZKxXtYDQb/QYV4RWzN5T8D24MEEGu1jSt1Vr+OHpPaXcMzTvf+Ez+6V37D404DL4pG9jAl5vFzICJb0I01q8ZdyjfDhgjB02ZkZpDauP+oivDnchVHREgUJqO9XLbh7TOAceP4G6QtiOu9Vz4mvm/3N9eYlVcU2xfCtL/oFUU2sr+IEHXD078g4m6VrevC6+B1Q0eH66WAqy1fLrQKlGwLq8XLb7ewww+9IC//TpfXic8XG6GADxL+Ad6mtQq5YBeIc7V2st2d06CAd35KVdBQ7iYkAs8OYnDTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qts/5EWh7cMXzaegHSqzSYnPCdozjxcLvsfyy3exWw8=;
 b=IbjAFkr9+UWR4ASrKC3ZfxOzbdY4grtOeBHEXryfT7JVzBLL2B2YcaTh4MAMywbDXEPxMs+jht5DLrvc3Xk8zyyYKSOClGMXKbl/ov9+qx5asc3o+Z9818JRb35Vepz9XEUt9vfjtPmlO2C4vZcIGK5k8ObAg3DCSdfE6G6eC5BvxGZAYlWir4QF0OtWDJ5hiruudMS4l7AaLTAQjiAkHX8ZvOMauUiJXGUbcYPIHL1RFWf0QrPh1rr7yGAnu7quypl/vSk0+H3jxGOOVOIzVXgrWEYw6pgE9df4ZynfPFngcoGN3WW7ED+cWeCFIvrReq7ghIB9Z4YaxXc+9h6VLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qts/5EWh7cMXzaegHSqzSYnPCdozjxcLvsfyy3exWw8=;
 b=Ftj64SGVAzQdT4U3chU2R/MckF/71JQgVBG0jrtZ6apT/IvL1YIBUcxHi6nPHRhFx9CG3QvVvVb6uhlHpztNkMjeA9VO1fqyJUNjqckymPTQt/QYdzmyExNNekDT2P1m+fEevbfkfMOxHl96oM8+geir+6QmHsJffUTRQSgOkzOMMeFfa9Y3Ye7ALZzF0YMfYf4otEqSWTe5iB6oVl82BPx0Zkz+fX+pHF1fwrPb05Ik991/Wgyx7M/eFBZLMDZTw6MiooqZi9M5rOHnaETlMyD61aSw+jVDwqEYZJgw2eNWqinT51+lTFf5LFHh8RF1WASIziqb0MYtIeNUuuVapQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV2PR04MB11190.eurprd04.prod.outlook.com (2603:10a6:150:278::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Sun, 29 Mar
 2026 12:58:55 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Sun, 29 Mar 2026
 12:58:28 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 29 Mar 2026 21:00:13 +0800
Subject: [PATCH 3/3] arm64: dts: imx8mm-tqma8mqml: Correct PAD settings for
 PMIC_nINT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-imx8m-regulator-v1-3-802c0ec507cc@nxp.com>
References: <20260329-imx8m-regulator-v1-0-802c0ec507cc@nxp.com>
In-Reply-To: <20260329-imx8m-regulator-v1-0-802c0ec507cc@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:194::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV2PR04MB11190:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bcc8fec-dcd1-487c-0142-08de8d92df27
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	0RjlkWmFj/SSpvRZXDNT38xwCWYsrZjLbDl5iGIxQL9EXO6jgKmjROxfGqtD3PwALtRmVtVxQs1YXg3Sg//SIJaq/tGVM4LXA2eHoe4D0nar7KlazeXb/m8Kk63/aSQOu2N01wn97cSmjl0cACedPKfQyq/M0TwmczvT9SjNTq3ay2NehIwxt9esv7E31mv+S5G3cRKGlE9AEClfa97gViwgLyIz0b7teKp4H8sXCsSmkGV9cfwjpIeya2ShSUJ4mHuf5FcgcollW9WnCwlHt8re2wS0xyZDx6OaluiADYuSUCs1eL7h2Ss/5I67BUrjmvIe2DeNt7M/lFeRvAMMSO+pBMttn3RNJ/1aV3EbnhIIWo6u94eCC2BZxxhsK8W9kcjAQiymjQrtT2cUGi+LFylVt8L2FNFe10ILs94+PJ9I16sCIBf2oow8FlcrbgoEi9O9aUdJvCflEPGW5ufMzxP/W+k8zbSyxjGdEV8yW6dYB29yqR8T55iSJ4vPzJdlSabLdLlROA9FoiIPffdSYMqqguyl2Kpc6aJ3ZbFOd7xMImvtPxdrotp/jv4TgEz7gzr3WpoSGNT+OZfi9qmv7Ag/J7V0pXr33vEViGMXIz0/riIjJOGpQmN9U++pyNkW2yyF3/CMkMwvghn5GuVOIzBvA90QWzUBpmoy9qMWeTwORMtbgz87/91Su8UDo2VwD2p/8on7W8dk4Gq+XA09Q3bioivUhhWID4Z3vRxSj9wX5NvaGFYNr4wnzNhZpfTp3R3QorDhL6LlaVZwFdA2kyd3er91VYco3MUCintBFqoTQEGoHWHEX3pGolOxyWpD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1JuZHBDVllWYUZMN0FYQ0lSVjVScnY3RnZGME9KdjVzR3JUMXVMaGZqd1Er?=
 =?utf-8?B?a2F1UlQ5b3gyUDhaUk5CTCtHbkhKNCs5QkhaNXJIKy8zQ2dmbnRweDN0b01W?=
 =?utf-8?B?TGp5Z2V6SWVRaW5oZGhOeWlJRG5WbklqSC9UU3dOdk9rRUNOTFNrRFlLSUtm?=
 =?utf-8?B?Rjk1SnJsQy9WckZha1J5ZGkzSVFvQkdVc3JYYU55TzVJcTg3UE1lTzhudXBz?=
 =?utf-8?B?NFF2NUhQWlhxa0JMbzNCRmQ2RmgwZFJ2OXVGVUE0Q01aTDd6RGcweXZMUE9E?=
 =?utf-8?B?bThGb3A5U2JjUzZRblJmQTFmT21VbERVR1RJS0Jmc2dPY3hKc2ZvdG1GZURK?=
 =?utf-8?B?U09aVnNHNVRuWEluNDA2SXBRdVBKNWxtWlpWekFodnRybVFTemNGZmkxTVAy?=
 =?utf-8?B?Y21US0p0V0dNWGdwSTFZOTZrV3N2ZlhzKzBrbzBvV2tzanhpRVNoRGJQT1hv?=
 =?utf-8?B?WWVqL3YxdDM5eC9jckRHaE4rd2pnbURROUtaaUJpTHc1b0JENEpvQ1I1N201?=
 =?utf-8?B?aGh0b0VxTllSY0xobFhseE9MRU1TU25mcndmQXFzbnVuQjl4OG9WbmZuQk1X?=
 =?utf-8?B?M0FDSEl5RCtHVWYxTGVvSGViVzhKZmhETC9sd0FMYURZdXBzbmZHTkNGenJQ?=
 =?utf-8?B?ZW5vNUpuMmxtZUlPOXNpZVNNMkhtUmQ1NE5Yd0xlY3hjNDVDS1cyNTMvNEFK?=
 =?utf-8?B?ZlRyWHdpMEpmRlRmOXA0cTRVSlcyYzByVE9qdTN3MlU2NjR3WWlQUW1FSi9K?=
 =?utf-8?B?dlRJWUx4a056WVpmSXYyMGV5YVZzenJNaXZrb1NaTEZnbU5KaGtsSkI3MWlj?=
 =?utf-8?B?R0h4bDlGUTYvVFFORlh2UElSWnZBaWFzYlB1YU96cEM5WTNHNFI3U0NubERE?=
 =?utf-8?B?alpHK3M2aHlRNDRUU2pPSGs5bGljbU9SL1oxcGVaTzdKcVRWNGRwbnVYR3cr?=
 =?utf-8?B?TGtIbWhiVkVoRXd0eW9XREJhWXllZGtDZ1FYdzRjVXl0Z3htMEZVc1o4cHUz?=
 =?utf-8?B?cEcwWFN5STYwSkFrSlFpMS9LOG9ZdGhQeVdaTXB3Z3J3Z0FQWm1wYXRqMEJp?=
 =?utf-8?B?aUlJMHZNVWtqWTN3SUo1dUpIeThzaE55eWJCQW54VEJrdjdNVVRkMWQvN0hJ?=
 =?utf-8?B?YWxjTk4veUVkZ0Y5VEt6K1F1Rjc0RTVyR1dZZ25WcUVDOUR2dXp6OGxNNFhp?=
 =?utf-8?B?V2Q3c1oxUXA0RFBSRGlBdWFjUmZkZWx4M0lydVBiWXZrUzM4STl0Q2Y0aUdh?=
 =?utf-8?B?U21JcG9UOEM5NUpRWGFLSUVhQUg3NlhhWGh1a3ZEMUxKcjRVMGwvYlBNVXp3?=
 =?utf-8?B?RVUwcGh5ZXRCcjRPYllSOUNuVVZoMElucU5HSWRkcEYzL0hoMlVHOEdJcFdM?=
 =?utf-8?B?aEljTUtORGNjcHNFdHZCMU1MbFVXNDZaUHRBdU9jeE0xajk5eXNGd2cyVHpO?=
 =?utf-8?B?aEIvZ21wMi9CL3pmWFYwakxpeVM5RGl1bzFhUDFKaWRtalZoM3dQajlsU3hK?=
 =?utf-8?B?UkdJSU1xR20weEdscVZrTTRRdUVBQUVScS9mcDBNQy9uR0x1MEZlVDdscXhz?=
 =?utf-8?B?bFJMelBXa0RxMWJpRG5iWEFnblhnYkRTZlFkT0pOWWl1MlcxMkg1SUJaU0dn?=
 =?utf-8?B?TkNTWU84TW1saWY1QTc3UGE0aFJablhjQmhINnczaThjdE5XR2Y5ZlJUb3l4?=
 =?utf-8?B?SndHOTEvTWRpSGtqMi9yNGxWelhRSnY3WDdMTkhIaDZCY1ZCbnlGdUQ0Mzhp?=
 =?utf-8?B?RXBwRFF5ZjNSb1lZbWZpMDZuRlBGOU9yZlB4R2lZYmxzUkFFQUMrSjJ4RFpl?=
 =?utf-8?B?OGsrZU5uTlplVDhOdkFiOUpYMXQwTXVFL2drcWx3RVJ2LzVSZXNhU3FQSFZx?=
 =?utf-8?B?RmpVQ2l1aEwwOTBqV1BjY1dTNVlnaVNQYW9GS1lXd0VBMFFwWWUvZEtqelBD?=
 =?utf-8?B?cC9JUjR1R2d5U2xzZUJCV0dJZ0xkcWt6SCtraUlQN010Zi9HK1IzQmRmQVZC?=
 =?utf-8?B?d1RwUFBpbjZoT1dzbjk0b0Fla2E2aVN0bFBHM3B3NzFscyt6WmZKR2pZV3NG?=
 =?utf-8?B?VnZtUHVManI1SEVXT1NtQlVRRmgxVmI2VFlZNjVjMExibTlxMitPVWhlVjVR?=
 =?utf-8?B?L0JXYUl6ZDYwZ1owd0VHSnlZOVFUeFlISHZRVjNuc3lnV3hDYmkwY3ZtcElZ?=
 =?utf-8?B?OE9CS2FVWlNRMEhLcXM4bVRvcTlQZzVkVGtNcGQ2TnhqUTRRTkhWT3JxcUVZ?=
 =?utf-8?B?RU9iMWdLeUNwdEJXbjZxamVxZGVQS3pUWmljY3pkK0swVTVCTmVaYSsxdkhX?=
 =?utf-8?B?VG1vaU83Uy80SEJCclhOZDRTTFNrenZNMlNlTDlJbFdNcDVVU3EwUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bcc8fec-dcd1-487c-0142-08de8d92df27
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2026 12:58:28.3279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fNC9Fh9CCS2s/JN8DfN44Nu1IK3rN7U/YGx3F0XLzhJ9nR4otylL/Z5EeDTrZ9E4mcm0S8VeVAJ9DoSKpVSDMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11190

From: Peng Fan <peng.fan@nxp.com>

With commit 5d0efaf47ee90 ("regulator: pca9450: Correct interrupt type"),
there might be interrupt storm for this board. Need to set PAD PUE and PU
together to make pull up work properly.

Fixes: dfcd1b6f7620e ("arm64: dts: freescale: add initial device tree for TQMa8MQML with i.MX8MM")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
index 29b298af0d739100d33ff43a8b955a37821b3ef7..1b5ba3c47164f28756bb99210a5961bfaa881220 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
@@ -292,7 +292,7 @@ pinctrl_i2c1_gpio: i2c1gpiogrp {
 	};
 
 	pinctrl_pmic: pmicgrp {
-		fsl,pins = <MX8MM_IOMUXC_GPIO1_IO08_GPIO1_IO8		0x94>;
+		fsl,pins = <MX8MM_IOMUXC_GPIO1_IO08_GPIO1_IO8		0x1d4>;
 	};
 
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {

-- 
2.37.1

