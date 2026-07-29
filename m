Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013064.outbound.protection.outlook.com [52.101.72.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6E8449B2E
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 09:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785318629; cv=fail; b=Wtcwnz5n1CCpPjBAKGr/vl792JPgNfXDfDKPxLbpo79OugnPr9gA8eFjIG7UDFcmbJEA2yR+aLE386s+pOm7DIvYPH8LQADK5Yq2lbcGzyWE5hD4q8pgwKTvhrAPnMNYWusMco5yorku+IDFVa70012LN2rZQtfY2E4Pnn3pcj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785318629; c=relaxed/simple;
	bh=WweNHDHiElH8o82jk8npSceeFRcm3zMBKegXgf5E3CE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BN8cGHYUPW2EUWFoSeFfvJ59JF2ZAyNUg91V9siywOyKXXp+6wSutN/XQnhb2GBrJcMLxFJX/bmnepFbEUIZsPSbN0Fm2eJfGFrJZYvjy5lun4VId8VbjHiGR1G8NnUcAGNj4ExT3jtLz4giPsHuDQz0XKqJHLjgeYztllE+duY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AybwMXyY; arc=fail smtp.client-ip=52.101.72.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AybwMXyY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CCmUVto8y9CzNLHE6X8dKjmGyzR7lAzoN3E35/xT8CwtUTs2OGM6VhS8P1MB5qrbWG/i5CFlLaB9/MYC9q8NxIMejKkDg7aIFoxV4ugmZhDLqWVIas9L3oZ6W0BXSd5yAW3qiAZ20pNR5cNn5r1NGr+fdyYCF48APNd3Xb8C3n3P0GpWRa+hPAGPsPLr3xweK2uamcxRbY5+bab/dZoTHJMsX2ZDWq7UOwN8PYdfh9stDjWcxWDy6TYNcNMQY7AdDV+uGubDW/rsjkCTnDqBNqLJZdDaodIV0CcVHmAXsIdKjBzE8pb7DPpZ/HiZAcGg1fcRXyJ3AWFqV8xi9QpqDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=fJBXGG33UPHtNAsYlj9uY8GxNqw7ZpEEOAdBKQEcCUddU21QGtQSetOWIrca738ms84yqHhOG3ySecppqTSkjNPtcLuzuDxv9EsgiiODFnqFJDe7LABoJVsrbVtZahL8Wyu5FJe88Bb2U4TxCQcoZKa533AG8USnz447YYx4GC/03lsAMn1oYdjZFpAvLzMTHPeO7HcUrwraIkHK3Qex2z3pKfzuDJ8yy021Ai7HLVKlv8Bv0ECmuIBQBPzrWB5GMRudUx/rXCx/QcLHVrcG06IPiXzGULt9ZZgs8q9Xb5jv+x4T9yoqd4pUYrL9u4fq1BOBlm6ffzGYRQai7+fngg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=AybwMXyYyNzUf2Q8UuFstrtL6Tyrgh7oikMbf8AzkxPwIDpi4n54OVxjIvWbnxx7ePHCVcYYGDU9m6j6Ea2ERV3h+04XAwj6jG/iiqK0rchYLP6awOcZB6nTSCRXtBGsIuwnOxK+tttaQx5n1HHp6KO8lER9F5LlLaxx/77nZJzXoZNu3MBRAmEmVhbHbDyLf0hz1c5TuVsgD4SXyR0rRFVb0wHFWqsxQjEplczSEAL9TqrQ/r0+W8cmGbRIiZYo+R7iSbvuUSuJIL31sj8iPWQp3wcZk+YRrTWKcyyGm/Llxermujn2XWMRydYzNthYFHhT60BvukpMCSlOmTjzkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AM8PR04MB7889.eurprd04.prod.outlook.com (2603:10a6:20b:24c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 09:50:24 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 09:50:24 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 29 Jul 2026 16:10:49 +0530
Subject: [PATCH v31 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-imx-se-if-v31-2-e59af7adb784@nxp.com>
References: <20260729-imx-se-if-v31-0-e59af7adb784@nxp.com>
In-Reply-To: <20260729-imx-se-if-v31-0-e59af7adb784@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785321650; l=3245;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=T+yyPOpdxzPdIuNJ+imfCdmSEVDwuOuBb/dhiIQRNpY=;
 b=y3X/oAKVGKlKXh94aeNRGeUu78/FshzDY3RzRWnCvukjmGMEVZyp4ipmbiNjg1/WJlsWr81xJ
 r5REhcKAzJ9BgmTX387wkfpESqu1u2FmJpTbtbo09Zm7pzvBQqI1LHh
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SG2PR01CA0193.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::18) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AM8PR04MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: 21a0c5af-b94f-42a9-2c2f-08deed56cf75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|19092799006|1800799024|23010399003|921020|6133799003|22082099003|18002099003|3023799007|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	p0uyeilF5V1JCq5JipwYMNcrkaRaK2IHWfkB0wpokRMnmsr+JOyLaqvrwtVbgvdkkBhpMjGf1iBLPC+evi/Q6KA6yh/P1JLzvbHKT9QeP6xEIA6LVeCubTZsy7JG4ARmvsrjrCewyn/EtPcXgmUQsVlzIAAiaChcJYsSR+OajNTIlGMBpJnumgYjGMzu2WVD+9MS5GfMT0b6DZKJ0al+Nzu07RIdUr9y7TDq+UfqKqeWlBzTCO0GyWOSAO4GbRXDeGPonkhFnG3ayLaIRw86NLFSloQsPwKd9pWzA+5OjNoo6ZB+2c/eusbE0+IoRYsndGaMC9/+YHT1BwDCmN8cVfu3FLhh1uneX9O7rnw4w37+L+1OuQ+Zf6p+SPh449RtcuVL2aflq7KXgJAHAFpquW3XOaMuvFTqQ83wwAgilMRj/mEXAjWTMpNDvIPhalW05KJpSh0J1Eu/PWCaaYVHCBAhovhyvDwd+kjOrWGZx3u4jdYJNu7N81dAihYtZqRBgnv61yHb3Nfhe7k3mBqGqfNVJTvI4Pja5TRGqCKRNFVuQMwzw+6w+XC+fGHL9aifqZwg2ALAuCYaabpVyO43B4ZHTCn6NMztw+/g1zz/GPwsvIafw1YAuowSS9hvpI6uKU8bHICa/eD2IDpiCZYJhKyOapcx1xpA0dRVLA0JbaA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(1800799024)(23010399003)(921020)(6133799003)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1NkU0dPNUxZc093VksxTjhVQU9DSHhpcDQrU2pJR0ZyT0RLQTV4c002dHhy?=
 =?utf-8?B?dG9SdXpVRXJGWUppb010RGJzWmRyR05JbCtHU1hFUkI5cnpsWXRhbnNuRWRm?=
 =?utf-8?B?R1hJWWtNWUhkY0pJL3U3d3poREdCd3lPTmV3Ri91YzJseHM3U2czSVUxNFdL?=
 =?utf-8?B?MS92U0NtYzRDRXh4U3RQdDFsQ0VPdW8xVkI3QVBHSUZiZC9uTFhlTnBGc0lu?=
 =?utf-8?B?MG44MnVKZ05qZHU5NTRQUmtkc0ZST1I4STlTbS9Yb1ExWm90MHVWKzY4UnBW?=
 =?utf-8?B?VGEybk5YaFJSbzhwRWp2RWVjOEdDVjBYSTlBYmRGb0xEbW1mNExvb3Q2dmJJ?=
 =?utf-8?B?OUVLaWxUNUZyUlo5RGZtZzl4TU5YeHQ3b24rTE14Z1pKOEdDSDJyNEN2bmIx?=
 =?utf-8?B?R1loQUREd1QwRGZuaitUSzZLVUpVUFFGZkZTMG1WVnlmaG1Dd3B0UUtOdXFk?=
 =?utf-8?B?V3NSNmh6YmJDWWlaaXR0WjFJNmIvMWhxQkU5cW1zdmxXVXQ2V2xGVDdWb1NK?=
 =?utf-8?B?VkhZcG1reXEvajlkcGVaVktQYTloRlFPdE5KS3kyRS91eDRmZzU0NWxBcmZn?=
 =?utf-8?B?Ty9xWEkxd1Y0dENCeUJkTXNwMEFhNjdWdFNKOFRUTDlaR2tKL1NsaW9hUllM?=
 =?utf-8?B?RWJkeU9rRVNxdmV0eDJEbU5pVEFrZmVnUUM5YXBoamRtN0RlYjBaS29ZbjFM?=
 =?utf-8?B?Ulh6NlBmYmFSRkVYa1laWUUzSXVQenpDS1BIV0ZDcDRIUW9UTVBBZnpUNG9p?=
 =?utf-8?B?LzYzWHJvVnNuUWFQME51Zmpic3o5cmJvNnByYkRnLytrODM3cXk0YkloNXFE?=
 =?utf-8?B?cm1oa3pVZ3hsME9MZ0x3RjhoN1FmSWZUNVNWS1BiNnpwem9SN3pVQnRtMG85?=
 =?utf-8?B?Z0R1SmJxRUNwTHA0NUFMS21wa0FuLzRIWjI3Z1lCcUdPd0xYK0t3OGxTamYw?=
 =?utf-8?B?bkVERlk5UUNKK01WNlovTUtXSXFvYmwzMUdvc09wdENKcmVzbGI4REQzSWlC?=
 =?utf-8?B?V1JFMk9vTGtTbmFQa0ZFd0V4ZVdnODg4Z2NkcmZrRjBvTDdUN1ZMRFQzL3FK?=
 =?utf-8?B?aXdzSGtVSkZ3YWw5bkdrYm1qYmJRd0VPdVRWSXF2cXFRb09EMlBBRzlZYWo5?=
 =?utf-8?B?Mk9PS0YvVk9ITkxGRUdOdFNkNThXS2cvQTlJd05NUWV3aG9xOVkzcXVaWHlH?=
 =?utf-8?B?SnUxWXQwdzU3RWovTTN2R08yYzhxRjNWUlIvMXVvU1BGOXNrR3VYSWNpZWgy?=
 =?utf-8?B?amRDc1h3RkhMUEdmNlcrZkVlZ0s2a0pOZXJ4bzNoajBlMEdidW1xREQycU9L?=
 =?utf-8?B?RldYMlFTUnJuVkx0M1lwRiszVEY3Zy8xcFFyZFo2Z1VrMmVCZFNtRm91MWdT?=
 =?utf-8?B?ZUErWkhMN1UwclpjQkl6LzBhLzQzK1NyMXZJei9UUytNVG1IalFlK2N2UFJt?=
 =?utf-8?B?RmprNjZvT3dTcjc2WHhjeVNEZDhGOGNmUHd3eFRsMTNubW1ZdzZCVWdJQ3Rp?=
 =?utf-8?B?cnhDTlpsT05OV1NKdExteldPdkk3MUpyUTkxT0NuVlQzckRoaU1QTTRaMXVS?=
 =?utf-8?B?Q3RqSkJZblZpMzdyTS9uL2tnZ25FeEpKU2o2a01MOSttRjdyZ0tRWDJ1WFJ6?=
 =?utf-8?B?Qjh6L1MyRUNRZldiSk84YmpUUG0yeVBqMmhRbDY1S3d2dHlnYWxLMUZadUpR?=
 =?utf-8?B?NFhscDN5aVFDT1dIUE5WQ0JaMG52QnlQQXM4d1RtYUpXOHVRTWhUeFZzWnRP?=
 =?utf-8?B?RWMvVmh5SytUdGRrTFM3SFF2RW1aNXE1MjBCbld2UCtGZHkranJOYkNITmN2?=
 =?utf-8?B?bDFUN2U2RlpuQ3NxaDR0Q29OZTZWcG90ZExVeHhFVER0NFV1bTloRHNaSUtX?=
 =?utf-8?B?dWFaQ0Z0WlBFSTZoNHpNMU9BZGM1VUlWb1c2UVdVMzZPTDFkdzNtK3JuR21W?=
 =?utf-8?B?TCs0dWxZOG8vM0dqOXFHNDN4b1Z2Tzc0SUJpNXZBSVpuWjVLT3B1SjJzYmNE?=
 =?utf-8?B?aFJtUVNqZkpLTmh6UmMxUStJTUN5ZUlKUW1PYWVHZ2w5T21mUGRGNmdHSU1J?=
 =?utf-8?B?eEhab1Y4ZWRKZTFnanlKeVZQM1p5U2pwZS8zaXNwMTFxU2lBOGIvdHVkVjND?=
 =?utf-8?B?MXhHeEVyMVJ2b2lzNGxsSEQvVHlRajJTQlNaWEVLNTg4S25BUkNFMXQ4YnZH?=
 =?utf-8?B?Z1VESDNuc0YxRlVXRVhwT0s5Zy9yc1BQa2F3MjhJRXNPbE5ZR3hkcTNVRnJq?=
 =?utf-8?B?NWxtbGlGVHFMdHdtcmphNW9EVUJTa205K0dLQzBoOXZWQTdIekxpd3dIaU40?=
 =?utf-8?B?R2VPbEhtSkRjd3BtZ0NQYWIrRGoxaVRNOTNqVGQ4bUpPaURKSUxBeGdkN3R4?=
 =?utf-8?Q?mBSX4OTU/d6kCs/vB8sPu1qeRGGuyvhENRP9B?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a0c5af-b94f-42a9-2c2f-08deed56cf75
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 09:50:23.9807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cXApyyZ5ru3DTkNmR2L0ZY5BgasfGaJJWdLTXzMPJgdhVA0UpZ1FDifAHsDyVQDBOz6GP8S6LfKzklGDEvJwadqPjbg4InXNolHer6CpcH/n/nktPh/d3mFfbpvWLusE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7889

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

