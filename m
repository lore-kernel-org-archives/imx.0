Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2071.outbound.protection.outlook.com [40.107.20.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D3F233159
	for <imx@lists.linux.dev>; Mon, 13 Jan 2025 11:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736766328; cv=fail; b=tTbA22mVOP9obYvwLdqGsYc+jv3pXah8JnTZp0OumBvFOvYyYd419wgWK64y+hOJ+RC0vX805VCgpLFQwXHmTJZmMMAapsFuMNtEJ4RrVAnLkQOQ00yI/3FVd1O6av6WyAG4XMJUaT5eEt1zSbHwOOcXQATmN55F2bPCIyuEmqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736766328; c=relaxed/simple;
	bh=yeL3erO/e+GLObzHKCC0a5jleBIx1pEPSjUUpl408oM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sDOkfogIphzWNdvEM2JixK+dVR1UB2VFyl4th5wbfzMfGFYZxt9ggdsRFBrVK803vx+sdC+WbzCGt8t+ASBjpCmUxHnn8zJxbNA/rbGQYTh50vREW0krIBr9Rh35KJxPj3HUP4Vldo8eqvWSvG6s37uETxYB81DD3iCzBUPFJrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=R9sJQ5nG; arc=fail smtp.client-ip=40.107.20.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="R9sJQ5nG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HnL1PBaNUVKqsFpHjf8m3hPqnccw70P3HcZG/1E5UrrCKnb9ZpbAOSW6EGUD3rld+HSELs+8/C+4kG3UMhbEqxb6G+vCjpHhs/GXLtFiIXDtWfekvIs9out9reL5/KSvONqCsYL9K5CH9SOi5cKpUtQxgESx0dDWXg9s+lDdXoCzuXSUwKRYxDZUO0JhwrWdVZq+ZJ4jsrQrvx8l56MBt+XHCg7YNQQIFn+3wgoeSunY7Ncgb9o4/+rsUNrtILX0y3aQF+nf4Tiwfu9B+ZWSpaf8+37XK65LkBcBCDZnytPVV0nauRuOyYNHK/S0wx1E3kXha3JwHYzVEGRWljaniQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0NOFTWr2UX6hClWC39LeiYSLoNqOWxR2RlHA6hdUOAQ=;
 b=BKnrm8Kmyu0cLz8eL+MQ7/Q6EBlQB+IQsHUBrewIW5A4HRSO2vbiaWmYy8qWdh/5w8zdqHKJWeIwf4OYCozV/5vZw5Uoir8FoAiRDCgb0kvt6YGbHGiem/fNRivSIdptkVrxgXBmgMyqsa3mY5xlnQzqbkMm2IB0wZQ3y293QKqYwjVn9NzbkGe21C/LRFOjDG5csB179izJhLj6Kz3pdnVXPINK7lTE4PZMa6ymoGviny2+GmrRxvdoys8k7bJuSz2vhT2x5odi9bJ7r5RxC8YyglpM27qagdLmS1UVnikULDHioHQg+/UXbDOQ3LNkhRsrGMBzIlqFWV6Kp7P8HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NOFTWr2UX6hClWC39LeiYSLoNqOWxR2RlHA6hdUOAQ=;
 b=R9sJQ5nGLy29ULMLWlJyxkIV9iozbxOYREvrEUf2bYOk1ra05tX7FFc+uv9yTvrC1zfbi7BVMZWNgjwdQ4aUc+yqfKqp2uZoM3HuAWGQqmbXZSESNmEv/4zLKWlRZlecbyegwHi8NPHBmcMWYkYwrQuPJgXVcKNBYevFv/wwx78frAceDpjn69WxgKvxq98/NRehR4QTNqUzUw8vAQ+YS5R83yAlZWTQBIw0VI4gEH4w3ZVgphOCt1yu077oLdJ5tF2luA9ofVqXAZ2e/VT2YZrxzE0XiVd4Wxsh7qKjDVWxFU6E6f41d31Cp2CkJ7M7Pu26o17U6rEvxwAsNCaIag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PAXPR04MB8389.eurprd04.prod.outlook.com (2603:10a6:102:1bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 11:05:22 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 11:05:22 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v5 3/3] arm64: dts: s32g399a-rdb3: Add INA231 sensor entry over I2C4
Date: Mon, 13 Jan 2025 13:05:12 +0200
Message-ID: <20250113110512.506007-4-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250113110512.506007-1-ciprianmarian.costea@oss.nxp.com>
References: <20250113110512.506007-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR07CA0001.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::14) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PAXPR04MB8389:EE_
X-MS-Office365-Filtering-Correlation-Id: cdcf3f44-2d27-4c80-90f3-08dd33c22c88
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXBreHVCYXhOd3RIZXhOVVBySHhydm82ZHB6aW80cGlOL0RHOVBQZ2c4dXNF?=
 =?utf-8?B?L0l6WkRWNEdpOG1wNklFTzE1ZU05UVBvS2lTQ3ppZkVoelNkclM4RExyNGI3?=
 =?utf-8?B?Qks3OUtsWGxETFVmcndZY2JXYzlVbmh4enlBSWtLcmdwS1JwLytYNURaSisv?=
 =?utf-8?B?UkdPcXc5WFViaWxDMTkyYVN4bm9ZUkNpQk5RMTRWTXp6S2VuaHZ0Y214R3lh?=
 =?utf-8?B?Z2JrdHluNmN0bFBWdHFvQU15em5JUitlb1JHUXFqVHhDbTZBVjI0eVdOVjJx?=
 =?utf-8?B?Zll4d1pURXlOR3JyanBoZit5TGJEUStTTC9pdkIvVmJZNE44a1FhM2lVMVZy?=
 =?utf-8?B?Z2lhVW5oTnc0dFdSRkRWSVhBOW45NUk0dmVwcmpGQjJpZEVFZHpMTFZ4NXR0?=
 =?utf-8?B?YlBIQlZKZ2YrU0RtVmlnWWVCRDM4UTJJcVZkcEZYbWVxb09qQkVlY05XQnVl?=
 =?utf-8?B?dnBUekNjc1NZdms0SHlETyt1V2RBemFuZGFDY05WblRBVkJQTVRMUTRSVU5q?=
 =?utf-8?B?VHVQdWpVYW9nKzVQUzR6S2VtblBUTGRNZDRjNGZWTGJWRHlrREVGeTNEbEgw?=
 =?utf-8?B?eW1DcDZVM1JvNWxWaFIxTUkvNXdlSGVLK0lDWUp5RzV6Vk8rVExVbnB2cG4v?=
 =?utf-8?B?a080cG9yWDN4dmhwYW9qbm9pTTgrU053ejNFRFFPYmo1QnhTdlFLL3RYd3Fq?=
 =?utf-8?B?UEpLUHI5NDBoVzJMcExzeHBrbkwrajVyTDhNN3ltU0JqNzNXcFhzS2k5KzIv?=
 =?utf-8?B?OE54Y25yOUlLSGFwRWdWTmhFQStQYk5vM0dMczFFdHNGbnhzOVhOY1ZvdFdF?=
 =?utf-8?B?Z20wRlpDQ1NkcSsyY3lPZGtUS0p4RTdoY2huV29nWlp4S0dTK3BDVEVBMTRC?=
 =?utf-8?B?QTUrUGZqVGNtbEg0UW1ySjFBbUNZYzhFd3ZPR0pjK0xYNGZKN09SUU1ZSis4?=
 =?utf-8?B?Skp2MWNyeW9TMU54Mm02VmVFMlVxekxWdXE1OXZpcTRWSEpPc09wTXBUa0NX?=
 =?utf-8?B?L2lpVUk4N3Uya2pyYWM0ZnllR3B2Q283dW9IaVgzaDBNbUViOXVXMjlBSlpJ?=
 =?utf-8?B?cmxjWnNLNXVXaUY5NFFzODAydjNCTTg1T052c216UGFIQzlJYk1hVEd2bUVh?=
 =?utf-8?B?QWI1L1VsRE93SjRiRmdFUXdMWTJzN1ZtTkhtakc3cWJzb0R2OE9OcmhvVitF?=
 =?utf-8?B?cFo4WERGZmFnUXpweUFWT3J2MFJNbG9ZLzNEVEJzWDloNXQ3Q2d3MmZIZnhS?=
 =?utf-8?B?TFlTUEdEc25BQVA0cnlzZTZQZ2FlY3V6eS9tc2ZqQlBQNFBHOXlLME9tdDNl?=
 =?utf-8?B?ZDdPVWJuR2N1S1M5SDJ5bUVwTVRsMldTRTVEWDdMa0RkVEVMbFNGRUtEVFpP?=
 =?utf-8?B?TkJxbDIrcVpST1lKb2Rwa3RnS1VmdVNraWgzd2poWGd3ZzNYTUY1K2JZQ05a?=
 =?utf-8?B?UlNJcitEa2taallwWk5oWklMNlcyeFZ0eFdnNVNOR3NYTXYrMERaYnNtbVYy?=
 =?utf-8?B?ZXpQRlZYZU9zWGJodXE5ZTRzRDJ3Q1RRTnp2aG1xRmpxNzFIN1h2S2g0Yk51?=
 =?utf-8?B?VWlpcC9ycnZ5ZlBNcXNNQVZFNnphZ05tL2sxdmQrL1hrQkszQjNDbDV5Tk50?=
 =?utf-8?B?bGVYeU5vbys2L0o5Y0FiVlpld1pYRVpkMmp1UTB6R2VmeUpweC9oMmVWQjFR?=
 =?utf-8?B?ZGo3UzlRODROcXRFRGRBTGJacVg3N0VyV3VFSFNNNE9aZkcvcE5LMWRwY1Ns?=
 =?utf-8?B?ckZFR3A5RmpHTUN4dWZiUzBIQVJwdUhrQ1VJU1VnclpWMU44NHN0V0RSTGdw?=
 =?utf-8?B?UDFpeTNWSWpPZ0g4UW91WFBNZkZHZXJzU1NBYUVMMU5sdkRrdEdLNmFLTk5T?=
 =?utf-8?Q?yg6bNY9WcNm4l?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blRkbkoyTXlxZ01wd1dYMWNRU2JlbzAzTE9EdnlpakRPelJJa0QyMW52WTFx?=
 =?utf-8?B?NkNRdXYvQ0dZaGVtbysyVVlmSmEyS3JDcm4rSituNGxoeERtUUNwakJzRWU5?=
 =?utf-8?B?bFZQQzNGaEJVZEdoNTk2S2h1cFVTU1BrL1FPaTBTV2d3ZHVZSjY0WW9jWS9k?=
 =?utf-8?B?alByRDJ4MSs0alhXUEFOa1RJRGpoWDBEMTNZZWp5OEk2Qk1qbXFScmsrMlky?=
 =?utf-8?B?NGVrVEd0U1RFdXgrKzJ1UWtjR1Z5L3BIdVpTam80N2pLRlVIMHhTckFOWEtW?=
 =?utf-8?B?YjFFeTlNcHZuK0ltWDV0VVBMbHBEa1Z5eTFMdDJONEJ0cksxY2EvMVkrcGQr?=
 =?utf-8?B?TzVzcTBtUkVqZVI4V0M5REdBMWk1Z2dhTWFKcWNDVlRBZ3J0ZlcrNXRuSFpU?=
 =?utf-8?B?ZjZZNmExbVJVL2ZJR2ZybG9md0hNWVdhSlYrNW94R2todUZHemIrQ3lZRnNj?=
 =?utf-8?B?NFozNTFNamZ3MWlHUk1pKys4R0FDc3pNU0h3amV3cUJmMEpDejdXRnVDU1ZW?=
 =?utf-8?B?cVFIUDJPeWVhb2NTSVN4bjFWVDh6cVVTZkplQmdqK1d1ZHJ4ZFFoWklkZmtQ?=
 =?utf-8?B?cUI5d3YyanY4L3V5V0tPY0IxRjEvRVh3bEVvMkhzTVZwSkMvNGI2aXlCc1Bt?=
 =?utf-8?B?MndxelBGalhzb2ZYT2RQeEw3MGZqdkxmdGdYRVZJL1gxOEgzTTdGMzhhajFV?=
 =?utf-8?B?d2ZaeENyNmtMd1c2Y1RzTkd4NHR6cVozci9XT0lNbW8xY2pKWSs2OHR5R09T?=
 =?utf-8?B?dEpjL3pDUDd3QmNXUlNwWUwxUEswcXRkMGMyb3llRGRmYU9lRkw2QmFvcDJU?=
 =?utf-8?B?QnY2S0t4bkpYc3oycGVMQjVhY2NVZkFRMUxkbWJHa3dSeDhoVVJDaElCTXN5?=
 =?utf-8?B?YmVXUDhrUFZBbUNkaHNxSHBNcE10TmsvczBwUjM2cTVMWjJhWWt3bDR6K1dC?=
 =?utf-8?B?a0tMek5JbnY1dVIrdHQyNGF4Sm1ReERmdmRHbDhqWnJvbkloVE9QQjRSdUMz?=
 =?utf-8?B?cmlDbW9QZTNveFhBYkU0Q2xUVytYa0lnYWVDbVZ5OUdyQVUyaVBBSVBIUnNt?=
 =?utf-8?B?WlJHM0ZPWFlCV2prN1YvMWViRUpYaUhiTkVMNWdFUCtFUm9QSTc0ODZ0RlZr?=
 =?utf-8?B?TkU1c1o1T2xCNEw0b3VDajNtSjJ3Mm9MVkdiVjkvenFnbDVXNlNhWVgrazVv?=
 =?utf-8?B?andlYnRqRWNCRGFKZkIvOGkxZVVuVnNvN0NSRjFHcU4yZ2hCMWhrbE1qSnBU?=
 =?utf-8?B?RHJvS1JaektOS0U4K0VCQmVuWnY4TE44S1lzZEp3WDV4NkJUM0YvaThLOTE5?=
 =?utf-8?B?ZElnYUZiV01INzVNV3dKTCtXbmhJdzdQRUN0SEdwdWJJK0pxVVIvV0syVHpl?=
 =?utf-8?B?cmdZL0g5THlvV0FvUmpWMXpBSVFJTTMzSkFwaFJhSmd3ZHJEa3F4WWh2WDRQ?=
 =?utf-8?B?UE9nNVY4SnBDMzFrSG12SGFuWjEvV3FYWWlWYzJsZWZPRVB0OWlqbzNPZGpr?=
 =?utf-8?B?Q0k3Q1Q2ZXBydldkbnRPMnhvUWcwOWYxU29BSExBRWFxYkN3R2huUDgyYjR6?=
 =?utf-8?B?QnNmZThXOWs5Qm9JZnd6ejZ2eU5Zd1RzOEZjSTJRM3BGZ051bFVtczcyTFR6?=
 =?utf-8?B?YlNYN2VRSVA3QnVuTHJadTNqZmlRNjRlMDF1cEoweWQzaHAzNjlWcHdIeFlm?=
 =?utf-8?B?TWswRTRkT2F0TEkzdEdlS3JDN1RQSVR5bStNeGZKUXB0Q2N5WXdTeEZhNEJV?=
 =?utf-8?B?d0pxNFpaNmtxdTJnbEtPRE81U0NIU3loRHhaSCtGU3hTY1FqTjlTc2VIbCt1?=
 =?utf-8?B?dW1tck1FcUtCUmU1b05GK2IzZEs2ak5GaU5rNHF2ZXM4YmRWb1Babk1ibkpx?=
 =?utf-8?B?TGZFcGxDT3hXamc0cDdvSGh2U0plTGQ2c3UvR2h6QWlibFlJQmJHQk81TWtI?=
 =?utf-8?B?dzdxYk9zcHgya0M4NWc2NlZ5YmFqUndlckJucUh6SE1CQlA2YXlYczFaNk0r?=
 =?utf-8?B?TmZiR1Jtc1dlZnFOTXVaNUFGTUxva211Z0N0VFM4TUR2c244THA1MDA5eUZM?=
 =?utf-8?B?RVhIUWlyaUFVS2I2aUdIYlB1a3YzWW9ZZ29rb0RJeGZOVUdSSFdWY25nWlMr?=
 =?utf-8?B?YVlyMHlXbS9DY2NrQ0ZYOFJGZ0JrdWVrdWppU0hHcktzc0JwUlY3aUZ5d3lh?=
 =?utf-8?B?MUE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdcf3f44-2d27-4c80-90f3-08dd33c22c88
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 11:05:22.1508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nZ/9V7lVBiZdeti2JH9EBx8xBUh0NWna3+k1fyUow30kdCOenW255is/7n0UGILvEGJdjKk0UdkJ/I1kAf74fOD++vHNAQf1VAt5d5jKcag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8389

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add INA231 current sensor for S32G399A-RDB3 boards.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
index 94f531be4017..802f543cae4a 100644
--- a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
+++ b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
@@ -40,6 +40,14 @@ &uart1 {
 	status = "okay";
 };
 
+&i2c4 {
+	current-sensor@40 {
+		compatible = "ti,ina231";
+		reg = <0x40>;
+		shunt-resistor = <1000>;
+	};
+};
+
 &usdhc0 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc0>;
-- 
2.45.2

