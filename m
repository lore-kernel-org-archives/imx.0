Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013040.outbound.protection.outlook.com [40.107.162.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7470239B979
	for <imx@lists.linux.dev>; Tue,  7 Apr 2026 09:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775553275; cv=fail; b=S+ZDiOGoYMaYIX9LbT6FDGSRiQUp1L8OZcUj3Hl8KXYENL86+rpNTiqCyt+r15bnLFK4oM6By/2Sp3OS0M9s1JmxL7kZ5KIAo6tI0L8XaY7AI/URe4fRkWLU1uwoEzM+WYUQStUmSHLOIAoCbkzToZetlpgUmmmyWMI332aR+j8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775553275; c=relaxed/simple;
	bh=aI2HNDgC9WBi405D9QTczJNVXD5qXYW+ZJNVnXetnwI=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=mzDxxIx51K62gj0suxd59eq0jCNqz7soo2ybi196ZmoLcfqs/TqBlooHX5EgDunbYjvKZNwWQYLWRQxloTipegPE06IQeHR7ynPpEEBQBGiNGWMaUncVP2H2aO8eOinNZ77laxxlz8TQCSfUx717Qd8ZCiTux+QCrpwb0jkY7Z8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OwIUSwvR; arc=fail smtp.client-ip=40.107.162.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OwIUSwvR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YBnT92K8ycNXTOAg4Yd+r87QFL1aAgEnYCKgo3biFNXNtKuVAWThbJtTMz111k39at65XLlyHhz75WQBKMFkCIw3PllVrDH8OvL3ZAdv5qzxVkBn1f+R5gZDL6LJZNfHfvRWQca7LOpWkrpD9FPRGtz+/y0TjUtv5HhQIxeYF7DVKDCh6hFXo0IxzI3pzWE8kop7rZeJ7o0gf+80ql6/kEUUEojQEg2etq1p5AVE3H1UvFjj26sxDc9GZxYtBi76JdVNTRt6NPGf93EL+4rbnHDyJl87A4wUB/u6/5qoPTULLjVcr1cD9uUiR6N1OXyOGhwUGn9EFPfWTwEWosowmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2MF/MN+b3hlwGByNR9lp9Gu7rUx4bnKbrtd71HML+zI=;
 b=HEvfw2vxuffdMpQXBv65WvTT0vIuH6li8SmI/Vryn3nrUMyRAl9UbS/tVOkXQcpC7HMI635FOeZ+ArICLLHIgcYizdD0VNAIv1+TpQ6CweqQhw0PrsorBE+H5hQbtE12368zsMp229aZWXfBU4YdpzYdk0SeEJB72bfs1dr8TdFHDYZVrYXLvuLIeAC2HYWvM2NG9G97au0rrM7hQwPV7WpmBX0ynTQUJe0GNmltZ8o/Xowaoi+Sb+tpOoHCP7ljEWNsw6yifmtI9pubs17sq9Acgq2C5jqiL/IasX+0pLTeXQO3MlGJzq8H7yBFAx0xrsloQegHk1xk+ixQSVVtcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2MF/MN+b3hlwGByNR9lp9Gu7rUx4bnKbrtd71HML+zI=;
 b=OwIUSwvRlACUUdYZYVmNQUWLG7bdHWf/2VsSGnnl7KVZqKrVbF6j99gGNEUWLjYcP+TMjV6Br+h9H25fcRIADTLNMXIem8ySMse58R8y2Lcg1+5uF6b7yg79GiNgVit8ddvHdHpW0YUSLlMA0qQW4VRQV9fdkWx/rWc/eiZp0uQaPKLECXS7r2RSDwWKCjhnFSYZFZZ/JKNJ+Vd14Yk8lrr0vWymsmN6X4UK5H5aEvhz3c90e5sqQHwpI6PV4cjbkLSUGVUkv+vslA+1CdzL1aTrE0rV69zRwaHDe5LyNwlT0Gm70wIcdqutBiiMv3/v39dXxQN+KOK8gaQdAc16Jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8069.eurprd04.prod.outlook.com (2603:10a6:20b:3f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 09:14:30 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%3]) with mapi id 15.20.9769.016; Tue, 7 Apr 2026
 09:14:30 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Tue, 07 Apr 2026 17:15:31 +0800
