Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011059.outbound.protection.outlook.com [52.101.65.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4713832BF54
	for <imx@lists.linux.dev>; Fri,  6 Feb 2026 16:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770396112; cv=fail; b=mj6Bjfv9SpORRStt4ghUha2hs9e8sAbKFiKlL63dJSTXksZ8lDldQrUPE4Tohc8pCWf6Dheq+QRHdoAYwKYSWRwVtLEynl/8mZftTypPRHzDx/pdYm3CP88JtVS0odqWnd87+1x3YI6ORU/1hSLKG77vPJmYCTF7diYJ3gijfTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770396112; c=relaxed/simple;
	bh=Wvhn3x/pIHbh+rHAsmhcBh48Z3xjnMNNhwEWk2fgnYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iEhyXqczY0pZn0cwNzQR7wGpjYNy48PDj/a7mhYUQAqEaJBTl1trfJ3/7hDFK8N36vtwETbyKBWyozuoCKU+3z55Tqu6N3848SUN+SizzVu8m7vVl2rD6bFdWPhE3zLcjG/4hMCENFykMlD8PpAxxWRt46WQYrMwq8uT2yA/EB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=N4gxFS+s; arc=fail smtp.client-ip=52.101.65.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="N4gxFS+s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=moIFCd0TwP2IxnOnxxurAnuzUffRJgmArwo+v8eVPGjViiDOq8XMdS3sGLtID/LWe2rVtZY2zkunlDYzsZeO/y+R35pR8ChSThee5OA5MuSc0TxhEDcDz17TpyVsbykqADK6HDKDFUeT4srNmSAna8KQ2LkhXkcUsuUoRb/AHxrPxCugvqDy1QLU1b4oyCJiuk+3r4a9rLX6P+kewz9s69HrOUJ85AGu15HTQc6a386pmy6EEv99WplDER7I6D/IxlTFHGamJGNr6bhc88Wz87M3OxTdn11+JiPn0eZGSvVsXHXtnlsYtThTuBRctjXESRZECkRAU/RO+jowI7PJvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lswdDhzwp+CK8TnJaMAGCZr09MSZhNK86/oxJtBhlfY=;
 b=spIp8ka0XIJJ/qscbYe+j7ZPxZGxYcVTiXz3FH22Ps1E+wEANqfBYxu91C7VBCaW8x6LBbTz11aqEAulop3ZB4rq5vs/80DWnlLAsYuG6D8DEPsbE42qfxHTfCuClWytWThgBMrpRH3JTNhDY4LQSzp+yQQNc01ADBKc4mrDiDkvQJsi2ssZzAVuW8mOoE0xBpjVo/FFo21m4ou8rHivHGWUMQYOVNQkBzs39DICTt4xaz3IP2r6BiqRGbmS2yBI/Sh5M1Bib2FUiNqBwKaMU2V8XLi1ZKrL4exH28fMpfXx9hF1mh5QEPZ6gc5TaT3OGmTIByXnUQTRpVInuTueAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lswdDhzwp+CK8TnJaMAGCZr09MSZhNK86/oxJtBhlfY=;
 b=N4gxFS+s8qJJbFyIT4vefBUREl+jP84OmM5S3mj2xiGAZ8T9KBUScUdh0K5ikmT1g6zD2cfbGFL/uYxK6Pp+mtVCJtN2micG9sMwYglsGSJJV/N5j+mEMcpBETOi+CuaZjbMNhiO8U68XRyLeE0ZGXYg6jH5hWhgNO/j1cKFA6VvhXD9FJrdMp4zpUpKKJ6VfrZWSsbNBx8/QNAFMmhyB9qk5LsIfxhIka9wdHZCI/iZ09rzX7VBz1l5OmcOOpYUbjsSM0EJ+irGcMeqRBASZiHj7csrw9JiBA1ncrB78L1ZKEYQzC35LzYLBgn5Q1uG05p0dkK3kI+fxrP/AHdAzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB10603.eurprd04.prod.outlook.com (2603:10a6:102:484::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 16:41:49 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 16:41:49 +0000
Date: Fri, 6 Feb 2026 11:41:40 -0500
From: Frank Li <Frank.li@nxp.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	kernel@pengutronix.de, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] arm64: dts: imx943-evk: Add pcie[0,1] and
 pcie-ep[0,1] support
Message-ID: <aYYZxFWhuiZyecMu@lizhi-Precision-Tower-5810>
References: <20260206055007.3995679-1-hongxing.zhu@nxp.com>
 <20260206055007.3995679-4-hongxing.zhu@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206055007.3995679-4-hongxing.zhu@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0189.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::14) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB10603:EE_
