Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010015.outbound.protection.outlook.com [52.101.84.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031412DC791
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 16:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780330920; cv=fail; b=A6kYdjUkk5qPD8u2dbvWfJxdtpP1pzbketB4JhzFxf5ZLKeo6BhH73YTM6cEJ/wZHUJnXMyf6q7BrbF+yvwYMd/8FJZ8TvfPb1Sl+sGLR6bI9GevatRbgDB+BPkq8Gjc/0KiKXOTVA/Rmp32U6rjg6WYIT3ZvqWmKhKIraSKyEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780330920; c=relaxed/simple;
	bh=DR8Icjv+xTWjLaGxff8wYBFdWCpzu86bGn4BedrgAZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CADei3+NRJyCvN5HwuGrSAolNZz0Ghw6mnZXvFb2T9SwIFb7cTPaKmJM6haUJY3EIxLG87/Oe6seWvBUpBNVBE4VZQ5353SV8kiRLRWzMKYJa3vKsTvWwiPIuEjUia3FUt/R3Grttv0JL+8soFYPp3FCvIYfSCcLm7BsnRCQhIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BvPhkT9i; arc=fail smtp.client-ip=52.101.84.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BvPhkT9i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WgAWHK4XoxY3LQ53NHDGZncFH0TyaTEBOYCsGguXS+y7DNzFupmApkoZgJd5DW8aztvAoRYZI3vkB0/vVMYglNsnc0We2Kx7xboVbUUjldOzDmyHlJxNxYa71bk/142VZtdxJpMKy76lE2Brqiq+tRj84Gf8lbdEGIbBEAXs6u9kV57ere4UEriNf4iir+kywyA03gtknppfbFRCRr2QfeuNDjXaRs4OSJUMMZm6asn5oj1goPGi65iy4Y+Mx1DzWFUNSECQNQzsrao3hJXFMZBJqF8ctyj2Gdh5zaybfoRg6nOdicbikAmIgfTagnnaFIzWQ4rtueLTrm9zAR/NcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsmYUS7WxNfBIk6YfZmHU8NEdEJ/c6RvlBu/17GHJwo=;
 b=XNdXHucOCagnOC3XszDzJW3UDJvcnKYv+XJwgRBLVtUSgwAMB+7XOfP1VDA5ZcpQiFsXPEF6l4dG0Sg/FTgtk9TElwh8x9EF2vaMiOY5X+UhVHVhPWLNd9YqVgUes1CVz/dLA0Uee0MJi9yg+S5NYEOcCtl/+OrjSfQkT5hUp5BVWaxNx0nWtJQisGFT9F3M8kxbD1rkhMKVRkL8mhOwxyEf8/J0l7nNk5tr4pTSbowkL0OskXIiVGYim4a13kuswzKoVK6YIDknbUQEnDViznmirklV0IEk+WWxv4QwFAZzwdiwBG6MsBZdgIP9DIyYYattyoTaGj3WospT6wqjxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsmYUS7WxNfBIk6YfZmHU8NEdEJ/c6RvlBu/17GHJwo=;
 b=BvPhkT9inARFPftmKQK6XvjVZnphvPNaALkDdpzJ6rzmVluJzibwb5wD2ZbLtTHud94jwVBFwfa5rSRobIz27BPxN5re9BXPAVMKnQhjwerZoddp3AJgk+hkUvf82d7nnGdeox3yygb0I6Qe56RdVYZv1MdJqYFu5LKEdI7c9yWM7Fu3iNKzg7/+V4Loox/mKZrRUvUsRKGWNqNN6dTo+2qL7+ixhiTeHNZJIbIAEl9TmV0KAD09ylWaSAFTtoGCJQFsENejN8mniZQikRHcE9rwYqhPGZlKieJmFExyw+WmmHdHiJIt9jD8zzJcSCe5NuEQ9ZveAvzouE7vJ39iLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11237.eurprd04.prod.outlook.com (2603:10a6:150:279::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Mon, 1 Jun 2026
 16:21:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 16:21:53 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	frank.li@nxp.com,
	imx@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH -next] firmware: imx: secure-enclave: drop invalid overflow check in iobuf setup
Date: Mon,  1 Jun 2026 12:21:46 -0400
Message-ID: <178033087912.4122211.17575810294211305121.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260514090321.2186877-1-pankaj.gupta@nxp.com>
References: <20260514090321.2186877-1-pankaj.gupta@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR07CA0014.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB11237:EE_
X-MS-Office365-Filtering-Correlation-Id: fc100c00-a2f0-453c-6ee6-08debff9e4ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|366016|1800799024|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zBqm3fwHiwMvJoW5T3JmjoFLjkcvOlz7ub1FwRPJeUoZTFBleWIneNi5MvsmSUVdHaWR8QcZdfEKmALzzGGn2S+4OOYU/mW7AL4HRTxNMuQc7MGDTuN8UAwkrbqJqJJtVQwbP/EUnNc7a9HFb1vG2YxXhoDQmT9AzMW0fp4J6fbsaK0sttsD3eacg4ZZo6Q/K4saSRk6X0c+4mCp1c1hBrxhRQu1aYVv62qNdtR4zBgt/5neXXL/8seq/2KIgt1hfGppbY2s+7W7byAVW+oUIuBvblNLBrsPWiljPtJ09ymvg9Qeskdol8Ykb3uzMEEjUoZvPJ95yT3yKFGjnii87oAKYoHXJ/DFNFfMR2VTZyfvLvTbJThZP2vXodkmJ76nwOtOQttV0IHIzW9vpAPdmZbVUZt9NHuXd821xr8IRHWxLfCVHfxHZsmPt1RC1KdcPaW+fV8aAUm7ogIDBgteoPWp+A/nie4q2Q5ErMJSKsQij1RImMBCr0zpAvYbuWQFZEkvxK605WNhziPZ9j4bhTHxsSNnXfS5ZuFMmx6QkgU7jGmMFABajuX97qUywGuN/5BtuLHMZkFBbqbVaPaaCMxSz5a8D2Z0Uq6kVqKCOeT6XcZNmXgE7XgR+kCt2fCmSM+61Hrl6z2/SXKLLr8nFAEgVOsBzKZWMAwxIZesV1jJJ+eYtqXdT7OPje34n2KK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(1800799024)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDV0ZkpiR254cGRKM3k4VW40U2N2cGd2eWdRUERLdU42LzVpamJkQlFQRmN3?=
 =?utf-8?B?YVA5SW1sUnlQbC9uZ3U5QkV3Y0RTMWV2dEtFbE9qRzNKUllHOXNiemt6VE1v?=
 =?utf-8?B?UjVRK05OMEIwQW4wVXYrdGlJdThOR2hPUEVjcDVHM3M3R05SbG1yZ1R5Y3ln?=
 =?utf-8?B?SUMyd25RYytUd0k2OUtGcmNOZVR0YjlrRVlRbm1zcm13N2g1S3Y1d2Fubk5C?=
 =?utf-8?B?SzBCUVQvOERjeG9XM0tCUU45bURTbVBiK1VXc0s4Qm1KR1B6d3JRbFc1Qk9R?=
 =?utf-8?B?UTVOVGpCNDA2d01oZVBFS1NOWEMvMVBWR0VPWGJmYnJUZDRQSXd3RC9icC91?=
 =?utf-8?B?RG5BSWcxYnU0L1hCUXZncGIzZmVSWjAwU2NYUDFya1NKQ1czay91aENXVytn?=
 =?utf-8?B?Rnp3WHpiNXowazJUTThScG1Od3lsTmV4ZlJreExzZXZOTThCajRTZjY5dHcy?=
 =?utf-8?B?QXBKWldpK1ZuTThjREVDT2FheDUvb1RNQldHamtVbGZrdTNDS2d6N2JvV3Yw?=
 =?utf-8?B?ajB5K2FvanNCbG83NldTWUtiU1BJeHRzR1lvVXFZUjdBNFpGT21qZnBrd3lk?=
 =?utf-8?B?YXZlekZKS1d4VnNRcDA2ZDVEVHA3dUNmU2dINW1UbUl0MndTYm9PMlo1RGc5?=
 =?utf-8?B?OHNUOVVlbTZLVk9jV2haWUdhd2Q2cFQrd2d1MStBVlNTNUw3WGcvM0hvcnB0?=
 =?utf-8?B?QUc2ZjZPaFNLMm1kNlVCaWJ5Y0IxcXlrZHpNVXF0WmlnczZKdGFrZFVnRWIy?=
 =?utf-8?B?RENqN3Vzanc1SzM1SmdHb2o2MmMyY0dYUXNJTUpKa1laY0JVbFE5dm53YkZJ?=
 =?utf-8?B?dUY3c0tNa0pQRytyUXloQTd5YWphVFFzajdVOEtrLzAvbVhkRmljVnd6UUE3?=
 =?utf-8?B?dWlEeVVOWDR5VEo3Y1RubG1pL0wyVUZGY2tWZHNEZTJVc1F3TW9VOGN6UVYx?=
 =?utf-8?B?bjVYRWpoRTBuKzNwdzNpUkdqM1lJTEdWdy9ZVUJPYSsvR1oxYjVkOHdvbno4?=
 =?utf-8?B?S1MrRzBtTG5RbGVlcXpoNkVPVmVYR3FYUm5HVExjd25pNjdwMzVONHE3RmRa?=
 =?utf-8?B?cjhjYVplanJMa3NIUVFBR2V2eVg2SzYybzJEWkg0dXBVSkdEQksvdCs1a05B?=
 =?utf-8?B?Z2dobVFJNjlzM0svYUlZOEpLNlUrdmxEb3lsSmhXR2lDR1lwOGZnZWNPRU9C?=
 =?utf-8?B?M2Z0YnJrdWNqWGdXWEphLytZUHM4SkZzMFFKdWg3SUV0RUp1clZTNmhzT1FO?=
 =?utf-8?B?OWFDZ25ZU3VTbHJLM21HQm81ZjBNZXdydjRBelNJbTZGdnN2SjJSYml2N0Zs?=
 =?utf-8?B?TWdHYW9qY1ZnMUo4REZ0Ukh5d2M2YmdYbUNVNk5xa1NaRk1iSk85YjJYTVl1?=
 =?utf-8?B?Z0xNU2hYQkhVTkdFRXZoMGw5YVBxSjBlQWJUcXloR0FOQ2l1WGJJMUpxaXB0?=
 =?utf-8?B?T3N0ejByOVhDUlhzZ05GV3ZzeUlKc2hyWlBZbFdkSkpwU05ya2lHcGNYSHFQ?=
 =?utf-8?B?dHBmUEdFZG00OWR6ckVlWXRkQzJ0Y25PZitocTRMSDNYalRlejZUUWJWOEpL?=
 =?utf-8?B?cnZZSzFveWRIRUFKNjJxYldaU3hwNSswTDEwZHFqVUsrS2c3TzYrRUZhSWR4?=
 =?utf-8?B?MjRWQ2NvSDJNMS9nNVhENDdFSUNIUHYzYno3S2QxU0twSHA2K3h3RTdnTnpZ?=
 =?utf-8?B?b2R5TElqempxSVQ5Y3lMTVBNbUNHYUlkTGU1Qjl1c1RCYnRycy9IZ2xETlVx?=
 =?utf-8?B?aEh0SURWN0phcHZnYXZzMmFpQjlOSDlZSTAyZkNtd1dNZmJmcmxvMUtERmU1?=
 =?utf-8?B?OGJiemxQNlN1bkNvUUhDUnRqb2xkdUpnRVZSaVUyN0hvS2EwZ00yUlMvUmtR?=
 =?utf-8?B?MGY4MUg2OXBNZWNZd2dkTkJzNmo2anNlWUVNU200WUJucDJsMmhUNzFaMVF5?=
 =?utf-8?B?TUF5VGU3Z29mMjFQTEFOZWk4MmF2WHQwTk9oZDlhTUJYMTI4dVdjWU9QZXN3?=
 =?utf-8?B?RTU0UkVBaVpZTjY5KzN1L0VWNWdLb28zdDFFSHdvZ21EMnZUU0RyYmZjd1VP?=
 =?utf-8?B?U25acVNoSFIxcGFhREpQOGViSlJOMzRYcTRzUWRHQ21rVlp6dWpvQjlGNFRG?=
 =?utf-8?B?ZytSUU55UFYyekZxSjkwNlE2UmhKRXRrc3RYRzJKWnJGaEtkVTBLTlpqU0xG?=
 =?utf-8?B?M0NPTE0wM1UvRWIzNkNvazhVVG9SeDcvaTNaNFoxZHVabSt0bEdEMzJ1NG5L?=
 =?utf-8?B?WVU4bW5vQkNSWDAzS2g5ejFtMFNCVWJRUFJtVDE2eXBVUSt6QmVSYmVaVDVh?=
 =?utf-8?B?cng3dzdTbFEwK1VSR1R5bitZWjJFZlZQQjdpRFhnZTRDenRidmJtUzZna1JQ?=
 =?utf-8?Q?8jOoiqgFY5fjunK7XWdRUDmoSbUfYn9WYPgHX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc100c00-a2f0-453c-6ee6-08debff9e4ae
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 16:21:53.9130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P5WKjjfLPpkeG3sD2X+bX5GXk1CUP9qGy8A3a2qA4jDJSZOCLc50wStsS8/1JmiLSv5ntkhCzkTNSlzjNAxmsDC+yiYvqDwnoqPGWq3FcKNCWyeGhJhCjV7gPDcA0mW4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11237

From: Frank Li <Frank.Li@nxp.com>


On Thu, 14 May 2026 14:33:21 +0530, Pankaj Gupta wrote:
> io.length is a 32-bit value, so comparing it against SIZE_MAX is
> tautological and always false on 64-bit systems. Clang flags this as
> a constant out-of-range comparison.
>
> Remove the invalid check and rely on size_t-based alignment and the
> existing shared memory bounds validation.
>
> [...]

Applied, thanks!

[1/1] firmware: imx: secure-enclave: drop invalid overflow check in iobuf setup
      commit: af214594ea8ec75a71d32f982328df6bbc64704c

squash to previous's patch

Best regards,
--
Frank Li <Frank.Li@nxp.com>
