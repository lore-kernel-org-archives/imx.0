Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013045.outbound.protection.outlook.com [52.101.72.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A2F31A045
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 07:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784099241; cv=fail; b=rWNqgw22OIf+iFXUAOIkuKXiOii19cCfSwwjsS+8haY+TVD7PHtyU7nYeb+u9W6NxWZ/dg12C5M9Pfeh5qqQ5bU0ENvaDD2dNfi35b6G1pxmF6X7C7krmF69N93aRu3CDt5N8xVBBDZzaS4LjJM+y0RzskLvfRS+XZv1/Gek7O0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784099241; c=relaxed/simple;
	bh=sAu/1sJdZu0sRqDMTi4/EVzWCdHUh24oDofbLdyX12I=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kK2VTRpRULAXQxBeTr3cPHnd60uvbWOBXgp+d5dmppJIlWkVEkBVC2/cCnQgV8UcVavAa43sXCf1bQ2U3stVutDnVXpY6OSmOS8MsZZ/xb0ssg1LMuzE2TipyZQ6Jm2dz49t+i65gg/i3J70QqCE4aMJ4L/G621pjCjaEcY9eNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=o2AGK3pD; arc=fail smtp.client-ip=52.101.72.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="o2AGK3pD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DN157WhqVZmXYWdxJJgoD43y+6HehIoVAGtkOyr7E/AuIXXfAOshlc/jF6r7MoOAnZOodaSNHqxvdhEqyNomBbc+3HY7zirm6bvoojEXGhcqFicykInPm35d9UswwCAYsMmzb/44fdHlTCyq8jfIQOSsWUCAnNrvWnVGCqcXiWObD/frtxtpEYS13kdQ7snOZPFKI476cNtaUJRQi8FJMi3f9lZSh/JewkfuF5AnjNnRwjP20xY7MPNkptY8SokEq1mdnyGmCVbU3xfMk4ndGWGeWQlyrVQCcKZLfK9oyQk6SlqAlgdvc94Zk5BtHFpuuUaj6p72KwsXFgVmzyhnvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRYJmTSIZ6u2RqnCRwW/CZD9tUQ3vcNkP5ZnH0Ln+WQ=;
 b=q1pfNi55aqT8d/FjfkxPcKxazUibdSQRNrJJupRK8ibsKJGNkIYSf/t9q7C8LWozpp6iUTJnX+yHl7aqxMkvjpyP9O0MxE54Wl3LQSFx7dW4OG7YpfHFJmA+6eAHpSUrS9TV9wSiY6017r5t7bqhRhdhGgP5AW386tvXcZjShrchDyB6sM+2fyG0jgeS8BW6UNp9JBVC4XHRdRO7HqUqYk4Z5jL+6Gr7CkRaDp68DS8x7YOl4+ooFq9ohKszLMWXVN+RaV8zGuo+l6yNitjP87Vutj8yDgwgAE1Dn7tQXniG2vCACX47e/34gkq1BNud2DllH5K6k5ZKJEuN6iN61g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRYJmTSIZ6u2RqnCRwW/CZD9tUQ3vcNkP5ZnH0Ln+WQ=;
 b=o2AGK3pD9GThA6MTEY29McVOgefKOnZ3XD0WE5XH8+zjbe3l428upTFMg7BZKaNzMBRvxFi5y3G5SMyYfvIKz+vJUk7j/Nei+HTMqkqPQcwvCCWWtuGZkkOu+DBLkM2HBYo82tiyAwcKtaCiPcvhwXDFcJuPm3rxivkvGn+QtaVAYtKX+C92Cu3upI8ogpbtOpx9B748BU0l49knUEpzcNC3tNTI+Szys4GV7A/XKjCwGYQrKWFvpthVaLmsMaUozMGST2IMXqBWuNnUdr9g+MmQdR6uUV7R73pSC7tD725gARBAgSAvkoWbNKpLrdkTx1IbHXfPf2qftPE0xAzdYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PA4PR04MB8064.eurprd04.prod.outlook.com (2603:10a6:102:cf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 07:07:14 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 07:07:14 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 15 Jul 2026 15:10:37 +0800
Subject: [PATCH 1/4] arm64: dts: imx95-19x19-evk: Add CM7 node and related
 memory nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-imx-rproc-dts-v1-1-d02b583c507b@nxp.com>
References: <20260715-imx-rproc-dts-v1-0-d02b583c507b@nxp.com>
In-Reply-To: <20260715-imx-rproc-dts-v1-0-d02b583c507b@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: MA5P287CA0158.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::6) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PA4PR04MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b480b78-2e34-45c2-f9b4-08dee23fb2ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|19092799006|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0raDNipbDgUXq0IcTr1It/MpmMPkoMoMEEaFlgRfG+XeCGE0HCcmEmmBsXW0CP3llEN3jI1A29mYGRHwit8HBDcprh6eHeRJzeoCgOY2tDCNCusEKrEsE4iIeSfJ4R8dYKQ9m2UQXDBL8feBwm8P3aIP3D9lT/t5+4NNyoKruo0yhwfM/odbwT9iOW+c9myCpf2j1K67aKU88x48+wknmgRxE82KxFEw+VjGf9B3BDq1LTfnw661jJa/qXn8YfuvKOUOhp/6ZjJ03PBdFyqXBsFzGI7lIjEq0r5JVNuOq4bZY8MYjraTN+giUgUcKWYHKvklumaG4q+WUWTJb8s5wAZFFfGSHG4kIu2rnmg50Fyp4P1+IqKv3Da0jug5zZWrXYpdhfgpt53PgGgT5x+rdDhE8SMmFEqp9wliyYkCye2K2xRvM1leYzQi1/7uUAgFYeM+1mT0tQGRqQ4nl72klP6S7pg4/HoR7LSgJFa/t/hq11I7xZkNME4dK6yueyOn9nMQcO0xuf1b3LyhUZK0c3hw5tWpYutk4feDCW5XFulIosCQen1S3yw0tE2RKVu5lfKl2xsb0LCItccbPur69+QetBHx/nBi2BYSR3vd1kWulKfvupqnMgvfjOuaDeURIyNPYinUWUGuwjOIFdc4OiSan/Ccg8y+MALzvg0Vul8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(19092799006)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UklkVFQyaldUV3pyL3NKMjE3c0hST2JKeVZBS2lmWHNodmpUK0xRUis4bllr?=
 =?utf-8?B?UU93MlBXQjB5MERObE1LV3VvL0VJL1duQzRNSEhSb0lWeWZmT1dITlR1TGtt?=
 =?utf-8?B?M2luZFBxbDdkNDkydGlJYXEvUDYzbHdScjRlM0s5UFBrTUpMVU9WaGU4cThq?=
 =?utf-8?B?blQ4dWJiWUpNdGczNjdSYUpwZ0JaMEhiVWVYRDFFcDJHWDlNcTkvRU11Mkgy?=
 =?utf-8?B?Rk1QV2paN24rNnhyUnZtNy96ZktpOUduSzlZZ0JkR1RmbitxRnJiQ2E2R2tH?=
 =?utf-8?B?YSs1MlZkb3VWVmJIRjhYZDVWcVJqMjdWdE1ReGhBRU5FZWRXcWhWM2RKWUV1?=
 =?utf-8?B?eHRUSkdRaXRPMHdmS3VKMVJWTURWZW90RXI3T2xvUXFJakh2Y0t4WmlPb3Er?=
 =?utf-8?B?VHdGdmRnSkhEb29SK1V0SWZYSU5HQnpzTXdOU1VnR3RteVNRdTBKejZZQjMy?=
 =?utf-8?B?V1F6R00vZk5NckY3YVlYVVI5a2dWUW9KR2tHQllHZVNXcjlhVnZiNmpXaEs3?=
 =?utf-8?B?NGtpUXlyc2I4OC91ZWlXWGpDQTBSUHpaMndzWGdLTFhFdTM5dXNoMUk3TjRx?=
 =?utf-8?B?WTR6SmJMQmEyVmJPOFE3aDZMckJENXlCUXJSUGRsWGZFQUk0SnJDWkIrditW?=
 =?utf-8?B?cEdzbUVRZW5nTkQvUFh4RDdsVklDb21TMVYzVDUwZEQ3TFA0L05WVHdFeHN6?=
 =?utf-8?B?b1JZWVAxWUJrUE81Z3N5RFo4T0dzV1BteEVyS3VWUjJiYlFBRlZweEJScDdP?=
 =?utf-8?B?aU0rWlorUXlFQXFNWFJteGNHOGtJSWVrTTNaZkIxNGZ5OFExeW95bTFSUnF1?=
 =?utf-8?B?SW00Wkd0OFJ0ZFBnSUFqeFNob0dxc1R3ZWtmdnRzSStTdWViTnh5bDVtWWp5?=
 =?utf-8?B?WG11MFB1Skpkd1lFMCtCK2RSNllsby91SEFZa2hjV2tJRmdNV3F2emp1TDky?=
 =?utf-8?B?TTFNWlVXRVhtaktITjQwdTFFQnN6VzZQWGI4SEZRbm9CaEpMczF1cFp2NFVQ?=
 =?utf-8?B?c08zUVRrQTBIMjFOdktMVEpwTGRqMWs0RHQzWXJ0TUI1M1pTWUpudG5WSElU?=
 =?utf-8?B?NWQ5aHNJN0tBTkpDVEZWTFpWSzB5NlcrUnhoSEZBdzdKRXo4VEZNOXBtb2xE?=
 =?utf-8?B?R25FakJMQ2c5RitNdHcyRTBMS1BrSExwaXNBMmhoR1NaS1h3MnpjMmE2bzd0?=
 =?utf-8?B?bXMvcTBiVlRKc0pOT1lPd2NLWjZxVXZFSkorcXl0VzZiRUpyR29zZFZCYVVT?=
 =?utf-8?B?QlVLN3c5UXhZS1pCcHJGbXNwRWlPUTNqVy9HQjZtSjMzZUNuWmJVR0k5Z0VP?=
 =?utf-8?B?eTBDckdITmNLYW5JZ1k1WnZxcEZuR0dQOFJxeFBqQ3Eya29zUFoxS2Z2MVRr?=
 =?utf-8?B?U1JMMUZMZ0VCWEJJa3ZvR08xQXQ5ZzA5dnI0dWRLbDRNdWxESW9naDVZT1l5?=
 =?utf-8?B?VjFORUt0VmNaS09adVBENzNxcnRvb2s1VnBicUd1YjFjdkNueklDOUpBMk1L?=
 =?utf-8?B?MytnT1g5eUNyZ3RuU292TnlxWXlaYjZ6WmtZZlc2R3BUSnlVYUIrV0dudVNx?=
 =?utf-8?B?djJteUp3SFA1bThCQXN4YVZpMkREL25GOFVmaUM4d1pURjdaNnMxTEJhVWdq?=
 =?utf-8?B?eVh0YWVoOXgwTy9NZG9WMXQvZzFRRTNVd0w4OGFManJDTFdjeUlXUXFGQ1B2?=
 =?utf-8?B?Z2pRYjA0M1hTejU2dGIyUHpyQmZHMWl0ZzhlMVZyaldYblliVlNIc3BQUTBI?=
 =?utf-8?B?ZFl5NWNZNXVvNzBFcDA3QXU1dkxqSzNlVUJpTFBhQlZaaFBGdE5CNHZMTTBw?=
 =?utf-8?B?M01GR3Zkb2FpNlAwSHEwWk5vT1VKMnl2RHc1czV1TXV2MVVHVnlBN1RZTms1?=
 =?utf-8?B?VUVvNTUvYVNmMmgwMHU5WmVSMEZPeWs5OHoxYjB5QTljRytIbVNQMHRKZTdJ?=
 =?utf-8?B?SUdSTldjMlpRZUdXa2MxczdJY0FkcFR0ZitUb2RqNUlJbStkb0hUY0xNSSth?=
 =?utf-8?B?QWFWQzdzcll5L2lXOU12SmZBQUFrR29oSmtKYjNRMkwwTUhwa0J0TStYajVY?=
 =?utf-8?B?YXhnT1BrMThhWTF4ZERXdEhCYkRrK0o3dlNoSVNsVnh2Rnk0d1QyT1lzMTFO?=
 =?utf-8?B?MFB3ZmUrd095dWpTZE53T3o5LzUzbWZpMDU2QklqRTFnWGJRUUp5Q1RaOWRD?=
 =?utf-8?B?Wko1eWJZdDB3ZW1GbXpLVWFxVnNlRXBuRHhuOEhjMmt0Y1dsK0VvdUlBd2Q1?=
 =?utf-8?B?Qk02S2dLTHFiRS9TdGxxcnpBT1JXK0w2bnQrUFpOaEJkcVVUQ0FlTlJtLzNQ?=
 =?utf-8?B?TkVoK2w5QzYrYndobE5FdVdMYUFFZlhjM1MwREFnLzJudW5Sc2oxOUUvWFRq?=
 =?utf-8?Q?NToYE0toGx3QRJPV5p4AztnXA7ZnIiatk+Wyp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b480b78-2e34-45c2-f9b4-08dee23fb2ab
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 07:07:14.3076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qO+3wXWoa/aQWnSx5nq7Ye02B7GDbAOwVx9ka4zt3zT9UU/eR0UzzRZ4lFLNJLLhpg1MoMNf/B4p/ajwOVLFrjXCFAW0rn7EvqZoEFkPeQ+LxAxC4soOR9zO0kckIOIh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8064

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
index 340ab0253ec21..e7d1afc6e1b8e 100644
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
+		vdevbuffer: vdevbuffer@88020000 {
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
+		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
+	};
+
 	sound-bt-sco {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "bt-sco-audio";

-- 
2.34.1

