Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013027.outbound.protection.outlook.com [52.101.83.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAEB47D93B
	for <imx@lists.linux.dev>; Thu, 20 Aug 2026 16:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787244802; cv=fail; b=lVpa5s2/flPUo4FFoMJIZL7cQaZK3gX8mIGjI0QAtUvGitx4MyHlaMZqqH3/Yr9YGADrUADBukkRq3tmHimb7x9v/Y8y0tdx1nKxth2EHr5mCt/aEJL/0Kf9vjAI5OMYFNnZT+jMW5wuUKjIvAtxfPji9uWxYc3iDWzIhkLxiz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787244802; c=relaxed/simple;
	bh=FTdPOT6ZrpGW8lBi4umReCOH1++5WAJ3ECbjssYMzxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nkvjktv028t7paq1zD0Kt9yUmB++GHMmwmqHMOii114wieN56HSiGCUcZFxOwLzQAuZic0BkHWMPuLqM2MC/hSZsCOmI9ZrNXILg0jmO6oEtCQPZoZ1y8EZutExb4D1L8sZ9uq7MYZ1L4ZQtZnmWOHvK5JLWdAAf4pHRWGvFqCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uJCnbc84; arc=fail smtp.client-ip=52.101.83.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uJCnbc84"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KKFenwOGWb1l4lq5Kixv3jhbsA0XTmnJaNSoqbTCke5Of0yMluQ828lDAYqfaP2SGbceI6v4qzrBwgnvBxYvP5ngulIpRdzidOCfFojVScHthB5Ju9ybdeXLKRICKRyaeuKYnF7i0n4tY84a8k/DK52Do8Vht0sTOXfPs3ooGUUaRhYE/HGaWsTmxqecOY3zTjdFpNImo3B/XeLG+Qr35iQiy5dhOkFk270IgQh7nk17pajYNv/e1wKAnrSytQZkIMUt0JS44VmFt0mWsJEFAEPHTyPBA6YX0N9pFpa8tqGY6q+3nT6EMyOaIns1qrl1XgIbo9rrcYjrV9KzIO7N1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCDEnbuaeNZpRthB0izK/TxF12OF9vJ7Zd8UeUFmsh0=;
 b=T1PEPMic/X0ZwJmVuIaKxdtn6OePesxfZ7TjOF7sjj6geA4FRl6nkkGzPW372gKWxl712Pes8KKD5WphTjwZIiPlsktfNg9+c25dkFrO1Lt/bWeK7ofb+GdrriE4gbGwE0Al3boGAtp2FK6DES0VuZxiT7r70xxVfny2gRs8r/7315/Wfh6xNGdeJOzVdGDO3JtrJ0I8TpGLdaQcdPR9YJsneQ2EGEsQWSxPlQG+mgh8TKho+n5i8BQjQZw7rdeSiyhAq2inr0q6SqGRvVdXnCYWxOyAaUj5IbfZRe0iCP2HJPbQx0wXMjtOLuaugbfPYjRx15GNOrZqDVfwjAuMTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCDEnbuaeNZpRthB0izK/TxF12OF9vJ7Zd8UeUFmsh0=;
 b=uJCnbc8466cJuVRH9BVnoxbYGRsFaZW1CjjkUpwDIpwhvMwN0jVkueSeSJqL1lSA5iudyEDjoo7zvmGkQ1FTantfeGFcNUeHAGeJSi7XRXJhvB6xvyhSbGGF49nE+vx8o6PKRoaVIHZquNr8KTnHcGWB+NNXaWLIZ3/gGBl3fD7j0SZNjQdMJLGbU9q3zpDX2Mh1Rdt2ehU8jQVsh2HYgOf3HYb6TsQy3ZdOKl+FRhulT/O5vHWU6q4ux9nmGbxTkyBkUt90+flLvYtKzjHwi83s6KTqX36AJIt+ki7PzVtIwpDM68Gf1oHdrY1AEjka0KkEJtXuV+iCbLAkjaqZ0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB8758.eurprd04.prod.outlook.com (2603:10a6:10:2e1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 16:53:16 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 16:53:16 +0000
Date: Thu, 20 Aug 2026 11:53:08 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Zhipeng Wang (OSS)" <zhipeng.wang_1@oss.nxp.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Frank Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>,
	Xuegang Liu <xuegang.liu@nxp.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 5/5] irqchip/imx-irqsteer: Allow building as module
Message-ID: <aocw9Gy4dsWLV_qi@SMW015318>
References: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
 <20260819090543.585131-6-Zhipeng.wang_1@oss.nxp.com>
 <aoXJAx131-gU4qXu@SMW015318>
 <AMBPR04MB12334895C9AD42BFCD085EAB9EBA42@AMBPR04MB12334.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AMBPR04MB12334895C9AD42BFCD085EAB9EBA42@AMBPR04MB12334.eurprd04.prod.outlook.com>
X-ClientProxiedBy: PH8P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB8758:EE_
X-MS-Office365-Filtering-Correlation-Id: b2c8c11c-448e-487a-f650-08defedb87c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|56012099006|10067099003|3023799007|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	07pUBLYuXNOstBk775WbzLgy/rLk2Cy/m984gqd/Wuge7VFYG+9wRrhjB5A5ODySH8FWI6hyt9FqqFNqDkfKdIK7d2b48teQm3A2cMQLEYqdq2MtyjLN0MZ/JPA1espHBkX7XMXIq5T/z582b10lNRlZLgCGkMgUxL52THlHayNFOjLRLROFc8387dU5HoX8WCyUTionGPL5CvrdzVPUriNb3QCG3mTTpPuYKF9PqWvqMv9NOyD0z88B3md0WW0haYSwX8aQeGBJT+klhG9shS7zEsEGgXbXcW+jdCCxcHKxU7B+57sZYzFRNS6VzwC91NhOm602AR7f24WhV3Sesmcalho1jf51olMT+o4E9N8nuX4FuW6YpQXSkOD0btGw3sCmz3zb/6vGoQeq8OtXwMB6bK7bF8JSz9jK1al09tjlYtd4+yJ6jBeOxMtNd5p637+orC8B0tJ0Jhzz4X0iBXbYK+PXm/OJmYlk8bR+55k4hTsK/Jx84XVl3Y/C+dN7rdRDTTVPgyVRubZMCHmVeMznDDJkB7b1jTbaoCrAk6VgWk9EL2WVrF3CTB89NqK5Y88fb2+ZRdt9imgnFZfD/Bja8JSFowfgSd440x/fk9hh2b1v8pS3HhSRwD1LWpEO/T7ikecY+vYlpD4ZeykvPaR+S+mtmbYrfpBfgd0DJHY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(56012099006)(10067099003)(3023799007)(22082099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1U4RjdlR3gwK0tSSzgzaU42QnVUU2J6aDkrMHR2amRvRVpTcVV0YmpRTEM2?=
 =?utf-8?B?Q1l1cmFNNEdmZTN5SWc5dU9uc2xDdDlHKzRIS0N5M3dPYjg4UXdyZWJqTTRY?=
 =?utf-8?B?OG5wSHgwaC9hZkFmV2ZPOFd3c2JxTTk0RTdOZGZZZGJ1enkwai9DOVhzVzNv?=
 =?utf-8?B?TkNhU1B3MUI1VlVqL2lnY04rdTUvUzZ4VHZKVmxZQmUrK3VXUEFFK3E2aUZo?=
 =?utf-8?B?Q2xiSDVpaEFQUzdWK3Y0d2xXVmdrS0dYWHEzMDhpaC83VUZjVmtRbmQ2dE9S?=
 =?utf-8?B?NE5PMmJnYVJKeUNJM0NGMmgvUzljRjErWmlWNWdBTGE4Z3NEc0VWb1BOOEpu?=
 =?utf-8?B?bWRQSWkxaXQ1eFVzTU1WUFRMWWI4SWhVbldOajVhY3RWL2tvcnZDdmFtMkpi?=
 =?utf-8?B?cFZKa2ZNdkt4YkU5cEtpR0RPYzNpMHFmb2E3VFBHUHEvNTB5cC9DemJFQmYz?=
 =?utf-8?B?dzlMT1JlU29WTWZla1lUUWRybUR6QU1BOW9JQ3JwYjBlc1loamdDZnZUTDZt?=
 =?utf-8?B?cFRKZUtSUnZKK0E2ZnFzdks2d243RmNhWWh2aHM1K1R5Y2FOdElmY2xBZDFH?=
 =?utf-8?B?YnBvdTlGSG84Tm40U0pqUWZKMUhaQ3BncTRncWdhMnZIL0NKUTNucGJHM1dO?=
 =?utf-8?B?RDk2SWtlVkhOdnd6RDVWU0xTeU5DZEYwY0xYYkhVL0hFK2lBZ0VjR0hyYndN?=
 =?utf-8?B?SjNSQ2U4NlJaS2s3aW1WS1F4YmFJN0R6Z0ZTVXFOb244T2FYSWwwNGtrMUlr?=
 =?utf-8?B?NHpvMGtWK08rRGNiZlhueC9zaU80NHcvZFdZOFEreE9ISUN1UUxLdFNOMjcz?=
 =?utf-8?B?SW16VmthRmx2RlhDOVZqTklLZWJ0cWhXUEx0Wmloekg2d24wMk4xNTZrbHZS?=
 =?utf-8?B?cWVKSTRpZlJ6YzE4bmhTTlAybXlkTzZzdkVQd0ZvSHNsdDZxZEtISlIzdVhx?=
 =?utf-8?B?ejNCRHRRR08yTzhlT0x1V1NUUHhVK3lQdWN4SDFRalF0UkJsMHkyVXhyKzJs?=
 =?utf-8?B?c3huelMrSCs5YndnSWo2T0N5UWY2Y0x5MlVDb1VrNlJBcGRteDQwYmd5eUZQ?=
 =?utf-8?B?UVliamxlSHJ1elpNS2ZDZTRweTgrRXYzWEluSnNDSU5nNU5zN2tBa3hrZTg4?=
 =?utf-8?B?TW1pUjFSYm5LSWF2UGM3L2QwK1F3LzlrVnlnOEpnL0J4Q29OTCs2d1k3Vnpp?=
 =?utf-8?B?WUljb3pjS1luYVI1M1BMZUZoMVFSWVVTMnJ6L2lkQU5VeWppMHc4ZVRqKzJG?=
 =?utf-8?B?QTgxMUdTak1HMnEwTjVOdEhIUXM0dGdGVzFqUktOS2g5OHhXeTFySVJKdnRa?=
 =?utf-8?B?SzJyTnhMQ3krUjhibEhEYVQ1T3FnZTNRb3JNaklxdlBxLzZXcFJlR1FnUGNo?=
 =?utf-8?B?b0ZUdTZJeURIa3lMYndUZ2tTY3NYcjJRWDNwSXo1NkM4NjNYZGg3aS9rZHFZ?=
 =?utf-8?B?dW5CNERHUkVRYmZZaEdCd1N6eWszb2xtTnlBQnI0NXo2OHpXZEFMVEZhdE5t?=
 =?utf-8?B?QzF1TjBIbTdVdkhpU01YeStYYkw2VEVxeVhOVTU5eUhYMkNPa1hHVnZhU3Nk?=
 =?utf-8?B?djRqVER1MExucFdEalJmV2hkYnNEZkVvU2JGWXh6M0lrb0d3L2ZIVnRHdUR1?=
 =?utf-8?B?TjBjbnZxbXpRUDVoZmNUVmpmakd2V0RRcU0rNEFFS2VDa1lQOTRBUWZ3S2JB?=
 =?utf-8?B?bEJ3ZjN0NmIxNzNmenVUU3Z1dTh5WEU1UnZsdGZGbFAyZmw3dVBENEhqUkUy?=
 =?utf-8?B?NUNWKzR5cHVObGx2RGRRcmdoZks1SWo1K09pdnlWN0VtaFBLN2U3cUdQT1A1?=
 =?utf-8?B?YlZkZ0JzVjJsb05FVUQrMVZTaHp4UUZ6a3F3dS84RndvbmZEejBhTDhaZmM2?=
 =?utf-8?B?T0FyY2dCd1RYRG1QUEg3NmZzWXN2SGdlVEdIWTJ1Mlc1QWcxRnU0cVpJZHRT?=
 =?utf-8?B?Y0JLTkJaTFlRZHVncjFtT2F0QkU0bDRaM1pBN3lGY3VaUS9QUVo3am9XejMy?=
 =?utf-8?B?c2ZFemFNQ2VxZVN0b3VWSHo5T2kyS2pDdWxqZ1RiVWxONHJrL0NCUUZONVFt?=
 =?utf-8?B?MHQzbll2QkdreGE1QVc1OWpFUDlvb09MT0IrSjV4V3p6Ti9PSVVsU1NITC94?=
 =?utf-8?B?ZFNiM3pxMzJtZFpWTWhRWE5sWmRqZmdZbG01a1drUzZiWnp1aEMxZUtqR1ZG?=
 =?utf-8?B?YWtRVlBuNGYzeDh3MEU1WXB0alZnNWt3TURCNXl3NGwyaEgyNXh3N21WYkw2?=
 =?utf-8?B?UXhNc0wvYjJKeVplUVBIR1ZKVlU3K0pWY1MvZXhzd014Qjk5WW9lc2dZQ0Rp?=
 =?utf-8?B?ekR5dmt4VnBsY1cyNStNLytrbk9sRlR3aTc0anVuZy9yMnVCNEllZC9naFdV?=
 =?utf-8?Q?odP441VVE/ABdH5O1pmHpkjpD9XB5wARlIHXA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2c8c11c-448e-487a-f650-08defedb87c9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 16:53:16.5652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l+U8rlTe2WxJ95QUwfDwLcUceOqh0HVTr2IJoZ2MIsL/nOWUjNIChCEuZcD3rkcwn/c0MucAGd2vPyalM6Py0d24s59jX+FEhbyjm10r2CPieu6X8NUK4FH6Qx5TzadN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8758

On Thu, Aug 20, 2026 at 09:53:13AM +0000, Zhipeng Wang (OSS) wrote:
>
>
>
> NXP Confidential

Please remove this tags,  It is public mail list. Everyone can see context.

Frank

> > -----Original Message-----
> > From: Frank Li (OSS) <frank.li@oss.nxp.com>
> > Sent: 2026年8月19日 23:17
> > To: Zhipeng Wang (OSS) <zhipeng.wang_1@oss.nxp.com>
> > Cc: Thomas Gleixner <tglx@kernel.org>; Marc Zyngier <maz@kernel.org>;
> > Frank Li <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > <festevam@gmail.com>; Jindong Yue <jindong.yue@nxp.com>; Xuegang Liu
> > <xuegang.liu@nxp.com>; linux-kernel@vger.kernel.org; imx@lists.linux.dev;
> > linux-arm-kernel@lists.infradead.org
> > Subject: Re: [PATCH v4 5/5] irqchip/imx-irqsteer: Allow building as module
> >
> > On Wed, Aug 19, 2026 at 06:05:43PM +0900, Zhipeng.wang_1@oss.nxp.com
> > wrote:
> > > From: Jindong Yue <jindong.yue@nxp.com>
> > >
> > > Make the driver buildable as a module by turning the Kconfig symbol
> > > into a tristate and using module_platform_driver() instead of
> > > builtin_platform_driver().
> > >
> > > Now that the driver can be unloaded and reloaded, let the driver core
> > > own the clock and runtime PM lifetime so that the probe() error path
> > > and
> > > remove() do not have to hand-balance them:
> > >
> > >  - acquire the clock with devm_clk_get_enabled() instead of a bare
> > >    devm_clk_get() followed by a manual clk_prepare_enable(), so it is
> > >    prepared/enabled for the device lifetime and released on unbind;
> > >  - keep only clk_enable()/clk_disable() in the runtime PM callbacks,
> > >    since prepare/unprepare is now handled once by devres;
> >
> > devm_clk_get_enable() will do prepare() and enable(). tear down also do
> > unprepare() and disable()
> >
> > To avoid both devm_clk() and runtime pm suspend both unprepare and
> > disable() clock to make wrong clock refererence.
> >
> > need in remove function
> >
> >     /*
> >      * Resume the device so runtime_resume() re-enables the clock.
> >      * devm cleanup (clk_disable_unprepare) runs after .remove() returns,
> >      * so the clock will be enabled and the disable is safe.
> >      */
> >     pm_runtime_resume_and_get(dev);
> >
> >     /* devm_clk_get_enable and devm_pm_runtime_enable clean up
> > automatically */
> >
> > Frank
> >
> Hi Frank,
>
> Thanks for catching the clock reference-count underflow — you're right.
>
> With devm_clk_get_enabled() doing prepare+enable and the devres teardown
> doing unprepare+disable, having runtime suspend also drop the enable count
> means the clock can be disabled/unprepared twice (once by runtime PM on the
> suspend path, once by devres on unbind), underflowing the reference count.
>
> I've applied your suggestion in remove():
>
>         /*
>          * The device may be runtime-suspended here, in which case the
>          * runtime suspend callback has already dropped the clock enable
>          * count. Resume it so the devres clk_disable_unprepare(), which
>          * runs after remove(), finds the clock enabled and stays balanced.
>          */
>         pm_runtime_resume_and_get(&pdev->dev);
>
> What will change in the next version:
>   - The series is split per tglx's request: the PM/devres rework, the
>     module-enable change, and the irqdomain helper cleanup are now
>     separate patches rather than one blob.
>
>   - Fabio's IRQ-count validation patch, which carries the same
>     Fixes: 28528fca4908 tag, is folded into the series.
>
> Thomas suggested collecting the patches that carry
> Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output interrupts
> support") into a single series. This standalone fix carries that same tag:
>
>     [PATCH] irqchip/imx-irqsteer: Call chained_irq_exit() on the handler error path
>     https://lore.kernel.org/all/20260807072626.1231517-1-Zhipeng.wang_1@oss.nxp.com/
>
> What's your view on it?
>
> Thanks,
> Zhipeng
>
> > >  - enable runtime PM with devm_pm_runtime_set_active_enabled(), which
> > >    marks the device active (matching the enabled clock) and disables
> > >    runtime PM on unbind.
> > >
> > > With the clock, runtime PM and IRQ domain all owned by devres,
> > > remove() and the probe() error path only have to dispose of the parent
> > > IRQ mappings.
> > >
> > > Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
> > > Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> > > ---
> > >  drivers/irqchip/Kconfig            |  2 +-
> > >  drivers/irqchip/irq-imx-irqsteer.c | 36
> > > +++++++++++++++++-------------
> > >  2 files changed, 22 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig index
> > > 20b77fbc51ee..105108d2e6ff 100644
> > > --- a/drivers/irqchip/Kconfig
> > > +++ b/drivers/irqchip/Kconfig
> > > @@ -555,7 +555,7 @@ config CSKY_APB_INTC
> > >       the controller's register.
> > >
> > >  config IMX_IRQSTEER
> > > -   bool "i.MX IRQSTEER support"
> > > +   tristate "i.MX IRQSTEER support"
> > >     depends on ARCH_MXC || ARCH_S32 || COMPILE_TEST
> > >     default y if ARCH_MXC || ARCH_S32
> > >     select IRQ_DOMAIN
> > > diff --git a/drivers/irqchip/irq-imx-irqsteer.c
> > > b/drivers/irqchip/irq-imx-irqsteer.c
> > > index a9909ecb6fef..a60cc527e619 100644
> > > --- a/drivers/irqchip/irq-imx-irqsteer.c
> > > +++ b/drivers/irqchip/irq-imx-irqsteer.c
> > > @@ -10,6 +10,7 @@
> > >  #include <linux/irqchip/chained_irq.h>  #include <linux/irqdomain.h>
> > > #include <linux/kernel.h>
> > > +#include <linux/module.h>
> > >  #include <linux/of.h>
> > >  #include <linux/of_irq.h>
> > >  #include <linux/platform_device.h>
> > > @@ -193,7 +194,7 @@ static int imx_irqsteer_probe(struct platform_device
> > *pdev)
> > >             return PTR_ERR(data->regs);
> > >     }
> > >
> > > -   data->ipg_clk = devm_clk_get(&pdev->dev, "ipg");
> > > +   data->ipg_clk = devm_clk_get_enabled(&pdev->dev, "ipg");
> > >     if (IS_ERR(data->ipg_clk))
> > >             return dev_err_probe(&pdev->dev, PTR_ERR(data->ipg_clk),
> > >                                  "failed to get ipg clk\n");
> > > @@ -226,12 +227,6 @@ static int imx_irqsteer_probe(struct
> > platform_device *pdev)
> > >                     return -ENOMEM;
> > >     }
> > >
> > > -   ret = clk_prepare_enable(data->ipg_clk);
> > > -   if (ret) {
> > > -           dev_err(&pdev->dev, "failed to enable ipg clk: %d\n", ret);
> > > -           return ret;
> > > -   }
> > > -
> > >     /* steer all IRQs into configured channel */
> > >     if (irqsteer_has_chanctrl(data->devtype_data))
> > >             writel_relaxed(BIT(data->channel), data->regs + CHANCTRL); @@
> > > -271,12 +266,21 @@ static int imx_irqsteer_probe(struct
> > > platform_device *pdev)
> > >
> > >     platform_set_drvdata(pdev, data);
> > >
> > > -   pm_runtime_set_active(&pdev->dev);
> > > -   pm_runtime_enable(&pdev->dev);
> > > +   ret = devm_pm_runtime_set_active_enabled(&pdev->dev);
> > > +   if (ret)
> > > +           goto err_irq;
> > >
> > >     return 0;
> > > +
> > > +err_irq:
> > > +   for (i = 0; i < data->irq_count; i++) {
> > > +           if (!data->irq[i])
> > > +                   break;
> > > +
> > > +           irq_set_chained_handler_and_data(data->irq[i], NULL, NULL);
> > > +           irq_dispose_mapping(data->irq[i]);
> > > +   }
> > >  out:
> > > -   clk_disable_unprepare(data->ipg_clk);
> > >     return ret;
> > >  }
> > >
> > > @@ -293,8 +297,6 @@ static void imx_irqsteer_remove(struct
> > platform_device *pdev)
> > >                                              NULL, NULL);
> > >             irq_dispose_mapping(irqsteer_data->irq[i]);
> > >     }
> > > -
> > > -   clk_disable_unprepare(irqsteer_data->ipg_clk);
> > >  }
> > >
> > >  #ifdef CONFIG_PM
> > > @@ -324,7 +326,7 @@ static int imx_irqsteer_suspend(struct device *dev)
> > >     struct irqsteer_data *irqsteer_data = dev_get_drvdata(dev);
> > >
> > >     imx_irqsteer_save_regs(irqsteer_data);
> > > -   clk_disable_unprepare(irqsteer_data->ipg_clk);
> > > +   clk_disable(irqsteer_data->ipg_clk);
> > >
> > >     return 0;
> > >  }
> > > @@ -334,7 +336,7 @@ static int imx_irqsteer_resume(struct device *dev)
> > >     struct irqsteer_data *irqsteer_data = dev_get_drvdata(dev);
> > >     int ret;
> > >
> > > -   ret = clk_prepare_enable(irqsteer_data->ipg_clk);
> > > +   ret = clk_enable(irqsteer_data->ipg_clk);
> > >     if (ret) {
> > >             dev_err(dev, "failed to enable ipg clk: %d\n", ret);
> > >             return ret;
> > > @@ -357,6 +359,7 @@ static const struct of_device_id imx_irqsteer_dt_ids[]
> > = {
> > >     { .compatible = "nxp,s32n79-irqsteer",  .data = &s32n79_data },
> > >     {},
> > >  };
> > > +MODULE_DEVICE_TABLE(of, imx_irqsteer_dt_ids);
> > >
> > >  static struct platform_driver imx_irqsteer_driver = {
> > >     .driver = {
> > > @@ -367,4 +370,7 @@ static struct platform_driver imx_irqsteer_driver = {
> > >     .probe          = imx_irqsteer_probe,
> > >     .remove         = imx_irqsteer_remove,
> > >  };
> > > -builtin_platform_driver(imx_irqsteer_driver);
> > > +module_platform_driver(imx_irqsteer_driver);
> > > +
> > > +MODULE_DESCRIPTION("i.MX IRQSTEER interrupt multiplexer/remapper
> > > +driver"); MODULE_LICENSE("GPL");
> > > --
> > > 2.34.1
> > >
> > >
