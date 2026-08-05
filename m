Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013026.outbound.protection.outlook.com [52.101.72.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C79448124F
	for <imx@lists.linux.dev>; Wed,  5 Aug 2026 15:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785945522; cv=fail; b=Pq2vVFZM4VWKnUHzq3ZUdZIv7hpUNw4eG9vS7bzyrBOcpmdD4Wz6goaNzR1CK68uDaIXhIWxZOkNzYYUjRMTdYF0TLCBhD0k27wWcQP6LlXGUE1IDnSMqGjiaFH/ix83g3JXcYohrXkMa614IhRqUG/ySbI8r0T98A7SPSSWBz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785945522; c=relaxed/simple;
	bh=WweNHDHiElH8o82jk8npSceeFRcm3zMBKegXgf5E3CE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lXQ5XbNPh0ZAF1ULZkPAK7ilMLmERNUXTwLBAxbuZi/ZLI5O/dcNUjDcq8sDLsMyTsUsCl1pGhstnd68edXi25k+rlC0ngwk1sO9ko3Oz9g8ZEzCGFufEiqMg4P62oR+ZYtLaO0bS9xUyOxLuoF77qsTz0AIX5bHPhHuC/QcMmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ixv9eAjr; arc=fail smtp.client-ip=52.101.72.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ixv9eAjr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dbvDFptkkzhLfyS+Y0XG50kzHWZIGC9JcDHBF4vCkKb0wKaXSdSbyctei1LKLIUEBS3Tm3wUjprU3dPNzjuQnze+uES/bBhmhes6Nt8G+wLRJYLGTpoZqfZfPhWt93fUu3aKpnAZPLI+PhXvf71Gqqp1DZM+T59PXM5bedTxyxN7vOXxjkKWDGArd24+2TBgd5Xo11LaVGmtc/uyie0sD0lVEvswrh5131H3C48bomWc/oBnhr/a3pD96ElIFh2s3mDQ7AEb29lJR2sd6lO4hFZoHHxkoLZviv3zbNz+mRJD+vLktvlH/2xXV+CWVo8hGB1z9mutw5YAfgS7N1gLiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=AbN+Ha0XmHmKLdt5gFjuUFkI92NppY4uhcLVxxL8OFQlNkz60zf/BwoIudG6JA75bZ3cjZT4ve6RD+mPOxIZZ1cEzez+cVtXGebRXeSNFUUZmfP3vqDAZ3/l4jXPnXOCVoszFgu7cFt4jbWjNiPTHU+L/wEMAeThEsTf1Zvj+u0W1ZJdaI3QWuoLzD+yxdTmHtdNXXyXPuTpi4HEjBBL3zI1I58mjdm2qOwQltld4nbyHwWpxagTpdQMEc4mWZM7+1qxX2wnESrrmd/mSTZ9bi9vwe+E0KAmIqFmSuxK90OHZ1JXGRKwNcpylj7ke2IyUiugI7ZNL9PJrtFr/5eHyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=Ixv9eAjr8qrmLf9rfuoOLF14z4iPAQDpvj5cVgti2PUE8OZItFsBp5fHzRQVi7SbsBK0MAOUiABZliuqal1xGh8BRLRPArIg+NET2NqhYA6TPdXLkbdQAZ8buMlDbct0Mr9kVhKzHzHsEcODRog8bB/frKJAZdMQh4QBle4H4Fhv93XLBajQKk9JFjcLbNAn1HCZLptftLMdo6OOmEiKDLipcUXsGD+5VPbxFS03PeIEprmuvAligHWO6kIH+hUfqwiM9MlX+7lKlaCWiCBrdF54u6NHe5p07Vxm2lmcOULAuzSVtozNgQLWfAluNNc7GQwuZDvVnsBEV6epvJC3KQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by PA4PR04MB9295.eurprd04.prod.outlook.com (2603:10a6:102:2a6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 15:58:32 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 15:58:30 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 05 Aug 2026 22:18:32 +0530
Subject: [PATCH v34 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-imx-se-if-v34-2-7e4713d14e0a@nxp.com>
References: <20260805-imx-se-if-v34-0-7e4713d14e0a@nxp.com>
In-Reply-To: <20260805-imx-se-if-v34-0-7e4713d14e0a@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785948512; l=3245;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=T+yyPOpdxzPdIuNJ+imfCdmSEVDwuOuBb/dhiIQRNpY=;
 b=PcAUaKeaWYKsvZr9cMYOnn2TN9lFjJYwbWUJpvhoW1cE6DE+o9c7vCB8Wty8U+wbfOiiyqo9n
 O964HxGFpLnAVeNI290leKIqUOoE6c8ZMAD+i0b6sdYZXb/uMMEwImu
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2P153CA0036.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::11) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|PA4PR04MB9295:EE_
X-MS-Office365-Filtering-Correlation-Id: c803bfdd-f179-4700-3d6d-08def30a64d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|376014|7416014|1800799024|921020|6133799003|56012099006|10067099003|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AAiSF/0IyO/0EengKZbF9TeG20Nk+vbYFF8QxWXyzcIB3FmGXfiOEl39VciVYhV9pSm8rhujaKVcMtAbN/pGnVz4gPAoOGy2twgI8wsggk4280/DfXRbE8m82QmV8HO8qgzJ+LWET94+Ld2NHxZlUn3pzwlPzxTKDlk1wFWki9U8kk1WIse9W0jipJwFWNgBxW7ZlWEPHBaKIBPRTn6ZTV8S1ZcbHP/BwMB6fO9xv2yE5WglrsyoxjBXaBYDmO09eetgD0i0zn5FEFCuYsA8MaxEz+Sp991BjWQT3egcuaWVWi9Vqms9ITptQ+Fwhss1a1qQPRk5ghZMXgP/XFtl1OD6KThRCSI1NYOlpAbRWDOZEwrznHhKBOeHaHp2SQCStNN1pZKvXOGoJ7NiRrovUr3AFtoAjDpVDxIVUFVxvHvLTp23MjhR7mhxk5LcWslHXqT0OwGy++pn5U7PD1ald6M2BIpwauL1oRU5FeU8LTbFiADuIax07L9axyngli8++Vg47RZ6VjrkxdIoFH3OzTooznzPSWLEdUpcdprTCkbVi9prReB24gRo2IAFPE/QWOPGKDe+nF8cHnckAp0oAVmxrf7J/0ABoI7X6FUx6uuWH2j2orXzifutUbMVWUO4e/tL5mdgnbTRMA4EL/uCaeZxSBh8WhjmtzlNX5Ms4f7s4xcP3mzTrRfWRTYyNAwBIOpJBWjwghKDwYoz9LfINg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(376014)(7416014)(1800799024)(921020)(6133799003)(56012099006)(10067099003)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzkzWEdmOXJmTEZSSHVJYlA0L05nYVpQcXZ1cXRrRUk4dVF6M0FDMTN6M0M5?=
 =?utf-8?B?cVlIZ3lTcTFTUnZqK1BITDRNUzRwb3h0WDJHZzR3emtCQ1lvNGZoblJlNStE?=
 =?utf-8?B?bXYxSy9oMFNFU29SVnp2TU1NdjNMMWhMNWxQL243eXYwbmhCajJoZXFuUFNs?=
 =?utf-8?B?a3pkam91aU9WRjFuNnI5QnpBZ2xaT0pRZGU3OEdJcWppSHZTY2ZHV2hyU09B?=
 =?utf-8?B?Z2JRaytXOER1dE4xc0tIOEllR0xMMEQ0Nk5DUWd4eFc1L2s1WjJuSDBnMDhT?=
 =?utf-8?B?Y2xPZnhLVDJrcng0czJKSXAxOFYzMytnVzRFV1JCWTliSjNsM1BVbHU5bVN6?=
 =?utf-8?B?SVVzYll6T3A3dldUVThXdS91cDRPVHNZbTFlWXhPYit2SlhNckdJbzBaMEZI?=
 =?utf-8?B?WVZvY1JJTVdaNWRERzhrS1pTcFRvS1J0a29zMDhQK0huSVA0YlUrQjBpTU94?=
 =?utf-8?B?d29Pc1VVUnhrZDhPdFJqdUhUdDdNenlVd2NueTNwNGM5RzhyT3VlNDFXQ1Ft?=
 =?utf-8?B?MW5LVk9aRFU1NTd6VW9LbllmUnBJZ3IyVDhORjZPakxITUEzNElDQ3oxV1dM?=
 =?utf-8?B?Q3B1SGx1V0loTktQWGhKUVNRVyt1ZXNFN3dreWVSTEdwN1dIR1ptZU5Nb1R6?=
 =?utf-8?B?NmhHT0ZCY3RVQm91c1lxOGdyaEQ3UUJtV3BiVHJKejZuYkNRaDB3VG9KWk5l?=
 =?utf-8?B?OUxDSHkvVG9oRjFGN2t3NDRId2VoRTdpdGwyRlR3QTRCYlJQUWEwczN4RFA3?=
 =?utf-8?B?RmROclk5aThOV09YdEVzTko5YW5XSGRFRUd2MkhraWhiV0dJeVRJd1lRSElu?=
 =?utf-8?B?aitpYzNhV21PSncvcE90Z0dnZS9rZHUyb0JBaGdHZE4ya2JTM0ZSUCtFVmlX?=
 =?utf-8?B?RXM2eUpzc21VVWJVLzI3TjhIWHFnb3VoYmc5dzNaTzliQzNYTklxSW9HOTFk?=
 =?utf-8?B?clo4cTRDcmszK2J3dUhsT1VtVEgyY3RJTVk0V1F1N2d6dU1Ib3VxT3N0UElM?=
 =?utf-8?B?ODNkWjV3T29zd1hxS0lhNXY4aXl6K2RXcWlyOStZanMwQkZyTWNRaks4Y29P?=
 =?utf-8?B?aEh1ZDNaTERmYlVZNC9iU0pOMjV5MFBXUVBxTGtTZFF5U2JvYjJFV2JxUTNR?=
 =?utf-8?B?WDdmc0dYUEZ5cVNwa2JOYXNXZzA2djd4NWN4R05jMVp6V1BWK2dmWDc5R01n?=
 =?utf-8?B?RmRXU3QyNERlVEUvNUJBUHFTc3dqRzVCOXFZOUVYL0RpdlFRdFkvNC9pUk85?=
 =?utf-8?B?RGZjMmVYa2NsT0I3bTBnT1RiWXNNaFg2NFRpTGNNeDhPWDlTWmRsek1ickY4?=
 =?utf-8?B?OTk3cVZnQlJMSStWVFhUWW95SytZb2pLMzA2c2YwdmlsR1RXQzZNcENjbERw?=
 =?utf-8?B?aHgxSzVyelJSSk9kTnZwTW5RdWJrckZad0lLQ05SVjJBWkViRnpvS0FHTHpz?=
 =?utf-8?B?UmRxNDdWbFNtNWhZVlh0ME14SitocVBrd0xSbWlzbE5uZzlCK1RRR2psL0w2?=
 =?utf-8?B?a2lDcUNCRVM3WWJtUnVGckltVjBkc3ZNeVU3Z3B0YkMxN3ltZmQyWFNyYi9h?=
 =?utf-8?B?TFFmazRJaDU5Z011aFV4WDF0NDR3dkU3dENxWEdZbHROUXRDSjJ0ZngzUExw?=
 =?utf-8?B?Qk1IcEZzVWlnMjBWclJ2UUt3ejV5RVYyaXRkeG42WjVyVXVLS2RUY0FWT3Nu?=
 =?utf-8?B?MWQwVTlJcWs1OXM1MDhxZHA4MVVLVVFkZm4ycjZYYm9HZVZkZzN5S01CdWx1?=
 =?utf-8?B?SEhvVERwMFN4Y2N6OE4zSGtaTmQrU3dwY1dVcGhLZkFOQS8rVngwbFFuZnlE?=
 =?utf-8?B?UUpIalNlZzU1bTRadDdQSXEzVjlNdVhBYlhQeVFlSC9ORWVxZ0k0ZTF6bHFk?=
 =?utf-8?B?cDdIY0ZyUVJpdXJzUVJZanhSeVcrbUFHK29FK2dLZmpmcnJqZXNpOFU4dVN6?=
 =?utf-8?B?NjdrUTJsWTF3aHBJdXhobkNzYU0veStuUzJSWStSLzBZSDRaUkJ4VGloaWJW?=
 =?utf-8?B?ZFJ5QlNRR0NjYnl3NzVFUlA4dy9ZeHJsMmRYL1dUdDU3dk03bkg2emJ3WXEr?=
 =?utf-8?B?bUtsQTJSb3BOQzZiSTlsQmZjY1BXQmhMMm1qVzlFcllKUFlMdW56NEFUOXg0?=
 =?utf-8?B?Mkg5NWRPOW5BbXNLSHlxS2JlRVJQQzhRNHFxZmtQT1pRYW9iT3FCTXQ3SXZx?=
 =?utf-8?B?RkVtQ2pRczZDcHp1QlI1UTVaZmZXd09qTlE1d1RJT0V2TFJMZjJHRFVKTmQy?=
 =?utf-8?B?dFJyWTRZYXpTVVdHUElnMUdGckkvdVZ6YmlpLzZPdnAyeFJwdENabUVCVWFN?=
 =?utf-8?B?UVZQc2FVcDU5RENXNzI1bnl1NkUrRDBFVXZEYjdGTm5ZR2t3ajhPR0VSMXFr?=
 =?utf-8?Q?DNXsSzMP0s2g+5RSByYcfZOuGmwtm8o5L4Y8m?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c803bfdd-f179-4700-3d6d-08def30a64d2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 15:58:30.1722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VKHUl3hjmHqBLbL8rW+KpCqaaTxUA2c342Lp3sGdgGtmSTHyXpt0gYe2fhXHskTTH6ei4RSz0QL6Z95uwWPSANFSXBjJ95Soy1/xUdxu9Anxugcx9MDyk+7swuq4Hiqx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9295

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

