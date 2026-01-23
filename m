Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012015.outbound.protection.outlook.com [52.101.66.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692DC2DB7AC
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 10:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769164056; cv=fail; b=O8QrEY39KMNnU+IG7DcweTz6/4J3KUsZGqQf6OOOf0/jhnRvB+XRFAcg86gJ8bFPGjghyzSVyHV+j7HAg/fVzStVfiZE+sa4d7hVIZJNwK5yS8WFyGk8pfJ04ZPTqZb6VLLHF3Q6tJfM1Ur/YUSy8Sxss1xZAEpRA3CnaZZ1uts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769164056; c=relaxed/simple;
	bh=tRh/6ZmQcjN1Pv+d/ZsWLiViIGvHFbEwcf7tWhsMaxk=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=B1Fk9QsDqgubmBJO7lM0UehXTmJGyautN8Oa8Lwns+PC8k1AQkG5TtoHv5K7JhTtXPX2tPdt50Uk4gT6TS+s52H820/ayTav2A1yaiDDZVjXyALt/10zl13vLk3RFbtF4RqD+6G5eNLTymUn8DbRKUdrEPsVe1zN1u4ST0dfbg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eyOpk+QP; arc=fail smtp.client-ip=52.101.66.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eyOpk+QP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5JY+WME4pnyMaf0LxnT5ehMjPChDILu4oA3w0E39qq8t57363I+UIy0BDatvow2/9mLcRcL6NWRsyMqE1eOHerhwwCcB4WSJJqGqKnA9nybPl9/w4j8I7ykTvbYmJ6VU81QbsocPjk0EErkVVTGffD0nqHzJEsVnaGHMjQHsxN17Gh0OQ4HunpH7CseqSFw3O4pPz16Fxd0mHO8la9sfX6v91MfBy9RiBqBmPfjniG0UgCEOvuTPYcF/7XI9j439r+Y9Epr3sF+MuzROMaadq00xMuZkWLdjHc69I1X88pvqfo4tXJMgWOX0t9iHepSF2K0HuxVYywu3Lj2FnzzKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVnDqXmEcQEMLQx9Wyukvv79S94HVJ93tXLPh1eYr60=;
 b=gROhzVf1dMNdGBb/WKK3zdntHY2J08PeDs5PJY9dgdRteQZIz3GydCwaO5YKDWd7YKrU76qwGfpkdDYWYmwFS3CyVTDMIDbsebTiYmgK9/rRYy7iZQr48niWPdBC8MweeRAi2Ml0j/1TNCcfT45i5M4oKB1XBGhAzCpiWKOQbCimmYxySKhGIvJvpkNzhuy7/vNXujPmSZTzB7ZzYBPErjugvneMz2j6/w6MjD4IYQj/ihv5l8B+RLEA9HkkDI60ZFkkHAzdSzS8q/ihnOqgbAWdWBmTx3TqOZJt1BJoZZ5DZ1TmQyAIQV4DcMPz7Lj8XLRhgtyGDR+ao+05m+8NGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVnDqXmEcQEMLQx9Wyukvv79S94HVJ93tXLPh1eYr60=;
 b=eyOpk+QPx1eJRGqAnxo/HkAcbLmatPDjIGbb9ZFKgbnugY9ZDBcghqqamZkq0Jw0ezLiNOlK+WO0m9OgYEwdo9ljjeg7H18kjNTZHj+qtXngRdnydVgs/pM/5HOgnNfNfy7M8LH0WaFAfYDT4Gi7M0MEjYUfZJJ1Y/7Ovd4ibObj8aHcEWFOdfZ46vgHl8tLsficGtPcfAMnJPg/wBCl+kkrBy5B+fQmW9MWr/EiHjEQVfpXgI9+WTO21BWV2u9pfet0+1KYL1s2iMFSWUz/5cflL6SBRMvaqmZ20zWogfbHCWaiHz0YibE4wG/sAd5FUsWncHnxvlrpw+8BRQYlMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by GVXPR04MB10520.eurprd04.prod.outlook.com (2603:10a6:150:1df::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 10:27:30 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%4]) with mapi id 15.20.9499.003; Fri, 23 Jan 2026
 10:27:30 +0000
