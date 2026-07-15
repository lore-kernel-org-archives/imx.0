Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011060.outbound.protection.outlook.com [40.107.130.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AE23126B9
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 07:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784099253; cv=fail; b=dKRyDbwELP3oSRLzQvrRDQDCVEWJ+9hiySdlB7q3K8l8vdZU1OesF0niR+cVsEgngGEaCp5Emt5QusnZsy6d0+fOG7Drzndm1f9cTXjjGBEMsWej23nDLoqmyf6cTqIY5004xvPaWCYeJtIHgzzhl9DNX12khQuRoDaMEQa3OPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784099253; c=relaxed/simple;
	bh=8Lr+GxdaXUXHdhfDCDcug9zcjCQr6V3WZHwEmg1WEZY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dOcdh4QBkytXA84XCWZc6fQyxStI3xglFXy1G/3tYHb75SYoAikS0fwPIE7i3T4itklIp2rZHEEvH/7KVy3OSRjSgjcANBXTKXwolewku6ub0d1NJwL7JfcNorNmFHyAEq+9j2JglaFrAlinmmT+WpTJDrOFEts1LbNUuazOjYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wAoqThIu; arc=fail smtp.client-ip=40.107.130.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wAoqThIu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TW5sVxiW9GquVu+zaWJd8hu3XRgumhooJy9G20dX0Tfc6wpLk/VDN8fQsCEZwSM4IaLTggcFdH43b4BVi2VMnL/HlIsPE2Y5vI2OdPa0DOeg+YNHOJqWG0lA41DkI+ErMBEye+osXDHovu+hH3jUHK48QGketJqp2iCryrvLPj1EOUxXL6gOhJLefAemo9kDYxLfyFisDVJ2Fc3ytMqiKUoVSeMVA+OkUKD9s2dVitm9qhd2l1bCTImqS22i+3z7tjx/aEdv57Z4+u4igSG6qoM6YhtXjL0Gm/3WN+3XBlRQocG8r7PUWwkAxswNbyT9BL0fAIx02bqjI2Uztx+DGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShBa2MRDNLGKpoXNGdFfFzGE2DJpdxRvogUMwsH/mwM=;
 b=g1iXKsfDJuvSU0692EPlPJ1N9XpkAGQIQfmLMGDqd3tm9hBaJchQPFu0rmANObI8dPV0vrLE+6oobukS8+hiGNcSEvnJQzTySsWXUEYbmfzeUO00EPkF3GLwFqRV3UzFQ1FqbMoRiyJgJ5D7C1ZZQIp+5ug3K1U1GRsD3JrqJBF03aXHLAtS8WFLe7xGPjABMRjuOiAvaYDdZbd4v2ZMiYurpcTYMV/YgXvA9LGCuraE8tgT/LG5NN9EOZ5yaOiERpnUKyNFeX0R1rU6Jc+GkNCd9F5WJ1UOeY21CTGDmDAmGAHBZy8fqrqW0AzItS0OyyIiFZjmr5IY9bb+EtwUiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShBa2MRDNLGKpoXNGdFfFzGE2DJpdxRvogUMwsH/mwM=;
 b=wAoqThIu9WZyCVLdJz664Egb5kN1HnRnTeyublUAzFSmIXETND1M217hwU60XJjcjyny782ZTbERt+sGttxikEOJgcNWvDdlDFIhxbHGTt1fcZ7IZ1pdYgxS4WPEVg3B5YQDxCp7tm5bOW7dlw8mz6xk1fQk4MQJ09As4NnFCp2Nj/x2NE3MLFB4doj8G7cPK+ZzpXq4G5fCpPJ9HDLWNVu11emmOL41JoS+gEQxIWVkjTaczyDufZ0luWjUrAewDuc9PkW84I94GGLdSfhUE5It3f9Op0G02g58HPMuTRlJ7hB/e2W/ZcWAq7YsvmtoX5OTD2ZRE6bdAXld11wxUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PA4PR04MB8064.eurprd04.prod.outlook.com (2603:10a6:102:cf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 07:07:22 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 07:07:22 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 15 Jul 2026 15:10:38 +0800
Subject: [PATCH 2/4] arm64: dts: imx952-evk: Add CM7 node and related
 memory nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-imx-rproc-dts-v1-2-d02b583c507b@nxp.com>
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
X-ClientProxiedBy: MA5PR01CA0132.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::9) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PA4PR04MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f9dca9a-528e-44b9-ef36-08dee23fb73f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|19092799006|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7cviM901QnFapecF8pfhgujN7koJ9KeBQ43NOfW/DTu0wM0lNIfx7IpCi8KkUpm+Dv7cDgZ5/3ELrk6zgo9AOreRB0ml0HgnvIkAkKX3GvytEJE7eE/CMpfxmS5AQEXQjPXCauF0rXzCoSNB92hdyQmbdRv+Zj1vQorwaJ23he+Lr7hzRXfiWK+TNKOmUB86K7DlpMFs2Y7QibS9uUFTe0+Wggn3Ss8NevpiZwEHUJGvP/2rd0MM9dcZMXM1E8hbvcsPGvlB/d8G958+a+3W9Ktg/mTsSwdDDmHpe4CsW5yiQZaWvrVxjL1TOJMXgSMJ0PpZTTprRPbx2sVVQ8JEX89/6BqgR24YQjLGUfoUCnfQGUQHnkA4QvInFv79V8DQcK+baCgG5xBiZNFOjYrXXz4v/4cB+YcA2/v6dOJQuK+DGLPgZyTSdPtcB2bqPNFJUSyMm16F/3XxTJS3xfdy75AfxyKtQRLu4PGiSGJvZlYK4hu/NVTEj8SCR2UOMCDIw5kTOfWGoQg/Y6T9zp2YPKVOqCEbsV9FhDGZjY4FfJ3JknHf1uum/hcno++6vTm6dH7aGmwF3BEPnfJJNEvqtEDfkHoOiuUMfrHO/Dfm2c3T/dkwuceMVegTMEooN1fW8LPZ9R9nogFnKQnAPRV8lZsI0vwAt9KreVWFHma16Ew=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(19092799006)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVNCYkYwbjZySmV1QlVrVlA5dVJzcWgwdVFucjJsaEV3S082WVZsTUhpNzVy?=
 =?utf-8?B?WGxzUGY4SXRzMVdMSUhSelBybVI1YVdkbGlhNFhlbFd6ZHVCUVZaRzlJSG1i?=
 =?utf-8?B?NEdmWXFEd0p4VlI2V3BiNDU3Qkp0R1NkQWxrT213SkMyQ2VmVytzL3BHcjN3?=
 =?utf-8?B?MmlZSTJJRVZaUDlGeFo2THk2NVBYUkxNMGwwWE1kZ1FyWnBncVkrU0VkWHpy?=
 =?utf-8?B?NE9mbXlPS2dJck1QSjZXd2hIbk9xN0JjSGsrS3NKKzkwWStjODUrTDFlQWRD?=
 =?utf-8?B?SnIrLytNdlhvNjZTZTZ0OTBTU2tpbUlRRFBxejM4Z3V2ZFI3Y3E4QkkzVWZl?=
 =?utf-8?B?R1hSS1EvVkNYcGtxWjN4ZVBYUFpxdjRXUmFhMzd3WmFDMlQ1UDB0a3ZwYXZi?=
 =?utf-8?B?RS9OVGt3d2RNTXFGV2xPVk5OeW5haEFZdGdOenRxTk1TNFY2WFRXem1lczZY?=
 =?utf-8?B?N0J4VFA1Qkc4VUNpOURNUHNPVExMcmwzL0JGL2pPL0h4aVpRWk1OUFZDTWpW?=
 =?utf-8?B?ZHdFMnhZcnpRZXIxclYyOW0xSmIwMERNTVJXTE9IWFhwMGVwNnpOd001UWdi?=
 =?utf-8?B?amlHVTdXVGZTZFVQVDUvWWFxNzVhUDZXZ2FNWFY4UUkwSGJvY3RERnZVYTAz?=
 =?utf-8?B?Zm1OZldobXdPTFFkUDhMZ2tqUzY5c0dUVXpjNDRSOWpLVDNJb3I1L0RkTWZP?=
 =?utf-8?B?ZFZvUkhVbmpJRlpsSllzek9uUHRSaExCYVdkRlBjWFFqZlVyY09PRkV5d3l5?=
 =?utf-8?B?enlJVTJ6T2RGRlhKMWVPblRsMFdTeVlxSkUzT0JQZ0JER3lEckRwRXpSaTZX?=
 =?utf-8?B?UWJ2dzg0SHo1OTd0aUtZRWw5OUpaTmVVNGNGRDFONFZtZ2hXQVhuMEx2QWdG?=
 =?utf-8?B?THpNRWhZZVpxOXNodmFNUHZJampWNzUxSWZndzN2dGI5d3hYeHZ1Sm9zVFpl?=
 =?utf-8?B?eHlkM3ErYUNOQlpRZlo1VDJYbVFSN2dZWUNRa2ZnaENFQnFzL0ZjZUdySUZS?=
 =?utf-8?B?bk9tR3ZvZ3kyU1hvS2VhTWlEa1ZGa0p4QytpWHNZTlVCZXZRL1lZbXdTV2o5?=
 =?utf-8?B?TTZYSXJseS8wM1JqeDErempaaURzdmdRMTAwTjlVb3J2MmVUdTVna0NnVjZN?=
 =?utf-8?B?WjJDdGFxZjY2SDFWK3c0NDVYVlZPTHVPalZKRllwcXdZSnNhQ2U2eENNei9h?=
 =?utf-8?B?ZURYeVFFc3kwQnd1STVwNWVuYnNRakZBMUh6RHZWaUxNeVJYUDVkZmJMOTBT?=
 =?utf-8?B?Z0VIWWtNV3VseXpRazAzRTVrajJKWVBpUzNBMnFnRk5pc0RwQjVmdjB0bU5l?=
 =?utf-8?B?Um1NTzRDRVkxYWdlY0QrMmpXZVZPT1lUWnF3NXJkbU5yYUV1NnovYmQyNUJi?=
 =?utf-8?B?a1Y5MkxFZ2tiK0tJOEh1dTZDQjFUM1F5aHQ0UXNESngrYjYraXhUaFdrSFJP?=
 =?utf-8?B?SVFzVTh3TG5IZ3lkUjVzM0JzWFg4SW9HMHJ4M1dXVjV3WE5pNUZtSk9CSW8x?=
 =?utf-8?B?ak91cVpVUjBnR0tjbGM4ekNMS1JJRmRsOUdwazdIQkJYeVNsSjhnQXVISnRh?=
 =?utf-8?B?bjZLUlo5YmVPQzFtMmtySGl1RnRuNDI3RlVvdnZEeWtlelB6bDFrWW5lUjBM?=
 =?utf-8?B?ejY1cnVqQkM2alR5eE9lY3o5RnE1Qi85QUtreG95dEhFelc3VlhrV1ptOGUy?=
 =?utf-8?B?eWZoVFdOU2QwVkpDZ1ZJTS9SemN4dkZLWnJMQ3JHNGdrKzI3RStqTE00QW02?=
 =?utf-8?B?bjlsY2JXcG9FeDJjL2VicFovaUNUc005TGhBRWZQancrVXpDT0Z0WU1xcUdU?=
 =?utf-8?B?bW9vYnRtWEUxbW00TkZ4UWlYNUFpR2tRT0FTMVJvaTBMQ0VXRGNqd2lIWFg2?=
 =?utf-8?B?WTFubitlVlQ3cU56UWtudTFES1ZrRTdNWlBwVWdWNXNGR1d2bUJGR3owdjZr?=
 =?utf-8?B?ZUl2TjRjTnA5UXhVejlBNlRHWW8vWXorSTgvNWQyQmVKYmFXSHNRSWZQSXUy?=
 =?utf-8?B?Mmd1NE10Smc3cFQwdWtVL1dYM2g3Z0dBYzdaMDdaaUJlYUNhSEpDRmNibWN3?=
 =?utf-8?B?aWVnd0JkWFI3Qkttb0dOR2NsbnZDeDFvZXI3aWlNNyt2R0k0K204M1huL09D?=
 =?utf-8?B?aFNlNnlqNzZHUGl3ZzNrQ2JFVFBubU5tMWc3dS9EUmtBZDNsUFJSS0dVbkNI?=
 =?utf-8?B?RXRveW9ZbXRiVDNxcXpHa3h0cXEvUTRJOTFTcW4vQmlXU3djK0JrNEdzYUhG?=
 =?utf-8?B?djJEbVJ4U3pxc2VrZ2JpT0phSVM1cVdmWkVzbFora0hON01qR3BIWHh2Zkdu?=
 =?utf-8?B?VW8rT25nSTBibTJPZGhpSVJsWmMwN3J0cytrOXY5TXJrYXNsSjUxODdidUUr?=
 =?utf-8?Q?fXu0cdmAGPTzPtF7+tkyqC5Jc5WEFxQJRcEpV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f9dca9a-528e-44b9-ef36-08dee23fb73f
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 07:07:22.1069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hcc95xGo/JTIWX+Ci1xwtYPU6351L8WRegvJ2i0CnelKfIN3YLtwsvfAf65xyJq1qo8orhc6qbXH13YC6gGqPBvIyK2+7DIn7ia2WyLXlj0ZRHQIG3+3HbiRvOZ+4UFG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8064

From: Peng Fan <peng.fan@nxp.com>

Add remoteproc CM7 node and reserved memory regions to enable the
Cortex-M7 remote processor. The reserved memory includes firmware
memory, virtio device vring buffers and a resource table for
inter-processor communication via the MU7 mailbox.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 50 ++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index 62d1c1c7c5013..fec851544fb11 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -82,6 +82,42 @@ linux_cma: linux,cma {
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
+		vdevbuffer: vdevbuffer@88020000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x88020000 0 0x100000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@88220000 {
+			reg = <0 0x88220000 0 0x1000>;
+			no-map;
+		};
 	};
 
 	flexcan1_phy: can-phy0 {
@@ -151,6 +187,16 @@ reg_usb_vbus: regulator-vbus {
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
 		simple-audio-card,bitclock-inversion;
@@ -451,6 +497,10 @@ &micfil {
 	status = "okay";
 };
 
+&mu7 {
+	status = "okay";
+};
+
 &sai1 {
 	assigned-clocks = <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
 			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,

-- 
2.34.1

