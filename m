Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013045.outbound.protection.outlook.com [52.101.83.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D7C22FF22
	for <imx@lists.linux.dev>; Sat, 14 Mar 2026 12:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773492682; cv=fail; b=IWBViteGtL51qlDzdT7Ns7wffLvXByo28phr0bvxcLP94wWLWLS9vDXLR23gEbimVkQgvML9fo2rS6UiTydPnC5cK0O7ayLLZYiww4aOTxI5ZjC57r1t8SgKE1elNKZAtOMDj3AQy+eu2NViGKFXxW2R2LPdmEU9Ld9pqDyLWNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773492682; c=relaxed/simple;
	bh=Kd/AlZ0gPai2Cv3iz8tul4xjMgc9o6aLL/qVx34lS7w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fm7uWPj1ksgxk4IS/K88Xxum9+gzbUw/5OCzyRNjLbeqKbyIK/0G48rQcfnztxOQpHC8HCbQ8enxZ0/4pw4caav9CY7TqHXqkWTIgBo/FPLHkJNxIl0FHr3+eKMjL6n9aoTViz2MgFwfjkxpsC7eNTztc23Fon6SmbXjfKvpaho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=V8YM1rsv; arc=fail smtp.client-ip=52.101.83.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="V8YM1rsv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GD8SQ5sE3z0lZnmbi1tdOVav9mLFipIUa2atYuaJ7M7ll1JHuqtTYKOAqepC3PicSVHkvFv4xfTr6+CdgtunveNHS8vMsLBM/0KSY+M822hFGlD7064UKdyo7SqQ744ru+TZdKZp3rZ1F6/r0wVmiOa9cRxrmZF1g+EmBKKxCVBfUfIMwiGc+xidxrKPa0vw0z2vGOPIuPGlrI3D1Zjh8if6YuqvZlI6BogKorhlFZnfN/gxEoVtFNc5o5KjPSaqQTqQuGNjxhzVCKl6XY9Az1DZoA4eGszBbs5M1+SS8+7n4NwyWQhPQMrL1F2pT2x3YKhn/E1qdbS0fjYrcGliGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqskM+kLm1KnC1FH3bK22+jr4dy+Drwg6TGxzy+OTjA=;
 b=i0mVebHHaXRpipQ04zkWnXHeKSbzrryENOTXgOBc4du2qofE6hVujnJ4fv4c729MtYfxDNah6MC7UI+rtHLM2dBPM/HguLP/bmysjJU/zRn2e1VQFssFNmb7CiaAN8Bec9UsikRtgrYGuYwOHZx7yUrm3gtoJLKaKzcTg47nuuw4b2Upm+De+zP2lLGqPANYfiGjOat6wF/xESw6VJCqMMANLQTKBm6yUEM6cHyczXiXaJmUq5n4J6+nIOnBRWxOHAnDPQMNjCdPj9gKwbKPEtlI9JDVwRTMQ39VO/czi7qibzo+SFJ0eaULd/uQHxzmGG4vgF94hxIogM/jbhJo7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqskM+kLm1KnC1FH3bK22+jr4dy+Drwg6TGxzy+OTjA=;
 b=V8YM1rsvlD3UAlRAudh0gBWJVTj1etEd6sBaaQQDIoTGUH3hJTACf12/l/TzHVciLlTMDBkMqxD5aYlAIM5IsWB+83emXHePUuxC4BvFnAh8jIZ+Ht0lksITcvpnV/NfgCWf7kAbjXPeOnz7vO5FeEs55S0ooPW2wdh8jmKUmaShllVA9CwEEgupbQFPeEV4dqNMxLMmTnCWBvXLmridsHTQEvnFMCnnHvwwcRz2LGVUHQ+lxV0EPwzOa/yeoXWv+XZzdpzhQvV5E6mMcgS/5yfA+8Gk0T1dORuLetzA8JwgCSdO0EuvF1gXKqXhhytcO+gd9QkqTt+CVV5nWu4c0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBBPR04MB7802.eurprd04.prod.outlook.com (2603:10a6:10:1f0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Sat, 14 Mar
 2026 12:50:50 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.013; Sat, 14 Mar 2026
 12:51:13 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 14 Mar 2026 20:52:39 +0800
Subject: [PATCH 2/7] arm64: dts: imx94: Add V2X/ELE mailbox nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-imx943-dts-v1-v1-2-3ba9b426863b@nxp.com>
References: <20260314-imx943-dts-v1-v1-0-3ba9b426863b@nxp.com>
In-Reply-To: <20260314-imx943-dts-v1-v1-0-3ba9b426863b@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA0PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBBPR04MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 0022fb5b-d4e3-4121-ea14-08de81c85fc4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|19092799006|366016|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	wqFEux/aZ7XjVekFrjDr2GmmH/swggCBbURtq12G48XNAByrMH4EvqHR6sLC1Igt5HdNKd1wMzPwEUXEucS/LFUK0v7WEV604Un8KTbMkogBqrKmVt+SQtIMU9uKPZOJbbYLvU5Nmo0XArcE6RJOMHtCkXHs0yuOgHdPWZzTzm3SantayPLANEH7N4KU8Q6NlqDG7ZOCvRtS2AWzjdRoS8TDnIdzk53fdy4/AeQ2frhzgswU7NInrtI9roLHomOacbrMD6ohs8iaMiBCUFzWkhmCUav0lpLBm5HrXJZHKklS3r5QutdnA9llox6Zb2OQ9XWE5VwOlFQiYKKiZwtTaHcX4ViyGlRAA98kqcPhlT1jiN4Xr1djDdhKdIiWr7tK1aqlujnPfsEUML7UjDzpvVnBXP0irxU2kJ2nbz+9TsIgExlQNMF2TVBKVZ4lM0jJOox8R+ycbtxmYtoO5GLJz/OnHU44HdlTGI/uH6Cqb4FJbD7wumJcXPOCnJG7KT9ykaUueLpAu7ZDCLRqOXalilYKOCl7Khac3YfsB+G6tPyaUfzJotiM77B9l/PuLpqNTYj4DWb5vGS//nxlHFSgiaYWHWuy0cVs9yvpicN/sg2F2+0fGt+ExgxeqEMZ5eCAz4tcLJTQ07r7KfZyghnCmhHzifyqL+sORCcnCeZs5hbUL3dsOZyxsE1bFLcNFf498/IAvZJOONy25YU/rYaE8wAOd+F/6YWgEdBmkc5OUK8yl0JP0lIYcfqsGaEvyQxK4HaRrXCbzcFNeYIRF25r+4qy+DhsOtEX3/vm7HiW2bM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(19092799006)(366016)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zk9CSHI0dmNJUGt3d0Jzem9jWjVrcFZ3aEx5VHBMM0FWTkY2ZVFUS25IbE5x?=
 =?utf-8?B?V2x5VklEcWJ5bU1wanBQMTNGaHZIS3dhV3ZnaXV2SU01NWpaL1JMc3hTVnVr?=
 =?utf-8?B?eWdDZ3RkNzJ1MnNUR0kxZ0RVRGdJejhVaGJKYlJPc2p3UTZFWGtnU3J0SUlk?=
 =?utf-8?B?cGF5cnd6aUpvTE1hSmpUaUNRdk03T0dSZkt3OUxuLzh2eDFOL2p6SHgwZGNW?=
 =?utf-8?B?VU5COVlCa0pWT1ZGSGs1SDl3dm1OeWtrc3JDSGlWTEdraUxIdDR4N2VrUWhB?=
 =?utf-8?B?dCtaUDB0Wmd5VWZ2YXNhTUJOMHFjY1J2WXlZdjJuRWFOYU95NG1QRHUwVWc0?=
 =?utf-8?B?WmtZcUtCZ1FXSXRLRHkzWnZGcUV2cmsxOGkzcVd3NktsZWxiekRocnNXKzJr?=
 =?utf-8?B?K0VFSzZlWVg4QkhhZ0xaS0MzNFkxazAzVk5WV3F6NEpOTTRjTDRoWTBwTENV?=
 =?utf-8?B?c0VtVnl6YnhJWHg0SW9FUnlsdEVKdWZmUHJSQXpEOWZjb1Z0MkRxTXBRcDdp?=
 =?utf-8?B?VlM0c2RQTEoyUUkwdE13VkpmUHl1T04yMWdTNElHSzJZdFVKWlJCNWpOaTd4?=
 =?utf-8?B?bUhlZ2FTUGZwOFpiMVErdzg5MUlzKzV0Z285cW9samZIZnlkZ1FzakhObzFE?=
 =?utf-8?B?MjdFZVJ0OTRWZk1nRVBnR1dmdkV1ZGJBS3o2MWtBbmlNWHFpV0hUL25rdjJm?=
 =?utf-8?B?UDVRQ2Rmc0hhYXVZRjRKN3RiaEx3b3oxbTBoUm1DVzh0R0pSdndVYnh3ZkQ0?=
 =?utf-8?B?ZzgyUXlYWW5OWnBIcjJvZ2Mwbm5MQi9CRnRjckNVZjNZbFlaL2gweVdJanVZ?=
 =?utf-8?B?bGdZQk4rdFM0MkNGUm5rNGVRYVBhOEVSaGE0WjBWRGVkeC9EU1lYamcwTWZa?=
 =?utf-8?B?NitnYUtMRzE0SXY3a1lrcERLVVNvV0VqbnNLak9USVNRWmtUU2o3MXUzV1I1?=
 =?utf-8?B?S3U3OGxOTjBZL3hvU1RDdDhhUTNiYzNrZFpzRmh3WEswYlo3QjIzSko4M3Zu?=
 =?utf-8?B?YnpnbkRyYk1CNTYyV0VTSXFDQ0dWSmRJVkM0WmlKQkhDcmlqdGJVSG01OE9n?=
 =?utf-8?B?T3F3QUxZbEticURJY0lzdXR6eHR6NHhvQkhvQ1RoajRjbTVMWmYwM0V6QThP?=
 =?utf-8?B?blZpMm9mVklONGV6bWxMODZRbHNZdXJaZGgrTzNnWWZGUGY4ZnIvcGRsN21w?=
 =?utf-8?B?dmgwWE1GS1U5RUFKcVB2NzhTTnl1MU1uL2RidndrcDg3WGJkSTlkWW5wRGU4?=
 =?utf-8?B?ZXk4ZmFYS3YzbGZwVlczVFpBNG9Zd21BUVd5YWFSa3JjQTIzZkNyWm1XN3c0?=
 =?utf-8?B?b1dKdFBKWXM5ZzNEYVVBaUFPcDFseFJrWVlFTWU3VUNZQ1A1SU1IblZ2SlFo?=
 =?utf-8?B?RGMwWFBOaWV4RGV3amd6M1JqeE93UW9VY3RnOTQzMlRpL1doU1B3ZmhidktU?=
 =?utf-8?B?bUhneE1hWDZXK0hjL2ZxaE9wUWU4V2VzeFU4ckVkTC8zZ2xNekNQdnQ5Qi8v?=
 =?utf-8?B?cndpeHEzNndkTTJLNnFWelNvTVdOZ2pjWWQ5YkxSakM1UG9hVm5QSlZsM3M0?=
 =?utf-8?B?TUx1c2t1TEtCdXFIWGdsRnNpU29Ndk5uckNOTzFlMHNJWHhnWFVJeHdHakxW?=
 =?utf-8?B?ODNOOFo0eGlmaUM4amhpRmFhM0tXd0w4djlkVGhHK05LYW1rK1lYa3FJQzBJ?=
 =?utf-8?B?THZYQUhpYVd6K1N5TVF6QXBYU2RjZ0MySzNvUTVsem5PN3Q1Z3grajZUazNy?=
 =?utf-8?B?SVJrVVZQTW1vcnJESGFSblEvZ2lPWXpzUVE5MlZEY1VFRnoyZDFDL2dPUzhI?=
 =?utf-8?B?MitQdFdpcStEUFNKNTIwaWxMOUVYMkRLckd0Zk0yWXgxVFJxYXlJcTZEckEx?=
 =?utf-8?B?a0k4QzBpM1JVTmNZUXd2dWZpdFBWTXBpaGRVMDJBcTlrTVlFZ3JPamRLZE1I?=
 =?utf-8?B?L2R3UGdYOHR4MHFpeHJVTnZTMTFtanRTU2xLdXd3Rk9UZ0hmdXY2UnRLL1Jw?=
 =?utf-8?B?OVpEV1hpeDJrNU9UUVR3cm42YXY4c1J6ZmE1ZlhmdkJ5bjY0UXdZYVZHN3pl?=
 =?utf-8?B?ZHRDYlJBRkxUWHNSUk0vT242ZG84VVdtWlIxZ0FndUcyZWdWWmEyc2h3UklS?=
 =?utf-8?B?dXZyd3dRNTBNcis2RUplbTErSU9CN0R6TTFGWHRhcmEwUExNTHl6NXg4ZWJR?=
 =?utf-8?B?WlVSWlRVUGFwTXBsblFIN0lDK2xKWG5uU1NCcmtSTkN5ZnhKYy9PMmtKdWd4?=
 =?utf-8?B?MGtMM3Vmd0IrQi92dHNGcHIxNVQyMjJ4OG5VSVljTHU1OEc4L0hKeDc3TlVI?=
 =?utf-8?B?SE1xSnhCeTJUTVd3OEgxc0F3QXRtVDBiN0VQTnJJRThzak5PMmNDQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0022fb5b-d4e3-4121-ea14-08de81c85fc4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 12:51:13.4467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s7RBTiwSZs+3WowiVfCwPJoVANkzV9zHDQn4Vz8nD+vFYN8OWn2fpF16D/vnzZa3mozIVlcgKb09pbP6Ea2kHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7802

From: Peng Fan <peng.fan@nxp.com>

Add V2X and ELE Message Unit nodes for i.MX94.

One extra V2X MU which is dedicated for V2X fast crypto engine is not
included, because it requires a new compatible string.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 42 ++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index d2f31c8caf6eb781f0cf4d245d8bc67d8e7b7206..3f6d4aa4b9f365b209f82c7bf5d036bb58b1b86f 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -1205,6 +1205,48 @@ a55_irqsteer: interrupt-controller@446a0000 {
 			};
 		};
 
+		mailbox@47300000 {
+			compatible = "fsl,imx95-mu-v2x";
+			reg = <0x0 0x47300000 0x0 0x10000>;
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+		};
+
+		mailbox@47310000 {
+			compatible = "fsl,imx95-mu-v2x";
+			reg = <0x0 0x47310000 0x0 0x10000>;
+			interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+		};
+
+		mailbox@47330000 {
+			compatible = "fsl,imx95-mu-v2x";
+			reg = <0x0 0x47330000 0x0 0x10000>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+		};
+
+		mailbox@47340000 {
+			compatible = "fsl,imx95-mu-v2x";
+			reg = <0x0 0x47340000 0x0 0x10000>;
+			interrupts = <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+		};
+
+		mailbox@47350000 {
+			compatible = "fsl,imx95-mu-v2x";
+			reg = <0x0 0x47350000 0x0 0x10000>;
+			interrupts = <GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+		};
+
+		mailbox@47550000 {
+			compatible = "fsl,imx95-mu-ele";
+			reg = <0x0 0x47550000 0x0 0x10000>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+		};
+
 		aips4: bus@49000000 {
 			compatible = "fsl,aips-bus", "simple-bus";
 			reg = <0x0 0x49000000 0x0 0x800000>;

-- 
2.37.1

