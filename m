Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012018.outbound.protection.outlook.com [52.101.66.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE95634104B
	for <imx@lists.linux.dev>; Thu,  9 Jul 2026 03:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783568254; cv=fail; b=bmMC43O4ASgV2U+utsUijKkA4dVscPuU+S/uIWuzvuvhiCpJU4cmoBlG0sTFjuVVch62xYqdwd5riNC+ogTsoSAAFRY4sTiyUnATzrwBEiwtpvwM8r/NJQmHC0cFUi/G/6DYXEJg2+O7h82E7Ki4/ATQJsKQuklwwgDZL9kWjmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783568254; c=relaxed/simple;
	bh=P5vyP+S13hwEVhkYwKWgahwPWAejJov1RN5V1c9vJMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CxbzJfMWg4POIdDXMYwWMfViKcyku7/GWQX/v52ZH80eDOoBXN7uWCEDIn28Ghr4EpT/MNoZwUsOIS/qJ/eRfM0KLRLrP/VncqBcLyB4NExJpztubh6nSUw8bF+g5A7uDvp+aaeK+irgo/f2lHANYQv7EN3KX0WlG8iooGvI/Y0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=V+wuiOqQ; arc=fail smtp.client-ip=52.101.66.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="V+wuiOqQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQFz3okyiiUMkwKq0JRnVih78R4RLg6yvn1icwsCypDX72dJgGb00txPGGQM6+ycGLbZck4Rzw7+uL8ml0DD7nIYRuupb6sR5qRnqNNkZnw+fH3A8P2UExIEXLcd7cmyJsyU5WDYzG9njiQKZn5ZL1KKfZV+J0m41oZE0Z6sycrj7aWiXk+k1chE34tRNdk3Smhwwf+nFLe3vCPeeNoUcz8T51j9lWc1Fi9kQzGjXtZy1nJKwx3Av7zNETZHB1S2YXunBBeuxkSChhwdYyHufMmem8n57+nJ1vosqHTnV2BrXIE/nVYH4pU0zZpAyco5luw+POd+G+2r1MBypOZb1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Da3lwKNokylrbRQO/e92tRizUcPKDTbA8VxSKVb4bYk=;
 b=Z+jcIwlx7z4jZ6100UngvmhybcLUkveeebPiRGZWCoXQagED+8ctEexgm1VX6+mzI4/7L40t6Q/BTvCcdN0uguOJACR3wOvnDxo3sTvD9u0jC6Mln82mZo9oJr4DshUMwBj59+AAFyxqeU5qkd4tDvpebSbOsHxv9Ub+uNC2kkh5N7BFWtmHZ3NPj4RqC/tv+I5QAwboi1U4OLtNQ2Aby2Qgig9RWAzhME0bX11VQwH8qZ66VizXyDduqDTwZJFF9ndSoQ3uLNPmZi8J7j9asT7UZ9D0ef8V807FG9R4DnpKW944ndPNulTFU9ogAcmVI2zaoKb+cxsFd5zQVbnDJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Da3lwKNokylrbRQO/e92tRizUcPKDTbA8VxSKVb4bYk=;
 b=V+wuiOqQqyOsxnohjDDiyyFEq9raGkhiBq89vU2DI4bsERIZcLIlLURiy/32Ig9RRuBl7kcCW+JSDuyE99C4JPKMvbvUdcOkGct+r/Oh9S7QuNW8UGLMXSSFWTSywqswp21WK2gHXNEvDq67nKxoSwDuKNd1G8JLEWyQQXoCzk5lzwjgyfb8/L9TypYHoixJ/X50Yism5UBpANC0y3BOQ8tlkqD/7PVRN6UB6CUiZ/nJ+OmNBggQfgViDNTdGPUpSUVTR0L8EpforoxXb4aIbHUH9euBIvuOW1kzjInIcNylBqihFmcxBj7VSVtjfmxTGXiXcPutZ0mZ5Z8trUiM+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8093.eurprd04.prod.outlook.com (2603:10a6:102:1c9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 03:37:29 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 9 Jul 2026
 03:37:29 +0000
Date: Wed, 8 Jul 2026 22:37:16 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "NG, TZE YEE" <tze.yee.ng@altera.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Jorge Marques <jorge.marques@analog.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	"NG, ADRIAN HO YIN" <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH v6 5/5] i3c: master: Add optional_bytes for
 variable-length GET CCC validation
Message-ID: <ak8XbBwHsI9QgEhA@SMW015318>
References: <cover.1783493867.git.tze.yee.ng@altera.com>
 <2e07dc944eab1c4358be1da87fa5000e711ac8bd.1783493868.git.tze.yee.ng@altera.com>
 <ak5mMbPlO8dCxH8R@SMW015318>
 <7ffb03e1-0f06-48af-ac9f-57058641429e@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ffb03e1-0f06-48af-ac9f-57058641429e@altera.com>
X-ClientProxiedBy: PH8P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: f545274c-2629-4b9c-d85f-08dedd6b66d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|7416014|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	rMdobeVju1ArpCU1iXl4GdTl+OEvQCjDcoUKS9bwpwyIEru6K5ktUHzHFvAVTOir0BTyvyybkWLsHvDRLC+lQZgCDckOzpQgI3+pOtfDGwyie9hfDTdQVKquT0sc++IYaDYcAlhoWNFXjcURacho+mnqiNimi6woW6IgXmuXRhTnFG3k3S0JtP8eKylUfw+XrUFy5A58YsJH8zg+SbDglALSRFYuaGZ4vk2RfRGlvSoZyogaEhtGfD7yFu3TEcRmjUplzeXtSb3T9lj4l0fhv7BAKIhgIKxWP/csdLw2fxrf1JhGdjypoYhgAOPYAtM5Yd9e8tcyZelBfSxuVcnKKKe/mh4Mfvd3aNrhfuyPfnoq+pCnLmG6luAjEifZDrUqM7KLvyozrVXGwmPcX4wmKSKRB3fJjwDcBnOyX/aUcrZtrlJKtR1lrNu2EDJc7gvGqfd5k8FCK0INmNPgXuTfu4eyDJLkUDPcdScXpErIWkb6BabIenZJkYTbIw8oOwdnnhGTpoim1W5fiODlytHqsLpSdhbDkOIhgEP+AxuSFucOjRT0MxbNKVva8YFccmzg7aVdXf+3exWN7b4VY0bi3XLuGJob56PAKnsbale7zYj3flh8lqIz2cv9TYp1cGKIRy142QaeMGg2cvbSXcq84acVauBJy/4QncJO+aVndMk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(7416014)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2tyNEUxdUxpQnpUVjRpVG4yMkg2a1dwZkhwbnQ3bzlMdzh4Q3pOVXhsVjkz?=
 =?utf-8?B?N3dOVDNYYmRWNmJBa0dpcU1jUXFvYmcwSHZDQjQ1T3g1ZlZXd3dKQTBJSlFW?=
 =?utf-8?B?RFJUUis0UHFxejZQa2NwTFJ5ZGFZK0VKRXNnOWhtN0V6ajNyb2NHMXM1WDZW?=
 =?utf-8?B?NkIvRDhSNjVmN042Qlo3K3N0ek9FQThGMlBDbFd5dGNMeVdPdUNKY1hLU2Nj?=
 =?utf-8?B?VmZXY2RyRnlZMGNrcElMWnE0bzdCOGo2NWdmc3dYUGs1MzBSaW9pNkZIRnpW?=
 =?utf-8?B?dG1xcjNXT1J5VVRpZTZYZzdCNDhML0d3YjJNRjF6dUtJZE81VFZVd2hBcjhh?=
 =?utf-8?B?VWpJWTdRclJnaHZzMTJLakJmR2dHS3c1YUpWMWhpZ0VKUWZ2Z25zS1BzanRl?=
 =?utf-8?B?M2JMZ0Flc285NkZ5eVBkaGpVOTQ3T0lwcUNpRGhPK2FFM1UrY0hlYVIrNHdG?=
 =?utf-8?B?cTZXVXAydjZva2dqRE1FdG5RR1hJd2pmc05wdk9hZ3BYblpMNE5IdjlkeXI4?=
 =?utf-8?B?eWFTOWtOZW5SakxiaVRmeEFoYU1IdTNsQ1lYSnlJUU5xWWp0OWdoSHhMNHZ0?=
 =?utf-8?B?K1Y4aktFWUR2R00vOHZoRy9VaVVvQlNialUvU0E5T0x5cUgwalh6U0FIRStp?=
 =?utf-8?B?dkVsWUE5VGFyVUt0aXQvbnlXUTEzd1lydkMvYkowVHhJdEFYSStqSWZDYkd3?=
 =?utf-8?B?d2E3NVlNblY1TkVqemVxdmljN3ZkWDlPckt6TmlwM09zY1BLeHRPbDV1QmpI?=
 =?utf-8?B?bmc4THRJMmJuU1VrVUpUb0tjdFg0bTJGckdtOUQ5ZWl0eDQwT2RXUjEvekpO?=
 =?utf-8?B?ejhROVl1M2toMFl2NStQTUNzNEJtUWVvMTVZc050QzZtQVdwZ05FWVpZUVpR?=
 =?utf-8?B?ZlpDMmdxNnFkUnl1TE1VeERXTThPbUNsMVBOaXBIQWJsSWtLWjJtNEpYZUc2?=
 =?utf-8?B?S2duakw4YWdscUZvNWtDdU1xbE43U1BHdE96c0J3L1BNUm1vMGFLUWQ0dWg3?=
 =?utf-8?B?ZFVLa0Erc2h4Y0VWNTRUbysySzhIamRaUnBtZkZUS0hMellLckVnQWVmRXV3?=
 =?utf-8?B?Y1I1WTZBQVhhR0xzVmNnRklPYVhPTDRsRTBmSGJ0UWtXOG1SVTN0aDJhYTN2?=
 =?utf-8?B?TU1MdVpyOTRXYmVMZFp4WDJnRS8xUHVmcEFxUjMyUWQzSEhlNW9jRWhpcCtZ?=
 =?utf-8?B?Q0VWa0ZQY0pwTDE1RjNMRUlNOVpyQVlubng3cXhWSFZ3RnA0T3pxKzdVaG5U?=
 =?utf-8?B?NWFSTVYrOGZtMFVhNVkzVnVXRnYvZWpMcmNWRmJPQ0QxL2ExRDdjSkFCUys4?=
 =?utf-8?B?TVdNRVJmQTRhd0VBTGwyaUYzSFZYSUlzMWNKWWdjUTcrRjR1QTJYNTVobFgv?=
 =?utf-8?B?dml1QVdXY1FUWGsyaHpVME5UbERZZ1JTTVJTakdLVEhEdG55c0hrM0hCc1RY?=
 =?utf-8?B?U0JlTlExeUdJS1lTa1p6Q3ljN0ZDZHk4SUVZYmxkRGVUeDNxSCtLMnJYNnll?=
 =?utf-8?B?M2FFajd0L3BzQTlVYWdVQ3l3SUN5VFpUOGwxakh5QkdxWFJiZVNMUVN2bUNr?=
 =?utf-8?B?RWo3ZllTd2JBWXZZbDV3WlBRMUgxMzF1Zkx5K0ZkMjZBUHBNeUg0R1VzMk1N?=
 =?utf-8?B?UEJFK3lEcXl2eDg2RXpFTDVyc2VjNmptbThkM21ZaHM5NG5QS3hhenYrKzVT?=
 =?utf-8?B?THVSUXVQZVNtSEhUUlN4cTJJN01RU3pVRGpRYUpCTEhCUVVkbWpTSndEKzN5?=
 =?utf-8?B?bWc1TGNsK21hQUhOSit3MSt4bkNld3pmdkNCTU9DZ1pJVjd0K0tlZS9maFZv?=
 =?utf-8?B?YzFQNytOaWhXa05wczR3UWNMMUdFV0RLN05yU21YUUE5cytYWG4yUEhZejRq?=
 =?utf-8?B?YkpLY1p0V1hnMm9zb0dYS3FOZ25LamN1YjZjVDYrWTkzbmpKMGtTZTNpOVpM?=
 =?utf-8?B?WGE2eUJMVTRnSzJsNHNqT0IzZDdVR3FPNTl6dTdYTWd6MG1TblF0R1NIbHVT?=
 =?utf-8?B?elhjVkxwV0h5dSszZlkrMmphWWxQQ1d3b0tla1FsdEEyb2ZIQmE4QkNkc3Z6?=
 =?utf-8?B?OHc3Y0hoOW12MzA2Ylk5K0tZMUN2K2dlUU1UMi9NT1p0VEJ6N1QrU3p4MGdo?=
 =?utf-8?B?L0VqN3hESXcyUjhxTmRzS0RrZUUyNUgzbm5Bc1hMSjBCaGlOWUNwWXhLeHAw?=
 =?utf-8?B?WWdVazArc0ZLbEJYbGl6UUVKdkt1SVhWVlBKYWEybWlJdW02K21QOVc3Z1pN?=
 =?utf-8?B?amFGWTUwMXZTMzFUblJnWGdCdWVCbWFobytnZ0xMQ3lVeWg4aXF5eWpoWlBk?=
 =?utf-8?B?Y2thc2NzQ2JJMVBQSE1jQjBUYXhJRDBRWW1VcmRhaDE5VUpiejFwTSszeDdU?=
 =?utf-8?Q?2f2u9sG/PrHOVjNSYCmK5vjaI+xqCRoOwp2aJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f545274c-2629-4b9c-d85f-08dedd6b66d2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 03:37:29.2631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+dYjVZ+8dWuh72wFKTLrUBYlnNQdDVhNIz0oaYFvD5M0sPxeo+/1ccSn0VMJ2Bqfb7VyciUIpGi9IKiEYJANPEbgYCFLW5vshKsIh/PqZEvVhyfBtX+7Le5Q1QF5cs7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8093

On Thu, Jul 09, 2026 at 02:56:37AM +0000, NG, TZE YEE wrote:
> On 8/7/2026 11:01 pm, Frank Li wrote:
> > On Wed, Jul 08, 2026 at 12:17:41AM -0700, tze.yee.ng@altera.com wrote:
> >> From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> >>
> >> Add optional_bytes to struct i3c_ccc_cmd_payload so callers describe
> >> variable-length GET CCC responses. GETMRL and GETMXDS set optional_bytes
> >> at the call site. Extend i3c_ccc_validate_payload_len() to honour it.
> >>
> >> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> >> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
> >> ---
> >> Changes in v5:
> >> - Split from v4 patch 3/3: optional_bytes and variable-length GET rules only.
> >> - Simplify validation: drop redundant exact-length check when
> >>    optional_bytes == 0 (per review).
> >> - Clarify GETMXDS fallback: with optional_bytes = 3, a 2-byte success on
> >>    the first attempt no longer needs the fallback; it remains for when the
> >>    5-byte request fails rather than short-reading.
> >> ---
> >>   drivers/i3c/master.c    | 29 +++++++++++++++++++++++------
> >>   include/linux/i3c/ccc.h |  2 ++
> >>   2 files changed, 25 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> >> index 3b6d3ecd9d12..12ca7c929ee5 100644
> >> --- a/drivers/i3c/master.c
> >> +++ b/drivers/i3c/master.c
> >> @@ -902,6 +902,7 @@ static void *i3c_ccc_cmd_dest_init(struct i3c_ccc_cmd_dest *dest, u8 addr,
> >>   	dest->addr = addr;
> >>   	dest->payload.len = payloadlen;
> >>   	dest->payload.actual_len = 0;
> >> +	dest->payload.optional_bytes = 0;
> >>   	if (payloadlen)
> >>   		dest->payload.data = kzalloc(payloadlen, GFP_KERNEL);
> >>   	else
> >> @@ -944,11 +945,19 @@ static int i3c_ccc_validate_payload_len(struct i3c_ccc_cmd *cmd)
> >>
> >>   	for (i = 0; i < cmd->ndests; i++) {
> >>   		struct i3c_ccc_cmd_payload *p = &cmd->dests[i].payload;
> >> +		u16 min_len;
> >> +
> >> +		if (p->optional_bytes > p->len)
> >> +			return -EINVAL;
> >>
> >>   		if (p->actual_len > p->len)
> >>   			return -EIO;
> >>
> >> -		if (p->len && p->actual_len != p->len)
> >> +		if (!p->len)
> >> +			continue;
> >> +
> >> +		min_len = p->len - p->optional_bytes;
> >> +		if (p->actual_len < min_len)
> >>   			return -EIO;
> >>   	}
> >>
> >> @@ -1342,10 +1351,14 @@ static int i3c_master_getmrl_locked(struct i3c_master_controller *master,
> >>   		return -ENOMEM;
> >>
> >>   	/*
> >> -	 * When the device does not have IBI payload GETMRL only returns 2
> >> -	 * bytes of data.
> >> +	 * GETMRL returns 2 bytes (max read length) when the device does not
> >> +	 * advertise IBI payload, or 2 or 3 bytes when it does (the optional
> >> +	 * third byte is max IBI length). Use optional_bytes to allow either
> >> +	 * length when IBI payload is supported.
> >>   	 */
> >> -	if (!(info->bcr & I3C_BCR_IBI_PAYLOAD))
> >> +	if (info->bcr & I3C_BCR_IBI_PAYLOAD)
> >> +		dest.payload.optional_bytes = 1;
> >> +	else
> >>   		dest.payload.len -= 1;
> >>
> >>   	i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETMRL, &dest, 1);
> >> @@ -1414,14 +1427,18 @@ static int i3c_master_getmxds_locked(struct i3c_master_controller *master,
> >>   	if (!getmaxds)
> >>   		return -ENOMEM;
> >>
> >> +	dest.payload.optional_bytes = 3;
> >> +
> >>   	i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETMXDS, &dest, 1);
> >>   	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
> >>   	if (ret) {
> >>   		/*
> >> -		 * Retry when the device does not support max read turnaround
> >> -		 * while expecting shorter length from this CCC command.
> >> +		 * optional_bytes = 3 accepts a 2-byte response on the first
> >> +		 * attempt, so this fallback runs only when the 5-byte request
> >> +		 * fails rather than returning a short read.
> >>   		 */
> >>   		dest.payload.len -= 3;
> >> +		dest.payload.optional_bytes = 0;
> >>   		i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETMXDS, &dest, 1);
> >
> > where use retry != 1 case ? if all is 1, patch 4 is not necessary.
> >
> > Frank
> >
>
> Hi Frank,
>
> The retry count is not always 1. retries is 1 for GET and 0 for SET (rnw
> ? I3C_CCC_RETRIES : 0). max_attempts = retries + 1 gives 2 attempts for
> Direct GET (spec §5.1.9.2.3) and 1 for side-effecting SET CCCs. This
> follows Adrian Hunter’s v4 suggestion in
> https://lore.kernel.org/all/382a7c2d-2e9e-4a83-94d1-b917921d91f1@intel.com/;
> patch 4 is still required for validation and the central retry path, not
> only for the field itself.
>
> Patch 4 is still needed for the central retry path, GET payload
> validation after a successful transfer, and resetting actual_len between
> attempts — not only for exposing retries in struct i3c_ccc_cmd.

Okay

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Thanks,
> Tze Yee
>
> >>   		ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
> >>   		if (ret)
> >> diff --git a/include/linux/i3c/ccc.h b/include/linux/i3c/ccc.h
> >> index 2506d83b8255..7ad677baf761 100644
> >> --- a/include/linux/i3c/ccc.h
> >> +++ b/include/linux/i3c/ccc.h
> >> @@ -347,11 +347,13 @@ struct i3c_ccc_getxtime {
> >>    *
> >>    * @len: requested payload length
> >>    * @actual_len: number of bytes received on a GET CCC (filled by the driver)
> >> + * @optional_bytes: GET CCCs may return up to this many fewer bytes than @len
> >>    * @data: payload data. This buffer must be DMA-able
> >>    */
> >>   struct i3c_ccc_cmd_payload {
> >>   	u16 len;
> >>   	u16 actual_len;
> >> +	u16 optional_bytes;
> >>   	void *data;
> >>   };
> >>
> >> --
> >> 2.43.7
> >>
> >>
>
