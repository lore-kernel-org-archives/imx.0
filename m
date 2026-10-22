Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792700289;
	b=3XwkDv/06Ks0IEKCjhn68B5ToKYtRcb8zerkXkJm3mIG8ZsVcg3Rybgoe48U+pPMmH+N
	 6W0HLk76lyLctHiXd95GBU0/Z9jTORsmPd/s14HXMNelUgrEhL9x7CpLx2DIQ/aPyB42k
	 3g5dHSxDaSlZkf+LWxfwA3PJCop/OCLifJcR5uFtivEFhnGduFXF3V62tuEZtDFseD4Rl
	 dLNkSP0xSbP0dr8xv7I3qRwF9pNwgO0N1iMFgy32h7/SsQ+fhD2z9eyLOLu9heRHjCv14
	 efwGb5YMBKQY+EM9SkzvOSi+k5hw+K1npX0xZXOhpNJbupFc9LDnUnsAI5Qux751HWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700289;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=9y+0yH20fXsZEr4BMeICVj7/odOOL1XyPGVAwQHZ3nI=;
	b=CW81Y7oKT6X5YsAk3rVIOmoE1AoxbY5Fd9iZPpgguUtfaGNa/u6txxESqv6YoconADTB
	 RQFRRrgVxVu/vqxFTeQbmyKRweaA8SoHahsPXffJu9V1isKhrxrurGZ8/qShJol9gFlu5
	 RvdglUEQVKQeQPa85lytXyhAwyj6ch5IT48XaTFR7m0lvUNm/v9mzdHxyO10kSSV2e89Y
	 OnPi3Ps61tfrKO4/AFnBNsXHGP1kt22aHw/k7uCHKvuuHO/T2pHqh73PzvdQYpIsWeXao
	 io3VJGL6sl7ANqHPofFMJCd1zlj9zsS2pH2F0dZc5G42XLTw4GILWKzTsOLZhvc1tvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=uOL14QF0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.7
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013007.outbound.protection.outlook.com [52.101.72.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1347606A31E
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 20:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1347606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=uOL14QF0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H2k0gBCKfh/N9/qN0AJc23Y2vdD/F83dBm0TkJlQ8Vj3Fd9Vowvlpydbz1S5gtoZQwA808HlL7RdRht1glCpA+u00e2pK5NkmUn9RZGZ1/A4/C6ME851wVPJmvI0pN11ONJsX7dAj3pYYnIGuFlYZt3FmkY94zC9d005IRQc9OWjdDF5xclEP1CZz27ONZYICxXZpurIrieEXe0S/3FTg4XZbEteUA3x+4tc/FQoQ2V84q0+nSxYRrhpn0EYGfimDvoq7AG1eC7ifi7KfXSvszH9OvupcLG+9nwwbSYHVnwF/VvzHDzwI87ohVJ/xVj9td2lOQKIgPjgy79L+dzryg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9y+0yH20fXsZEr4BMeICVj7/odOOL1XyPGVAwQHZ3nI=;
 b=MDzy3Xb0r+WC0BSr1U/YyB3+5ZbIYbA3N4NbY+rWrGYfniyh1ZS6lQt9cZtVRl/crGyn/oYGHeMxSMb5HsJ+ZoEEZ9Is8xss/MCe01/lI46RbB4gD8D8FUDH/S5eTcUmUUg11hzg6dUzmbStRIM4+fYg6SRhoImmQLsRy3Rtmq2LrEJaj/ca3EB5DD/Gs+3OjvH5iBCMSZ0XziL1AqBRPROngqZuXhNpaI3XeX4Uz5TAzBkTN2e4HGWgCxGd63dnkouKhsjul9X+poWySZYUU5EnBsvUCP8NuQin1nzglOOQeDtLAOKR4rE7IYcCzo8rOzu3xjbyyJpu8yx3XtSRFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9y+0yH20fXsZEr4BMeICVj7/odOOL1XyPGVAwQHZ3nI=;
 b=uOL14QF0wvpGx1J7pq3J3GSZ3ycdw1dwr2KAs3ThqHpIeFcEXzBWQg6DumHnlAtNpkdlfMh9+XY5AaQSUHWNXFoOpX63LTOUvlGYLYlWEX24pOCUqhWFhbuGVpBpzafP27MP7OT0/+DU+U2Ne7zXmFCSLaqFgnl8DnoYj38e2AExGyrVvfbJNU2Ay5shE2e81/K9OD9Vqz3FJ4FC1SC+Fqr2KHylLe9WAlCOmLClZEV0QmRNKXKTtsw7svdEbatEI30V38d+FWWWtk6o8CCPHF8+FBkb1bmq2qbQ8FMDunebM5gnatD5YxwaVxOwslzlvMl7zs7aqmRuESL3jZj9iQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU4PR04MB12151.eurprd04.prod.outlook.com (2603:10a6:10:640::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 20:18:06 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 20:18:06 +0000
Date: Thu, 22 Oct 2026 16:17:57 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	Manuel Traut <manuel.traut@mt.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/5] ARM: dts: imx6ull-tarragon-common: Fix Ethernet
 regression
Message-ID: <atpvdWuwnYeQ03Rm@lizhi-Precision-Tower-5810>
References: <20261004140123.46461-1-wahrenst@gmx.net>
 <20261004140123.46461-2-wahrenst@gmx.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004140123.46461-2-wahrenst@gmx.net>
X-ClientProxiedBy: PH7P222CA0030.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::13) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU4PR04MB12151:EE_
X-MS-Office365-Filtering-Correlation-Id: 727577c2-ef41-4c10-8f33-08df30799501
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|19092799006|1800799024|366016|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	gRGIDNy4FjZuNBfDKdDm2Rf5T8akK6EwPpyRrIU9dmFv2CGBohq1VJqLJRf9OUjMgOE7BwXv/99FSf24HRE5ol25QMK+oTX7qTI6JAsxSKeBxW0IZIYjst/LsoiGKslrdSFGpx1ALHIR+FB2qRH2mMKvC8YB9tKn0pT5+W3xZfYAM6Z0j6B+yKnQDeXrNpLorGCZQq6UHp+K+e2QlFqxkh8VrZ67Rm8wgbqQiPx6krQowJZBu2IxtSggpsiPH+IyRjrmXaff034iX1ID3wfc+Q0yqIKwl0UYaBws1/UC1KTWVUwcDRLMIqJetpENapHlPEtq1nz+ahKPlxIaPKZ7TRA4NIK5p2L1yYD5RrAI1cgxQ8L8zrT8Y/pZHY9K8AYWVMHQt3KiULEMnNF1HVQLTNWNRd5aMQKsTuxZ/YLC2S0sITKVwtpzNtxr4QHngAL0Cx5ZmyWb+LZGnyvlv2LcFRkVyfu57MjnelvTB/Bb7NALalYVIbT0k8VWWBUjdMVPLoaIYUDKzJeMqcsHqhLSyyhsjuxWUfRo1oBG3wbpLHBOvWDBnppBNNwKBlVR+kJaAyssMd7BvSapGEqiIX8fICegn4dKgRorx+4X0FtGZAjdchoDMTklyEuPiUOHpRSls4SCwb9ICnx+htd+mWqp6jYSerKmHTtIn9l9u3DuB/o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(19092799006)(1800799024)(366016)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?48gyE5cAbTEFmo4CTm9W20xRuS3rayroRBIP0RFRojP6Ddd34T3wulvBt28W?=
 =?us-ascii?Q?ZgJIITwYI433WvL+BkG4OW+BCSHWp2BqUFIWzeu+7kpNTsXitFe+j8vw6G5R?=
 =?us-ascii?Q?5f0C9lg7AIdDrOv40T4NyEsRSS5qUipT2nC07Ax17O7Hq+DZWiSU0lCGcESJ?=
 =?us-ascii?Q?4HCKsQwHj31s0E/EUnnB0SSLS0EgVwx3WaGVnUehBums2DHBfIIdIzdPHKa7?=
 =?us-ascii?Q?F890MPVGE17yzE/MJ/jdftzP9GNQgUeJsC5zRuc83Jja5y/iaS1qqgX2zGHW?=
 =?us-ascii?Q?cmjC9qjhdOejS2T0nN7PBMGJcPA7cqre5q2jaJHb6m6N780bGMrFEz5AGIB9?=
 =?us-ascii?Q?RWHsgQX8Zymy0YjPjgoyoJVn65DJgEilF7V5e3E6MJvulufHFJB8N7juMWA4?=
 =?us-ascii?Q?BZg2QajwXGP4BgHm/2px4siu9+kDxOPpzckXjVUrL/y/iXKKslEI2V32F3NW?=
 =?us-ascii?Q?edJXBsifDz9ZZ3q1DZrvE0VcEjY3NslBn6WhtRmNTPElXRBFZSZwjE9ey/o+?=
 =?us-ascii?Q?pxsw71wKDrS7y2aTscsSonjXU1rbNYI8yuI/732Nh+BCPdOwMGr0wK30OYEQ?=
 =?us-ascii?Q?92Kn0ie46nzz6lg+rwoUbOlEufX1GZNTWwQd+24PA9LCjHhlxcSFszRm3V74?=
 =?us-ascii?Q?7DO8eiMjGYYjQdstuJC6epOugj4d5vTOWfWGyd6JiDQndBildR6DqakJ7c1+?=
 =?us-ascii?Q?1VTrR6EqWT0FYDkedNzJeLn5SjIPzLJBYqyutXol6AjZjGbo7+u3hJqveow5?=
 =?us-ascii?Q?QX1toLABOMy3hYbcA0S4oTpXLt3VbVx1HyFwilIpBBDCuIsEzEWxuWda+XYA?=
 =?us-ascii?Q?DfwW/QFHua8n/nbexuvAwq6Ufi2w1icyw2fFqOWTUahToSdrt4lgkwiREWwQ?=
 =?us-ascii?Q?yVfNVo5E9hR8U/BQw9egfiRFq69mdTx7xQc/LLmJBqomWI/r5eBbQMcpMOIM?=
 =?us-ascii?Q?Q3mHn2S3GeNideoesm8pR0CJR/iTyP0eS+tHomWPWb+eIFOH3cfklMtvyqtL?=
 =?us-ascii?Q?JlGv6gN/jt+AjhOlnRCblAwvJkbF6XdpRF3zkrf9HoQvoRUUfkAQludfLPVj?=
 =?us-ascii?Q?DyJU9jby5vU8w4RzFJbgSrdi60uEcfdcsWMcIdBo8zdsdV472zGS5oLJZa3C?=
 =?us-ascii?Q?FcHm9MXvPvpoHSGNsjSWCwQl2mK6hXIe0ZLnc/ZwOaj+0Pbi/Q+SaE/UkTyJ?=
 =?us-ascii?Q?cIKwZeCVjNzsOtIXc4JbLOsztPbNtCxzklmeoyXAt7B+rVzWT7lZwenSvkC5?=
 =?us-ascii?Q?QMbk2nlbc1Z4Wy9kxBVKP7HLTWqwbgxEWfYE4Yf5rllonwUZlpZqDBKYdoHa?=
 =?us-ascii?Q?Q0IG0M9K5ALjdFoB/HsLPDR1HfnaUYFQO5jVs7vmlwdau3HsQYe9x95rzKf8?=
 =?us-ascii?Q?9Usvqbl/XDNYTeW++BnQ2w1Fc1hlFeGAxWZFH9eYg7HSotOrCH+hqJeDdgZy?=
 =?us-ascii?Q?Nyydce+hFN3+oH8xZIybT79XVCfjBssFfw9N6oIzM3t4vxAHNoUOQeHzV/X5?=
 =?us-ascii?Q?8SVJL/XpGYzkAHCCbC5PzkJChQqyYiuBZQtvHo9LXL99RTrNPOLJ8Z9diTCG?=
 =?us-ascii?Q?5ORGmyT1KJjSnRmBrEpVDHUvv1jOs2MVS/4c3M8A/hBY7X8dzNF4yU7ddpsX?=
 =?us-ascii?Q?MtKuHPbtp6KwgjV4EnFoNxUnMCwTKV9nsmS35Bqri6UHKHd0isjpQBkQqexn?=
 =?us-ascii?Q?QDuziujZLQhtd2dFBfSgE8gnckp0MhhUlNlU9lwFnc2Z1pyRsXiBTchT/LXN?=
 =?us-ascii?Q?wp0RnPPz8HpWLdRbHvC1UByYEKd0AD9ByNOUiqxYZ/XJJq7pKaE+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 727577c2-ef41-4c10-8f33-08df30799501
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 20:18:05.9715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tLzhByDTQXGoIXqUY9HjElMqEACaF10KwqILt1F5WDOj9Jros+VpTBZ88BYrCMTRKMWd/go9CPByE4WhKinA6xSF3lrAMxNgiFWgcVXkZ4rA+FTL+Nb6/YwOhKQcaOds
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12151

On Sun, Oct 04, 2026 at 04:01:19PM +0200, Stefan Wahren wrote:
> The commit e2ba87c745ca ("ARM: dts: imx6ul: Set macaddress location in ocotp")
> introduced a OTP to MAC address mapping on DT level. But the Tarragon
> platform relies on a different MAC address mapping, which is provided by
> U-Boot.

Is it possible update uboot to adapter OTP possition?

Frank
