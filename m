Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013025.outbound.protection.outlook.com [40.107.162.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F9F427F8E
	for <imx@lists.linux.dev>; Thu,  6 Aug 2026 11:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786014066; cv=fail; b=uUqb0DmtNPMVsp9kIILxelFMLU125ypl0rusGxAZwy+e8wZnDebPgzc1PKg/F/x9H1ukOiunvSYOBqSBd2QwVCnrXvRQ84W5IRAvrQSjrxl7p19uUAl0hXTgiP7PQQjULQB/3+k/UheDGeMUN65nbZPv+0ydNR7ujleoLe2mUzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786014066; c=relaxed/simple;
	bh=g/tspJdnIjaYPLnhYruDKhmk89UURmZxtfy22fiiEOA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=R/dbmXqeliDtedDWPeVAXYBmoESZfRmJxcVNUUG1m9A9YvBkQal1MdSNlefo+EktrDe2vm/nNR7Yk5OnB4cZD9Thk2dxe9bbKqD6t5N7YT8UHol+Kqzj6C6Stef9UsM+s3qLlzVcrAcZRbZYabSLqhlhOFxi+22kVMJixGYK4N4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qjLwkHhQ; arc=fail smtp.client-ip=40.107.162.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qjLwkHhQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F46L/pnmw9UTHSnS1vfDdOj4bnlXlZDKzDNAoALBJXif2rgPDvUpXjMZIxG4O5VDZhKZGpIOELp4XrRDONrdOPcF9YP1DohkYxtIC1RhE01Tb0y7ULod5zWf415S7An3bU+fbGmqJB25JA017dJ1dBrmBK0b/jRGPwCEkGtfoUoK2HoaCHkfnLvFvgPSAfiN6oQOv/ZvgnckJiF/wvPUSRvj6CZhmYeIR5WWXWiWEm4b8YqGhZBecaMyETOvXpNglZ5TUDMDN77Fdl9E4+R5LhX/QXzi7r1vTLpg36ibaNKgLzrl/xMG1H3IdC2dynQ0R1TJ7TbfJjNMKUQyiK9/cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=YCjgIz5NW8Qw4caZkS/iG1C8dWCz7IdqxESxJRH84JRtcrmeVUD71FOFG+4eOVJsh56j1/xRRlF9l7rGCKZfBOvGbXuTnFktq5lg6nlt8KC615x4qNq5bOjQ2BahQ7lvXhYjhtTnINYUUzYIp8EgKtxTaKQYo3rIa0keXyV1tubiN8UYCXKOeKVub6r0HKq+lV4Z02HqHRpjAFlTgspQmyDL6l8marAhCQY8fQCf/Bw2mmk1IqCzoebHNm0Em7If27F+fRfqW9XyeBB+CYFi+iOEtFblHVQH3CR4Grskvd+8hXpfgRac53penzm6jZUnspgjyj20OadugOi7w1b3tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=qjLwkHhQ8fZgrsqbSYQNMjq0XpSIkTnxFU7kUI0BYY7bGBCYYwUWN38oy6y+G9+HOKxG2G63RpV5nj9DM3wWwVUKW4Mn1iZXlejqa3+kZDgyOR3C6ayN2StFkSuniZ0bzYyJQj1v9yoZKlzb5C0r8r1VjljttvLVa42rhyGwL6BfquK5HEo0Ahmmr1vSrlyoDXY7yt1FVHCU429ydB2zgAPM5nbWIuL09rQvAUctwvqZnQsj795d00jgNyQ4azz5mqCgo6DLXQzHZ9X2cpiFgJO7xLtYN2ws2CpsaJQmL8s6wL7tJyhxOzFhag9Sk6zUBU+GHVFtWmuPJ9ZkK+HbFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AM8PR04MB8035.eurprd04.prod.outlook.com (2603:10a6:20b:248::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 11:01:01 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 11:01:01 +0000
From: pankaj.gupta@oss.nxp.com
Date: Thu, 06 Aug 2026 17:21:34 +0530
Subject: [PATCH v35 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-imx-se-if-v35-1-11b25bb308ef@nxp.com>
References: <20260806-imx-se-if-v35-0-11b25bb308ef@nxp.com>
In-Reply-To: <20260806-imx-se-if-v35-0-11b25bb308ef@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786017100; l=7403;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=ZSAmXRvPjYNeGEa/I9hefXFuALx9geFcXzYMsSoJmHQ=;
 b=EbMQPrx3edDwrJAyhZ5aRJmt2RvR7Pigw73rWxdQUd088CEmcMzUVJqt+3u8dZDPaHUAG7v2i
 E3QiwTfzrWOAvHwomtXoU7q+EBYkbIXfE4Qqy0GoWZ230JRW3OC6KU5
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AM8PR04MB8035:EE_
X-MS-Office365-Filtering-Correlation-Id: 71c5dd76-f058-4bac-1258-08def3aa0060
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|19092799006|23010399003|18002099003|22082099003|921020|6133799003|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	SxPfJVQM2IZBxHh5Yd9+fWhzQ3YsiviFRlLescMEh34/VwgFJQNSH/95nmM9BjpW45JkAIwjI0ldG3eMUpTjKw9z5IW9aEVyhN7TzVKzL3KJXBK1lJP2ew7HPieYFl9B0GgSl/wJ0wkBNK4F4f2UmFAc9tUzHBm6L9fpPoJzeEyCqo29YVY3qycdaWXzaZYda1zjI4hDPffQKt4jLBWS5T5Z7Vt7dVPlE1yj+Kp9Y7I5vVzN1DEvZZ5cOp8m0Gs+QyY8CQImm9aBfy/0y1akh4CT9nEzZNE92/Su02g2DmOfMDUVme/YGdfpXy8+RLMS7t1+oDWb0ZjyMukY3WEyi0nrEkPVd21d8ymDm9tppBzlrPqz0kgAOkpwy20UVGUQ/aju0s15p1WWaUsSyUhrV1WwvzxDvM7vyKaDjkWw17ATWJhRitijGlglj5AvjLG8sKLyPaIwBTSCtOxHWDccvzvRpn6UM+PeeFJTk/BIIiZbjdXGrRm1+5SWEHnu6FTlm6cG9nrdQfqOaDKBX4mHKQfGv8OH49TtcqLpeiAkDe5qfqpeMVc2QUGd0GQDCSFqFFfrDh3ZBaDJ5d/1oC2Txo7E3bsPermAw8g6ge/uFL05Eyhb+hX5ld3le7Ga3x94fF+CXOAyMgn70d+bgK0bLe/uUuw+X4x5mrYNUDHEQWJVkNi4TWJBjB6NoqZoxDVAttXBXt2Cd7NU0D8HEdyHew==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(19092799006)(23010399003)(18002099003)(22082099003)(921020)(6133799003)(3023799007)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1RBOGdDMmpENEFINFQ0a0VHd0ZGWjdUdUNOdnZIcFE5b0ovMHJTa2xaOSs4?=
 =?utf-8?B?R1A2SHdzaWd3R3RZQ3MvRkE5YVZKUDcxWW5Pd0t3ZXZXWWxJOU1yVjViTkZU?=
 =?utf-8?B?aVBKTWZOUE1wbytEODZUYUhoYTNxaFBRR0lqQ0UvZi9OME5BNmJBWjJvT1RT?=
 =?utf-8?B?SERvVUhqcmdUcGszeXdxTXJ6cWViY2ZrTlhaSG50V2JzejdmdXN6bWVPbkVF?=
 =?utf-8?B?dm1wcTNGWmpEcDNYYVdJVHNFZi9CRnYxUVBtZXhjdzB5QnNjUFY4L2JmdU1r?=
 =?utf-8?B?dWROdVAvWUR4aTVKcjRQQkRvNXlQb1VBNE9Ba2kwSVFhRlJvK0JNUHcvd3Rn?=
 =?utf-8?B?RG55Q3RhOWhiTkxJQ1EraDhGM2RNeVV0RU5sbEEzeGo1RkN2enpQSEtUOHpE?=
 =?utf-8?B?c1ZINThNZmlXM0xrUDg5Y3A0Y2c0ZXN4dUZDR3VrVkNucTN4bnFISjVlWm00?=
 =?utf-8?B?WktDSnlxdWM3aFZvY21XUkUxODk2cFpRWXhVU0o3NEhQVWpUK2g4UEdLQkd5?=
 =?utf-8?B?YWh1ZU9kSVMrUkF2YzBtZmhLYXA4WkFBVktaZk03dGNERkozWXU2QzJwcjhC?=
 =?utf-8?B?V0xvOHlvYnNPVnF1ZHFpNUU1ZndDVmdxZmorTm9sRE9QMWxVbnJxeVg3Tm1y?=
 =?utf-8?B?TGJzK3RBZG8rSUNLcWxEUHhhTjZHV2MyT0RUaHd4a2RtRUVselppZEpvZmNW?=
 =?utf-8?B?VVNQWm9wZDJBNnlvOHBzVkRSaTZaSXBPQlI4TERsbDgzVVNUVlNJeHp4eHpK?=
 =?utf-8?B?LzdQOVlKSzNrTmlIVllPT3VmYnVsM2pRRWFiQS9DSFlTN0dnZC9UUDFEYnpn?=
 =?utf-8?B?a3RxbzAzK3hCdUNyV2hteXJpaWJERkwzOXJWZHNQWGUzVXp2TGtKWTFRUmgy?=
 =?utf-8?B?RkMxOVVQVytkVGFnTXU1SnlDMnBnUE5Uam5ZUlFCbFJvODdCTjBSeUpSbjFw?=
 =?utf-8?B?WHg3alhpaEhPMVlUNm9GeVBHRWkyZEJwUFp5TXByRXBKMmFKUVJ5TjNEZEp2?=
 =?utf-8?B?dW1XRGlmTkhVZnE3K0QvQk9QcjFWSFlwUzU4NEEyelJEVEVvZzlnSy9hOTFD?=
 =?utf-8?B?cUcvSXpUNGtmRjJySUo5ZUZYUjh1ZjB0SWdGVFkxVjREdHcxYXM4WDVyY3V3?=
 =?utf-8?B?ZEtmYU1NOGhjWGpWSEViRnFSekFaYXZwWVUrTHJub1VETHlEeEFOODhEL2xL?=
 =?utf-8?B?M09IM2JyOUd5L05Wa211c05ML3NaaFNMK0xFTkxCMkhjb3lBMUR1M1k4dTN3?=
 =?utf-8?B?cS9TTnJYTFBIeWFsbS8vNmhnVjBEajY1OG93WTJiOFFleXk1M2dmRnNYV0ZF?=
 =?utf-8?B?TXRlbWNVeTR0SGxMbzNVWWFkZ3dlNTgrdlROSks4ZEJzNFUyY3dzcDRMRXBB?=
 =?utf-8?B?TUovNS81QldHaVlmeXBlSzRrcUl5TlRyK3c3cDl0NUJvb0JSc2NvazR6R0po?=
 =?utf-8?B?SjREenlkRDkwbmt0KzJyT1ErNjVwOEVFMCs4RlNFUDF6dSswM0xHNGFCUnZn?=
 =?utf-8?B?aWtYQ2hMU1VvaVAvcDRxekVFR1hTRkFsMFNWY2s1WDgwL1NnM1dkM0VIYlJi?=
 =?utf-8?B?ODhHMnRRNjdNZjNaODlGd1Y2QjhaQnZJKzdudmpodGZnQmVQZmdnMUx5aXl6?=
 =?utf-8?B?TGx6ZGtKbGlBWHV1RngwUTAvVDdkWTVhQm01eWFFNGVFb0hCNHhBWDllSU9P?=
 =?utf-8?B?M2dWL1JyTEdBMmlrMlNNdEJTUDRFLzcwVktTV3hhemNJU2tNUE1Fai9JNkxz?=
 =?utf-8?B?ODc4aWt3VDZoT1g2QkFvTmE2NVFSMUdwa205SzR6TmlMa2ZJaUpoNXFOM1VZ?=
 =?utf-8?B?NFQrTyttR29qZEhBSU5sQmplaGNiSVlXcHNKTzY2SkFINVo1V2lnOWQ0THdt?=
 =?utf-8?B?aG9yNnd3SnNoNEYwSVNuYWF2WkMwbjAxaXp6bUFkaVZGQTd2QjRFUEpWQklt?=
 =?utf-8?B?ODRDeWh5OXd3WG0rV3cyRXNxZHdzNittbERGZWZMeThpSzMvNEt4aUo4WnY3?=
 =?utf-8?B?UE5teUdYM2Z0bEdnNDFyd1dnS0hMc2daT0ZhbEdHdnFaS0VvN2RHWnp2WURs?=
 =?utf-8?B?WEZENjhMamJmbnowdTR5Smd6Q3Q0bHRBZlgvUzhsRTlHNC93TDN2UzlNdkRG?=
 =?utf-8?B?ZFdaNU5lcjR5aGRSL3NjMzFyY1U5SmJqQWYvSFBNZEo2TEZlM1huc1R4WitM?=
 =?utf-8?B?RTBTY1c1NEs0QkJRMG5LWXVzem5yMkRKazVVN1VXM3VlQWZkQU1TUkJvV2hX?=
 =?utf-8?B?QzZVTE10S2xlYzRCT2pNTGt2a2J4dVNiaTZhK2pKQjQybzRCUGNyK05KcHJB?=
 =?utf-8?B?dDJETkFzODN6KzNvNlJYK1UxZUtwUy9xZytDcjVvVzcvckR0eWN4Q3RicWRJ?=
 =?utf-8?Q?jDZ8zw48tnCmQJQ3jIlI97RfvX5vmsikEebgG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c5dd76-f058-4bac-1258-08def3aa0060
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 11:01:01.1058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L/XqPWk4nd5AWnzt+/rb0dkBQGBUl8hRpZO69LQj/N2beU/oUkFwb3E0ttBTv+O38Z773Uuf+i4nPsRcTU0KcjsqmC1O8zDDG4J5L6MtY3MDt2Ph3wclMNP1xvIQHneD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8035

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

