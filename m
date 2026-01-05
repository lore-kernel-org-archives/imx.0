Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010012.outbound.protection.outlook.com [52.101.69.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E22326944
	for <imx@lists.linux.dev>; Mon,  5 Jan 2026 11:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767613759; cv=fail; b=QHjFRFZXInPs/kQhhUEVQ8z1QWj5z6UOHNGWcWFSl7eDgVu40pLaglPXAkQiHof9GBgzbqNnq8jgzCbbFB/qq+2mEIgaMmNJYGt3neR82pWVSd6ijpyh0bbQwAKrMehZJIPc1bInhZNZ8oF+X8Eru4kom4GpXAffjP5r3UNKLzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767613759; c=relaxed/simple;
	bh=zjI6j9jFY4WBLFLWCGomqwew+Da70twpwBTnYWWNdjQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=HeKinCct+s3ncSKRcSDrviuocvyvqtFh0y2ESErZGAqELON/5UiVjFOAotWoVp1WP45UqdlxqdOSxNMMC8PIgK2Garx+eGNW4hBTD2oKPHZ0fPFhASfKKycFygpg+Kan+hoqDRHqdB1PyRbE3R4UNRzfjz89KF4eXVOPlUFq+2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=w5D2pc4L; arc=fail smtp.client-ip=52.101.69.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="w5D2pc4L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZK8K+cpbWa2Wy48TdQYalhDp1HAtkSD8+I69hMHJ95aDnIrG7Gjcgi53DzG8+aNOAMNGSvFeGob8F812nktMsFQ/yGbUMFlPDUgrSdbz1EDM9uVgByigfSQKJbA5E+uPDZWTE0fspdvCEzbboDWO6eucyVFxkqQSYw39bTGj45kq1OZGd/89Kw4fKA+mmZYxRGcNedCzCG4XBB1pgUHXtV2MbYm6Zxj6ixda6Lf8CPLx2yW7qnxeM2XqnXM8P9X5L71CxB+9WLr1fNuX6UG9LUCCHyiX7PFUG4MOza+mzvLo99UduDc3dd9+erzGTxZX5gb1Tmcv1RQwwhVCZzbWFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDh93kUXtD99iOZKFxu5nJD7bqUFu5W0zhIdkdFwb5s=;
 b=pn7HTRzWYu7nZSjqcj3lt6J0MH8pz9TEBv4KCQf4kv0IVRiLiuVPYM6BaaT+FlFrGrz+6iNS+Hk6lWSUaruMbjxYAlUYnlt8egw8NEqjy5bb9DTp/nD0sav4hPdXPmBtBamrSgmmQaIykXskJHl45lbk71iAjYXxl8dazG2dOIjfevuLOrRjSYCyCIyI/qeZdFJ8qjjlYjG1yg5befxAX5K2LWDU04e57HuF0o1LdLWVzWLo351Ko5hbb1NWugpyJyKlx44Mv6ll1c1eRi3Ii0GXWHebnshQcaZvk7CsQJpFU5QP+1J94Zg5rCbP9spyGRbNw2qrAM6qrnIg41nmJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDh93kUXtD99iOZKFxu5nJD7bqUFu5W0zhIdkdFwb5s=;
 b=w5D2pc4La6ewMkB/SdKQxCVlOooGvgLL+53J1rG3trr4/m4iZPb1VuqLW+WvYhhdIkxOHRedVl3C6DFXH2u16omwAJNqMiToiNzvCliwtIhuQZuG/+HPkeGO7KxpXaY7y///jnNNFaV6rImIhRLyRp8Bd57YKoSP98JgdBIxfWQPF8DSusv2bcEpGDoUG9r9CauNPlgOCiejqgGzj0VUsmz7Rxw+/V29iLVZ1G7wPsHs1g+gSwDAQzqMQ7ymTS9YdbTlvzY77G3SsCKDNSbhx+kfJLFEhp4yznKSa07J/Q0Gpg3CpbzdhiPIXaJeP+qKq8qMPkMY26DVk0fUlvwP8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB9878.eurprd04.prod.outlook.com (2603:10a6:150:116::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 11:49:14 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 11:49:14 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 05 Jan 2026 19:48:42 +0800
Subject: [PATCH 3/7] arm64: dts: imx952-evk: Enable UART5
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-imx952-dts-v1-3-68b5a4d69710@nxp.com>
References: <20260105-imx952-dts-v1-0-68b5a4d69710@nxp.com>
In-Reply-To: <20260105-imx952-dts-v1-0-68b5a4d69710@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB9878:EE_
X-MS-Office365-Filtering-Correlation-Id: 379e97b8-eb30-42d0-0a8d-08de4c5072d1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UEEvRk1XQ0N4RDJCZlpmUVNRNnF0VUpYNmVLTkkrVmh3eHlRTDZUYjhLcWg3?=
 =?utf-8?B?YzE4Q0NRelRKbTNaU2tJdEFBR3I3YWRrVTFUc0g1Y3VkczY2cGxXbWRtWXU0?=
 =?utf-8?B?MzhIV2JmZkNFNzR0eFFHVEZQTklQaXkvb2g2Y1BoNGZtOW90RVg0SCtxS3g1?=
 =?utf-8?B?QjJXOWNSR3NDS2k2emxDMXQ0V2huekhUeDRqTWNNWDJhK1p1K0JFS3BzV1VM?=
 =?utf-8?B?M25telNMRElHSEI3L0kyT2F0QzlzNG9YREpzRHlqNTA1VTR6VmI1RWZlVWE0?=
 =?utf-8?B?UUtvOUxHT3h5OVBiSnRUYWt6WlZROHZhakphNzNlN0JRR2lLbVptTXlyOUl6?=
 =?utf-8?B?TVFhc001Rm5QN0NLWlFXU0V6Um5yRE1TSU9ERVdHUnBzNDN4WDIrclI4M2lN?=
 =?utf-8?B?UkZQQjRZUnJVczgrUENFSHRSNFhwZFdtdEYreVZkY1NNMy92NHhBbGVKcnpq?=
 =?utf-8?B?c0RvcDlBSFRHb3ordU4wcnlDRWREK3NLb2FjR0pzSU9DVERGVzYxOEM5VmtJ?=
 =?utf-8?B?aVpPNUV0SEp0WkVjU1FtVE5GRjJFUkVLaWg3Q0I3aHpRNHRNK2RaZzd4VTZa?=
 =?utf-8?B?aHJzRHRwVFMzcHJDeFBYYjJmMEdZUmFnZWh0ZjFkVWdlaDB1K2liQ1lZNTAv?=
 =?utf-8?B?WHdVVnZ1TGRwNG5uRlR2R0RpMTNBbW05YlJhdEJQSWtMa1Z1dDJSbDgwMVJh?=
 =?utf-8?B?ell2SEpzZmhCVitOYTErSWI0ckRId0w4RmJpWExMbnJiWXFOaHlaUTdpSHA1?=
 =?utf-8?B?RURDYkU3eXB6RXduOGMrcFhJMlNmd0VMUi9ybHdkdzl2Zjd0ZmI5ck9Ma2Fl?=
 =?utf-8?B?eHp5OEZwRjlWdkZ0QlZLcDVseWhvdHliNlRJaTV3K0pYWUY5aVZqbFVueHhr?=
 =?utf-8?B?VWszbHFEWWNSOXQ1dzRBS0VXazZMVzJQekNLaXhua0xCL0x1ZFpURFJqNDc4?=
 =?utf-8?B?anZXMEZPOUl3eTBJdFFkc0F6WDFocnVXUVdGcUdPT1dGN1k0RERzcEswb1E2?=
 =?utf-8?B?OFM5MEFLVCtDYWdVZWR0UWJkalk1dkZRSWhmaGVlMWZtTmkxQlZacVZMRGJS?=
 =?utf-8?B?anpoWDVTTkZlSkxUaXhqZ09jVDc0RUgzcHB2bEROTFNOdStVMDdmWUI2S3B6?=
 =?utf-8?B?Z3JJaUpIRHo1MERMQk9QbGE5bjdqWlNlRVlyWk02UXlOQmhEWHI2cVo1R1ZO?=
 =?utf-8?B?bkVPOHFVMldwZG5tYXdWQXg5Ym53V0FlNGczQXJLUGlaYnQwZzBHNHNDb2c0?=
 =?utf-8?B?YThlMzUyUklGOW15dllpZkN2YU9ZM1gxeXpPR05jcTl5cUdRekFCclZlTFQw?=
 =?utf-8?B?cDhIbmM5TXNwYVI2N1pwS1Q3WGFGTmU5bkpUUEJLaW1xTlV3NXQ3U2FTZS9T?=
 =?utf-8?B?eEtnV1hyL0lYbjA0aURQUkRIcEI5YWpmOXY0TnV0eWRFUnJjSG1pZWk5a0ly?=
 =?utf-8?B?dllkbHFPYmVIbkRKM2V6VVZ5MytkdG1uNWI0U3cxWTBLa0JJSmhXSis0NUdh?=
 =?utf-8?B?c2daVEhVeDRBY2gzZjZZOFRNU1oyVUwxcFJrS1lSbmNpOHlEb3oxejdQNHUz?=
 =?utf-8?B?U09XU0JyN0NNazZWRE04TWNseVBCelFpcWtSbjQ3TzZyakl3RjR5eUhnTWtR?=
 =?utf-8?B?Q203MVpVSHNRSC9xeS9oOG9NY29ObWpwV09nenp3VkJuTDBDMUIwSjk3bU5o?=
 =?utf-8?B?ZU1KY2M1Q2MwMFBwK2IreHdqSGVQNFBHVWVrTGVMb2xLZytuYmhQeDRIdnRx?=
 =?utf-8?B?OVIrcUFkNDZVSmFNQWY0TkE1NFU1SDZ0M0xJRzlIWFcwWEFIUVBtSEVlUU90?=
 =?utf-8?B?Z3FZV2ozN3JCeUtjVWxvKyswMWJzV2ZySFJFKzgrczJNTTZxb0RNR3NvWmlm?=
 =?utf-8?B?c09maUwwSVVoc042c1pKRERNYzI4amxWWkZ0RUlyRDBleWhnQWhGYlFDS1lE?=
 =?utf-8?B?Rk80SjJ0ZWVYNkJpZGlYc2pIM1ozcDdGZzdQbUFIMytxWDVROVhJbXJwUHdD?=
 =?utf-8?B?QmpUdFMwYnVSRDgyS1BZa1FBOTNuZ0EyZGZodll0K1luUXNteDJCY2JwRVlV?=
 =?utf-8?Q?HWs/Kg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0tXVHN4b3hXUjFsdWxFTDBnMXdNRXd5R0RiZSsraXpOc3B0elVsYlNKZUZq?=
 =?utf-8?B?ZnNOaklRbnRaVngwVFZJNmZPUXdzL2M0aXBRRGFJYWZZWTRIRmh6c3Jlbjdl?=
 =?utf-8?B?TGtJVlVka3RscTU5cms0ejdqcHJ4NC83aXNUUUFhd2J0N1Fqb3VCOEpiRlBJ?=
 =?utf-8?B?YmVBcDJCayttR091SEk1UTZ2TWVsd3F6TWhyRUlXV05tSTZxV0hjOHJEeGYy?=
 =?utf-8?B?VlAvOEpDRkVjcHl0RnJ2MGx3cmdnMVFmdHdpcmVXMlY4WUR3a3BBdWNpNXpO?=
 =?utf-8?B?YmkvNlR6MzZIdWtwK3MyMVdFMnBYZFdSTW14UHFiUG9Mb2JwUVhjeXJETFFu?=
 =?utf-8?B?bFpERlFDQit0RzVEb2NGbjFMT3REdUs5SzhrdXY0eXg4MUdQWlprcGVpSWJK?=
 =?utf-8?B?QzlGTEVqV2JJUm1PUGN3VTdzMmZCTW9SeTVKMHIyL2NBc2M4K1ZxenRiOEps?=
 =?utf-8?B?c01qcjFZaGF0ZWdWS0EzeDN6TUs3ZXpvcUp6S2JHQWlwWTRodUlscCszSFVy?=
 =?utf-8?B?d05oT2VTSVNMa3JlRStHQTdDVkFSWXJUY2M1cVdnb1h5bkJDZGw1Mkc5ZUVl?=
 =?utf-8?B?MU52dTUzMkt0U1VXanlCdGRrVm1rVTNwUFhEcnpLS0NrNnlCMU5yYzVndTBw?=
 =?utf-8?B?S2RuSHM2YnkyYWJocFpmZlNZcEYxS0dZak14NmxjaHBxaWhxRG9tc2hUOUNm?=
 =?utf-8?B?M3NNSUsrSzkzWitDVENRU0FMVEtQMVBuUVN6ZFB2R29nNXh5Qk5aK05ISDl6?=
 =?utf-8?B?b3V4OEpGamxaTFZFMmU2aGdWcDJCY2NXQjZVaTdDV0RXNUlJRHB6aElsZTc1?=
 =?utf-8?B?NDNkTEhldzVDdWMzZXpPOUJsTnVrOWxkTnF4U1p2MTRWSGdBcnMvM2RFeXh3?=
 =?utf-8?B?MWhNREJ6ZER4b3paTHFLblJJYUVZcFJIajlvTXNRVDNiYXBzRkhaTXQ5NWVD?=
 =?utf-8?B?MlRwVkJHWnZlWTNVWnRhYXdNKy82azBjWWNLL1VJL1pvRkpZbXNEWkQ5T1Bw?=
 =?utf-8?B?VHBQdnhYdzF4MWYwbFh3TFd6WHgyTms1bHhBZVdiUjZyMEVsTWFSdDN1bGEx?=
 =?utf-8?B?cUhTRkFaaURCOThPQ01VeGZaZVhzUWlnVjUvOS94VHlSNmFwVWpFK3k4cDNn?=
 =?utf-8?B?NnE0OWxqQ3dzd0NmRWdLa0ZvZFZXRzhUMHhKZVkvUWU1WFdTb1JERXJIWVI2?=
 =?utf-8?B?VTJEdXNKQjBZTC9nb2FEc2IyeGFrRVpYamhScE9DRTNWOCtYQlJFWklGWFdU?=
 =?utf-8?B?VnlRL3krbEsvU1lZeDc2dmhuUll3NGVLZWlJUVFQSGxmNGxhZ3FjeTBycE00?=
 =?utf-8?B?T0xKazl4c1JZY1BQWG5IMGx3VytiM0dqUnBGTGFwVS9sZUE5bjJVay9ISkZw?=
 =?utf-8?B?Vi9WWUZQK0RyVDFDTndXMStEUVlTL0dNYWZRa05IVzZxVHpNOWRWb0IzOHF4?=
 =?utf-8?B?Z3F5WmZlR01GbC81MGtodnJJcEVGWTlWN2swZm5ZWnJuaGYzdG9TdzRNeTVv?=
 =?utf-8?B?ZEJERlEwSFd2dUNnZEFiRDR0TzkrNDNqbUhRYnhFZzZOVThCRTZ2aVJmMkRN?=
 =?utf-8?B?cW1VTXBrRTZROUZoZnB3WFlQZ3ZLdjQrcUdyeWd3OWVjOTJycWxabm5OVEVt?=
 =?utf-8?B?Q0UrWW1MbmNnVlFFSWpQWkRjSmFZaEpYT3NCbDhpSUs2Tmx4T09Iek9Dbm5Z?=
 =?utf-8?B?bkdROGlGdWZZUXJKY2xMVm04SzRDSUQ2Zk9UTzExNzBjUGp0Y3VsUzBIblRi?=
 =?utf-8?B?MGp1aHBHUWRPNWhpMW5YaCt1N3d5RnBkZzdZZTJKdDVpY1NuRWFOa1ZNVDNI?=
 =?utf-8?B?amFlZVh5S0FQbTVSQjJmdlF4Y1NaUHArNnZ0eDc4eXpTdUxOQUQzSUt3MVFP?=
 =?utf-8?B?VzhuWXJncFRxUzhNNXFPSmc4K3hhUEUrYnZGZVpiYkk3N002bUwvR255M1N4?=
 =?utf-8?B?YjQ2ZWVnWEwwYmdPY1VDMGlVb0xFV0VNaGxZMnpGYnJFRGFFOXY5NHpic28r?=
 =?utf-8?B?RTJXZGc3c3REbnJTTDdjSEYxMWdPVk91aEd6MUtJcFJkd2Zqa1g5akNrNnpo?=
 =?utf-8?B?YmJWdWQzS2VZdk10cHFiN01lN01LTkRjOFJlcmh6SWkzKzFkOE9TdGNhNmdN?=
 =?utf-8?B?Z0dlN0tDOVE0bjJjbWo2TTQ5Y0RrRTdxZ2srWmExM21LalhvYTBHcy9MNFln?=
 =?utf-8?B?Y05ZTkxtMzZZR215OUJ0dW0ycWJ4ajJtY2tua2ZZZVVuNjF3SXNYZm5ldGh2?=
 =?utf-8?B?dHNWa1orU1phUHZLZTd3MU1iMnh1ODlKWGY5STQrWVNENUVHS24xTVhVYjQ0?=
 =?utf-8?B?TlZ6dTY3SERFeFJudWdrczVRb2xOelQ1V0MvazlwMzVxRmt6anVaZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 379e97b8-eb30-42d0-0a8d-08de4c5072d1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 11:49:14.1949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tbGenAAaW+dXtvN9zT2yz+AGrO3L3gFMs2Eb5ai0SgvqouF1WGyYbsJOciUWJetMXQhVs4gbjxDsLMfbywisPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9878

From: Peng Fan <peng.fan@nxp.com>

Enable UART5 for using Bluetooth.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index 53cbdf8389b670e9fc6d294e912736f51dc35aec..e324f9d4e22c95f36f8c203bd44097ed383d90a2 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -28,6 +28,7 @@ aliases {
 		mmc0 = &usdhc1;
 		mmc1 = &usdhc2;
 		serial0 = &lpuart1;
+		serial4 = &lpuart5;
 	};
 
 	chosen {
@@ -199,6 +200,17 @@ &lpuart1 {
 	status = "okay";
 };
 
+&lpuart5 {
+	/* BT */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart5>;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
 &usdhc1 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
 	pinctrl-0 = <&pinctrl_usdhc1>;
@@ -291,6 +303,15 @@ IMX952_PAD_UART1_TXD__AONMIX_TOP_LPUART1_TX		0x31e
 		>;
 	};
 
+	pinctrl_uart5: uart5grp {
+		fsl,pins = <
+			IMX952_PAD_DAP_TDO_TRACESWO__WAKEUPMIX_TOP_LPUART5_TX	0x31e
+			IMX952_PAD_DAP_TDI__WAKEUPMIX_TOP_LPUART5_RX		0x31e
+			IMX952_PAD_DAP_TMS_SWDIO__WAKEUPMIX_TOP_LPUART5_RTS_B	0x31e
+			IMX952_PAD_DAP_TCLK_SWCLK__WAKEUPMIX_TOP_LPUART5_CTS_B	0x31e
+		>;
+	};
+
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
 			IMX952_PAD_SD1_CLK__WAKEUPMIX_TOP_USDHC1_CLK		0x158e

-- 
2.37.1

