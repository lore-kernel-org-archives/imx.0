Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011009.outbound.protection.outlook.com [52.101.70.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE5D33A70E
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 16:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768926626; cv=fail; b=St6HQEMdwjPRA9NkR+Xw1Vxxhio+EwFSwTtHkPoD2EzujkIFSTnsJtDTwCqf/lzWGXwsbxOwaeNjUyZF87HlSaIz8rOAzRPFcGqBwfY99OVMXejgIDkB5L+/5YiU3odqLbPA9sebgUpdalX4cB6zAw0mTmxMRofkJNIzzw0ssgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768926626; c=relaxed/simple;
	bh=Vu51KoRMQCYE8B1Bs8/GyKOzRUdjt401830/VU7zxAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KHLswsCBt3Z/jCI+b+WbVr30oGiSONfkqbuWl/t1IyJ60EewZ7dx/eKegRQAkS+Zzrw379O2mnQX2CEjUs9E8RZZlnQvsgK4hYfU3H4Otjee7jCHqgXodMLS9ml/mwTXshwoIup3RdEHYxNbvvXBxFBDJriq2WozENxXQDSl3iI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KQKT0pBU; arc=fail smtp.client-ip=52.101.70.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KQKT0pBU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XYcoDclUkag/Kj+O6FXZjj1i3OC7jVXlrb6gCz8svQ2ICYLme0xNOOp0INkuLUyxza2GW95gJR2tpquc2lwysXwG0gP+5eTyn7OBjnvmMU4IIMz8F0QJyJq9uDS8HqvMpLOuXqpoBvFpT6bhoKq5Bi5eZzfjukGKjwINrN3LECNY3N7ILYXx9Bet//YprNBVGfv9evtf2+Mdl5wuv+RGr1tdf1JQnaYTYBhoSNtarK5GzVq3kOQkDNEGYRZ9BX/YLw3aVzNb0LW/ga1sgs3EU2v2iGVd9pxUhEFMMs/GHCZoKYgggGIIfpB9Y8gJ3X5Ryu+Q2X1dY0A7d/uYrN+tAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQgHDODs5ViY3mTheeFDS1XaHFgYk1ZCdsluYvSMZO0=;
 b=D4ZO2AzR6a6HeWj+ashNBEY0RGxSFlKEbqro/NEppc074d1dK90zOr1iJdFDwLOhlJuu/LNtsXaLrePQDwUOr822RhvhwdBs8O0uQZBRNKspPo75yl5qgK3NuMSyBqlDpadm1HNSi7NVborZNEOfqI43htXjAQaLOyI9EKtwLXcCzgjV0BEy5sIS8lP5YEvnqG+fHgS+YgsD+/ZFhXR2vzndtIwTDu3nJyOpPx7nJpE/WujtNt7umW8ZN3JpLQDP4y+U3DMWgPIfXWkku/tgcJfN63lqQ1wfxLBMWpTduVNWV8l+bZ+zKQMgJeHtTN+FZy2HhhqKOS8sY1qkjrEb1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQgHDODs5ViY3mTheeFDS1XaHFgYk1ZCdsluYvSMZO0=;
 b=KQKT0pBU65id3rw+j4UpIU34DOs66Vr6RHBNqJIY2v68zZb9vgOFHPn+3ZVsIDd+rGp9PQquMqToVZ/9uPGJxP2Xt6Lbu/w0mw9saByVuZvIeeyJ+hSN6N5fodYf+NpgKOQoMxgriAWHRhEiU0r4iQh7PDujz0W1lO8z7ug3pkE8xb3VFxvgyI0oxcY2qBtKU+FltdzGAMOltM8kwlaDuS14FWf427orXhckHoYDTUYcaCV2+RzS+lPpf0qSWwOQf1X2cagnB/BuqwYcq25ipGDGj9H7sS91heP9+GqJO7gTnXOpLXjxWX6njjHr/Wb+6nDTV3MsloTMGOroxNxvUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GV2PR04MB11936.eurprd04.prod.outlook.com (2603:10a6:150:2f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 16:30:18 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 16:30:18 +0000
Date: Tue, 20 Jan 2026 11:30:10 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	kernel@pengutronix.de, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx95-19x19-evk: enable lpuart5 for
 Bluetooth support
Message-ID: <aW+tkkW0SMa+ZxIq@lizhi-Precision-Tower-5810>
References: <20260120104842.2025697-1-sherry.sun@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120104842.2025697-1-sherry.sun@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0189.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::14) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GV2PR04MB11936:EE_
X-MS-Office365-Filtering-Correlation-Id: 93198253-5ba2-4f0a-699e-08de5841331f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|7416014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7W7ZRgMG3lAWjAPI1IwlYbdAY/42SuCYYduqmV0atR0vS93GIDVPWePYg4Ww?=
 =?us-ascii?Q?C20CLU6QpBp4Ms/rS3zsb2sZ6j33YTDdpTA86oJximgiB04rHfbOJ/N0o2ZU?=
 =?us-ascii?Q?CbXvUrJd4b17F+dU8QuN/NyCLFPjUf+d1N3yi5u/gUUN7tAVrScZEOsAmSXH?=
 =?us-ascii?Q?BX5aZ0oVkeu50WQWOtMPyexvL/4+dLHuzAIsQd12j7xxCpR2VbLlHIsutaJ/?=
 =?us-ascii?Q?kwZSxKqDOMxPfsu9B3KiRyyGDf2TyZRQLPsWNy9VOQTfr0C7tRNWO06P3uBN?=
 =?us-ascii?Q?yV8oELMg1v3Z9qiVlvbLbrVI9OCn56mDTi3z05We/8POnO3yWOg0nVsJ77SJ?=
 =?us-ascii?Q?Jyop573+9pJ3OmS31H+o7b4zB1cScLCeeJ9vEHYWlVzMlpYihsE9q2tiTmyy?=
 =?us-ascii?Q?GzPLM8Mm8UkPUgyL/RiyHBXmDTIDr9tBdAOGm7fD1LJHhExMAMS/ViSTjGQ8?=
 =?us-ascii?Q?x5KEiboAhvb82uBP1j4n0W0fyy6UDRat1HEscI0JW++O9q1CjtPIn2Hezzxa?=
 =?us-ascii?Q?QT12yliih9EucrC+1WXtduYORDtP/Gz/GmqGzT05FoicKQRoRIufUCC710Fo?=
 =?us-ascii?Q?XPJ2kp7gzTIOkTnQNK3zsfoRYcP3tBZaZzRYe52XqSAjLSGvjrlHaWi9o9iW?=
 =?us-ascii?Q?7SS/fMFSkjHsFUchFDuFcwhiTiGdjLaXZOky8XDHdpFC5zzx3T5r0baUep7V?=
 =?us-ascii?Q?MuGvcVbUehUZcD+zm5YVyMQdsw3RY/kBmydV7dD2z+OPHIviSbQiGV4wBJDN?=
 =?us-ascii?Q?jJtfBZ+kQjqNkh8TT8/9OaUm/ORdFF5YBvylOeSqYUwphWgTo58Q91yeMk4v?=
 =?us-ascii?Q?BZO5HvEXTkLE6+RxMx3YqazpFEM21wggC+zdPTzI4aZZwCI5EhVzPDQgQRl0?=
 =?us-ascii?Q?zLNyWcmrNu7N1k2Foop+I0dV65bemUsXWWNtnIjJeMw30a2roPVVo1FDbWyb?=
 =?us-ascii?Q?0PtndZhAHXSDBOH20/+DU5hJvlXnECrDEWBtqIg1fdS38mge6xqGZS8KTRJY?=
 =?us-ascii?Q?phR1JndBDTYItMaN3zokkHIZe5FhuU39cG0M4g0Twm78jcsa2G6xHGheEVn8?=
 =?us-ascii?Q?wxqBh/89mf27Yp9qGYb2Cl9qLAexkNTyW33M3NHWJ5w/kgOIMQmSBPwNjQ/0?=
 =?us-ascii?Q?awUcCiZdhkDWEs7rojPYUwvEzV4W7l7L+yv27Gw+Ss06oHL8gwe190N01jEF?=
 =?us-ascii?Q?XGw8uyQ/1mjGq7zi0XJnZJ6Tee5nrzgihkV1mKaGAsWM3LkLUEbWKru6dxN/?=
 =?us-ascii?Q?dV5MpJC3YGyv+C63WlIkkVgS0QArOhWAwJGV8sJKG8kylLuCXkEEWR+REL7S?=
 =?us-ascii?Q?blxJW+f62tvymP3IBIIPAuJCzwN+EP19cfwXRBQJ2zFA2HOGo/KYbO8cYDBV?=
 =?us-ascii?Q?ukNvUsHcWYaitsnHLA/PN6udOa9xriywLlVRDDwZBty2yDkxdQCIx7c/4BHk?=
 =?us-ascii?Q?/LlgmMNFgoBndHiv4kNIpYs3jcCXo0o/YH31ktHJhSflfbvjz7hwh1lx0KB3?=
 =?us-ascii?Q?n7QTLTjaAZFIHlQACSFZuE6+0XgsEbVMjzoBJztB8Tld+y+pPl5hiNGfqAmm?=
 =?us-ascii?Q?yDWrxV6T3qqVYerqXwxrmRSxIv/wtUrxjy94C5B+Z/IbUgHWNfMF6GTTWNKk?=
 =?us-ascii?Q?m6BJvhUGuJ+rFUk1EVq2gBw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(7416014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6jpRZ60Wkgmzybl2V1IZk2f/jYx9DRS8ixSMPAiAJ4aKn/UmisMNAC6QPnzj?=
 =?us-ascii?Q?4lWmSi7uS02YcOrtUpf5vpBh3z2ZbopoFbEWtAAwzlGDudrd49mlg8Wqw6KD?=
 =?us-ascii?Q?Zm9VTHhhDqd+vEQ648vtFM1IqaKH/mEarD0H6GhTo2sIGvUb6H9xVqO4uv6h?=
 =?us-ascii?Q?CbUKdjhn9RPZXSSaBRJWLF/JlJzQ7wl4sfehaxE0vLPjFJdAHYjy8sMLe0SV?=
 =?us-ascii?Q?MSGia19YsMtTZTUZblKn89pmoZr6c0cPyPvy2qhGVUq2UrkRD1v7qU8E5aN0?=
 =?us-ascii?Q?pOGpO5qOYpJUYNndPcIiNEv1iiaKZoy8aTseD1QJI0S8P9qvWh+43KsoCtBi?=
 =?us-ascii?Q?u2twzjUyshJbF+9clYLgg+UqFUWSST4XoAXG96XxMbMvVwbeHovPaRMTKBdo?=
 =?us-ascii?Q?ek/uERnKIlZkdAV0TSnZuz6fhA89bFYxW+FkupL7qjuDEtgEDQoXXeC41jfX?=
 =?us-ascii?Q?8AfC9AfNOw1tJdyARwX686bi1D58/DtcBtDPzGX5PPUciJhy9oUI5Qx5NOae?=
 =?us-ascii?Q?9FExIhCctESnZFEtnrhrk++rd92hHOksvV04k2A7Zv7l0ItIxOtVSI/ccLz1?=
 =?us-ascii?Q?xVV8IISzk6dnMEujrHp94YLuipXRgKo5oYgkR3cUxnCN0u4ROAApP/yWqBH+?=
 =?us-ascii?Q?vHapo578tMOOU3+oFQUiKGm4OYmfKYdmSFjRS6AUrq69trTliGkQ6DFIzHOH?=
 =?us-ascii?Q?vJNhBABtLd6Rl+ZjoGaQiNszbrvyrteXc08OAPJ/33YEjGeiooAhD3TcEk2Q?=
 =?us-ascii?Q?5/lsP7SgfM5wy0cnq5B1CHE18tG3pzEgefqMfXxXZK58LZE50NwACf56er/+?=
 =?us-ascii?Q?+erR5yX30fhnWHifbu5orh2WxTVYQxuaHm/Y2FNptZejmQ6rZtYwzdStzrG0?=
 =?us-ascii?Q?oeMXuha24iEKBrsSXj/+G6osgzreL5jW5UnUrfUF7DfvT1A/6DknShbhpHbp?=
 =?us-ascii?Q?cN4sYJ1Sik8x+fPrxMU9tVKCq3WoT4qpnikAqRTOFg2iyXzIW5vmGFqGlkRe?=
 =?us-ascii?Q?CxbyFpB0e78eFLOEuVBkOlOT9ALHZo2+0McsEkiSNj92HMRPHrJahXuVoP2r?=
 =?us-ascii?Q?WjOwraKnlwAH0lkTMgnKWaqznigPfEVMYzSHkOzLMgfNbfXiRXYqJXfg94w2?=
 =?us-ascii?Q?EWdqcRWn5XxTlopKqFXudbXbvIQvovE8EP67X1aVUjOglDyeZIsO3jhc4Xtr?=
 =?us-ascii?Q?KV/TKEXYkDdiyX0CqpFo3vHqvQHwe8i2MvYcMCl7Tz5cUHoP3/VUe5V7+gQO?=
 =?us-ascii?Q?HmNe8jFyApZBBfiy7y65FqDnReHtqlUq3A8v1Nff+E/pJFvwpIYmSjEXhMga?=
 =?us-ascii?Q?StAPwW/oFeLkG80GkuEnC37BXsEKqJHJz7d5kxkbeiEGam0Or/mQJUz4lpNA?=
 =?us-ascii?Q?MPP+//0Pf3HDydni30Txt48plhUXaiWNC0g0egOyvSp7NSNz3PrbL8v+19nK?=
 =?us-ascii?Q?sy1j8xhCr5hGKT8x1aULwNZWD8O+NfKLJKcn5Tp+HzFGpFTWaj/fc12oU+yh?=
 =?us-ascii?Q?G6BrQAIALqkUc8+fMI0Cvto7bzjG/NWAWdl9Np8pp+sEoPGmJHgfbv/GVkiN?=
 =?us-ascii?Q?a5dvOWdR3xzp08IrW+NQkuG07vIj6T35oF8R0uuiuDwmoTGhFi829m/I4rOf?=
 =?us-ascii?Q?YA9hwosSfGNvQcxygrtu7ghHFerwQSqrGmet4QUXzGpYSZ55c+VuxhyQkKli?=
 =?us-ascii?Q?+Rg6As5YyqNgrx5NcXLkUzRACSjkb9Jb/gNl4F/jM9K/GCQGuxA4qmpg7/do?=
 =?us-ascii?Q?5lbQGYoJQg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93198253-5ba2-4f0a-699e-08de5841331f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 16:30:18.8003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PyFxYQz4N+BIYcMucWJvMcp9EWpCfMflI6uS7iscVrTw0G6li9QFtAnkTGokHiezQ7FBTXBOKtnqyO8G/Z4fWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11936

On Tue, Jan 20, 2026 at 06:48:42PM +0800, Sherry Sun wrote:
> Enable lpuart5 on imx95-19x19-evk board for Bluetooth support.
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> index 7d16778f8d49..7bcf6254b01d 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> @@ -475,7 +475,7 @@ &lpuart1 {
>  &lpuart5 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_uart5>;
> -	status = "disabled";
> +	status = "okay";
>
>  	bluetooth {
>  		compatible = "nxp,88w8987-bt";
> --
> 2.37.1
>
