Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013048.outbound.protection.outlook.com [40.107.159.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9610D25B1D2
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 15:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769181771; cv=fail; b=jvuo6iNh6L+j+CycWhr7758Z8dtm3Xl2vN7KGWyBSr4MIqmDNyGsNw3dSYKHkxtZrgDSvUrNiurlGp0HAzF7gmzCRDM5V45HHzPGZUHut23DslQXwRHvPG9aFG+01sRpW+pp5KDbmYKhCRT1ImaH/8MF1cOaqkKYuKFqh+hji08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769181771; c=relaxed/simple;
	bh=94etdN4eViTgs9PvCorfh+zsBf1fllOOcViT5k26nK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OB5W5pGpa7dG3YRO1aJTz6K23sxohTld7Q0wDBWJhGbO8ScbFWodjrkKzWevndNvzcuWSuitgJuuoyqzSMIta0+0NPnsLipssQwwrUj0kGY6fc2Sz0vAsq/K/e8mFV5FC1yGU2uQAOQaBgJXnN9xD9s5CJ6L7CikcW1NbWJkRTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oLKuoog9; arc=fail smtp.client-ip=40.107.159.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oLKuoog9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tB8t32RdqHnLuY5P10i8bE/yXow7/JAwXNmsaO76K9sljQjZ0CU8GvGMvP5VmUv/IwnMWI5jSLcSWgl1cyh9mzaoLUzcODGN0FALQkCt8aaYMt59UuuysQkQdi84M8m1lIDpAnr5M7aWa+xqNjmOWKQkxjKg+RSx9UYFz9nOGWT52tjNus7hsRirMkGPCd2TeQ3jvBpAuNgAyobSylRRJFMyvEknSlrRppgR3Gek/jFxM3hIuj8uG9GHtOO7YrCKOuTyCELeM0jeOpZyltGkytXgq0oOV2P1ovsB+96GroeG6ynbIqVwSbFzQN19fKy1/jg4xobq48AkTSbev0jtiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQSwQsvJNSqCrNHPUj6azGBJJODv8J9ahKD5g5e1SIc=;
 b=OO5v2iVg9sg9IFoVHI68/X0Nkcib2IjDhHWw18/i5s36cjZ+2LxdCUBIe6v5W+uLL7ftACN6F/m5YszxwyLO9Cl4jFd8/WdtkGzct8Ovpdp48V5lKNnE5vfHIr+nfG74+Lqo62FqnKFb22Vu6Deec3emJ1WrRTEi7JvbO+c5NW7vynIZwjjEQzGk8t7ptJoswdC0MgkB66EvIyXTLQHnhjcDCCO74hx7KHXA71pThRKU4kGHyCzQkgRPYLUAOkfk59EfJoTY4pPi7x86OIllVAfacLFKRqRM7X4CSpqmpl/LcpuOyCqOph+6dWK6xCp5yiL+eAsnUSPXI6iH3MNZwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQSwQsvJNSqCrNHPUj6azGBJJODv8J9ahKD5g5e1SIc=;
 b=oLKuoog9Rv6v7agU9EaRs4KWazabsm6QodAGEbbF7UeL4/k/1U2xzmp5RjlIynAWH4PGVGZkFw/kCGGhIwxLfozI3LW4NYPpM3ecj9Bv+8nxN0rsMXiONfndQbjKIHiSriyq0FsQYID60qbugHRvC+cqQwfUB59VVPKmwafgtFfM1ZphNlHN5dvIHgphM/mi8Z+kkdSJ+Oz4ihogO86V/bnaK26Zbo3UUjaQq2RUV1VkXqMb+NzU7GK2WDBvHSsbfITANvo/qe+n1EQpVbgiR4yQNQwLnujiIxpS/jjCVUqHwq8s655hGcpvzuSXpyhV/BtRY+AgfCh2qBwIF4s3jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com (2603:10a6:102:20c::5)
 by DU4PR04MB10434.eurprd04.prod.outlook.com (2603:10a6:10:55e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Fri, 23 Jan
 2026 15:22:46 +0000
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5]) by PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5%3]) with mapi id 15.20.9499.005; Fri, 23 Jan 2026
 15:22:46 +0000
Date: Fri, 23 Jan 2026 10:22:37 -0500
From: Frank Li <Frank.li@nxp.com>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 5/5] arm64: dts: freescale: Add the GOcontroll
 Moduline Mini
Message-ID: <aXOSPaib7Xw/qDyd@lizhi-Precision-Tower-5810>
References: <20260123-mini_iv-v5-0-29bef040f236@gocontroll.com>
 <20260123-mini_iv-v5-5-29bef040f236@gocontroll.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-mini_iv-v5-5-29bef040f236@gocontroll.com>
