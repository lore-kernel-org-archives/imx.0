Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2043.outbound.protection.outlook.com [40.107.20.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D861420A8
	for <imx@lists.linux.dev>; Thu, 12 Dec 2024 04:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733979339; cv=fail; b=YSRQ7/gKS/s0U41MdCtQBE3SNAbxqqizajdGspx3o2odUC6+/upvlxaxYKbAe8gCxSJfkkgzp7fhvwpl5W5EHcg3/90s1hHMnnD1NALHJRB/AiWb48RV8daKObInHrKBiO7dnOUOgp90ZixCuhR1LBar8kk2jDoQN+PQeRhp6tY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733979339; c=relaxed/simple;
	bh=CKhr8cLi4r6QCeadr8UE/EItDeeLoQE4MuUZhqKbaR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ge1C0mI9YtUzqTgnuw+g6aFtIZSOJbxQPL0eoxk90Ge8lc7dKjJZK5aDw7L13EMQijd0V/6HfkFKH1TTRS3H0knMwaE6rMpuwT60tlQqytv7NV+77TE6O22bELDAfozixMk1MqJDthBUBE4JVdqJbApErQUW4SuxghBlfuzedzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lBRToj7w; arc=fail smtp.client-ip=40.107.20.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lBRToj7w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BcPeTgj87emhFBY6rl4ThHHHoYXxSRueqmeqJdNai95UolW9d0ML7Q/13UUWxlXi8JA53R0J0ZIn+sX/0R/vE2imJLlMXGfwyFNUdMti8tnjL8+QUPchAGW8DZW9JlKtqC6JclG3K4e5RR7Br1fEzJkHnu5dnc88XRNZOFyxRlai+A8vgrQTBkIl3/j23rHOdK6SlC7vMhFtNOynw6NpTa5SePW87C9akytWLwl+RAJT4dAXNziYYqKKdL5rKVGB7wVYApMbBOJk3ZtWTsWD3yx5e2THKe5uLaMm8oMwWkOwPkiOvPGZ0AxuSkbNEw/iJU1nW2XaJmxJ0GzW86abSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=msX7OlumBG7MgeWdg6tq21lrvmW3k3Eh37/Su9HBlgQ=;
 b=hJtlyOdnvwk/Mc9rYnpKy9VM/IRgMiiQUxkzpwdKU3Sz+tfchVdUBPL2SS4LfbYRE4v+XM81VAw1707OoZ8Kqf+rkTKnxRQhGN7mBLEL0v7lUbK7ZF6CzZyO1yG6O11sf911OAUCSx6gwrdYjNvoO0crlnopy7feeyq61cnxXWtAl3NTrqk3DSxsgKzKknjr2n7hCDOW1aKBcfCAdcK2pS7/HjH2cy2P/0qKS3MWlrlKdeLy0FH2/aqe5GWzkCV2+G0I2BpMeAXWOFNuASj9/lRU7AluexQbgdVBTu95+G5mx208hoLXQB8PepqE7bkr4Zn3cf4+GTp2e/8RI0Vs5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msX7OlumBG7MgeWdg6tq21lrvmW3k3Eh37/Su9HBlgQ=;
 b=lBRToj7wGWpA9BssqiVpAyeQ7S+o86lN2zm0iGSnwNAVgU4OcBhBEs3+OYRx6k2SJn4iH/e8XS1akxCzrpeyWEQdwGv33NHECfecyF+JJGuthZwl8fDR4REWEnVdgiu5N0mUqKk6d+FvvWmhqHNmdz2j6r2bmB/iBMMG+OIfhC6Z/GYxgW1u3yq+rC92iLoQRNZLSQJZGTR+Jps7BjsGe26LSfKRpFj14CYgPH7e13fV86iunxvO98sGjFvmQeokiaIq232mJqUMNg+Jp5+zpI9kF6iSQJx2ttKVMkRU+n66hE2HkM2imEUxSiAr9HOjWZ2M/PKGB4M2oxqIoK+Wwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS4PR04MB9268.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 04:55:33 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 04:55:33 +0000
Date: Thu, 12 Dec 2024 12:52:51 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Will Deacon <will@kernel.org>
Cc: Frank.li@nxp.com, mark.rutland@arm.com, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v2] perf: imx9_perf: Introduce AXI filter version to
 refactor the driver and better extension
Message-ID: <20241212045232.hdstkxd3qcdtrmvr@hippo>
References: <20241125104338.2433339-1-xu.yang_2@nxp.com>
 <20241209154419.GB12428@willie-the-truck>
 <20241210020212.yz3xowvdk27zmgsl@hippo>
 <20241210133732.GA15607@willie-the-truck>
 <20241211053455.z5zzawfacpyv2dlt@hippo>
 <20241211215637.GF17486@willie-the-truck>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211215637.GF17486@willie-the-truck>
