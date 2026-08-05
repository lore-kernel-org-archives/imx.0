Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013037.outbound.protection.outlook.com [40.107.162.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37DA3DC861
	for <imx@lists.linux.dev>; Wed,  5 Aug 2026 07:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785916454; cv=fail; b=N0bJ4kVuLQboHXZBBAYV0kF+evKG2N673JChE++CWRiqlQ8/hjtv9smeEQlL8PnlZWubbOsZ5HbkVxl7G0/fad1jg25VxJnpvehq1Qd3eI5pnXFNeXMu+y2JDUXgF/uC0r8slLMEtlCDKQGoVDdujT+zOL1ccx3qNjqOHad7d8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785916454; c=relaxed/simple;
	bh=g/tspJdnIjaYPLnhYruDKhmk89UURmZxtfy22fiiEOA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hdEDCoVuvx2ZfqGtI2b0NBHDXsXqJX11P+JkCn4DxJKsSHfXeQqiNoWL+XJiHAuFwYkhKp0pu1sjhLLV6CVVDEOIL4jeGYUopEAszMJxAHUkaqK0vt1798rPExF7ZSsgZMWeh5g7BWDbFyrJe87yGlat+hqlzKEjdPs3qDB+sGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QPU1cPZ+; arc=fail smtp.client-ip=40.107.162.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QPU1cPZ+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JsykVrz1Wgss6vU3CagsEbgD/J3eQss2eQZSb9cV2CGr+FiYcTbM1566gUZqeOe/GRHZ6CZ4UmooGnloWXsEyYDsVFXZJNaL/E0+GGV0M0jXVsQMc5019YWdO+YYo4Sf9fq0HMI9BBbJ5JNgBVkanlkMKlJ+kMF7JqHcL8Qvp0+mB5x38bkcePYBMsrbyPbd35o2N5bg8e7ARP4WGVH9eCVoQ+b2vpIK6AMRS8etaYuqQk2mDi851iTTWPLDx8O/V33CD334V04OLCKJ259svYlMwJrBXIRkah3FARdDgFcvRtZ8AbvR/+UzNcrxW+1M6y0d8puUSyhedxSsBwXyyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=e5EXRkmIULv0ft0O+346Pe6SJKlwEAt2EquG/tLP0t51DaqgskwI4nbyFNi2ZA46ngjlytJbSEYRim44sbcGcU9U1HtDkHjKTnCSNNYs2vsuYNrgV+Xc3mmG7R1vkiwChKA0t2T39bnrSy+QayN6kFg7tDbUpDJ+jx76pBoDCl+m00Ud38g9tcJKLZC3eZZLnUdWUh6h52iYhmr8xtxF4jSp3/ck4T9k5cGBOFIC8eD3cUI9R2Q7BrdodKzjcT9Z1f1D7EM2bgdInfOdiHznQXCAyK49/BqNZqyNFLJ9jJpOrEYWUbXLAwtU744csCK4Ams078+lu+g+jVm73LAUTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=QPU1cPZ+oJv3sK4ygiAfA7uNDTL6l80nAxmL8+qePa/0O882+1lkNqKOIGuXQXgK8G29EVGaIv57XqAiHeZaP6b+PGzMj0JY3cxah6i2EbfMFRFNPBGtn055QNG5/yKwmYBUXqFz9z38DL5eFJd9S85mZBNwEohIr0vAfwE8RHs9pbXQBjm7KI93EMF1itHrSxxo3BCiKAFo4fDqzzhvNTyLJKdpAeKYPBqx2siVaU+rqpQ3PeGjR68DUytw2Y4YybNZJDZY/A+18uf0HpFZum+lSZpB7fu6IO5bINxiL+zZlsMzHjVdmTsFu+dzy2dCMlu0Z45Rk10U42UgrX+A9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8465.eurprd04.prod.outlook.com (2603:10a6:20b:348::19)
 by VI0PR04MB10687.eurprd04.prod.outlook.com (2603:10a6:800:25e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 07:54:08 +0000
Received: from AS8PR04MB8465.eurprd04.prod.outlook.com
 ([fe80::36fa:43c3:5ac6:9545]) by AS8PR04MB8465.eurprd04.prod.outlook.com
 ([fe80::36fa:43c3:5ac6:9545%6]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 07:54:08 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 05 Aug 2026 14:14:47 +0530
Subject: [PATCH v33 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-imx-se-if-v33-1-212e32ff0295@nxp.com>
References: <20260805-imx-se-if-v33-0-212e32ff0295@nxp.com>
In-Reply-To: <20260805-imx-se-if-v33-0-212e32ff0295@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785919487; l=7403;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=ZSAmXRvPjYNeGEa/I9hefXFuALx9geFcXzYMsSoJmHQ=;
 b=7nJvQdq/X/VLhFzSw55WbZkVWuOpkG0saLno/CMtei3cZc1wZXohBkL93EjBbPEnjKrVd0TSC
 ek+NFyJTLWaAXaSg2GhaQ3v7JtGnDXWJlWiUxLgJsOpPDn/UlOKjJSc
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI1PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::18) To AS8PR04MB8465.eurprd04.prod.outlook.com
 (2603:10a6:20b:348::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8465:EE_|VI0PR04MB10687:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cc74646-9938-44ff-958b-08def2c6bab2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|19092799006|921020|6133799003|22082099003|18002099003|3023799007|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	b6iA0U7UvUbDqQB+Ax4Vil7VEEgcHZ+ZUA0jCbH9G0vpEsND0E6MNwlrv6zQqhEVX9X1FyMkeG1GcTK45U1/y7SZ0xBWqD1BgqR2KzMdcREnvlFtjY8xTk1bnzAxpAgxljgXSxKUBm04QPBY+tFYjlgwdVMMJceQ6njprjzxy93lci9yTLpDP1nsEjkUrl8WkApIie4BMghmyX8p4IrquTI2o4CIiO3M8jrhwd6Tcada9zDvVU5jY/HAvMp0XJMYgVtJM1AWF/9vnUqP+xpLLnYOwkTqf13NB6yPZkUeW3wxxwFivitpTMyqebLk9hEatJrOWqx2YZiifW8Eg5AkLhpAwBqV8mfo8h5+68alMi4EOPfxKE+U65YfMJ1slRaEEk3Dt+fymdq0pi3+J+QldBUvqiETvwkYefN1pRS1H2Be9/BR7/2dUgiDp3Zu26aBirR4Muum0LVG+JEziXngjHcHCNo4BOgx68LJq/wCXaqVyCq4jUskH7aZsDw1zJivj31K/qjag178dymkK4oS+txc+5NvNq43MCS/Lq9t5sA3Odpm+r9//dm30g0gmRUh7JOwCwYj7y1EFDhFmlZuidEhWBiJJqBfESxLgbocdm7IRCK6JKnmw025sfUXRCbU0bOdwfykdiC8TjTlxaBAQxJwB8TSMdxSayWpFZj5VslnC5Dw7GUqhPNDpiEig+z0My/G+SFLCnwIJSKjpSOIaw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8465.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(19092799006)(921020)(6133799003)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGpyak8yNncyaDdrM2FaNTdJby83L0tFNHVNUHhMRjg4Z1YrU0pyVmQyZFY0?=
 =?utf-8?B?RzdaVDlLK3d4ZCswMWFlc2QzRUZNT3JYOTRZejl3elMxYkNxWEF5SEphR0sv?=
 =?utf-8?B?S3RRSTJ4a3Q5S0VKSVZ3YjMvQkplak9IQnJlRXpRcUhnem5Va1BiOGJLUXp0?=
 =?utf-8?B?amZ5bE9QdWVYN3Iwc0JDYXlvM3dZL3cwbUtuK3BVYVFYSkxZVmtjQm9KakFC?=
 =?utf-8?B?b0hTaE5qUG5GaVhiZ3FLUkJCRXRQaDkwSzdjamg3czJuaW1jQXpOZDdJaDVv?=
 =?utf-8?B?Q3l4OHJCaW1uS3V1M2tjMUJUOFF3VlhEOC9tK0hDS2JhNjRPV25BY0lMc1Fa?=
 =?utf-8?B?Z2ROYUdwOUZZQlcrMURNc1M3UTJObVNreHJ1Rmk0TlA5MEoxbVZsbWdJMWZJ?=
 =?utf-8?B?OCtPakF2RGtteGM5TnVmV09kVmJzNXFpb1FWdnlMMkV1QXRyUzhFcnJFZ3lZ?=
 =?utf-8?B?UHcyQWp4QTVBNm03MU9GWUJ1NEQ4dERJRldkSkxINktiSVBpVUxnWkNGTXE3?=
 =?utf-8?B?SzFsN2tXQmw3aytIVTFDUzhNcWlWdzE3MTRlUUpPcHpvUnkweGthMzVmdXJt?=
 =?utf-8?B?NlFXQ1VyQ1d2WEFyMzY5cVRYVko1dVNsc1NkZnZuYWJNWGoyczVhZXljKzRo?=
 =?utf-8?B?QUN1M3JnWjZ4YTlrcmZRUm02SEVkRjl3bTN4UlVZb3FzTHZmamkxeFo4bG84?=
 =?utf-8?B?L3d6L3Znd2h2djZ2OS9nc2FHYVpZNUg2Lzhvbk1kQVdzclpJeTUyd2RDazZm?=
 =?utf-8?B?RlB5bUJWb0ljZVMvMmZXTVpkaUtaQVhXdzZSYWdSbEFBQnhhMXpScTFlUlR2?=
 =?utf-8?B?TS9aSnFPa2NuQ3pOSVlRanZLc2tncEk5bkVFdzJ2YXcwdFQwNE95VnYwU1U1?=
 =?utf-8?B?YVhuaFV6aFpjbU10ajJISFVHWTlaOVZ4QkUyUXhxeStCSUNNRTJqUGpnMkV6?=
 =?utf-8?B?WHQzcEFhVldJUTJUT3NUcSttMXFmTEdHT2ozQUpJY2xtbWxla21ySnNBM1Bt?=
 =?utf-8?B?Q3BBd1p1d01UTE5oR21sMmxzNjdLTFMxQ3pQQU41eDhSRWdRTEc3V2tlM1BQ?=
 =?utf-8?B?NXprajRsWDNLYlBDRGNLUVphWEJLVFFReHZ3bnNNVVpBb05JMCtDbWtvUFA2?=
 =?utf-8?B?eldiOHdZZ2VEMHl2M2l3RUlSZ3lFZjdXdE8yOEorcytjcWxWSjNsVVRhZXJR?=
 =?utf-8?B?UjNxWjcwYVk5dmFvMllLM1NOVzdJZ0tjNU92eGx2aXJuVmtHejFRQ2RJT0tr?=
 =?utf-8?B?WHE0NEZaTEVCbjA1NEdsUlBZR3B5dUN4UVoyNGRtanZmRUxuWVhwV2xVRk9r?=
 =?utf-8?B?SWZWOUxUejdTcU0vSGwzdzI5SjRROEd1WGVJUnJ0azg0YWlxdWhKOW5KV2du?=
 =?utf-8?B?YWkvTUtOcVNidnp5RGpUWExlanlJaUphaHBUYzRKWnZsZGV0Nm05QzFlbnFp?=
 =?utf-8?B?ZGYwMzQrM2poR0lWNjRXZFJ5NzVMMVk2ZkNBUWd5QS84MW81REptVXlEV0t4?=
 =?utf-8?B?ZGFhZVhQQkhVcGk3bld0V0p5S214a2VVNnlpdDJ3TWZFNXJvQ09xcW1VK1Zo?=
 =?utf-8?B?aFhHNW1lRy93OENhYXhzZjBrNGs0Vm45WUtiajNYc1ByUFd0L0pJTzdubVlC?=
 =?utf-8?B?Mm5hY0drT3dTMlhTSHcxWFMvKzNJVklSUmkxdTEvbXFhVU12WkpuaFJkc3hz?=
 =?utf-8?B?L1Y2SFVGbXgrWE9qb1oxbmdKbWt4VkJlVHJiWXRzT0w4b243RThnL2VtL3NK?=
 =?utf-8?B?U0FSMCtnZTVhMFBaWU53VEZXUEdjNUNtYjZVbG9hUklJUGxVVU54K0dXYnpS?=
 =?utf-8?B?TEZvMFBvZHdnbTNudDJld3JmeTlLS1p5YnZFZitDbGRMMHZHTUxjTmVJcnJD?=
 =?utf-8?B?dkxaeFdNN3c0b1k4Tkc0QWV3d3c2VTAzQWIvUW1FODlTU3d5d0pSOXE3c3VU?=
 =?utf-8?B?MmpGVlo2STJrVXl2b2dyYTVpRzV3QnpPMW1UYUg1Ynp1cXg5TnBINW5oWE05?=
 =?utf-8?B?R1JDa0RDZ2RMRitCY2RlWEsxcTNhZkU4a09ENVoxZlY3ajZZdlk2SHpQRUhE?=
 =?utf-8?B?YmloKzNYR1BMUE45U0JlRk1iYjdnemNoVm9JRjVmNEc3Uzdub3lEM2U4QVZh?=
 =?utf-8?B?amhHMlk4WDByR0J3dFNBZ2pHU3p0RUJMTzd1YXpqZExOTmVoem8zOXFJU0tr?=
 =?utf-8?B?S2g3QzdOYllZN3VtOHhpNlloMTU5aFU0STM1cGNpTDhqVEdPSi8vbkZ3Uncv?=
 =?utf-8?B?V0NjUEZGN0NLcnROaldPN3lCcjlZM0x0NWZiNnZKcXpDMGh5TEpuQ0tIK09q?=
 =?utf-8?B?LzErVTNDanNrem9jcEVVV3JUeklGM1hRVzNkWUN5YmxJU281RENZUms2cE14?=
 =?utf-8?Q?VUtEnqJKmJN1sOZqA0HLnZ5Lok8z92ubKWDbR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc74646-9938-44ff-958b-08def2c6bab2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8465.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 07:54:08.5288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f4j4k4MCplnTnc1qcjDpkgL5Ghohny/MQNVDERyS4C4guBYMDIUKIdJTYjp8RMQe+AwxdQjZRr/ffepfCxN41xgJgcV06B+U+Cl7v1zUJf/jf1q1Y+R0T8l5FztxOoDz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10687

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

