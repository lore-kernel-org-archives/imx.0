Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010053.outbound.protection.outlook.com [52.101.69.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8CB29994B
	for <imx@lists.linux.dev>; Wed, 19 Aug 2026 13:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787145346; cv=fail; b=FPh2EeV/CBVj0WpjPaoi4gSBf2xlPzq4toDmtZ9G0oDV4lXXV19fIA4DwIb1C7fyJLahJgl1LYSFz1zwkwXOmyh8c/NTgBwrt1MDwyONPAqkFJy4lb5MN++YigeIM4ltfaQ2mrGZ3MSNISnlLCObaVo/4TtfTUD+xVLbuAn5Mv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787145346; c=relaxed/simple;
	bh=WweNHDHiElH8o82jk8npSceeFRcm3zMBKegXgf5E3CE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bY4ENIltZIMiT1uMQ/6OlgLFWDEOSCR/C+VO1CzPHYpVKbQ2ySEk9+lq0MDWdyhlENc9Wjdi3K0glwJZXuia/yqGCHuL0I9qcwm12SKQ2C3Sw+D+hXnVMrJ7EemdesjqU7cnfZz2JEzsUx0y0ks2JpfOna/NvijW9IlkA/ZGF+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iAYxGkZN; arc=fail smtp.client-ip=52.101.69.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iAYxGkZN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALQHPrOJ9TZBQAowgA+Wg4PSrE6FhdWLbiCyetpJTRXO2Ogxt3loZVHio/VTjYsh7TwIWANaPBO3Xmba+wsLRHudSG/11TnSL9NW7BqX0DTRnZxN8PueKhdWI9Qu/8nRwqkMLrfqVQ/NoTbDM5CFioTvxzDebHGK2oWEo9ctcKoc7Rire81nk2mMZ8eK8VQ8Pl/jwmi6M+wyg0FVIGdOa37AsQbCZS9+IL9JxuEgVJAzD/6lLX5xr7yF/P47GNkuwimrZ4JcJTnZ998SiuvhVx1itSJi8UvC5hBbxXCxw8YKPIeVTUkKd9qTPZID4TO66VwVkWtl1FcoHkJVKXdNoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=AUOQ1WSNwZArwowXVdHslo9iYkgjPlU/F5d0neJpgUTOtFhP9LD2GVOZy9Gsy4td9sKtxvSvaSm0xcPtXXMMWZt68iAIoTmTq1KxsEV+PTiNxS50UJplQsM8uqSG73QiXrxIRGLx4+lpCNM7vyU22dEbPVcmtXVyRClKI4nS4N/imIcdAz/3EFhcYd5nHuczyaUUALln40z4LNrEMT0ErL6s6chyKrJYaIwjjler+EZzWrVf1Su/n6+awY6Xt842c8MNQsZ6QOPdgSIYns7Pzkue3b57TVjsHoPgTAIG+Rz2RRj1p7aV17x8P+ZsZVZQ2RKxoAYT0vqOypXsFBiG4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=iAYxGkZNWXh8+dO4d89YPgKoARVScH7A2R2+dkF8GIi1Yb10RmxPimGXvZSCP8K34WT9TXAQFQY2Pngu33ZTjgkJgx4f/ONnU3wM6SlPTVTR3e39p41zjAsXqhIrp7R68ovllRUE3o9xazdjNwYt9/0d7F9xWupaVnDw2J+eJCbmVSMk8GEEjNTA/EMuYuK00yAp0+bb9cTSi438bdlAnwYaeRMmER3ahiqktrJ9ncMS7SKOOUv8734CUJgSACu7pHzcPFWdsgfGIt2g0zMHH2WVtgG73Tj7XLSWrJfnMpejUyABdQuMMpKV0exmNWB7LAoCClQQ8Th1k5bqAK1Qow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by GV2PR04MB12086.eurprd04.prod.outlook.com (2603:10a6:150:301::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 13:15:40 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 13:15:40 +0000
From: pankaj.gupta@oss.nxp.com
Date: Thu, 20 Aug 2026 00:15:57 +0530
Subject: [PATCH v38 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-imx-se-if-v38-2-5df4a4cff736@nxp.com>
References: <20260820-imx-se-if-v38-0-5df4a4cff736@nxp.com>
In-Reply-To: <20260820-imx-se-if-v38-0-5df4a4cff736@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787165160; l=3245;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=T+yyPOpdxzPdIuNJ+imfCdmSEVDwuOuBb/dhiIQRNpY=;
 b=p95uVMMZnwLsg7If8cJxJJUGZvNINYgnG6GZZ/8TZ+0n8Y4NY9zRvAWt1yft0sm5hKKHMJm2U
 SVkDPZ3PR8hCQ/c7RDIfazi4W+CT+PO/zlRSHold7+5H0yBymaRQPxz
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI2P153CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::19) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|GV2PR04MB12086:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d362843-5b24-48aa-65cf-08defdf3f799
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|19092799006|921020|6133799003|3023799007|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8pshUliy04W/oJt5gCNR/XTpXfcPJKtuSgdeEOawEsLI73wryFdlGVxv88pYTcR1xz9N0ifhpjMRcCU1WZb9HCIiQTyusnJq/slt69btXp7QA2B8iLlsDX9zZP9lafbYduqC7UEz0fzYZNr6mF5of/QjacGLDX0pRg203ybPP/Y0/RXFOWaDbsjm2e7h7mwteUHbPHjcRARgyzrA/5QH6YwZ9Z9Oi2ZXBUtgyhM/IobFARpT32CxFQAyrRcUIuN2aNC3nCCG9FnZLtfkLBGsYKhk1JDpAzlRSq0YNMBxgRDnF4YzPXO3sEZ+w6wDJUoKqlKkK/OW7nyMENok63ojfPKLtFM/YuikeKE/g6edBydpBgTXHr/pYvQUBIXE4kC6lQPslXdKY6HFRsZPMkn7q6gZSCuAZ9NJUUncLLvYinCyxCj1zjrdJK2VZaNrsvhwJsxD+Nuts5Ve/7YDl7+DDJHu0tWo3xL7VJH0f9l1gXXcTh9W4STBM5oGQxtyyEGgmByBpJQvLaWZos2I5hl/Nh3EDLd4Nuiht+LIS4zQo3VAcai1a+gA1xOiAUt3ROQwbqGkLktOYG8SihTbZ6rVrpq9dCGXYEJOGP1u/nBgc6E3yrjXB4WDIkrc79R2n+FJEUBkgrMUyOjhEYk5ZBzqoHE0fXFX/EJ2xnMTMH0Uo7E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(19092799006)(921020)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUI3TnErQitnaTFrY2N1bERLRDBIRGwrTHhBd1dqQnY4NWVmSXZmNEFXWkV4?=
 =?utf-8?B?SkFLUVNPT0kraThVRGJxYlZSVm9uZGZsVTZ1RFNUQWpVN3lKQ0h0YTl6K3ov?=
 =?utf-8?B?elJTQUZ0cWdJRmJsNlFsMEFGU2Z4RDV6dlFDN0w2U0VrTVlCdUMwNGIvUVBD?=
 =?utf-8?B?L014a044VXFIUUhRa3g1TzAwVEpqVVN3cVg5bytTV3hheFQyNDBKUXpGdjVn?=
 =?utf-8?B?Qk0rdGlUMkpIWmNCVjBlT2NtZWJQUktIRkNteStkV0VCdUc4WVY3WldBandh?=
 =?utf-8?B?VDE0amhkMlRXTUw5MlNmcDRMZXNsNXd3bVd0bllBMkIwZSsvbXlVenZ2WDNr?=
 =?utf-8?B?ZC9Ja2o5L1VwanlxSU93dXFnVHdKRFNKb0NFZjFQTmRBSXpYeC9WQkRSVXpM?=
 =?utf-8?B?K3ZRVFNDUzhhMlVweU1yYkFiaFg1OGNOU1Q2MmIrQ1lYUDJ5YmliZlFVcU9B?=
 =?utf-8?B?TjBJcjR4S2JZYlM0N3lPT040dGl6dHEvd1UvY3V0ODBaOEJCMGpjaUg2TGY5?=
 =?utf-8?B?bXpqUEwvbXByRkRaVkwzUnVLTjB4a1liUmJ2WDlGZ1F4MU9nUFhqOEx5T050?=
 =?utf-8?B?SFFLRTJDdGpSSzNyanhGTjloVUlvejVjOHAyYThMRFVHQi8wOUVORElQUk9i?=
 =?utf-8?B?RWJxVU9WUVBReFJlVHNVbUNOVzlVVlFhTVVQam16ek1ZM0gxR3NBZytncm15?=
 =?utf-8?B?aHpXZ0VsYmNpOTlQUEVMRkdUci9NYWJhckFNR25ncXBBQi9DaGh1OWJFQ3ZN?=
 =?utf-8?B?aWZaMUlVbmJtS0RqU1Ivc3lUTWhQVzExMmdZeHFOMVlVdS9sVTdaZXRIR28r?=
 =?utf-8?B?RmxDSlJSdmVaaDJlYU0zWmQ0UldxVWxzTUpNZmxCenoxY2NpcklXNnI0b2NN?=
 =?utf-8?B?MWhvTnZxenlkR25SS0UyUmZiNzlRam9CS09rRnpGK1JSeEJ1MkdwamR5dFU1?=
 =?utf-8?B?bG05dWkvblpVTFFKUmp2Nnk3ay81Q0plTzRBc09ycXNaOFNPR2p2SXdDdmpR?=
 =?utf-8?B?UTg4NUxtQVcrK2U4QXpOV3Rqa1l0cFd3TzRWZURLUEEwcG1HbDZid1U4eW5k?=
 =?utf-8?B?c3ZQV2dNZmFWaDRUNTBTRkhIL1hpcGpPOGZPdUw5a3crU2NMV0xoaElWNnFV?=
 =?utf-8?B?N0ZRZXlSK21rM2ZHV2Uwb0hKNWR3TjBFZ3pPN2dDekR4VDIzbnVIQ0tVV2Vz?=
 =?utf-8?B?MVZWWmxlN0lXMkN6RWs1a3VoeXp3R2cwTzUrVnE0RnZVVGw3NDlNY2d0WnU2?=
 =?utf-8?B?RzU0Vk55aWV2dGlFL1lRTGRMVWFaV2Y1RnBkazhHWFlTSC9vT0l2NStIOWFN?=
 =?utf-8?B?VWwvVXdWMGdYb09rUkhsSlptVlh4RkFKbFUycHZkcG1qUlcyaFh1YkdSYWw5?=
 =?utf-8?B?L25ENGUzS0k2QmRIeW1Oa0hHaDdlSUpBbHA2VndoMlI1cDlTUmpjNFpkSWpV?=
 =?utf-8?B?R0I0dVpsZkdFYlE3NVJRNy9OVitoVGlyK0N5NnhsQ0ozREVzaE0wcE5iMkhl?=
 =?utf-8?B?SVpJUnZhUjk5aHdKdGpKNWtEaDJYS0tSNkV0UnIwdUJ3emIzV0RZVGMwODNF?=
 =?utf-8?B?UW1YN1FlWWZhUldEOGhYM3BmczJtV3RaNlhkMlRocnRxa0Y2eEFZNHhPRG9j?=
 =?utf-8?B?VzI3SE1pdkp6OVFtVVBTUlliazVJNmFsOFdQYjdEZXBEOWRKeDVsb09CTmxM?=
 =?utf-8?B?cENDYXI2MHFiWGY4YVFJVzdXUjFzM2FwK3lMakdnSmc3ZzdZYTBvbXhCZDho?=
 =?utf-8?B?K2dZSGZqekViTitCTzN4SHpsN1RUd2VWODZwdWYwMzFYdExhUmcvU1p4alFh?=
 =?utf-8?B?NVlTcDZNZy9nbVdVVTJ4ZFo5ZGdacnRTdGhuVzBiQ1I5bStvbUtRaUs0eUs4?=
 =?utf-8?B?eGxKS0dKWnNoaDlYK2hvUW5sK2w1Ly9IeXhLeVBJNTIzTmZrZkxZTE16RjQ1?=
 =?utf-8?B?RDdaVTNzMnd0TVZXQ1RPY0hXQWNPN1laVWVrZlVZdE9vdkNKU01GenlYYTB5?=
 =?utf-8?B?aE8yT25UOXZPdkZURGd4eGhQelJoQngyUkFScExPNVlqSGJBVHM4ekJFZjY1?=
 =?utf-8?B?bDg1d2sybExTN3M4WFl4WEkrVGxYRm5KWVdzMjNaSTJlclBod1JmeUlOUVBa?=
 =?utf-8?B?RmpqYW1QQ3dqT01KSDFHaUsyaDNJcHI2UTdSenlxcWlwNW1DWUkvT1BxNWhI?=
 =?utf-8?B?YzRYNS9FaVZMQnBra2sxYWx5QWFOK3FWRlRvOE5DbjBjMmxRV2xvM2dKVWlq?=
 =?utf-8?B?bGgrZWxlbTJqUDNERUJpeWJ1RnplNUpXM2o4RmVwZW9rc0hBczkxRzRva1pZ?=
 =?utf-8?B?TnNOcVI0QnAvWldoaWxZdWpwVnVpRU4vUmhJUEdzQTc0UnB1VHcyY2RTNW9W?=
 =?utf-8?Q?e4h2m6b1ddIUw7MFZcjdIv8tJnSauU52JBprm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d362843-5b24-48aa-65cf-08defdf3f799
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 13:15:40.7857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0MeAnwmxNJC12GnpBStFy2XXIJh2TcY/yl7M5KNWpmE9wW+4qXll0XZ1kPsoLQqd2K3qHVP2FHuQvorq0RCmaaBE9Fy+f1OtM6Dr6fY0NNdiJbfEZ9BdjZ53SLrbH03e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12086

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

