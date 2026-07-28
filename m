Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011011.outbound.protection.outlook.com [40.107.130.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AA43FCB1C
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 20:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785272367; cv=fail; b=pU9LXSyzL+rRDR+btdXqCOefu0yDZNyu9JfkEK6mQbsdHym1srxIE0Yl2WGFbRTiBjuQUw/O8ydfh4QTVPdYccNEWocnDPL6TV9pPxsT9Vp9/OqMvLRrKNqBCtDDR15R2do6dt954B7tsBvs9jzINC1effq2zENxWfIWX7AU+aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785272367; c=relaxed/simple;
	bh=e8f7thwWEXX/FYb/yPpjL+tPXjeHWNahJFG+gVBJ7CI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KTbHdkWiIwVCWn59RRXPqcIfuBY9vblYu/Ykf9NpSvsOP0RtLcUE/VGxPFZHMr0Z1E7bV3hcFSLl35tcMG+xFXniRTGZeS69V3EM+fp3656R2gWhKmMKoQmEmIZjVeyPS73DbL6+YcCBk9dkcsrYz2wyDygeQVeUf0cXPR8gy3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=W4Qkilev; arc=fail smtp.client-ip=40.107.130.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="W4Qkilev"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkghfEnLdnXuuaXY6Vd77lsZ4ZQqQAQSR1lS9vCWC8cq/Tr1Yu746veSpPWTTJZRan3kpVhhcrn17aMx6Pmw5gLo6Xa8EvNDe7t1R7w2zmXx4cHHaS1jErJ6Jvuw1uu44GFuLuqE2NEAAYCRzRNs8nD6hRJrXGnUwexOJnbGw8tSfRloQKD3nAnsb/qeACZzgwzT86E/JFEdA/gEMj+a+cr32URHbfni2DdiIrR6Dc1k38HXZQW2DpErNTM/ZH545jgdApSmwEV1ogXsmzSaE6onzThBG1OB44rZt2Fq2/zwmE/lyltFoAYeNujXB9VmT/FOsROVmPS4RTPv4VNXDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3Rgt50jufQHkIdikfAfRmwdJsomeBgYWdnFDST1fkQ=;
 b=PSBISpGFyNGj7Tbn5nry0nvx81QGoBY2/h1sqfUKMUjuix/V6iXmmWcqzXhXMoFN8JTF6w8seGWJbgAB0TeS0Ojieov5tevUNJnbwaV1tUjUMeoWApXZb0N2zdI+YkjQsPNoM8S1ggrKKJZFQLrGsVa7um6Ez267KNwAwcTpvI9AlDMmraME6iqK3LKyAA3L/IxxsprKxYEtTTL1TtFrYCg58C9U+z6e4q3nIaf2BzdE9xc1QbYnmPLNsUl4A5hOWn2My1kp2y2E/CAFVhihls1jNHTb3fmqEGUtu6rXwM40EGR4TJ4DaCUQYClmJCQO/p1R+uihTTR4cVV9zBuFTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3Rgt50jufQHkIdikfAfRmwdJsomeBgYWdnFDST1fkQ=;
 b=W4QkilevZBHxbwVJO9LNDhSyeKe4GbJyUiVzMdzOqoyE7lqiTE9H/M20PMHZy6SFa94637EAfntZA/oRUxCD9+b68Y+scBlOVXWSaI/ttGCzby+zwV/dkh+c3vRgeH5GlPChLfH/Gm7n5pACktqx/QBIaCa2pQi2a4hLIBPtNBAOkBdX2XwVGYgkDnK4ARCGN41mhwaX+OYNoYwr08wEEQLlQ24n0Jog0/8if1jZNNP3bY7272HrOVPgLVigpVABl5kQZIT1vCnm5NnqSewMBlMLRs+wVRFUDOJDfbjBEEUtRfDu9NNjAqvdduUm5f+0abGNevS4bKL+7/9ez5dsZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10181.eurprd04.prod.outlook.com (2603:10a6:150:1b7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 20:59:21 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 20:59:21 +0000
From: Frank.Li@oss.nxp.com
To: linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@nabladev.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/7] arm64: dts: imx8mp: Add DT label to SPBA5 bus
Date: Tue, 28 Jul 2026 16:56:42 -0400
Message-ID: <178526691528.3668106.10748099183405791163.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727195244.78199-1-marex@nabladev.com>
References: <20260727195244.78199-1-marex@nabladev.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0114.namprd13.prod.outlook.com
 (2603:10b6:806:24::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10181:EE_
X-MS-Office365-Filtering-Correlation-Id: cce2fdc3-d8f4-49eb-6d90-08deeceb18e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|19092799006|7416014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qRNuMa3GbdNzRBidARJmeIXXL4juEiBzFwMavVzt4fgDl18XxQm7BeEiiNV9+5472q0SgvGf/VTgEPmzOZqact3vEzUqBTU7Fc3Djc9XE5uJJPSjwqnvD7jAYDonsVZdsRKa+VAoym63iCc5ncCzxnZ0DobHJT7PsOxziyERhEa1plY5As/9n0OR6+eUkYBsKI9JKacnhVihz8eCeZsK+HdWqW15Ijw/p1gWuWwnMu0bft8TRBjyGLIJatRejLsvK6jlDzpfjJbJCmDb2mqHdw8+tMH4pyhwVjxta7EzWwvur0f4XWNYHJc9izres327O42WSP8JRSDyCCAWGqRYZ3vOVfiRLGOBQnvIuECaJIOxjXrL/TCPE38Z0bdACr3S+bsXbdNSZcRBex7n2y6WgswZGnDEhQ3pDMVl8myugY/Qvpf/BCJ5HOLugLXn7lDzyAagHEx6tqXzaalB1LYuFgaRzcpP+dGcvU2eUWHQZ7qvlPTVdv+CLH3+j4g0U9OPkwwnqi7cXbcSNPHKo2JyQfWFXLvZPMbXSx879sCActsr/I7FYKFKdQBFEckNifIanoAnUH6XJIEPugh2Ktlz+HlGqBgj2Uklo0AMWdaV92mk7/WSuvW+HJj4tKB4CEViDIBdW30c7KGhHSP3q3s1A8KuM63yuEfc4A13x0+d4uo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(19092799006)(7416014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXdNT29OWlRKcjlvcmdkZ1pGaGhWR0JoM2xNQkdNd1YwSXpGc2hFYTdCVjE0?=
 =?utf-8?B?RHhHQ3IxazZacXVCTVhjT1hIdlkzSElDSEVDZjFhRUVCV2V0TVl6ZENOZ3Vi?=
 =?utf-8?B?S1d5eFAzaFFjeDRCa21ib2FvaVo3Y1h2NVV5b0hZbEw2Mml6QTVOVGZsaXJF?=
 =?utf-8?B?bU9nZ2xCLzI3THhSZ0lmZDZIWWNQL0c1eE5SRkcxOUhRTFdVaWRDbFJRUWdX?=
 =?utf-8?B?clBnMTEwVDRCK0VkS05VQlJwdVkzSHVMMFhGSmpoVWJtalgyYnVDQUVOdzhS?=
 =?utf-8?B?TkpuY1loMjhTV3dpMENGck9jWDNFd3hNOTBGM2VGRFBieVlHL3d4RFVJNm1h?=
 =?utf-8?B?Nk9LTHJseENXSnV3djBXWlIyS3Z4ZlZwbmJmdklwR2F2SWtoRzhEbUdLZnA1?=
 =?utf-8?B?dXNzaFczNG5HcVNMQlpkMUl1ZDlCRW9tb2tBdFJFa1Z3dTFISGhGTnJmNFc1?=
 =?utf-8?B?TlpYNHFLOFQ1Ukh3c1V6Y2pPejcvM0czWitES0N1NXdmbndtVklFQ3hnWUpG?=
 =?utf-8?B?aTZRSy9tN1dqQks0amQ5UnZOZE50TEorRUNET3BENlozU3hBV1Yyb2NVbmQ4?=
 =?utf-8?B?OGhFOWFLdFd6dUwyQ0llQXZCRGhqNUU4d0RxM1ljSkh1aURRN1lmT3JUbVN5?=
 =?utf-8?B?ZVBPaTJKRW1mMDBFNlBQcG5DREVpNWVXWlJPSDIrbXE2aktKOHJnaGllOVJM?=
 =?utf-8?B?T3VJR3JTNkRKcE9jUXpLRkdOY0UrUlE5MHE1T0lNZXBBeHNyMDUvVXd5ZGFr?=
 =?utf-8?B?ZnBSb0dZVGVVNDdsVFgrbVVDdTFrTisrLy9zb3ZrZk9WSzZheEIzbTJUNkt6?=
 =?utf-8?B?SWxRZnRLT0NXNGZHc3BFL1lxS2NDejA0QTdzeGs3Ri85VnBGaDVnL2hWSm1r?=
 =?utf-8?B?YlJTTnBjTFM0Wkp0SnN4RDdHTE9WTURkOHI1OWxaMWlZSTFwNVNRelR1SmZr?=
 =?utf-8?B?OHpSdENzUnN3YzJRQ1Z4N1NwVkhTeDh4cGI3ZDM1WDc4b00wMlJjbzM1N1h3?=
 =?utf-8?B?cVZpZC8yc3NjajVqY20yclpCcnNVeEZFZFhKaGdHL1F1UjJFTTgwSVZvMnRX?=
 =?utf-8?B?U1NxNzkrQU9lOHQrR1NOL0NsS09sVzRmMXhZZmNFYnk5NjA4Sy9Ic3ZVZ2lT?=
 =?utf-8?B?QkxhV3NpNG16S1FYY0dYSUFZclphQmFtUG9ySHNmb1FpV2RqU2xZQkViZFY1?=
 =?utf-8?B?VlFVZ0xvL1FHcDRNZEhRUk9sdnJJQnBybUdyVlNzeU9XVSs2T2gvdW9DWnRF?=
 =?utf-8?B?Y3dUVGdoQjJOcEw0Si9JemFjTEtlSm83STZmbytka0h2Z1FmVmp4bmlHREk4?=
 =?utf-8?B?MkdKWXhrTCtNSkxhYndSWnEzQ0JCQ3kxRUloUWVqNHk5T0QxOW05SE9lYjNO?=
 =?utf-8?B?Q3Z3ZSthOXlkQk9yR3k4SGhCMnpJaWxuSzh2bXZVWUpmZzdyb0VLMFdaZHVv?=
 =?utf-8?B?RUltSWRaem9LSnhnT2lPeXFCMUg2VCtIdVZLZ2tYSmVQc1BzZkszZTBWUDZn?=
 =?utf-8?B?UkZSRnlnL0Z5eVhWSksxYit4dnc5R1Q2aHJPYVo2V3lEU2ZYc0xYczRLWlBY?=
 =?utf-8?B?eFFkM3Q0TjJFcy9CVy9TZG1mQ3V0aUo5QjJWWWtIYjM4cE9XQ012V2xIdi9J?=
 =?utf-8?B?SmV1S2JXblRLT1YzYUJSV2w1OTU1b3c2THhNeXlodEsza2cySVI1MTlVb2U1?=
 =?utf-8?B?aVFTdnRCbXlzVFg3eVd5Y2JWNGtpNlFRTk5uam5VaGlGSitENzJIdXpVYzRx?=
 =?utf-8?B?MmppTmxZd1pOZ0dqSmozYi9PZ2xtSnMrUjdUajFqSnNkT25INGhTU2E4N011?=
 =?utf-8?B?NHFDWk1odDhPNFNvQW04dC81bE5UY00zSFNmTDRGZlpPeHpHNDg5S1NCNDJS?=
 =?utf-8?B?NWlLd2FPMndlUEdDTndsS2pGZzhsUkxwZlZ4U3JyU2xVZlRUbm94alZSK0wz?=
 =?utf-8?B?RktrT0syblU5bkVqejhzSDM5R0FsUkl1QmJFQzZBeHR1b0JNelhmb2lad2pu?=
 =?utf-8?B?VVhRNWR4Vm9OQlFubWtXSzdtMjN6SjNBcFZOV3p0Rjc5eHJGU1RlRXd1MkYr?=
 =?utf-8?B?TXo2SWtQNjVuQ2R2bzdqbElCWWhRa1g4dmR1UjdYaEhXMkw0djFhVDdVZEgw?=
 =?utf-8?B?RzhWcFE1amo0Tk1GTXZKOHlVOGQxNjBsbGJiQ09mR1lnZldCcmI0eHJYYlNG?=
 =?utf-8?B?eTR3bHF1RkhXVkt1aFA3UnN1Zkt6YVdiVmd2b3pRVURwM25DRHJIZWk0Zmpw?=
 =?utf-8?B?ZHlnLzBCTTlTZUREeGdwWGVLVjJTTmFORlNuM1E5OFNKWjEyK2VETEpDbTZC?=
 =?utf-8?B?b0RPdmNwc1B1MGZiVjFEV3I5K2hVRVJrOFpNNDRKSmw3ZHVWNk1sTktDWkt1?=
 =?utf-8?Q?PvjdeHTPAGStvXWj1hl2UUaotA0dP2TU+ehM2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cce2fdc3-d8f4-49eb-6d90-08deeceb18e7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 20:59:21.4278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h/P/fW14MyITyrjSxIzqDlKbOuj9RLXaW3MpXJZhfQda9b0eACvVhXzSrRefCB5mHKreU9ainXYGev5MkTEM0ufTmL00d8NjdCH089Lc6sLiM5tiRe2aHZYMNHWUsWzK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10181

From: Frank Li <Frank.Li@nxp.com>


On Mon, 27 Jul 2026 21:52:16 +0200, Marek Vasut wrote:
> Add DT label to SPBA5 bus for usage in board DTs.
> No functional change.

Applied, thanks!

[1/7] arm64: dts: imx8mp: Add DT label to SPBA5 bus
      commit: 697f6889aa50996de067a8d170323535570052ad
[2/7] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
      commit: 3eacea24d258ff5169d84a419b07cb5828e91718
[3/7] arm64: dts: imx8mm: imx8mp: Add legacy board DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
      commit: 81a2094bb922290e4b52a1467037f8d2ac07ad87
[4/7] arm64: dts: imx8mm: imx8mp: Add HDMI DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
      commit: cfdee13eba802665ecd8751fefa754a759f414c4
[5/7] arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
      commit: b26192de5d0f4635d73ad2aea43e3e83a9ef5f77
[6/7] arm64: dts: imx8mm: imx8mp: Add FIO1 DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
      commit: dca8d10e97bd121494106f54f4577291a9bb0f13
[7/7] arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
      commit: 8ea2fa3fdc65f2750718aebdcf912cccde5913b8

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