X-ClientProxiedBy: AM0PR04CA0138.eurprd04.prod.outlook.com
 (2603:10a6:208:55::43) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS4PR04MB9268:EE_
X-MS-Office365-Filtering-Correlation-Id: 13065917-d7bd-43e5-c200-08dd1a693562
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SkN9XaJKedvE61PFjMidkcaevkHKOmV0FOfWld/uwtMfonf1fpiD/8Dsv+j6?=
 =?us-ascii?Q?HMyHzPstyS5sd79dDH4CC/hsHo48i7nt+DAVzwbilKlUiqdIfl2ifCbv2Uj2?=
 =?us-ascii?Q?hbPDL2UrJmUBENZPqmj+C58xW3SZrrU2RU/5q9ieEyR6m48oFSco86fTatZc?=
 =?us-ascii?Q?iDnE/qrkiMF9fSd1eJXBWX60kePpMnyhv3qAdo91NvD76gF3YMEnDTX5qOFh?=
 =?us-ascii?Q?Kfe13rWL6joi5J2mpiVeA0ARSpaancdt9Kab55XtP2X9KJ3ecD21NcNEl+ke?=
 =?us-ascii?Q?jJpFqurAZqZJ5kP7gEkronaLDv5CaT4BX3zVz6fzV/Tce/KnAU9Ls984G1fn?=
 =?us-ascii?Q?AprVYdvwRHpRYrHsxRD3K7pecww2kzPlRJ/N6rTSaBiQfe6xXl96s4ZUo9aF?=
 =?us-ascii?Q?FE2+IG0hsam6MC3gCKb/KpqzF09e0aYt/gmynWwgASokxaxjtkdLktvBngrV?=
 =?us-ascii?Q?7asUc/o/DWltShxS1Vb7zio0P7088KjR2mLEcnTxt/llfwrOJBb7f96IdD7c?=
 =?us-ascii?Q?GSBQk0eHtLWSYH6mJw5ofiLXH4qJfcG90rRhIs4qlGQwIICjaUgJkTwRIIiy?=
 =?us-ascii?Q?EiZMhGDFHO/iydXWbM4nN7Ynp6ASfH131tKRp6dBKD0FFqOWqzC83G6ehjNj?=
 =?us-ascii?Q?gtDmG4/W3HT+UIzJgZagHl1OjGPyEL6qqg4PWlQNLOL81gTf9oL/0fjsFsxo?=
 =?us-ascii?Q?lhsgbpkpGVTvqPwJ5Jx++tyz6NZonPVsMsIG9sHrNWLD7LobuwXejmpqjO4d?=
 =?us-ascii?Q?O4ezWu8Of6GvSjGMzMOgQBr0MTX8v1GJrDCxPAM4YX8YQYnoYrOB+uDMS21a?=
 =?us-ascii?Q?6r5zNZ8ZEZk9+Xo6QeFexJy9uDtIaU9SNFl4OPFm5NmzSCvSIE1W3DrmnruJ?=
 =?us-ascii?Q?WGDS0mN6D5k52KV2Pk4N8uXpYXzV3nigNbtrMV2wFrJ1E7zVX9FJoZqcPtKl?=
 =?us-ascii?Q?FMVRBmeCw14wBS4KVyhKpZDeOhiCHQ1uqrapCot4AzJ/B6U+Lza2rw11QHsi?=
 =?us-ascii?Q?gt5QWGhNptV8Mu+Dh005pqKbHhEiOY3jyAM0qnBy0lYl2ho5csljpc+pgRw0?=
 =?us-ascii?Q?alAHnktlF0FkZXTjQNFCkYfJ0OmLBI3XPzau985G38UuHQDjO2FTh23wnVAm?=
 =?us-ascii?Q?cjZxLBXZjr7FN1GNGyuxQ82s6I6KQ9CQCbuFsUEFbkWie0+qhHChwBWeB1j9?=
 =?us-ascii?Q?l+tAuxaoForstkHLu3HJ2QnT70ymXFDgh+EzB0gP5i2+7OsARAMXBs3oXVcs?=
 =?us-ascii?Q?3YeY1P4hx7RoiU7/bIFg4wofQfft3oki4GkpEtXvJf3HS5fVOUv3buemuNTN?=
 =?us-ascii?Q?rkEp18pfT3hsC3oJgvEAbZEe/k5bP2wry4ZWVao4/sdaFzHraj7ss4SIqr47?=
 =?us-ascii?Q?2oYP6nPrYkHwvHjaLmq+bPZED9zrdc1O5UXMa9iAN3j2h4RlTA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y3KSWKOz5MupVuhZ2GklwwPyk1chH6US3ndIVzm3isrZUb39VNJSdaU+CDFL?=
 =?us-ascii?Q?B3ql5HvFI6kLcxER+4AavAUjT0Gc1QHZux3EJT4C6d4VAhnfgtX61a3Wwv2n?=
 =?us-ascii?Q?1AUMtOR4oKNEi1brDMkudHxvdQRtcnetFxWKLxPccvelSA6Ox9gsPtsPP2J6?=
 =?us-ascii?Q?2CzuhgDx0TekmStml5r2UbdE+7HywnRWW1u5bKRb8mRQ0DOfMRIV4YcoQZtU?=
 =?us-ascii?Q?+hKvNF3NtkFYZNYThGEm1q7MNuSU9subhqkurKxDXx3uK2dDj+xgOp8HYCxB?=
 =?us-ascii?Q?dzOYu2DX4hoZ5+7zjy9gkSio4f3o9ySEJrlgRvGzFfkEgWZB9FtEvqmi5YAb?=
 =?us-ascii?Q?EUkSFF9ZhYe8YDcVK8BLE/nxJbTypxi45uU3XdaMjAmarvFOfd6Yy1KNt/1S?=
 =?us-ascii?Q?yxEG31d7621qUYlk9MhFs0YFnwZL23FyNkn0D61uNc5HtphSL7fVbj4KhVhm?=
 =?us-ascii?Q?qsh3Wgn9twNwGsWby7U4i8H8xfzVZuNxjhAHPYmPOjgWvjaZUehWsrIEoxzv?=
 =?us-ascii?Q?Se8hKKlfyA3wDiS74CBJpdLZXUwsmPkMw6vGOMMETF4kdlbjWZywJ4bmKbFM?=
 =?us-ascii?Q?LursUH43m+jpxVnOUqhq6RTDcz0CSwpN7O7ty0h0iXHswh4VeevD6tW3Fcm6?=
 =?us-ascii?Q?uRj7AjraSmwomf20KISDkwRDZqHu9lK0hum3ouQvaP3UbqSNNvEGNAC3ml9Z?=
 =?us-ascii?Q?EsoyfAp2gPr9l+psHnengof+V99b6nnACO83Tw1sgPc6Lwc6nQRJE9nvVMUr?=
 =?us-ascii?Q?N2WZgC8RYy5hepF3D4KJNynO/ZK1muLJcOGS4XJWq8KzDuFeZhlm8P2Prrka?=
 =?us-ascii?Q?XePFWpDsZH5mnZZjY391nWoyAvUeiWY0RQZag7hgBfOlNT6XAy2aOYjDDdjU?=
 =?us-ascii?Q?+tjgmAuzQJPrantSBZX1VkfBU0mPl6OIP4c9CCr4ZbvKDncyCo5M3dABgf57?=
 =?us-ascii?Q?MoHyTc83TVDkEuSL9nPlGBn9vRye3fIvqRQUtxb0xoAEVTUEloR8dTsokQZd?=
 =?us-ascii?Q?Knf1FcEv4brtWn2fk7NDKqqlS24ute8CqmmdIE3Gwo2O40LVHeYtZ8SYwLNE?=
 =?us-ascii?Q?maX0LnICof5v/HSqukDo0t6ZaZyKpHn533SiK0Z1PnngOvc6UQA1K1KfqZHz?=
 =?us-ascii?Q?giUcNsyA+EsqlenKeE06DHoKclTGkPttM0fNDpPpNzqFQdecJIpwPahRS+M8?=
 =?us-ascii?Q?3K+IbLrQHkbJ3LezpObenyeYsL4DBttokIANpd7YYbTEc9wqeUEygPbiSZvY?=
 =?us-ascii?Q?VxB+h8IlHu8nbapb6jew+lvFblqrITSaoRdNtII7kbdU/+Q6sH2FS0Z2TynY?=
 =?us-ascii?Q?egN0wjlmI531HIBEfCmn4tCf35XDiLHAbPKnP7FqXqULVn05Qbd7N3sr7J5W?=
 =?us-ascii?Q?5GlrY39BFxouVRegWuY2PO5FhxzXfCWZqK4+K8E06CaNBT7ufhsI1j8RLn5T?=
 =?us-ascii?Q?DWmGuRl9rFLuxzX8KHYxdPsrr9Qn9fhLOOClTli5ufFU2nU12ZmDeXSv0tBE?=
 =?us-ascii?Q?HMUGcBhsZA6ceXOhKdP+ZF703AxBcllSv3G7zqvTGN8Qx0RYGGT39e+giD9w?=
 =?us-ascii?Q?VxQizfrjLjLFUb4zG5DvK+ZVCuPi39Y3J6GHnCQm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13065917-d7bd-43e5-c200-08dd1a693562
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 04:55:33.0908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TG/cGywzpS9yEkIYAEND7KOJej40ct44adHdISzttLeyTQ9NDVXKRQkVG9YjCCUVbUg1kzdwGbOTOHTAXOiZ1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9268

