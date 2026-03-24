Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013056.outbound.protection.outlook.com [40.107.159.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78196248F6F
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 21:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774387067; cv=fail; b=i/IMJzBUkJaBcopiMPIRBweoAo8qmq1M8YGqCjIrZ/SZoSUp75WaEuavTdP6tRM6gOAfU8BZWDSZNmastrhatlSaNV8LfqzXUyOz75V2I7IWQLwYJgyv3CmjFp4KOdem6k7ZCMDVxvf+dPyVrsHrg7/BF0vP1lNIEXZPBQI5T+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774387067; c=relaxed/simple;
	bh=vLsbGTRz9R31+NzuevYF7cy6U05pR1rWfssJ9R1mzaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GEROyAJSOlrfci0QhyakbPNfkWI4oINyocy8r7CMeRftttgjbmk2fais6p7Rzy2TvYVao+j8DIIs/8OlKaTC+PkGBWIHWA165Rk8GD0XyTENm3V+8usdkls60RabyNPoex4L42z3WgxbLUVNwCig2vpmymCK9Pr3V/rKO7BsSXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aVuzOgJH; arc=fail smtp.client-ip=40.107.159.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aVuzOgJH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0VidFnkfxrgIWUmFeonzXmJGcjwqNti9sZX10UOY+tF+cykISvoJe7Z4f2KAysnfoB7T90zsYTKUijqBp7G+1qjxE2UAZG5WOsPoIawVdKqAyP2bAVS0aZ3IoZibGQ0Vh9kh+9ZQtpqTtM9DD0v/cFiqEFgS6M0uf1BajQnnB11AedrtNR2T+oMLiN4cNwnbXdKE//L67EU9vUzhDtO7ncT3XsY2tOMDl06Kmp93RRCPtBQnL3fUlV3Zy2zS+a/1OzFlg5Bm3/ntQAqzcLzOkYB691IkReMuCW3f7cD2JY+TtqrmMS0cuvOMRwyIftWqLeWLsznvz8Y3Xmh8VL0EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YupW3WV3VWZE84G6VeUBacx7ZzB1A1lDF6akGqveOOQ=;
 b=hQIDLG8HY7bjdkxCYmTYRAJILsjimPuCSahGa2pNto+U3NenXXl8Hx0qg3C+DFK8Q6uufLwfy9rd9WEhyZE7LHxp9lw7rpNSB39jc4W2plUWUImfppZCano/l7CBv8n0NzCWqOPOY8GU50fk3urt3Dh/xqAau/RK5ZJt+hmyO1g8fv5Ql+6IceYVVUxK0Wkf+WCGZw53VVCmMXXzAgIXKQujhGv9Ts7eTrgCbDSu6MEnSlo6wu3Z1C0QIHaUy8cgTV/v7X7OZJYZ07rLaIIk2hmgYXGhx3zEEyMnb1uck7M8DOS8DBYdDfPGLWl/5iOWUvGW9sxbAgQttZKuu4pvGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YupW3WV3VWZE84G6VeUBacx7ZzB1A1lDF6akGqveOOQ=;
 b=aVuzOgJHTA0/pFT8OqY7G+1yB6cXW9nMAZGJvRT7uugYjrMirTxBgw2GJxh8eowKo7F7ypJ94g/vekiQ6NcdZ2XDJa3o0GRgRDgVpsERPq75BUAQG/xZmrh2aSkAao3a0IKU3mzLmgU5QNp1PnwGzq4tbwcz8MYvH3g8DuKKmWUwqIDqAwobacKpN/gckFDaYoEMomM8IQFwtP2L0G03M/LlTgUxg4SvPoJhgVna05svcPiDP1ZSjrscTd9e3/oebBd+e6XOI9pdrf1Y8uq7+G7Gm8PoI8xOS+RMh4r4++qa4y9twvlLlAfTyOnPqGwWmo5lunIJ61KoqP96o8wA3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB8PR04MB7099.eurprd04.prod.outlook.com (2603:10a6:10:12b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 21:17:43 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 21:17:35 +0000
Date: Tue, 24 Mar 2026 17:17:36 -0400
From: Frank Li <Frank.li@nxp.com>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/LPC32XX SOC SUPPORT" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [RESEND v2 1/1] dt-bindings: arm: lpc: add missed lpc43xx board
Message-ID: <acL_cAQ99B2VliJU@lizhi-Precision-Tower-5810>
References: <20251015184846.2509016-1-Frank.Li@nxp.com>
 <b75b30d4-e33e-4620-bc37-56b36612364c@mleia.com>
 <aXppf+3Nm7zsYaWE@lizhi-Precision-Tower-5810>
 <f213bdb9-7104-495f-97fe-8190af3ec577@mleia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f213bdb9-7104-495f-97fe-8190af3ec577@mleia.com>
X-ClientProxiedBy: SN6PR2101CA0024.namprd21.prod.outlook.com
 (2603:10b6:805:106::34) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB8PR04MB7099:EE_
X-MS-Office365-Filtering-Correlation-Id: 129a9a2c-3933-4e9d-d922-08de89eac453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|19092799006|376014|1800799024|366016|38350700014|7053199007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	D9MNLOuX4Pp1RN18OCmCaHHY1d58vtjDVDM8gbsxcRtVGWMkwy+5S4iA2DSixJVc7hAZ7WfdyiCFHUXfvKHV8ExRuyvfGfZFHF8CfJ89cAdsLAfD2U7rui9wTIAvZsCS3O8OZX0+3ezYynVDXtRcoyG/LM/4OT4gGLxy6nDgYRbr8iSjTV9ft+HvmdrrMuoVjmwghPTzPKuRaC2sor51NrxX5f58WnxN7SGPlpVcq0tYudzh81dW0NE+GPJF4CTPu98nYqGBNP4h5vo4iwDf78ikBl/5Ad6qxrmAYlm6BR6e1gfZVdvrL3fasJHhhe7Y/O23xDduTEw0NuUsRMHcgufNS44jFwoiTfztT513WqEA5RhVvm5bXC5pLqcowKhaHH32/G9fPXNn9f2S8bGIL2w6bkoSev633WxeFpUtQYJEVjonemjE3vVH2DnpJ/ftXrYemvEoknyFnT1VtUeIK1WcxsXTd2u9ZArv5QQcICRLGp24raZg3uOm2gal8HBXjcaam0qNohrZN8rwLaKMvr9BoQDSGHYPnpfj1tVaU7OdPK+HS0Utby4xq9AyXD/+Hs7JFx5e1lq0jqJpmv5S2DF28sZgOzVw1V5vu+iIgwvSNqIIi5AXZXBR2JihH40SLRY3AKtooOHzPcKiIejOSWNAapIjCQa+JZ/yEWlU0HEK2sBgRENMn7VhZXljqbksTaVptfTzXE4LZ4B9X1hBvylpuzD5Zw4t3JNkf9VxDeGc2P/AO9FPBGNBVWuYE/VzBe6QV/5so6KGe6M2CNcuXRPdG4kbC8T8rzzuEonnMUI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(376014)(1800799024)(366016)(38350700014)(7053199007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?14KkA6TcFf1eTwNYUfv2i6nqWdGukZAbxzKSx/MmfT1yXkBxLl8iLungP1BM?=
 =?us-ascii?Q?zrnRyZuZ2TVVBbDPQdncsLRzmXK4uSxVLG/V+huj5jpIhSHBbkESlNwgc8IL?=
 =?us-ascii?Q?WmtCWNGjKd3AL6VaVmA+qafh0UdBH1VUX5HqoBFUFTag7s13IQSrnj4lc2FW?=
 =?us-ascii?Q?TIxvyOspd8Tn4p/9OxvRF99s+Xg9wTbC2D0Hk0Dpv//jG6es82IrarrcIp31?=
 =?us-ascii?Q?0jyrkQcHKWmWHYXOQ9Ixh+wymcYQmHhwPJUM1EqGsg9oQei9CEkmrpYYGhER?=
 =?us-ascii?Q?Go16Plc6iiK++3ptmIiCvfz2UcRdZQ+Pj8NmwJx3W8vX6h6SUabbKRxMIzNK?=
 =?us-ascii?Q?83M/CUvaGqfNfNp19Gin4aOftIvv5HbvMGQKEWR6V/XzIgAv0z+iyyUA0b8w?=
 =?us-ascii?Q?Je/twCijCR0hMVlajaiMJV5nDEidlEtsLw81fN2N1E2GYpkKb3V7yN+YKek4?=
 =?us-ascii?Q?8x2+0FRHW8rN4jYUq3gKX2xXAwlbD0F5ml/S+LpSWIOnYDl8zhzNNeVLf5EC?=
 =?us-ascii?Q?E5MeeRjC5HuCXYhIZNHNYUNec+8kW+d+UwSQp2+7gFde2fw06PhQjwBQfosy?=
 =?us-ascii?Q?NUQ+g9fvFs97k2OuTrHKifPkSWqOeRSWIl1bPzJTloZ7xdZYh83CgvUB52OE?=
 =?us-ascii?Q?zIeXQ9tVxIY5Qr9RWxtXfkV7QDuCITgVIanltedOYqzen+iQWUntIDV3EhiV?=
 =?us-ascii?Q?HwtZFhynkx/MmPWPQSvdLIvQLJHqwdngz3dbABEM3asVj8yfxthDnT2k39hY?=
 =?us-ascii?Q?WebXSJI3W37P78jqa2JDYzH4MDrmHw8QuphBuunPGQa97hX17O8p/ii0pCHJ?=
 =?us-ascii?Q?7LBiCIrZbSwVxScEB82oHfFcMiT1hPtkfviNChXtRWUplxx7GSALC7vDHVhf?=
 =?us-ascii?Q?P2lFtDS2OllR9BC4ZfZcZBGIkeI91Eama50mvdSm7ST5KbOLK5XHOO5k+38o?=
 =?us-ascii?Q?CWxNHxRv5yBua9NgqRfxgXugXflpRQ9d7xnf70muqpe39wV0tEgaHtS8zIeb?=
 =?us-ascii?Q?28sTCgDmeDVd8Q5gYWZbayozMhtot3xrHr/bdLKLkPlT+kO+9vz+1ZYa+8rq?=
 =?us-ascii?Q?B4fhJOTTY+Kx2fA58562laqXwCDT8z84BRDYYQawocpR7lsNIAxS4BoYdMqf?=
 =?us-ascii?Q?764IbkXruKmWXhEd0GRlzqn5dSDRjnvW9JrHKRoF0ghmaXwwPb+pe/jg2hdY?=
 =?us-ascii?Q?G2xalQYNSrIqOLLIbhSen2LbFB7CzD2xJMYrfpnzbrUVZkPUCJafQJS89UC4?=
 =?us-ascii?Q?1NU+VEc+z9OSmMjoo6JnCvtiaD5L1BRs7voGPSkAf0Aq+PdYTWSs8RQA+YCZ?=
 =?us-ascii?Q?SqbPunzktoBJTcIdVDUWFs1IlL8eSgnQUqX+eQiPwRiwnGpQQV65CsEf8d79?=
 =?us-ascii?Q?96rTKqdshsXu6EFJkb5n5P8lTSeqbU3ACA40wStYjC1l1ioTRAS9QmconOJc?=
 =?us-ascii?Q?D8ykmnXV1HnM6A9EhjqTzvJYMUz+8ucZlRHSPwbPrsJFkZluNGnpZf+jaTbY?=
 =?us-ascii?Q?+3uWnFjP/wTeHADLgwl175JOvZYbdNuBaEgEjtgDAXTQW99MeIQnMmIX8OvF?=
 =?us-ascii?Q?u4x3WMSXJpUiFNjvcxhfVTQy4b1GS30qwmdlvgxvqbaUXJpKkMDDKspmF2XU?=
 =?us-ascii?Q?w2BSBnMeBAHpVfMwU4Suwh0YNbKm+pjHyXutnBAlKairr6QeXAqPHaOttlO/?=
 =?us-ascii?Q?CfmxbzJGNJboE7Nluc12mas+PjgbWpeXR3q3a/SCSzBk3t/euRWGzkmB4/tp?=
 =?us-ascii?Q?cIpxMfYKeg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 129a9a2c-3933-4e9d-d922-08de89eac453
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 21:17:34.8772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dqrEqK0PIS6KFszfWUs/2REIuafqbXDIR3L5qMJzFnPxcjYPTCWVXlzbSAD34ijyUOvHGmGSZEsc10DrW5McZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7099

On Wed, Jan 28, 2026 at 10:24:50PM +0200, Vladimir Zapolskiy wrote:
> Hi Frank,
>
> On 1/28/26 21:54, Frank Li wrote:
> > On Wed, Oct 15, 2025 at 10:48:47PM +0300, Vladimir Zapolskiy wrote:
> > > Hi Frank,
> > >
> > > On 10/15/25 21:48, Frank Li wrote:
> > > > Add missed legancy lpc43xx board compatible string to fix below CHECK_DTB
> > > > warnings:
> > > > arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /: failed to match any schema with compatible: ['ciaa,lpc4337', 'nxp,lpc4337', 'nxp,lpc4350']
> > > >
> > > > Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
> > > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > >
> > > I'll take it for v6.19, thank you.
> > >
> > > If you have any other changes in the queue, please feel free to send them also.
> >
> > Vladimir Zapolskiy:
> >
> > 	look like you missed this patch.
> >
>
> You are right about it. I consider it's pretty late to send another PR
> including this change, and thus it will be postponed, I'm sorry for it.

Can I include this patch my imx's PR?

Frank

>
