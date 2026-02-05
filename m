Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013058.outbound.protection.outlook.com [52.101.72.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122903EF0D2
	for <imx@lists.linux.dev>; Thu,  5 Feb 2026 15:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770304535; cv=fail; b=kc2vg9eitx6FPmV/sADCMczeiUGMPinLe8cZ4O1YeFlZwYUSPWeyJ6bbiG+EEo3KDNL6Zk4VbjGuWparuYMG2nLgPGpu3/wJ1sXO+5v1pNFxPJ8iuDQ2aJU/Kggy30ka8yrGQZCJ2/j3Ieze8mBc4xTTofWH3xsZU/yeYHiTFEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770304535; c=relaxed/simple;
	bh=Rkh5Acbkcm2znuzqybE4ltowI2Cc2Sj5JjwVh2YwPwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=P2pdaBklQUcFGNHnJ8D49/coNOSu3AjhxwuPFbXtwcNT5Bx4D19ysEBRceNr2RkZMoXfidOJd6b/Fqj2RIi9BZ8hL1KcNNEGjM3KDv04qJZxWrNFkOPKCMUsxEhRhnTd79XsH1Z8+Rgcwj3psIUt+/1/apqDLyionytD6PvUsko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Kvy9FJ2U; arc=fail smtp.client-ip=52.101.72.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Kvy9FJ2U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7exrip9gvi1MQDSBEknbiqm6kQIYE8b66MBgGnV3u5+uhpXzjmA6AHr9vLEdqDM6+k/V/uxro5LFCcH1NCabbJK/Ag97yzmtpm4IgwyvHcPaC+fEsmOdhNsgLbtpG41QjAm7P9bwjpaEgSNAktJJJnUkeH8PWdqgBREDG/6P7br6+VQnP1VdICLkTwBK2u1w4jAqi8y03hvhnxYbQ7/boA93T6o7meN7EKzLXpFplIBssS7//xVJq1D7Bl5zD7ba4ZFAdpMrMVoI/4DlhzEoh0kgOY61JE9mwPdCRk0lak6xe7kD5hRttoerK8yEm0tHE+DoNxbFRtRGLKRhBxZog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MYbGYgab3rNxWtp9ul1cchZ4zhnNDWHsiqo4KW/Auk=;
 b=yEAEssi+ud4cLscU4Kd97QqlTEKIjCVQgyt3YiXIEjsXQy83QxTLRYvdSVNUm5Mm5hpS2rlY6k3lWkCyqt9P/+g5CfmJErgaQHBB2j7Q/ZUzS4StaDn6PoMk74hLAf4vEuQxOLFP7p96Tnib7gChFPaBL9ECPgtZYY2qKQEDyHQNZXnekCOR4I20kuzFEONDztAwObdJUQeeF2ggCjo4gJbz1X1CZySRqYmgVZPTKoZf1R7OQj3AUrYp+Y5xo292yrt5etwnY8V10Sg26neKkQARZP7UDXLnmxQ0dzqnCiBZ95nX7JtowVqKHg/Su6BHM8GN6O6F8jm2D5CJvCQ/fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MYbGYgab3rNxWtp9ul1cchZ4zhnNDWHsiqo4KW/Auk=;
 b=Kvy9FJ2UVNKzuFDLEEqEoxeZxim3tLmVN9wzzzd7rzOu6MLJhWgcu5+vaCTTEEEXOZFbJjBtWkHTBxcVsVRiNMuwA11HNPUpkYxgnUOYqcaaV8m2uVB4Gjz860fKISy8sWGsLm3nLHptf6c8Gn9J92IQRVLmFKrKqZgPSCWIJutycS6c0mH9QeRmfdq4dIBw+yLqOkiZnZIAA1ZkguDl06bAcChqFdaM+vAd2U9zfeYRFdcsJIGzGHILpJQz9O+JbRAs4s5qVBrYmLg4ZNCn6m+7wjmCHRy47PaXuvqZz+Iz9Wxlhh5fPO09Q4kkx2m6SMN9Uww0V9OOq/fQ/+HV1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB9701.eurprd04.prod.outlook.com (2603:10a6:10:300::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 15:15:30 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 15:15:30 +0000
Date: Thu, 5 Feb 2026 10:15:22 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2 2/2] arm64: dts: imx8mp-evk: Add usdhc1 for SDIO WiFi
 support
Message-ID: <aYS0Cq6UmCDlmd4M@lizhi-Precision-Tower-5810>
References: <20260205073454.3709673-1-sherry.sun@nxp.com>
 <20260205073454.3709673-3-sherry.sun@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205073454.3709673-3-sherry.sun@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0214.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::9) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB9701:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d08a7c6-a0a1-43c6-b3df-08de64c9662a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1QGOZWvw8s3cHukRCCEKckm0wEfkTyXHd+fyRjZSS/yljLIuWl1AIIiN0qX2?=
 =?us-ascii?Q?7+r+Np2OqytibGshX3buW3Gqi7vTc+D1+64a7c2Kh5aJR3R9+XkCGD7AGQbf?=
 =?us-ascii?Q?UkQEX+KJv/SFE6CmrGz0nkA8dcz5a/7m8pHhHyQUcZgq88/3bVjh6edMfj5M?=
 =?us-ascii?Q?3wTB91lueIjelpGODsZkNCcFUaLtO62cNNplMGlJVU/uKe0uuRShBVZaYosw?=
 =?us-ascii?Q?9se9JNYbLNIHlCLiLVAs5qfILuUOW+Sr87oGScHtRPnLjVJCjsbeFiWRX8j9?=
 =?us-ascii?Q?Ldk65dlLPfuncLw0ncoXEqO3uL1ZzIir7khQ16s8okMcTs3LBytc0UJt550a?=
 =?us-ascii?Q?WAFopqyzExYCltPMy4/vuvBWgvoUwLDaAJilmRUDLhQdRBrn3KqkEqAIOlWP?=
 =?us-ascii?Q?HaUaTCBvTgOchZAJj9q0brXTvW53oV5S3+i8D8YajehWLkHIW+52qcjydsAI?=
 =?us-ascii?Q?8o3tjCGGi5ZhQg814NCUqzGn8y4c7EVht+qQOEdW0NMDeNy3S2HwbIU0+7GH?=
 =?us-ascii?Q?fjetVbGjQuvZ2koJowLs5iBze0iwwdm8P96cFvAIWY1xSP676rS3y6IZ/OM/?=
 =?us-ascii?Q?zgeOFqu/YMbaVCBCo82SBwt9+bwSeXKxyslbcaVH5NHfk9ZeaGz2vBlfHp4L?=
 =?us-ascii?Q?R2w3ZiAbSKQvsU7mXMjS4VGkO3hjsfjxOXtOm/Pp5+HSPOIxuWDOPzgGd8VQ?=
 =?us-ascii?Q?FJW9VKXJPcFFi2aPFnabHnRzaN6SF63qqYIqjG1ZmLHW5Lb5eBM3dFSnB3iV?=
 =?us-ascii?Q?Zt7rYD7S8lFrIW85KVYGWr7yO5U7DazCs9I3ZkRx7dVtzfIT4ziKt9UNMWdK?=
 =?us-ascii?Q?k4loe2u0H/4w5/v19NzDW6DVXE2T+IflO1KNUBAwdSW1qIXua9U8E2oh1ZhD?=
 =?us-ascii?Q?7LwLJtQpo2fFN7mb0qihrt0C65aicWgFZJhS6mdab+4UqigHPx9OJfpiYp9O?=
 =?us-ascii?Q?nx06ti7TIKINr6yHfUnlMWMJx/PB7ynQV6a7U+jBgXjy+SCHk3zGy9Vcrl0k?=
 =?us-ascii?Q?2vHaQK4SH4bgvctvZ24XU1HhNRjCQK2RICWGYqSN4HI1AneIOwbeamuGPqmA?=
 =?us-ascii?Q?qncgRNwMEBABHJjXocmxYgW2TgUfUQDLxtcRh2EO+XFSghK84YpP+erw23QI?=
 =?us-ascii?Q?wg4NM5793bEonVgnLjkH3Hb9bQ9WEMxssB2yO8QUJ1Fg4NTcGFgHG3GBq5+C?=
 =?us-ascii?Q?+LDW9HTEhhHn1TZCBLKatgI5bKZQvh1H8m1WVo2ixPuefc4LQkmJZO/1ogsr?=
 =?us-ascii?Q?Ounv/xBU+NIVh36b0WNcZnvQEUXQ6qq0ZB/0wwWOTTQNRYwaceiRCiJQhGiy?=
 =?us-ascii?Q?RLr45L2vMjjgbLrCw0brGFOFKv+Bqhdm2BVHSBy6hSXSl7P74mwkVNe9CTO3?=
 =?us-ascii?Q?T7HNMAHQgCSIUbebLP0OOrYZPEIoF6KNLACG7UnIlcofdUQS+ykItJ7clxYq?=
 =?us-ascii?Q?d15VEwjv7sb8qC6wJ3Nv2Aft33/u3Kk8Qp0zB/NPGQy1lCn/Xnfp9yVokPFi?=
 =?us-ascii?Q?fUslEbCj4KYULDhC6uDzlgypsetFCJcdmi8dpo3F0ONTE86X8XkvTfvptwlu?=
 =?us-ascii?Q?HCu3mNrx05wRtXaEtUq2AW/crEdkk3WStEtuNToiDgxS/Lo3slF4AjnP9HgY?=
 =?us-ascii?Q?aGqRKtMFxrr0t7rQWJ4fHnE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aWzW040TZQVPKpWuT9OI5uQlyMPq1rE6yz7Mm7YBumt7ifDfA4i09POvqO3E?=
 =?us-ascii?Q?qu2b1+3reiBXIEU5NzJqAtpsZ249U7mFUx291ba1dTokswczQqCwxy7d40mQ?=
 =?us-ascii?Q?MqGzJgesIJDSilWmrMxGCPMJ7/GbIglXzLyl5BovW7SspXqadw2On8DXsLs0?=
 =?us-ascii?Q?YPESTRdOy1nb7MclwSKsQqDRu9m9R9VxhZiYJ/T4ALQaJJ5tNnjQZuS15ibI?=
 =?us-ascii?Q?g1QYfxInjvlWHnVK3bWe1XOn1X71mKaWsbDuHbRbG1vDdFlX39HQgbavquT6?=
 =?us-ascii?Q?dSPyOl07mLpYTGBG4ZMrROVF0au3TneXHFcp99Xlkv49hieZ0iUoLJ94g7hv?=
 =?us-ascii?Q?uKYuQtsdK0ChOHoKO9aIw/KFnfjjy3/8x2/zQShrV9GO7tCjoyuFvHIMndtr?=
 =?us-ascii?Q?rDqpUpv06zQFXB84gz7Sgx2eyehcvYiP5xGHqoyG9YFLZQNjOztaQGniWAH6?=
 =?us-ascii?Q?zOWb707qmSFL176Iw3QCxDzGHgShpFPvU0op5gjtyzAWpEYOu4OYI/nYgJAo?=
 =?us-ascii?Q?TcOCUA+CW1wkm3arP3eDve9ixSY6sRZ6Hp/qqhJQ1rL5ucnxZZzXBh1QiJTE?=
 =?us-ascii?Q?CALmLRpsbRmFfsFXqbfuDpQfCQnlQ2fdI8aCECKD8kvVwq9oLoErxIPYdEbX?=
 =?us-ascii?Q?MEPye1cg+YOtBU5ia/gxIvZlZ/9WaelNQJ1oa2R6YjCQG4+s0ZVBv9I465OQ?=
 =?us-ascii?Q?ivu3M1Zz82aLnWhG8OMsMSKvfhoLwi0BzHss7Y3ph/Z5+7h0yRkqBC4eWNfO?=
 =?us-ascii?Q?RAcijWf3sn2Q6szxRpN9be5WJSt2ZbWfyyq4fabt1PA2kZJcK7HqIh8r3Cop?=
 =?us-ascii?Q?SKqh24VXuoLb7oM2k/sP/LyQg+GNtkVJ8wGvXtaMYN00lXbvLFUIZMdxoT+i?=
 =?us-ascii?Q?HsA6zbBxhCzCgmTgcewnC7+4dhbSwqJyMnm2DOmGRrzE7qxbZ5OEF/x/9P0x?=
 =?us-ascii?Q?HgE+FQpXbgpElxn/DLLYpmJwMttpDcaBkNElq2wL2i/du7su9VuKZqwYkXL4?=
 =?us-ascii?Q?/gH7GeNqEmfs0YnBENlfdAX8xf4RPV/eHdUC2OtipbuBpqz6axC2elysgXeb?=
 =?us-ascii?Q?+i0aYSwOuoZAYrYJBIqlPR74cBuZrs6M4OaD4m8kYoFiOgVZQpogAQ+qQY6T?=
 =?us-ascii?Q?vB5hnIdXBtycO0NNP616Qx8Qvb4vjJHnl0gRBZsW+PHTkXnIY+TiSIDkfUpR?=
 =?us-ascii?Q?2WrQIXD0cvlft59gs/2a1AP3f8KUAy4SZP8bxn96085beZAcTdb0BkGi92YG?=
 =?us-ascii?Q?SQB+IUBYPuufY7e9WL4VeFWpaY41WQ9OAE6fi0QJZFFUeUvbhCaatKGdbj9Q?=
 =?us-ascii?Q?500OIe9HvQJUYIQwuR2flGnqk1QqfZaY0d+/FlkcduP8yEydRn5of73OI20T?=
 =?us-ascii?Q?DXsQG1hCofedda06heG0+0EOIbKoprk7/jjaMowogLb0/LewilTAeuqEj+su?=
 =?us-ascii?Q?jw9dYVk9K3+fpgkIGOVKV5R3EDwpk6zMsZ0tMmYfmYX2faWUkPRRza08ze8x?=
 =?us-ascii?Q?dYu7nYz3lZ4kOq8Rc8FbRdC7Ln7PjrD0ay8rI6PgIqVje5q+jpwnoQib/RaT?=
 =?us-ascii?Q?CNa28F5vVsjawRFmm9jsQ+jGqV5ZXE0inq7EPw4f16PDNngdxdqhRrIUC/RT?=
 =?us-ascii?Q?wFetrtBAWq7C9FITT9KeWIRlS3bsgvdCa0UDkUrCzXrb9ba68qMVowPuOBMt?=
 =?us-ascii?Q?P5Yi23/dHpTPlozA0ljj70XjzkHzD3Rp6OiaCFTf+ecjIMJL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d08a7c6-a0a1-43c6-b3df-08de64c9662a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 15:15:30.0023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V0E6/hdjkIBX9HfTr9orsg0Ibc0Pk7KXQoXum9QqJGgNL8MmVjqsMwuZcac8ShH129DEgibCkYG0yaiLYLSKUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9701

