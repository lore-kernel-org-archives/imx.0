Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010016.outbound.protection.outlook.com [52.101.84.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3322A38C43A
	for <imx@lists.linux.dev>; Wed, 17 Jun 2026 19:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781726222; cv=fail; b=qa4YClmdKZsdsN6j9NWjdW4MUslDIZN8FY5MdnZ4iQ7saPSQwsYfcZr4o1vMkq8/lfUTrLdTyHGcRP279jkRtQK89CfoCp6YUs/LFCBYiJ2U+qgVenmQ43+R4QhBcdX6irH6wYAK5VCcdE7RQii5DY5BK4+a5Saa2ueVUyl9zNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781726222; c=relaxed/simple;
	bh=vM72dJDOtkcMNFALhsFLaA9GLdZXV/yLTsxHZoIkcqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=N2gcRo/X20REK6iI+2ErArRU1hwC0qjFkRW8Db6o/5qjVZkg+GPKfrQU/ug1L38orDg0iQw0k1To8IA/JCoS56HRjxH3FWQOKaQeuL46YVV5PaKkCQYbJxXT6/3uZtAZtDZ36Uah/+/lwijieHbuyxzfMdFoCJEEId/f9qtKO9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wjh5LY3E; arc=fail smtp.client-ip=52.101.84.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wjh5LY3E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+OXHzpUPTKPPetFcFZqVLJgRO4lQqKDEumqLX5xV3CB7F1OFV0Bvc+pWrNRnx+tW51ruut1eNOM1B7kUSXorLq8GJvvdYv7T17f+aBiwADluCi67k4XEYY86CxzEfS2u6BNoEEKC+/nxKpx7gA9aC3StT+898HInppPHQ23wRBgESWbjpyRYszgVPQSU7YqJv3xvsF8YpS6+/CC5m/ceB0GSDrndGDRQ9PLlISYtRSEvqgxRBXF55iukpORFsGtgMzTLFVlHMa4J/WqpB+TVmdhEL0yC3jGzYZFPuvMmEXTMVZ5B56GWSdybJ2Lhbq3NxhfBRanxLLlXr6WJi4wCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zMPaFxUIa+Ulr7iCRADwkvHh8mYXM9cSFm317YnSqw=;
 b=LDCz7YQL9/qqMoWd7Uz/vqKLRU0eynJOGakdDwHEm+NP+5cV9Dd06wtTN6dpboaWS4aPCnW5/WHzJAsjQRiTizgvJtiKMn4v7ARokGFyrGLMHzsjdDQ+n4I65d9ZNAhEVl1CESTLl1Cy3S0DRMyDzgBtATxPBLCMSt7x75SFosPxaSbbvFxhbX2CZnRQa4xY51XdbT8JVXxAHxUaKOnJDaA7tNQnqaEiUEYHcl1utQn3LB2GLRH9m4lz1517j+9fCXPc1yfPQrynJzIwwMbEZo20Z2woXGQBgLOvCI9EGeRN36pn6cQvNDST7ZFDZiAAs8kHCvCdk5/O4tvVskuBGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zMPaFxUIa+Ulr7iCRADwkvHh8mYXM9cSFm317YnSqw=;
 b=wjh5LY3E3O0JVIlJRhh/bEoYfIxUoErmDr9v5AEjyt42nlAH+R9YG4OPiqYzHazJpFYJPFGyP/olm5XafhlzfPnY+T/nxLe+uWtyIz1i1760Z9U97S/Dq83/nUI/2o2p4O+8QqDOA7BTBk7v4rpSpgjwWx0MuwNWg02mIEPxpDyv6Crow3cxKkrXyfitiXHfD+I2eQ5EyVoo6786oQYtlo30QNeyvPVLsK/o3u5pOIRckan/iqd73N7+Vyvv2iMqfLr4qVdZX3RyENIdyiJ4+FsczL4EVpRiQDddW46ffeLbvCf29c5ZGmIHFZyKnqCvYB5lzBlCxOSSwdBeRMXJzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10184.eurprd04.prod.outlook.com (2603:10a6:150:1bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Wed, 17 Jun
 2026 19:56:51 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 19:56:51 +0000
Date: Wed, 17 Jun 2026 14:56:40 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Pankaj Gupta <pankaj.gupta@nxp.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Frieder Schrempf <frieder@fris.de>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/9] firmware: imx: ele: Add API functions for OCOTP fuse
 access
Message-ID: <ajL7-OqjYuQHyZOI@SMW015318>
References: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de>
 <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-3-cb7f3698c3e6@kontron.de>
 <ajFtkysqxuLV8GgF@SMW015318>
 <cea74ed4-1003-419e-8da3-1c62b1ace726@kontron.de>
 <ajGsiglUUbDTIxTh@SMW015318>
 <9c1d34ec-0b96-471e-8b60-6b4c852878bf@kontron.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c1d34ec-0b96-471e-8b60-6b4c852878bf@kontron.de>
X-ClientProxiedBy: PH7PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:510:174::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10184:EE_
X-MS-Office365-Filtering-Correlation-Id: e1e5ad74-4b69-4d6a-86ce-08deccaa92fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|23010399003|7416014|376014|3023799007|22082099003|18002099003|56012099006|11063799006|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	CkSR/ufW0qxWyB9fVEraIoz9axW9+MXbGqdlCoux0Ihfq3n2UE/Vjm3RwSRHEJFnqYFZLDYhSd4YFMzLQF/ISR+gUN2JSKL1rPrYmmwKv0TGBhrOIpZ9PGIev5giTOVGx30FSFptSSwNFpJzvbDgGKz3Fk/y2AQR90paGshq4pL729cOMqgL9pPJfsWtLFviX9FyIZs+NmA+o3b3q+UaJMEMFEeXeiyj/tERrzbL15IHB81imikBs1fHCyXcnx1mx6k770wVn1DiNJV6+71SPZkMa2KnAY1JGTws41Em0ozXZf+8d4Fy82eKDRG/nGiAsFvvavrNw/xjv2nrCOV8aBceNPjZk2bAplTS20NelmKBa1HCggE0ie5gZn1bkKXt5WHVbRyiowd+f8NLO7STCw5/Yqe7fw+y4cpoZ9C7jvFa62h+1aN/Qp96+XDoelsf6mHDPQDVEQrTrqGN9mGu64lpph5iRelVfLg3QgTBJUqnOa4kqGaHS/8KVQ/cqUPDUWk1Kzul2gOu2zHVI/e1IIDwQTWyhbp2KO8nrns36QPUOzK/96CEu61Kx/pvv+vX9YK62GSmOhpB9Prr55j03R5t2/UT1KZyI6o+1bMJWKqz3YUM9D4rQXDuy1+Oj7rXkX06AmKyXwQ2wSZA2MN+s3ICN6L1J+BndyhszeAKm2fEkNGENXwYSr4psZY0mAnp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(23010399003)(7416014)(376014)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006)(6133799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RUX016vakycGjJ5N3EeLtIpsjeoO7dLnJwroG4z73qGERov5klmEHpuSnOO1?=
 =?us-ascii?Q?nlKthspOAL404/24bpbeI0G2WaBsmWNNA7LNc/YU1hs8fbYxKX47Inbbi91E?=
 =?us-ascii?Q?Zj5YII5S2Io/IB4Vo++hbK/TxWTFewRzhLszpZ7Ns7eLeMoV+3ERK7c7ix3A?=
 =?us-ascii?Q?iajsKGZB9oZhF68KFD41+v2MYd5Df7+7rtAmVpkmB9jSZGvNuf7jAD9Zczoo?=
 =?us-ascii?Q?RFsgGW8sB4qpypLfK3z+v2nG2Iz+UaxKPOmyj0pqW3C/MaTmSe2RVrnw2b5c?=
 =?us-ascii?Q?pYeAeEibZl0zXJoBpED3vPXBCe7Lu1jSgjfMzrk9T4bm5f9inIrF/YVNvhB+?=
 =?us-ascii?Q?5rEjDqGxzZFMI6+v22TBScVcU/Ihbt/Y7diUEZQf0Ro+9P/e8MMCgpyF+LCv?=
 =?us-ascii?Q?LGpFBVWiMScPipISG4tJHtwcYXG0Kykvbnn/pCyJkxU1tKekWrnj0++DHGhe?=
 =?us-ascii?Q?k64/5pKgr834TTTrKUIkmq5sV25Ji43/Ewao06zNPiaMFuOjHnjaLAlu9U7X?=
 =?us-ascii?Q?vtKUk+bTBQLhybFYY1M43oQh9Zfby24fYfonFGcAfbvol0JxMePWq6NXFbFP?=
 =?us-ascii?Q?xu60r8VkWNsPlYT3uq+kht1yn9gzqdSRfgYkd4xFLx+/5Vx5hncfO3LorkrJ?=
 =?us-ascii?Q?qJhXi1c+116sspmITS1VOqX6Y25xt/d6y+/K0tzo4QnMLseEBOFI6aRSe+iz?=
 =?us-ascii?Q?2mhH3IuN56ZRpo5r6Dtiw3eHiIiEDo/YjHoscz+4QBbEznQXjz/Ijb7LVMts?=
 =?us-ascii?Q?KN+KlSiuZvDaFKiK2S/60EiUkP4E+b3+9TfaERPH46e2mVMHgCdYOAhUFkN8?=
 =?us-ascii?Q?yb1kAW6Ck4JzYWTVHuDxarhrO6PZdM6ad/Isb3NfG2Sfsso/H+QaepZFF7+L?=
 =?us-ascii?Q?p8SXI1IpN9a+pRqnhvXisaWVWYv8OmeS/CXiDt85NJ1dm/IhMfTqmeNxmLfM?=
 =?us-ascii?Q?skAwYp0/rpPXpOA2LsLGA5jcNukDPw5pUKZ+G84nt6p4xxNIe+7UEwHRo+xg?=
 =?us-ascii?Q?wNoCFZiWBjwci5uh++535l7/la5RmdXDayqBvyj9FMv6szPfomX0cyKT3bD3?=
 =?us-ascii?Q?5vFmg/kFBPnFrI1SnqvA9pCaA3njYt0Xi2qj4vGvehkMLXyO1DdNly5RxHpV?=
 =?us-ascii?Q?S+5cAOs55riOLJuK3MqRQvmyVr5v8ydsreCPaRosWAt3b9FT0X60EZkyySEs?=
 =?us-ascii?Q?pATumG70zBGnSRTTBl7gC6dTLK7/eYAjEpV6SaSzNv3HWL2sS//mCQtzYwrQ?=
 =?us-ascii?Q?cBFMqzqbvPgR00ssQ3/281VLwlpBWbE+E9fSDHxRANrbMlDyAQ9yQzrJ5MRe?=
 =?us-ascii?Q?PNo+okVMlZXEsZkt8N5219mJxhqYylAn/IAmOEnPqAeEb6alcYKL1KxILfKW?=
 =?us-ascii?Q?9kxSYUdfxBwC298bZEXeGVOxfwDQR6s93BB/J6yBr/H6gYxFaqTWBsG7qfeL?=
 =?us-ascii?Q?npBje3izUX/PMkRJMR6isb5EVAhiOYiR2U0B73BtHxCH3wi3AtKFwGryKK7c?=
 =?us-ascii?Q?92nE+B7xsdxuBUTFZlU8b1iblmcS4zeXor3Tz808RKzhhaAPoMPcWnn3e/wz?=
 =?us-ascii?Q?AvQN5tspfy0lDlOhZC0PW8MRFf/m7+kEgohBg/jk4k9YjX9mRfDbG4/AP92R?=
 =?us-ascii?Q?/LUCJCh6f/fGrwj9IEBhtWoyTew2vDYSb7W9HuNcdimzz0CUZyPO20S9trY4?=
 =?us-ascii?Q?Vrheh2lJT8kD/80wUP10+lpjZlXtmoyGKQo7LfPF39HhfD7kWGPSUPGKetZu?=
 =?us-ascii?Q?uxqS92VnIL6pRVEFRVwW2GEJyJEqaJOwDguOb4w0+l44CnDWnTbH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e5ad74-4b69-4d6a-86ce-08deccaa92fb
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 19:56:51.8593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w+n/atxK3GbO9VclvDlqx6oLLXTodUIw8EMVXRuAu+hG2XfIoHrb4ZfyrXlzRkItAnzGQWJ1zahooBRBXGpUN0G2DLANEdVAA6YjgEiPMeaxIiHJeKaPsYw5Qnu17cRm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10184

On Wed, Jun 17, 2026 at 08:54:35AM +0200, Frieder Schrempf wrote:
> On 16.06.26 22:05, Frank Li wrote:
> > On Tue, Jun 16, 2026 at 07:59:54PM +0200, Frieder Schrempf wrote:
> >> On 16.06.26 17:36, Frank Li wrote:
> >>> On Tue, Jun 16, 2026 at 01:52:18PM +0200, Frieder Schrempf wrote:
> >>>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> >>>>
> >>>> The ELE S400 API provides read and write access to the OCOTP fuse
> >>>> registers. This adds the necessary API functions imx_se_read_fuse()
> >>>> and imx_se_write_fuse() to be used by other drivers such as the
> >>>> OCOTP S400 NVMEM driver.
> >>>>
> >>>> This is ported from the downstream vendor kernel.
> >>>>
> >>>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> >>>> ---
> >>>>  drivers/firmware/imx/ele_base_msg.c | 122 ++++++++++++++++++++++++++++++++++++
> >>>>  drivers/firmware/imx/ele_base_msg.h |   6 ++
> >>>>  include/linux/firmware/imx/se_api.h |   3 +
> >>>>  3 files changed, 131 insertions(+)
> >>>>
> >>> ...
> >>>> +++ b/include/linux/firmware/imx/se_api.h
> >>>> @@ -11,4 +11,7 @@
> >>>>  #define SOC_ID_OF_IMX8ULP		0x084d
> >>>>  #define SOC_ID_OF_IMX93			0x9300
> >>>>
> >>>> +int imx_se_read_fuse(void *se_if_data, uint16_t fuse_id, u32 *value);
> >>>> +int imx_se_write_fuse(void *se_if_data, uint16_t fuse_id, u32 value);
> >>>> +
> >>>
> >>> This API should implement in fuse drivers. Other consume should use standard
> >>> fuse API to get value. If put here, it may bypass fuse driver.
> >>
> >> The reason this is here, is the downstream implementation in linux-imx
> >> and the current code organization.
> >
> > Downstream may not good enough, sometime, it is quick solution.
>
> Ok, but the code structure and API design has been upstreamed like this
> and the refactoring could have been done before, if downstream is known
> to not be well organized.
>
> >
> >> I thought there is some good reason
> >> to have shared functions and it looks like Pankaj structured it like
> >> this so all API functions live in ele_base_msg.c and the internal
> >> structs and defines in ele_base_msg.h and se_ctrl.h are not exposed to
> >> other drivers.
> >>
> >> If I would move this into imx-ocotp-ele.c, then I would also need to
> >> change how the code is organized and make the internal se_api functions
> >> exposed to other drivers. I don't know if that is really a good idea.
> >>
> >> I get your point but it looks like this contradicts the intention of
> >> having a clean API in the firmware driver.
> >
> > You can refer imx-ocotp-scu.c, structure should be similar, only difference
> > is that lower transfer APIs.
> Ok, this would mean that I expose the generic SE functions and structs
> required for fuse handling. In practice, I would remove
> imx_se_read_fuse() and imx_se_write_fuse() from se_api.h and instead add
> the following:
>
> struct se_msg_hdr { ... };
> struct se_api_msg { ... };
> struct se_if_priv;
> se_fill_cmd_msg_hdr( ... );
> se_msg_send_rcv( ... );
> se_val_rsp_hdr_n_status( ... );
>
> Then I would export the functions in ele_common.c and put the fuse
> read/write functions in the NVMEM driver.
>
> Is that what you want me to do?

Yes, Idealy, it should be children device under ele, ELE like a bus, which
previous lower level data transfer, ocotp should be base on top then it.
like spi/i2c, which provide low level data transfer.

Frank

>
> Pankaj (and maybe Peng), do you have any comments on this?
>
> Thanks!
