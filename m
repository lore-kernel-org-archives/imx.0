Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.43.123
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795078828;
	b=bkR/eUsp+hh3hlSWtBK2zefG0GAIcpCAMFo11zHwCvIPK/zLJ69YpVBKknlS9zgo990w
	 i/m9PQE30hvA+C/YNz7LY9dRuHbub26hW2JRkzuCBht5i/3XpFETqRoqR53+rw7NnlHvD
	 fgVtiwDfhPwzsKKNQcUqk1bskHeMfmwBRO8SWaKjrfJph+3FQryMH5BrTCihHeTbfw7ez
	 CJmnyfpjguy5/AZTQ2NshN2nL/7A/l+7PAvO7umks/v9pxxxw+mQW6yVi+oUO6ug5QIYb
	 +dBxIPxsPvqEkxMfbM2UpqpUxsDj8pl5iYF0OpwkZauHYR7JnMLAgZWDyUrIoe4EkaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078828;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=c/iLVrToJEB/+sOv9ZL8bDJmhTi1EtOevtDTaC6pYvM=;
	b=5olLgBQ15xsFYgWLG4D6MS8HTmkKYfB2/iPLxT2pSmcmd82TNX7An4HnqVl31yLoRlcc
	 6nMZczQHKAjrWqRbn87//ENOD11berQE0cNt1uIIRIFMEBKeyiRIYfbU6pPdQF9sM6GGw
	 Lq+l8AswcXnpxkFRi5v4Su4/eU83Kfw+uQojiNKSynpsVAx+aT/hEwwjgBs5SmedZUwM6
	 nlBQRrB0Ihi38GZ7SebIF1ya1VhfJFazNZB6bm2KCnvnOQxcwT5UNVJEQEJj+zrEV0BjM
	 bTFaGBsiT5PNZI1TAIb1Ohq5HN7rWWDhI/4jEWGXytlX5D9tOKExPdeO7f6vY4svEqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chipsnmedia.com;
	spf=fail smtp.mailfrom=chipsnmedia.com;
	dkim=pass header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=kw3l+szI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.43.123
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022123.outbound.protection.outlook.com [40.107.43.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD5F606A333
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 09:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AD5F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=kw3l+szI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=shtKHpH4ocyOYvnp32SpjpixLIjrL9TjjXEE198w3LLwtUNzmDeRmR5XjEXq62iKr6zbEzy0C1Mwdcamv83sSgJDB84uaJuLGJ6w/jKyk43AmguWvUMXgMU/+ZV54QmLmtUCChYF6FYzKifbf3kt8UXdxz/Ng8SnbV/UKfJuVpGtZKVkLakUlBtgbxeX092fpjGaGETZdyPKF/2bGnugEgCu5lcLTbdux7uHC4uhCRiCopi4K3zcvQSw+OhcjLbYXTvoceDY0WwrhuQmiNNSdaBVZ6fzeg3v7lnmByEqWNefXyFhoy+ph5BF3XbPVlBhAq1OWfD/aCDruNr8Ncx1EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/iLVrToJEB/+sOv9ZL8bDJmhTi1EtOevtDTaC6pYvM=;
 b=yLoNXD1ZTmgIBOwFwVKK4sfyLNd8CnGCd8IIEtqGrpk3h8zMAhqVaO5qREDqETUAgNf0q6ChYyIGVHRqdpF+OPzNpOsyMC/BRnzTEzO3c50uxXUDUURvC7YBXUptHQ+jJDn15PzeoPVW8bGU5CfD8gxw8e8dg6NjnjDQ3jwrZ2L9VI42737pgMPQPgTs77F2s9cUmcOsg0Leu/G8GmaUiRdWWlaz7O7WdOXj9L86Q9LN16+pS0cW3PIAKx8M+Jxvcdbh0u61aDQFz/sok6O0wgfbKJ6uiij/5OHDaD0kXaCcyZumjoyPAudAvc8NPs9DoWTfKtvX5+l1ohNaa8n2aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/iLVrToJEB/+sOv9ZL8bDJmhTi1EtOevtDTaC6pYvM=;
 b=kw3l+szIIqT9a3KWVClJ76sML6hUaUfLNBf909fn097p9smXE9E0Bx0ef3guBUPWzRS0dYBLqLnvf701QciG9HUkngF6leU/tcekoIWu9MOGljuOQktRJ1/FzRGs6g+M/OhnY7oDzX3BRGm1KxtjfKn++LKvnZBKuw/aPT18BotpPpQaD1E7NVVk7OIL/LESZ4dMowP6adt7tSc9B6pP5acAdCWZjdPGjkdly8p625JBiUcVudg5t+RK3GHCl9W9nEFrABZV5VVaKYfM9pAj7Ct6aSjpN0uD1hfvRb/Vy9ZaRES8GpKo8z9tbrMY8vr/z57Elq3heqz3v+f5gaJkhg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SE2P216MB360180.KORP216.PROD.OUTLOOK.COM (2603:1096:101:30b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 09:00:23 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 09:00:23 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	festevam@gmail.com,
	kernel@pengutronix.de,
	nicolas.dufresne@collabora.com,
	ming.qian@oss.nxp.com,
	marek.vasut@mailbox.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH v8 03/11] media: chips-media: wave6: Add Wave6 core driver
Date: Thu, 19 Nov 2026 17:59:57 +0900
Message-Id: <1030b93108a94a28b572a97695f3b5bfc75e0ac9.1795075580.git.nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1795075577.git.nas.chung@chipsnmedia.com>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0060.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ba::8) To SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b9::8)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB2441:EE_|SE2P216MB360180:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c09ba7c-6632-4e76-d24b-08df461b8b8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|52116014|376014|1800799024|366016|22082099003|18002099003|6133799003|3023799007|56012099006|10067099003|261026140227099003|261026121527099003|261028144727099003|261021123027099003|261022105027099003|261021135927099003|261021121427099003|261022075727099003|261022115727099003|261009223027099003|261102123227099003|261009221227099003|261009220027099003|261009221727099003|261009223327099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	Dw3ngpJtPkaWrqACehVbiALbFUD0Xsbor/KwW0MlmqwDXGyInYpiMsjUUOPQcKn3AVpF47JVXA35CLqsIzohKzrxgHinCPwXMWQoOia5STR59P8W0gvFCjX3u90SC8Mx5wY9mTjtDJEJhek4lGA0Qy4wxk+UNHGauXnun8cBhjgBDrie9z47HP2gpVQTWj10appHDqjsHht6rfwCtZVC7g/Vnaqd1tvLbJFyWjFIT4D6xP2JmfSqgFoKAPxVDh6GA5IWz7HgFWOfwITuSMLxPXDskhjv2u2Xbh9EocuyZaxNYFEx91IUoWWDlk+7YZNRCV2OhUaorHQa7i/lcv6jGeWIyb/3ndbM0qU5ZnMzO1HyO9EfeYWmPpf3IItF6rEKTnnfHs/EyzP8C/+dcveHALTf5qUY9N0R8oc17lDCXJfQ0aVEBPWUMaPJFufeSaQ9VoeW0LbKm4mMQO1AK3F/RFHG/6cP1GFYje1P9ofhnKGRCamqWrtDjLK0GLqx0fENvKOIGFOl4yDpjstVqlUSbT4HVIdkASulntlxhLu3yRNOQrV6SqQDsGS6ENDPrSHE59d95pnjt1y/CQkd1iA+Pn1w8wdARaIEokfdIPZt72UuMNwHj08ZrEXEEZjm7tMjTI/6ftEgE7hd0ZNPVJe6XknmwHB+tw5bcd9RzbCeSN8itwHoAD1G6Or9FoCYk0xCcHxm+NkVu4WCP0AltwjzbkA2Xmw+WP1ObxpHUc4SWc4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(52116014)(376014)(1800799024)(366016)(22082099003)(18002099003)(6133799003)(3023799007)(56012099006)(10067099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021123027099003)(261022105027099003)(261021135927099003)(261021121427099003)(261022075727099003)(261022115727099003)(261009223027099003)(261102123227099003)(261009221227099003)(261009220027099003)(261009221727099003)(261009223327099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GrDGCcKrM/EBzRQrYGN9GzrSkyNIs00Ygm05Vy82MSDCcQSZDKUPCPQ4wVuI?=
 =?us-ascii?Q?XXUM+dQ74Ur0WFSl5GtGiZNQZhmXPaGjV39YdmYDNCBKb/9G7hxc4Zqiop+m?=
 =?us-ascii?Q?g5M4OR6ouHXfoFXXcbWGSHe9+7xyk84npNWlDZj5qbx+CMog7TsC8t9ByB29?=
 =?us-ascii?Q?yQuKvk+BTBWN7/WJojXH3zg1Kk71MnkgAEiUDMq23SCmuJs5ILfP27MdBhov?=
 =?us-ascii?Q?wTKOTpKfFY9tS2L3muuhRlJrDTF137KCMUIHDY9dw7cJW7UNkX41XM7ltI71?=
 =?us-ascii?Q?iLaEz2Eop4M7CqV6rDmwAeZkGfWJAHp8WmNBVQsD1pXNpWAZNI3dFAZpo3JC?=
 =?us-ascii?Q?elZVbIWZ6esyMczcXE9dElZXDBwSezbakoy3EiFrlv3U2a5TIDW/B3LmcLgr?=
 =?us-ascii?Q?gOk140uEL/qbr3H3HEGPxF1dE8GlHGFGJ8M+GvYhMSdZ4UhDsKXxDjVWqiVV?=
 =?us-ascii?Q?Myv8ANMTHC90JVnagdsH7WtnURVyIKtc5er03OAZCJ6HSMKyo3kvc8YcX0fR?=
 =?us-ascii?Q?rQ34W0ZHTykn5Gigrn0P6A5ow1h7wEXJ6waqgk1HLQTJ5I73l4fOjwmYkcdR?=
 =?us-ascii?Q?uLdY4Cav8G/QDwigc87Jh9X5ysWKNvCzjU+RdmX4VVWnLsU683p+bAUU3o7R?=
 =?us-ascii?Q?niqt9TvhajbAG8nyiUYxF1BN6bQ+RBuoDFmcqpN8ycjWPkrl/D3LJJ4EY+TN?=
 =?us-ascii?Q?mQfGZ5B0va2ry2HQkR4NYxS7YBPWJ4tYi+tB415rYQAfEclTc4fCfHjJpXN0?=
 =?us-ascii?Q?iI4wbdBeBi0hEke5YvsAduYvnUPBba+TrPzib1qXr/Wh92PrPVSxxciVdH7q?=
 =?us-ascii?Q?h1v/nOiqWuSMW0+yBizTY4xvaZXCfR1P9hluFciEVt1AsJuAlkzu/ss9VhIP?=
 =?us-ascii?Q?E1ItKTNNjjOTyVerm3R74ppdh7Dme+DgtzhQnH5thCMsCeGcwGy5kMTZTnnH?=
 =?us-ascii?Q?tgefvpSm4ErV7Rx5Ak2N0mWBFAo0QmIUMFN+CKRVnE9noJq8Gl1UEbeyaeqR?=
 =?us-ascii?Q?0/yUwyNXNmJvuBBi8jGGF4VuXdB7MtDDR4t7PXvo7caKYYCTjhAVfqrp0eFX?=
 =?us-ascii?Q?FfPXivGJlYlAzmFrOoUq4vFJtQMn1hRz4+COWLvsJ0FFipcKM4MJ2ctD44JT?=
 =?us-ascii?Q?8i0g3bUT5bPFj206mpBm9cuhO4EL7DBBWVOsX9lzNWmZ5YCSRDbCLvRsRmDg?=
 =?us-ascii?Q?sG1XT5yKuNBlPi2Xgah1o+muDQ/rg3VP82XkhBRyA3ok/brJP7gRYIQhEk4/?=
 =?us-ascii?Q?m8MW+6VLg9pVs3DrNa4C6CZ5hT6r2a+FhXSAmosw40tkv7RoTCq5nfkkwXm2?=
 =?us-ascii?Q?Hoz3JqMJc5uwtjsd2LEU20jlmsPVws+zIiZXph0kbraLPsAnOXkducI1LTc8?=
 =?us-ascii?Q?/inmhdCxIs7DO8Ni4dqdXaZKk3EItbkvpaXWrfgVszy4XptbUCk1aA4G16Pp?=
 =?us-ascii?Q?BTM0GelbM7m5pXu+ubDBuewbG+EVZII5Fer5uTRlCRIV1lYjah5fuVeqnlmD?=
 =?us-ascii?Q?ms7AqWkl4UbYybX3wyNpSU/G4n9vwlfurJYg/KoDd259X8QrxA1FbsZItV3E?=
 =?us-ascii?Q?23YaEZRtZQnc2qzvlQJcc0d0QTKFCGU96UzeHdg+HnU4RnvYeLHGU1T+PIs/?=
 =?us-ascii?Q?CmcI1GsqQVtgjR43OaBXo2piBGKuz0H56rS+dNBSCO+siEQVNX1rxZXT5wdQ?=
 =?us-ascii?Q?dfVYaRHuofXaRi5nhn8wwOCPocLroEqWtXzvvNSgFeAhnFgoO/zHzZplNOHG?=
 =?us-ascii?Q?77U8TBjP7EKpzV/0kZ3kOBQ+x9L5QCM=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c09ba7c-6632-4e76-d24b-08df461b8b8e
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:00:23.1539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BUEamvwEqGOAjvbNrSWWm+eakIM7Ax23iDinEkKwFqZDELJeLVsgA4/4mtopP4Fzf9v2I9yMIMsG7ldJLWaNSJ2gCc2Y4kFun5riHc7fHG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB360180

Add the core driver for the Chips&Media Wave6 video codec IP.

The hardware contains one control register region and four interface
register regions for a shared video processing engine. The core driver
handles the interface register regions, each with its own MMIO range
and interrupt, while relying on the control driver for firmware loading
and shared resource management.

It configures the V4L2 mem2mem devices and communicates with the Wave6
hardware to perform video processing tasks.

Tested-by: Ming Qian <ming.qian@oss.nxp.com>
Tested-by: Marek Vasut <marek.vasut@mailbox.org>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../media/platform/chips-media/wave6/Kconfig  |   2 +
 .../media/platform/chips-media/wave6/Makefile |   5 +-
 .../platform/chips-media/wave6/wave6-hw.c     | 181 ++++++++
 .../platform/chips-media/wave6/wave6-hw.h     |  22 +
 .../chips-media/wave6/wave6-regdefine.h       |  65 +++
 .../platform/chips-media/wave6/wave6-vdi.h    |  20 +
 .../chips-media/wave6/wave6-vpu-core.c        | 392 ++++++++++++++++++
 .../chips-media/wave6/wave6-vpu-core.h        | 106 +++++
 .../chips-media/wave6/wave6-vpu-v4l2.c        | 384 +++++++++++++++++
 .../platform/chips-media/wave6/wave6-vpu.c    |  24 +-
 .../platform/chips-media/wave6/wave6-vpu.h    |   2 +
 .../platform/chips-media/wave6/wave6-vpuapi.h | 381 +++++++++++++++++
 .../chips-media/wave6/wave6-vpuconfig.h       |   6 +
 13 files changed, 1588 insertions(+), 2 deletions(-)
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuapi.h

diff --git a/drivers/media/platform/chips-media/wave6/Kconfig b/drivers/media/platform/chips-media/wave6/Kconfig
index 153a46ebdc6b..6d87d26fa9fc 100644
--- a/drivers/media/platform/chips-media/wave6/Kconfig
+++ b/drivers/media/platform/chips-media/wave6/Kconfig
@@ -5,6 +5,8 @@ config VIDEO_WAVE6_VPU
 	depends on V4L_MEM2MEM_DRIVERS
 	depends on VIDEO_DEV && OF
 	depends on ARCH_MXC || COMPILE_TEST
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_MEM2MEM_DEV
 	select GENERIC_ALLOCATOR
 	help
 	  Chips&Media Wave6 stateful codec driver.
diff --git a/drivers/media/platform/chips-media/wave6/Makefile b/drivers/media/platform/chips-media/wave6/Makefile
index 255fc90bc642..7bfc28ba5523 100644
--- a/drivers/media/platform/chips-media/wave6/Makefile
+++ b/drivers/media/platform/chips-media/wave6/Makefile
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
-wave6-objs += wave6-vpu.o
+wave6-objs += wave6-vpu.o \
+	      wave6-vpu-core.o \
+	      wave6-vpu-v4l2.o \
+	      wave6-hw.o
 obj-$(CONFIG_VIDEO_WAVE6_VPU) += wave6.o
diff --git a/drivers/media/platform/chips-media/wave6/wave6-hw.c b/drivers/media/platform/chips-media/wave6/wave6-hw.c
new file mode 100644
index 000000000000..fcf5be294ef5
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-hw.c
@@ -0,0 +1,181 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - wave6 backend interface
+ *
+ * Copyright (C) 2026 CHIPS&MEDIA INC
+ */
+
+#include <linux/iopoll.h>
+
+#include "wave6-vpu-core.h"
+#include "wave6-hw.h"
+#include "wave6-regdefine.h"
+
+#define wave6_print_reg_err(core, reason) \
+	_wave6_print_reg_err((core), (reason), __func__)
+
+void wave6_vpu_writel(struct vpu_core_device *core, u32 addr, u32 data)
+{
+	wave6_vdi_writel(core->reg_base, addr, data);
+}
+
+u32 wave6_vpu_readl(struct vpu_core_device *core, u32 addr)
+{
+	u32 data;
+
+	data = wave6_vdi_readl(core->reg_base, addr);
+
+	return data;
+}
+
+void wave6_vpu_writel_relaxed(struct vpu_core_device *core, u32 addr, u32 data)
+{
+	wave6_vdi_writel_relaxed(core->reg_base, addr, data);
+}
+
+u32 wave6_vpu_readl_relaxed(struct vpu_core_device *core, u32 addr)
+{
+	u32 data;
+
+	data = wave6_vdi_readl_relaxed(core->reg_base, addr);
+
+	return data;
+}
+
+static void _wave6_print_reg_err(struct vpu_core_device *core, u32 fail_reason,
+				 const char *func)
+{
+	dev_err(core->dev, "%s: failure: 0x%x\n", func, fail_reason);
+}
+
+static int wave6_wait_vpu_busy(struct vpu_core_device *core, unsigned int addr)
+{
+	u32 data;
+
+	lockdep_assert_held(&core->hw_lock);
+
+	return read_poll_timeout(vpu_read_reg, data, !data,
+				 W6_VPU_POLL_DELAY_US, W6_VPU_POLL_TIMEOUT,
+				 false, core, addr);
+}
+
+void wave6_vpu_enable_interrupt(struct vpu_core_device *core)
+{
+	u32 data;
+
+	lockdep_assert_held(&core->hw_lock);
+
+	data = BIT(W6_INT_BIT_INIT_SEQ);
+	data |= BIT(W6_INT_BIT_DEC_PIC);
+	data |= BIT(W6_INT_BIT_BSBUF_ERROR);
+	data |= BIT(W6_INT_BIT_REQ_WORK_BUF);
+	vpu_write_reg(core, W6_VPU_VINT_ENABLE, data);
+}
+
+bool wave6_vpu_is_init(struct vpu_core_device *core)
+{
+	lockdep_assert_held(&core->hw_lock);
+
+	return vpu_read_reg(core, W6_VPU_VCPU_CUR_PC) != 0;
+}
+
+static u32 wave6_vpu_get_product_id(struct vpu_core_device *core)
+{
+	u32 val;
+
+	lockdep_assert_held(&core->hw_lock);
+
+	val = vpu_read_reg_relaxed(core, W6_VPU_RET_PRODUCT_CODE);
+
+	switch (val) {
+	case WAVE617_CODE:
+		return PRODUCT_ID_617;
+	case WAVE627_CODE:
+		return PRODUCT_ID_627;
+	case WAVE633_CODE:
+	case WAVE637_CODE:
+	case WAVE663_CODE:
+	case WAVE677_CODE:
+		return PRODUCT_ID_637;
+	default:
+		dev_err(core->dev, "Invalid product (%x)\n", val);
+		break;
+	}
+
+	return PRODUCT_ID_NONE;
+}
+
+static void wave6_send_command(struct vpu_core_device *core, u32 id, u32 std, u32 cmd)
+{
+	u32 reg_val;
+
+	lockdep_assert_held(&core->hw_lock);
+
+	reg_val = INSTANCE_INFO_CODEC_STD(std);
+	if (cmd != W6_CMD_CREATE_INSTANCE)
+		reg_val |= INSTANCE_INFO_ID(id);
+	vpu_write_reg_relaxed(core, W6_CMD_INSTANCE_INFO, reg_val);
+
+	vpu_write_reg_relaxed(core, W6_VPU_BUSY_STATUS, BUSY_STATUS_SET);
+	vpu_write_reg_relaxed(core, W6_COMMAND, cmd);
+	vpu_write_reg(core, W6_VPU_HOST_INT_REQ, HOST_INT_REQ_ON);
+}
+
+static int wave6_send_query(struct vpu_core_device *core, u32 id, u32 std,
+			    enum wave6_query_option query_opt)
+{
+	u32 reg_val;
+	int ret;
+
+	lockdep_assert_held(&core->hw_lock);
+
+	vpu_write_reg_relaxed(core, W6_QUERY_OPTION, query_opt);
+	wave6_send_command(core, id, std, W6_CMD_QUERY);
+
+	ret = wave6_wait_vpu_busy(core, W6_VPU_BUSY_STATUS);
+	if (ret) {
+		dev_err(core->dev, "query timed out opt=0x%x\n", query_opt);
+		return ret;
+	}
+
+	if (!vpu_read_reg_relaxed(core, W6_RET_SUCCESS)) {
+		reg_val = vpu_read_reg_relaxed(core, W6_RET_FAIL_REASON);
+		wave6_print_reg_err(core, reg_val);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+int wave6_vpu_get_version(struct vpu_core_device *core)
+{
+	struct vpu_attr *attr = &core->attr;
+	u32 std_def1, conf_feature;
+	int ret;
+
+	lockdep_assert_held(&core->hw_lock);
+
+	ret = wave6_send_query(core, 0, 0, W6_QUERY_OPT_GET_VPU_INFO);
+	if (ret)
+		return ret;
+
+	attr->product_id = wave6_vpu_get_product_id(core);
+	attr->product_code = vpu_read_reg_relaxed(core, W6_VPU_RET_PRODUCT_CODE);
+	attr->product_version = vpu_read_reg_relaxed(core, W6_RET_PRODUCT_VERSION);
+	attr->fw_version = vpu_read_reg_relaxed(core, W6_RET_FW_API_VERSION);
+	attr->fw_revision = vpu_read_reg_relaxed(core, W6_RET_FW_VERSION);
+	attr->hw_version = vpu_read_reg_relaxed(core, W6_RET_CONF_HW_VERSION);
+	std_def1 = vpu_read_reg_relaxed(core, W6_RET_STD_DEF1);
+	conf_feature = vpu_read_reg_relaxed(core, W6_RET_CONF_FEATURE);
+
+	attr->support_decoders = STD_DEF1_HEVC_DEC(std_def1) ? BIT(W_HEVC_DEC) : 0;
+	attr->support_decoders |= STD_DEF1_AVC_DEC(std_def1) ? BIT(W_AVC_DEC) : 0;
+	attr->support_encoders = STD_DEF1_HEVC_ENC(std_def1) ? BIT(W_HEVC_ENC) : 0;
+	attr->support_encoders |= STD_DEF1_AVC_ENC(std_def1) ? BIT(W_AVC_ENC) : 0;
+	attr->support_hevc10bit_dec = CONF_FEATURE_HEVC10BIT_DEC(conf_feature);
+	attr->support_avc10bit_dec = CONF_FEATURE_AVC10BIT_DEC(conf_feature);
+	attr->support_hevc10bit_enc = CONF_FEATURE_HEVC10BIT_ENC(conf_feature);
+	attr->support_avc10bit_enc = CONF_FEATURE_AVC10BIT_ENC(conf_feature);
+
+	return 0;
+}
diff --git a/drivers/media/platform/chips-media/wave6/wave6-hw.h b/drivers/media/platform/chips-media/wave6/wave6-hw.h
new file mode 100644
index 000000000000..bf8b6dcb54c2
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-hw.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 backend interface
+ *
+ * Copyright (C) 2026 CHIPS&MEDIA INC
+ */
+
+#ifndef __WAVE6_HW_H__
+#define __WAVE6_HW_H__
+
+enum product_id {
+	PRODUCT_ID_617,
+	PRODUCT_ID_627,
+	PRODUCT_ID_637,
+	PRODUCT_ID_NONE,
+};
+
+bool wave6_vpu_is_init(struct vpu_core_device *core);
+int wave6_vpu_get_version(struct vpu_core_device *core);
+void wave6_vpu_enable_interrupt(struct vpu_core_device *core);
+
+#endif /* __WAVE6_HW_H__ */
diff --git a/drivers/media/platform/chips-media/wave6/wave6-regdefine.h b/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
index e879a9743cb3..aa9b972c82d1 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
+++ b/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
@@ -14,14 +14,51 @@ enum wave6_command {
 	W6_CMD_INIT_VPU		= 0x0001,
 	W6_CMD_WAKEUP_VPU	= 0x0002,
 	W6_CMD_SLEEP_VPU	= 0x0004,
+	W6_CMD_CREATE_INSTANCE	= 0x0008,
+	W6_CMD_FLUSH_INSTANCE	= 0x0010,
+	W6_CMD_DESTROY_INSTANCE	= 0x0020,
+	W6_CMD_INIT_SEQ		= 0x0040,
+	W6_CMD_SET_FB		= 0x0080,
+	W6_CMD_DEC_PIC		= 0x0100,
+	W6_CMD_DEC_SET_DISP	= 0x0400,
 	W6_CMD_INIT_WORK_BUF	= 0x1000,
+	W6_CMD_QUERY		= 0x4000,
+};
+
+enum wave6_query_option {
+	W6_QUERY_OPT_GET_VPU_INFO	= 0,
+	W6_QUERY_OPT_GET_RESULT		= 2,
+	W6_QUERY_OPT_GET_FLUSH_CMD_INFO	= 10,
+};
+
+enum wave6_interrupt_bit {
+	W6_INT_BIT_INIT_VPU		= 0,
+	W6_INT_BIT_WAKEUP_VPU		= 1,
+	W6_INT_BIT_SLEEP_VPU		= 2,
+	W6_INT_BIT_CREATE_INSTANCE	= 3,
+	W6_INT_BIT_FLUSH_INSTANCE	= 4,
+	W6_INT_BIT_DESTROY_INSTANCE	= 5,
+	W6_INT_BIT_INIT_SEQ		= 6,
+	W6_INT_BIT_SET_FB		= 7,
+	W6_INT_BIT_DEC_PIC		= 8,
+	W6_INT_BIT_SET_DISP		= 10,
+	W6_INT_BIT_REQ_WORK_BUF		= 12,
+	W6_INT_BIT_BSBUF_ERROR		= 15,
 };
 
 #define W6_REG_BASE	0x00000000
+#define W6_CMD_REG_BASE	0x00000200
+#define W6_CMD_REG_END	0x00000600
 
 #define W6_VPU_VCPU_CUR_PC				(W6_REG_BASE + 0x0004)
+#define W6_VPU_VINT_REASON_CLEAR			(W6_REG_BASE + 0x0034)
 #define W6_VPU_HOST_INT_REQ				(W6_REG_BASE + 0x0038)
 #define		HOST_INT_REQ_ON				BIT(0)
+#define W6_VPU_VINT_CLEAR				(W6_REG_BASE + 0x003C)
+#define		VINT_CLEAR				BIT(0)
+#define W6_VPU_VPU_INT_STS				(W6_REG_BASE + 0x0044)
+#define W6_VPU_VINT_ENABLE				(W6_REG_BASE + 0x0048)
+#define W6_VPU_VINT_REASON				(W6_REG_BASE + 0x004C)
 #define W6_VPU_REMAP_CTRL_GB				(W6_REG_BASE + 0x0060)
 #define		REMAP_CTRL_ON				BIT(31)
 #define		REMAP_CTRL_INDEX(x)			FIELD_PREP(GENMASK(15, 12), (x))
@@ -38,6 +75,10 @@ enum wave6_command {
 /* COMMON */
 #define W6_COMMAND_GB					(W6_REG_BASE + 0x104)
 #define W6_COMMAND					(W6_REG_BASE + 0x200)
+#define W6_QUERY_OPTION					(W6_REG_BASE + 0x204)
+#define W6_CMD_INSTANCE_INFO				(W6_REG_BASE + 0x210)
+#define		INSTANCE_INFO_CODEC_STD(x)		FIELD_PREP(GENMASK(31, 16), (x))
+#define		INSTANCE_INFO_ID(x)			FIELD_PREP(GENMASK(15, 0), (x))
 #define W6_CMD_INIT_VPU_SEC_AXI_BASE_CORE0		(W6_REG_BASE + 0x364)
 #define W6_CMD_INIT_VPU_SEC_AXI_SIZE_CORE0		(W6_REG_BASE + 0x368)
 #define W6_CMD_SET_WORK_BUF_ADDR			(W6_REG_BASE + 0x5F0)
@@ -45,5 +86,29 @@ enum wave6_command {
 #define		SET_WORK_BUF_SIZE_ACK			0
 #define W6_RET_SUCCESS					(W6_REG_BASE + 0x208)
 #define W6_RET_FAIL_REASON				(W6_REG_BASE + 0x20C)
+#define W6_RET_INT_INSTANCE_INFO			(W6_REG_BASE + 0x21C)
+#define		INT_INSTANCE_INFO_CLEAR			0
+#define W6_RET_INSTANCE_ID				(W6_REG_BASE + 0x220)
+
+/* COMMON - QUERY : GET_VPU_INFO */
+#define W6_RET_FW_VERSION				(W6_REG_BASE + 0x300)
+#define W6_RET_PRODUCT_NAME				(W6_REG_BASE + 0x304)
+#define W6_RET_PRODUCT_VERSION				(W6_REG_BASE + 0x308)
+#define W6_RET_STD_DEF0					(W6_REG_BASE + 0x30C)
+#define W6_RET_STD_DEF1					(W6_REG_BASE + 0x310)
+#define		STD_DEF1_AVC_DEC(x)			FIELD_GET(GENMASK(3, 3), (x))
+#define		STD_DEF1_HEVC_DEC(x)			FIELD_GET(GENMASK(2, 2), (x))
+#define		STD_DEF1_AVC_ENC(x)			FIELD_GET(GENMASK(1, 1), (x))
+#define		STD_DEF1_HEVC_ENC(x)			FIELD_GET(GENMASK(0, 0), (x))
+#define W6_RET_CONF_FEATURE				(W6_REG_BASE + 0x314)
+#define		CONF_FEATURE_AVC10BIT_ENC(x)		FIELD_GET(GENMASK(11, 11), (x))
+#define		CONF_FEATURE_AVC10BIT_DEC(x)		FIELD_GET(GENMASK(9, 9), (x))
+#define		CONF_FEATURE_HEVC10BIT_ENC(x)		FIELD_GET(GENMASK(3, 3), (x))
+#define		CONF_FEATURE_HEVC10BIT_DEC(x)		FIELD_GET(GENMASK(1, 1), (x))
+#define W6_RET_CONF_DATE				(W6_REG_BASE + 0x318)
+#define W6_RET_CONF_HW_VERSION				(W6_REG_BASE + 0x31C)
+#define W6_RET_CONF_TYPE				(W6_REG_BASE + 0x320)
+#define W6_RET_FW_API_VERSION				(W6_REG_BASE + 0x32C)
+#define W6_RET_SHA_ID					(W6_REG_BASE + 0x330)
 
 #endif /* __WAVE6_REGDEFINE_H__ */
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vdi.h b/drivers/media/platform/chips-media/wave6/wave6-vdi.h
index 69ebf0ebcb13..67704fdbe27d 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-vdi.h
+++ b/drivers/media/platform/chips-media/wave6/wave6-vdi.h
@@ -13,6 +13,26 @@
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
 
+enum endian_mode {
+	VDI_128BIT_BIG_ENDIAN = 0,
+	VDI_128BIT_BE_BYTE_SWAP,
+	VDI_128BIT_BE_WORD_SWAP,
+	VDI_128BIT_BE_WORD_BYTE_SWAP,
+	VDI_128BIT_BE_DWORD_SWAP,
+	VDI_128BIT_BE_DWORD_BYTE_SWAP,
+	VDI_128BIT_BE_DWORD_WORD_SWAP,
+	VDI_128BIT_BE_DWORD_WORD_BYTE_SWAP,
+	VDI_128BIT_LE_DWORD_WORD_BYTE_SWAP,
+	VDI_128BIT_LE_DWORD_WORD_SWAP,
+	VDI_128BIT_LE_DWORD_BYTE_SWAP,
+	VDI_128BIT_LE_DWORD_SWAP,
+	VDI_128BIT_LE_WORD_BYTE_SWAP,
+	VDI_128BIT_LE_WORD_SWAP,
+	VDI_128BIT_LE_BYTE_SWAP,
+	VDI_128BIT_LITTLE_ENDIAN = 15,
+	VDI_ENDIAN_MAX
+};
+
 /**
  * struct vpu_buf - VPU buffer for a coherent DMA buffer
  * @size:	Buffer size
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
new file mode 100644
index 000000000000..67c6666579d9
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
@@ -0,0 +1,392 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - wave6 core driver
+ *
+ * Copyright (C) 2026 CHIPS&MEDIA INC
+ */
+
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
+#include <linux/iopoll.h>
+
+#include "wave6-vpu-core.h"
+#include "wave6-regdefine.h"
+#include "wave6-vpuconfig.h"
+#include "wave6-hw.h"
+
+static irqreturn_t wave6_vpu_core_irq(int irq, void *dev_id)
+{
+	struct vpu_core_device *core = dev_id;
+	struct vpu_irq irq_info;
+
+	if (!vpu_read_reg(core, W6_VPU_VPU_INT_STS))
+		return IRQ_NONE;
+
+	irq_info.status = vpu_read_reg(core, W6_VPU_VINT_REASON);
+	irq_info.inst_idc = vpu_read_reg(core, W6_RET_INT_INSTANCE_INFO);
+
+	vpu_write_reg(core, W6_RET_INT_INSTANCE_INFO, INT_INSTANCE_INFO_CLEAR);
+	vpu_write_reg(core, W6_VPU_VINT_REASON_CLEAR, irq_info.status);
+	vpu_write_reg(core, W6_VPU_VINT_CLEAR, VINT_CLEAR);
+
+	if (irq_info.status & BIT(W6_INT_BIT_REQ_WORK_BUF)) {
+		wave6_vpu_require_work_buffer(core->vpu, core->reg_base);
+
+		return IRQ_HANDLED;
+	}
+
+	if (kfifo_in(&core->irq_fifo, &irq_info, sizeof(struct vpu_irq)) !=
+	    sizeof(struct vpu_irq))
+		dev_err(core->dev, "IRQ overflow status 0x%x idc 0x%x\n",
+			irq_info.status, irq_info.inst_idc);
+
+	return IRQ_WAKE_THREAD;
+}
+
+static struct vpu_instance *wave6_vpu_core_get_instance(struct vpu_core_device *core,
+							u32 inst_idc)
+{
+	struct vpu_instance *inst;
+
+	guard(spinlock)(&core->inst_lock);
+
+	list_for_each_entry(inst, &core->instances, list) {
+		if ((BIT(inst->id) & inst_idc) && inst->enable)
+			return inst;
+	}
+
+	return NULL;
+}
+
+void wave6_vpu_enable_instance(struct vpu_instance *inst)
+{
+	scoped_guard(spinlock, &inst->dev->inst_lock)
+		inst->enable = true;
+}
+
+void wave6_vpu_disable_instance(struct vpu_instance *inst)
+{
+	scoped_guard(spinlock, &inst->dev->inst_lock)
+		inst->enable = false;
+
+	synchronize_irq(inst->dev->irq);
+	cancel_delayed_work_sync(&inst->task_timer);
+}
+
+static irqreturn_t wave6_vpu_core_irq_thread(int irq, void *dev_id)
+{
+	struct vpu_core_device *core = dev_id;
+	struct vpu_instance *inst;
+	struct vpu_irq irq_info;
+
+	while (kfifo_len(&core->irq_fifo)) {
+		bool error = false;
+
+		if (!kfifo_out(&core->irq_fifo, &irq_info, sizeof(struct vpu_irq)))
+			break;
+
+		inst = wave6_vpu_core_get_instance(core, irq_info.inst_idc);
+		if (!inst)
+			continue;
+
+		if (irq_info.status & BIT(W6_INT_BIT_INIT_SEQ)) {
+			complete(&inst->irq_done);
+			continue;
+		}
+
+		if (irq_info.status & BIT(W6_INT_BIT_BSBUF_ERROR))
+			error = true;
+
+		if (inst->ops && inst->ops->finish_process)
+			inst->ops->finish_process(inst, error);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int wave6_vpu_core_check_state(struct vpu_core_device *core)
+{
+	u32 val;
+	int ret;
+
+	guard(mutex)(&core->hw_lock);
+
+	ret = read_poll_timeout(vpu_read_reg, val, val != 0,
+				W6_VPU_POLL_DELAY_US, W6_VPU_POLL_TIMEOUT,
+				false, core, W6_VPU_VCPU_CUR_PC);
+	if (ret)
+		return ret;
+
+	wave6_vpu_enable_interrupt(core);
+	ret = wave6_vpu_get_version(core);
+	if (ret) {
+		dev_err(core->dev, "wave6_vpu_get_version fail\n");
+		return ret;
+	}
+
+	dev_dbg(core->dev, "product 0x%x, fw_ver %d.%d.%d(r%d), hw_ver 0x%x\n",
+		core->attr.product_code,
+		FW_VERSION_MAJOR(core->attr.fw_version),
+		FW_VERSION_MINOR(core->attr.fw_version),
+		FW_VERSION_REL(core->attr.fw_version),
+		core->attr.fw_revision,
+		core->attr.hw_version);
+
+	if (core->attr.fw_version < core->res->compatible_fw_version)
+		dev_err(core->dev, "fw version is too low (< v%d.%d.%d)\n",
+			FW_VERSION_MAJOR(core->res->compatible_fw_version),
+			FW_VERSION_MINOR(core->res->compatible_fw_version),
+			FW_VERSION_REL(core->res->compatible_fw_version));
+
+	return 0;
+}
+
+void wave6_vpu_core_activate(struct vpu_core_device *core)
+{
+	atomic_inc(&core->active_count);
+}
+
+void wave6_vpu_core_deactivate(struct vpu_core_device *core)
+{
+	atomic_dec(&core->active_count);
+}
+
+static int wave6_vpu_core_wait_activated(struct vpu_core_device *core)
+{
+	if (!atomic_read(&core->active_count))
+		return 0;
+
+	return wave6_vpu_core_check_state(core);
+}
+
+static void wave6_vpu_core_unregister_v4l2_dev(void *data)
+{
+	struct vpu_core_device *core = data;
+
+	v4l2_device_unregister(&core->v4l2_dev);
+}
+
+static void wave6_vpu_core_release_m2m_dev(void *data)
+{
+	wave6_vpu_release_m2m_dev(data);
+}
+
+static void wave6_vpu_core_free_temp_vbuf(void *data)
+{
+	struct vpu_core_device *core = data;
+
+	wave6_vdi_free_dma(&core->temp_vbuf);
+}
+
+static int wave6_vpu_core_probe(struct platform_device *pdev)
+{
+	struct vpu_core_device *core;
+	const struct wave6_vpu_core_resource *res;
+	int ret;
+
+	res = dev_get_platdata(&pdev->dev);
+	if (!res)
+		return -ENODEV;
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", ret);
+		return ret;
+	}
+
+	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
+	if (!core)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(&pdev->dev, &core->dev_lock);
+	if (ret)
+		return ret;
+
+	ret = devm_mutex_init(&pdev->dev, &core->hw_lock);
+	if (ret)
+		return ret;
+
+	spin_lock_init(&core->inst_lock);
+	INIT_LIST_HEAD(&core->instances);
+	dev_set_drvdata(&pdev->dev, core);
+	core->dev = &pdev->dev;
+	core->res = res;
+
+	core->vpu = dev_get_drvdata(pdev->dev.parent);
+
+	core->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(core->reg_base))
+		return PTR_ERR(core->reg_base);
+
+	ret = devm_clk_bulk_get_all(&pdev->dev, &core->clks);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "failed to get clocks\n");
+
+	core->num_clks = ret;
+
+	ret = kfifo_init(&core->irq_fifo, core->irq_buffer,
+			 sizeof(core->irq_buffer));
+	if (ret)
+		return ret;
+
+	core->irq = platform_get_irq(pdev, 0);
+	if (core->irq < 0)
+		return core->irq;
+
+	ret = devm_request_threaded_irq(&pdev->dev, core->irq,
+					wave6_vpu_core_irq,
+					wave6_vpu_core_irq_thread,
+					0, "vpu_irq", core);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to request IRQ: %d\n", ret);
+		return ret;
+	}
+
+	ret = v4l2_device_register(&pdev->dev, &core->v4l2_dev);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register v4l2_dev: %d\n", ret);
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(&pdev->dev, wave6_vpu_core_unregister_v4l2_dev, core);
+	if (ret)
+		return ret;
+
+	ret = wave6_vpu_init_m2m_dev(core);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(&pdev->dev, wave6_vpu_core_release_m2m_dev, core);
+	if (ret)
+		return ret;
+
+	core->temp_vbuf.size = ALIGN(W6_TEMPBUF_SIZE, 4096);
+	ret = wave6_vdi_alloc_dma(core->dev, &core->temp_vbuf);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to allocate temp_vbuf: %d\n", ret);
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(&pdev->dev, wave6_vpu_core_free_temp_vbuf, core);
+	if (ret)
+		return ret;
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int wave6_vpu_core_runtime_suspend(struct device *dev)
+{
+	struct vpu_core_device *core = dev_get_drvdata(dev);
+
+	if (WARN_ON(!core))
+		return -ENODEV;
+
+	if (core->vpu_held) {
+		wave6_vpu_put(core->vpu, core->reg_base);
+		core->vpu_held = false;
+	}
+
+	clk_bulk_disable_unprepare(core->num_clks, core->clks);
+
+	return 0;
+}
+
+static int wave6_vpu_core_runtime_resume(struct device *dev)
+{
+	struct vpu_core_device *core = dev_get_drvdata(dev);
+	int ret;
+
+	if (WARN_ON(!core))
+		return -ENODEV;
+
+	ret = clk_bulk_prepare_enable(core->num_clks, core->clks);
+	if (ret) {
+		dev_err(dev, "failed to enable clocks: %d\n", ret);
+		return ret;
+	}
+
+	if (atomic_read(&core->active_count)) {
+		ret = wave6_vpu_get(core->vpu, core->reg_base);
+		if (ret)
+			goto error_get_vpu;
+
+		core->vpu_held = true;
+	}
+
+	ret = wave6_vpu_core_wait_activated(core);
+	if (ret)
+		goto error_activate;
+
+	return 0;
+
+error_activate:
+	if (core->vpu_held) {
+		wave6_vpu_put(core->vpu, core->reg_base);
+		core->vpu_held = false;
+	}
+error_get_vpu:
+	clk_bulk_disable_unprepare(core->num_clks, core->clks);
+
+	return ret;
+}
+
+static int wave6_vpu_core_suspend(struct device *dev)
+{
+	struct vpu_core_device *core = dev_get_drvdata(dev);
+	int ret;
+
+	v4l2_m2m_suspend(core->m2m_dev);
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret)
+		v4l2_m2m_resume(core->m2m_dev);
+
+	return ret;
+}
+
+static int wave6_vpu_core_resume(struct device *dev)
+{
+	struct vpu_core_device *core = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;
+
+	v4l2_m2m_resume(core->m2m_dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops wave6_vpu_core_pm_ops = {
+	RUNTIME_PM_OPS(wave6_vpu_core_runtime_suspend,
+		       wave6_vpu_core_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(wave6_vpu_core_suspend,
+			    wave6_vpu_core_resume)
+};
+
+static struct platform_driver wave6_vpu_core_driver = {
+	.driver = {
+		.name = WAVE6_VPU_CORE_PLATFORM_DRIVER_NAME,
+		.pm = pm_ptr(&wave6_vpu_core_pm_ops),
+		.suppress_bind_attrs = true,
+	},
+	.probe = wave6_vpu_core_probe,
+};
+
+int __init wave6_vpu_core_register_driver(void)
+{
+	return platform_driver_register(&wave6_vpu_core_driver);
+}
+
+void wave6_vpu_core_unregister_driver(void)
+{
+	platform_driver_unregister(&wave6_vpu_core_driver);
+}
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
new file mode 100644
index 000000000000..788b1403c1d3
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
@@ -0,0 +1,106 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 core driver
+ *
+ * Copyright (C) 2026 CHIPS&MEDIA INC
+ */
+
+#ifndef __WAVE6_VPU_CORE_H__
+#define __WAVE6_VPU_CORE_H__
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
+#include <media/videobuf2-v4l2.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "wave6-vpuapi.h"
+
+#define vpu_write_reg(CORE, ADDR, DATA) wave6_vpu_writel(CORE, ADDR, DATA)
+#define vpu_write_reg_relaxed(CORE, ADDR, DATA) wave6_vpu_writel_relaxed(CORE, ADDR, DATA)
+#define vpu_read_reg(CORE, ADDR) wave6_vpu_readl(CORE, ADDR)
+#define vpu_read_reg_relaxed(CORE, ADDR) wave6_vpu_readl_relaxed(CORE, ADDR)
+
+struct vpu_buffer {
+	struct v4l2_m2m_buffer v4l2_m2m_buf;
+	bool consumed;
+	bool used;
+	bool error;
+};
+
+enum vpu_fmt_type {
+	VPU_FMT_TYPE_CODEC	= 0,
+	VPU_FMT_TYPE_RAW	= 1
+};
+
+#define VPU_FMT_FLAG_CBCR_INTERLEAVED	BIT(0)
+#define VPU_FMT_FLAG_CRCB_ORDER		BIT(1)
+
+struct vpu_format {
+	unsigned int v4l2_pix_fmt;
+	unsigned int max_width;
+	unsigned int min_width;
+	unsigned int max_height;
+	unsigned int min_height;
+	unsigned int num_planes;
+	enum frame_buffer_format fb_fmt;
+	enum endian_mode endian;
+	unsigned int flags;
+};
+
+static inline struct vpu_instance *wave6_fh_to_vpu_inst(struct v4l2_fh *vfh)
+{
+	return container_of(vfh, struct vpu_instance, v4l2_fh);
+}
+
+static inline struct vpu_instance *wave6_file_to_vpu_inst(struct file *filp)
+{
+	return wave6_fh_to_vpu_inst(file_to_v4l2_fh(filp));
+}
+
+static inline struct vpu_instance *wave6_ctrl_to_vpu_inst(struct v4l2_ctrl *vctrl)
+{
+	return container_of(vctrl->handler, struct vpu_instance, v4l2_ctrl_hdl);
+}
+
+static inline struct vpu_buffer *wave6_to_vpu_buf(struct vb2_v4l2_buffer *vbuf)
+{
+	return container_of(vbuf, struct vpu_buffer, v4l2_m2m_buf.vb);
+}
+
+static inline bool wave6_vpu_both_queues_are_streaming(struct vpu_instance *inst)
+{
+	struct vb2_queue *vq_cap = v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx);
+	struct vb2_queue *vq_out = v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx);
+
+	return vb2_is_streaming(vq_cap) && vb2_is_streaming(vq_out);
+}
+
+u32 wave6_vpu_get_consumed_fb_num(struct vpu_instance *inst);
+void wave6_vpu_core_activate(struct vpu_core_device *core);
+void wave6_vpu_core_deactivate(struct vpu_core_device *core);
+void wave6_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp,
+			  unsigned int width,
+			  unsigned int height);
+struct vb2_v4l2_buffer *wave6_get_dst_buf_by_addr(struct vpu_instance *inst,
+						  dma_addr_t addr);
+dma_addr_t wave6_get_dma_addr(struct vb2_v4l2_buffer *buf,
+			      unsigned int plane_no);
+enum codec_std wave6_to_codec_std(enum vpu_instance_type type, unsigned int v4l2_pix_fmt);
+const char *wave6_vpu_instance_state_name(enum vpu_instance_state state);
+void wave6_vpu_set_instance_state(struct vpu_instance *inst,
+				  enum vpu_instance_state state);
+int wave6_vpu_wait_interrupt(struct vpu_instance *inst, unsigned int timeout);
+void wave6_vpu_device_run_timeout(struct work_struct *work);
+void wave6_vpu_finish_job(struct vpu_instance *inst);
+int wave6_vpu_init_m2m_dev(struct vpu_core_device *core);
+void wave6_vpu_release_m2m_dev(struct vpu_core_device *core);
+int wave6_vpu_subscribe_event(struct v4l2_fh *fh,
+			      const struct v4l2_event_subscription *sub);
+void wave6_vpu_return_buffers(struct vpu_instance *inst,
+			      unsigned int type, enum vb2_buffer_state state);
+void wave6_vpu_enable_instance(struct vpu_instance *inst);
+void wave6_vpu_disable_instance(struct vpu_instance *inst);
+
+#endif /* __WAVE6_VPU_CORE_H__ */
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
new file mode 100644
index 000000000000..75371566de38
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
@@ -0,0 +1,384 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - v4l2 driver helper interface
+ *
+ * Copyright (C) 2026 CHIPS&MEDIA INC
+ */
+
+#include "wave6-vpu.h"
+#include "wave6-vpu-core.h"
+
+void wave6_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp,
+			  unsigned int width,
+			  unsigned int height)
+{
+	const struct v4l2_format_info *fmt_info;
+	unsigned int stride_y;
+
+	pix_mp->width = width;
+	pix_mp->height = height;
+	pix_mp->flags = 0;
+	pix_mp->field = V4L2_FIELD_NONE;
+	memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));
+
+	fmt_info = v4l2_format_info(pix_mp->pixelformat);
+	if (!fmt_info) {
+		pix_mp->plane_fmt[0].bytesperline = 0;
+		if (!pix_mp->plane_fmt[0].sizeimage)
+			pix_mp->plane_fmt[0].sizeimage = width * height;
+
+		return;
+	}
+
+	stride_y = width * fmt_info->bpp[0];
+	if (pix_mp->plane_fmt[0].bytesperline <= W6_MAX_PIC_STRIDE)
+		stride_y = max(stride_y, pix_mp->plane_fmt[0].bytesperline);
+	stride_y = round_up(stride_y, W6_PIC_STRIDE_ALIGNMENT);
+	pix_mp->plane_fmt[0].bytesperline = stride_y;
+	pix_mp->plane_fmt[0].sizeimage = stride_y * height;
+
+	stride_y = DIV_ROUND_UP(stride_y, fmt_info->bpp[0]);
+
+	for (int i = 1; i < fmt_info->comp_planes; i++) {
+		unsigned int stride_c, sizeimage_c;
+
+		stride_c = DIV_ROUND_UP(stride_y, fmt_info->hdiv) *
+			   fmt_info->bpp[i];
+		sizeimage_c = stride_c * DIV_ROUND_UP(height, fmt_info->vdiv);
+
+		if (fmt_info->mem_planes == 1) {
+			pix_mp->plane_fmt[0].sizeimage += sizeimage_c;
+		} else {
+			pix_mp->plane_fmt[i].bytesperline = stride_c;
+			pix_mp->plane_fmt[i].sizeimage = sizeimage_c;
+		}
+	}
+}
+
+dma_addr_t wave6_get_dma_addr(struct vb2_v4l2_buffer *buf, unsigned int plane_no)
+{
+	return vb2_dma_contig_plane_dma_addr(&buf->vb2_buf, plane_no) +
+			buf->planes[plane_no].data_offset;
+}
+
+struct vb2_v4l2_buffer *wave6_get_dst_buf_by_addr(struct vpu_instance *inst,
+						  dma_addr_t addr)
+{
+	struct vb2_v4l2_buffer *vb2_v4l2_buf;
+	struct v4l2_m2m_buffer *v4l2_m2m_buf;
+	struct vb2_v4l2_buffer *dst_buf = NULL;
+
+	v4l2_m2m_for_each_dst_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {
+		vb2_v4l2_buf = &v4l2_m2m_buf->vb;
+		if (addr == wave6_get_dma_addr(vb2_v4l2_buf, 0)) {
+			dst_buf = vb2_v4l2_buf;
+			break;
+		}
+	}
+
+	return dst_buf;
+}
+
+enum codec_std wave6_to_codec_std(enum vpu_instance_type type, unsigned int v4l2_pix_fmt)
+{
+	enum codec_std std = STD_UNKNOWN;
+
+	if (v4l2_pix_fmt == V4L2_PIX_FMT_H264)
+		std = (type == VPU_INST_TYPE_DEC) ? W_AVC_DEC : W_AVC_ENC;
+	else if (v4l2_pix_fmt == V4L2_PIX_FMT_HEVC)
+		std = (type == VPU_INST_TYPE_DEC) ? W_HEVC_DEC : W_HEVC_ENC;
+
+	return std;
+}
+
+const char *wave6_vpu_instance_state_name(enum vpu_instance_state state)
+{
+	switch (state) {
+	case VPU_INST_STATE_NONE:
+		return "none";
+	case VPU_INST_STATE_OPEN:
+		return "open";
+	case VPU_INST_STATE_INIT_SEQ:
+		return "init_seq";
+	case VPU_INST_STATE_PIC_RUN:
+		return "pic_run";
+	case VPU_INST_STATE_SEEK:
+		return "seek";
+	case VPU_INST_STATE_ERROR:
+		return "error";
+	default:
+		return "unknown";
+	}
+}
+
+static bool wave6_vpu_valid_instance_transition(struct vpu_instance *inst,
+						enum vpu_instance_state next)
+{
+	bool is_decoder = (inst->type == VPU_INST_TYPE_DEC);
+
+	switch (inst->state) {
+	case VPU_INST_STATE_NONE:
+		/* to OPEN: instance created */
+		if (next == VPU_INST_STATE_OPEN)
+			return true;
+		break;
+	case VPU_INST_STATE_OPEN:
+		if (is_decoder) {
+			/* to NONE: instance destroyed */
+			/* to INIT_SEQ: sequence header parsed */
+			/* to SEEK: output stop_streaming called */
+			if (next == VPU_INST_STATE_NONE ||
+			    next == VPU_INST_STATE_INIT_SEQ ||
+			    next == VPU_INST_STATE_SEEK)
+				return true;
+		}
+		break;
+	case VPU_INST_STATE_INIT_SEQ:
+		if (is_decoder) {
+			/* to NONE: instance destroyed */
+			/* to PIC_RUN: frame buffers registered */
+			/* to SEEK: output stop_streaming called */
+			if (next == VPU_INST_STATE_NONE ||
+			    next == VPU_INST_STATE_PIC_RUN ||
+			    next == VPU_INST_STATE_SEEK)
+				return true;
+		}
+		break;
+	case VPU_INST_STATE_PIC_RUN:
+		if (is_decoder) {
+			/* to NONE: instance destroyed */
+			/* to INIT_SEQ: new sequence header parsed */
+			/* to SEEK: output stop_streaming called */
+			/* to ERROR: decode command failed */
+			if (next == VPU_INST_STATE_NONE ||
+			    next == VPU_INST_STATE_INIT_SEQ ||
+			    next == VPU_INST_STATE_SEEK ||
+			    next == VPU_INST_STATE_ERROR)
+				return true;
+		}
+		break;
+	case VPU_INST_STATE_SEEK:
+		if (is_decoder) {
+			/* to NONE: instance destroyed */
+			/* to OPEN/INIT_SEQ/PIC_RUN/ERROR: */
+			/*   previous state restored on output start_streaming */
+			if (next == VPU_INST_STATE_NONE ||
+			    next == VPU_INST_STATE_OPEN ||
+			    next == VPU_INST_STATE_INIT_SEQ ||
+			    next == VPU_INST_STATE_PIC_RUN ||
+			    next == VPU_INST_STATE_ERROR)
+				return true;
+		}
+		break;
+	case VPU_INST_STATE_ERROR:
+		if (is_decoder) {
+			/* to NONE: instance destroyed */
+			/* to SEEK: output stop_streaming called */
+			if (next == VPU_INST_STATE_NONE ||
+			    next == VPU_INST_STATE_SEEK)
+				return true;
+		}
+		break;
+	}
+
+	dev_err(inst->dev->dev, "[%d] invalid transition: %s -> %s\n",
+		inst->id,
+		wave6_vpu_instance_state_name(inst->state),
+		wave6_vpu_instance_state_name(next));
+
+	return false;
+}
+
+void wave6_vpu_set_instance_state(struct vpu_instance *inst,
+				  enum vpu_instance_state state)
+{
+	if (!wave6_vpu_valid_instance_transition(inst, state))
+		return;
+
+	dev_dbg(inst->dev->dev, "[%d] %s -> %s\n",
+		inst->id,
+		wave6_vpu_instance_state_name(inst->state),
+		wave6_vpu_instance_state_name(state));
+
+	inst->state = state;
+}
+
+int wave6_vpu_wait_interrupt(struct vpu_instance *inst, unsigned int timeout)
+{
+	int ret;
+
+	ret = wait_for_completion_timeout(&inst->irq_done,
+					  msecs_to_jiffies(timeout));
+	if (!ret)
+		return -ETIMEDOUT;
+
+	reinit_completion(&inst->irq_done);
+
+	return 0;
+}
+
+int wave6_vpu_subscribe_event(struct v4l2_fh *fh,
+			      const struct v4l2_event_subscription *sub)
+{
+	struct vpu_instance *inst = wave6_fh_to_vpu_inst(fh);
+	bool is_decoder = inst->type == VPU_INST_TYPE_DEC;
+
+	dev_dbg(inst->dev->dev, "%s: [%s] type: %d id: %d | flags: %d\n",
+		__func__, is_decoder ? "decoder" : "encoder", sub->type,
+		sub->id, sub->flags);
+
+	switch (sub->type) {
+	case V4L2_EVENT_SOURCE_CHANGE:
+		if (is_decoder)
+			return v4l2_src_change_event_subscribe(fh, sub);
+		return -EINVAL;
+	case V4L2_EVENT_CTRL:
+		return v4l2_ctrl_subscribe_event(fh, sub);
+	default:
+		return -EINVAL;
+	}
+}
+
+void wave6_vpu_return_buffers(struct vpu_instance *inst,
+			      unsigned int type, enum vb2_buffer_state state)
+{
+	struct vb2_v4l2_buffer *buf;
+
+	if (V4L2_TYPE_IS_OUTPUT(type)) {
+		while ((buf = v4l2_m2m_src_buf_remove(inst->v4l2_fh.m2m_ctx)))
+			v4l2_m2m_buf_done(buf, state);
+	} else {
+		while ((buf = v4l2_m2m_dst_buf_remove(inst->v4l2_fh.m2m_ctx))) {
+			for (int i = 0; i < inst->dst_fmt.num_planes; i++)
+				vb2_set_plane_payload(&buf->vb2_buf, i, 0);
+			v4l2_m2m_buf_done(buf, state);
+		}
+	}
+}
+
+u32 wave6_vpu_get_consumed_fb_num(struct vpu_instance *inst)
+{
+	struct vb2_v4l2_buffer *vb2_v4l2_buf;
+	struct v4l2_m2m_buffer *v4l2_m2m_buf;
+	struct vpu_buffer *vpu_buf;
+	u32 num = 0;
+
+	v4l2_m2m_for_each_dst_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {
+		vb2_v4l2_buf = &v4l2_m2m_buf->vb;
+		vpu_buf = wave6_to_vpu_buf(vb2_v4l2_buf);
+		if (vpu_buf->consumed)
+			num++;
+	}
+
+	return num;
+}
+
+static bool wave6_vpu_check_fb_available(struct vpu_instance *inst)
+{
+	struct vb2_v4l2_buffer *vb2_v4l2_buf;
+	struct v4l2_m2m_buffer *v4l2_m2m_buf;
+	struct vpu_buffer *vpu_buf;
+
+	v4l2_m2m_for_each_dst_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {
+		vb2_v4l2_buf = &v4l2_m2m_buf->vb;
+		vpu_buf = wave6_to_vpu_buf(vb2_v4l2_buf);
+
+		if (!vpu_buf->used)
+			return true;
+	}
+
+	return false;
+}
+
+static int wave6_vpu_job_ready(void *priv)
+{
+	struct vpu_instance *inst = priv;
+
+	dev_dbg(inst->dev->dev, "[%d]%s: state %d\n",
+		inst->id, __func__, inst->state);
+
+	if (inst->state == VPU_INST_STATE_OPEN)
+		return 1;
+	if (inst->state < VPU_INST_STATE_PIC_RUN)
+		return 0;
+	if (inst->state == VPU_INST_STATE_ERROR)
+		return 0;
+	if (!wave6_vpu_check_fb_available(inst))
+		return 0;
+
+	return 1;
+}
+
+void wave6_vpu_device_run_timeout(struct work_struct *work)
+{
+	struct vpu_instance *inst = container_of(to_delayed_work(work),
+						 struct vpu_instance, task_timer);
+	struct vb2_v4l2_buffer *src_buf = NULL;
+	struct vb2_v4l2_buffer *dst_buf = NULL;
+
+	dev_err(inst->dev->dev, "[%d] sequence %d timeout\n", inst->id, inst->sequence);
+	src_buf = v4l2_m2m_src_buf_remove(inst->v4l2_fh.m2m_ctx);
+	if (src_buf) {
+		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+		if (inst->type == VPU_INST_TYPE_DEC)
+			inst->processed_buf_num++;
+		inst->error_buf_num++;
+	}
+
+	dst_buf = v4l2_m2m_dst_buf_remove(inst->v4l2_fh.m2m_ctx);
+	if (dst_buf)
+		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
+
+	vb2_queue_error(v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx));
+	vb2_queue_error(v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx));
+
+	v4l2_m2m_job_finish(inst->dev->m2m_dev, inst->v4l2_fh.m2m_ctx);
+}
+
+static void wave6_vpu_device_run(void *priv)
+{
+	struct vpu_instance *inst = priv;
+	int ret;
+
+	dev_dbg(inst->dev->dev, "[%d]%s: state %d\n",
+		inst->id, __func__, inst->state);
+
+	ret = inst->ops->prepare_process(inst);
+	if (ret) {
+		v4l2_m2m_job_finish(inst->dev->m2m_dev, inst->v4l2_fh.m2m_ctx);
+		return;
+	}
+
+	schedule_delayed_work(&inst->task_timer, msecs_to_jiffies(W6_VPU_TIMEOUT));
+
+	ret = inst->ops->start_process(inst);
+	if (ret)
+		wave6_vpu_finish_job(inst);
+}
+
+void wave6_vpu_finish_job(struct vpu_instance *inst)
+{
+	cancel_delayed_work(&inst->task_timer);
+	v4l2_m2m_job_finish(inst->dev->m2m_dev, inst->v4l2_fh.m2m_ctx);
+}
+
+static const struct v4l2_m2m_ops wave6_vpu_m2m_ops = {
+	.device_run = wave6_vpu_device_run,
+	.job_ready = wave6_vpu_job_ready,
+};
+
+int wave6_vpu_init_m2m_dev(struct vpu_core_device *core)
+{
+	core->m2m_dev = v4l2_m2m_init(&wave6_vpu_m2m_ops);
+	if (IS_ERR(core->m2m_dev)) {
+		dev_err(core->dev, "v4l2_m2m_init fail\n");
+		return PTR_ERR(core->m2m_dev);
+	}
+
+	return 0;
+}
+
+void wave6_vpu_release_m2m_dev(struct vpu_core_device *core)
+{
+	v4l2_m2m_release(core->m2m_dev);
+}
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu.c b/drivers/media/platform/chips-media/wave6/wave6-vpu.c
index 9160ce53062c..54a6567bc64a 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-vpu.c
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.c
@@ -773,7 +773,29 @@ static struct platform_driver wave6_vpu_driver = {
 	.remove = wave6_vpu_remove,
 };
 
