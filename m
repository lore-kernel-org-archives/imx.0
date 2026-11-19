Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.110
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795078837;
	b=YhGyQOUSMk9J3j6qeefUDOctCS6K/G46NqBnDlGogsVwODPDPjNzBF23Ukzsnoh7iqCl
	 9lKWRY6IklQo+oiivGIZdwrrMGM0ugbhDYy5qy4WZGCPX8Sqb84YkhKMrWAUytccDxQJ1
	 flpOLqCsb2pXIJldKGruFnvaYB9nQVDrJ/vT7rW5+5gjyzOvSGAXtH7P5Z/8BwBPs4p87
	 qQdsn0SJVXIpAPADbjKcEZWEbeTFXZiApqBABja2FyM9C/cipjhmGzz3zSzgGfS5UES8K
	 oqsymlAJg6R4rO4IGeWbE4L7AjdjtvBN3tm0crV62xjB7Hnd8bszsEhUeumcnguSM5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078837;
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
	bh=ihZubIXTDVndzyiTgzIfjjN6Ofo/CQlSv/yUPYVULiI=;
	b=hWU2cgh6xN2bQQbNUavrPwbTDSpI++4KLEOSuwHvkrYr+q30Gqa/Nrbe4gbyIb1LyyQn
	 2ZTCtng1ZPPVfr6NqO80oFNZgDtDo8nI+lcb3zRN+H72olNg1tGy4xUh0A0CN5qn8R80f
	 IjSuPWPH6Qy5nIw9x9AC/QYDYm36Mne5RROuah9+9sj4DlSapmzMpXB61oN9/928dnJP6
	 MHd9BcNrbMtJwv7fHsQ+cct7CuDgoQHfYcmU4GdC/+0G2C2nU/VKuM8eyXrNkVrROs0Ms
	 swdATFND7aah/WF8/l1eUlbTS9bER9WElLrp+e1H9zgkWi/kW9T6jfOzkqQaSMpTn2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chipsnmedia.com;
	spf=fail smtp.mailfrom=chipsnmedia.com;
	dkim=pass header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=i6xIwsQj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.110
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021110.outbound.protection.outlook.com [40.107.42.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562E560A2622
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 09:00:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 562E560A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=i6xIwsQj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kAhovdbmlSrFj7FdFyNkTnP6UL+ZKnlaQlb8z4O2oaCAc69YBISYreOZl8s34Odv0tpIuI3P3UhchtbG9OmBqYR6cOuJF4iTgW7mLZNO8YwQYeBh3Iywe0oGxHEUtoOxhljfTwA7zfw99WcybbmekshUk/XcWoUCpLaYW37P4fDR5xUuKmFdTAIa+XkYzhT0N7UmoTgucSUJzD3o4qZN0P+RCrqQN+D+7wonOloLLlXpTIUjNyOi0iHj187GRFKUQ38uIFISrwljtIU8TooWQ4FbNK2Qz4k2c1UaORVdHFSVBw+BKpkvXIauXUlZmepUTG9LtMqjrg48QyFcZCzAKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihZubIXTDVndzyiTgzIfjjN6Ofo/CQlSv/yUPYVULiI=;
 b=fW88pxquwf94SCuKZx5jXzR2eaa1W/eCDdn3TynImi5/Dg9OkEOOD20x7vMfLFvtJDI+c09AL0Ba5CqxvhbKdpIdH8C+PZ/k3uSEllw1JSQKr1uXZVFUclNUEUO6oetX72SQjk3K6P9tv6rnSDEL0BA0CFNlckZBwZUnIWmtKBN6L7dBZ8qLV7GtxwFIZxkg/v1dHFknlGvdl6jl0LUknTUNqLjZ84k1xvfaqkK867/7PFZ/GZ6vC4GiLOGZ+VB+dutCa3DtXzbhmeGWCeM+EoNx+oYBPEhtZokPyUAWINu8rhQemSuWdJ+wjaMsJdfTsZh5DzqmUmQF/zOM0grqBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihZubIXTDVndzyiTgzIfjjN6Ofo/CQlSv/yUPYVULiI=;
 b=i6xIwsQjRGBkJb96CTUNAS57KaZtP1aUlpRmccN9gGDwXh8ejCEeyAEFXtxC/TbokG48prlm16xt717hF29pNuOsnJyt+/bfCSUR0Gt5vganKzVnk1QC3MNflT0grD5aU3AYFfI95iSVkAeq0WcooSTU54A2mBFXy4FMkVSSsLSTHO3HkXHelpsa9KSR5E8uBtoYc75oRwZfCAAouqGJc3oSSpo0vQZ5CWOJWs1fwYOOyXROJeLEv7drki1JQS7+BYErOnTFYudVt7iB+3idI0jLyUaGKMFWH9X6occQTttstO3i0s78BSWt8SiwdPvnpg7AcL0FH3Emd3ChqlTXzQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SL2P216MB1466.KORP216.PROD.OUTLOOK.COM (2603:1096:101:33::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 09:00:28 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 09:00:28 +0000
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
Subject: [PATCH v8 08/11] media: chips-media: wave6: Add trace and debugfs
Date: Thu, 19 Nov 2026 18:00:02 +0900
Message-Id: <761d894fbe7d4696719e8c8afd1deba3fc591c62.1795075581.git.nas.chung@chipsnmedia.com>
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
X-MS-TrafficTypeDiagnostic: SL2P216MB2441:EE_|SL2P216MB1466:EE_
X-MS-Office365-Filtering-Correlation-Id: ee81d9f1-5b62-4a58-aaab-08df461b8e90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|52116014|376014|1800799024|366016|22082099003|18002099003|6133799003|3023799007|56012099006|10067099003|261026140227099003|261026121527099003|261028144727099003|261021123027099003|261022105027099003|261021121427099003|261022075727099003|261009223027099003|261102123227099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	WuYb0Yr1hqYN6UlSO3sthRnd92PcFrY5T54h0VRCb8Ks5l7TdrTYRBfGlN51Qk6XtTlOiAYCELbli8OqQ0NDDOEZQk2iW4rcgG3IKWa6qX291NTba7WbQRfCxet3sGNc5aRsnZCG30RTRjVMB0SLfNWWe51Cd5XZ5xPaMJBSdvmkdUUKMqzdkvinlMa6ZREjgwXKSEJ6oKcKaA9kzV6uTZ6d4CNvVu309kQBTBRwLCIJKKKWwY89EltZFd9JXtf1X/GSrbbmSOjBrfED7pI+JrgT1lh3dvPmlN0MedBs/+DkS+49acRlUYSdLdU1oKJ2JAidqsx0d6t6Ks4SNUZ9ai5tCOG1zUk90ZV805fYCLcCl/2O+4QZ8ilrIembg0AOr91cl3aRUnOxnJSatvhIrxSqTwQuRKcnxEllM36NHnXPHCozmTT6xrivBsLbA/sQD5O0eVMKVa6ka8s9rbyI8Xf5fEo5jKlCLuzmfdWC9LQGQ6CE9d1LQ2hf3jXb/Zte1/BdKdTIoi/fc5UwIplyn4FN4Qrwuom3laJKfJjj/8CKtWPBsiSpa3s7JraHDkcDxuG4LRLmk8RCculKVm9IO3RxTCkzC9MS3/WSNW0n95u5EJN1ChZBFjRnKAJ0r4QVulvlB4LhTrvAqkmGn7585nwhV+9FeNoLaMuzed4sWZ4PMr0fMcF6jhd58mdP/hiZUbmlKZCyPMtt4sv9b14BbZ/5Ynx0qjzpjcK+iJdPJoU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(52116014)(376014)(1800799024)(366016)(22082099003)(18002099003)(6133799003)(3023799007)(56012099006)(10067099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021123027099003)(261022105027099003)(261021121427099003)(261022075727099003)(261009223027099003)(261102123227099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VoV9YnGZv5Oxrk6vbA//E/KYgnPtmuESGfjiGm5nH0QvQbwH/8j6BqWFMQZ/?=
 =?us-ascii?Q?0aiWhzD3a7LiewDDThHa7s2oEceZHRKq2r40wbXJxsgipsa9H6HxxykL01TU?=
 =?us-ascii?Q?y3rRcAB4bXJ41HPU/0aw8d2Okz1Cjy+olSTkEQae0HW+G1LQ85jh6hFNF68G?=
 =?us-ascii?Q?DzH9rJhlzN9uFyN29Uk1Qe9VdoYj19Pn/RP/ZeD1LhHvdscI53xqCJMZ5anG?=
 =?us-ascii?Q?d6acsw1dV9QxG7DRPzJRaWnFJc5LMgjII41coGDzKwntZZ+p7KgggTmUCnT8?=
 =?us-ascii?Q?6JuV/YN40x23e/WSqTeinByi9ckWgLFaLrSDkjTmhg7eyLWrudSLeRlIkJad?=
 =?us-ascii?Q?uCkffHcTzAnc9hoyfFcYH9hNYYXOXpZeS8wTFX7VIja4SZTZJ8jAHPRxebIF?=
 =?us-ascii?Q?BDSjw1/FE4Qg0xaU5GUgbXlHQWcJNGb/4L84XV+JGUoAeUaLZ7yZLHssdd6N?=
 =?us-ascii?Q?BTGIs+ylJ48nBZrIsizdhV1s3Ux4LehfspSjhg4dTt+DWNR5MjHh/D7NcRV+?=
 =?us-ascii?Q?ZMqY7sC7fc4p0hUdVYWOucj7j+DtOLp2e7MxkQrFwa2cXtbiRzMLd7i6QOMW?=
 =?us-ascii?Q?vKPSbI9PjTv121JMZen+dsNb/IivrelRFzo2ir+ph6WUbqinotYrVAcWs7u4?=
 =?us-ascii?Q?soi9CcM50gBZvYTujmKqaK+yZ1gy9ecMnOr/+D3Nl/wUqNavB+OKK2sEXQiS?=
 =?us-ascii?Q?Ctrmy7Wk2/3aQGqKNvCHFyNPJ9I55B3/Fied3o5X79D5dYBfyV+Qi15GYFQR?=
 =?us-ascii?Q?4Q4mRVzVHk6HuuG4YX8ghdpCN3sjXef9T/AUmOuGPStdUByzMeKgNCE0lGib?=
 =?us-ascii?Q?Ruo42DxFVhjqfwBnQLEoBJvXlFU6YAsF/6c0YbX/lSA3w/VAAAk+vTK5JlUP?=
 =?us-ascii?Q?acEfNlr1s8QBIxva05wIh0i+8s0ctLbT662w6SL++p4UJrlTgTHsDgBlTV0V?=
 =?us-ascii?Q?Q2JZSmabhYwDXgU9oZLqQyYyJJvaZcidySXkQP5FnA2XVv/G1z8T4s2niB2n?=
 =?us-ascii?Q?HcueZPhtlpyUThSjGbhDQM6hT/Oq7ZRMw/ySMMIB5awYGZ/et3ZwAVPLX65i?=
 =?us-ascii?Q?oDjQcpuvIKuBBBySLYSqLN7J98ROA47M1DnXJOixrjIH3V2PDprngBqq53iW?=
 =?us-ascii?Q?ZkRCLCqeZa7ALXN1p2DUEQ2hOD7zwnS25VFU4ipARHg1E3qm5WtYK1q65jP0?=
 =?us-ascii?Q?VchHSGcScPUCm8UFTQtGbtz2nw/mP0YZHj6KlutdkreIjCt4VTGeQXkDEV04?=
 =?us-ascii?Q?jv+BkL32DMGdp1fnE6ida7K3aAfmtlyPUqfetojG2lFATWSjKaN0xNF3QTO8?=
 =?us-ascii?Q?QBW8LwLrn9Z4MDrRXVBpQPMUbYHHMWmmcOcA+C6rhFV7cB4J/WhFE2agEm4R?=
 =?us-ascii?Q?nJzEmHPT0NXMwEtkRJNK0jWJIN9B+ByKHD/q+SL4jGRAIYzdUud4X2FLQKm8?=
 =?us-ascii?Q?Q1RikNegYBK6G14WNKtydFlO1dKV5Ib7jl1hP/G/P2Iv0YcXehvP3tJaE60g?=
 =?us-ascii?Q?pRxYEi7hwAg1oqVzFv45zXClYdl0CxhFZ+ERPZen3hI0TpmZCLez4c+4LPY5?=
 =?us-ascii?Q?8uncWdyEaM7dggjQE+JBiwrU2bMnCDNn0gb+lQtj4oFVTRpXeCknRIxUUMRu?=
 =?us-ascii?Q?qXKsZ4C+6BpkFPfYTRAvLFFsU9jMh9JkogTkMM9ofp/fvdr8dLSUnoEApKf0?=
 =?us-ascii?Q?i9CsbhOLMS3OgDoW7X2MBVlSQ/P1v+U+7rFOdE2xHeEKs6kgAtuX5UpFaMVP?=
 =?us-ascii?Q?taoJQNjHUoiiEYJoxRXAibTJeNEjDWQ=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee81d9f1-5b62-4a58-aaab-08df461b8e90
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:00:28.0976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M/Ttw4PRO4l3ASWmdQyQLgOEW6XO8gLHS4BurjBmDBSyXKNJRQkM7M31Gw5ejE5JiejjjLiYKBUzpmiE25YC4D1zUqvevDd+jZgxqfAYfF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1466

Add debugfs entries and trace events to provide detailed
debugging information.

Help diagnose issues and improve debugging capabilities for the
Wave6 core driver.

Print a readable reason for the known firmware system errors instead
of only the raw fail reason code.

Tested-by: Ming Qian <ming.qian@oss.nxp.com>
Tested-by: Marek Vasut <marek.vasut@mailbox.org>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../media/platform/chips-media/wave6/Makefile |   4 +
 .../platform/chips-media/wave6/wave6-hw.c     |  36 ++-
 .../platform/chips-media/wave6/wave6-trace.h  | 284 ++++++++++++++++++
 .../chips-media/wave6/wave6-vpu-core.c        |  14 +
 .../chips-media/wave6/wave6-vpu-dbg.c         | 148 +++++++++
 .../chips-media/wave6/wave6-vpu-dbg.h         |  14 +
 .../chips-media/wave6/wave6-vpu-dec.c         |  25 +-
 .../chips-media/wave6/wave6-vpu-enc.c         |  27 +-
 .../chips-media/wave6/wave6-vpu-v4l2.c        |   3 +
 .../platform/chips-media/wave6/wave6-vpuapi.h |   5 +
 10 files changed, 551 insertions(+), 9 deletions(-)
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-trace.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.h

diff --git a/drivers/media/platform/chips-media/wave6/Makefile b/drivers/media/platform/chips-media/wave6/Makefile
index 53ee91b88bed..426af279af6f 100644
--- a/drivers/media/platform/chips-media/wave6/Makefile
+++ b/drivers/media/platform/chips-media/wave6/Makefile
@@ -1,8 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 
+# tell define_trace.h where to find the trace header
+CFLAGS_wave6-vpu-core.o := -I$(src)
+
 wave6-objs += wave6-vpu.o \
 	      wave6-vpu-core.o \
 	      wave6-vpu-v4l2.o \
+	      wave6-vpu-dbg.o \
 	      wave6-vpuapi.o \
 	      wave6-vpu-dec.o \
 	      wave6-vpu-enc.o \
diff --git a/drivers/media/platform/chips-media/wave6/wave6-hw.c b/drivers/media/platform/chips-media/wave6/wave6-hw.c
index 171391f797cb..a53a87745366 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-hw.c
+++ b/drivers/media/platform/chips-media/wave6/wave6-hw.c
@@ -10,6 +10,7 @@
 #include "wave6-vpu-core.h"
 #include "wave6-hw.h"
 #include "wave6-regdefine.h"
+#include "wave6-trace.h"
 
 #define wave6_print_reg_err(core, reason) \
 	_wave6_print_reg_err((core), (reason), __func__)
@@ -17,6 +18,7 @@
 void wave6_vpu_writel(struct vpu_core_device *core, u32 addr, u32 data)
 {
 	wave6_vdi_writel(core->reg_base, addr, data);
+	trace_wave6_vpu_writel(core->dev, addr, data);
 }
 
 u32 wave6_vpu_readl(struct vpu_core_device *core, u32 addr)
@@ -24,6 +26,7 @@ u32 wave6_vpu_readl(struct vpu_core_device *core, u32 addr)
 	u32 data;
 
 	data = wave6_vdi_readl(core->reg_base, addr);
+	trace_wave6_vpu_readl(core->dev, addr, data);
 
 	return data;
 }
@@ -31,6 +34,7 @@ u32 wave6_vpu_readl(struct vpu_core_device *core, u32 addr)
 void wave6_vpu_writel_relaxed(struct vpu_core_device *core, u32 addr, u32 data)
 {
 	wave6_vdi_writel_relaxed(core->reg_base, addr, data);
+	trace_wave6_vpu_writel(core->dev, addr, data);
 }
 
 u32 wave6_vpu_readl_relaxed(struct vpu_core_device *core, u32 addr)
@@ -38,6 +42,7 @@ u32 wave6_vpu_readl_relaxed(struct vpu_core_device *core, u32 addr)
 	u32 data;
 
 	data = wave6_vdi_readl_relaxed(core->reg_base, addr);
+	trace_wave6_vpu_readl(core->dev, addr, data);
 
 	return data;
 }
@@ -45,7 +50,34 @@ u32 wave6_vpu_readl_relaxed(struct vpu_core_device *core, u32 addr)
 static void _wave6_print_reg_err(struct vpu_core_device *core, u32 fail_reason,
 				 const char *func)
 {
-	dev_err(core->dev, "%s: failure: 0x%x\n", func, fail_reason);
+	struct device *dev = core->dev;
+
+	switch (fail_reason) {
+	case WAVE6_SYSERR_QUEUEING_FAIL:
+		dev_err(dev, "%s: queueing failure 0x%x\n", func, fail_reason);
+		break;
+	case WAVE6_SYSERR_RESULT_NOT_READY:
+		dev_err(dev, "%s: result not ready 0x%x\n", func, fail_reason);
+		break;
+	case WAVE6_SYSERR_ACCESS_VIOLATION_HW:
+		dev_err(dev, "%s: access violation 0x%x\n", func, fail_reason);
+		break;
+	case WAVE6_SYSERR_WATCHDOG_TIMEOUT:
+		dev_err(dev, "%s: watchdog timeout 0x%x\n", func, fail_reason);
+		break;
+	case WAVE6_SYSERR_BUS_ERROR:
+		dev_err(dev, "%s: bus error 0x%x\n", func, fail_reason);
+		break;
+	case WAVE6_SYSERR_DOUBLE_FAULT:
+		dev_err(dev, "%s: double fault 0x%x\n", func, fail_reason);
+		break;
+	case WAVE6_SYSERR_VPU_STILL_RUNNING:
+		dev_err(dev, "%s: still running 0x%x\n", func, fail_reason);
+		break;
+	default:
+		dev_err(dev, "%s: failure: 0x%x\n", func, fail_reason);
+		break;
+	}
 }
 
 static void wave6_dec_set_display_buffer(struct vpu_instance *inst, struct frame_buffer fb)
@@ -218,6 +250,8 @@ static void wave6_send_command(struct vpu_core_device *core, u32 id, u32 std, u3
 	vpu_write_reg_relaxed(core, W6_VPU_BUSY_STATUS, BUSY_STATUS_SET);
 	vpu_write_reg_relaxed(core, W6_COMMAND, cmd);
 	vpu_write_reg(core, W6_VPU_HOST_INT_REQ, HOST_INT_REQ_ON);
+
+	trace_wave6_vpu_send_command(core, id, std, cmd);
 }
 
 static int wave6_send_query(struct vpu_core_device *core, u32 id, u32 std,
diff --git a/drivers/media/platform/chips-media/wave6/wave6-trace.h b/drivers/media/platform/chips-media/wave6/wave6-trace.h
new file mode 100644
index 000000000000..430f0847310d
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-trace.h
@@ -0,0 +1,284 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 driver tracer
+ *
+ * Copyright (C) 2026 CHIPS&MEDIA INC
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM wave6
+
+#if !defined(__WAVE6_TRACE_H__) || defined(TRACE_HEADER_MULTI_READ)
+#define __WAVE6_TRACE_H__
+
+#include <linux/tracepoint.h>
+
+DECLARE_EVENT_CLASS(wave6_vpu_register_access,
+		    TP_PROTO(struct device *dev, u32 addr, u32 value),
+		    TP_ARGS(dev, addr, value),
+		    TP_STRUCT__entry(__string(name, dev_name(dev))
+				     __field(u32, addr)
+				     __field(u32, value)),
+		    TP_fast_assign(__assign_str(name);
+				   __entry->addr = addr;
+				   __entry->value = value;),
+		    TP_printk("%s:0x%03x 0x%08x",
+			      __get_str(name), __entry->addr, __entry->value));
+
+DEFINE_EVENT(wave6_vpu_register_access, wave6_vpu_writel,
+	     TP_PROTO(struct device *dev, u32 addr, u32 value),
+	     TP_ARGS(dev, addr, value));
+DEFINE_EVENT(wave6_vpu_register_access, wave6_vpu_readl,
+	     TP_PROTO(struct device *dev, u32 addr, u32 value),
+	     TP_ARGS(dev, addr, value));
+
+TRACE_EVENT(wave6_vpu_send_command,
+	    TP_PROTO(struct vpu_core_device *core, u32 id, u32 std, u32 cmd),
+	    TP_ARGS(core, id, std, cmd),
+	    TP_STRUCT__entry(__string(name, dev_name(core->dev))
+			     __field(u32, id)
+			     __field(u32, std)
+			     __field(u32, cmd)),
+	    TP_fast_assign(__assign_str(name);
+			   __entry->id = id;
+			   __entry->std = std;
+			   __entry->cmd = cmd;),
+	    TP_printk("%s: inst id %d, std 0x%x, cmd 0x%x",
+		      __get_str(name), __entry->id,
+		      __entry->std, __entry->cmd));
+
+TRACE_EVENT(wave6_vpu_irq,
+	    TP_PROTO(struct vpu_core_device *core, u32 irq, u32 idc),
+	    TP_ARGS(core, irq, idc),
+	    TP_STRUCT__entry(__string(name, dev_name(core->dev))
+			     __field(u32, irq)
+			     __field(u32, idc)),
+	    TP_fast_assign(__assign_str(name);
+			   __entry->irq = irq;
+			   __entry->idc = idc;),
+	    TP_printk("%s: irq 0x%x, idc 0x%x",
+		      __get_str(name), __entry->irq, __entry->idc));
+
+TRACE_EVENT(wave6_vpu_set_state,
+	    TP_PROTO(struct vpu_instance *inst, u32 state),
+	    TP_ARGS(inst, state),
+	    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
+			     __field(u32, id)
+			     __string(cur_state, wave6_vpu_instance_state_name(inst->state))
+			     __string(nxt_state, wave6_vpu_instance_state_name(state))),
+	    TP_fast_assign(__assign_str(name);
+			   __entry->id = inst->id;
+			   __assign_str(cur_state);
+			   __assign_str(nxt_state);),
+	    TP_printk("%s: inst[%d] set state %s -> %s",
+		      __get_str(name), __entry->id,
+		      __get_str(cur_state), __get_str(nxt_state)));
+
+DECLARE_EVENT_CLASS(wave6_vpu_inst_internal,
+		    TP_PROTO(struct vpu_instance *inst, bool is_out),
+		    TP_ARGS(inst, is_out),
+		    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
+				     __field(u32, id)
+				     __string(type, is_out ? "output" : "capture")
+				     __field(u32, pixelformat)
+				     __field(u32, width)
+				     __field(u32, height)
+				     __field(u32, buf_cnt_src)
+				     __field(u32, buf_cnt_dst)
+				     __field(u32, processed_cnt)
+				     __field(u32, error_cnt)),
+		    TP_fast_assign(__assign_str(name);
+				   __entry->id = inst->id;
+				   __assign_str(type);
+				   __entry->pixelformat = is_out ? inst->src_fmt.pixelformat :
+								   inst->dst_fmt.pixelformat;
+				   __entry->width = is_out ? inst->src_fmt.width :
+							     inst->dst_fmt.width;
+				   __entry->height = is_out ? inst->src_fmt.height :
+							      inst->dst_fmt.height;
+				   __entry->buf_cnt_src = inst->queued_src_buf_num;
+				   __entry->buf_cnt_dst = inst->queued_dst_buf_num;
+				   __entry->processed_cnt = inst->processed_buf_num;
+				   __entry->error_cnt = inst->error_buf_num;),
+		    TP_printk("%s: inst[%d] %s %c%c%c%c %dx%d, input %d, %d, process %d, error %d",
+			      __get_str(name), __entry->id, __get_str(type),
+			      __entry->pixelformat,
+			      __entry->pixelformat >> 8,
+			      __entry->pixelformat >> 16,
+			      __entry->pixelformat >> 24,
+			      __entry->width, __entry->height,
+			      __entry->buf_cnt_src, __entry->buf_cnt_dst,
+			      __entry->processed_cnt, __entry->error_cnt));
+
+DEFINE_EVENT(wave6_vpu_inst_internal, wave6_vpu_start_streaming,
+	     TP_PROTO(struct vpu_instance *inst, bool is_out),
+	     TP_ARGS(inst, is_out));
+
+DEFINE_EVENT(wave6_vpu_inst_internal, wave6_vpu_stop_streaming,
+	     TP_PROTO(struct vpu_instance *inst, bool is_out),
+	     TP_ARGS(inst, is_out));
+
+TRACE_EVENT(wave6_vpu_dec_pic,
+	    TP_PROTO(struct vpu_instance *inst, u32 srcidx, u32 size),
+	    TP_ARGS(inst, srcidx, size),
+	    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
+			     __field(u32, id)
+			     __field(u32, srcidx)
+			     __field(u32, start)
+			     __field(u32, size)),
+	    TP_fast_assign(__assign_str(name);
+			   __entry->id = inst->id;
+			   __entry->srcidx = srcidx;
+			   __entry->start = inst->codec_info->dec_info.stream_rd_ptr;
+			   __entry->size = size;),
+	    TP_printk("%s: inst[%d] src[%2d] %8x, %d",
+		      __get_str(name), __entry->id,
+		      __entry->srcidx, __entry->start, __entry->size));
+
+TRACE_EVENT(wave6_vpu_source_change,
+	    TP_PROTO(struct vpu_instance *inst, struct dec_seq_info *info),
+	    TP_ARGS(inst, info),
+	    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
+			     __field(u32, id)
+			     __field(u32, width)
+			     __field(u32, height)
+			     __field(u32, profile)
+			     __field(u32, level)
+			     __field(u32, tier)
+			     __field(u32, min_fb_cnt)
+			     __field(u32, disp_delay)
+			     __field(u32, quantization)
+			     __field(u32, colorspace)
+			     __field(u32, xfer_func)
+			     __field(u32, ycbcr_enc)),
+	    TP_fast_assign(__assign_str(name);
+			   __entry->id = inst->id;
+			   __entry->width = info->pic_width;
+			   __entry->height = info->pic_height;
+			   __entry->profile = info->profile;
+			   __entry->level = info->level;
+			   __entry->tier = info->tier;
+			   __entry->min_fb_cnt = info->min_frame_buffer_count;
+			   __entry->disp_delay = info->frame_buf_delay;
+			   __entry->quantization = inst->quantization;
+			   __entry->colorspace = inst->colorspace;
+			   __entry->xfer_func = inst->xfer_func;
+			   __entry->ycbcr_enc = inst->ycbcr_enc;),
+	    TP_printk("%s: inst[%d] %dx%d profile %d %d %d min_fb %d delay %d color %d %d %d %d",
+		      __get_str(name), __entry->id,
+		      __entry->width, __entry->height,
+		      __entry->profile, __entry->level, __entry->tier,
+		      __entry->min_fb_cnt, __entry->disp_delay,
+		      __entry->quantization, __entry->colorspace,
+		      __entry->xfer_func, __entry->ycbcr_enc));
+
+TRACE_EVENT(wave6_vpu_dec_done,
+	    TP_PROTO(struct vpu_instance *inst, struct dec_output_info *info),
+	    TP_ARGS(inst, info),
+	    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
+			     __field(u32, id)
+			     __field(u32, dec_flag)
+			     __field(u32, dec_poc)
+			     __field(u32, disp_flag)
+			     __field(u32, disp_cnt)
+			     __field(u32, rel_cnt)
+			     __field(u32, src_ch)
+			     __field(u32, eos)
+			     __field(u32, error)
+			     __field(u32, warn)),
+	    TP_fast_assign(__assign_str(name);
+			   __entry->id = inst->id;
+			   __entry->dec_flag = info->frame_decoded;
+			   __entry->dec_poc = info->decoded_poc;
+			   __entry->disp_flag = info->frame_display;
+			   __entry->disp_cnt = info->disp_frame_num;
+			   __entry->rel_cnt = info->release_disp_frame_num;
+			   __entry->src_ch = info->notification_flags & DEC_NOTI_FLAG_SEQ_CHANGE;
+			   __entry->eos = info->stream_end;
+			   __entry->error = info->error_reason;
+			   __entry->warn = info->warn_info;),
+	    TP_printk("%s: inst[%d] dec %d %d disp %d(%d) rel %d src_ch %d eos %d error 0x%x 0x%x",
+		      __get_str(name), __entry->id,
+		      __entry->dec_flag, __entry->dec_poc,
+		      __entry->disp_flag, __entry->disp_cnt,
+		      __entry->rel_cnt,
+		      __entry->src_ch, __entry->eos,
+		      __entry->error, __entry->warn));
+
+TRACE_EVENT(wave6_vpu_enc_pic,
+	    TP_PROTO(struct vpu_instance *inst, struct enc_param *param),
+	    TP_ARGS(inst, param),
+	    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
+			     __field(u32, id)
+			     __field(u32, srcidx)
+			     __field(u64, buf_y)
+			     __field(u64, buf_cb)
+			     __field(u64, buf_cr)
+			     __field(u32, stride)
+			     __field(u64, buf_strm)
+			     __field(u32, size_strm)
+			     __field(u32, force_type_enable)
+			     __field(u32, force_type)),
+	    TP_fast_assign(__assign_str(name);
+			   __entry->id = inst->id;
+			   __entry->srcidx = param->src_idx;
+			   __entry->buf_y = param->source_frame->buf_y;
+			   __entry->buf_cb = param->source_frame->buf_cb;
+			   __entry->buf_cr = param->source_frame->buf_cr;
+			   __entry->stride = param->source_frame->stride;
+			   __entry->buf_strm = param->pic_stream_buffer_addr;
+			   __entry->size_strm = param->pic_stream_buffer_size;
+			   __entry->force_type_enable = param->force_pic;
+			   __entry->force_type = param->force_pic_type;),
+	    TP_printk("%s: inst[%d] src[%2d] %8llx %8llx %8llx(%d) dst %8llx(%d) force type %d(%d)",
+		      __get_str(name), __entry->id, __entry->srcidx,
+		      __entry->buf_y, __entry->buf_cb, __entry->buf_cr,
+		      __entry->stride, __entry->buf_strm, __entry->size_strm,
+		      __entry->force_type_enable, __entry->force_type));
+
+TRACE_EVENT(wave6_vpu_enc_done,
+	    TP_PROTO(struct vpu_instance *inst, struct enc_output_info *info),
+	    TP_ARGS(inst, info),
+	    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
+			     __field(u32, id)
+			     __field(u32, srcidx)
+			     __field(u32, frmidx)
+			     __field(u32, size)
+			     __field(u32, type)
+			     __field(u32, avg_qp)),
+	    TP_fast_assign(__assign_str(name);
+			   __entry->id = inst->id;
+			   __entry->srcidx = info->enc_src_idx;
+			   __entry->frmidx = info->recon_frame_index;
+			   __entry->size = info->bitstream_size;
+			   __entry->type = info->pic_type;
+			   __entry->avg_qp = info->avg_ctu_qp;),
+	    TP_printk("%s: inst[%d] src %d, frame %d, size %d, type %d, qp %d",
+		      __get_str(name), __entry->id,
+		      __entry->srcidx, __entry->frmidx,
+		      __entry->size, __entry->type, __entry->avg_qp));
+
+TRACE_EVENT(wave6_vpu_s_ctrl,
+	    TP_PROTO(struct vpu_instance *inst, struct v4l2_ctrl *ctrl),
+	    TP_ARGS(inst, ctrl),
+	    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
+			     __field(u32, id)
+			     __string(ctrl_name, ctrl->name)
+			     __field(u32, val)),
+	    TP_fast_assign(__assign_str(name);
+			   __entry->id = inst->id;
+			   __assign_str(ctrl_name);
+			   __entry->val = ctrl->val;),
+	    TP_printk("%s: inst[%d] %s = %d",
+		      __get_str(name), __entry->id,
+		      __get_str(ctrl_name), __entry->val));
+
+#endif /* __WAVE6_TRACE_H__ */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE wave6-trace
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
index aad4023d66a4..12efa3afebf7 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
@@ -10,6 +10,7 @@
 #include <linux/clk.h>
 #include <linux/interrupt.h>
 #include <linux/pm_runtime.h>
