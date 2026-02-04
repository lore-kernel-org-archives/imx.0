Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013021.outbound.protection.outlook.com [52.101.83.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D062D8773
	for <imx@lists.linux.dev>; Wed,  4 Feb 2026 15:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770219309; cv=fail; b=ZrwFUugMNiLa9gEossP6Aasy1FyE+kzmbLVmLnIi8RUslpqznj8FPESewF1gQRfjt/9/g7z6ZJ7w6dseUifxRQCTpeRpZRcXJXrd5cdgWLKUVehcZZksnWnWhSYCBStvePRE6bzMSN5jxFSLy36E/cx5I0DlW+IA6hlPmCaXId0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770219309; c=relaxed/simple;
	bh=Vfs3/pYiuftiInwgMuEjfE1Dk4svwx0fq2IHVN2t5R8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lnesRtwbxLGYQtsPbLmLhev5XNpwDcU+RtapSVhOC/4YHGeNEkffNBJikEPeFnu6Emx3SvBxcan52dX5My4k6go3PRZ9BBNXHSHZgIFvMfQzUfdDQPgxlrrlmh/g97uiBEGLFCNv54HGQ23gZ7csccgGRlGDsFAz4scywUnVSKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cma8ujvw; arc=fail smtp.client-ip=52.101.83.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cma8ujvw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AB2nEKflF7yQ2loGg8SNInFzt8sd2YbZgZz2J+gJDAQBMYWJiDeBsp+3GTa/VQ2WKb178S84iy8qh7HkfArhybu0oWfKXVssrMQZOiRrHoxBZXZ6fz2OOJZ+AmOHFTsNSCM4fVUKMIYijty6MMjGD1+T8MzIfZ/qxGiRGCtNYlARF1kfYKb3Rjf9lEE2ydW8xWYcR9if6FXJ5Jg96e24vH01hcKZ9D5lr8LwNGUUP3G+kU0qKtcRW3ClDXK+vdad/vki1TSkYuhWdZoE80oM/u6DFPb5317mpJtZE3/vzg90Tm3zh3PfiHUeOlmpL89MYs7WJQRiqurOFfyrYxdu6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/dcl7kJhde7IIJvoNkZ0CFvGmeNnCDZhmUE05DA8CMM=;
 b=eCAv5m+TzB3sZThuR65bK8KmZ6vFqsTcXD5+rHJSPVdg+/fE9WyA2K7vqizd0HSqO82+y2iPSGOffCNxGw8jU6Y4dALhyKy0YE0klRytjWzDm36xgScDdnTpOLrIx9c4VeH5kws3wbbh5pUzs4srrcKGDhp9v4gMru7v4T122iMrjXGLGsYYBTvmENwBW5au2BI7CPZ3yyDWmzpJRXC7Jkaaeg+kzOk351klkUPav5RDJjM2EkB3UJNN3/TILRPv0HIUofKFibwuVad4WCVmK/5WcftThfKOwPVbeduYEVM5+RcTIj6BEFKlacQxKbFvJsIaYoY9iDS5sgpkeT2rjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/dcl7kJhde7IIJvoNkZ0CFvGmeNnCDZhmUE05DA8CMM=;
 b=cma8ujvwwW8AaisVz3r1QmBEMEe7kII3Mki5deb56273slPX0GiXFmIHU3EG1u6ayXGVXhKiZFSqeW+t+dUKOdXJMmP//MPYJahD7xQi51xCgHD/SdSw5VA2V6TF2c+CwE0t2/SxLZcAxkP+r/Zm4fxYS+lVH+HqH3VmA3mRYcRjS68jTpc7nHvOOegWslGSQdFInXrUHx1l5uNhSWctXP0mJSdlcE/KlHV7/k9dMuPOX+sA5QSU9cVucTjsD26X40IfECT9zS0miGjv2IFNLlfeumBnjcKDTXA6YCTxM1NVgf62A3kd+bK5OulWiXhg5Eec7xnTUccGhbYNnSg/1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB8PR04MB7179.eurprd04.prod.outlook.com (2603:10a6:10:124::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 15:35:05 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 15:35:05 +0000
Date: Wed, 4 Feb 2026 10:34:57 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: dts: imx8mp-evk: Rename PCIe regulator to M.2
 WLAN regulator
Message-ID: <aYNnIZ2KFiw4ovxe@lizhi-Precision-Tower-5810>
References: <20260204023204.2382433-1-sherry.sun@nxp.com>
 <20260204023204.2382433-3-sherry.sun@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204023204.2382433-3-sherry.sun@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB8PR04MB7179:EE_
X-MS-Office365-Filtering-Correlation-Id: ee0a1738-794d-491f-3045-08de6402f882
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t/IF1wpa3A0g7AOQHS49VXz1v6zGgt9HmQCXsGowHRWuVBZoUmFChtfTdf1E?=
 =?us-ascii?Q?fBGRP8UG5px7h3jfV4psyP1ZE0f0aTDbJOSliuE1KxHq2KKvnv6/Y/FHAm33?=
 =?us-ascii?Q?8ux2bMMPU9iqh60uxhF4S4PTHNcA0TcRymS01qtHRmDfjlXJI8ewEBUXBrmQ?=
 =?us-ascii?Q?fO8LLF/3jw1BT5akT/jqx79/DUkh9uNdN1EVmLMwxe927AEGR/Fr8Ti8knnY?=
 =?us-ascii?Q?2j5+D2b2zXvr65BpqqJeXMTvt/g2I4Xh6DWYG4e6KaTlbs8BCxtjKUxZIAeT?=
 =?us-ascii?Q?QMPeqQLrLHaS+eunOf0xk2maONYjcIclwjtswl5gH+sjaU511oZ10EGer4zp?=
 =?us-ascii?Q?LJWptMpYXeRzd9XFI9DmbZRXEWKSpc7FB+R0mYPm/Rw/ui6nC0zdrMjnyUjS?=
 =?us-ascii?Q?DBHFQSbPBQL8oeOQ2QZAqzcxJ1jE2qwmOqK1zsd4SXMVO5nWlu/oZe4qgdDC?=
 =?us-ascii?Q?nv6KzPkxCz9DrN29dKpnyW4Fj57G+sFgMvak46urfBUcS4+NshfMcGBdBaS9?=
 =?us-ascii?Q?QuK4Zyr64NfY1FihJKjn2XJHER4yMMSWn6bx0d+7wugeBxerLc4uD+9KMCiz?=
 =?us-ascii?Q?JiH0NFYP5L88vGpr81ssTW73PghfywBWZZ5vN/PJUutvy5NUeOPJnGV/Gcn3?=
 =?us-ascii?Q?eE6/ymVOJRVcBUEueEq/xaCmoaG24nDFJ11Oi3dIgo9huVDS1C1v3L0oUQGC?=
 =?us-ascii?Q?QdkZDTIn0lUZgv5vM+A5b/ku1tix9JQkMdJBzTIAQJBhxXU28UNdcFx9t51Y?=
 =?us-ascii?Q?uC6+vy6iMYD1fM0hV42WqZtMIVoocl0FNt3LP/drYiIxJihxrFUHgijo2Hsy?=
 =?us-ascii?Q?GNCLGrCCfxtR4jogd7T/yTSbMarueFpUC4CIJUuAyIqaXheWy6Q3Q4MYJYB9?=
 =?us-ascii?Q?RIPZl2RfSCDskW8RP70Zq+6dlmI2gul5Y5JK/AMt+QbkVPyV6ciLAhX6FpyJ?=
 =?us-ascii?Q?VAjpL6Ei+lUXrhqj+ToYV0JZbXuLQHDmGcWh2r4s3OXZyQLcr0ec31vRpqK9?=
 =?us-ascii?Q?F4yImmrLAJJPszoWqMFHebyzTAj3tvM3ZJqNMn3qSbjtZ597Zehupg9Wu/Gx?=
 =?us-ascii?Q?4X93Ioyv+VMrNyvhXiybhBsXLzUjeIuKAVMkLxrk7zlFaXNcvpevldQNip12?=
 =?us-ascii?Q?ghtSz9pFrLhyEEPHY6+7E68d3E8ynQWYtxCebZNQBYKMz1CNyPemcLU04OfF?=
 =?us-ascii?Q?GPxURhu2SLOuWey+sPyziycIX/paLDPkcxzHUTrJLV05wACmtU6KFERRzoUT?=
 =?us-ascii?Q?ICFkEI1B9vgERqXnRtxlfmqujR1ChpH3ENHMkGLJGRLrGyMh/jUcFRucLRTt?=
 =?us-ascii?Q?WbVUGfizZQiWof5zGgT9yQioZRxRWQ7nZiSydR2FbAvnk4CCrDrA9NMK94pB?=
 =?us-ascii?Q?txXs8nTZwnThXoP5HmxMY81cL8yBHmLDx8KrNx2TDMcO13fk9kitI13hgy8p?=
 =?us-ascii?Q?T9AbNNz8m/KL420O9o98fVK+9o+5EtnxMjX+2fIdvF9duWdQ9QsY55VL3j7S?=
 =?us-ascii?Q?qxV5vdu+IgfxKSJvW4sQM4lqU5HMaFo1Z6yAwHS7NGBig5emvgsdbzfpaWba?=
 =?us-ascii?Q?i42sj4orJH/6m7YSwv0VweQK3+9+6AXK2jaUslyF5wtJcxIMzCac3JW6Q4zz?=
 =?us-ascii?Q?ZoRr4mULsEgTxt1sp5PNQWk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wCkBLFVclfXmx93LeRBETSc+U7xyXIOJ8hCaf4pa22KQ1+/JwFTzHZIcQ8+x?=
 =?us-ascii?Q?FE20IUKsyIovGFE9SpSoW24UPDUhC5WrpSsTyjfKpSWPFEa/Zk4TOP/VVAhb?=
 =?us-ascii?Q?cjIbRa10dFe1AxwWLRaipQ53rfqKtm9Zsoikh6efcbEKxGZfiHNVFN+2zqn1?=
 =?us-ascii?Q?iLnMTu39NWqJMiuIWhjxn4+lWVKbCIEAdUUi3/6kVh350RLm+VmIiErXAf6Y?=
 =?us-ascii?Q?Xa+jw350ZsJykqIog4/JjXfXMsNiP7A7vT5brzr19ubh0Gaw99WrStSVFpER?=
 =?us-ascii?Q?uc3E9giS4Us/UPDXkNoEVLuLrlVn/pjKL23BUo4f7tRRq4P01b8EuUBBEvxQ?=
 =?us-ascii?Q?IwZV3/4VOrtmZqfJBlIiEbOw9WaeNu3OfZaKty4x7I6i/F+yav6uxzpDcqJP?=
 =?us-ascii?Q?eX04OExze5ML8Nd9/HrLw5PYQax2a7+qHiAxCcIpKHKl0h4W5mscB/FIqi2J?=
 =?us-ascii?Q?jNTZ15DHMXWPtIERcl9P6E3gvKhMMCalE8TNCy9gv5ci31662KCEEWCf3EOq?=
 =?us-ascii?Q?0GpDIdaUiBXhahfvbmudAY/KnuL1fF55QaM1MDGzFw0lRoeThDjZyPUwmejo?=
 =?us-ascii?Q?NYidZv8RNWpNDUxDnhAwjE1o9wsamwdq3kRk73mKWU4h409rq4dEdRGbB1qM?=
 =?us-ascii?Q?LKNgSjRZyCEUg7pZGuMIeXaL+QXjYKGTJ8DQKr0fuZw9w939e88eQtU5Py9O?=
 =?us-ascii?Q?DPzf6Ruzb1oFvO5oOmiNqhkDFhEm1mtENNF/rMmJDQQcn3XbwHBGQiS4oLHj?=
 =?us-ascii?Q?bD7EZHMNWHUb+le+ctBdj/PbYayLNQ5Z3vOeNX7VluhJ7PdkVqnOywhfZ2/j?=
 =?us-ascii?Q?1+lhiKcZggf/YuU8NmvAptDFNAhi8o1rb1ejErPdn03L0G8WvnonEGNzRWLr?=
 =?us-ascii?Q?tuu4DcNulscL+UHT0V683ss7WW4aVQdl3xC/BkC8eZfthP2/HCsibsuVaDjO?=
 =?us-ascii?Q?Lz2d/dlH2DCrlsJzLSJkLUg6ueHYi8foNanF/wNzwI3ppL1roBnhZmsohdM+?=
 =?us-ascii?Q?guQ8o4Hv1O5aLsSsGCmkbGx8RfzbuPijURAFGi4NeQBffOfnMWYFuqcDcE6c?=
 =?us-ascii?Q?qy0O99pG9p+sbLurA2bTvH8fAxoFNAPtFzijfRgQ+ZKtcDhgWFWwGSBdgXtu?=
 =?us-ascii?Q?3Y+wh+ezWcgl0AO9+kqOulpx1tPsakPJAVkyketCEya7kUXaLblmPlv566Fo?=
 =?us-ascii?Q?8n8oXnUiozEtvkEy85SstvWYtWv6j0z5n4FGv+wgDq4zSiX/KDwfRH2jgbAb?=
 =?us-ascii?Q?RAg9rlWhw9gNVSHhAkGzwjcNAPkEiW9KhD0tVA9LjFzx/Xf3OudCLtdUjOXp?=
 =?us-ascii?Q?5hrpwy3K9EQvKN8MyorshfNmxrbzfGNRMmrU9mS0lWh+s9pNKogeiYoYNFPO?=
 =?us-ascii?Q?lxjzW5tmf4kW37KvVsPy1fhmkXAJdey2K6hN5wtPixvv7z3tJrkpv4GLL3oi?=
 =?us-ascii?Q?DZu47Fwdwiz0V9lPL0R6fStzF6oqij3/KQFDecWNGG/NlYjNTHoXRAi0v9QG?=
 =?us-ascii?Q?vigzkdDkbIS9mttQBrDFhpZ4IHys5d3DBdaKiwvVRSRnAuWrvN5lqCq6kqZR?=
 =?us-ascii?Q?+3Y6Ev18sf+Wn3w/O5vGZalQbLNhXpQiwx50XBCQHafXiyY9XP6haewAi4Bn?=
 =?us-ascii?Q?1FB+vUCbNO3lqwF8+/eeHN+3tr4XhIlfPY2bRcU5hbwfjvY6vYFlhRYOnH1z?=
 =?us-ascii?Q?p8LkK+DcIMzRah34WRP2MGm8WTQYlM2wZg5rVoPsHk5j5whcpyy61ufBq01u?=
 =?us-ascii?Q?WoUqhFX+ag=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee0a1738-794d-491f-3045-08de6402f882
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 15:35:05.6884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +0N0vdpKDtuVCga9Ke4mZL7yRIC36t6KZCNNzq86uVk7+j73Zvnb9219bH3acNQNvb7BbMFvbRb3vPKEvgwfnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7179

On Wed, Feb 04, 2026 at 10:32:03AM +0800, Sherry Sun wrote:
> The M.2 connector on the i.MX8MP EVK can support both PCIe and SDIO
> modes. The existing regulator node reg_pcie0 is used to control the
> pin56 W_DISABLE1 on the M.2 connector, which is also required by
> SDIO-based WLAN modules.
>
> To prepare for adding M.2 SDIO WiFi support, rename the regulator node
> from reg_pcie0 to reg_m2_wlan and update its pinctrl and regulator
> name accordingly. This allows the same GPIO-controlled power rail to be
> reused for both PCIe and SDIO WLAN cards.
>
> No functional behavior changes other than the rename.
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 22 ++++++++++----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> index a1269c7a6cc2..f86d6b428a47 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> @@ -134,11 +134,11 @@ reg_audio_pwr: regulator-audio-pwr {
>  		enable-active-high;
>  	};
>
> -	reg_pcie0: regulator-pcie {
> +	reg_m2_wlan: regulator-wlan {

Needn't complex rename, just add second label

reg_m2_wlan: reg_pcie0: regulator-pcie {

Frank

>  		compatible = "regulator-fixed";
>  		pinctrl-names = "default";
> -		pinctrl-0 = <&pinctrl_pcie0_reg>;
> -		regulator-name = "MPCIE_3V3";
> +		pinctrl-0 = <&pinctrl_reg_wlan>;
> +		regulator-name = "WLAN_EN";
>  		regulator-min-microvolt = <3300000>;
>  		regulator-max-microvolt = <3300000>;
>  		gpio = <&gpio2 6 GPIO_ACTIVE_HIGH>;
> @@ -764,8 +764,8 @@ &pcie0 {
>  	pinctrl-0 = <&pinctrl_pcie0>;
>  	/* This property is deprecated, use reset-gpios from the Root Port node. */
>  	reset-gpio = <&gpio2 7 GPIO_ACTIVE_LOW>;
> -	vpcie-supply = <&reg_pcie0>;
> -	vpcie3v3aux-supply = <&reg_pcie0>;
> +	vpcie-supply = <&reg_m2_wlan>;
> +	vpcie3v3aux-supply = <&reg_m2_wlan>;
>  	supports-clkreq;
>  	status = "okay";
>  };
> @@ -1067,12 +1067,6 @@ MX8MP_IOMUXC_SD1_DATA5__GPIO2_IO07	0x40
>  		>;
>  	};
>
> -	pinctrl_pcie0_reg: pcie0reggrp {
> -		fsl,pins = <
> -			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06	0x140
> -		>;
> -	};
> -
>  	pinctrl_pdm: pdmgrp {
>  		fsl,pins = <
>  			MX8MP_IOMUXC_SAI5_RXC__AUDIOMIX_PDM_CLK		0xd6
> @@ -1119,6 +1113,12 @@ MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19	0x40
>  		>;
>  	};
>
> +	pinctrl_reg_wlan: regwlangrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06	0x140
> +		>;
> +	};
> +
>  	pinctrl_uart1: uart1grp {
>  		fsl,pins = <
>  			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX	0x140
> --
> 2.37.1
>
