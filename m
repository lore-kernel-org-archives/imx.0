Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011039.outbound.protection.outlook.com [52.101.70.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8AE36A03B
	for <imx@lists.linux.dev>; Thu, 30 Jul 2026 02:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785377779; cv=fail; b=ckLT3LGIqPCcLQsgTuThBzO0PVE9Co8G8+rcn2VnipHll8mRdoMvgHZYc8Nz7MdVJMStCHsVTM2c2O5stgWwGXz5ei3tiEs5TcEvzXv2YWFxOpIj7ld0nQTCCWIJsA/9LyYHDUIGBpSKlZ+LvY7D4S91b1bTWs/NjEueykTrvso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785377779; c=relaxed/simple;
	bh=WweNHDHiElH8o82jk8npSceeFRcm3zMBKegXgf5E3CE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ba3XUzW0CSJwQP1z/fZrzzGhGqN0g0nKCQczHWLDV49KhwG9I8HNwP2GiN2JAcZaSB2qCNIgL+Ccm/fJr4tElTP8aOjr+prz3oEEa/MFKpb8Q8SkR8em0kYDwwNTus5iMyWc9bCG7lJt76d4Ya29edx703Vkn9UMQ9H4zNaCWZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vaRIRwI9; arc=fail smtp.client-ip=52.101.70.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vaRIRwI9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vo21epSai6Dxbz1lD3EouXbRL91/WCxU9AZceFEBgss6qFg5AXyvw/omaINTZUeNHaeQ+zag4JFrDH2Ku2xta7Ry3p2AySOWbTBnKzWltHVPGgzX/p6S7okovnQCzEwc4mYYncI6Za767bS6YMtbMv7Q2cDF8Xy0baZ8AaEQwSpFLsZNW4uTxE5LdTWleV0uV/hoId2O3eybTSERt0pUw6J9ffj7nK1dvz6NPA6G6zbG33mUaASxqlZuR6s4GKByNdkAzwg0EhWWXZXIWa4j7DKw8Lwz3JFTjylBhSUoE3ZOouG9OSc6BdRfSbfh8JfOEzTAnPmxnimNOJG8PQBa+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=BpjJmqnmZ/RRLnRsiLLDH1hJpkOQb878JyjSQC3KqOoMG4yWf6Awu7r2SkyGp7uxIbFH+GG49a3DaVLydl3oY2TQggtI2iZjeYMrlfccgoOLFEtr051IVxMPirH71JrpKQkhP0lETBxNSCAJEZHVVuWbIzGwgHTW6CtcevqgaOCBpjk5KShNszvXk/dolQC9SAHpyV2q+I6aCESu1opbYhFqWt6BOVIk43oYEyJw6qFdOsKwr18E+ZNgLiM9ewwu3pCbmkuEf3Onvh26zKSeUpASjfuAu+Az0tf0/qwTEIHKHzVFCQrAURe0IzNe+Q9bwQSeUgkUNj0OPbKpL4L1rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=vaRIRwI9C46ViFqle91O++9wPW/cNWQuK1dvm9+85WCO9ew9eJQa2vUyD96Z30jeXdiHz6usgPGelIzr9vnrAuO509CAftPEQAfJwhYvnGAzwlaWO8hjwxvzAjAG33HlZJaxIul5fkAsbHdgjrr620whxV2L5TcpvGc7Q4Xy7lBiPjjgUL111R4K14utCyR444f9TPduL6R0s9K8TZkP/0199uENb3Cj2ZvVhckegEqq3sD77x667MJZvwx1K96KtUHAyMi7upQTfv5gzW2luFY3POCWZG3GigxTCafR+eRjLPcD+smaWbPyYKOOEFatt/Q7wHi9719P2lZxWSer/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by GVXPR04MB12313.eurprd04.prod.outlook.com (2603:10a6:150:318::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 02:16:10 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 02:16:10 +0000
From: pankaj.gupta@oss.nxp.com
Date: Thu, 30 Jul 2026 08:36:30 +0530
Subject: [PATCH v32 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-imx-se-if-v32-2-95f56dff4ba9@nxp.com>
References: <20260730-imx-se-if-v32-0-95f56dff4ba9@nxp.com>
In-Reply-To: <20260730-imx-se-if-v32-0-95f56dff4ba9@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785380794; l=3245;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=T+yyPOpdxzPdIuNJ+imfCdmSEVDwuOuBb/dhiIQRNpY=;
 b=FGIOVuL8qAM9JiesOm8tXcIKN8np9fnZak8aTN3ElcPdRoZrPc0UaHrCDGCGjqNS10j14z/zm
 ucdcnnmWNhnB0fSpKDMDCMXQfQ1SDAOXg/+BfDXwB62frKOS+ya1Z0N
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA0P287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::10) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|GVXPR04MB12313:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ee5bbe3-7b36-466b-6592-08deede0858f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|19092799006|366016|1800799024|921020|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	aThchioscIJ5+3SSpKf3AAfcL67+APsnevEjTbXvAEyVj4bXm1VsxNq8xtkWBVs0PzHvHyLU5gXieIPZ2NuWl3Yfx+cpaqUb5Pdg4IWsU1ow52IN8Fkl+XayLGteUgv/ZAKUc4DCPiROIpvjKU25szqfJDwfDkQ9qFugIKtTWEN1v/iF5IbVFrVjzNWXkJrFIv4vaiMuC94W0DBtZiJq234sxVzygLPUNEBcZOAAxd4xYkc+Iw0bT8arTqXTwotY2lIRRKGpjN4MX/G5LMNCagWaMla2WS3DcEyyRf+ZALFzgLRdJC+C2lwANK81IsFvQQm1DirPm8MiTNDmBhAGzXmwiGfALno+U1Y2Gi11Zy+Lf7agg/D9gaX0LZWO24r1/cWCdWQJQQcsunfJBuaL3l2yfJOvr5CVbowDfpZRqyuFwIIzfn0c9S+hgRz2LJGfteVwKIEchWpLnQnQcPEzVQBs8ZeOmm97AJAFh76AQUJXEtM8Rwe+TF6LKcdergid6aPDIsFUEHkdi8bzI0Z5IQVmxRvwNEDsvmW9k5/EBwbbf1BjjR8i+1wURChoMLg/ADDfnnKFJgo7aY8kePxQQta91G6ZCLioREyS+uK+jkcDuZfQKjTsE6wozS07xvpJcCgoKnZo/oAPByBo1RCJPR363tpEKXT/EJTdmPmnWOA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(366016)(1800799024)(921020)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVN6WU5ESGdPLy9ySkRqd2tiTndUVHlhRXl3R1ZUVTQvS1FQZzcwWjhoK2d1?=
 =?utf-8?B?Y0VWWGkyakV1VEkxS091Sk9MV3dlQUFWMjVndmdzUUxmMVBxc1JlSG81dGpF?=
 =?utf-8?B?ZGVvbGc3ZEVLK3ljcEsrVVo0b0EwWkJxajJPMGxEc2FWSk9YNkhOUm1Td1Zn?=
 =?utf-8?B?V2JCZmxuQ091Sjd6RzJGRnlTSk5jMGhadXI0MldIN1JXTEl3b3l3aUZXRVUz?=
 =?utf-8?B?N2FnOUFXYnBXZ2Rvc3lVR1YyRXBUNExFcWtybjdXSVowbEpmWVpFa1d4UXBB?=
 =?utf-8?B?ckZrbGxQMUhHMWxlQTFhUmR0MlNGTTJiNjdkOVdXbytxVEJpVGh4MXQwclBF?=
 =?utf-8?B?Z3JGOTY0d1I0eEZuaXh5V01ZSkc0OSs2T0RHdnM1Z0F4bGwxcFQ2cERYYU9I?=
 =?utf-8?B?QlpiZlY5TURDanJ5SW80TGM0YWIvY0hteFZ0VDZ2WjZ6c2NKSEJKVzVhNXZq?=
 =?utf-8?B?bC93bm5NWnJYaGUrTDZTY1Y0REtGZTMrS0dNaTdxemp4WFFGU010OHFsRnMv?=
 =?utf-8?B?WGVPdVdDNm8xcGw4MXA2Z05MR0twUlJIaFVVUGFMdmRkNGhmZ2NrUWc5OTZ0?=
 =?utf-8?B?dHJpaU9WbTdQNHRJdXYxVzQ4YU1mbjFJalFNcStKWjhuV0t6bEFib3F0U2xh?=
 =?utf-8?B?azV5WjBvVEhoc1BOcVdvOGw1cDhucHVDNXZUVG8xRUM2NXpXNmVianZJcVkz?=
 =?utf-8?B?MHd0L1RPMkVuRE9JTjNFTU4rQjd2V3NORTJKMldLakJFdGMrZHBiRjNLY3lV?=
 =?utf-8?B?ZXRidDBBaDJ6U3MzSFRFaXNNaEppWm16alRYbFU1UkZmSUZNYXlQa2FMTmlR?=
 =?utf-8?B?R1picVgwZTVQQzNXTDBYL214UTFnZTVlTkhkdmVKN01UZmFyRmdsWlRjc0JK?=
 =?utf-8?B?OUV2alNpZzl6UGlVcDQwRHhJRmtvelpNdDJaTUJsYmdEN2FsdklPMmFMN2xI?=
 =?utf-8?B?Vm5GNHFqaExwdm9wS3hPbEtGT3RUOTc1OVJwYzZ3Ri95RnBRa0RSMlBaVEUx?=
 =?utf-8?B?bUcvcHZVa2t6cmt3dHdiQVJVVzNCTkovUC9BT090N2pyU1lmTmlVWVJPNzBp?=
 =?utf-8?B?ZGpiRUVUZzZsSnMyZ0hCcFBBeXBiVUppSUM2U1ZabWo4a3doN21kK0h6cTli?=
 =?utf-8?B?TWV5SWp3Uk0rOVAyaXdwaHZaa1RQSUhxajhCZ1NBenpyZlpSYUU4U2tsTm5T?=
 =?utf-8?B?Vk1SMEVQVzVVWWFrSVJUYkgrOWxjNzI4YjMxSU1wTi82amllRkx6cW9rY3Uv?=
 =?utf-8?B?YlU4MndZNGJKcU5aYk1ST3FuZys4ZE0yNTNsamExSm9QMzUyOU1NY2VuT2hx?=
 =?utf-8?B?SFcrSEtDaDMzUkhkUVdveVlFWkNNc2FDYTVVa0kwejN2VjhnaUNCaXFLOWM3?=
 =?utf-8?B?RmloSGRESEF2aGg5clhLcGRFQUJYMU9XQVROZzRUdFNTSTRTZG1NZ0J4ZUlk?=
 =?utf-8?B?U1ZabjBzdTNrdVFvL2lNTmlYbmJ4cUJuakp2aUhxaE8rRmQ2VDNYV2hxekVj?=
 =?utf-8?B?OWNSYWZwMHRNSXFqQytHMHludFNxVTVUR1B6WUJQeDROMkZTT1lHUEhPaEdY?=
 =?utf-8?B?WXliQVFnZFRWSTgreEE2bHBGTDlOVXZLMnhjSGM3UzdjZDFqTllEcit5Tkwy?=
 =?utf-8?B?OU81WHJNWDNDNEQxVlRWNzFRWEJibS9Fd0ZUUnpiejh6eGFiekFsbjNSSUpH?=
 =?utf-8?B?TmVYL2tnWWMvSTdRL2tTRzRaeHhaNlBvbDcrTXZyRDE4N2pVaS9ndU5KOThD?=
 =?utf-8?B?bmZnRGlWL0Y3VzdxdFB5TlFpeWJLd1NrcjA1UG1Rbk04cW9Pa0FyQWRsVFhn?=
 =?utf-8?B?VWRjSjdjMEJ6ZnVET0ZaVWtZSWJNWjY0RVRSVVd4OU5aRVdNUmhZVlBJcWlM?=
 =?utf-8?B?aWJKbjE4MGlSU2RCUHhPSmZUSElkU0ZQV3poOHJFY3dPMVdpU3p1TzFFdDhD?=
 =?utf-8?B?b1lZdVpCY0hpNTdhaE1jcXZlM0UrT1VTV3BnRFpvSGlPRWNIYWRPWnFRYnJp?=
 =?utf-8?B?b2h0WnViZlNMMDhXWC9pSmVZSllZZHRYbFhUR1dIbHNDcXlZN01vcW51ak1M?=
 =?utf-8?B?UWJXOFIxa0RGWXpMVWM4L0UraEFRVk91SUpiN2I4UGF0Zkdza3FxNUFkY0xS?=
 =?utf-8?B?VWljcVVEaHZaS3BOZGNocmVIUm9qcWhRSmovbTBtOXlnMjBoVGFDSTF4OTBr?=
 =?utf-8?B?WFhxZW1kZTRjSkhjR3A4bUp4RnF4bmh4WHBrVllDazVOUVduUGV3aUtnZFdM?=
 =?utf-8?B?ZEJNVmdieWY5MXBuQm1tZjIxNEhPQkFtemQ4V0picXpjNWtnRnhXbUVxWVll?=
 =?utf-8?B?cEpLMzRVVy9jSG9KaHcwQVA4TlM2eFhiREpNNWdaVnVFckIyTjJ1eVJNT2dQ?=
 =?utf-8?Q?AU5sQk8lTQtcTTOBRAczMF1Y9EvRgpCMWoefs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee5bbe3-7b36-466b-6592-08deede0858f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 02:16:10.3502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kSHOZo1XxhPXMMRjZsKoom0maG7OpEDAUG7X8bTRw+k5SZdr7YQLIWvrC0KcKjhx9OXKQjyvY8DZEObRu8GXD1+HahRRjm80PRiQ15DHsL7UhMdncLBbBi0i4OdA1hKN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12313

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

