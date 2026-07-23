Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011031.outbound.protection.outlook.com [40.107.130.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07589224D6
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 12:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784811406; cv=fail; b=XwajLM1d1kapXLFEMZgkguOSQelhPYzIFMdUY7DuWrYC/kYo/p+ClVkzkLd2S5cjN6/VNtj3E+Kcx4o8HnjPf3slgtIwNBcVzB57leEOevozbP68j/nb/Zf+nGNCTTXmHlQlE1+XYZhv4Xn6Kb7CseVoAGSN8lXlfem+7Wee2+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784811406; c=relaxed/simple;
	bh=8tKYEGG0nmhP5kXJoZknhU/R6H1hrBa7kR5eVKLGj80=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UYN8yjHuAAhq8SZtWWMR/rAMYgUYPv9bARNoJZHH5CE+P4VAP4s2qSPDAeP0RMowEBSukNodm2F3eRqKabWtUS1Q3llDlb4XnbQoJQvkiCzRfOhPdkP/dOOvaO00aKYbFcSX5p/nmYEsw0BAR08OWL37G8O9plqDEG7aGQiv6R4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IBkeLsHr; arc=fail smtp.client-ip=40.107.130.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IBkeLsHr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwNtfBeAZS9e5Kd766FEN5NEnYoLdC+IpjY3NqaLwUTnCQCBizkvb7UBtuqBIW47t91kjsXueBNmQnJpyeHhOL6waR9vleyB1zkEyHdMLkhJDWUjNimskr90IKR7ad/X243LlIygcV2hYTeVyNzY2qTiiqntYd/FrO1Llz8aNGZeLph784G/rQyc8Ev8zX0n4B2exo37BZo1ILxjqRMNTEju89NRg5q1nomybcStot25+85vz2V+gTk/qxQxjuJ/TRzutlsZoLdKW7DYMn9In/AUnnEweZmIBPDSoGTKCCe/icapU2mOlYg0kn/1gzAEX2XnjpsMnByZLRBp4x4drw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xt+svqmInN98BUopZnsuFVlYB2ebrvmIlkldwvD9zO8=;
 b=ipiz10esG2SWEfeUjCp4h3vBCnKYP4DiJ12WBTWIyzlppxc3peqzBoCMK8b+Qd5VWY2GHmFvkvrlfam6J2tdFG9xXata4RyI9zGOQJkXULvZOInFcvwD0F5j3JWXKi4MDMXGjNwLso3ThkDk93NwDeTOgQb+5AzudRFRMzjCWnTkeM7yE0KP9W+gSNNdGn6gK1dNKQ1rfAcXuYKPBmWzW8ly7an8d/aoufXrsiFad+nLfXlmWhrnLB1xvvrw+HlsjLlXiyibtkKxHgcKP9n6CzRcn9RS2MtoZe4mDFmpunyx5sEYFrgOJ2y9zBo0AGojxfBUH/GWACuYLmKboVz0GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xt+svqmInN98BUopZnsuFVlYB2ebrvmIlkldwvD9zO8=;
 b=IBkeLsHrQdQsKxeCjwkZy7hici7iUlSzIXg4IyhNHZtXH0T20OGaXDFyjEtk7j63diENYwXeIvpjbUBM27BYWWP3bEHZ/u+TLl1QSgRVCpKxhMaaObnCwhxPoauay8Ktsvsth5BQR4rtPieZoGqLTRMehNYDkkyrZW+nysCULp96mnBq1gWxVUhUwFeL+sbPlD/fFrVMt4tOHg6dbF9dcxZz6U+OjqQ1QL/xJdQ+F2KUWn/KKnhqB/aDiwljVMUrMqRl4GhwXnmB5jvCsSa0hMRzmuSEicW20DWKlcjMvj0Uh5yPr3tM8xJk7GlKYF+g2gDwQndaCFT4Xlaf7H0OVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PAXPR04MB8638.eurprd04.prod.outlook.com (2603:10a6:102:21d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 12:56:39 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0223.017; Thu, 23 Jul 2026
 12:56:39 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 23 Jul 2026 21:00:03 +0800
Subject: [PATCH v2 1/4] arm64: dts: imx95-19x19-evk: Add CM7 node and
 related memory nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-imx-rproc-dts-v2-1-a5f5cf2eb55a@nxp.com>
References: <20260723-imx-rproc-dts-v2-0-a5f5cf2eb55a@nxp.com>
In-Reply-To: <20260723-imx-rproc-dts-v2-0-a5f5cf2eb55a@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: MA5PR01CA0031.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::16) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PAXPR04MB8638:EE_
X-MS-Office365-Filtering-Correlation-Id: 8999f8ae-c279-44f8-e1d2-08dee8b9d64f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|23010399003|7416014|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	FQuT003xoXawNiBhzE60y4eKvEAGfyZOBT5CyLuVZ8FuzWfYwT7pULrcUlxwsWbX6E+5X1gdaqs0J0uNB04oIn7Au3Aw8isyh8L4GiAAi5I4c4selzIYo44UOo9JcJ4MjECY4NxNc2XSf1wHnjZxy7VS/BfMD6RK4HPdZwbb8SxG1C3RY8dnvfZIwPRR4HQJZwrhdKGbsoUXoFbl7lMtGk/L5zeWcWwkxozs+MJnGl8qfjk8ZQO9ax25N+BkbOAhgEtywCPzbXwwEeKXD17CpGxdD5cY5eX7kKbZwqAl0f/7gNPBjeZEsAPKwTf/nY795SigNpj86iFIsOcRMXivsG14jizaMyAT3clOnT6ftVoekes/2rQZE1gv06Y9o6FPIjRlS7A1Tvlamyniikm1XM+hTPMP4qhHRos6I6+CK/4qQtHt8CKxQPg/bjkSCsPPSBSuXHWHNYU1JP5a/WSar1PX4G4C+DyNpvkqwDU4TPX8aK4GG8KtY123CUnqir6sXL0ZfC2DZ2OK9pjqbuQsUEovboiu4ckr1r1kioOeWuVsmzMa8gknU2oCZVhO5PSalbN6JSwB8jho5EIIIt1Y+8Qe0Yjm99bvMzqppVaxq/+uXGwi0Ot5gj4pZz8KwQymlHzJctnNYx7Ukr2jScwpF5se3bazXqE0TvggGY1y9BE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(23010399003)(7416014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHVmSGhoSlp1UEdhT0JVSk96RjEzTW92eEs5b3FMUHdpTXB0SGtwTTN6SHJR?=
 =?utf-8?B?ei9sTDNkUGtSamkvYTJKWUtBNXVRZE9Fb0pzOXlvdjZMZENkRlViWGZUMGFR?=
 =?utf-8?B?cGE3MTJPWjFoanArVnp4aXZlanB6eWVHa3ZLN2tuT09XSFhPZ2FIRGFoTEFL?=
 =?utf-8?B?QzVna1FXNXQ4ZlhKa3dzY3BtU1V1RjFGV0VyUzBEcnFNRFpvRGFKY0h0NklE?=
 =?utf-8?B?WTdPY1FxZFBjT2NnV3dBN1pPNzlPV1BEMjZ5V0p4cVZadURWZXNvbnVYaktm?=
 =?utf-8?B?L0IzSUg4QVk4d210RG53WndrYStBcXIwbTRKQU5jayt2ajJDc2FrUUhuMHN2?=
 =?utf-8?B?Y3hpM3ZrOGRncmhrRFQ3ZWI3NHljR1ZSZmRtOW04T3FIQUVEL2lJN1I2Rm91?=
 =?utf-8?B?c21hNVY2MkZXbzdVR3g0UVI1RXgwK2JYZUhHb2Q1ck9hMlFlS01DRUVsMHd6?=
 =?utf-8?B?SU5uTmZ3Y1E1ZmkxMTBQdjROVTJielFadHZyenYzM1gzMUxsZVFDNUc0Qlpl?=
 =?utf-8?B?dWhXRFFoRE5KMExmUzNpYm5QWmxVS2tYc1dwWVlNN2dtN3I0TWd2cnZzTVBC?=
 =?utf-8?B?Vzd0Z0RMR09GTU1QRTliaWJyUjREemcwRDV2allHcElXNE1EOFZZNXlLNjVn?=
 =?utf-8?B?V0NVcTVITXQyMHFZYlZ5MTQwa24rVys2WWtmc1JrU29ZYVl6V041Q0N4bnJo?=
 =?utf-8?B?aG9tZngyOGJqRGpKalUwZkVjcEgxdVFNN0xzaWNjL3p3WHUweXdMbnVoeXpL?=
 =?utf-8?B?Q0h0cFBkb1BiRG5kckNmMHFVMzBFUHU4V2FvTWtKVEZ4dHoya2hDMWU5M1Vh?=
 =?utf-8?B?c2o1M3lXWXRIZmUzSXV3SGh2RTZjWDRGYUlwYVNTVGxkUk81OGtaejJBT0Vt?=
 =?utf-8?B?M3VlWkxLQzFGQW02MGVkWmU2eDI4Z2psQjR1L29FUVFOYXF5UmRMak43VFdJ?=
 =?utf-8?B?Z0paQ09CbjlyZWNQZGUrQnBCclBKdjMyUm1RY2JDSDNxcWs3UWhBR1FJUzNH?=
 =?utf-8?B?SWpNcXU5RW9LdTZxRFA1LzdxNGtQd3Y5OGlxSmJHWVNzRTN4Nmx4cldLczlo?=
 =?utf-8?B?VlhMUHpHYWx6QzczMlZaT0FlOVB1UkpzTFRSNWRxcHRtdEZncWV0SUcrVWxp?=
 =?utf-8?B?ck1BbDJkVFdCOVhmc0kySEwwZW5yTlVsU0RtSEhBOVEvci9OYTFOUVhzMU9M?=
 =?utf-8?B?ckZGRURobnhGZmtrM3NkYTNTWHdNUlVFOXUyNXFDcW1jNWNPajVlaXZFQTMy?=
 =?utf-8?B?YXZNNjBRQ2oxOHVpQ1FXMlpycnpEUDc2WkZpUkYwbkRuZXhvYnBOU3h5bm40?=
 =?utf-8?B?ald0RFVYRDNRZER4Qi9TTE9MQWZObTNLTFZOWlpLd1VyMVVVL1p6RjZ6RUdN?=
 =?utf-8?B?K1FML0hkME0vaUJIeUlyVHRtSHVvMnNlaVQxdWpjQVhJY3E2OWdrMU9RL2t0?=
 =?utf-8?B?R0tXN0xra1gvc0VoQ1laZ09PNFZvSGVxMU03QzIrTGIraTFDSEpkbXEwVEVo?=
 =?utf-8?B?VHJRQkNFK2RMM3h2c3QzMFgyd0VFRFc2VFdBaVRDeVVTUHdhK1F6V2pqVXNI?=
 =?utf-8?B?MlFIdHVLM1k4OGRkL1MwTlhxNFp5NUJFbXI5ZnJKcGYvdEU4ZUpQU3M2Wmhj?=
 =?utf-8?B?dW53clJHKytzYjIvd2FxSXZzUE5NcXNxT3gxcmZZblVIRXY3aWZjMENyaEpv?=
 =?utf-8?B?YWE1R0FMRmtIcHY1dGpuWjRnZk1BQzh6WitsN3RyQllYb2V4cVhYUkxwNEhl?=
 =?utf-8?B?VVdFa2ZQbDREbThsVldnbEJINjhNK0xjV2xaS0tpdlRwbFFMRFp1b2xPclM4?=
 =?utf-8?B?cE82S3lwQ2w0THF2aS8vaEVrTnNiSGlPRFRYeld4blNhMVlRSkRpTEFEancy?=
 =?utf-8?B?bGdJbXF3Y1RkWDlwN0dQTDNoY0tPamloUFBNNjlpUnpoNko3NkRQLzBnMDFk?=
 =?utf-8?B?QmZKM0tUamtqK2hDU3VHd2p5MHhzazhMMGhtaStvbHBwd0gxcnd2a05QUVpZ?=
 =?utf-8?B?ZjRtWEdXTHQ3L2wwK29BWEVtZVc3S2dnZEZ2RlhvL2RZT1RKYUJrbHpiZHFF?=
 =?utf-8?B?YU0vbE9nUmFuNEJVaWwwYy85K21nZkRHNWhFMHRzQ0RnanEzc2hsQWRUZU42?=
 =?utf-8?B?S1diZmppVnBjZUxlUHNoVHR0enZLUk94dktiMlVnWjhJZy82aVJSQU0zRCtL?=
 =?utf-8?B?TURlU0pJanhkN1BSUHBYUHJoSGtjMEJwblhDL3pyUnR2Yko1M3F3RmNJaW90?=
 =?utf-8?B?MkhjSWptUWh2N1VFK2htdVQrdXFOUkxzb1c1ZExmZGtHWmN3NnRiZkMvM3FH?=
 =?utf-8?B?ekR2ZDQ3Tmk1Rk5CRW5FYUkzNURHMW53R0o3WDhIclFpQzdWTmsvNlNBQ2Nx?=
 =?utf-8?Q?QHsNs8JL7YFvBfLDq7nO6LkDTqk94T3MgqFvm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8999f8ae-c279-44f8-e1d2-08dee8b9d64f
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 12:56:39.6420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AwKEIgOIPwFpTIvYiwGVHMxKBbMLPkStC3H9atzWS+YRk+vA15zShfBs+EQBd9LJERnTZwmsCrk3CE25GKvhz3/9d9zekAvdmQ5i/jjEmx1+J0SKV9DoDsLqaY1cqaCO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8638

From: Peng Fan <peng.fan@nxp.com>

Add remoteproc CM7 node and reserved memory regions to enable the
Cortex-M7 remote processor. The reserved memory includes firmware
memory, virtio device vring buffers, a resource table and a shared
DMA pool for inter-processor communication via the MU7 mailbox.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 46 +++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 340ab0253ec21..814da90243b21 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -76,6 +76,42 @@ linux_cma: linux,cma {
 			linux,cma-default;
 			reusable;
 		};
+
+		m7_reserved: memory@80000000 {
+			no-map;
+			reg = <0 0x80000000 0 0x1000000>;
+		};
+
+		vdev0vring0: vdev0vring0@88000000 {
+			reg = <0 0x88000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@88008000 {
+			reg = <0 0x88008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: vdev1vring0@88010000 {
+			reg = <0 0x88010000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: vdev1vring1@88018000 {
+			reg = <0 0x88018000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@88220000 {
+			reg = <0 0x88220000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@88020000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x88020000 0 0x100000>;
+			no-map;
+		};
 	};
 
 	flexcan1_phy: can-phy0 {
@@ -185,6 +221,16 @@ reg_usb_vbus: regulator-vbus {
 		enable-active-high;
 	};
 
+	remoteproc-cm7 {
+		compatible = "fsl,imx95-cm7";
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu7 0 1
+			  &mu7 1 1
+			  &mu7 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
+	};
+
 	sound-bt-sco {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "bt-sco-audio";

-- 
2.34.1

