Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011025.outbound.protection.outlook.com [40.107.130.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BA22D7812
	for <imx@lists.linux.dev>; Wed,  1 Apr 2026 06:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775025574; cv=fail; b=HkM/gDuKeKMu0O54Nd72YojUSQq6bPExK0z9eDowd4gUgVGdZsanXFJHsgOhH82ERdkzuKDT94AKuVxCJh59abTA7A5rnbqb9EW8XbGUl6RD/48oZGQ6l5c4qUaeUMJknk/AeGA8D32dzotnnTzjDCwVJGFtd0jz3pSq3dKpJjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775025574; c=relaxed/simple;
	bh=+HQ0gXDkjpzkc/KWIR1BfY3mjA724g5ZTUFHwQFIvhg=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=FJomaqLHS9lWtWxdkRoStfz2iVjmhBqYS78VGgupmCpZGxXvJ7kHcACpd4ClePzTk8/V4PwZ1jrGLJuUWW9/bygmst6e9Mn2Ug421dg8t4e16qMuDwNL+/iIFiij8KJEOMYbg2CW5Ii12EMK0XYRE3srZwB0BAskMHIpFU4/bF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=k5Y1rWQK; arc=fail smtp.client-ip=40.107.130.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="k5Y1rWQK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HfrIIPN36ArIp3wXsNcO0AY70/X7N26PvNanYOydzEmiSpdIqYnOMDOCRtZNUPNCh2pQ0ojB9LLDzXs1Jys41+VTb7rwsI4BylU5XsiORu2Z+uJP3y20cYSdHSP2lQxz2hO2fqLdl2jCvC6Gx2NT8HXZKSiaORWDizu2A4NynhOeFvnIBImpA9aEO4L5323yrmA46ewkODLl+B7YZnHU8+4MbF+1FLPdKik8owlhkkM4w8i3ZoQFlYT/G70wHbf+WtQ0roJPmnE1hy1DkoN4ouXkKH/VMDhdxNWyYD1javuQaCOvFM9HKU+mxCuzgZM+CuZqW5TjiP0Exj6suab0jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJ2qoZp/qLIbFbLWXcOMtAplrq+Ta4y24qipqvuLdJI=;
 b=GMZaSPCEDR/JpoR+aS8dDfo5blNeWLM4X+lAFgSQ7wSPil5PP/GvzPu8a24G6Yq83HqdYK9XxLJZb+ibDIOfWTFlNhqfffmgOvTjYfm6kNtCNtTYxRMfA+Maja7KdWnz2Xc8Wbc0sWU0LCAGuAhqmt40rAmVC73cu0CZZNSOeSO1ZLsOIw9fCgyJLIYNKZA7iKoIZx2bRXaAjHC8potn0v/D8RM4rBZ05fKXYsgSppgdraZNMnX2MgEPnH/uo4efDy9UbpUk47FVwYVGbGeENqHJntPW39eBcyEMqgxaTV+jXVRw05+pJ298i4DvLC19XwrGCJPZHAofU8yFmaLJzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJ2qoZp/qLIbFbLWXcOMtAplrq+Ta4y24qipqvuLdJI=;
 b=k5Y1rWQKyQ7eImfSvyecxsMf9xpvrq5sNab/s6MoGvOEyzFjTj561h+k5HusJFyqcp2pcx960K3rKmTjXzm+RxSVGJLEdeMlEi6ybnR5s+jHk/Fja4t0x8zN/zwUD/PhgCZzhDa1HPYLUQnZiFg6Zde2SGTpIG0eWI9SUyKH4WEYql5+D6dKu7jWMjb/WvUyuxc7gczrQwbj2itFARNWA/Vrft6canj4sLz5xIP0IOQn7CcemI5pegCw2MTsMEEW6x3PbBtYhzgk84QPWuOhERFs8jLZof/BCFnGWvP4SCHTFkYNng+N438FZlLTMCyOpEnsBT9cIgVXFmH6N4F6Vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA2PR04MB10312.eurprd04.prod.outlook.com (2603:10a6:102:414::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 06:39:29 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Wed, 1 Apr 2026
 06:39:29 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 01 Apr 2026 14:40:56 +0800
Subject: [PATCH] arm64: dts: imx8x-colibri: Correct SODIMM PAD settings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-imx8-fix-v1-1-cb27398a6aaf@nxp.com>
X-B4-Tracking: v=1; b=H4sIAPe9zGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwND3czcCgvdtMwKXUMDYzPLVAtL0ySLRCWg8oKiVKAw2Kjo2NpaAEK
 yE59aAAAA
X-Change-ID: 20260401-imx8-fix-10369e895b8a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Philippe Schenker <philippe.schenker@toradex.com>, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:196::21) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA2PR04MB10312:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f57d715-27a2-43ba-9804-08de8fb96ca8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|19092799006|366016|1800799024|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VvZBYJgzgsSSQupHEjjXLyOcA/ijWWfqOKVvQdmqdaYQEURfaAp8khZLj3UQCQDfUWPv23cbdpk/LMF+DEFkpxM75PhmKreX53vHfp6ZSi/BJvkr0sRX5lYxuiGLPJQFL9EyKvmZBDV/Dw1QRgCOCfPYoCc4KTWOeZ5qoQ1KWf7XQJ8kzBgFmrpqHy+BPBDI02komEPaq/qw5E3QpQdJJd7QYWIT3TWq3v/UjW00sm9iZO7XrJSZ5Rw/LHR4zI2s4klx2G3uJbTKB1ijeW1XkM81ZzBhetUMyzjKiUy2PAyGXoXrrn/cExI3MQ+5qDLbQneJrKMJ+cq4CHWB7tVNn8XSNQtG70nGN25C2YIuUInMaUqXH67mMTaS8yZ5ebQWPK6RNVpFOd5tuLf6ApvjkT9jJap06QxqVlGhFPNRpvJn1foHjWTXda8rRXuDceDYx5ELRikxZ2Mqc/EUcqvFMmCPry9756LbvfeNSu8VdCeHlrtMv77FSdCnmOsxnfC0Ud/63n/acvKvNTtxWWBZpkhQ1QcrZVPmmZXSYUxulFwfWcMkGDO/ImlsIy3cudayXk317+iNN/C5TtzLczswZXIHwcS8cV1w7Q7WiRyh1DCY4a38qzTgJIpnYn+DpSA2U5oEiEr9VcSLRO2PSUqJHPU0F1wMIlkZ5xKPn0X7HSmAoI7X30DQHIkMiCFHPiBcwhtYJ75tkEw6q95ea2zSkeKtYvIqsNJYstdGuL/QK0RneZl2v0lyv2Wp9zB2998aLbfi+arlBpc4Y0+MQxPOpQJkytIJ4YI/il3Mc/mV5pU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(19092799006)(366016)(1800799024)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkJtNEZWQlR3UjcvZzR1aXlMeHZpbkVaWXpOUzQvN1lGRFpYdUJiRU9UZy9U?=
 =?utf-8?B?cDM2cVZpaDBrZDhEN2JSVm1GWEFuWG1uTDRLbmFtOXpZWWthZWxmbm9yUXZw?=
 =?utf-8?B?ZGM3ZGdpZzJoYjJUaDVockxncmFsQlJZcVRPWVFlOVdwNDNscGhPOG9UQjlY?=
 =?utf-8?B?UjB5ZUM5cC9ERXZQeWU5YkEvanZic0ZPT29ITGMyd3JjM2pNT0JBcE5Gd3Jl?=
 =?utf-8?B?dFl6KzlPSldGOEZDMGVqK3U3MTQraDRpVGVNMytwdTFPN0lmbXJmY3BGVk5w?=
 =?utf-8?B?L0tyL0VWeDl2Y2NjMFhyaCtCc2RHbG03U2FIVnFhdlNYdXJoeFZPaFlBeHdx?=
 =?utf-8?B?OSs5ZkRFeE5CeWVodGJVdWluL3Bnd0pVeTIyTXl6S2JXOFVhL1kzQW5jcUtO?=
 =?utf-8?B?S2FwMGxFZzJrNXM1RGFTTnZRV0VMdW82Z0swLzJULzJwZDI1dGw2RXlldnVw?=
 =?utf-8?B?cWFpVENSbTViS1NyU2JnNUU4VmxzT0hweUJrQmZiUm9yZCs5dDJWcWhHeG9y?=
 =?utf-8?B?Sm1Udzl2UVBNakdXTnZIbjlzeVh0b09NUGdsaW1xVXhlckwwTGtXYXhmRGxV?=
 =?utf-8?B?eVJYdys5TjN1TnJCL2s4dVRiSXZtUmpHZTZ3aDZNL0JCWHo3bHdzZUdZMWlh?=
 =?utf-8?B?V0lic3VaYTI3T3FSdU82M3A4MzdKL01QbDJacmpPbnVPZjlIRmhhRHVrdTRq?=
 =?utf-8?B?N1RMQ2ZZNitpK0NLVFVnL2Mwb1JqaThjYmdyd2lrNlFiL2NRK1lFSTNOTnNE?=
 =?utf-8?B?RFQrSHMvMEswbGtURjVHTHFXamJKNFd1ZTNqNGgyZU5WYUdiMTZ5SWo2UVRT?=
 =?utf-8?B?YlhhVzh4YnNnM0xwOU5pTHAyMmNpSWVZQkxTRTdxZDh2RGpMckVnRXlJVWZp?=
 =?utf-8?B?ZHMrWkFXYkV6eXpZWDBkYzJmWXQzU2hRVGp2Y1FvUUlLckV3ZmVNRnJIZjJh?=
 =?utf-8?B?SktORVhjVlRiN0JNWkRlZzhwbGRsQzRycXg4Y2Nid3pKb2dYM2JGN1BzSTQz?=
 =?utf-8?B?cmYvWWxnRnNPY0JtRW1GMFdTTXZLWkg5WitEWit4a1E1eno3VEFXTENwcGRa?=
 =?utf-8?B?R0NsMGgyVjVXa2Z0bWJzZFVIaHpDZUhpV2hoU2tRU3JxSEt5TzhWNTVlNmVw?=
 =?utf-8?B?OXRnRmowQmxDU0RYa2twZm8vQ0UwSmFjeDlrblhqSzZIdWpnMkFBSjFvbEZG?=
 =?utf-8?B?QzFuYTVyUUQ1emJoV3NReGtCaTJnQkhIMmxIUS9qUlFiUEZha3pUY0xEaDFZ?=
 =?utf-8?B?OVpFK0Z5U2M3QWdUZEhqT0RRbS9pOUNpSE5hQXVSUnVEQ1B1SlNQQ1BRWXUz?=
 =?utf-8?B?QVZxNWx1SkhISWE2WG5tWUd4bll0b1ExUUtqdnlNM05IOWpVdkxscEp3dHhX?=
 =?utf-8?B?YnlnaU1iN0FPZGFaVzBrU0R2TkUvY2pTS3ZNNTNDSGh2dHB5NTRJVGRpRHQ4?=
 =?utf-8?B?UU9IMzJlN1VJbzgreEFtbG44a2VCYktqOGQ5dG9WN0ZoKzlMOHJlbG4xU09i?=
 =?utf-8?B?WVRnSDNNSExMZTRtQmszYjFselJQWDcwZ2pqZHBGYkNTaFhlME5iYnFQbFRZ?=
 =?utf-8?B?c29wYXU4amxFZjJnQ0hIc1FDQnJSSHE0OXFBRDZpb1Y5ZW9YNFNCTTFBelpS?=
 =?utf-8?B?RHhCUUNRd25vZVhWazBNbTRCZERPeHNTNENMcnREcm9hVitlQjkyV2VOaWZG?=
 =?utf-8?B?Wm95YytLRUhhQ0NrWmU1OW9BR0JLQ2M4WFIzOUtqeDBLY1djdWlRRE5nVVVu?=
 =?utf-8?B?Q3ZsTTlSdlUzbkR0OTVwNGJsUEVMaE5TT1pGcWxneTJFZzlSRmZRT3ljdGZy?=
 =?utf-8?B?ZGR4am0zZTN2ZEpvR0RoM1BFMHRYNUxzYWZhbnVBc0JkZ0JVK0hEdmVOZGNB?=
 =?utf-8?B?NFpUNkgvaFpWR3YvdG14V0U5cGZVbVVza3dxdmdnREwrbGJmY0pVWlgzZzJk?=
 =?utf-8?B?SUF6Q0dxNFhKVnJaLzlyVmVSWWxuWkIrY1VtMXk1SUUzeDVNZys4N2pvcnNW?=
 =?utf-8?B?NGNiZ3RjUzBPaVh5ektQWUlialVpZmZSZ3F6YzJISEZJdVFFOWdCbCtOQlRt?=
 =?utf-8?B?ZFBFekN1aUhkSjBXdFcwOWFVMk9RcXRiOGtidUpIMFFUZkM4VEU3WWpCYU12?=
 =?utf-8?B?aHVBL3J6ZkFyc3FycExYWmhMeHBJeExaZXdEaFdzdHRhRDY4UUNqMkhINDVJ?=
 =?utf-8?B?U1V3WUlpRzRtdm5aN2ZSTHFLNkZUYlkwUW9ZeGZwZnpxd1hZTjc1ai9Ya3h6?=
 =?utf-8?B?L0tScGdiSHk4K0hsbEE0UlZWcnRTNU1BeU0xZ2RDMkl0bUtLYjRkNjdSaDRY?=
 =?utf-8?B?UVBpTTJPOHl5ZXhNdUF6TmV0LzBTY3JpN1EvQzNLRFlOR0VmaG83QT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f57d715-27a2-43ba-9804-08de8fb96ca8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 06:39:29.1305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3KShEZqbzHMhea+uSpWsjtk5bmK1wf4nvf4qjT+IbE0cCiyhbgQXjU452heS8oL3jbB/u7EIdiK0CCUZ7sJzYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10312

From: Peng Fan <peng.fan@nxp.com>

SION is BIT(30), not BIT(26). Correct it.

Fixes: 7ece3cbc8b1ef ("arm64: dts: colibri-imx8x: Add atmel pinctrl groups")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
index 47895ff8cb244e9bbebe228eb554c2b3f0dded1d..2415487d3a5dea92f9084cd1b312a07f6a09f3cf 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
@@ -631,12 +631,12 @@ pinctrl_adc0: adc0grp {
 	 */
 	pinctrl_atmel_adap: atmeladaptergrp {
 		fsl,pins = <IMX8QXP_UART1_RX_LSIO_GPIO0_IO22			0x21>,		/* SODIMM  30 */
-			   <IMX8QXP_UART1_TX_LSIO_GPIO0_IO21			0x4000021>;	/* SODIMM  28 */
+			   <IMX8QXP_UART1_TX_LSIO_GPIO0_IO21			0x40000021>;	/* SODIMM  28 */
 	};
 
 	/* Atmel MXT touchsceen + boards with built-in Capacitive Touch Connector */
 	pinctrl_atmel_conn: atmelconnectorgrp {
-		fsl,pins = <IMX8QXP_QSPI0B_DATA2_LSIO_GPIO3_IO20		0x4000021>,	/* SODIMM 107 */
+		fsl,pins = <IMX8QXP_QSPI0B_DATA2_LSIO_GPIO3_IO20		0x40000021>,	/* SODIMM 107 */
 			   <IMX8QXP_QSPI0B_SS1_B_LSIO_GPIO3_IO24		0x21>;		/* SODIMM 106 */
 	};
 

---
base-commit: 36ece9697e89016181e5ae87510e40fb31d86f2b
change-id: 20260401-imx8-fix-10369e895b8a

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

