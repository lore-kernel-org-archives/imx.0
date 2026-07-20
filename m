Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011046.outbound.protection.outlook.com [52.101.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13783D45F4
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 21:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784581866; cv=fail; b=Z7sz0tNkGhX8TfWF29enwYiEyqaL6hmy5C8u8t/33Hifd4VfQ+otF+l/ABr7OOOBODXNGrN/Tap18klQvS6hrffSKmrgtoe0675SBnxF8UQtkmLd0mg3dy3J2LGjL0dszrQOilxkAjYt93zclpclHzawWfqealxAKDV5iC9xqxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784581866; c=relaxed/simple;
	bh=Db5CrgD6iu85UzJFfHJHQqRc8uUHRDhHw6cPIOcD2wA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=aFWp/GnWasgb+L4jr+wjKvhfG3W0Edw06I+KHg9BjeaiHEFXoc9ffY8LdFe26E14cLoGAKLz+/2u29jqk9VX5WQQqbUHyNmKgwc7mUssGt0nJH+YzaCfFQpoN+1mJpZz58St3ujs8kRzlrZtScxDIyR6A2p0IHxh3Yr2G9DtJ5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=f7wYk+Fw; arc=fail smtp.client-ip=52.101.65.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="f7wYk+Fw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fSWXe0E6WiOGSsULG7Xg95AUlvw3D9NewpToy+LIEnxR1ctCmJKYJgx9LEBukwwgs+/jb9ufS415Hs8PbWBBW62CB+ZZHSJPlbyBQqTrP3w2FyXbsuIPPcTDbd7taIBQKs7VRCHyWzPm2AYoGfKHlwr+cBiPrXUMkiEuXFSVWc3VGJ2lhSVh1405HvXbxamUrzwhGqLawD6fPCJrxa+cDiCaTxPYhtRIzyy5lGB0d5Ry1WG1s48x8/8aD+ViGmApDlmupcO70TeTGA+Zm8A2n1J1iwxe6SJChfqNj2W62/sMLIH4CDllygZH02MQbTWUIB3tyahnGD/5WjmxD8siGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2EUGNrkKYm+K8a+TF4r4D03N2sqXpCgSC1hnZNd6iQ=;
 b=tlwk9/kVKy0bNESyWtuPAdqQ1OqoxkD+vJWoiS2lPicaCIsqnN6TBPjEHbmVPJcpQC4UhO14lEUqM0Bdew3DjZUvq596DB0CjT0UcspXIUKCRXGZMC0RlVuy9Z9cEjYhAuWNM0PX87jpwGXB9jKrx5A9hkQ6imB0ZUBUsJIT22930Pe1i1ZFgOy+mTgAwmZ+nmUqohsowp+YJT3WTLQDfGhjdlVpc6yfJAFZ7FLVXvQn0RTgfYKd3B2yllv+HPxCOhHlqOEbjPeqb3rSYizgc7YfzRdMzsE1cZ1gv7n9KQS9YYd6MyLw8bWph+AQqFpB66H/dnRJR7XWOhrliujpkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2EUGNrkKYm+K8a+TF4r4D03N2sqXpCgSC1hnZNd6iQ=;
 b=f7wYk+FwcskmQOVom8/Hz/FQ9uqUmEh9kqZv7rQXjKTEJCEJTyUR+VemPVfENZPKNLKOXHW86n19tmjk08U+rVeeM11DWi+A0RLAqbMqP5yt2b/29lCPNqFaHEXQu1AUu9N2JFpNjbwtE88iHA25snUx51byup+Y+4weRpPgwNOSK73Nd9tCUMRXkV+UFvNIcVIlL3k91pEG+pgj7DF4tA3aWHhwk7ttL7KQcCKhIVXzX5amJJc2BgT1d6c7Kmi6dRYuseHvaS6rFhanD3QLt/Zac+3UUfsoPFvXZq6VlhgAJHHXqp6Oblcd6NEUImTjOqxwAjEMtgpofjA0JIUTIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10565.eurprd04.prod.outlook.com (2603:10a6:800:25b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 21:11:00 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 21:11:00 +0000
From: Frank.Li@oss.nxp.com
Date: Mon, 20 Jul 2026 17:10:34 -0400
Subject: [PATCH 2/2] arm64: dts: imx8qm-ss-conn: Add HSIC usb@5b0e0000 node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-qm_smmu-v1-2-3689fbd8b516@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784581845; l=1587;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=UVtXKTUHJ10huHpvVpeCMYjH931DOa5jlWFBcxrN/Gs=;
 b=lLw9oZO31L9P+S4YRNyyIClfHX/rDP54EAwFruBBJCaaQG8uSiT0mhKX8qZGfxoJwACYZtKEP
 zds/M/9DOpYBQ44Qf46/0EKAYjdwDurzYBVzWeGg5jbw3X5P1a/h6jB
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA9PR13CA0144.namprd13.prod.outlook.com
 (2603:10b6:806:27::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10565:EE_
X-MS-Office365-Filtering-Correlation-Id: c3710623-adf2-4463-47a7-08dee6a36601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|366016|23010399003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zTxZh2AB/mBhAS6DoBTOx2w2oruWlQZaNbMIvme50pJKk1TQGweiwRE7XsN1eRAzno5xZKqJzrsxYzgH81TWJL0bhZaaH1kfrNbldnIPmHcZWszQNu2yz2dHjjvMZtPujeqoxUiZI7LMXo4OljJBGuWn+TXC1g86tkQ8Zgh1ZhHKen7huA5gTLXPT3+FjyzXRV4tR0S3qMKsTyTlGX+PoCeR2WekeToT5NcDA8AVCFNMeY0TMgZQImzWOu5/gc89O0nnRI9GDrs5oBpIHQ1Z4jiMcXVLLncBZrIvGnbVko3zQdqG8RdfI3NF1d2o9GJEqfxUPdRhXIMaE/1Ln6VZA63LttBcfe4oP27pQ1ykcqC6p2TGxbpt/QvqeB1U99rHV1BuDhXO/ZvjZpBpATHRwUXz/kyDcwaKqE+825KBKR1nc5ocrZ6v4CJrXSOuUee4ehDwTcqTKpRN5hIrJDjYDxPDkq87haofXu3mGAhYxdMsSKYdmRYh+818tlFmXk7DPmDduJzT59D5ZNrXT6lX93DJrZn1/CAu0SAVWfIs4lbFRKCQp0dm1ZM8dykUtC6t6cCCTEjdWu8NSQkLGOKi1VfcxQoo8s5b5lsjegAoZheiXoYcIg34OPcEy3tJL3W3F3sgusczwXZuAfdAHJws6i2OWfC2DkYXx57XKqg1tKg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(366016)(23010399003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2ZFZ29yV3EwS08wQWlWMk5odXVIK0ltVEUrTHZuNC9CemJvM3R2MWZhaDRI?=
 =?utf-8?B?RlVucyswS2VNdVRTYnk0SEJPYmJCU3BzbGtOQjNYZkd3NnpaaVI0dkVGTGdi?=
 =?utf-8?B?M01qeGI3UGFwcHJlZDdWM1U5cnExZDIxNVF1YlhsMHA1SzdOSVJLaVhhQi9v?=
 =?utf-8?B?K3VLdXFYL2crVmhPQnZOTnYvZHRzNTlGMTBNK2FTVVFQTWs0ei96NFpXMHVN?=
 =?utf-8?B?TVRNcXhlbTQ3UWVTNFFtZmZEYXl6UlNDVWFkcmgrRGJiS25pQWQ3ZThWdzdp?=
 =?utf-8?B?YW9wTmQrZEdOVkM1TWpJUlU2NVJiLzVjTUVYQzF0SXJCZmgwZzE4LzZBVlRE?=
 =?utf-8?B?Tk5IY0lxR0FhWkduSFFHMlFUb0FweERDcmxuVndidklSZlpFekpOZzhGOW1D?=
 =?utf-8?B?UGJZRy9XNDlIem1WTEJNRkd0eFg2bUNXd2xaMGpQVVBKTlpzbzZVUDZnVFpR?=
 =?utf-8?B?cGVPZDZxSDVJcnBRY1hGMS9ET1BMcDBTazlXQnI2VkRVQTVoVVh2NkcydUJy?=
 =?utf-8?B?UmlzZGl3UitWWjd2WlRTWUNQTTF0Qytuc1pxT25EQnlLcEpiZitvRm1FU0o0?=
 =?utf-8?B?Ykt6eHdGMENHbW1Dd2Z3NlR4QWMzTHF4dy9vK2xZSEJxWFRPdVNqbGpOZGJ5?=
 =?utf-8?B?S1ZOZm5uak1pSEZ1REgrKzU5WmRlTWpMVUpNdkF3NTNGZ2tGdHAramJJK2ZH?=
 =?utf-8?B?Nyt3cWFxVnZlS1NuWm5VcjdmY0dLaTZaS2k0MVJUaEdNNVNTSDdFT3BuQ3l5?=
 =?utf-8?B?cmZkdjc4cE5MMGo2ZVZrNEZNZnVMMVpJeHEvQ3pNc1c2WWhZTnhSbjBzdnZz?=
 =?utf-8?B?SXJTVS9iT1czK3B3QVkwejBleDR6Mmd6M1gyZ1p4alJpSVRzV1E0aExtb0hp?=
 =?utf-8?B?QUdPVWJLTktkRmZmNE5RZ3ZLRWR3ZnRJOGxVSk5YS0UzdFgyQzhsYytwMUFk?=
 =?utf-8?B?SmhJUzRhVnJjN3BIUU5MVE13VE5VODE3RkNYNjZmTE83azNOMjBvVjdaalJH?=
 =?utf-8?B?K1EzYituQU9jODdpVlVheTBtRkJVN2VKbVc1S0NJS21tb2plVldrNmI0NGdE?=
 =?utf-8?B?am9ZNnIvV1cwdTZyOXRyTTRuVmRYWFF3WlF5bFVyVXRWdlBXdXZsNVJrSUpq?=
 =?utf-8?B?dmJyVk5lY1Q2ZTBPTGlSTE5DQzlsazNvN01mNGxPellMRHQwaVlobmo4QjEv?=
 =?utf-8?B?WDNYK3N4KytvSGtuU2pwZmY3a2MxTUYwMUZtaFhuYTlIUzM3bjZoeGc2ZnpE?=
 =?utf-8?B?bEFNcG44NUlSK2VUL3ZRQVFpdFIySmFrUkh5SEFmakw5Z09iejBvWElsek8z?=
 =?utf-8?B?Mkw5ZlMzZGVqY1k5RHdmbWx4a2RZelA0WTViVktVT0dXK3FzaEpiQzZydDRH?=
 =?utf-8?B?N2hza2k0blhKOThMYXNPcFNwYjhHR3d1eGpzd1crVHVTY09BNm1BTzZZaTh0?=
 =?utf-8?B?WFRFTlRLOElZdGFtTmxyMnpDTlplY09ObEZPa2tDU2NBK0s0TzhoN1hGaW8v?=
 =?utf-8?B?RkY5NGtRdnE5dC9SVVRTdkJqalFHY0ZKR2VaRFNBRjFyRnZEOVNJZVR5aXlt?=
 =?utf-8?B?S01VWW9QRUtvaDNrQ0wwMk9vRWRkb1Q5RzVPRktNRHAzc3I0MndtOGR2K25w?=
 =?utf-8?B?c1FFUUp0NTlvODE5WWhpYzVQSnNyV0laeDhyL0dIZFR1eDJYT2FUMnVQRmFs?=
 =?utf-8?B?Qm4ySGdHNzZXc25pQ0NxZ09BZWg0WUo0UFh4UDJ0Yk1lWGZQODV1WkhsbFpm?=
 =?utf-8?B?T3d5blNYdXloYSsxRW5RVWl5dTNYTEgxMGtpTWd1bFArZnhDVGtSZXlzcFYx?=
 =?utf-8?B?cFN5OFRxUFFyNFB6M3dVMmYyWEVKMHgvRFNKMzBkaUh4RHZhMlZiNFN4NGpk?=
 =?utf-8?B?WEpQTkdkR1o3SVhWMmc3RWs2VlQ5bEVIcGhBRXJXK3ZOclNnMmpNVnI1WTRE?=
 =?utf-8?B?ZkxpMlVrQnB5aXFLRGVwbmdSUW5yRjdmVThvU3ZpaWpJajB6d1B4d0JmbTA4?=
 =?utf-8?B?NVF1RVNJTXBIMFp6aldYNHBPSzlEckcyMzlmT2VLSjBCUFFZVjgxYzFvMm9M?=
 =?utf-8?B?UWRVcGxGZFJHNFNIOGxIZ0dEZlhMSmRDVmw5WndIODFzTktCQ2ZnMHdXcHRj?=
 =?utf-8?B?RVVZNXdRdUt5RW92Y1ZzbklxQmc4KzJUVitKdWJwTGlvRi9FZUc4cFRFRWp1?=
 =?utf-8?B?QVB5MCt6ek9JQWo0b1lzRVozUVFWR2tGOVl4WVNuTU1pM2UvS1FORnFBQ2ds?=
 =?utf-8?B?VzBIekdKdjRTRG43M0JVVjdDNzQ0czFaOEdGL2xjYkljekdkQk5ZbnJOTWZt?=
 =?utf-8?B?aG04UmdTTVE3dnFmNDhLV3NEUCs4Uit4eEMrWmdteUJWTmYzUHlYTG1ZdjNT?=
 =?utf-8?Q?D6Fb+coNiO2KE0ZWyGAIAXSOdIW69Yo8mt8JD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3710623-adf2-4463-47a7-08dee6a36601
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 21:11:00.1059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OeBCOr8OnLQMcFGnn0IFTWONiKrPcrMxCD7nkibVsu+3GUEDZjIs1xiU4YBZO1mFTMq9GomJ7etnOHo6YP+YyOn7ZGbBwLhW/FpImKVmmDpvfIDBRsGZyaqB9omSJ+UA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10565

From: Frank Li <Frank.Li@nxp.com>

Add usb@5b0e0000 and related node for i.MX8QM.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi | 34 +++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
index 1370a571153a5..c7063aaac4a34 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
@@ -4,6 +4,40 @@
  *	Dong Aisheng <aisheng.dong@nxp.com>
  */
 
+&{/} {
+	usbphynop2: usbphynop2 {
+		compatible = "usb-nop-xceiv";
+		clocks = <&usb2_lpcg IMX_LPCG_CLK_7>;
+		clock-names = "main_clk";
+		power-domains = <&pd IMX_SC_R_USB_0_PHY>;
+		status = "disabled";
+	};
+};
+
+&conn_subsys {
+	usbh1: usb@5b0e0000 {
+		compatible = "fsl,imx7ulp-usb", "fsl,imx6ul-usb", "fsl,imx27-usb";
+		reg = <0x5b0e0000 0x200>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
+		phy_type = "hsic";
+		dr_mode = "host";
+		clocks = <&usb2_lpcg IMX_LPCG_CLK_6>;
+		ahb-burst-config = <0x0>;
+		tx-burst-size-dword = <0x10>;
+		rx-burst-size-dword = <0x10>;
+		power-domains = <&pd IMX_SC_R_USB_1>;
+		fsl,usbphy = <&usbphynop2>;
+		fsl,usbmisc = <&usbmisc2 0>;
+	};
+
+	usbmisc2: usbmisc@5b0e0200 {
+		compatible = "fsl,imx7ulp-usbmisc", "fsl,imx7d-usbmisc", "fsl,imx6q-usbmisc";
+		#index-cells = <1>;
+		reg = <0x5b0e0200 0x200>;
+	};
+};
+
 &usbphy1 {
 	compatible = "fsl,imx8qm-usbphy", "fsl,imx7ulp-usbphy";
 };

-- 
2.43.0