X-MS-Office365-Filtering-Correlation-Id: 9abc617e-574e-4dca-a4bd-08de659e9fdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UeU9qSmPbxegM6Y/cOLHph5Cj8TVu1pN5zu4Qe61CpKrd/5Z/daBufx9VAiO?=
 =?us-ascii?Q?/EPOeH2wxDj4zYP3Em16mD2ztGTSdnhl4Gg+WQMERd3cN0H8SSQ53gTEXYe1?=
 =?us-ascii?Q?IysZn8qREmClV21TOdP0+7lqbzVuEU0G9yukLLEJe8Fpd+iIKz3lKpP7jYth?=
 =?us-ascii?Q?gMoa+qpPVwJajhUp/edYV5cr067X73wmG3rLcsKQxzXSv+X+JOON4+jA/tPe?=
 =?us-ascii?Q?kIww54KkHyY69L5S09Q7IjAnonIFFF2nfDiS63kyHCIslLst12exB5E6R7sw?=
 =?us-ascii?Q?oDX5eUxQbAWEvdjcsE73xjOB6MTSquPS4RX0l8qOkVRsHVNQA+nXsVRlQ8bZ?=
 =?us-ascii?Q?tuon2GPlOSIYCZYaNLqrGsqmBIJRms4OUVAbpr0QvkQ/Xaw83PpJ8exGaKJ4?=
 =?us-ascii?Q?aUypjjd/Qg4IudHoZ/zfiwwXpwoLi8kqImLeU42YmuFE46Y8eAIug61cssbT?=
 =?us-ascii?Q?XhTrjTIQfwvSELrc2bScx6gOXBIlz6z8aNLTeaZ95H+Jexk410FVvJA0K8sF?=
 =?us-ascii?Q?ElHrLo1Rwx2WVwtvLmJiD8JRf29Sm8Rd0gvzYUPJRXBt/iTQyP6oVFamLstz?=
 =?us-ascii?Q?u8ARTpsq01pySwD+o3RWn570AgS6sFYnXWW+oxV4Z1TI5EB+Oq4G4WL64r6y?=
 =?us-ascii?Q?k/eOauS4bwhtJHjRsk/O1PnpYQONd+xG93/NtgtiSkrPqlXCuG60EKytTU73?=
 =?us-ascii?Q?NKPEd5rHDun3fvpT5sz0XsL65tdh98EVK0ZSgVCd2S978ycrHBYq1KrtX0xL?=
 =?us-ascii?Q?59oPRn0R/lDK9ZkSQgUxCX49b/x6y6KBzl7pwicXvz/Sz6e51h3OynoaWiBR?=
 =?us-ascii?Q?meYkkIxhXhYcD93D745TgL9iwIrajEUZq446P/AhYrLHkmmK2RDFM0xaIylc?=
 =?us-ascii?Q?Jks1e9ljnRnLIZyYA4aTTifL8c/kEeG9V6+uGruSQZS1kLGqFwVyKxXZdcj7?=
 =?us-ascii?Q?PLgABYRFv7zAY+546omWXwpAIWINpguhOnYYBbT2rxybuaYhbgZ9Vrd4gXgg?=
 =?us-ascii?Q?bNUN++0JLvYmhkuSmdp5dXgrKTM9wBPgDsmSMrWc7wO4gAVWmrBrQmvYLZ3z?=
 =?us-ascii?Q?76xGgSKQ0i8sP9wi9Z9hHOx1QSmKQrwtfppsYSyOW4LhICdEa8JZU60IZ4wG?=
 =?us-ascii?Q?Ikb/JwjBK3NCNEuBnHIy1Gw0GV64VahAyDNhecjO0OCXzYiYoqiBmJpA9PEf?=
 =?us-ascii?Q?yL8BmzabhUS/lZA/NBLmcVzIE/G1WiJpFEc8A9pTXfobUdri1qSXFUtSzPH6?=
 =?us-ascii?Q?zsBwpa3eUXGMMw6rF9V228DT1OlGDgSVSp7lOT7AINCATd7Sk1lTl4aCNb3B?=
 =?us-ascii?Q?M/TP89dddy/7iHhOdFQ+bvrFUtxxUKJHYtncezBJrA8BhwuQweZYaobwlA32?=
 =?us-ascii?Q?tC2eE1MX2koUIkEn3Ofps0Olobt5IddaIkb3xO/3FMU8Fygv/hVraBkfzag7?=
 =?us-ascii?Q?3lDOctNFFtXDw0olD/jpTcuVeSLTrG5fVuY9Y0WBKWKaK6v28q942S4Y3Wf+?=
 =?us-ascii?Q?PSpuF0sI4dRjAJO93VYgTiIOBYiFoDwvouxR3rXoGqa8oQAV8qisBErYci4L?=
 =?us-ascii?Q?LpBT2Tbwdyd2p2GwVG77FN7wpbYI4MAFlvyD3UsiXiiDt9ddpRw+znJjnbNi?=
 =?us-ascii?Q?rtdNSnJo1Kd9jT6Q9wCsREE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DzbbJaKxCEeKAKPqcXuJNCd8XK9a3iRyXcFhJGVO2Ifj8qSw72a9PbLr8sq0?=
 =?us-ascii?Q?xWjex+vSM7/yjnyh0mWCkYMn0d33weFcHh/pw3oIZwN1ERohq5OXm280c29i?=
 =?us-ascii?Q?m67bcnc6a9Z/7y6GHVaSOP9/9/dxmpsPBJEYLB7K10KAOxNGZFuwhiimLjyD?=
 =?us-ascii?Q?TFWR8anq0Rw1ofq5vA6c7HgdOjjkLtXgOOLl06hwjlqtOsaEcBT1v8kTBlCj?=
 =?us-ascii?Q?tPZGqqWd5lfDe/Jeb8ktbwN4sWxvxjgzPcNokP22jW0QTBBjqbV1Yi2O9fwF?=
 =?us-ascii?Q?TQLNHwH5jaNkKlm5dwro4OSoWPhekgCnAN5Pa5RHludGlrQzGDg7+iwIwVzv?=
 =?us-ascii?Q?fzkwWEm7xi8g8Ghnq4/wvsHDSGkemM2BXQsNp1Cjhf/DiiegqPdohPG7r0Ic?=
 =?us-ascii?Q?AVDBLcqHcRyZS0IpdsNxDSq3enyaypyM4NF1Be3HGo90IUJZrLxjAxoK/SEV?=
 =?us-ascii?Q?FlshE0QLLf4jL61mMQcLhHWHHNILdTSJM8wMxEsJygDeymDznPQqt1SZ2aHg?=
 =?us-ascii?Q?GI9tMXoBib/j09f/8riBTejvar0L8O1XUypLUoO7KIBEyZlqdY1U6DVSif4d?=
 =?us-ascii?Q?n7uurXJbKdktV8LG6iOzi2nGuQGX8+sfw0PETgcJOwRTh/wHFP1mmPeS+h/w?=
 =?us-ascii?Q?0dN92u6/BCMxfUGvtv9+u6fQNetytMHlCU7lVMTaYgS94sSbAfl3GnkLNkDD?=
 =?us-ascii?Q?gpxQzJN13b1nupIQmZkjU+Q7mdt11+nKK9ln1Ue92jhJOltLFr0lK6dr5bBF?=
 =?us-ascii?Q?BHeIOooLydHvAX1TSKeyMwVM/zhkE9O5qpbrdO0y4yvjcP6Fkr2CiNnleay0?=
 =?us-ascii?Q?Kh0Lm/vxgT9Z05p7yO4hP4F3zga2YMZbRYdaJxuVhdW762J3euOPZiLqiwif?=
 =?us-ascii?Q?4r3xbNFLkEs8PbIs5h06KRWz5waCe38eVzJuQkeyqvkY0q+Ub8S7zzkBoaIT?=
 =?us-ascii?Q?L9cXMjNc5NCHxPG3pVraWiuJbm02vZTU2cqKW+rDM7MXNgrnfaqq21x7MaUD?=
 =?us-ascii?Q?DL9BsTkckMonJ19uyieQLwS2Vr+1HhuG41s2U2IVQ05VYqzJS47BJmx6guVv?=
 =?us-ascii?Q?38Ja1XZe6IKcu4AZXn/U+A1Bt/UisEz7zdvJ9ZmzFjkKmW7dgWljh3eB+B3D?=
 =?us-ascii?Q?isNnmbrXCWpLpkhZ0eTXhkZoCHDontKeeBJWQOvKzX9xw0FSEG0SqPFWRvJx?=
 =?us-ascii?Q?eJmJhOvDZBdTXua7Y0m5OL0VzVxKblxYrnYR5meCcHveakGcKrPYJ0xuEDOg?=
 =?us-ascii?Q?vSuJMPksu0AjqMZ/VPsWEqQ5Y7LFyfU5lUCFdq/QIfwMWWpUedJ85WY2AR28?=
 =?us-ascii?Q?pZFfYzCltpMdTD36lVkhBb1iUGvjtaX1SLXgYt0nCsKBWFWyiHTyk3sfaROA?=
 =?us-ascii?Q?nOzREBbs44r5a5zDBrD8GhCLJwJBq6HSe5H8PA/gSD6byaS8K0Z7qcj42KnM?=
 =?us-ascii?Q?bYp2932EjVB7wPrcoAVJYkPa2cbClv9KsMqmgXJBhHiITgAdf5tLeJi4Xxx5?=
 =?us-ascii?Q?dGBx65VDmTGbPytza0EfA3AIXkzTUJXYGsG2aQahYJtGWfhaZ7hM4VX8d3e0?=
 =?us-ascii?Q?uPbYv3XAIlOMtcoc4DVIT1ROnARHATPNuUMn1fnGRmOMKh+goDJsHYPjegH+?=
 =?us-ascii?Q?xuGDCaS1oKFDk/1TrIne5D3svs57+Jz8Hb6NJHuesEzeh0HmP/RRK1cyqdYF?=
 =?us-ascii?Q?oT84O/CsKXm93LW2EL4gp89WJyYQaf4IIE6wu6BqlZljANbN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9abc617e-574e-4dca-a4bd-08de659e9fdf
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 16:41:49.6412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gQATMEL89kiwsv1H0eVxM04E/EKUbFnaipwwHWZalTINgfNlEPLjMZyg0skyVha4OCdHf3WP/Dlu91yUSclXyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10603

