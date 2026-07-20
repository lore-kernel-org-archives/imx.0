Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011018.outbound.protection.outlook.com [52.101.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AD041A768
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 21:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784581861; cv=fail; b=ix0tPyfdqo17hY2Orx4P/08Hi40Wzl/HF8eXlbNzwyfD3Bd7LeBSVikk70Q1DDy5VoZRFImHAFEA66GjuRrAOdCyUuChgb4imuS7pq8EQm6hByv/29+NeP7npgOovx96VDmwfQJg6cKcWYlbvnOFxg6lfV/K6K5d3ZnLQbWp5Gk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784581861; c=relaxed/simple;
	bh=zKJAxa2DdB7/zC21zbV4QQBkm6z5G6n/BjMPXyRS/7Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=HL9GZJCn1Nc5gX7V2pbscfQBr3cN6mmtQZPoYD80wZca1chmSef3xG5WeJ9S0SQUGoXlXIhqnDkE7nAj8pg5jyPqSpiGRgk7Q8gmJ8AdI/cbJLeca6RGnFSmgBIPK6OplSxge+yPOclVZiw291QjXOVhJ3UNoal8IKtKHjDIxUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AUEu5Dq+; arc=fail smtp.client-ip=52.101.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AUEu5Dq+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lHRAN+JymrJh3IC3sRbqBt7Z4ulDVmO+bAr7eXzQKHWRBi8xo/6OPlf5dMry+BIDeqCF28/bzBTqowBG+T0FZCuESuDxFG1Rj0QSThDMHBZwM02QJpOfEp+gu8P1JBKJT4PYjkQAg0usH1ikrQ6sR4ktnU2EADb2eZ/c7cSadvATgErprR5qCZUNvugBJHLylE2PKgh0WNnopwGFRYqcvBVNsZJv44N7DmP5RXwbSYExM/IE4CBahYYM6wlObVryVrazDg0kUhqbI5yABy/QSNBCni2kNkEfA3q+c6kokqzAdasd5F3YtQmwwyG04Hz+95A6Z/eoS8SIlunSlame/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WiAt7yCJcf7VW6A0Osv59Muhcm7zn3WCXVTMIVmIzl0=;
 b=JLVzH5JxvUPrAZyCf581szHXyL1SM+vGz486aSrDHOMazw7OHE2xY/RpZyx+/JnIATluFEx0FdEQ2AUQiauxk8bHqDEWn7/a7lxVmEwDZCv5zzxp6f+RXcZv98wM5YDKG14OPP5LzjxUIjO06gPLxou9qHNSYhnR7ykrXyZS+yJFW/tHLpOXu9XLQzfl40iijS4Ca4rzlXxHPMrd/txJFwVwiILmgz4LUZhqwrja0C00ERnjn2MZV3AbOHvp/Sx0ts7yZgxX0qHyg7HH1gt2a4QrBnsakvk3zSiLKycdWk6ATKp7LdCdSsxAPwqSVFudgxzPrvPeQODsix5TGCqJAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WiAt7yCJcf7VW6A0Osv59Muhcm7zn3WCXVTMIVmIzl0=;
 b=AUEu5Dq+b18Iwq84o/kLOKcep3vqL/p/E2lIjs3vvRS2I8wsi5YJ2VuYo1EbDnSJIgDqXFcM+hOjhZMsW81kE6pHW41Ki24+AjovwWBt1A56bNdc9Z+jf/bItmvBFHlJgFRWnJ9kjSrAVMTi3yWlU6KXB762oo5C4mg/ip/6mhKNOZBBDNT7sioqJMKtMrD76s4pf3RW/ZDAxc7949pGX1j+/OtCyKjYkrTCrbw8/3MpWv4X29vKRpMBaQmjmDItS9m9YkO/pZjGlYswxZvX1s217hJ16xzyARFCmick5rffxHJbG7My41+k/ofWx3wduh7VCDXsQBASbCwHcWlr7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10565.eurprd04.prod.outlook.com (2603:10a6:800:25b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 21:10:55 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 21:10:55 +0000
From: Frank.Li@oss.nxp.com
Date: Mon, 20 Jul 2026 17:10:33 -0400
Subject: [PATCH 1/2] arm64: dts: imx8qm-ss-conn: add usbotg3 iommu
 information
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-qm_smmu-v1-1-3689fbd8b516@nxp.com>
References: <20260720-qm_smmu-v1-0-3689fbd8b516@nxp.com>
In-Reply-To: <20260720-qm_smmu-v1-0-3689fbd8b516@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784581845; l=670;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=jGiZwh8La8kCRhYZhDSs1Al9T9di9BLfSKEgKIcU9cQ=;
 b=ajzslnT93bXQPzhC/SVxKtmzvLo0GQ8px3svuhuXcCoZNo7712d350H+fkqaMBbE8rNfYTNkR
 d9tt+ltjcc2DgjlRe25GPnnfO/T0VjGRKIePlN7YEWyOfdPqIrWWbkN
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10565:EE_
X-MS-Office365-Filtering-Correlation-Id: 5265d423-4d2d-46fe-c030-08dee6a36377
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|366016|23010399003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KjgZ8KBDCRO08Ah1j6oulRJWQGUqumVjh85BEbajvVkTwFkCh2qcQ9nU5pGJn2d3YbnjOHi7cT2xu9Bvo1g3e+MgsLRQ/D/gSGpAizWn+efiTUhyPf/nNVb4nTa4GlDTYw0NNfIDZxcjqIdNJNEfvxwInNtGP1gKhcsHT83urP6UoOlQtdZjUngR1hWLanZg4v5sKnyx9+qauwC+6ZmhQj3nxlebMsrCbTYiZ6LxxwsYG5jIQ9hLP21T6DVbX3CQWhLGMS+zEZVCeqCp5e1/7aylYJ0uXrMqar6G2KAJxEEoglGrEW3Gg8LaJ1L5WTcoq3kxiEzpKcskC6DYfFesqlIk4w9+dbOImqapDid+SCxowkbAlEn2IX+vH5zhRR+atzjPh2I8/7LrK6U5HmNiUpFtZQ7bJALSs4v8E6spN3j9JuUeCgIkHK2peeoA2+hMzmasKWeWomNSZfNac4anuQny90jgoYTu0ryRBLtNnH8FveMXw9YyjmHdWzts1N1/8N/SIMMDjNJJyni57YD7FklBJ/FJtN/rwM/3XMcUr8yNlkpkZYNTGoScEYGOpZYAZe813VQODOIzwtLILgZ5XMmp2f9rq/DjDcmo/+XoxTeuQlEejT5IGIEreaTJZjsCQReUjh0VIn3EhRJOvjsyrvSRCzGZhtV7bwxtCTb0JNA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(366016)(23010399003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTBmNm52WDlyWThDcEJRUzhoaVVEbEZPWHpJZk9aZDE2eHZBN2krV0FqSGgz?=
 =?utf-8?B?Yjhrd2hGUW1XZS9HME44Z0p3TVZ2Q3J4SWJiK1AwZkc3THJFNXZpaWhwMEli?=
 =?utf-8?B?eDkrNHBTbHFDdmk3clpMQ1VFVlIwNzNwTFdmZW9qc05kZTkxTWdrNUlBdzVX?=
 =?utf-8?B?Nk92VHZtL2hhWlBVb1JtSDkwQnFoVytWZjYzM0ViVWpzMnVZcllaQWhJL1Vo?=
 =?utf-8?B?M2krMTVOVW9RMFc2MU1xUTRkeW9RcUIrUzI5OTJiNVNZY3lKNTlQcDFMRHc4?=
 =?utf-8?B?TGRPR0drdGdVZlU3Yk93anR4UURsNHdYa2VnMnd6b1U5QTBVYkU1SXdmWk1q?=
 =?utf-8?B?ZWgzaTFVU3FiOUdXK2I1UkVTcnBCT1U3eUVwQmdvbkorclAvcGRrQ3F4dHB3?=
 =?utf-8?B?V0ozUGdnZ2JqUGFXRGdPM2RwRTNJbGY0Zjh3d2xpSlJ4RkVUenZPcitTSWFL?=
 =?utf-8?B?b0tvNy82Y3dRa1ZrbFRTcDdKa0JwL1h3ZlR2OTh1QnFXVmxKTk14SktRcHNh?=
 =?utf-8?B?NGVhbWxtZ2NiQUxDcmxhd0JtZkxKL29yT0dHSEtWS2ZVVCtVRUgvdmg0bS8z?=
 =?utf-8?B?UlcyRGIxNFN0U1BONjB1dThKQnpQVlFLMm1qSW00T1dnWHlPcTQ5MnZRZnRm?=
 =?utf-8?B?cE1aNnRQd1NUcWhjOTV1cW5zbmdqdWdyczcwVWVTUVQwZUtWcUNDcVZrVWdl?=
 =?utf-8?B?WUFrZUdLd3V0cm5maUljb1BPaXdLQjlmN3N0SSszL3BpS1RvNlVqY0h6YStS?=
 =?utf-8?B?bW9MenkralFyNEFkTkRsdS9NQ1RNdXpXQms2Z0tRdDZhcjVBTXZnblJRVGhX?=
 =?utf-8?B?VHo1MWVCTTBTZldtYUFscTBKTitMWENnMjFHYnNqSkhzVUNndUVUWUx4eGJ1?=
 =?utf-8?B?QW94YkluQ2VNVUJNTlA5NnJaclZuMHBiNU9LTFRmSW5Za3krV2ppb2VJVnRL?=
 =?utf-8?B?cDRNcElWdXZQbUp3TWtlaWNrTEdvRVhrK0QyUDF4bUNJdlJsN1BudkRFbHZ4?=
 =?utf-8?B?RVJtaHI0SndqTnpOWmlIc3BjR3pFTmxITHRvNlNTaTMyS3B0NjlYNS8zSlZ2?=
 =?utf-8?B?S2k3dkxzb1U3N3BqM2c1Yml0c3ZVOXd2aHpNeU9PMzIzRTlXVExaMVVSQklG?=
 =?utf-8?B?SVBEb01JdnFzb1QyZ1o0ZkV0d29Dc0hBTlk5VlFwN0ZVVVVXM2pnbjVVRk5F?=
 =?utf-8?B?QmhyVlczNmN5Szc2MVpwNU93WmMrRVVyREV6bUZtdExTRTJVWTcvQUZ2WmxI?=
 =?utf-8?B?SVpsNTRYZnJnNUZDYVM0U3ZVK1NKTzQ2N1l4bXVpaVNsY3V1TXhNeUtuNzlV?=
 =?utf-8?B?bU10M204V1RCMWtoelFsZWtmcDZsR2lyZFZmdEFmMXpKSXN1Uy80ZnJVTCtK?=
 =?utf-8?B?VmszbENvZ05CN3NLb3RTNXVMSnhvbDVzcElKRmRabmZhQUk5eDNlOFMxWktV?=
 =?utf-8?B?UUszNUtxelJoZDQ1WHM5bk1OejJ4NlF6M0EyeVpOWmJDcENiUW1IQ2JseldG?=
 =?utf-8?B?dVRBcjF5Q0hWUEVpU0F2d2JNYTNxRG80SHJVV0xuMGs3WmtJNmpVQ2kvb3V5?=
 =?utf-8?B?aDFITWRtT1RHa3doM2VlNVB4UnZERVppc0t2b1ZOVE5XcExLdEhnS1A1aFkv?=
 =?utf-8?B?SUFWRFQva1FUZGNGS2U4QUN4YWpSTnp6cGlERkFXV2l1YWUwRUNoUFVIZjdE?=
 =?utf-8?B?NjBmNjgxak1MWkYyR1ZXK3JDQ2thSGJGamtMM3dLVHQ2eXlYUFcwck92ZW9C?=
 =?utf-8?B?M2ZxR2Ewa1FCYi9uUnEyc3NtbWFhU0oyQkxiay8vVkhQRHQwVzVtSmdqaG81?=
 =?utf-8?B?em5UakQ5bXR2d3JjK05kYnY2cndzWlFxbGFGelhtZVk3NEtkYjFUWkZwQktj?=
 =?utf-8?B?RzRvOWtXaHNBd0RpVDN2QWUzdXFxa0Y2TWQ4TWtRcnhhbFRXeHA4S1VvT2xr?=
 =?utf-8?B?c1AvYk1vYzlkMzZtSzk3cmJqaHkwYTkrSUNjSXZFUnQrNnlXdU00bEtjd3pZ?=
 =?utf-8?B?OVFKVlNxM2Q5RnhETmh6d2J3azZJRUMyK3VnVE5vb1crcnNUYlFMZTBxdUUw?=
 =?utf-8?B?dHBiZDQwaStaZnhqRG1GMmFocFQ5VDlpNVFzNEQxM0FoOWhWWkxNNnZaY0Vl?=
 =?utf-8?B?YUo4L0NvRm1xSVgwc251MitGRjFEdTZ5RHo2aFJiVzd2SUo0dHJkenJZdkZL?=
 =?utf-8?B?eEE3UzFLSWhFLzJoSGZGRWhwMGlMcWs1UWtEcGs5NTR0bk1yYncvdzlvMXQ5?=
 =?utf-8?B?MGNmZ3c2dUx1ajFWb0N1RnFPOEZOTVBFcVBrVmJ2Y0JqU1ROVXpZUHcrcld2?=
 =?utf-8?B?cVBuUnFoQ3FpUGVnM1lXemlnT1BoZkVSalh6TVVWNWF0dGhlWEJhRlRKWERl?=
 =?utf-8?Q?4K8ov+g0pa4sxLYFZTGb3Measc2EWY297lo3O?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5265d423-4d2d-46fe-c030-08dee6a36377
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 21:10:55.7512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u32OFIXS8pMW5O3P+BW4/sz8/3a2FVI/bshqb+HlhstQ/JKNMUFJFC9L9nLIREwiIcmT28QarPZnQk6C4kx1QqErcr2xblotSsl+4Pxe0KB9R8SQW527oDEM4Nwz8nLf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10565

From: Frank Li <Frank.Li@nxp.com>

Add usbotg3 iommu information.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
index ccf9f510e0f88..1370a571153a5 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
@@ -32,3 +32,7 @@ &usdhc3 {
 	compatible = "fsl,imx8qm-usdhc", "fsl,imx8qxp-usdhc", "fsl,imx7d-usdhc";
 	iommus = <&smmu 0x11 0x7f80>;
 };
+
+&usbotg3_cdns3 {
+	iommus = <&smmu 0x4 0x7f80>;
+};

-- 
2.43.0

