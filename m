Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2082.outbound.protection.outlook.com [40.107.21.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C811DA21
	for <imx@lists.linux.dev>; Mon, 19 May 2025 19:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747683901; cv=fail; b=M9Rfh7jh/tsLi1tHHRSB2RsGcRVu9GG6zknVeFZGMCVGE2QcSeKzAnVGhuzsgj5F6aiVlcU2wUsz2aW7ybu/vsGnBa2C6VCAGI3QQXGY3ySX5kzud/Mj0sWj4FR4+NFR0xUF4CfIf8C2X2xAO9kZmLjy8Rr3pYCr7CJ0H6iYZ9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747683901; c=relaxed/simple;
	bh=KjRmqDRG2iifXO0wb4pQIAth4OqYLG+LZYc28fDM6ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=l2o0VnX/3dTGEiyf1m/FKzzkTN9ZCR5Rqmc+qQZvYNQJLCqj8xZ9aLZBVn/tcksqZIfFUWA20k4Su0lzlPFnfZGCMWEfs6gxHraOhr0dhk5qt+wThdJEjljIePdjsLmBqXzmtPmyhUpxfIFjDj+qzPNiN/K6DLKQp8L+SUQ3KAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JJskm3JI; arc=fail smtp.client-ip=40.107.21.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JJskm3JI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NosAfaKcy1t0wv3drsUIbjSp/QffcWNSMt7/qrfv0eRpYc/9rwvl6WZ4nuipdMnl3lKI4S64cgnTAlx/WXMBxnXH51U8/XWgt7Yg03p9sGvcGi5/i/DyMjPIXD9Jn55OdFslbBrJf6t4jzQwKQ7GQwhFcsIHdDnaOJImCyUW17FX58gs13aQYasO39xZQGwE6kLoWDZe66dEhj/08JdvWCcpODj0a5ljsoti0TQ5COe2ZWrdhLmtVXgcEvvxLZjKIXGV5g60qx1aou4ggSyh6BTwS5a64YTBehRAKbaoATG6gwJbjmdrcmLPSMCjYgRuCi2lpfXOaW6Bo4a1Y6RvVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAnqbqeOXypcWYXTzO+7pRNgPv9rv/Y5Kq3to4IxPEw=;
 b=DRv8oNUt9yQFKj/EpT4di8r0mZL0PTG4LpmLpb0bAezozX2i5mzcHr2pJwLE1eAgWu284NM+Kw9/HMODZzOIgD5vArOZQvaoHwRG6I9iUO8N+xUVnaSal+5tmqEbv2LRr6pzeVQuIs1YCGUgx2V7BGjXhW29ZesG32N2WQew+iq0PerrYHrB1RQOgl5y4A5qyDnKo0VcJiVWQ2PjTvkGGtUNCNd5sLmpjAldXVbGL4BG1lNqLwIvzOQZ+OozsoO+VnFbj7+JcHjZnLG9Dvil0XFdsSo/dwIhtUqaRIDtIMG75fOtPtTz0ODuVBiysvvbw0OpLXmQM99U6H3bc9Xtlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAnqbqeOXypcWYXTzO+7pRNgPv9rv/Y5Kq3to4IxPEw=;
 b=JJskm3JICY45zvCrPnHYnI5fCPtTUP62umbV3fFnvOdImPvjC031WI1Aktfg9J1VwhB55oMuoXG3u0LYL9/SC3Ttg0/zYrpvPh5R/qyrVlvimOTV1/FBMHO/WCjVSr+vdL8UTVhgT04G4yIsTZbtwVtqJN1GoTs0rgWprNP1kC45uxipK6deDbllvNvAC6tttrmGQJIAhV0iOM/cfJpeL0RazHf7fKuTow5wsCNQhoId9OpY72r8wK45TwnMKku4rWtMBjSSiZgeG1bvPUKActGup+orID7J9myIiwTVPTyTV51L/HjaT4wfHBj6xnYMk2bI5dr6m16nOgRgXgdDhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DUZPR04MB9948.eurprd04.prod.outlook.com (2603:10a6:10:4dd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 19:44:56 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 19:44:55 +0000
Date: Mon, 19 May 2025 15:44:48 -0400
From: Frank Li <Frank.li@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: soc@kernel.org, arm@kernel.org, Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 4/5] i.MX arm64 device tree change for 6.16
Message-ID: <aCuKMGMzhzOXsmQl@lizhi-Precision-Tower-5810>
References: <20250512103858.50501-1-shawnguo@kernel.org>
 <20250512103858.50501-4-shawnguo@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512103858.50501-4-shawnguo@kernel.org>
X-ClientProxiedBy: SJ0PR03CA0167.namprd03.prod.outlook.com
 (2603:10b6:a03:338::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DUZPR04MB9948:EE_
X-MS-Office365-Filtering-Correlation-Id: 1151e070-881f-4f4c-6240-08dd970da178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hUtQe8jd0Af+dGh6J0g30An0ORM39YgMw9GQVsuXk8oBdj6+pLiJSVJHpgJu?=
 =?us-ascii?Q?FCpsUPk149FsIit67AHfI4tWFW2+0D/4hCehAsS7wM94rLEgyLjuiEU2npER?=
 =?us-ascii?Q?E/+TEjImFW1oxdL+bpXZqacVbjFZGdSoxU8zQ7TnKnwwmuB4sS8yAfFDYKwZ?=
 =?us-ascii?Q?Og+rCeVmm8vMj7pJIQRZitGUI+D+g+HVV7gWFnCWcvDFpb25M/omPDdikCCL?=
 =?us-ascii?Q?xLhnNTS0kIkfWCchbCybOVG0mUUHoiz3+l4CBeld8bqkMYxcKbYG4WGmBdBu?=
 =?us-ascii?Q?DNkt+IFaDNwLDr4KIoqYVuyQWdTM13yzbypj53DQAF87UhSC2WptQ6mYOJem?=
 =?us-ascii?Q?xUypgfOPKuk2T0VZeNsMGw5Mf194QV0FZfzjG5AK07sKx01hqqn5tFxaMHd5?=
 =?us-ascii?Q?f1X4xmVuA1yfjKcUAdXRBzW69+/toiKI3qrfFlKx4E4kNKu7uV56GdRQHcDN?=
 =?us-ascii?Q?8yu0zkauCkkVKlxXtkeLi4Zjw6DqJqAC83bM57Xru7CclW1Obn39q4Vbo17v?=
 =?us-ascii?Q?jkHTQscT60L6Bjl2yEkx53qUo4S38agDrdnMh8dxrvQPc8ype4VKeuxxscMF?=
 =?us-ascii?Q?5pClmkEBqtsajovUW4/BrIP4+SEy+ZoCNRhbFPx2FOkWYZb9PnZ/bgCVZ+un?=
 =?us-ascii?Q?HaX9sBO/jeRpKFoXhy1IfNwkrDfspatsbRqPVR3iEu2tModR7Lft5OVuwad7?=
 =?us-ascii?Q?nFFcc6zfxbl0JS+t3iqdhOozXzwOy5bDDZRcDB49vVkXaUrwlOrCUQMxb5xt?=
 =?us-ascii?Q?99EHBtSVz4zQWFOyxgRFiPGjdgJxbLKlwHwTj9ZU2XnfmwIyariDxvQLhON6?=
 =?us-ascii?Q?K2ZoEuKLoGFDhcY1pD09+rnipaewzq9MCqAYSXfZHTYied7ziAzdWLcowzCc?=
 =?us-ascii?Q?uSKyZmiLumlVVUhSsphbidnmFb04iLshFbqiyh/eTkpxUgT9DadlSujQVwr3?=
 =?us-ascii?Q?Cju3whH7imu87gTGgxmlWdXh2vMly63RaVR2B5VGsf7IDQWxZV3rVwGrk6Wd?=
 =?us-ascii?Q?wHqd/pukeTwYyRigyzMc3+gSOZxtpVrl+kkoUKEXPhVNm4kl7VBctrUjPuh6?=
 =?us-ascii?Q?BDM/wEHBe4IG/Hm5VEDCe05N5VCwrPwd5GytEYeNhGYJJaHzOGvZtqY+y/ih?=
 =?us-ascii?Q?Jcemic/GLKh80crDjo8vCsngJhy8d0ycIKZ7WlssJbdg0NM9+u9G4N/U0Mwd?=
 =?us-ascii?Q?9Bcbr9g2qSWKKwxdRIElwNdlY4MFpS5SWoI669Fd/Kdj06/iE/Y7OmsmEhf5?=
 =?us-ascii?Q?d0tKxxhtVV+lnByn4GCjnCMIQINOvC/WWL8kDXGXnYQslCMqTLNQSGbDCfBM?=
 =?us-ascii?Q?Hi9V40WX+eYT6q9eyl9HAIu6/oxS/Orphq6BDZ/filyiFi4wZkZM354dWsEj?=
 =?us-ascii?Q?JEP5ME+UJTKTnFGLyCrXxic2TQfefBuVeue4HiSrX2peEuZmC4QEzFiFU2Qv?=
 =?us-ascii?Q?pGJaNX/QrnRVtjbHGXo6J3pjkFQincrUkw/HzpQAbHNmUFSloYCWKQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8d9yKtmXwTSP6ezmoJgBhd+hAHsCTov1bG8u7hlOtC7vkjKijvy6ZYVBVXZD?=
 =?us-ascii?Q?Z4q6FhK3nFYLqlCkHGxPPm2XtMPFV3F+ykUdQP9yEBcnBNoIDCewduqpAm94?=
 =?us-ascii?Q?HrnGx5rnGJypfVCk/oPHYOPUAvmWtJrz0R3EI/9rDoNDtLgm+/7Lwf+iGXhY?=
 =?us-ascii?Q?VZ92mzA7hp+Y0H1N46Acc54HJGcTcvJNfuCQctJceeTtdU92933n6qi06epQ?=
 =?us-ascii?Q?n+CjDwGkg6NwJZhwrBPjdJpohpOvFpM80mw96cfvAXmOz0QEcaKJDrjMmKpO?=
 =?us-ascii?Q?YunZ7Qb7EsZVHQh8Nn/G/Pzko1/H4QGSPwlGI+C3MAZv/K7gBxu/JT4wILwT?=
 =?us-ascii?Q?XVNO3htPBdILooSfBSy59g16ue7H7UxZnQyrdu3ihFFME+NNLjYWQxUI64SC?=
 =?us-ascii?Q?KIv8DIPIUxm0FTMeeQDXZTgnDh0108o8SCLCYhmw32gOeDzJn867BPIcp1Wy?=
 =?us-ascii?Q?JD9IFbjNmLvLSHYHqmvzsIbS4ZC5Ynen6RKXvFJyTFgo9tY4Kqe/QQbr5+RR?=
 =?us-ascii?Q?gjzSI8wTjS/xOejSxuQaonqEcPbms2Q75RJeAq6SepKk3tsMBnBzbzoz8hBL?=
 =?us-ascii?Q?Xwr1MZq2eB6uA1h2vTdqgDOJY2W1idc9tgyEYBR7xbr1bgRIhYmUBEBYR5UD?=
 =?us-ascii?Q?bEzX1/L3Yn97KjEtWPx94fDUVBY2IDk9UBFgDNvGzDpK72dnuawv3cBEMz3H?=
 =?us-ascii?Q?RlHzMg9HqBH2qYPcSWxlT08JSiB0iE/TOFgiNKwJ8xmtx6rzEJWgEP6lHSck?=
 =?us-ascii?Q?Mr3TwFSNV5vgYX90Z1jhDpjZjjXAapZ+3C6BtFjWuOUDX4yC3bHlFFyX9uIS?=
 =?us-ascii?Q?E6ej1UfXNk4drTKr5MqYtPMOcpOu6ICPRy0EVG+8C+dd2x2Vin20GoT7FAFP?=
 =?us-ascii?Q?WWa020a4on6q79p+aWYrMvM+Wjt5HJNFotEc6Wdo37v0GlJCeFNb6SN5K/VV?=
 =?us-ascii?Q?0CJjzOKYuEcEBO7GZr6ILizmq2JsMONyAYAwEQFqOIXIMMK2yARTEuub9Ywv?=
 =?us-ascii?Q?0y7drGU463wfDIoVqyippuCvBCt6VUIXn5Cp7npiHMzH3yXidPp6hU+UW+a2?=
 =?us-ascii?Q?3E3AqvbMFsa3hr9zhG3uda3KKO+ERJBpyAF8yOCGsSqKcBQpKEjdfYh04HA5?=
 =?us-ascii?Q?yOYCXkP6LDX5cUD8mFsjzuYfDS4DVuUx/Ixm0qhShT0z8ebcAddy3uMA53JF?=
 =?us-ascii?Q?CqIWA80WLYoBRGAYOuhMOMYi3j0ROympusYpx3It38JW9v2b3G04QTIjy7aB?=
 =?us-ascii?Q?FxtLHBIfyMX1q7tl+MysqLWVhcWck5vCJ/MIsRxoswiANNUUVOiZhKMNwLuD?=
 =?us-ascii?Q?pfgPSa8lsW5UQlQ0SW1UFuHoT2o1G72qXYLCnYV0eZjAAFEeI1NsXn9i3n24?=
 =?us-ascii?Q?jnOSA5ZKCHoKmAh4SagQGzH94/eiEf6NDYjHH1FOQHUZdkCCiWiIkraufuNg?=
 =?us-ascii?Q?WiIVzX/4GhSv6vgHuBTqMRUOu3TxpuPsQuVEjQ4SD5CPbsuvlhWvy/0W/NJH?=
 =?us-ascii?Q?FEvV/wujm2/YPFSYGN1k0pMnrExyrCCtlteLda6ACVV90VbNYrOwNjFjOK2c?=
 =?us-ascii?Q?diwgemvRRDr33GiAuHv9lSIcFBUOIMgvTlccI9kD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1151e070-881f-4f4c-6240-08dd970da178
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 19:44:55.8816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZOeD8M0BvEb6ePLFNp0NOUCHpQR5Z7ZKZd90AmyKEoXzTQKXxWwn/WtzrUHmXzrwv5/OzEO7ew7WUMwzXpgHnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9948

On Mon, May 12, 2025 at 11:38:57AM +0100, Shawn Guo wrote:
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
>
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-6.16
>
> for you to fetch changes up to 1f6c8626527257db05c09022e94a5cd4e162c45d:
>
>   arm64: dts: freescale: Add PHYTEC phyBOARD-Nash-i.MX93 support (2025-05-09 22:51:06 +0800)
>
> ----------------------------------------------------------------
> i.MX arm64 device tree change for 6.16:
>
...
>
> Alexander Stein (3):
>       arm64: dts: imx8mp-tqma8mpql-mba8mp-ras314: Add Raspberry Pi Camera V2 overlay
>       arm64: dts: freescale: add initial device tree for TQMa8XxS
>       arm64: dt: imx95: Add TQMa95xxSA

Not sure if it is too late. typo here
should be "arm64: dts: imx95: Add TQMa95xxSA"

Frank

>
> Andrej Picej (1):
>       arm64: dts: imx8mm-phyboard-polis-peb-av-10: Set lvds-vod-swing
>
> Ciprian Marian Costea (1):

...