+#include <linux/debugfs.h>
 #include <linux/iopoll.h>
 
 #include "wave6-vpu-core.h"
@@ -17,6 +18,11 @@
 #include "wave6-vpuconfig.h"
 #include "wave6-hw.h"
 
+#define CREATE_TRACE_POINTS
+#include "wave6-trace.h"
+
+#define WAVE6_VPU_DEBUGFS_DIR "wave6"
+
 static irqreturn_t wave6_vpu_core_irq(int irq, void *dev_id)
 {
 	struct vpu_core_device *core = dev_id;
@@ -32,6 +38,8 @@ static irqreturn_t wave6_vpu_core_irq(int irq, void *dev_id)
 	vpu_write_reg(core, W6_VPU_VINT_REASON_CLEAR, irq_info.status);
 	vpu_write_reg(core, W6_VPU_VINT_CLEAR, VINT_CLEAR);
 
+	trace_wave6_vpu_irq(core, irq_info.status, irq_info.inst_idc);
+
 	if (irq_info.status & BIT(W6_INT_BIT_REQ_WORK_BUF)) {
 		wave6_vpu_require_work_buffer(core->vpu, core->reg_base);
 
@@ -285,6 +293,12 @@ static int wave6_vpu_core_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	core->debugfs = debugfs_lookup(WAVE6_VPU_DEBUGFS_DIR, NULL);
+	if (!IS_ERR_OR_NULL(core->debugfs))
+		dput(core->debugfs);
+	else
+		core->debugfs = debugfs_create_dir(WAVE6_VPU_DEBUGFS_DIR, NULL);
+
 	ret = devm_pm_runtime_enable(&pdev->dev);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
new file mode 100644
index 000000000000..525e047ecebf
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - debug interface
+ *
+ * Copyright (C) 2026 CHIPS&MEDIA INC
+ */
+
+#include <linux/types.h>
+#include <linux/debugfs.h>
+#include <linux/math64.h>
+
+#include "wave6-vpu-core.h"
+#include "wave6-vpu-dbg.h"
+
+static int wave6_vpu_dbg_instance(struct seq_file *s, void *data)
+{
+	struct vpu_instance *inst = s->private;
+	struct vb2_queue *vq;
+
+	if (!inst->v4l2_fh.m2m_ctx)
+		return 0;
+
+	seq_printf(s, "[%s]\n",
+		   inst->type == VPU_INST_TYPE_DEC ? "Decoder" : "Encoder");
+
+	seq_printf(s, "%s : product 0x%x, fw_ver %d.%d.%d(r%d), hw_ver 0x%x\n",
+		   dev_name(inst->dev->dev),
+		   inst->dev->attr.product_code,
+		   FW_VERSION_MAJOR(inst->dev->attr.fw_version),
+		   FW_VERSION_MINOR(inst->dev->attr.fw_version),
+		   FW_VERSION_REL(inst->dev->attr.fw_version),
+		   inst->dev->attr.fw_revision,
+		   inst->dev->attr.hw_version);
+
+	seq_printf(s, "state = %s\n",
+		   wave6_vpu_instance_state_name(inst->state));
+
+	vq = v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx);
+	seq_printf(s, "output (%2d, %2d): fmt = %c%c%c%c %d x %d, %d;\n",
+		   vb2_is_streaming(vq),
+		   vb2_get_num_buffers(vq),
+		   inst->src_fmt.pixelformat,
+		   inst->src_fmt.pixelformat >> 8,
+		   inst->src_fmt.pixelformat >> 16,
+		   inst->src_fmt.pixelformat >> 24,
+		   inst->src_fmt.width,
+		   inst->src_fmt.height,
+		   vq->last_buffer_dequeued);
+
+	vq = v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx);
+	seq_printf(s, "capture(%2d, %2d): fmt = %c%c%c%c %d x %d, %d;\n",
+		   vb2_is_streaming(vq),
+		   vb2_get_num_buffers(vq),
+		   inst->dst_fmt.pixelformat,
+		   inst->dst_fmt.pixelformat >> 8,
+		   inst->dst_fmt.pixelformat >> 16,
+		   inst->dst_fmt.pixelformat >> 24,
+		   inst->dst_fmt.width,
+		   inst->dst_fmt.height,
+		   vq->last_buffer_dequeued);
+
+	seq_printf(s, "crop: (%d, %d) %d x %d\n",
+		   inst->crop.left,
+		   inst->crop.top,
+		   inst->crop.width,
+		   inst->crop.height);
+
+	if (inst->scaler_info.enable)
+		seq_printf(s, "scale: %d x %d\n",
+			   inst->scaler_info.width, inst->scaler_info.height);
+
+	seq_printf(s, "queued src %d, dst %d, process %d, sequence %d, error %d, stopped %d\n",
+		   inst->queued_src_buf_num,
+		   inst->queued_dst_buf_num,
+		   inst->processed_buf_num,
+		   inst->sequence,
+		   inst->error_buf_num,
+		   v4l2_m2m_has_stopped(inst->v4l2_fh.m2m_ctx));
+
+	if (inst->type == VPU_INST_TYPE_DEC) {
+		seq_printf(s, "%s order\n",
+			   inst->disp_mode == DISP_MODE_DISP_ORDER ? "display" : "decode");
+	} else {
+		struct enc_info *p_enc_info = &inst->codec_info->enc_info;
+		struct enc_codec_param *param = &p_enc_info->open_param.codec_param;
+
+		seq_printf(s, "profile %d, level %d, tier %d\n",
+			   param->profile, param->level, param->tier);
+
+		seq_printf(s, "frame_rate %d, idr_period %d, intra_period %d\n",
+			   param->frame_rate, param->idr_period, param->intra_period);
+
+		seq_printf(s, "rc %d, mode %d, bitrate %d\n",
+			   param->en_rate_control,
+			   param->rc_mode,
+			   param->bitrate);
+
+		seq_printf(s, "qp %d, i_qp [%d, %d], p_qp [%d, %d], b_qp [%d, %d]\n",
+			   param->qp,
+			   param->min_qp_i, param->max_qp_i,
+			   param->min_qp_p, param->max_qp_p,
+			   param->min_qp_b, param->max_qp_b);
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_dbg_open(struct inode *inode, struct file *filp)
+{
+	return single_open(filp, wave6_vpu_dbg_instance, inode->i_private);
+}
+
+static const struct file_operations wave6_vpu_dbg_fops = {
+	.owner = THIS_MODULE,
+	.open = wave6_vpu_dbg_open,
+	.release = single_release,
+	.read = seq_read,
+	.llseek = seq_lseek,
+};
+
+int wave6_vpu_create_dbgfs_file(struct vpu_instance *inst)
+{
+	char name[64];
+
+	if (WARN_ON(!inst || !inst->dev))
+		return -EINVAL;
+
+	if (IS_ERR_OR_NULL(inst->dev->debugfs))
+		return 0;
+
+	scnprintf(name, sizeof(name), "instance.%d", inst->id);
+	inst->debugfs = debugfs_create_file((const char *)name,
+					    0444,
+					    inst->dev->debugfs,
+					    inst,
+					    &wave6_vpu_dbg_fops);
+
+	return 0;
+}
+
+void wave6_vpu_remove_dbgfs_file(struct vpu_instance *inst)
+{
+	if (!inst || !inst->debugfs)
+		return;
+
+	debugfs_remove(inst->debugfs);
+	inst->debugfs = NULL;
+}
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.h b/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.h
new file mode 100644
index 000000000000..53a0d8a2f5f1
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - debug interface
+ *
+ * Copyright (C) 2026 CHIPS&MEDIA INC
+ */
+
+#ifndef __WAVE6_VPU_DBG_H__
+#define __WAVE6_VPU_DBG_H__
+
+int wave6_vpu_create_dbgfs_file(struct vpu_instance *inst);
+void wave6_vpu_remove_dbgfs_file(struct vpu_instance *inst);
+
+#endif /* __WAVE6_VPU_DBG_H__ */
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
index 54b408922bbc..7eab283ec9e7 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
@@ -8,6 +8,8 @@
 #include <linux/pm_runtime.h>
 
 #include "wave6-vpu-core.h"
+#include "wave6-vpu-dbg.h"
+#include "wave6-trace.h"
 
 #define VPU_DEC_DEV_NAME "C&M Wave6 VPU decoder"
 #define VPU_DEC_DRV_NAME "wave6-dec"
@@ -135,13 +137,16 @@ static void wave6_vpu_dec_release_fb(struct vpu_instance *inst)
 	}
 }
 
