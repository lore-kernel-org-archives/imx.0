Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010003.outbound.protection.outlook.com [52.101.69.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DF73AE1B4
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 17:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784135961; cv=fail; b=CWP4AUNzP2QfPn3X5OYoBSv93ZQwZSbgfnsXj2l5CZGBABfgetGAs3IRn/8l+Jrwk+DxyGDNBhfIShk8SSBmXyevA6KLgc88ZV0nWmI2umZjkvqOzjPxBzISX8Nb9QFQwvEd9+F6R2htqegR4B3BvLWQg1JsVnIJa61RxYKSBZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784135961; c=relaxed/simple;
	bh=g/tspJdnIjaYPLnhYruDKhmk89UURmZxtfy22fiiEOA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=tJ7xEE1028Hoi/YgBP4+m8bpnLDiCk8dY+Em+bJI7fVvdAwtCFTOUFxEK7CMs8lnlUsWjH0mw/tuwzIh+AZJ0PuwW5LhyydRH8hkVPWFizV82JrQKqpxmuHM4uySUwSI7XlbBYZCctiEMTfQ6TPK6RqHs461vhKVx4zVJBrEs0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LIwgD5CJ; arc=fail smtp.client-ip=52.101.69.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LIwgD5CJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQJBLo4MaTeRRJGe+ikXONNBzMkfgtVo5DOKyXpv9oUW7Y1N72oHV/GQDKlV9tSg5Nk3qn2B7Brirb9J06e9NmI4yh5UMqGJBG/grgbg4GlQQy6srX+pbFN/VoHbW75XrbGKEmDs44yKy6dwhLD+7+u6mo1vraPXhKJrt7pF24GiEFpvLOAfip0R9srlmfn6cQr17Eqthuk+BT3v+6Vc4KW4MzKzWft4IOI3+B0NXCu1y3I4nqHPiu2bSEXPeq18LB6mTKpXriCel5BthhdQV5Z7YMIw1+tStPX6kw5rvoQMAinKtvQsgzJJy6rBUpp0NHAzmKc1XPJhE88ZhadTMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=KJQrtENS8ev/XqKxMNJlle0QpgXzO2EUgEryDa7/fbv1q17AKUoO7C5Yec5RwDJuIYYSKV1AOFvZ3fNRY2wp2VJTPkf4HjBMwi7BYAO0H5BBTK7oQpoH0GT4y9C5x8p2lXR3y9+5w6b3iVrbKz5rLy602lTjoX2HKOD41mNd8bEJBiG2mLeISYsTbMBaLUZIe8MRGGAXjpGLpwlDEqnXxl+uUdDPTM9WQlUSjiXTBLTtK3ako5zUUVfdbykR9gCOBFwiPfjE3yboxe0W8i7wuLfkFd/Wkz2nAE/+9aKMCCtbWjWG1nP06/t9VPPD9Dxe6A9pdxgQr3ifTDA1CJz+Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=LIwgD5CJlq3KKCC76pJLcCEDBqdRQp9d+UGHPLp53N43Y8HbgTGwrwOhZ7dQQ3p6rkXC8kXyaaxC1Zfm0FDwvOjcEayf7Tu2RubqaG33wdsFh65tIp0pDmQbFQl7RrmHJH3aXIxD6rjM/B3Jz5YWxF/3BtDssFKWydV2omoNRvbuNnglMTjjZMcNreLNtDfdyCUQHbsj/K3i7b4fW6iQHHahpkV3mC/kA+CdrQKs7NxALlLgTBlHmJ/GKQ+wVkYupCU7sNIVNLZPiQUyWGU0zM3megquAMTOvo03ONuT9lZziKEz9buQhMr0LD2qTVm4PzVedrSKcoafeV5HL6hLBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by VI0PR04MB10509.eurprd04.prod.outlook.com (2603:10a6:800:214::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Wed, 15 Jul
 2026 17:19:15 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0223.011; Wed, 15 Jul 2026
 17:19:15 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 15 Jul 2026 23:39:07 +0530
Subject: [PATCH v27 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-imx-se-if-v27-1-bb7c45952f06@nxp.com>
References: <20260715-imx-se-if-v27-0-bb7c45952f06@nxp.com>
In-Reply-To: <20260715-imx-se-if-v27-0-bb7c45952f06@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784138954; l=7403;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=ZSAmXRvPjYNeGEa/I9hefXFuALx9geFcXzYMsSoJmHQ=;
 b=w1QC84vjx2YUdAPoXZWkvpPM1At9pFdNZ82ogq/qrbiezfuOnyLd/KW6v4+BabEUyLCxPwhyz
 VEXHFpqEzwLBtl82hEO9ZxxT52LbFEzdUKFdNgjg8wC/GxLF48axLEe
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA5PR01CA0135.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::12) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|VI0PR04MB10509:EE_
X-MS-Office365-Filtering-Correlation-Id: 76eef197-2469-4212-7313-08dee2952f22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|376014|23010399003|10067099003|921020|3023799007|11063799006|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0QRZpE2FnBJxZ2lyLIGS1D8iML3lrLSYxkCnfWVsvY06Y6QN4WQztOdNohN5JID65zm6KVXLI67hD5c1Iw8PeIAtaVd96YcEZWBgb6we94yjgE7ld8y9bnCZuQJlFY5Nhb2KxoHzzY+yFLIObWtTfVEPVXuBHIR+yVtrCGXxJBI0telf9FHXUFY7eclFQlklvHLo+x7skPexajCnbaOTZ90fbuIwOoVgPMkMMhQfTLXa0e4pDSKfXcWUZlJcXo9Y6ZYrTUySNBRN+9RCLZUC9n4+TCUwMWL4cu95FYWIrYQo6RMnH81IWjOK0yHg8I/20HCJZGyxFapEpoI0iSSWKMXp9o+BGJzF1nR9CoMOiRcXS8M1gsBTzxKhKgorW74siCrG3YhnsBG34WWPyElmhZExnw0ByBP5xhRLPnToss8SG3cRgDuDiC3pZkKfBLj+N3BpgWk1737bbvadIVLIz73/5tywZ4BrLj8/nA/SPMihlHoA0yoqMsFlTA1CYgSxTcsA8E6DNtXVH2i3+1tjbVfFHQqtHXAX7hXlNvXPXC9cXyj31YU1LgXvCwp2cYMB+5i4iUaXFlr5bDrd0HmNmdUiIF3WwuytSVHEM8BBcm6uB+N3Ly32sxKgRd4E1uNtwOn0RBR8P8ecyqKp0AJF0vXvHqVU8PkcV4tNVgIxNik86XK/McTGHWvFW6s65c5PRheLH7YxeQfWxwogB3K+Qg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014)(23010399003)(10067099003)(921020)(3023799007)(11063799006)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzcvQ0diVVIzRTlDbkxDK0lZZnYrQ3R0OFc4Y0xZamg4TXMvZExoVVhoTmZB?=
 =?utf-8?B?VkRURjVWS0Y2RHQ3SW94bk9aZC9aYVJkMXZaaXdhVzNGTmZ6M2h4T1FQU3hq?=
 =?utf-8?B?UE9kLzU2cXA4Z2J3UlluM3dId3JlRUlrajhsTjdmLy9VZi9MSnFwdEg4SmNY?=
 =?utf-8?B?Yk5ma3dpdTRsdHI4MnBlOVIvSFk2QUs0NXE2YXVpR2Y2QmVMQ2xZc2FZUTNr?=
 =?utf-8?B?M0s4UFN4MndlTzBaYlZGcGFpemdpN2dMOURiQjF0c3FkZnhzWElnZThhbTJs?=
 =?utf-8?B?NTJQTTMxaWRHbUdUdnhsN3RyYkNFNkxIcXQ3WEM4UVFwYktxazFxdzgzYlVo?=
 =?utf-8?B?bGpZdFVXTlhpN1JlbEZOOWNGaEhVYWNuem9VbHNRN2p2OXdydXRzRFZtVnc1?=
 =?utf-8?B?YmQxdzVWYWl4ZnlNcUp4cTBUc3A1TTl6RXJkZEhWaHh3QWlEQ05CUWxSbUFY?=
 =?utf-8?B?MERnMEoyWWMyNGVpb28wRzVpeXIrRkdoa21uUFA4d0pDb3Rxbnp0bENEZGVS?=
 =?utf-8?B?ay8yQjRvUGtvZXFYU29FQWZSbEMrS3kxOTJDZ1Y3bzBjTXlQc0NreC9udFZF?=
 =?utf-8?B?cjVjSzc2b0xiSTVKNjR6WDF6ZWwzNXpUOWxyVEc1Z2NIbEMreW1taENRMFJt?=
 =?utf-8?B?T2kxNUpXV0szVU1UQzMyTC9iZ0hvYUoyTzFEb0xsNmtHVE5mcFR3dkQ5dGVv?=
 =?utf-8?B?Y1pGUEROZ2t2UVRqelNXUGhvT2N4Zitsa1RwOUlGa1lmVUJ4UHpETzFTcUdw?=
 =?utf-8?B?a21kZ2x2MG1oU2tWVXVVZXpNZVRHalBTTUZxTXhmemg5SFpDTkpyRG0yWXg1?=
 =?utf-8?B?LzNWVzR1SVJTVGZKZDNRL2ZPOTZZYzFZclNydXdLZ1ZrYmt0UXpXRmUzNHlP?=
 =?utf-8?B?ZGYyNmNvaFBha3B4ci9FOVlHUU43d0RZaUEzRVFOS2tQS0w1cll1ZUZmVHc5?=
 =?utf-8?B?L04zQkxROXZGYXV2ZDhTek9vSUVnSjZySmdUeXJvKzM0UWRuQlpVSHoycGEy?=
 =?utf-8?B?NGgvRCtrS2xaQUQvNzZSZ0IrMlB2VG00a3V4TUlCNWYycFF1YjBWZHdEOXZU?=
 =?utf-8?B?dnl0UE9WZ1UvZ04yRnRKV2wzcy9sUVNDaVpXcnRUVGtoRFpzZ1hERXAyaDRp?=
 =?utf-8?B?b0hKdDQ2ZDVKY1lKVFN6Smk4OUlVVVk3U3pPZE9pQWxaRzBDOHJHVk1zdTlZ?=
 =?utf-8?B?dUVQQjlGeFRicmljWlluYnV0Q3NGYWpkZG5GQURtaXhhdzZvb2tKSWJNOGwr?=
 =?utf-8?B?RWdYNWdMd3lMMXhTMnpncXVwSWtuc1ovbWtMcWxiL25ROVdGamZxV0pzWTJY?=
 =?utf-8?B?V1ByS3VkRzZEcU5kb1pWNk84dS9waGVKV2o2MGdDUnhDZUxtWVBKdmVkUXRL?=
 =?utf-8?B?SS84SXpYYThvOEg5cXp6aXh6cmhXMk93MnJuNEUwZ3RmeGhmdnc5Tm1aTmJV?=
 =?utf-8?B?TVRjdmlISi91QlkyR1FRd1R4MGVTRUs0SkJTOXUvSlh3QnZoNWpRbkh3Y3ZT?=
 =?utf-8?B?Q3JxNllOVjRqb0FYdC83cUU3V0oyNndKb0E0WlNncm04ZlNKc3duMGdJSk1K?=
 =?utf-8?B?L1RBTlVBdjRiQk5nOTVnOTRkaHA2ZUdpWUgwSTVKVmpOdVA1TDl6ZjZJT21q?=
 =?utf-8?B?RUIra0hncWtWM2xSTTdQeWRtS1JZWm5zUUR5d0RGbTE4a2ZaUjNVOWRDR3Rz?=
 =?utf-8?B?eGlJSXFjM1FVNDVYbFRDYldTWUZYQm05VW1PSlB5c2lzbzBhb1FiRVJVS0Jj?=
 =?utf-8?B?N3VjY1JBVFdKVnRzUVMzb0JkRStrSXpxVWw1SUlUbjc0TEkvVmRWUnF3TVU3?=
 =?utf-8?B?d2ZoY255RVpLMzY3dEpjc2lGKzZzVHNrNFV0SnZXVldVWng0MDBzckd0bEsy?=
 =?utf-8?B?VGt1TDRQNGZ2VFE5alNDT3pGOHRmZTFNSUJQVlFCNEZIKzZ3UmNFWm5qamht?=
 =?utf-8?B?c05nS2tRUS9HV3FyZGM1T2YwYnIwUERaeGdUZ2VFa05GREJuMlBFVzkxVnE1?=
 =?utf-8?B?Vys5aCtxUVZTc2czaThOcUlDQU9yRkxmbnFpMmN2ZWY1dXdMUUt0OHNaYWoz?=
 =?utf-8?B?WTNkVDRTMnE5OTduY1g4eEswWjZZUmtrS0RSL1BlaGhZR0FzSXVQZE9Qb2Jo?=
 =?utf-8?B?WFl6ZFZFVDNLVzcwZVE0V3ByaEh5VXFzUVlRdXUzeUFVMnl2T1BETTJ2SVg1?=
 =?utf-8?B?dE1JRzliSlN3ZnpoK2h4eDAweWVyU0hYYnkxbkRVeGVkYkJxOXFhSHRvS1lq?=
 =?utf-8?B?b3Bhb2xEZXdaUlhNZXEvZ3V2RXlBSzJaakR5aGk4RzRqemFsODhETUp6VDNV?=
 =?utf-8?B?dS9jcUo4MVBwM2lVOUl5VWNsMUxrUGFSWU5JWHh5WUVYRStsd3lndzl4a3lu?=
 =?utf-8?Q?1M0n4MqFBaJpeC40diz8g5eeF9HFJC4EcR+qe?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76eef197-2469-4212-7313-08dee2952f22
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 17:19:14.9864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cz6j76O+vhmEtdKEaIy8JEAlKuAiBTqp424xLvdgOgwSXOvrlQ7vWuZg6/wR4rEVZ6hKANghm9lMOAtKfcM0zXJ9tLK+CFVoTOvLWWtq8zmrtaJ5w/z0c32SO7cEWL4n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10509

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
- NXP EdgeLock Enclave on i.MX93 & i.MX8ULP

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../driver-api/firmware/other_interfaces.rst       | 133 +++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index 06ac89adaafb..6c6fa9a0ba1d 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -49,3 +49,136 @@ of the requests on to a secure monitor (EL3).
 
 .. kernel-doc:: drivers/firmware/stratix10-svc.c
    :export:
+
+NXP Secure Enclave Firmware Interface
+=====================================
+
+Introduction
+------------
+The NXP's i.MX HW IP like EdgeLock Enclave, V2X etc., creates an embedded secure
+enclave within the SoC boundary to enable features like:
+
+- Hardware Security Module (HSM)
+- Security Hardware Extension (SHE)
+- Vehicular to Anything (V2X)
+
+Each of the above features is enabled through dedicated NXP H/W IP on the SoC.
+On a single SoC, multiple hardware IP (or can say more than one secure enclave)
+can exist.
+
+NXP SoCs enabled with the such secure enclaves(SEs) IPs are:
+i.MX93, i.MX8ULP
+
+To communicate with one or more co-existing SE(s) on SoC, there is/are dedicated
+messaging units(MU) per SE. Each co-existing SE can have one or multiple exclusive
+MUs, dedicated to itself. None of the MU is shared between two SEs. Communication
+of the MU is realized using the mailbox driver. Each secure enclave can cater to
+multiple clients by virtue of these exclusive MUs. Also, they can distinguish
+transactions originating from these clients based on the MU used and core security
+state. The communication between the clients and secure enclaves is in the form of
+a command/response mechanism. Each client could expose a specific set of secure enclave
+features to the higher layers, based on the commands supported by that client. For
+example, the secure enclave could simultaneously support an OPTEE TA and Linux
+middleware as clients. Each of these clients can expose a specific set of secure
+enclave features based on the command set supported by them.
+
+NXP Secure Enclave(SE) Interface
+--------------------------------
+MU(s) is/are not shared between SE(s). But for an SoC like i.MX95 which has
+multiple SE(s) like HSM, V2X-HSM, V2X-SHE, all the SE(s) and their interfaces 'se-if'
+that is/are dedicated to a particular SE will be enumerated and provisioned using the
+single compatible node("fsl,imx95-se").
+
+Each 'se-if' comprises two layers:
+
+- (C_DEV Layer) User-Space software-access interface.
+- (Service Layer) OS-level software-access interface.
+
+::
+
+   +--------------------------------------------+
+   |            Character Device(C_DEV)         |
+   |                                            |
+   |   +---------+ +---------+     +---------+  |
+   |   | misc #1 | | misc #2 | ... | misc #n |  |
+   |   |  dev    | |  dev    |     | dev     |  |
+   |   +---------+ +---------+     +---------+  |
+   |        +-------------------------+         |
+   |        | Misc. Dev Synchr. Logic |         |
+   |        +-------------------------+         |
+   |                                            |
+   +--------------------------------------------+
+
+   +--------------------------------------------+
+   |               Service Layer                |
+   |                                            |
+   |      +-----------------------------+       |
+   |      | Message Serialization Logic |       |
+   |      +-----------------------------+       |
+   |          +---------------+                 |
+   |          |  imx-mailbox  |                 |
+   |          |   mailbox.c   |                 |
+   |          +---------------+                 |
+   |                                            |
+   +--------------------------------------------+
+
+- service layer:
+  This layer is responsible for ensuring the communication protocol that is defined
+  for communication with firmware.
+
+  FW Communication protocol ensures two things:
+
+  - Serializing the messages to be sent over an MU.
+  - FW can handle one command message at a time.
+
+- c_dev:
+  This layer offers character device contexts, created as '/dev/<se>_mux_chx'.
+  Using these multiple device contexts that are multiplexed over a single MU,
+  userspace application(s) can call fops like write/read to send the command message,
+  and read back the command response message to/from Firmware.
+  fops like read & write use the above defined service layer API(s) to communicate with
+  Firmware.
+
+  Misc-device(/dev/<se>_mux_chn) synchronization protocol::
+
+                                Non-Secure               +   Secure
+                                                         |
+                                                         |
+                +-----------+      +-------------+       |
+                | se_ctrl.c +<---->+imx-mailbox.c|       |
+                |           |      |  mailbox.c  +<-->+------+    +------+
+                +-----+-----+      +-------------+    | MU X +<-->+ ELE |
+                      |                               +------+    +------+
+                      +----------------+                 |
+                      |                |                 |
+                      v                v                 |
+                  logical           logical              |
+                  receiver          waiter               |
+                     +                 +                 |
+                     |                 |                 |
+                     |                 |                 |
+                     |            +----+------+          |
+                     |            |           |          |
+                     |            |           |          |
+              device_ctx     device_ctx     device_ctx   |
+                                                         |
+                User 0        User 1       User Y        |
+                +------+      +------+     +------+      |
+                |misc.c|      |misc.c|     |misc.c|      |
+   kernel space +------+      +------+     +------+      |
+                                                         |
+   +---------------------------------------------------- |
+                    |             |           |          |
+   userspace   /dev/ele_muXch0    |           |          |
+                          /dev/ele_muXch1     |          |
+                                        /dev/ele_muXchY  |
+                                                         |
+
+When a user sends a command to the firmware, it registers its device_ctx
+as waiter of a response from firmware.
+
+Enclave's Firmware owns the storage management over a Linux filesystem.
+For this c_dev provisions a dedicated slave device called "receiver".
+
+.. kernel-doc:: drivers/firmware/imx/se_ctrl.c
+   :export:

-- 
2.43.0

