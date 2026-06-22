Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011006.outbound.protection.outlook.com [40.107.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA90364943
	for <imx@lists.linux.dev>; Mon, 22 Jun 2026 09:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782121632; cv=fail; b=C+JpSgVSclL56RHFdrkNn7udz0SKcIDl1x+QhlW9RkLbh2+aVw2JvFjS/4a3ckO3b/KqtqYH1Lo3WDuGqpnOhXXgUv9YucSbidNl4KLIxEP2VU4qDNzvDLxlYZB8+ri7AngxsWkfCs4FI0+0fdl9NTiM+vSkZihvLQRyByCwYgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782121632; c=relaxed/simple;
	bh=tj5wTDmvC8EfDtoV3jFH/6yHTJ9QBY7H72U3ZcLK/G0=;
	h=Content-Type:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-Id:MIME-Version; b=qt9pafxxnw5eCoijGFzmTgU0CIxHgamPD7Ij7jGbO92bkeZ8I1z/IcWAyHLP9dfAdUQI65edmBwNGGTP1zlbLrfvU/BJNO1AXWjLdaY56DS94S+OonUArp94SxGDWRSnhWmeY1E2Q7WgL3pgW2qSl5NIoWCA7Ez7mWKId8YEVRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fbNfDwOx; arc=fail smtp.client-ip=40.107.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fbNfDwOx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ad5t12SsI6aLlKPMGxS2NQcpEjtA9SlH0Z0M9vNbtQEXbeZ+Rl67vmVJYeux2bn3408GjMg2xRp5hA5XvEiQIEvb46WPlxbn+782APEHwMh5KtE2WOiHzrRvQsXE3AWeVlxH02eu+pq+HflqBVjWtXuEVNe73ZQXQd+cl5wGgymMbNXB39CGvuULjyMPvhjNWfr3W3LMHd4PfEtnwsktxuxMu/n+ah1TVdXKauzODp4u48jz40RfIZHyZyXAN9uYZAOKXTZUkGV/EQvzsftNbbaDiFcEFOHVfMsBlqTCryo4xuN2H/TQ20Qp8WBry6HDBNeFDJcR2Ynh09c8ZFAEKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6JdPaWl+53YAxFhYqmRCWXgsA4rJ8LVl5GSZ9HSrZs=;
 b=J9cAugS5Ddw0453bigtJk5w/aau8BpFPKmgv8BWtxho7WwfY0t2moRowVsvB3PdekqYPQLO1+O4WMaEoRZx2RmE22YCFfaJ/fR46V3tD8yxKTrdIIXaS6YrpUsP7vgjr9SlSN7EpUVUBSQ9e2RY3OaLv3yazbA1HJWdqG+ju3LtLvUjtHX7FHj3vt60Rpqconcw5DxAW49qjUjdHodqAcTINPzWF9hR3vp/13xQ9bTushLUHpf4srzHjLMcMnAjM296w9U4v95Hh+LosjzTvEx9uFqT/FomQ1n4XFXcm+e3GaUMjCQU9DlF7UjYheKSbqJZASONPEAyimu2Cy1v7CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6JdPaWl+53YAxFhYqmRCWXgsA4rJ8LVl5GSZ9HSrZs=;
 b=fbNfDwOxJG9qnSYAmzIimU03D0Y/GmexZU77AiEPrQ+Syy471bPd6o7CPeCRhZUndmewvTS9WJbOfZZ/chXbBE5H34GBQ58shLBG7h++w0Gv0K6Ax9mPT4vWogV90HIgmv2SfIJFj429XsuP2OrJnvqqoLa1UCusuTyditkcOlOiilt6FICf13PSOtbrcNOHbgrGOXpYDZtNZf5YF6yPfS7+RyGS+GEea3+eFEofvS8+pu6wWSv0klswmvQ6WPZ4JYCKyTtn2SOKJiqiFevMvw0oQyKW8OOD8j72FIWOeSmTa1KSRcaKwIj8d+wHbnrGoGsNYvHjpPQUxvJJQ/JyGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by AS8PR04MB8724.eurprd04.prod.outlook.com (2603:10a6:20b:42b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 09:47:08 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 09:47:07 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 1/1] reset: imx7: Correct polarity of MIPI CSI
 resets on i.MX8MQ
From: guoniu.zhou@oss.nxp.com
To: robby.cai@oss.nxp.com
Cc: p.zabel@pengutronix.de, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
 festevam@gmail.com, krzk+dt@kernel.org, andrew.smirnov@gmail.com, 
 kernel@pengutronix.de, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 aisheng.dong@nxp.com, guoniu.zhou@nxp.com
In-Reply-To: <20260619073115.3778313-1-robby.cai@oss.nxp.com>
References: <20260619073115.3778313-1-robby.cai@oss.nxp.com>
Date: Mon, 22 Jun 2026 17:50:22 +0800
Message-Id: <178212182278.110038.98055754053534783.b4-review@b4>
X-Mailer: b4 0.15-dev-0e760
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782121825; l=253;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=tj5wTDmvC8EfDtoV3jFH/6yHTJ9QBY7H72U3ZcLK/G0=;
 b=KJtI4Xc3egRrkYHdmPqqIcfdcySsg7CY4Nsxy8rUxtOLR4IhsWdNHKwXjWV4axydop7IxScsh
 ONxABFiPvcsDQYs4t/+AtqBryWcyFhmMRNrn00+YXqfi8GeugGKrg70
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::6) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|AS8PR04MB8724:EE_
X-MS-Office365-Filtering-Correlation-Id: e2dde627-1ca1-45d4-159b-08ded04338d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|23010399003|1800799024|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ZStDxcFfWS8p9BLGaQkQ1WtRXi4SAlM6mY3KUHN1qmSGAe1JlsfZm+JgAx+SBf0oM7U3xqzzZrZxMVIH078IZNkuojEe9iFOvhMIpBb5IdCjRFnAqpkg/18jV7v7a/qTHT+9VcY1PG8MMfHUFZQNZbRD+26MZ/CAm/Ri/Z89J9hDHlViapHdpfYU8+n4mLidMAh2RAae64DRtKw8lDE3UuN+1KbFixTrlH9xAK+b5WsZPfysk8eJbKCaMAPvzjUD9q8RgsNx5Tz+SLR9ta9VoFrF6PaHgoXOJDCjMu/+e6ZnYz3U2IeeyoVinqpNvAJqV+bSHWz2dnd+WBwj0TX00ejVc7oRXxNpTgkuQuU5i8WKrzkwuqTQ+43FjoB7sdi/5reSN9RkwC0B7z6B6fn+M49E35+g0rTkwJKd1lyJRPrB9WNWlV0wtvuBoqKR+tmVMNMK3LgVJcqCLGG6AToUnXerxgzvDISidU3to6S2zTp8o6uNrAHb3vvq8VTarLm9BykCPymi3C1/0qPEPHDvQ/duy4Dvdh5JZtZ8Eiu7qEi3UUTzx8WFhrj0e5tPkQJZFisUeFLu2xv6uvgD4lRcWCuvGYIfR9nU/pZaIj3znmxSDRpLdTXunExujDXPfT5qehv/DbJFswuYO5R0MxgD+AlJWk0zae6M6pqpKHhDG5U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmtuTndtaHJjek1ZU0xSa0FRMDVTQXBzK2pQQ002OHN5WDFJVmw5U1NOWmtm?=
 =?utf-8?B?ZVFvczhQS1RkcW9uU1ZTdGlLRnpuMEdOL3FzVnJ2Ulg4MkF4VjNBbGdlRjRr?=
 =?utf-8?B?eFdmQjdPWmpSTVZLSXlDR2VSeUlocGtsazhLUDlzT3BmNENCeGJmbjNDRmNz?=
 =?utf-8?B?d2VWcnNNcFN5Yi9UN09PVERHSmhGNkM4eFNDQ0Y1VndNUkhmMFp3OEVWblE4?=
 =?utf-8?B?blkwVEhJTENXa0ZUeU9GZ2hMRnF5cVBidHZXcGtFRGRvSUlFWjR4L1RoZ1dE?=
 =?utf-8?B?OHVQWjV1R255Y0ZjcXBpVWZLVW5NcFYxcVg2QXZ2VEpBdlFJdXQvamYvaWRv?=
 =?utf-8?B?SVE1a3BhNm16TDFYcUZXYXRjdUwxT3NyNndvR2VJTFlaL2RrMWMzMDFDMnQw?=
 =?utf-8?B?dGZnejN5aVRmb2lTblkzUHFwNzhZTXVqTU5COFFPdWN6djcreEhjZXg0RzZl?=
 =?utf-8?B?YUFsZGtmNWZOb0svQ3RSTVZ2NFdNSFBhTTlFOFJhZnlFOC9BbzhNYUlCSkhR?=
 =?utf-8?B?NkVIenZxOVpnWnprZkhKQ2tFV1o2L0FRZzkxSHdVY1piYnQ0dndtWXlmSFVp?=
 =?utf-8?B?bnRCU1VPaGR3TW0wQTkvOU52VVV1VlRzWDlKZTg1MG1WeGI2cjd5UFYwUG5x?=
 =?utf-8?B?R3F2ektXaERJa1A2Uys3RThQM2pHZ2tMOXFFZUtsbUZIZkZ3cGdJOVBjWUo4?=
 =?utf-8?B?b1NldzF5UVd3MnR2THRUbjdMQ0NqMTNGWEd5RHgvYjFQc29odDVKNlZUV2k2?=
 =?utf-8?B?K3Q2cFpWSjJpclBwd2FKUnJTYjM0cDVnQ2gxQjlkTjI0RnBYa09VREFlV201?=
 =?utf-8?B?TE1PTWMwb0xRL2RWKzJKMndFRXhrL1psZ1crNHdpUzJ2WlEvcXRlbnBGdGlI?=
 =?utf-8?B?ZXVIOWtaR3RMM1VKV0t2bEdiY1JDTWF3NzJZYXFrR3N3b0ZNbU1ieWZhMVNj?=
 =?utf-8?B?d2JNTGpxVnEzY3NKaXhFSXZPdUxGeHZBNjI0VEt1V1loYzIrSDBtQVNscUh4?=
 =?utf-8?B?Qmxsb2RYYmFld0pjUmE1SWp4RUR4aExzY1JjaDlrQkJxRlEzYWhlcnRVY1JN?=
 =?utf-8?B?QVp5cnJXendoWnJrM3E0LzZGRlFpZnoxVEhDVnhuVVQ5TFh3cG52SWRkZXdy?=
 =?utf-8?B?ZzFsNDZUTjVDby9vSENVTkdYQytrZ3RpL2xXbUQ1VXdnOFhEOFlsNHY5NTl3?=
 =?utf-8?B?ZTlmaGNWaWR0Z1MrN3J6UExZcXdxZWU3ZzhJaGx6NVJDSEtGUTdZYW41U0tY?=
 =?utf-8?B?WFplbVhBT0h6TEU5cURpWFhkazdLemdkTURWNno3S1VBNWpYcXlhK3NIa1c2?=
 =?utf-8?B?RnFhUUZMTGU1OG5UM29XVXNINzZjcFd1Z2JsaWlQdHRoaCtRTTNOcjRrTDBr?=
 =?utf-8?B?ZE1rU2pZdG12RGNMbnR4NlFsK1B2QkhYUENVZWxqdmg5WXZ5UTZuQTZUYUxW?=
 =?utf-8?B?VXhFNGh2eTRGUzVoOFdzcDZOT2FjblBmUElVb2J3MGJJQ3pPWGZ3MGJJREh4?=
 =?utf-8?B?VGY3bEFoQ3dRZUI0cWRXUUgwUE9XNTNRa2V4aFMycHJVaDhlOFhReXZQeUVz?=
 =?utf-8?B?V1FzczJLS1lDdUJZMmh6RkNodWJWSnFKTWZJbWJacTk0RkRQNkNTb0NrTXpC?=
 =?utf-8?B?RlBjTG05UWdORzF5RkN6cGRPeUdmWUlaRmt2YnFQQkZQaTZLQm1ieWIrSFM4?=
 =?utf-8?B?TkY3cTB0aEgwZGZwdjJSY1JFNDFHZExvWnh1bTI0dFVGZGFTV0RnQlpwMUph?=
 =?utf-8?B?VVg3NU1mczR2eHpvdS9JYndVcmorbExDZHoyQTcwcm1TMFRMS3FQaDIwU3l6?=
 =?utf-8?B?d3JnOWx0VEdXVmUyNzUvUnZ2clJzM0dTOGNsVVMvZEJOWUh4WWpOME41cTRE?=
 =?utf-8?B?OHdML1crN1poeEl6ZExmelNGTlVhNnlxbjVwVjg4WkorVWJENHVnRVJidjVN?=
 =?utf-8?B?ZGxmakdDVXh4NTBFa0E4YXlPeXQ0QzV2TDVhcjc4bWY4bkNQNjdDejBnUFhp?=
 =?utf-8?B?ZHptU2FVUndFOUltM2VSTkkwampiNGV4eC9hTTlJdVRab0IwMGNJRFRRTmdm?=
 =?utf-8?B?T3BYdHVxRWI3a2dVWTBCMHFxWUpWV1djUGY0Zzk3bGJ6SExuSVRYbFFXOTA5?=
 =?utf-8?B?NG43MmpINUhEcVRwY2FQVHU0Yy9Sc25WSXUrWWwxcllET2IwRmk2R2JTTHNE?=
 =?utf-8?B?TFh3Nmo1em9BV21ZVTFQVEdDTHQrZ3RjTVZuMFRSLy93T0dTK1FlV3MrM1ZL?=
 =?utf-8?B?TXhVWVdhWDRZSHBaeUVmZkVrdTVHTEw3emxwak1WVlhqMi9Nc28xekUxZ01P?=
 =?utf-8?B?VFlhdkxYcm1ibWowcXg0WUVIcDBwTkF1bDVpNGhGanRNbk5HZjJPY2plY09K?=
 =?utf-8?Q?k83yO+DbUdk9bcjlFjaE4tkB7SxZ0aqebY0pK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2dde627-1ca1-45d4-159b-08ded04338d9
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 09:47:07.1932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQ0y/IL9o0FaRpsAurd7JYM5WbI+LE4GlgTaCQjp2u2hyVy1AGSjgYWKdhwlp7EGPTSnL82I39PIMlrDddJSAbx0N2FtXJptWJ6LwWrAuO79LUh/IkHo9xSd1CfBnNjt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8724

On Fri, 19 Jun 2026 15:31:15 +0800, robby.cai@oss.nxp.com <robby.cai@oss.nxp.com> wrote:
> reset: imx7: Correct polarity of MIPI CSI resets on i.MX8MQ

Reviewed-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>
