Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011052.outbound.protection.outlook.com [52.101.70.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592BF286A8
	for <imx@lists.linux.dev>; Fri, 19 Jul 2024 14:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721400736; cv=fail; b=ntJfCJ+q3NKtOUPuOrTHdlMYdvg0NNviEL4Vc659L3IV6MLP7jfYA6cyTue8vHIYJmjrZ8mgHZ392kdWhW2KsRISxaE+qV582f5UUQvszV9XRhrPLFtZoV/Zt8dzDGZ8mDTOCExfdnUHyjdAMmVMpk71xIF+Az2ofxbJMN0zJiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721400736; c=relaxed/simple;
	bh=cESpcSAVTMPtbMQYpDrFdozfaHEzu3c/OU7vYxZFFw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bj4A+mLjiYqm2u+21v57KQhDUgA4NClTvM3fYsRt08A1R27OSXMxeay4j0kUQUCmGw974Bgaeexn4fizHqBywYBDrnvr44QLvdhIpvNjjcPPN6tVQ1Z5T60H1FbL+IFmdWayugKkVkxgZDu6UyMQ3gcwatcGwwWAzqzuZpRUwi0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=l3ieSYvC; arc=fail smtp.client-ip=52.101.70.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="l3ieSYvC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RsT/2cdvIPtVk9igY8dtpkwYJZzU2r89hYCKERl9KYMakISB6mdU9goolY1JoKwRyXcs9rqhUN3GjU7Rq+m+gpMW1zlyPtQlzSSyWl6Qgb5SpWjLV2AxKy1BSe8C7IfezQznM/6e0yWVb1uOZj1H/vbJa7PXQGJFuwWiMvM2JRPs9jeOe8X0XJA39m+jmy065iSgePp9ZT+P6ODywZ9oo55aKKT2I7ZbY2Ug2EM2r5oAbkASzTywxNpqk9oxARMAmk2Id3WAD9xW7yTnNMhQXgcWQkB8ZACRYdW5rVXWh+QulQfb3e0K7rT/YqM8wKPE5l5zBiOXdboHSaDux6EtkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgNfVNmZuNDiw6mJkBKleGtFGXpZojMaFcwfy6gy7CY=;
 b=cJw7izqoh9v7Z2+vjqbwcPH2Ra+W6WhncZhYFbVyEQs5SUObp5sA8XGFZZHnPwj9xwqwmL+pFB4gSjbC8U+dlOwT2305R5pGI41Ap+7YkSmUDZkdy44xNIoDgdORZK9WpVfuoG09A+nnTsc39vRanh82xJtozW9aKOmIeQOHQb4nguVoczboIi1MW4xO16o4oToEcAlU8wyPH+K3xJSeOI9tTu8IeO0iQKnndQl4OcZa/JzoOPlv20awm5rBI8MJP5OehxnnYmn/KgeorpWx33cufJotleBbJwpFMqxTXePg/Cmy6uCZnAZZYfS8tHZ0RCziOlIo7XqBbkaDczxXAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgNfVNmZuNDiw6mJkBKleGtFGXpZojMaFcwfy6gy7CY=;
 b=l3ieSYvCYqxc9jWN9k5GwhFAmcICVDkYLTBHKeRFnm7biswsSWICTn4EQCi2+9IB8FjoBowhQ2l5Bl3rGkzVWbg1/JtnTiWtAJQ5B6HgHvUnx8oVXpW5mQzVuBvx1XY3xs8lFos8LbWMsvbkOkK0KJgAWKezFEaf539ortxKI5Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10105.eurprd04.prod.outlook.com (2603:10a6:150:1a3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Fri, 19 Jul
 2024 14:52:10 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7784.017; Fri, 19 Jul 2024
 14:52:10 +0000
Date: Fri, 19 Jul 2024 10:52:01 -0400
From: Frank Li <Frank.li@nxp.com>
To: Fabio Estevam <festevam@gmail.com>, peng.fan@nxp.com,
	peng.fan@oss.nxp.com
Cc: Stefan Wahren <wahrenst@gmx.net>, Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: mx93: No cache hierachy definitions for ARM cores
Message-ID: <Zpp9kRkEMXkp3d3i@lizhi-Precision-Tower-5810>
References: <bffb5d44-4eca-49cb-8624-e7bcce525fbb@gmx.net>
 <CAOMZO5DDk6eX+Ad9zKZmaEVvRHwFDETwuA=J7366QCRqhq_ZLw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5DDk6eX+Ad9zKZmaEVvRHwFDETwuA=J7366QCRqhq_ZLw@mail.gmail.com>
X-ClientProxiedBy: SJ0PR13CA0071.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10105:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e4c55af-1884-498b-f514-08dca8025e27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SWlYVFpGeFRvYjhDSkIxb2ZJOEhKbUhQa1lhYUNNVGFnK2VTd3VlbXFzTkFh?=
 =?utf-8?B?SmVISDdyYnZQbHlsK3NRdm9ITzAxMzlMQ0hScDVKOW0rUjRwazJEdjBLakFP?=
 =?utf-8?B?czdqZlRNdlZseDZDa2N6bkZCTXI5ZmZJZWFIM0psaitvVHhXNVZUa1BoVVVC?=
 =?utf-8?B?dW9taDNGMDRjYkhMM0h4UnB3WURlMTBrTjdCQlhLUndtMElmTW44Y1NJNDdl?=
 =?utf-8?B?RENEcHZkdlJQVHBRUHVSMGZhOThaYVV0dzQrcGVHKzVLWUV2WGVTeWlKZy84?=
 =?utf-8?B?MDIzN2VSTnRwa1lkWDM4NThuQ0lMN1I1OTFtQWp5T0x1S0w1aUdscTh1Z0FG?=
 =?utf-8?B?WlQ1OGdNSDN3Y2tpR3QzUnQwMHh6R0xsT0dPSmYwd3NJb2xWV2h3TlBBYTNH?=
 =?utf-8?B?SWhFa0gzdCthcjVNMHNFaE1zVVRNd2FZQ1ozRXlkTTBtTjB4bHlxaGhIR2Vz?=
 =?utf-8?B?dWVyVXEvbFdMQTA3d2xKbDNrdWRnWjV4VzJMakFsQ2VEOGM3MUJOT1BZQXgr?=
 =?utf-8?B?OEJiQmk4ZVMwVURtajk1bW5BY0hJWWFLbkhibnFHaXVTSHhya0U0MExSMERL?=
 =?utf-8?B?S3daMUI1V0xONUFvKzI0a0U2T09iVm9jV0dCcTY4RmVUZzVjTmNacWhERVhn?=
 =?utf-8?B?ak1XLzBORlZORFBlc3BvMW5rWGNiU1NxeXpRVjRSU2JucEowSEZIK0pLNWoz?=
 =?utf-8?B?YzFDcFpVSE9UK2VoM3pudFdjVjc2WW9kN0YxdVZaa3E4TWNldEx4MHBmcG9W?=
 =?utf-8?B?TGgyTUhHWGxUK2tCMlBPY044Vi8zM2QxVGd5YkpuVnhpTFhncUZhL3hjUDcz?=
 =?utf-8?B?MVJpVFZUNDMwU1VOTk83TmtJTXRvT2RuYUUvc0Fqb0pkdzV1SE1hMkVPNHpl?=
 =?utf-8?B?NlRDSWFDSksxQlhvRmJIeWpYaDI0eFdoVFBYRmxPdUZjNVl0M3VlMVk4S0lt?=
 =?utf-8?B?T0FWOTdDN0pDV2tRRXVnWWJSMHBKa3JRdkZtclJ0Q3A0V2pOeEN1ZU9wZkJ1?=
 =?utf-8?B?UDhzMzBDTStLZmJYUlpxZlV2L1N1cHNhQVFjdHl1cXg3R2kzS2hIRURMcjQx?=
 =?utf-8?B?aW9qenJUMFM2Qm04bG5adVMzcm0yMllXSi9Cay9BaytJTUF2UWlkUklIR0Rr?=
 =?utf-8?B?aERvK0VhdEdGS2MzY29tUmYrYlZxMU5iK045amFPclZPRmU0bnpPZ0JqOW1I?=
 =?utf-8?B?dFhycTRDdEp6a1lXbUx5eG0xNGp2eXl1TzdLamFQTHdqa0xleVYxRndpVThK?=
 =?utf-8?B?L2MranBwc1ZmODdGLzZjSU1EOFMrQllXRFdLSnl4c2kzVlc0elNobWFhakNs?=
 =?utf-8?B?SFdTYXIvM0ZkRlZKeFh3OUw1M2VQbUJNTnhxWHdYV0ZmM2oxeE53NFZCUU5w?=
 =?utf-8?B?VHBQbWtDMTJOZ1BROFR4a1VLUlVCK1NpbjliMTk1VjU2cTFaWDkzN0pXdmk3?=
 =?utf-8?B?OWJ4OEV1cEVkUzNselEyb1EycC9XOXJXT0dJR0dhNFNsZ2JxSDBwUlNkdzFj?=
 =?utf-8?B?WDNyS3duUll3ZGpwTS95bXFDd21QdldGS04wS0lmT1pvVjIzZUo4MVdYQTFY?=
 =?utf-8?B?aTJTakdndzNJakoxYThsWlM5QXFrc2V6ZFh4d2ZJNWh3NW5DVmhpYUtuWTlv?=
 =?utf-8?B?NTJ1Zk9GQ3h2VVFxcFBhNUxaUmZ5Ym9CZjFIVllaQWwxNkVPSDl6WSt0ZXNS?=
 =?utf-8?B?TUhqV0RWVTFtVk8xUW1GdGV2cFMzc0Zpc3ZIejlXUWdKb3RnQ3pYVUJza3pj?=
 =?utf-8?B?MmtXSGpUNk0yTXdhNW1SWjJlcG9DWUc3VU91VEdKMzBHdkorMWcyUU9OUXlT?=
 =?utf-8?B?YzNLYm95VDB5WmxralAvVVh4NmoxeXRNT3pZYnA3RUdEWUFFRUhKcUJjT3BR?=
 =?utf-8?B?RDBVWlRYLzNkSTdGZS9YYnY4c2t3VkwyWkJRZHUyQjJxS1E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cndXUDR6Sm5VMVhFOGxMVFBmTU1oOWRtMHdUaFlLUS9sR0FVVnVpdEdvd2NQ?=
 =?utf-8?B?RmpZc3B1TjVMZ0NxOFlCNnlqSjZkUHA3MzhocW1pOVNQSVFib1ZYZ3ExUzUx?=
 =?utf-8?B?dkJNbVhQMXMxMCs1aSthdXNJTCt2ZFZGenBFY1paY3pHR0xRendTWHFKM2lH?=
 =?utf-8?B?NjUxbU1LNUlldjRGRjJQaFZQVkx0SnVHOXUyU2ovOEpOaGJ2TjNaaVhKdDU4?=
 =?utf-8?B?YmY2Y3hhcmMvQkhQYk5tTDVOVTdUMUVDeW9KRU5qVldldnFNTTY0aU54UUJ3?=
 =?utf-8?B?VWlPQ3ltRkdNRUdmUXhQWHFlQkgvQWxaZUlxUDF0U3hTdHU2TFAzUkJnY3V2?=
 =?utf-8?B?M3pxNW90QWpMZ2U4dStDaTlaR25CZ21zNHlRSE9HcXUzT0JqR21ZK3RzWkZh?=
 =?utf-8?B?VkVoT0loWldjU2JUYnZWSWNvazlSeUkxNmxVbDNYMmhONGRkZUNadlI4RDJE?=
 =?utf-8?B?QjJLeUh2Wm1ZYUQreTNiSDFJRDV2OEVPMFh0bVkwVEQ0OTF5aFVHbTY4NEw3?=
 =?utf-8?B?Vk5RNi81ZGVpMHlIRllmb0R0Nm45SmY5emVNYTZ0YTJ5TkNweEJpa29Qa1p2?=
 =?utf-8?B?NVhHMGlOUWdsSnVFLzlBOVZKa3ZlaHhYL2ZjWTlLY0I0WUVDcC9rWVhNcEc3?=
 =?utf-8?B?M3ZzaXFkbFFMRXRyMTJRYytSeDl0QmllT2cyRTAzWjh5b1dFMmlyMG9WMVRQ?=
 =?utf-8?B?NUM0d3Q5RzY1L1BySlBIK1hGWHZHeHRRbGRLaGNMQnRuQ0N4NkpSclNaWVQr?=
 =?utf-8?B?anBkRWZBQnJGSlNtTWlxTjBPcTQvWjl0VmU4LytrMSswL3ZOOTZZZ1VkOHY2?=
 =?utf-8?B?TXJKNG1qazhzamRiTWI4RmpnQXorRllhT0FTMytWUlJIYnlEOUVZeVczSFVN?=
 =?utf-8?B?U205STcyWFRPdk1iWFYzcHRuOWhBWkJmQnA5eEdYdFVXZHp2UUdqWm5OdStX?=
 =?utf-8?B?NXViVnZyV0s4bmR3VFo4TnRRWlUvNDV5L2NIcTRrS1VFTzAwV0FQY1Rxb3RE?=
 =?utf-8?B?ang2SmtzN2ZOdXoydk1uRFRWZ0FLd2ZuTCtaRVUwYS90aXlRc3VCNDQ4cEhG?=
 =?utf-8?B?MjVMWXdaZTBodUpUc1RxVzBHNkphbWxhM2t5azh1MUhNZEpJREVsZ0xENm1p?=
 =?utf-8?B?Q0VHdVFmWjRQWnkwaEV1L0ZQVklidXdPcmVUYnNtRzBnOS9sd3JjZTgyR2x4?=
 =?utf-8?B?MEs0bmxqVS8xOUlyQ1BZWVZvNVRnc0RhZzdVd0loMmY4V3BvWkZYT0xoa282?=
 =?utf-8?B?cjVVSTVoMk5MSjZHazZRU2NObFJMUmZxRVcrRnNib3ByRVc3NUNZWEsxZnRr?=
 =?utf-8?B?VnoraSszY3VQVWRXUzd5cEhDeUhTMVJ3OFdnVHEvM1I1NGRVQzlKamFkemJD?=
 =?utf-8?B?VWIvN3NoRDhLd29qQW83WGdCQVlvQ1c2WjUwZ2o5NVR0U1ZhTk80N3NiVFZx?=
 =?utf-8?B?WnNXZ1FqZmpib3NRd0JiSFViRW12enFFcmxXS1pRQzBDSnlUdDl2NTZmam9v?=
 =?utf-8?B?Y3MxbXpKR3JYSTFtQ01oVk8wQ014Y0dYSEdQL3RHU0k2LzVLS2l3NlNOSVlK?=
 =?utf-8?B?Tyt6cEdZT3B6VlU0Z20zQ0k2dHRsU2djYnBVNWNLVXZEVkUwL2Q5NjN2Y2Uy?=
 =?utf-8?B?QjdMWFBBandmanIwNG5yc2NHT0RRazhCaVZxWWpleFpZM0czODRHTXBDbUVh?=
 =?utf-8?B?dC8xcGdGUWlIL2ZTZk5DRFNTYXg4b1dDZnJFLytseDRsUThraEc3TTRkQng4?=
 =?utf-8?B?eVcvSXJ5YUVsbThNaWptVlVIMWZGNHpBaXJ6T0xIY1dYL0Z4N3NvRzdzVVJ0?=
 =?utf-8?B?Q2FTdFViaTJJdkJHWU5wVGZPZ0pxYUptUzllRmQ4NnI5U3pucFlLUlMwTldN?=
 =?utf-8?B?QlFNL0tsZTBDemliRDFublFQOEcrRUVvSjlxdXk5bEtpK1c5MGwra242RktG?=
 =?utf-8?B?SjVxYk10OUdOYnd5aDRhRktFZjU5NzBkWFI3ZWlURnJYd3JDanN5QldNQjY2?=
 =?utf-8?B?VFJqcStxYXVod1VZSjlSaWdKWHhCeHNTM1Q0ZFY3bkRnNG1Oc1ZOSm11c2NF?=
 =?utf-8?B?ZmRkUlZrb3B0cUdHWDdyZ28xTFppTlZLcldmUjV1NWNNT3VZQ3NITUhIT0tN?=
 =?utf-8?Q?3HyRvZojqgH9q0552qRPSLqei?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e4c55af-1884-498b-f514-08dca8025e27
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 14:52:10.4126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5wWHMpuNpBoqvKKtOI5ADGIhwgDW/6k7+il4/I5JSfdsfOIJja0SoBSFaoB4DjY01BW+ShvntRlepp+2ckCdOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10105

On Thu, Jul 18, 2024 at 11:38:20PM -0300, Fabio Estevam wrote:
> On Wed, Jul 17, 2024 at 2:49 PM Stefan Wahren <wahrenst@gmx.net> wrote:
> >
> > Hi,
> > today i noticed that imx93.dtsi lacks the cache definitions for the
> > Cortex-A55 cores:
> >
> > cacheinfo: Unable to detect cache hierarchy for CPU 0
> >
> > Maybe someone with more insight can add this to the imx93.dtsi file.
> 
> Frank, can you help?

Peng:
	Some informatin missed at public RM. Can you help this? I found
it also missed in internal tree.

Frank
