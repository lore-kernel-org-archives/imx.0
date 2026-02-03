Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013016.outbound.protection.outlook.com [52.101.72.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537D62D5C86
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 15:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770133065; cv=fail; b=gxEZuQt04gmmCMqMMSBXesmD6r9Tep8h69xWOx0HsaEahNzF58va6yZvIrjyMOlEhOYO4+Q/ipG1f5naBjGmNPbPCF/bZqbtrldsobo8KdGZp4B+3dCidbCkdby5C4VoccAg9/fVT6dsXg53HvEd922WQYAFw45S2U7ARV7VI1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770133065; c=relaxed/simple;
	bh=GVJ8ZgbuTmf+MHApWWpocTTKziOWxS+LzOL5BnOK0sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KKO5tSoYZN6jj1ZERNwDPvpxxXIlPYo+QcqWgfmy6RXgJhezj58r7A5WGbUaKGUnN3G/lb3DoV3tRJHO/N/Vj1Exf3zZl1rxZEbBQieDmz9H5RQhPJpqVM068+xpurQOx7bANHhpkwiwmoQCgDXNct+hiF/f8BmlffuBZac22fM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RMXnnjT3; arc=fail smtp.client-ip=52.101.72.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RMXnnjT3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eHKnyzAreblf/oC82DlB9qJgknKlpPHMi5FOw79Jm2btlhnRMrb5pIpiv7hqdEXSIZAhGYi1vkb7mbcUAybikEXVypbNISwUZFDZVCf1fMBArtbIMk+Bvn2z7TMOQEYQBDj0vbXf8+GbZ/yc2exSjjZYUMNps43TbREcPNR3K8w08e4HFGa5wdp5fND6q+lpp29O2nc9lic90oX8I4noFtVHnLuXiUJDa/Ois70I2oydRJh/v+6t3zqGjpWhrHV/6IfnZyGXTZKjcKcFxz5yM3ptCas2P6RHKl8KtiSFKGzYU/5u5dll1Zc0+orV9sK6jSjFnP7zjg6MxlEcPxMEEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvKwWc0CuHl3K7BQU3KJCDjYySBiKgX4p6MoLtDdf1g=;
 b=Ftx3RFcDWRFv+frRaQbCrqKhNSIhFSiIUIGYBQpfmhDho4eO0rRO/b8NwUQ7NCQSxFC+bc/eNFixq1OOXp/3w65OmxI9L2n35gQ5mQEaP78+TnTVXsNbKJ/lFq5YJcdLZ8C8yfLuaKQ/2E7qookZrmAuYgmUZZ6d/CB0zejH+uA00DRlGyePCMxxE+5cxAxcnHki7fjrlZLOWdniS/NUxcPxBb2l0WIaAP7kBOH1+E+fNjBCEVc8anOZp5EXPx832DYbCc2qU+B1s+ZdZaMbc+HNGkIXA7MMJEYb/ZFoZW033jqnD4mZ+7SgmUwY9R5g+k2yBW4Z/5Rn4yDVTng+HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvKwWc0CuHl3K7BQU3KJCDjYySBiKgX4p6MoLtDdf1g=;
 b=RMXnnjT3/cOcW1ddt4j67KEXPYMC+6CL7yrtiwVSaQ/hebyqTf5EZ3UiRcW5UKRaTTT6UIY9aG1Tz8vyQEEypOudzOQeaPAgrzzUu4NV6YK5DNofkKjrGBGLpJJSaFhBcc0SPiqQD6HsYQeKmkdwJwvIrvwd77AR384zLQfVx9LAlJl9JPKTBbadQTQKY+Hw+7jSJ2mWGbTVoKl6+n8aPxYCqiCTRlk36Rt4qWxo516QefKq9KiX0MKqIMLeghw1ZyPyPM1bdxe8mFvX5rH1tj4PsF/kdysnZ4XdF4t23NaEVweUmyUuy3Nzgz/h3aG3J2vDLpWmVMkaFUu5xBbETw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by VI1PR04MB9809.eurprd04.prod.outlook.com (2603:10a6:800:1dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 15:37:38 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 15:37:38 +0000
Date: Tue, 3 Feb 2026 10:37:29 -0500
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/10] ARM: dts: imx7ulp: remove #clock-cells from
 clock-controller@40410000
Message-ID: <aYIWOfJDy5l/pI0D@lizhi-Precision-Tower-5810>
References: <20260202-imx31_dts_warning-v1-0-434dd2643c3b@nxp.com>
 <20260202-imx31_dts_warning-v1-8-434dd2643c3b@nxp.com>
 <aYFU5w1LpxoUiQH/@shlinux89>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYFU5w1LpxoUiQH/@shlinux89>
X-ClientProxiedBy: PH7P220CA0152.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::10) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|VI1PR04MB9809:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a18c00c-bed7-4f8a-b539-08de633a291e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yxOR7qNdPY0cPxnRiKKLflWLOdn2qSTy8NKMiFqVDu36BkX+SkqAD/DY8TuJ?=
 =?us-ascii?Q?QwXrUkMyFRaEM0KrLNprLzFd6TcbSbSM9MlcfmIH4R0XDeL2Fb7Q/vH7bo8T?=
 =?us-ascii?Q?ebmXCyp0nI/DeKHFZR1sx2BcGkafPiOnyF7qmBALyEqSna8H1vaTFvK5aY7F?=
 =?us-ascii?Q?i/72YmJnDGUfc2sNXWfwm4NR1/lViyunE7PpdgAsI/B45kawAjVJz9jSK6m+?=
 =?us-ascii?Q?iFpkd4Tt1if/t6qgrkBbcTmERrMSnDC7xBWcLF6QpCtgHiDhdv8gELCIZmxm?=
 =?us-ascii?Q?UxUHdhjwsKCFYLYUSLTHjp4173tg4ZXUoJ1jF2a5xT7VKi9rMiyPwN7yUBlN?=
 =?us-ascii?Q?FlIAJKY2qUkRMKzhp7c8t3ZwHam9AF7mxlKd8+MpARQy0mLmFHgZQ5y9ZvPu?=
 =?us-ascii?Q?iIRaXw2MDgh4FTDJOtGhhBuNsT712rU2JiBnExdIO18QJljOKiGOtXU5EO3H?=
 =?us-ascii?Q?royIU86aWbUCIxM+Mj2mX+NH0AUy7RsKVmMemnDi+tKdbyfFWIAhA34zgEKb?=
 =?us-ascii?Q?RZ5zTwV5hHyTFBxqtZHmQVoOBI1PJjd8j6DgFh3yX57T1cwwXWYFMo1wCZDZ?=
 =?us-ascii?Q?FNgOyJEjrfWOaMIwzB/Pqiqsp+BCwmkf8jWRGYK7Mgt7dTdaQZKe2g+xwat5?=
 =?us-ascii?Q?Jx+suKyfPH2PdaA25fQcgoi7xp+R5DbwYuS5VlN/KM9OWH7ztfYWd2yv5Xll?=
 =?us-ascii?Q?iS6h2keGu+f3iUxy9N415CsbTvGqtGokU49GYMWwLimEziDGa38FIPvv7F5K?=
 =?us-ascii?Q?giJrHPP9y89/nJEdX7yVWet+knuFoV3qHs3JRv2eG4NcQDxgN/SlyFWFhwFl?=
 =?us-ascii?Q?SB2DCWUPXxp7XBYm0w7HaUAPSysstUncgHc+hhvWy7nV5DEktGWOD3UZVyVJ?=
 =?us-ascii?Q?VZEuCiaS3ZZfwq6cz2w0+gZLO0Z91HZPUQrDT2sg7PL6gsBeBRJ6ztROlzX1?=
 =?us-ascii?Q?LYSl2+Oht+kc4SCAk401uk8Fah7DAYaTrSktMRq/iQ4y14ZZ8O2VBUQkomiY?=
 =?us-ascii?Q?Stp22DH3/VEd+PG0oeXIIsnepPk1ru3fDz64tOgzO7lUpThWIdqQoXciW1f8?=
 =?us-ascii?Q?WEs1S6ocjOH05CK91GJsZ0hC1PZL121NlFg7Wq67X29PAZZE0NKZLDeaZvIT?=
 =?us-ascii?Q?eOmKMJAEIt9CJEp1aUNNjLgKT+or23Gg5H7VlVss+YBVDvhXFfmuwo+S5mWp?=
 =?us-ascii?Q?YsNquXWsJ/I7VJa7JbORE99SPH+k0iziT7VVMeFJh8Vz/08KJd1s3sfJOInd?=
 =?us-ascii?Q?S4W/3x7odbgIkloFxwvDCycJsqmb9WSCSE6TnAkJHOgJShFRHg/aMxOkMwTp?=
 =?us-ascii?Q?IO6P9eb/CDfvhowNY1SDh8cfD2QtaVdyNZB0YZL5JURSg8KqQZ63RmNfqzQG?=
 =?us-ascii?Q?thHO2Fiad8koMVRE4prfzUxP257CHOOfUlGZO2zV59RlsxulwkOOlzhYfqVV?=
 =?us-ascii?Q?BWTiic+78IZgE/7ia77qghrCqClY254MjU4s42BQEAWwzw0QkF+nsUsl8spl?=
 =?us-ascii?Q?6R+YOUciJELuh2fagKodbqfh/bSH2nVqr0lUIulloB+aAOFTE5+ibSqURfuO?=
 =?us-ascii?Q?tt1F1ZNvljEk3BoLswXJOHqLBnJixQOAsbaWhpgkMg1fGap0fkFFFwRJweAY?=
 =?us-ascii?Q?g6SCR/Iw2Osr0rvlNnVQPYI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/UpUB2/Yr9wqkWsWxF4soToHmBK7HVn48cqUszTsKsE6mRwnQEQ6EXF7QFmG?=
 =?us-ascii?Q?VZuj6jnJ3ClzZJKUeL/BYI6wcuKHK/0MRjuZFVat5fMlIN1bFoKrmnaNqyey?=
 =?us-ascii?Q?nKS71OkGTlwN8JZXzwONhasiar0P6gnZ0FlpY0Q8XOXigtJzEpEC9pyF9wK8?=
 =?us-ascii?Q?QY9VvQuiIDeHPNvvLO8L+xJpTQRmY0ADad+2SYczLLxCS3uaFSQvAvCUBCsa?=
 =?us-ascii?Q?TsDZf/Tvf7ts7rIXIybo7AGeCzDUcvNylNPV56luiHHfeoWCeDZAigbxSxZN?=
 =?us-ascii?Q?I/upqnNzcwS6iEjcoqkgoxlb3qCUVoYRpnIKsigKzbeRTOysqLL6Zbf5c52V?=
 =?us-ascii?Q?ZRHUvkTzKElpGx9PKjwwYlpCNAVGkhG/fuvKMpgz6riFbQCs+3xSQHBL1Szj?=
 =?us-ascii?Q?0si1AVSHfuuil1Vi6lOs8ud6C+h6PiD3pHfDqeu8QhX/GFFtzY6NG69bEcdW?=
 =?us-ascii?Q?v/MLwo4Rr8IqfmaXDiWpWDjiyRbc4nBeQqjGYw9AJCXY7G7/0gIb2TIlD/Ic?=
 =?us-ascii?Q?ZPewZSYehEIL7L+4eJmXop1AOtXj6MStBrxOuQS140r1GVt8w/myl5I4h+dj?=
 =?us-ascii?Q?5tQ8bONAEK7IwWr8Oy91QuNfduu4DQodCBFfTu6m1rK0A7jsaBVwKMO/n4xR?=
 =?us-ascii?Q?yjhy3PjL+WfgtaBeBcfZS1ZCd8CIHB4rWkUMdinRsuqgw48Q5EIoSl/4x1IX?=
 =?us-ascii?Q?rUi0NLmkMEtHNJgIc1ijgWPvHF92sbXTRMD2mtYGoml6fd7z+LcyIODqUc9r?=
 =?us-ascii?Q?Fcn1mWsstQm/PDs0tGEt5D6eZlTwRNERm5QaLqklHQPQU0ldQlpqiyOKIPA3?=
 =?us-ascii?Q?xpv1r1McKzVDnzQeh8ONF86Uu5VqaJuRCOBJsywgepJcLLCRYYntDaPmn+/K?=
 =?us-ascii?Q?j81w/OigogSlpHoUxVFjGeaYllVl8dgzd9jOqArL/Rtmzef4pdA7jmymeIMm?=
 =?us-ascii?Q?MR3nhypP57DAQ8XcHUi4H9HZcqKS0B0lhUf34VQNrPZzDES1/obZP8Yv59BQ?=
 =?us-ascii?Q?H96Y5jr5TuvvsaXUVrXonygQ+98ykYBz99cUcyXAdg18QJvL0NcU7XBi26w2?=
 =?us-ascii?Q?fZfnN14Ob5qhGG6hgaO8MP8lP5TtjbAILJKnjgpgC7iLCY+z1aXkADOvgNeE?=
 =?us-ascii?Q?+SB2D8OzJiLct4UCzR7HDqanuJ2hwn7LglTsRuwYvKk6mxVWxRpy9Kb2bWCv?=
 =?us-ascii?Q?yXBC9xvl5bS54cYXQJIcLg8f9UWO48jkIC62TsnjZi548XfB32CzFSXBOCV0?=
 =?us-ascii?Q?2uMTIPH6q8/550TIpBe17XqNmYTn9lwli3YLMkUPi+2/pWOKgzVC+0NVsX8b?=
 =?us-ascii?Q?KKm0mlwdMlrjPRqcLrPAURUv9Opk7aTgkMOOR35A9T1JIRX6auqLXMw3Hami?=
 =?us-ascii?Q?0ok41N/xzyfFKhTeRpQWWj8+gbwwCmOCNaXBjqV/z1KpT3fPzNip6sFEqyzn?=
 =?us-ascii?Q?pk8EUqBlwtsft//cUCOjUq049VgkM+6GjW7syEsnbaIpeqXUg9w49sr8m5jI?=
 =?us-ascii?Q?iFTI/m6YCgRhDXuytgoAjQqZ/idDp2/cztfv/qZu5IvdkRdgh79FxwrLk5ju?=
 =?us-ascii?Q?kdU1Z9rLejNyqrbLTODelK3yZN9Ddeu6dsjfkw+LWX69bheDBJNVp2YHckQl?=
 =?us-ascii?Q?eMfXkGGFcf84Og/fm7yk9i2+NVxucpBq7aAdiqaUFG0O06QCWFQWVEPFgjBn?=
 =?us-ascii?Q?G0x3YPfrQ/17S+iglTMrwuFujvxHX9fB5zsw+JUGUoOys2e0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a18c00c-bed7-4f8a-b539-08de633a291e
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 15:37:38.3843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: orbaVCUHR15n3GwupNTuow2nTO3LN8igIMLf1KjxcBP8lnzKIlRxUOFt7SLl+5Ogeg14xbwt+DkfgkxzAhHHQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9809

