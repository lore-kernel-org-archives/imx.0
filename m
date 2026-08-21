Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011071.outbound.protection.outlook.com [52.101.65.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C772F616A
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 07:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787297530; cv=fail; b=r/Oo841VyowTZxgZs4x6EK3w1fIDApTZI1Nhc4QDuA+nSCO8lQvgnlNS/21Cty+Q0h45z4i7lru3mePTCFXJ9HHcmHj49sTmbNEAYRHL66IHhJdt45xb5qyfebdJdW8UrTDHqP3LE49oaVlh3Fj2n2E/fyG4iCef5elkIMSxLbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787297530; c=relaxed/simple;
	bh=WweNHDHiElH8o82jk8npSceeFRcm3zMBKegXgf5E3CE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=E2X7zwTXSz6v1IanvTajjh9m7BlFfmmCJSpY8AFqPZyEO55UBDnYC9iAxJVxVFrUveO12dQUKA+O5E3nq6XaVj69iRZ0vOxSY5TJl0L6fGlLSzBR/D7Ar1YeCmQuETA5jKCX9KY+NG+2zeRM4VoZRHZY05huwyEQuAFRnOZzsq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZEOuNmX4; arc=fail smtp.client-ip=52.101.65.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZEOuNmX4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xKJpWY4wNC3/UZCAmA0uhPHn0sa0F5YYLMiqRr83jan0ywFExew/QSu8hxHsITkC4d/u6IkA0oFn4+/Pnrgi6/ahvLY8T6o1eJrLxJyNMPlnrjP8QLJJQ4agTMnTyFMzsEtQjTtdOawAUFlOyli8HWova52415FztM9dhUvI0POxu0JuvViwCrHAHEPCeKaI5GhjB2m6JyS/bTxcyKFVHG7SPNuZSsGFzcX9XmIJMzXTsJJhDiVjEijtkCwHza3RBiMVjd6aNMXayODnM4FV0kNXA5QodC3xQnGxWgSm5hwokfp33AQQPIIzuaTPTSudKXNQx3ld3ezofmCQYsg2XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=hgQ8hPaj+j37uh4ngSsiUbrOl7O7ZVKHh1i/H053UFmUmZys1rZLSyQAjuxBUuaLii5iEjnV2rNcI34I4a+c0SJc/JqviRxAfotgfRaa3H79boe+099Z24YUmsw9XN8UHg1ugdRCBEha9unAuc/e6BuGnocOozvd9XOg90afirwjx51BMJUHKWcmJW/qQZ/fljhKYu30MqFcmUTtYdNr4T5X7IbXq046XaadjqO8s0gVlfmkeLvY41Uw49+n6t6QEj2CmCOGkMo0NgNFTfcoRQnl8XunAFdiT8p/MVVBPTpvqCCxinLeGWDJQZK6cCZ8wrUC9A+N0njnedE9+wF1gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=ZEOuNmX4fEct4KOcCqQ4hN8fGGiTFWmPWch167IsX3eQUYOiNRJWP6pvf1kVVv0W0Jtg4/gJOnrOrLI3H2Z7qzdnOHDIsFav865n7npegJeNNpflWebDhfcawNdNN+HQ6YW23qKfjPIIkVJ+W7yQCQ/J3S78ZZtyVWjF24YwCIiNQZT+x2tq9Dchbb+U3wwHWS09p17hDphlD5T8uNZiqMPhoijOARahQLymxi2QBl//sgJXxSIXHmScSRJJ4jNl74HH6+wmKfpQqmV9N0I/Xq+Nk/RcchqKGnav0500IhhodmcForG6OxnKMyh5gLWFebG5Es5KDsaUQLZYZzZa9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by PA4PR04MB9392.eurprd04.prod.outlook.com (2603:10a6:102:2ab::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Fri, 21 Aug
 2026 07:32:05 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 07:32:05 +0000
From: pankaj.gupta@oss.nxp.com
Date: Fri, 21 Aug 2026 18:32:19 +0530
Subject: [PATCH v39 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-imx-se-if-v39-2-41e4257c2afc@nxp.com>
References: <20260821-imx-se-if-v39-0-41e4257c2afc@nxp.com>
In-Reply-To: <20260821-imx-se-if-v39-0-41e4257c2afc@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787317340; l=3245;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=T+yyPOpdxzPdIuNJ+imfCdmSEVDwuOuBb/dhiIQRNpY=;
 b=IHnVZV7Ya7zBjci16JPwu9xatjL6sykF1EPsjXcVMCjU7BUt3ld8WBwUUokK74l2K0sLHho/z
 cFm8npixjPBB5c1zpmJnNIzm+lnFoIlwClzUlrYMAvQbCWwAMzy1hL9
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI2P153CA0021.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::20) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|PA4PR04MB9392:EE_
X-MS-Office365-Filtering-Correlation-Id: 07b9e12c-89b9-4a30-2047-08deff564c91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|23010399003|376014|19092799006|921020|56012099006|6133799003|3023799007|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	s3A96bquPbJp7qMzAfrKZ1QziYV88J8opoYZ8ABFfhAPDj5GGTBYV8cMcfSgIaO6QRRQYXnh63GxzPGdIwmz6f2tDxJlHGycNN0fNeGkWYGSg1BbVhULc1Tpp2dLIBQGqtec07VhMZrD6T+1HoV+xShWuX+J0RPYIALVFGBk3YcReFZ8lI9aliyIlKlTI+S/FNT1Yofnpxajb34fk3MatCbnrbcd/jhWIKZ0lcOV/oGeVX6Ac0e6m2GIK3RdRLpMI2TEyi4YWLNYu5srKVWiNCEBp1Sfj9bCm2fZdWl5kch5BGPv6wthLZ/aGUluTJpZvw0+A2ee7NyBIUbXZwR/jc4463Z587S0lnUO/W2y5MDeBmwlfwYml/zhn8Bs8gTBwS0GONEd42uGCnvkr/zjDomqV0t3rGVOGfDcahqSO0vlitBnMfpWcNaoMCjnN2V+3yY74fNx1B38EjupxH9m/K7eTFimYEQaBFoRngcsnztTceBMruWGY9wOppJ7GfsMbb3YqeO+lktZ4izk0VEUy77yvV6hI6XICRyF8eYnKza0xN/ORCUbnjTUWM8jlZCfDSALYAuW2rkXIlRWA5bqktKaXvWuBfyQFBFV8OrAdy0nMu0ioXYwA+UfcbUmy2Uki8dSG6GJ7GkVZHpfJIq8XT92qZ+saVY1vlp0AALhy9w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(23010399003)(376014)(19092799006)(921020)(56012099006)(6133799003)(3023799007)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGNlUm1ma3BJRWZGMk1Tdmk0UFlmQ1R4U0pKTEFUeXlIMThyb3JhZDlNZXQ5?=
 =?utf-8?B?RXBKV25zMHBueEVmTElzakdlL01MZWNOd3RQVkJsNlFjZ2FvbHFleVFoMWpR?=
 =?utf-8?B?bzRLdkczWDBsRGtiaDRodnBMWjJXeEx3d3l1aU1nZkdXKy94Z1ZuSGRKdmZG?=
 =?utf-8?B?K21zZjAvUmJaTXZOaE9XY2Z4SWdiM2owRFpPNzRoSWNWaHQ4OEl3YVdNdnVt?=
 =?utf-8?B?NzdYdEhVRFhzblJzMG1VWTd5S1dZWXpGV0Qvc011SENiZmVxaUMwUHZuei9S?=
 =?utf-8?B?SENrME1NUXR1TDhMVjlZZkljNVdwMC96bDlTcWpBSTFSaFU2RlkyOGRFdXc1?=
 =?utf-8?B?a3grMEh0UUp1NEVIUUhERmw0NGVrM0c0MXBtNWwvWGcxMW1SQ2hSbWdwVHhT?=
 =?utf-8?B?ZTZnZHFzK08wTWpGVEZNSjRUZHYwWlpxVGNVYUZzbVRQY3hyc01XdERRRkJK?=
 =?utf-8?B?U0E5bkxmaFhwWFZMU25YbU9sUXRuRys2SVgwUVdkQXhWV0xmcE9lZDlOaXZW?=
 =?utf-8?B?ODZQSFpmSDVrWk0xcXJnMUpUVGVRcEdheUs1clZqL0RSTVdEbFdETjRjSHFG?=
 =?utf-8?B?R1NybVZ2MG1qZlgwMkt0YU1uYUwzVXZzM3ZzallxZTViUGpCa0Y3ZVgwL0pX?=
 =?utf-8?B?cDlTL0hYSyswVnJkV0pteW8xekZ1eEN3ZXpSMWFVTU1BUU5LbDNWOFZBRGVE?=
 =?utf-8?B?dEZESi9jNTE4SG9DUDdUdWhlUlhERTNGalphaUIxOXRzTElmdjMyckwrclRP?=
 =?utf-8?B?OHp3b2dGdkdwK1QxUHd0V3UwcnM5ZXhHSU81TG9OUDJpQ296SUdycnVTdHZG?=
 =?utf-8?B?bzBvK1MzbngwWGUwZ2VKMDhkL1lqNXhTci9CbktYSzNwOSsyYldnMEJqY1Ry?=
 =?utf-8?B?NGNiZ2pvbG5EZkttb09qT1k2eER6WmJLUEVJZVR2dVNLQnhqT0J1Si9rS1BE?=
 =?utf-8?B?NC9PTkE0aTRLd0doK2VvTEpqYWwzaHNSTWZ1S25tMGlFVlhQQW5MSjhTbnF5?=
 =?utf-8?B?RzB1WTVidWVpQ3NRbTE0T0dhc2p2dVF0RFBaT1pDM0V5R3pJeS9wbEhjVHVl?=
 =?utf-8?B?eEhqOFZyU1liaC9TU0lEalY1MUNnZGZQeUt0enhqTU9jQ3hJRjVXakFSNFd2?=
 =?utf-8?B?RG1YYVFzYkVyTXBUUmgyUFlUTkJBanRVM0pFS2E0TTBHSm05b0JMSEdzb0xK?=
 =?utf-8?B?R2JTYWx0RlZrMmZ6WHoxQ0tvY05wYTJnMUZiTytvd3pwU1l2YzlmWmIwSCs3?=
 =?utf-8?B?YkcxVFJxYzM2V2tBajJ0SXliN1VJWnpWMThoaUd1MGR3UXFtK3l0dzNpMFhQ?=
 =?utf-8?B?WXlQa0tybXE2WUl0Y3AwM0sza3hpNkJEMkdnMERRU21yekRxWmRFcFF1anFq?=
 =?utf-8?B?SVltSWxhaTAraTE1ZmFDbGYybVNYbk81dUM1N0hHeDJUdHNVSVl0dk1CZlN0?=
 =?utf-8?B?TFJqdXo0OFFYUDFRa1F6NEZ1SFhNRWNzV0lzVFBBTTNLeG1yUG1ZTFl0eHBm?=
 =?utf-8?B?TERJM0xjTld0bFozMmNSbmZtczdIUERnZDRST1pyK3QxS3RzUm5uTzMyVWN4?=
 =?utf-8?B?SVFHWnRDMUZrUEt6eFRma0EzSXVtTUptSGNacHB2anhncWs2cEMzdXVhaUYx?=
 =?utf-8?B?dWdZdjNUSkl2NXdVYm4zTXkrbjZnWnZ5WUZGMm8zUkpsNVZpOXdlTEh5SFFm?=
 =?utf-8?B?NDY2TTBzMFFBTUNyTWphZ2tOOEtJZnpZRWJXcGxjUWszT0RqZXZkU0laWURT?=
 =?utf-8?B?eUR3Y2loaEplTG5qdXg4NFdDZE95azRHUFE3amVXNXVsS3RQelNrOW5tdUhX?=
 =?utf-8?B?UThjSGtMQzN0WEtWdHpKV1MwUGZxUEpUOU1lK2lOUnRMODBUbmtuL1NUZ1dB?=
 =?utf-8?B?Y2t6d2FqUmNOOWx6ZUpTTXVzbFBlY1N2bW1lWXBjYTNVSlpldWdvRFIrOVI0?=
 =?utf-8?B?bWY3TnZDVnRnVGcxWHY0SzNYTEVjS0tNSzBHSUZUN0crZ0Z2VEFyL1pjL0xZ?=
 =?utf-8?B?czVrT2JkOER1YWVEQk1ERUh1dWQ0YWZqM25wU0RDb0toWDN1d2s1aFJYbXJT?=
 =?utf-8?B?b2JSbTVhTGxTTWJaZ3p0UWgvczBkZ2g3dGd3RXEyckwybDRkNmhhVktDSEtV?=
 =?utf-8?B?dTdRd2s2cnEraVE5cFR2YlMzTW9td00vdGpTZWZPWVVDamxOMWJDVDQ5eW9H?=
 =?utf-8?B?enRkT0swdk12Y1Y3akI3bXdXd2ZSeGZNQ2VobklsQ1FHaEZhVXpiR3U3eW4y?=
 =?utf-8?B?UC9NZTFWaVBhOGVLTHJYdThXb2R6MjlOTC9oaFNXWm4vZkF0QlpNK0pHNzRp?=
 =?utf-8?B?Ly9McHN5N1VQZzlBVVpyNVJUeUtRRHg4ZDhGWjkySTNYdnJMQ0hVVTJocnVE?=
 =?utf-8?Q?xtwGAY3KEMKZNrlbFJd2WKIiVYgmhRl++dFkM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07b9e12c-89b9-4a30-2047-08deff564c91
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 07:32:05.2734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gRYKbhuKeybmB2Ul1Od6LMuNniQSVtn3UpMC1VgTBxRDlo2Zj8o7XhJpQlckuY9TVOZeBpVBl+0Sg3b3FkhAxsEWVsPwt3PPwO6DhQ65Yoi9GXCqTClns4Zk+wVlk4aQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9392

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

