Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013047.outbound.protection.outlook.com [40.107.159.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FF93AAF44
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 15:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785339044; cv=fail; b=qvohr88OK3kO6A31Bl05+2N8jm+w2FF4uw7ACzMY7vByS9A/zphoAME854cLO4WIv6PijG8a21u4mN6uLS8EG+mcKddfqnjYHCnEJXJ4uji8KQuOeu3BetjBOccwJEEnSFSJ+HVeR9YZb5d3LTaqmhsx/Va8c9fcZRCr+ptgnco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785339044; c=relaxed/simple;
	bh=ryOEgEWRdjU7MzP8WB0FkXK17EQbY/Wt++1s1Hgj0qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WB9uUUyANzTVoKjFpZzHjffDkfCDFZ2AzyhbEZzq7NepHepAdhINLp2aZsAHTTZyNn74n/R0WFKu0TEuFp7zYJi9T9WktHbaAcnWs2I6cxYSdILyyB0zgvyAqqpCdY9ICSbYFJ0DNlwwomLRRlaUlX6IfSRRmcPD9DM0g/oSvx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Zo9Bt/1c; arc=fail smtp.client-ip=40.107.159.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Zo9Bt/1c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xzmtjkhxzukogKvP/xV1evyNs+YE2OJWctEmtbN9if5R7sqZgHV7SVKs+rmawrcCdnMq8k3+T17jDO3ib/uB+YB+J+zrQGLO8lau083vo3JDnzHUxdIwLhGHEH4MtIb6ZuPIRhgw5TOe2R2mzyS5NlIQansHH/uDb4xToCho4XoBcADg/JO62tzX4rWtIIstEXHJnH4doymYjoe9JRz1sj0nnVR1Pc7sxw3m08ks1MSdvafYb4xo2E2eAPiiToGI+G2JgXt5GgEJU6Dr/eUKhzOpQ3zP6LiQvkUKP1uaOh9wbpgHgcC6bRwl8wVkx4z9rjEUZFzS4BdV4Dcnw6SP9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i7TQyi8/kLC96Jp8s2U99gEHVe3hHgR+W0uixhCAyAE=;
 b=E61D25rMRcXP70lZkAdannoTETrPDq1a08gO/Zz5BUM++JaauFFKEd66pjqiCKj1IaiTYW7MEipmMGuszHe3nWZZKl6e9c4EKqGb6YQ/vNrrWcMRFkLjPHv6PBBCsVHh47YUq3WGTOBUSdu9i+UZ9bM/qNGoKuVC3VCRRioCVR5Ps7UAm3xfJvu3qwQtoBkwxWvWcTd4QfcJXc1/NSDhWZSWd2vfl/dM+O3k5v3dB3yXaLbKeES9rM9bN11tJRRd7njNrKF8kanozvrGLuxPQ/EJ6e9bnvZQtd0o4mDwue0iSCT9VGebHPgywF7bTsXj65/jZI0iH/xigN64SHuqmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7TQyi8/kLC96Jp8s2U99gEHVe3hHgR+W0uixhCAyAE=;
 b=Zo9Bt/1cGphKE4UacXu/DOYCa83J0NNS2eW+uxP43gbrvhO2zvvSyyu6ukB1Ic4a3x5pM/cb1Jgj9ifOprEfPJTzCjn4cIJHW7oqpPcKfdmLy8v9rwQjhg+eYv4V/xsNeBDgMcnu8/tc2VQPD2wXt/FNzaRK0yC5KuJMcyWD79IwRfb583nKdvbKjwqXl7ANi52Z+6HPmO5HQyS2NYJx9m9OpDTAq2mvu9+JAoo2ZE5BC/6IzHi7hlY7gn4kAehk3WqQ/blYWmvKaHwu7Rl+dxOow9UgmzLkwORQ4V60JbKtAae9v0yjoE96qw42Q8G5v3Lu2Z/dNOzDQ2B0d/Vr5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB10503.eurprd04.prod.outlook.com (2603:10a6:102:446::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 15:30:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 15:30:38 +0000
Date: Wed, 29 Jul 2026 11:30:30 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: linux-arm-kernel@lists.infradead.org, Marek Vasut <marex@nabladev.com>
Cc: Frank Li <Frank.Li@nxp.com>, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/7] arm64: dts: imx8mp: Add DT label to SPBA5 bus
Message-ID: <amoclu5c3bQH2zzF@lizhi-Precision-Tower-5810>
References: <20260727195244.78199-1-marex@nabladev.com>
 <178526691528.3668106.10748099183405791163.b4-ty@b4>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178526691528.3668106.10748099183405791163.b4-ty@b4>
X-ClientProxiedBy: PH7P223CA0019.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB10503:EE_
X-MS-Office365-Filtering-Correlation-Id: 49a25c71-5394-4f96-e33b-08deed86579e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|23010399003|7416014|376014|22082099003|18002099003|4143699003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	VVgTlF3fpImdxoJSCO9oEwt86/R8xu73kSElkmxRJ0Mn76T/MU0NWObFY+mQ7F+vxcUjpl0+MD4/TCytc2g2hL/8RomP0agMntTWwk7LGDwK5eByz/Xv12chqsHLbZMXupgkWngetOPhfH77r1EbQliAbl0ClZwzz0jNnIQ6PyLVq0dcOoserJoy3l9gjx11mMAvIxLQuokcQyUkib+wdZ9+eY4I0oLCn1i0iQFFiCQVVq9OF8Fat0Lf7EuQxENydTaZ/65XoKM+MKswUllCEN0WzKZuwZwv6Kc82jWwkCoTOQfFGpY5iGdSH3ITbUpor816S+yCwr55AGoio+AEDwTzihS8kemM9+mqnqaplcpgRCefvDfOcTvgAbtOvjbqKeirQs96B29UgE86NzSGb92bVhtFfPwcBkcbhdXevGt54wVVWD3L55r2lqV6BItIuqBTzEvHcMQxGBQYKP0/r/Hex30szU5R89JwbtYSO7cmxHUfqf/fV+K1zkPebl1IwI3rXaueilSZ8Sa03uvh9zFoZKvLDxUYsK9L+ypTcEmweXWYUsTVb9f9jLalXkAFD4I6UsVNqHFtC2Rvo7G2MJlpP0jJnD76aOKCFjK1XrfOHdysT4IspB0Tgi3kOz/03owQNiM38a4JqV7KiFVMNzgjdOLw45BodWlPKcMwRtU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(23010399003)(7416014)(376014)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mMI59GJIxRk2ShqLPFz7NTwXErirTYoDXPH02UkuYzl0rv+qhKxPBpTlhYNm?=
 =?us-ascii?Q?CROkwwX7W2belJZQDjSZy70cDGzfzOhdSMCZRQpBdnkEmO/WQsg8rr57Lree?=
 =?us-ascii?Q?VGvFCINDkgeGR0E5lTVHzJyfGw+x95EuRJD0vkXeQecLrGDl5FLwQxri8BdL?=
 =?us-ascii?Q?UpBpRAEJe5brIQQt3P8d7MZbcaiMimXX8h/hH4vtjpDUmlh+zbv4HQ0jFXnW?=
 =?us-ascii?Q?yKHOuSn+RDTpwLfBAUqhzJWB7vjy8Rwi2fUFvUid51VEw0+EuzNOlupCr3jj?=
 =?us-ascii?Q?BkzDwZDU3m6mlVHt/6fImi0vKUnEFJYaOXnFSGLm6Uhv/Id/pJiHa5Xwx3Gv?=
 =?us-ascii?Q?yJFMtC41DrCXmAAVfCxDZxqW8O6xxkalWuzP18d8t+5kRVop4RmSeGCV/s8C?=
 =?us-ascii?Q?Rw++RpBCLGOCnvjLd9Jo3hHEVPNIn4WGdAO+sxtdpdZcpDSqnjvvH8UIVFFI?=
 =?us-ascii?Q?N65UjM2mErZuMJZXl6JUlBtcRAgcwBPoS5vSX3MH29wxxcEaoxbwSwkExTe/?=
 =?us-ascii?Q?gg+KeKjB4L9ohjxjzyR3zc8xy75LkS94rVpwm/jeDCFyyrv0cGqXQbFmkdsR?=
 =?us-ascii?Q?gMmYkaZx27kiNtPnM6WZP9sUXuLUTy+HkO1LqtIDjyMAQzaJHtV959VLE1Xg?=
 =?us-ascii?Q?sGWH9tjVxzUuR0cHdnVEw2YnFdriGsoFCJzA0bp1hGINyqu2qQV685MY3gYN?=
 =?us-ascii?Q?hEQ5++31/RV8+FFsY56H6kiXwqD/0oH8nbtyOQarm1nkOjR7SnVhwN7UKA1X?=
 =?us-ascii?Q?KRC54yTrZrMfnjzfVn0zS2/0MFPaFr812NQMH9NT24nuya4W6xV6j93nOnJd?=
 =?us-ascii?Q?Yx//wO6+8X2+Myp0AF/bUJFic9I5JqUq86YQeg8QSVI8LC5Pm6g4w5/sxz2x?=
 =?us-ascii?Q?7nvI2kPSC4+Z6K7fUWL7/8nK6ZWo2QA/tvdrpcXyE+tUKcs8FgOb0TByHJVr?=
 =?us-ascii?Q?aXktpLiIGZMc96blBuBkf9zVSt7GhOWoo3RAEOgn3fVnLOqD6eOOX0tg2YQe?=
 =?us-ascii?Q?uF3Ahpt3DweB9gwl3wjQtUEZRO1F8VS0T8DcwjANkbaTY9DQDOqPv8/A6aPc?=
 =?us-ascii?Q?37yq3ieE6mEyaTE8OCyGnsNT03wzI0GjsSdUNaZ+9fBJ6GOmuvLfhJHjtD9O?=
 =?us-ascii?Q?cjyppSt1A5HzYFkIBmj56E15dpN81lLV6Qo3A78f/9RUfYziDREQlJtev0QF?=
 =?us-ascii?Q?4xi9caVsRwZS4buHV6UAz0aK5nq+fuLVvZMyvqhsKji0zutJfVeHMMGsXmy9?=
 =?us-ascii?Q?9kul8gEMu6X3vCjDsxRWZLlUY4/XpBZaXfg7G16sWEQOq48UK+V7SPlXwrOd?=
 =?us-ascii?Q?TixjMh5zcRMitFTzNC0mVGpXFMVD6WGg7PelJBi6zn1iKfo7NNDMsU/CCX2+?=
 =?us-ascii?Q?Jv5G0HxQHshWN+QJWbnk7fVYbXK+m/c1YdvMURPsytiw14edCHZEDwtGBIIz?=
 =?us-ascii?Q?J3PgrR09h9hZzihM5Uw9WZPLvJ8ZndmsQVc9eBeQyv4cK2Tfo470GqJt1klK?=
 =?us-ascii?Q?g3flXhJbQcgcIGCITu5Ar8Rm6LPKGrH8FfquLwtaEOJP08E9YAoj2YDlbyq9?=
 =?us-ascii?Q?uzVceC9WSWoj1fPtyxomRPzF3bFY9l+BjczbId85tKClbD9dKmNKyvxk0PN1?=
 =?us-ascii?Q?+xlAF+8WWfFAk6Wsbb5HZHBcITE93U278WPfvOnwadBnBeEBDTZSSC9hdyD0?=
 =?us-ascii?Q?Hrj9sJ3WM5IZjWQD6/rr4j8qrVWwiGJTo0ZqmBwNnDBUccCJmXSVZERqRQlN?=
 =?us-ascii?Q?FZgv+ocCXXgtOqlz+/Fin4Nzg471n56eLuDLPoeno549DMrGWPoU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a25c71-5394-4f96-e33b-08deed86579e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 15:30:38.7021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OVRdmje9/tMO1Bimcutnto5bPSyjnYJgqWYqGo+waxtzWYtuBo8YQMHRUypPj5GD5xXmyHda9HLrdVG9wqwlO2u/6amlg6UENIBAljr+pdVnfBtnDGeOwOVkxQKb7Cg3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10503

On Tue, Jul 28, 2026 at 04:56:42PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
>
>
> On Mon, 27 Jul 2026 21:52:16 +0200, Marek Vasut wrote:
> > Add DT label to SPBA5 bus for usage in board DTs.
> > No functional change.
>
> Applied, thanks!
>
> [1/7] arm64: dts: imx8mp: Add DT label to SPBA5 bus
>       commit: 697f6889aa50996de067a8d170323535570052ad
> [2/7] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>       commit: 3eacea24d258ff5169d84a419b07cb5828e91718
> [3/7] arm64: dts: imx8mm: imx8mp: Add legacy board DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>       commit: 81a2094bb922290e4b52a1467037f8d2ac07ad87
> [4/7] arm64: dts: imx8mm: imx8mp: Add HDMI DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>       commit: cfdee13eba802665ecd8751fefa754a759f414c4
> [5/7] arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>       commit: b26192de5d0f4635d73ad2aea43e3e83a9ef5f77
> [6/7] arm64: dts: imx8mm: imx8mp: Add FIO1 DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>       commit: dca8d10e97bd121494106f54f4577291a9bb0f13
> [7/7] arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>       commit: 8ea2fa3fdc65f2750718aebdcf912cccde5913b8

Sorry, I have to drop these because met build error

Failed to apply 'arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtbo': FDT_ERR_NOTFOUND

Failed to apply 'arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtbo': FDT_ERR_NOTFOUND
make[3]: *** [scripts/Makefile.dtbs:94: arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtb] Error 1
make[3]: *** Waiting for unfinished jobs....
make[3]: *** [scripts/Makefile.dtbs:94: arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtb] Error 1
make[2]: *** [scripts/Makefile.build:549: arch/arm64/boot/dts/freescale] Error 2
make[1]: *** [/home/lizhi/source/linux-imx/Makefile:1629: dtbs] Error 2


Frank
>
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
