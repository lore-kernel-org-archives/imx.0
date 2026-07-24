Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013019.outbound.protection.outlook.com [40.107.159.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731803C2B8D
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 08:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784880916; cv=fail; b=LeVm3T7tsdx9doye6VP+8vqcJeFYO4Rp0O7EkjF61VasUEfNsNY4tNqgmrop9ic8wUeQtiBuoa9FlunrYtFln3WTNR9jtQDU3zg6jzHmRr5fXXD1fyJZ9XmRM3G+y1xdO4GFlD/SdX2g47su82Wxg+aRALJTRAkGQqZzN1Kr/u4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784880916; c=relaxed/simple;
	bh=WweNHDHiElH8o82jk8npSceeFRcm3zMBKegXgf5E3CE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Rxm7SDzUJEFgBixQlRPKB4FcoM7hFcAhRQz2B678Qa47X74+nEPHVhAt1x0+QbK13mitE/eO8JCIAtQqUiHJbQpk6pwCA6bNkxWrRiYNiFv0B8Q4r8I+VASX5++4LpkUa/RPVRP+AAW9Bvwo5gn1AneuVOsqYlHsEYDtJ0DGY50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pU3Ejn21; arc=fail smtp.client-ip=40.107.159.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pU3Ejn21"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rCaGmwif+fS7CNpZmFfdmSQGVuiD43Bo1CYwyllCyf9qHhAj6rD6FycZqvHD3I02AQGFVOrWR2Pi2JNP42USRr7jCQL/RUN2WrKGNVNAVB/U2Q+NWyO6h9PyxyhQL/ZTJlYyfMxz1AMNYyEg8KarVIfBQjtpQIE83T28qn99G56QV8xHhsXUXX+0mEu2wfJT3iiJ0HpzdmWThiN+shdIwjYD2Lx44Tj8Zx6dPG0FE8PaEn/trbLBe6foQkZQic3/7lQKvLz9ND6PE5RShmE0NvM8Pjcxun4ETQSZEL4fM1zOSIe43NXNWZnPw88o4nPjPcIJQydlmGsYpv1fvdU3jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=CCDJGBm3cTZ3M2JKGi26+4o8OV+EieFG9sH9zbyCGx4Hs7afMBfAU0hJgIq2SPsYeoj1ArRSOFnU1tZKhqCIEtk++xsX1RU2p6fppOmjomlNRn0PhDZgv0pwPp0WgD2nXFXzr4tebzFEY/KtxZfUfp9cO70XDU+uT2lGQS5CGe6cSqPUFGUiuYsnbNJbQ978n14bNDiK6S7TH5IyerwBXZDNuc1ZIixvkhUBP/MWz57O8doxyfqv+0apCVav9MriUpRnxdOO6GYWflvEEa/WJIaohZ7dqXnELmPrpJCrgdYhfyxmvbc6ZBbUxhyPlXr9t+0vSwcI6u/7cQGNNoP/DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=pU3Ejn21oyOwdfVbwXquVA4V6GCAJX2EOKkH9PjAxmtgN9LeFz1S7LBRt0vK9UDHtPmiPxE58L4TCdr5r/JYx3xx5IqnUMAIhq/kDrUXqqceR5tchT8UDwBsmuY7ZgWokCgSOHxXeQaqEOpJOEsXq4L75pTGcmQbxznywgeLeCMHy5i/Q/GzrSxR/OOf7M9fMHEr0JftP5c7p4rqZhRDJMgCwjmBtnoIKGmQksc2UbkcLV7lmLWbuYvmqNxbD4RotcgAb6iFvFEvG32x0jNXsJmRGwHgciSDXO0I+2Y1FT0WzfyE1vVSkQDHwGQjoQr8sDp8G7EsrCieBlX/DbM+tA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AS8PR04MB9048.eurprd04.prod.outlook.com (2603:10a6:20b:443::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 08:14:57 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 08:14:56 +0000
From: pankaj.gupta@oss.nxp.com
Date: Fri, 24 Jul 2026 14:35:10 +0530
Subject: [PATCH v30 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-imx-se-if-v30-2-ce8ba256692c@nxp.com>
References: <20260724-imx-se-if-v30-0-ce8ba256692c@nxp.com>
In-Reply-To: <20260724-imx-se-if-v30-0-ce8ba256692c@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784883913; l=3245;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=T+yyPOpdxzPdIuNJ+imfCdmSEVDwuOuBb/dhiIQRNpY=;
 b=14ua22+jvtQxJ/TeEt03oaXTvIurIwDeTtuU9pPfkUDPWhupghW5EVqCUVI9gl0/SAp/WGyeg
 PSzKqjbQ630CoZx6SPA+wBtw3p2ZEsQ2ytZ4cPx1owWNLoyTOz7OQ9Z
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA5PR01CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::13) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AS8PR04MB9048:EE_
X-MS-Office365-Filtering-Correlation-Id: c6113f45-055f-47f2-2a3c-08dee95ba5eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|376014|7416014|1800799024|921020|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	MefqX0u8xZQwerf0+9ZIOQJGEuoQ7yPLplEgBBsIN932o+/NV/Ln2E80x2g//SeIe6IEs2EfY6BORglFoOgu3HxmTe63dleUkC+j7DvesAb3gBKn1NmJJCZqxyZusI9rNxSD9dNXGrJm0UQENxQYrsRBjHqiQuKrqtXLz0ycybSI9KIDPM6FWKNk7OTFj3Fz0pcDBMNnacWpPwHtWF4TRyGP6hzRv/yWLI/ytiK4l/ntiDZysFdNJpW6RqJsEdTH8urfPqNHSOPqZwLfVYB58EhoiZVJb0VtfH29tq/KpCzTYyRxo68VBjsmiV8cAgdlAxewoDxHIrh2m3m58CP8sfYU/dJoEbKCXtvBTgV7IiDzxidtlhNzYHWM9uh6Nti4biBCK8HMnA/dB/yqhYHgezCQLnIL9DirDXHj3afGwlnIKKCtnM2uzw+ThGH1b0tE3ig0X/+4KQyhqbGOyT0eLNt5NLJZtRUDEDM1SDSQk9I6C1QMaT0oPcR8sogaOapBKMZahMPNBA1WiX1JLvBHTfj7Bx2/Y0sp+kEGBp/tuSnZy6yIV90zXqHtU5f9j6jEdCrgID+6yxOd9/rkIORX1pv9OdPvaDsT6uvFp8nodmmAX5AoiZ4UxdzX80fjIJgh5YX7taKy+KIBop+8Iar+0dfyfte+PbrBCDinR5i9UWY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(376014)(7416014)(1800799024)(921020)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2dsU29pdVFPQ0Z1T2I3OXVYN01GUGNlalJGcVZaejJMQkpYTWloUmdGV2VE?=
 =?utf-8?B?Y2Z4Vkp1c1V1SGdvb2lOT2xnV3BQS3ZFemhCc0E0RVpVSnRZRmU0aUJXb0Rm?=
 =?utf-8?B?T2t6Um9ORXgrV3ZHZUg2ZFJjZXNKUUxCQThEeXk2NUNaWm9OMnc1ME4wUm0y?=
 =?utf-8?B?ZXg2dXNrWXRUV3luaElOVWYrQWJTOVd6R1FJRjN4MjJ5czEzL3ZqYzE2YWNY?=
 =?utf-8?B?R0x1cWp0VmFhVHVTb1ZadU9rRnVONWROY3ZST1pmTmhKcXdpTEZvaTZKUHZV?=
 =?utf-8?B?VzBLQ2s1VzJGeWtyaTJqMzQrRXZRbnNFbDhuSy9YRTRQS21tRjh0d3Q0cVFm?=
 =?utf-8?B?RUpJbVlqaVVZdzRJUzNBMVVzM3JXNkNzNUtLdExJK29HTkFQNDlSVVlVTGtB?=
 =?utf-8?B?WnBsOG1kQitMVnVpL05oY083R2FDU28zWE8vUmZId0RwTmV3SEViYmQwdmV1?=
 =?utf-8?B?QmI5bmlqR0p0ZzExN2ZoMXNjRjBuQTB5ZkQrU1ZZVGNPQlBGUCtoWG1XLzhP?=
 =?utf-8?B?UHphSUd2SUtTbm9pL3Q2UWlsRDNJT01SdFNoN0ZBYlBnM3IwV2NSZnRWeUdV?=
 =?utf-8?B?b1ZuNzRaaE9FTG1XNjhSdi9uZjdYdGxtMk1hT0VJai9Na2ZjQnlJYmpyYSsy?=
 =?utf-8?B?RHVMSjdFR0tKU1NETFExc1F5bUdqaVZtcHVaTXRZWUlEdEtCY25aUmp4bjg1?=
 =?utf-8?B?UDMxNlVoNEJKdlpvQTMvYU9xRXFPaUJFNWwwM1RrMXVNd21iSG4rOS9yS2Fn?=
 =?utf-8?B?ZjFIN0xCNG5TeU5vUTJlN0JMMU5jVGlBeGlKNjA0blZPNUc0ZzlSU1BwQmVw?=
 =?utf-8?B?SDZyZkFkZkE1N2UrRmNzVmJoOFBwT2dHdkdwdGpSeUlBNHc2YjhYU0FLeFV0?=
 =?utf-8?B?b2JmSGJST1pRVEZiNlpmQ21vWTJBWm5WUW9lRytmVUtSak55Ris3ZEtkSlBH?=
 =?utf-8?B?N1VwTmx5SnJSYWdNNnY1WmFKZ3hUVjhmN0lxcExaYUZUNCt6bytrVWtHRThq?=
 =?utf-8?B?bnMyRmlNZFY1dGY3MzZVbGlYZmNQUDF6UDFlQXFaL2RyQmVQT3FyVVorRStj?=
 =?utf-8?B?QkxrQWhWeG9WWUxXeUNvVkhJT3lCMCtsRUREY0FTUHFFZW1DRW1xU3hqdDcx?=
 =?utf-8?B?L2Jad20xbWo4SCtaMFphMWM0N0dGbWVtejlCK2wyVnp0VVMwWXNwb3NFcUEz?=
 =?utf-8?B?blBpelMvSUcxRDMyR2wvdlJHK1dZQmdqVWFLN2JoMkIzTlp1NEhmbWU3c29K?=
 =?utf-8?B?d2sxRmpneUpRTVVubURXWjZ2NDhCVGdZazRHK2RNcy9LaEVqNjlhL0JVSHlV?=
 =?utf-8?B?ZHB6OHpzbTAxcndTU1ZxVzJqT3k3K1BjcjNKMXZ5bHAyMG5qUGhWbGJ0UXdi?=
 =?utf-8?B?dTdqOVpVMHVKY2pySkhaMmdjcjQ0WnVFdTNwSEhDdTVuV0xmZi9RSm1ZVCtn?=
 =?utf-8?B?R3MrQ1dCTkRVU1JrTDY1NS9Nbk5FT1laNHBNcUdZVWREN0JiVTkxZjBKc3Rp?=
 =?utf-8?B?WTc4VitBQWphRDR6dVZDNk11enNCMnJkTlZvSFNQUm44cmZ5UmdheFMyQ2NO?=
 =?utf-8?B?TWlxQmY2MUY2NTZIYnliOXVsZGNubGpiNllQY2tNSmpHWmFZeWxESnpFN09a?=
 =?utf-8?B?WEdJM2tIYWlTckIrUjhOdG9wUXBuWStTR2VyQ0JhUWhTdEtOS081ay9yOU5Y?=
 =?utf-8?B?ajRLNUdTSHAzU2doTk1PUkRSTWFTc0xObGpkNzg2NVE4VnVJVTd3NnowNjlh?=
 =?utf-8?B?dDJNYkxVUG9IelJoUU90RXNGQ1l0RklPSnZzUHNTZzQ3Njkzb2hFUWdPb0VF?=
 =?utf-8?B?V3hZRnZ6c3JPNExydWxndFAvTGZYaGFGRGNFenpveThnWUVGeXYxVTBHcmVN?=
 =?utf-8?B?aTFnVDR6QkpTMjlsRU11eWUwNmRtSW51c2FCRWNocHZpN2hSaFhMSFp2dVVm?=
 =?utf-8?B?S3JDdlc2dW1CRHNIQ040NHpGSmU3ZEdHMG5YeDZSY0phM3MzK0lOSGhNb0FK?=
 =?utf-8?B?ME9wci9OUGdkalZ6MGJJVXQ0MWpMOE4waVZRZ3ZqSjdFeEw0MUNoeTFlcXFa?=
 =?utf-8?B?MGliMkZ1YmpKRjRSMkFaUHNEakN4dmNKMEx3bXYyVTBZSzJXUHVJUmtLanBt?=
 =?utf-8?B?YzRsTCtqeEp5RExKOGhqMkQwNmNzQ0IzT08wTFJTR3pGLzkyUTg0am1RWkh5?=
 =?utf-8?B?OGlnTFdESlpKTTF1Q2VIR0oyelIxcTc3UmY4ODMyVWZmT1ZCK1dEQ3dsMXFK?=
 =?utf-8?B?bjQwQU9IM0xUUlVWRU1FYzljSzJ3NUFFaFF3dSszYXpsQno4cHpvUTFkTVBF?=
 =?utf-8?B?SGhaWncyTTNiS1FrK05ra1NBWWZHYzhQTEZMdk4yVkdzQWl3bGdPL0lVOFRD?=
 =?utf-8?Q?RTwtJJNk2stLFzAUCzzIpzc8jtdV3DwmL3f2M?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6113f45-055f-47f2-2a3c-08dee95ba5eb
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 08:14:56.9239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3YkTul/Ld6oW29czLtq0gYGAT1oTRoNdRfmH3SOT/vs47+fp4mYmlcwUwWkHb+ZHgiGAAw5bfFbQg6JmP6pX9DW9D4BeMxnLWbGRt8lD5MevD3UyQfzvFeSQAEpPQxVi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9048

From: Pankaj Gupta <pankaj.gupta@nxp.com>

The NXP security hardware IP(s) like: i.MX EdgeLock Enclave, V2X etc.,
creates an embedded secure enclave within the SoC boundary to enable
features like:
- HSM
- SHE
- V2X

Secure-Enclave(s) communication interface are typically via message
unit, i.e., based on mailbox linux kernel driver. This driver enables
communication ensuring well defined message sequence protocol between
Application Core and enclave's firmware.

Driver configures multiple misc-device on the MU, for multiple
user-space applications, to be able to communicate over single MU.

It exists on some i.MX processors. e.g. i.MX8ULP, i.MX93 etc.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/firmware/fsl,imx-se.yaml   | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
new file mode 100644
index 000000000000..fa81adbf9b80
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/fsl,imx-se.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX HW Secure Enclave(s) EdgeLock Enclave
+
+maintainers:
+  - Pankaj Gupta <pankaj.gupta@nxp.com>
+
+description: |
+  NXP's SoC may contain one or multiple embedded secure-enclave HW
+  IP(s) like i.MX EdgeLock Enclave, V2X etc. These NXP's HW IP(s)
+  enables features like
+    - Hardware Security Module (HSM),
+    - Security Hardware Extension (SHE), and
+    - Vehicular to Anything (V2X)
+
+  Communication interface to the secure-enclaves(se) is based on the
+  messaging unit(s).
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8ulp-se-ele-hsm
+      - fsl,imx93-se-ele-hsm
+      - fsl,imx95-se-ele-hsm
+
+  mboxes:
+    items:
+      - description: mailbox phandle to send message to se firmware
+      - description: mailbox phandle to receive message from se firmware
+
+  mbox-names:
+    items:
+      - const: tx
+      - const: rx
+
+  memory-region:
+    maxItems: 1
+
+  sram:
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+  - mbox-names
+
+allOf:
+  # memory-region
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+              - fsl,imx93-se-ele-hsm
+    then:
+      required:
+        - memory-region
+    else:
+      properties:
+        memory-region: false
+
+  # sram
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+    then:
+      required:
+        - sram
+
+    else:
+      properties:
+        sram: false
+
+additionalProperties: false
+
+examples:
+  - |
+    secure-enclave {
+      compatible = "fsl,imx95-se-ele-hsm";
+      mboxes = <&ele_mu0 0 0>, <&ele_mu0 1 0>;
+      mbox-names = "tx", "rx";
+    };
+...

-- 
2.43.0

