Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011015.outbound.protection.outlook.com [52.101.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FCA48035C
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 21:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783374749; cv=fail; b=hEn10d2QYjy6EXIrr+pXvUPiMNhCB/iRBGK6gYIZAWhvSVKsE+Vj6hc9GVeBJHwvkutjbX3tUB/4UUcz7BRTjJQ4Ztz91jMwFNfJ3aXIcJLXfBEkJ3mwji5SeqYcE2jVoj0CB0IN+avHuyPDvbuNAyWhjYWZvBg7Xw1Su/cjE9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783374749; c=relaxed/simple;
	bh=MR+eadcCWfoJxZYe/Wl5M6xUjhTtFDBzzV8FEeefbWg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Mz3LyIHQ6pO52D/bC/092jDRGvjRxfMWXSAoF3366T87LpmF30iGXOLvp6PrOe9uatY0JsMb/VkNYEfsXqfBiSLaavH7pRKfawNDgrM1u56qqAm3EOWpVVbRRF8uokgSMbf00p7qCitEekkD+otE4maCSqM18s9G4nEDyL4o0cM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fDY93OGn; arc=fail smtp.client-ip=52.101.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fDY93OGn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V08uQNSwyfThiIX2uu7NbtLe+vCTUo/DbrTzJrqlGQ7BO0jkO6DBg+jhzo+crGv+wycfB3RtkRsQXtciuQRHTocdHcy+eigGoJlAdnEAdd7GrnxheorPJc7/chhJXHqA5rgEjZX1FV/DuJ3QWM4yuORmv/HyTExnkSLdxPdknrMHOlwuhNntWlQUsFOvdwsifDC5wcub/imHgO8WFc3ocL61H+8v4jo1LabREeB7I1gVzcYna6rBWUcbpUearGkZdxwC8w3zD0MfyXqgnju1soznaNa6meEMqnBd+LuZMNbAjFBRHUFcyClzs6H88U7wFxT+eEn4de7BfrlaIJiQWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0K2rv8lV9jtyYBRF75oOvF065+Bf9bnxhiCkCs5qUM=;
 b=EbmpmUi/HRWVn2grLuTr67UJrVmfXq/e6msLMWhoVDQ8ta35sf4j8OfXinEgNIyp2Xkrx4iGxRJWKFvZH85NHdh6iEqBEl5CG0Ns9HptQHZz12SgpCGfysJhd7VJW3xhAcL/Mi8BeShU+rq96iFnLzH/1LtpzM4Xd76b4QJn7hkmYLYZkNwCNoP7eDYmpZSCD8iqypsbsT/ZISxJX8aIIWMcU96BZcAyv48qAHhzQzy3TQ3wgkfyx+JOTOFDvKOkOyBTCWwhyaM5gJJKZ6yiTDdS0ljEkE/71tssx0rXZLoGjfgQj9el4yzZud4qhIXLpeGf4OpTWgGdWste+TbAPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0K2rv8lV9jtyYBRF75oOvF065+Bf9bnxhiCkCs5qUM=;
 b=fDY93OGnvoYC64Xm2fcBpuTuX9OIDh07ZNQ86RhPek1QwuplivITL5ooG2MeH3YNITBXOGVZnbfwuUt5pRFjKZJaI5cu729Uju787tMukDrytB48RVuPre/DXdUmqjWMxkK+3XjtTWZllHmqVgIaWNYcw5PyP7maZb0GL4nxQxLXcjF6/KJB94rGPBFmDaMbJ+JS18InFRudJtfshloPLdyTPKsj3whvG0LBpfJKUU9YpfOM+k+1DMLWLKkyPSp5OXo/755DbVQ/2VWL850dzqRWc4JiqZOF1WP5puo6TIj8x4mQ/cdJATMDYh4QUinplHryZHwcvegcGqB54qIESg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU6PR04MB11230.eurprd04.prod.outlook.com (2603:10a6:10:5c1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Mon, 6 Jul
 2026 21:52:25 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 6 Jul 2026
 21:52:25 +0000
From: Frank.Li@oss.nxp.com
Date: Mon, 06 Jul 2026 17:52:08 -0400
Subject: [PATCH 1/4] arm64: dts: imx8qm-ss-dma: add lpuart4 node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qm_dts-v1-1-14117a48fbdb@nxp.com>
References: <20260706-qm_dts-v1-0-14117a48fbdb@nxp.com>
In-Reply-To: <20260706-qm_dts-v1-0-14117a48fbdb@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783374735; l=1261;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=gO7droqsRKZ2vUTuJcFc6FA30s5M7YES8HFx5Hv4LOs=;
 b=cNdk6JWfKeeLyaXjFqpAM3T6QiIwQBVXky+V+zO4osd8OeH2MZ2zwQsBY74G4CMUQfxTqcdj3
 1Hiv0sYClHJAYe79IFzCLBIwwAhpFaJFeC2iwgAL7mQtnCb+2otmAlQ
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA1P222CA0166.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU6PR04MB11230:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c6c81d6-3fa0-4fea-eb71-08dedba8dd7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|23010399003|1800799024|366016|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	GEuBbgnATZ7B895KfBFlyI95h2R3SOwE7hTqiBZqFzp/tAVjpSIJuPlvVFauPIudeBBHBWDMrfgqt24Wgm6PRbs5TkkNVmUNkZX77FqHMp/Ikd5OgNRbHyLKXFjbqI66ZRv5uKF9VQIVh2rVRuaabTo595SHR0t1WakpV4onZZRv0Z94TZknNnmkGmY4xCuK+RXFg4bYKEiTO/EFm+q5cUmyXlXA2DZAJ9ZgaySnvF1TllCHCq3RW3lQI1k2vA8o4eN0IhM81sxXIssBrglqu8DygzfuzvXpjvzySPZgibYqm+wAiykw75oM/Z8b9/bTb/68UK0svUSKu7RO1eoZWtBtJ5GKTR964y5eNuQoKYWeSzNIfaF78KSaFdsS2ipjN93wlkvX1NGzeydxWkOaBg6gNyAwm+0UWpE0L9twiKlA+/d/F6fJhKISmINdWgOLU8EE57M4cH87PdF8hyuL+S6dNbo3Q364uCvjGvZsOmn+xynJgpvJomxx3aUhA0wy80w0IbwzzFjpX497ttg5Q897jYc3pAbdfU6SHfNuX4NjVvOiarMOsCyCNOssC/xKJBxluQDWorq1c6ewBrhHw5cAquw8K7WjdscYY+p3O16sZEw9CCoogdy+DHABBHVfCBbj4nrws9Mv5JFxzUFiI6ZCZvI0V8c0TVznrmxgPls=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2VPb1pPWitOckc1TFFhc2o0VkJtRG1iQ21KNzFMbS93TUE2VEF0emlEczdr?=
 =?utf-8?B?N3A2WFI5T1c2UFk2dWE4eVNJNUlCcGtnN3ZTUmpudXRpb1RneUR2NXM0RmFS?=
 =?utf-8?B?cHhVSUZ5NlRibU5NMW9FdWNDVEMxYTZYZTk2dnNXUXBSbkFBS2pLTzdFck16?=
 =?utf-8?B?WHMySXJaM3VIZHQ0MDl1ZS8rSENmUE5xR2FKZ0loWUVLamJkZ05RN3lHNlhx?=
 =?utf-8?B?NXVFSk5OTzI4bWJjcEx1MDlYc2ErWVZJR2FwVTZmcVNhSktBVjJRYUloWjcr?=
 =?utf-8?B?T1Zwc3B0Z2tNa2VnUGpiRThEVkpZSFVXeVFpTVZZWUk4eGNDQlZsNjBIWGlw?=
 =?utf-8?B?Rm5SbGRzRlVZTkRJSzlIc25Ya1NLVFUwYkhmK2l6Y05jR0NvOUFseVFIWElp?=
 =?utf-8?B?NVJGTDNHSXlYS0RLOWc2QW1WQnVpRGl4cUxnOU51WkdKNTJzMTV5bEJDdkJ2?=
 =?utf-8?B?SGY5bGdNeGR5NzMrQUZhZ2pkZ3R4V1QwbDlVc2g4dHVmMjFCa1JrTVFSUnVa?=
 =?utf-8?B?SExYRUFZcDlQaU5lQUt1c0JYWGFHSENFb1VUc3JUbFNvZ1hvMWdIUXF4aGNn?=
 =?utf-8?B?NG96L0NZZ2lKREtTQjlIT1FjeWptNzVsMGdzb3lhOHU3amxTb0k4R0R1Z2Ir?=
 =?utf-8?B?YlIwdStrWm8xbmlPUTNYL2Vyb2N0b0JOZmp5cXVRWUI5UVZwR3NOTWN0YVRp?=
 =?utf-8?B?L3h6ZURIZE5DYjBxdDVjRFRBLzZNNGZzbEhBVTF3d2s4aXl1alRzMGdJenRJ?=
 =?utf-8?B?ODI5Q29jTzNWZ1huYmp4STFneGNiSjY2eFFkVjFNdzFRSkl5TjU1WmpOdU9q?=
 =?utf-8?B?dUh4UWVuV0JYbEU1MnJOdEszZkx0bnFkLzVtKzdENWlqNzMyMFJjcWpEUHBG?=
 =?utf-8?B?YWpsYlY3YjMxTG41TUExMXF0cnBrckhGU0JMdDV3UVdlZms0Ni80c0tGelNt?=
 =?utf-8?B?WE1pV0RmMHhlRmtob2lTWGI0ZFU1UFUvdTJwSWtSSjh2bXc4Mk9SU09ZeS9p?=
 =?utf-8?B?bi9teGs4UEJ3a0pkOXdYUUU3bFNWWTQrVjROblMrOTA0ak5tUWdiZitqMWNj?=
 =?utf-8?B?RGczUTF3a1dTSncvaTNFaVArM2NqemxGdVY0cWRtZ05SclgybGRvZmJ1ajFn?=
 =?utf-8?B?V2JIejNYcGNvUm1sT3A2SEd3MU1mUU5UMVdLaG1KTjFBZTlDTElGLzJSU3pt?=
 =?utf-8?B?NnI3KzdYS2FnK0FzajFkSkJSN0djNWhKMTRrMHVYM1IzUU5GN2J5REtLVTdH?=
 =?utf-8?B?a3VYUE1UNVVOUnNRT3hobFgxbUJCRC9TQk9xQThNTGhzK2wwRUpXSWYydUdk?=
 =?utf-8?B?b21jbkNDMFZtRUVueUJOa01DMHVnTWIveENqeEZqbE5FUmlHZkxkV2llTEFx?=
 =?utf-8?B?RU9rSHR6dnEzOW9GQ3NuSE4ydkxnR2FxY0E2S2IzeURKaXQ4RTdOekFZcUxB?=
 =?utf-8?B?MThaRGt2VWtWQVcwMkpEb0JBaU5hRVphQUNwbFo1ZEcxcDJZa3g4NUxTeXUr?=
 =?utf-8?B?blU5dDdRZ0p5bzViZzBpODA5NlozSHFBc1VpWUZWQzQxUWtIMENPWTZyVm5q?=
 =?utf-8?B?TjR5OWk3dVdIbGdOMUNGczFnOFNVTWZYMkpZamF5SjJOLzVYWnptMmQrWFIr?=
 =?utf-8?B?N1Y2L2VPVWZ6bzhESkZRelRBcG81Sm52Vk9IS3grejBBQ1I0TFl2aENtSkh1?=
 =?utf-8?B?RUVUL2JnVERBb2hlbG5ZdGd2a1ZTTzB2OEdscDlvTG5XZjBqQ0dobS9zckVm?=
 =?utf-8?B?UTJ6Y2xVNnR5RlhYeTFaczBKMnhWNzIyUGhsSlNDSnhzVEdOeGthQWVBejFJ?=
 =?utf-8?B?Z1NOa1FHb0hFQVJSOU5QRzRlRklqQlp1VnlCb0daZm1tS3ByT1c5cFJYZ3Nk?=
 =?utf-8?B?b242bEdHU2RlWkUxZitvQTUvWmZtUXA5UDRhd21BbXZ5cyttWUwveGMrcEdR?=
 =?utf-8?B?YXE4Zmord0x0TklweXZuR2pMZnhxYnFBTlE3YVk0eFpuOHRNcjZCSDgxRkxo?=
 =?utf-8?B?NlZnTXMyN3paVytqZER5Uk1UM05PODhmOUIwSGpMR1d0NkhrSVI3bXhod2JZ?=
 =?utf-8?B?YmdZVTlZVnlnVHlST3EyTmpNZkdqMHNjU3pOVUNGWTRRR25QTm1FMUsyZTla?=
 =?utf-8?B?Mnd0ZVkxekFhNkJVTGRwS1pGNXhjNFgrSlVaSUwycjBPZERubXNGUldHSEJ1?=
 =?utf-8?B?SldiTjlUUHZGUktFdjkwSEFEK0VrWUJPcVVuVlJLYjNERVJMQ2tUUm1RVk5Y?=
 =?utf-8?B?cER6UFdQU1lwenlYL09JWUVMSGIzdlZ0SjBhWXh0K1BvNXQxSmdkVjlVMHJl?=
 =?utf-8?B?WklrcWM0Ri93dGN6aDA3eUVERVhLWFVKK2ZMQTRoY29namVpL0JqVEpRaXdF?=
 =?utf-8?Q?o5AwrXFmku6geRaqmuLLQCmdkhAa5SELEpAdJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c6c81d6-3fa0-4fea-eb71-08dedba8dd7e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 21:52:25.2329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KHs5tavsh4HrmkWWwFZHHVlr585y/EFr7g7UNieupHBAc9DZ1RLA6Y0IamY9W4Kvv3amRBC7Imtfg9fi2IPak6fc/Ux2Juhm/t6ehWwPLRCr/718tQWEK8Diu8VJ28Iy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11230

From: Frank Li <Frank.Li@nxp.com>

Add lpuart4 node for imx8qm.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
index 974e193f8dcb9..caa2a7f89ab99 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
@@ -8,6 +8,22 @@
 /delete-node/ &adma_pwm_lpcg;
 
 &dma_subsys {
+	lpuart4: serial@5a0a0000 {
+		compatible = "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
+		reg = <0x5a0a0000 0x1000>;
+		interrupts = <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-parent = <&gic>;
+		clocks = <&uart4_lpcg IMX_LPCG_CLK_4>, <&uart4_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "ipg", "baud";
+		assigned-clocks = <&clk IMX_SC_R_UART_4 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <80000000>;
+		power-domains = <&pd IMX_SC_R_UART_4>;
+		power-domain-names = "uart";
+		dmas = <&edma2 20 0 FSL_EDMA_RX>, <&edma2 21 0 0>;
+		dma-names = "rx","tx";
+		status = "disabled";
+	};
+
 	uart4_lpcg: clock-controller@5a4a0000 {
 		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x5a4a0000 0x10000>;

-- 
2.43.0

