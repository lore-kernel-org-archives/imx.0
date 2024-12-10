Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2050.outbound.protection.outlook.com [40.107.22.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF7D12DD8A
	for <imx@lists.linux.dev>; Tue, 10 Dec 2024 02:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733796303; cv=fail; b=FzQ/KEPPZpBNIKEcg2fSJClTn2W6xjae//YUJkPyANd9P4ax5IcT82guBzqHewl2mKOhwB4UU1BVIrQhabyLSbbPT2irN4jq/++sWEALC9DKxqOlOugdb7H5ImwnAGBGBukTp9XtSd90BKOAX7MGevz4FBLsmnb43e/6lST7+1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733796303; c=relaxed/simple;
	bh=d/Gu20saPU2uMVg7mb9S2GE6CWtc8lgOafeDivJ2+Pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GZdJTOdVZ8EQyo9HfZ0lfV6imd+E5R5RCFNDs7J09D0a3tjDyBNdxs1x++rWLle4HqFXg7E8hVXkmjxQeG2CpM3P3u4He/MV/+d4HN5P+ARykEZ/KPvbLOvCv1L6YeBiaT8CmDo0PMkHunLGV9StF2/ZuDkr3THDDm39Fq8moDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EylTy+wS; arc=fail smtp.client-ip=40.107.22.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EylTy+wS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GrKS8PIihMVjEPVnwWSYNjM2gKZBme6U/fLaMWmS5heYScCuAyGQp+qrx3+/2tdwy7wIkHmJzOXzsK+mHXf+uxV8viR+onXQyl3PYx4o7riaFNMHV6yZwsMtBSRLanACEhNKN/r5Nb2xy5Hvg9/rMghS/I1Z4c8C+IROYiNGjD4QydvBAGHZK0fGQKoc5ODoWVMqVM+nOtjTtUldKFv2uqrPnkpDGwcnqkJ91FDYYwcJ2RDZVkPI6ASeHIg0W65nJeOh5oFfwplQOeU3xZfF8Pz38OcCZdaUyB/dWtqEoDd24gt87Rwo7zJEFKGmz/Cm+J5/xrSC2fyrZM1CJrdlpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PV1Vr5bBM/n/71SCjq2IUuw8ZCOKkRzDHLGuERsdAuI=;
 b=mRtfLK1QQlO8HCCJIZntYn2DBo+muGPJGu/uqmWsMjR74/uiTeiO2vg1n2Db73Lx6UetZtxPJwTkGDkB9dy8HN4ScdpI3gGKNsIC8OcfG78N/2fzT6GMjJxKkZOTTuJSISfy1JQzFSBckJsHg0v00S3x8prEtD/CYW1oMjvX7slKC3K4A0VvkAgrdvHTyVTq93xtshBeK3fiscNMxoVIhvfztQ/votw0Ohz4dD8LCVFzJFAGTDyJiKmvj3gDlSBkddIprQnpcNf4Llrd+A5/zxZ3r1NYCjw9dlwl3fiT/Grqi359LBQC7PQVZnQDJEklxPbG25Vny9WGkTLWF9xqgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PV1Vr5bBM/n/71SCjq2IUuw8ZCOKkRzDHLGuERsdAuI=;
 b=EylTy+wSx3FuwRrjW3vTJKu+r7WCclaQGgOtKu3UX2DFsDE4AqkRKyCs88arhuT2wZs/q/eRLgpQ+/wLbkfeeVPbt6zBMi3a6Hqxd0G2OxFd8zq1Fj/7Fk22/Fq8kSHaxgMTfQj2YR9ZgCno2MdSQxbo1zWUdYTGtVHvT6P0eLjGEkTFF0IsGCwrVTVKYRLS6bmVqymLuq3DTZQYpAyl5TaP+cy8CxXxR+T8kG4cgQENAxAR/7T+qDXXwJDHQFOAg3F0IdhY63pyP3k/IBenW7iiFHaq/3LYpmGENlK5M2vlPe6PHlUc/kSqjkylFW3l6XbJFcr7Ywy7H+QhOT7c3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM9PR04MB8211.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 02:04:57 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 02:04:56 +0000
Date: Tue, 10 Dec 2024 10:02:12 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Will Deacon <will@kernel.org>
Cc: Frank.li@nxp.com, mark.rutland@arm.com, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v2] perf: imx9_perf: Introduce AXI filter version to
 refactor the driver and better extension
Message-ID: <20241210020212.yz3xowvdk27zmgsl@hippo>
References: <20241125104338.2433339-1-xu.yang_2@nxp.com>
 <20241209154419.GB12428@willie-the-truck>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209154419.GB12428@willie-the-truck>
