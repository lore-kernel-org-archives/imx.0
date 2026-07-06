Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013048.outbound.protection.outlook.com [52.101.83.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6FE480353
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 21:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783374754; cv=fail; b=e+3kEjrnGaphuY2GOJY2nLHapqJYehzpIllGZtfcvhuHEhYb+1U+MDv6Y7yu5ORogfpld8G7675E7OygOPT6HHUMNn3UsfjzpybvqtuLb3c/AIb/zUpWTjIw+NsvH/RXVv4jpD9lUT+/YILndZs+pFsq3pCeRTagHqJB52KOMRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783374754; c=relaxed/simple;
	bh=ucFpd1saaMxv2mv7KcVuFgC/CVOPsHWd0FeVuRI1fkU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=XB+EwCF25GwVWWJAS4WXM7vei26U7DmWPNRtekiI2d4r8t8uOKCEiBal+RvlvaCAd7BdIOkjk8WnX+tQJqcTIH3S1LGsv+ZxJviy2mUbaapAPWd3oOoYAYgimMG3Zisa+mFv+POt7cE21BWb+DxweV1b3SL8IR/1sY3in84WDV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oaoNp1oJ; arc=fail smtp.client-ip=52.101.83.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oaoNp1oJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yr2Ng27ZpL/MxdC0CFBCkFEFch5LF0YOpauh2tdmVFPfu3s5MKS4lrw2tZgoYQaLpXzTQJJTBDlk/tjV8+KFXEcDSC4BKO0ueow6b1o7ttasdiOQWsIFzcIYYWJ68xQtAvEV+8fcHttsl7PqvmQ1dyY488/BkiThF/LR52N+o7mG9IsFBZ2l9887xnzjgHjWzD3DuXhchP3nJhLQAjPv39AQxyn1ms49mA4c8VSAjJTWBOLgUuxS2kr/dSotzoZZFGSbCIuy+7Kes+jqURfHDBTjjsWMxZ8jo4FB+Xq08qhbedNOtiMKtOsN0GNUM0g7tMcdFaOq6U9TFkFb38oTEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBsHNJB7vvD+TY12VYHy3g38nRBAzw3SLwievGPUqck=;
 b=FzQwm0n4lqWAVh/2h8lsnX18BZnnRhsiJabr1d3+YG89T8rSG2R6ZKM8+bPuDkXKua7bAmW7ksA5nL0rPdUTC3tKy8q9n+InqKgY/HybxaPF+LcJmp1Qd1WZ71GU99s9D1XdBgPsGbBK0sqQaRBrJsPCdwvU1LmbNqUhGhFoh+J/R13Bs+oZVIqSbif2PfbvfcMnsMXw+SuYt6N3aT7glPgeMHBVaCITd9FQRn8wSwPkokNLHBu3itxYJZPCL4bRn+kVSbGAdBRwYPsrlHvV+WU2WmuYMXABhxjVTb5JuXJam0x7COY8gOOaxetxy3xbWzHpT2VEJnWwQcPXae9TPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBsHNJB7vvD+TY12VYHy3g38nRBAzw3SLwievGPUqck=;
 b=oaoNp1oJpJJKP+W07xuKf/HPLZqChw8IDRUQ1UEB0zZChHYp9P5PRGiLHNyRqr8wekWQ1gUYQSX1Eu90LcUENtuBWnY61x+/TIWfSFSFDuWik5lu9jz/1c8zzhdQ4nDP6G5yL23u1UAuF9uJ9W1twKIsQfUHh4b18vygK39cOQ0JYXpg6ReWbesUB9mb/CC0TNmZJ/gdeOKg9crftW8mJSRYto+cSxGmGXhq8UeyGDeECY5sFY4E4dmkCPAugBkZHnfSXE2C2Jl61szBepjtRVI8oLUwXFkGJHJDx3++flLhfx1f/x+vnOioFY6kJUXK4p8wBYLFot3A26QpLodkcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU6PR04MB11230.eurprd04.prod.outlook.com (2603:10a6:10:5c1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Mon, 6 Jul
 2026 21:52:30 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 6 Jul 2026
 21:52:29 +0000
From: Frank.Li@oss.nxp.com
Date: Mon, 06 Jul 2026 17:52:09 -0400
Subject: [PATCH 2/4] arm64: dts: imx8qm-ss-audio: add spdif1 node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qm_dts-v1-2-14117a48fbdb@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783374735; l=2118;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=iy1xDV2jqeKN4o4GLlBWuLlxZkQzfZFJNL/GRgaQT38=;
 b=9zNQOfrqmw6HFGpTOeJNrcpmZ2XJgsdzEMcboWHzRaRyItF4vznr2fZ5MkU/j7T2ROYt1ojH4
 Gjwh3XeM9oxBLBnJJ/9I/85+kluV44N0N9GT+V4ut84rv0QpNdyGN8X
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA9PR13CA0031.namprd13.prod.outlook.com
 (2603:10b6:806:22::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU6PR04MB11230:EE_
X-MS-Office365-Filtering-Correlation-Id: e9331407-777a-4b9b-f32c-08dedba8e034
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|23010399003|1800799024|366016|56012099006|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	E6DRJLl/QM6l1kMsMyAfapPSiwQakv7+6ylyPeuvvSffVL0KlcP4dFa8/RsNRT0k1GxUDxQKS5BlTOM78bOogajE2b3JU/G9Q2NJgN7PfawS3hnQPhxNp826Tk7uf6x/42EVw0o/YwlHhr6mhnUiuwaEbDvFqNSEkpBtlT9RQM9qEcTzkJA+EbImcBaURNjgIoOck0hoHb3EwsFJ76kcAOJD4aX4zEWFi72KfDp54E2GNVCEJVtyBJKibJDBDIt3fUOrhc7V1gY3x7hY+nWllFAuYLhjYbLQ0U/hjox4915/Y/Nux/j/5xKE5khrv4rc9pxbUVH8EV9P8vPGFC9doAIiDb/ZT/0KuhRbhkJFSL2yEsbOkdwCkH5eV2P2XK8lHpfRhWJEfD+ZIz3ooeclHPR9GcEndTdFweKjZpc+u6On7CGeMW72EHXc4HFwKBjbZEwaTsWN6H2ayZbnURHI22v360SdrR/SwHcogBpbKQEsDSbzrQsjwvEWMjejT/HWbcqgBagXZcKWtIWsmzmIM8j4yy6FW5wBhyOrTva/78wLwugzEvmy1hx2V+1yLrpMaOSJuH2IBaDwgK34mF6DWKwqne8qZyOtl1QvwV+AxYt8a7SLfS593usWQHG+qMPnjhsiP4Jc7PmW343433vWq7IQWaDRphqRUDSyD2M8JZI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGtVSU5EanNTTWtvb3U4S1hSRjFVMFovcmlQcDFMNFgwMTFPRUY4YVkvMHlB?=
 =?utf-8?B?YWZsQkJlYWpkT3FTOG0vZnpmajhEaVFhNjRaSWFhdklMZTNrSzVkVTZPNlJm?=
 =?utf-8?B?dXhHQmVoZjRlK01mR29CUEN5NzhHQkdhY3ZNb3ZocVUzY1pJME1vaHdqdzgv?=
 =?utf-8?B?WHlxQ1ZhTjltTUdXVzJVYjRCSDZyUVNhWFNoRTRDTFc1TFY0bzZoK0pYbDQv?=
 =?utf-8?B?cEV4S3FuWTloaENUNDZsOS9VOGZ2d2RxOG9DTHYrMVBPNHBZUy9pYWhLckt3?=
 =?utf-8?B?VEdjaVBZQyttNGoxa2c1ZkVtY0kxcStsWTVSYXZYRWh6RXNtalZlQy9va0dk?=
 =?utf-8?B?NzAzYWpMZlY2ZjFVaG55dWM0cDhDcm96T2FlaGZuU1ZieTROSWVNRk9wNTFD?=
 =?utf-8?B?eXlxc1RqcUtydUJ5dEFiVEFiUTlBVE52TkxlUVVlaWVyOUdwb0xzajJnNThE?=
 =?utf-8?B?bCtEbHY1NFIwZklLbEpaUmxLRnhPU2FnbVFTUjdxemFIbkI2b0JRSFRkWDNm?=
 =?utf-8?B?NEJzMWNUVzU3NUs3S290blB6NG1lc1lZTFJGWmlSUjN3MXBGd2VRUTFvQkVY?=
 =?utf-8?B?S0RTSUVPTXpZSkdlNG5rRmxBMnI4UE9iZXhxcWFqR3Q2Q2VBbnNXeFU4UnBa?=
 =?utf-8?B?WWsvcllhbERreFJDbU1YTllycGJKbkJkV0l4WFJJUThXdEh5UWRuZU9jTnVJ?=
 =?utf-8?B?a3N5MWpWU3VWTTVzbVpKTXlFaUdKUmtNdnlCTEI1UjVHOG51UU84dWxMVHlh?=
 =?utf-8?B?d2UwOXJSZlcwelVXRUZCRGR4bWYxUzdPeGtYNnoxbTFOeTEyK3hwUEJSbWJ5?=
 =?utf-8?B?WGUzNXg4K3dpSk1Bb1JsbnJ3R0RJaEo5TzFmck9ma0dpeEZ3akpkU1Z2VERU?=
 =?utf-8?B?SHZJL0grMFN1S01WSy9KckpTVHZIVFpzSldkaHBuWmVQc3dFS0gxYmg4Q3Ri?=
 =?utf-8?B?TmhzcDZiblQyMUM0dW1uMXlENHlWaGdjcmJUR2FzWHM0WTBuVW9hQzV1bEt4?=
 =?utf-8?B?bGY4VzM5NFVNcUVpQThuSFIrb2wvTzF5anY5RnJxR0VJSzd3QnR1MEN4Uk5m?=
 =?utf-8?B?cWY1RFZGUUp6eGE0NzVTWjFxT2lnaXFYemJObkVuZnVacExxa1EvK0NOOTd0?=
 =?utf-8?B?SFczU0daMFNzbGdkb09McldCam5PSFpRYmJ3NmNaaDNsdlpSRVZkZzFCb3hm?=
 =?utf-8?B?Slh1c28rdy8rY0hUazJHODBqZStjRDVBUEF2NnI4Uk1pZVNNaDdjanN6Ulg1?=
 =?utf-8?B?SjlwWXAwVk13c0FwTFFLVktHa1lSRzhJcEsydjVsL0s1K0hBN0R2WHh0R01k?=
 =?utf-8?B?UG5ORlFnclFjZWhQejZ2Y0E1WEhNelpFamlwTUVUeG5wTldNS21lVXNWWHJR?=
 =?utf-8?B?OWRWVDdRRDVFcUtMaldWYWtDMFNpbFYzbXRjMnJsUjRXZlpaN0lmUVYyWit1?=
 =?utf-8?B?QUk4MVNtQ3M3MTRuS1ZGS0luaWhpeVJuS3RYVE5PcmJOR3QvWmZZZlJEOWtl?=
 =?utf-8?B?bVZBMlc5WmFRNlFuL0E5VHpYeUV2R21zUi9FZlU4eGFDM01VQXJuNHAvM25s?=
 =?utf-8?B?Zjc5U2FzWEJKakR2K0hBd0FtZ013UVlvSUhtUGpSRFBoeE5FZUJNRi9jMyts?=
 =?utf-8?B?SE5aTHRySkhlcXNFNzRqK0JwTlZJV3MzU1Y4TzJVY29lMzJVNnVWN0RrdmN4?=
 =?utf-8?B?OVpxaWpTTDY2NnM3Q3ltTk12N2tzMEJkMGtubm12bkJHUm1oUHViWXBxYktJ?=
 =?utf-8?B?Q0c2aTc0ei8zdVVMZXFZMzV5clY2a1ZQaWo4elBUMUIvMXRnMFpyajV4VGND?=
 =?utf-8?B?ZENjV29SZ2NPdXZiMXBOSk1hSDY5eDhnM2xCS09XV3ljRi8rSFc5bjFaZFVL?=
 =?utf-8?B?V2pBTXRBSGMzeHlPYVFrcEV4MEYwWGpmeU9UVEdFZGpHZkJtTkpmV0RROXlX?=
 =?utf-8?B?SStaUTRYaFlieXFnUWpxV0JpSFlYS2RLcVpNTGxqYUZmNng3VlZSeXkvdmtt?=
 =?utf-8?B?UHY4K2N2aXZEaDU2V3MvVTI5eHJhVlpRY2wrOTNLbXBYTnkvYy9WaTgzbU9r?=
 =?utf-8?B?aUNUNGZhY29sQ01YYUFWWTA3LzJ2Y3l6SHVuLzN0akc3R1M0a29JZlo0SHMx?=
 =?utf-8?B?amg5NS9rRXZjZVpCcE03RXFMTHJxREdkYUphS1NvYXl0WlFjUFdmM2lpUHdI?=
 =?utf-8?B?dTZJNUlrak9MaWxCRnRveXNjRDJ2QkhSNHlnUzJvMkNLQUpqY1cyeVdMZTIz?=
 =?utf-8?B?c3JZb21NUk9VNlg1c1hnZ0lvelBVcXRraVNORzlSeFdGV250VFF6aENQOUlY?=
 =?utf-8?B?TW9NbEQyZjI3MFRpVEF6djdnamtxcGgxaFVrTjhObkFFOTZyREJ5RjNOdzNG?=
 =?utf-8?Q?TmFUFdJSSY7nITnRY5Ag6MD4YcuncFYsWVNB/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9331407-777a-4b9b-f32c-08dedba8e034
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 21:52:29.7522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rRhUg/Nxco1mUfkW/GbRDFvScfSaEDxCQh0ikfqu/1UsL5MnBV5/WLO8ar5yvjrZf786jNYlBnTDXNxXhChMmxNVB8N2+Zh+pl44vdX+IkN0RWyVpWXnpxWTAWUeOu60
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11230

From: Frank Li <Frank.Li@nxp.com>

Add spdif1 and related lpcg node for imx8qm.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi
index 7c5386d4ab2b7..5cb644837d936 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi
@@ -74,6 +74,31 @@ &asrc1_lpcg {
 };
 
 &audio_subsys {
+	spdif1: spdif@59030000 {
+		compatible = "fsl,imx8qm-spdif";
+		reg = <0x59030000 0x10000>;
+		interrupts =  <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>, /* rx */
+			      <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>; /* tx */
+		clocks = <&spdif1_lpcg IMX_LPCG_CLK_4>, /* core */
+			 <&clk_dummy>, /* rxtx0 */
+			 <&spdif1_lpcg IMX_LPCG_CLK_5>, /* rxtx1 */
+			 <&clk_dummy>, /* rxtx2 */
+			 <&clk_dummy>, /* rxtx3 */
+			 <&clk_dummy>, /* rxtx4 */
+			 <&audio_ipg_clk>, /* rxtx5 */
+			 <&clk_dummy>, /* rxtx6 */
+			 <&clk_dummy>, /* rxtx7 */
+			 <&clk_dummy>; /* spba */
+		clock-names = "core", "rxtx0",
+			      "rxtx1", "rxtx2",
+			      "rxtx3", "rxtx4",
+			      "rxtx5", "rxtx6",
+			      "rxtx7", "spba";
+		dmas = <&edma0 10 0 5>, <&edma0 11 0 4>;
+		dma-names = "rx", "tx";
+		power-domains = <&pd IMX_SC_R_SPDIF_1>;
+		status = "disabled";
+	};
 
 	sai4: sai@59080000 {
 		compatible = "fsl,imx8qm-sai";
@@ -109,6 +134,19 @@ sai5: sai@59090000 {
 		status = "disabled";
 	};
 
+	spdif1_lpcg: clock-controller@59430000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x59430000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&acm IMX_ADMA_ACM_SPDIF1_TX_CLK_SEL>,
+			 <&audio_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_5>, <IMX_LPCG_CLK_4>;
+		clock-output-names = "spdif1_lpcg_tx_clk",
+				     "spdif1_lpcg_gclkw";
+		power-domains = <&pd IMX_SC_R_SPDIF_1>;
+		status = "disabled";
+	};
+
 	sai4_lpcg: clock-controller@59480000 {
 		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x59480000 0x10000>;

-- 
2.43.0