X-ClientProxiedBy: BYAPR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:40::33) To PAXPR04MB8957.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8957:EE_|DU4PR04MB10434:EE_
X-MS-Office365-Filtering-Correlation-Id: 4245d1a5-1af7-4520-a48e-08de5a934292
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f6vnGL7iYnLIw3Y3tTtAa0Z+3PnBVkAdKbeCbWISu8jYr8TgTnLYuj9EWEwZ?=
 =?us-ascii?Q?uCRACxNJ+VwUkYuQmbYNt+mIANiKMitkcl5Cu6S6dNJfXjSxyTljoitzXyrU?=
 =?us-ascii?Q?IPP4kZ8o7fS99VjvEGkVHFBgcFiuYK9PLzv0ytQvcAm87eRRBLIoDn2eAiW3?=
 =?us-ascii?Q?xxw2k0k8gKOidmmBtnfJOyNI4iHDYVdB1aYlLiYH3s1qWZElEYNeBXeSHNkk?=
 =?us-ascii?Q?1IV2yJTKqUlDGgNnAvewuBxtx2UI3aU/hwNuHDSz8ElttREYoESzd6y6UvAZ?=
 =?us-ascii?Q?d/lr3EryK4SB3z0WqkuzP6mPyDKVyCI/cWuMrjop9aUkrecno36seP9O0nbe?=
 =?us-ascii?Q?ugmdD/GkVJAXLPQ3N+sE4QmygId36iG5F8D3dUyEpiY3krfGwJZ0tLumKn0s?=
 =?us-ascii?Q?U48ZP0IiuszDxvFoEsXj6p1RLsx5rCpV35KVs0+DMId7L22Bf9//ua5WWhY2?=
 =?us-ascii?Q?NXCW4FmQ27lPoif0HA3Aj60mZaKwbXmtB+EWMxJ8tgkmkhXa3gtK4SWUAeXl?=
 =?us-ascii?Q?lWVSI6IfXMF8pIGc7Aak2JQhVpaNEE/lwZrEaEK89MvmBP8O+XUakyXk6pO5?=
 =?us-ascii?Q?vWwoZ24oWY9IpU9HNCHLDsC3YqiPtPhs9DvqiqQ5IFxgQbpMy/hkizt4a7RH?=
 =?us-ascii?Q?ucrQlkzGkeu2+yJgd0BlGPjMK6HoUQMeI9oPjAZ/yFvobIY5rHgDmjQHaf6w?=
 =?us-ascii?Q?Ddp470SSnIi/piR+mOJXBe0EZM2YwhJjlY32b0QSPjcDI2p2TdcFtANiT7b/?=
 =?us-ascii?Q?wpKtFD3vqKBb9MBASumjvMe56QF6npk1RsCjq+knhkjXccsNtErfEGNpIo3a?=
 =?us-ascii?Q?V4u6xV9J98lHQv/7HZ+Lo1muaf1NcsE62OAWUZfa5ThILBtxSJyTcuyo5+aF?=
 =?us-ascii?Q?4lp+cMbEnJf+8tKmbrZBjxdI04lZ7rzNZlpQ7Aet0JkR9BxhuhIotHPmFWu/?=
 =?us-ascii?Q?p5hcfKseZnxvoMAWePcKnJ0MBPeF0oaHabpgtRwyldZmpBsovY61Q6/gUgH8?=
 =?us-ascii?Q?xxkgRQUk+upKodYIlSqXBBZGEyq51T/hF/0ApdmCzWl6wiuLk0xvNsIFKUYM?=
 =?us-ascii?Q?BSB4kdk8ZXRzYDqXX9PWFILtkKFb2/Na58eMIHTFQGm9E2QDcY9Tx2/HaxcH?=
 =?us-ascii?Q?VNNASzt8IsU89WzvHYKDapWeP6WXwQbt1fpr1Et+nEjQ/mhRHzHA72sTKbOW?=
 =?us-ascii?Q?3DpAHgOQ3kHqFrLuUWaaGnM9zr0QgM3xif+wZKoYkyhYF6Dnq1NpABS+S53b?=
 =?us-ascii?Q?fK6gbHyHovMe2CqEu9QSFzjFVEmFqICf/GpS5g/DWvI8w9HUY+I46n6KssOg?=
 =?us-ascii?Q?VmufckPdnkaSlM0QoIfnbTm4Ss3Z/Eclb7VgGYJ/xI5jR4YupFd9tH+/jMPq?=
 =?us-ascii?Q?gwh9ejKf9CorTk68RE78MbT22u+CgU3lBCnJbas5puqjTPlekAvvcF1QgQgD?=
 =?us-ascii?Q?R80q4fBIhLsFGvCdQMfyRee2ZQQuyGlYHuhFavYlhJwwL0+e+Ct6BBmOwDYx?=
 =?us-ascii?Q?nX4PJuh8CvSHFMvczm0mSruks7U6CtOmEVssm2wTyGaRQhDiiA4SqePqRFtZ?=
 =?us-ascii?Q?r9tZdT4NKEgBmOGhFJQrVyI9G6ZamYVAB2Ct/34UzOtAFPFGJS/Vil90HAeq?=
 =?us-ascii?Q?5mvZt27ZiRShTj0+iN9TVnY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8957.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ntiORGF+gi93WdMI4Ko+QvokpMFFKhy+LgYxTbS3aNvI1CpSXD9dAH85Ael+?=
 =?us-ascii?Q?YqJBAeKiPWsjvozyRl8fq1WaX11X6Tc5LPmDZawfLqPmmHRWHRDBWhY0GG0e?=
 =?us-ascii?Q?o2t07R9EsqZ3MJzVVxL3ISEcG8PVIUyLoC9mzBuHTNCwgTkxT+eDTagqe4wO?=
 =?us-ascii?Q?epTM/rFrrTM7gVQO1UZ8nkaNc1QXotJC5s/NUpYoWI8TmJyI8DXaAkixVPZs?=
 =?us-ascii?Q?vkpcyytd8oaUMWf0vaPQItdHjPqhst1WpO51PyIIYqQ6Y2U0nlvxpdWU6kI6?=
 =?us-ascii?Q?jrF1er/jmZu+zVv+CG5PmgXdznjjxyZjd9y6FrYbCwPs+dNhBcVvglrHEZp9?=
 =?us-ascii?Q?+dQyN9F89oL9r3p/ZXtA3AimXul31OjQRnkPrRWL/O2v7IuVu4odzrBkd/48?=
 =?us-ascii?Q?L0V3M2CijpjpUihxizLD1yn/h05JDyvx852Vp8r1woaezxPX8ghMnGuXw/YA?=
 =?us-ascii?Q?eZpANkkUREi8tgPJiaz25zks359/T5Du9cjuTSfvfGhuhm4C1BuL0DiOKkR6?=
 =?us-ascii?Q?YtxU//m0y82ttLgG1Chr278AqEbWBJ+W8Kgp/5XMaRQbWDIQWJfbrxDJQHGY?=
 =?us-ascii?Q?cRbeGYLn8CI1PJcrLbSEdska+YO4KVJqL/WY0EO8sZat89v3yTwN6V2+MQXS?=
 =?us-ascii?Q?IwM35SNoZzF+qK4L2WJgl/e9ca1FcY6Y4rpmAV+qkh8IrH2TONANY/I/vjak?=
 =?us-ascii?Q?Qr15NAlw9yRJVgZzFrqqkUVQoRvSglube1bZ0Zzdk2NC7aayzZfmiBIa11rb?=
 =?us-ascii?Q?0tUpiWlfZUyMoD4Wu8+ZIWXnejiymihm+mthk+WaICIlhzzJPygcCJgrYCIM?=
 =?us-ascii?Q?3AMXIiYfHf/RCeIGLh+IVwQ0hkh6UF2nqp9vUvyuto9hzHgd4+JsAN/Xtu3u?=
 =?us-ascii?Q?/1UcF/+LX1KtRVueNrTPPVSBmgkr6/4ZnB+JVxbRBHL7zmO+Q9dZ5jXu4c4V?=
 =?us-ascii?Q?7iJ5/qsfk2Xm74AvG8h15tuE+3JQR6gRqp2jgysjELdEvTyz2OC8GZRKsRAL?=
 =?us-ascii?Q?VAKjRrM5wva73oudYcZc/cOImLIwYfzCl9ARBcmakJfqQ+b4IeMyiWbhWG6q?=
 =?us-ascii?Q?nfAgFtwQzOShkhbQ0ORiUmqdExUoxv03BcCSVTrDc7LB5TEFjE1i82KyxGtG?=
 =?us-ascii?Q?+LTX1EZdoj+aFej1Gz+Y6CS+cH1D5NXKCWEltADEuyNJZvKPKNqsL8IyBxJM?=
 =?us-ascii?Q?+s0ozoKxAwRCDHCKah2SP0U80kyJ8A4kCO4wegdSJ/3fYq7r9/0qAXXbTV8h?=
 =?us-ascii?Q?qA3JxJvvtO0L3ytzOwcp+gqm1kqBd/jbSuMjiRsmG38a7nLabQmJjxmODutR?=
 =?us-ascii?Q?p0pr5T79wMdOarrUV4D7CLRlgmbNLRBEk8ZT2P2Eq+hUP12w/O8zldZ1PTBS?=
 =?us-ascii?Q?kio028VYbtm5AQzPlBe2sBl1uVW0vaMFqDmkNwpFj5t6KJAtQVDEskE1SVFT?=
 =?us-ascii?Q?98TdDCZ8Rw7N2juaUpUHTOqvXW95SP75+qUBg/yrniaXDicQ4xGRqFUMV+Fs?=
 =?us-ascii?Q?aYVO/7bAE6MdBkXKvSabnyIh00FAr7SZuxn1QhmB8bzgZvGs/RCn6LXxllfz?=
 =?us-ascii?Q?2J165SedthWE6imLN4ZiyRKMrRIvAc1KS6rVU2uwK5LASSY8VdugmvRZ7YqW?=
 =?us-ascii?Q?RxRMFjV1nGGO9W6c5Vu0U7P4n2MBMBh+s/b2Sl+1SeRyQwaSwar5OplI6xbZ?=
 =?us-ascii?Q?P/FOixPz47lubEgPWIMHDjP8Cz4iqWpqaMl6sHAFGTGVXAXeJthsD3mbE/sh?=
 =?us-ascii?Q?7WIXT+jRsQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4245d1a5-1af7-4520-a48e-08de5a934292
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8957.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 15:22:45.9578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RTRB1bh5KKMJnOCC6XcsQS0kVM1yFJXNezEZpsQSqfZ+Sulzm1WfvEGjlh3mciv+Jt6Rhv4yTkl+EH4AxQEjmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10434