From: Joy Zou <joy.zou@nxp.com>
Date: Fri, 23 Jan 2026 18:26:27 +0800
Subject: [PATCH v2] arm64: dts: imx95: Reserve eDMA channels 0-1 for V2X
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-b4-imx95-v2x-v2-1-0497a9814668@nxp.com>
X-B4-Tracking: v=1; b=H4sIANJMc2kC/32NsQ6DIBRFf8Uwl4b3FIRO/Y+mgyBWhqqBhtAY/
 73o0C7WMF1ezjkzCdY7G8ilmIm30QU3DnngqSCmb4aHpa7NmyBDwQAZ1RV1z6Q4jZhoaRmYWhs
 hJZCMTN52Lm262z3v3oXX6N+bPcL6+0cUgeYnJLQctAHA65Cmsxmfq/UA4ajzlWusG/ZF1nLEo
 xpmtOGlYYoxvl8rdxDNsTZd1Uqh1K+2LMsH2HGalEcBAAA=
X-Change-ID: 20260120-b4-imx95-v2x-3e01c7bc6881
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR01CA0139.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::19) To AS4PR04MB9386.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|GVXPR04MB10520:EE_
X-MS-Office365-Filtering-Correlation-Id: fb0ca39d-bc87-487e-7c1e-08de5a6a0346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|7416014|921020|38350700014|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N1UxS2tXYU1HRFJRcC9ibnk5YlQ0TW9FaUQzT2g0dFRwUWRGQitwTG5tTStu?=
 =?utf-8?B?eTVEalVIdGs5ZTNOdWRnZ1cwWlJKdE5ZbWRZbjNGSDgxb1NSRmFLR1NyeGFy?=
 =?utf-8?B?TjFOYkwxV2lTSnV3Y1FsZzlxUUNQQU05MENZcmU5Ynk1bnI5Tm13Yno3eDM3?=
 =?utf-8?B?RUxnNitOQWtMRUNMWkJPd1A1NnNienNJeVIvVEE0TWZjeUkvM29WYzBXSjZk?=
 =?utf-8?B?QzdwdGZsNWgwd21XRzZwT09XRGlJREJYT3dkMmFBZ1lmRkY3SjNWM1BoSEZF?=
 =?utf-8?B?aUVwTHh1eGV3UmxQL1FIZDN6SldVV2Z3Nm85dmFablREWFh6SXdRVE5xaGV6?=
 =?utf-8?B?bkREUnppU3RuQ0JoZDJsVlhXUGpBcjFNUWkyYjg5QVVtV29PN09aTy9DWU43?=
 =?utf-8?B?OFU2TkdvdHAzajVMRG9VTGoyejZKYnMxV0c4R3ZYVU1kaE1IaGxsY3lZem9l?=
 =?utf-8?B?M01Nd01rSGo0ZndwK05tTDFSdmR6cFcyOWlBQzRMNXgzdXowaHF6YjMvVnQ4?=
 =?utf-8?B?Y0NiY2VLdHlHNjdCWFd4aXZhY09pQlhNTjRScWwydFVMdGFrRzhoQnU1TzNs?=
 =?utf-8?B?UG9LSjFGc1JtZkFuQVlaL2U2U2Z3M1Q2Q2RXbUFyaVVnMUpsWDk5MkFKbmJE?=
 =?utf-8?B?LzZUTEZ3OVd2Wmh6dUIvS0lKaFF2VFg5TXNvSzJ6QndDYWtZcWlqdHhBNGpN?=
 =?utf-8?B?UmN6NTV4WlRaWDB4cXNuYzlhb1hSTElCMlJYR0ttc0ljekJtcW5ZejRVTEZL?=
 =?utf-8?B?cmdIL2JpMDN5dlFFKzBGZ3E3a2ZBMUtQTndzWWxpVEdOeUprL1hrSGE0d0gv?=
 =?utf-8?B?NGhCMWdmL0ZZTmlPMnV0dGZQcmRsRVFzdDN5aGZ2VWJVazJqbDJNNGhzcXcy?=
 =?utf-8?B?NWRZWGF0V01nRFdEZEdOcXBtSjJQc2UrYXEzNnhkcE43NWdiM2pCNmEzNDdM?=
 =?utf-8?B?Yk5LZWcvRHFHREJUaHFqQ1JCNWVuV3Z3cVBYcHhJS2JLUC9NbHc2MEIzLzhK?=
 =?utf-8?B?TVNNUEgrbW1lRHZWTG5oeFRhbCtlbERBWFcwVnlTekpwMXNRTTRwcHZvZnNj?=
 =?utf-8?B?RStvUThvTDh0aW1CNFlNT2hyWUhrV2JsN1dFcjhJQ2lTOVl3MGRxN0M3WDRz?=
 =?utf-8?B?dzdqbTFsamY5ZUtHUHlZdjBETWhUM0QwWThGaFVLK2xuUmtlZGJDUkVHeEdX?=
 =?utf-8?B?ckE3RVlRWWt5R0w5dzNkZWwrYTJ2b0lMNEhrUkQ3aFFtM1ZMeGdzelN3VHNJ?=
 =?utf-8?B?SWxUdDI5dll4UjMzU2dJb3FvcVBvZHZsL0VvREhGTUw3SGtIc0NFN1g5azRr?=
 =?utf-8?B?a1dlNWptQitNSU1ldkd3aEVvUVBEY0hGV0ZGWGQ1OG42cGE2NzladzhFU291?=
 =?utf-8?B?ZUZhT1BLdmZOREFiYXI1N1FqWkMyN3RWMmlyeWtBY1JZbDN6dFg0MjEwRm9u?=
 =?utf-8?B?NnVidDI0b0hpZkZLZWQvMFBIeUMxM05ZOHdnUURuWXo3QVBwdEtXRGJIbVFv?=
 =?utf-8?B?cHZ0VHFNVHhQMmlZRzEvc2dKZ01uMEM0aGxpWE1DR3B0TGMzb3lSZDZMTExS?=
 =?utf-8?B?N241ZlFsUFhNOG1BN0orK0Q3SmFjcHJZRVlyV3p2Mzk4eEhnTFUyUGMxNHgy?=
 =?utf-8?B?c2UxSXNNVWdBeXUzOHhXZFZPeEJLSGVhNlptMC9Pb1NZT0ZxcFdmakY5VmR5?=
 =?utf-8?B?MENpRzVPWXdNdHlubVF5b1BNcGtaVzZVVDh0b1lFNWhtenZyTkpWTVExQ0Yz?=
 =?utf-8?B?SW9GWHR1WWxpUUxseWs2WWwvU1ZJK1hCY3M5OStHOE1aTE85djJvNXhhVXY0?=
 =?utf-8?B?emYwSFphQkkzWktNRVN6NmJwUllaUnBCYlo3U1VDdEZEUFFlSm5WZXBjRVNr?=
 =?utf-8?B?RGwycUplQmJPK0Vkc3lFNlJYL25iKzFOQnBua3JPNy9MWWlkL0J1MzIyN3JW?=
 =?utf-8?B?ZUc5cDE3eWo4RVZaNWQ5VU1jdW1lOHlYTUdWeGZNc3dONHcrSFN6T2doZGRi?=
 =?utf-8?B?WUZiT0Z2VFdhaFVYS2ZZMWVzdm5yaG90bzRoT2w2dnNKM21NUG9wTko4KzJJ?=
 =?utf-8?B?NnBKWDZYNU9EdVhZdk0yVnVxZHVsQVkwMHpRT0NpMThrYysyUHZZMlZ3dVFT?=
 =?utf-8?B?Z2JvZkY5Y3FyQmEvZ212RTgzdCtTYUxCLzFVbnpTT245bENkZ1lPeVVkNFhB?=
 =?utf-8?Q?zqLX4R4mvNahg38+cLlQ1/zsGIKU2GA0TMidbIhwb9WR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(7416014)(921020)(38350700014)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTJvcENvazg3QVhJN2hZSkNLWlEzaStPNGx0SVJzRmR2YjZIRHlXMWdoMjg3?=
 =?utf-8?B?dVJhYWlrZVhEbnJuRU5xMHdPMnNqYUQzOE94MVcwcmZMYXYzck9JVmZlR1RI?=
 =?utf-8?B?OTN6M1kwSkM2NUhoZFpOMnV5UUdOeU9TMXhnMjRrS0ZXK0l4ZmE0TTJxKzhl?=
 =?utf-8?B?VmNMaEQ1RXk0QUplRVFPVFZGZmZ6b0FKc2lIMjNRTXdSYlhPcnZMd21ETCtR?=
 =?utf-8?B?V3c4eW1VbW1PbVAvRER4L1k0VUhtTlE5QjEwcDYwZ2twWForVW5pclFNOHBt?=
 =?utf-8?B?MXpVOXhNaGZmTldCbnJmeDZaMyt0T092QWNrNnd1d2tNdFluSUNHMnFMNXd4?=
 =?utf-8?B?TXc3Z2E4emtkcFdLQnlwcjJWRWxZcVdzYlYwMmdPYVI2blN3Y3VBVTQwZEJt?=
 =?utf-8?B?MmFkSllFaHQ1c25Fek9ZSlAwaXJIUzhKU0RkeUlzb0lEakJ1KytoajZqTW1q?=
 =?utf-8?B?dFdZY25ERVBldWtLMFJ6UjhIV0NUa2QxTFlFbDJYNDhqRUtjQk0rQVBEVUg3?=
 =?utf-8?B?ZG1JdVJ3U1FGT2Y1VVR4RGhvYnRpRE5lWHFqSTRjaUFqTS96U3QzVTRMTTc5?=
 =?utf-8?B?Sk90Yzh6eDdsV2xXZy90d0ZLU2c1Z1pNOXh2VWJQeS9YYWZpamYrRi9lSk1k?=
 =?utf-8?B?elY1bkREZS9XU1hTeWQvdHRiaXNkRzZTT0tTOG5iL2gvWkl2dHJoTjk3ZkN1?=
 =?utf-8?B?dTFydXRTTTlndVNwd1hqaEFwQU9wYUpnMmVDbHVFQTQyUXpSOC9WQnJRUTh5?=
 =?utf-8?B?QlBISzdVa2lnUEJKbzdsVHFWZWN6bXYveGVCWWRmT0ZRU2pwSEtESWlDM0w5?=
 =?utf-8?B?blh1R1pra3hpOVh2UVZGKzBzTE4zUDIrdFhKY2I2dGMxTTFLbW92dFFKZDVa?=
 =?utf-8?B?U3Z4RzFCZVFjdjBJY1AvSFhRcDhiMm9JV3VORnFDOVZyYUxRRWtxRm83U3Rh?=
 =?utf-8?B?N0JlWEhQYUN6RnY3V0JsN252ZU5kemdNcS9JOUlCck1VMmVTMkxKaDI2WGpz?=
 =?utf-8?B?dHM2SHYzR014SkhCUXcrYmI5VnhBQUJQYkQwa28zeCs1WFB1OG0zM2RtVEdK?=
 =?utf-8?B?Nmk5MUR1dGpwMjFpN1hiTlJHeUs3T3BlWFpRcS93a3R1SDY2bkp5RHEramtE?=
 =?utf-8?B?OTFZUjFqY0xBd1B6OVVWR1NLWU1rMUtSNGJBTHZ2SXJjTGtMTXZqYmszMDBi?=
 =?utf-8?B?RlM3MjNGaWhUVjVudHB5TERCWnA5SWcvOTk2VmtaMzBzMGwyTlN0MWsyQm1k?=
 =?utf-8?B?Vnprd2ZJUlZnbzJ1V0R3MklIWUZNdEU1Z2ZZTTJGZXpMYTA0RVVxVld5Zzdm?=
 =?utf-8?B?cWk4REVkS2JmOENsNGFJdWlmNG1yazhoYVl3cHloRXJ3d2dMdVNtQVBtczQy?=
 =?utf-8?B?NzNUZHFNWGpxdVpqWVRyRUp3KzB4TWc1NDcxMFlneHhYTXJhTmU2OVRmbzJ4?=
 =?utf-8?B?MGF5QVd0THVaSTYyZUpaMy9Pdm9ONlo3VlhYQXdEY3VPMnUxaHNzZkx2bzZP?=
 =?utf-8?B?V0NScm1FcURYdUJCZlFuR1JyWTljUmFveEJobWVFejVqdEV2YWFwUjFHUHJZ?=
 =?utf-8?B?TGpCUkF3ZDNjMDREYXp2VTBJb3FmdXVES0RjODFaemhRZUdGZHA4MXlia3lM?=
 =?utf-8?B?cm9pOHZpQzlRRTVMM0krcGRPblhVZjQxRTBaemgvVmdoaURkM3JRcy92TCtZ?=
 =?utf-8?B?dEtyMWRXaW5uZUxWTDJ5Wjd0UmtBZ3c3TTNHa3NYc1lpMkN3cnZ2eTRZbUI3?=
 =?utf-8?B?NVV5NU95M0RQVHV1anhyejBYMW03Y1J3aTcvRGFtMkNSU0RlVHNmNGhkNE5V?=
 =?utf-8?B?Y2NDMlFOaVhSNXpSTlRmVDE5MVg4YW4rd3U3YStpZHZROHVrRk5HTUxiZ1BD?=
 =?utf-8?B?dlBMQWZUTGNVWWZNQVQvVHRlQXZFdEJRVmVDQytSTENkVGRFZVRJOGw0SVNT?=
 =?utf-8?B?Wk0xU3FhblBnMGw3a0tjUG1qb0pTOW9TZWY2ZHBTbHUzM1E0eFQzbVQwYVpO?=
 =?utf-8?B?ekZVZHRMYzVLbkpjWGtVQVoraE9GdHkyeEVuS0FaajhkREkrSEJINW5BMUpl?=
 =?utf-8?B?NTVYeUFYMXRHbjVVV3U2YXZydXZVOUlOaWVvYWJpaVc4bkc0aEx1d0V3bGZo?=
 =?utf-8?B?WFNQL3lvdDFTOGtSd3hnM2NTbURzcEwwVjgwYzI4S0g2UDd2R0Jjand6cXlr?=
 =?utf-8?B?TS9KRjNKVlhYbEttSlE4UEM2Kzhyb0U3SDBNcFlPNEtlOFNhU1Z1VXJ1Vjgx?=
 =?utf-8?B?eE5GSVl0NUJyTzVKV013SW9UUlZlZ21QVWtkUFQxRzZCU1JYcSthN0I1MnFi?=
 =?utf-8?Q?P0HTY0Heddlm0V8vCe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb0ca39d-bc87-487e-7c1e-08de5a6a0346
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:27:30.2928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TxWSvxaLSyKAf8xMJ1Y5pXNNnB2xlP0Oa9TdOxoYLWkeSPrKu0km68AL5lZQSCRO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10520

