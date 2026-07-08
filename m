Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013015.outbound.protection.outlook.com [40.107.162.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A373E9C3C
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 20:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783543539; cv=fail; b=CRg5buaUDqYvCRb7UHLvwQnAuKW3cjS2gNW2SrPdXtsl7TKE4CcmoTN+ykUGdkuM31g8ispDQ3OR5PGoGN0cNWH0HNwfPV7wEYQ3azBZO+kDbingLwMvOl76SReA04A6trPxvJpjlg4DrKilzqvHdgNswd7Ofpw3+7AAwLVhbzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783543539; c=relaxed/simple;
	bh=LXiblZKlMk3lZpKrCIl5vYqKgfOJ9BqcUGzl8tmRsqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PDlZwW92iFA8DTVtMZwHTCGsbjkVFYMzxTVVYPq0PyZoH2S3ho3uzKlME8+KHiLDgyhR9aUHhdpw430HVp1sjuC864Tw3R/3JbhryRlFCgDya9aO/rq7rFTJ1YUbC6BAQyU0P6WYmelqPQb/nVW/trKTtoSb16ES58hPdGeULOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cQcARz27; arc=fail smtp.client-ip=40.107.162.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cQcARz27"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZiqqiLAFekil6LqA6LzoFy46C7V8mBUCI7ZSnBeIgjtXBmyyH2ljQCrs08vVrZVLNllbZ8xGxmafYOzhTfMmv5LdDsGOMdTgoTs6LO7Jhm+TLIXLHUTE0TptJkgA6lSn3ZPuyPFRw+dgMdHbEA8sEyPY/xw9ysGZOTcHCjRw2Cm4cMH6fiJxbDkhtrGIbkAmLfUBuTQ/XASKYdE+vUmnjJWsxWVjxYTL42ROWJkXSM8Lby+sCXCZ7x2okBybENZLc3Zek6DirXGlJlFiTHj+hVvS8A9DoC5x4vjrE7UWKHeqZ+5OTuCuUndtqODm6lLraI/mKQzKCpAx2vkxLd5L/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NpAl2LpETSiul+DxLsPYjXdIv06G75C9yDItENpzmzw=;
 b=sAdn+jVkbpuK8NRFUd9nJsD6e5OuTizgO0WGv85QBItcVSnMRuhPLB9AMtLJ2mmy8E+wX2T0Q9PggvPcuj/H70O60ZA9KvZsT3AAp7vOmXc8M1V7dNYYdocFyj6VIQs6Prv+TyeAy1+ELp9iKHbRZpgnQJk97BVaeEXMJVE+Czddj0Y1W21Jf4/caIfVSGB5haLhmAS9nQNbi2KWnAP208RS+yNcVg9fCRbV9H9bFUFx5V3qENp4fpeuzU4yCnKsXvWT1I1IKU2eCz4QnHRt0OUTAWS5KvJ2i10tJFQvnp8lsU4CwgW5QoapNWWj8XRB4y1W7AwGJuBR/mQmpU1k4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NpAl2LpETSiul+DxLsPYjXdIv06G75C9yDItENpzmzw=;
 b=cQcARz27yfmdo3vQ9CNIY2QvF/w19cBDzTIBpqVbZJ9tjuhZoHThrD/5+I50FvQjSnXzZ/t7GzFAgt0nNdXAWgasZdKoPmRCTigZv0CEo6qcr4GfgUxMkzvr56hcyyTZ4zUfrIBoOQ4tvbXNdIyIAfwVCDlmxdsA0w5WqkxoFZctrv69NvZ1T5+DVx9VqKWzwlzeV69dV71kwWfeuLMxyMisdoEOaaqA6nRHo5irgkTeu3ixvhn8adc0ygRfZ+aXjZkgNngAAr4Zr3Eqysgqm8AIv+wSmLMzI6UQb/ohb2M0OG5X0C6c981ZSFOjKp1fvtE/nLxARc3b+w0GtT785w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBBPR04MB7898.eurprd04.prod.outlook.com (2603:10a6:10:1ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 20:45:35 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 20:45:35 +0000
Date: Wed, 8 Jul 2026 15:45:25 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: chancel.liu@oss.nxp.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/6] ASoC: dt-bindings: fsl,micfil: Add audio-graph port
 support
Message-ID: <ak625RN6DKsr4kWL@SMW015318>
References: <20260707065725.312450-1-chancel.liu@oss.nxp.com>
 <20260707065725.312450-3-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707065725.312450-3-chancel.liu@oss.nxp.com>
X-ClientProxiedBy: SN7PR04CA0215.namprd04.prod.outlook.com
 (2603:10b6:806:127::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBBPR04MB7898:EE_
X-MS-Office365-Filtering-Correlation-Id: 551cdce5-d1e4-46bf-6dcd-08dedd31dc28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|366016|1800799024|7416014|376014|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wtshSqhZlwYyogZuAOKKqPmVVk40qCo57QJbW5MGnZULCMKSzWWF1eiMtPmCzn3o3jypWdiqRCMONbUaGLaZ/XNiESIXUdxrgSDhWzLSyLzjVbU92mdSAKJfr0IMYwEWW4yp/Dt8U5hiKri/6S8j3WIAArD6eUSui4NGPpX+wnnYl6Kob2i79E8W76a3h1WhSU56CTAamG28pojk0uFO5nA9eLmJA4tpMs0IG+2gN81Ppkw4Cny96aAPni3NSqIfbSKFFD2gNNUm61M+Z5B88H1QTm15r9iN796e7euakT6LZWoTbIjzJ2j7m6/1mqRBqlNnCMowLUaYA+kzbEk705IGQNqeaC1DsnZb4tNxbIT7R3U/NUfdDfeOrbTO3Gc+Myy1sAzvf6Ym2ms/CNTJJ/fMtty7vcznyCBGTLJLUHwn43ll8GWS26DvmnvIAFReqcQagO3qftrJ2YnM5fWSuDsH8FodFUm4uivQOqyV5yYitxweVxjQUk1+5PH+avLL6D2gti5mQ8NE7n1R+kL+jt6ZF06pV9R6Ic3LOwVqRdDJY+HfK7GfZrt3kGMgL7IAdPU/cEo7fvFXpPGIUDwaVsOMBznaiz1bngBJfRPFeDTtF3weBo3OKEhPntN+4+5V0cCv19AADcMrx0qxV/Q1iIXpk+57TVSGYeISBM3YVMo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(1800799024)(7416014)(376014)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jQjDNdGZnLvq383/OZY5OLf+X16N1Qovm+aRPUMY6SNb7ehBUr1WKjAP1Pkm?=
 =?us-ascii?Q?6qFolmtxBHZhXM82KFeI/t/NKRBJcwI66o3wZUPl8AVtOayhggrDDtpDjN17?=
 =?us-ascii?Q?bb2ErpJAB5/uayZiKZmAPIaDUVVzD2+nLX49Ag9ItALTACHCwea0jopgyALl?=
 =?us-ascii?Q?XmYf38Xg4dgdFXQo75z4r03QnrEZTSc65saXUBz5QANiPF3/8EsgTCXvudzB?=
 =?us-ascii?Q?W+kt2NTBzKtzwRBMXD6ND0bQ7MgT9hfCv9ugZYEb3uDECSeD1hI+KpeAQJRM?=
 =?us-ascii?Q?yGj8v4EBDh5eUqJurk5rruR6SuLQzZVowbHJHqVKmg/W1DSsxedRqKexPN7a?=
 =?us-ascii?Q?3vb8+Q9WvIrbGwnG0Bi5Nte6dait43ZLqWOSYjCvynuF5AzrqOf6I4oM8sav?=
 =?us-ascii?Q?5uiHOTqjLjD7ooQGa0sAEcmNu6gBKzmijZ5b/VaRA3XPe6Ziuveahk9vIOab?=
 =?us-ascii?Q?FM+Rhxf/FKuAswJDSeotAJTiSHnMSFY4NVdZXTAVUp6bNuckQ3uUJdq1Tj+P?=
 =?us-ascii?Q?2KraLLZvHCPZq++/yBMfoGXY7y8ui/QIsv79VKTdFt6qu4lOHnfnycxe/Vsn?=
 =?us-ascii?Q?4nI6furu+CKCTyAp3UCgDURrfCSXPFzCyb1BkZ2xtJMEFj6Oq2tOAnoumgGi?=
 =?us-ascii?Q?aTFg/uSPd5b++vcolIarsftMunJTpMGsuRp4qrrGncYbO8mCL0eAXly065yg?=
 =?us-ascii?Q?QDO/tuh0SZppTwjMkmGEfwAQvEU8SF1jlujfHAkiLYS0TamJXgxMc8Tinlbt?=
 =?us-ascii?Q?a+zsmirrBl0WCemEJjjWXdDqIoOo+uHxLyNjNttbn7ri48MIJ6K5EXVpKcYj?=
 =?us-ascii?Q?U5FhXrDafCzckmTaipOMYnsv+0dTBPsuf2ZNq3v9sYvE82eehtGVv0OLfH6U?=
 =?us-ascii?Q?CrFWxmkHHQVTRVpKh8bKN5bzZesOOoYI/6CyeN823eXFtoEwOis/R3Rm5k39?=
 =?us-ascii?Q?5gBI6MXcPBYCVyhbcn5hdfBS7hW1kdf/3x5OI8B672nWCvhyr4QxfNPXylbb?=
 =?us-ascii?Q?qQG1C5N1Jw1ufFaUrb0F5j85YT8K6rOJMax1+7iG46FxHyY9g6wWjuTkXd17?=
 =?us-ascii?Q?70H/TJSAem92DWzes6oYAfVEhk2QOKJl+WhEUbXd5LoQeLdo2tM7H8IzEejy?=
 =?us-ascii?Q?+0J0AEdE1dubOOPoWlqPAg+e4fC2yrFgD/jnluNhg3y7YghPrE6C74+HyH9L?=
 =?us-ascii?Q?eR/hou5xzlWHgrcSrZ7WAh0rvpwzBO0k3i0Xs8KR7T8QEei3eJVwnWasEre1?=
 =?us-ascii?Q?SOXe9NRQHg2CR+5eYLf+5YQHVkKuQraDEC/CE39YVCM70NaVdrmqiqvI9ia8?=
 =?us-ascii?Q?/VGvxF6U6l3nILH73WPiuBr9wasr2/a3inPnSI2j3MrFoo4kEe/qGeWfZoOH?=
 =?us-ascii?Q?WKezNhYNEGRVWBEZ+pn3cc2arvOem9d+eVY5mcB9eXH6catSGqA1cO6LVipU?=
 =?us-ascii?Q?FOqCc03TT02ABOphv5i1RI/ORLBsxwMBRaBux9cYrbs1H/I8huTDJZieY2Q0?=
 =?us-ascii?Q?yHiFuq672dNpu/dQaqLxxr55tjZ/tF67EFrRHbE2kF3Sx2EkIJiwVjsFxT1s?=
 =?us-ascii?Q?wMa3DRjzHr6gr1edupBAfDipG27bzX6jbEJZ3UsBPPgMvXMnNa3K2dk9etFa?=
 =?us-ascii?Q?L2HjANnKauh3xMb2Iiu4/drXgOtVLb9EBu7Akhx6D2Zs3wyZn6a4cCGzMbPN?=
 =?us-ascii?Q?xq3VJVdNRb5vQNEyEcCfV8rnNwK3LPXcxriEmNoxE99uvmFKqmwTIcIQiC4K?=
 =?us-ascii?Q?LqXMaSoQ6Y0XX/EUPCecCBCN3OGSaIQWnYxJ4rCFiJLXc8mxJa9V?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 551cdce5-d1e4-46bf-6dcd-08dedd31dc28
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 20:45:35.3696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rWl7G6hJ3rPPD829qxzNOs0FGmIn7akJsKz9M8zw0XHg/C+5yBIyGzaL13gCTQF25t5oIUtnwqRKdlxsQ+76vtijFDbapbGUjKbb/B6Oql9WkHuGGWKQihwCibkvH7mb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7898

On Tue, Jul 07, 2026 at 03:57:21PM +0900, chancel.liu@oss.nxp.com wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
>
> Add port property referencing audio-graph-port.yaml to allow MICFIL to
> be used with audio-graph-card and audio-graph-card2.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  Documentation/devicetree/bindings/sound/fsl,micfil.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/fsl,micfil.yaml b/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
> index c47b7a097490..4c7dadb310de 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
> @@ -66,6 +66,10 @@ properties:
>    "#sound-dai-cells":
>      const: 0
>
> +  port:
> +    $ref: audio-graph-port.yaml#
> +    unevaluatedProperties: false
> +
>  required:
>    - compatible
>    - reg
> --
> 2.50.1
>
>
