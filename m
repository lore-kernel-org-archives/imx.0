Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013016.outbound.protection.outlook.com [52.101.83.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394EA358388
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 08:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784880903; cv=fail; b=gMAsXYrKNHWkSWX4FkGhZeiTfzmBBcCTVteFs2SedYMXgc9rr+KTPabdut0r2k6Rj317n6rTfOuiOPsd/u2Erjdhy4zAgLgIzF72bYbl1wNULSgJXpPv6e43PwTE94o49hbrtWhcp6zmgESMtf1Y1US7A58yV40hd8J8Jhlb2fg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784880903; c=relaxed/simple;
	bh=g/tspJdnIjaYPLnhYruDKhmk89UURmZxtfy22fiiEOA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UcWW+IJqpwhZOpafv7L6K7pFtbYQYm6zmy8+2r0gZeepTLaC4ZGILDcIruEqx36f0qHk8OjaY8T9WM6xm30F8oSMwr3/LSaCKJd0OzbWKwLvSWIzQH5Fxh8bajk9nytVVP5plQD+CgXwSqqHHbyglugOIN8lq4wjNFKQbvwoXNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XBBpbqzU; arc=fail smtp.client-ip=52.101.83.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XBBpbqzU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wtIN8LW/OCBB/drQM2OreSujrsQG0UyZaAqzf1RO9ebEpjPr/lk0i9UajuBmy1B2iiKBG0KzJyZUyqNkaZllq89Yb1QFIB+LCxSG3qzgSgKc5qIKceFz/Um2CGhc1deGfzMwtRaxfY/VEVMbqj0F4kxJyRtJGpDYQpGLd2arUO7ytkGg8xFiTsTqNslNxV8DDfoD/ap7KTdFfljbe9tyU1gl14WNG0PpoUiLSUT1Ou8SsGR752WtNgBa5l3pzkfkjC/B4sM5RMmWePW7TdnL8fl03RLg0EgadDmsFKzQDHt+T2JCunef9bryTb3feHmgErncktCYXuoGXJWcs8HtXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=k54bAFp91imAtvVn0n2XW9eM3kGz/3FhqOsw/6rhNlBlG8FM4CAWBKG5nK7+dhirbxn3J4NZCdFlxyYGvphrLsDuZMNxJrgpH4adLuQ30VdFG87JP7KOfawrxC97wfTgIqpGXZaHyjgErYFhYVW+Lgc280EJRBGWH4HQpGSGprrgk5esbsR2kfc5bx+gtR+ecbzGgiLBO96JABKp0ZP406YMe6/49lOc85MHpQPpmIAIRSaBOy9YTZUNxD3/JMuIDSdso0aaya82F+d69xacyQixJYklxEcwHGK+BMDdFRd5SteshDvFxsKE5GX2XjyEZSeHPW2du+tgQuX2Grd9GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=XBBpbqzUihl/nSNdhYXQauEZJYMPAXR06RGc6BOH9o84q5G2jFTEWNgsWZz704PxfjH6KFztrgA/bnclcHFOtqme87yH8gu0rt/6CLEBxs0SDeSwkse9V1MLkf5uMZZd9z/4yfMhNJ7jvGcvGfrT9CVJBASMlm5/6tGiU3gNwhLSLZS/HvlJE13TYDcfvTuld7VRF+ppoZXcSgw3GaTqfWJLyDHOFeDYRGvnDhBPG2oQkb75RDUgJLkpejD6oRNLPLzRcA4cho4R0w5T4Z55z5HpqX9Gy0sgVvLJ9pxMJTc6DEwQSOz1Kz7sxRSg3ME9RLZy6wtROkmoEYsOO/E3EA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AS8PR04MB9048.eurprd04.prod.outlook.com (2603:10a6:20b:443::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 08:14:52 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 08:14:52 +0000
From: pankaj.gupta@oss.nxp.com
Date: Fri, 24 Jul 2026 14:35:09 +0530
Subject: [PATCH v30 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-imx-se-if-v30-1-ce8ba256692c@nxp.com>
References: <20260724-imx-se-if-v30-0-ce8ba256692c@nxp.com>
In-Reply-To: <20260724-imx-se-if-v30-0-ce8ba256692c@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784883913; l=7403;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=ZSAmXRvPjYNeGEa/I9hefXFuALx9geFcXzYMsSoJmHQ=;
 b=lxEvvCy1AdaK9w9hjATKvn6LQRGZeOUWoyCWqK/CfK1hVQvP/hHhUtW/HNrnP6UUXrqQXIh0d
 9tXjdTf/xh/BAkJa0P4yXt5QPbOhdkayxnryzuNnKe0n2JUVKxMIVP2
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA5PR01CA0142.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::17) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AS8PR04MB9048:EE_
X-MS-Office365-Filtering-Correlation-Id: 9911b65c-0c42-4548-d792-08dee95ba30c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|376014|7416014|1800799024|921020|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	MtKqud6A94u6csDmlsF1JJpAUI9zkMOKqOoWOiYWceC1NltdY1Og4SNVSTgiVDkAbkelNb0rUeeX+0OVfUCkcIk+YXhETYlA4Di2Ak3tDgShuVN88ag4B4N8zGLBp9miayDvdbT2Yu3m12rOrMJtbJKfksOAyBK6gFe5k6rYyXuFbFPTnVhZ++SNDu9TepQjxBIFRfgD78AfM5WxtF5RlO6FwJRuU7UPJTOg6NOen5tt53Cbsb0HvDqTb27x4YR5ZqeCOhh86WHW3yfHKqLjCGu3pujLGjFQcvLTVZVl5ViIqtXzlzR+TcKqtstfaAeGW3/VkdFNRARaGsuisGa9A/a3kEGMeHk7+g5JuH/HoLcWha6WCPkj+qipos3DLHPaDaTeE+Y8qTqrYK0flSzX9+8LlahsQC+m1INSlbOrHgIvYKcG+WvQnrps3LQz1u/oxLEi9hVx8hhkY0U6Aqp9Xpkwa7Qm9mikH16DoNuDJ0CFhcAiWcwCY+7MzQdYe2NubpACTmdxEyBbstUVrvMbHeeJk4PDjLuPPWbw2CRa6RkSsQ8iwCym9dUDAsHHsHvKnPZj5Jc7uj/P2j9KbUjG3LJhuMYWfJ9f13GLm2EkB7r/EppRe2vR+b/0tTuwUfV9PcBWVqI+T8F+uIKn0v47zJZ6xePU9wzkiLqj+t2nQXsJ9MjspAnrm7aVSmnEoYb8LagGaV0sU/4y0VKLtRaK9w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(376014)(7416014)(1800799024)(921020)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEU2U1B3OHRnV05IZDhsdTUxSjBwZ1U0S3dvdkljbExKU25oRnc4MElEVUl5?=
 =?utf-8?B?UERnRCs5eWJDVEZDVGxQOElHZXp5clErZ1NWWHJDWGUxQ3loVmx2SzR3Tkdk?=
 =?utf-8?B?MmMwbmdoUFZ3ODVjNVpKUVBMSkh5Y01IVTE4djlDdTlLeVJSaWs1QnJCU3RJ?=
 =?utf-8?B?aHM2ay95b3ByZkRqZzJ3Sk1Ra0dzMStHWGV4M3NGOUU2aE5WOHRUTE1HSHJZ?=
 =?utf-8?B?L3llOThmeVA1Q1hvNXZqM2JrYkVHSHl1cTVlS1FxK2dMV0dKcGkrbG5ZbDBy?=
 =?utf-8?B?N2ZEaUlhYkY4WXZLdkdPSG9QbHowaThocXJGWW9aUVEwVkoyaXZJQ3RUNHpZ?=
 =?utf-8?B?ZUNWdzNaWUdpK0NGbjhPMUw2aFFvR01WVnVLNlhEeWpvK1p4U0tjQjYycFox?=
 =?utf-8?B?VFJBNWkxbjBkbFJxaWtVTExIaGFMWndEWDJQcUpuWmRhRUJHejVvOTFzMGxW?=
 =?utf-8?B?SGp2TTY4TWN4djViRll2S3h2Y29kdUcvNUhSM0tkNFpHVTBSaTdMMkRZeFk3?=
 =?utf-8?B?NThPWjk2SFFhVXJLTmxnMXpDcG5Vc3U5RzJCR0lBQTU4QktFSEVSaWtKRURD?=
 =?utf-8?B?d0J0L3hQUHRQWnhRSUdSUmtPdU5MR3VGR3F3QWdMRDFoOWpmUmJYNFUxZU9q?=
 =?utf-8?B?eTM0MW0wM2paZVg1Tis0d0p1aVVlTjlNdHY0MjZJbHNkRjRYRk5zbmtGTTBv?=
 =?utf-8?B?azFLSm5peDE4a0c5K2VJM3lVTFgvV0J4Vm9NaEkxNlNXajVwT3JDM2FhOGN2?=
 =?utf-8?B?Z0hRc0VVVGlMTEwwM3BXcFRzNlIxcDgyclhiNzl5Q0tONjhLa1NSOEtWM1M3?=
 =?utf-8?B?VDBSaVlWcXBlcGY0QmlCNlQrMnBuRGhBM1pvaXNBZ0ZUV2VCSkYzcmsvNWwr?=
 =?utf-8?B?QnU2aFZXVVhTVm9CYmg1QkgvaFlQUlcvSFFZbUtPUDBzVW83YnIzeWlqNS9o?=
 =?utf-8?B?Y2YxU1VoZko1eTVuM1U3Snk4M1lUV2NHR1hkZ1Fka3U2c3NPcWg5T3RpSU1J?=
 =?utf-8?B?Tk9JUUJFZUJiaVBrYlRVTVJFWXJJVkdGdHREY05idG9BaGdFZ0p0Ym1uNGdP?=
 =?utf-8?B?OXFDWCtsTHRyVHNvbzdwNDFPbzdHRjY4Z25UMTZEamg1U2VyZENscjBCbGFF?=
 =?utf-8?B?Z2licEFnajBSbDNpWnBFM3JXVFNLc2FKQWRZQlQxL3oyaXNpTVNSWXpiem52?=
 =?utf-8?B?dUhwbDA5c3JmbjdOcHlKUUFuQmx1dmVtS3A1VmZ3anpZWmpoRHQyV3ZhVk53?=
 =?utf-8?B?aXpvSElEWlZyVVJLSnEycWlrRFNIQWllYm9LS3FWSml5V3V3Z1E3Ri9oa1hQ?=
 =?utf-8?B?ckFsdjFtV0FnWE1ZVjZZT215Q05mazZLcUc3LzF1UTVKeTVvdjBlZzlYYjcz?=
 =?utf-8?B?dVJXUmF6TjFRZncxWkxKOW5PTkgwSjd6MllGeUFRQ1RGbkVZeExUT3Fkb1Fr?=
 =?utf-8?B?b2VDNHBpNzVYK3R0Q2FNTjEra0krMFVFcFZ0VVE5ajhJS2dEL0N0ZE1PVzg3?=
 =?utf-8?B?NHhUdDR2TFN4SkhmUFFrSWdZdCtLK3I1OVdqTHZEaU5JQUZTbkVyWXZMNldL?=
 =?utf-8?B?ZnFIaFYzWGZ4N1hreStRREJBNk9yZEw1QlZLeFFhbEFvM0NUVmo2aGFDWjlv?=
 =?utf-8?B?c1RTbDJwYUZkZjFIdWFWZVdpTGRQSE4rTnMyWCs5N2FGUmd5SjZQYUovSFFH?=
 =?utf-8?B?RCtBOWJwOGM0NEhNcWxIa1J6L3NVcmJlbDFVR0kxSVRUQ2YwaEptWUdVaWlk?=
 =?utf-8?B?SndkbkFXM3hZQnQ3ZFlIdkY4YWlmdUtJUE1McnFnekw1MDVDR3daczcwQ3Bu?=
 =?utf-8?B?Y3BQcTZ6WUx0V3Q2dU5MOTBPOGpZMFZrRHRJY3V4UjZlVHFKQ1FuRG5USk5G?=
 =?utf-8?B?SnZrdTJDS2N5cUpSZHpOby9YYU4rL3ozT2ZWcGIyWjZzdEhNa1ZudG55dm0z?=
 =?utf-8?B?WTVCQ3dJaTRkVXN1cWFlRnRGNjJHZmFoNDRCSS9hMlppb3lFQURZYWJtVi9G?=
 =?utf-8?B?enN5OW5DaHl3V2V2NmtLNVZMNTZ1TGU4UVBPY3QvUzN5SVJsNExHRS9wcm11?=
 =?utf-8?B?WlFaZXhGVVh0NnpZUWpTYStPT0ZqNEp5Ymo5Vm10bTdNc2NSN1VLc1VUTHh2?=
 =?utf-8?B?WUZ0UXNpR1lCNXJGSk9sWXN3b1p4b2U0NWt1NjYwT1BrYzZiSWVvZGwzQklu?=
 =?utf-8?B?YXJheCtNbm1tZWpZOVJ2OVhCb2d0Wkh0WmlGWURFbTRXMXg3d0Z0RDlTTjlq?=
 =?utf-8?B?c2VjOUhGRlRXbmU5SGduUmxQemt3alJjWlp5aHRLWmxoSUJPTFlndlBEMjBp?=
 =?utf-8?B?NURpUVdvK1RRWDFIY2h1QnlFK1hpdzJuUGZkbzZyU1NWem90alN6N3pOMzk1?=
 =?utf-8?Q?Atrh7hfFZgFR3xy5RW4MKaPxC+xVbGMn4dNtj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9911b65c-0c42-4548-d792-08dee95ba30c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 08:14:52.2991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g4tfcSJ52/ISVh5d289J5kqbp9I69vt3JpXS7WUl3yphzoZH/uNbJbs4ZG17gMITqcg7nRV6f2V12i4gn4dVGVEHMmyacf5PVnEQWbskKeW5b/MOmSPIA+qaZLKHxICI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9048

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