X-ClientProxiedBy: AM0PR02CA0118.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM9PR04MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: 18b06db5-5baf-4e2a-a383-08dd18bf0b2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2LBxXCrL6qAjGuJ3f9cNuf+vOsXmrYC+Ov3qySF9DEe8YGaMLyxvsKmOP87E?=
 =?us-ascii?Q?6QIUHEbvm/EpevAurK8lQ4OcGVMfzV9nqfBg8gjnAAlEtj9oLLf9Wl0yMd/1?=
 =?us-ascii?Q?T8i/PZnCXMxJ0JbHfiulO+FQaX/HOwwM6X03fCNvHuPPK0U55JprIYe1jHcP?=
 =?us-ascii?Q?PU1nx0mIJJLJQ6YIEaUOLNCHawcPXsh4oPaWdbAoG+zLlAAd5IUgPfmzlmn3?=
 =?us-ascii?Q?VAbW4fFVfkIXYgzKVPbT0TCZypGD57a95qMVq0NRGZIkBbIfwg2eDdxwTE+/?=
 =?us-ascii?Q?RZ0KssKzGiy39wlv7kDtrPiWScdS+i6vEYNx8eUEYvXqXjpUKjmyMbCD+p9D?=
 =?us-ascii?Q?DpprjrH3kr2jor6iXspnUdYbxDr2uECntPI3U/0Np9+qNjtVu4lqyxpxWKhA?=
 =?us-ascii?Q?UOPk2eDZGOVLLRptaT78130OTs7NhaFo981zyICMabmDeIEIzsEFluP5WxOC?=
 =?us-ascii?Q?y7JR8tTnqNzxZhOy4dzEo6BWnnTaBhN2LSg5ocWS9mthJUop4HXtGBmmw3I4?=
 =?us-ascii?Q?dRR83NibULDMEQRAaU4gaSr7MbFh/6Z5COFoRypg6UUQ2qs/JHENnVMAqog5?=
 =?us-ascii?Q?n5SUPRcrwn3K/I3ho+FfRUq0YlxRilErfMetJOYngQbcftAGxA+Nxa0b3sSH?=
 =?us-ascii?Q?ut/HgAjjAdBDj+lJv+UQsGUJPQTmSIzVLj9iuZDl3NOZ7QuExyms9oHscnkZ?=
 =?us-ascii?Q?L1qCaOiD7FfXOg1XR3CtIkBDSbfRH5C3VknRPTxt/5k6xLMgrc/Kaowv8Eau?=
 =?us-ascii?Q?2ms/dT2Dny7qJGPl5DH7BNBuM5W3rhTjiB0Gf+dpNRntD+FilGB1d6KNQppR?=
 =?us-ascii?Q?SzSzoyR+POrOZ2Val69tMiBcmUt2vzK0XA2Ij3vyPeqfKgBB8kHJTgODlcfy?=
 =?us-ascii?Q?cU9VjM4M/f5P29zxNyndr9Kn6lW+Dq4ty7AlfhhyW3PefBa9Nvd3esMg7k3A?=
 =?us-ascii?Q?mxeJTp6QXu5eXSiu0zq91kNCjpI0fly14RhVTZXGLSLHfxZyD8z6bq0MXU0x?=
 =?us-ascii?Q?txjPWiTHuGQXYDclJvEL9kbJeTSVkjGkM5lI2W+w/xZFA4WZbF8XDRihsYw9?=
 =?us-ascii?Q?kn+oQfZnObE3Uz+vnxB0dvZCXa3bPgjNd2TYdrHxZu6sRcQdnJo0Qu8yOrDo?=
 =?us-ascii?Q?Opbtl7XMPCdYbKsVgSXSgyvCCU/Djzg33c1DvWRAD6orOU+WZ4EqoVyqokBV?=
 =?us-ascii?Q?wBkk5CT7Ib6b2uTnUcSWfzGVW6ebTTk6xjhqzBGh/X3sNZhpO2qK/5dy1YH/?=
 =?us-ascii?Q?pgyxkccEaZ4Kqaezl09GKvU7M1wr6OYMwpfReIHznII8M68A030sSUpPHxQb?=
 =?us-ascii?Q?slueUdgadfwBBspuQbfgoFsOXPQDDDBX0h1gQ6bSJDluY3rBdxlfysWJQYg3?=
 =?us-ascii?Q?Y0ddAb2WCMYFUE+pLTFRwsNQu6kY0MLI5yJEy6GvcbCoR9fpVw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zQktA6ORLSIRGS/hLF1hezFWC1WQf+39wbR0VwVNFC+08oOIFe/ONfek8MP6?=
 =?us-ascii?Q?C1ruFWio0fUvRCOZ/dv5mf7jWDbtHs/YVGgK/AhR2B+mgKN445P85x54r1qw?=
 =?us-ascii?Q?0oaPe/ba2Q/7gptwwwe7TDoxwYuermzgOgOQfiTAXjUgoUBUXBJB79uHnIz5?=
 =?us-ascii?Q?4Vs7l/EgixbCY7WYjcmWd7u57egoxZSXv9tLmjbP2oFQMcWdBPSsEqsV+viD?=
 =?us-ascii?Q?u8mJw9PklzioPP0wnwI/bD/kiLQOxeBj3webnRqnNEqikaZILyL101lLQKqR?=
 =?us-ascii?Q?A3WcG/iVBhvPOGp4BNHIm32LTTZNtJ6xpe1RYBmdnGc5DxKOWdxhrB1pGxua?=
 =?us-ascii?Q?arnKZ5L6RAssp+P8JHZfnkuicu0SdrgJ7UJe+Luur5MwjDcvWF8DRG73Q1K/?=
 =?us-ascii?Q?C37Pz+Mw9TvbqOLibqQCmdYslTyaYi5L+WCky4LobL/f1B9rPvEJVGx5aRap?=
 =?us-ascii?Q?XD6n0BO/5DSSWZjrU3LouODWYCkts9o+o2F0BtNM4WsJjcCJ4YR7VLSmeutD?=
 =?us-ascii?Q?E3la2zu9Nj1bicob8neQ/QVScNPZry1DbHf4IIvR+T5nfco/Kye6I20HaaTP?=
 =?us-ascii?Q?hJcANN+PBnqYqCgnEf0HYA7szsJBBqVndbZ1Bbavcgn5rjPGsV2GACwQetb5?=
 =?us-ascii?Q?srvvlZzCwFBFe4MB4c74/w9dlwrz7vv1jd9bI6Jzq810z8qKVkxHRuqozdzY?=
 =?us-ascii?Q?Ux8nJF7AoJgFm9/DTYlADpESD0FeoHCMV8PbL2uihpiqtqtUxF3aDAtl9Ou+?=
 =?us-ascii?Q?lTvZAkgiUlQonEqkposYJ2OZKdyeVUxJJuZsMl5ZeK/cDFdPGz//tXmAyYWz?=
 =?us-ascii?Q?NB2UnXoD+DltHOEI7fiJVV5hbB4JD1LqdWB5QtZwMwFwtlLF4KamHpTBftzi?=
 =?us-ascii?Q?XkE02n2dkr38F6KuKCRvbmdMrWQyG8BG9DPCaoZ36xwHoWrI7MUZviry0B6G?=
 =?us-ascii?Q?ijBEFnypwFasqtwZ7oFP6PRgM66F1GNfJ19TWdfQCpXSDcVwpcGvi8hTMpvL?=
 =?us-ascii?Q?jzUehHYa8kendnkhZ2spRKuUA+Te0T1xdhVeYLcZJ/vmFS1E1y/Pc3O0mb/z?=
 =?us-ascii?Q?exk8toosNRjHldHPAAzsiplpizpQpN5pvCxclB8CDoYGDQ5u2pYjvi0BvLDG?=
 =?us-ascii?Q?xteJpeczbMQvYIQpJ7ew3iVsE5XGT1/8jzaEmCgs0U3HOv++Fk/nyc7RxK2p?=
 =?us-ascii?Q?TDOsl7K+HEN+lqTtQPc6MHef9z+Rq39n1PI8bEzh1Yr9BT45y1j+BSNZopS/?=
 =?us-ascii?Q?iMnyXi8QjQn/U1Y1Amoy+Ns4dXBasf9yJDiQxp5FyjMyqcLzZjgCxJsYqqWE?=
 =?us-ascii?Q?qHL7SZPGi9CoMbfyPGKLJoB+DbSMyNNtmjifELc9593aPepKQGPegRD6HM6q?=
 =?us-ascii?Q?y8A8b0qSwH5kkRzYWlDQcePCZNwu/2ursrybIGhZV9AufgOatXttsFH2T4Vd?=
 =?us-ascii?Q?H8Kr9rvawwE6dkNgGOvG7mftXgVc0t1n6dz5D6z1EO72m0pZxH3MOGE3qT8v?=
 =?us-ascii?Q?47SECHXGcclbtpg5yR8hH823MlNDbPg55t7CYXyRvUJUmzhYUE03VzAHYopx?=
 =?us-ascii?Q?BbM+Lr8pLAK+4fX1w6fLBAtA5RFiMyDWCYU2329M?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b06db5-5baf-4e2a-a383-08dd18bf0b2d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 02:04:56.3835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RSeiNcvJvPm8RAj308g6fM6dMxqCjE4O369kfxrg13WUylff2zWBjc/J7cvs1Lf671iv2gLaPGDu9/2tpCvt+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8211

