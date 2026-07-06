Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011040.outbound.protection.outlook.com [52.101.70.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3E341C307
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 12:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341217; cv=fail; b=XiGQfU2HoZ0s5ygizGeej0uqpfI48v//OuvpVJmUglQ8TWf/O960eWBGym2LbvyfzsQWIFSnWgWMmDfJf4emzm5r3FkBMWAwaLdW3+ccSgTkooAjUQTu2EbHFHmn6yGQqcHQ4RI0nXC26MTgmN7EY4FRPv2IxhgGUfd2wW6twJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341217; c=relaxed/simple;
	bh=EPRG0rO9OO2InjyRqPMzHy02KFrd1keHzolZAud2ATY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lQBW5uWcdmkub6HQins6hM/jl18snF4VcJNIoah8xeXvqs85sA/53OzKw1PX4IwZLa15XzoUCB55MfKmiVpRkir307Zk864RJUzpu7KEpClwrUt1sKSlUiJJ4JR7t8lgTKdM9PuAkX7PB1rrQcksx5ErZm9iVUxl2+IS6pDr8Ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GN4qU7+V; arc=fail smtp.client-ip=52.101.70.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GN4qU7+V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lykcbvphC0RSbDAW2wLwZJwYkEUa+LHHWS74tBPDDYK3bSx0g3lfMzFywYmclDyuIyDnFr9Hvl5PdOaSBvZauVKq2DcUX6Oed68v+Yt7Ghi79+/H34RqoEwRHb8bJ2jGPMxBF647cYdMpzpaDPyDsAMmrAoS+EALxGaf9hmhKJ3jM/CV4lohjMiLhc+cdWq+JLuRg1jwvfmsVQ5ZODWBoRliJV98cvGtg4ZjWaleOBhgzkFyoHZK/Qyuofj4LUpTgqYXeqdjvbhLm+1igjBgY6P29YK/HEmtzqsOqi1jiImHztxzPkPNBAiYZ72JiQTgzUrE/m3C1XIcjyg4uqQ4hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPRG0rO9OO2InjyRqPMzHy02KFrd1keHzolZAud2ATY=;
 b=b2MoWE6wcWTsv58uQzcRW5fEksQMEN3vVdCZkndqm/SSUQgLfIJZl6in4U1hohrppcBbLPg7CXhTQUtjRh9blnaOeA3bVwDsVibVZcTFpHHwgjn+/+lPn9sUYH4FINbn0qim5jWE4cUXQIqz/DwaA4bPTE1yiTZj3BbnNYiHgPMjQaaVgvhj0fIICnCSyLNyOIwQnn76WFvb/mE+hdgcnLsnF/PgNyToTcPa5PJLoi5vASfvtz7sL+iRQgcSlG9MtPLZsvGZ1Q8o4akYIlNQ0Vp8k4BSNMOA4tbgqh0rI+rRXj67TEE5LcDq0v/V/CU7uhoZC47Y5pZTmEoyCFzyfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPRG0rO9OO2InjyRqPMzHy02KFrd1keHzolZAud2ATY=;
 b=GN4qU7+Vcp8tEiSZypHRxhmLckwBCwlTr4cGTrQy9ij7N+a54avifkjNaGomzCOhCpfWOfA5kqMu/LlIACHiQW+M0NhEPtorvTzjtANqRkb8GL3CLiclJjk/x4eaoUbOS7qcBDDMf3vdXqlH3HJd6feWxRBCXVQ1k3YvaFrdIdFKZYH9Pdo7cNDv1lf910M5AJRWU9oLGv8LGkqtN8VXThDsrNJaXnSMbG+CDx36wNkVHKdYOUto24SkSTlc74CpMgFLmL3fUD69ZNbwpudzYw65r2Sf0rqM4tHDbU0HFVL9XiRaQtK4rDbYNzd0DDBpjJlSHZ3uEugxGOd4t+7doA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PA1PR04MB10700.eurprd04.prod.outlook.com (2603:10a6:102:48e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 12:33:32 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 12:33:32 +0000
Date: Mon, 6 Jul 2026 20:37:01 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 12/15] arm64: dts: imx8mn-var-som-symphony: add wakeup
 sources
Message-ID: <akuhbeXhhpamoLt+@shlinux89>
References: <cover.1783330236.git.stefano.r@variscite.com>
 <af94dbb605a1c18f2cd2d1f86813c0c6e84eaedd.1783330236.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af94dbb605a1c18f2cd2d1f86813c0c6e84eaedd.1783330236.git.stefano.r@variscite.com>
X-ClientProxiedBy: SI3PR03CA0004.apcprd03.prod.outlook.com
 (2603:1096:4:297::11) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PA1PR04MB10700:EE_
X-MS-Office365-Filtering-Correlation-Id: c0237669-17e4-42db-3253-08dedb5aca67
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|23010399003|19092799006|1800799024|376014|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
 TKd96FeT2rtsht3lMdEWBsXeUePxtQRNNkB7BIIxosACBTtFjrYLYUrVMuYVZ1F4oa/9dM1spVol0/WttOkQJgXnRj0JOPCqgU57zA0+imchxOrAhVN6bHq/wRaZ5RyNGaVWBfWK5GGna2Q5wRYO21+zfi4hNPGZ7yOdkb+LTvS3Zh6P+0vl2Owni0SRbbj+VzJCW35ci3HH+lvEL5wNuZQdR5VxcSV+0AdlrC1vAzQZnqPv1OGEmrk2/POSnfC/y7reeIpMl3y/Kqy6QEJW1rSMoLfmbYqdvzObwLJZsWknIVppQhH4oe9Iu9uzuYNi0i+yRBXKETVqlen+3uucH+WIPpgEf6glc7Yeg0aRYBbQNXXTDA4C5smnV+1Gr5xiiWKgIWBGWon/an92mPaE3N9SUAVR2seu7edvUkU5G6i5F3HF7dMmPZ6ac8TERb9+s9OeIgeXirHm+I/QdwRTDQpwmS7FwOw2b3ql928Or9OsDXjifLYHtzeltQzt1gQtlT+6tsNNmhtflCpJh4gkDi/wPBR2Mljt4Vqq5WDoWhqmEuWA2D8WtN9bGpzRG+CFWCuH50neoZVxdX7vWSD2IeUwv6K/v5o+pW50BJlOPBig20swulVXFpfzJtqO2N4vZcrnp9htuAAdC/HN6rz38XyJ9QnRNoeuuyeIyJGrzhM=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(19092799006)(1800799024)(376014)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?x3SBJqDisbyw65x8hHtxB6Kol6Y/v0olPoHo9KOOE9dIVTDagtyY0RhVz+oo?=
 =?us-ascii?Q?4q1kjQMBU7PtstJg+/UbSWVzb6Ys/co8uLeraxpfz4hWCwnUAI/OfiQlc8wd?=
 =?us-ascii?Q?2Rnh6hSeHnhIYTkTMDQ5qXTWnIoodL59vftfR3zGLFEFOShoo1J2CRruI83l?=
 =?us-ascii?Q?oU8IPWU8t91hsGLQ+UY1jzPP/4duH0z8GEE9iqLh5QLDAg7phKjwuF5RLnkB?=
 =?us-ascii?Q?jF9/TtyBmWi+MCyfUrb1hN7DeGCkelbz5/dXoGTRfhp7GKnd8nfxhsZtZwaC?=
 =?us-ascii?Q?Dgj4rx4Q7iH2ZjYrhAGUEN5iW4wg0UweaACJMCxgdRCFeRp37ihRKBLCnxsB?=
 =?us-ascii?Q?h7JKsS9mFXF8JB5D+Fs9aRNMk0dHSWBlFvf/oPZKOry3v9eZCrEEiJjfSg5s?=
 =?us-ascii?Q?Mbt8bmqVOaMcRFp0kw43quU5ybauGzQWl5VCbT0DbX0C11NQipefQCUxHfFm?=
 =?us-ascii?Q?qkbONpWSULQz6xt8CPEg2O0mwJkhZXBAJkz2eAib0gJe3tlEIsAGYyh+Lq8g?=
 =?us-ascii?Q?wRC/HTbaDqxtTy8KPW+fhxjhEL4GSDv8Yq3mD2JwJeAERFeN4scfzqp0xWM9?=
 =?us-ascii?Q?Ief7IEcAyLcg8h3DPSmc9bueYJ079HW5R2eh18Lpio7eIO9je6KG5Hds1ALh?=
 =?us-ascii?Q?S4sGlnJ/TpQHhcIQsZs9laLPjiT/WIwfa0hzTFJTds39k5XdB7jKzGHsMz8L?=
 =?us-ascii?Q?3U04v6uAuVqgjDI0R2U6HCniryrXiCDoxnphiZcrZb/jCueCirQxBD9U7cKE?=
 =?us-ascii?Q?RKFNCoO+M+OLdY7aAd+GQThQeWAedu0e+6ylakeRnsgj0T66mfbv6hrDvh/O?=
 =?us-ascii?Q?LLkyQLVVay0Wwvih6YAq/tXjOOCWLDX12JJLVA2dNyscjuHn7G7324HZ7Y4p?=
 =?us-ascii?Q?XLp2SuA5umkolvl2uLb7Z0DkUmBCgLzt2k8Wofk647PhbhnGN/XEnynpYvIO?=
 =?us-ascii?Q?qy4EsWd1JXXH4JCgijZL0qVNYB0tLUCOjxR3rOzMz3SRFFdrN3Bq7GfM5qKr?=
 =?us-ascii?Q?D+dMdWiQ2QXh8akx1uk0RR4lA/yDFgZWIcYS5nJPIOTkft5i5RXF9Fey2lDD?=
 =?us-ascii?Q?FV/QDbgT1UioaQg6TCsknNNN077SJGThZozehp8xke+jZrynkB95urN3f0C6?=
 =?us-ascii?Q?ploXu153pApbCqcs6Deg4XUB3bunKLDx0VxbKChWOjTJaOtF0l5/TFB0/9Wm?=
 =?us-ascii?Q?bI4qo0FJ6WWMrOE+iLGPfYNMZNmAXdQN2/VRJAoVvQWGyzc3MWWMJoaLg4Fh?=
 =?us-ascii?Q?e7Ti5XcCtPEiNk1WK6Cx4AuJrqO8U0Zuf5l2ub+SrDaLOJtY2f8JXQ+AWI4S?=
 =?us-ascii?Q?yV3IWpgXZmGSLJXKj6mRZkEMyuybpk4KkyxIzf18Kot8l6DOXX62OksOYdwT?=
 =?us-ascii?Q?+j2kj2w688YGU/0Paal5VIITx1VoIko78w4w5x4bdzmEY2wy0/jRgteYF/fU?=
 =?us-ascii?Q?rUNfM3f7TS1BZ++sDGpSkYUmSfFDoB8kefiqYLsS/jSxVYRKfPmQDyfLE5YS?=
 =?us-ascii?Q?K/LVCFn/b91DNv/HnEHWf2duNFpXo+wwVJ9SvqX3yri4FPaOHU3pseITMOUv?=
 =?us-ascii?Q?n3XC/I83SwTrD5YrRQWaUNI5P+HFRF4Rcuh2xuBuryC0J3l4Fr9GBg/FDg9n?=
 =?us-ascii?Q?lwbXLFXWbFLSf1JNYsURD9CYDzam5+pHyWe0F7iqAHNWs0I6YFc3kUzhdks9?=
 =?us-ascii?Q?h5SRefVI0mrpJ12FExu2HLV6QTsiuS7LSeaZa9ROVeTWK9XxqDzNw2WZkDee?=
 =?us-ascii?Q?QrUkzIDFRHE3Zpubni+E57+I51+IcJzpppFzm/SGAvLu4c0Lw1LY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0237669-17e4-42db-3253-08dedb5aca67
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 12:33:32.3527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VmP2meH5dA/QQpbGDUTbRh/zMNgWkxPpQ5ocTeDa7+nAcQTdR6J1SMtHTEJHBvWWGoS1eow2NVwI5uPNzrPa3VJRi313zoOb3s4EK6G+g9yxpKkyMhoqtMAqeFysETl8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10700

On Mon, Jul 06, 2026 at 11:34:42AM +0200, Stefano Radaelli wrote:
>From: Stefano Radaelli <stefano.r@variscite.com>
>
>Mark the Symphony carrier board GPIO keys and capacitive touchscreen as
>wakeup sources.
>
>Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