Subject: [PATCH] arm64: dts: imx93-9x9-qsb: Add tianma,tm050rdh03 panel
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-tianma-tm050rdh03-imx93-9x9-qsb-v1-1-24d514a62fdc@nxp.com>
X-B4-Tracking: v=1; b=H4sIADLL1GkC/x3NQQ6DIBBA0auYWTvJVKyKVzFdQJnWWUAVSENiv
 LvE5dv8f0DiKJxgbg6I/Jckv1DxaBt4ryZ8GcVVQ0fdQD2NmMUEbzB7elJ0KykUX7RCXTTuyeL
 AvbXWsXI0Qa1skT9S7sPyOs8Lb1NibHEAAAA=
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: SG2P153CA0021.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::8)
 To AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8069:EE_
X-MS-Office365-Filtering-Correlation-Id: a18e1e1e-0f73-4a8c-575f-08de94861350
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	L35dJR+kgsb8WeJrvgzD3r6WYCWYAJjJz1bqb4ckWs06xzHo/nzX2kWl3iFo2FOckmsxeg7G3ZGyMNillZjnkxDdzp6TuckcVSEcH9yfwjHyY1/7nZ9NRtP+HiAQpMYRHMTbpe7zZ8CT0Ympjkdnfk614yv/ECJOdDZPK9j+CSGi4kRCra3hzmfxtxGQqfBR96kYuWF9UJluhVfLQQnhZz2CD585MyXvcQi6/fVIRLzZdaHrgpyVw3x/uCAvsJbL5OBL2LiUYXqtwGcyKj8Kr5zRrODY/USgCIV6LGOH5gLHMCynPT6s0uap296+lD0IQT6Zd6XZvKTLMo4+34dWeMEgJFMU/XcxrKj9rLvBXTr006WAW029gdZ77cNH8vVcAGtUDuNg0LURIdKTtTu2P0RvIyR6rG3yOk12gXJJ/suWYdF6pKIOd1uyUWqJxpR7g2WOZQo6bnRka0qn+6GQMW2yOp/n+313ufxcvvnq2RF+sx9slceHq0Kt4GdIJnl+LJUsfiOp+CXYibF0d31hIyKxgEpbtw67b9DXpfu3M/nMsrsUwidLpauoBbsr3a39Bt/n2TzpVwVvuU4mUJMTXAOf5hvcRiSiHSXqxOmuOddUdf1u4b4R7paE9EevbzcKLVWiASVY2XrzmfkGf/HYuad5GgnhKVegfHSI2qPqgyPSWPiACwd9wpsdFE67PI2jln8XE+dTG9MirMMcnem2fmNj7ybxS7TQ57kpyZB8iY61WGPY/UefY7PEYHUaRPtlq3aSRMnoZfydlXO/Kf0nvGqf8zJSDH2WtCdEAfbC3Xg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXM1NUM4alNzNmNiZTZ2TnJXS3BRMG5YK05EazNvYXBVQTZxMFo0N0Q0L0s4?=
 =?utf-8?B?bThkdDM1eXArYzJLZ1plVjN6YndQQU5pOUhUWjhPRnVwNTcxZ05VTHlKRFgv?=
 =?utf-8?B?WU9vVmU3bUFVVjh4UUhBaGIyNVNOM2NUY3EvUDRYQnNZUjZOa0pZbGp6L1ZB?=
 =?utf-8?B?bjRjSEdyVnpOQ0ozaEM0RndtQ2ZOUGtKVXAzUWdBTnZoSldMNVFzb3VWRHA4?=
 =?utf-8?B?aVZIYk5RaU9hbnNURHBPU0Q0N0dpL1ltSDk1b1Z2dlZnN296RVhTOStUWkFE?=
 =?utf-8?B?Zk5ZM2FEN3NPaUdnVHJvRU43YjNQOVRwS0pPRTk1NUpzeVNLTUgyRjd1R1Fp?=
 =?utf-8?B?L3dVamtET1prUjlqMFJVdU9jUXlmT1VnRkd4TllnS0Z2VVptWW9LVjdHZ3Zs?=
 =?utf-8?B?QldQM045UHVRcmJIbytzS1ZLdS93cEgrbjhxa1BBdXUwbmtVU21VLzR2N2Vo?=
 =?utf-8?B?ckI5b25XZG5vSy9EZ0RFdVRnVThvNCtYcDgxUEYwa3REeXZKeXJIVlVndHdF?=
 =?utf-8?B?U2ZhdFFhN1VycG5xWHZORE1qRTVIS1pxK2Zvd2Y3b2poWFdIbk05OVBHRXd0?=
 =?utf-8?B?cVhVTmE5RW41RW4wa21SNkh2bGVReGdmeWFscnhSQWMwMXpuRW9jV0pNRXps?=
 =?utf-8?B?c1RjVlE0WVNjZGxpMVJIZGtkVEdDOUZtTVo0VTN3ZGxJWkY3QTB0eWVJQnoy?=
 =?utf-8?B?Slo4b284QWczSlRvS0VhbFZkNGpZbTh0VjBmc1hFUFpqUHpEQ1RHNFlyb2ty?=
 =?utf-8?B?MFB5ZVo3MHptWFJZQzcwQU4zZU5LQjZDcjVvamp1MkM0NCs5c1psZGY5TGI1?=
 =?utf-8?B?ejhRWXZnN3lDYlVGV0VsRXlwK05NWTVLQ09nUkV6WHdrU2dheXFzWnp0L3ky?=
 =?utf-8?B?OVhVaW1DeTdKNW9VUDlWc3ROWHFPV1R2d3Z0eXVieFIvYStBSWhKQVNRRWxZ?=
 =?utf-8?B?bUhRZG5QdXRXR3g0enBGZFR3alpRY2ROaG5PUmlmVDVremhuakh4SEhpY3J3?=
 =?utf-8?B?OGkzSDVRSXYvQUJaUkwxSnNUaEhXQ1B1WVFoTVJDNU1sNnhhT3BrZTZvb292?=
 =?utf-8?B?a2owTzRXdkhGTXA5RHg0dVJKWGFzdVhWOVdIYmpkaEcwNmpEcjhRYm5QaGVn?=
 =?utf-8?B?em9xNDM3REJPTmNnZS9FVGkzc2J3N3dIa3dyYkhoWEVPaUZrd2dHcGdwNmdm?=
 =?utf-8?B?WWV5ck1jTFYyOW9CT2tSaWc2eUVUU3pWVS9lWGFqNHJvalhLYWI3a1dLVFpk?=
 =?utf-8?B?S1J2V0NTM0NWR0NWUWgvYXJaMHVMVWlwS21MTTMvRG11YjlwUDRZQ1hDeFFS?=
 =?utf-8?B?aTNNMWlESklua3V5QndlR2tXZDE2VUlVS3JWdTMxN2pKZ0ZBU2RxRlpTVml5?=
 =?utf-8?B?VmZmVkpaZ2xqV3o4SnQ0T2YwSU5MSFpmaEJlZ05mY1JxbmNCRUs2TU1BMzR1?=
 =?utf-8?B?VW93OXFuL2dSUVlNQjZ0akVkVkFpQnN6VzBDRVZDTGQ1SUhjOGFPTGhDU1Ir?=
 =?utf-8?B?SmlkcEZYcVAzWS9hQ1VqaStSZXRhNXdnbnNoWHdDbk9IRVZRcHdHaDhhNnVR?=
 =?utf-8?B?Y25oMmtBSHNrV0E4UjZLOW9za3p3aDRVU1N4VnRjWmFZUk5NR2xFZlVlbDlL?=
 =?utf-8?B?SWtjMUlSQ0VnY2U1T01qVmlPdE5nY0J2ZjNOUXZPTDFXYVZzM1lyeUV2cXZB?=
 =?utf-8?B?M2Y0clpDd0FRSGtqL3g0aENvNExxQUlOajAzWkhLQkh4aXJ5dmdjUGpwVjZS?=
 =?utf-8?B?bGQzc0JsNHJhT0lZZkpKKzhYdjNjZnBRNmRkTlpRUmRjeFVsWC9RZTc2RXYr?=
 =?utf-8?B?WkoyTHYzWEQ3SGZidzl3OWZaam5oVmJuc0plcG9hYUI5MWhUMEZMRHpOMVB6?=
 =?utf-8?B?bFBvc2UzMzRPUmtoSnUycHByZ1kxakIreERCWFNEZzVLWXhTdCtBdko4aFpZ?=
 =?utf-8?B?SUVqMkt6eUdwd3IyNXhyU3M5Tjgya3dUelcxRi9kdUR6Qzdkd0ZzQkhBZWwr?=
 =?utf-8?B?aUZQMlZVei9XTnBpUjFsNzVGcUx2UUlXdWpBM1hCbUk1MXV5TGloYSsvZHcy?=
 =?utf-8?B?dndZZXk2d3ZEWkhkbFlXU0gwNStWcVpzVG45MHpzd0Z0clhjNFBFRHd2WnRa?=
 =?utf-8?B?cVpsakYxSzRYMElZR1pBbm1xRmJWQzZLbFBWK3hUOURJS09NSTBzUktwY0Z1?=
 =?utf-8?B?b1BiSVMzYjMrNzlQRVRkYncyL1docG94Q2tyL29YdDRzMzUxVUNoZlJoanVj?=
 =?utf-8?B?UkJzZmxUekd0bW5DaXBoOG5RTklZSFZaZ2pkc3ZQQ21uWFp1MVJqdEJHM3Fk?=
 =?utf-8?B?cElqVzlGNVh3aW9lR2wzK2xaRjZ3czlHSlB6dTlhQitjZy96NjJ2dz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a18e1e1e-0f73-4a8c-575f-08de94861350
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 09:14:30.5627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oB9JOg1UYvq2H2CMERF/0BE/889YKWSgFftuF4Hf3TQJfF3FfXkKKVNkdjMeAPP4c/ejkP1/K7gQ1hXB3BZB+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8069

