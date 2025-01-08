Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2054.outbound.protection.outlook.com [40.107.22.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697FD1ACEBB
	for <imx@lists.linux.dev>; Wed,  8 Jan 2025 07:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736319676; cv=fail; b=OghnmbdOLljpZXgHhzznYOqMQxwSh3d1zuGlS9qkDBOMIWENkbZeTOCZzUNCMVnHJ6lLCDQMxnrDoleidMovWX65YWt/Zwv3IjdIe+tpdiWnsv4jglJ2t/2hHShM0Rerjx6f5I/xV7YA4GWjpiAB22Ws7tDzufF3Uij3mvUL1ss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736319676; c=relaxed/simple;
	bh=0bDQtW0kObux3QS1ylxvCp97UjUaum9QMoHP2HWykKg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eop/tENFQ/9Vlb1F3AuYdPsU5nBRgEKwrT7x3X0Ls7vlrquM+1EYfP+ISfjjq7GfA74o/Ed6uBh4IGt+hFQU/5dI00c7uXLibH91oiYPy6HPKo/a52oF8tTM7mzHORB0j09PpwKJJrBKGBH+ATnnXxVR+va/VRPG3VF4ymRr45I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PqtaU6jN; arc=fail smtp.client-ip=40.107.22.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PqtaU6jN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TxCJeKvUazaE8s3JEQBogrU6WFzBjR6J3iNVbNCg3QMetBRWH8Rzyc6yZNHcROswrMF7mGR3+0Z4ZdQQZZsDWSPuuNBXTJBfkhbPi2K9mO4whZBZxD42KN5PA2aEYfkA3lfU9nUG2ek5Fltcn49+NQ2aPjj8sT4D8Pqdjm/cKJOAsarOLJ68W2AnFugcts5VQ1/K1La9Ei3FmP1alpVLGyiREkJJG7wmx//Y3UOV0ANtoLLoxLcHCW5xKDhkyhimb08DLuKLyc3W8BhC7BpUpmJM5tW1NikHGfXgzoWKJnG88LSaRSkTV2SnU5ffHovTtoP3e2tlr+t30osHo9bOog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ficKDMJHutpnR9+e5tqPHRKXCOVxSEuXA7mZvXVxOjY=;
 b=vpEWaDmx/Qh4hujduGHLXBIOZp4Ay+Hm8+ZVpoNrDUv0IgkX0ttlsEmQNKHnFofdypduE7Unbp/YBskPaFRoi7YieEIcvz2JTwkEURAppvOj7c8XRru5QrEMq7ofopetssLnfrYW1tD+penNFmIX+wXguQ+16hm/34FAGbCrdV74jhnYDZB41jPaO5asYA3CpX37fq6SW4kIoSi1Ooqoq2UB6HIT3U08PQceBT1zynJ0dyuVw8F9JKEA4Jc77f003fPyVdU0y8O2CLdHqirKeBNs5kqMUuxNNww9CerSmwkGI0lxCxMKaYcavX+Sq2Qgr9KFv3s+t79uyufo+REz+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ficKDMJHutpnR9+e5tqPHRKXCOVxSEuXA7mZvXVxOjY=;
 b=PqtaU6jN7CalDjBxvYv2xxHKYsV3WL8JeC1odvBAflNDhL+MRnLPbW9iuV4GqlTMFR0DZCSePVls7GaU6OQwVg3op7cKbi3HUr6nFrENY3yvDxMxkgaMO+ADByvyK9bF0Ccb7+Z1yxJqNyOMdqfoVtKB3xnQeMjnqBaews7IpxnM/IJ7aDxkHmevE4P2Dyct6PaaBS/4fEs9ngSFjPtl3ZYUD/icT4m9uQ6QO7Wb0VIVPStSHj5hs/h1ISDqVirKNN7vJ025t8ERLOw3LLOLBECk/7yxfs7BjpMCcxNnfTGxm9RzhwlIDwUUA0OLOL2HHYWKa1xgB3dHKz5I15dexA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8299.eurprd04.prod.outlook.com (2603:10a6:10:241::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 07:01:13 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8335.011; Wed, 8 Jan 2025
 07:01:12 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 08 Jan 2025 15:00:18 +0800
Subject: [PATCH v5 2/2] nvmem: imx-ocotp-ele: Support accessing controller
 for i.MX9
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-imx-ocotp-v5-2-a6d90e18ebe9@nxp.com>
References: <20250108-imx-ocotp-v5-0-a6d90e18ebe9@nxp.com>
In-Reply-To: <20250108-imx-ocotp-v5-0-a6d90e18ebe9@nxp.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736319636; l=8461;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=ygBXTu6sPO5G9v1oUfsK+vaVlx3iR8OEqYpTZT/i8Yw=;
 b=0P6tedobxHgxPhCRN34vbmBija8euo5KL5Lrv+tcVXecTC5b0a3qWri3bbcXT/3qzcxE/PraM
 I8ggoEqmHeOC7SnPdloNHZYjaQJ/nA3ibLwofRDRa2v7KUAKpKBF6QW
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:54::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB8299:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c462ade-f0e5-4062-ba3a-08dd2fb23cd3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MnNYbDVPSDh4djEwZUJTbDR6M3dMUXFwNDlydE5DQWZUWWxvdEI2dUh3RlZR?=
 =?utf-8?B?c1BMY0pLODJwYUl2bndmZmE2aG0vOFNRWXV6SXRscE5Tb3d0L1A3MlJ4dG5F?=
 =?utf-8?B?cDIvU25JWWNyZWlubVd1c0ZlR3V0MWd6ZW54TC9IRVlyNmpQL3BrQkRKem15?=
 =?utf-8?B?eEw4eGFmMk5NSWorUkZVYXBrTURIa01VNEpCRndNQ2Z0ZkNpa2I3bjZWaytx?=
 =?utf-8?B?ZkNENXhvMFNTc056UUxiM3hGTVhIVWNnZ0lQYzJXcUNmNWlUY1FsRWUwSmhj?=
 =?utf-8?B?Q0VIQ2FIK01mdUlyeXJTTUdnNnBjck5WSkZMOVpUUEpRckNBVHZod0RZVUJt?=
 =?utf-8?B?L09xN0x4NVNTRDJVZXk5cUZkdS9jTDR4aVlVRSs4WEJYQUpMYUkrL21SczNq?=
 =?utf-8?B?MEZ2MEdjRGdPSlVDbnhUdmtGVzF5OFVsYlU5akRYQWlPWkMyM3Q5VUxmOWpv?=
 =?utf-8?B?OUtaTjd1U3FBT0xtVHUwMnJ1bkw4V1lMNzFDZUNyblZpZU03OERKd0pmZ0ZM?=
 =?utf-8?B?TDc1MW4wTlA3QVRzaUg4eFNMdlpVNkxXZHBVWXN2YnBsVzdScnFUNFhvaGlY?=
 =?utf-8?B?NjV4QzVORU83UmRpYVNxZjZKc1h1VzBMdEhLb01kREdvTHFJVjJ2ZFc0TTlU?=
 =?utf-8?B?cDh3WU5vUVljNjdiT2g1c1I3TWl1dWVob2w2SlhqUGVrR2E0bHJZK2F0eUdo?=
 =?utf-8?B?QnBYLzRadkhQdzh5YjV2dVZKWUlKR2tsSlFKdXJRd1dTWmdyVTlzZWl5bHB2?=
 =?utf-8?B?bGtPVUtaNjRhNDNQcEtsMVBvVGc3b2w4eUdiSCtLS1pTR1BFK3dxZSsvc01X?=
 =?utf-8?B?dDhxbWFQR2tHRGRIeVk3N01hZUlzZnEvK3NLLzc3V24rcUdlUGYvUzlpR2o4?=
 =?utf-8?B?dlNJNFJSUUtzRUJxNksvenY1V0Y3Yk84OGdoTDdnWEZVZDJFb0ZYK0tqckpZ?=
 =?utf-8?B?eXZYOHN6TXBNM0ZrRS9wb2d5ekJlVzFtWGZRT0QrZmcvNUFMa1JuVUVLZFNM?=
 =?utf-8?B?b3FORzdHZFJJSzE1TTJGTTNRbzNOU0hXWEtNa0ZTZU5UUG91TXJxTmlkOGdB?=
 =?utf-8?B?VWgrblAxcy9MY2hEWTVTdjJKRGVNUUcxSTdreUpDOU00ZE5QZ21zbDcrQzJr?=
 =?utf-8?B?ODNSZ05IUm1SaGRVL2NRcTY1c0RtdXpCQTBKdU9mUGpGdlB1ZUo4ZG5EZnZs?=
 =?utf-8?B?Vk9aT1Q3SmRBT1UzV1NNV0JxTGpKa2hnTFZhWGJRQUVHbFBaRVg0RnZ1ZmNm?=
 =?utf-8?B?NTJUVnc2UnRudmU5eDFHTERYTW1Ic09RK3VyT0xZZzhVcXVYSDB0blowMi9o?=
 =?utf-8?B?eXBjdm5GR0JLYm90aEpKZVdNZFRmVGhaY3FDNWUvRTBtSERTQ0VhM0pCRFA0?=
 =?utf-8?B?L3VUOFlkaEVVUVFHNDFkbFdrT1Zucnd5SWJiTFUxVjZQV3NXUDZINERpVG1R?=
 =?utf-8?B?UDZQTWRweUhmZGVUaGM0UHF6b3hlWVJKRW12bHVlT2xqbkFDOCtzM0t3Yy9i?=
 =?utf-8?B?bGlLamY1UFI5TWZhcmVPY3JZZHFpRVdHd1hzRm9SNkR0ejhhRWF5eVVWOXJF?=
 =?utf-8?B?SDNxcGxxd3hOaFlxbnFGNnFDU0xiQ2NRR0t0NmhyNnc1Y0g4dU5xVmREUUE0?=
 =?utf-8?B?cHhZa0IzZmNUUlRJK1N2N1ltYnM2M2RkcW9xalNpTjEzZk91dVJkNGpkdWl0?=
 =?utf-8?B?V0F4RzlscHAwUHB2V0o1M25VWml4Q2wxV3NQQzJEeXpadmlCWjlFYk1EaDJG?=
 =?utf-8?B?NFlsdFcxeEJhRldaZFFVbkFaNThKcHRxVE9weEJKQ1lvNVNYdjRuajY1Y1lF?=
 =?utf-8?B?TjFKS1ZQb3E1RTl1U2ZYekFhZmJXQmdPZE5lUnJRSWRGUjdLRTF3STk0Q25w?=
 =?utf-8?B?WlZZMWovTHhQR3doa21jc0U3UHRUZFVtNk0yWTFqVDlSR21scThCR2wxQnJW?=
 =?utf-8?Q?lNyQ/daKjvbVPwLphD0mJLG6pptdnRhU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmtYMitTczJBTzFWSHgxQStlaDkrMjNhcTFxZ0M5V3NIc0toZUdQY0VQOUtu?=
 =?utf-8?B?L0lzZ0NQSlI1RXNGUEZaMEVBbTdxV21wanBqd3VTOGxQM3NSWEd4QWZOU3JE?=
 =?utf-8?B?WGViZUx3bW9tcCsvV0x1ckRRWFE5Q1FvNzdaNWRhNExwTjFmYXMrTkgwYUJV?=
 =?utf-8?B?RnZTczlZek1FVkhKeGFhVVhvWkdINkJmZzhhZ01kMFNXUFNweVdHSEh6MTVW?=
 =?utf-8?B?ckd1cU1SK0tBZFFMazR2aUdhNmJXaXZiV2U0eG14MzJ5SE5IdDlyOVZvdU1E?=
 =?utf-8?B?alQxWTBwNjVreE1aMk5ESGttNVN2VnNoRlNQL040OGZQOWxueHdrZnNVRmxp?=
 =?utf-8?B?b21LYjJmNjhuRlI4Y0JUNk1ibGFYcGpDNWF5NmJsTisrV3Q5eWdRUWV0NzB6?=
 =?utf-8?B?UzZTeTl3SThWZGlPNnRvYzZyWTJWTHRoSitCUnBzSGhFTU9zOTNYTjJhTGhw?=
 =?utf-8?B?U3hzMnhTK0ErVE56SVJxTWJCeVRwLzdjUWY0eTZKSjVDYncwN01TeFFsWU8x?=
 =?utf-8?B?dlNjUGg5WE9ZcVByc0trQ1hyM2FIc0hmMWF6aVZhVWcvQ21YQS8zaGViUlFB?=
 =?utf-8?B?aTgxZ1pDNytzLzBieHdTTjl5MWtJVCtaUG4vUi9DMTZ2VlJTTU9PNkZuV2ts?=
 =?utf-8?B?eURkdGdpSkN0ZzFQMXp0QklSNFdBbTVJdk8xL1grQ2JFU2tBWUFlSlh5M0Zn?=
 =?utf-8?B?MzE5V3FqdWc5MWpRTXdNajBDZXh5VTdGVjBQVENLTHV6aC9BQXNpa0dxUXZr?=
 =?utf-8?B?SkRDVlh4SCs5RjRhVmVrdFlOVTRXOUQ0cGhtYzlVRi85ZzRJTlRmVkc4Wnls?=
 =?utf-8?B?YmtqcUpJNlVzUkxhUlJvT3lpamNQV3YxREYvQjY0VllIeW9JRW0yUFhvRGVR?=
 =?utf-8?B?VU9DemUvWUcyOWlSdEgzamFHVy9FZHIrR3VuWHZSVVkvU2pjdTZNN0xNNlNv?=
 =?utf-8?B?YXZpbVdwaVhVNm5aZ2g4d2l4K3FIOVh6MVRPWk9kOXpidDVYa1NHUXIrR3Fm?=
 =?utf-8?B?dG11UnBRMmkwanBuT2dGOWxzbnMzL2lyOU1jQi9LeHZraWhMSDc2RUU5UUZJ?=
 =?utf-8?B?OG9HYXlaMThZZkpmVUh2dGRTdklMdlFKOHpYZWUrQzlWd0ZxbzFGb1A3VXJh?=
 =?utf-8?B?NkhnbFQva0lqeFJ5YjhZeTNRN2xqaWVzbkdxc1k5QW9BUzRKSUNlak1JeDFQ?=
 =?utf-8?B?WU1TZzJsa1hHTDIxdyszRmtlZTlDTnhnN2ZaOWUwdDFvOXNKNjA0bjZCK3Zk?=
 =?utf-8?B?TGh2MHAxVTJNaGRGSStLTmNMSThNWC9TYk9Cb05UL1ZzaVJwOTFNVVJ0eUI3?=
 =?utf-8?B?N3RmMmFES3ZSNDJjNTUrSzNQalExRzlnSFVsUDgwYXA0amNtRWUwYnRiK0R2?=
 =?utf-8?B?ZnNaeHJ0Q1I0b2JWcEV2cGJ1cDEwclVhT3RhSUJXN2lEWTZsZ2JtTWt0dGF0?=
 =?utf-8?B?Y2pEaEIvalBQWEMwTlhHNFhZV2JNYWtlNU8xTXlsQ2c3R0hFWlhwVG1hK2xC?=
 =?utf-8?B?dXZjSXdWQlpvSWc2R2V0c3ZrKzRYWFc4TTVpakdJcExVWTJycU1oZ2MwN09w?=
 =?utf-8?B?RER6YmM2UXpyamNVeFJiZG1TVkpaMmJmWE1sQkNDYmhkaHJCQ1hpYStoai82?=
 =?utf-8?B?blpyQnJWSDNKNTdqc3RGejBPMFdLeDVZVW9NMi9CSG9URTJmOXRmNXJuM2M2?=
 =?utf-8?B?L204ZW1RN2IzR0ZZb09yRzdxSEd3NytYSzMveHZzVEc4eHEyc3J5UUo5dDM5?=
 =?utf-8?B?ZnFRVWIySlpwQkE1b2FCcEcvUTJBRUtqRTNKT3lQYkZ0cjdjOTZNNjE0ckhS?=
 =?utf-8?B?TTAxMHhHcEduTEk4SzBBb0RRc0crUm4vQStQMnYzazFWM2o2ay9yUU10blcy?=
 =?utf-8?B?WXBjUklybHhwYXdIYkFPY2plaksrNUtMVTNycmFldms2Q3BUZnptcnowZmRz?=
 =?utf-8?B?QjJHRnpCdjR2RnJuaURkWEJMQ1dJMG9YbG9TY1JBZHpjcWRsdnJkNitVWm9C?=
 =?utf-8?B?cjRyOENWRDk0anVtd3p2S0VFei85QjZNcGFNQU1lYXhHUTFrZWtVU0VtVTFz?=
 =?utf-8?B?SHZsZ0dHVFhDdmZwUW9WZzcyYkdCNDhwaGJXcmZaZFUzYnp1NHNYSW8vK3Zr?=
 =?utf-8?Q?MSloAFEglZIt3QI6d0aByCsAi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c462ade-f0e5-4062-ba3a-08dd2fb23cd3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 07:01:12.8644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3FIYwDIuuivr7n7bgkfVIFtP+N7RNJ698c2+7KFw6knkkGTdjPxvYglpfl57bBY/i7NYwk0bxHI/onh2bd2IBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8299

From: Peng Fan <peng.fan@nxp.com>

i.MX9 OCOTP supports a specific peripheral or function being fused
which means disabled, so
 - Introduce ocotp_access_gates to be container of efuse gate info
 - Iterate all nodes to check accessing permission. If not
   allowed to be accessed, detach the node

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/nvmem/imx-ocotp-ele.c | 172 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 171 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index ca6dd71d8a2e29888c6e556aaea116c1a967cb5f..5ea6d959ce38760eeed44a989992fb35c462c0b4 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -5,6 +5,8 @@
  * Copyright 2023 NXP
  */
 
+#include <dt-bindings/nvmem/fsl,imx93-ocotp.h>
+#include <dt-bindings/nvmem/fsl,imx95-ocotp.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -27,6 +29,7 @@ struct ocotp_map_entry {
 };
 
 struct ocotp_devtype_data {
+	const struct ocotp_access_gates *access_gates;
 	u32 reg_off;
 	char *name;
 	u32 size;
@@ -36,6 +39,20 @@ struct ocotp_devtype_data {
 	struct ocotp_map_entry entry[];
 };
 
+#define OCOTP_MAX_NUM_GATE_WORDS 4
+
+struct access_gate {
+	u32 word;
+	u32 mask;
+};
+
+struct ocotp_access_gates {
+	u32 num_words;
+	u32 words[OCOTP_MAX_NUM_GATE_WORDS];
+	u32 num_gates;
+	struct access_gate *gates;
+};
+
 struct imx_ocotp_priv {
 	struct device *dev;
 	void __iomem *base;
@@ -131,6 +148,82 @@ static void imx_ocotp_fixup_dt_cell_info(struct nvmem_device *nvmem,
 	cell->read_post_process = imx_ocotp_cell_pp;
 }
 
+static int imx_ele_ocotp_check_access(struct imx_ocotp_priv *priv, u32 id)
+{
+	const struct ocotp_access_gates *access_gates = priv->data->access_gates;
+	void __iomem *reg = priv->base + priv->data->reg_off;
+	u32 word, mask, val;
+
+	if (id >= access_gates->num_gates) {
+		dev_err(priv->config.dev, "Index %d too large\n", id);
+		return -EACCES;
+	}
+
+	word = access_gates->gates[id].word;
+	mask = access_gates->gates[id].mask;
+
+	reg = priv->base + priv->data->reg_off + (word << 2);
+	val = readl(reg);
+
+	dev_dbg(priv->config.dev, "id:%d word:%d mask:0x%08x\n", id, word, mask);
+	/* true means not allow access */
+	if (val & mask)
+		return -EACCES;
+
+	return 0;
+}
+
+static int imx_ele_ocotp_grant_access(struct imx_ocotp_priv *priv, struct device_node *parent)
+{
+	struct device *dev = priv->config.dev;
+
+	for_each_available_child_of_node_scoped(parent, child) {
+		struct of_phandle_args args;
+		u32 id, idx = 0;
+
+		while (!of_parse_phandle_with_args(child, "access-controllers",
+						   "#access-controller-cells",
+						   idx++, &args)) {
+			of_node_put(args.np);
+			if (args.np != dev->of_node)
+				continue;
+
+			/* Only support one cell */
+			if (args.args_count != 1) {
+				dev_err(dev, "wrong args count\n");
+				continue;
+			}
+
+			id = args.args[0];
+
+			dev_dbg(dev, "Checking node: %pOF gate: %d\n", child, id);
+
+			if (imx_ele_ocotp_check_access(priv, id)) {
+				of_detach_node(child);
+				dev_info(dev, "%pOF: Not granted, device driver will not be probed\n",
+					 child);
+			}
+		}
+
+		imx_ele_ocotp_grant_access(priv, child);
+	}
+
+	return 0;
+}
+
+static int imx_ele_ocotp_access_control(struct imx_ocotp_priv *priv)
+{
+	struct device_node *root __free(device_node) = of_find_node_by_path("/");
+
+	if (!priv->data->access_gates)
+		return 0;
+
+	/* This should never happen */
+	WARN_ON(!root);
+
+	return imx_ele_ocotp_grant_access(priv, root);
+}
+
 static int imx_ele_ocotp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -161,14 +254,45 @@ static int imx_ele_ocotp_probe(struct platform_device *pdev)
 	priv->config.fixup_dt_cell_info = imx_ocotp_fixup_dt_cell_info;
 	mutex_init(&priv->lock);
 
+	platform_set_drvdata(pdev, priv);
+
 	nvmem = devm_nvmem_register(dev, &priv->config);
 	if (IS_ERR(nvmem))
 		return PTR_ERR(nvmem);
 
-	return 0;
+
+	return imx_ele_ocotp_access_control(priv);
 }
 
+struct access_gate imx93_access_gate[] = {
+		[IMX93_OCOTP_NPU_GATE]		= { .word = 19, .mask = BIT(13) },
+		[IMX93_OCOTP_A550_GATE]		= { .word = 19, .mask = BIT(14) },
+		[IMX93_OCOTP_A551_GATE]		= { .word = 19, .mask = BIT(15) },
+		[IMX93_OCOTP_M33_GATE]		= { .word = 19, .mask = BIT(24) },
+		[IMX93_OCOTP_CAN1_FD_GATE]	= { .word = 19, .mask = BIT(28) },
+		[IMX93_OCOTP_CAN2_FD_GATE]	= { .word = 19, .mask = BIT(29) },
+		[IMX93_OCOTP_CAN1_GATE]		= { .word = 19, .mask = BIT(30) },
+		[IMX93_OCOTP_CAN2_GATE]		= { .word = 19, .mask = BIT(31) },
+		[IMX93_OCOTP_USB1_GATE]		= { .word = 20, .mask = BIT(3) },
+		[IMX93_OCOTP_USB2_GATE]		= { .word = 20, .mask = BIT(4) },
+		[IMX93_OCOTP_ENET1_GATE]	= { .word = 20, .mask = BIT(5) },
+		[IMX93_OCOTP_ENET2_GATE]	= { .word = 20, .mask = BIT(6) },
+		[IMX93_OCOTP_PXP_GATE]		= { .word = 20, .mask = BIT(10) },
+		[IMX93_OCOTP_MIPI_CSI1_GATE]	= { .word = 20, .mask = BIT(17) },
+		[IMX93_OCOTP_MIPI_DSI1_GATE]	= { .word = 20, .mask = BIT(19) },
+		[IMX93_OCOTP_LVDS1_GATE]	= { .word = 20, .mask = BIT(24) },
+		[IMX93_OCOTP_ADC1_GATE]		= { .word = 21, .mask = BIT(7) },
+};
+
+static const struct ocotp_access_gates imx93_access_gates_info = {
+	.num_words = 3,
+	.words = {19, 20, 21},
+	.num_gates = ARRAY_SIZE(imx93_access_gate),
+	.gates = imx93_access_gate,
+};
+
 static const struct ocotp_devtype_data imx93_ocotp_data = {
+	.access_gates = &imx93_access_gates_info,
 	.reg_off = 0x8000,
 	.reg_read = imx_ocotp_reg_read,
 	.size = 2048,
@@ -183,7 +307,53 @@ static const struct ocotp_devtype_data imx93_ocotp_data = {
 	},
 };
 
+struct access_gate imx95_access_gate[] = {
+		[IMX95_OCOTP_CANFD1_GATE]	= { .word = 17, .mask = BIT(20) },
+		[IMX95_OCOTP_CANFD2_GATE]	= { .word = 17, .mask = BIT(21) },
+		[IMX95_OCOTP_CANFD3_GATE]	= { .word = 17, .mask = BIT(22) },
+		[IMX95_OCOTP_CANFD4_GATE]	= { .word = 17, .mask = BIT(23) },
+		[IMX95_OCOTP_CANFD5_GATE]	= { .word = 17, .mask = BIT(24) },
+		[IMX95_OCOTP_CAN1_GATE]		= { .word = 17, .mask = BIT(25) },
+		[IMX95_OCOTP_CAN2_GATE]		= { .word = 17, .mask = BIT(26) },
+		[IMX95_OCOTP_CAN3_GATE]		= { .word = 17, .mask = BIT(27) },
+		[IMX95_OCOTP_CAN4_GATE]		= { .word = 17, .mask = BIT(28) },
+		[IMX95_OCOTP_CAN5_GATE]		= { .word = 17, .mask = BIT(29) },
+		[IMX95_OCOTP_NPU_GATE]		= { .word = 18, .mask = BIT(0) },
+		[IMX95_OCOTP_A550_GATE]		= { .word = 18, .mask = BIT(1) },
+		[IMX95_OCOTP_A551_GATE]		= { .word = 18, .mask = BIT(2) },
+		[IMX95_OCOTP_A552_GATE]		= { .word = 18, .mask = BIT(3) },
+		[IMX95_OCOTP_A553_GATE]		= { .word = 18, .mask = BIT(4) },
+		[IMX95_OCOTP_A554_GATE]		= { .word = 18, .mask = BIT(5) },
+		[IMX95_OCOTP_A555_GATE]		= { .word = 18, .mask = BIT(6) },
+		[IMX95_OCOTP_M7_GATE]		= { .word = 18, .mask = BIT(9) },
+		[IMX95_OCOTP_DCSS_GATE]		= { .word = 18, .mask = BIT(22) },
+		[IMX95_OCOTP_LVDS1_GATE]	= { .word = 18, .mask = BIT(27) },
+		[IMX95_OCOTP_ISP_GATE]		= { .word = 18, .mask = BIT(29) },
+		[IMX95_OCOTP_USB1_GATE]		= { .word = 19, .mask = BIT(2) },
+		[IMX95_OCOTP_USB2_GATE]		= { .word = 19, .mask = BIT(3) },
+		[IMX95_OCOTP_NETC_GATE]		= { .word = 19, .mask = BIT(4) },
+		[IMX95_OCOTP_PCIE1_GATE]	= { .word = 19, .mask = BIT(6) },
+		[IMX95_OCOTP_PCIE2_GATE]	= { .word = 19, .mask = BIT(7) },
+		[IMX95_OCOTP_ADC1_GATE]		= { .word = 19, .mask = BIT(8) },
+		[IMX95_OCOTP_EARC_RX_GATE]	= { .word = 19, .mask = BIT(11) },
+		[IMX95_OCOTP_GPU3D_GATE]	= { .word = 19, .mask = BIT(16) },
+		[IMX95_OCOTP_VPU_GATE]		= { .word = 19, .mask = BIT(17) },
+		[IMX95_OCOTP_JPEG_ENC_GATE]	= { .word = 19, .mask = BIT(18) },
+		[IMX95_OCOTP_JPEG_DEC_GATE]	= { .word = 19, .mask = BIT(19) },
+		[IMX95_OCOTP_MIPI_CSI1_GATE]	= { .word = 19, .mask = BIT(21) },
+		[IMX95_OCOTP_MIPI_CSI2_GATE]	= { .word = 19, .mask = BIT(22) },
+		[IMX95_OCOTP_MIPI_DSI1_GATE]	= { .word = 19, .mask = BIT(23) },
+};
+
+static const struct ocotp_access_gates imx95_access_gates_info = {
+	.num_words = 3,
+	.words = {17, 18, 19},
+	.num_gates = ARRAY_SIZE(imx95_access_gate),
+	.gates = imx95_access_gate,
+};
+
 static const struct ocotp_devtype_data imx95_ocotp_data = {
+	.access_gates = &imx95_access_gates_info,
 	.reg_off = 0x8000,
 	.reg_read = imx_ocotp_reg_read,
 	.size = 2048,

-- 
2.37.1