-module_platform_driver(wave6_vpu_driver);
+static int __init wave6_vpu_init(void)
+{
+	int ret;
+
+	ret = wave6_vpu_core_register_driver();
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&wave6_vpu_driver);
+	if (ret)
+		wave6_vpu_core_unregister_driver();
+
+	return ret;
+}
+module_init(wave6_vpu_init);
+
+static void __exit wave6_vpu_exit(void)
+{
+	platform_driver_unregister(&wave6_vpu_driver);
+	wave6_vpu_core_unregister_driver();
+}
+module_exit(wave6_vpu_exit);
+
 MODULE_DESCRIPTION("chips&media Wave6 VPU driver");
 MODULE_AUTHOR("CHIPS&MEDIA INC");
 MODULE_FIRMWARE("cnm/wave633c_imx9_codec_fw.bin");
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu.h b/drivers/media/platform/chips-media/wave6/wave6-vpu.h
index 96d67e931e71..35a1d9f8a003 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-vpu.h
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.h
@@ -133,5 +133,7 @@ int wave6_vpu_get(struct wave6_vpu_device *vpu, void __iomem *core_base);
 void wave6_vpu_put(struct wave6_vpu_device *vpu, void __iomem *core_base);
 void wave6_vpu_require_work_buffer(struct wave6_vpu_device *vpu,
 				   void __iomem *core_base);
