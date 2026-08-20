Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011009.outbound.protection.outlook.com [52.101.70.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538FE37A827
	for <imx@lists.linux.dev>; Thu, 20 Aug 2026 15:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787239230; cv=fail; b=XuIchILbdZI9udVhRQFISZw4SnhCkVWO/BhqPyJGrlYvac7yDcLNpuQ8Zrc/4n9bmJGhMOOcDD0Cxsuwb6LnXUv4TXtAiescWC8F9KzoBXKhmfSAhG/3qMcwS+Kpe11OFORKqmzzyGLuqt+iyBpIVAvTyGvJmAabOS7eOmV0l+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787239230; c=relaxed/simple;
	bh=P6grSStdj7yI311ws+jrEZ6VdZTw9iYhDAO2N691Vvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cO/dWBUxPKrLSSUZNGC+kvDUnFYU3/Q5rVQ5cjenEAyFLwL0xfXI8u8bWGa2pZFnWz6i4NHHHTN0LdTByisHSRQJlTsVp7AB13tQ184aS3LlkcW9ggshsZg43y5nO/vmwbQWBAS2UzO+uc0RLBJEd4hOEMrvSFbSCc4Y0DB1BE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=phyeTjmJ; arc=fail smtp.client-ip=52.101.70.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="phyeTjmJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTKW4RWeuI2XPNFKIAXQDLWnvMKsBrwushbsGCLtK3MRH3ht3omkp4mueidbrd3YCr+Z3rPbwFMLq9VfztcajaxlmJ6RpQ5L5W4raVgwKJYWTTT5O7RNXcf5V21dpISKc3G1jlOemAod3+TdEOyCg67HT7T+3QgVEwq/HqlQgDbjWNs3ov9X+uN72ODXwV8uASzRMQEKBgkGGIzgbMVVwD5rqpej0yPkCv/hMro2hIsauUDctb/6e1k2bP88AMphf3dSNHqVbAxKpZuw8Fvj7wXNcB/cimksc5Gn99zMsE5OzSk9qgV8knfHsPvbBDwE2IQuAkXb839Dqd4Jn06iow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T60WzhwozfoAxskKPuFoLDg+Fb09FOeo1d/nwH5Krps=;
 b=thk2Aet80FHYnWtKIYXn9zBGnsjNxeyEmvYCRUIkr1Ibn5pP0j+K+HXQLa1R0HJTcPy9tWRKEAv51TnWolbF6g8zNtLsBQtwH90H1l5+f23pEx6w7oLfNOUEwGdtrlbAPiisJvaQvaL3lqaNfXEW7i+0v5k8AVfqoP0QHf9E+DxoghIDSMx/iR1m5ylLytTV+zWTeiBTvpeIGtETOpbNKoPsGXQVTPY05WYJq1/2cyp97C4sXA7q6FdgOW5bh6GVLXMFSAv77Lan8u2zFkaC1fwj14D7nZ65NzhT1I7agUAnKS6eKKoS3uwpJPoMCLbcJEc6jzl3T6lcw/5zfD507w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T60WzhwozfoAxskKPuFoLDg+Fb09FOeo1d/nwH5Krps=;
 b=phyeTjmJZWLfPCE/ldtPLFdHL99OsFmH3xnHdXYLSNKWsPri220xmeIeiVA4sdyXnB4gRJRWBeoBaxPy1O/o7y/098qgh/tN4EIiw24Xm1pOmfaI4Z49r8annbzUNk46sFVvMFOXV7O6kaEas4Q83YuOztuBiDNps7RwOLTxy+wvSguRDiafgWtjYWTbds1Afuqkc+KydxkgWysV9K+cnsBbTaQ+3Q/G6A7kwJBKwNjoaGKfQfauY6+vFF2kiObXCDnOIvaW4krwucH+fkPNlOHMxZ+aXr4nPuA1bDHCww1ElJAEClsYeDfK7tlZbKBsGundWryJQqd+4Nh60RonWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7442.eurprd04.prod.outlook.com (2603:10a6:20b:1d8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 15:20:20 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 15:20:20 +0000
Date: Thu, 20 Aug 2026 10:20:11 -0500
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
Message-ID: <aocbK_nWJSbmzNkp@SMW015318>
References: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
 <20260819090543.585131-6-Zhipeng.wang_1@oss.nxp.com>
 <aoXJAx131-gU4qXu@SMW015318>
 <AMBPR04MB12334895C9AD42BFCD085EAB9EBA42@AMBPR04MB12334.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AMBPR04MB12334895C9AD42BFCD085EAB9EBA42@AMBPR04MB12334.eurprd04.prod.outlook.com>
X-ClientProxiedBy: PH7P221CA0058.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7442:EE_
X-MS-Office365-Filtering-Correlation-Id: 39aeaec7-61f2-40e4-55ee-08defece8bfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|23010399003|10067099003|56012099006|4143699003|3023799007|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	ggoWAOXpeDmNUnzk3QIYC9851hefUuOG4hRRTgmTrZV90dxGJ46qa6XpCyMu1mBNbwKRx/li8g/AzZNf1ufqAULdO3IHctze/HKpIoZVxY+rYazofveEyxv6/KK3fYy+v9/iJlzkjI8ZdBKZKdp8qfI3uViMP7ztK9LNBKp7HvJnJdOsF4f8PCeSXlRqdgvaU7MuWqfvIxjpYB/2+tFbGohEZyGBOVIWzCu0je19/SkaYDfRn93SSG2WdxpPYxVbKjaW0KaFefZAfqq2BiIiKYhab8Z24pAUv3RMaU/NBGYVl9Tihgd8uhPV0tJF9HZxrdvmUxFCoLz+HMByty/y6XwpU+itsquVBDOYvI19Hbr+wi1DMQfJRjj1SOCEKItDnabI1JO6VF1/GzLj7fdOHGZo/yXowyDNWINGrDKCuxZCWuntZu+67MlMfkd2CL48O0H4xllAUwr38yVgF4XZie1O7ZOx5aMzENBoUn35lmTpliSbruDFa6l1I0pONwHWqZcuhRWMc7PbKqEfvpMZFnuev1PdjJkvlbXqkYFtH7tgSKyT+xh6aVMUMU8Rl7bB4Iw3aRI/QteQ+9CBqeGi4pL9XBcM4tQ8YgJolTxVh3IWTA8m/qiUN29wAHV42wvnt9Tyg6r+eluIsDPLjpiIB42fjw7qz0qaxh5lzxtje9E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(23010399003)(10067099003)(56012099006)(4143699003)(3023799007)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUNTcExxSFArK3RtbkJBeWVEei9UR3lONGNOV29qSG5vYzNmUmc3bjdlemZy?=
 =?utf-8?B?bEhzVFFnaXllRzhDWDRXeXlVeXczYTY1NnlhNTI3Y0kwN010aWlybVBRdjZK?=
 =?utf-8?B?cVZHNkJQa1krNHg5QWRxWDM3NVVKSVNJUVBmei83eG1pT2h3SVNKWXBkT1l2?=
 =?utf-8?B?QUtzcTYwNGdPVmpwNFVQbW9ZRndpWTZJcElXS25mcUdkb3RsVWJUTnRHSWwz?=
 =?utf-8?B?L1Z5UXFQYitKSDhINlpRN1lEWVlkOTR4eU13UDVBaHgrU0Jsakg1VHZ5QzNN?=
 =?utf-8?B?R2Q2ZDV6dS80ZWtaaXNDM3U3RjVEcWZ3QUpNdFl2aFpQZ2tTYkNYVnVWZTBB?=
 =?utf-8?B?RmUySm5RdUwralVmUDNTd1R2NW1BWFZiMHd5T3Q0OGhPZ3ZUcEtEKzdUVzl4?=
 =?utf-8?B?ZGtDOWdtR0tvL21FSmI1Mk4zdzJFZFZSMVpyNGR6UUtTMUsxQWlLMk9UeFFy?=
 =?utf-8?B?K2xBYlpYWEsxYXUycVR4SWppSHVQOFB1VUlJbjUrYTlaaXBHWklaMTNXUldO?=
 =?utf-8?B?akw5dE5ORENQWnErc3pha2MrdWp0cEpzVUpUMU9KamFLQzB5c0gybHZ3TlA0?=
 =?utf-8?B?cXlLM0NacEtwb0dkRHR1N0JGOTd2MlNya0VxeFhNT2VWcEFqaEp5UUhuRTdU?=
 =?utf-8?B?MC82WG5IZERNeEVwVUFjL0NVb1B1dFRWSFpwTDUvaWRHNTF3WUdHZXVoM0dn?=
 =?utf-8?B?M1pBeUtmYktjY2lCQ1htMGxadHJVYnRSY0ZXNjJUZjJaYnNRNDVwY1krL2t3?=
 =?utf-8?B?Q0VreW0wc3FoWTh3enNiNTB5aUNYdU8xWDkzcDJJMDJHckR2bkg4Uks2ZnpW?=
 =?utf-8?B?UzdFeFBjSm5aczNORWNselF4Tmo5S2ZoRnV0TFhZTGI2cWFUdEhEUWlrOHBT?=
 =?utf-8?B?NjZXOVQ1czJsblBTK3RSdDNNUWpWWXNqTVJKNU1pdURKeitIdDF0M2NhcWRa?=
 =?utf-8?B?ejZBMnhIVThiU294WG80b21pU0dnNG1PeDJZR1hPN2ZLU3Fra0VTbEpha0Q1?=
 =?utf-8?B?SXRiOERobW5jVGN2QWY5MGhLQWFLWkI5dDJ3QncrMVR2blhEM3YzaDlQWGhJ?=
 =?utf-8?B?Z0t2Q2NucmRmQ2NoY3VLemNQS0Q2bnhac2JhbjNEdnJwN3Z0UmlnYkNiN3pt?=
 =?utf-8?B?YUs1dEZwR3k0VnphZnB0blMrYUgxK3ZhMndTSWlxdXcxT1ZmVUh5cmlIckN5?=
 =?utf-8?B?M28vd2ZZMHpkaTl6cmFoOUExUHc0Qkw2VjE5bTd5VmVZZ29nTi9qd3UvV2ho?=
 =?utf-8?B?SUVRbEJuam1IZ2VLMTVUODZQdlpQQWVZaDFjWnJzUUNCQU1rRjdLdklFS3V3?=
 =?utf-8?B?c1J1MmhGblV1d3pxcDJ1ZUFPSWpUa3RIQXQ4bWdTdStSa3dOWHJhSkpVNURp?=
 =?utf-8?B?OXB1NVV1ZVljdkJxKzVkVFMzWTV4WHN1TDEyK0hYZnhTQ0V0QmJDYm5nblFj?=
 =?utf-8?B?WUhaUWpUdDl6dkhscWlvclA0RjQ5LzNsMXN0cW5LUjZTamMrNjhkYlFMclhB?=
 =?utf-8?B?N25sZUhRRERoQzJtT3J0TXY0KzR6Z2dMZnZDeEZhMXdTbUt4QmQ5WkdXcDh4?=
 =?utf-8?B?UzFRdHlsdW1rVUhDekFveU9ZNDRFL1I2RjlITkg5N0dhUVNEb1BNbGhBT0FT?=
 =?utf-8?B?U01BaEVhQjJRdmk4YXJOdkYzOCtZRFh5TktZRTZnam9zU1piTGNNRHdGSkRp?=
 =?utf-8?B?SzVTRHBzK3gyVC9pZkNHK0RGU2pIK3o3MG9wL3czc0R2Y3JDOTgwZkxPM0tK?=
 =?utf-8?B?MjhUTHRIRGlQWjNPdWlING1ySU56RDlzZHNhVC9TNnVKdnFRcTNDQWE4eGhn?=
 =?utf-8?B?V21CZzVmTnZmWDF1Y3dkamZ1ODZHcHJqS3RzYmJGL2FIQWhwUUE2cGhNOENS?=
 =?utf-8?B?NmpMRUtGVGsydmE0bkZCZ2pVQmdOY2dQb2VBS0w0Q0VqdW01ZnI2eU1lWWlZ?=
 =?utf-8?B?OUhiWGc4QmlsZDJKaER1T0NKaHU3UVlQQ3VXNXYxRkszeTBvVWhpOEo1NDla?=
 =?utf-8?B?YmpNZzViRFRWTDBLdWlsRDhGRklIVXc1ZHVHNU5QbXBpb3ovcEU0M0pFMWMr?=
 =?utf-8?B?L0NXSDV5ZXBtSkpWNS9yOFRYbUlJYkIrQ2ZZUmZxbG9zbE9NalVCanhRYmgv?=
 =?utf-8?B?cTI2T2hsQzJOM1FJL3RiRUhjeHhiY1dmKyt5UUNKUFFRVjFCb050UkJWRFNw?=
 =?utf-8?B?Zmw1WTRpM0pGZVovWWJKYjhCdjl6dVIzMlc3WnFQb2MyRHYveWhvamExcW1j?=
 =?utf-8?B?WVRnL09aYzAyZGtjK3Q1ZVRlSm84UzZDeG00dWpOVDVHT1pDNk85NW42Q0po?=
 =?utf-8?B?bnBXZDZUNmx1TEVXSmRUYzNpSmt6RDY0Uk9rR2V5UFZLakZpS2R5cDQrTkhZ?=
 =?utf-8?Q?SNkzNZwvvATbAQVOBri7OIVjiJphJRfNPI2kE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39aeaec7-61f2-40e4-55ee-08defece8bfe
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 15:20:20.1661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dipurKYqUxJL2qUT81VirTHSLbsZLQb6ntvu+thfhoA7hlHqYA+EAqXtHAHl90WpgvJUSA0ZMnCsECcSaAS0bXhMJnwVYowZjxAN053iBj7Nh81xWUnreujqAuMdlwnV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7442

On Thu, Aug 20, 2026 at 09:53:13AM +0000, Zhipeng Wang (OSS) wrote:
>
>
>
> NXP Confidential
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

Sorry, I missed, it looks good, you can combine to new fixes series.

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