On Fri, Feb 06, 2026 at 01:50:07PM +0800, Richard Zhu wrote:
> Add pcie[0,1] and pcie-ep[0,1] support.
>
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx943-evk.dts | 108 +++++++++++++++++++
>  1 file changed, 108 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> index 31fa9675cee13..37a8349bc7905 100644
> --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> @@ -53,6 +53,13 @@ dmic: dmic {
>  		#sound-dai-cells = <0>;
>  	};
>
> +	pcie_ref_clk: clock-pcie-ref {
> +		compatible = "gpio-gate-clock";
> +		clocks = <&xtal25m>;
> +		#clock-cells = <0>;
> +		enable-gpios = <&pca9670_i2c3 7 GPIO_ACTIVE_LOW>;
> +	};
> +

order by node name, clock-pcie-ref should before dmic.

>  	reg_usdhc2_vmmc: regulator-usdhc2 {
>  		compatible = "regulator-fixed";
>  		off-on-delay-us = <12000>;
> @@ -74,6 +81,41 @@ reg_audio_pwr: regulator-wm8962-pwr {
>  		enable-active-high;
>  	};
>
> +	reg_m2_pwr: regulator-m2-pwr {

order by by node name, regulator-m2-pwr

Frank
> +		compatible = "regulator-fixed";
> +		regulator-name = "M.2-power";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&pcal6416_i2c3_u46 2 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		/*
> +		 * M.2 device only can be enabled(W_DISABLE1#) after all Power
> +		 * Rails reach their minimum operating voltage (PCI Express M.2
> +		 * Specification r5.1 3.1.4 Power-up Timing).
> +		 * Set a delay equal to the max value of Tsettle here.
> +		 */
> +		startup-delay-us = <5000>;
> +	};
> +
> +	reg_pcie0: regulator-pcie {
> +		compatible = "regulator-fixed";
> +		regulator-name = "PCIE_WLAN_EN";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&reg_m2_pwr>;
> +		gpio = <&pcal6416_i2c3_u46 5 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_slot_pwr: regulator-slot-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "PCIe slot-power";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&pcal6416_i2c3_u46 0 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
>  	reserved-memory {
>  		ranges;
>  		#address-cells = <2>;
> @@ -144,6 +186,13 @@ memory@80000000 {
>  		reg = <0x0 0x80000000 0x0 0x80000000>;
>  		device_type = "memory";
>  	};
> +
> +	xtal25m: clock-xtal25m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <25000000>;
> +		clock-output-names = "xtal_25MHz";
> +	};
>  };
>
>  &enetc1 {
> @@ -609,6 +658,18 @@ IMX94_PAD_GPIO_IO28__LPI2C6_SCL		0x40000b9e
>  		>;
>  	};
>
> +	pinctrl_pcie0: pcie0grp {
> +		fsl,pins = <
> +			IMX94_PAD_GPIO_IO20__PCIE1_CLKREQ_B	0x4000031e
> +		>;
> +	};
> +
> +	pinctrl_pcie1: pcie1grp {
> +		fsl,pins = <
> +			IMX94_PAD_GPIO_IO23__PCIE2_CLKREQ_B	0x4000031e
> +		>;
> +	};
> +
>  	pinctrl_pdm: pdmgrp {
>  		fsl,pins = <
>  			IMX94_PAD_PDM_CLK__PDM_CLK			0x31e
> @@ -756,6 +817,53 @@ IMX94_PAD_XSPI1_DQS__XSPI1_A_DQS	0x3fe
>  	};
>  };
>
> +&pcie0 {
> +	pinctrl-0 = <&pinctrl_pcie0>;
> +	pinctrl-names = "default";
> +	clocks = <&scmi_clk IMX94_CLK_HSIO>,
> +		 <&scmi_clk IMX94_CLK_HSIOPLL>,
> +		 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
> +		 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>,
> +		 <&hsio_blk_ctl 0>,
> +		 <&pcie_ref_clk>;
> +	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
> +		      "ref", "extref";
> +	reset-gpio = <&pcal6416_i2c3_u46 3 GPIO_ACTIVE_LOW>;
> +	vpcie3v3aux-supply = <&reg_pcie0>;
> +	supports-clkreq;
> +	status = "okay";
> +};
> +
> +&pcie0_ep {
> +	pinctrl-0 = <&pinctrl_pcie0>;
> +	pinctrl-names = "default";
> +	vpcie3v3aux-supply = <&reg_pcie0>;
> +	status = "disabled";
> +};
> +
> +&pcie1 {
> +	pinctrl-0 = <&pinctrl_pcie1>;
> +	pinctrl-names = "default";
> +	clocks = <&scmi_clk IMX94_CLK_HSIO>,
> +		 <&scmi_clk IMX94_CLK_HSIOPLL>,
> +		 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
> +		 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>,
> +		 <&hsio_blk_ctl 0>,
> +		 <&pcie_ref_clk>;
> +	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
> +		      "ref", "extref";
> +	reset-gpio = <&pcal6416_i2c3_u46 1 GPIO_ACTIVE_LOW>;
> +	vpcie3v3aux-supply = <&reg_slot_pwr>;
> +	status = "okay";
> +};
> +
> +&pcie1_ep {
> +	pinctrl-0 = <&pinctrl_pcie1>;
> +	pinctrl-names = "default";
> +	vpcie3v3aux-supply = <&reg_slot_pwr>;
> +	status = "disabled";
> +};
> +
>  &usdhc1 {
>  	pinctrl-0 = <&pinctrl_usdhc1>;
>  	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
> --
> 2.37.1
>
