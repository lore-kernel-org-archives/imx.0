Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013059.outbound.protection.outlook.com [52.101.72.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBED83ED5A3
	for <imx@lists.linux.dev>; Fri,  8 May 2026 14:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778251453; cv=fail; b=XMOxuxSXxs8JpRD1ZylDNvAQAXYOOnjfiXDP6aGxO1dj+5UsMdTs8y8zifXLG5rSEhzkXT/LtN6ug4fPZOoSfHfuas2WOK3GrWC9Fb3lxccLT1dwiIDYa7lEQNU5GkEED826zXD+ePO+jCPLPniJGDCaI9B0FF/L1q+GYEjfgw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778251453; c=relaxed/simple;
	bh=nn0DMnVnkCqPn3bbsbckS9WwWOkHUlHchzW0n1J0zPg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=RgsKtluBaB+OpCfxJIgP89s7SdiWJUMDm9d9KI1pT68nmV6zZGWiglxnT2Q3BXvbsP9768oXCbFHohzj8gBIDtdQReX1fQ32kbpMmYgCF7In2NKw+Kqa+XN0InP424lvfuW5NsmfS96QYbcmTu5hgQ3+Ouo9Ws1okw2JrdbRjD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gHJHaRTs; arc=fail smtp.client-ip=52.101.72.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gHJHaRTs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T3Sj7/i/9AI52DNtT4oDwcOo9IyTEKrMQRJUI5NDPXBn+YgmHAbxK8k4IrE0BEOLDshOMd6Wp6ZWzPkH0mD/74ScjWXeDreGX5wHGOIN1DJiPK10oMSeLR5Vh//0LEwasBIxoHOzocmBkxY0/Ob30G4YldbAk20a9ffmUaZp+VuLzAIyMnk8Sdrdbx8gVcfRmy9IbrX8OstYBGhNrTymHRMp3sbncqdhOQtvLt3XApjTKR+puElMH0RHJiDyIQ+K1ptgR+3FCbNopAvRJEkC2vKOsHnCOqXpHb1IbXP3KYRp3ZZm+9iViPUF/zkE4lwAZBEjrlRgcU1RJ5VKQ1wWWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R4TcyruwXX9JyQhUcTSh/nDhNty1OTNBWJd3J+mp3O4=;
 b=RsSWsNrEbd0nwUvLg12D45Yj9G1a5gxpfuL2Q+RSQ6vTvbzLWD0HoWHuQXvd0F1ixtmP61KSTenwPB4bINYLVmwb6o8czypEUIh2dQzo4I5PhGPnIWuePi14nYWKgP8EMYjjxffvTW55/vaKouzmg4fnhx/NAKHLn+yaeCMIrjd8ERuycQhLyiRYlxCkEW1j/fIhviSWyi8vQ7iCQ7vLuSm9/YD05xFKsoTrqGtGmdbON0U6xWKsNC2ud7oMjpYARI9v0bzRsLAvp/1k5wA3U1dV/Mku5/CXzNGeXk4StiJrDMtjJ9wrOKDKKCxTYCCI6lKF6kIGAidk9FmcTBN7uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4TcyruwXX9JyQhUcTSh/nDhNty1OTNBWJd3J+mp3O4=;
 b=gHJHaRTs51NIBh8I/OSosOE3lEhMWsSyKOVzZ1NH2J0GrWA0GFaRlAQJ8wqrSyL2A+9hO/2Bj/Z/X56RHNBcM/q9GMtQa4vJ4l7GZ3E1hww31of7wr+f1jctnBCYgXwih2K4M+2VuDeBE+fV/EggDE/Obg8CrGzCT4eM1H7GV5BR1igNiV38J2UMuqwxPVLmDGhK2oxn7ht8NL+oDr9fPRdKtgMHY0pnEUCZJdL3uuADAg31zTCWSswE3Bx6LDOVH1QnFAP0yXhlKxkxPrzl+abq6+Xfda6mARBIzzX7IM7FVYIvkQuAr/gc6BLuJ8hEs/anQEODRag7WYvuKZfKfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU4PR04MB12149.eurprd04.prod.outlook.com (2603:10a6:10:642::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Fri, 8 May
 2026 14:44:09 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 14:44:09 +0000
From: Frank Li <Frank.Li@nxp.com>
To: linux-kernel@vger.kernel.org, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: frank.li@nxp.com, imx@lists.linux.dev, 
 Dan Carpenter <error27@gmail.com>
In-Reply-To: <20260508055945.1840814-1-pankaj.gupta@nxp.com>
References: <20260508055945.1840814-1-pankaj.gupta@nxp.com>
Subject: Re: [PATCH -next] firmware: imx: secure-enclave: fix list UAF in
 init_device_context()
Message-Id: <177825144745.3470522.1559513343071218259.b4-ty@nxp.com>
Date: Fri, 08 May 2026 10:44:07 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: PH8P221CA0036.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::25) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU4PR04MB12149:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f10c5eb-6f6c-45af-0812-08dead104301
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|19092799006|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	0Zk04PK/fk2RQfHfBaIyQjc+/1fKhbzfQRrx7XrYwXwdGo4CFljnZLLBUEu4AZMlvt0cjpsaHUNuKWFgkQOVMERXCiC7o81x8078jwvorpil3tzUZtCaJkXDlwo03OQgwaKQB82gAo5F5MhuDJ3Kvm3GCbN+0QAhpsV3qWlIEn3hPlOeGRCw4JuEh+rWDFnvrZkpQypSK27mArItbEbuei5UmAlP1VMox/aqAACcnSx5G4O5ro+IHcBOY0/mcsypljLQ86eCHRm8RsQ2py31j6+Pa1AB23iUTjtFWLFgub71bw5zgYT7oozrwCNYiLiQqan8w9POD+aj1mQGKW5DR8jGRxemfRAUSJOMfjq0Uza87i8dUzKoH5EBDzzjhMISc3Ju75h0hR0z1LM2bNCFqOoBhkopNC2/8EELs23wACp/yywdZ6E0pEf2Hw3LY1eSsG3WKB5ZUN+JSqUgCWGml0m5PmySR76Lmfiu/Zfh+YDcPc81rlCMMIOyJSuIAvy4Uo/kaX7tD+BBGsGaL08k0ye2C5dhJvgXkvNgIYcOft7RRJadoHba8gZJN6tDmkdF0Mgb/mWgsiG5GgP34C+WbqgbWrYehVTNXWTn3ULGyKP4xTyV1w6P9gLjj4Z2B525HTv+TgtlfbWV5dvo4+2I6FFQWMGdC11qadDuaZX/7u1yOyG11yix/vstxamXyiiiQUZ7yrsjjTsSqW5TSGv4TePs6m3JrfkVAPxsJeprWD68TzLIHouCpySlYvDkI3CJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(19092799006)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVRJa002bG55OTcreTk1Wi9wbnlyN2ovWTQ5am9lWWowQVhWY2pWUzJKTjdh?=
 =?utf-8?B?MzBXWkE2OFR2Qnk0ZmQ3alcrL3g3WDk0WUM5SkF1aGxuRFNDOTRlUDlzWDZN?=
 =?utf-8?B?akczcU9IbmFRVmtkaTFzWjlaWDh3RU5XQk1PeWlSZ3JGaGdCNFoybHlYRXVK?=
 =?utf-8?B?T2IxSmJld25sUFdWY2x4Y01JQVZqMzNIakZCYlZ3aGgwRTFZdHZJMXB2YlRu?=
 =?utf-8?B?cmpibmtWQXFNdytsemw0ZEtoN1lpWkhRMTh5Zkh0RTZEdlJtVFBIb1RLVSsv?=
 =?utf-8?B?UU41U3p4V1MrRzhTYkFkamRITEoyT1h4d2VlRUxweS92QmE4cm9XVFM4VmYr?=
 =?utf-8?B?QjVRYVlZWlBJdDRKVVExU3gyNFJQMU5qTG9kdVd6ZHJSWGZGb3JBaHg5Ymk4?=
 =?utf-8?B?c0dCemVlV0VFL3BEZGRVZS9MNjFSSUlEVFlxSktsVERlVGhWeVBkR0RRTCs1?=
 =?utf-8?B?Nk9VblVONFp4RVU4eXREbTl4WTlCb0JiczhuMVZEWW1WY1Zyemw3UUlXNS9C?=
 =?utf-8?B?Vld6cE92bEVxVkRuNTYxdm1EMW85STJHYlcxRFBNb3kwc1RvSUl0RlpuRGwz?=
 =?utf-8?B?QzZkUzZNaXp6cUJLYXhqQUhiQTk0dzFZNXE1eUFlOGkxazhUUkEvc2U2ZlNh?=
 =?utf-8?B?bGp6YUxvS04yMkgrVVJEM0F2SEZ4TFdIeDY1K3cyQWpRejFlZU5yQzgwTVZK?=
 =?utf-8?B?Z3d2ZzB5WEh6QlBJOHdFUEEzeVlRYTJDUXk5c284bFBNNjNHSUpUMGVHZW10?=
 =?utf-8?B?T2MwZmVFWjNFbTdUOFptbGpjRVZReFpMTE1mbGNIT3c0aFNwU2tzVkc3Kzlk?=
 =?utf-8?B?ZitNdkRNUGNvNlJ4elo3eDRjNDA4aU9qNXdHS25YVmV6OFNsV053TnQvczU0?=
 =?utf-8?B?a0ZVUFpCYmhVZUFELzVyYVI1emk5bzJUTlZvbUdxQ2o2VllWU1pidkRORTI3?=
 =?utf-8?B?bXlHS3lZMUkyUkpQbWZaLzBIZW9xZXkzMVdKQ0gxRkpqQUJIazdPVkgwVmFR?=
 =?utf-8?B?dWhRNmZORTEvakg0cnVFcUloaEJWS3VBWmIwc0lkeTFUQUdTY1Z6cndIR0ha?=
 =?utf-8?B?RzFDKytKMVFmbVlRTzN4bktaNlNxWGNndFhlM1J2UHNZT01aS01rYWtvTXY5?=
 =?utf-8?B?OHpnYVhzcjkwbjRueUd4SzVYL3pHejZLVktkNnAzNHdKRk4zMVZ5ZkZmNDU1?=
 =?utf-8?B?Qk84UmRDcXJuWlIwbjNOYnFnWEpFTHg1bU4rMGMwRURzS2dCTDRra3F5TXB4?=
 =?utf-8?B?dmZ4TUp0TDhzWXQzdmxZcWxmRmdFSUNnb25WMzNGak5rclV4Y1lGamRYOVVj?=
 =?utf-8?B?UmlicnJab2J0aU1pZkE1MXdONjVLbW5sR2s1RU1Cc3BCSk5ZUVJMN28weFZP?=
 =?utf-8?B?NEM3M3ROaDZxem9XVCt0QU1vb2ttemhpSkdCR2p1VEJydXJsOUpzRUR5SEpH?=
 =?utf-8?B?K2VVYmtQSWtSZ2Q2bUJFelFPZmxzenB3NUtGY3V3ZE9yYThkSXlFRmE0d2Iv?=
 =?utf-8?B?R29LQU1oR0ZUNTFnS3E0MGpob2JzWHZUUWxWWlpnRUVOUjlKVGtOUHFmRlNj?=
 =?utf-8?B?cFFBdWdXTldGZ0VFN0hCSVd3K0I2UWJHODVRVENqRzh3TXg0OHJhVllJdm4r?=
 =?utf-8?B?N1BuRi9kbzNkdnh2N205M1NyWTNzckRvNUpxUmlBdkFKRHN4M3hLTkRJR3Zw?=
 =?utf-8?B?N1oyYkF0T2FFMTVhZURQdTVwUmdzLzMxc1dCYWlpd0ltamE0cHRsWFdVZTIv?=
 =?utf-8?B?ZSthZ2p6eFZwR3F1bE1yV0xqdjErLzNGTkpqQ3pPRnVXT3FWTCtteHFySUNV?=
 =?utf-8?B?UkdzRzl2bk5EYUdxM09XQkNlRmd2dlhEWGdIbDM4amQ3R2EyWW40M3d3b3c1?=
 =?utf-8?B?SDBoNUhPUFVIbnNvRE9UVU51aUE3YXNab05MMzQ0K0VnTWhUQnp4YjYza1lZ?=
 =?utf-8?B?YitvdG82Z09jUzEvQ3VkNFgxS1A2bUErbWRvWW1hNnM0VE5mOVE3d0lBeVBv?=
 =?utf-8?B?dEdQRmhvVFpiTWZhd0l1RnpUZU45MkE2VkFIZkZkTnAxTFA5Nm5iR3Z4OWpP?=
 =?utf-8?B?RDhnWmdBNEpPdUc1VEEwNnFJcGxSM0pRMDBIQTJqVkhEZG0wRjNCVno2Uk9U?=
 =?utf-8?B?WUdvaUx0SFdFV1lZL0JqMm04THMwZzNkUG14VVRaVUJUaHZTU2czN0tFRzhU?=
 =?utf-8?B?S2dHRHZpWUlrWHU0cWEzYXBPT1pyYjF0d0E1Vm5ncFZ3bTNBVXFLQ0xqT2tU?=
 =?utf-8?B?QlV1MHpRZE1MQS9Ob0pvQXpvSGxNVjA5cGV5OUw5NVRZa3Y4QU9ucE1sMDdM?=
 =?utf-8?B?YVJLUkxoaDV6NWdRS3FveVlsc1AwRFNDS1VscThMVjlWVVNscllRZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f10c5eb-6f6c-45af-0812-08dead104301
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 14:44:08.9971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dOBO2Vfl4o8uEskNtSvPituN/yD+3e/orryvbTG/oyV8dMEdNp41K0aQR+5ty+nMbx/V9swEJVdk5WndCEhJGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12149


On Fri, 08 May 2026 11:29:45 +0530, Pankaj Gupta wrote:
> init_device_context() added a new device context to priv->dev_ctx_list
> before calling init_se_shared_mem(). If initialization failed, the
> device context was freed without being removed from the list, leaving
> behind a dangling list entry.
> 
> Move the list insertion until after all fallible initialization has
> completed successfully.
> 
> [...]

Applied, thanks!

[1/1] firmware: imx: secure-enclave: fix list UAF in init_device_context()
      commit: 66f3c3f91c48238dd13543cd428879b9184c80f4

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

