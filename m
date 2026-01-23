Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013018.outbound.protection.outlook.com [52.101.83.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468323093C0
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 15:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769182171; cv=fail; b=O5ulaG4UCdpuqSbhVEV/c3Fi6B3HJrp+Mbi8JmFAJ4Sln6Ggp0t3ydBF/mHYqh5X+hibFaHcEwuE83C0QoHsSdjagB4ix2nii3y2E98F1t0RXwezKD6LHoO4q8zK1ltzJWZnINK1W3QCVmt0hVI2StGsFSzu1Hvz1jn83cJWIdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769182171; c=relaxed/simple;
	bh=bWb2JypXulIHzkceJK+8DbbgN+pRUImCtJdfba8t4tQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bkeObBDvrN15ImaPchD3WMAQceSgCb/C5faHbOqojHsvo8hdC6MGA7v1BeKk/FMvrqV5NA26ZuMMkg8dGomysBf6PckJ+cecNj5uM/2y8XZRby0kDrSmf/AcjhOP+ah8J52yonC8TDB+nW75tQKu5XEd90XEeYeQImKgzZvtbX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jeaUbrsb; arc=fail smtp.client-ip=52.101.83.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jeaUbrsb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c2cTHfX5cgbWnSu5Au4yddJMcXndqtWl862L4DhTqRXQAJ7j/csfcGus7JiHi3g19O2QjBtH0bB+0ul4LbiQlaEo0eianjd+e8/rTC3/wfyIkscq178UOa8Cgi91jQNeQaA2g75v8qrCBFHcSvZiv0ReM/PGNAERxUakIfZliwGujqxoG/7giavMP4tkzcgk65874L1ItE1LDI3ed9JaaoA1HECIXl7IU8HB9TE128IToRUxwgHWwJe7a4Ou/c+tOI+vDfCGBPfb3qR7qPK6vWG9Dhb7g9Bo68qOLV076v/xUA0Da95xQxWyKf1XMZEtaoX191QLYHCwWsmHdGRmXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsBVzgznYT9flMc3Y57oCXdwNvWuBh/tgXUy8ybFGk0=;
 b=Kmy/JM+fZzz7vh8mehyB7ogXd71q1uEcd9AiLzXRWz6bjzr+9oA0aG5PIJ91igIGoqtpQkIdyF/rEz5B65WPMMcmqLvWFbtnlTdYRMSeQm2uF7/KAt3k0rJFPYod8IFmXGKBtQ08vjlmd/snkO/3tt97sPZmJA52JwmfZpXqb5fSP+0xGgw1GaTSGOvXavO07tRJsYYVSuigikYMhkCPAtDMhX771Ra5b8vMIDWZL9ee3xGsH/bn5pGTX57SwOjbdT7nXWgPZvUzs6cB1uySu16+ayhIUxF5TLCYN0d+MwMfvUeC/pJWq1zkxi4/BCcZU3NAsODel7SMXhUvVV2UwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsBVzgznYT9flMc3Y57oCXdwNvWuBh/tgXUy8ybFGk0=;
 b=jeaUbrsbdi7b2gfSN4RwNO27WpWqzOLYcHAlQx+noWh6v5TtmmQAX8Dz7aadiC8vtkAV5n8n+u9oMIBUJGeFDLR5RnR5F78o/C4QUsAAiYoHaiJVT11FLN0ePBzJk2qbNsQ4W+3cx24JAKGmeOugPBvIAYVsJyCZDXBpuFAWStP4XRY6i09OWL+Fi9sBbKgmYMc48Uw8fZYUND4d3+uDMWtD8QeTA/NT+aLJBmvQ5/Ml4p7I7LO6AxH42jaOqEmEt0r3IyU3ym+WdJrsxhjh9yrpoMKml5o7KWCcrk/DubJfbLpuG0bQnfFRRE9cai0aorFnoZuQGIGokHSHOr7+yQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com (2603:10a6:102:20c::5)
 by AM9PR04MB8953.eurprd04.prod.outlook.com (2603:10a6:20b:408::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Fri, 23 Jan
 2026 15:29:25 +0000
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5]) by PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5%3]) with mapi id 15.20.9499.005; Fri, 23 Jan 2026
 15:29:25 +0000
Date: Fri, 23 Jan 2026 10:29:16 -0500
From: Frank Li <Frank.li@nxp.com>
To: Yanan Yang <yanan.yang@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, qijian.guo@nxp.com,
	justin.jiang@nxp.com, Lei Xu <lei.xu@nxp.com>,
	Xiaofeng Wei <xiaofeng.wei@nxp.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: freescale: add NXP FRDM-IMX91S board
 support
