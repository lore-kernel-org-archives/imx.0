Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011017.outbound.protection.outlook.com [52.101.70.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A873FBEDE
	for <imx@lists.linux.dev>; Thu,  7 May 2026 14:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778164674; cv=fail; b=uOVvc5aNmIuFZq1gOCc90vbaj+GLv7vbJ1NLo9gnZB+JXkowfzdRqIAVTvxT5ZxLcZKYmtqN39RxrWczzwefY2g2SmdAX7VDwT1gqpB3HEAY+OdQCTpLSsJWFFPX06wVQopW35unA+Uur6ZXYJ0IzNQ4JCzvhM9VBC4l/QVQ32g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778164674; c=relaxed/simple;
	bh=n9raPtLR1QS8WcBkkX1G4r37tH9WtwFNfkkhEweA/oQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tQW01gn8CS97ZuB2eggIBcJi+eZr2vVYJyjh0tZtxixA3GQ+vMO1YGhQVRKlb0MvtuxTucKYoRaK5bGX36OLrCpsIZ6ALPgtMEf20R0soRVE+gAZ7/K1Lny/RHRa7U7pvAxXpukxzHjh7wdTPjJ94qmHcsSAk8A56DPS2jCg6LU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UrXbVKIZ; arc=fail smtp.client-ip=52.101.70.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UrXbVKIZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4G6ABtJ1jMMDWzbXmzQWprjbMD2uQRhDCfOroOtlse3hcPJhP+rPVA48DseuDZ9y6BjDays435OXGMyOMIYS1Kox1Gentbjl9C1S35rKVonnum9gVqpqNBMzsAiMPDu9zEVdKpE+H0oW/UVgJDchR9oi47DYRvu4i6/crW7ZhqlmhRsFlme/0Eq+ABeK+y6WN1GBq2iYcC7l7WdH3wvHqrrcsITZLu76LfRPoCsL4hsjhBCLYCyTpsZtnfGYhUcRKH2LBdtwqXvKPuBvd+sjkD2P2W1Jebt6LGEfZP0W9XddNNu5blxOx/26XMHiRGUagYdc5eQxiZnuK+r4ZBlkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9raPtLR1QS8WcBkkX1G4r37tH9WtwFNfkkhEweA/oQ=;
 b=BEfPn0hGgqB59UU/cxHUdKbjG5FfWolPOvGX44gbNLb8LvazFcu5sOnPcMoB/TCHBhn+bjpINOKpn4srZ9eDgGCdBFubznodJpdGRbKBBPru+5zKdRrvpQJkkK8SEuxuTpMqtfIrrWFGe6YBXQLaK/oYbM2b91i3tKsjxa30ZXLOaU5Glj6W1Z7+gcg9gxXMW9tTlp44BF9Iw5MMr5oGOlz3qv5zEbIgq7gvTUDFAN/wc5XQc6nmitR8t15djAQO/0WujUMxvMamFjYrb0/N32usV+HX7JcriUcKHJHz1AfkZbhZtnZK1WRLqEOOtgr2ww4EF4OkK8h/eIGt//nVXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9raPtLR1QS8WcBkkX1G4r37tH9WtwFNfkkhEweA/oQ=;
 b=UrXbVKIZ3/3vgAun2/EFmRIpMBM2hc/0zmjWoxWCdRMAF1/acGtS8N6PRlqAtIklgMTRz8pt0bQ0xmHuLxe5moCD4kjiCoxxf6x7Hpoy0Ynd1k63/F2qaNUCg/jL5EasIm/DzMJLWZCQj4s5sO12qy5pd9UPFenkJhH5Lp1ssUgz9NuzD68qGrWlsKDMi4tR25YHAoZ2a6/nx4oAG8j2lLj27ML+RxoAKgK8wmpCpguZT9txQZZu9YAJdkJ/kWqbHZx8Vmft6ZKrjuj3n3oK73M1CUKxYnZTJx2WxtHysI6DTmv2/OZQqUmXelO2jswHCUAuI1lKf0/PylKMl1XyPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM8PR04MB7442.eurprd04.prod.outlook.com (2603:10a6:20b:1d8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 14:37:49 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 14:37:49 +0000
From: Frank Li <Frank.Li@nxp.com>
To: linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	imx@lists.linux.dev
Subject: Re: [PATCH -next] firmware: drivers: imx: fix docs build warning
Date: Thu,  7 May 2026 10:37:29 -0400
Message-ID: <177816455843.131968.7029392453053016845.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507012917.263124-1-rdunlap@infradead.org>
References: <20260507012917.263124-1-rdunlap@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR02CA0009.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::14) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM8PR04MB7442:EE_
X-MS-Office365-Filtering-Correlation-Id: f1da5b54-f304-4c7a-c1d2-08deac463654
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|52116014|1800799024|376014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hn3IL7wEoO9PMT+Vpobxj/HHroXpDmDocaGe4lxLpjMexUCXtx1cJYfOp+0ZtTNSFPdfm6zTVXJMTvx9+IalKok65lrNd+GxBDuZ0U9iZFh92+qDe3QM8FAOWffY8thwpGMqkY13mSyZt3LqgxiCXolv+eFChofZ65KhjpwnUZnIw5FFFb2S6mzDJfp71S51rAWaJReoyBIxKnjr6hemUy6eKlERdsKLoDmjlB3C1cZIkmBuTndK/GTM4wPud7QtanUWN5DS3tbV+OXh6dw9wqVcJ6Eya3/rwVmBY7ZzmZPkRnPb3TospjdSUApJ1QT2gumGTUnFBFaBWxcSZLUlxLx9+0ak18QSLjvSFlT1mhyeW/27vCb7mXBck71BZcvax5pqncFlrwzk9MZZP4FxLLcEgNqf8l0/whMBDey5Szrn//ED8Sj8d9w0r9Bvgh7uBXnCYnO7ZfpZQmBYBFGkeTD12ztgIP/uf4KfpDb88CD8rGBgfnIOM7Bx48IK1eTWLwClAjSNh6oCHMeUH5McpbjtBbNfQM1CUoFVDfAiys0QBfagrU/JK42VPQhPNlf8H40vQO40/abQVl8Y3qH0exSKXF48epWCevjwutK5Si7JcrKnkMAhNGk1SmFRVTvz9hcuysqQ+RUcHpr6IegBu4vSVn0nzzvtChdnJAFYffR8GPl9dujiNCF3U9ShIClGqz9iYhkV44BZTryg62Cr9AIZb4vM7Vlf1KVw7XxtucregQlgdjR+KDq1YbLMMkZ8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(1800799024)(376014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGdCQmdYZ3NPSjgyWko3QU8wYm4vZ29NOXdFajFMQm9DbHZzd3J0Z1ZlVUtz?=
 =?utf-8?B?c1JjUC9MNTlOWk90cXd3eFExdGlZNm1Gd3JjZk1sQTMxNUNqM0VvWDRKc1Vm?=
 =?utf-8?B?THFQUGdObUgvYVAwd0lhSTZRcTgrdmQ3V0NLK3FVMWRISkZYS3BTeW15UTNo?=
 =?utf-8?B?UDRrS0haRkI5ZG96ejZoY3ZPODZSVzNwY1RUa1BOdXRYelQ0R0hpSXJweXlw?=
 =?utf-8?B?dlhWakpva1pUOGxsSlFVN3NnNk9PaTY1OWF6OGk4MlpEejlSOHBjOWp2SzIy?=
 =?utf-8?B?a0x4Nk13WFFpN1F1dUFQdVNybkJkYW04QnBNUUdQSkozNzUzS3R3NkN5d1FX?=
 =?utf-8?B?T0RGU25NNytvTVBZWjdUQi9kWHpHOGtVQXVvczhnbzUzSTU0MEVWdm83bm5O?=
 =?utf-8?B?R0gwdW9YVytOekVDM2VuNGJEL0ZWa0hLUGpuTForS2k0b3Qwd1ZQd2F0U0Rp?=
 =?utf-8?B?ejk4d3crM3Fwc09JT05qRWhpOWVLOUJaWXV3Ky9NRlQwZ0tZWkpiT0VOMENJ?=
 =?utf-8?B?SlFzOVZjcDhpNWhGLzVjZU5NaXdWWWxrOFRvYmVwQ3J4dHZ3Vk81ZCtDZ0Zo?=
 =?utf-8?B?aC94SHE2WWFxR1FNUUNUY1YvaVA4ODBUR3JiREdPenUxRFRwN1JnZUlOM0ZP?=
 =?utf-8?B?eExCWkRVTjY5cDIyWVByZ2daeFpnNTIvaTBnN1hoN0FmSG5TcWxHK01hajNY?=
 =?utf-8?B?WVVUNlZXdzJUejNDa0JCMGZTWWNNT0ExS3ZiZUFwK2VyWXFXZG96SWo5OHRm?=
 =?utf-8?B?T0x4emZ5aUI4YzlZN3BxS3oycENEdkhJM2xZQjhpeG1SdWdUanBtQVFzZ2dh?=
 =?utf-8?B?dWlhd2Z1LzNQT0JTdWxrR1NzTGx0cGFQSVpZeEVic2hIbTRnNExVSDdRWkxF?=
 =?utf-8?B?bzV0REdTL0NyVU0zV0R5aWNKNEVhMjV0TWtlTXhQRVB1YktWQ1pqQ09nYXV6?=
 =?utf-8?B?a3RQczB0MWRIMTh5ZWFJYUliWHdxNkJ4Rlh1S0htbGF0NU9NVzI1QWlaRzZ2?=
 =?utf-8?B?RkI4Y09DemJTZmZPOXRxMDdmZjdkNE1rbG9SdUlkMWdTVHp4M05QMWp6bTh4?=
 =?utf-8?B?TVkreDBPMlgzM2ZMSlF3MEFkMTFUTzdjWFQ0eGhWNkVvSGZxcFU0T2RON2Vv?=
 =?utf-8?B?SnQrck96U3FUKzU0UzQrUXl6NFE0YUpGcS8xajhLMncydjRxakgzbUlGRlNq?=
 =?utf-8?B?YWxHdkU3TmFTd3MwVTd0bk05cHg2d01idS9aLzhIL0xqaVQxRVQ4OVpPM2JG?=
 =?utf-8?B?T1gvN2RtNkY0cWxZS3FHSHU5dkZUTlNZYURjNmhuYlcwVWR6d1hPcUtlbFdx?=
 =?utf-8?B?b1lkdTZnWEtYYklKUk5mQnJNZzJyT3dPMkdjZ0JDMENWMTFhMlFSbU5ldk5t?=
 =?utf-8?B?cGxLdnRvS21Mc1gzTUxrd2JVTmdsUHNVb21Qak9WTm8rY2hDL3pUd0ZBTjB0?=
 =?utf-8?B?bmJndXJkcGhaVHdIM3kvMFgzV3VkWEFtSktIeDZ5OEtqdDZDM2duSGRJb0hn?=
 =?utf-8?B?Q21kckZpaXg3RzM4S2Y4ZVBlWTZVNFF4STVIV01JM0JQYzJGZEllZEpiaEQr?=
 =?utf-8?B?ZFlSSCtYTDF5V0ZMSkV2aXc3L1NuWlZNOUVleU5TWFI2VHFqMjhaMlo5RFJi?=
 =?utf-8?B?YzJZYWxoNmNBOUdpR0NOZUUwNXJkRWRYYXRHZVc4QVJucFA0aThMdEtLOVNj?=
 =?utf-8?B?U1hnSmF5OTlrU0ZUOW5yQkdSaFhNWEYybkk0SjJRM2h6QzJCb2p5OTFLcDhO?=
 =?utf-8?B?eXVoL2FIb0NNZ0NIcTBvK0l4Um02QUgycUtHbVZEY2FkTVd4c0ZOcS9xUlZl?=
 =?utf-8?B?bVFOdkpnQkRYc0FwcGh4ZkcxQlJIRXoyMVh6alJTT0s4MkFiYmJSeWs0K3Jk?=
 =?utf-8?B?OVhMZ25FaEhkZCt1U1I0eTVpVGpaMTFacC9PRGNrcjZKZ1hFSFZ5RnNHeXlG?=
 =?utf-8?B?TVo0Ry83K1VhY3V6Q1l5bjVCQXF3K3oyUUtFaUtnSm9Wc0swVjBmbEs5NEJY?=
 =?utf-8?B?SkhsY2E3eC9reHM0U0ZPSS8xbjI3QXJMeWlkREpRcWtJZTBWUTJERHdVclBV?=
 =?utf-8?B?OHFyMHZUcTkzMWFNRnEveTZnQU9rd2VNVEo0Y2xWZGFQdUhwU3B2TWNEdlBR?=
 =?utf-8?B?RlpDaDhkYjFhMU9hN0xWNWFaSWJqdDE1b3NXRnJ2blM3QjVtaFAzMWprWDNK?=
 =?utf-8?B?bTM5RGNkQTZTN2JYeVpMdlovTmc3djV0a0pKd2lLQ1dXc3dsTmlwMWtqZ1JO?=
 =?utf-8?B?bURqWXA3Q2dQWExTaEZVWU50UnA0b09oSStEYW5Dc2d3ZGlQTk4ydGpLYjVr?=
 =?utf-8?Q?u/P/c5P+pgZGbUMUc/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1da5b54-f304-4c7a-c1d2-08deac463654
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 14:37:49.5384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jzqj78iy9/T0Na5S+VAcktKuUM8lCrD7cvYIMRcmmuCDhfu5vtIVZ/PVsEmFBigQXbXlCTzs0oBx081Q8p8oqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7442


On Wed, 06 May 2026 18:29:17 -0700, Randy Dunlap wrote:
> Add a blank line to fix a documentation build warning.
> Also add a comma to separate the list of Users to improve
> readability.
>
> Documentation/ABI/testing/se-cdev:1: ERROR: Unexpected indentation. [docutils]
>
>
> [...]

Applied, thanks!

[1/1] firmware: drivers: imx: fix docs build warning

Squash to 4de71839142b ("firmware: drivers: imx: adds miscdev"), if any
concern, let me know.

Best regards,
--
Frank Li <Frank.Li@nxp.com>