+int wave6_vpu_core_register_driver(void);
+void wave6_vpu_core_unregister_driver(void);
 
 #endif /* __WAVE6_VPU_H__ */
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h b/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
new file mode 100644
index 000000000000..62dd4969afaf
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
@@ -0,0 +1,381 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 helper interface
+ *
+ * Copyright (C) 2026 CHIPS&MEDIA INC
+ */
+
+#ifndef __WAVE6_VPUAPI_H__
+#define __WAVE6_VPUAPI_H__
+
+#include <linux/bitfield.h>
+#include <linux/kfifo.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-ctrls.h>
+
+#include "wave6-vpuconfig.h"
+#include "wave6-vdi.h"
+#include "wave6-vpu.h"
+
+struct vpu_attr;
+
+enum vpu_instance_type {
+	VPU_INST_TYPE_DEC,
+	VPU_INST_TYPE_ENC
+};
+
+/**
+ * enum vpu_instance_state - VPU instance states
+ * @VPU_INST_STATE_NONE:	Instance is not created or has been destroyed
+ * @VPU_INST_STATE_OPEN:	Instance is created
+ * @VPU_INST_STATE_INIT_SEQ:	For decoder, sequence header is parsed
+ *				For encoder, parameter configuration is complete
+ * @VPU_INST_STATE_PIC_RUN:	Instance is decoding or encoding
+ * @VPU_INST_STATE_SEEK:	Ready to seek a decoding resume point
+ *				Valid only for decoder
+ * @VPU_INST_STATE_ERROR:	A command failed, no more jobs are run
+ */
+enum vpu_instance_state {
+	VPU_INST_STATE_NONE,
+	VPU_INST_STATE_OPEN,
+	VPU_INST_STATE_INIT_SEQ,
+	VPU_INST_STATE_PIC_RUN,
+	VPU_INST_STATE_SEEK,
+	VPU_INST_STATE_ERROR
+};
+
+#define WAVE6_MAX_FBS 31
+
+enum codec_std {
+	W_HEVC_DEC	= 0x00,
+	W_HEVC_ENC	= 0x01,
+	W_AVC_DEC	= 0x02,
+	W_AVC_ENC	= 0x03,
+	STD_UNKNOWN	= 0xFF
+};
+
+#define FW_VERSION_MAJOR_MASK	0xFF000000
+#define FW_VERSION_MINOR_MASK	0x00FF0000
+#define FW_VERSION_REL_MASK	0x0000FFFF
+#define FW_VERSION_MAJOR(x)	FIELD_GET(FW_VERSION_MAJOR_MASK, (x))
+#define FW_VERSION_MINOR(x)	FIELD_GET(FW_VERSION_MINOR_MASK, (x))
+#define FW_VERSION_REL(x)	FIELD_GET(FW_VERSION_REL_MASK, (x))
+
+enum chroma_format_idc {
+	C_FMT_IDC_YUV400,
+	C_FMT_IDC_YUV420,
+	C_FMT_IDC_YUV422,
+	C_FMT_IDC_YUV444,
+	C_FMT_IDC_RGB
+};
+
+enum frame_buffer_format {
+	FORMAT_ERR = -1,
+
+	FORMAT_420 = 0,
+	FORMAT_422,
+	FORMAT_224,
+	FORMAT_444,
+	FORMAT_400,
+
+	FORMAT_420_P10_16BIT_MSB = 5,
+	FORMAT_420_P10_16BIT_LSB,
+	FORMAT_420_P10_32BIT_MSB,
+	FORMAT_420_P10_32BIT_LSB,
+
+	FORMAT_422_P10_16BIT_MSB,
+	FORMAT_422_P10_16BIT_LSB,
+	FORMAT_422_P10_32BIT_MSB,
+	FORMAT_422_P10_32BIT_LSB,
+
+	FORMAT_444_P10_16BIT_MSB,
+	FORMAT_444_P10_16BIT_LSB,
+	FORMAT_444_P10_32BIT_MSB,
+	FORMAT_444_P10_32BIT_LSB,
+
+	FORMAT_400_P10_16BIT_MSB,
+	FORMAT_400_P10_16BIT_LSB,
+	FORMAT_400_P10_32BIT_MSB,
+	FORMAT_400_P10_32BIT_LSB,
+
+	FORMAT_YUYV,
+	FORMAT_YUYV_P10_16BIT_MSB,
+	FORMAT_YUYV_P10_16BIT_LSB,
+	FORMAT_YUYV_P10_32BIT_MSB,
+	FORMAT_YUYV_P10_32BIT_LSB,
+
+	FORMAT_YVYU,
+	FORMAT_YVYU_P10_16BIT_MSB,
+	FORMAT_YVYU_P10_16BIT_LSB,
+	FORMAT_YVYU_P10_32BIT_MSB,
+	FORMAT_YVYU_P10_32BIT_LSB,
+
+	FORMAT_UYVY,
+	FORMAT_UYVY_P10_16BIT_MSB,
+	FORMAT_UYVY_P10_16BIT_LSB,
+	FORMAT_UYVY_P10_32BIT_MSB,
+	FORMAT_UYVY_P10_32BIT_LSB,
+
+	FORMAT_VYUY,
+	FORMAT_VYUY_P10_16BIT_MSB,
+	FORMAT_VYUY_P10_16BIT_LSB,
+	FORMAT_VYUY_P10_32BIT_MSB,
+	FORMAT_VYUY_P10_32BIT_LSB,
+
+	FORMAT_RGB_32BIT_PACKED = 90,
+	FORMAT_YUV444_32BIT_PACKED,
+	FORMAT_RGB_P10_32BIT_PACKED,
+	FORMAT_YUV444_P10_32BIT_PACKED,
+
+	FORMAT_RGB_24BIT_PACKED = 95,
+	FORMAT_YUV444_24BIT_PACKED,
+	FORMAT_YUV444_24BIT,
+
+	FORMAT_MAX,
+};
+
+enum pic_type {
+	PIC_TYPE_I = 0,
+	PIC_TYPE_P = 1,
+	PIC_TYPE_B = 2,
+	PIC_TYPE_IDR = 5,
+	PIC_TYPE_MAX
+};
+
+enum display_mode {
+	DISP_MODE_DISP_ORDER,
+	DISP_MODE_DEC_ORDER,
+};
+
+enum sw_reset_mode {
+	SW_RESET_SAFETY,
+	SW_RESET_FORCE,
+	SW_RESET_ON_BOOT
+};
+
+enum tiled_map_type {
+	LINEAR_FRAME_MAP = 0,
+	COMPRESSED_FRAME_MAP = 17,
+};
+
+enum aux_buffer_type {
+	AUX_BUF_FBC_Y_TBL,
+	AUX_BUF_FBC_C_TBL,
+	AUX_BUF_MV_COL,
+	AUX_BUF_SUB_SAMPLE,
+	AUX_BUF_TYPE_MAX,
+};
+
+struct vpu_attr {
+	u32 product_id;
+	u32 product_code;
+	u32 product_version;
+	u32 fw_version;
+	u32 fw_revision;
+	u32 hw_version;
+	u32 support_decoders;
+	u32 support_encoders;
+	bool support_avc10bit_dec;
+	bool support_hevc10bit_dec;
+	bool support_avc10bit_enc;
+	bool support_hevc10bit_enc;
+	bool support_dual_core;
+};
+
+struct frame_buffer {
+	dma_addr_t buf_y;
+	dma_addr_t buf_cb;
+	dma_addr_t buf_cr;
+	enum tiled_map_type map_type;
+	unsigned int stride;
+	unsigned int stride_c;
+	unsigned int height;
+	u32 luma_bit_depth: 4;
+	u32 chroma_bit_depth: 4;
+	enum chroma_format_idc c_fmt_idc;
+};
+
+struct vpu_rect {
+	u32 left;
+	u32 top;
+	u32 right;
+	u32 bottom;
+};
+
+struct instance_buffer {
+	dma_addr_t temp_base;
+	u32 temp_size;
+};
+
+struct dec_scaler_info {
+	bool enable;
+	int width;
+	int height;
+};
+
+/**
+ * struct vpu_irq - VPU interrupt information
+ * @status:	Value of the VPU interrupt status
+ * @inst_idc:	Bitmask of instance IDs for this interrupt
+ */
+struct vpu_irq {
+	u32 status;
+	u32 inst_idc;
+};
+
+/**
+ * struct vpu_core_device - VPU core driver structure
+ * @dev:		Platform device pointer
+ * @vpu:		Parent VPU driver structure
+ * @v4l2_dev:		V4L2 device
+ * @m2m_dev:		V4L2 mem2mem device
+ * @instances:		List of VPU instances
+ * @inst_lock:		Spinlock protecting instance list
+ * @dev_lock:		Mutex protecting video_device, src, dst vb2_queue
+ * @hw_lock:		Mutex protecting register access
+ * @attr:		Hardware attributes retrieved after boot
+ * @reg_base:		Base address of MMIO registers
+ * @temp_vbuf:		TEMP buffer
+ * @clks:		Array of clock handles
+ * @num_clks:		Number of entries in @clks
+ * @irq_fifo:		kfifo storing interrupt information
+ * @irq_buffer:		Buffer used by @irq_fifo
+ * @irq:		Interrupt number
+ * @res:		Device compatible data
+ * @active_count:	Number of decoder/encoder instances using the core
+ * @vpu_held:		Core holds a reference taken by wave6_vpu_get()
+ */
+struct vpu_core_device {
+	struct device *dev;
+	struct wave6_vpu_device *vpu;
+	struct v4l2_device v4l2_dev;
+	struct v4l2_m2m_dev *m2m_dev;
+	struct list_head instances;
+	spinlock_t inst_lock; /* Protects instance list */
+	struct mutex dev_lock; /* Protects video_device, src, dst vb2_queue */
+	struct mutex hw_lock; /* Protects register access */
+	struct vpu_attr	attr;
+	void __iomem *reg_base;
+
+	/* Allocates per-core, used during decode/encode process. */
+	struct vpu_buf temp_vbuf;
+
+	struct clk_bulk_data *clks;
+	int num_clks;
+
+	/* Stores interrupt information quickly, consumed in irq_thread. */
+	struct kfifo irq_fifo;
+	struct vpu_irq irq_buffer[MAX_NUM_INSTANCE];
+	int irq;
+
+	const struct wave6_vpu_core_resource *res;
+	atomic_t active_count;
+	bool vpu_held;
+};
+
+struct vpu_instance;
+
+struct vpu_instance_ops {
+	int (*prepare_process)(struct vpu_instance *inst);
+	int (*start_process)(struct vpu_instance *inst);
+	void (*finish_process)(struct vpu_instance *inst, bool error);
+};
+
+/**
+ * struct vpu_instance - VPU instance structure
+ * @list:		List head for VPU core device instance list
+ * @v4l2_fh:		V4L2 file handler
+ * @v4l2_ctrl_hdl:	V4L2 control handler
+ * @dev:		VPU core driver structure
+ * @irq_done:		Completion for command finish
+ * @task_timer:		Watchdog of the running decode/encode job
+ * @lock:		Protects the drain state
+ * @enable:		Instance enable flag
+ * @src_fmt:		V4L2 pixel format for source
+ * @dst_fmt:		V4L2 pixel format for destination
+ * @crop:		Crop rectangle
+ * @scaler_info:	Decoder scaler information
+ * @colorspace:		V4L2 colorspace
+ * @xfer_func:		V4L2 transfer function
+ * @ycbcr_enc:		V4L2 YCbCr encoding
+ * @quantization:	V4L2 quantization
+ * @state:		Instance state
+ * @state_in_seek:	Previous state before seek
+ * @type:		Instance type (decoder or encoder)
+ * @ops:		Instance operations
+ * @std:		Codec standard
+ * @id:			Instance id
+ * @frame_buf:		Metadata for reference frame buffers
+ * @frame_vbuf:		Reference frame buffers
+ * @aux_vbuf:		Auxiliary buffers
+ * @fbc_buf_registered:	Reference frame buffers registration flag
+ * @queued_src_buf_num:	number of queued source buffers
+ * @queued_dst_buf_num:	number of queued destination buffers
+ * @processed_buf_num:	number of processed buffers
+ * @error_buf_num:	number of error buffers
+ * @sequence:		V4L2 buffers sequence number
+ * @drain_src_buf_num:	Number of OUTPUT buffers left to decode in the drain
+ * @drain:		Decoder drain is in progress
+ * @next_dst_buf_last:	Next queued CAPTURE buffer is returned as the last one
+ * @cbcr_interleave:	CbCr interleave format flag
+ * @nv21:		NV21 format flag
+ * @disp_mode:		Display mode for decoder V4L2 control
+ */
+struct vpu_instance {
+	struct list_head list;
+	struct v4l2_fh v4l2_fh;
+	struct v4l2_ctrl_handler v4l2_ctrl_hdl;
+	struct vpu_core_device *dev;
+
+	/* Signals when INIT_SEQ, SET_PARAM command is done. */
+	struct completion irq_done;
+
+	/* Detects hangs during decode/encode and aborts if needed. */
+	struct delayed_work task_timer;
+
+	/* Protects the drain state. */
+	struct mutex lock;
+
+	bool enable;
+
+	struct v4l2_pix_format_mplane src_fmt;
+	struct v4l2_pix_format_mplane dst_fmt;
+	struct v4l2_rect crop;
+	struct dec_scaler_info scaler_info;
+	enum v4l2_colorspace colorspace;
+	enum v4l2_xfer_func xfer_func;
+	enum v4l2_ycbcr_encoding ycbcr_enc;
+	enum v4l2_quantization quantization;
+
+	enum vpu_instance_state state;
+	enum vpu_instance_state state_in_seek;
+	enum vpu_instance_type type;
+	const struct vpu_instance_ops *ops;
+
+	enum codec_std std;
+	u32 id;
+	struct frame_buffer frame_buf[WAVE6_MAX_FBS];
+	struct vpu_buf frame_vbuf[WAVE6_MAX_FBS];
+	struct vpu_buf aux_vbuf[AUX_BUF_TYPE_MAX][WAVE6_MAX_FBS];
+	bool fbc_buf_registered;
+	u32 queued_src_buf_num;
+	u32 queued_dst_buf_num;
+	u32 processed_buf_num;
+	u32 error_buf_num;
+	u32 sequence;
+	u32 drain_src_buf_num;
+	bool drain;
+	bool next_dst_buf_last;
+	bool cbcr_interleave;
+	bool nv21;
+
+	enum display_mode disp_mode;
+};
+
+void wave6_vpu_writel(struct vpu_core_device *core, u32 addr, u32 data);
+void wave6_vpu_writel_relaxed(struct vpu_core_device *core, u32 addr, u32 data);
+u32 wave6_vpu_readl(struct vpu_core_device *core, u32 addr);
+u32 wave6_vpu_readl_relaxed(struct vpu_core_device *core, u32 addr);
+
+#endif /* __WAVE6_VPUAPI_H__ */
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h b/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
index 1d4e016c2a58..fccb854a8a8c 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
@@ -18,13 +18,19 @@
 #define W6_VPU_MAX_NUM_CORE		4
 #define MAX_NUM_INSTANCE		32
 
+#define W6_MAX_PIC_STRIDE		(4096 * 4)
+#define W6_PIC_STRIDE_ALIGNMENT		32
+
 #define W6_VPU_POLL_DELAY_US		10
 #define W6_VPU_POLL_TIMEOUT		300000
+#define W6_BOOT_WAIT_TIMEOUT		10000
+#define W6_VPU_TIMEOUT			6000
 
 #define W6_MAX_REMAP_PAGE_SIZE		(1024 * 1024)
 #define W6_MAX_CODE_BUF_SIZE		(4 * 1024 * 1024)
 #define W6_CODE_BUF_SIZE		(1 * 1024 * 1024)
 #define W6_EXTRA_CODE_BUF_SIZE		(256 * 1024)
+#define W6_TEMPBUF_SIZE			(3 * 1024 * 1024)
 #define W637DEC_WORKBUF_SIZE_FOR_CQ	(3 * 512 * 1024)
 
 static inline bool wave6_is_product_w_series(u32 code)
-- 
2.41.0.windows.3