Message-ID: <aXOTzHaLn6hFdMtR@lizhi-Precision-Tower-5810>
References: <20260123-imx91s-frdm-v4-0-1bab038faee9@nxp.com>
 <20260123-imx91s-frdm-v4-2-1bab038faee9@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-imx91s-frdm-v4-2-1bab038faee9@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0274.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::9) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8957:EE_|AM9PR04MB8953:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d243050-bbd4-4f3b-3974-08de5a9430b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|19092799006|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GpiciDFlDM/UfneyLNT+QziHDn2aJPez+/S+/p70nkwraciHQDv6LM+1UiUi?=
 =?us-ascii?Q?gTuRMbkJOEyZLuYRdt0XAsqbTg1rcnilZpRt1qwEwlQBfpLx+lrC5mH2C2B7?=
 =?us-ascii?Q?t0IVMHLq0/npNpht/WpsIcHFOG50gXZ0EugFgQMps5VjZ6oyqaAmWCCPl+R7?=
 =?us-ascii?Q?EjYegHSIiq3JIiXkoiRcw7+5PTZXKAEyt/QewbaDo6/U3xfrRu2pQFymt+4O?=
 =?us-ascii?Q?58ApFSrwY3CjqXzvQyIWI7tFE7eEsCJKfAo2xZvQzFG4LBrfC0JsdB8mXKrp?=
 =?us-ascii?Q?h5PBKMv468XdFnjDtjflBBXFF+ZS9OzTAHJRulJ3E1r+An3HI58LQ7I6CYdN?=
 =?us-ascii?Q?GZz1/O4EhPt12TrTKhOt2mZQQP0ahpSZhMfBAMFkpEQ/JdsHrPjwOr3b7zyP?=
 =?us-ascii?Q?LQKIyTUyNTo4pVWKxJbZ/FH2THsATrJSLC9iMaZKyilczJUPTsfCvQ7xoTn/?=
 =?us-ascii?Q?fAsa/aMa92Ayl/XRVHpCxv0Fo6ivax9JUXM4yBy3iOWltVAwPjxRTEIkEJfY?=
 =?us-ascii?Q?j0MwT74+vVEdQLHhAaikGq5FM5ZX4rIPr4xQX3qHLwfeei4FrgcyM08uaHxv?=
 =?us-ascii?Q?ER/c87/rGgLsRDoJtSL64xxGV9Qa+Tu/2EL/h1k6PiDqlRB5FDIl78x0zzxL?=
 =?us-ascii?Q?PcO34//BnRQAu5O+dLYrPaHXBtdnbSZNVeNWTZWQPauvMizjnORdlmwgIo/h?=
 =?us-ascii?Q?rpt3UHpfREv77noQBBGQkKtmmjQxIW9yjmdo892ifb42IwfNEnx4qNCQj6PJ?=
 =?us-ascii?Q?I5K5OXdQHYtCl8mLi5tCHJcWADYKXdx+ywsj+a8tU0apILRZAvvZtTKJ8NiE?=
 =?us-ascii?Q?7p72LUFNSeDTjohz9E3y/MCETxiYQ2DhYMO2zBAL+iJ070WjFu0hUcL9vcD5?=
 =?us-ascii?Q?rVOHhnraCqHv81/4aKvHTCBG1KoeOobGfumOGPQP0/ROrAQmZCVfOt6n7xGQ?=
 =?us-ascii?Q?PVJmFgPcjBp4C6kkkWO/Zs4dNClny9qv5c0pSw76wJqDMFn80EhkmK8hBYyQ?=
 =?us-ascii?Q?s11gXP8G4vQxrjzkfFUGT8xUS4+ujqwZLgoXujCnZDByth76JRFyB1oHUFoZ?=
 =?us-ascii?Q?96aYffwFo1ny26tomsY2UVEEhcPEL/qVK5Y7NXd1BrJeFAKHR6sM3bMz66RR?=
 =?us-ascii?Q?gWSCm64pMTALVq62ubI5HC9bA602f98z6mqPBtjGmhOTVwXFsDwtkUCK4Ecu?=
 =?us-ascii?Q?Kj7CaEjss33lvA54EU9o0g8gz3EE1IXVWrQAVGhnf5K+ZwDgDVp8XilLJ0F8?=
 =?us-ascii?Q?7bFLvzUEPXvaplBqhwo7OSHBYuKhutai90MyNR8Q8yVOvy2fgRXqrUeUJB/X?=
 =?us-ascii?Q?q/Hved8fkzRcgVabqoPNcQ9exKxJUW2435hrO5PLG0E0W6qLWlWxfXm+6cRH?=
 =?us-ascii?Q?zwLJvCIsGuMfZrP4/71Sq0eNwB2BuJMNiLZvfNhzR4syO4i5RY+Di1vdWaAj?=
 =?us-ascii?Q?FMZRLn7ah+jFFa+1OTXrHBEjh4xZYJM7XriskglYoqwnfiIj6YYSx9aYRgE4?=
 =?us-ascii?Q?9qUcs9kUXanjwUQRe2hSb2Kc61XcCaxd6AXQqM7RZcezmJ5cXE/EzO426QLl?=
 =?us-ascii?Q?uIL1gbg2PKfHwGSZxSmapfRksMWNtFNn4c0DKDyyGaPJf/S8X48B2DzUlAxF?=
 =?us-ascii?Q?0HkFMiON7DSSy9Ly59zUYsAcPnZSIwTlvR5u2o42//cU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8957.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6sLSL1GJK83+NKYzJK1Lfr8CHGEYAUJiFxug0nzhfyMPX+MqApJsj8xwWlYP?=
 =?us-ascii?Q?G0tNnuoPaj2VYMWeBwirMDNbeEjSe7I3nhkdx/mayH0zmGDgFPY5+Gb/1gvv?=
 =?us-ascii?Q?UZF+BISvpnV5JGoTT9GuX3wXj7wY4czDHEhtOmJ8DHl4ZSUfbKF0E0NOkZPt?=
 =?us-ascii?Q?MiVCQNC6kP400FbzoH/hZYrwMCm0ON6rBbTGaxLCa8JOcn1u+fZTKKKoBMXJ?=
 =?us-ascii?Q?eYNPL9ShKN8zZ6Lkoe+/mbdN3eZdL2ILJn/xHYovqcg5iAW7i7wbeyvKddRO?=
 =?us-ascii?Q?1KerJgVV4ufl251jMsn8bOmdOyPIoqNrgdpvu45PB3tclnecw1nKVxeNE+aB?=
 =?us-ascii?Q?twcy0MCziHI5fi7FqThZrInAn+UdgLiUrWLtgYrtz9rxvPvuCfwlf4GHmL1I?=
 =?us-ascii?Q?IL7vkurpZrin3lklpA1YCdP5aT+IWCJZksYnLqk9MyMtV+5pdy7IiBLtyazg?=
 =?us-ascii?Q?+JodbAsoj/l4/TqKzXddUHRScWfDu5+dR6lytmKZ7wPqOh1PCzilnxFNl1Jr?=
 =?us-ascii?Q?1gmK4Y16e32ABQxoZGhD6sLsWVeFhy+cRzTVqiqxlyAJ4q2jgQUTLB/17gv1?=
 =?us-ascii?Q?zMP3p4Qpb9+/9cw28N34RxlwTV57LsE2se/4XeYLLMsfA7ijr7xbu/hIHI+n?=
 =?us-ascii?Q?c9cwr0/V5ddCGd4mD53f0v/Ds5SrK/Mbx1V2qwM9YOgqwzMoassQz6rM2gGt?=
 =?us-ascii?Q?vDyug49NE3PrJ1GVXBlXKvoyAqDu8nPCzgu/n/4m54QxyaDZEWXbu4suAidF?=
 =?us-ascii?Q?+NTQhsCcSAr/Oqkq3tfTLKURbVfxdvL9Aa3PH10rkBFsHdgvRqQS8lo37Apm?=
 =?us-ascii?Q?qKdOsVr0j/Fmmoj4lZiBSCUQYvyY0Hc8nmFhiPLdxMwjfnMArchZ8PMi6Bo1?=
 =?us-ascii?Q?RKLTn5F0Jt4H7b+pJHLVFn0czy4pAO2AWSGImFy2sgzx5Ikj4xw1aVbP14A7?=
 =?us-ascii?Q?S/Ec4dp1Bvl0Mx4/hpZGEIeahjQEYEAZHKC2BEzMYiTOhVPhZT5YBinntyRE?=
 =?us-ascii?Q?Q7sf4rPUIcVN2sKIfKemgT39VuITfmQN5LshjcKJqcvfxhiycIiuWskU58TR?=
 =?us-ascii?Q?hdT1Y6BdqmnmxJ6J78zS3uJnKwwAGTNQF38S+0w1iInRYA0d7ANHZy+id47t?=
 =?us-ascii?Q?s9nRfGahjZZmjqbakjesYjYntrK/wFqyyntmUNAJylRCxW5wsMyUh9Umrs/S?=
 =?us-ascii?Q?+r1IE/wYI5qgtjov3XpcayeY//LcretDMRUtv57RG+j+DPYej1N1wPoQld7v?=
 =?us-ascii?Q?YoFJ1gsa81RocvqzDC/P7nju3bTHYGjPVg57EpVeW5QEcNs8xBoyRba4/Rwb?=
 =?us-ascii?Q?L3hVOrn3ng0nBvG7QDTXPdnxBQxGTus30dPXb6fB2meocpWIrIw+OTSEh4qn?=
 =?us-ascii?Q?7jKWp5WS/zBoJieADf05+GWcSBNxR7IgdsN453n8SsNjC4EmNuaCnPe58/NL?=
 =?us-ascii?Q?c8/2RT/YVVWKbqhXZjgfVEu+BJAZO/KTZyKDeaBbqZgN1X/T1q1I7GLq+ARS?=
 =?us-ascii?Q?SA++4GlriIIwq5FQ36SQOaidikbtv/FRs+vcq6A1ONg8BQQij0YjXc7bRdGr?=
 =?us-ascii?Q?N2AOKbXl5JysvA8z4ZUIjjNCr3zkW6or5gO0en5Gzk0XE8lerDYGWaGoLYiA?=
 =?us-ascii?Q?NwdTnCkp20elKxVBjrPrJW9j8IxjnONYF7NikEw1vXcq7LhztdLH6SXh5sSN?=
 =?us-ascii?Q?SZ4DIt8X+47aKqKe4dwCn6uf+1/T9kJkDh91tLqpwQPp8j8B?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d243050-bbd4-4f3b-3974-08de5a9430b1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 15:29:25.6753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PuOBoU+kXUXagsF/IVpzx+kOibbWMIPaoR9geN9woTVgM67DYkJ5J/40lE8sRL2Pz+Kc5DlYXSonG6C9Z3kL0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8953