Support tianma,tm050rdh03 DPI panel on i.MX93 9x9 QSB.

The panel connects with the QSB board through an adapter board[1]
designed by NXP.

Link: https://www.nxp.com/design/design-center/development-boards-and-designs/parallel-lcd-display:TM050RDH03-41 [1]
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtsi       | 110 +++++++++++++++++++++
 .../imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtso       | 106 +-------------------
 .../freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtso |  14 +++
 4 files changed, 127 insertions(+), 105 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 711e36cc2c99..6315fb8390ff 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -455,9 +455,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
 imx93-9x9-qsb-can1-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-can1.dtbo
 imx93-9x9-qsb-i3c-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-i3c.dtbo
 imx93-9x9-qsb-ontat-kd50g21-40nt-a1-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtbo
+imx93-9x9-qsb-tianma-tm050rdh03-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-tianma-tm050rdh03.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-can1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-tianma-tm050rdh03.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtsi b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtsi
new file mode 100644
index 000000000000..d167c9fc3b8f
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtsi
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "imx93-pinfunc.h"
+
+&{/} {
+	backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&pcal6524 2 GPIO_ACTIVE_HIGH>;
+	};
+
+	panel {
+		compatible = "ontat,kd50g21-40nt-a1";
+		backlight = <&backlight>;
+		power-supply = <&reg_rpi_3v3>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dpi_to_panel>;
+			};
+		};
+	};
+};
+
+&dpi_bridge {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lcdif>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			dpi_to_panel: endpoint {
+				remote-endpoint = <&panel_in>;
+				bus-width = <18>;
+			};
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_lcdif: lcdifgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO00__MEDIAMIX_DISP_CLK		0x31e
+			MX93_PAD_GPIO_IO01__MEDIAMIX_DISP_DE		0x31e
+			MX93_PAD_GPIO_IO02__MEDIAMIX_DISP_VSYNC		0x31e
+			MX93_PAD_GPIO_IO03__MEDIAMIX_DISP_HSYNC		0x31e
+			MX93_PAD_GPIO_IO04__MEDIAMIX_DISP_DATA00	0x31e
+			MX93_PAD_GPIO_IO05__MEDIAMIX_DISP_DATA01	0x31e
+			MX93_PAD_GPIO_IO06__MEDIAMIX_DISP_DATA02	0x31e
+			MX93_PAD_GPIO_IO07__MEDIAMIX_DISP_DATA03	0x31e
+			MX93_PAD_GPIO_IO08__MEDIAMIX_DISP_DATA04	0x31e
+			MX93_PAD_GPIO_IO09__MEDIAMIX_DISP_DATA05	0x31e
+			MX93_PAD_GPIO_IO10__MEDIAMIX_DISP_DATA06	0x31e
+			MX93_PAD_GPIO_IO11__MEDIAMIX_DISP_DATA07	0x31e
+			MX93_PAD_GPIO_IO12__MEDIAMIX_DISP_DATA08	0x31e
+			MX93_PAD_GPIO_IO13__MEDIAMIX_DISP_DATA09	0x31e
+			MX93_PAD_GPIO_IO14__MEDIAMIX_DISP_DATA10	0x31e
+			MX93_PAD_GPIO_IO15__MEDIAMIX_DISP_DATA11	0x31e
+			MX93_PAD_GPIO_IO16__MEDIAMIX_DISP_DATA12	0x31e
+			MX93_PAD_GPIO_IO17__MEDIAMIX_DISP_DATA13	0x31e
+			MX93_PAD_GPIO_IO18__MEDIAMIX_DISP_DATA14	0x31e
+			MX93_PAD_GPIO_IO19__MEDIAMIX_DISP_DATA15	0x31e
+			MX93_PAD_GPIO_IO20__MEDIAMIX_DISP_DATA16	0x31e
+			MX93_PAD_GPIO_IO21__MEDIAMIX_DISP_DATA17	0x31e
+		>;
+	};
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&media_blk_ctrl {
+	status = "okay";
+};
+
+&pcal6524 {
+	/*
+	 * exp-sel-hog has property 'output-low' while DT overlay doesn't
+	 * support /delete-property/. Both 'output-low' and 'output-high'
+	 * will exist under hog nodes if DT overlay file sets 'output-high'.
+	 * Workaround is to disable this hog and create new hog with
+	 * 'output-high'.
+	 */
+	exp-sel-hog {
+		status = "disabled";
+	};
+
+	exp-high-sel-hog {
+		gpio-hog;
+		gpios = <22 GPIO_ACTIVE_HIGH>;
+		output-high;
+	};
+};
+
+&sai3 {
+	/* disable due to GPIO12 and GPIO17~20 pin conflicts with LCDIF */
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtso b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtso
index d167c9fc3b8f..356533a7b513 100644
--- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtso
+++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtso
@@ -3,108 +3,4 @@
  * Copyright 2026 NXP
  */
 
-/dts-v1/;
-/plugin/;
-
-#include <dt-bindings/gpio/gpio.h>
-#include "imx93-pinfunc.h"
-
-&{/} {
-	backlight: backlight {
-		compatible = "gpio-backlight";
-		gpios = <&pcal6524 2 GPIO_ACTIVE_HIGH>;
-	};
-
-	panel {
-		compatible = "ontat,kd50g21-40nt-a1";
-		backlight = <&backlight>;
-		power-supply = <&reg_rpi_3v3>;
-
-		port {
-			panel_in: endpoint {
-				remote-endpoint = <&dpi_to_panel>;
-			};
-		};
-	};
-};
-
-&dpi_bridge {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_lcdif>;
-	status = "okay";
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@1 {
-			reg = <1>;
-
-			dpi_to_panel: endpoint {
-				remote-endpoint = <&panel_in>;
-				bus-width = <18>;
-			};
-		};
-	};
-};
-
-&iomuxc {
-	pinctrl_lcdif: lcdifgrp {
-		fsl,pins = <
-			MX93_PAD_GPIO_IO00__MEDIAMIX_DISP_CLK		0x31e
-			MX93_PAD_GPIO_IO01__MEDIAMIX_DISP_DE		0x31e
-			MX93_PAD_GPIO_IO02__MEDIAMIX_DISP_VSYNC		0x31e
-			MX93_PAD_GPIO_IO03__MEDIAMIX_DISP_HSYNC		0x31e
-			MX93_PAD_GPIO_IO04__MEDIAMIX_DISP_DATA00	0x31e
-			MX93_PAD_GPIO_IO05__MEDIAMIX_DISP_DATA01	0x31e
-			MX93_PAD_GPIO_IO06__MEDIAMIX_DISP_DATA02	0x31e
-			MX93_PAD_GPIO_IO07__MEDIAMIX_DISP_DATA03	0x31e
-			MX93_PAD_GPIO_IO08__MEDIAMIX_DISP_DATA04	0x31e
-			MX93_PAD_GPIO_IO09__MEDIAMIX_DISP_DATA05	0x31e
-			MX93_PAD_GPIO_IO10__MEDIAMIX_DISP_DATA06	0x31e
-			MX93_PAD_GPIO_IO11__MEDIAMIX_DISP_DATA07	0x31e
-			MX93_PAD_GPIO_IO12__MEDIAMIX_DISP_DATA08	0x31e
-			MX93_PAD_GPIO_IO13__MEDIAMIX_DISP_DATA09	0x31e
-			MX93_PAD_GPIO_IO14__MEDIAMIX_DISP_DATA10	0x31e
-			MX93_PAD_GPIO_IO15__MEDIAMIX_DISP_DATA11	0x31e
-			MX93_PAD_GPIO_IO16__MEDIAMIX_DISP_DATA12	0x31e
-			MX93_PAD_GPIO_IO17__MEDIAMIX_DISP_DATA13	0x31e
-			MX93_PAD_GPIO_IO18__MEDIAMIX_DISP_DATA14	0x31e
-			MX93_PAD_GPIO_IO19__MEDIAMIX_DISP_DATA15	0x31e
-			MX93_PAD_GPIO_IO20__MEDIAMIX_DISP_DATA16	0x31e
-			MX93_PAD_GPIO_IO21__MEDIAMIX_DISP_DATA17	0x31e
-		>;
-	};
-};
-
-&lcdif {
-	status = "okay";
-};
-
-&media_blk_ctrl {
-	status = "okay";
-};
-
-&pcal6524 {
-	/*
-	 * exp-sel-hog has property 'output-low' while DT overlay doesn't
-	 * support /delete-property/. Both 'output-low' and 'output-high'
-	 * will exist under hog nodes if DT overlay file sets 'output-high'.
-	 * Workaround is to disable this hog and create new hog with
-	 * 'output-high'.
-	 */
-	exp-sel-hog {
-		status = "disabled";
-	};
-
-	exp-high-sel-hog {
-		gpio-hog;
-		gpios = <22 GPIO_ACTIVE_HIGH>;
-		output-high;
-	};
-};
-
-&sai3 {
-	/* disable due to GPIO12 and GPIO17~20 pin conflicts with LCDIF */
-	status = "disabled";
-};
+#include "imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtso b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtso
new file mode 100644
index 000000000000..c233797ec28c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include "imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtsi"
+
+&{/} {
+	panel {
+		compatible = "tianma,tm050rdh03";
+		enable-gpios = <&pcal6524 8 GPIO_ACTIVE_HIGH>;
+	};
+};

---
base-commit: 816f193dd0d95246f208590924dd962b192def78
change-id: 20260407-tianma-tm050rdh03-imx93-9x9-qsb-6e4bbbde3d08

Best regards,
-- 
Liu Ying <victor.liu@nxp.com>

