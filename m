Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012024.outbound.protection.outlook.com [52.101.66.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3646129B8EF
	for <imx@lists.linux.dev>; Wed,  3 Dec 2025 07:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764745619; cv=fail; b=WY5NArlDaDEim44Gn16YByy6hA+P4V+VOjWQ8jU8LGrACRScpAJDj2Xc8CGHyD+V7gZSGZeurswdOYw6k0VOKQlHKki0jYvdkzn+VCJI/dpfTgYrUN/xctPG/akcazHxN8UHmUiVxkDo5s1ClnDpgNsGFixmOU25eGx72tOI6uk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764745619; c=relaxed/simple;
	bh=6zQU37n40QzzLOOum0DRGlWmMU+rjbEAgW8BEOHtItM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a24x2RwVAlC4oUAG19C+8k7k+iobXV9W36pYTE6cyNxHayUdud+x/m8jCqKSIE2XVboFPAi8xOmWKjGeZSQb60OY44KuExShBHjV5PBN/kewVl0QCsjIbiIvqy+w3Qya4sbQ0Jc/1rmUIhJs3Y3K9KlvP2+x/eAumpGnpm/2nBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DjEwxos3; arc=fail smtp.client-ip=52.101.66.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DjEwxos3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCvrhxNujTjxiJckPSDq+Lo//AARsC4MhSFJgSAXKSlO91BXA6IGyWllb2hZtU1h+YfI8NdS+cSEbQyfcW/GZLA9+kDXRI1kI2z4h/vbfDrtINgAgAc3cnybYRho8hzPfxM1GiJCnajJVX0q1g3GF+5sdKxtOMIBb2rB4Tr84BYaKqkFiEttZR3ezxpIMc4dJo4jVqRHSM8qzrM1Ssxf+roUcfFZ0GHGjDxB6Qsy8OJoTi1wgvCa2tKlT38izS/n1+LWemzCxow0zB0jT4X0hKfkfoILvgvogIFCGNIvE799rtETEHcSAIZ8SxEIX1ed3yM+VCTMwSsIKcJNIX+tOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+TC3xd1318HUmnrlMVA1h79mt996Qw/0n0xWECUvkw=;
 b=R32+nlLaY9c9HB6KPAYHaCq3gM3bsuHEqG6ULLnj4vKixxDdhFgQx+hBgWfRf4z7MLhWOjqONC2v53GHRdLBtDOMroCMRmKy4hypZi0Dx34vFY02PZy6BaL/AWEcoTUMy9QNLYzavuX9HJIDMgLU2MrODYGZjPBCeniXb5y6VJOUSKfcVIC6CvPM99D4Ec9TKy9SsvZPNeKZCnIM6ZbKu4elnOpTf3XjYu+lLIkRB/GBEqFVCT+WI1D47zeSIKwHjXBe/UitLE1x41TpeIlMKtawCUPddjberjAXT5mFVVSKMJyVTmlAz+PEdd/v34mtxdH8YzTw7WoW7LBuH0raaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+TC3xd1318HUmnrlMVA1h79mt996Qw/0n0xWECUvkw=;
 b=DjEwxos3FP0E45XQb/jTWtS3kMcQcUVwPYg017n9xaoZcdhYE0mJ10oY4UAsJ0h5LDigUB/y3yUqgwhMyyCZONlkew2+Ap6zpc+VtT/GRuFpr5ao/iqUAZ9sEgXtBvZqh7OK7rv8ydbCOfOyCaQ/FvOAHExjq4E4IbeXYADNnAWvEn8vLkY8WpIPaDBczbDdc8ffPq43CRD4x47KyPRTPxer22X7Q/yD7rupPW3l9BvQfiSf8wlAJgeCZfoQeHs7CHnCEXs58zO/Xkw4E+5JCg+bKDqHkZpOM9xp9hgSqfcbZKxSS9nnRha4H2174TSLYaHAt1YOjUexBYdjWXjcuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by AS8PR04MB9174.eurprd04.prod.outlook.com (2603:10a6:20b:449::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 07:06:55 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%2]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 07:06:55 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: imx91-11x11-evk: Add PDM microphone sound card support
Date: Wed,  3 Dec 2025 16:06:04 +0900
Message-ID: <20251203070605.1868821-5-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251203070605.1868821-1-chancel.liu@nxp.com>
References: <20251203070605.1868821-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0156.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c1::16) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|AS8PR04MB9174:EE_
X-MS-Office365-Filtering-Correlation-Id: d5cbf69a-f930-40f9-c047-08de323a8ad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d+yGa8VXRVIa4hHe7RdpvfB6Vdz9QQrD2c6cRU883UnYmGv3x2XEChn2+VmW?=
 =?us-ascii?Q?vKDdwTWpbDv6vEnAPQjWWWDTsjCY82xau+wrmBuIgP1iW5qF5da0msF1mn4A?=
 =?us-ascii?Q?O5UXymbIsbqOt69fUwSJM5MvAfugamQJrvSsPJab81Rxia7KOv+26YQKc4EP?=
 =?us-ascii?Q?h5oHiajh1fs0ZjrYwVTCU3CUbt8J9sl74Bi7Y8u0cjBLyFqYAin0c2wRj02b?=
 =?us-ascii?Q?DW7PLnGLp0uL4pVsYtyPbAV7rTMkbjcx4udfsEE+eIRfU1fGkEQW4E8khewa?=
 =?us-ascii?Q?D57TOWroQGcL0GibMxDCKtmYtwve/0jinKvq72+Z+vF9JVIiBaf5JLZRCboT?=
 =?us-ascii?Q?ls6I2yiUSJqbVhu/PUL0xxAYt2FYC9y7i5zBjuE7WRrgaHrNekY9k5L2pbqG?=
 =?us-ascii?Q?7TLrz1tdFLUv39uvRXXYbHheMeuVQCcNlHgRvSwBo+IRzfU5gmWizmWdCufU?=
 =?us-ascii?Q?zaPoOEJaXz8Regs1WjSjx8f7rfMDwmlqeKIZAuSH3g0+OM9YpqLWNWTHWwEq?=
 =?us-ascii?Q?5z4HjxYdNcG4xWwPiNERaiMyPDQrQBO6FdBUmp+EwBIXm/WQZDqq76DWguHZ?=
 =?us-ascii?Q?6H9br0wsrRnoJFrFFrwFy2G4FMYU1qa60pH/4sm2GWk0TCPuwdAfBUn5tgSV?=
 =?us-ascii?Q?/KkWEi7vZtqtShCKpkAqAAK0IFVzhsCM7ZGID7DfXXnAgIELwgaLsMEcYlj2?=
 =?us-ascii?Q?3nIM04RcmpfhTAaChXzN5UglX8hVnaD8w3L8CGaHJAeRxOaDTx9MYJYKA+8S?=
 =?us-ascii?Q?GpJn/2+8ioZiJ5feicKFTlymV3KCIQJouuiaAVllTsBGx/Tlc6IcdWdrJ129?=
 =?us-ascii?Q?d3Zm4z4xWkqJFm9U2kDTGYx8zZtXLfxYItg3qJ0xVGidpBCFWjFCMotUs1Kn?=
 =?us-ascii?Q?LfLsBZRyjiOU5fvLFqOFy5Tz+fdn2U8g1YK8qXb8cFgzuw5irF8ewLgSdS/J?=
 =?us-ascii?Q?DPTzgPbAYnMy87/kJ+AGEjOn7ccA6zAtc9f8Ze7ZnvI8cpFXM66jyoQeK1Si?=
 =?us-ascii?Q?x+3TJcq/oNrG5rn2pLzLTjygkKuXEB0/7zJZklatIJ9MxAOQ3q07kvZF+R95?=
 =?us-ascii?Q?tfTFsjSFZ8i/hggMr7tfeB60QUO0AEgXOJQYtoJ9tcV0xrCeuKLukJ7VXm65?=
 =?us-ascii?Q?u8KyzcfAAjzzet751XUv0JDTLeJFI5ZjDrJJduTVLl2/QygjLrBUDl1sVTBH?=
 =?us-ascii?Q?G6JpW0bYusUr5LjMCcfa36U4Lt2PCKRVSeM5+yL/tGM8WKB2QXEO3jYEHtzR?=
 =?us-ascii?Q?PWEXIqPS8KjKqJGCawngfiGJOzem8jSAudUV0jGlzOFOVK3oprt5XZXt5baJ?=
 =?us-ascii?Q?r7Is8+CWBeR/I/c6Y2MHSWskf4N/IcbsLUIecyPwNvgwmbjnFnlRkmOSHcoc?=
 =?us-ascii?Q?9mIkrSCeWzNFWSKMMvUDo1NVEAeab64KG7ahpe+gqbDFafdbA57r3F5J+jIg?=
 =?us-ascii?Q?magEgRnnG5x2wDLBgqseHKGRvzGLY+FQL1/8BKjgASKucKiK9VCz+lrtEbWK?=
 =?us-ascii?Q?LR/hhARIptHPzlarMydG24vdFMEeXgYQmqIN+xL7WczGYv110ykLE/Izow?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bODMa6qtqyguqhPD3eJf0GK8ErzfI4ayluRgTX8D5+K7dBJdgg8L9/N7Spet?=
 =?us-ascii?Q?qZs8XuWUU7vyA3iegjjjNzlaXkzcDvceASmy3GrrF3UUWHU6uiIaEQsd6Ksj?=
 =?us-ascii?Q?2kgxaxR5t1oQZMyWdkbm1CZF/z197NuM0G/P0NF9oofwxyJ6n+OU1jmqlJs0?=
 =?us-ascii?Q?qQkqNtrBt0Fx/asoF0ZTpZwRtgNrFtQ3QhaczoHF3spruyDxwUQt+ZR0zDlc?=
 =?us-ascii?Q?eQBAxvL8DlTpi4pm9hkOq5boHTdSJ7kKZFSUar4zGnDmoqjBMaIEd6RKDx2O?=
 =?us-ascii?Q?UTpMh/YpBsC6Nn675yEIYzsN3Dgjf7bIvev7PZZnhSmGjy7Nr74GOzkg9rYL?=
 =?us-ascii?Q?bOyYboMRnpfZPyqtPxqvKsGNS/YMw9h32aafUwh/irt1EF8QpNzewmrs4t1c?=
 =?us-ascii?Q?l03iCPoaiVZ32OP+UMQC6RZdqh8cy0JKT7UL8wXT67ydbE3cAkw095vQoA/2?=
 =?us-ascii?Q?/qAy3LxOUSLRvUsMK180XWc/oxlnNNmsfHKVEKGt+JouZzLvhyw1gTF0+JOE?=
 =?us-ascii?Q?Xv+3YgxEn+NXn8KEWH7XLr1MlYgKdFqllbnkEdiwLylcuIbziFr1j0+9/o8o?=
 =?us-ascii?Q?iVVPahzHTvmDyMeYtLlUijguXt3WFEc7o+C2FhmbTgrseUliwGmuvRR52sEF?=
 =?us-ascii?Q?qh/w04jz27auB+bdZFuOQlq9lwoTfl4Qi1hYfEFn9Nv63af1X/bPJ7HNPYYu?=
 =?us-ascii?Q?D+Q+8SzBC9g+8/BZVTwPeGUJnss5zoKs05Ql5e9BhhAJUN9f7TkUEHTbjtD9?=
 =?us-ascii?Q?7XhAA2Yw6aYTC/kSekL5sAdxGC9PgPoWuBCAxbat8DKKehbYjGZ5WcBJVZwp?=
 =?us-ascii?Q?uljza8PTjKHPOB6fhzsZhUNqCcsvJj331BmXuCjMXd6L2CxxL8AdLD5xO9Vn?=
 =?us-ascii?Q?CF0nRq7hqKQ51sD0Zbq1/76NqZYcGb9rLfgtMRj7QFho6WCVBLMeA279FLZw?=
 =?us-ascii?Q?NHqLws42nG5WLha43o15SUfZddFCa3v6sg4CTCg0BmLDKoyc572e9WXmimIC?=
 =?us-ascii?Q?qdGmKCHEqziuzqSxZy2EyDN9vowdLDgD+DVK8xwfa6a0D+Njv9mEuClDxEAr?=
 =?us-ascii?Q?SBzFgpPU25deNmFxQbIKxdkco8vgG8G5yDkN/6Y3hkGo5T0sR6W3c0B6bQ8t?=
 =?us-ascii?Q?OO2VJTtIgbhH+9jJWC4Fb9hNl5NjmD/uREbI4xhxGVF6Ese3u6YG4bk3FoBt?=
 =?us-ascii?Q?RuYKdvr9cLVO66LeHSf+2my0lytuWUQ7z+UJ6ymCCRoUda5ujHGX2YSHspHv?=
 =?us-ascii?Q?B/hlukRH5CIBr39pQuUTDxhDU6jHIN8oFz9dJJQJ3qL1UsgTXSMlQ3t7q4N9?=
 =?us-ascii?Q?9YJyxtqx2RXyDIhADmY4wQrj6Ndilbc8n1pGeTa4JWsYLeIa30YPAJ7nKRzK?=
 =?us-ascii?Q?tNmTAcrOtn++n+1sUpcFVMEgjzezep1MeANsgcS1gTq/tyetrmimbsVVL/r+?=
 =?us-ascii?Q?Nn+sAiVsHiEwIE4JsxVIAkvEYy9hNG3DF/RcUhx2EgFDvZCiUlGKIWb6v0+W?=
 =?us-ascii?Q?zboK8VcdiKcCN0CL8zjiKdvY6n1z2k9yKR3LGZsFq3iC320dV6H52SYj+P1p?=
 =?us-ascii?Q?eg6/LTyfXwpvoXCzPT8u2gX9Q9c5r7XljOag/LrX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5cbf69a-f930-40f9-c047-08de323a8ad4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 07:06:55.2856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UYWTE8DGeURan6azcfpcHiCqm1DMb0zQMubLTl8jlESSEspM1zQAOcrmCb8kFWtzwWX6UeLb7Fc9A2zE/0HjLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9174

