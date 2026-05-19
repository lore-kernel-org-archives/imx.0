Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013009.outbound.protection.outlook.com [40.107.162.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D05496911
	for <imx@lists.linux.dev>; Tue, 19 May 2026 11:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189249; cv=fail; b=aTEKzXibPsQRQBQRVqSg0NCn5Eq0HPCiGYfta6JZr6G/X7C2gmNKy1XzRiwv5+7P/j6gUgqF1zaUkoIAD23zgOhOTK88+33AQ3At3u36H/vE4pCgXI4EUVF9x/7TH5xhQYCrdFbrfLqLGzkAmbVm+xx1smlHkPsvdPyrEV+B9KY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189249; c=relaxed/simple;
	bh=wc2Y4+E4VCW9j1xmbWiecvMYlbfmXNgvW4lprFIpUao=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sAxFe/087sj1gLUynREdD6SXwV6W7HZgW98P87OzM7/9KtjZG3C+gfCzvIcwh8P53ss0jw8fosYFoJLErke0o/Wx3ntYg854CGaUZdQKX/JdgoMJYldjgj6ClhBcz5r9LnIkuQ+2baZibqJgpUMnlR52ZET8almSZ4dKDDpvUB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FZpgKTdT; arc=fail smtp.client-ip=40.107.162.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FZpgKTdT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LNZYS/x2cqWPzkmCOH4ucUwFBJVdAiqWcty8vB+TiX0T2N7BWaFr7DVgX9CyVqFDAyA0uyQF/qKC+rBV+Ws0mZARm0IPLMpU8ZaIP7jib5tvNEBatvtH1HbY1CpPSxNeBWzWMYWKczvYtNeTnJ7raaW9sLMmBsGmWoahh9VtSAhMlp/xGXh5/IXK1c8xgtyUWIz/ohUQ4/0CdOaVC5CBU++xggc0761//lTl3Dz3S4PewoqO1/uZaW226NcERu2xFD2txYhohJgpXfrj/6FBaJbreWTW8sVMVCKoIQPV4vsqoXl5G6VQ0L2qB17POe7PYT8nbcx/JTM7Rp6SpjttAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nq//WJqxGJNrWFj3ljwMVWF6t5xHzVqdcyrZxVNORiQ=;
 b=Jd89EvX6h2ojVT9SC617yWuK62izPvl9l5Sdt0EtyshNsBlp0O2zysRwFOykw5J5ZfBMKkvbfGcNF01JbaqGt2z1C3BazLovKXUGUXwQ2fqNBs/EI4zG5QuCRjlc6VKYjK5O7RdEvDGdBeAm2XrMecvMthki6TUXBevm/oxjDPOHnwpLRu/KYBubQuZs7H/welIV1Du9fvwjtbo4hgsH4C7K0E+16Lct90XTHI9aJqrgtrclwP+/HuE2FejNy3CGP99M9/bzBI8Bi1CPpnKAIi0X1JTx1sNBuiH69uix04Mpz/s3SCMUvwjCv1MzPlmOpuSSLbQO53B+wymUgBkPFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nq//WJqxGJNrWFj3ljwMVWF6t5xHzVqdcyrZxVNORiQ=;
 b=FZpgKTdTA36aKwWqJqDTFm3m9c21bhrQQ/ZYekxuqitc2JprjVQ8givHNWsYcA+RA/wKnBJnLKqKY67Ye1V3NwRAkG+sRTJafBlNPRkYh37mjHS6FkgckNX25oFgZ8FtKa1FW+5aOxmqzQi0w9wxVQ+qchLMDcSkDCxoj3eX2ajYz3uh1VdcJrNNOsgBKDO/OwEc1pzhALBQwt+/Kc+BRIgOkxIn1yF4Rp1nq591KNopXEaGNhXh35gFLE/a/2eM98eyGifg6tqxI5Y96NbShhg9suMFW2A3us1u1GoKq8mziE8IurZuBcsW3L49/r2sSnErImTHcs8+o31naRgGZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5765.eurprd04.prod.outlook.com (2603:10a6:20b:ae::26)
 by DB9PR04MB10009.eurprd04.prod.outlook.com (2603:10a6:10:4ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 11:14:03 +0000
Received: from AM6PR04MB5765.eurprd04.prod.outlook.com
 ([fe80::bc76:f507:9b83:9d69]) by AM6PR04MB5765.eurprd04.prod.outlook.com
 ([fe80::bc76:f507:9b83:9d69%5]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 11:14:03 +0000
From: Joy Zou <joy.zou@nxp.com>
Date: Tue, 19 May 2026 19:15:18 +0800
Subject: [PATCH 4/5] arm64: dts: imx91-11x11-evk: add reset gpios for
 ethernet PHYs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-b4-imx91-qsb-opt-v1-4-9b416d2dc224@nxp.com>
References: <20260519-b4-imx91-qsb-opt-v1-0-9b416d2dc224@nxp.com>
In-Reply-To: <20260519-b4-imx91-qsb-opt-v1-0-9b416d2dc224@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA5P287CA0352.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::16) To AM6PR04MB5765.eurprd04.prod.outlook.com
 (2603:10a6:20b:ae::26)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5765:EE_|DB9PR04MB10009:EE_
X-MS-Office365-Filtering-Correlation-Id: 64c7bc6e-7bcf-49fe-a1fe-08deb597bc07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|7416014|52116014|1800799024|22082099003|18002099003|56012099003|11063799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	lTG4A6UtgLAUI2wOVlegaUSnETEpMBsyeA9MfaAzJJmur5cW2/Ar16kRa0c99kc2pt5lIQauNe0BQJV66CwFcwJeTbqW4fGPKCjwBCwLQx6gxyFB0tWRkXkpo/YyZSiuGi4k7BNKui4AdUcZZxnG0XTORpZGtoQfkJKWMCtkLkmGg+2Q/0S0CrvoVNnrUDzHuzJbM4pa09q2l7rLGb6FuX5QKSgUmZYPx5gD5BjwObvgrtF4amVHorv7YktI8SuedLA35uDPguBCs9dz+oI8hQsDaJnHoziq1Xmss2qEN/0rw5y2BCjZOlkEE+PtEkQaMIMTIHpBbFxmtuiVrJTggwWt3ehmM89hrKU0o9OHz67BToTHLQbD0B3mG19vDmk7GtscHI4+uM3iTMDw/N4PFqSuqikaZvgxe7NfHIIktsZhQBOD9dPN1+Ja1Gu0eglXfs1qS3qH2XnXXxHVtg66862+Pk+onJgTnR9uCq18A8wZhXYEmz5w1YOL41GOULFOC2pzHduVy+2LLchba3FSPK73C7vWpkbbRtoqqwp1mxYTKsE0fKuUdFg1SufVQ/sGEBFRNi18cDkQnxaWkrSOAaAW7lcq0YD6jF2Tae/H3btfCodCvzQw3kjZCXfQsr6xP4mJdAazBsujpfE06K3XiqCfObFwHoIETVtZqBZkgQzipGwbyCn/w+bd6cQYlb44cENHuEXxTbk0+Enlxrfy0n/Vec3n0nXUITS205uBGRVvk4Bcl3EvLiOt6Pv/W1j3Y8WbED+shJ37sQN2LuwVYQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5765.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(52116014)(1800799024)(22082099003)(18002099003)(56012099003)(11063799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1NJakdFUGRxSWYyZmVsUTNDdGxBUWpIOE9uZXdsTGNFVk5lU1BhSzM0UUND?=
 =?utf-8?B?Uzg2Z0haTzVYNTFnWDRZeEp4ZnNJS2cxMFY4QXRKWFY0cmxiVTNHdHN0aUJH?=
 =?utf-8?B?T0M3bXJ2YTUvdVBXei8rRUFScy9iRWxNZkV4cFJTN1JLREoyUGliVXEwOGo1?=
 =?utf-8?B?YXkyWnAwUHArTlM5NjhtS1Q4U1BVTFJCcVRVRGlja2xsU0RYNDU3OFkvUTJC?=
 =?utf-8?B?M1c2b1lzcHFMOHdEVGhvTW5PdTlNTGlGMzF5MzllZXVOSmk1bHMwQWdSdkZu?=
 =?utf-8?B?b1JBNmdyU3ByNFZVdlpHcWg4ZDBhdEgyS0tUL3NXQzNTK3dLM1Y3N3A3ZDc5?=
 =?utf-8?B?Ky96d3RaaWZMVHJhQkFQQWpINklFOE11MVBpZU9vT3UzK0FNdjNKaU9Vd29w?=
 =?utf-8?B?UG9aNjAyZlo1K05UcFBMNzBBVlZKS205c09KblZncWF6RHFNUmxlKzFtV0Yx?=
 =?utf-8?B?NnJjZ3hRMHVYNVdLdjZUM0VER3R1ZnhQcHZnYTd6WTVjUWo3dHdzYTBDc2Zj?=
 =?utf-8?B?VlNnbFNGYjVvcUN0aDBWL0FIZ3EvdUVJOXZxMy9KR2h6VVgyT2VCckU3aGdj?=
 =?utf-8?B?NWczN3pxOHBQMHZvMTl5dkRVa2V6ZmxadU1UZGpRSmpLVllyRk5zMkhGMG1P?=
 =?utf-8?B?ZUpWbHB1S0ZkRFRpeHZsaFhjSWlOU3NaalB6T3pncThCb290QzZxTUZEQTkx?=
 =?utf-8?B?ZCtLSWdZV2dlbC9rQ2xPb1d1eDl5eHkvZ1kvbDJ1M3haT2Q5ZkxwWTBmaVRG?=
 =?utf-8?B?WFUySzR6d29HdEREblV4djd3V2pHOCtEOHp4THVQYWxjWkJNV1RRR00ybnVQ?=
 =?utf-8?B?UHBTeXY2OWhEdEpqVlZvejFjSmdrVXp6VXFMZGRuNGRvNGhaeXM4QjYySWxS?=
 =?utf-8?B?Ukx2U3hZaEw3dlBZM3pqdm5hMGkzUWxXK1pHRi80NlFyY1huOGNuQmQxTzVi?=
 =?utf-8?B?QkFnekJXZjM2Q3U4OWRzZzQ4aHNZRFNEb1ZXRUtnWkF3R2pQbEpRTGlWYUJF?=
 =?utf-8?B?dFZOcXlaU2JMYklaazR4VkpQRkJ1ZHYwbEd2VmREM0wxV0MvejdEU3lzaFg4?=
 =?utf-8?B?dkZncDlBc3RMWGo3S1ljbUNHRDFvRS9sR2tyT21jMGxWUWdtam1CWDdtcjZF?=
 =?utf-8?B?OUdQcG5seDFtTmJSa1FEeWlpT0pna1ZqbjA5M3NPbXRtSXI4d0FyOUVYempE?=
 =?utf-8?B?ZnNhNDk0cks3akNKZGhqUjF4NTB6OVFBS2l0aHJqanJlMDV1SWNJR054ZXlB?=
 =?utf-8?B?RXNsa0FEUTI3MFl5akxBYWxxbTZhT2hhQlNwemJVa2Y5dWRqV2tWVG45djVC?=
 =?utf-8?B?NkRudG1WenQ1RzlJVU85amhiMndmTjczaXNidjk1K3ZubWhtZW1wTzRmMm5y?=
 =?utf-8?B?V29YcHFrT3V1aWtsUkxSTDhyUkpVejFlc2RIKzBUZG8rNEg4eXB2RXhHWlh3?=
 =?utf-8?B?MFRBOU5mZmV1V2czUW0rOWtIa045dHdabmRkSE5SLzE0eGE5MWNWUWR6VUVM?=
 =?utf-8?B?RkdBODNMYnZlQnRmaUxSRHBxc3haZmVRVVR5clRPYjJBei9BekpHZkxKK25E?=
 =?utf-8?B?bXZ5VFpKTFFCWWd4S2RTQytHdDlMa01IRWwySTgxeEt4bncrcEVab0VFZ2ZG?=
 =?utf-8?B?RTYydlFqcXkwdTU4aUtyVzJWRFl6Ynltc2xvZmdyazFFTVlTSWFOLzVjY0FB?=
 =?utf-8?B?MzRGd0NxekpQNytMdWdRbERFZm1KanpiMFNZZ2NkZ01aNjVqMDNENzF2MWxS?=
 =?utf-8?B?TzhEUkFSZ1VJbGZGSmxjYzhLL3AweWxrZFhDbGVSZDUwd0l5Umh2NFBJUzJl?=
 =?utf-8?B?aFIxeWpqOVdKOE9LeWNzaVE3UFhmelJJMVdaN09SRm1ycStUU1ZZS21UcG9h?=
 =?utf-8?B?MEp3dkE3RmRkdWZUdE1Ud0E0OURzM3pSRFVnRGU2c1ZTL0VtcWZEL2dVcW1F?=
 =?utf-8?B?bkhjMW00WXRQU1luQTRtZUt1UU5XNWxjMlBNWnZ1cTI1QzlQZVVvUWhOL0xy?=
 =?utf-8?B?aFlXYXlTclNaNVlLbkc0WlFZL3JvTEs1ejE1SjA4a2RTbUVSd2F1S0xrRGdl?=
 =?utf-8?B?L05YV3puZVQ5VUxkTUdDaFk3WW93MUtQRXBOY3NxaDVKdmJqUUlhWXhibjMw?=
 =?utf-8?B?ZytmSG5mYUJaUllXQ2hRM1l5aTNIK0IxTUtwaW54SUQ4YXlGdm5jWjF5cGRT?=
 =?utf-8?B?Zmh3bm05NmxRNWJSV1ZCNk5nRWRrUGFmZVFFZnFNNnhMMzlkQkE3RFhrbWll?=
 =?utf-8?B?NzFKUGZtdDlrc0Z6N2tRdzlRV3BqZGlCWmNMZkdVTElPZm5FenZBblk4Q0ZN?=
 =?utf-8?Q?rSuEKOPGldoItj0qw+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c7bc6e-7bcf-49fe-a1fe-08deb597bc07
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5765.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 11:14:03.3565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kBlk7fEiUECDjwx3up4DzyoJAE7NZZJnL6dJp3K7yITECdQ6iVSvOdYMN88eI5tt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10009

Both the PHYs of the EQOS interface and the FEC interface are supported
to be reset by I2C GPIO expander. So add the support to reset PHYs.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
index 3fbdcb87a2f3acf44c15b98d7b6ee212fb62699f..5716febb5a50f67b7b57a3cc856410857325c206 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
@@ -198,6 +198,9 @@ mdio {
 
 		ethphy1: ethernet-phy@1 {
 			reg = <1>;
+			reset-gpios = <&pcal6524 15 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <80000>;
 			realtek,clkout-disable;
 		};
 	};
@@ -219,6 +222,9 @@ mdio {
 
 		ethphy2: ethernet-phy@2 {
 			reg = <2>;
+			reset-gpios = <&pcal6524 16 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <80000>;
 			realtek,clkout-disable;
 		};
 	};

-- 
2.37.1

