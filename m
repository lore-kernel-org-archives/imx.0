Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013001.outbound.protection.outlook.com [40.107.159.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C5E3876A0
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 05:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774330975; cv=fail; b=IIrjByvDV0Jv1tlY2rYwFqSkDPri8qIZToceFJYEDHoZsTUNu5moNVv1fLMqYl9j3PzJpsiAO/izgvnryJKV+ZXv4A27rV8RVxLAB7KSNHvVfCX2oWCzSRwzxt8Y2vUb5jXg0QQeuTkjfWx5sC03iFQhSqzUMBWWB4JthEqad3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774330975; c=relaxed/simple;
	bh=8j7KFwWnloMoEj/Ol3R22XbTzeUR2qxcInKm5PGj+cU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mUXixhPXQMSoEo1O40cHGvrKiDH7mPsRtjKTWVeHL40yL9LotYvV0tkSYdogVz55Nk8zOjbiFCpBofsE4jiY+Ypkln18rgoS9kKbqP93lW110OAOMl5uWJtIPojISCPBmwe0FHUM20CnzDzJo+z34WnS2wZ+PrGZTEGy93CX5SI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZS4JGMS6; arc=fail smtp.client-ip=40.107.159.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZS4JGMS6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JlosrBai3A9+zYpYWe+5EZXtmdSwKCKyon6Sy6957PaaHlHfrJ5CTa5RT6fyFnd2rt6hZXfvfe9bXvm14T/8K+79kzC7WT4ol2Ry/JZjf1UC0l1iSMOWzFJEhsk6/wj+CvS3IQ/KWhHYx+Uu+3BeCoVJidE+gm1lrv1+fJvk1Uk5Lyf7lQA1GNxCLy7UqyDib57QUh+c7FVjb5TbCeFUnFj1UwZsUq0f1idJAZbvXlPgFtMw6DlMKk6ZklbdlPIsbP70cZCiI5l4+m6wwTaEvpMaP6MRJrLndcMYzV8mOhh/O6m2nc5+E5kPs4rYlcaAtb1pBZ+SSGdYmOF+qHDbHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQNtZiUU+e66BcjA3Vif43vWUSvLARmxsr/Ft7saRiI=;
 b=jDYG9v96pulG8xYpKAID9XGh/j+P35J1n7PB2ODGAhoCVjt9RXh/FD5/l7ZFby1AvvmRT8h5kUP6f6AwyjLF6zhQgaVI3QCh3zTkSW0MtUQEMFErFvf9If9GaClOQAeVuQdWuXL5rcYyBP8AOFHL9U9g0D1oSsK8qbHH4W4ULluIuSi/r/tfpSiTwD9SAGfhopy0CmCEa45TG2Ha4aA9UTqJqnmufKaU0I9AWKdhtkrW0ZoPUxaW09+DqzacMpsNs7SeEMZzoTjWwy/O5XY+XN6MuDOHA8FtLI4soL6xJjpewlLl3TfJbsHxrzVW0I0E6dQWw3xDS+23v9syqyiuTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQNtZiUU+e66BcjA3Vif43vWUSvLARmxsr/Ft7saRiI=;
 b=ZS4JGMS6LH8WOHJqnoSiW2KHyvghylrd3NgFErMEaoS6bhNBe0y4yZ1mi7WjXYfmAAF7w9JBNFHVMBcmAIWU/2RZ65UEfelcKxEza6d9Ka6yMI1dhB3lVBwo26J1PjA8wyj74kthoVoCqU22vXzYVEx5OlNxW46Gzzss2gne2XQIvVoPNuLaQj7x44lSraXWH61SeWlKehaHIVpB65TXgwr7xMvXLbxsTN5EiIbpbR7juHdlQafq4Pbfypgjw5NHFwfFXcXXDVIPaHsZjmq9p/PfLThygHqM2kkI0i0EwIb3H9MIzu9NKAPc+mm2MdhmhCLknhKSwwk1WlfX+P8h5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8967.eurprd04.prod.outlook.com (2603:10a6:10:2e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 05:42:51 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 05:42:29 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 24 Mar 2026 13:44:09 +0800
Subject: [PATCH v3 3/7] arm64: dts: imx94: Add SCMI sensor/lmm/cpu nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-imx943-dts-v1-v3-3-b33bf1f1c254@nxp.com>
References: <20260324-imx943-dts-v1-v3-0-b33bf1f1c254@nxp.com>
In-Reply-To: <20260324-imx943-dts-v1-v3-0-b33bf1f1c254@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:4:197::22) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB8967:EE_
X-MS-Office365-Filtering-Correlation-Id: b69fc420-8d72-4e0c-7bf4-08de896822fe
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|19092799006|1800799024|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	GuJTgFgrW4+MR9wscDdrkxQHRz9bfgivATIJQ9ykTr23l9W4LJVH9M7AFdq8LadIbWBlHA+KNdbgVzoXmZ6NEbNRoRa3iFLLYGvi+gt3bnkPE6wkDfqexIfg17TB6MUr2yX3yv9YphdBFRduPNfpKTmpxTVx35sAHMeDK+58wzZ07CNWMEK+IeULl3HrrpKqUv0urxOafwQAKSUzXJgp7lsjKwsU+9JnCDYco/lCXIEZPAG0Rl4dit/jZGOyWPOqLX3iMCK57x14Y8Tig2pi06FJph3fwHX8uJ5CJdkXmMHVD8keAPzwsNyhWQtOSh70Uz0uDZR4DILuF8a7UtbKT9E525DSFlqRSiaA6ONWgnhYJKx0qUTk+7zZMldFi856xAxDLTZqOhzGHsyZvk473dfPGCuL4mOxhGKOeRhxeyuS80EYUsRt/nHbrzEaokRcMlZHnXsQUQgvHGOILKkMIICSaH4EJgxAtsr7ACciAhxxKCJAPH37ebNuBRNFVXtL7vI5aX7wMIa0n4lWZE1WpX8XwL5ZITcnSyXGnptUO0coRZVwIWpQcQRYSsmbC8M6qyAp7dzZJssvQZaCIxsNd5eT2PIv9t0OnKb6aS30aZIN8YEF5gQzuoRlOW971hSgQDuRSQLb55QYCNaWhJ6O7PSIrpNLQOuBQjo4J0jc5HRzYBRy0WfhSNd2itHG4ftvM7sl9wLSS6bd1iMbK2MyP26QNwnCDw3AEXlo6JM9Xv8TuMgdLq9xN/NlCJNCiFD1QVh2VCe8XaJM742FTxRpRD+xFWwZrB6SgHKDGMwnABM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(19092799006)(1800799024)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UE1HN2RLVXJOYy9hSDZ4ZzNqbUF2d01XQmdzdE85N013WHNFR3VBSFpvODlQ?=
 =?utf-8?B?YWk4dWErUW9YclZIQ3JjWlA0SDRqTk1URG0rSVBDN3M2emxDajlYdGNrUE1H?=
 =?utf-8?B?Z0gwMzJ2VHNzUDBUck1HS1NXd1dmdjByUERHV1JkVVVOaDFnOW1CaCtXZ3A2?=
 =?utf-8?B?L2lEdHJFeTdjQkFISENVTlNzZHFucnhyTS90WE9wd0VGU1N6RHlIV1Bva0I4?=
 =?utf-8?B?empZdCthSzRkMm1KZ2dra3RjQlgzRXhBci9rYVZnZEpzVGFsR0NSRlhpbFI2?=
 =?utf-8?B?ekFvaWJXL3U5cFo1S2dtWFpxSVFqWXVnRW1SN1FTOTlabGI3UG53UEQ4STVa?=
 =?utf-8?B?cTVwN0EyZGpKZVIrejVBM3dBVTN1MXRmMytTZGZNcjI2VGtWeDdsbExtUlFI?=
 =?utf-8?B?MGRHeHVVczlkdjk4a0lGYTVaMDVENk9QaW0ydEUreDloejM1ZmVmS1YzYi9p?=
 =?utf-8?B?WkNNMUU4Vlhtalh0U21SbVV5MTllY1VwWnR2ZlJqZHpSa2lMV0VmQWRxd29E?=
 =?utf-8?B?TjM2N2lTU0JteFhIOGorcTdRak5oV3ZqcVROc3V6bFF3dHB6cmxDNGJvUGZ4?=
 =?utf-8?B?QVhkcUJrK295cFlhZGQrMEhPS0RidDRMWEN6elBremw1ejlHYWVWQTZIUjh1?=
 =?utf-8?B?MWZIckRubDJocURIVGhuWjdxQzE4NFlyUERwZW9TaHNJYjlxWlNIUVVHaHFk?=
 =?utf-8?B?ZmZZdktGZEdKQVdLQ2VESjRrU1FTaUxiK2JtdFI5bnR5SE5sSjVZTkxXNzQy?=
 =?utf-8?B?ZG1uclJoOXZHcXZZdU5jNGpkK2hWVkxvNTZkUUJFR0hFRUVPbDExUGVoMkIw?=
 =?utf-8?B?WHo2eVJ3YjlsQ2dzK2xOVjFNZ2svaittR3dLdHJadncxNVM2REJJdlh2cDI5?=
 =?utf-8?B?Qmx0WFpuR3BFanVyU1RIWGNMTUJqSTlpM3VTYitKYlBrSjFBSnNaNW1Kbmkz?=
 =?utf-8?B?OVh1M1B4NGFNQ015NUhlckxCRGVnOHNGc2Q4cEhzeCtzUnJtcnJHZ21TNm1F?=
 =?utf-8?B?d2RxTEx2QlNaVFIyS0RkSVZvMlQvdjFZa1lzRDVKWXNqenI4K1JGV3UwNVJG?=
 =?utf-8?B?azlkZkprbUxuYVdySDJyZHpHNW56K01xemVoTk1WV1JkTDk4WDZhWUNCOVhZ?=
 =?utf-8?B?ZXl2VmgzVXBualE1eWw4U1ZVYThiczk1YWJucWw1YU1GaUhrWmVlWmZtRDVT?=
 =?utf-8?B?RitwcHZxN2hYQVJtT2poVUJLdVVrbTE2VXd5QW5ZcEdOb2lIa3VDNkg0RG0x?=
 =?utf-8?B?UnFUT0Y1MG9ISFp6ZUJzM016TDFaK0xWNS95VUUzMmVhUXRpL0daMHpHa2tv?=
 =?utf-8?B?eFVnci9TemphTzZUNlpVT0g0MXdwVnhLblFISnRWa25FcTZwN2VrTUV3czlp?=
 =?utf-8?B?ZDFWSkNpZTNKakUvTzZWZzVyU0NUNmpHcXdyTGpoNjk5TFJmN0ZoWU5JK0pY?=
 =?utf-8?B?YzFrTmpTMWpkQm5uTkd2M1N0eXp1RnRPUGhWSm1mTHJXTTQvSmdndGlvMUh0?=
 =?utf-8?B?NzRiWERrM2ZCQVkvMG5mcnN0SFRCcGpYbGdMNmViSzQ3cHhQK3VEMjhwbmov?=
 =?utf-8?B?RWd2cmlaRW9ZeWtMaS81SzBzTllVVHgrdGRqbXVac2UxcHUwNlh5RC8wc0tW?=
 =?utf-8?B?VG91YWJYcXJHMVRXdlBWaDQ5bldFRnFTcmR1dE9PTk10dUxYNlUzRXozYyt6?=
 =?utf-8?B?VjZ3ZXRJdVQzMTg4WGdEWVBMU1ppeWY0bEVlczNJd0V3eUZFb3pPNEVPd1Ni?=
 =?utf-8?B?TXBNWHdUOHBTa3RNRzBiZC8vWFRTOVFUTHlDRGs5Ym5FNHhtaGR4WjFoUmNP?=
 =?utf-8?B?VFlrUkRETmtIU1ZuazVIakRYZ2V5ZFNPbmd5UFFFZkVJOEVXQWtVT3N2bjdK?=
 =?utf-8?B?RkJYSXNycjMzbzJVZ2NGY2xqalFuc3l6VHM2a0VxdDk0VGhJcDZoMExvYm1B?=
 =?utf-8?B?RXRnUFBHWFoyVXlMN2NERUpCNVF3RHFJa1JDY040dUpjSjg5SktvS3ZpdkYr?=
 =?utf-8?B?QWFxNjJaei8zWjBzUFB1NGoxQU5FUTlyUDNBaHo0VnZCNmt2WFN1a0gyNHJ6?=
 =?utf-8?B?eE1nOXkvTGVqWlhQOHpGSi9qQUpqVXFCWEQyUnBmaXEzNUVONmY1dDVHR1JT?=
 =?utf-8?B?UE1xbWdndlFVVHZBMjJ4OWVSdEFvMVZwQjc5VG9TNVBBbm02RUdodXV0M1Vs?=
 =?utf-8?B?V0RLRjdmWGFuVm44V0dwV3FaNlVXSlgvWUNFcnM2UUNxM0wyMTZveWJ4MUFV?=
 =?utf-8?B?VzBFTUE3dHNXZnhnaFVuNHhuNU1mK3d6blZCRjFHQjNjN2VrL1dGRnJzUWN3?=
 =?utf-8?B?dUt5d1c0SDZoWEhieUROcVh4Yyt1QmxmWWFrL1FXZkxJN05GVDdrZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b69fc420-8d72-4e0c-7bf4-08de896822fe
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 05:42:29.0861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VBdTmyv4dxy7BSTrO9gP1Ak9M7Do0OkOhZaOssGFMmYNn/ffhByyqdu5ftaRHtvl8tgF+a/urmkfIwG3j9n+7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8967

From: Peng Fan <peng.fan@nxp.com>

Add SCMI sensor/lmm/cpu nodes to allow Linux use thermal, i.MX System
Manager Logical Machine API and CPU API

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index 69ede676fc04ede23faceb8f24cf740697e40d7e..d779866d5bb2d425a496065d6f7f3f7532f15298 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -94,14 +94,27 @@ scmi_clk: protocol@14 {
 				#clock-cells = <1>;
 			};
 
+			scmi_sensor: protocol@15 {
+				reg = <0x15>;
+				#thermal-sensor-cells = <1>;
+			};
+
 			scmi_iomuxc: protocol@19 {
 				reg = <0x19>;
 			};
 
+			scmi_lmm: protocol@80 {
+				reg = <0x80>;
+			};
+
 			scmi_bbm: protocol@81 {
 				reg = <0x81>;
 			};
 
+			scmi_cpu: protocol@82 {
+				reg = <0x82>;
+			};
+
 			scmi_misc: protocol@84 {
 				reg = <0x84>;
 			};

-- 
2.37.1

