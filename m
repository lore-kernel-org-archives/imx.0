Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795122323;
	b=t57fix6IrPbSVDx4l4PY1FRlIWC968jcW2dlIb1yVJ+C+4WayH04kjP7ReBcjRhgbNdK
	 tUpBa3xZ73VeHEIuUjBirmzcWmb8UqLG/Bq5tBsp3Oesb+n0GMAxVeG57IBjI/h3y8mr+
	 RJeI4RW3Me+RNAOrerfD01o631A4ygKxpHOjNXhVRxVKfIG/vhIKQVf8Ne52X6v661HJs
	 OuQ83qm6RrZ0WQSWa9KOEPu5mTLSK+/4CL1Cfdru58VkXO40WgTaOGTKuCEmtPgds3f5D
	 c4JAWvvAw+dGoailGqfYRyOaS7FL4f3YL/6u5UPEwp3uIaB8SPpg1XR/9nh/YGxAH4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122323;
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
	bh=+bJSqbq3SCV9gTf5E1IeKtVMmsmZ7O4WIKwi+u3mup8=;
	b=EZBYMW/xqPcb5AUOD4zNiLLejOTqVtSRkxYgLuR30nAHxPBOvar0nKYa8mvd+8rS92VQ
	 lfTGKozT9fu1qw4M2b95FIEfRKnSPlBInCZzdFz08Egca7Ol87KxIJ2mzOFxdrMdK1emg
	 do4wNSjBIErZI66AkPC8WHbPz3RhfL9MU3nBqBzXZyfzmft8cB9xf+UI6tEGUAe5ccqqC
	 SI2mq8weYPtpj1otfHjRXVYOMsnigqbHF7fxFCfv82d4kHzZ+mEiROWzJDP0KkCJM0mV9
	 qVJLBHs4Ezh7M4gvEk/you5Sv3cL609rYmTbiCNiQT511DvE27i7qSw7hYkqoio1fog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=TUZbzPFY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.6
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012006.outbound.protection.outlook.com [52.101.66.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30E1606A324
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 21:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A30E1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=TUZbzPFY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ctWN51ovVrNotQ2iJ5uFJD+nHqP+LxMbgHbFvmivKGteIvHv5uLvpPobSk6JQGfvzsO4WBy+tl10wtMZytwpm8fvfALaBSCu1ObhMiPW2ltoOSU0MtnoB2g+38slINhsbonnMZgAVv2ZM5vG0ju8vx+3wowzUHXMkSHsQcSLopcyy8GjKMUgLmByM+llA3+jUIjDxO6yu9MkL9XIU44wcQ5AQtR6/QPIYOzjANGjFIBNGQjaJ2Z9gmdmHgSWMcXs3Sen6axEMJ4FxUALgA69gmKr04PjcrKzRIhtaL8RhTRAHrEU2+VewofULPLe+zjFuiaDo3/ILoYPo+aTIm7EkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bJSqbq3SCV9gTf5E1IeKtVMmsmZ7O4WIKwi+u3mup8=;
 b=wtEp5eccsF/7UgvzhA2cg9G3bvRH/Q1vxhwZ78FQoJSWYCEOJjgLiBNvuYqLNmXcosQ/mBt0yuweCxbgYICwPL9KsHNyWeiwW5i8ifo78K42JiP0VkzZ7dqjceB1dbg/yfp42SIfA6sctK8YIm3wmM/q5EMl6YHHImSxfXkXKZORozBkwsXOR2rTgbrjSGAhhECweBrjVQkeo9DzV5ip1AXRuLfz1GHmepAVLSPKG3qoAuxOmNPb4qxlkvpHEPtC5B3tRPZwiJtZLMkZFO1jcrPswtLkodPSxtGFLEpYXY+DpX7dQA6ihrje88OQus0kVXYKpwaTCVn8XMT3/tsANg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bJSqbq3SCV9gTf5E1IeKtVMmsmZ7O4WIKwi+u3mup8=;
 b=TUZbzPFYAdp6Qm2Orq69DfQjx4dt1TDY89mKLMBlMa52UKkHaA1xa+HWSgAEfZSFkM6erao+y2MGyKGx+fUBU+C0f7PXyUuA4f6h5yRzF4qv6eXBlAMpbLHan2bUo9Liuemn63ct1+wlYLTmKzGhXNR6OA5ckSt+7T/iabW0kMPsQlgqUjSD5i59CZ8ys+iLNiM6JqpyUlPcWgTQUDJZZoUWgu7XE+CNrYmgMJaU0e0tAHXgSgy2mGXtoJqzdO6ZH8v2PwZTQSaZ7/goqhn82+bJpdOUPvwKmnWGIc1uQy+HPml7HD7UMoS3gbTAbe95Da2WNFzBceJlO1Yd3OurQA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV4PR04MB11752.eurprd04.prod.outlook.com (2603:10a6:150:2dc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 21:05:17 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 21:05:16 +0000
Date: Thu, 19 Nov 2026 15:05:06 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: mchehab@kernel.org, hverkuil@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	festevam@gmail.com, kernel@pengutronix.de,
	nicolas.dufresne@collabora.com, ming.qian@oss.nxp.com,
	marek.vasut@mailbox.org, jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com
Subject: Re: [PATCH v8 11/11] arm64: dts: freescale: imx95: Add video codec
 node
Message-ID: <av9kgix0B4irkC1h@SMW015318>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
 <e89f330486c8b986088278b563d0c4364d35f19b.1795075582.git.nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e89f330486c8b986088278b563d0c4364d35f19b.1795075582.git.nas.chung@chipsnmedia.com>
X-ClientProxiedBy: PH2PEPF00003859.namprd17.prod.outlook.com
 (2603:10b6:518:1::7b) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV4PR04MB11752:EE_
X-MS-Office365-Filtering-Correlation-Id: 684053d3-474d-4bf5-9e29-08df4680cf97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|366016|376014|1800799024|7416014|18002099003|22082099003|261009223027099003|4143699003|56012099006|11063799006|261026140227099003|261102123227099003|261028144727099003|261021121427099003|261022105027099003|10067099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	uWy1rRiA06yCKFuzpjl7e81B0onVz6XNg6BbohgOVO00scAdhxeK+mW+ZgAXZEJ5ENg6i0ckZVecm9rsrpQHxacdRZsWSh3IAO8y00tohCTRKeFRy1nRJcpMSRtJJC0+NjxdEpdSi0m1RV5mgPk8tVmYkT2FnN0vra2fLTr3XG/N+Wv1ghP1Y1VpP/YXO1bLnGNqofP0g8EJw4GyN88xXTC+h0gWh0Vhig/PFWaSY4OWZO7mWBzPB4sJbIJc16NyZa6OFgNfyBS0ud1VfvT2tYFz+RcpQGret+tW3JR9LXFmeYf/itqHgSVhY8OXavJssiva2ffJMwJDJvcsT4do16KfadYT1gI6P3P9hkJktjq8lfQeL52F4mcqnFEpF8H+4snH2YR7DF9KGEuY2xRmNnFy0ZH/W8heC5bUIfAGxQnq0ZHeDQtlvL6oaPL97u+shJdqyRbx3m4LUzJ17DIKBxBJmhyVHPU6KxpskrcdOdAdgxaTuNHZMS7c/0nkQ7Z9WMZj5DYclZSaxog2XD7utzSoTHea1m8HhNw8nQSk2QCGYEKnKusR8RoyGCGlqu1wV4i2Bxola9RNBroZpuWFBcAvUDLroywB32xrECpfFEi/aUO+8i9uEUivPQXpdF4/ZKTMlQ4NV2SvqtBDnuTf3cF1kl4stwLInmY/Se5XAeM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(376014)(1800799024)(7416014)(18002099003)(22082099003)(261009223027099003)(4143699003)(56012099006)(11063799006)(261026140227099003)(261102123227099003)(261028144727099003)(261021121427099003)(261022105027099003)(10067099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OGhco1VUcivQrvVJPQwWp0BPTD2rFzFePCO9DydOTdfewZNZtUJCM8uJYYNV?=
 =?us-ascii?Q?OJsKHNf7HwzvYbb3dy4Ozc8NRNyko2Mf78LZx4Z8iv2XNFdFv/Vw1e8PGoCT?=
 =?us-ascii?Q?oGIzzpI10VnLdEtwvXZwunO5adMBuac6IkyTPM3UEKYX1Jn8GomdLojjl6yZ?=
 =?us-ascii?Q?+gs3JZaKFlMpgSxXZpoQ+OaG2wcK+UwikhQ7A/F0erEFV0rblyailk/DQ8k9?=
 =?us-ascii?Q?W1w3vhq9REAsXGMPI9/z/AtrAKATspLCWH37TxoDT3R2ejfHMJCRJgv374Hx?=
 =?us-ascii?Q?MAda4Xu6XdJ6IpO/E2l5wwKay/vrKDfvjxaTZ7Xa0LXIl0Y9SeuoQPUxPKEP?=
 =?us-ascii?Q?eoiYNepLc/b4J+FUUkuowtmRvKGoDnLctCDVwJ/d/Wg+Am9pW5S/GLMSRPnV?=
 =?us-ascii?Q?Uu3PEypWSmp4rfHn1zMBj8oxKnWr2LrxZBz1LihHznDfsZiE0N1Rd49sa4I8?=
 =?us-ascii?Q?iJ4X1mhOSZFAynvamuoIx1T/OEflSdxYRkluPEYbgY0uwrLuSMTXnqULtmmb?=
 =?us-ascii?Q?I9v5gF4vQuNYOrwMU7yzlECGamrm0PMgGlnc+xu3MVciA42tAW8ObZ7DWWsw?=
 =?us-ascii?Q?u43Thk5+kc6SlFSmTsJz7jIAItNvTn4sUrnhyUvAF6k/e/hpDBTcoJV6CeTI?=
 =?us-ascii?Q?OyFTcNqMcEWrC/VdXUXMSdcFPV8YTmmstczKK4TnhiTrz7+fzKLJ89Dgyqxu?=
 =?us-ascii?Q?kO6yAGHecjtZucX5z/8mhSWmOOT+EA6cij5Jc7r/ocEjvXBbLugTW09VSCgI?=
 =?us-ascii?Q?pKIbzDvZ/ZYl0mHJEQGW+qsRfBYkdgejhyu2bit8NepUorpjuaoCjBsn5HaZ?=
 =?us-ascii?Q?rzz+YrN6iXd0oW9nvPfOC7Kyy3PCOEdTQFUQajX5x+1z6gxGizgS2aYH/xvF?=
 =?us-ascii?Q?xvEcHXTwVpNgsobMJzhEOFQBkQmGWKhtDDwgcaj0MJRGaHbzBYRfRfyEsRgb?=
 =?us-ascii?Q?lPhOLGpt8DD80JVPRpRQ0SY7gDr05eUf+nfdDjj8nimKDJ6d36JJ4k3+iY+T?=
 =?us-ascii?Q?4Oa5+/MBmSiesgnMntz7Vk/d1RM1QLqo0H6M94h0w2jA7vYARlGoIstvwZ40?=
 =?us-ascii?Q?G7lnohj+Kljck/gRwVoeeH/GxFwoX64gIZTY7ui9oNQ9rU8KAqzbJOKtd8R6?=
 =?us-ascii?Q?+MQe3A0f+v3OEoGhYO/kCj5n7CVquRl0eOKesVxUETBXB75qdA4WZWvzUEjF?=
 =?us-ascii?Q?BlNaxvLnjKWZIrYdhyVmCcaOqMeAhNy4q6a+I0T7Qu19Py23ZD5vS6FxZpL1?=
 =?us-ascii?Q?njQmds1c1RRXrjrOJzO9v1Ec0NAvfhyW8Py97n0ix06yT+cO0ssNol81KtnO?=
 =?us-ascii?Q?kcWYcLHbBpQmxhHxW7FtbNRU5RZ14GXIH5bnxn/0/kWT8oBnihBYHevdy1Vp?=
 =?us-ascii?Q?5StYQj3T6+ntFVsFczsmvmqFOXvLds2YjWsADeQNrF+GkLg3JOij7ASkKVdF?=
 =?us-ascii?Q?/bxlmlGgN9NtS4o66KvELZmlLFjoaCG/ZOiNzdGMcZ0iC3EuARhvDJu5wbwh?=
 =?us-ascii?Q?grMUBSABTnwi3Vq20sIvEzuWYFM2Tvlf9A3LqrlOyp/XlWX0UTpHkBd9ZzVd?=
 =?us-ascii?Q?L5Rwr2AlBxny3Hy8tQakH0TzgsosuSmGj755xgFSaOIDmwn2ufTd/hBFVHaN?=
 =?us-ascii?Q?x8KgWIiyNN0/DF5fL7Ik1EWasdw+2TBRRU0idW+u0U4C0KxQPxkVTEfREsh8?=
 =?us-ascii?Q?e6GYmTs3Ho4eexAgxs4OsVv/GXDSSCFwyTt0oUYng8LpthH3b9YQzPwS44je?=
 =?us-ascii?Q?DzrVaKX8jVjOs1Ory+490YUoT56v3GttZAu/0YMe8Mr3gbpkj3b1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 684053d3-474d-4bf5-9e29-08df4680cf97
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 21:05:16.4567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vTN2/nZgstcskEGwf3m+UjteprBokz3dJj/VKwBijzwPvyNNGQR4uiAAWeqD3nlr+/ioGFYbIbTRSGvVvyD79SXBmiVMX1YgtAPuHWwvJB860e0QQxp5YmuDp1/XCLi0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11752

On Thu, Nov 19, 2026 at 06:00:05PM +0900, Nas Chung wrote:
> Add the Chips and Media wave633 video codec node on IMX95 SoCs.
>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
>  .../boot/dts/freescale/imx95-19x19-evk.dts    | 10 +++++
>  arch/arm64/boot/dts/freescale/imx95.dtsi      | 37 +++++++++++++++++++

Please split two patch, one patch touch soc dtsi, the another touch board.

Frank

>  2 files changed, 47 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> index 47ed0ef67611..a15d5b471708 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> @@ -143,6 +143,11 @@ vdev0buffer: vdev0buffer@88020000 {
>  			reg = <0 0x88020000 0 0x100000>;
>  			no-map;
>  		};
> +
> +		vpu_boot: memory@a0000000 {
> +			reg = <0 0xa0000000 0 0x100000>;
> +			no-map;
> +		};
>  	};
>
>  	flexcan1_phy: can-phy0 {
> @@ -1225,3 +1230,8 @@ &tpm6 {
>  	pinctrl-0 = <&pinctrl_tpm6>;
>  	status = "okay";
>  };
> +
> +&vpu {
> +	memory-region = <&vpu_boot>;
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index d20c2498b9aa..b6323e527ab7 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -2139,6 +2139,43 @@ vpu_blk_ctrl: clock-controller@4c410000 {
>  			assigned-clock-rates = <133333333>, <667000000>, <500000000>;
>  		};
>
> +		vpu: video-codec@4c4c0000 {
> +			compatible = "nxp,imx95-vpu";
> +			reg = <0x0 0x4c4c0000 0x0 0x10000>;
> +			clocks = <&scmi_clk IMX95_CLK_VPU>,
> +				 <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
> +			clock-names = "core", "vpublk";
> +			power-domains = <&scmi_devpd IMX95_PD_VPU>,
> +					<&scmi_perf IMX95_PERF_VPU>;
> +			power-domain-names = "vpu", "perf";
> +			sram = <&sram1>;
> +			#cooling-cells = <2>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			status = "disabled";
> +
> +			interface@4c480000 {
> +				reg = <0x0 0x4c480000 0x0 0x10000>;
> +				interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +			interface@4c490000 {
> +				reg = <0x0 0x4c490000 0x0 0x10000>;
> +				interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +			interface@4c4a0000 {
> +				reg = <0x0 0x4c4a0000 0x0 0x10000>;
> +				interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +			interface@4c4b0000 {
> +				reg = <0x0 0x4c4b0000 0x0 0x10000>;
> +				interrupts = <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +		};
> +
>  		jpegdec: jpegdec@4c500000 {
>  			compatible = "nxp,imx95-jpgdec", "nxp,imx8qxp-jpgdec";
>  			reg = <0x0 0x4C500000 0x0 0x00050000>;
> --
> 2.41.0.windows.3
>
>