On Fri, Jan 23, 2026 at 09:30:32AM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Moduline Mini is a part of the wider GOcontroll Moduline ecosystem. These
> are embedded controllers that focus on modularity with their swappable IO
> modules.
>
> Features:
> - up to 4 Moduline IO modules
> - 2 CAN busses
> - 1 Ethernet
> - 4 RGB leds
> - 1 3D accelerometer
> - optional Wi-Fi/Bluetooth
> - optional 4G/GPS
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |   1 +
>  .../imx8mm-tx8m-1610-moduline-mini-111.dts         | 686 +++++++++++++++++++++
>  2 files changed, 687 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 0b4c7cc6d062..55275a4fe94b 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -127,6 +127,7 @@ imx8mm-evkb-pcie-ep-dtbs += imx8mm-evkb.dtb imx-pcie0-ep.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-evk-pcie-ep.dtb imx8mm-evkb-pcie-ep.dtb
>
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-tx8m-1610-moduline-iv-306-d.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mm-tx8m-1610-moduline-mini-111.dtb
>
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-icore-mx8mm-ctouch2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-icore-mx8mm-edimm2.2.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-mini-111.dts b/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-mini-111.dts
> new file mode 100644
> index 000000000000..a570a521f43e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-mini-111.dts
> @@ -0,0 +1,686 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Maud Spierings <maudspierings@gocontroll.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "imx8mm-tx8m-1610.dtsi"
> +#include <dt-bindings/leds/common.h>

