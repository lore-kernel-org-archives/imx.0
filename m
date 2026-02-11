Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011045.outbound.protection.outlook.com [52.101.70.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684A3357724
	for <imx@lists.linux.dev>; Wed, 11 Feb 2026 23:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770851601; cv=fail; b=oqr7LxqCqC14zI2NkLQw2hfpe1ybWM/F4h5Pz+WToKqv4Ypsg4ZHoe5bjzj81rijKDmT63j/KPH2NLyoaOUOrgtIV40lpCzhHOKNW+USi5qVlmn9pUd2IWfVIDJ9Sz4sY/jKZ4gttG7O3DZ4gEmoSWlj0W/vJ4jYr0ZasSG396s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770851601; c=relaxed/simple;
	bh=vL3/zzOo2iThcyj0rDBaI92a6i4BjJzvMzvpy+thAYs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=g6ukFFzfanmbwF3vSrZEdVQMtq/QkzvT62qQgvI5o/4OpcXcBaQjcvSiyNIhd2gHuc1QGycygSvMXYO28VwXZRkeBqqhPG1defBCpHVT78iktfE/ba6M8rGgLp/8/gtKhoD9ZYIrVOTMlgzVhzQp7XbFJ6cZHwftSyQnluF/EiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OIDyblmO; arc=fail smtp.client-ip=52.101.70.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OIDyblmO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=an0Rog2wx49ozbbE2Il4bjqcFl8aDBbOtUC+ZXbHCG/viv4ivVFfieEB8Nvbd1aMyDm7yNbMSXY4/bcYIQZTLTAdlVqCR43WoxzNKQL+wW0WVJd9/N0InHgJfBQuOKHMVdi4dMpiKzBZAiUX2STCQI4LxL6ppaUiDXLiYkfV2ZxNp40loQZ26bCPDv/5VVHkE6SsVFB2ZCLfdIWSjQb2NxYHAic69leiEI4y9aUMWNLP9q8g1m1UAF90wsF23ja8NYUwuCkTbfLR+A/eFSP9u8RXnWPq/psS2oEoYKYtXvuBBI3Br6kdt8akp43UD0cmV/Cf3QJVZIsSvCdMAiPQng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKXAQzE+9Jwb3i9TWm74SSyoqrfVgXnENNqr+lbMCeQ=;
 b=ICkBfayNX9VJcjZoOH8pdv5sEuRxT80SY/ok+p57l7QH5SCqRCOOgfI/I1/fX3Wpvm5TUES2AhLhZmWQtxasAzvwDXKk9eENI4gl7Nq+ac50WwPqG5/mqm9R5wYglB9bV43BCdUYFE/T4oMVtufmFNUZl+M9uYjn0y5fstX5goCM4Joph7CObEZJ6n46LLNqwMj9kadZ3osTZ+6EgwRtQbw1kTKflZNKyxf0QWxdMKdfxxPsQc37ScSnVQ3lZ6NgDBxKciSi25yOuuVbFtcfKHhwyuIk9Vnj+i50kWTSpCKQ358j2G92GjdFPl6libLHG4Bf5Je7uwfzWHqygKaP/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKXAQzE+9Jwb3i9TWm74SSyoqrfVgXnENNqr+lbMCeQ=;
 b=OIDyblmO0VA9rQw9cW26875YxHyr8FmsCsALGiFwHFoOc3wtMuv4irpzWgT1pfu+FfYQamHe/dhv142wFH42af6ENfw0olPvtSZi/to4STVx0yJANpXgbu2dgwOQbi34CaDryld2g1o59Y2Zd1M+cy+621AK2Sk3COWBlFeg8d4fSKoMrn5Galfysc0ku6wa3heYXg1QdFboxcGd+P03XO/Ao28+qxmAVvIn15lslLYbQIelAYUkW327sAvddv9Qa+S2DJR9PrUx8JWZTX+mTra/yvY41k58wDNtwwoZcllrx3W4mxHnYV23UqJ0e3HQJtjibmBIs/HbZ4ZLes5BRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8558.eurprd04.prod.outlook.com (2603:10a6:102:215::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Wed, 11 Feb
 2026 23:13:16 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 11 Feb 2026
 23:13:16 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 11 Feb 2026 18:12:56 -0500
Subject: [PATCH 2/3] ARM: dts: imx27-eukrea-cpuimx27: rename uart8250 to
 serial
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-imx25_dts_simple_warning-v1-2-7b40e1acca27@nxp.com>
References: <20260211-imx25_dts_simple_warning-v1-0-7b40e1acca27@nxp.com>
In-Reply-To: <20260211-imx25_dts_simple_warning-v1-0-7b40e1acca27@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Alexander Shiyan <shc_work@mail.ru>, 
 Shawn Guo <shawn.guo@freescale.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770851586; l=1644;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=vL3/zzOo2iThcyj0rDBaI92a6i4BjJzvMzvpy+thAYs=;
 b=m+nNIqJpyjy/daae0J0eFho5VfVLKLS2UnwCdxOyufiBfKds9t+IUIfWWfIJzv1TbMlHbcjly
 5pr4Nx01n3lCqDm5bhjAeRbEK8GP64eczhRua9W0YiEhN/ee69tn4NB
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8558:EE_
X-MS-Office365-Filtering-Correlation-Id: 48723af3-418f-41ef-3e79-08de69c32351
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UU02bmZTaTlGZGY2ZFZ4Q3cwQXhHRXcrZVR4Sk9ZVEJlUzg0Rkt5UkYxQmJH?=
 =?utf-8?B?RGNtdDNNOU9zQVdiUWhuSTVsOGNLTGV2ZTRlcTFjdUFpR0tzdnN4dmttSEZG?=
 =?utf-8?B?V0xOUHlUdkNnL0l5cy9uZVNBOGhHZ2dsK0lxNVp5TXFVTlIzQVBxNCtYaTI2?=
 =?utf-8?B?em5tT05xV0oyc0ljWGgwUzUrRnI5amROK0VzbGt4RGhmd2wvcVRyRlUyc3Rt?=
 =?utf-8?B?TVh1OWxmNmU4dVVIaGZtL3J0NnNyVllWYlR1Yi9jdlBUOFB3SkFRbmFWM2p4?=
 =?utf-8?B?a2w3a0F1djZrUTZ3QlFDNE9MSlJ5bjhUK09jN2FZanIyb3JSVVZSMEl4dU8v?=
 =?utf-8?B?OG5GK2gvYUFTZ2I2cmZkOTdWUG5JNHVhM0xIVXVwN0xLbDhYWTNDSHlqaHNp?=
 =?utf-8?B?MlI0bnIzaTFGU3lmQ05iR0NhYTZ0UFl1b213cTdGLzR1Q1RPaXF6T2czNmty?=
 =?utf-8?B?OXE5aXh6WWp4U3FyeC9DQVYvWHFmQTJuVTQ3aXhBVk93VW5rMlltZEhoKzht?=
 =?utf-8?B?RzN6bDhNVkdIVXYzWXRlcGlraUdaK3pMWWV6V1ZGMkhCMUVSN3IrS1NRU1ph?=
 =?utf-8?B?S3NaaExTT1ZGazFFeDMvRDJZUWNHK2RDUzJ2bGEzdlV3S0JyWkFrU3dNd0Ev?=
 =?utf-8?B?UEp3MlpvMkJUcWpaVldRbDQxaHZ5aEZscEx1dmNSREtISzZYcXAvaG1icWFs?=
 =?utf-8?B?cWF3Q3hHUTZJZnVoR3NkQlpCemdGTWk5amhhaEQ4NEhHTk42MlEvNFBnT1o0?=
 =?utf-8?B?cHA5Sk4xc29xRDFQdEI3OU10WTlGVXVzWUlWMGFmdG50dU9zZEtvSDNNM2dj?=
 =?utf-8?B?dFJMN082SUZVYy80STlGc2xBK3BiZm0rejFVUlZ5OU5odXNIaktkSTVJd25z?=
 =?utf-8?B?U3M2Vkd1a0dIOVV4YUV3ZmhydkszblpmTmg2WGxmQW1YVGJBVnhWdS9zTGFP?=
 =?utf-8?B?SjhyRjJmQmpJV2FMVXlCN2xML2dzMjFEYkRjenovUjVwV0YxY1FDeE1EQmJ6?=
 =?utf-8?B?dkRWOVVhUVpSa3dkREl3SVQyZ2xGZ3NDVWhmRmlXMXhNYlVFOEljRmpJeC9q?=
 =?utf-8?B?S1FlL2pPbitTRGZrY1NYQzFNN0p2em5PNkRtQ202b1RSU3krdGQvNThRd0gx?=
 =?utf-8?B?VFBRemhjMm5QV0EvV3ZoSnFsMm9yVkVXUkFXRTR0Tm5LZEFSZGlaZnl0Tmtz?=
 =?utf-8?B?M0wyZGdveVY4L0NHdlV1Sm4yUUtTZ0dGbGdWVWZ1Y1FwYTQrbDB5T05RMzF3?=
 =?utf-8?B?eGlpdlVtZU5oODBzM3JSdzI4OUlhR016ZGY2V1d0akNSVjNZZXFVSWZqY3Vw?=
 =?utf-8?B?ajN4bHVtVVlWWXFPcU1QejNKZFVCTHBYVEdod3VpdTRYZnpLTzRmUHlROVp5?=
 =?utf-8?B?bVpZUDVNZXpqQUJNM2xkOTRoeHhmbUxJcjBvOXdDbk4yTk5ZdWxrcDh2U3FT?=
 =?utf-8?B?akRZam11NGFldG1sa3RUOWNSbVg2dGI2RkNMQS9Rand0bXJLeS90MzhEekZR?=
 =?utf-8?B?ZDcxTWM5bGJIdmxXT3ZNQzFWbVNUUytpK0Mzc2pncVZBTDdES09PakVQbE9G?=
 =?utf-8?B?Z1NoVGFWeS9JanVYSUhSQittbWVjSHo4NE1SckdzYk1pNGhMd1ZHOVFCOVpo?=
 =?utf-8?B?NjludmsxR2QvLzFVQ2t3bU42UHhEd0czdm8rVllKL3RZQ0VoUnNuZVpwNFNG?=
 =?utf-8?B?bFZGak1rcVJDdGVCSkFMS0pCbWpBYlV1Sk8yRGIzcE5QTlRyWDBUNDRGUWZu?=
 =?utf-8?B?TkJxS1ZaQTlmZTZTTnI4dC94SDhsTHVFVnJlT1p5OHR6bE9Gd3YxOUVRbk1m?=
 =?utf-8?B?a0R1bG5kMmh5UEZrWVpsZXNZaWJoRDFMWVBOdmlPTVNvOTI3L0hpZGpKMW9F?=
 =?utf-8?B?QkVtK3kydFhvSkU1ZFpqOGQ0NXJabmkzTzdReFJJdEhRb0svS1dmQzJ0RXlP?=
 =?utf-8?B?cVZzRFVyd1AxcGNtdmQrQmdzY09RZ1FBbDlibGFyZzJwenNZUkg2TnhDZnB4?=
 =?utf-8?B?SHRiN1MwT0xXa2kreDVROVBaWWZlZzQ2ai9JZ1ZuOStoUklzdmVkVTVzUXNY?=
 =?utf-8?B?dmo4UWM2aTRNelFNWVEvc2FnYTlYSmxJbXhUODlqSE55M3N0VS9LaUNwU1VT?=
 =?utf-8?B?aTJxeGJJSzVzdHZzWTBnUnRTTFZJWFBjcVFZSXFHRUVuaUxtQjVIWENhdUtG?=
 =?utf-8?Q?7NWE4+H4ocQ/yh0UryLIj/k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TExCRFFRYnpjNHNKSkwyWlEzM0ZTamE3c3Z2dzVCL09DMExLYlJibWVLcFA0?=
 =?utf-8?B?VU42VmxSaXVJWE9PS3pNajB5TE81NGVKUmVNSWdXeEg5UUUxNG43bEZEMEFY?=
 =?utf-8?B?YTF2OE1FT25YbDZ2SkIwd1JyYVZVdmdUVkUwejR6cnpoVTIvWVNteUNPTTdE?=
 =?utf-8?B?U0VvN09HSjAxT1RiOGZiNjVpdDg5cXFLTjlYZzZkWng5K3Q4RWlhczhxbEZI?=
 =?utf-8?B?T29xYXRielF6dlcxYkp6YkFCOGdzNjNpOWwzSVRMMHREa1VqM2hWMXltZVl2?=
 =?utf-8?B?OHE3ald4bG1DeWxXbDduL3puRjhFSjBBYVR6d016TDltZHIwQWZ6L3o3d2N0?=
 =?utf-8?B?Y1EvL3gxZkpSMi8vMmlsLzBIWUZSRjIwVWNDc09sdktORmVPUHBsSUhERXUz?=
 =?utf-8?B?cVhSU3cwRm9GNzIrNi9NdE5ZN0xsZlJXREdmeThFY21HRW1yTFVXbjdCUjlC?=
 =?utf-8?B?Z2c2WVV1TGpLRVNGMGdIcTFwUkVNa1NMMW9TNHkxRi8xM1RFRUpxWjV6RTdC?=
 =?utf-8?B?eG9PT3NtcnBXVEQ2bUxicVBxdEFzTSt2ZDk2ak5LQnlBT051cDM5cEpjSTFQ?=
 =?utf-8?B?YkIxcVhLcHY3TW4wTzE3MGJFbmpMS0VTU3BjUHJYa0orV202NXQ2U21za3JW?=
 =?utf-8?B?NVZyUCtGR25BWmpjQXh1QTBpdk9nRUxiR1F3Zk9TK0czVU9WZ1FXc1crMlR6?=
 =?utf-8?B?N0h4cjRVZ2ZVOU11M01iRlltak9seUFBQmxXK09jWGF4akZJS2xvRXAycE0y?=
 =?utf-8?B?OXlYNlZocFp2Z0FOMjVwQi9nMXhHcFRNaXoxdjcyTFozY1I5Q2VwRU1ZL2tH?=
 =?utf-8?B?TjAvczEva1plcXpwNXQyMGx0ZUdSRU9lVEZpaS9CODdEWCttTlhxaFl3VzFH?=
 =?utf-8?B?WFB1K2ZZYXYvaGhiN21sRklmb0xjVGJPclZQRkl0T1ZidmZ6SDI4KytxQzB0?=
 =?utf-8?B?N3Z1eXZwUHlhUURBMEQ4bW9WQ29oQ0NBNUxHNmFYcjhSVFoyc0xVZmpQS1A2?=
 =?utf-8?B?NU5XT09LRmlRK0NNV0QybnFoVHdVQXYxNHN0YmlLaTVmTFo0aGh6NkZWOGdW?=
 =?utf-8?B?UUEyd2FkcSsySDVZdThGclgzdjhiajBXZVZnWVdnWmQ1cFUrWmZLeUJFWVRQ?=
 =?utf-8?B?dGRMZmtRUHh1RHBRREJtMEx2WHd6ZGVaN2tIdTBtN1VvUkZTcnZUbFpnVXJC?=
 =?utf-8?B?NUNoQjR2ZENCd0xucVhpbk9RVkIvL2p1NXRnbk1zWFY2anl1YUVTc3hQVTNJ?=
 =?utf-8?B?QktsaVk4ZDlXNDRCNy9rVCttWUlRR1lPMVc0K1pKd2pGQ2lvbXhUZ3Y5NGNk?=
 =?utf-8?B?U3J0UDJZTkcySVprK0N4TVY2Yy9GYmF2aGl3TzRKQ3B5Myt2UHpwMjhhd1dI?=
 =?utf-8?B?MDBCVmpYQmVWVlVTazlRREZ1TDJ5c2RhUWExWklpUFlZR3VjcFhITkNuR3Bu?=
 =?utf-8?B?Uy9PZjE3a251VTZrMlRqaWM0aFk2UTFhVFVUQWsvdUtxZVU2WldIcnhFdUtQ?=
 =?utf-8?B?OG1TWVJJaE1NSnFRY0dqKzMyQzBxNmxiN1BWRFd1T3FqRnRIejdXLzlkWWlG?=
 =?utf-8?B?ZWZ1SFNCZDBLQ1RSWnFhYnFsaDdmandVd28vT05VS0lETUpxeFkvc0JHYWdV?=
 =?utf-8?B?OHFBMnBxSGFNU2l6MWRRakpsRW9oekZKaXNUcHgwUjcwbEphZVhhYUlrbWdP?=
 =?utf-8?B?UENleEZZSVY1dFpjdm4yQjNSRGVJQzY4SktCY0FKbFduL3hsNWNkQ2VwTzhZ?=
 =?utf-8?B?M3JFbUI1R21zQ1FJQTQ4ZzFkUW1IWjFpbDFha1RKZEFtRndVOXVRMzFNdm1s?=
 =?utf-8?B?dC83dDBZc2MvSmtOaGMrWW5rNVd4UWh4SnYva3ovUHplalFUNjZLQy9ZWWVZ?=
 =?utf-8?B?QnNQeHlxZUJVRFJvWGdzU1hGaXJEaFVtVTdySTFOUThTSTYyRnFzblpZNTh6?=
 =?utf-8?B?SlNaR2pMYk44MWwrb0xVM2dRUGE1ckZSSGtqd0RxblNhcS9rTCt0NkF1KzM3?=
 =?utf-8?B?R05ZYVhhMkw1SGxTYkFDQ2I1YytQNm9wZCtsWTJtam9sTmhUWEtjZDJtQWZX?=
 =?utf-8?B?Rm9UcVovYkFiOGRrdVJoMldacGkzRnpTMkdadm11Nk53K1pIOFhDSDMxb250?=
 =?utf-8?B?TUp4UHZlaFcrQ1MvYUpZbFBrZUF6dzlsVUxHVHJwRHlDc0NuMG0wN2JjN3ZS?=
 =?utf-8?B?Sk1sb1BLQU5VeWtlWk4yTDRHMWFicHFPRVJEeHBvM25UeU1kc1MrcyswL3dT?=
 =?utf-8?B?QVRyTCtCejA1Um9EQWxMd2hXYmN5anlubUJUVVJ1bS8zVUFubXA2bWFQOWIx?=
 =?utf-8?Q?s1o5CIrVzVjj4w7fCq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48723af3-418f-41ef-3e79-08de69c32351
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 23:13:16.6605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m6AJnyDaehDK81VxMf3A8Itrm8g8wcGmqrdOxWsX8xGy2VdaFtGMvcHs9R8/YQ8wejyRjrJ2at+16AmLtGu7fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8558

Rename node name uart8250 to serial to fix below CHECK_DTBS warnings:
arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: uart8250@3,200000 (ns8250): $nodename:0: 'uart8250@3,200000' does not match '^serial(@.*)?$'

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi b/arch/arm/boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi
index 87dd80fc7061eeef88eeb353edb042b9a631a356..b56652664b5e7fa8e9818020f48ff0c7a7658c03 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi
@@ -104,7 +104,7 @@ nor: flash@0,0 {
 		fsl,weim-cs-timing = <0x00008f03 0xa0330d01 0x002208c0>;
 	};
 
-	uart8250@3,200000 {
+	serial@3,200000 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_uart8250_1>;
 		compatible = "ns8250";
@@ -117,7 +117,7 @@ uart8250@3,200000 {
 		no-loopback-test;
 	};
 
-	uart8250@3,400000 {
+	serial@3,400000 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_uart8250_2>;
 		compatible = "ns8250";
@@ -130,7 +130,7 @@ uart8250@3,400000 {
 		no-loopback-test;
 	};
 
-	uart8250@3,800000 {
+	serial@3,800000 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_uart8250_3>;
 		compatible = "ns8250";
@@ -143,7 +143,7 @@ uart8250@3,800000 {
 		no-loopback-test;
 	};
 
-	uart8250@3,1000000 {
+	serial@3,1000000 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_uart8250_4>;
 		compatible = "ns8250";

-- 
2.43.0

