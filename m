Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013043.outbound.protection.outlook.com [52.101.72.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FFF13DDAA
	for <imx@lists.linux.dev>; Fri, 21 Nov 2025 16:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763740835; cv=fail; b=QP6zYC3n6UKjvZsC/hhkuEvBgEyCz/YKXXOoTGlyJzn2GemYmvdvWGLToNWiXJUUauDQdm1hTZAGGyLp669orx3EU/NpjakAp4ME0KD+2tBdPbionaCcLTDI8cvbrLX3NTKyCvMKgdO9dt0mkr25V5e/eDgoDLuqub0lepkNu70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763740835; c=relaxed/simple;
	bh=yN5EiONgfcYjkAQ8iOfaN3m3Zu6C7JUGsbOGZAAnFm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FjwTAUW+LBkMhR+tyS/hBomjBZw6VLXdqoPbvN92lP6M0qQi1/lKIO0naqVSLRHILG1RKk9zecp0IBpcd6MYKfhrZTHzkyYbUsNllpsEoTebsPK0wOLhAgSJwGyC879FiPogkLpeMuNBY7FsQ91cGId7y8ILHayYwisEK4xr9n4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eeFDJjSe; arc=fail smtp.client-ip=52.101.72.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eeFDJjSe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uEiyvbvqfKl41gZNYO4nlhSIcYtW3qSlFN23BsY34Y8gQ6Ad+7th7+Yx0Eb0OdhxqBtGM77DcUGchcFtspky5IrEjdJw0TW3nxHTg44LtNLkfDr5eo45pr97aBTSgbg3Zqbmi06bp0iex6hnWchmYxVNa4tR0xEC30Na07hG8F9cxi9P99K8BYiOuPq2mjNPg6tOrRHlT+POfqnIaMEdbUn/U+A13cIh1aCR8F1M0Ky+9zDmxt6X9EzfTNwWvYgkfcBQlyF0/kSckNBdF3JGufG4nTLXNF56QY0039soAOAMsaDbWSVWGVp8zR9SENHYX6GULrhnw/QWY9YsY01x+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6LUrUN61H4NCKG2u2sj3TXbS3WTwmj8MPQ8Ig4tivA=;
 b=gLH7TY5L8jATA943sFjQlve6xCZ66xYH9ZNTDzhjGUa+Lroo6I76AnH5ZxSQvKLtUynXYs+MMNuxOjNYn0B7Th0VBziIy+J/LotVr6TDT+9Z7a4ys+R9Tv0EeFpD0Zwbe4Nxt2CjiNBCSR9LVIROGzsDGnl4dTZILRYQC/Rg0SUz9kdQaWKh1RYTqZU3YS9UdntCBzDQ83F45fCbudOG3qO8pI/7oe/wHRgbwGiyIbinMAq3fh9AONDh1rzzrow6qTlozL/XSYo3/RLWOulkZ4EFX5gPGSVOA8ubawjjwsT6SoeLj//UhWbasv4af4RGwbA1urFGsFtpIMl5YMfFcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6LUrUN61H4NCKG2u2sj3TXbS3WTwmj8MPQ8Ig4tivA=;
 b=eeFDJjSeKBIreGKe86fEz+WKqbpUNmhJ2vgTPDbczRNBT2hdrAOk4/ENdUPAbbHnccqjYeqEE/B7mWk8/tem5D116iLRBFYMsNMm6pppHr5tiaj4MGJWXDPKLnrTAL3zjkFPOy9cdEdk/LzRZi5QHJXSrM7VhwppxQiyw2+4xvfPVdJ4Ya3oZ89KU6uUxitO6acR8vnV2KEExDUs/w5eVT65GKGGY23R52rY6CnEbyPsiqXqVCN1ZzBSODvMjoswsyxSwXl0q/I3BMN0rVsmGYcCa/jACyT0YsCfrlVn5XEm2/BnTdofOHX5FG9TmPek/M2KD5fhYO1pmLjujVtkxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU2PR04MB8920.eurprd04.prod.outlook.com (2603:10a6:10:2e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 16:00:30 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 16:00:30 +0000
Date: Fri, 21 Nov 2025 11:00:22 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux@ew.tq-group.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: tqma8xxs-mb-smarc-2: replace 0 with
 IMX_LPCG_CLK_0 for lpcg indices
Message-ID: <aSCMllOG4aH5Ced7@lizhi-Precision-Tower-5810>
References: <20251121073142.3367642-1-alexander.stein@ew.tq-group.com>
 <20251121073142.3367642-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121073142.3367642-2-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: SJ0PR13CA0081.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::26) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU2PR04MB8920:EE_
X-MS-Office365-Filtering-Correlation-Id: 41118e6e-4282-4acd-46b0-08de29171862
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|376014|52116014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uOWl2WyKcqv4v7I8jcAh+MYeR3+pPvohUxbRmNCfTMI7cLCRBWRehUWfxSrY?=
 =?us-ascii?Q?wTMI7K/bfZxe7r7Ax9Fq7cmSyiQCBomRshqyV9d89MFLwHJRcajUo5pNLIqw?=
 =?us-ascii?Q?ASqOD9khVhhlZsJ9Q8/ZHrL1e+pTgMi6ecepcxaufnO0bGBzruF0UqndnABf?=
 =?us-ascii?Q?d+1NagDNdPQbaBvQnqVwiuOy+c6uf5detrdL1vkI+hDUnuJEpowKSJPlZB6T?=
 =?us-ascii?Q?knIDsIf2te1/gKDOi4mfGO621QeBEQo1YzmgXTtpZcfq9qq8NYTRBKC1JHB7?=
 =?us-ascii?Q?GdcPABJ3Cc7fWJ9Hn0IVmnexdAKzwHbOMNEWL0n6z7FCh8R1U3RbjgE6DIV1?=
 =?us-ascii?Q?QaNSd6xEQ3PWT7PB40BPW2qbRhMQL8TfM7bDIDzZDs6njjUEu5oJ4K+miIre?=
 =?us-ascii?Q?L0jIgwap/m3zrCyL9OuO9O77iERJWKjgq8HsWRULzMFqHOFLmtu9BbeeT/NJ?=
 =?us-ascii?Q?CC6xzc9F7tGDqPC4mD4Za2ksMeYf8lv81bsvavJf3TUy8EICN1Sdbynf4kLf?=
 =?us-ascii?Q?5IE9Ql1hKfNr3P+L/ub3In5P81shtZeZ0VqpwzX/FFpGEwbQ8xs3C4XNaOge?=
 =?us-ascii?Q?8DeTTir55kaQpUmBd1oLTaEYjnyRnint4rbXLqRqJ0jgniSLSKksiSYc2LCT?=
 =?us-ascii?Q?hOgnozByhklfjeqUFBlcD2nqnD2LrmhBa4esztoxHHyxH2GaOK7XU3TgdDsz?=
 =?us-ascii?Q?D3VbgQz526f3H9jNjrdzxLmfh6m5PfLqvABzbPsDvtuHCHa+fN4acPp5Q02z?=
 =?us-ascii?Q?e+O71tv8M4+9+zdfFSumETlrg+LC3N0vTbaYFf+y/gpayiFYwR7ajgvgwwTZ?=
 =?us-ascii?Q?uJXOv95RwZrQC5YTTFirAsw8UIkvE4WjrDqza8vV3F555vxXNrrl+MPCoMDH?=
 =?us-ascii?Q?tuP2ElJczMHv24IqmZSBzeNoFJnolt1HBKI7RLG1Jm0HyaCooJQYprm+g07y?=
 =?us-ascii?Q?oWH3I4CmLSTX9n5v65mTP6+9absFnmiNyS+yfUyFjzGLV9HA/1GGnu1+FJFt?=
 =?us-ascii?Q?dlocLvtP2iIt2cY3kkzq/ooN9kTX+FmSbF0x3oyQweJs+rXiPKaUNz2EACu1?=
 =?us-ascii?Q?/1mdMRlxtcdHvRVH3l5UTEiSYWK3rhVk7SYe/LZpR2tqqt9rKHH+HTPmwqkt?=
 =?us-ascii?Q?oHIyy3T2YGoWsSf3iK226IbHhx3fw/gAOhdxA0S7VzcOTwP+GtTQT6JWx4T5?=
 =?us-ascii?Q?cWY7jqhdjxa1CJtEURGiOBf1mzY9B4PqtWlbZHz/l2KBzyOQ8yUBZxHWcN0Y?=
 =?us-ascii?Q?iE3GizQrLNklTWz46dJAlxqpkbgcDFYAUjNT9GLUhbuD9XZoZFYu/UYH32Ua?=
 =?us-ascii?Q?qyi6/wAYXMC808vT5kvKk/beq2eTH725aXo9OEUVGrF5OuFfC33NpKiulPgc?=
 =?us-ascii?Q?7NA0O73Yj6ecTV6ou+xgJEI7g6XjpIBFmJ/GJ4Zl5akl/8KUl9U72ofiiS9t?=
 =?us-ascii?Q?O57O7le0q/5QxkwjBVX9JUWofWmIDHpYg2d32U7CN52WbPpy5H198P4GzF2x?=
 =?us-ascii?Q?Da9ESzW5ckkwoOKn9xLelbxV8yKJDpeUcCCJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xnd1M8h35d1DF8+qR1uJMvHOCPa9UZmk0fZYbbmdZFe3T/guNsL2ehl2tvVk?=
 =?us-ascii?Q?Ogu514rAAH8LHrwRiev2LyMqM3v9j0qT+S8rEAXru8sdlQJJp15FXHEfVdLX?=
 =?us-ascii?Q?Yq5Sf5nBeYmw5FML0XANdOCWq0mMsFEeKqzPx2CYobQ/Ndqr7Qn3zJ7Y8oF1?=
 =?us-ascii?Q?X3xSZGIeam7o4lH2knXBAR8QuOpmtNEWHVRy1jhgmi8VQmdgguNN0egyXUg+?=
 =?us-ascii?Q?ZQEKDwb3ugU9bNHuy8x8S2PzRAx3VkYUCmFQqT9FRf+ZS8mLuiCEZFObpGln?=
 =?us-ascii?Q?BhkYNZ05Tpwc6oiYM38+QnAJ0Xb6vEcazEkS+SlDGomvOUefgSn/lqQI7I5U?=
 =?us-ascii?Q?lHwohJMyTYn59OeZHb+WqwGJs37c8eW47Urd0P4oH82sBx7MwvcbxODrGDUj?=
 =?us-ascii?Q?sDDJt3Fq+KC+2xCmsZVzO/cDwQVLYxg1SYolQteNA46I7QdQWZMEjm4LLCej?=
 =?us-ascii?Q?LbdBeG46Xmiz88a1qnbIm5z10RQ+2P2uJuxppLglgMMOljvu2o7r5VGG3PQf?=
 =?us-ascii?Q?GufCqmzc7YjSz9+dHiHe5GzMegspBrSpjm6Rd2dNq0uY0uhnTEx0apiT7v0K?=
 =?us-ascii?Q?ReSLvfO/QIzUqAYeQFN/fWoPtOvVWfbOtYhyJxkARZH3DWrTsAWvWHwm1Kbf?=
 =?us-ascii?Q?Vyo3wPhiCFIztt3rG+lbe7aZ1dZNx9iMrqRKzoVynSUG32+JLnd+fgVqnjFl?=
 =?us-ascii?Q?HnDglgvJxutVffeo8j24G5IVMyVK1NASt6Y0dzrRJoL2h/9FqJNxNMHrbakm?=
 =?us-ascii?Q?EK3Af+0ZpkblVYt50e8NFMK0q9sXv/m+p6Yh8BQMkGHqKPhOv5JJ90g2GXV6?=
 =?us-ascii?Q?VfJ/ytCYEqs8/L9RHsI77c/isHaLuDO9MIZf1d0lbCzn1sowSnerefxa6TqR?=
 =?us-ascii?Q?uRPR/79gvo9qoB3dpieFbMNvtfhg69mbOBr6HVLpYmB6BmkZzfalPI7U6T0a?=
 =?us-ascii?Q?uzveK76SDZmJmK/WUOZLC1Z2w2JKimNjLubzuIU7osxYfG78eLSbZHclCVBL?=
 =?us-ascii?Q?1SgdkNxpOw3bAfiYzHyXl3kCkYvZ4Ro0G1lrUqDXPURKnT+KCE0udK2+qxj5?=
 =?us-ascii?Q?+OhrSm1mJIhAqt2G6So7u3AhQzTilnrpbXr4UEbCSQmFWo5jg81ey6z0n9Rz?=
 =?us-ascii?Q?NbbCWlzGyi2iZq28mpE6Hj0jp6QgbNvAgchQ4s6lyV/MMQ2gyH+Yk6xORacN?=
 =?us-ascii?Q?1D6qYMW2GPxZLyh2hLGDfNU3FwhSjJFQ9XXfdkJD8rADWpktWBrHWs3eqOAs?=
 =?us-ascii?Q?EIEKxAQ7CUNv7aH9ESbzPmKuJ48PEapwtiVXsvs+acPKkGtRt9NFsI5rqhWR?=
 =?us-ascii?Q?A1WDOQn3k6rJsG45DckdnrOrkkBcRXFOquLi/EbxRWQWjHUHFbI/G3cSu7i5?=
 =?us-ascii?Q?v6oZAswrAAdrXzud2xTDk3oehuYeIxIuDxFYAHKXtGRxk7PdCn35O3khAifn?=
 =?us-ascii?Q?onQgVa8uKLiGsaPzqnh8rIRndLfUQ2BjB7MDCn7b0ugVQ/9bkaOXvKZZEkU3?=
 =?us-ascii?Q?eW01XH26y6ha2FFs2ZFkRItCOzAGGYQ39KRBTiBce7lyp53V8L1zBCMZnSsy?=
 =?us-ascii?Q?wMC9gJFgYzgqembx+ICB9dYu9D+iBUwbx98eQy2L?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41118e6e-4282-4acd-46b0-08de29171862
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 16:00:30.4179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g+G0Ntn0I2A2PSrOFD+iOcCCXQr87NN56YfGk2RWuKSWLq/f//kHUfDbvPxRBb9WKxj6P0I4sDg9XowO0XTz3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8920

On Fri, Nov 21, 2025 at 08:31:41AM +0100, Alexander Stein wrote:
> Replace the 0 with IMX_LPCG_CLK_0 for LPCG clock indices. Although the
> numerical value is identical, the LPCG input is defined as
> IMX_LPCG_CLK_<n>, so using the symbolic constant improves clarity and
> consistency with the LPCG clock naming convention.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi b/arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi
> index 3d20e3bf32ce7..8bfe77113d64b 100644
> --- a/arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi
> @@ -130,7 +130,7 @@ &i2c0 {
>  	tlv320aic3x04: audio-codec@18 {
>  		compatible = "ti,tlv320aic32x4";
>  		reg = <0x18>;
> -		clocks = <&mclkout0_lpcg 0>;
> +		clocks = <&mclkout0_lpcg IMX_LPCG_CLK_0>;
>  		clock-names = "mclk";
>  		iov-supply = <&reg_1v8>;
>  		ldoin-supply = <&reg_3v3>;
> --
> 2.43.0
>