Hi Will,

On Mon, Dec 09, 2024 at 03:44:20PM +0000, Will Deacon wrote:
> On Mon, Nov 25, 2024 at 06:43:38PM +0800, Xu Yang wrote:
> > The imx93 is the first supported DDR PMU that supports read transaction,
> > write transaction and read beats events which corresponding respecitively
> > to counter 2, 3 and 4.
> > 
> > However, transaction-based AXI match has low accuracy when get total bits
> > compared to beats-based. And imx93 doesn't assign AXI_ID to each master.
> > So axi filter is not used widely on imx93. This could be regards as AXI
> > filter version 1.
> > 
> > To improve the AXI filter capability, imx95 supports 1 read beats and 3
> > write beats event which corresponding respecitively to counter 2-5. imx95
> > also detailed AXI_ID allocation so that most of the master could be count
> > individually. This could be regards as AXI filter version 2.
> > 
> > This will introduce AXI filter version to refactor the driver and support
> > better extension, such as coming imx943.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > 
> > ---
> > Changes in v2:
> >  - modify subject
> >  - add comments for AXI_FILTER version
> >  - type -> filter_ver
> > ---
> >  drivers/perf/fsl_imx9_ddr_perf.c | 33 ++++++++++++++++++++++++--------
> >  1 file changed, 25 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/perf/fsl_imx9_ddr_perf.c b/drivers/perf/fsl_imx9_ddr_perf.c
> > index 3c856d9a4e97..e2c2c674b6d2 100644
> > --- a/drivers/perf/fsl_imx9_ddr_perf.c
> > +++ b/drivers/perf/fsl_imx9_ddr_perf.c
> > @@ -63,8 +63,21 @@
> >  
> >  static DEFINE_IDA(ddr_ida);
> >  
> > +/*
> > + * V1 support 1 read transaction, 1 write transaction and 1 read beats
> > + * event which corresponding respecitively to counter 2, 3 and 4.
> > + */
> > +#define DDR_PERF_AXI_FILTER_V1		0x1
> > +
> > +/*
> > + * V2 support 1 read beats and 3 write beats events which corresponding
> > + * respecitively to counter 2-5.
> > + */
> > +#define DDR_PERF_AXI_FILTER_V2		0x2
> > +
> >  struct imx_ddr_devtype_data {
> >  	const char *identifier;		/* system PMU identifier for userspace */
> > +	unsigned int filter_ver;	/* AXI filter version */
> >  };
> >  
> >  struct ddr_pmu {
> > @@ -83,24 +96,27 @@ struct ddr_pmu {
> >  
> >  static const struct imx_ddr_devtype_data imx91_devtype_data = {
> >  	.identifier = "imx91",
> > +	.filter_ver = DDR_PERF_AXI_FILTER_V1
> >  };
> 
> [...]
> 
> > -static inline bool is_imx93(struct ddr_pmu *pmu)
> > +static inline bool axi_filter_v1(struct ddr_pmu *pmu)
> >  {
> > -	return pmu->devtype_data == &imx93_devtype_data;
> > +	return pmu->devtype_data->filter_ver == DDR_PERF_AXI_FILTER_V1;
> >  }
> 
> [...]
> 
> > @@ -624,11 +641,11 @@ static int ddr_perf_event_add(struct perf_event *event, int flags)
> >  	hwc->idx = counter;
> >  	hwc->state |= PERF_HES_STOPPED;
> >  
> > -	if (is_imx93(pmu))
> > +	if (axi_filter_v1(pmu))
> >  		/* read trans, write trans, read beat */
> >  		imx93_ddr_perf_monitor_config(pmu, event_id, counter, cfg1, cfg2);
> 
> Hmm, doesn't this change mean we now enable this for imx91 as well? My
> reading of the commit message is that imx93 was the first chip which
> supports this.

Yes, it's enabled for imx91 too. In fact, imx91 is compatible with imx93.
They use same configuration for axi filter.

Thanks,
Xu Yang

> 
> Will
