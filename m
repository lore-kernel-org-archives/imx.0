Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011050.outbound.protection.outlook.com [40.107.130.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A971E24337B
	for <imx@lists.linux.dev>; Wed, 25 Feb 2026 01:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771984155; cv=fail; b=Z0AgvtAJO5l9N83w0e9GjjLQSrQ5Qj0dnVM3G6ntwtOI7No8r2Auwmc0Ml6y7yI8hbK2Sw0EtGI0CGtJVs8FeLfoRz0GtHjL8a7ndzq8nyAGK1AgWG9V4Vle7HkCz81Kg1IKKLAJChXDsJ8x014flKQo6dU8N4c9+EeYYQldEn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771984155; c=relaxed/simple;
	bh=PehLEAA34mhY0DXsCkcJjnq1MrL/paroeJCOGH5ZLvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jwmTsA5FpzQDdg+vAjgJrfPiSSQ8DQoalqneNNAVaenjY+C9wrPKYWhqGcGvlRE8LTIXo6UmjI3jDFONXx3hkBkzm1QK2HLa1nuJF1XPCmCE4iooW3ImRp06ZjlHFVTTfhk9PUcIrhKFQszui91x3f3O6QaRF9LugrovDaCEgDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IaGHO2wC; arc=fail smtp.client-ip=40.107.130.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IaGHO2wC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v5+6zvBVWPYsl0Umi8+VWP9XrAebrfyup5iF6emsELaaQeA+mu7fOL+XtQuhV8DMS3Dq3vhuGE8YbypDxsvgbloxcVkS7lDC1CVps0ifb1WXY1qbkBJ4nFt4xpqKaDDPa1syepfcfQnUehi5bkNlUc1dgnqg26ZiAd/Ijn9pSb1ursLZZnO92Sz5/31WNeM4cc3DEaN43dmrj3tc766T1WGXIDE8IAEPlkGRPw6HOltVysHsYjzpxAkqMr1vNLIQw2fsNvE6iBslQaz0RVCAXkK19jJ4gfo+mcFygek2HY7G4Q9zBOrrYcedo1NIzIJlxYpvgwyIGvKpddvWNcY0kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHSp9jFTP1n4A2UfFfMAH2YD5VUPToPQ8mRo4UEwy+Q=;
 b=gV4PBDfxE79ST5HGl4Q2Ywt/g4jID3rl5R7mLMxUrMfUWfuggk3mN4JOWhMngN8bmQGU8w3jMxA1FS3eHRcZPpt4odQkZ3anXUHqIDWCW6q0toCTBrNnYgl5PU8PWJ/ea/IVIpZH0jDhck0xcsiCDW3D9azZlf0AicTulT/NkQGI45UNwl7YxykP7livnMQZilsFy1x+Q317///JMXZ1C3eRo/ijQKkHVVmg6eQppOyYRbTwwP0O/Slwjzs3AHHj+8VhXwbX7jixQXYKpM+o1lrSVMY1IeZfYo0JqaG1marY9vP0yUNyf2gqzbd7YCtQRW28mguIJgzmIu/oFgKsxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHSp9jFTP1n4A2UfFfMAH2YD5VUPToPQ8mRo4UEwy+Q=;
 b=IaGHO2wCZ0OEaja3RV1uLBRzs0yOacqm33IhivW5Xp6cyQzBoQpw5CfLrQNTGaTKHwaSv3kugaWCOXq2SDm9RAmWDb9SYjFFnrizm/1dgw8UqcidvckwLoOIrmesohxXiF6qMZOnw1O9G64/q2LBxF+SlXb5eiQb9Hg19r7PbNSYwXCv30r/fK6tnza0iwnaW+6b/Py+f5CiGf1Pw4Yn8XZBpDqgCsRuIQCnOXX+F2FhMpbY1Ohkh2qjKgdRRoTe9btu8azYORinyoOA8UxAKXiR5FjymwV3yH14DYmbTwEVBX+J4BLJFWmDxmXPl7aUfKt90f8N2gNhtluV5h4nVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10876.eurprd04.prod.outlook.com (2603:10a6:150:214::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 01:49:09 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 01:49:09 +0000
Date: Wed, 25 Feb 2026 09:50:58 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Forrest Shi <xuelin.shi@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: freescale: imx93: Add Ethos-U65 NPU and SRAM
 nodes
Message-ID: <aZ5VgoDF4QvWaCgE@shlinux89>
References: <20260219144200.2633404-1-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219144200.2633404-1-robh@kernel.org>
X-ClientProxiedBy: MA1PR01CA0179.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::22) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB10876:EE_
X-MS-Office365-Filtering-Correlation-Id: aebdf2f4-11b6-4655-f18d-08de7410111a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|19092799006|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PCtiYi+kJDyooB9BRuMa6XNanY1mTasrPqWQlZflSU5DEP7hdZ7gjTbCIAWD?=
 =?us-ascii?Q?eNS5fFOYvTKFhcfv5K1XhMzSHYRqes3VrE5x/Y/npL1y2/tKp1bG2veF+E9Q?=
 =?us-ascii?Q?XH4N6Yl5QnyTEziG7q1ZcI69nbx8HK0ykbJonHFdH/hz3EyNUma+6QkrkG7U?=
 =?us-ascii?Q?7+lpnr/dFfcQ3e7f5fI9MLYdbhycbnpsvhA+hPJd2NC5eComdhiFDOJNM/pk?=
 =?us-ascii?Q?Yk0YTPuopf/IlMRoz1jMUZmEEfByfMwQZm4C1HcIYfeFG81EayRk+Df6s4gr?=
 =?us-ascii?Q?tJtGGY9+tC51RdIJ1Ii97jjR2zfumOgVzg6ulT8gCwcExD412EYKNhz3XFJb?=
 =?us-ascii?Q?zzGc2Wn03ANHgPb5sAugTHu4cURwr4qfHT5Qkz9t6Rgbk8c4/sYzKkd0fhhY?=
 =?us-ascii?Q?TjFtoMLOK3c46jjasnvWxROerUTIDq1JMvT1+IsZBLpf7auTP1cfUDPxOcuU?=
 =?us-ascii?Q?I9IS55Mn8FOBv/E5WBQGUJcT2A33Gf2LorSt4A3jnwOuLXGpYYqx7cdRv8EW?=
 =?us-ascii?Q?h38RL7Xrd0gQ6M9ryIEqtE6Sp23Q+56kFfkBrGMsdtpNQMA4g1vtpyK2611o?=
 =?us-ascii?Q?Xy+AnZCFLh27LmkOnTUjcZ/FN/EgsztVRjUSblMfl94YPVJ4SDNB89fCWyEG?=
 =?us-ascii?Q?PBSGHVJ5ObPUYrEYDDaS/m0rosACLPXizTZpynQ3EyPwWj2tFwXUq+pMleZP?=
 =?us-ascii?Q?AA8Jhsr+/CpvlkbzNYXUHz9mba19hFyodoffT3WNLIbKNDtvVyFpzRjJ7KQR?=
 =?us-ascii?Q?rRLQOEytz/RMaKJjkiJJqm+1JYr6CQq5CcpgIp+nKuvnPTmmBGTbqMBADG03?=
 =?us-ascii?Q?L9p5+a0zvhCRyVOXFGeVecHA8a0FONNWbrIt9fTADcDRg1IKjDqX4pKd4MDX?=
 =?us-ascii?Q?qg2KQjUUuhtAmy8VOfFMMjy1cIwPIqtvTp5kss+YumLUZ/qCYSi1KwceuDol?=
 =?us-ascii?Q?oJGHZMxr1X95QpV64kmG+iWC9Pm80kG5VEDYdJmC6X6mqDMeZfmMj4cs4nZ5?=
 =?us-ascii?Q?uD+6UPqzHGib7ybXMWy9uSji3a1PtgmHtfBFk0te42aIfXcNPU8eRPxD7i2P?=
 =?us-ascii?Q?KaSxUFzcExDtQLFt+Ytp7G9ibHGvd328JkwsTD4vxKf3ecuEsBXKi5QVu22/?=
 =?us-ascii?Q?F4svT0tjcZNFA+gQwfMbST/91rxLxQN0KTNXmIZEfg4253UAFIPygDwNG8iz?=
 =?us-ascii?Q?qoaFWiPPeYeD/0qJ4xjJo8kkgwmo8exK1Beg4ns0NPrwRtcIAMEnZHawZEFI?=
 =?us-ascii?Q?w6M0L4tKbb2rO+f3V+yuNLenrgAioY4Md42CeOWw3FErRO8D1KS/+aCAkKTu?=
 =?us-ascii?Q?qfwbrwvcaITvXCdLtvZeBFo2kWi8qe5P+/fDdRKYglPWce1d9CSA0QagewxQ?=
 =?us-ascii?Q?JPALtW7O7mxdw//VS/t1QJwZeq/x3ri5IT7S1OxhBZKon32JwzHVGXac6zCB?=
 =?us-ascii?Q?qUkzBD/DDZndfm/lhHq4dyeGn54pR6Vyf82fnOGNuueddsjcWX2+Pm/KAsB4?=
 =?us-ascii?Q?4qPN32lVqPQTdqKgrf0oqoeOl+vJqPV22L5fbIXKSQC8ZHC6FyEpjXlzh5iN?=
 =?us-ascii?Q?9omAcDtW7pTtSA/uypIKsNibiQatSsCcTBfM6uYEeER0eYTo5prCHfMtJVrg?=
 =?us-ascii?Q?foJyFoKXpW3iwdy5wn68zBs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(19092799006)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8VrbjRXte8hqfk5wfwfFUr3LBjj/Q/xm2mcrvMOnCSQoP9WzIvrdFqJQ8wtm?=
 =?us-ascii?Q?mCYNPOsq8yOYHpU8KqNl1g7X31cgRPAS01cQ9amywRwxaycRnlIaxkIglznf?=
 =?us-ascii?Q?5a1CFTnB3MzcDHQLImd5NImKp8ZGXWwepq2cGHl+/vgzUR6c1IVZ3tIn4YqU?=
 =?us-ascii?Q?OU/UwTFc+j45Q4tA6s+u321YtGrmYSFY1WlDBuMqrhpLyZWMNNEN/7Jl0jjh?=
 =?us-ascii?Q?rcWzowPhg6alCVS6sGmkH2ky+vzaXK+0Y2In4Cd3bXMagWM4ChqFSrkL9p7z?=
 =?us-ascii?Q?1j0YZgcMOWwwu+ca87UhsULz8uQTe3nzQftXJVJaIHQd6vRAaCZgw51Gokcu?=
 =?us-ascii?Q?j2y2JPxVHALmBXIxFvHYwXwxqAUcMJ/54GBfCS9zjIc9wcy79LTRNR9s7dbr?=
 =?us-ascii?Q?R2RldWxxuLOexHN1TV3UwFag38C1osbK1/MXIUXYV1aXyfXMX387GtvFUb63?=
 =?us-ascii?Q?cZ9oGGcqmfhasqegxtXRUTqQsRyIuGrq8NsAKT1FI2Fs1DDX3Eqrqy3U6Czx?=
 =?us-ascii?Q?N8Ch5Tw4kZFEgcNs3++GzloH3IkVIbf9ed2fiJjg0K7VBYzK3hgXMXNT/6zk?=
 =?us-ascii?Q?NugvS9MOvxfQg1AtU9jqin2hdcS05ozLG/Crpi78BQ9udrsI3BpitxRujUFC?=
 =?us-ascii?Q?GJVXadOUkjuM/+vqej/mvceiolBqHTdh+owLHHEp/UGtHdy9ljn8Z9Hbr6PS?=
 =?us-ascii?Q?cY7unrIxqfswctfNd0ItLR7G4EqCcE+WU4dKphanqVMRcey3ZywFU6NuUDm4?=
 =?us-ascii?Q?3Ul+1B/DSfeCR9WwfdLbetTHJIMD3bfSK9/gsn9/ldvrmQ7nsk7LB4mOTyqG?=
 =?us-ascii?Q?EJ+Dk7ShG28HhLZXWk35emVCcln0wvkTBq10Y3EHgp3dkdouq2F6zgz0qKxB?=
 =?us-ascii?Q?usLpTpBllPJWu0jI/XRcIYy4s35HU0Nhejx/jbtZ2jw3th+12TGWzCWCqROD?=
 =?us-ascii?Q?rIAdO/kyri53yAfRlzYwCwYjIBVDCZFtN5KD3oaWjzlsLeI9E8O2Zq6O7zJf?=
 =?us-ascii?Q?0GZfBv/XJSBYvEQ2q12yDy9u2AYs3OnYhufVgdPWakRshZrE4guLsqB3snP+?=
 =?us-ascii?Q?SF4RIu03BUmIxTPJVh7gVoU8etuZC9shNcjo8BOQjUC4POp7rcixdCCyM4Nn?=
 =?us-ascii?Q?AwAYTjk3xwW4k8w9R+MTTPrzEdF4Jz9HwiqXkVKgFcuzv/LCDISusKWuiptG?=
 =?us-ascii?Q?iznLTQxbTanhNBk2PsdWv5PEDFuv9R3NT2CzC+b/qHdQX0E5lfFmZhsh8ciS?=
 =?us-ascii?Q?8MPZ+6Le8UIQTi0kpp/o3D6SCok7jOmrto3aaUMXPw93lJdRZIwFM2BP0vGw?=
 =?us-ascii?Q?V+ICT/v5NFFaqIPR9wE7yFn5N1erYIl0EMpK/kdhWG9Aa/FHzAftqFx+gYo2?=
 =?us-ascii?Q?1PkOOCZq3svFrfnC9AYBkUkohyTyvk+WXbzXEYQVjj2qpV27WGMreNKHXLIP?=
 =?us-ascii?Q?z0fe54DriZ1E6EYA+xsdJRIMRy+2nmx58v1ubExmm1EVkqGrU9JCVxi+5YZx?=
 =?us-ascii?Q?A/8p7KL2KifEIeA21UNg/ptZbD/XNdQsryan50hRlAXaOYxfIkjjprv3YBF0?=
 =?us-ascii?Q?nFGq1mutR+kpIT4s1GwotqPE88R1bwJdoxzx0yOiYiC9dnYjWjMyDojb7OuV?=
 =?us-ascii?Q?GbrdIeT2uSblrmFyeRqef2vcYs3yLVFuiIJ6B9u5uVkeqNMszYTRhEvyDf72?=
 =?us-ascii?Q?xvVIGjD2x4ajOFStfIK2k+YUz35ycOitVIndsRgesZ/WEQp44erAIfYFi28R?=
 =?us-ascii?Q?NjACBLEuJg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aebdf2f4-11b6-4655-f18d-08de7410111a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 01:49:09.2266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KAuFBJEvpHTX+sDZ+0atoy1sA7vp603UInZsUR1St5CNNVkZEajm2Z9LsG77ZrNXD1nvDZxiwjLes1r/FCk7Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10876

Hi Rob,

On Thu, Feb 19, 2026 at 08:41:59AM -0600, Rob Herring (Arm) wrote:
>i.MX93 contains an Arm Ethos-U65 NPU. The NPU uses the internal SRAM for
>temporary buffers. The SRAM is larger than 96KB, but that is all that is
>available to non-secure world.
>
>Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>---
>NXP folks, any comments on NPU freq? IIRC, the clock controller supports
>setting the freq to 1GHz. Is that supported?

NPU supports three freqs:
500MHz for Low Drive mode
800MHz for Nominal Drive mode
1GHz for Over drive mode

The NXP downstream choose nominal drive mode for peripherals,
in NXP downstream, there is a driver to do nominal and over drive
mode switch for the SoC at runtime(through sysfs interface by user), there
is no dedicated arm core voltage supply, there is only one vdd soc supply.

To avoid introduce complexity to various drivers, drivers use nomimal freq,
so OD->ND switch does not require drivers to update its own clock frequencies.

>---
> arch/arm64/boot/dts/freescale/imx93.dtsi | 23 +++++++++++++++++++++++
> 1 file changed, 23 insertions(+)
>
>diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
>index 7b27012dfcb5..d826d4b5a06b 100644
>--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
>+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
>@@ -43,6 +43,29 @@ map0 {
> 			};
> 		};
> 	};
>+
>+	sram: sram@20480000 {
>+		compatible = "mmio-sram";
>+		reg = <0x0 0x20480000 0x0 0x18000>;
>+		#address-cells = <1>;
>+		#size-cells = <1>;
>+		ranges = <0x0 0x0 0x20480000 0x18000>;
>+	};
>+
>+	soc@0 {
>+		npu@4a900000 {
>+			compatible = "fsl,imx93-npu", "arm,ethos-u65";
>+			reg = <0x4a900000 0x1000>;
>+			interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
>+			power-domains = <&mlmix>;
>+			clocks = <&clk IMX93_CLK_ML>, <&clk IMX93_CLK_ML_APB>;
>+			clock-names = "core", "apb";
>+			sram = <&sram>;
>+			assigned-clocks = <&clk IMX93_CLK_ML>, <&clk IMX93_CLK_ML_APB>;
>+			assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1>, <&clk IMX93_CLK_24M>;
>+			assigned-clock-rates = <800000000>, <24000000>;

APB could run at 133.3MHz.

Regards
Peng

>+		};
>+	};
> };
> 
> &aips1 {
>-- 
>2.51.0
>
