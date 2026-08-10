Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013037.outbound.protection.outlook.com [52.101.72.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFC5437864
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 18:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786388158; cv=fail; b=KRvap6NDpIbkpBy1NNaiqiBed1i0U+gVJi8m+hcrFb06ZddAH6s3xUmg0UaTtbY7AEqIUY/poJDSLEa1LQKRQFv5XJaJ2CxooeMzL4SIlVi8OJk8NretxRlNCsaHvykdpwyg81lt8Lie8LaQNpL6D+ocKsf/hGZwgmMrKz3zFEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786388158; c=relaxed/simple;
	bh=N15rASonoNBro7PFug9coQE5OXX/mBJ+XQ2cBZ3YiqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kPbxcuatMg7JbKPdKu1obhI10BY16SkkkAdzZz+7RHHYwfACOinIOxJqgsKJKqS82MUinZQorPNNQURBMtuJfx+U6IUm+xdKtvCP6ZZlcF5OJHF+Nez9MIV3oqeIco90a30xSqMbzXN6Ie9L/49D+HXQiZy1+mzp/1RBM0RZIi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AycMrBah; arc=fail smtp.client-ip=52.101.72.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AycMrBah"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JI8dW+SLyvJTaajYNDCsc00ItUI2L+oB+MkUrwGOAwDgH0o+hHUZm9m4bZAxNAGE+ecH/F57j+cZl+rdOnSS9hi+8Kg2jx0gcTUvRWxx2DViT9WGaJPQ3m34eF9AJB/G8Z/AQ+h3xdXy0vzRt1mVQpWvD+RJ6PytRfbf0DXngDem19/5fwG/MvYzIxoCxbVfdzYV4NXTXDggcYh/loNC52SdVpb2ZuVq/TSIbXIpVu281+/0gf3Ke+2EWGX7R+Y2+J8auJ6mpLjcSSgxu0cd2z6UnlRlXEoMaKMrkU0PPPn1jEmptQKGr7zW3rCfUvLlSP3ElgbFWi2XJ8EnJQ4y2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IArVwXYwjEGECSoVaoRUnmVvYIRHXD17uUKSYepuT60=;
 b=LQmbUvZ0Qbtm89RaLoqIevVNClD8l+kCfybCvEs3JlSd9pPrBA+G4BY3d5LJnZObb9zqcSWAcMBE4wynyUuelq81owtO4dCw3zRkXSmUUQy/tuRFsXiJ1fikwjnbtLesD0yCMI5k/12m4pp5GLuzjPbhmMsFHwrFjv2RWaz46aqUR3aIn0xSKPCbypK0uxr4Yh623MjldzDDRoJGj66pi9JzyhWck5KTMX/S6u1zrGlCgJRgZZjr68zuJ+5XiguqBDLq6KP2UBh57zOkBGiKOV/j5iX8YW3eFbKH+NOw1cA/VQoDqS1X7zteB5jrv1KhRYIiEztr34IHLFlHrKIjUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IArVwXYwjEGECSoVaoRUnmVvYIRHXD17uUKSYepuT60=;
 b=AycMrBahCmZZi/MAEY/TzqBnSs5v8XiqGTHYV5YoDgGDofYc7TgKJIUMfkU28N1LVRprwMH/mGzrHDzO0TEUh73b8GfG8rTg504KZTvADIKA1JUSpNa51bjDMQx3WZ/glQ6781co/g75LruSL5fmqV7YcOvMUu6rjR5mwMO6ftXk3TtCdZ5eK2W4pUyaV6LDXFRTTHg68FEqsxj2aGFtoQfU78TtCGIKjmHp+fu4I4Z+v7MdpSYTgcaNLFlZDDVoo5jKswf4Zf1vtjw5ygatlM895PFDrXyfRZ8HEEl/tH+LcuoRr9phY2fnVeUlWOlkRzKFPiF+aLJRrKBceyj0Og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB7149.eurprd04.prod.outlook.com (2603:10a6:800:12e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 18:55:51 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 18:55:51 +0000
Date: Mon, 10 Aug 2026 13:55:41 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev
Subject: Re: [PATCH v3 6/7] ARM: dts: nxp: imx6qdl-pico: Replace
 clock-frequency in camera sensor node
Message-ID: <anoerXCIlB8tTgiC@SMW015318>
References: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
 <20260810180604.3034255-7-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810180604.3034255-7-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: SN7P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: 3727854a-6f26-4a24-2c80-08def710ff72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|376014|23010399003|1800799024|18002099003|22082099003|4143699003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	bEsWb/9squaUU4KoqWr+Cs3FOk9oeyGZdaOjOs4FQKVITDoZfE1K0lwYw5W+gmz6yFd4CnEQ5LOpFjPjvnL9JjReir/ihVxqJIEPNLUeXplxhuGWIdqbACdGdjknMcsQHXEap26YYuki8jT5zA7nDIBdSCrhQTrGjl3t1N8TaLReMtjcEcQ0DlxpLoIQqtSum4yKd/1XsWzP5c3JlGfLbjED4YC0niJFEdwZonFHxeqFpVLEE30q5yOgtdM3k9cARXZUghcsEw2YR7y2T7Hs5hWaK3iBoA754Jj5CvoaJK6VCv2Ze77AeOCrc4lh8t1KnrF1sA0OrJMEDfZ9NfR4mvj/nR/cRuqUAzVfSkUL0xmNIyeSAjxmld8FY9VmX7l16yRQIQndgud1KpKMl9GiuvXzVot3bB0O3lUVIvZOcblm8Q9hkoq0lOIRF0DUt05DTv3paiGMiMIkNTrkPpABWTnc70BWO3QLPBvvXuqFL1WLTWuo33Gishq2j+AINWTnkt6lgotGLso/fmNquYvWL2H72q969nPtgvVLntE6OV+K3DO9XPvyj23mhs/ZZ7800L6bqt0B0IOVdCWSDxtAWjbYs2FhCQgtZD80mViQHXAWZYHVVrRqR91GS6sSJTq79ByykomvZivKv+eknZ/WrHuP6JUhzGsSHdLyFUk3nIU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(4143699003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vG7fc7TRxHewlrn52A+u3Q6qGSfHThnEZc6r+mMMGvdwDhOiNehdN5RtRZq0?=
 =?us-ascii?Q?HD10RT1vJF9vu+iJLksRF5t4K4oRqKLZqNMrTA4C1Za9JzxAB4IUktWXgqky?=
 =?us-ascii?Q?Fsd4fUlUjQKUGd3rOqg7+qguFTRIQL5Bp12/dnmMuwMlWlqg7qah2pBkysAb?=
 =?us-ascii?Q?8+TGcb1sh8ckr9xcfceG9VWhqNRD8UPsZ5w++UVWehkp4PY7k/e4MmRKeo8K?=
 =?us-ascii?Q?lFjsV7HYhnrX+DPRaHTD0bzZVovYUvmO2cgQR4KmLW9diB37SXJiIHtOmILp?=
 =?us-ascii?Q?BJhx+y4H8VtcowrmQJugzEjcu8ScIVaeBS3MEUwsTyKzdz4KsOaHE2lZv66O?=
 =?us-ascii?Q?3IeiBcBklamT/29jj5t6pIZNcv3eDiDkr8VOi+Vq5WxNfT0EvUMXq4T0UCZC?=
 =?us-ascii?Q?81hQd98dHWNTvu5JgZvfAkTCS7zo9VxOxe4xhVwgsvml6Aed/JZqkuLfVzlf?=
 =?us-ascii?Q?Z9KCTOcw32xZ2eTzZ2u0ENt0uZBTVsjz//ZdqBrCnIKrwrULkNZ51YGZ3Cnm?=
 =?us-ascii?Q?e90RAbJACsiz8qcI49giWpulSIM3j1q8aLJJmiSVW2ETD/UMi1a3/B7Bif+e?=
 =?us-ascii?Q?1u6uEF/ZZq540XJsZelaZaw48ct23PlBHDqwNJ5OoCTLD7FZJ5kOAaa7YBE7?=
 =?us-ascii?Q?6MFA2f/3w3FoOzZRaJGv9FCVdKOabN+2kf0wFeTKITq+dvqV+JUhpRkY6XAR?=
 =?us-ascii?Q?6l9Hef0BogrggjLZjzfZvmMVs2EUWfijEnfa6UtLwM7P0YFw2cJvbD41tcnB?=
 =?us-ascii?Q?PAYSE+sMmu2QIprKD5jFulohf8qJBHCpDefQlLNItXmrKLf53cveWlBbumZB?=
 =?us-ascii?Q?hLuJ4xIgw7sT5QpCRZbLDWVN3SVpLxOd/jRW62zmfAERO0FhUDk1rM+ro2H5?=
 =?us-ascii?Q?mm49fidjgwnVY8bY5z/f8+9oZZ8PuFnw1FxEjvMXCV6pid/NISvnM531Zt4B?=
 =?us-ascii?Q?arPlMV+BAkGQXcjnaBm/xyS2W0TAR6QdbAUkP7WE2xU0l22vniYDH8vEJuIw?=
 =?us-ascii?Q?Vf7RJLffHrprOXK30R6iJP8GGDwIME7fiC8RKkIGVqnI9vazv/aNJzMGLkRc?=
 =?us-ascii?Q?/vLp/R7uq4ugZZ5xVhMvk/4MUj1NHW5zIC9NBSf74Xwwlif/lMU8XZYHKNBD?=
 =?us-ascii?Q?BSLdIbmakI5gR4rR7iPHf9gO/rvQE3XNwwqbboCZcg/Usjz5rOhuEx2fKcy6?=
 =?us-ascii?Q?BwMJzjb3fijV1IwrRiiCVfCPr6MyH3oFxF2KzK44onLivivlmI9GaIB/akdn?=
 =?us-ascii?Q?0nwKUK1/suBFch8mH1ahgPTwZaQqBsNi3W2u7psmU5EEabSOB4AeSq3zRvA8?=
 =?us-ascii?Q?2zioQdMXqVFEoj0EwEadSRsVN6ZL+9bUb0bG6rV6Vh8AcD/7Sbo9xIsUg4sq?=
 =?us-ascii?Q?MU9pn0zlg0wCHvrawHG92J6ZaA9AhRloX4vO0+u5Iid+WGuB7T6el7fl1Ivd?=
 =?us-ascii?Q?5X/AqN3NAV7rDCOquYG/z1ws+q13U0PQMaelweOxzyg1xp++4shQc3sNmKTT?=
 =?us-ascii?Q?TsZvwgb/QRaIvFj5vKTGLw2MAzn8QN8BZbuueYSkMNglROZRFSryz3utbP+n?=
 =?us-ascii?Q?LN6CO2T8ccwmuyjkFwWSPaAZY3ZlsotKPou3TvO29bJElHv9gncL98/B9uxm?=
 =?us-ascii?Q?9YA+Kj+vUv3PpvtLzIpDh+x9vpxQ4W/7dQOF0qntn+3rkDRGAZrBt/RuxpCe?=
 =?us-ascii?Q?ZZZ8WYXk36yLLQ6xX+JyirL75739CE5hp8YWyfOgJ8SXbZIF7I8uLr7HF6xC?=
 =?us-ascii?Q?cgOOSxYyblfYRn/wXmPNZVArz0XXcbDkje4BzVVwNM/m6luqnNWI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3727854a-6f26-4a24-2c80-08def710ff72
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 18:55:51.3337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y0DYMuJFTX7so9mFCz/weDnPG3FyyuVUWYzlVyUp7MTnQYQq2uIKC2Ca2Lse/Ilio1wWhDsVzGiL/+aLnb3ovEyAMmOFEkDcsRsY7f/QaXXk8vlybllRB/8jEmRGVhI0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7149

On Mon, Aug 10, 2026 at 09:06:03PM +0300, Laurent Pinchart wrote:
> The clock-frequency for camera sensors has been deprecated in favour of
> the assigned-clocks and assigned-clock-rates properties. Replace it in
> the device tree.

Remove "clock-frequency" may break back compatiblity.

A similar case
https://lore.kernel.org/imx/20d37ab7-308e-4f07-96dc-7ae011af76d0@kernel.org/
https://lore.kernel.org/imx/20260404-thoughtful-placid-boobook-da26da@quoll/

Need provide judgement in commit message about impact of break ABI.

Frank

>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
>
> - Drop added blank line
> ---
>  arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
> index ca4cb986efbc..0cc05d084f9b 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
> @@ -233,7 +233,9 @@ camera@3c {
>  		pinctrl-0 = <&pinctrl_ov5645>;
>  		reg = <0x3c>;
>  		clocks = <&clks IMX6QDL_CLK_CKO2>;
> -		clock-frequency = <24000000>;
> +		assigned-clocks = <&clks IMX6QDL_CLK_CKO2>;
> +		assigned-clock-rates = <24000000>;
> +
>  		vdddo-supply = <&reg_1p8v>;
>  		vdda-supply = <&reg_2p8v>;
>  		vddd-supply = <&reg_1p5v>;
> --
> Regards,
>
> Laurent Pinchart
>
>