On Tue, Feb 03, 2026 at 09:52:39AM +0800, Peng Fan wrote:
> On Mon, Feb 02, 2026 at 02:43:25PM -0500, Frank Li wrote:
> >According to the fsl,imx7ulp-pm.yaml binding, clock-controller@40410000 is
> >not a clock provider. Remove the #clock-cells property to fix the following
> >CHECK_DTBS warning:
> >  clock-controller@40410000 (fsl,imx7ulp-smc1): '#clock-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
> >
> >Signed-off-by: Frank Li <Frank.Li@nxp.com>
> >---
> > arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi | 1 -
> > 1 file changed, 1 deletion(-)
> >
> >diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> >index 880b9a4f32b0846a773dbf9ad30715c84ac2fda6..6d8853d36d930aabb98fb57f49d6153ca6597561 100644
> >--- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> >+++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> >@@ -291,7 +291,6 @@ pcc2: clock-controller@403f0000 {
> > 		smc1: clock-controller@40410000 {
> > 			compatible = "fsl,imx7ulp-smc1";
> > 			reg = <0x40410000 0x1000>;
> >-			#clock-cells = <1>;
>
> Need to fix binding, this is a clock controller and needs #clock-cells to work
> properly.

Thanks, strange no one reference label "smc1"

Frank
>
> There is a driver for this compatible:
> drivers/clk/imx/clk-imx7ulp.c
>
> Regards,
> Peng
>
> > 			clocks = <&scg1 IMX7ULP_CLK_CORE_DIV>,
> > 				 <&scg1 IMX7ULP_CLK_HSRUN_CORE_DIV>;
> > 			clock-names = "divcore", "hsrun_divcore";
> >
> >--
> >2.34.1
> >