Generally, include "" should be after <>

Frank
> +
> +/ {
> +	chassis-type = "embedded";
> +	compatible = "gocontroll,moduline-mini-111", "karo,imx8mm-tx8m-1610", "fsl,imx8mm";
> +	hardware = "Moduline Mini V1.11";
> +	model = "GOcontroll Moduline Mini";
> +
> +	aliases {
> +		spi0 = &ecspi2; /* spidev number compatibility */
> +		spi1 = &ecspi3; /* spidev number compatibility */
> +		spi2 = &ecspi1; /* spidev number compatibility */
> +	};
> +
> +	chosen {
> +		stdout-path = "serial2:115200n8";
> +	};
> +
> +	mcp_clock: mcp-clock {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <20000000>;
> +	};
> +
> +	reg_3v3_comm: regulator-3v3-communication {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpio = <&gpio1 11 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&pinctrl_reg_comm>;
> +		pinctrl-names = "default";
> +		power-supply = <&reg_6v4>;
> +		/* also powers the cellular modem which can't vote on the regulator */
> +		regulator-always-on;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "3v3_comm";
> +	};
> +
> +	reg_5v0: regulator-5v0 {
> +		compatible = "regulator-fixed";
> +		power-supply = <&reg_6v4>;
> +		regulator-always-on;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-name = "5v0";
> +	};
> +
> +	reg_6v4: regulator-6v4 {
> +		compatible = "regulator-fixed";
> +		regulator-always-on;
> +		regulator-max-microvolt = <6400000>;
> +		regulator-min-microvolt = <6400000>;
> +		regulator-name = "6v4";
> +	};
> +
> +	reg_can1_stby: regulator-can1-stby {
> +		compatible = "regulator-fixed";
> +		gpio = <&gpio2 12 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&pinctrl_can1_reg>;
> +		pinctrl-names = "default";
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "can1-stby";
> +	};
> +
> +	reg_can2_stby: regulator-can2-stby {
> +		compatible = "regulator-fixed";
> +		gpio = <&gpio3 15 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&pinctrl_can2_reg>;
> +		pinctrl-names = "default";
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "can2-stby";
> +	};
> +
> +	wifi_pwrseq: wifi-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		pinctrl-0 = <&pinctrl_wl_reg>;
> +		pinctrl-names = "default";
> +		post-power-on-delay-ms = <100>;
> +		power-off-delay-us = <500000>;
> +		reset-gpios = <&gpio5 28 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&ecspi1 {
> +	cs-gpios = <&gpio4 27 GPIO_ACTIVE_LOW>,
> +		   <&gpio3 23 GPIO_ACTIVE_LOW>,
> +		   <&gpio3 1 GPIO_ACTIVE_LOW>;
> +	pinctrl-0 = <&pinctrl_ecspi1>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	connector@0 {
> +		compatible = "gocontroll,moduline-module-slot";
> +		reg = <0>;
> +		i2c-bus = <&i2c2>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&gpio4 28 GPIO_ACTIVE_LOW>;
> +		slot-number = <3>;
> +		spi-max-frequency = <54000000>;
> +		sync-gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
> +		vddhpp-supply = <&reg_6v4>;
> +		vddp-supply = <&reg_5v0>;
> +		vdd-supply = <&reg_vdd_3v3>;
> +	};
> +
> +	connector@1 {
> +		compatible = "gocontroll,moduline-module-slot";
> +		reg = <1>;
> +		i2c-bus = <&i2c2>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <19 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&gpio3 21 GPIO_ACTIVE_LOW>;
> +		slot-number = <4>;
> +		spi-max-frequency = <54000000>;
> +		sync-gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
> +		vddhpp-supply = <&reg_6v4>;
> +		vddp-supply = <&reg_5v0>;
> +		vdd-supply = <&reg_vdd_3v3>;
> +	};
> +
> +	adc@2 {
> +		compatible = "microchip,mcp3004";
> +		reg = <2>;
> +		spi-max-frequency = <2300000>;
> +		vref-supply = <&reg_vdd_3v3>;
> +	};
> +};
> +
> +&ecspi2 {
> +	cs-gpios = <&gpio3 24 GPIO_ACTIVE_LOW>,
> +		   <&gpio3 9 GPIO_ACTIVE_LOW>;
> +	pinctrl-0 = <&pinctrl_ecspi2>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	can@0 {
> +		compatible = "microchip,mcp25625";
> +		reg = <0>;
> +		clocks = <&mcp_clock>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <22 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-0 = <&pinctrl_can1>;
> +		pinctrl-names = "default";
> +		spi-max-frequency = <10000000>;
> +		vdd-supply = <&reg_vdd_3v3>;
> +		xceiver-supply = <&reg_can1_stby>;
> +	};
> +
> +	can@1 {
> +		compatible = "microchip,mcp25625";
> +		reg = <1>;
> +		clocks = <&mcp_clock>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-0 = <&pinctrl_can2>;
> +		pinctrl-names = "default";
> +		spi-max-frequency = <10000000>;
> +		vdd-supply = <&reg_vdd_3v3>;
> +		xceiver-supply = <&reg_can2_stby>;
> +	};
> +};
> +
> +&ecspi3 {
> +	cs-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>,
> +		   <&gpio1 2 GPIO_ACTIVE_LOW>;
> +	pinctrl-0 = <&pinctrl_ecspi3>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	connector@0 {
> +		compatible = "gocontroll,moduline-module-slot";
> +		reg = <0>;
> +		i2c-bus = <&i2c2>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <10 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
> +		slot-number = <1>;
> +		spi-max-frequency = <54000000>;
> +		sync-gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
> +		vddhpp-supply = <&reg_6v4>;
> +		vddp-supply = <&reg_5v0>;
> +		vdd-supply = <&reg_vdd_3v3>;
> +	};
> +
> +	connector@1 {
> +		compatible = "gocontroll,moduline-module-slot";
> +		reg = <1>;
> +		i2c-bus = <&i2c2>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&gpio5 21 GPIO_ACTIVE_LOW>;
> +		slot-number = <2>;
> +		spi-max-frequency = <54000000>;
> +		sync-gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
> +		vddhpp-supply = <&reg_6v4>;
> +		vddp-supply = <&reg_5v0>;
> +		vdd-supply = <&reg_vdd_3v3>;
> +	};
> +};
> +
> +&gpu_2d {
> +	status = "disabled";
> +};
> +
> +&gpu_3d {
> +	status = "disabled";
> +};
> +
> +&i2c2 {
> +	clock-frequency = <400000>;
> +	pinctrl-0 = <&pinctrl_i2c2>;
> +	pinctrl-1 = <&pinctrl_i2c2_gpio>;
> +	pinctrl-names = "default", "gpio";
> +	scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +};
> +
> +&i2c3 {
> +	clock-frequency = <400000>;
> +	pinctrl-0 = <&pinctrl_i2c3>;
> +	pinctrl-1 = <&pinctrl_i2c3_gpio>;
> +	pinctrl-names = "default", "gpio";
> +	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +
> +	lp5012@14 {
> +		compatible = "ti,lp5012";
> +		reg = <0x14>;
> +		vled-supply = <&reg_6v4>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		multi-led@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0>;
> +			color = <LED_COLOR_ID_RGB>;
> +			label = "case-led1";
> +
> +			led@0 {
> +				reg = <0>;
> +				color = <LED_COLOR_ID_RED>;
> +			};
> +
> +			led@1 {
> +				reg = <1>;
> +				color = <LED_COLOR_ID_GREEN>;
> +			};
> +
> +			led@2 {
> +				reg = <2>;
> +				color = <LED_COLOR_ID_BLUE>;
> +			};
> +		};
> +
> +		multi-led@1 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <1>;
> +			color = <LED_COLOR_ID_RGB>;
> +			label = "case-led2";
> +
> +			led@0 {
> +				reg = <0>;
> +				color = <LED_COLOR_ID_RED>;
> +			};
> +
> +			led@1 {
> +				reg = <1>;
> +				color = <LED_COLOR_ID_GREEN>;
> +			};
> +
> +			led@2 {
> +				reg = <2>;
> +				color = <LED_COLOR_ID_BLUE>;
> +			};
> +		};
> +
> +		multi-led@2 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <2>;
> +			color = <LED_COLOR_ID_RGB>;
> +			label = "case-led3";
> +
> +			led@0 {
> +				reg = <0>;
> +				color = <LED_COLOR_ID_RED>;
> +			};
> +
> +			led@1 {
> +				reg = <1>;
> +				color = <LED_COLOR_ID_GREEN>;
> +			};
> +
> +			led@2 {
> +				reg = <2>;
> +				color = <LED_COLOR_ID_BLUE>;
> +			};
> +		};
> +
> +		multi-led@3 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <3>;
> +			color = <LED_COLOR_ID_RGB>;
> +			label = "case-led4";
> +
> +			led@0 {
> +				reg = <0>;
> +				color = <LED_COLOR_ID_RED>;
> +			};
> +
> +			led@1 {
> +				reg = <1>;
> +				color = <LED_COLOR_ID_GREEN>;
> +			};
> +
> +			led@2 {
> +				reg = <2>;
> +				color = <LED_COLOR_ID_BLUE>;
> +			};
> +		};
> +	};
> +
> +	accelerometer@18 {
> +		compatible = "st,lis2dw12";
> +		reg = <0x18>;
> +		interrupt-parent = <&gpio5>;
> +		interrupts = <3 IRQ_TYPE_EDGE_RISING>, <5 IRQ_TYPE_EDGE_RISING>;
> +		pinctrl-0 = <&pinctrl_lis_int>;
> +		pinctrl-names = "default";
> +		vddio-supply = <&reg_vdd_3v3>;
> +		vdd-supply = <&reg_vdd_3v3>;
> +	};
> +
> +	humidity-sensor@5f {
> +		compatible = "st,hts221";
> +		reg = <0x5f>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <10 IRQ_TYPE_EDGE_RISING>;
> +		pinctrl-0 = <&pinctrl_hts_int>;
> +		pinctrl-names = "default";
> +		vdd-supply = <&reg_vdd_3v3>;
> +	};
> +};
> +
> +&iomuxc {
> +	pinctrl_bt: btgrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_GPIO1_IO01_GPIO1_IO1
> +				MX8MM_DSE_X1
> +			MX8MM_IOMUXC_SAI5_MCLK_GPIO3_IO25
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE | MX8MM_HYS_SCHMITT)
> +			MX8MM_IOMUXC_ECSPI2_SS0_GPIO5_IO13
> +				MX8MM_DSE_X1
> +		>;
> +	};
> +
> +	pinctrl_can1: can1grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SAI2_TXC_GPIO4_IO25
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +			MX8MM_IOMUXC_SAI5_RXD1_GPIO3_IO22
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE | MX8MM_HYS_SCHMITT)
> +		>;
> +	};
> +
> +	pinctrl_can1_reg: can1reggrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12
> +				(MX8MM_DSE_X2 | MX8MM_FSEL_FAST | MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_can2: can2grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_NAND_CLE_GPIO3_IO5
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +			MX8MM_IOMUXC_NAND_DATA00_GPIO3_IO6
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE | MX8MM_HYS_SCHMITT)
> +		>;
> +	};
> +
> +	pinctrl_can2_reg: can2reggrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_NAND_RE_B_GPIO3_IO15
> +				(MX8MM_DSE_X2 | MX8MM_FSEL_FAST | MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_ecspi1: ecspi1grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_ECSPI1_MOSI_ECSPI1_MOSI
> +				MX8MM_DSE_X4
> +			MX8MM_IOMUXC_ECSPI1_MISO_ECSPI1_MISO
> +				(MX8MM_DSE_X4 | MX8MM_HYS_SCHMITT)
> +			MX8MM_IOMUXC_ECSPI1_SCLK_ECSPI1_SCLK
> +				MX8MM_DSE_X4
> +			MX8MM_IOMUXC_SAI2_MCLK_GPIO4_IO27
> +				MX8MM_DSE_X1
> +			MX8MM_IOMUXC_SAI5_RXD2_GPIO3_IO23
> +				MX8MM_DSE_X1
> +			MX8MM_IOMUXC_NAND_CE0_B_GPIO3_IO1
> +				MX8MM_DSE_X1
> +		>;
> +	};
> +
> +	pinctrl_ecspi2: ecspi2grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_ECSPI2_MOSI_ECSPI2_MOSI
> +				MX8MM_DSE_X4
> +			MX8MM_IOMUXC_ECSPI2_MISO_ECSPI2_MISO
> +				(MX8MM_DSE_X4 | MX8MM_HYS_SCHMITT)
> +			MX8MM_IOMUXC_ECSPI2_SCLK_ECSPI2_SCLK
> +				MX8MM_DSE_X4
> +			MX8MM_IOMUXC_SAI5_RXD3_GPIO3_IO24
> +				MX8MM_DSE_X1
> +			MX8MM_IOMUXC_NAND_DATA03_GPIO3_IO9
> +				MX8MM_DSE_X1
> +		>;
> +	};
> +
> +	pinctrl_ecspi3: ecspi3grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_UART1_TXD_ECSPI3_MOSI
> +				MX8MM_DSE_X4
> +			MX8MM_IOMUXC_UART2_RXD_ECSPI3_MISO
> +				(MX8MM_DSE_X4 | MX8MM_HYS_SCHMITT)
> +			MX8MM_IOMUXC_UART1_RXD_ECSPI3_SCLK
> +				MX8MM_DSE_X4
> +			MX8MM_IOMUXC_GPIO1_IO09_GPIO1_IO9
> +				MX8MM_DSE_X1
> +			MX8MM_IOMUXC_GPIO1_IO02_GPIO1_IO2
> +				MX8MM_DSE_X1
> +		>;
> +	};
> +
> +	pinctrl_hts_int: htsintgrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_NAND_DATA04_GPIO3_IO10
> +				(MX8MM_PULL_ENABLE | MX8MM_HYS_SCHMITT)
> +		>;
> +	};
> +
> +	pinctrl_i2c2: i2c2grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_I2C2_SCL_I2C2_SCL
> +				MX8MM_I2C_DEFAULT
> +			MX8MM_IOMUXC_I2C2_SDA_I2C2_SDA
> +				MX8MM_I2C_DEFAULT
> +		>;
> +	};
> +
> +	pinctrl_i2c2_gpio: i2c2-gpiogrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_I2C2_SCL_GPIO5_IO16
> +				MX8MM_I2C_DEFAULT
> +			MX8MM_IOMUXC_I2C2_SDA_GPIO5_IO17
> +				MX8MM_I2C_DEFAULT
> +		>;
> +	};
> +
> +	pinctrl_i2c3: i2c3grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL
> +				MX8MM_I2C_DEFAULT
> +			MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA
> +				MX8MM_I2C_DEFAULT
> +		>;
> +	};
> +
> +	pinctrl_i2c3_gpio: i2c3-gpiogrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_I2C3_SCL_GPIO5_IO18
> +				MX8MM_I2C_DEFAULT
> +			MX8MM_IOMUXC_I2C3_SDA_GPIO5_IO19
> +				MX8MM_I2C_DEFAULT
> +		>;
> +	};
> +
> +	pinctrl_lis_int: lisintgrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SPDIF_TX_GPIO5_IO3
> +				(MX8MM_PULL_ENABLE | MX8MM_HYS_SCHMITT)
> +			MX8MM_IOMUXC_SPDIF_EXT_CLK_GPIO5_IO5
> +				(MX8MM_PULL_ENABLE | MX8MM_HYS_SCHMITT)
> +		>;
> +	};
> +
> +	pinctrl_reg_comm: reg_commgrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_GPIO1_IO11_GPIO1_IO11
> +				MX8MM_DSE_X1
> +		>;
> +	};
> +
> +	pinctrl_sysfs_gpios: sysfsgpiogrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_GPIO1_IO07_GPIO1_IO7
> +				MX8MM_DSE_X1
> +			MX8MM_IOMUXC_I2C4_SDA_GPIO5_IO21
> +				MX8MM_DSE_X1
> +			MX8MM_IOMUXC_SAI3_RXFS_GPIO4_IO28
> +				MX8MM_DSE_X1
> +			MX8MM_IOMUXC_SAI5_RXD0_GPIO3_IO21
> +				MX8MM_DSE_X1
> +			MX8MM_IOMUXC_SD2_WP_GPIO2_IO20
> +				MX8MM_DSE_X1
> +			MX8MM_IOMUXC_GPIO1_IO00_GPIO1_IO0
> +				MX8MM_DSE_X1
> +			MX8MM_IOMUXC_GPIO1_IO04_GPIO1_IO4
> +				MX8MM_DSE_X1
> +			MX8MM_IOMUXC_GPIO1_IO06_GPIO1_IO6
> +				MX8MM_DSE_X1
> +		>;
> +	};
> +
> +	pinctrl_uart1: uart1grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SAI2_RXC_UART1_DCE_RX
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +			MX8MM_IOMUXC_SAI2_RXFS_UART1_DCE_TX
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +			MX8MM_IOMUXC_SAI2_RXD0_UART1_DCE_RTS_B
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +			MX8MM_IOMUXC_SAI2_TXFS_UART1_DCE_CTS_B
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_uart2: uart2grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SAI3_TXFS_UART2_DCE_RX
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +			MX8MM_IOMUXC_SAI3_TXC_UART2_DCE_TX
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +			MX8MM_IOMUXC_SAI3_RXD_UART2_DCE_RTS_B
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +			MX8MM_IOMUXC_SAI3_RXC_UART2_DCE_CTS_B
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_uart3: uart3grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_UART3_RXD_UART3_DCE_RX
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +			MX8MM_IOMUXC_UART3_TXD_UART3_DCE_TX
> +				(MX8MM_PULL_UP | MX8MM_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_usdhc2: pinctrlusdhc2grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK
> +				(MX8MM_DSE_X2 | MX8MM_FSEL_FAST | MX8MM_PULL_ENABLE)
> +			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD
> +				(MX8MM_DSE_X2 | MX8MM_USDHC_DATA_DEFAULT)
> +			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0
> +				(MX8MM_DSE_X2 | MX8MM_USDHC_DATA_DEFAULT)
> +			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1
> +				(MX8MM_DSE_X2 | MX8MM_USDHC_DATA_DEFAULT)
> +			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2
> +				(MX8MM_DSE_X2 | MX8MM_USDHC_DATA_DEFAULT)
> +			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3
> +				(MX8MM_DSE_X2 | MX8MM_USDHC_DATA_DEFAULT)
> +		>;
> +	};
> +
> +	pinctrl_wl_int: wlintgrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SAI5_RXC_GPIO3_IO20
> +				(MX8MM_PULL_UP | MX8MM_HYS_SCHMITT | MX8MM_PULL_ENABLE)
> +		>;
> +	};
> +
> +	pinctrl_wl_reg: wlreggrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_UART4_RXD_GPIO5_IO28
> +				MX8MM_DSE_X1
> +		>;
> +	};
> +};
> +
> +&uart1 {
> +	pinctrl-0 = <&pinctrl_uart1>;
> +	pinctrl-names = "default";
> +	uart-has-rtscts;
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "infineon,cyw43439-bt", "brcm,bcm4329-bt";
> +		device-wakeup-gpios = <&gpio5 13 GPIO_ACTIVE_HIGH>;
> +		interrupt-names = "host-wakeup";
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
> +		max-speed = <921600>;
> +		pinctrl-0 = <&pinctrl_bt>;
> +		pinctrl-names = "default";
> +		shutdown-gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
> +		vbat-supply = <&reg_3v3_comm>;
> +		vddio-supply = <&reg_3v3_comm>;
> +	};
> +};
> +
> +&uart2 {
> +	pinctrl-0 = <&pinctrl_uart2>;
> +	pinctrl-names = "default";
> +	uart-has-rtscts;
> +	status = "okay";
> +};
> +
> +&uart3 {
> +	pinctrl-0 = <&pinctrl_uart3>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&usbotg1 {
> +	disable-over-current;
> +	dr_mode = "peripheral";
> +	status = "okay";
> +};
> +
> +&usbotg2 {
> +	disable-over-current;
> +	dr_mode = "host";
> +	vbus-supply = <&reg_5v0>;
> +	status = "okay";
> +};
> +
> +&usdhc2 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	cap-power-off-card;
> +	keep-power-in-suspend;
> +	max-frequency = <50000000>;
> +	mmc-pwrseq = <&wifi_pwrseq>;
> +	non-removable;
> +	pinctrl-0 = <&pinctrl_usdhc2>;
> +	pinctrl-names = "default";
> +	sd-uhs-sdr25;
> +	vmmc-supply = <&reg_3v3_comm>;
> +	status = "okay";
> +
> +	wifi@1 {
> +		compatible = "infineon,cyw43439-fmac", "brcm,bcm4329-fmac";
> +		reg = <1>;
> +		pinctrl-0 = <&pinctrl_wl_int>;
> +		pinctrl-names = "default";
> +		interrupt-names = "host-wake";
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
> +		brcm,board-type = "GOcontroll,moduline";
> +	};
> +};
> +
> +&vpu_blk_ctrl {
> +	status = "disabled";
> +};
> +
> +&vpu_g1 {
> +	status = "disabled";
> +};
> +
> +&vpu_g2 {
> +	status = "disabled";
> +};
> +
> +&wdog1 {
> +	status = "okay";
> +};
>
> --
> 2.52.0
>
>
