Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011052.outbound.protection.outlook.com [52.101.65.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23368246778
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 16:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768927462; cv=fail; b=VhjA6IWqpPEmzyOLJBR4hmhuSuMGy6R3SVvWScPq1dvHcjF86VCTf1b9HAXkfo1Ewfb/zhChm2LK39QCbuHY8gvMRYx8c8va+bMmHf+r6uPhSJyXHctU6WQPVnKh6O4/XsO4H9vTAvuBadnHnqO1I6XAu0S3N1m4+ExQY653GUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768927462; c=relaxed/simple;
	bh=pYAXX2m75sbDwIPVRNVNPArbp5FRA5xrxwl3pnCNnhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SZ4Q60TbBpqiuDHNu1y+cDdU9QH8XDqLyfZCd/AR/6oowKhdLnI24B3OhzYK1txzqC1UAIvEw/btY9YmN7aoHIKfxBySBYE7SRO4SdloG5CuYovOkw9AGY6Rs0t4WpaXdOFuku7C93T8/A97Uzu8bQx9gPHIyA+qkp+kLSphOJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Siqcj4vR; arc=fail smtp.client-ip=52.101.65.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Siqcj4vR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TKjnM29l5jyEjL1UM0bC+G6A/bMsKo1Ns6wsTM80nZyznM4nZtVjXdSBYhl4IwN9kTL0u1lN+qTXw7K4nJ2vJk1Jsi9veK8R00LhA208g20vx97rH3Kc7HOjXSAPVPaEDjgFGlG+kXIFQyCNqIMQP2/QaWHOF2ersKkBtqG8alkB0RFmSaNfi2suSuFmNRl6EgPf1PhqU1g4/vLzLSkqfHXFRhEXBExK0NH/C+BlfU8TrM6o8WIm8mfnuOQyTPEAStTeLIYyaYVsgALwUFJLlyqAovZb9P11rqUJNA/i7UPotS/O+enVLx4MyS9X8wYembuJspXonBOvdgPbqu4ZSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vaoPEyLykd+A0qguBhq7CcM/QLn/xsBuAZE1aTJL7IE=;
 b=ymJVfT286fOt2Hc2a/oYSeUnCCudSnV4ZjA0iRoQ/Bkik2ljmazNI6IrQo2p3p682zghLTbOS7YWY0BTEqKCiPfhMehTDNRozFyRw2qO2ZBhkMLyUcrN2w6DdKhoVt2OF1QIyflFOuV3GBGyOOnplflcyPLhnyh9ifrH7CP81q/LKZ0oJ0kikijSL4UDxeV7H+XwBb/DkOTSUkEihQ7pSozuSQchIRpjLVD0eGc74xYXWOVAApjSwfXsHQEZ2eJyvmVU4XVP3GXepKIH9e6n+CpJkurjRBMhK1BjLcRcJURUD/zUjhmkVRNv0CFu1x6wQ5/ZUlyfuSyk59s1HW2i9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vaoPEyLykd+A0qguBhq7CcM/QLn/xsBuAZE1aTJL7IE=;
 b=Siqcj4vRarYCf8fZeIDd6kMD7KLg9y/N3dC6dcQpd3Ca1E/qrB69ugcBqjh45r0W6RV0dac55++lMEVSHoT1p10A7RGUfVpaF9swWnqlNin1WACX7Rq7rYBd5RdcfKltn11e2KR+dBgAF/P/rqXl3LCJDdEuod1slKkY8chTstmJ1KbzHQHqJ0HEk63UQOpTm2A69Qoc1HXXLjRIYKBuKk7Ybfik6ZVSzzCph2KOWa+EJ7VD0wvtMnMWgaNqp8fF2EiKWMsEXLIK7L3YC2HP8ksQYgqKuij81HdewA63KGGhGFSpHCgUZgNzIwQeGhNIqvy0nhJyynVFr3yBnCOHww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS8PR04MB8229.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 16:44:16 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 16:44:16 +0000
Date: Tue, 20 Jan 2026 11:44:10 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	kernel@pengutronix.de, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx93-14x14-evk: enable lpuart5 for Bluetooth
Message-ID: <aW+w2jzj16FmsRjn@lizhi-Precision-Tower-5810>
References: <20260120025205.1485551-1-sherry.sun@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120025205.1485551-1-sherry.sun@nxp.com>
X-ClientProxiedBy: PH8P220CA0030.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::15) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS8PR04MB8229:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e816ddc-20bb-47a9-f66f-08de5843266a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zjuByvXu66qY80Cub7IuVFqAewJHbLjTQKxzbxunrOKbkjZg6r399yt6RBtg?=
 =?us-ascii?Q?f+3cpw5b8jO0uWEIc+LDJafoo4d1DesvxDvIaIkVYMEC66736A8kIE2E3PAW?=
 =?us-ascii?Q?WW5/jImfvPS5TDUMq3fmt1cv8PfmxjgMlBNd+WceVzPmMKb3YzM+EBq9nQhl?=
 =?us-ascii?Q?QlBGixv7I30m5ks7mawuHQ5nUqQdfW2V57HlsEUy/HLvSJaZtrjqQlD69jaI?=
 =?us-ascii?Q?PhD3ZfeuBjeZP07HXdi/yG4oxCJqxJS+4OsAPPGdtKzyJeDUvlK0IbyXox6s?=
 =?us-ascii?Q?iO3Ie9c2Xlri7dsZp7/QWvbUTqFfk8lQhxJn4Bff6BCsSP09NLA4fj6w0I6t?=
 =?us-ascii?Q?2niUdqkCldGpT0b29y3LmtrHlsbrssvIU72VQwpzyR1KoQ5+d55UWIqCH99J?=
 =?us-ascii?Q?y50ymZpbKuDkIGIIPT9dPfO3iGkUlavCpCUmSYb6XJ0EoMJzCLwc27HpbOx8?=
 =?us-ascii?Q?UuvgRGYUuPhWuiTYcpsiSV+iB+GdPmDyw7TttE53ZE0c+rt0ThA+9J/OA2RE?=
 =?us-ascii?Q?ZdhmqYkt+20kFJX3DiSw71tfXnfEJ7HidCUo9HiTG3v3rlriVakcJhIpaXmf?=
 =?us-ascii?Q?+7XlVOMPI0YEh02NU+xe0PNjlveL1sFpaxcd8GNZXW6XpdwGhhZ8l1MBhnRJ?=
 =?us-ascii?Q?u3eJgkBfJSU7iKfpwXQRxiVQIWGiK2nmJYcCwmo8rtCFUqFJtKoyF/8/awn8?=
 =?us-ascii?Q?Cm3701xPeldBRAaDbb9M4nBmvKTHCN/aalZf/nBhZKEYxDDiE/LnlB5jNkCU?=
 =?us-ascii?Q?yvzYwwvKODAajzMASW+iDkKghzZSJ7iKdpJoQTMa2A0aDc9BU5p1RJB2+uYh?=
 =?us-ascii?Q?3+N13bPYNozRSz4c4d8M39FmveZE4oO/JFFr10TKGh1rm32xzzfz7GiamX0u?=
 =?us-ascii?Q?8DYqE+Aks6xU7c/8E2bVHDJV2K9/cQ8Wyn8qd178a9FF9M7t0HiGldkL3CFk?=
 =?us-ascii?Q?D5F6Rp7p5a8vqlguMk/5T11Zk9N4Pz7rnWNXULx5CTkorYQ2gsGjlwngOyEL?=
 =?us-ascii?Q?EfWPLPBBHw6aBnSeQoHvK1HDyseydu8F9mzoqxLbiuUXNKA1zkCPjVWQRJFX?=
 =?us-ascii?Q?VvEd29PXtI22D4/NB8ZGf9xmgCcVnZumNPs/VwK5a/2BEqfvMkxcWm9GYS18?=
 =?us-ascii?Q?Q38nev3a6SA9CR4jpsGSUdicFbF1K82bECHeciyRyGd3WmwvXJ/5hjadfGlH?=
 =?us-ascii?Q?r2qhdBEeQZsmbaS/j+PNj/DFSCJC8pPlFhJ8lrqUhizr97Kt2v6GcJYWDjdA?=
 =?us-ascii?Q?QqAcHMz112ukx1BEAqHB7CeBM6zgFtkxPZjzs0yn/Aw0Mg5wjVO9ERGgUq2W?=
 =?us-ascii?Q?408hqfUI05GfmVSdyfu20M7ae3KRXDUNUNxIMKldCoy/PAocWhfp59mSawrR?=
 =?us-ascii?Q?vv6y2P05hAGyQfj9psrIGXvUTp8iSh31+JWgfw8FCd4LBF/RSS9IAeUFjezz?=
 =?us-ascii?Q?fmt4N7IDwgu27OtUHDSXiLwL4ClC9Cxnt0AUwApGgRxP5ywoITqMvaGwKcXr?=
 =?us-ascii?Q?R3keCby0nC3f2+Un02L/9VH+KKf5R8lhoFATmibQ200/fYmUy7HPSOaMgt3q?=
 =?us-ascii?Q?wjr1kwajIBIh4kawCmQ8pog6UZ6KDnn/jbrmQkSgkqoxihbECrsBGkKVPHGu?=
 =?us-ascii?Q?N4REGCtvg6E/osvY0Dxa6Bc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fAWk8PHwZyFUubEkibZof2RK7MJsW97uGqgNpRjTkQjLKSoKUyrsN3/Ga/Mt?=
 =?us-ascii?Q?NatGMP+z3qeisBcW8MCayg0N9ruzPBzAQtedUVuad4/BdbZEmCQURjQpHAeQ?=
 =?us-ascii?Q?mPBz/yTeQ/9zKwmnRRGUj3X8r3nRNn/jhvvTfCAEM5h5i729vE1EMSlRUXfD?=
 =?us-ascii?Q?XPKNkiCIebIS82RZEGqFTJ0OO1opi0CpPnxS4vGWrqcudwARVCiKqhSNntNd?=
 =?us-ascii?Q?OnZM7TBol5pH4VhAlOsByqXXY+D8Dlnh8LF+p5pDRLmz8mBsFnhVMiE/8Kvh?=
 =?us-ascii?Q?QgnxkGsCZSZ+xjblSPX2y1O58VD7EdNoStBX5a9RUYkM3PGnkIiRbQ0j4uVg?=
 =?us-ascii?Q?O42maTWG9NR65o8rI6moAsZs5tneI5aHv8YLOb+KF9Uz+cripNI0blDVUveI?=
 =?us-ascii?Q?4SYs9w4pSW2XhLKj8/B/MloslXT2CgIA5cXKh32bowQVHb3zI/3BaM1BJu5T?=
 =?us-ascii?Q?io16ALVu+6bPyZZVIpokEd3ioGk+fLeMN7HIIjF9HeaAoLCRD0QvVyA2txhv?=
 =?us-ascii?Q?HotdpdZITJWqbmwXvNQdfFWZVyz9Etf+T3UFvAldlOvp0yv52YkeDhDTf1uO?=
 =?us-ascii?Q?jp+04IHz4zou5oSGyPDEBxSDeSz3BNkuy5B12ntHmU6ckkXFIs2EPzjQ1a9y?=
 =?us-ascii?Q?HRBFrVLt6yg5UOHBb+nCjraAN21/gpREolGVE8ESOPB7cxz2iue5OieLVllE?=
 =?us-ascii?Q?+LcXUVdZ0ZqfUTkWhyhbTWuCUx/YZuiHa2U4dgcM1Xo7BVHOsO+F2skAhUPY?=
 =?us-ascii?Q?4lHPjnO6Nn54sGQVHmgcBmGo7Wlx/qAsWLpmhAsM9YeFsdrObcwk+TiYWHEV?=
 =?us-ascii?Q?m9UgR/jcYehkrAWq+9uVGaNYRXzYUiESP81GImRiChVbXBgUSaPhuL6qgn6I?=
 =?us-ascii?Q?ivpb/4Jb62BwpZlGMLmTJaqBImguuMK86CO+S+GR0isLBB071OJAOyAZFnlL?=
 =?us-ascii?Q?XUHPUiTbN8YsO6ndvlqdHW29QCp0p268AMqyOB8uarF86NE8CUQMdzhlSHMc?=
 =?us-ascii?Q?UKxn7pcH/dtPPUORmtv0FxSWQu8iILsbv8L+B2yDjoAeSeY3xv6WqV7JV5tw?=
 =?us-ascii?Q?1euZLOO+vc6aYoDSNzF2IvsmVSkHymz4qa1N6Mhyc8wDf/6neYAq8jj3iggZ?=
 =?us-ascii?Q?A7svwQJb3hfsAyB5o0KOvG8L3t/5eag1gHMcho15qY+VcyyjZakWaf+60n9A?=
 =?us-ascii?Q?mR1OrzGBtkI8DmxGNWNtShOR3xViE8ktjGS/n+oDIqVqwc2/ujXIWNlJvEqn?=
 =?us-ascii?Q?IpOCtO29Zyhs35tWIP0/zgczjH2sp5+Izq6WHCin/KbjHqYHKVTR40RSxvfW?=
 =?us-ascii?Q?QGytk7rGj/UdNJqHZEmWaTfucKi0vEg+Hj6Q6CxwkWmYyevU31c2ik0tMvju?=
 =?us-ascii?Q?rTf7mjBnH9/j6e38DBKXsEAMW0EWwA3B3L4kGI918U6d/QDvKZ37BOwp1M2t?=
 =?us-ascii?Q?rw3Q0rbNN1iS8fLF1ZxWwEIxRRfK2QUaqJ62QpXJTsqAaY4Crsblsmi9/piS?=
 =?us-ascii?Q?sPLH2WAw9urvpt0hsduVdsLWjb+CzOn8SGNSX+KRmVVDtntWqajgjEEPazgz?=
 =?us-ascii?Q?0a4nL6C4ITnr1l+E7zb4iAi7Kvm9nCKAQ64XHLcebAkgoCr2AB6q+Iid0fwO?=
 =?us-ascii?Q?usjAOXiLWw8tj/SdwXvAEiw2WeDRtXjAEVxdccBWv4aPjCzvaXgabhFSQ9C+?=
 =?us-ascii?Q?V19YuXsD2VKf8s1mBBz3/0nIAir5bZJvPj8Dhx5vsU/PENYm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e816ddc-20bb-47a9-f66f-08de5843266a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 16:44:16.5175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7p7xlih4qlUmGwooQKhIOonNUXI2NTgWtiGK8uPrYTGFyeVTYUO06FsCQgrqKqtKIYnwpSqwwQaDOThDGwYkdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8229

On Tue, Jan 20, 2026 at 10:52:05AM +0800, Sherry Sun wrote:
> Enable lpuart5 for Bluetooth support.
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
> index 61843b2c1b1b..ec78c03f4788 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
> @@ -25,6 +25,7 @@ aliases {
>  		mmc1 = &usdhc2;
>  		rtc0 = &bbnsm_rtc;
>  		serial0 = &lpuart1;
> +		serial4 = &lpuart5;
>  	};
>
>  	bt_sco_codec: bt-sco-codec {
> @@ -400,6 +401,17 @@ &lpuart1 { /* console */
>  	status = "okay";
>  };
>
> +&lpuart5 {
> +	/* BT */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart5>;
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "nxp,88w8987-bt";
> +	};
> +};
> +
>  &mu1 {
>  	status = "okay";
>  };
> --
> 2.37.1
>