Add PDM micphone sound card support.

This sound card supports recording sound from PDM microphone
and convert the PDM format data to PCM data.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx91-11x11-evk.dts    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
index a70a9af50ab7..605b1d10513a 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
@@ -117,6 +117,20 @@ btcpu: simple-audio-card,cpu {
 			dai-tdm-slot-width = <16>;
 		};
 	};
+
+	sound-micfil {
+		compatible = "fsl,imx-audio-card";
+		model = "micfil-audio";
+
+		pri-dai-link {
+			link-name = "micfil hifi";
+			format = "i2s";
+
+			cpu {
+				sound-dai = <&micfil>;
+			};
+		};
+	};
 };
 
 &adc1 {
@@ -412,6 +426,16 @@ bluetooth {
 	};
 };
 
+&micfil {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_pdm>;
+	pinctrl-1 = <&pinctrl_pdm_sleep>;
+	assigned-clocks = <&clk IMX93_CLK_PDM>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
+	assigned-clock-rates = <49152000>;
+	status = "okay";
+};
+
 &sai1 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_sai1>;
@@ -590,6 +614,22 @@ MX91_PAD_I2C2_SDA__LPI2C2_SDA                           0x40000b9e
 		>;
 	};
 
+	pinctrl_pdm: pdmgrp {
+		fsl,pins = <
+			MX91_PAD_PDM_CLK__PDM_CLK			0x31e
+			MX91_PAD_PDM_BIT_STREAM0__PDM_BIT_STREAM0	0x31e
+			MX91_PAD_PDM_BIT_STREAM1__PDM_BIT_STREAM1	0x31e
+		>;
+	};
+
+	pinctrl_pdm_sleep: pdmsleepgrp {
+		fsl,pins = <
+			MX91_PAD_PDM_CLK__GPIO1_IO8			0x51e
+			MX91_PAD_PDM_BIT_STREAM0__GPIO1_IO9		0x51e
+			MX91_PAD_PDM_BIT_STREAM1__GPIO1_IO10		0x51e
+		>;
+	};
+
 	pinctrl_sai1: sai1grp {
 		fsl,pins = <
 			MX91_PAD_SAI1_TXC__SAI1_TX_BCLK			0x31e
-- 
2.50.1

