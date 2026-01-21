Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021103.outbound.protection.outlook.com [52.101.65.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D1B3A6401
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 10:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768991195; cv=fail; b=oxmpuwZwQEi90VztClXapPbCEy0wmoJOnaPmlgMJVd/7MTFghZFnjcd60OSkDtPLiHEpKsnbbevBFYYcLVAmSMD4+6GqsWhIGM6o805BAlsXx/+gxZnAL6Lj2cFQb6p44IN+NttFAD7446yY85oIrz+b17OQCFcE9qnC0PgHueg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768991195; c=relaxed/simple;
	bh=AA7WariXw4D+/9pk3Adg2TFVXeQuU0zpF8cUcN1ylew=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=X5/R5K1tjYSvIeynQNGHYdXDYUkBD7cN/3WcB/PqFobPcGB0+FcNhfNQvTmWQN3jy7a+QPnbIAF4TRXSce0S3YZGo3RCB/ahm4o6zBrmEvFi1I4m/oaM9Sr24wxVoyT4BvNLQkxBGRrgboHbpJYREgFS4JM1/BseHQ6Er3pAMY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ginzinger.com; spf=pass smtp.mailfrom=ginzinger.com; dkim=pass (2048-bit key) header.d=ginzinger.com header.i=@ginzinger.com header.b=qTT8GCk7; arc=fail smtp.client-ip=52.101.65.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ginzinger.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ginzinger.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ginzinger.com header.i=@ginzinger.com header.b="qTT8GCk7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/8YBVHLAUqQctl2WLOVg7ADW5X/+IDtD3aqvYYP20YwSa0zDuMIDcPBk23L70Ai/+UTrFSuJZSg37Pt7GlkQBexfq4dZyFNRL8sI++hhAfOQawCB8KiAiuORRVR2P18qc7p6OLwc5LYWhT6FcDlFhJeJHcspLp1HZ45s3KIyyVrM9KYMuO0KIlZ+9+rW/fWn7VuW1C2UiSlCh+LOgmF7gvwNsE/YudgVsoib+TZ22euYp7vylccUNELlXp22MMThBhQkvZY1rP/AjzpqTv8y+0tZWNYvF0krFdhpz9VKEGPKx+Kfk1D8gJEPtrjldNLJ50XdDprQaEhsQZ8CvfdVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4gljrXkRIxhn457KiPX9YJxb+fVZebUCpbUjHu8fLY=;
 b=xsJcY+tMTSNgnLZcWIHRl2D2fQ5ChCOL1UgdTg/Masv45MqWYlzths5+4JWdmLO/zADMMSZ2zd5CEAnVDB4S2b520xkG9hVRDRTdWestrgud9k+6C285LiiJJTGPjzYvi5gfCV1kigHGB0awRe1WHBR+I8tMDQ3Po1VToqhbL0r9tlUkvLWvibWddAV3sY1+H0klxB78ZonghSW5C+jJZZAtrm3Ygu5yg0TTFyyKoSvnC9WkOj9GVy7Nir9Rn1eNQMSEeAgAjE1/fGx2S5fVAuDwCB3f+CztxcKtHLP9JTrz/G5Poioo5LVyGuoKc9FyXj0W+2PddyEdTkZvXfn15Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=ginzinger.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ginzinger.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ginzinger.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4gljrXkRIxhn457KiPX9YJxb+fVZebUCpbUjHu8fLY=;
 b=qTT8GCk7oQsIF9HBzQXXlRYgi99YfuBOzMCIARQ9UUoFrm3tGvsBua90G6vbv7esQrMqLkjETYaQqT1oSMcMvsf9PUxRZNA6mTDn8BQFrIKBBSZBilOhHK4sWaAEMmhB8N4UyWWDUQx+roGk3G5AAgNR+Nj2lhTKjgjXSIULMmdhEC3ull8unQLL0agMviyMVZirgQh8m3/ZuGLBKnpMnLzOx4XsdhN5WS3bjDXhoBO10PDwNIyLkm9pKbILmicMBmOXEPiaa0F1lU77gIV0WCm7InvV70iiCPHSP28Ha7ktAXI6ZTpo5qHiTTDhf29u6Y3y/IlrWvC45TYeKZEtww==
Received: from DU2P250CA0027.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::32)
 by DU2PR06MB8261.eurprd06.prod.outlook.com (2603:10a6:10:2d0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 21 Jan
 2026 10:26:22 +0000
Received: from DB1PEPF000509F8.eurprd02.prod.outlook.com
 (2603:10a6:10:231:cafe::f0) by DU2P250CA0027.outlook.office365.com
 (2603:10a6:10:231::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 10:26:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=ginzinger.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ginzinger.com;
Received-SPF: Pass (protection.outlook.com: domain of ginzinger.com designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DB1PEPF000509F8.mail.protection.outlook.com (10.167.242.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 10:26:21 +0000
Received: from AS8PR07CU003.outbound.protection.outlook.com (40.93.65.51) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 21 Jan 2026 10:26:21 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ginzinger.com;
Received: from VI1PR06MB8926.eurprd06.prod.outlook.com (2603:10a6:800:1dd::19)
 by GV2PR06MB10009.eurprd06.prod.outlook.com (2603:10a6:150:2a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 10:26:17 +0000
Received: from VI1PR06MB8926.eurprd06.prod.outlook.com
 ([fe80::972a:41fb:f85d:e1b4]) by VI1PR06MB8926.eurprd06.prod.outlook.com
 ([fe80::972a:41fb:f85d:e1b4%2]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 10:26:17 +0000
From: Martin Kepplinger-Novakovic <martin.kepplinger-novakovic@ginzinger.com>
To: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
CC: kernel@pengutronix.de,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/imx: parallel-display: add DRM_DISPLAY_HELPER for
 DRM_IMX_PARALLEL_DISPLAY
Date: Wed, 21 Jan 2026 11:26:07 +0100
Message-ID: <20260121102607.4087362-1-martin.kepplinger-novakovic@ginzinger.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: VI1PR02CA0064.eurprd02.prod.outlook.com
 (2603:10a6:802:14::35) To VI1PR06MB8926.eurprd06.prod.outlook.com
 (2603:10a6:800:1dd::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI1PR06MB8926:EE_|GV2PR06MB10009:EE_|DB1PEPF000509F8:EE_|DU2PR06MB8261:EE_
X-MS-Office365-Filtering-Correlation-Id: 28206424-a535-4d6c-7a55-08de58d785e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?k9iE/NNSGsvpXNDriz7fduSjq6ukIWZNI9/I6hF303RMXTW4TqJLMWqII7qu?=
 =?us-ascii?Q?YeLId8g8eWTneNKGC9X/BQQR5R0pLjcmlLkiXP08QLp4+o4CRC3EDQ7kjcpV?=
 =?us-ascii?Q?DywhPJRdwUecmKRH1oLtBJSw7zmy2CMdtIGjaGVrjLy5g/B1puFyK8x/2fDi?=
 =?us-ascii?Q?02kCDT2B0CYz3akaJbi1MYGpMZMhBnCOHOXxVuwLBQ3RFXjTizClXS4l6w2V?=
 =?us-ascii?Q?kJX8STrc5bgm5qyaKEKY3zIjgA0piTSS2dDNXe038w4k1MhrQqVslb0d0xsc?=
 =?us-ascii?Q?3uEkKyrnk22U3PIHCxRgCLCFuZL5sTE0IZsg7pXXdupMq3+fQMWVEzBFZ+H1?=
 =?us-ascii?Q?1TEP6uVZIVCQq+J3yFTrvaADln6S4465oF6ub2wDhu0LzxyJc/C2J1JDqS/s?=
 =?us-ascii?Q?Mv4IYcqonRy8iOG1Lqr5kEnWhwGIMRyu7W/Ef1g7FUyuxIXZU9fx69mD/ZQe?=
 =?us-ascii?Q?7/T4QBAVcwpUQ/5fFZpbeXZunvz6tKDtj7TWM8P3bitfI9GnIFB7nJ2tWkxB?=
 =?us-ascii?Q?H0YG2S4bk8/nsk0IIY7bNXFYi4vcmA8r0bJHMqhCkD3GOTtN88EH8jpsWAc6?=
 =?us-ascii?Q?E3UuqbxgrTm2nFr+CzuQiJdg8lAQENUHNQ0FHjykIUzxNJ0TPs4LyVdSto+t?=
 =?us-ascii?Q?R6ttP63hf3BM+cGZZlDLuBPxnHeE/sqliR+sCiqhxKMGzizsnleNbx3uGUDV?=
 =?us-ascii?Q?mWOYOuDPoUuCHikS6l7rUuOhEF/0tX8b8KZmxyCFh1wRHfHzKF8OxSDxzrHL?=
 =?us-ascii?Q?610rtcQ+4LHBAkcG2easNxNFGdd7+m/PLmGMwT4edxx9l5CqsQMnHzv7W4H6?=
 =?us-ascii?Q?+viUsfxDJII9H4Raa2mUDrH2Ng0qhHQL8mWjBsgILYt1aQN5TDgnPT6o887M?=
 =?us-ascii?Q?2wfM0FFy721FRIfvY8X5ssmUVedjB47iRr8h3UqQ9EdlDXEVHKP+0m/TNfeG?=
 =?us-ascii?Q?FPZ60Jh/FMgrJc8Ox/hpLa5W7APZg9KnVD0gaXbLsOC3nhkedWJTDtibKZNn?=
 =?us-ascii?Q?0Xc4Rg6KZIgTFiMMIzAd9RYr9UznxuR41lE2yM+yv1XUmdq9c2sDwDk3v0sC?=
 =?us-ascii?Q?gzlaKRDnF31Jn90a2IbNvwNLWt7a9rw3C4W08VFJfCDbS270iZdbny+dEtex?=
 =?us-ascii?Q?Oz2n6kJePn4So6hcHTDMGrY2n2GSTLYQBwh4OtfkaPY0BnlihyyvtOlknW/n?=
 =?us-ascii?Q?HgQXnoLoI3ouiS58UNIEfnRawiVDbkCe0moaPUC3o4YzmsaHeyZG3NzcNoJa?=
 =?us-ascii?Q?0Q9teggOmMm8snm5SUndnY7u+Hk70EFivmG3TmfdAw/dfnZ/5HeGaL0XfiIX?=
 =?us-ascii?Q?/0GXUuMmYWX4Q2a5YtGczQFa2OyMuwbIKWhSjaQeVa99bhQF34v9rGGk/XiA?=
 =?us-ascii?Q?n0kHdHYNxpAh2O/m71qLtFD/LMufVYZiodvIulHWeXd8NPYRzrfBEQX6srAt?=
 =?us-ascii?Q?7aD+B8iC2OBORcuzyRAi9zdiHeT69eoeMy8Y1LtVIcuCImBRKjK9+zezTeki?=
 =?us-ascii?Q?zFp80CZjhnQX4RRZ0/LHRSiI2B9Ct6YqXsAdP2KbK/obSRBJQL0oRvj0HMnq?=
 =?us-ascii?Q?R3GSLXfSrQCQWA8uGlbSjvuK+7k9+xSezScrHML1vu3ZXnxfzGZIOvo6hB+X?=
 =?us-ascii?Q?t9NHVP7Fr90j6r+6YxTdyj0=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR06MB8926.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR06MB10009
X-CodeTwo-MessageID: 2ce84007-45cf-46f2-82fd-0f9771b73eba.20260121102621@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F8.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9cad4bf0-7e8a-4549-0177-08de58d78332
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|7416014|14060799003|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cUi61h1kC/CQTr1gOuygQWlRldg63De+on62yHOaAl65p/n0Wv8MJ8ThaYLB?=
 =?us-ascii?Q?yC4JXPbpCsMg6COMoHq2M3lHJaGP/hecbeA821KkbCbEXuh+GwDjovoPfTR7?=
 =?us-ascii?Q?KielU38rMNGr9jQ8AiNpKs4mQ+Y08od/bwBf3awhrZ9/dVoVqnka5VYArQJ1?=
 =?us-ascii?Q?m/P4EzrGT4L+jRhyYsn3NgFbymvQRluYg2lr+TOwXsi4Cq8UHaf8YwJc/A7M?=
 =?us-ascii?Q?Lt7tFV8IXhXaj/+S1no19q5AVd9Jd1R8DkJQ6YtuQFN+I1A3SfzK0uZY4XY5?=
 =?us-ascii?Q?3XozQ6OOljswCrvmNMsq4tab0/4d2wLgT7rNkAw38UvnV2fV3DZm9Ewv4vUF?=
 =?us-ascii?Q?lMBnpJe7WKjUUbJB7kxqfkCspfEUkk8WNvr4icF3b17UIR5m3MY0dWrhF5bQ?=
 =?us-ascii?Q?FSlOlqhEAGfYwN7sYDnhtFzFuNVu5Kww/8BAybreP4y1u4SRLRiAA2GTMYPS?=
 =?us-ascii?Q?XrPpw/AHzH2b2yjK1PVZCtE1/7lsmXWWQdr2xbyPy2F5UY5bvcA+tqgFItgR?=
 =?us-ascii?Q?bAsJG8lmNOv2vwZw6Y33LPDpHSLMlDR6S0WB4jDXstsi/7ZAqWNEdt2n6SCD?=
 =?us-ascii?Q?pw2v7vgc56260wG+Be3Ekn0eprp5IepywEJP752Sdvv7CLebCrlZFFJMSSL8?=
 =?us-ascii?Q?hb2nYtMQ6FiCt6uNJ5/YCyMCGr1CtkDypxanOlXlxkRUAIH/88/Kt/MPEjrl?=
 =?us-ascii?Q?RBjmY5DDwHF+PjeR6AjtLCPlFwTHnOPyt3ykCpPeRdqbYwAkYS1wM6/opYjn?=
 =?us-ascii?Q?uOe7mjGRcUmlxP3q/FVISp8fmLzteOyCqKNx350WNcHm6Ht+VtCVs/Gglghu?=
 =?us-ascii?Q?3FPHEGwsIRF2xZMIgNIZgg6nrBYTRctYpisPC9WAk7KH77es6utHeJ3WBId1?=
 =?us-ascii?Q?Js2lVmkwQ1Y8yJooJkL61B8s7XCqT7l/xEQTQYvJY6yO4rQ3+eraLuszC4Ye?=
 =?us-ascii?Q?dJgEO3b08u+eGBI7MVtq+3Zh35c/slD/HlW20ux/IpanuUEAcUrCgQNkjiz6?=
 =?us-ascii?Q?eGKqJk0pVAwt4Orggih2vuD0ycSEkscEAehaU7H3z1UGb/9uq/xddAixaTqn?=
 =?us-ascii?Q?gXJZuKzlmxA6k7l1iF/1ac0+7liVq8m8xpif4RplBgUAYSVDPUCQV4JUbNsH?=
 =?us-ascii?Q?gjy6oopBTYYmUGrK9kvNfnZaZ+rcKsTl8DR3MCmOrGDIqxwdhnKvsdCPG7CY?=
 =?us-ascii?Q?UZIGVJyRDmtnKMDT+tjhkLRCoLsZhg/PcKgzYH4VHaqH9PMPlsMS2AWBFrwy?=
 =?us-ascii?Q?ecC9QKl4DsepSf9qmzsGlgzMS38mzcYXUzQq2ljyXNOE8PAZXeGHEeiqQfFg?=
 =?us-ascii?Q?n+e5A+7hwolbA+m3rHTFGTBUxStbep3WrYh+KliGIJ+FjwTcXPQ99Ni0EMcK?=
 =?us-ascii?Q?0WA7FNxExO/cy6JJYydbGvW88gOt2mtFNXgtcewwa1M5Q00uaCiArYwPnhc6?=
 =?us-ascii?Q?R34htf8SgVj4i9kW7K9El+UTmh2ldptkhdm9Fd2djlQS1gTdxX4ITkeAH1W5?=
 =?us-ascii?Q?BmJYNlV4v/zziAn4bSPzfzPZ0FB/egDKpUAZB+/mRRwk9X2AtdE2myZb8cga?=
 =?us-ascii?Q?Gh31KZDEKCNy5vlm8JEGLKPPp0EhL7uQUK7J429P9422G7kNTp8v1bQTXDFb?=
 =?us-ascii?Q?jPDnIS9MaXdBwtR6T/4Gmur1UZ+b538E1qpC7HQcyGJoVsDgQZswBM3u/NhL?=
 =?us-ascii?Q?CrTXbQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(376014)(35042699022)(7416014)(14060799003)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: ginzinger.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 10:26:21.8615
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28206424-a535-4d6c-7a55-08de58d785e7
X-MS-Exchange-CrossTenant-Id: 198354b3-f56d-4ad5-b1e4-7eb8b115ed44
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=198354b3-f56d-4ad5-b1e4-7eb8b115ed44;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F8.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR06MB8261

When I build for an old imx53 platform I see the same as the test robot
saw before:

arm-buildroot-linux-gnueabihf-ld: drivers/gpu/drm/imx/ipuv3/parallel-displa=
y.o: in function `imx_pd_bind':
parallel-display.c:(.text+0xb8): undefined reference to `drm_bridge_connect=
or_init'

Selecting DRM_DISPLAY_HELPER for DRM_IMX_PARALLEL_DISPLAY fixes the build.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512241721.jZgcwRfr-lkp@int=
el.com/

Signed-off-by: Martin Kepplinger-Novakovic <martin.kepplinger-novakovic@gin=
zinger.com>
---
 drivers/gpu/drm/imx/ipuv3/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/imx/ipuv3/Kconfig b/drivers/gpu/drm/imx/ipuv3/=
Kconfig
index acaf250890019..b2240998df4f1 100644
--- a/drivers/gpu/drm/imx/ipuv3/Kconfig
+++ b/drivers/gpu/drm/imx/ipuv3/Kconfig
@@ -15,6 +15,7 @@ config DRM_IMX_PARALLEL_DISPLAY
 	depends on DRM_IMX
 	select DRM_BRIDGE
 	select DRM_BRIDGE_CONNECTOR
+	select DRM_DISPLAY_HELPER
 	select DRM_IMX_LEGACY_BRIDGE
 	select DRM_PANEL_BRIDGE
 	select VIDEOMODE_HELPERS
--=20
2.47.3

