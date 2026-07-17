Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010033.outbound.protection.outlook.com [52.101.69.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61473F39D4
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 10:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784285769; cv=fail; b=pXRUQQWb1nniZFPudPgHuFrGTspHQ05xA+2XzhASYcVqzAO+JVkDVz+Ozv/GDe+KP8M5ckzLO6JvY2Am6yhyA27VYP47R8kzmt7Wfh/dRknSuTw6rXqx3fvdd/JSx2nlZlRfjH0a6NMGDtjTF2Ks8C2adXnq9rgaeXVgKknap2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784285769; c=relaxed/simple;
	bh=x0zA+so0vwNB/8apf1DOHYOg/rN7BI2bj1buXqeuZk4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mrOgrIjihnm+YPt4Ci2XSyMx3ZrTPwsR9tBrQtB8o7v7GMO/ImJFvcYMIyx+yoKu36b9NogkbrLkbZVInzwgnh8bR0E+y4Md/D4LdQVoe0OP8+2qbvEfpppSunZXr1G7JkeYuC4F/jP1sx+xybdh5jIe8DSAXh63LS/L8ZM6+6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=P2qBgqkI; arc=fail smtp.client-ip=52.101.69.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="P2qBgqkI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J77PNsX0sgDtwL15IpxbeIKndfIj1G+Fh2ePQ/Rlv4fOMJux4tVp1sjKplxoO0l9chbv1toDVNeE2I0vu/7NLinQUZWhabksK7lgXeHRv3+/4WWmcnBnRct++8vOY+eZ1jZSh7mfw6bR1JIJyxG/cs56PXR6pg7OUTYMFPEbFrmbpsqMuLL6oGOG/RkYv7rDp7SexQl8LLHV/lWnTD2CGir/3GnsotHS2pjFsV6XSdmCcwjJD+yGA4ZAseERDi6PM4PuUDyLvzBl5zZV0xWViw1dmt7leKTfD+Aw72V7oRZclIfh2CAzvM8hf2Vel8+v3vHUEkXmVRf7cGDOuVv4DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRvuNryBIqDUz+AyVwSc6KlAoZ08cKn3ySf0G6JSjh8=;
 b=KTF5pRsh1/R8RCoogk46c8MrgvqFADmVdMXfSWKM3J1koeEQbzhKn5qZxLlQdvPTL465u/9g5IynwenSYFt5vsMuA57AEqultsZmenwOLPV+4071bLQFnYpZE0twpFe+IG8CFWD6t7vY4hwdVnmvdSHZIZokbd7ceKsfyLgsOzy1xjgl3kPsCLo7wPUKSgUarygYbMMsd1xRU33cOv9t2ixypr10L48HCFK6KY/VeoBKgvqFI+QMxu5peNg5R90iGOi+S3k5z+llROaiHGqPSQgTMzytcI1N4UQeJ9FjUt2kGG+RzNJNBRNO1M3kgbLMgOGWZaE2aNXsse0GacqxpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRvuNryBIqDUz+AyVwSc6KlAoZ08cKn3ySf0G6JSjh8=;
 b=P2qBgqkIw+G5yn31Pj0iOkWA+nFG21MkLvjIgBUY60azKd70zfaynC2vjOKJJQoh4dJi8yBMeSyL/srE74Flc6BRiCQgBgZtpH2ZbrW38hYJtximWp5uwMSiRmzIqvoCkQOb4xvvJGYOQeq95WdXwSSVnleBsaoiAGKS1P39wLmo/UPLBYFIkXj+Xx5DjyH97RCOMY4KQzCjRiD6BxdhtfMbkdpD0/0cfgycFAiP2CospErVvrT1aZR2Y4DM6wOx1IXOBBNDMRFmaslqDoWZ4yBQ9AsbXM7tV2tHXlfhOn3C59WzLW+oy4RtXefRbnJDwvjuukYd4qYAUsKeBXxWYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8465.eurprd04.prod.outlook.com (2603:10a6:20b:348::19)
 by VI2PR04MB10224.eurprd04.prod.outlook.com (2603:10a6:800:228::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Fri, 17 Jul
 2026 10:55:40 +0000
Received: from AS8PR04MB8465.eurprd04.prod.outlook.com
 ([fe80::36fa:43c3:5ac6:9545]) by AS8PR04MB8465.eurprd04.prod.outlook.com
 ([fe80::36fa:43c3:5ac6:9545%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 10:55:40 +0000
From: pankaj.gupta@oss.nxp.com
Date: Fri, 17 Jul 2026 17:15:35 +0530
Subject: [PATCH v28 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-imx-se-if-v28-4-0a9659c7e69d@nxp.com>
References: <20260717-imx-se-if-v28-0-0a9659c7e69d@nxp.com>
In-Reply-To: <20260717-imx-se-if-v28-0-0a9659c7e69d@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, sashiko-bot <sashiko-bot@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784288732; l=14465;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=3KXLfqCh/N9x0IWCdekM55Iw73IgIwl+ZV3gTKbssRA=;
 b=Ubj1iw+ugbtT8QQxObRL6G7cMxMa0sI3oQQMQJpXjJElqHiZxp7Egg9fG+/YtX37R2DZOutl0
 fwwqVx5CXp5Bxpoa6Ewn9gfofqH7uVoIHLlVCA4ep/vIdb8ip0t8z+G
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA5P287CA0313.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21a::17) To AS8PR04MB8465.eurprd04.prod.outlook.com
 (2603:10a6:20b:348::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8465:EE_|VI2PR04MB10224:EE_
X-MS-Office365-Filtering-Correlation-Id: 250bd90d-a574-440c-0d83-08dee3f1f10d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|23010399003|7416014|10067099003|6133799003|11063799006|56012099006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	KFIKbBqDlgDi/aoA/J3OwJxyEF19fpvygoYIdJHUjWUprJyJmSeiwpL9TeGBdJ6kPXEYdp39BFXg62T90L5CS/a+HiJAgbDN/sVsUT9VEYP0YwhKFgcyk7yYB0NiD/qK9jbG/I78nlToEVatMQylgdgM5WBJkRxBeqqcvXRNe7m+Mrp+Bf5NnAoxhKaTQlNQFXiTWok1wBRHH5PE13r2zgVdZYa2tZOLnJeeucAngjnbzPsMyBTUxxiSvRq7T3BVHbuzaZcggKZVpb+WLTYYRH01bSL/moMZfzybOGgDJ5cN3kwjCY73pw3gKCI9J/BEWlw4AP4HBp/vwh3BkTfyil7UM3Qs0N3XIkhzE1J9nF9taUJLPX84v6H8NNO8YSqIiwcvOtovzouI2uyCDvLBRqzqBL0ggpCXnii9wyjrjnFaqVoE10I36cjr+9roc7mksrAySj1FdRTP6tH11zbKxeNhqBYDd+hHKvTfrexMvK/94bbKWlYbDsNnRz+FS4CbhIn70qEdTf6O2cRaw3RT4aHKQ+Hn1q9sGZJNymm+L6Pc4o7bteIs62Qd8SQQPgR5y/qt7TmXqaHBaLjvNkvZgIXCkGz0Lci8nqlyQKhAU47ZWZcTZfYJzFPD7AurbQufv4UO8XKMo9KwVo89jWYcwQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8465.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(23010399003)(7416014)(10067099003)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWVDS2FjYWVlU0gzN2RqMlpKMEM5V1VJMDM0dU9UMFRuTEE2VWI5a0RaeHg4?=
 =?utf-8?B?aGZaM2hyWWVJd3l4Tkh5T0hHaXNjKzRIanI3NTFieEVVM1BVNSs0T1R3M2hX?=
 =?utf-8?B?Q3lqQ1lldDJZYmJVb1hVVXoyd0pHTWhaTmJNdzE2L0psSlBvV09lM1ZNaGRK?=
 =?utf-8?B?M0huL3M5TWxQTnduWGpWWkk1Wm9Tc1JXTnh6TmU0NDU0dFA1N2RxdDZNbjdZ?=
 =?utf-8?B?WWppck9NMHB1Yk1FaUJRVzU4anJxdDBmS1UzbzJYcVMwRjdTWEdZSEE5UUxQ?=
 =?utf-8?B?a2VyWGNaSlA0aEJRakVuTVkxcnRWRUREdzlUdk5qMkJHZHVHazQ5QldEVWlm?=
 =?utf-8?B?b3dsUWJRV05pdGk0RlhqWXJrbHg4bzl4dld5Vkxpb21jNG95NzYxaHhXSnFo?=
 =?utf-8?B?UDYzS0VZYnRQYmRQMm43TmlzNHlFWml0RTBValo4VnVSczBwOWtpK2k1NitD?=
 =?utf-8?B?SWtuUXYxd2lYc0piSWRSeE9UbWdPZkFQaU51eE51R0FNWEVwd2JWbi8vZXpH?=
 =?utf-8?B?dXBjRlhJc1VxNXd2Y2FOeHBoVW9LTGNFYm9PSUFRU0V4VEhjMEg4ZXdYYTA0?=
 =?utf-8?B?OVRNNkFkMHdiaHJNdTV6bFQ0b0R4Y0t3N1B4UUhyYWYzQ3BLZDJuTkxWMnd5?=
 =?utf-8?B?a2ZSeVN3Q2crelF4Tm5tdExLUVZPbWlyazNkYmxmK3NJSjE4T3BZdWFRNGtI?=
 =?utf-8?B?bmNBMmFjclprSy9mVXJ0R0VHQUFsUzRnSldCTDNRTEJIcFJabmZzS0lVcnBu?=
 =?utf-8?B?cWhFTUJUR3YvWDN4TCtDbzE4ZHZNTjlmQkdnSXRZN2NBVDE2NDNXMlZRQkNW?=
 =?utf-8?B?V2RqaE9PTVRoU1lKbzhpT2dZM3hjd2lXV3QvY0lZWVA2c1Y4clJrOXZPVWlZ?=
 =?utf-8?B?ZFV2dXVzWVhwU0J4L1AxYWdzNWdGVUd2cENCNFhzbENuV0dBQnpGZTB5MjYw?=
 =?utf-8?B?MVJEVExiazBRSzhyV05mbnNqaUZEWGR1ODE0VHc3VmZaU3FVUTZZV21TcFBp?=
 =?utf-8?B?QVJSQkFhZldMdlhKWEVvdTM2RDVTbzBnRHRKZ2NWRTlON21LVnBZOXlvL3lG?=
 =?utf-8?B?aTVGNjk3aXIrNkFseFp1T0FCcmVOYTNlOC91dUdDYlZSTy9qNHJhcG45OC9G?=
 =?utf-8?B?S2dKRkNyNE12WmNDWGh1ckprZUNCaWhmYXM4QUtKMnQxR0pRcitQSkw1d2tv?=
 =?utf-8?B?UmkxTHdXaEg3UEtzZGxhRUtrZDdYNDBybGZDZVhOS2JGRXQzellxemRoSGV5?=
 =?utf-8?B?blhYbWgvdmVySThHL1FDT2lDT0lZZmR6bVBaUDhKSXpaNnlKVWdPdTdDWHhS?=
 =?utf-8?B?dERsSVhDMkdWY09PMkoydDRHOGNVcTNiL2wrWkhGMVhJY2N6MFlreCtkTjNV?=
 =?utf-8?B?TXVFenRFM3BLL2FWVW9weXdRWUtkM1R6eFUxZExMN01vQy83WkliZFB6Nmla?=
 =?utf-8?B?cGZwM0h6T3dZSWlKc0JmR2tOV3dUU3I3SWcyTVQxZERIcXNncjBOaG1xY2Nn?=
 =?utf-8?B?Yzh0bzZwdXo3cUp2REpVUTB3cWk3dnlQOHdwd2pVSmg1czRKWGpFbzBNNXpn?=
 =?utf-8?B?eW5wQkZjUzNpZGdLK3gzUVNkR1FSYlQzRFhOK2Rjcm9zeWR6VjU2bTF6cWd5?=
 =?utf-8?B?bk5GYWFwd080bnhFOHpFd2MvY2g3NUpCcVEzb3V6cTJyNm82UjFxM3BuZ3RL?=
 =?utf-8?B?KytpbVZnVzdVMytDZGN5WStwQmMyYS80K2xHSTRtUUpubFlZWUcxemdpcTFm?=
 =?utf-8?B?QTZ0RTd0OVNTQUtlc0w4OVk0WkgxeFpkYXZqckVySXlNa2JUa244OXdlQkc4?=
 =?utf-8?B?Y0tPbWU2dFFHN3I0VDZ5dVNyL0cxUVNaWjE1dEo1Z0xMYjQ1ZGsxM2FoZ0Nx?=
 =?utf-8?B?bTc1SXh3VkdnK2lwd1lLR01Db3lmczRqWllQQlBUSk96S1dnSUZGL0dIR3Fh?=
 =?utf-8?B?Yk1GVU1JeVRabHhVMFRLT2liWlRBWURDTThtcFZkRVhIWTNkOVNPc1orV3B2?=
 =?utf-8?B?eUppNWpVaDlqNHZYd24xT2JuWGEzRW5uV1d5RVBnTEdyQzFTWXZyQXY5WFdq?=
 =?utf-8?B?NFJKZFFCOU13dTVYUTFuK0VJNmFTd0l4emdVbndXRTRnU3hrRHRLaWhPcUM1?=
 =?utf-8?B?TngzdmF1UXJwVm02Y2RmNmF4UXFzYkRadDBsZlBLMUZtekJzWjI2MjJJcENO?=
 =?utf-8?B?K0srRWpyaUVlaVJuL1ZvQjJIdk1ueG9JcmwvUlFQK2hxV2p0NzJ5R2Q5Z29J?=
 =?utf-8?B?QnQ2YmRxblg0UTQyQk9DSkFNTGlqdDZZRXRodXNPaUUzZ0RObjNVWEV4MHF0?=
 =?utf-8?B?emFxNnhLcFlqOUJnc2NpOHZRY1ZPVFd5ZGdEbkdFMS9kS3I1WFNoMlFYVFFP?=
 =?utf-8?Q?OA/pJF2jLt+p8jSGPuagKsJhdDYK110oc3d7K?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 250bd90d-a574-440c-0d83-08dee3f1f10d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8465.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 10:55:40.5334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TUM5Z81t574gI7HU7vGDtoI3OLCHFdIbV056XkJCkKgQMgisKOpDbHCQjmVRfWjJewAAb9SvcoQlgBELW9wT8isb0uH41CCIVCdWpk35xmmWj9XKo3rAy2VrJEgg9ix3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10224

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW.

No functionality change.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes from v27 to v28
- Fix init_misc_device_context() to return 0 on the success path.

  The helper initialized ret to -ENOMEM and returned ret even after
  successfully allocating and initializing priv_dev_ctx. This caused
  se_if_probe() to treat a successful init_misc_device_context() call as a
  failure and abort probe. Return 0 after assigning *new_dev_ctx.

- Avoid a possible NULL pointer dereference in se_if_rx_callback() after
  waking the synchronous response waiter.

  The response callback used se_clbk_hdl->dev_ctx->devname after calling
  complete() and dropping clbk_rx_lock. The awakened ele_msg_send_rcv()
  cleanup path can clear waiting_rsp_clbk_hdl.dev_ctx under the same lock
  before the size-mismatch dev_err() is emitted.

  Snapshot devname while clbk_rx_lock is still held and use the local copy
  after dropping the lock.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260715-imx-se-if-v27-0-bb7c45952f06@nxp.com?part=4

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 drivers/firmware/imx/ele_base_msg.c | 15 ++++++-----
 drivers/firmware/imx/ele_common.c   | 53 ++++++++++++++++++++++---------------
 drivers/firmware/imx/ele_common.h   |  8 +++---
 drivers/firmware/imx/se_ctrl.c      | 42 +++++++++++++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h      |  9 +++++++
 5 files changed, 94 insertions(+), 33 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index ac6a1c1e8cd4..6a6db60887af 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -66,8 +66,9 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 	tx_msg->data[0] = upper_32_bits(get_info_addr);
 	tx_msg->data[1] = lower_32_bits(get_info_addr);
 	tx_msg->data[2] = sizeof(*s_info);
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
-			       ELE_GET_INFO_RSP_MSG_SZ);
+
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_GET_INFO_REQ_MSG_SZ,
+			       rx_msg, ELE_GET_INFO_RSP_MSG_SZ);
 	if (ret < 0) {
 		ele_get_info_cleanup(priv, get_info_data, get_info_addr, ELE_GET_INFO_BUFF_SZ);
 		return ret;
@@ -112,8 +113,8 @@ int ele_ping(struct se_if_priv *priv)
 	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
 			    ELE_PING_REQ, ELE_PING_REQ_SZ, true);
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_PING_REQ_SZ, rx_msg,
-			       ELE_PING_RSP_SZ);
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_PING_REQ_SZ,
+			       rx_msg, ELE_PING_RSP_SZ);
 	if (ret < 0)
 		return ret;
 
@@ -160,7 +161,7 @@ int ele_service_swap(struct se_if_priv *priv,
 	if (ret)
 		return -EINVAL;
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
 			       rx_msg, ELE_SERVICE_SWAP_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -208,7 +209,7 @@ int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
 	tx_msg->data[1] = 0;
 	tx_msg->data[2] = lower_32_bits(img_addr);
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
 			       ELE_FW_AUTH_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -246,7 +247,7 @@ int ele_debug_dump(struct se_if_priv *priv)
 	do {
 		memset(rx_msg, 0x0, ELE_DEBUG_DUMP_RSP_SZ);
 
-		ret = ele_msg_send_rcv(priv, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
+		ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
 				       rx_msg, ELE_DEBUG_DUMP_RSP_SZ);
 		if (ret < 0)
 			return ret;
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index ca8a32a82689..1ca22c53b55c 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -46,8 +46,9 @@ int se_update_msg_chksum(u32 *msg, u32 msg_len)
 	return 0;
 }
 
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
 	bool wait_uninterruptible = false;
 	unsigned long remaining_jiffies;
 	unsigned long flags;
@@ -111,7 +112,7 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 	return ret;
 }
 
-int ele_msg_send(struct se_if_priv *priv,
+int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 		 void *tx_msg,
 		 int tx_msg_sz)
 {
@@ -123,9 +124,9 @@ int ele_msg_send(struct se_if_priv *priv,
 	 * carried in the message.
 	 */
 	if (header->size << 2 != tx_msg_sz) {
-		dev_err(priv->dev,
-			"User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
-			*(u32 *)header, header->size << 2, tx_msg_sz);
+		dev_err(dev_ctx->priv->dev,
+			"%s: User buf hdr: 0x%x, sz mismatched with input-sz (%d != %d).",
+			dev_ctx->devname, *(u32 *)header, header->size << 2, tx_msg_sz);
 		return -EINVAL;
 	}
 
@@ -135,9 +136,10 @@ int ele_msg_send(struct se_if_priv *priv,
 	 * caller-provided tx_msg pointer after mbox_send_message() returns, so
 	 * the caller-owned buffer may be released after a successful send.
 	 */
-	err = mbox_send_message(priv->tx_chan, tx_msg);
+	err = mbox_send_message(dev_ctx->priv->tx_chan, tx_msg);
 	if (err < 0) {
-		dev_err(priv->dev, "Error: mbox_send_message failure.\n");
+		dev_err(dev_ctx->priv->dev,
+			"%s: Error: mbox_send_message failure.", dev_ctx->devname);
 		return err;
 	}
 
@@ -149,34 +151,38 @@ static void ele_msg_send_rcv_cleanup(struct se_if_priv *priv)
 	unsigned long flags;
 
 	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
+	priv->waiting_rsp_clbk_hdl.dev_ctx = NULL;
 	priv->waiting_rsp_clbk_hdl.rx_msg = NULL;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = 0;
 	spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
 }
 
 /* API used for send/receive blocking call. */
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz)
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
+	unsigned long flags;
 	int err;
 
 	guard(mutex)(&priv->se_if_cmd_lock);
 
 	if (atomic_read(&priv->fw_busy)) {
-		dev_dbg(priv->dev, "ELE became unresponsive.\n");
+		dev_dbg(priv->dev, "%s: ELE became unresponsive.\n", dev_ctx->devname);
 		return -EBUSY;
 	}
 	reinit_completion(&priv->waiting_rsp_clbk_hdl.done);
+	priv->waiting_rsp_clbk_hdl.dev_ctx = dev_ctx;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = exp_rx_msg_sz;
 	priv->waiting_rsp_clbk_hdl.rx_msg = rx_msg;
 
-	err = ele_msg_send(priv, tx_msg, tx_msg_sz);
+	err = ele_msg_send(dev_ctx, tx_msg, tx_msg_sz);
 	if (err < 0) {
 		ele_msg_send_rcv_cleanup(priv);
 		return err;
 	}
 
-	err = ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
+	err = ele_msg_rcv(dev_ctx, &priv->waiting_rsp_clbk_hdl);
 
 	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
 		/*
@@ -189,7 +195,8 @@ int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
 		if (err > 0)
 			err = -ERESTARTSYS;
 		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
-		dev_err(priv->dev, "Err[0x%x]:Interrupted by signal.", err);
+		dev_err(priv->dev, "%s: Err[0x%x]:Interrupted by signal.",
+			dev_ctx->devname, err);
 	}
 
 	ele_msg_send_rcv_cleanup(priv);
@@ -240,7 +247,7 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	if (header->tag == priv->if_defs->cmd_tag) {
 		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
 		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
-		if (!se_clbk_hdl->rx_msg) {
+		if (!se_clbk_hdl->dev_ctx || !se_clbk_hdl->rx_msg) {
 			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 			dev_warn(dev, "No command receiver registered for message: %.8x\n",
 				 *((u32 *)header));
@@ -254,8 +261,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 * SE_IOCTL_ENABLE_CMD_RCV and is not subject to the timeout/circuit-
 		 * breaker handling used for rsp_tag messages.
 		 */
-		dev_dbg(dev, "Selecting cmd receiver: for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting cmd receiver:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname,  *(u32 *)header);
 
 		/*
 		 * Pre-allocated buffer of MAX_NVM_MSG_LEN
@@ -275,12 +282,13 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 		if (sz_mismatch)
 			dev_err(dev,
-				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header,
+				"%s: CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
+				se_clbk_hdl->dev_ctx->devname, *(u32 *)header,
 				(header->size << 2), rx_msg_sz);
 	} else if (header->tag == priv->if_defs->rsp_tag) {
 		bool exception_for_sz_mismatch = check_hdr_exception_for_sz(priv, header);
 		u32 exp_rx_msg_sz = 0;
+		const char *devname = NULL;
 
 		/*
 		 * waiting_rsp_clbk_hdl.rx_msg is owned by the synchronous sender in
@@ -302,8 +310,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 			dev_info(dev, "ELE responded (late), recovery FW available.");
 			return;
 		}
-		dev_dbg(dev, "Selecting resp waiter: for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting resp waiter:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname, *(u32 *)header);
 
 		/*
 		 * For rsp_tag traffic, the sender provides the expected response
@@ -317,14 +325,15 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 
 			se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, exp_rx_msg_sz);
 		}
+		devname = se_clbk_hdl->dev_ctx->devname;
 		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
 		complete(&se_clbk_hdl->done);
 		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 
 		if (sz_mismatch)
 			dev_err(dev,
-				"Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header,
+				"%s: Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
+				devname, *(u32 *)header,
 				(header->size << 2), exp_rx_msg_sz);
 	} else {
 		dev_err(dev, "Failed to select a device for message: %.8x\n",
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
index 42460d1d5dec..f7d7e3e62dd4 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -14,12 +14,12 @@
 
 int se_update_msg_chksum(u32 *msg, u32 msg_len);
 
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl);
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl);
 
-int ele_msg_send(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz);
+int ele_msg_send(struct se_if_device_ctx *dev_ctx, void *tx_msg, int tx_msg_sz);
 
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz);
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz);
 
 void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg);
 
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 9bb59c200911..f43d06ab123b 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -209,6 +209,36 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
 	return 0;
 }
 
+static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
+				    struct se_if_device_ctx **new_dev_ctx)
+{
+	const char *err_str = "Failed to allocate memory";
+	struct se_if_device_ctx *dev_ctx;
+	int ret = -ENOMEM;
+
+	dev_ctx = kzalloc_obj(*dev_ctx, GFP_KERNEL);
+
+	if (!dev_ctx)
+		return ret;
+
+	dev_ctx->devname = kasprintf(GFP_KERNEL, "%s0_ch%d",
+				     get_se_if_name(priv->if_defs->se_if_type),
+				     ch_id);
+	if (!dev_ctx->devname)
+		goto exit;
+
+	dev_ctx->priv = priv;
+	*new_dev_ctx = dev_ctx;
+
+	return 0;
+exit:
+	*new_dev_ctx = NULL;
+
+	kfree(dev_ctx->devname);
+	kfree(dev_ctx);
+	return dev_err_probe(priv->dev, ret, "%s", err_str);
+}
+
 /* interface for managed res to free a mailbox channel */
 static void if_mbox_free_channel(void *mbox_chan)
 {
@@ -265,6 +295,12 @@ static void se_if_probe_cleanup(void *plat_dev)
 	of_reserved_mem_device_release(dev);
 
 	dev_set_drvdata(dev, NULL);
+
+	if (priv->priv_dev_ctx) {
+		kfree(priv->priv_dev_ctx->devname);
+		kfree(priv->priv_dev_ctx);
+		priv->priv_dev_ctx = NULL;
+	}
 	kfree(priv);
 }
 
@@ -335,6 +371,12 @@ static int se_if_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to set 32-bit coherent DMA mask.");
 
+	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed[0x%x] to create device contexts.",
+				     ret);
+
 	if (if_node->if_defs.se_if_type == SE_TYPE_ID_HSM) {
 		ret = get_se_soc_info(priv, se_info);
 		if (ret)
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index b6833abd81d0..355d38684b1b 100644
--- a/drivers/firmware/imx/se_ctrl.h
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -20,6 +20,7 @@
 #define MESSAGING_VERSION_7		0x7
 
 struct se_clbk_handle {
+	struct se_if_device_ctx *dev_ctx;
 	struct completion done;
 	bool signal_rcvd;
 	u32 rx_msg_sz;
@@ -44,6 +45,12 @@ struct se_imem_buf {
 	u32 state;
 };
 
+/* Private struct for each char device instance. */
+struct se_if_device_ctx {
+	struct se_if_priv *priv;
+	const char *devname;
+};
+
 /* Header of the messages exchange with the EdgeLock Enclave */
 struct se_msg_hdr {
 	u8 ver;
@@ -105,6 +112,8 @@ struct se_if_priv {
 	struct se_fw_load_info load_fw;
 
 	atomic_t fw_busy;
+
+	struct se_if_device_ctx *priv_dev_ctx;
 };
 
 char *get_se_if_name(u8 se_if_id);

-- 
2.43.0

