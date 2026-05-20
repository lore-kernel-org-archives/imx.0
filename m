Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011052.outbound.protection.outlook.com [40.107.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293ED3F0A83
	for <imx@lists.linux.dev>; Wed, 20 May 2026 18:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779303156; cv=fail; b=KwBpWb2w2B7K6Ojdn5NxP+RCbq7Y1/AsUcr3kzWOBGvEWtYVeX7c4wioLWz/vIVtdiox8lqJCSrI82lMw04h2jjsb+XRzRNLHQt4fltfif8QFHjLf17rie38UYffIjlBg5pu7a1N71esKG37UCKYR8d50oHbH9x/tw91S+cYCts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779303156; c=relaxed/simple;
	bh=cYMaqaZ9+QjvcVRxOa7gLfKw/h/OXbUmW8h3DP7R3HU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mF065qsvXSt8JDo0M+izEtGzu5AsHN7gi3BpqAIuHx99vEFdJ7V0/2ZEjxAG7cBaGxu5jsnptYr+IQqzsmUXhwHrVozY7wsmruHJ342MYADFcORqE9E2yPDzB11HztA0gqZiYlopG16gUtq+55MoRoRVnJAC7OM9I2CpwIKu1o4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OYnRyqkk; arc=fail smtp.client-ip=40.107.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OYnRyqkk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQawPG8OhfIEGN6nLRWIm46THzxpfbLT+p6fsMHsQYHxdgt2J9rlDYCRwg3VoX+OUQNIUj8msDTanGjcOU3emyVwTny3ZdE2DBdKnvjSXROVrf1qZjUdaToiRHmWqmKiabkOVDVyu0sGWgAektr+V2SSyodsRPTtrQzzkzoTa6EFg8dDm5aeU/cIJppB3sW+AYyrTl8MvAVyypEZAorFrax6vry7cdG3xDrOkoKsvn0n+VrJIvagRfdsryobmVsCr9ZnywdPgx2dlzAmez4gO5TNQkYVax0imNb+nYTgD6mntM3V6SpoFI9iRvkgycToQOtEGvy2yF3usp58QUgStQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvgUB7u+QoMR3oBi/J+RWO7KhGkHgcoLzVUiQYdyRLA=;
 b=KEJ3d5L9tUttRh/Ga1ngLqB2YUIiHlQ1O9gJb3lCuiDQ3x25btUu97e0q49/LVGnRxWo9GstwHiKsmxsNzaNOkYpNc5mW8cauPXy50zS2B5AlNZj7t6VdYpKGzRY2HV9SL19TMY3kr0YvoKti85RTI+t306ouVvMQ/hxHk40fz9gKpNlVwCOyZI6hRF4E8GY5LxwJS849K6gRs81S+fyZKFhx1EFys4bW0EBwJp/iBI2vHOAu1UY+AmcSFatNIHsiQWnhoGMIMu2hH2hrgHoUlZPaDEYnoAaHvg0s2sODXZWLnnNTMVgq/nrQ2X/ZNOKl2nDggnTYRIDuOX1Zjy2LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvgUB7u+QoMR3oBi/J+RWO7KhGkHgcoLzVUiQYdyRLA=;
 b=OYnRyqkkvjXmCQHxNk9FoSbFUdGAzDoERACsonK+EIdx2Ae9oaOCnu7nfHR120aOCz2fqlNtGeS0T62aKfiBX9dst985dXV52y3M1dpn7kn5i15Vrb/C+6Kk6b30z1Kue2iHDtpPIHu28c9qamjlYp0zzfmftngBZnhL91v+kyKTA6BfXYvMqPgIGvUz9ppvOnzhFYzrEkR49Be9oFt+YjMjeYImaKuy4a6NR/cFo8T/+235Xz68dC8EwcVk+v1bELB/xD57nvVNkijzKVVopgOgX+vRo0StnjMwYOZx3st4DPgIILIhs12WM54xciNyJFYpS5OueaRsLtH1BiIgeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8173.eurprd04.prod.outlook.com (2603:10a6:102:1ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 18:52:30 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 18:52:30 +0000
Date: Wed, 20 May 2026 14:52:24 -0400
From: Frank Li <Frank.li@nxp.com>
To: Robby Cai <robby.cai@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com,
	sebastian.krzyszkowiak@puri.sm, kernel@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] arm64: dts: imx8mq-evk: Enable MIPI CSI and dual
 OV5640 cameras
Message-ID: <ag4C6MjnOJGjEpKN@lizhi-Precision-Tower-5810>
References: <20260515111143.2980956-1-robby.cai@nxp.com>
 <agcnS4H_XJRL7duw@lizhi-Precision-Tower-5810>
 <20260520065452.GA2269979@shlinux88>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520065452.GA2269979@shlinux88>
X-ClientProxiedBy: SA1P222CA0099.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8173:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e5ce3dd-6bbb-4ff0-7a76-08deb6a0f1f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|7416014|52116014|1800799024|38350700014|6133799003|18002099003|56012099003|22082099003|11063799006|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info:
	J8mXbsInFO22yqTId4TBJfl2Nd7NmRsCge91HZA4+ax6yia4nWAxOkDV50yLTHBruFkpnXyaJTH5r086XrfwjgxDyTKz+K7Eb0R0UrZRXj2An8yHvehiZcN2x/+vzSnmuj57k9Y9E3RA+N78sF6BLlbTpZemU1uoPVeeHZQ3SoI2ZAFr5Ya1L7+NDBCR2ljU7H3YwXEtc98Gxu5F5SHyG9W9ak4ogdDvPBQ69ajwGRs+8AgThsTJgdAVZZdQGJJJSDXt5PK+/bg/dGJbbQWpabCz/KYL19UNQBpk0PF8pwt7cbZzVC7yJ1xB+tx4ymOTKe2GDoZI2Gs4Hz3PHJwZL8VUv8Hn6lkxUnIYplHPS8NJhegFJc4Xv0QII2nos6dFhHrZV0crVFK+S5kqr914nbqMvm0ulvBBQGoRKjC4M5gHKtLLagmFjFTo4v8dbE6vrGROyPGLbBwtk/+r9NJL7T3fioOFwiexoNwQ76d+cWugmY0HiraiTTTBs/l/zFj1wZHXgrutVP5OCYs4ncx9VKRNydaLvFXjuh/WXLw9Y1MhqAsv9we+KiZVvXWoDAkke9Lc/W9hRsR15u+iObQJbiVVMtXfwNe5CFTG4duholJ9cLSTUAWCXk3GbRTHWh2Avz/hWJHHLlSXoI0lErl8f/JXJ6mNwtju6v/a8S8e46omHTBaYqwHpEy/3yiOmdRDmYbH9rEBaereqlAbeKILbqm9mJ3vPBYKmj+KPJFKvfCMWoLLuo3GYcP2qxgPTM5e
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(52116014)(1800799024)(38350700014)(6133799003)(18002099003)(56012099003)(22082099003)(11063799006)(5023799004)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r/dA6t9BcK3HjMPo0LYQE/7oSCA70Frxs4MoTL+ahkJ4WZjkSg11hduWYrRU?=
 =?us-ascii?Q?hVBR3gnkdhaFeMPGpgwYm0qKG2GWKfwhY1fRwPSDIIWMzuAZpce1h0Z4yzER?=
 =?us-ascii?Q?KCThK6bPDTwsr+nnIIeb0W+Yz8KGDRPCYSm+ru6GDr8K35ho04jztGKkq7Lb?=
 =?us-ascii?Q?g6dSlHmkE3KatKmoKgseQUkPxYFYPoo52eHw4BsWEcbChd7BPgy+HmjXk3jB?=
 =?us-ascii?Q?rcvsoLKx3tM6gWu4wlobgKiug/1UCmEhIXqfS5csUjcwR+FgzPBdutlhWmgG?=
 =?us-ascii?Q?Po57av4plqkL3F5EZ8hyjdc/3Yz3rLeeNUGMO7/969LBn1/AwDpS6Yjr+Ouu?=
 =?us-ascii?Q?NELIqLEwl+ciFDvJpcBQqEUAoKQUn0l6aRsDgufB9xCWVP5sWFOUvrsd9ikS?=
 =?us-ascii?Q?ZB/xDKCttmaeEsPACScUtqq0JvE/kYjXKlU399pSvOWxj2DcOvz5gYDvdN2x?=
 =?us-ascii?Q?9gEbrTIL4k+VTlHeSEbO1KDKUSmyJw8vXyzl2XuylXmuTpQe8NqDE/bSp527?=
 =?us-ascii?Q?2QwdXnhICdkIfE0GZNCnTr6AqEuJOm+yG/+77GVt/CbgooYyxt+jsFhdpM72?=
 =?us-ascii?Q?Dy/1RfnHo4Kb4194AZ7vkjIxRwcP4lngt1bX3tTxJFxBTYHfSgpjeV/K00tm?=
 =?us-ascii?Q?PyNvo8WzmIrbPVZQ8GSt1e3VAxXNEISAHxe3Yzr1uF81OWvhDIR3bfQKFOIi?=
 =?us-ascii?Q?2+mXykN3tLFEcauuBFr+HnxNa+M6cfXE/tpKLKNinSSE/IdS6LL+tdDFW66v?=
 =?us-ascii?Q?WLJbeiQB3/qXwoRZM47lkw7HcpGeASrcre0UZe6/U60tWQBqzbQRlWI/uuAJ?=
 =?us-ascii?Q?gniceDU6O/aKVPQY0GmbiQZCF4SWMRF/QD+2jFVpmtD3/phT3RAbS9cRupPz?=
 =?us-ascii?Q?u0HV/LmPNe0TB6brs/NdI6Fg2veMCL+LCHytV1xNLP3FOW/z71WL+sv9CFw6?=
 =?us-ascii?Q?a/IAL4SwnPYuBhr3q9iPlC3e4QrwZjbw9jkRXgE69bmb2PHlWhJb0LtHQqdS?=
 =?us-ascii?Q?QZ2/PkVzl0Q3qLOOUQ6okjH8kwG32fMsEhmIg9pGnL2unUuOnQVCw/hd2eLA?=
 =?us-ascii?Q?iAHm1RI7/xlwsSo+hL/qNZ5TIfXUFin5EBk3DQaBVevdRROjD5s6LiuOcqMJ?=
 =?us-ascii?Q?yE2rF8HXFoET+oFyZxGaBYD90pgTJU7GVs8ZYqk0n5dpuFSym2uu4GKGLziG?=
 =?us-ascii?Q?D3SoGDjfcpv93xMqtBlBS9Qkw0oUmmRNocAezTsG5EgHCQcDNeCru4Enfk30?=
 =?us-ascii?Q?c0sONo4w9ho/ZgHqDfm1g4KLh+tKONnYJbXOnsExYtfoxbWGgrWiWNEjYr5b?=
 =?us-ascii?Q?VNxczRjvcONiiLjylrxvnJOlHeJqbVYhcIb7AL2D2CAJpnTzJDgJ3I4hUlpd?=
 =?us-ascii?Q?6im259O+fAcpyIgK/n+mSJanLhVtc1jq0KMHGHvL5HP7QA2irdnhNdwMi2e/?=
 =?us-ascii?Q?g1nyhc/sWWPuLqOg7umlz9Pnbdbgyn+Y33IRAT/msZv4L/CewpNKIkQT6+0a?=
 =?us-ascii?Q?/sC1fzM5mvqqvwyf20lqGVizuAPDr9LERFBMvqWLSX2ao/Sshqjq0gsKm94l?=
 =?us-ascii?Q?oC24zCeeDp7CA8ZbO3yJNsR7xi5A0RdFSG5haX6TcsXgVeLihSMThgCI1FTc?=
 =?us-ascii?Q?VuBPsCFZLySjtmCwmelVgb4DMAEgbmx6HTKC0PWdvcQHek+++PDtabIKkeSs?=
 =?us-ascii?Q?ux7+BXV8SoVvK+GSMgAWRVtLeatiOea8EckoboymYgOaZiJG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5ce3dd-6bbb-4ff0-7a76-08deb6a0f1f4
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 18:52:30.5202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vpzxxwtz/oTn9xaI1AH5PxqV7wwX4egtKdd9MSZxUPPQqSuJ/KAWfcoPwZ45G4YTdmDu80b0mCpZTYaDu0RUAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8173

On Wed, May 20, 2026 at 02:54:52PM +0800, Robby Cai wrote:
> On Fri, May 15, 2026 at 10:01:47AM -0400, Frank Li wrote:
> > On Fri, May 15, 2026 at 07:11:43PM +0800, Robby Cai wrote:
> > > Enable the MIPI CSI bridges and corresponding CSI-2 host interfaces
> > > on the i.MX8MQ EVK, and add two OV5640 camera sensors.
> > >
> > > The sensors are connected via I2C1 and I2C2, each with proper
> > > endpoint descriptions to form complete media pipelines.
> > >
> > > The resulting pipelines are:
> > >
> > >   - OV5640 (I2C2) -> MIPI CSI1 -> CSI1 bridge
> > >   - OV5640 (I2C1) -> MIPI CSI2 -> CSI2 bridge
> > >
> > > Both pipelines have been validated on the i.MX8MQ EVK using the
> > > upstream OV5640 driver.
> > >
> > > Both OV5640 sensors share a single reset GPIO on this board,
> > > which prevents independent hardware reset when both cameras
> > > are enabled. As a result, the reset line is kept deasserted
> > > via a GPIO hog, and sensor reset is performed via software.
> >
> > Does reset_control_get_shared() resolve this problem?
> >
>
> No, reset_control_get_shared() does not really solve this issue.
>
> The problem here is not about software coordination, but about the
> hardware topology: both sensors are physically tied to the same reset
> line. This means any reset operation will always affect both devices
> simultaneously, regardless of how the reset framework is used.

Reset framework is resolve this problem. It is quite common that many devices
shared one reset pin.

>
> While reset_control_get_shared() introduces reference counting to avoid
> unintended assertions, it does not allow independent reset control.
> In particular:
>
>   - A reset operation (assert) will still impact both sensors.

yes, only when first devices toggle reset signal. Second device do nothing.

>   - It does not solve the requirement for per-device hardware reset.

It is hardware limitation.

>
> Therefore, using a shared reset control does not provide true isolation
> between the two OV5640 instances.

It is not isolation. Just don't allow second device to toggle reset pin.

>
> Keeping the reset line permanently deasserted (e.g. via GPIO hog) and
> handling initialization through software/power sequencing is a valid
> and practical solution for this hardware design.

If use i2c gpio, expandor driver may probe after sensor driver probe. So
reset may happen after sensor driver probe.

Frank
>
> This matches the intention of the upstream changes as well, where GPIO-
> based resets are treated as simple control signals rather than fully
> isolated reset domains.
>
> In practice, using a shared reset here can even introduce subtle
> interference between the two cameras during probe or power cycling,
> so it is safer to avoid using reset for runtime control entirely.
>
> Regards,
> Robby
>
