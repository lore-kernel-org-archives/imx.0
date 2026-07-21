Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013001.outbound.protection.outlook.com [52.101.72.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B56448A2AF
	for <imx@lists.linux.dev>; Tue, 21 Jul 2026 10:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630009; cv=fail; b=Avlu3TQ+JCUCXbtW4XcGsqql9dIrdl2JG6Cs2Ag7h1iPT4YUPLmM86QXv1+soyYM8MaQFL0SMi+EjFb+2ziPNchtu1//C9KOlVE7vai/WisE+iYtWjzfNi60PWZLLHFOxYyNP5hJJr+G38NhQ7LAHS3cuAtzdJ61JZ5LaDOHeo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630009; c=relaxed/simple;
	bh=WweNHDHiElH8o82jk8npSceeFRcm3zMBKegXgf5E3CE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=f9rCp0ZQV88GBcgCuYfH+QSAJehtBcLwiUUd+CK+2wLUkwJadhNDR0fVdWyDlFZ1FQk7jNDrGlGmN+fV3l0LXkyheuy2KPNYW3Rt0izqvze5MJDqXDZg1X09DuG7tY9a8fv1SLyBJwZLJy2vcqM4slyWhjXqu/NDn0A8ZT05CBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=It9Patsb; arc=fail smtp.client-ip=52.101.72.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="It9Patsb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uzW+u/X7FCx7kMX3NPrkVo4wCl4OY+b9X3+WgMZbjsvWlUOMkRWhDc8EPNLxilXd2pkrv0505O52237h7eHGnMwEJGNB18ppX9noRnHVO+uCG0xAu49rtck30yb+PMRNPPlpNg7mboIVKeNhLKC2oVT9IDZz9VpiFp63Y57kP/qXoIDALUQ9pdZSWaG/pNAvBXo2gost3mToV/jNp6b+tifwg0eVINqdkTQnC2fizw6L8ipemBByAElaapRuOWLGWLSNhZy7loDgD19mQRo+UX5f9NFoeEWB/2XzXysr20UHIxsJ2/R36SvRn+xLqYMz+acxkCNNI63XR9iQULpE3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=cFJ42UUVlr+3XGE7R7LQWUa3/7QeyNXRgDlDUtvvIEs1q7WUjDBVCwKgOxBw/1GQH7ERGFc3BjaHqsv0EEF6sjTTalgMuyy/+WTUL/QMUoSchk9EI6n1CA9/QIKwtggEDvlGJCgJo1CnlwBRCJZq2fECiCghC0ULfx8Jsmu6/0HkMabbCtcySjQN35D8PF5fgnqScuJ4FHmsM4WfG1fl9UuDSS8BkB6YL6fpQPS73UeM7UQsmuXvfNK0qykTjm37KOToPIVP5WL/boQv34xMAB/khGLJob0ybvEWvH6PCkim1ScvTug+F0tQ76/CUtgkM5AkYqZhadkgisij/kYdPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=It9PatsbaUB/r8TSTW98iSfhrT65mFIogqPT95IPEDx72iP8VRS12Y5dcVxU81zg5rMQUAgnvbK5oWf1qqBi3YzQNEBgxAyJ59SqSoTMsY2iZh7zYnWAkLrhawsHVA58rpAnh2bKPzriu2+Hwst8/3onE8rtPVhvnzMNncxA2vtTKOiVSE6vV3MhRRGLPzYme3yfFzVuJ6FoRBJLBjz5VYJ7aRccrWxCb1DO4iT5qyVxPobazUVNp0t0UvbkX50FnPqjZovzMM7AkQyJgEVgGZDqiLb31vbed8SkGbQmROw+UDNik5FcUC7g8bFvUT3otXwciVhbWgcJFe2YNoaFrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by VE1PR04MB7231.eurprd04.prod.outlook.com (2603:10a6:800:1a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 10:33:21 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 10:33:21 +0000
From: pankaj.gupta@oss.nxp.com
Date: Tue, 21 Jul 2026 16:53:33 +0530
Subject: [PATCH v29 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-imx-se-if-v29-2-04a362f4fcca@nxp.com>
References: <20260721-imx-se-if-v29-0-04a362f4fcca@nxp.com>
In-Reply-To: <20260721-imx-se-if-v29-0-04a362f4fcca@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784633013; l=3245;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=T+yyPOpdxzPdIuNJ+imfCdmSEVDwuOuBb/dhiIQRNpY=;
 b=rChFk9y/rKdu0QVhI4+zsyKVeI2GHLgcOqJCggm9EyBkxnZvWi63aF5DNmetf4oTlMYtAKOQy
 2BFj7k7AbOEDzwZc2GU8r0NddbuChAwpSDn5FM4VNziN6PsBPUpB3k0
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA5PR01CA0215.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::19) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|VE1PR04MB7231:EE_
X-MS-Office365-Filtering-Correlation-Id: 380c7247-d331-4978-b894-08dee7137c4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|19092799006|23010399003|366016|921020|6133799003|18002099003|22082099003|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	NfCCZfvgDKVANp8VbPAwhIL3onYAICxzkRfE2Jp43nYef/Ta+kS90LX2kZy43x9LLal3VzrNtTMd+fGs6AMi1zc4brbM9HW1bxM5KqgFHnnaW51sW9c5hmGX01vXInSARvaaq6qqN9uDM43+3Q31ET0Ep2VGGQJOSoZqwbJ34HMcLeebIFh2JvAaQyofDAfjcjogjORbVoCwNLGawg9Bo1pZnKhVIxbSkSzXp6XmiSGtaEZwV1mWpjq4oAzyWnGrH3tVOGgUCaPpZyhPiS8G1z8jx2AotIM+f8c2lX3ID/4rrr8VvwiwWUN1a9PDCH21GxWLLuh2xGY7T53NfwjZJ6NSrLsHqy7wi2E44NzycuYqVhoOUMLWnozLWgKeIYJlSyfuTiIRSpAFkUXwt0KbiNqs1zRQtsqSZjc/fAB2jcPih6AAbnHyFc1XgQKqMr17u64uKBI6N/+2wc+X4K0xwb7yKL2tIOTqTQhHFOvpLnmJyms2XVQ6ZKnX5cq3Dpp4LrIDJZNKzMcIUTgHZ9XxVqO2Z592tJwSgpNMNEx+dOVcN4Hc11gdYZ7QckhfouTnRzi1RntEiCqmxN+PZ6G6cK7Z3B9bNKXAcQAq61GhTMThOijXeB9jNvMUmbNxrh7muSpGFvfsB6c0fv9EskWQpmS9wHgZQNNGsewwYw1q/g4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(23010399003)(366016)(921020)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGhOeURHNFBqdUR3Q2hzYUJwb1h0WE9ZL2xGVDYwVjQ5eEJrNWxrTXR5cmRG?=
 =?utf-8?B?eGR6SWpDNHprNzZ5NjJWbGVLaWJ6cXh3Rk5pTElsMlI0c1lKdWxpaFhIUHZF?=
 =?utf-8?B?Q014dk5Ga0NPSkUxN0o3NEdZSnUxZkVBRXRPVlUraTBKeCtxVldmWnordllo?=
 =?utf-8?B?RHd5K3V3dm9ZRHBudTk4MjFUb2R4Q1NOSGh3YmpodmU0Y3NFdWlnME55YkVT?=
 =?utf-8?B?bGNwZ2pPTDJQL2tQa2Yya2dFcC93NHF5L2diMWVRa3VOMDNxR1ZSeTA1dVQ0?=
 =?utf-8?B?VlRoK21GNy8wVGJ4MHlUMHRPTUVkZWxjcDdna0JmcFdxRUtFd2E2MXQ1Z1dQ?=
 =?utf-8?B?N084TkVZTjhkcUJyWEZOTDVodExuelFFRzhtY1pPMGVSOC9XUUhDZHp2NlZn?=
 =?utf-8?B?bU1PUkVrMDNCNXlveHZ4U3hLTjVMaWtTQTdaNEVMaGtmMjFDYUcwcmY3Sjgx?=
 =?utf-8?B?dURnTEM5Nnh5dHJwcFY2TzRKaVZleUtRc1hwMlVsV3NUakVwTUlxa2FJVi94?=
 =?utf-8?B?aTN6cmhCVmFma2VraDFodlQ5Q1lWNzB6M1dMSnJnL3RXZXlrcWY5L21GOXhw?=
 =?utf-8?B?UnBsMGQrK1dtUUhGdy9mTE1DRjIybGFGYWNYQ2FUOThiUTZPL2xmeFFlaDhN?=
 =?utf-8?B?c0N4S1VNMlpueHlvdXMyeDNGeUdSR0I4TEs5VUJrWEpDNld6andTVXMxRkRI?=
 =?utf-8?B?aFZYQXl3RVd4RE1iTEM2QXBLS1hKd0ZENlpRUUYxRitFZVM1N1lSMGtMWnJO?=
 =?utf-8?B?ZjRDdVVDZmp3M3Q3SVlxeGdjcEtNbmRwQmZ3YmI2WHVtOUNPVHVYeDdUbzlh?=
 =?utf-8?B?QWRLbjlRRGd2aDUxWUxWRXZUYzhOL3lvTFVraVhpdllabTZxM1NmbDIraHp2?=
 =?utf-8?B?aVR3ZmtEZkJVeFBRcW1IOXVyYzEyZzZ2UFZyWTNmaGdtY3J6RlhSQ1I0TThS?=
 =?utf-8?B?Zk5PZ2d3Nm9aM1Vwdk9YTDF2TkdwdFlJVXRadTVIKzdlem96QndIY3VsRUJF?=
 =?utf-8?B?d3pzQmo3eUV4Kzl1a0dsaDkvdzRxUWNwU2cxemFMUFM1MVZSaVFnaVkzbWpv?=
 =?utf-8?B?dTgyYXM2bHpqSnRwclhNTi94MzRpVUxyY1NuU2lrQmh0c2JTNVVxNXNjTFBQ?=
 =?utf-8?B?Z3hra1Nabk9HY0xrb3FIc0VWMkh0M0d2NkdnRlkvUGM4dmJSWXdWWnVkOGI3?=
 =?utf-8?B?MG0zdTc1YzNNQjFobjBrMlNyMm12Y1NoaGk2QVk2U0tGaElhcEVSWURCS2ty?=
 =?utf-8?B?UVViSWJIQ2dEQzdkdnAzSVYyQ3gwWVZxMnI2WXRCbVZQc2t2WktuS1UxR3Rv?=
 =?utf-8?B?TVNsWncySUZHZ2VZQkNuQzBGVWtPekpRWGVRUW5WYUoyNFlXbklPVm15eHh4?=
 =?utf-8?B?VEtyTHVyUHNpb1QxRkNiMlJrajM0WFIzeXRZWEJ5a3UzNjN3VGFvUFNLb0hm?=
 =?utf-8?B?RnZBUVlVSkJKZlA2OExReEdFVXJaOGxnYVYyQmZpU2J2ekpKRTd0V1FMRjcx?=
 =?utf-8?B?TW1tM2JYZ3Q5ZUNTakJTRlpuclNXa0IyZ0JkU05YSmp5MnE2Sm80aHNRMWtu?=
 =?utf-8?B?ejE2QkVQc2ZxZnZJSm10Yk1rY3lyWXlnN0JmSHVLKzBrZVRtbFhjcXU5YUNw?=
 =?utf-8?B?U01rNXdyaXN5UDEwUU5GMnNRMW1mbFQzMHBnTXNTT1B6VW01SzlrVHZkT0RH?=
 =?utf-8?B?RWZEeEZVZzhHbVpYSzlLUXBsZzhCMTB4ZkpDOGU1THQvdTVnWlNwUEVFdENr?=
 =?utf-8?B?TUR3dzh0RFJ4clg4RWFlRXdTUWFmZDk0L2xZa0l1Mi91MzJuRDFrMDJ2NThl?=
 =?utf-8?B?ZkdSZGZVTFNGZDRmQkVPWjdMU0dyZWRrSGRYZitDb3JZOGJPTG5wZTlIMG5F?=
 =?utf-8?B?Q3dFSjM1UWpVckgvV0M0TUZLUy9pbWNEQ1RhNmdNdkdFbFZQUHlCRi9GNFdT?=
 =?utf-8?B?U3JiSW1uRUt5UTNIZVdTZzQ3Y1Q5ZFR6ZFVzNG51TWkxVFV0cjZZUDdWeXZp?=
 =?utf-8?B?c1FuRTZGVGJobldKVVF1RWtDSHVXdm1PbVVuTVltTHdmR0hyKzFMeUdMUVJz?=
 =?utf-8?B?c3hocElISW5pb0xrVk1jcC9qTERhdnNlamRzbXUybk9ET2NnYXd0YTA4bkRS?=
 =?utf-8?B?b1V3QURYOTVBbjFGTkNZWXVqTDhzbENIbTBEL2ErSkJiRmdkOXFPWTA2V1V6?=
 =?utf-8?B?ZEhUNlErQ2xvdmp3NW1mdGtJV2FlNllnM04xditXVVlGQXhaYVZiZkxKWXk3?=
 =?utf-8?B?RERETUlUVHhDcjZ4U00xbDVaMklCaVJMc3dicmFnSU5PdTRUMlFqZ0xVaFp3?=
 =?utf-8?B?UmJ4L0tuQjdRK0pSTVNOeC9hYWFRZEVLQ1JES1pObnNwSUZhYXFEUUhSN1d6?=
 =?utf-8?Q?Sb46jfsZxYDEhpXyEMWUalWzIJRk8QLeC7CfI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 380c7247-d331-4978-b894-08dee7137c4d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 10:33:21.0033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HeXwdvLp/b8HjeWJZI2Q87bMh0ls+2LMm7o+Q9oipjT3Oob1qr68/dD4slzPKC6V2j2lOE/naziebMnnqe3P14jIw7KeXYfJRPZSB4D9BSVojrxqbeciDRpwBH7BTAmt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7231

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

