Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013062.outbound.protection.outlook.com [52.101.83.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4BE3385BC
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 02:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773367571; cv=fail; b=ErwIi+SMbyL6jY29BelxBhQnkPnbUcogLSrBDHz4LfMVOqVyAKFB5aJvKkOCJ20TbZGBZ5G158rs4mK08Rv+7K6Rwhw92Ed1/6unf0DwyTAyGfLU87H2GCrRFoDYS3Br+WlbhkkcWs3/QXpTYLehG+oBhq5BzZZh9V6RNgP3dwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773367571; c=relaxed/simple;
	bh=wNYdt8KDD2eVpjZcDG31kGVOewXbI1gMQ3aTnOeAW2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=k1V16BH+jh+Q2BseaY7oxUzS2TcT/iYdTl6ieNk8fbTybr1zqQYn4bhu02JqYHUgZjoBJESWQUu6W4Mo2Hf/sj9Z58rqRE4mHWEM0j9tu83lDFn/Jg6MWntw7ro8pZAfz9KDdUvL/Z6PdL/QjZ90FFItfYKO1X0CfbzpBqjCIHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=L2wiY8Ja; arc=fail smtp.client-ip=52.101.83.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="L2wiY8Ja"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lIP3aTGbDajBVcRm76FAC6Ps7G/oqJlA5QY6ICUvr44NxfmyP56FxSY+RrAo/zCN6bzBukgNIjV58VtixLVvEgDK76rqXj8sNvhAVDcxv98wJMPgkheig21tY492VRBRV2Bvkb4J7TYIXKfdS24GdZb5O6Rkmsg/Z1G1cl5u/CQQ5WEc0z4ilBaCaq2FdaSPMeF/LcJM++6jnbFJkmC6axnfB4dIJOlLJtdV3RlLvn9RxOPpg0YoKmQBfSkgwHi5OYd9eihK2iiuFcJxfPx6e5mZeM3HDyU7bX4L6w+DuiV/qVZiv7G82hRx5JkQUD74Lt7F+nbx5gn0U1CntuRwpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woathD8LuljSF0y+WBydr0+FrdGIltMUluCExGWGHSk=;
 b=MItFVfHpdmaXaYu4dCXoutwsqnhM5C2J9neng1iz1m/vBfZhjN6GD7ZABmJFNBpcJjXgzBHD6jRoTOl1fj94Y8jBmdYU9yjgZ3HDZ006pDXDnzf1OWXp889fnTzI/yB0IVQqky+uowPZb8HWtlUdGHeU2XaLq4mWJgomG+zjcEPYW6xsm+51ZxUQ1XSacGzpD/K9a4fUbhk/VxsP0gZrLja8YjxqawrA9wK4BSo9qvVjyg0WETkIgaJa3HRDgEVsRIpSejrBVae5jgs96STevSO0G9KCLAX0AnuxeeBtBrondspMkjsWN6kbQtwSEvhtQ9wDAiWMj5qbRov9JwOFig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woathD8LuljSF0y+WBydr0+FrdGIltMUluCExGWGHSk=;
 b=L2wiY8Ja4RpWi5nafzvjX/DSZkEPE+q6AjrkUu0tIzwjrVTLmdXhsovQbC7udP+p2ir5QcX9fc0wJ/+sRVRoaSpOxxE7d7avTbnIizMVsp1VYyppfj4QJmuqXWSO1xWn22exPC1OP+FCiGj4ZVNqvDmtFGtEXij2EeqG8ApjvETca9oXd2Jl5k2pYWwbCJiTcoL7etoj32KU16/2K7C5pS8a7JOlI1D7KzEpbkXJv3hZfb/6vmsbGAow9flxfP0ludPRtx32ba6wR/M5l3WmLVWjC/gO2GC4lfUHaHk7YPNTqbDl88L3O80MFpVAVrwAEbhI+9I3Llgbae5J4VDc5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB9064.eurprd04.prod.outlook.com (2603:10a6:20b:447::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 13 Mar
 2026 02:06:05 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 02:06:03 +0000
Date: Fri, 13 Mar 2026 09:58:18 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, amitsd@google.com, gregkh@linuxfoundation.org, 
	kyletso@google.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: connector: add pd-disable dependency
Message-ID: <eew6denbcj2orizphwwl34qhbwfnumas44vx3f5t722csugmp2@zbsmhpcqazao>
References: <20260312071609.388047-1-xu.yang_2@nxp.com>
 <20260312-facial-backshift-7e810ca5f996@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-facial-backshift-7e810ca5f996@spud>
X-ClientProxiedBy: FR4P281CA0310.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB9064:EE_
X-MS-Office365-Filtering-Correlation-Id: 04db5b90-6bbe-49b8-71bd-08de80a51445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|52116014|19092799006|38350700014|56012099003|22082099003|18002099003|27256017;
X-Microsoft-Antispam-Message-Info:
	uwqEwRjURbfkzyDpu8DoY0i+LC0qB7o4yYRiKAP8I0yct8iiDrWvVddZE8/dexv9O5n7QTVqAmALrSkuAXjoMhKVOw6MTNXSCSNIqfUyF9k/cR1W7OgK7hwCMsf/G+IVQuIST6xEyDVjDf+rOzLzPurg3aFldafP880yCp1OgEmXbAp6/8GjB/3UEN8KToMJPwMtjsO1eoUKj8a6p7UL1+E6k8YQ7wwlVbmhGoKNBkEbx6Te+obxwJleCzy2jCkztaaykPuRpuytLkka8qRq52aYk3jU9RbwOHr5dYHitBp1Nhw3feasXhf5cTQGd6WahvyXEPUv9KoC5uL3wbWZjGU4fEg3YxhVZQYwT7IW4Vs4ENy5mDn7A191Y74rJGB7zOjfPF7zMrUUHIwx8PnaRaUM+P1t/jHauKubkvAkiJZwDFaobM/ZVeijqTgNrTXv6By/iyXica5T00+y1yiN5hcPoVF95pnHBvhdQpsQ4M1QSoppzbRMuD3FMmWgBuZba4RFfj4luMkFguK2jMgDEv0vmpkqiXc4j4PgBExqpHULzPvbyhmlfg2MwiS3D81nv7mjmb1TP7UcSQYrg3nlH5YEDRhDPmOn/2vDV5cB8qkg3zpPX+59bKjPU8MKgZnMUYYnzOdgMTHSHDjNxTkhmYvmerxKD9lj15Up3nr4UyVa3pxY9HXmNgQhttMtSOxUm2A0MBrQwTyEn1gDs0eAcGxrSVFC+rtu257Df966UfGlVLGXM2F3DYrEqqdNIpbNR6plrFRAIoTmjhj+FF4cOSblY6ImxMyzhATUJWuYvwrQtnj6zon5Pm7WQaq9Hwk8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(52116014)(19092799006)(38350700014)(56012099003)(22082099003)(18002099003)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RBtOhMlTQNfJXyXSOwiwvgT8faYUdMAGTI4AQmrszX74EpI/FF+hYBZscnE5?=
 =?us-ascii?Q?/VlNA6mKiGo6qd1pFpizuBZ3J9IPKkBdM4vM+RHyZMhdMa+mBSmzEG7CkcFn?=
 =?us-ascii?Q?oLwedcLxqzl8VXFfV9ZCyUYmJTQ3FsjYUClS6ulaz1illiYqovv51s9sgOal?=
 =?us-ascii?Q?4JQMBPpMv8s8mnUiZ5fEa5uvuJ7lxm4Tbc1A84yd0FFy/Ed/FEMyRz8Ij39q?=
 =?us-ascii?Q?CbfqSA8Ksf6RVNviroOdedFzK9vsa2gLYGNwJeWYnfZWdjSTCsy4rmzZ23QT?=
 =?us-ascii?Q?/w/i+c+L+tdEnDxt88iPa8KbACFSqdLxv22zzgnroGKD8gi3Mc9Yl2T7/LL4?=
 =?us-ascii?Q?QePJWj6WDqh6DvmaW/WXfs8yMBVQgD7sPOzF7ic+V8tWTdaVg/RCbpdij7pJ?=
 =?us-ascii?Q?CH/jubiq9dFXNsaQXjQAdIqSH58UflxKpyOHsMH4b5FEtdDuV/Cq0gCY9KH4?=
 =?us-ascii?Q?hNJZisxxdwJ1x08fYBCl0vk7KLws65FNfk12HQVx3M3BtSZybJ2FH75ztkAb?=
 =?us-ascii?Q?c73jQUfKq/cbrgLq7eCdcymf+cn+9wfjmKOQN5FR/yqn/ZsSwhd8KJZBzF1z?=
 =?us-ascii?Q?lx4aZOL7Nt4Q0rQhUKkmnZ+32QJ9gj9z5C8AMOeZ/FxT965TEYf4OJVgQa2H?=
 =?us-ascii?Q?AOe22AJW+fYyUJAdufBBpfVzsq7hdsk5JMDph7QPNZLsYxME/NuGNscvmzUi?=
 =?us-ascii?Q?BLISMF/YFh49/rbTdv1hihkwq9lxO36LezMyg3z85cAgpIvfwunayqpRf4Jd?=
 =?us-ascii?Q?ePWHwp3pNg7lIuPTYizm+z83OgVfsfYnryRhBcQG9bRDy7gLPQec1RIXNIo8?=
 =?us-ascii?Q?83iWrHAoAOiFfxSlZTeXJkgEsgHouVNcsl5yrxKsZYUXKf1F37ZokD62vK84?=
 =?us-ascii?Q?yeUWO5jzxvpY4m2RvWeswZ7gxYwjyWw79D0k0Xjq9xUjmyutxW2s0R7MZQ/D?=
 =?us-ascii?Q?IEzn95s3np0JaljYmjzCj/IXFpnFqv2uK0QFQlsBhqg7qPgjtY8IX/foOSO2?=
 =?us-ascii?Q?XAyIgeLvU/z7H0WF5W04T2C8jr46LlRHaeRkwefXfztRKhffVJRoWCw3k51V?=
 =?us-ascii?Q?J6aEDJ6xy6AY46wW6Fsmx59W8HdVhUApj5pWi/i1lvssLF/dBy8MMdfJvy0x?=
 =?us-ascii?Q?BY3dvdEMPT0KG3yC7AfRgmd1CqhAVyzc7YSK0VeHXiI6QKYQKHVuV4IA6w0i?=
 =?us-ascii?Q?h4VdME7ORBaC/Uw65vj8o5FSBoZzMVdWt8ytYVeye5gA66rm3bh9+C5AjvU6?=
 =?us-ascii?Q?47TEsZal23GrL6TECZ+ygPOXX4VelGqGN9G2xCy+W8TqgCaP21ZK7ylE5YFX?=
 =?us-ascii?Q?k2hCoNaIbByQxHcF6p8XORb/WeOM8IePWkH+7S7vf000cOqpF4oaQbRDk5Al?=
 =?us-ascii?Q?mWn1UMf26+W85RmVOq9FERVbC+UmBBoZgg4hGbajWvulFN8VMyh5Fqs9YnLr?=
 =?us-ascii?Q?pqSkPp2ULhJkvyyco8elk0zNQ6aelOpFAjDexM/jE/Ap84q+UmWQWmJ4LnvH?=
 =?us-ascii?Q?Zq/5rASwAGGaO2V4KTwH5VJQw/6MFyxxQgmpFKGeOvKZi/P5CkWJJLzdLTbC?=
 =?us-ascii?Q?j/FaDJ9oTEv63TGV+dnmWq63rV7WxprTGtr2FhgaIPI5QfiI5BScuqhCTOAd?=
 =?us-ascii?Q?IA8aEx8vW2+r1yDZPFRbnwARfCEne1sGGSptFrZjD13UnRKIEQ7DHVyZ3T+k?=
 =?us-ascii?Q?clwnFDla3tx2/iqfmP90UlBjtu5NbGefXMesjrcH7d9LubxCgErMIqKRmWyK?=
 =?us-ascii?Q?KnJqgNXuOw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04db5b90-6bbe-49b8-71bd-08de80a51445
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 02:06:03.7329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3rAoe6VFguLPhPkS2opIDF8teUVcp5yWiv58cvbcGFDRp+HoZw0QaezblxBqshSq6xfT50C8J+AQsn+lCZUNYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9064

On Thu, Mar 12, 2026 at 05:47:32PM +0000, Conor Dooley wrote:
> On Thu, Mar 12, 2026 at 03:16:08PM +0800, Xu Yang wrote:
> > When Power Delivery is not supported, the source is unable to obtain the
> > current capability from the Source PDO. As a result, typec-power-opmode
> > needs to be added to advertise such capability.
> 
> What's the impact on any users of making this a dependency?
> I assume nothing negative, since this will only impact systems that
> don't work properly at present?

Yes, right. Most of the user satisfy this requirement,
expect imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso.
I suppose this user can't work well, so patch#2 is added.

Thanks,
Xu Yang
