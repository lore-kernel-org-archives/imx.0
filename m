Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2058.outbound.protection.outlook.com [40.107.22.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A8D4A0A
	for <imx@lists.linux.dev>; Wed, 11 Dec 2024 05:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733895488; cv=fail; b=Mf2TvbzatHqKwBUGyq0lbFbMV3d6pmr7tgPsg68Yn0JDBDi0Ha+iR6keOuT9y2+inHJJ4Jqs/Nsioz7uDSdg15wkIAw1DezQ09mN0lY5i4khqZA6lrgxTmQOcFIPooWi96g72SHxAK/UqyS1zZFilb1jlUZ4gCvfU7Mq1Qfu9Ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733895488; c=relaxed/simple;
	bh=KFef8Be/7qWvhFqYRYmkgzMVByR8yqdzduyJ3wr8OVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mMkKurwV0m7KmkYeSTVhpXvxVGKj0BOuGzqhEbx2E0hS6BpzLa60SOHoAqanvdvAzbGN6QIHfL/gf8W493tzyq3WF6gSftU5hS0+ENyZ7qjgRwzgqc2YFMPRNWbxim/7hTyda8Y5D9T5Sktn1JsMJ1L/TzICV0UTMyJ82VqtWaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hvt83H/+; arc=fail smtp.client-ip=40.107.22.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hvt83H/+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W9wlMZ44HmYhSdINMAa1qA4tCn04I6kdmsd70BmhvrckspYkohQcD4Ly/tEuHWKezS+yJUGSXHEtsrtPxiVI+y6/70+gdFy2GfTLiD6A39VQCPIThoD8sR9fV4P27K87J+wWenNEAkL4jipjySBYvu9pqPUyEtha62pwBwMJTKwaNAT18dd1+pScwpQmbuNQi1jG2o84X01Xwo0ri5ZqR3JMJB5y4iNKYyTYd4IYzPwOc97ItXsWTbbjPIfj70LhSs6+N3mVusfyF+kn7irLkolgStPLtNqIzPXOUlY28yJLF8cVCPEgHQU4lHe2i/bNPQVB997XfsLsIDqc6jru1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cpzp/90CPQpudCDxYLJrLS3ijqZAQaydAz5hFjliG2I=;
 b=dnGqcMraqiZ5IK4jX6NYh4sSfpMos07VAQCkEXqR3zP2gAs3z+i1BaT6+8joAHim273y+zjfezV7YIpwGKcgd/y4KWEh1HYqFeO12VzvxFh8lltchGULRN2uAwabcMnLNCpUp8oq7aveqjQGOibBD52qGRgM4pgs5FQjvwVkHz1rMH1A0HxhnfJZ20xK8uvIChxdIS8IV/oh4S8byZwO+MAks/Zbb+5ViV3pjFlZZMyWLsmsT30B3G6soRgVDz2fuk9xdAMvzPZ0CP/hO9O+QsKp3A/iTmKQSy0N6zDTIWLvtUVj/zXX0OFVmPw4HqxEQIpWpKqB/oIQnbSwghz+bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpzp/90CPQpudCDxYLJrLS3ijqZAQaydAz5hFjliG2I=;
 b=hvt83H/+Dyy00nkDEru5gSXqlsqFPphM9AkVoEZaJz/rU+faLLpLdmdh4JZoGCxyPiKaUruGS4OqZ6A2IeH2BxflmgYg2N54Xj6VYIbf7RC0v8ieOBYjVzLR9yrpnqSWe/jCCtweGFNmIJZKO0oDUV6YxwESGlfLoOkVpgs8BSClW+XZZnyuaoA3BjrCn9yvz9iuEk+PLoZpax7LAuvY7pWjyaA/OACM90ttOMqNxkkZQkpOlJ1uzJ+axZFGKGIwMMUumhJdDrxIeE8GeRCtZ2EgJjF4S7iBMiSUaG4JOnorSse/U0i+ZGwDTkBmnpF/DWlhKGl6jLEbZPFcS7PClw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV1PR04MB10944.eurprd04.prod.outlook.com (2603:10a6:150:210::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 05:38:00 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 05:38:00 +0000
Date: Wed, 11 Dec 2024 13:35:16 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Will Deacon <will@kernel.org>
Cc: Frank.li@nxp.com, mark.rutland@arm.com, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v2] perf: imx9_perf: Introduce AXI filter version to
 refactor the driver and better extension
Message-ID: <20241211053455.z5zzawfacpyv2dlt@hippo>
References: <20241125104338.2433339-1-xu.yang_2@nxp.com>
 <20241209154419.GB12428@willie-the-truck>
 <20241210020212.yz3xowvdk27zmgsl@hippo>
 <20241210133732.GA15607@willie-the-truck>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210133732.GA15607@willie-the-truck>
X-ClientProxiedBy: AM0PR04CA0040.eurprd04.prod.outlook.com
 (2603:10a6:208:1::17) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV1PR04MB10944:EE_
X-MS-Office365-Filtering-Correlation-Id: 92d0e675-1d97-4f73-5b10-08dd19a5f96b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T3KXeV2PiRBFkJKN4+0nheNfIL8sa+OKXTXVvHUoG6bis7PTAOhmxh+38B/J?=
 =?us-ascii?Q?NJcBXIcr5DLMPjFKRvVtaohHI4M8J/fqzeRvMyZQvjvqLgyMlt30j8rWe5Qa?=
 =?us-ascii?Q?t7TF0CAR7rn9XrF/uUBzOdNTeKqmLcHAZIPv7ZgUY4qsco4/Doy0GpPYofsp?=
 =?us-ascii?Q?470vhw00Mnggi45p0uhl/sUCyCLtvPmGpm70umlDYiDa4GQ+mqVqZzGK5iUf?=
 =?us-ascii?Q?N8N4IUsXVq1OOgKM3rXRlKq7xEsfH/D9CsfWEhY/plPD7a2fUWEcFAl2UVmp?=
 =?us-ascii?Q?LB8jgabuBpFwLtyMgzL5w2JNeMZeMkYpamv8JQDbpc1+Pm3zRXTQY0JxxqBr?=
 =?us-ascii?Q?yD/KbLf432s9AMA0nUXQUict1z+PbPNMdRxASru8caV0e6QLTE9B5zN7bFui?=
 =?us-ascii?Q?D7EuWrfknsY5l/G9olk2n6OI+zypkjpUOceVc/6ycnG8yIk6s91PqZ+debbA?=
 =?us-ascii?Q?gAZHvQM+Bz6OkKY2RsjDc3GUjyDOKhHmgJTcQqKXN3+QUYsdaczGoRDobz/f?=
 =?us-ascii?Q?ZeWdCmPg0wxo9aueLIT/8FqoA4cs4mV/QCyHY4WzF0rEDX4HkOg+lVGgR5TY?=
 =?us-ascii?Q?NJY5bXIWLGjCUttNlaZc1NZWNUIhhTHRdJO5hU8RhlA6vpc3oiMjWBt+gdMv?=
 =?us-ascii?Q?+P5662yl8EjxiQvaKjkvTkVEiE3ygodc/NzUXBlBRHSlAChiA3wSJzTiWlZf?=
 =?us-ascii?Q?DhDZqPgA49Nq2JB0w1pgWex2dNggnWlPVNNHnxGKogRMNjzte/I+GsmVw7Hu?=
 =?us-ascii?Q?+rGzg6MJSYGpi+hC8lLVNLlM0B4MaugO+MOXKipuW3JO4Xb5ukZcEDb96/wP?=
 =?us-ascii?Q?2qfhngflri47PjsdR0Ztn6Muvmnk57+ZYGBP8QyPOeD84Ds+6g/Ed+dLipyu?=
 =?us-ascii?Q?j/wUO85pU+pVT/uoswd2tuaGKQEkjNLmV/gWnwig0ONk1gFC0r7mCjW3DMoS?=
 =?us-ascii?Q?z4PpqASUFB+T1SqPXRIRcktkC5STWZh0diV+padfkzRBgeFs5y6kt5Q6Ja/N?=
 =?us-ascii?Q?gZk2UByhCXV1cTtggMnMihgwj+iD2Eug9DWmf1mSZgw5xAd9APVi8zCcEbqc?=
 =?us-ascii?Q?m8cb9mn4PMbXbw0E7GWP7vxfhNpa9ksBjlPbEIVVHRILt26EUAYqkJMhsHOH?=
 =?us-ascii?Q?qsJsYpmkFDWXLmQjLs7T9bRqf2z8iqinP7DMipswqb6mLJdkxA3Y6eH5MGsU?=
 =?us-ascii?Q?jSw6zsL+qI7G/LxOWN7dHPRYq6o43UzguX27tFdP4VgY10BMA6OsSiZVfH4I?=
 =?us-ascii?Q?s1Hz+q/r2iQk5GPxqotvgPDCmPvXUJOQrU+qWrfWgxVQPa4HimEYRPTMJJhz?=
 =?us-ascii?Q?n9fGbuADDL3FzpPUUaG+GvogPRyFL9L9TqpqxS5R67ID4q8rpBpkYYrysQxP?=
 =?us-ascii?Q?q46Pv3bVd2Erf0YrcTI62yt2ybm2xpDMLNXe7Z3YRnUKOhInuA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d32U6W9YwLIIICKxNm2tKO/hu8JXM0lQhJCLmVPC/yDms+cU95UtvLday6xh?=
 =?us-ascii?Q?aCuWIeNI+TBzKaberBxbA4Rid2ywhNDulFfT05+u/Io70FI+5aTbFcxGFV/p?=
 =?us-ascii?Q?Lt1Mn1KfR91kFU7qzXtDWuM8JUy/oaZ8HMX78tDBjMPTArpjei83pC5mOnlg?=
 =?us-ascii?Q?Baw0P0AeW9YYFnmgFseon6rQXOOCINnXaJjMFvJsdsRrixCJ4oVSQ3XA8OUr?=
 =?us-ascii?Q?zaPD4OwYEHXIiNFHPuCVF4qPMdFE7CHdmpEXLjCQzpbJrM+Xtq6AdEKok75K?=
 =?us-ascii?Q?p/cCEWRHNUnxqIaGZbC1AxBN/FCprDaRRu1aF3zXrva8IRqnHabgb2GpTrqX?=
 =?us-ascii?Q?V5LC8XhoSzkMU3TAPYm/jgLHeDeEUIdGsv9JX5HcvGXVEsduMCP1DQcefbwA?=
 =?us-ascii?Q?F/N2vjGBFK8CkcjSYBtmJM7BbUyIytO4oBA9TemL7LtozvlSWAT7S+82hJlo?=
 =?us-ascii?Q?4O73Rssx7OkYA3nuPTuYXLQL151SRx31T5siOQa/AOcOPXVCdAmMxulijnf7?=
 =?us-ascii?Q?Wox4uxagU5E3pAmInH8PTX8YxMyCeNOlTFO5c7WnACJR6Sj3r9RD/VQbSgsF?=
 =?us-ascii?Q?Wxf2DtA2P+OyXGcWrmlf8v6tXtzRXQ0V8st0urFAzZgg3qv0ckf5L6u/7e6w?=
 =?us-ascii?Q?XolLGUsZIgLy0GX8EgUVhKP+kQ0mLsWBsCrgcYU6DH/gnEjzCWaJAQ1JOhIM?=
 =?us-ascii?Q?hA/WEtnHwz4LQok2HkckqPrMr5An6/69gGOPRRW1lC26QD471IYsdZW+DW44?=
 =?us-ascii?Q?gLu5/iLP7bWBWYXUxJalg4pcx3MH6eMs9jpU4P6eiZpF5aQ8tY0YN5GGN3b+?=
 =?us-ascii?Q?grmarBVE5B7xYOMFzteocPqLhhhexoDSLaEJlIh+vQWC/SFml4mLIPEgoWpm?=
 =?us-ascii?Q?S0D7IyfN4w+XvZxgpIuIRrrUDpTcPzkgEZnLC+a2kp2YuwfMkA5hyavxIWDd?=
 =?us-ascii?Q?W/xZHan3gPpCLaGTpqyH9hcneyb5kBzFPEw4Ja5JHG17P8qou7s3DOTmPQh7?=
 =?us-ascii?Q?3NLcQTuYMRZfZgJ7QVlyIoQ4AYCwIREaPv/g10o3Z4BlfjJWGWvLS3WOW4Tn?=
 =?us-ascii?Q?FGHx5vRbGHMRKfsbSxicbaoyyCTUpsvcY28plNmXA6OixUCIvhic3rZcERXr?=
 =?us-ascii?Q?x2Y9QdkiMZM8fctD9AFxNCB/QgGuT3Cvq07vB5wSr4MQh2eVrILy4z2DBn/N?=
 =?us-ascii?Q?Pkg9LWM5VbWuOHw8khYfEuaEafPq8TF7K3OdAnttDYlYJKppdi5eqhmp7Ngw?=
 =?us-ascii?Q?q26H25iDnypmftocEDLjvtsxE9CzkeFygpGyEa+J68vFjhmp9I62tAxhHBRR?=
 =?us-ascii?Q?NpB7HJvPI/OgsbtLsSQNjB5jrnvuKNu5nN+Wrvz/FeBVCcJV9Qiv9jw7jZM3?=
 =?us-ascii?Q?MEOoiWGjspY9nqYirAnpDQv1HG7nA5dzBJK+XFdcDWFwKa0qUfaAGqMo0Jga?=
 =?us-ascii?Q?jcGpZG45dmjr5WBu/qs37/0yJQIInzkAW7oQ+MW45ZxKh0MxXO3inpKVH80Q?=
 =?us-ascii?Q?EpxFtqLo7H9Zuvj0ng2X+qb0baQixPXfWJgOikdYK0seLZr8mQgC9CArQhdx?=
 =?us-ascii?Q?4nT7uJasDK8LNKvrSAyU8kc8DdobiiU2Z9iQfa3l?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d0e675-1d97-4f73-5b10-08dd19a5f96b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 05:38:00.4411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WZexYYfbhXtaiRcE0IR2xhywQSFo8eqiSRCrr9H68iYWpcPhyMIzs73YKuQ5q4rZbinvFF8u9VXHN/2OL/N7CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10944

On Tue, Dec 10, 2024 at 01:37:32PM +0000, Will Deacon wrote:
> On Tue, Dec 10, 2024 at 10:02:12AM +0800, Xu Yang wrote:
> > On Mon, Dec 09, 2024 at 03:44:20PM +0000, Will Deacon wrote:
> > > On Mon, Nov 25, 2024 at 06:43:38PM +0800, Xu Yang wrote:
> > > > The imx93 is the first supported DDR PMU that supports read transaction,
> > > > write transaction and read beats events which corresponding respecitively
> > > > to counter 2, 3 and 4.
> > > > 
> > > > However, transaction-based AXI match has low accuracy when get total bits
> > > > compared to beats-based. And imx93 doesn't assign AXI_ID to each master.
> > > > So axi filter is not used widely on imx93. This could be regards as AXI
> > > > filter version 1.
> > > > 
> > > > To improve the AXI filter capability, imx95 supports 1 read beats and 3
> > > > write beats event which corresponding respecitively to counter 2-5. imx95
> > > > also detailed AXI_ID allocation so that most of the master could be count
> > > > individually. This could be regards as AXI filter version 2.
> > > > 
> > > > This will introduce AXI filter version to refactor the driver and support
> > > > better extension, such as coming imx943.
> > > > 
> > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > > 
> > > > ---
> > > > Changes in v2:
> > > >  - modify subject
> > > >  - add comments for AXI_FILTER version
> > > >  - type -> filter_ver
> > > > ---
> > > >  drivers/perf/fsl_imx9_ddr_perf.c | 33 ++++++++++++++++++++++++--------
> > > >  1 file changed, 25 insertions(+), 8 deletions(-)
> 
> [...]
> 
> > > > @@ -624,11 +641,11 @@ static int ddr_perf_event_add(struct perf_event *event, int flags)
> > > >  	hwc->idx = counter;
> > > >  	hwc->state |= PERF_HES_STOPPED;
> > > >  
> > > > -	if (is_imx93(pmu))
> > > > +	if (axi_filter_v1(pmu))
> > > >  		/* read trans, write trans, read beat */
> > > >  		imx93_ddr_perf_monitor_config(pmu, event_id, counter, cfg1, cfg2);
> > > 
> > > Hmm, doesn't this change mean we now enable this for imx91 as well? My
> > > reading of the commit message is that imx93 was the first chip which
> > > supports this.
> > 
> > Yes, it's enabled for imx91 too. In fact, imx91 is compatible with imx93.
> > They use same configuration for axi filter.
> 
> Ok, but my worry is that the above code looks like userspace now _must_
> provide valid values for the config1 (axi_id) and config2 (axi_mask)
> fields on imx91, whereas before I think they were ignored by the driver.
> 
> In fact, without this change, how were the PMCFGn registers configured
> on imx91? It looks to me like they were left uninitialised...

Before this change, PMCFGn registers are indeed not configured on imx91.
However, they should be configured as imx93. I notice this thing when
make this patch. First thing I tried is to add is_imx91(), then check it
and is_imx93() by "||" operator. However, this way seems not scalable as
more imx9x Soc comes out. Basically, AXI filter version will keep at V2
unless big changes due to new features. However, perf tool need export
correct MetricName via identifier in sysfs. So I made this patch, then
PMCFGn will be configured based on axi filter version rather than pmu
name.

Thanks,
Xu Yang

> 
> Will
