Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012064.outbound.protection.outlook.com [52.101.66.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E90C3B27EC
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 19:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782762182; cv=fail; b=OsWdl9czqRlMamgmG4ugex+X392gHyLgaJ7Xi5wOnVHHygAcK/gXHTO0db5xMJEt8yx3RLfP+MsNTF2ux8NwWFgnCh4I6zlZ1gd533aTvahbxx5JLAJSMigUrCzpa5ZuT5kqjcC+53IxMFiiWQ0sMLYSdE6QP8rAAtM4NHNJau0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782762182; c=relaxed/simple;
	bh=/VMHQnZHwr/fCqcsw6TvU5QphuGa1nD8muOF6L1XJIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iGV1C9Cp6dl8NYxsdWrpzFCMK/2QqvV63OiL8Lqg501JdnkqXGNqrZ1jZ10eUIO9tPJrc4C4aHzXzrVgNmYyvjtY5XO93icV7VHvh657GZwKm27CiLCOYMopJackSIUzfNlUzx0hUseF+WidrEjmKk3NXidRiSMGbVMiqkLMVIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sEGOcw1H; arc=fail smtp.client-ip=52.101.66.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sEGOcw1H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n5eZPcdRgWnuYYmA+qQMfljHbyJQVVPOzeC1QzTQo3qGoZ8dEiD/mnAZNBz93LNcw6Qb8FuhsGDZLCe985L5nqbggSunMl+2jfacrvcRNx+rjrPFa+pCwyTPwE0wBZ4CGCxmy29E0c09oApOeheuOa2Y85pUjjiSN1Nno5EcqELHhCfOUc6XXreRIg7XrbI1+yMeqfOhcMwktRp66+wuwoNUkFGrR23BmaTTlMLTl/tEcH5aymwnHHGGshNIrrl8ZuZrQDywVU7gX122yXqmbip1pCC2nbn7dtAsgjC6UAhL57/x8/pli6Abe0G6hR8TCUZXIZifWtKXRRK14OzlEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvlzaCqpVLCbWUgRpLFNAnrIX/zt2UpvSnovWzGYDjU=;
 b=pzEPENXIUuLCr/IJkZfaiOunM4JK4lJM+WFXy72zCiU4J+VOOdQtzocjw4Li58DIesP0to6A+t644d00htR3qh0aaT5SjwEMHDX13oAku6QY6rMJWek0ebt3f/RoJ1C6EcEyT2CTH97l1kI+POagE2hGHqtNl0abKk1SJ0OcNIFtBF2ihAG7S26rQIQ8bn3NerBnUe6dWGJwQKPdy0vvHwa3UgazDNRHv63ZZvZcWc+H3DXcfNZKa1MVZ8bOpRirkBwBmIfuI16lqLz2JoEhDE1fsJiDe11njJeplqYcT0duI/6DKc+BOtsXhSOZTENNRM6s/2XL1Vwlc/Z7JGMO4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvlzaCqpVLCbWUgRpLFNAnrIX/zt2UpvSnovWzGYDjU=;
 b=sEGOcw1HmxbgXS/SyoxGGC0bjjjo+z9OH4PUOpYxklAtOhdX2AGH8dcUbUvrpGYlsBFVtUmJo+DvtVpRHVbSymXA+eaFhuXn/f3siagxMEwErm0ViePKazWOlq4Y907+jCyJuSZ7+vBd7V+I1QHSz6NiMHLiPQ9bowDe5g4rZWj9uVP6RXcYZ0nKt22y5hUDHTuq+Qn/dCzUmUFfnmBDrTkehbPLaH8xcuh2+qgtI5rJ69nyQ2QMxPw5l/oOgilH/FoFUqPNxUdA+0rSK+0JtQWZ5TVyAG6g0tLZztFJQJSELOsq4yeFPaqL/HD4LgiHb0uwq2ED0jRRVI2GmevIYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB7101.eurprd04.prod.outlook.com (2603:10a6:800:12e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 19:42:41 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 19:42:41 +0000
From: Frank.Li@oss.nxp.com
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Aisheng Dong <aisheng.dong@nxp.com>,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: (subset) [PATCH v5 0/2] media: nxp: imx8-isi: Add virtual channel and frame descriptor support
Date: Mon, 29 Jun 2026 15:42:31 -0400
Message-ID: <178276214766.2429861.1950641421457268519.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521-isi_vc-v5-0-a38eb4fcd58e@oss.nxp.com>
References: <20260521-isi_vc-v5-0-a38eb4fcd58e@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P221CA0079.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: 37fd557d-a144-48d5-6314-08ded61694d1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|19092799006|366016|23010399003|6133799003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
 sfHLY+BIjhGAr4H3Tx8STBgC2k+b4PtmE9x2JFImsesY2DkQVvp9+VcuP4vLSWm4e31akV4zU6bbfO8Amv32hbEcex+zU8Zp02Y2EzQfB7L5bqhJdVCz46qlhNBVFgRW+Ed1W5dNpLRRzfwzk7jfBv2XoPugLuanQEHHp9esljKGhfTdVx+U3tN68bIM0EqjnRcNfBmLEk+blK24lWDUXmTl4wXliZxnNsZ9RTo0TJlndvbMSUz4YRp+45pkGeKYu67zOiSjO5QKF+LLPvLDZ+UJofAFi1ysWqSsQrzs5SNBpAY2/ww627n0nBiCNL/HJYRjGyC4EO7IRp37YXlUg37WLBs9bAbesjuC1ku6aK0Iw6g+eSFU5basaj8kHkBR0GNyF/PiFbTpOVAwGqO+EpZfiW9rQhaB3RAFcXmcUPrfJjWLlkmsdB9x/09/jiFmTklQEOLfafb9VBEugQBDlsaycmR6R33Z3OA435Sz54vaY7nFc2F+FIxV9HhkT1m3rbc69ZfN3EF5Ps4gJyem2b/aV2t1wqE57tLScS3rtYQ2maVNul/uF2VOEiyD1zq8P1xTEkr3hDRU/hZC81n0LBiCcFSkRGyYsXmsWyxzX1nIqXwclPDcPdCWcl30n+gxmmrCU99NMTmzBDMTd8hHpRDGskTIVuSYUdk+bqVaOTs=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016)(23010399003)(6133799003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bjVTcEt6VWc5c09GN1M2aFRWUnNqL1VrbTJKK01aK1pXdE0zcG9ZYTBRbnJo?=
 =?utf-8?B?TUNVVzliRGp4QTZsRWpmVVppb3B1T1g4akUyT2xOZm5HUUN2Wmg2Zm90dXNB?=
 =?utf-8?B?SVRiUk1NOWlseXB3Uk02QlFQM1U4YWFRMHJaNU52cFRrNFY5MVBNWEdtbjBk?=
 =?utf-8?B?QXV3UFduRzNOa3dMaUNZaHNCZUxXZExraktVWmgrUUpiWUFwR3NGb2s2YVJZ?=
 =?utf-8?B?Zm9SYkdaSzlUR01ianB4R1RieGJSV1ZNeHlwUFVHYTV1bjZXSksrWERDTUZJ?=
 =?utf-8?B?WVNMUGNIOU1ja2t3Rjg2b0NDRmJ6cm5PVUNWSjRQN0tzOGlzTWFIR3c0QnVH?=
 =?utf-8?B?Zzd1WlVhbFVER2J4OWpJNC94V29hTXlMalBHTnIyTis1T2F0cWZYTEhWWE9P?=
 =?utf-8?B?ZWJpa1VOK0FKdVBPUWJhaHBaQzlEejFjMWV5OU5NaGZqd1pMMHZaTzBjditW?=
 =?utf-8?B?RXBGUDFsVUNERWF2ZTc4RjdMVUhRbHk0THRuUmFiZ0hVeGh5TzhaUXpTMWsx?=
 =?utf-8?B?SUwxeWQxbHZCS0dCK0xla2c0OGpqQUZLYkZ4Tm1wZ0p1ZVhLS3dQdVFQVE5l?=
 =?utf-8?B?ODQ0eFpmY1p4YnFJNjkvVFUvQjlCN3lPT09ETGJzQS9TK3hYcFBjTFZ3NDVD?=
 =?utf-8?B?SnBVek1ndUlSL2JVU0RWdEFiT01SV2RsZnprbXpESS9BWEpKczZPQUhDWWVv?=
 =?utf-8?B?QnhxbjRSL3FMeTdJTGN3UGtSL2pXNWVMQTErUnB3blpmRFJPeGZPSGkySlFP?=
 =?utf-8?B?aHp5UCtrdTEzNE1YNmtIbmpqRmNjbUVCWk9EeC81VGg1NnB2WFJDOVhEMVNw?=
 =?utf-8?B?aGtDbHNjU0RseG5rN0o1MkZOQkx6ZkFUTzErUmlZTW02RG5aN2F0Mi9HVTRt?=
 =?utf-8?B?N1RtOVVXMWZWVmRBalNZMUZEQnl2aXFSRjdSMmt1OHI4YWRqNWltd0RQNHFI?=
 =?utf-8?B?ZndHc2ZBK3lXWjR5NWI0ZUJ1TTN4MnByUjdzeXlZREptR2NDeFg5dlRTWWV0?=
 =?utf-8?B?cCtmUGRUbExXWkRMaWxXb3JwQWQ5U2U2c0lhUHZqR2d3b0oxbFpQMU1YREJV?=
 =?utf-8?B?ajBGWTBWWExxeUhxUi9sd2ZwVGxKbXZEWStvY3Y2cDVnNjRWMmZmQ3hqcmJN?=
 =?utf-8?B?Z1hQTmsraDA4MTY3eHJSZXRGMGhKN3VUWHBBTyt5aXJjUWw2WmtITUZFWTBo?=
 =?utf-8?B?Sjl5ZUpuWmNlM0tNNFZma3YrbS9ETit4dVQyMFZkOWlseU5NSkxFRWFPeTFN?=
 =?utf-8?B?TDNxUE4rVmhZdjNwRTAvV3orNktTcjNPRC9iR0l5SDh6QXc5QTVCTmNtd2NW?=
 =?utf-8?B?Z3Nnck45V1BpSldhUW1XWVpTaWl5bUdpanJPKzlqVVhFYXdWNU5tSHdlQTR1?=
 =?utf-8?B?MGp3U0Y1aHhyMlFCVko4dldSMk9CV0l5QVFHcjFuMW4rYVFCR01vR2ZiaXdw?=
 =?utf-8?B?cVkwVy9jUUpoRlplY3dRMXhQOC9abDdsUytDdW5uR2J6WnlvN0xuK0lwR1p0?=
 =?utf-8?B?NzdqZHBIQjM3NENVUXRTTTBTK2tWNlhiRFpLdUE1Z1FKeHVFQWhXQzdGVG44?=
 =?utf-8?B?TVB1YjhkM3dHaTNVQTVUUEkwYW8yYTUwTUtOc0FLY0xxUEJqK1JteFFrTG1s?=
 =?utf-8?B?TlR0SEtIbmtFK0hXeUJIWGkreWE2VW51UExiNVhBbVJtQ0lpOW1namt0RnVM?=
 =?utf-8?B?YlU2SmlyRmtldWFYYXVIdnY1UXZOalk1bjZUZDFkUlRsYWdkL2ZRZitTUGRQ?=
 =?utf-8?B?bmw0YTNyQk1qZ1FmTnNIb01BbEpLKzNNN2R4aVNFZGZtYXg2cXhzOElFeVpQ?=
 =?utf-8?B?b1hCcWJ4encwMnVlSXJFU29ueUc3VjR1Qm4zQWdCV1ZNSkFUYXRtaHpxOXBY?=
 =?utf-8?B?QnJQUmV6U2V2MjhYTFZub2kyZGJVMnFRRm5vSnAxZFF1Tjh1enkzMVJxOEpW?=
 =?utf-8?B?eTB0MmQ1c2NjZSthUVUxcVV4R1RScStuRmMvMmp0cHh0ZURtbFZvelNINjdt?=
 =?utf-8?B?VUNaYk53eklZMFdNdkNIMUNQSU94b01CeDdOd1BpKzFCL0RVT0hnaERiZUtE?=
 =?utf-8?B?ZWFzQ1pnUnNZeStaVnBidDE4QjFTRytQV3RQdlYyYnl4VzhxUGcyanpFcnBu?=
 =?utf-8?B?MGJjbnhPOUYyRlZ0Yit1T1YxVlhJNWRyVy8zNkFFNytzV2Erdk1LeEsyeXQ3?=
 =?utf-8?B?WVc2NlU5Q3V1NjgvMENOUENjdklaSGw5cUZ2RWNNMU8xSHA5NFZuS1hiQmRj?=
 =?utf-8?B?SDBmTkppdXNBL2tpbjBxcHVsV3dMNkpCSGU5R0tkRW5UUmxOWkp0SVdwdTdu?=
 =?utf-8?B?YWZtQ1dxZ2lESUlndHlhL1ZpQnJkek9DQXduK0V2WnlMMDFPd2QzdnNxMDNx?=
 =?utf-8?Q?fq/oYO/+uFghLBYxNPV/g7+VpywEWNA3zsgGF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37fd557d-a144-48d5-6314-08ded61694d1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 19:42:40.9425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yDzS7ISxw0ZO881f/XrNmAAaQ9B7nWGLPMgr29mRXB7M1tOs6hxOc0oi15vmLwrKLPIt/iZR+FBvso3tDEz/UWTBBcS5k3bF/DJ3HatoZla/4UDaYKESxbfGuqS8NEIc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7101

From: Frank Li <Frank.Li@nxp.com>


On Thu, 21 May 2026 17:10:03 +0800, Guoniu Zhou wrote:
> This patch series enhances the i.MX ISI driver's with virtual channel
> support and adds frame descriptor capabilities to the crossbar subdevice.

Applied, thanks!

[1/2] media: imx8-isi: crossbar: Add get_frame_desc operation
      commit: 3e15a3510908c990ee352aa206d5f9c23d4b216e

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