On Thu, Feb 05, 2026 at 03:34:54PM +0800, Sherry Sun wrote:
> Add usdhc1 to support M.2 SDIO WiFi on i.MX8MP EVK board.
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 61 +++++++++++++++++++-
>  1 file changed, 60 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> index a1269c7a6cc2..dfcdcc739ec6 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> @@ -134,7 +134,7 @@ reg_audio_pwr: regulator-audio-pwr {
>  		enable-active-high;
>  	};
>
> -	reg_pcie0: regulator-pcie {
> +	reg_m2_wlan: reg_pcie0: regulator-pcie {
>  		compatible = "regulator-fixed";
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&pinctrl_pcie0_reg>;
> @@ -250,6 +250,13 @@ cpu {
>  		};
>  	};
>
> +	usdhc1_pwrseq: usdhc1_pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_usdhc1_pwrseq>;
> +		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
> +	};
> +
>  	reserved-memory {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> @@ -863,6 +870,19 @@ &uart3 {
>  	status = "okay";
>  };
>
> +&usdhc1 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc1>;
> +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
> +	keep-power-in-suspend;
> +	non-removable;
> +	wakeup-source;
> +	mmc-pwrseq = <&usdhc1_pwrseq>;
> +	vmmc-supply = <&reg_m2_wlan>;
> +	status = "okay";
> +};
> +
>  &usdhc2 {
>  	assigned-clocks = <&clk IMX8MP_CLK_USDHC2>;
>  	assigned-clock-rates = <400000000>;
> @@ -1169,6 +1189,45 @@ MX8MP_IOMUXC_ECSPI1_MISO__UART3_DCE_CTS		0x140
>  		>;
>  	};
>
> +	pinctrl_usdhc1: usdhc1grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x190
> +			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d0
> +			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d0
> +			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d0
> +			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d0
> +			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d0
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x194
> +			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d4
> +			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d4
> +			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d4
> +			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d4
> +			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d4
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x196
> +			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d6
> +			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d6
> +			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d6
> +			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d6
> +			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d6
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_pwrseq: usdhc1pwrseq {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD1_RESET_B__GPIO2_IO10	0x140
> +		>;
> +	};
> +
>  	pinctrl_usdhc2: usdhc2grp {
>  		fsl,pins = <
>  			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190
> --
> 2.37.1
>
