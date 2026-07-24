Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013019.outbound.protection.outlook.com [40.107.159.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154A23D16FB
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 08:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784880956; cv=fail; b=Miar8EcDoFurjHy8xc7mEekus5S3WDBnoScbReutHLRzDrUosJ+Mf4SQUsicQy+4MT0AbuNIROcHhWsEz/wuvxxSsMdjnCNy9Ht2ZGcNCVtY145o8U98rQuHNKnIzf71HnrAvIgS7Jce6I7MAVC3UK14F5NP5DncefsxamCutS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784880956; c=relaxed/simple;
	bh=rXCz+RjRryPw6okSsLS2gT1n2zw3GWgVY8tsmT6TdRg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PHAhOMdrF793gZ/o6POBzfC2SszqDMonAObAqPzf3s3yRxMS8C0gn+Ptcnl9vLYeSKEizLfzKSn6YojhCZQQn3vq1y4suJ/9K/4KXMQTx7LTvvLhcz45XsV3KjtPH4hM/MZjrgdymgEtPnbpzp//g7NLwWBZuaYqrk3VoAdce40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sNapOuQS; arc=fail smtp.client-ip=40.107.159.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sNapOuQS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mgi3KNDulzGJsYka+RxwvDue2cqpz4MWuffp7YfbJDlnxd+l4E45d+OA1VRr+8QNsrUU/x+3YE38dN49aG1f6GCGd6JHWP4St2z8+CbKRGMAwH9csBRVPj0jTEEsMvs9povdS8Dwmyhqep8EVXxA+ydZQfUpBEDhNLgFYlFk3Ts6hh3RcFOFdHxKuSORNzjpkie/irS6wmlcFEmgNvUMOwuzxNgYvYbXZaHAOlHVviYLD7iryXRvwb+XMDWU9xgK0QcECPghfcIPnDL0mnGrmIbO+nh/Yb6BgMcTkAElAOKAXK0LdGUQYV6SJvxmVvPrhfnA7DA8qzDZmatPPYWLrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuCQjnIjcHcsCbC4CeSNrKK4n8UqQjP5j6wVuK5Frmw=;
 b=he4UAIQUWRC8uWJgnhNWKvFnLrBanjgz8Zge5OaEQXEFe3A2pJuAktPzlQADzzdBnI/iadBGRwU/nCbpgRLyyf0dUSMhgjxBUvgJV7WaXyfuipJQHv5JXfpet2ehYBp7DbJxq1DHr+8IdaQT2qBwGWZw2T2KCErRQmLjy1VuxLhBAbuIRVsIHF7MJoazBxnDrgOrJGG6LZEZQIgIRRnsW+fH2OUbSbQyhb7pdhdryQFl1Cylq1pTZVImfwb0xLG4eZwsbAG+ZKZ/nsL8M/ijlOIqBeKE1Q7Je9iPljosk8i2QW4rO8v4lQxrCWwSkxeWZgBJ4MPt2unXj1YmAl88sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zuCQjnIjcHcsCbC4CeSNrKK4n8UqQjP5j6wVuK5Frmw=;
 b=sNapOuQSGPrq7V/K6V/T8Tbq+84JTaBoIBuzBCeTYIm7b+4e6R8SuC0/TcfySdWY2CGITUN7jdzi0XDjHhjh4dFCxKDOWT58Su/nhtplkIbe9xtnWIDZKrkvCBf1eSiCcec5KxT83R6PVN0o8Iye23+uzKDiClGfwJDPjXMF2xZnrdJhQSz8alvLoVSMQ+L5714AkJtvJUPxAt5i6zMdviQlNtWzRMDQHaMPpuQBpXDEbzV1HSM7N7T90KpzitbIddfzvDZO/ZbSScnlwcoZgbPQRUmRw+K4b1OtXuOTQxCv9LdK5l7kHLjbIgXX5tm1nqM17SN2FZuR14lQpGBtuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AS8PR04MB9048.eurprd04.prod.outlook.com (2603:10a6:20b:443::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 08:15:21 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 08:15:21 +0000
From: pankaj.gupta@oss.nxp.com
Date: Fri, 24 Jul 2026 14:35:15 +0530
Subject: [PATCH v30 7/7] arm64: dts: imx8ulp-evk: add reserved memory
 property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-imx-se-if-v30-7-ce8ba256692c@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784883913; l=1279;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=hnPFsRK9/RoyluFDiCjFX7uqhb3SO3ctyv+6dqueb4c=;
 b=LnKW0VEkB8DvJro1FcSLEk6wwmBif1kJBn6gKFirkmeOA1u4343Tye+j9m6JjMOGqKb4hfT0n
 PMBZzsQWBgECpX6oPVKRSwfGqVfw9QvvhwrDNt1bsJJUK8BwhLZG24a
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA5P287CA0264.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::15) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AS8PR04MB9048:EE_
X-MS-Office365-Filtering-Correlation-Id: 92f0f5b5-7046-479a-cb6e-08dee95bb4bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|376014|7416014|1800799024|921020|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Q0FCV8IbMw5YGlKQFK8LXobjRE9YKa5UKfIdse/YGGKmMLy5UGa+R2gps1LkpwPd5i7dXKF5RJoucTEka4uv7/VkjGEMQ8Z11fQ1o5lVwFA9i+d8bj92lPYGI6lupc6+h3VnGVsgoxO3WJzpOTBrNJtrQhXYSdOYeh+nbS1FzSikML5wqyDq0OVjEpluSHmLAIV5aRO48KToIY2EnhnRc0oJ1xJszn+Jhs9QfX7+/u/VRdpl/TcjF0Y3dBCJOP+6uWJvmGTXjd8rG3TmX195VF+cbDLJ7WKHWMFT8cmIE4JqUBmXw6yZEkLk5D3262KgOlYP2sYLbvQWoy++lFyK+J1NKc2BmnttTavhdk+W9RX2oPwD84D5K7fSbboEqIr3UvE3Hqrmt/+kuWLup4w9fJKyk2ANoJ/xJYGh/nKZ95WhyJr+T2u08IwsUUuWUGs4tNNa8l0CnTwkpu4V63HMPfMqVNNZs0xjEIj8wzJ7wn5eePlfTQJf402Rwm0EIOecpb6oFvtZnmsMECIZi6sdue9pVjUXEZ22owMK17WB8h5Za15bMzrCAkNqgwPCEPFhQbVz3XLwbOSXsVr2eiqq/L7rVfh59QVUbE/m8WGlDF/i5fu7T8wBw8d2V8ZYorNau9V4QT2VNKJBszUhJCVffr+GDWCMTDMwyYwtUUoLvFvDKLB9+vNCiVlgLToGjll4gWg7DobsFPn/x0BlVeTtXw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(376014)(7416014)(1800799024)(921020)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1U4Z3cwYUJCT3pJV2J4NEY0RWtmMlp5cEphdW5mdE84aGJOK2VpNURST1dK?=
 =?utf-8?B?MCtPOXVnUjc4aTFlcjJzVHdOVGxEWTY4WFlOV29Db3U2WEVUUWxWVlZkQW9x?=
 =?utf-8?B?RFlkN2RkQ1VjbTg2NlFOMi9DK1pjY3AwMGtaM1IzQ2NPRXV2SThmNzZuWUU5?=
 =?utf-8?B?eE5QRktwZXpoMGQ5TEJpcVA0VGlFYzFZd05tN1lheTNMNmU5OVFUVHEvNFNG?=
 =?utf-8?B?dTVid3NZd0JNTGlwRk9QVjBoRVU5MllwN2xhV0tFSzVFQ09YT2dLamZtVjJq?=
 =?utf-8?B?cTEvTFFFS3VvLzQvWnF3VzU4WFlSQUlBNjJRZFhlYnhLWmtLTWJ4dXpySWVN?=
 =?utf-8?B?TWpTMWtnL2Q4SkxyQU5GMkpOS0NZeVRCOUN1cUI0ZnY4UDlncW9vQ3I0UWZZ?=
 =?utf-8?B?bXVoekMyTXJ2QnhqbHNNNklLQ1JuR3FESzY1WG5lbGpIRC9IbThVbG1wa3cv?=
 =?utf-8?B?akoxNkRYdTRSWFJ4Y3llRXV1cmV3K2w1LzFrSmI4Y3Z1elBHUFd0aDJJaER0?=
 =?utf-8?B?R3ZNckRreDNOUi9ha2xFaExteHhSSUhZdS9xTW9KSzlseDcrTEJLblNxRnNC?=
 =?utf-8?B?QkdQWVphdGw1enZ1T0dGQTJiNXArM2k1MWVINHRGd3E2aWZYSFR3c3l0ckdD?=
 =?utf-8?B?UXgvMnN0bTVHTjJwSER2d0NMMzg4TFZJeXU0MzhDTnZmamNaK2VnS3ZqdXRu?=
 =?utf-8?B?MTIxNEplT3FDRTJYQ0RFZzhZTnB1ekFySzBYdlRqbGRxNk1vZXcxdEV6OEZB?=
 =?utf-8?B?cSt4eVhLUFczeXdJOUkvWEFRM2xXaGdFRkpkRnlPUkp6eEtNYVhlZEJDWnZt?=
 =?utf-8?B?K1Y3NWVJcWp0TWNzbTNKZEdmZ2FQV3p4ZmRhRWN6d2lHQlpRamozdGMrc2pG?=
 =?utf-8?B?bzcvejFSWnBPKytzUEw5SDBiQUxRaGJYR095eDQ5V2xFdGxKYXhod3U2Snhw?=
 =?utf-8?B?b0d6MktQdHUyOXNaK2FTY2czNDNkSGM4NkNFL0hNaDF3NTkwYWRRbWZ4aEVi?=
 =?utf-8?B?Q0xTRlhjUU5DdXhKb050a0wzMU5nekw5ZEw3WEZSNlRKbkVPSTRRcG1TOVFH?=
 =?utf-8?B?YlF2MkpnZVF4WllSdGhaVWpoaFE3VGRFSlpGS3RXcUxGZ3FERDI1UnRwdzR0?=
 =?utf-8?B?K1YxWEpVekw3QkVzSXpiYWx3L1dFdmRBTWJYL3RYUUZTcExGT3RjRWtJV0Vn?=
 =?utf-8?B?K04raGVJZ1BZM0ZXNzlqMFgzMmYrTk1RQUtRaHozMGZvY0ZaRXBMM3krYTNz?=
 =?utf-8?B?bG5WdzB5eW5XK2loVnltY0xGaWxrM0l2eEx6bGZlZ1lENzlCZUZ5Wk5kbUNw?=
 =?utf-8?B?aWtoQ1dkVWJ0bkhFMjBGajhsalFCaTIwMlVRU21VdS9UL1d2eFlsZmpvSG9j?=
 =?utf-8?B?Y1NFOG1CYnQwVEtlTkYxNmV5MDl1NGViTkpYendsN3cwRnBkaGRnZDBsZHBa?=
 =?utf-8?B?K2JMVXN0TmRFSEhxdzdaSFc2THh2ZUNMKytpdkQwY3VZYnhLTFpOdjN2U3JB?=
 =?utf-8?B?aGcxQWRUYVdnaGI4QkZ0TjBwOTVUaXRTeERNTC9wbjBRdUx4OXBNdElienpk?=
 =?utf-8?B?YzJBT2FPcG9SdDhzM0s2VmRudi9LNW1pOStiakVRQk1CRWFOQnFJK0tLeStP?=
 =?utf-8?B?c21LSzNOaXE2QWx0UUc2VjFyVVZHVUJmUlVJbGpSdnp1VEJJZHRhbFR5Q2JC?=
 =?utf-8?B?WmxrSGpxS1QxMmhJZk1VQzRPN0hJS3NsS01BQ21RVkNPU2loeUYrblNtMjFU?=
 =?utf-8?B?bmZrQzh2bGh1d1NadzFBVmVGZG5lOGJKSWFQdmVFQUVBUTFxVkNZdjZmUHhj?=
 =?utf-8?B?N2FXWm93ZUoybTJsVWU0elB5T2VwdHJwUzNrYWtBemNKemhDdUxlQVkxSGlH?=
 =?utf-8?B?RVkwRUZDS296a0psaU1QZkkrU2ZBdHZUZjZ0VWxSVWdTcmtYNHJpendGdDd6?=
 =?utf-8?B?bTdxci8xWDZxMjBQSFZsMXhIaTFxNGxhU3U1MDlDS0RqVGlzZ1NocFR0cGFa?=
 =?utf-8?B?MGQ2bVAzTW9zREtFd2VIdzhJSkRZVnA2TVdJM3hWZmFVTHZ0a3ZDVitQckpG?=
 =?utf-8?B?clZXc2JOWEI4N3JrTklBK0VyU2RjUzhYcHBsME5McFp0MnFaNXY4amdrbCt1?=
 =?utf-8?B?Vzg2MDdtTjNPYmluNEJ0Q1NYRkFEVTVtNkE3WWtjcTlmSkl4ZzhXOHZtTTdP?=
 =?utf-8?B?YjJMZDA2WUVRNFNZTkNkbHlaRzdCdGU4RmcvNU0rV1JUbWxGQVRwRXFIMi9h?=
 =?utf-8?B?d3dTbFU1blN2emRDVCt0TVFKbTNQemw0OGFZL09IbGZ0SVRhYmJ2Q2JOMjM0?=
 =?utf-8?B?dHhrdEVXT3hzeVBWaFdRczgyVmJva1IzeGJramhuRkl3Zk1nQXVBQUs1OXpS?=
 =?utf-8?Q?utBsFvk5XOGhLne0wQjcx1ziyhuKTWNpta3LX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f0f5b5-7046-479a-cb6e-08dee95bb4bb
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 08:15:21.7683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vwZWN3OfO/QCCedkV4sTFKQSG0LsMRBKIdZfPYKJKX4CXfU2YYIBv1XMLNQG9AWIjLK8IH00lcdlNXCxF3bI5ZcdwQeFcPXh4aEqvOR5STIXKoZPbaLhVgsmdFaTjxwN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9048

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Reserve 1MB of DDR memory region due to EdgeLock Enclave's hardware
limitation restricting access to DDR addresses from 0x80000000
to 0xafffffff.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 5dea66c1e7aa..16399d921e04 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 /dts-v1/;
@@ -37,6 +37,12 @@ linux,cma {
 			linux,cma-default;
 		};
 
+		ele_reserved: memory@90000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x90000000 0 0x100000>;
+			no-map;
+		};
+
 		m33_reserved: noncacheable-section@a8600000 {
 			reg = <0 0xa8600000 0 0x1000000>;
 			no-map;
@@ -259,6 +265,10 @@ &usdhc0 {
 	status = "okay";
 };
 
+&hsm0 {
+	memory-region = <&ele_reserved>;
+};
+
 &fec {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_enet>;

-- 
2.43.0