On Wed, Dec 11, 2024 at 09:56:38PM +0000, Will Deacon wrote:
> On Wed, Dec 11, 2024 at 01:35:16PM +0800, Xu Yang wrote:
> > On Tue, Dec 10, 2024 at 01:37:32PM +0000, Will Deacon wrote:
> > > On Tue, Dec 10, 2024 at 10:02:12AM +0800, Xu Yang wrote:
> > > > On Mon, Dec 09, 2024 at 03:44:20PM +0000, Will Deacon wrote:
> > > > > On Mon, Nov 25, 2024 at 06:43:38PM +0800, Xu Yang wrote:
> > > > > > The imx93 is the first supported DDR PMU that supports read transaction,
> > > > > > write transaction and read beats events which corresponding respecitively
> > > > > > to counter 2, 3 and 4.
> > > > > > 
> > > > > > However, transaction-based AXI match has low accuracy when get total bits
> > > > > > compared to beats-based. And imx93 doesn't assign AXI_ID to each master.
> > > > > > So axi filter is not used widely on imx93. This could be regards as AXI
> > > > > > filter version 1.
> > > > > > 
> > > > > > To improve the AXI filter capability, imx95 supports 1 read beats and 3
> > > > > > write beats event which corresponding respecitively to counter 2-5. imx95
> > > > > > also detailed AXI_ID allocation so that most of the master could be count
> > > > > > individually. This could be regards as AXI filter version 2.
> > > > > > 
> > > > > > This will introduce AXI filter version to refactor the driver and support
> > > > > > better extension, such as coming imx943.
> > > > > > 
> > > > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > > > > 
> > > > > > ---
> > > > > > Changes in v2:
> > > > > >  - modify subject
> > > > > >  - add comments for AXI_FILTER version
> > > > > >  - type -> filter_ver
> > > > > > ---
> > > > > >  drivers/perf/fsl_imx9_ddr_perf.c | 33 ++++++++++++++++++++++++--------
> > > > > >  1 file changed, 25 insertions(+), 8 deletions(-)
> > > 
> > > [...]
> > > 
> > > > > > @@ -624,11 +641,11 @@ static int ddr_perf_event_add(struct perf_event *event, int flags)
> > > > > >  	hwc->idx = counter;
> > > > > >  	hwc->state |= PERF_HES_STOPPED;
> > > > > >  
> > > > > > -	if (is_imx93(pmu))
> > > > > > +	if (axi_filter_v1(pmu))
> > > > > >  		/* read trans, write trans, read beat */
> > > > > >  		imx93_ddr_perf_monitor_config(pmu, event_id, counter, cfg1, cfg2);
> > > > > 
> > > > > Hmm, doesn't this change mean we now enable this for imx91 as well? My
> > > > > reading of the commit message is that imx93 was the first chip which
> > > > > supports this.
> > > > 
> > > > Yes, it's enabled for imx91 too. In fact, imx91 is compatible with imx93.
> > > > They use same configuration for axi filter.
> > > 
> > > Ok, but my worry is that the above code looks like userspace now _must_
> > > provide valid values for the config1 (axi_id) and config2 (axi_mask)
> > > fields on imx91, whereas before I think they were ignored by the driver.
> > > 
> > > In fact, without this change, how were the PMCFGn registers configured
> > > on imx91? It looks to me like they were left uninitialised...
> > 
> > Before this change, PMCFGn registers are indeed not configured on imx91.
> > However, they should be configured as imx93. I notice this thing when
> > make this patch. First thing I tried is to add is_imx91(), then check it
> > and is_imx93() by "||" operator. However, this way seems not scalable as
> > more imx9x Soc comes out. Basically, AXI filter version will keep at V2
> > unless big changes due to new features. However, perf tool need export
> > correct MetricName via identifier in sysfs. So I made this patch, then
> > PMCFGn will be configured based on axi filter version rather than pmu
> > name.
> 
> Gotcha. But that means this is a fix, right? The commit message doesn't
> really indicate that and we probably want a Fixes: tag to indicate how
> far it should be backported.
> 
> Please can you send a v3 with that so I can apply it?

Sure.

Thanks,
Xu Yang
