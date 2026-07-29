Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013046.outbound.protection.outlook.com [52.101.72.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569FD44E676
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 09:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785318656; cv=fail; b=qdeHodxetK+Vh0qFZMhd2Ti6Hsgjlf36adbLtfEcEkhoSEzQ+h8mX18ydMlJdCPoEw2dTHXuSpgYef3xUcCr3JIids58SM4NIxT9kBW+DXjodzf0K8P9JvgIWp+cv5lECk23GLo0JshK5QgqR7YOfKiKOyc3ulfLspArzuhT1vc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785318656; c=relaxed/simple;
	bh=cs6G/r3GqxY9qrYWchnYMZywUFavVGu1phVAkqXxZw0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rCzNT28prwEngaviVHR7VV5fUJoFYhFPVkAChCduio3NJieTkLqi1aJ8Xn2V8xbzsFWluEMFdPORFqUxV9AlRTkL4VQSEHp6y1JxEb58z3TZbvbSVIBFBFKr9MjTAg11w0//LygTEBz9jV1l32A4yUDlKmUS7hgSTfk4wR9nndo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xdXQiVvr; arc=fail smtp.client-ip=52.101.72.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xdXQiVvr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j3NHyS/unbGkdvIUAKobds8erxLO5h0G77wOfmia4k3lx7ET3HwX54DAnLA2MouwltEjbYH3D17w8Ne8NfjgHXL8nCOZeF5oZj9Nd0t6AEMaHi9YVPs2ArQbJ+94a5Ckb1nqxWZ2zA4DsBGUWCyK9n4sUl051U0qE1IAy/f2DDbzaSNt7GrAsdO7CUJ0aeMM2RUwOCDGBEDtAj+Kw9IFEbkyhWB1eYBACexQEJDMLK0yC+C70pxZiFC1slHnYrldqI03LKl/1YhZ4tLhOITxygdwk6oRGiyby4eZDSC+foQHrxadWF58V+QZP1jYrJGaJO0jdj04szYAUbItdfUx1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6eqqF4XldwoAF8eYm64tBrjQANv8tIVhjIWqcRvU4qU=;
 b=pAOrOj6x1KCXV54Z8mo+v/k11auTHfy207GUvadZC4oyzwEUBsiv60lEvHZjnELRQz+yOYT+f/xEpNzY0CNqOd9MqwUpr77E76o9LPGBtEyZRKxyV4j4TI4xBGZhDDN5TNFbXgMq/Fr62Mj24lhl8fK1ypfrrx1sDzDGkqwkINFyzZQfwQTsNj5nwRIkCFt3dlbkS16nTCQw5bpItgjl9jMGYWSTMRm3yuVq6AsO8xLeQ2VogZgyKIFXi5HtPRF1UEUSrC/wE0JA7KMfuSDr+W9HK01MFTsclpLKpRdt9ze6j55joSPiDUgO9N+Gz6yXk9XjICyM/9jvcTQcfR8srQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eqqF4XldwoAF8eYm64tBrjQANv8tIVhjIWqcRvU4qU=;
 b=xdXQiVvry29FWdNFm29h+24FPUR68JzGV6isYlO7VNq4K01Ag3G1oNuLQH739O2M8E/j33UEnBnIuhEMiHI+qck/4AiB9NWqPO96cuz6pQ6uMkJl3hi1cr+ZGpgFVybWENkM4qVpCpolsty8Br+ZrR3aqT1UMQl+VoIokJ/SjjoV0nNAxW+f5I1IF3QZgQIDhLQnJ7eMTT81gOTll3xAatNOJ4FrWO03XVi7dmbXNrJWw+hN03VHK/rMa3feuQnkALyVtnDHPlb05PkIE1wh9CpLm/9DaF9nIyDyXMjCQGsUpjAGDNH6u3aL9QJHz9GOPBo62m7zL4+ACz7TRJVv+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AM8PR04MB7889.eurprd04.prod.outlook.com (2603:10a6:20b:24c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 09:50:51 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 09:50:51 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 29 Jul 2026 16:10:54 +0530
Subject: [PATCH v31 7/7] arm64: dts: imx8ulp: add reserved memory for
 EdgeLock Enclave
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-imx-se-if-v31-7-e59af7adb784@nxp.com>
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
 linux-arm-kernel@lists.infradead.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785321650; l=3083;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=j8hxwCQlGC3Mg6eSazbiCEMoZMf35PVhPK4kl3SDKqY=;
 b=JE0D6pxOYbujJvUxQgmOw8tc8ojZLJxDy3olyRxOOTxV0qj+Uaovsu7WRNxt9zVN7AcXakeg2
 URbySbqKZVbAHy8z7UhiBhTBCZVpL5sVfdxT6gmwncLhZX2XBWyQ5jR
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SG2PR01CA0190.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::11) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AM8PR04MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: ebe41005-4a2c-410b-6c6f-08deed56dfce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|19092799006|1800799024|23010399003|921020|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	q0/DBeJhwTuurN6Cj6Sdng5H/26aKBHKcYqHQXPOJ0IR9yFDeYRrRx4Vgo7U4qooEfbiArxIWSwsK8X8fyk4S7gzMeRtGEg9vu3vCMHE/dVCBBqy8d34Hc8PQhWyQJICE1E/p9buNnBGukI8xYdKLEspEORgAXuYRnYh9RcDnL2uxqt0XzSBUBgUavkkRXSYEGUu50KrKrPrcOttCPeZhjAWIB7jlrz76i0M6itIpaapS3tqAY15gnWqYXQquKQ/43AdeNQfwDCLL7yiRxmOjbCCjRHdTU+ghyZZpQMNbQEidGM6ikaD63+co0OP4wfHZUWKT9G+5JseFKgMwnC5S0AehBCNxMr5u5OYF+KSBu6MFinzmb+QWOOUgLkj90Ji9kMYqKFTxDcVzeZsBpIP0fDpM+Fqp+cd/iYLrYe+W2pjnGuP5a+X9sA72hPR1bPl21jPl1d89eCZIYRxI9QVVVPKQ2w9Cl1ah/HvOk8A8aui4OHdCtBIvOLWiAIcC8XFPOljB+m9k/IULqW4SM9GVUNPooBsz49nSyIwAE6GVvsbLtV0pz+VsTr2FvSevRUg4w5PdCbsUBhtAtFkp8LZe9yFGaeo6VIK+Zl+5OvUCGROu7xzorG070oWaMg2o0XeEbJo+RQZup2E+mYBbgueTg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(1800799024)(23010399003)(921020)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUZkRHNvSlJKOEw5angxb2swNUpQVjU5aVF0eml1SjdIK2xwTEFNaXNlVzdN?=
 =?utf-8?B?Smt5cmRhZVFaWVkvWkN0KzUzS21Fc09lNXV6YWVoOGVxU2doTW9kc0RGbnRT?=
 =?utf-8?B?TEg2TnlDUGRMQW56NHNCdm1NNFdxRHNwL2RPeWIwMFNhL2JteXlHaVRNTTlr?=
 =?utf-8?B?OTJNeUc4dVBLdCtHSGpscno0ZWxLNzVJOTIxbDJhMVc4TWM0YnNTYnF5RHY5?=
 =?utf-8?B?T1Mra3NwY3FLUVpTMXkxbUtSamFWWVNNN2FnTStadDR6VkRUUUNha1FiRzhk?=
 =?utf-8?B?UUIyZ2xVL3lvdHo0ZG1WUUhGQkNRVmpxQTlzdnAvTFJuTjN4MFdjc0ZSTkxa?=
 =?utf-8?B?enZmdHRYTWFoYXBFNDhGVWpHc0hQcDZLdnRZY2FDVWZoNXVmWHhTVVhUcTZD?=
 =?utf-8?B?bExhK2RWVlVCcEE5VUxjL2xWTFZHVVVJVXdoaENLaHVaTHB5bWhYZzJSWW1s?=
 =?utf-8?B?djlybzg4V0h3Um0xazNwWloxODFBdjkyekR5YTVPZWlNRDBZekp3MXkrM0kv?=
 =?utf-8?B?VmJNcFRCeTRieWNkUWNST0kvQ3B6SElxZ3B6cWVlN0JaTlltb2ZCeEpqWDN3?=
 =?utf-8?B?THQwcmhKaXlpMVhOdFlaYjl5YXlOZ0hoZ09JTDJKSUNaZ2NoY1FwNlYwNzM2?=
 =?utf-8?B?RmR4ZVN5bmplZEp1MXBnTjUwWkhNbnlGRzdtVkk2YlRkWjVaeFJGMEJOcHMx?=
 =?utf-8?B?RnFlZDNxUmU2WDFrVEhiUDZ4MWlsc04rVk1FZTBqNFcxYmwwUWtpd1VHaXlD?=
 =?utf-8?B?cFNsd1B6alU3TGlmd0hRSGhCZGF5V2F3dmlGdmRlUHFNS2RnaS80QlNxNkNi?=
 =?utf-8?B?NVdSNUExYVg4c0NwcW45YlF2NDRwanVvb01udFdZZHFCZ3BXeUpHSFhzR1Ur?=
 =?utf-8?B?YXkyR1kvUWk0TnRybmgxUzV0bkZGYlFUYXdFZ1h6ZGhnMWV5NmVnSUNwMWhz?=
 =?utf-8?B?Ym5pVkdCU201YXFjM3JOdXhoOEFUMU56SUpkN1c1V043Z3M0OThtNWhWRU9w?=
 =?utf-8?B?NjAyVURhanU3c3JtL2pVanVaMi9IQ2pVZDRzTjFTVGkvZWlzRjhEVXo2R0o0?=
 =?utf-8?B?MU5WcU1IQ1ViQXRSWHpWSjNpSlpYWk4rRFJmeGxKOVFma0NNVXgzSVZpMXRn?=
 =?utf-8?B?ZHRLbDJ4ZDdhVzBaRkdZRjZoSmlrcVNUM094OVJoUFRHZTdCbnBQelhSL2JS?=
 =?utf-8?B?NDdGQlJlY05QSTJuN0pZK05XRWRFTGdDNit0T1UrRWtBRW1veHpiU2NoSi9k?=
 =?utf-8?B?dGx1OEVLQ0pMZTVEVmF3VHU0KzMxZmMvTEFnODZ6WHFoWVVRY0RoMGhiL1ZD?=
 =?utf-8?B?SHZLK2pNcjN6VXBKZ0pyV1pXMUZBcDBPL2sxUkUwZEhVYUo2Z2FQWkN0UjVB?=
 =?utf-8?B?YVhUaDdEVXBMMDJwUmtQdzVTSFRXM24raURocUdOa29QVmtvcngrZjNQdU9s?=
 =?utf-8?B?ZWlnN2RuYVdEaWxBK0tpSUVGeTFpRldRRnhoOGF2d1dXUUU4Zzl3QjFNRWZ4?=
 =?utf-8?B?aFlyL2swWDN2SWorNVlwQ2VoZGRFdHdBUkRFc2grK1ZQRzJTa284OUdSby9N?=
 =?utf-8?B?SmVUL3hvZjRQeU9sbURJMDhvTTNSRUhXZzNJUWNsZjFJN01GUmE5ZGVqblhJ?=
 =?utf-8?B?b2phMUoreldYMlo3V3RvVzkrWUVOVnAxbmx3cS9LQlhmeE9samZpQXVwREor?=
 =?utf-8?B?V3FUS1NEcThqaDVBbjhFL2loSWhSTnFhOEV6ZTluTmVpZkJDREZZM1ZLVnhr?=
 =?utf-8?B?eWU4cUdudUtsb0k3RitwUHBJZU5mQ2ZSMzVpT2VjQU9uckVFOGJCelFaUWN5?=
 =?utf-8?B?TUJhb3N5ajc0eDJSdnNPTXdJanM4cGZsQ0o3V3d3QzN2VEFOUDhkUjNOWHEv?=
 =?utf-8?B?RVd3MmRudmc3QW5GMk9SSlY3TUk4SGZWdmIzZ2UvTmh5Wjh6UFJUNkdJZm44?=
 =?utf-8?B?Z29wN0dzWTg2R1ZzYW9sVEtSOXhKWG9pU1NOeFdtUVN4TzY5QVhBeTNpN24r?=
 =?utf-8?B?em5yVXVramZEc1g4V1RkckF5Mm1hcDhlZ0YxOG5zOEtMOFNtZzlmeWFVaEcx?=
 =?utf-8?B?NW5UUW9NSldKcXY1b2tlUDg3a3pUMkpXenh0QWEzOVU3bnlFb3dUWjhSYVVX?=
 =?utf-8?B?ZEMxeStZQUh2WEkrKy9sNWNFWTR0MjZ2cElUby84VUlaY0hNbU43allBbmRR?=
 =?utf-8?B?cmJYY0FYMUlMY1NrUU5WSFh4OEJxdDNHVjJSRWNxc3VsWUtsbGF3MHMya1Z1?=
 =?utf-8?B?RkV4MEhtQ3BCZGo5U1JqV1kzZFlxQWpOL0ljRjl1VjI5Nk94MnUwMzV6T1E3?=
 =?utf-8?B?ZDhpeHl0L3pHVE5nUmZMWTU1UWhlbU40c0oyZWZ2THlxY012eFUrYnhHcVJP?=
 =?utf-8?Q?hIfZZSZTatallpdgq6n9TtK022syP4b33HLt0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebe41005-4a2c-410b-6c6f-08deed56dfce
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 09:50:51.2233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Cobc6vuafZlTvIAjLYKzwHprBaaLQ7dZXrlpqLBRdI5kxtnKCBKh6FggFbJyUQe9nfu+14hMrpuxfIS2YQO7FHl1n2OEtJFr2NRdcc1EFJHJ3SG1PmkReFlSbgqVn96
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7889

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Reserve 1MB of DDR for the EdgeLock Enclave. The enclave hardware can only
access DDR in the 0x80000000 - 0xafffffff window, so constrain the pool to
that range with alloc-ranges and let the kernel choose the placement rather
than hardcoding an address.

Provide this as a shared imx8ulp-firmware.dtsi that also enables the hsm0
node and wires up its memory-region, so every i.MX8ULP board can bring up
the enclave with a single include instead of duplicating the reserved
memory node. Include it from imx8ulp-evk.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes from v30 to v31:
- Kernel is free to choose the exact placement of the 1 MiB block, as long
  as it lands inside the ELE-accessible window. This avoids hardcoding a
  fixed address.

- Adds a new shared imx8ulp-firmware.dtsi that also enables the hsm0
  node and wires up its memory-region, so every i.MX8ULP board can bring up
  the enclave with a single include instead of duplicating the reserved
  memory node. Include it from imx8ulp-evk.

Reported-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Closes: https://sashiko.dev/#/patchset/20260724-imx-se-if-v30-0-ce8ba256692c@nxp.com?part=7
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |  3 ++-
 .../arm64/boot/dts/freescale/imx8ulp-firmware.dtsi | 31 ++++++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 5dea66c1e7aa..885242fd07ce 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -1,11 +1,12 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 /dts-v1/;
 
 #include "imx8ulp.dtsi"
+#include "imx8ulp-firmware.dtsi"
 
 / {
 	model = "NXP i.MX8ULP EVK";
diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-firmware.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp-firmware.dtsi
new file mode 100644
index 000000000000..e4bc352f68af
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-firmware.dtsi
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ *
+ * Default reserved memory and EdgeLock Enclave (ELE) enablement shared by
+ * i.MX8ULP boards. Include this from a board dts to bring up the secure
+ * enclave without having to duplicate the reserved-memory node. The ELE
+ * hardware can only access DDR in the 0x80000000 - 0xafffffff window, so the
+ * pool is constrained to that range with alloc-ranges and the kernel is left
+ * to place the 1 MiB region.
+ */
+
+/ {
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ele_reserved: ele-reserved {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0x80000000 0 0x30000000>;
+			size = <0 0x100000>;
+			no-map;
+		};
+	};
+};
+
+&hsm0 {
+	memory-region = <&ele_reserved>;
+	status = "okay";
+};

-- 
2.43.0

