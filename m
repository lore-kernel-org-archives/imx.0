Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010034.outbound.protection.outlook.com [52.101.69.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C052438BF71
	for <imx@lists.linux.dev>; Mon,  2 Feb 2026 19:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770061436; cv=fail; b=FTEc0fjhf7dbHy8GXTU6MFs/1RxQRF5RRGqaZQKufk/1JgBfrpQ+bln0LVU/izdJJw5uABjMzgyhke70X7ElI2mPYQFXLCNs280jPD+8B85vMwpHzBONyBEEVA6gQjwiMxd1mUkrHPxvwgU1vyWHdF8TY9uRyNRSK8RqLxA7TU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770061436; c=relaxed/simple;
	bh=t7pQuPvELpDHLe0kEFnC4flzw2VlJGJI0S5kXl74M74=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Msv8HoMjpzDwmSwXK51oIGeLPdHYiRaDJykFQoy7nvqHGlHrFKNE4V2/Xte4WIq0fBvbFtKevssAuEiuAwpyJ6sIQn23ZiEf/Nuzh8PfDPaHmyUKFsfarpjrsU5SILkddWTg+dKuOLqLWGK350zW9acjVG3H0tMQAQawx5JqugM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gtZl2rJU; arc=fail smtp.client-ip=52.101.69.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gtZl2rJU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nnmtNG/grq9QCvMcpE6gyQQQABDflDnqok5WCOehNKD+SB+PJagSzSYYbaFuerLC0+LgCRNdpLETGnegjJS0rMCsStYFyYF2SfE6kSMegP+zBSn2KCY+UEJZjJRznx8Y4/1K2/HqRKeaHtWfZvrBR7IHYxCS1Y0oeG//BzgTlqFZo90zr4OzjDfhm77L69z75S7GZMfGyRytW2xjUye9L67mH3G7lEBpBzmKdeIcK/8Wa02W++rkYUjlSdua3xJbTXFMHOQwB4gznMjnS/brPyJCiHNtkPGEjGONxx6/gC3DplrIaqmqERoqlsEJFsqs5AYD3jvXC9ro+cH7Atg+OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmU7aXdXpIFGRy5tj75deowJF8xDytQ/SMe8aKipA7k=;
 b=Xr7jgJnmsj60E/6uoQpb9hQ1nj3PGD7+VzAHI85RZ4qzvEXTQ/vRODYdYOjOqVRaIPgTXRb7uAQb9yEWulERjQoCUjedrhNXDtxUNiMrhnfJhQ6/wsTb8wlNg73asvkVfKtRHBuMB1GUuj022/DCBzzUdSwsp1ztzBOOCkhROmTDbdUoDq0pk9e2713shaUSkk6y3QwKJgPbIhKup2Hb7DvE1bTgqvSkUf89v/nyUWyqShBcPZDv8ct08Ggsmwkgc0nROodt2D4Ja/AspXiVbJBABA/D07yJ6Bl+Iye5Fhur7Im+WbU/LVyHH7UBh+2dQa5S0OlNd4xADLRFQvn9Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmU7aXdXpIFGRy5tj75deowJF8xDytQ/SMe8aKipA7k=;
 b=gtZl2rJU77ziJk/h9EY78iPVXwJlvzjk5mKKLX5iNigm/2tV9MiS7ivOUEDWgwP08gSwcFb59EeMhm3KGB1gEu9lr+cujEyCUNkHe+h1r2QpUatX2Y9of8rarefBuv2iN2yvNnwhEkR1Ti3m3VH0hMdSv7BuV5+ZnCm4S125kxe4nV2o5oIuIBroXr9fUIeNv4/6uX14cXHP8KPEDTsLMSdzbCZ9szKFcG7q9n08etCQOVQOV59ziyblxgKior6Szfg96DOOxv9mfg3CRfkOLIwLMXMVheZ2Pn56/bMIg8MuCJmZgGrejQFZj/ltzRl62NKommNX9B74sc2Ne1r53g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8667.eurprd04.prod.outlook.com (2603:10a6:20b:43e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 19:43:53 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 19:43:53 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 02 Feb 2026 14:43:25 -0500
Subject: [PATCH 08/10] ARM: dts: imx7ulp: remove #clock-cells from
 clock-controller@40410000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-imx31_dts_warning-v1-8-434dd2643c3b@nxp.com>
References: <20260202-imx31_dts_warning-v1-0-434dd2643c3b@nxp.com>
In-Reply-To: <20260202-imx31_dts_warning-v1-0-434dd2643c3b@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770061408; l=1044;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=t7pQuPvELpDHLe0kEFnC4flzw2VlJGJI0S5kXl74M74=;
 b=VR7YWeIcU4n7m+CQy8L7GJU64RLvus1zNwaD2kCY6kOqvpS/3er4Yhwkkc2HhhWEIlwdm4Q93
 KuTW1TMJ1U0BsN2dofI6SrArvKX5eWGOhFwslHyNEMfaDUSFjZVFBxf
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P221CA0006.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8667:EE_
X-MS-Office365-Filtering-Correlation-Id: fe69e84f-8b36-4812-a8f9-08de62936524
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZEtzbjR3dTdITkNtM0ltSjZaWkxRTkdhazJyMU5IWGN4dktQcWhvYXd6ZVYz?=
 =?utf-8?B?T2NzLzJrV05YWUtXQ00vaU5BZ2phS2dPWXpWU3JnVVdoV0hXMXBPNXhxWmRQ?=
 =?utf-8?B?ckRRenNRNjJibUlONkcyRzkvSzE1NWhSbm8rcGJEemFRd2twMmdxNW5wQ0M3?=
 =?utf-8?B?NW0rSWpNNnl4UUprbGhWTEEwcXZLSE5Qd1hTOGZCR1JjcjFuZHFDRTN3QjBQ?=
 =?utf-8?B?bEtoM2ZrQTM0Wm8rSnJTZmxxNWpIa3JUL0taNEIvZWdORTRtampGVEZ6NURa?=
 =?utf-8?B?UnpDUTdMMURkOTJPZHBiUjZKdWZ0M0I4dlhsQjdwNU5mclhyS3N1YlpVSlJn?=
 =?utf-8?B?QlJVZ2RmRU5Wc3RYaWxnc3dSa2xkNUR6UzludDZMOHVoa2VUR0tEeVpmRFBr?=
 =?utf-8?B?RVAzcWJzcVVMUzZJQ0Y0Nk1HcTlaVEZkb3h3bHRTbzIzWE53dnM5b2JacEY3?=
 =?utf-8?B?RUQ1Z25SQU9QSmNGM2Q1WHNKcTlaaFA5YWxtK3ZFaWt0QnhoNGlyWDVJaEdJ?=
 =?utf-8?B?L2Vud1gxa2F3LzhpTm5MRENjcXpDeDlvZzAxMG5UcldDeG5vOWpMNFRVV3Bw?=
 =?utf-8?B?QkI1RHJNaVl5OVBnQTNGRG9pZm5NNjhRYmJwQlAzb0pDelZEOTM0NkJEKzY0?=
 =?utf-8?B?ZklJdktCYW9KbC9wRXBtT254ZHVRUlFyekk5VGFFS2k2djdDVWFXUFZOb0ox?=
 =?utf-8?B?TDVLYUZ3SkFiNVA5bW1HUUttalhmWjIrL0VyOFRFeTRYTW5MV012bllXVWhR?=
 =?utf-8?B?eXdENkFDdDZWYWRKbXQ0WFQrTWxnY0RFL2swdDRUQTAwZ3hsVFhSaE4vNG9a?=
 =?utf-8?B?cUxydUUwM3dPNFVuamJNekMzME04dXVQejM1VGV0Ri9LMmNLclprUGRScnRH?=
 =?utf-8?B?LzM3UURzNGVpYlhKbVp2L0NnMHpBYXJuNU5EY1VQZWYyMjcxY3dPUk5rMThI?=
 =?utf-8?B?REtndVFVSkVZYnRXa1hYK1IxUUxhakw5WFc5dnlDMC9lSm5iNlh0eHBVbUdI?=
 =?utf-8?B?T1hRSlQwL3EycU9wdFBVVmRkUEJJdjBuazRQaUt6SDhmT3JZUG16RVVvZWRX?=
 =?utf-8?B?cGNFL1M4TXkvS1hBSjBNY3A3QVA3SUcyNm1DdzJHUXZQSkg4WUUxbGJpUUFt?=
 =?utf-8?B?dUNhY2lQUDVzSjR4QzRoMHJIYlVvb2xPU3lFM2Zob2RRWDNQQXBUcUNTSnRG?=
 =?utf-8?B?Q1FjMzAreVFmWnpSdDdOcDc0N0YveEZhNkVvN084cG45VzFNYlZka1EwdGRL?=
 =?utf-8?B?WXZkbC8zRldqRWlITGlrdFNodlJsMDJ0OXI0WFF6S3BjU0FoWnluVldDSUVZ?=
 =?utf-8?B?bHk0NEozTFdUeFJIR3Z3OWhHbkJyc0Vkb0ZhaHBuRlRiMFhuanZReG5VKzRE?=
 =?utf-8?B?NS9rbnlSYzBCeDNsMFYzdGh6a0VDTUlVa1JId2pSbmZqTlFUUTdSUXgwenFO?=
 =?utf-8?B?ZjNPTDhBMk1SaHMzS08wbmZ3c0lxYVA3MW9uRElKZ1ZCbk55QllHb0dvbDA5?=
 =?utf-8?B?dTJ0bUV0R3pQSlI3b216NGtSUmFNVzluUnF6YkdRai9GT1RRZjVjSXFGeGpB?=
 =?utf-8?B?ZEU4eXc4THM5a1lDdEJ0UVpON2cxbERZZ0JwNEp4a1hHeFh5UEt6WGRQV2pW?=
 =?utf-8?B?bTFlZ1N1eHRWOVhtL2R2dGtUWE1xV0h0K1oyZmY5U1FKdVpHak84NjB2d1VQ?=
 =?utf-8?B?bkI0WGVMbEtyYm91bDU1MklPZ3gyNVUxNFlRdHlyMVRkQnUzTFQ0Q0hUZFBS?=
 =?utf-8?B?Z2ptUk4rcnMvSmpLZ3VhemtKdXRRSmtpZHpGMlVFeHlDc0w4OHZ1T3ZwUkw4?=
 =?utf-8?B?MFYzSlRzSDNMUGdYMU9xUytrOHhObUxvTW1LTWpQcmlQUStNOHNaNWh6NEpj?=
 =?utf-8?B?WGxMY3QraEk5UHVmNTh4YS9KZlhpQVpjWTJoVlFvWmlYM1N1VEtkN1FueGpx?=
 =?utf-8?B?VytWMWtieksyVnNuMFJrUmFOTTVTV3dwRHFTckZXWC92NGtGbHhxVkVvQktZ?=
 =?utf-8?B?SlNoUkQ3M3BRTjA0SGk5ZkdLWlp4ZEU5VnVJc1lwUTdWM28vMzBTNmJjbDlC?=
 =?utf-8?B?OGtSdHpYTHBjSjBuSFRzRzhuenZCeXlUQ1d2ZXEzdkhPWlVpTitBczFNRkwz?=
 =?utf-8?B?N0dEejFCcHJvbmdQQ0g0Qko5OTdsaW9mQXpCN3VUYVB2SXZ4TzZyNGFxQy9r?=
 =?utf-8?Q?OhccTGJxdxKejfGEVSLDLw4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzZTWjVrYjdvUXArajFOQU9sTUhNTFB4UGQ3UjdFaldQY2lzK1F6azZrZzY0?=
 =?utf-8?B?TzZtMjNRL1paQkpwNjl4UFI0NlNpa1BKYVFWc2xOOWluQ1dSMXRLOU5FTTRy?=
 =?utf-8?B?SDRRbGtJV1RmcHJkR0MxbEpwVWVsSTJHRFp6aXpRK2FhTVpaQWVpLzlkd2xz?=
 =?utf-8?B?dnRUNUpZYlRLaGdrQTVUV0tBazI4clJNZHBFMzdMOEc4Q1VBREVlOE96VGkr?=
 =?utf-8?B?bjEvREtIa3lPc1gwZFpGeC9meE44Uzg2Rnh1OWdsWXRhT2syekM2aVdhVVhz?=
 =?utf-8?B?ZTVnaVlZOUhjakVoM0FWYTh1L1BBQk5PbStraVVMMUhHOTl3RGNpeHVqOVNh?=
 =?utf-8?B?amVPRGJqSitlbmY2T2RPSzRlVW5ET2ROdElxS0ZnQnlpdTdHYWQva0lYUG1a?=
 =?utf-8?B?VW0vRFBVUi9McVArTTJDRTYrRmFFZWtyTXAvd2VTa2Y2OGlEVU9NTk0rRi80?=
 =?utf-8?B?dmtKMEdPVjNzRENXNDJqOGU5TkZ6d3lOKzB3b3ZNL2g1cnoxKzV4am0xa1B6?=
 =?utf-8?B?U0l6UmUrZnBpcjQzd1hCVGhDdVRHdlZIRGhFalpaWjNya1EzczFGak1UbjNw?=
 =?utf-8?B?R2w3NU1aeFk1Z1h4Nm1odXF6OThna3lKUXpraGwyWEdlTVlVMjF2T0pRcVYx?=
 =?utf-8?B?MDAzQUJiRVVXUHUrWGVnbEtWbGtOb0c4dyt2NHBrWDJvZHU1TzdyN1F5QWJB?=
 =?utf-8?B?R2JXWUxock8wc3lzT1JoemN6MFhET2g1bG1Db0RhOURyN1NKTUN2RHJUL2Fn?=
 =?utf-8?B?eXhsWlpaTFFOTXpLV09DRXo5cWE3Zkk0TzRyZE4yZ25oQTkyRjB1ZENOeFRZ?=
 =?utf-8?B?dDlkTk9iemRYVUdiUHZha2lpQTdFaFFkQXVsRlZoQUQ5ZlpReXo1clJxMjFj?=
 =?utf-8?B?WGsrd1hPai84UmJIS0VsaDRSM2VHazhtQ04xMWI2bk82aFJmajBFZWFlaFJh?=
 =?utf-8?B?U1NNTlV1djJNQ01uYjQ1bFUvU0dMNG5taEUxcGt2N29wME9BZVNScytoOVNK?=
 =?utf-8?B?RnVJY2RtczVIcWxmUEdwQ2Q3eDNSQkhXc2tFejRXcEQrQ2crTUhTL253Vi9X?=
 =?utf-8?B?SDJBbjNKOTNrMnVlVFZmQVlWSGxBNUEyRlFCcDNLSHR5SFhEeWxzZ1kvaURs?=
 =?utf-8?B?TDhqdGV2SFJHdUxPVVAyc29mREluOERvWjR6VUpUSmpKQ2pZVURhZjhyK2pt?=
 =?utf-8?B?SnozbGRRZkdnem1LRysxeWJhbktKR0dlZEZuNGRPTnFUdTYwSm1RbER5YkMv?=
 =?utf-8?B?SllyWlluYWdjRVhDaHVCVjkxK2ZvMjZzRGhtbHNlTG1ldUFrVWFQNXcxTUFa?=
 =?utf-8?B?MXp4L1VUZTNpWkFEb0hPTVNFbE56cFBnazdyQ0ZxZElYd0VEdzNQSCsyY2Vq?=
 =?utf-8?B?U2VPSFpCOG1BcVgvOC9od3dYcThPVUpSQUV4M1dGVDhIY3lVMEE1VklKeUt1?=
 =?utf-8?B?NHFvTDVyL2t0bWZsRzlqRHVrTktxb2R2SEJhbWo0ZnJLL2pXYU5BcUpsSHJT?=
 =?utf-8?B?dVdhcGlIZkJuVnMvV3poLy9abGgvRkc3NkZJQUZXbGJqVzN4THMzLzlGQTlm?=
 =?utf-8?B?V05mNXFXcjR6TFRZOUZmRGVkSlRTSVZlNWFOV3NHYzh2VmJ6c1BlU2R3aXRS?=
 =?utf-8?B?YTArNFZJajFhNjgyU216OHBsUmhpZ09NM2wzN05MSVBYdHpObWRDeXA5UkxT?=
 =?utf-8?B?WGhhRzRpL21DOXJaNVhPbm95ZzRQVUNNYmQzUlJleVU5eWdSeWlBZ0NYWVEy?=
 =?utf-8?B?enlVY2cwd2ZkQThVc05yb01kWGpucVhoenJ4bnVqUmUzT281bkhZdnpIbndu?=
 =?utf-8?B?SndHcUQ2ek1ESUxOQTJVTUNCMy9ZLzNTQk1SUUFsWk5SQUVLRmF4WkFkOUU3?=
 =?utf-8?B?NDNkdXhDNmF5cURNQ04zU2ZhaWphTGsxZ2xCV3dGNTFFT2lWdVFSUGtPRXdC?=
 =?utf-8?B?cGljY2IrRHBwNmhKZW54OWRpbk04RzdVaTEyVU8wSUQ5cFV0bmdqNnNIaXFs?=
 =?utf-8?B?Umt4SXFJcXVjN2JWWmFvanY5eU94b3ltbFNVbDUzN2N3dFhYM0VqdDJKTHZW?=
 =?utf-8?B?UzBnK0RuTkRXNHlhQmxjSWZzK09NZjBRb2lscHdHS3c2cVRQazZYdHhqZFh4?=
 =?utf-8?B?YmVxOVJDRzVycmFPNGV4NE5iSTNiN3N0QU1WNTd1WEJEWm1GTXJGSGQwZlB3?=
 =?utf-8?B?WElzRXowY1dKTThrMmV6WkprTkFQTUxEZ3MwVU5Jb2YvbEEwTTRIVTBUN3hr?=
 =?utf-8?B?bkcwc0JiaktYd1JJTHpQdVJlMlBJbExTSlhKK2l5M0JmN3VvWTdDS2VQbmly?=
 =?utf-8?Q?36eKqN1IoJqD0SCldU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe69e84f-8b36-4812-a8f9-08de62936524
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 19:43:53.0925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JBsFPmFX8PKohYZJPlsob2AxSpGLSM6AK+wgLFjp4w9PlIBbXhcMwiemytyzOQhmkvYYCJTaUv0uYHvG3kuqsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8667

According to the fsl,imx7ulp-pm.yaml binding, clock-controller@40410000 is
not a clock provider. Remove the #clock-cells property to fix the following
CHECK_DTBS warning:
  clock-controller@40410000 (fsl,imx7ulp-smc1): '#clock-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
index 880b9a4f32b0846a773dbf9ad30715c84ac2fda6..6d8853d36d930aabb98fb57f49d6153ca6597561 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
@@ -291,7 +291,6 @@ pcc2: clock-controller@403f0000 {
 		smc1: clock-controller@40410000 {
 			compatible = "fsl,imx7ulp-smc1";
 			reg = <0x40410000 0x1000>;
-			#clock-cells = <1>;
 			clocks = <&scg1 IMX7ULP_CLK_CORE_DIV>,
 				 <&scg1 IMX7ULP_CLK_HSRUN_CORE_DIV>;
 			clock-names = "divcore", "hsrun_divcore";

-- 
2.34.1

