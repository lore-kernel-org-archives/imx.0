Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011018.outbound.protection.outlook.com [52.101.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2E03AE6F4
	for <imx@lists.linux.dev>; Fri, 20 Mar 2026 12:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774009608; cv=fail; b=MYZjDLiWWIucXCenrtjrncSYN6gAIKVd9HlLhpWErliEFKldiCRs3M3VCNHzoZqVtCLfaPDvZf9ZoACTckbkjYJN3OVJyBsYJBNnG2Rk9/9svbgOeE0IM7GZr8bd+GT34a3f2TMJDH7B0EkxALuQLlsA+zaMfiEiy/xppRKcNrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774009608; c=relaxed/simple;
	bh=659anztEkiGWTd+aB2oBcyQS/4TA5vqlx0elXo6KTKw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DXSoqCZnlKzwfXyf7EIcQP9dwpTEZs2QKljZE7Pq/ZW6lcRU5/nziO4I4wxBDA/iBmZTR93eKacdEVLL931lOYbQ3veFUYY/Xu0Kz2LC2O4iQhn1CL5U85sXwVh19i7Ad2q0up/vjFM3ahGRamG/jg7xt6U78vqFXm1mYeGoM4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LmWVSzIV; arc=fail smtp.client-ip=52.101.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LmWVSzIV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CX7DvCbSPCFyp0CbmtdIwHA7rLen/IX87vy6QD0gdqp1cEnHGkEIamZXlZxhfZNhnYd54sK4VzJxkEXWTCH+fTaseRtaPtGe33121XKeQY65EngClKCD6NeCXhc0HW62ygH8bGkVpAq7ezFAGjOCG03BLFrUNVytPgksSRzNC/AL6WzNtmGj5Y/TZddstl2Mt/WWcGwKVfzGNZXx2jj4CHB2zxqjHcUG0ntB5lSVTE3pbOB8OIZve/cFENYLWCmusOH7X3sftYvlku1+y9BuyX34c2GIouibb7fGhE0jAQmeA0XJMPxsvJGU9iKAMmMOQRFAdE4YAoWaB90LNrEOiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1zMBmZXnAeoP0yDyuaA/fBIaVn/JGfYF96VaR5RmWes=;
 b=SsQ71SvY+6yyIfAqdtORVegjlQFOP4G5+uL9VRgRhut+if3VBbvLQw0uXeRt7tdDCl1HreVPO/IlMaDIrSKCJ/xrAsfKtLpOX66Tdnuf2l/f9/SdF9+T1NC3G2gJRyvfsvuFR6M91kmQBiZqAtzjNBl2o05ZesVaJ9TLRGyX+5xShxeTkT4lS3BHRGMwGBXH9sOepm31DdjBFMcTTZZET1cklM5I4mUmr1eleAw0yLcCWbr47d/54Co5i6hEZ1w6RNGMYNl8b/XhZNFGHieBAqAmKIQ+ow2bjUxm9KaKkEb3zXyrZ8De0pFLiriOEqirkUV1v4Gs6wvmiEw56vJvXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zMBmZXnAeoP0yDyuaA/fBIaVn/JGfYF96VaR5RmWes=;
 b=LmWVSzIVU8HPSjnKpnkQ6sjS8DgQHvsQSf7khTvmCjLKw+pJdS5H0KcyRFZRMpoI5zmQoCgc+ld4cyAlH9u6ZJ9+DKSee9a702Rd/085/xAyE8kv6baWhQbChk7slUiwulmvSnfym1OeQeCSDrV25IubII/fSEXKD4ZuHwL2OCIqrPLFIp5emPNkBFbDHoim7DL99BIPNV6U6CepirmBVF8wYuIGXZDP5ZMrYhog8OO7RmqWbM1RIlqCi/W8MIWKLJ8RJh4Y8fiGyehPdaZQRVaOCVgENu6/6yH1RNqal/oThX3weoCfsfB7K4pNoKLylkWdaMk5km4rz5an9jManA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB7331.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 12:26:22 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 12:26:38 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 20 Mar 2026 20:27:53 +0800
Subject: [PATCH v2 5/7] arm64: dts: imx943-evk: Add nxp,ctrl-ids for
 scmi_misc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-imx943-dts-v1-v2-5-e6eba6b3a837@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM8PR04MB7331:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b2e1e33-dfcc-44fd-5aec-08de867bef11
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	oRDbo8HLmeLXu8PwQ2uPmXBxao/5aYXgbmXk/2t5a4LECdow9+M6TTWX2h5cnhlZrKHDRiLuy2gr/3zeXaFt9fCt27ESIvZsztyNC9SHt4zQBmPTIWQuGAc6hTRzkz3VK6h9UVZZQxxEU+OW7TJcIjdjtEihnb7nK3EJtlAUCRkcKMEx72DVgjFvuQag11TguJn1cVwtuf9PFMXS3vinassevmeahsFV++gPo/q7DDhEOld7jGKxTBIRgznIPigfurhCpFyB+ZJKbShjnC91yzWmqC5vnWAbUwBloku40R5AH6900zm9Q04yw81GT9VTfSd1GIQLelKv9PiIGvyLPp7TWfJrqu5ahSoc1bp3JafZAIL44nK6j7IGyRTltrztf8TQPKVp4tp4FBLtmq0aTWHO5VwGBoivSME8Ya1GiyQLM7e/uoy49ikls3IURctT6p3rn+5vkGRgUbEfDcj/wau2yC4D/r2PCey2hruQKNCVCs6RTetA9ysiAR00SeiHVvw6hQrXo8rC/o5+JbXf52gh3v4RCIHC+FuSHmoV+SxRdFcjr5m7yqY4PilX7mGkrLg5oxrSYyyZV4klAcJWGuAo7CyG8PgFZZJ/cn6OeNwnwO1oDd3yQtkdsvWFXhPgDAvy+aW8y6LLua/y2Y65xECs4OOZVNmvYp3S+ExyhiWtZB4JmL7Pr8Uc475jrobAGXAS5oz2FY653rcD1tpRm/bQO+tYEu+MKGjpoVCnRA5FM9Pcx0Zi+4Z06hYsoKRrTbNQUET9xoz0P9mc4GWSJTMHalk8ao81KIWMHa1jCO0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmNjRzhLZ0N6TlhDUjUvSWlYQ214SzdNeDlHZVlLS1hHM3FIc25rUlJRVVdz?=
 =?utf-8?B?dWh0UVpRQ2dhS3dNL2QwMHZ4Tk1OTHU2WWt1Zkh5emhNZjFBUmdjNTN1eTVP?=
 =?utf-8?B?MTMyb2Rub3F4ZDIrb1ZTM0NsZFRtOW43b1QzWCt3dE1CZHJja1E4eXV5N2J1?=
 =?utf-8?B?NVZjcE9MdU1qVTQ5a0hsaHJNQjV1Sk9ic2xabldBQ3poOE1zQkhZUWdqMHBy?=
 =?utf-8?B?VE9WVzNETkNTaXZSaENZVXdEMThIelZoV3g4R0hFb3Y2RkZ6NVNyOVpaSHV6?=
 =?utf-8?B?b3J4emFaMWZ4UTc4UU9nRWJ4YmVyVHdsRkpIcUtEaFdDT2twT3hFVm5RbTF5?=
 =?utf-8?B?cmpGYUN5bStZYThEcnJWNEpZRVlFRlRLWjM4QVZlelBFSGNnc1QvV24rTzlI?=
 =?utf-8?B?b2tNaU84dHVpcE9oUWNCZVdycEwxaU56VVZjNnN3S0Z0VXhaalpDRlBmUmZZ?=
 =?utf-8?B?emtFUGVGQTlvY2tFT1podE1UWHY3NjVuaEZTbW9LNi9VbVROR3pJeVNaQlI0?=
 =?utf-8?B?aUxYaUc2K3NKcnRuSitFOWNIeHVTOWxDOW9yeWd1QXRJS25WR1FUa3dnb0di?=
 =?utf-8?B?TWQ4dm5IdDluL3lrTWQ4TmdvaFI1bm5UK1YveGhQMm9JUWVFUEJLZnpqSTBz?=
 =?utf-8?B?NXV0eWdRWTNVeHVRbElSZ2VPdmQxZWZFL0xXMlNScWthQ08xYy9ReTV6NTha?=
 =?utf-8?B?Y3Zxb0w3bWJrY21DZ0kxWFRIT1h4cDhyOERSaC92OUxQU3cwZDRJS3lBOFVE?=
 =?utf-8?B?QnkxYlNFZ2FiQlVNd3RMN0d4N1M5NWl4VW00T1ZUTXdZYTNIak8yWUVpSEl6?=
 =?utf-8?B?dUtwUXlsVytkaXhGN3ZBMWdwR3hiWkpvUlBiUGFrNExOcjVDOG5kajVOVkFy?=
 =?utf-8?B?N0VWSTlySU9Da0hLeGVxbmtIclIyQUFGeUMzUEhCYVJPd3VKd3ZmY0U4ZHRo?=
 =?utf-8?B?WE4xeTFFOW9Ic1JQRllSbmJWYll0R2hHYXRqSUQ5Y2F2VjJrc1RHdW83L2xI?=
 =?utf-8?B?UHl6ajFQMU13ZjBsSUdhc2QrN1lvUWttS3lqQWlDYk9sSVdONDNHZXJST2Jk?=
 =?utf-8?B?cnNJb1E2eC9tYmkwamZGVkw0azF3S1BkRUxPbWd6dGpBbWVLdTdvMytRck1p?=
 =?utf-8?B?WWxZOFNGU1laYktLR0dVenlkc2NBL3ZVSUtCQ0lKSUVvcThobTdQU01QWWhh?=
 =?utf-8?B?dE1QRzgreWIyRGxGY25nR0lFWVk4TkthekVDcnB2V2I4THgwWXNHZTdyWWpV?=
 =?utf-8?B?WVdXR3VyQmt5eXRxMGpkV3VQUEt4ZGZ2cE96M2F1aHE4OTNPdkRjdms4M2Ex?=
 =?utf-8?B?cXdqNVRpNm1QVmdRalcvNmJ4VFR6S3hINERqVm5mWHdPenM4c1E4RTJTQlE5?=
 =?utf-8?B?aHF4WFZveWNlV2tteStqZ1lMQ1lYOFdIL21JQzg3T2JMTENtdnFvNGhWd2Fh?=
 =?utf-8?B?TjdXYmtNNFE3YUloVE1jRWtUaktHak1GWW5MVFBnUDVHaDFkVWJuZFpKb2tE?=
 =?utf-8?B?dEhYYkU3aUl1RWpnMG5EY2EyS25Gazh6NHc0UGJZd0l3NEZPbU1PdzNYMEZn?=
 =?utf-8?B?a2RKWDZtclB3Mk9yNC9CWi8xc0dWZ1B5bUVrZlpHM2FNOEdDNGh0aXFMN0Mz?=
 =?utf-8?B?Rm5idGtFUFRzcDQvQ0RYRm5MQ2t2b0JMTW9oR1BBVmdyWlNKUzEyK05jcGkw?=
 =?utf-8?B?UllHYlp0ZXBtTmxPK3I3TmJsanVoZzFJZjh5Wkh1d2tnbWJtU1pheUdrWHdJ?=
 =?utf-8?B?c21xam00WGhGdGxLeG9pOHp0UHNlYTdRV1MwYkJIeUIwYTVpSnpxbVcrU0dw?=
 =?utf-8?B?cUw4RXE2cnNaMEY4L000Z0dlT21zcHZILzhVbC9RazBrVENCV1l6eDZmdGdG?=
 =?utf-8?B?TUd2LzZGejUvMEVrM0hjSER4UHZIenN0b2w4R0F2YzlVZG1kK205MCttb1Fn?=
 =?utf-8?B?bjZxTzJ1UlNZNzM1a1YwdzVLZXNjNGRQeHFUVlZLS2xrbnBhVmVzT29sc21M?=
 =?utf-8?B?Q2luME5wbWc2YzRjS3lMWExSUUoxamYrSlNLY3cyNkJYSXVwYlpsMTdrcnFG?=
 =?utf-8?B?OFB5STJjYThZS1dSY21oeVMvbXgySmdYUkJHSWpFSEdVZzh3YjFhMUpJcGRZ?=
 =?utf-8?B?VzNSRi9lNE5saFhOdjZrZytodmR2L2d0MFluWmxkV0RxQmtDMExsTDhuZE5U?=
 =?utf-8?B?eXlxc0QwQ0NpU1Z5eWZNU2FXeVdYZ21IU1hTaXZ0SzBCQVlaeE9lQ1VEbEtL?=
 =?utf-8?B?bVFHL0U0WHJUTEZFZjdhYTNtbm1Oc2x3bE0yZTF1ZXZtWEY4Sjc5WVNRYmRQ?=
 =?utf-8?B?UjlaM0pDVDlrMm1NZjErR0k1bDQ4UlpzQWxFZHVIWmhtY29HVWloUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b2e1e33-dfcc-44fd-5aec-08de867bef11
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 12:26:38.4697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z+wsvJi+AI49kt+8ubRW6MRlDH9EQbvFd/eTlkHHDMtkxW7TU3vMzVIPEeK1tBAWXT+T7G/hRrv/oN+miC3v3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7331

From: Peng Fan <peng.fan@nxp.com>

Add nxp,ctrl-ids for scmi_misc to support wakeup from the peripherals.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index 1d834379f602dea9eb70381f6fe2ef6e3c938a80..ec728efbe15cf0b97deade68445b23528325b082 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -8,6 +8,12 @@
 #include "imx943.dtsi"
 #include <dt-bindings/usb/pd.h>
 
+#define BRD_SM_CTRL_BT_WAKE		0x8000  /*!< PCAL6416A-3 */
+#define BRD_SM_CTRL_SD3_WAKE		0x8001  /*!< PCAL6416A-4 */
+#define BRD_SM_CTRL_PCIE1_WAKE		0x8002  /*!< PCAL6416A-5 */
+#define BRD_SM_CTRL_PCIE2_WAKE		0x8003  /*!< PCAL6416A-6 */
+#define BRD_SM_CTRL_BUTTON		0x8004  /*!< PCAL6416A-7 */
+
 / {
 	compatible = "fsl,imx943-evk", "fsl,imx94";
 	model = "NXP i.MX943 EVK board";
@@ -878,6 +884,14 @@ IMX94_PAD_XSPI1_DQS__XSPI1_A_DQS	0x3fe
 	};
 };
 
+&scmi_misc {
+	nxp,ctrl-ids = <BRD_SM_CTRL_SD3_WAKE		1
+			BRD_SM_CTRL_PCIE1_WAKE		1
+			BRD_SM_CTRL_BT_WAKE		1
+			BRD_SM_CTRL_PCIE2_WAKE		1
+			BRD_SM_CTRL_BUTTON		1>;
+};
+
 &usb2 {
 	dr_mode = "otg";
 	disable-over-current;

-- 
2.37.1