-static void wave6_vpu_dec_destroy_instance(struct vpu_instance *inst)
+static void wave6_vpu_dec_destroy_instance(struct vpu_instance *inst, bool remove_dbgfs)
 {
 	u32 fail_res = 0;
 	int ret;
 
 	wave6_vpu_disable_instance(inst);
 
+	if (remove_dbgfs)
+		wave6_vpu_remove_dbgfs_file(inst);
+
 	ret = wave6_vpu_dec_close(inst, &fail_res);
 	if (ret) {
 		dev_err(inst->dev->dev, "failed destroy instance: %d (%d)\n",
@@ -190,6 +195,8 @@ static void wave6_handle_bitstream_buffer(struct vpu_instance *inst,
 		wave6_vpu_dec_set_rd_ptr(inst, wr, true);
 	}
 
+	trace_wave6_vpu_dec_pic(inst, src_buf ? src_buf->vb2_buf.index : -1, src_size);
+
 	ret = wave6_vpu_dec_update_bitstream_buffer(inst, src_size);
 	if (ret) {
 		dev_dbg(inst->dev->dev, "%s: Update bitstream buffer fail %d\n",
@@ -769,6 +776,8 @@ static void wave6_vpu_dec_handle_source_change(struct vpu_instance *inst)
 				 info->pic_width, info->pic_height,
 				 true);
 
+	trace_wave6_vpu_source_change(inst, info);
+
 	v4l2_event_queue_fh(&inst->v4l2_fh, &vpu_event_src_ch);
 }
 
@@ -795,6 +804,8 @@ static void wave6_vpu_dec_finish_decode(struct vpu_instance *inst, bool error)
 	if (ret)
 		goto finish_decode;
 
+	trace_wave6_vpu_dec_done(inst, &info);
+
 	dev_dbg(inst->dev->dev, "dec %d dis %d noti_flag %d stream_end %d\n",
 		info.frame_decoded, info.frame_display,
 		info.notification_flags, info.stream_end);
@@ -1353,6 +1364,8 @@ static int wave6_vpu_dec_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct vpu_instance *inst = wave6_ctrl_to_vpu_inst(ctrl);
 
+	trace_wave6_vpu_s_ctrl(inst, ctrl);
+
 	dev_dbg(inst->dev->dev, "%s: name %s value %d\n",
 		__func__, ctrl->name, ctrl->val);
 
@@ -1419,6 +1432,7 @@ static int wave6_vpu_dec_create_instance(struct vpu_instance *inst)
 	scoped_guard(spinlock, &inst->dev->inst_lock)
 		list_add_tail(&inst->list, &inst->dev->instances);
 	wave6_vpu_enable_instance(inst);
+	wave6_vpu_create_dbgfs_file(inst);
 	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_OPEN);
 
 	return 0;
@@ -1471,7 +1485,7 @@ static int wave6_vpu_dec_queue_setup(struct vb2_queue *q, unsigned int *num_buff
 	}
 
 	if (V4L2_TYPE_IS_OUTPUT(q->type) && inst->state == VPU_INST_STATE_SEEK)
-		wave6_vpu_dec_destroy_instance(inst);
+		wave6_vpu_dec_destroy_instance(inst, true);
 
 	return 0;
 }
@@ -1604,6 +1618,8 @@ static int wave6_vpu_dec_start_streaming(struct vb2_queue *q, unsigned int count
 	struct v4l2_pix_format_mplane *fmt;
 	int ret = 0;
 
+	trace_wave6_vpu_start_streaming(inst, V4L2_TYPE_IS_OUTPUT(q->type));
+
 	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
 		fmt = &inst->src_fmt;
 		if (inst->state == VPU_INST_STATE_NONE) {
@@ -1644,6 +1660,8 @@ static void wave6_vpu_dec_stop_streaming(struct vb2_queue *q)
 	struct vpu_instance *inst = vb2_get_drv_priv(q);
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
 
+	trace_wave6_vpu_stop_streaming(inst, V4L2_TYPE_IS_OUTPUT(q->type));
+
 	dev_dbg(inst->dev->dev, "[%d] %s, input %d, decode %d error %d\n",
 		inst->id, V4L2_TYPE_IS_OUTPUT(q->type) ? "output" : "capture",
 		inst->queued_src_buf_num, inst->processed_buf_num, inst->error_buf_num);
@@ -1876,10 +1894,11 @@ static int wave6_vpu_dec_release(struct file *filp)
 {
 	struct vpu_instance *inst = wave6_file_to_vpu_inst(filp);
 
+	wave6_vpu_remove_dbgfs_file(inst);
 	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
 
 	if (inst->state != VPU_INST_STATE_NONE)
-		wave6_vpu_dec_destroy_instance(inst);
+		wave6_vpu_dec_destroy_instance(inst, false);
 
 	v4l2_ctrl_handler_free(&inst->v4l2_ctrl_hdl);
 	v4l2_fh_del(&inst->v4l2_fh, filp);
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
index 7142666d4503..4a0739033d1a 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
@@ -9,6 +9,8 @@
 #include <linux/pm_runtime.h>
 
 #include "wave6-vpu-core.h"
+#include "wave6-vpu-dbg.h"
+#include "wave6-trace.h"
 
 #define VPU_ENC_DEV_NAME "C&M Wave6 VPU encoder"
 #define VPU_ENC_DRV_NAME "wave6-enc"
@@ -366,13 +368,16 @@ static void wave6_vpu_enc_release_fb(struct vpu_instance *inst)
 	}
 }
 
-static void wave6_vpu_enc_destroy_instance(struct vpu_instance *inst)
+static void wave6_vpu_enc_destroy_instance(struct vpu_instance *inst, bool remove_dbgfs)
 {
 	u32 fail_res = 0;
 	int ret;
 
 	wave6_vpu_disable_instance(inst);
 
+	if (remove_dbgfs)
+		wave6_vpu_remove_dbgfs_file(inst);
+
 	ret = wave6_vpu_enc_close(inst, &fail_res);
 	if (ret) {
 		dev_err(inst->dev->dev, "failed destroy instance: %d (%d)\n",
@@ -817,6 +822,8 @@ static int wave6_vpu_enc_start_encode(struct vpu_instance *inst)
 	}
 	wave6_set_csc(inst, &pic_param);
 
+	trace_wave6_vpu_enc_pic(inst, &pic_param);
+
 	ret = wave6_vpu_enc_start_one_frame(inst, &pic_param, &fail_res);
 	if (ret) {
 		dev_err(inst->dev->dev, "[%d] %s: fail %d\n", inst->id, __func__, ret);
@@ -931,6 +938,8 @@ static void wave6_vpu_enc_finish_encode(struct vpu_instance *inst, bool error)
 		goto finish_encode;
 	}
 
+	trace_wave6_vpu_enc_done(inst, &info);
+
 	if (info.enc_src_idx >= 0 && info.recon_frame_index >= 0)
 		wave6_handle_encoded_frame(inst, &info);
 
@@ -1426,6 +1435,8 @@ static int wave6_vpu_enc_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct vpu_instance *inst = wave6_ctrl_to_vpu_inst(ctrl);
 	struct enc_controls *p = &inst->enc_ctrls;
 
+	trace_wave6_vpu_s_ctrl(inst, ctrl);
+
 	dev_dbg(inst->dev->dev, "%s: name %s value %d\n",
 		__func__, ctrl->name, ctrl->val);
 
@@ -2040,6 +2051,7 @@ static int wave6_vpu_enc_create_instance(struct vpu_instance *inst)
 	scoped_guard(spinlock, &inst->dev->inst_lock)
 		list_add_tail(&inst->list, &inst->dev->instances);
 	wave6_vpu_enable_instance(inst);
+	wave6_vpu_create_dbgfs_file(inst);
 	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_OPEN);
 
 	return 0;
@@ -2304,6 +2316,8 @@ static int wave6_vpu_enc_start_streaming(struct vb2_queue *q, unsigned int count
 	struct vpu_instance *inst = vb2_get_drv_priv(q);
 	int ret = 0;
 
+	trace_wave6_vpu_start_streaming(inst, V4L2_TYPE_IS_OUTPUT(q->type));
+
 	v4l2_m2m_update_start_streaming_state(inst->v4l2_fh.m2m_ctx, q);
 
 	if (inst->state == VPU_INST_STATE_NONE) {
@@ -2315,7 +2329,7 @@ static int wave6_vpu_enc_start_streaming(struct vb2_queue *q, unsigned int count
 	if (inst->state == VPU_INST_STATE_OPEN) {
 		ret = wave6_vpu_enc_initialize_instance(inst);
 		if (ret) {
-			wave6_vpu_enc_destroy_instance(inst);
+			wave6_vpu_enc_destroy_instance(inst, true);
 			goto exit;
 		}
 	}
@@ -2323,7 +2337,7 @@ static int wave6_vpu_enc_start_streaming(struct vb2_queue *q, unsigned int count
 	if (inst->state == VPU_INST_STATE_INIT_SEQ) {
 		ret = wave6_vpu_enc_prepare_fb(inst);
 		if (ret) {
-			wave6_vpu_enc_destroy_instance(inst);
+			wave6_vpu_enc_destroy_instance(inst, true);
 			goto exit;
 		}
 	}
@@ -2339,6 +2353,8 @@ static void wave6_vpu_enc_stop_streaming(struct vb2_queue *q)
 {
 	struct vpu_instance *inst = vb2_get_drv_priv(q);
 
+	trace_wave6_vpu_stop_streaming(inst, V4L2_TYPE_IS_OUTPUT(q->type));
+
 	dev_dbg(inst->dev->dev, "[%d] %s, input %d, encode %d\n",
 		inst->id, V4L2_TYPE_IS_OUTPUT(q->type) ? "output" : "capture",
 		inst->queued_src_buf_num, inst->sequence);
@@ -2356,7 +2372,7 @@ static void wave6_vpu_enc_stop_streaming(struct vb2_queue *q)
 	}
 
 	if (V4L2_TYPE_IS_CAPTURE(q->type) && inst->state != VPU_INST_STATE_NONE)
-		wave6_vpu_enc_destroy_instance(inst);
+		wave6_vpu_enc_destroy_instance(inst, true);
 
 exit:
 	wave6_vpu_return_buffers(inst, q->type, VB2_BUF_STATE_ERROR);
@@ -2673,10 +2689,11 @@ static int wave6_vpu_enc_release(struct file *filp)
 {
 	struct vpu_instance *inst = wave6_file_to_vpu_inst(filp);
 
+	wave6_vpu_remove_dbgfs_file(inst);
 	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
 
 	if (inst->state != VPU_INST_STATE_NONE)
-		wave6_vpu_enc_destroy_instance(inst);
+		wave6_vpu_enc_destroy_instance(inst, false);
 
 	v4l2_ctrl_handler_free(&inst->v4l2_ctrl_hdl);
 	v4l2_fh_del(&inst->v4l2_fh, filp);
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
index cc17f43e5d2c..6980b126dee5 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
@@ -7,6 +7,7 @@
 
 #include "wave6-vpu.h"
 #include "wave6-vpu-core.h"
+#include "wave6-trace.h"
 
 void wave6_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp,
 			  unsigned int width,
@@ -217,6 +218,8 @@ void wave6_vpu_set_instance_state(struct vpu_instance *inst,
 	if (!wave6_vpu_valid_instance_transition(inst, state))
 		return;
 
+	trace_wave6_vpu_set_state(inst, state);
+
 	dev_dbg(inst->dev->dev, "[%d] %s -> %s\n",
 		inst->id,
 		wave6_vpu_instance_state_name(inst->state),
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h b/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
index 57ead590e3f0..bc3d7e192904 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
@@ -796,6 +796,7 @@ struct vpu_irq {
  * @irq_buffer:		Buffer used by @irq_fifo
  * @irq:		Interrupt number
  * @res:		Device compatible data
+ * @debugfs:		Debugfs entry
  * @active_count:	Number of decoder/encoder instances using the core
  * @vpu_held:		Core holds a reference taken by wave6_vpu_get()
  */
@@ -825,6 +826,7 @@ struct vpu_core_device {
 	int irq;
 
 	const struct wave6_vpu_core_resource *res;
+	struct dentry *debugfs;
 	atomic_t active_count;
 	bool vpu_held;
 };
@@ -881,6 +883,7 @@ struct vpu_instance_ops {
  * @error_recovery:	Error recovery flag
  * @disp_mode:		Display mode for decoder V4L2 control
  * @enc_ctrls:		Encoder V4L2 control and streaming parameters
+ * @debugfs:		Debugfs entry
  */
 struct vpu_instance {
 	struct list_head list;
@@ -939,6 +942,8 @@ struct vpu_instance {
 
 	enum display_mode disp_mode;
 	struct enc_controls enc_ctrls;
+
+	struct dentry *debugfs;
 };
 
 void wave6_vpu_writel(struct vpu_core_device *core, u32 addr, u32 data);
-- 
2.41.0.windows.3

