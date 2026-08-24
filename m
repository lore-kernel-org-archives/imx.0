Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010045.outbound.protection.outlook.com [52.101.84.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714203A8759
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 09:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562204; cv=fail; b=TTlj1MY9lLut9v49wBzlauiBzXt8eC/RAuOlmsobUi0iriRVy1sZ9sxzE9aCp3+ll8KlrePIqfD3yit5CuG+dsKdNyivLu0RlXrv13+wGW+uEU8VlRSToMHnsd0mwwW1zMHcWxNylJColHGMRBHZn1ZFBmpCsr9TdH02fX86lCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562204; c=relaxed/simple;
	bh=WweNHDHiElH8o82jk8npSceeFRcm3zMBKegXgf5E3CE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eElCsEjcytU0N7y+xseqifYMPlf+0J8fF0jUNLmj1DC2TW0epRikVrHrXFwRDmKg0IVvsKkevvOUwo5eNIr5gP1ss0zkgW3gw1CeKr+DndN+1+MUOMorLgqF6aMRdBDTDbD3XiMvDvGW2SpWZZl8QM52u3k/KokQcX6YSsB8/Zg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KtCpD4U/; arc=fail smtp.client-ip=52.101.84.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KtCpD4U/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qEX+Mp6VaY7MWehTyyBjjDS4+QBDFt1zBKLyfJbgg3jUca7D8rghmS9/LZ/3AXP0KzzAUYWok58mgo9BsCwqx0F40wbcug/1zMHJCZaiJeYf/KrT4KBXcrV96cLXTTmHjmlPLeAaAZybddAzocDkAgd2heeWl9fH22bTAnUhTRNs/jdLgpWFlEiyioqE+QCuFjQurfaTm3pFo+th4BBbL666+gKGPtTq7D8pKO3Jfl8HdQaM8/yGukhy7PiP6Dq4XGUXHeK5Y9nDdpHR1oUeYWS0u0nRhhkfVec3D116lBi6EVjnQLI1yhIRNAHXhUE0jUPepFcYEEYdHU2ddGEMDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=Ig1nMwiCzwxLfSO1W2xI2jJ7xWWF3lNaBW8TFy/MPtcCUw2xSKC63bnHXzOTPWj8CMIvRO9uIUbChmwB47U/HjuDSNsoBLH+Ppg8bS7v+zdnQn7zTehXEzSJW5PgLEkFxn4HUB2SeG+mg3ysjtiPO5Cu0MlYRDzF6u8SysAO3/Hj/pFLF1LVn+Rzm0iBQAQKLj2r7dRjxKaOLpzDgtpW2VebON1gzmGLjxt8vY8fuOQ1NtJTVleE0MorDS2ck/SV+/FuE56JlrNQ7P0ykLWBaUageaVSJ4+HN6r2WImKUyqEvrJklkWlVNkTjgjBoSsFCFNEVrmtpu1nrB8cevmkiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=KtCpD4U/FhYtK7Y7lH67N6EZ+qrpq9N8frcHcaK9YaEf6WbOCxG8GPf65ZwQT9LUvLaSOL9qd4f/bwf2sRJqp6+A/gg+Sua7rYuvhgi2lEniRiVpk1CzD6fuYKPMHdIWFYF5+wmjWjTW49QsrfNwLQe6dxh/rLmhaIasXotBNT7/A3tLjyR/H2Uww/49ZLwcs6y1/tLsRc2SHYNkzJyDctI4dcr6ryXU6v6c/xYBwBbN4JKJOqudOkJ6uyF7ZJm00bAN8c8a8tHGZLCh22UYogTaOtgG/bwlw3orrzmUf16uqXknUiBX4kswQNrNMU/lFp9xllUvIYCe3apBDhUhrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by GV1PR04MB10478.eurprd04.prod.outlook.com (2603:10a6:150:1d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 09:03:20 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 09:03:19 +0000
From: pankaj.gupta@oss.nxp.com
Date: Mon, 24 Aug 2026 20:03:27 +0530
Subject: [PATCH v41 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-imx-se-if-v41-2-29cf129e4d86@nxp.com>
References: <20260824-imx-se-if-v41-0-29cf129e4d86@nxp.com>
In-Reply-To: <20260824-imx-se-if-v41-0-29cf129e4d86@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787582007; l=3245;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=T+yyPOpdxzPdIuNJ+imfCdmSEVDwuOuBb/dhiIQRNpY=;
 b=rM2dUBtYyQ9RM2ZGGGF+UGABiFaGmOgsnNBn3DxgfwhEdYsEGTpngCGJqfZfET0KAzUgocPVV
 uA8EbAAQKekA67cTvLEDKqr6CZ3iKEutfxG0rLcwz9Z0MMXrZ9pOe5L
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: JH0PR03CA0003.apcprd03.prod.outlook.com
 (2603:1096:990:6::10) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|GV1PR04MB10478:EE_
X-MS-Office365-Filtering-Correlation-Id: b5e9c638-9102-4837-21e4-08df01be8b00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|23010399003|11063799006|56012099006|10067099003|3023799007|6133799003|921020|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	z4ZqroaK2jQD03vnm0s3FhkOeDCsn86PE8STx8tp8OADZmCZrziRqcCrAE8YTKJ7J5lXzewl7QQd5rRna1aY7k97xMuuEbnAjtZCIzS+RTgJf7NkBYD7jXmDIVP48aHVJLm6Ao3i7JYjctsV4yhYdim/kBe2IiHmi3z3Jmu4NQ3FTp50AwiytwTNBfKjLkGro70+AzWnLJJeOvo1NAfWd71D+PxlvwzJj0R9kF3efeSFMu93pf8J6ruXIBjpy+GCFwlbbH9q+nbq/gCxVM+w0tKlYNQDj5zYYKiTsrKocrSxOyGeo63MmnXt0DfrLyFPP1uYwelmW+SLjnZvV5aBAKjVE6a9appCQcdk8ty7wU57u+RiT0Cpkgt3IT6/KX9O6sdtwP2B9PSadKJTgHd5Rj9NgLqWm6UO1rpDBCZe775ITOUnXo+h2dbr7Q8otMpGRdlRZqIPbX44V4i6Bq87/4YclrnMr07agtxKoG4WSgrn7KwS1M5SN3hkGM6XVh7TqgU+2ud+XqJGZiR+mYWtHtJoskJk9rioBAYFimegvLeqCWiLetdu2VX0FXSQiilyWBTpB+vCCY/Lns9RD6t7HbII9gdkB7cM1kQmYN0fZOCDc6w8lrq0L2/CXbSzTCvp3mCd+aeGfw1cmPT52o+6b86pc6+BBN4ZzT+ZQuAXfqU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(23010399003)(11063799006)(56012099006)(10067099003)(3023799007)(6133799003)(921020)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZG9sU3pxK3lPNjU3c1JoWStENHNabjdJQnZPaU4zNTRKb2R5RkMxQ0wwMW05?=
 =?utf-8?B?MmVTNHl2YWRsRzVNS29RL1NUVUN1cWNmaDNJRGgvbXhqV012L3p2bG15YWoz?=
 =?utf-8?B?d1dQaW40MzJPeW9sVmgvNFFaRzdQY0pLRTNGYXBiNUw0SHVGak5rQVhxT2ND?=
 =?utf-8?B?K3Q1TWxqVXRBY1lSaHlHOFh0SXIreTZOVGh3dDB1WVZHVWFTWmtwUThSeUhF?=
 =?utf-8?B?a3hQNmNVMkRWQVl4V3l1dHNyT2tkTmk4VFNNU3pBS203Ukw3b2haN2VRam9S?=
 =?utf-8?B?TU4zME5ONjM0S2VRWTFZVkRtd2Q2L09KZWtleHE5VS9PSnBzRWxtRE1qWDlS?=
 =?utf-8?B?WWZidytRVklDWWhDZFdTZko2NXJSQ0tOYS9yTGltNDlSU0hMQXVFZGx4Zlhz?=
 =?utf-8?B?ait4eTNoVTE3elNkSVE1eGRqTy9EbGt3cXVUbjNBNXNLS2FSMnRZUEdMT3Rp?=
 =?utf-8?B?RVBBZE13OXlLb25LMzdmT2k3Uy9HZjNSdGZRQUd3T3ZZUVZWZW9vWkNkZ2Zo?=
 =?utf-8?B?YlYweHJjUW5mWFJVTlhzZ0NWSC83RGJoblB2V3dwdTdaSkcvSitOWFZNOUNi?=
 =?utf-8?B?Y1hOdERnVktuUG4yb0RaTmFoTFpSUUU5SDNsMWtJWTcrZ2U0S3hqU1EwVkU4?=
 =?utf-8?B?WVJBUTg3ajZwbXhaMUZkUFZNNk5sU0hkZ1ZLYUtFNG1XSkRmZ0RHV0RmQTZR?=
 =?utf-8?B?dXNsQ1NMQkt0UTBvSnFHcUhoMmY4N2Z4Qk81LzZ1U3h1blNTRTAzQXdBN2VT?=
 =?utf-8?B?TldkSHlpTGpCeW9ZSEFRSkJETVQ2UFJvM1RiSG13QmhXMHo5dEg3RWxRZUxT?=
 =?utf-8?B?VGhsOE02bkYwazNuS1d0WXpHV0k2QitaSEFWT2pJazZGeWlEK3hDUVVreUJw?=
 =?utf-8?B?QjVoNVhEM04xSGozNFZiY0w3aFYwTkxBa3RzeXJrRUgzNlVKaTJOWER0c09K?=
 =?utf-8?B?L05RSllqbUFHV2QzeTVoUUU4MTBnTXc1Q1VDa1FZNWZqNHUrUStLdm9nQnF5?=
 =?utf-8?B?eFQwVWhyWXplMmVrWXBzUFFva1Fzc3htQ2xRM0crQzhDWXF4TU1EL3NaVGdQ?=
 =?utf-8?B?akI0TW9qWXhlZ0hjZ2M0Uy9EZzR5djNaYU94NTVJK2hMTkt0L1R2RGhMNmFO?=
 =?utf-8?B?MkxSNHhETkt5K04zdGwyQ1BnN1IxUjl2ZVREdjJDRlNZWWs1d0YycUdxVzhE?=
 =?utf-8?B?UFBGbitEd2EzbDZsNG5HRnJZcFZRSVZQTUdWZWg2eDZQZUFyQVRZTWVUQktC?=
 =?utf-8?B?U3EwOXpFbG85ZXlOUkt1YnYrai9iUExrZHU5M2o5RzZZdkVibXY0b3k5M0RV?=
 =?utf-8?B?amw2dUhyVTA5YlhLTFVyeEdNRllkOEFwOTF6ZVNxZHM2cUt2SjZnNVBZNlVD?=
 =?utf-8?B?ZStMMThQbFlWNnVZVy9QWU5mZkozUHpsL3U5TGR1WEk2cUV1dkhlYVAzQk5E?=
 =?utf-8?B?YXYvcEJCWjc1Y1l4NEdiSFRORXhLdXhmMTU3bWcwVWxhZVZnRnd2a0gySGky?=
 =?utf-8?B?dmJnb1U0SVQ4N3BrcVFrWGN3Y0t0cEZUWTBtbVMzazhKUm1DR0JRSVhRWG5Y?=
 =?utf-8?B?ekkxOFd5MStvdW9Zb1Rrc1h3a3UwL3FPWDAvZnAxSDA3aFVlVjZHL3hrTHlJ?=
 =?utf-8?B?U1FaZlBPZm81TUMrSWlmbUZZQ1owYmRRZ2MzUTVnUXhLclZvaGt1b3c3RzNq?=
 =?utf-8?B?VFozZW5RdlBMZ2MxeEFJWW5FOHlQNWNVZk50d1JkdDZMd3hTZy9EeVQ2WVR3?=
 =?utf-8?B?SEZHOFZHKzdsTGxuSTlQWlBPWXVDMGovMXA0Uml5ZytiSXZqVUV3bmhydmtK?=
 =?utf-8?B?K2lpdXBmRE9jci9Rd2N0RzVVTHRETWp2aUlhMmVXczRlMjhWWjFxVXBuOWNG?=
 =?utf-8?B?cVRkT2xzMWtUK0ptcUJ6TUczd3lIN2hzd1IrOWJlOHVDRXg2U0t2OTNrSVJB?=
 =?utf-8?B?cmlnZXVMc05oamZoNEJLaTF6aFhjVlFnZmxrQUgwZXZKblpCYmVyY0VEdlBl?=
 =?utf-8?B?RzhQZ3NPamJqQXJuM096ajdDL2xuTHd4akx1NVVvVytTV1N2dTZISENlaTBh?=
 =?utf-8?B?WGNsUW1NcGgzNHZXdUxmL2JmTC9GK21Hc3o1Ry9RYm0rbkwxL05sclozSFlU?=
 =?utf-8?B?NklWL1dNV0IvSmpjbzhBNGxoK0lxeis5TXBkdFRXcytUTjk2UDUzWkpXV0pS?=
 =?utf-8?B?L05MQ2FvejlPSGFrWktxQlFCZEFKWjVobGtta05xclV0SlR3K0RUMXR5WWRR?=
 =?utf-8?B?d0dWWERjdTVGRW1ZVHJGY0wwV1BHbDdsRi9sUUZVU3FQQ3F6a0ljL3BydHFj?=
 =?utf-8?B?WGpoQlFSOTZ3Z3lHTmNUWTNMUVF4RThuT2hjZktZcWFmZm9UMnh1NVNYMHY3?=
 =?utf-8?Q?4QCyFqDu5Rb2aHVvc5WuawVukTdC+2M6xtS+h?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e9c638-9102-4837-21e4-08df01be8b00
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 09:03:19.9107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cb+zi6xER4kiNCYNmdwNLbEHbwJxQXT+pCXqOJ23zXHKp/sabaaxju/nn4EPcQNMe1nvvq940mCpNfFwSiqsgMLFCzH7q/pzkLy+8Mfj0urcpCVQ6+S7FyoIJ6n1hQEE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10478

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