On Fri, Jan 23, 2026 at 03:42:00PM +0900, Yanan Yang wrote:
> Add DeviceTree support for the NXP FRDM-IMX91S development board based
> on the i.MX91 SoC. FRDM-IMX91S is a cost-optimized variant of FRDM-IMX91
> and differs in memory, storage, Ethernet, and PMIC configuration:
>
> - 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
> - 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
> - Single GbE port (FRDM-IMX91 has dual GbE)
> - PMIC PF9453 (FRDM-IMX91 uses PCA9451A)
>
> This DT enables:
> - ADC1
> - UART1 and UART5
> - I2C bus and children nodes
> - USB and related nodes
> - uSDHC1 and uSDHC2
> - FlexSPI NAND flash
> - Watchdog3
> - Ethernet (eqos)
> - FlexCAN
> - MQS
>
> Link: https://www.nxp.com/design/design-center/development-boards-and-designs/FRDM-IMX91S
> (FRDM-IMX91S board page)
> Link: https://www.nxp.com/design/design-center/development-boards-and-designs/FRDM-IMX91
> (FRDM-IMX91 board page)
>
> Co-developed-by: Lei Xu <lei.xu@nxp.com>
> Signed-off-by: Lei Xu <lei.xu@nxp.com>
> Co-developed-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
> Signed-off-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
> Signed-off-by: Yanan Yang <yanan.yang@nxp.com>
>
> ---
...
> +
> +&iomuxc {
> +	bootph-pre-ram;
> +	bootph-some-ram;
> +
> +	pinctrl_eqos: eqosgrp {
> +		fsl,pins = <
> +			MX91_PAD_ENET1_MDC__ENET1_MDC                           0x57e
> +			MX91_PAD_ENET1_MDIO__ENET_QOS_MDIO                      0x57e
> +			MX91_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0                  0x57e
> +			MX91_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1                  0x57e
> +			MX91_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2                  0x57e
> +			MX91_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3                  0x57e
> +			MX91_PAD_ENET1_RXC__ENET_QOS_RGMII_RXC                  0x5fe
> +			MX91_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL            0x57e
> +			MX91_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0                  0x57e
> +			MX91_PAD_ENET1_TD1__ENET1_RGMII_TD1                     0x57e
> +			MX91_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2                  0x57e
> +			MX91_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3                  0x57e
> +			MX91_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK  0x5fe
> +			MX91_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL            0x57e
> +		>;
> +	};

Plese usb tab before number.

Frank
> +
...
> +&wdog3 {
> +	pinctrl-0 = <&pinctrl_wdog>;
> +	pinctrl-names = "default";
> +	fsl,ext-reset-output;
> +	status = "okay";
> +};
>
> --
> 2.43.0
>
