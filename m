Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011052.outbound.protection.outlook.com [52.101.70.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5326A346E74
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 19:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780343722; cv=fail; b=WSYs7dDmFPXbqigHLjgjsSBCTpaF+I3AxC2AWST6utp8KdXtkjPTNMblEXHOo9hrc2D9SU6rtfq9lpkpu2xerYenbg1RFDBysxrOb/9aXvWPAPmOto9+Llt6x29z4FirW39F8n3nFNfG5qFxFyvQOhLP5Sh7InfgaF+BxxLbtjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780343722; c=relaxed/simple;
	bh=wtT3P1d+Ac8EXIga2ybJwAmeQtLys9OgRR+RjmrXCwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=szk6Q1gMY4irGR9CEES1p7NdhVNXQzwmCoPvjAhcwu0xLF6Yd6YdWQQPOOcuEPJXTfFOq9zN6UU5UxKFRi/+LKbTALG0AtGR3btHIYAu6dqYhTMUb+lUDYS+HyTjn2DodmeSaoOO1J9+gW5B5CxxpidJ9UdRAv6DOoNe8wLknQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=muSW2j05; arc=fail smtp.client-ip=52.101.70.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="muSW2j05"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=umUrRdvlZrKN/SMBrmrfHsvFvLqwfUS/fJ+1+mgGzWfyOH5i/3a8zQVVDlHhswPFJE3vuZ2/5Jg5BAhzH2xhgCHc+Jsoxwgd49//b1nllbX6iAjHFAzCGIjDt/e4fT9FkY+wfxCqFXUz6jFwVoCnPXlmFMt0bHHdJGFec1ft/sCzU5f4e02iM35dygQf9zFfEgaiem+CvIHF3UCl3WmFHVsUBo9hsWGEf6PxozwiuSNM2IRmM8V/12CBPyeitoPC+XQDxag3iqxgJ6HNk61iL05gi0NA542EVHmbyZ3zl86TzlufVlytCFHxs+9WlshwL6AGGjGxISW410YTd3ljMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plxSKFYZvx1Xp+2MCHwerTLeBAwUtX1i5Q9CGvJoskA=;
 b=IwjejtYiPvkqPyob5enKUIhH0pXHqihQhw28NgKWpJMlvaG0+m+gYdRSWPQkLAS7mktpcq8hHZvL3wv9Wwasm0AFsF+31yJBmBBlvJQYVoF9uzZql0FULckDXqA/oR9CWE0Lov4f0TvrtbcYb13JMbq7v43I+2JVsQT3X6IEByeurlW0mOi3NswTJ1UIGEMeSkOm//IhaRrdTJL5TcLji11XqfU9jLWn7ZxS2MjlSe3qdg76MKLzLzQ5MOcJCX8FevKwWA79miEX60uJrNb23bHLAKscIE+jozTcAH4YXCpJNRT8qiv5N8oRbaJjBfW+DMZyYjfugIZFJuVcYcyeMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plxSKFYZvx1Xp+2MCHwerTLeBAwUtX1i5Q9CGvJoskA=;
 b=muSW2j05IaN0Yf8sMpZusvMpqctiys1/S6z56efpSX/2oTP/ZcIlIUpvqCYZMEOmXWZXk+va9cmWCwLZRSnQBPS0+LwPSV1701rTu8yJJtRWesQ9Fwn8t/LK2wmzgUv5NnyFbN90v3lh9G3f/6GuDKd1PvmyZ9STmmWVnGXMyCZj54s/XmMPNPM8XKfT7CEoNCG1QoXkbbpxA6nRrg39820fH210SbM9CTdIxGieAIZMZjfiDh6oDiuTVjY5G1ua59nOvQtZqQg+NFv5/WbA0Aak6DegHa3OKr5fTW8b6/U3w01yrR33xN1AmmYMR2h1NhwEH2uyKmEhw0tVm6MzuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8796.eurprd04.prod.outlook.com (2603:10a6:20b:40b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 1 Jun
 2026 19:55:14 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 19:55:14 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: tqma8mpql-mba8mpxl: configure sai clock in sound card as well
Date: Mon,  1 Jun 2026 15:55:06 -0400
Message-ID: <178034369688.425543.4889711119103789584.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522112247.1046944-1-alexander.stein@ew.tq-group.com>
References: <20260522112247.1046944-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR02CA0019.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8796:EE_
X-MS-Office365-Filtering-Correlation-Id: 003be6af-355c-4537-a3a2-08dec017b23c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|366016|11063799006|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	zBrJwLVvgJ+zhgMeOZHmHP1puaSUSTa6Zxbnrzc1+QmNMifGGxeCS9tBhrurJeLwMr1AJsd5fZKeGnxuxBDVF53FaI3vJ1qTaSaG+qY1D5tBkWHfLVsDGv9b4Zl6bmg5ymKjpBDO7sFXAvfjKqNNz4OzvYA9T2jG0x/m62pEXyNz2V5ITIXPZ3zIGL7gaqcJrLRsBOSVuqHDvSANqKK2xASwcoCZClPk3GrnSZGpcazp8AHM8roQQl7f6CQXBR6GYE9EP7d/x1liWT0AdUzloNGvvgrGq7yi/Skrsg/mK3hajrHKGhbMPqD+dmRoQK6rRDow1lSSGnzC4tR2X86Mapis5r9Kx4KKR4q4aLK14gT6a0ZP5or0z4v8ZpKpq5b4E5tGCQO3TDJcO9JHcIH2QL6Y2y7MeDYo487/Y/gdGSV2fihw9Xtt2/lBqGd9PqJLE3heyNDgJWhsSToq3/vWzQd3ej+OmVzmF2jzdU7SR7LvWNLFEg+VVyykOaHHUagN2RUG2/huAwBXoT3Oyfe62YIwTLDsduvYcr+AvILwgRKbLTcwKHhkc52Tf5+gJJWSDwuDJb+m9bKju0pPqQaBSnjwz6gU3w7YFeO1Z4i1ewtSDM0hjBzWS/9KJd6v3pf82D0IBDCfZd0POMvrGX8XnNNnt1XMh/cnL47/qLKEnRmfbQYRuHOUn3JQZW4+tgHV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(366016)(11063799006)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckpVNGtxR1gyYnpUQ2N4VGJ6MFZIQXRmZjV4amdPazBvaVIxOTVLbkRlYnd5?=
 =?utf-8?B?T2FaM0h4S3V4WFExcXJqZFk2RnR1bVFvby9PTzJWOEtWelZXUmIrRERpOHRV?=
 =?utf-8?B?QXFSMklzdHkxSjJQS1JCOU9Zdk1YWnM3aTVkTVlub3JBbzlWQytCZERBZXds?=
 =?utf-8?B?NitNWG1hV3FSSUoxYzJ1RTFTejhxVWIwbXo3b3dEdTNoc3hPMkszMVY2MHhw?=
 =?utf-8?B?eHpWcUtTVzVranE0a0ZCcEticVliOEYwQm5maVdrdXJhcjg0aC9DN2VwQUVi?=
 =?utf-8?B?Rktxa2l6RlFtZmhVRURZQTg3U3drSmRjQUd1eUdtbmJkYmR4eVRjOTIxeGcr?=
 =?utf-8?B?NjBxa3NUMzN2aXF2dS8zZ0hZN3Rsays0R1NRZk1sdlhldGhHWEkyemFmV2hh?=
 =?utf-8?B?anJkd0creURoVWh4cjAxRGMybXdkYXJLMjQzK3RKcWJ0L2ttd0dRWjJDVklV?=
 =?utf-8?B?TUFoZlVmUlVLRVUxcUFLUkg3VEpTQk1ZMzlLaWVPN1phOHQwdU9rbWh5Yk9x?=
 =?utf-8?B?aHJNY0xMOUYyYXhMMzZjZHc0Rk0rdHRxMEQvZU9RY2hGVkY1RE5xa092dGpv?=
 =?utf-8?B?TGRqZmpWd29OTWt2UkxzVG5tTVpGZnB0cGRiM245eEV2amVUMC94WTVaTjQw?=
 =?utf-8?B?eXlUdDJsNnRnQmN6ZGtlcnhWZjJzUm05OG9aWEdmUkk0VHZqN01lL2luS0F2?=
 =?utf-8?B?VEV0NGNZSEEvT291ZVF6a1E5OVdZNjl4OTNFRlRiSStSZDNkanZ1eDB0d0lE?=
 =?utf-8?B?TEJMVndEaExndzg3OWtWMWtsYldsNU5mTXlVenI3bnpiRDZ4RmdQcTJ3b2xT?=
 =?utf-8?B?Z0JVZ2M4QlpoQWN0cGt6SE5JWm1tN3YyMTlaRGN0YzRDamY1MUkzeWVIWDlX?=
 =?utf-8?B?bzhCbXNEa0UyRG5WZkR6a2o0UXUwb3VRWC96dXpNSnRpbFdiOHNyQVJOWldh?=
 =?utf-8?B?QU82U2t6RnpoVjMyTGorL1U2S3Q3RE82N0w2cXlIRHFtbHJWbE5JR1VzTTBk?=
 =?utf-8?B?VXN6RXB2bjlVYmszZm5WaXQ1Wlk4MkFaaFE0R0tGNlloM1lxTEs1OUhaaUJS?=
 =?utf-8?B?bmo3RTBORG1vMldycGM3MytWTk9ZZnRGVVN2YkNhdHhtMFF3cWRSbjJXSnln?=
 =?utf-8?B?TE5Vd2h2VU81UE8rWjJJd294UndERnNZcEcvRG1mTXRRSGxwSjBsbit2cDhU?=
 =?utf-8?B?a3Y4V3lTWUhJWGo2RFRJZnRMNXh3ZHV1SENCS2kvQ2xqaFpUQzkvdE4wS0Vw?=
 =?utf-8?B?ZDk3WkF6V1NPVFpNOHdUWmNia2hEbVZKMW52YkVHeWx3c29Rek5ZNnE0SnJq?=
 =?utf-8?B?c1NWZjdteGEzOEswZldocWZzWU5NdDVHb2tSWWlsR2RtcHBuM0E2VmRCd3Mz?=
 =?utf-8?B?a1BSclZycTNwRnpENDI5WlV1QXkzV05Ja2JWUWlZYkJFTGRqMG4yUXU1aWY0?=
 =?utf-8?B?Y25vU0pKREVEVjQ4cFFZSU1sZnlMOXdyMGlTc1hBVlZuQkIwK21uK3FBdSt5?=
 =?utf-8?B?VHJnbEwwbk81bmZaMmR2MFVHNWs2LzVOWmQrWjZ6T1Z3VjBOQUM0NzRmMnp0?=
 =?utf-8?B?WUZCVGZhZHB6c29rQmtoS2J4YjNaaVdLTWVVU3VDZU9IbzcxM2lUMU5hQUpU?=
 =?utf-8?B?N2RWbWNiM0V1UzV3SHQ0d2lVTmpXTGF1RlJ2Zzk5MHRYL0FRNDROaFdtRVV1?=
 =?utf-8?B?NHA1eXgvQVNEelNnaXlHS2N5RlJzcGFvV1d4QzNpajRkVnpRVk1jTGhDN21O?=
 =?utf-8?B?R0FYemNHdnMycjBtNEptTTFnV1haT1dJRjlPSWFMY1ZnQmZtVHp5Q0ZKb3dL?=
 =?utf-8?B?TE5URzlMcWs3cUl6SXYwOS9FZmc3WFJzckNBWUREYTEvZ2hPUm1QTHRQRUtR?=
 =?utf-8?B?NlRaS2tVL01Ha3NzUzYyR0ZsUUJsZjMvYXQ5TVJucjRkNmNJRjUrQnFkRE1R?=
 =?utf-8?B?NGpPd2RUSnVKcG9NVkw2b1l1UThoTEpPUk1JK2Rvajd0NEl6d2tlRkt2eVM2?=
 =?utf-8?B?RG5Sa2ZQNkx3K1ZuOXF4UVA1WTFIZlJjYnArOW45S0lWVTZDaFBLbTJtcU9s?=
 =?utf-8?B?cXZrcy91THJkbUFYWVZnZ1RJc2gxOENWbWNlNmMyK3pISnl2STZCRnBwdVp0?=
 =?utf-8?B?VllScVpva1ZoUkhnTzZUYkowY0h1RDFxcmVxdThOVnFaU0k0MlFVeWMxYzRj?=
 =?utf-8?B?WUxSaldGWnptS2hWQjRyWFJOczhSVWJSTmE1YzZWaXFXY1JYVDdNdkg5dGpp?=
 =?utf-8?B?emtzQTlIbmxRSUVQVFY4S0FpRkp4U3VaV3psV0hUU1VLOTVZRlVNVXFWcEF0?=
 =?utf-8?B?cm9YR3BOS1hlNXhtNFNxRUo0V3JRWnIzZjk2L3oreXloSEs1QmxQbE1xcDZO?=
 =?utf-8?Q?Ebetsoikv/mGC6ctqFAXmAXj69hLBb3FkBdEl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 003be6af-355c-4537-a3a2-08dec017b23c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 19:55:14.2472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DRiTE222XjqAKM+aATHl+ZUYKdELpZHO4pYZlBpRr+SxVnCmgvPOH5n/bMbnxdA0Uf9bAmwzDAlpGMZJ5S/9KoHeBsuJuwI9upc/ixrc8757vlu5qC4IrBudKD3p4f8g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8796

From: Frank Li <Frank.Li@nxp.com>


On Fri, 22 May 2026 13:22:46 +0200, Alexander Stein wrote:
> With deferrable card binding the sound card driver tries to
> get the mclk configuration before it is setup in sai3 node.
> Fix this by setting the mclk config for the sound card as well.

Applied, thanks!

[1/1] arm64: dts: tqma8mpql-mba8mpxl: configure sai clock in sound card as well
      commit: 9abd06007c314cfd065ac13b0f382d624befcf23

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
