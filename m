Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010063.outbound.protection.outlook.com [52.101.69.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D986A301471
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 20:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783543503; cv=fail; b=GYppkeXOyv3bqr1/uWbmbIUynU/tT+M8HWDvhagI8qt79PfgHaNNpVurcxfCqWmAu8EQPk9weTmSRx2SxduxCiyKP/6AysnWyIO+v4eH5UZEKQPlqWGazsQIRnBXOnf/InvRl2GLmzYPIUh//8hNxttn7Q1uhb9cA5xnfVaxmJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783543503; c=relaxed/simple;
	bh=w6VnSLsvxDyHr8kaaF3CZGOTLxf3AE/JKkjCI853pMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XmTuddcsqBd7xByCiF9P4N+l4JK0oT1rNmgO7vSHseBtUPnxZYNWF2jpZEv8hzabYqm8RQJunG3Z/owvW+BbK9diZzKDp3iDDTULGKQAR3yJwvTi+knx4OMxDBXL5Rq3MDnteLk0KhaywV+knWbJjwboDwZvPccpjJ7W2arXIlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eSQuEGZ9; arc=fail smtp.client-ip=52.101.69.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eSQuEGZ9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VOOsGIjD8Ws0gVLLxeZ0lIExPcw6VxGM1YFXlGh0LZXBqq1Cm/3GT3qrWhRKdDnkeE9MQEf/4Fuaq0B+MiZg/2b/88JXzqhAXP2RhVb0USaS6TQp5rA2XDRf9uI0zbxEBQCvJc+kjRWsynE/B2zANiORMpMDwI9YvJAP+qIlCV+PmDpy42P9ZYzaBn25wgdOMtMkYLi56eveP7oduf2Bqj6SW4Ul6rWh+CyWfUCBquSDH0yTpihFwaj4N3t8+aXzcUKg2ZUMWNHEe4LPB1DROpwFt+4EX6uIz5U4uLdH1TKs/5x7iH+ofb/R0hqDTXcvoXpq0BZ1Hgv/DoX7wLw9pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwTo85LEpBt8RYqNxP7y6piSxyzL8Q+ZETm1xy/tycc=;
 b=RZNVc7jwH/AOu6fJYKyIdcqHAF85duWxudPY6Z3QIVXFgyO8J8WSmCAaO/rnc+yN7Zu0wFtg9ACOeUAR7ixzmoVKUjlbpNorWhYkNfG1V4oP1RzHaQJcKpFfzVxYympjJZ0E1xP7NHtvYwxKQa6M0tj8ivDlUOxnK5L+3FeRzj9lpxB3yvUdw+B7Xg/iGiFFZxbs/I8ODKv93B+X00YeBpp0PymUvKt5tWolJa2In2VB4Q39evMajJUjupv3D7w8YFmFzn8mRDGB7NSWfhcEPrAoL8O3c8xGGN68p7cd4oCytXaQtSWHVL65yTPGhPrIXoqZXsVLcGT4bHTdBJ6LPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwTo85LEpBt8RYqNxP7y6piSxyzL8Q+ZETm1xy/tycc=;
 b=eSQuEGZ95JtIVYffHJVW2/TUbjqdMeBBbcR3VxhJgKtCDnndFnYWUzXbDiMSXclIhvA3DtXg6d3V5FTyl6u47MbwUphVA5N4ZaDuj6kcfHLJiRV/vhkdBIOCqCtpYtwOlkvVwkWzfDaIIL+3HikO46r8x58nJoFld4U6Qyazz1wW5GO7k3F8WyHUZaZTCWvsh/BRWKpoTqsQrvbW+wdHuXfbfA79LzMDNhvexrLXr9bGa7KHTF4sRR2yXQoMqEkkQyw7ej5w8v1w4DnA/3fVr1thzGKsZlvKyF4t8yjIlJB9OtmaZ57eNcvMzkFM6Pcu+5fzC00Io95f3oEmfC/yjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBBPR04MB7898.eurprd04.prod.outlook.com (2603:10a6:10:1ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 20:44:56 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 20:44:56 +0000
Date: Wed, 8 Jul 2026 15:44:45 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: chancel.liu@oss.nxp.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/6] ASoC: dt-bindings: dmic-codec: Add audio-graph port
 support
Message-ID: <ak62vZM4DsSu56JS@SMW015318>
References: <20260707065725.312450-1-chancel.liu@oss.nxp.com>
 <20260707065725.312450-4-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707065725.312450-4-chancel.liu@oss.nxp.com>
X-ClientProxiedBy: PH8PR07CA0031.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBBPR04MB7898:EE_
X-MS-Office365-Filtering-Correlation-Id: 68aaff53-7db3-4a20-f191-08dedd31c4bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|366016|1800799024|7416014|376014|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/yCKo3pv7ZF8Q0MIPM05HQjyZbcHfz1JW6dGWhAxtt1YXXR73mWNMqkjIQbpXHNr1lSATo2OuWEgD83xlLfAeNvm0t8Q+iz1Il6A2pI4HWYixOQGVYN5Ifb8+Lh7fSIbl1FnPKL960Eogmk1KoenRLtai1yCEZCQmdxFRcDJe1QkEc/icpGXN0u6rkcpqCpn0iitoXlBjc1dFx9k2WyNq6QHhfDGSPieiprVcsnqK4BdK17y4f47tMjLUcrfbD5HFZH2kflGggvrp02VndRVdT4gakekXf5HBrgIyGJLc0C+QmwdIgfaOHY87oGKlixz34mOL04KKiCpSxWb1O0MgIaRzh1aYGFBQ8Z93z+XSwVeFdgfTqDTEuysNrMB5AUBuur1eo9K9AjoAzaSy7c1Zp2bMT4xJa4tO2DJ2Tp/VbHpcjhdA55SAYIL8fAaKG4p0uHxDEz9vv+vDHTv/Vgs1c7ANKihBLSyMaXOkdC9cbGEaVpDZJpeXXy32XPFzS0YDPiZnLo4Lq3DeH2xAFu+QdQJUs8wfU5Q/lNVBTgy8Xhf2VM89NVzQ+XX93EuP9+r0LE1B3/Z1WQbwgxSHEWVRRq0V2RMIbh1nXpB9uJmxEPBw5dLEfK71u/Xy9JtP8Jv8qgic7AYRTCxKvnMZJNqzqg5OeueQL0JMzUYgkemgUE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(1800799024)(7416014)(376014)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/6ACPXRuKliZNBwh8Gw+r0Q522pIGnQdcGxONpVDtJDVXPNdT5n9ZxPgt8vd?=
 =?us-ascii?Q?xpPcBrDgkhsaHj9G8Pt5sHeblQcBtPeFscqwFAY6OFmfj7X2/98S4sVZ5tqc?=
 =?us-ascii?Q?nK3qCUNqBrc0DA81QiQukX9M5pOEclYC9xlG0KhJ5rRv0OgDSyCYc8c9AXI+?=
 =?us-ascii?Q?4aUe1SNkmputT1Eeomt08EAEdhGndvMUt5fIifyBsEabGSm6L6VGFFrGLjah?=
 =?us-ascii?Q?OrwV+s8RSBhuZkrCemDd/IkRefkJrtFFSsnSRFtBpyPvZ1TTB71A3SqLoBWO?=
 =?us-ascii?Q?qSvc7iyz77XUEQQJB2IUv6CPVh4YoeI95N6ZWATDF2/Ok1jfKdt1oI7GGMx+?=
 =?us-ascii?Q?qIl1Kp1gQ1pOgRGRqjBnNCXRmn2nr+6yKhMMmXFGQE/nWafolS9q6SsT3HTi?=
 =?us-ascii?Q?oyUXVKuNFAZscRDwqj1TmK5unBpoSWQnmUKlvAQym8Xt9PuIzGOvdrJ+XoMY?=
 =?us-ascii?Q?+Hud2XYsTESSy8bkrcx7hOVnGHfLgJLXQT7Njv6T3FarUEHyYYum4EoHj5+3?=
 =?us-ascii?Q?QWXB7hWk9eIq/AQwm2DOF6oAzrEXAt76yDf71BTcKYf4uZa6Q6uzjEnK+nh6?=
 =?us-ascii?Q?spnEs6DuuK/Iytw+z5NwIkciIDuyt8qw8+oYpVfXSFEMjmoK85pBTM6XYBod?=
 =?us-ascii?Q?80gLE2Xa/VD3pMtzmShZG8wPtbIr5OTJPcB7EIMbfxs/yzi2jQ2L+fML1GCF?=
 =?us-ascii?Q?ShjIN9TPjLnTStbs2b2gd/VwytDXxzdmiDdXP4zNJJFXqHJxt9kfmtqgGgBI?=
 =?us-ascii?Q?RGhU1CC1deFdPfpxZdzor1RIJMdW9//9X/TxF+Wju4xt1mIbLU/uvX1gi5a5?=
 =?us-ascii?Q?jnL2T+3yEsPGSUA442S656Ivj6tXr7BxHuaTvjCNsjVIsefwXozrN0e067mI?=
 =?us-ascii?Q?r0/e5CYWklU2icvzwC7oY+x9qFYdp6z0xWbXbM4oudaUTtSAcyyxLUuUpWyF?=
 =?us-ascii?Q?a4a1RSmi0wdVG1LlwTsy6dvOvzZyo7p2XBh/wh5yTuvGwgD29kw8uG4iHZJb?=
 =?us-ascii?Q?ZMstVQBoq50xDJP34/w2iGibZ3C8qEJD6rvW+4QoGsNyyGHUNyB8JTntdEi0?=
 =?us-ascii?Q?y9OT/npHiqi4dfvyHrkmwjv6g+AruEqp5UwS5CZxUbffjBNxyeK43JCiFREl?=
 =?us-ascii?Q?kutDBEdM8w00eOhvnVnzhlCcQE5nv36b57iPN434/oLjIFAuKqZf2uXqdLtW?=
 =?us-ascii?Q?KRuMktMwX6QU5VRPk98v0TqaFc3QIbLouUzvGyTrOET8DYzUmvbYRli2gxku?=
 =?us-ascii?Q?62CHuvHvg5QQAmsAgYFGecZV6LXmjOwBg9c3WVP0KkEHfyQ7f6BVyo3mE7qb?=
 =?us-ascii?Q?/boLkZt47+vth1mjkku82KLMX4EwVSeRXJ9VpfxRRRdYJaPjkLHHHM4ZWh1l?=
 =?us-ascii?Q?+neN7vuqtR5Dki/VC5R6kBtmz3ceQ/eiFTd5y+l6wcT15V9JsrUIcELMGJtm?=
 =?us-ascii?Q?J3IUrCGfVw/IqjlBm0Fd5OyhGSQuUEwxFw1nLp3lJMJnl/UpVlt5Onbmghw/?=
 =?us-ascii?Q?luOS1rHwltYIgmeZxjANHu9F3/3k4pam+NdrQGhNERKtwQ3ZeU8YygvNCt6q?=
 =?us-ascii?Q?Vy6dCUBz29IVA4dwwdRUB8ZU3b73BEjVaP6Loo5PgGa9KZta8lCtPrxet6Lu?=
 =?us-ascii?Q?+Iv4jluG2V1hhR9nMHGy/cGdtYNBzDTBuyUXVYul9btBuWzTHLU+0AimnEMC?=
 =?us-ascii?Q?5KwQu63PMms6/X3b9FnkE5vgaCk0zrl1L6FjA1BdGA/hcAzONuMdHcCHQMqG?=
 =?us-ascii?Q?k9ZEnYkYemAxTQ1mP4yZZAVCSoaJ1A6aB0hpmyVADqByZZQlWG9T?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68aaff53-7db3-4a20-f191-08dedd31c4bf
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 20:44:56.0816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJzwJQX8I+CVCGPf26CmViUafNwz20L6Y/k78R+C0nb57RPqSyJhHZdiIm8+VTF7XInRfpX6+X+fb+RhiCshvVjg+C9T5dffaH/AIhC1B/ZBea/qciQrhe+zXKWztL0b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7898

On Tue, Jul 07, 2026 at 03:57:22PM +0900, chancel.liu@oss.nxp.com wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
>
> Add port property referencing audio-graph-port.yaml to allow DMIC to be
> used with audio-graph-card and audio-graph-card2.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  Documentation/devicetree/bindings/sound/dmic-codec.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/dmic-codec.yaml b/Documentation/devicetree/bindings/sound/dmic-codec.yaml
> index cc3c84dd4c26..83c23e029ea4 100644
> --- a/Documentation/devicetree/bindings/sound/dmic-codec.yaml
> +++ b/Documentation/devicetree/bindings/sound/dmic-codec.yaml
> @@ -39,6 +39,10 @@ properties:
>    wakeup-delay-ms:
>      description: Delay (in ms) after enabling the DMIC
>
> +  port:
> +    $ref: audio-graph-port.yaml#
> +    unevaluatedProperties: false
> +
>  required:
>    - compatible
>
> --
> 2.50.1
>
>
