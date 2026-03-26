Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011063.outbound.protection.outlook.com [52.101.70.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C003A75B5
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 07:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774510080; cv=fail; b=fnq4qZb0vYsA0dnUK07HSCTdIi5S6IoIS3c5V7dG8qd9Jvp0rW5jeOpGWXRW74u3QycM16CnRE3e1jDpOL+FOuLnMot9oOpfmkxHAzNhy2veT+hFdiHY9lNZ4USrnPX5PmbBPW7OimW+zezt9I2QKgQvSX6zh8Hojt+l5kRveIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774510080; c=relaxed/simple;
	bh=YACbTyyACLd0h8IY2k7zm017YrGCuHx5PETSFlmg9c4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Mr75n08SsYhf6h/OZj9MDIGETijh/gJrY2eR96JPGGIsZ81l3alc0IZ55W/JO+1UU3z3Xvt6N/XxB+fp2HMFGZalTG9v2hqXNdd/UhDVH8CM4Ti5qZi3zXcgnGFw1Qd6HOQYw3r2VyudhuHzWdZXaz+P8W7QbXxSuz7ju1sgUcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dr78rJNx; arc=fail smtp.client-ip=52.101.70.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dr78rJNx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oAm3SI7iTRTA579/FnqvgeYH0sEBYyUHtb7gNUXbPxanDk+vkf5JuYhl0V0Zd/yQwFQ1lQzVQVkHioW9joNlRdO1cMC/cwG2vWj4/PxcPg+dGrNeBdz6nbgdtfz2alCzsm97TJYLMkuVOKxdgn9kU3pmo7nYJvsfbH9vxZL1vFmpdNgb+nRjsnbwRlW0xTH41MdQZbhmRnAlU3OVn5azmN5p+KL7AO2NDxUhpdszh2liWePh1FHRZ9X4iNpkM5dJtcu/u2SQtEpzmy6xJ7Stb69Lvqii/09iMbfMo6qZFiBK4tOzhcnhxPdt5m5oX6FKxVCqEhbwa6GGe3qfYXgtJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVZIx09/l4mEFnxnLQtCZrQEAQE8v4mu3y29h05xa04=;
 b=rLa+l+rVDq7JK6vn3H0puNjC6+yhg2Yf7RJ0xIULmWC8rK/E0t59iRr00uB/1wzuUgcf3RoaQe5utEKseykZx374k7MJjQgoxyjpDvgx+K6C6jpxH0GoNIx8v+bKJNmgIK3ahbhR7PAYn3OXcB9DY6bMxLXnjbwnVTCF1jfFyY5phy0z1HtJeSdqLOiOVtMJ1Yo4jcxT2xo0B43K6+xnALm2bwhhUmjvnbeKMzFSc6SRK5fFeNOQ2WBtbZ6P4/vLWzffgeFxV1JQjMMS+jLjQ+xgMDUz+GzMuQJmhP/58XJk+pGDD7z2b3ga9d77gt90Lw2m7SALpMSqKRRaVM0wgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVZIx09/l4mEFnxnLQtCZrQEAQE8v4mu3y29h05xa04=;
 b=dr78rJNxAwUG6mE0laxkX5BNSldxv47Yk+ExDnAPCwfL7UrNb4qssX1qxxysTU45rO1XXlE5+YfhvEiLV8ZUlDjxDqgzVmtsDJm763xJAv8X2Bq0uw5s0pGrHvs4g3+yMuyP+ewMs8EujODDjdx/WgBuZRPCDNIxBzuZOuFj+GECZpPyIm+Cj+1Vug9Qrnpb7ppYgT1nnW+PJ1zFG41efIAo2MLafIwOyH1fhVkXnVr+beqjQnIYH7aeRlNzIewVDrlV+agYHZP44At+DgV9Up63gXtFninwLNs1Yj66j7j7FDmP5qd8ZTAOwZ3FnuKgLgh7bxZgBaTD7xm74eJ5OQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB6816.eurprd04.prod.outlook.com (2603:10a6:803:12d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 07:27:45 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Thu, 26 Mar 2026
 07:27:22 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 26 Mar 2026 15:28:11 +0800
Subject: [PATCH v2 07/12] arm64: dts: imx8mp-aristainetos3a-som-v1: Correct
 PAD settings for PMIC_nINT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-imx8mp-dts-fix-v2-v2-7-62c4ce727448@nxp.com>
References: <20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com>
In-Reply-To: <20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Shawn Guo <shawnguo@kernel.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Gilles Talis <gilles.talis@gmail.com>, Viorel Suman <viorel.suman@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Manoj Sai <abbaraju.manojsai@amarulasolutions.com>, 
 Matteo Lisi <matteo.lisi@engicam.com>, Ray Chang <ray.chang@technexion.com>, 
 Richard Hu <richard.hu@technexion.com>, Heiko Schocher <hs@denx.de>, 
 Martyn Welch <martyn.welch@collabora.com>, 
 Josua Mayer <josua@solid-run.com>, 
 =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>, 
 =?utf-8?q?B=C3=B6rge_Str=C3=BCmpfel?= <boerge.struempfel@gmail.com>, 
 Christoph Niedermaier <cniedermaier@dh-electronics.com>, 
 Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@dh-electronics.com, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: f3a95676-5459-4fef-74fe-08de8b091f17
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|19092799006|38350700014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 USjSXXEOhlTDMlLHPaGiaSSskoOPcLtVLMPUkGNp1x+e2YrNt7PMEV7IDcS1PtMznzrsiSaQRZREfmK/o3acjFPjHGXM/IrJ442Fd3oqGYFjDwGioi+7kJcSb/A/yv0GEF6LXpwf77Kx0C2xXFXOzr7j2PzAgIXJ2A+7JEMBUZrYUeDgy4WYi9xxNXdPVxJdbXk63r9cy/rCb128KiXevSEAQXlY0C8Gp4fM9FifNlGjX87b83GdaZ42MvjpWEG4SKlQVumHlNoszNyiB1r01j8Qr1t3zVcK29Li1pLsLRkL6xbMv8/4DDBxaN0lKpSinXYvQiXC+/Cy613MLV00PdnBYHadwo7khbxgIA8gbZFv28celFyZ70FywkCnCUziISNJkr2FIXhEaSn1uxcEMy3GuxQYuX5KTmAuROJqRmCSk2NHGita/0Pq0mz+VATQ04ZDYWVI+p9cfjiwjDVgPtxwW5LaCuZpfyaxqzX9jvg9uFAWpkLwjWkGHEGXUZ0ocbTM6M2IktkUNPkkqSuPYZFy9smTq8jUvf0j+HKC2P5+pORp9IttVOq9UQtXU8aEGABIOnYOiCsMpaQ3H7ZGwg0JLbe9XWHVerZcqmPmJPehtvLnlGE1VvmAlEWPilKfKAR81hGov7X/97Hr4nCClAwPRAqxlz91YVNa1KUZSA9ndW6tKXUdk8qCL9VoXNhixEK3lXpxRATvI369wWMByKp/souQkG8XIWs9LnJICukTbr1Xr7cQWQIzY3IQ//kUDvYHjrEMguz3/vPAzvlsp0VopoiiQy94el/P2phKkFrnxvjknzmz4nqZr4ZxZ7HZ
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(19092799006)(38350700014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ZFhRVCtnUnVhQkMyL2dLN0FqSTVWMzlmb3N5bFBzS3g1WnNmdHJUOHpUNDFL?=
 =?utf-8?B?bU5yUHJ4ZWVnLzcwaldNbGJmMXVJNFAxeTg5K3NtYnhSVjM1N0FLa0NjaXU1?=
 =?utf-8?B?YU5LTG4yZ2Y5M2Z0ZXFIdENIYWVGengzUTEyMjRhK0RiR1lVZml1Q3NrUDZQ?=
 =?utf-8?B?MUVjZUZQeWdyODR3ZnY1UExsd2lZVTRxTmdvcWdBT2hveUE1S2pGd2xPNnpS?=
 =?utf-8?B?K3FnMm9qUGgrR05lQTQ1dCt2dlZ5Yk9QVFpuZW40UWQyNmVpOE8wLytCcVF6?=
 =?utf-8?B?TzBaVkxhSXZOVzVpanVFZ0ZKc2tRbXZxbVY4RTlIYS9NNVlSS0dpYm9XbGI1?=
 =?utf-8?B?ZjZHNmxHVW45SWtKRlVST0pQYUVoOC9aTFB2MzRFMU4xejgrMWc2SjRONXAx?=
 =?utf-8?B?OHBMR0lpcExvaStqWkhNTTdOYnJNZXYxaldaanBwRjYrcjVtaHNxaGxobGI3?=
 =?utf-8?B?T1F6Ym94MWdmOFFiSFBwRm9vS3RIN3NBVk9ZSHZiWENNUndTbVVzdTdtL3li?=
 =?utf-8?B?SW1YMzNWNzN0dVdleGx5K3QrTlR2WDVqLy9melFvMERBMVI0QVRWeHdUSUd3?=
 =?utf-8?B?dHo0eFM5L0dGeWJ4ZlFralpheUpnc3R2WnNURUo4c3F5aVlZY09Nc0cxRWpw?=
 =?utf-8?B?ZUJUWTRKaFNQSjRZUnRRdEJ6MG5oNkJvRVlFNG8yeGVJK3pIK3JPN2JIVnVu?=
 =?utf-8?B?M1lFY0l2VFIyRXJ6UUJiWGIyNGs2QTFNMTVkY3BnT044alBnbVhwN1VnL2s0?=
 =?utf-8?B?blVWYkU2Nml2bzEvSHd3cDlvYi9Bb1dFUVpoUGlsZFArWEJId3pLbm9SODkx?=
 =?utf-8?B?eWIxVWY1dTB6ZTkzNjRjTVA5RXNyTytydUJNOExhQk9Ob3RObjhUY2lQejh6?=
 =?utf-8?B?enhFeG0yaVBIZG9rTE1VNGF5UGhMZVRZSjBFYXVRTGRGZEMzOFFxM2pJVDcz?=
 =?utf-8?B?ZmN6Mk9CcTV5UmRpUitsbHovazhBUVUxSEdwTWVHa1RLbnh5RUVEQjNxMFcx?=
 =?utf-8?B?UG9leHk0K2hyOFM3MkxCaW9GQzFZVEtBT1VQSFozK010czgwajNyMXpzdzdY?=
 =?utf-8?B?cE9pVXhTOHlVQkVsZTU2RWpDZmZFN0lCVWRTdzg0QjJYRlNwUjl1ZDhnZ3g2?=
 =?utf-8?B?ejhYYjZjcmsxbFhHMzhZYlgxc0Q0YWRNZ1dWWmJpUVdXcXpWRE9ZVjZ0alFu?=
 =?utf-8?B?eGdicFczMmdKOFl4S1hvV2hjNmxlVkN6TWpESVZYeU9qUDlLZnZQek5aWnAx?=
 =?utf-8?B?YXpMTi9JU3JUTTN4US81RnNYTUVmSnVCRC94ak11OXorRHByM3NTdWFzVDZH?=
 =?utf-8?B?NWpPWUo3UmlSc3h0OFhjbXZqa1ZKTk1LSytKZGFoczdSd0x1ZFBWanlPc0tr?=
 =?utf-8?B?T29QeDRsYmxJdytVWTVsZ1dkUTZadXN4NGZQZnBZbXNRdEFXZms5ME9hNDEr?=
 =?utf-8?B?MHBkY3B1d0wyL0R0MXRuenpMWGpFMDdNdVhiMlJ4bitaQTVTUmp3cHN2Yzlx?=
 =?utf-8?B?eTVnWFV0SjVWbnhvOEJ5QmVrZXFOZGJQOTZBVVdGbTB5Yll2Smt3SGtMQ1li?=
 =?utf-8?B?VFdicWtNZUlLZElUWU9yN1c2MENIUUZvRUlSdVVQeXFsTlBWRE4xaTBVbDNJ?=
 =?utf-8?B?M1ZjS2lqM0xaak5BMFo4M3FYWmNjQnB1Y0plTTZ5TGtPekIrcURqTXBBUUVR?=
 =?utf-8?B?TGorY2VpSkxabkNQZFdXWi9NYlNTV09GSTBEVkNDQU5TemlqYzNlVHBVeThL?=
 =?utf-8?B?L3NHMU1YN1ZEQnBiRlVxNnNmMmM0cDFyRFZtQlNUL29xbUlKRXlzVGxGU2JZ?=
 =?utf-8?B?eC85bE1SQ1l5Z3NZMVR6ZDVpSjE1N3VEQ2s4aTUvcEJvejJPOGY0RWdMdU9S?=
 =?utf-8?B?aUFEc0ZDSVpGdExjTmdaQk13dUwxMWtLQUVzbmlIeWIyMzJCRm9HZUhVeVNU?=
 =?utf-8?B?Um8zOHZNMmpXcTdDN2FtTE1TRVphWFVSdWE0WXFGYWtYNjhkV29paCtMU1k0?=
 =?utf-8?B?czZ6N0FaYjhHYkNSQzFFNGVKbnBjWkN3VG9pOG5qU1F5aFpYOWVZOTZId3N3?=
 =?utf-8?B?QVFyMGwvNVI1SmRuN2NEaDVHeFd4V25IS1JIREMybDkrVkgvdzgyWUhmZUc0?=
 =?utf-8?B?a1FUeC81QzBEV1ZnTkNzcFRCREpqRSs2YUpCSHl2NjFtVGc4d3hHRlFiRG83?=
 =?utf-8?B?aVdscU13K2Q5ZkJzRUpNK3RrWnp2ek52WDBoRmV6bEgrSGRzVE5wS210YmJq?=
 =?utf-8?B?WXN6bzFkbkpFdVFqZzh4UXpyb3NxY25NSFNyeTVPRGhUQVB4TVFnaDBGNEZP?=
 =?utf-8?B?T1JteTBvYW1rZTFKT1V6TitoUm5tVE92TWJ3cGNDc0lFMm02M2VqUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a95676-5459-4fef-74fe-08de8b091f17
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:27:22.7742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sOwTmApG5tBMdYj+slv2Ox7+T3NBQAGdHo1tN1ffMwhUWDXlmJmVf3ScPAxXIHLKpG3qZZNGrHb1oOQNOBJVTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6816

From: Peng Fan <peng.fan@nxp.com>

With commit 5d0efaf47ee90 ("regulator: pca9450: Correct interrupt type"),
there might be interrupt storm for this board. Need to set PAD PUE and PU
together to make pull up work properly.

Fixes: eead8f3536d5c ("arm64: dts: imx8mp: add aristainetos3 board support")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
index f654d866e58c06245b06348a14ca1b16c6c4550d..e7666e54310be0f4c028491ba4383040d859a901 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
@@ -903,7 +903,7 @@ MX8MP_IOMUXC_SAI1_MCLK__GPIO4_IO20	0x41
 
 	pinctrl_pmic: aristainetos3-pmic-grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03	0x41
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03	0x1c0
 		>;
 	};
 

-- 
2.37.1