Reserve eDMA channels 0 and 1 on the AXI eDMA controller for exclusive
use by V2X (Vehicle-to-Everything) fast hash operations.

Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Tested-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
Changes in v2:
- modify imx95-19x19-evk-sof.dts dma-channel-mask property.
- add comments for mask channel.
- add Reviewed-by and Tested-by tag, tested on MX95-15x15-FRDM, MX95-19x19-EVK.
- Link to v1: https://lore.kernel.org/r/20260120-b4-imx95-v2x-v1-1-52b2025b27a0@nxp.com
---
 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts | 7 +++++--
 arch/arm64/boot/dts/freescale/imx95.dtsi              | 2 ++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
index 808a9fe3ebb2b9557be9e428583e76c32517de08..264703f6eef64813d64fe07713cf92fd02fa0778 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
@@ -55,8 +55,11 @@ sound-wm8962 {
 };
 
 &edma2 {
-	/* channels 30 and 31 reserved for FW usage */
-	dma-channel-mask = <0xc0000000>, <0x0>;
+	/*
+	 * channels 0 and 1 reserved for V2X fast hash,
+	 * channels 30 and 31 reserved for FW usage
+	 */
+	dma-channel-mask = <0xc0000003>, <0x0>;
 };
 
 &sai3 {
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 55e2da094c889fc7c1096d0e36f31ae118d2a982..9ac82da2ff440e08ae8378d7ff830a568d50a354 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -631,6 +631,8 @@ edma2: dma-controller@42000000 {
 				reg = <0x42000000 0x210000>;
 				#dma-cells = <3>;
 				dma-channels = <64>;
+				/* channels 0 and 1 reserved for V2X fast hash */
+				dma-channel-mask = <0x3>;
 				interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,

---
base-commit: d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab
change-id: 20260120-b4-imx95-v2x-3e01c7bc6881

Best regards,
-- 
Joy Zou <joy.zou@nxp.com>

