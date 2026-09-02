Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011004.outbound.protection.outlook.com [40.107.130.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C015396D15
	for <imx@lists.linux.dev>; Wed,  2 Sep 2026 19:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378589; cv=fail; b=g7F41j6ARyZggPkPI4PjhGFSKkdvqeKOqBHdtzcMrwm4Gt5VM7tcZ3FmkwGW6boJRwX3Umd/3JAUdmcE8+RZ2CJNuo0m06Ujdtgw4YkbKcPFPdNT/szaTgTAaSINJoe8GO+WJgiqdDsrvnuaqT0e52PnyZTRd0DWg9i+uL9iGGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378589; c=relaxed/simple;
	bh=49/h10hSJOJ7aRpGawiLbqXURYXvSts/S/MSTRJGxTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iD2867ckqrsYXy+ZISx1dhMJFRzeT2CG8HEejuhH9pNUjzRb+WhLyY7YwjsEO1/9ufLfVRxL8QL5jnaw8nxSc9wkplz6+NKDn9hjq9vj/ey1oEdNV4rSJ5yb7hZPuolMy25YsdFIkgI/tzCQuR9idxuOj0zQ2Jti8e68CQJvKZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aJpXuR4p; arc=fail smtp.client-ip=40.107.130.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aJpXuR4p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VuV7nHnCbaGYSUI57/L6Gtops+0j77e2DYzZl/dYgfCgVqWoVWBNeNj6VdPtPDAvO7nwZFRgkpSyWRG4RIn8xaLOQ3W1Cw3a/NspnvhDfcrgrYppTjT3DAWZOcgAdJ7q0MKdJGh9F+m9faIXmb7Rqk/9idMUpxsTGil4UX7+e+RyoQ7p1IW+46nAH1N41axze3VR006wCYzuSMTVW1+frxe8pDbqXB5uiMBpWO3OrIcVzZjZIWterJpPCKvA0Le1MIyRvbj9br4j/UUIzTP/eDVwSzM32L/qs1OC97FKH3tnrupSJ5cBLK7r8YTs2Qn5PoBcMCtSGxS2zlMiGEADQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rtTVORQ7basYuKSNFNiIYRJ6TT8IpTs1qcCjhFcndDI=;
 b=cAWZUdhqZ7GujNd5LiZDLJLvm5YOg/l/Zkhqs9J7cNY+GGpzgfLoHxlLqlI9hVIcN1MsmWDYw7RXeQFOluLesg3Br0KyEYMKebKKdKSewwH35cfE+Wu4oHbxAQyoL2fDnGgDfsUgvDU7r4jrrdWpFE8/vcFtBqpatJ5VnPBb1CkIx0v69y9eAHHY9eF/64lnEpxcLum78ux/2F16DPR43T2uCJj4DpbRJv9A0CQnPKO1RfPHSnCFiZ1ljoepI78by2EiHGSb6ItCDL+bntbSqPWWtHPiSAJ4NALU4eTwjTzABY+c6dNAR5wsTBZwG2tPLoOZyEb+XS2bHjd2a5xz6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtTVORQ7basYuKSNFNiIYRJ6TT8IpTs1qcCjhFcndDI=;
 b=aJpXuR4pmf44Kyt28MnTyANBv2EesSC3DG7QadKGWz45U94M/f+AmeoyqqOR6m3xJCYznXb2AvtGu2QF7rUaqox+KaX2y/k4+vu/bKdP3IkEnWTA9DA6MjfrmYfW1STQoYlgOgoFNsAb23zFVG/DHfSleUGYFGXr9ByEh1xotxb73/ZLMr3uoW/IHZy5kUTXg9UsposUIODtljmplv++1qHgGm8v0gYTxVE9k8byJq5NfCLn7gioR3Em+3HWGyEhUjVkvr/8QL4RSFGaoZZNgxvYqgzAYU1y4riU9InGx+d/SZnCD5oeZUxY+MnNshxi41PyXUItrg9a6xaYDlgSnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10612.eurprd04.prod.outlook.com (2603:10a6:150:225::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 19:49:41 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 19:49:41 +0000
From: Frank.Li@oss.nxp.com
To: Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Tom Rini <trini@konsulko.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Stefano Babic <sbabic@nabladev.com>,
	"NXP i.MX U-Boot Team" <uboot-imx@nxp.com>
Subject: Re: [PATCH] ARM: imx6q: remove KSZ9021 PHY fixup
Date: Wed,  2 Sep 2026 15:49:33 -0400
Message-ID: <178837855307.2123435.627510565403677166.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <8fdc784c-5e2b-40ac-aed8-7639f43df88d@gmail.com>
References: <8fdc784c-5e2b-40ac-aed8-7639f43df88d@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR07CA0015.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10612:EE_
X-MS-Office365-Filtering-Correlation-Id: acda1454-132d-48b8-f7de-08df092b5483
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|23010399003|1800799024|366016|6133799003|10067099003|11063799006|22082099003|18002099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	zhqK5MOiW1mwg4gpJKyzfKWCPJT0Gm86gNd8z0mqynbcHPGYNtOn/FoXyiA79j/kZVAavzmKiYjN2sLGyk+01ekvLB6IMwqcxSA1HQhtafOLkULyfz4HsCE2weOQcjBse1tWhsS8+HBYUCIr2H/55aeeu0Zh12LHKYLYEqfVaqSmQSYTp3s/F2pSKBHI1eKO69TEsz71rqZjyrJyqPVogqRZBT1eS/xnVA5yfWlEn83sCQtgSFE3oasBaigVV65NVDhMtMvLoySyp/KB0MnAZ2OOGNxCLePlzywAVKuKyJvRqSZ9cKZC3yKfIZb5nuICh86J9EjRn7QvV4TzC/uqfCTKWrXC8gSLEpgydcqghs4kyaNvfpx3SdLZpCIxU9p2zXwU5Snr9kQD9DmVL8XSi16DxfqiyCQgQudXWQECQ9k593kheC8N8kZtc+8MO8DM8OnaxshSUmWt0pKybJW4jE7/bxtREh18X/s6/QaeDzYKuMYNWEG4Gp16JxQOvNzodjoaFacBuZeF0kuU8zpkjxAapUcppeVkUzGHWW0koQ6A/7JRuWkaSGzuTYyCMAynjeWNYmgl9HNmVGymuGS5TeLJHMwMUtamM1eAVMiPiiTYeuUStRtLp3leL1/Odh8hix4cXv98gNpMdSstXYHyzPj/texOhAnpqw9P540tza8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KysvbGxERGgyWG4vL1Frb1Vnb1U1Tk5hcEE2dURZeSs4ZFVyTStRcklBV1Fv?=
 =?utf-8?B?NnZGdC96SlpxaU1STVR5a0JZTkdiWTdyV1RlRWJ2THNyVmNEd1N2bHlvR2FI?=
 =?utf-8?B?SFJpbjJZT1dWRHVCeGd5VWpxdVAxYitzM0E0MEhiOUpoc1FmNlJtWm5RRTE3?=
 =?utf-8?B?UFJidG1FL1U5NHBPNjlDS2xGbjFnWTJPKzVuZ1hZK3Q4M3ltaHIyc1U2Vjhk?=
 =?utf-8?B?WE5keVp0YUcyWUFEaU5tQ2dOVElRSmVCcEJtVjhUNW1XSkVGNUk3TTd6U3Fi?=
 =?utf-8?B?QVBqY2N4RmFOeDRST0JVOGdPa2xDalFadzFndHh0dUdJZDhSOUFjSTZwSStP?=
 =?utf-8?B?VTByS09iNG9GQVlBSjRKVHhPN3VZWHE5dTIxTVpVN0RpTVQ3RXVEdDZKYjha?=
 =?utf-8?B?WGkyRWFDeXBPa1ExUVlieXN1Mm52WlQ1TmtPcUNaMVNscDgrcVQwYzYxVHBa?=
 =?utf-8?B?YmorL1V2VDR2eDI0MXUwaGNzZHlIeTlIUkhEa0x3bVdLeng2cWw5V3ZRWDdK?=
 =?utf-8?B?TzNhUkVwVEgyUGZrMzV3SWh2V1BEZkJ2SUREcUVoQnZEdGFPamxlK3VVM25B?=
 =?utf-8?B?TGRpck1kNElxT0kzdDh2M3l1MEFiNTkzalIzd3JGUzRvRHdoTm8vMHNveVhq?=
 =?utf-8?B?Sm9nZ1ZQK0lYaGI0a0RMdHdtUzIzVFl1OVd4ZDdjK3QrWkNMQ3VTT3hRN01u?=
 =?utf-8?B?SHlucmNyZGJBSmJuamc2OENJWndPcUlSSWRvQkdLWnZqTVgyNUo3R1pYYVhX?=
 =?utf-8?B?a2ZFQTJmVVE3YnRRbXlkWUthOXJydXlNTXZCYUx4UmxzTUlSSmtYVkptNS82?=
 =?utf-8?B?cFl2VFBuY3N4MnFEaGRsb0RER3BpbUxEMGt6K0FDbWZGaGg1VmQxRGNONnN2?=
 =?utf-8?B?UEJVOXBGSkxxcFIzQmVqcXhKajFHK0dDaXR3cTJZL1h5N2V4STIxbWR5eGlD?=
 =?utf-8?B?WU9KWXlibUEvRy9zVW1jaVg5OWwwc29HUnp4RUJDUkQ5TVhXYXJhKy9aallL?=
 =?utf-8?B?eVZ0bFVNVkZkMy83Z21YeDR1Z2FNRUZmSTNESDJqWVZHN1U4UnpWNEZ1amtP?=
 =?utf-8?B?cUR6V2ltZXE2ZEJVQy8vaXNJbzFFWFlMTjlMa1VmOXRURmh4MjdyLzljNjJI?=
 =?utf-8?B?RElFRDBaM0lIMDFyWDNhVGtNbUd1UmpEM1lzcm1uUC9semJ1Mnd0SFpRZ3BF?=
 =?utf-8?B?c1UrRW43ZHBhNEtxM2pWZGttVTRyMkdjYlJVL2xzWlo0WDFvNU5mODNFRmZm?=
 =?utf-8?B?a2l6UVhwQW1UOGcrd1poM2k2aENFVFhOM0QyNElXL21JVG81WVYzYzlNRkVo?=
 =?utf-8?B?RGhaaEFMc3p0QkY2cmhEWndvMW4zdDJQMWhuNW10ejQ4VGd4SmV0R1dCRHFW?=
 =?utf-8?B?YjlSU01KSk1mVE1CR0hCWlNpN3dKdFhmUXpXakxtY2RxMHRWSG4ra2p2WGFp?=
 =?utf-8?B?NVFnWS9pK3FHU3pyT2t4MFNLWXN3cDVRV3VvVHg4Qi9OZ1RyQVYyM0hoLytF?=
 =?utf-8?B?a05uRG0wVWtkbWtmczN5UFVuV2E0aDh3ajZYcHEzUHpVUlRuZElOdnVxREVG?=
 =?utf-8?B?ejN1WEgwR1Z0YWR0RE93cVhkTEg0MVFIMFE1VmcwdTJhSjBFa3AvREMweUJ3?=
 =?utf-8?B?WFJyYTFraUUvcGZFd2NteTE1WnV6L245VnFSZ0dLRndyNFJIWU9udWxGOUEr?=
 =?utf-8?B?YzRzQU0rSlczMWk5cnlQTlRLUWVQaWFyZUY4TFgwOHBQTmZtTk1hYXFrMUpl?=
 =?utf-8?B?YXNVWHJMVmVsUXdOV3dmOFNMa3Q0MGZLU1dxSC9kc1lpZEhyRW81d2E4TFUx?=
 =?utf-8?B?dVR1OVRWQXZ2NzVRM2x1RHZ4cHhlci80STdPdjkyeTQyRXora2FhcXV6ZWh3?=
 =?utf-8?B?a2dES2JteUlHSE81MUVtVDRUN0xuV0VIVXNkSWlIVTgrcUE3UGhuWnNWd01B?=
 =?utf-8?B?RHJLMmRIQXRCVWxWUEdsaGRqOElkck9uandxMXBaU0R4RW4rWWxYSDNuaXZz?=
 =?utf-8?B?SWJpbVZhUmtHTUVSR0tseTJpM2NMN2VQa1gvSTdJOHRLR3FJVWxRQis2NlNZ?=
 =?utf-8?B?dUdEL3RIbjBUaUhWTUF3Q0Fia0VWTi9teThDL2x2M01BREVWNlJ4RWFPTyt0?=
 =?utf-8?B?TW1NTEFKcnljd1hxQlJBajUzcFNKb081T1F2bVZIS3pDQ01CaVkxbW5iT25M?=
 =?utf-8?B?LzZRN29HR3ZqWFA4M2ErZmZ5UzNEM0ttdHBNR0JjeE5jMlJSQnd0WGhJNlJ2?=
 =?utf-8?B?emI3ZnY3SUNJMEljQzBJUXBvQUNOV0liY1ZTVDVsQkgyS1B3dUtTOWREWVhH?=
 =?utf-8?B?L2hkNVRqV1NlYlRiaHNBdWVOUFExT3Q3Vk9sbUlxVkVjMXZDS0YzY05CM09O?=
 =?utf-8?Q?CkfrtlNOZz5GeO6cOcI7Wz1t/11mW0mvprCH5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acda1454-132d-48b8-f7de-08df092b5483
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 19:49:41.8248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YCE49fnXO5un/iikHhPDttpgq7W+cuafXc2ptBKNsLyFQRwhZ945QuqH+H3QhYAngnSs7/ZHRzaEVOy/fLtrCAGL/exgx19H4Absf3i/AFWAfIHNPAhgHuDHMod+6713
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10612

From: Frank Li <Frank.Li@nxp.com>


On Sat, 15 Aug 2026 17:32:00 +0200, Heiner Kallweit wrote:
> 477fce49aef4 ("arm/imx6q-sabrelite: add enet phy ksz9021rn fixup") added
> this PHY fixup in 2011. In 2013 954c396756e3 ("net/phy: micrel: Add OF
> configuration support for ksz9021") added support for configuring
> pad skew parameters via OF, removing the need for the board-level fixup.
> 
> Note:
> In 2013 14078291d89b ("ARM: i.MX6: call ksz9021 phy fixup for all i.MX6
> boards") extended usage of the fixup to nitrogen6x and titanium.
> nitrogen6x configures the PHY properly via OF, and titanium has no
> mainline Linux support. From u-boot titanium support was removed in 2021.
> 
> [...]

Applied, thanks!

[1/1] ARM: imx6q: remove KSZ9021 PHY fixup
      commit: 8392af7be78d0cdc5f1ec6c9a53d424b32642403

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
