Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013058.outbound.protection.outlook.com [40.107.159.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B4F312803
	for <imx@lists.linux.dev>; Fri, 12 Dec 2025 09:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765530994; cv=fail; b=cxI49pOchN4WvI0H6hQUYDt/TjEzg3EgmUtkjIIyIOhI5GbtkHGKYUR0oxP7WN5xE2LfLFhPaTAJLIM8YW51klFhofAeErApKoG158fRSgHI84OeUe6mpXrXijPBenizgOyWzW3Z+h1nMSnPaAEso3GapGnBlNUYKLg8FAs5Y9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765530994; c=relaxed/simple;
	bh=fravVwjuFMqxFjoMzYssH4WqPkW8O91CxVE4i1NUTJg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=V+GAoTc9/hYpBTlhL25MhUywv3sLT8qa3cWl76A9DlAfNNdaW904/QL/5yfQ+/1pYDKhcxayFL3nfPnUgbzYeOIu8sV5zWt08qKqaCAWmpEvPS9V2X1Y+uM+Q3dCp6jXbMLQFZjMFz80AUkDDtRq5CIh0wwSoLXwanfUjHbnH4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cmcDvVuR; arc=fail smtp.client-ip=40.107.159.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cmcDvVuR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JcdSQ67/SaSpj6BGTx22eZGAM4wwi6yZKy9+v4J4WHE7nhumNBUI7b22DImN2TjM5k/wF+6A/cOCMCrwkugQlhddj6/pp7MwAwRrUIPUHWFwWSwOa4iKQN/3dzZESVJ3lK49kaVGqqYPhP6tORZP8HouKXpwhLJFVxSsDAKnPAGdyj1U3UMiRWK5G4OPBZPmjB+XaGxHaKHmQZ9Al4OGPVZg/tOz0GljhdDmzsRIz2OAzQMz76tpbTqPV0imAiBLyaOSyHzKWeloL/rRBDHJG0GKZaQi0Wdr5CnCUSYqba2XsSe50XlsBXHcdKES3tU5l3983KofKLEu0w/jVHA2Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Mg0QLD7mUWAqwNl6pyFZTyXAIvV6ffLC9SsZE8Fk2w=;
 b=TUJekiDq9Oz1C2u9ljoPq+E3sXnu9jTUhneI5DUiz0pjze/vXf+tLfzahEhHKg09+mgBe+tyoBcrKp/glrx5lorSZaTX+6qS6Rvbg64FbKSXEhSo7XvustVkbesMk0agnJnaxl6MGx8I4GU7+aeWz5jJxIp0BY/mJuW3AgBfbukB/X5GOeRgL5f7wx77drJ2InXRGu+UQ5GglNf+BTDDR1mBuuajuPONUYkPhXDhh3mTkNwLyIdgHHD5wIyeJLmZuBGYIvJtCM1pNkVkrEHYKy0qLT6Umej/gDRgjmeflqEkd+AlhI6bzNd8ttsbHApmY2K+Kzhm+VlmNLzMoqI4Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Mg0QLD7mUWAqwNl6pyFZTyXAIvV6ffLC9SsZE8Fk2w=;
 b=cmcDvVuR6QI3jZwDclf92a6mHif1FznKXV7jPKeSYLSt2TrVwWTOxPDcZdEB2fnsxgnYun3no2XGDy5MyilUa2663czEcI4THxZcMOAIawIqiL3CYp5r8rE/t86oMm6Ecy2PqZ1+6KM+noLWF7lzHOqoMvkIamMDEl7gzbHk9+QSR+a0FpBVClJz+9cpN02HPHRpWupr3W9flFKudc9xCTSY/nSgBQT5NbrK10oOrGO+bpmKAZMPUI8vBPQygCk0oF1yuSyT6n/vX31RdETr73LGeFffnnXJI9RTsbuy7cas0UpzPwayrt6PRgfYTS4jrmbHxPIKisTF5dh/FsiE7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB10026.eurprd04.prod.outlook.com (2603:10a6:800:1df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 09:16:30 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9388.003; Fri, 12 Dec 2025
 09:16:30 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 12 Dec 2025 17:16:07 +0800
Subject: [PATCH 1/4] arm64: dts: imx91: Add tempsensor node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-imx91-dts-v1-1-2bb3c13762dd@nxp.com>
References: <20251212-imx91-dts-v1-0-2bb3c13762dd@nxp.com>
In-Reply-To: <20251212-imx91-dts-v1-0-2bb3c13762dd@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR02CA0113.apcprd02.prod.outlook.com
 (2603:1096:4:92::29) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB10026:EE_
X-MS-Office365-Filtering-Correlation-Id: e051ddbe-004f-4178-8dc9-08de395f22b9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXkvMzVtUStMS2ZaMVVPeWJ5KzFtUU1OUG0wTHpQZFduSEswN1JlZ1AvTTdm?=
 =?utf-8?B?RmgzMnJPSWpCMVdTTmdpeThPd0FZM2Y3c3RkalFqR0tDdHdlQ0FtbURQVHBH?=
 =?utf-8?B?UFN2MzVjVWltL3BqMzJTd2QvNlRKTG9wS2taUWNPNkwvY211c0xKN3lwZzE1?=
 =?utf-8?B?MFM2cS8vaEpMOWRENVpBKzhlU0JRelI1bjFlQmZ3RnpDVC84YWVhYVJMcXpi?=
 =?utf-8?B?NXVQTVBsc0tSYmZBd2J0NGNEOTY0aDZ3RGZETEQ0YXRNWDlveEY5aTRyVWpv?=
 =?utf-8?B?NE9FemRicEZMbVA3d0dtS2ozMmFLekZVWmc1WWpDL1JwSWpDaHBVT2d3T0RH?=
 =?utf-8?B?dmlMYUdObjZHbEgyZll1SjFveGR1NEc1N0hkcXpZM1Z1WXQ4b3FaczR0ZkRi?=
 =?utf-8?B?a0lmQWJnUC9DQk5DRSsyWFQzdUExaHNGaS9OL2JLQmVJSkNlUVcrSlRBSDln?=
 =?utf-8?B?TVhBT211eUJvOUVHMXpiMkIxM3RGWU9oTC9SdEJCQWZKRGJYZ3YvZ2hXT2J4?=
 =?utf-8?B?bkNUbWJ5WEx6ZFplWDMyVTlwRDVGLzVyUWQ1TjdDMlFoTlMrUHZjWmNkeVVr?=
 =?utf-8?B?V0ZHaHl4djU3UjhmWjBFNGltV3NGZWJObmlyaXZrb1JRbThLWE5jSDJkaEpB?=
 =?utf-8?B?eE82cGNLYjdZVnpsUlJjL3hobmdGSlYxTHJNVE95VnE0M2NSUENXbWdnUkhH?=
 =?utf-8?B?anBEc1pJVzNjcGNNNk16anluSzdwU2VJdEF4U0JITThHV0lkVmZWekNYOS9P?=
 =?utf-8?B?bHcrdXZ1VkpxMnA0WXJQSGlueDBmYS8wd3B1WDhvOXY1OEd5TWVONXFjKzlY?=
 =?utf-8?B?Ylg5UTB0alNLdlAyNWxUL3JodzBHVjJld3FaVTNWYm9KNTF3aWZidGJ0Y1Fy?=
 =?utf-8?B?K1U1aVFZb0tuZkE3VkgrcVdMYUVGdk1vL3NnbHhVNVdqanRKNnZJaWpaTVNu?=
 =?utf-8?B?MVlGVVVxalRGUklZVHF6WUNDQXBwbjBOWTBQcExzdUdGbzlsMVE1KytaSjVs?=
 =?utf-8?B?ditLTzdrT0YxMnptb0FlUlpWMWlBRjh6aUxTejdMMFhkRUpNWEV4VTFzcGQv?=
 =?utf-8?B?eXd6aUZsc0lIZXlkemFGdzFNZjcyWEJ2REpMcDk4dUJjdlZjZ1ZsZVZid29v?=
 =?utf-8?B?RnFEaVVJUktzamlwaTV3S2FlK2x0ZkV3dW9neDBSZTRmNU5OM0F5VWZNSUZj?=
 =?utf-8?B?Y1BqaVFKOCtJWWJ4RzVyT0hXaUJHYmdiZjN2Mk5ybzRlRjMwaXRaVkdabE1a?=
 =?utf-8?B?aTN3dUU1OVhsNzU2OUxwQW90NUIwcGF5Nm9rdk54RmxkTWluc2RraVhYM0U4?=
 =?utf-8?B?RThiRlhJejJzNDdIa3RKVHZzM2EvYWxjQmUrZkxtL3dJemYzSFdpTE8zUmJx?=
 =?utf-8?B?WTJaWHNmTFRyZ0RadWUvK1doMW5EZEdpTytKMnRiQzh4Q3A4L2NJeXlZdWJn?=
 =?utf-8?B?MjU0V1FWNnY5NS91ZVN4TkR1c3J2alBxcXRBaDVtU2o3MzJ5M3hYd2VodEEr?=
 =?utf-8?B?Qy9ROE4zamhaNCtySk9USGlaRXR4ZVJ6R2FQUlkyaEczK0Nqdm1WMU9kcG9o?=
 =?utf-8?B?VFFQeXg4L2JOMjZCSS9CVkxuYkwrZEZHSXhqVUdZeC9nNTZ3OUE5a25oVlpX?=
 =?utf-8?B?WHZYNUJyM0F0TEZ0czJVTE9odDJTekMvdWZZcUUxdzZPRk95K0EzZ3BpcDdx?=
 =?utf-8?B?ajFWcnpNTmIvRTkvblA4Vm9xb2FYcE9Pdm9XcFdYZG9NcU45NDVyRm8rMi9N?=
 =?utf-8?B?ZjgwSGpwOG1nUXhUbzI4OHBuWnR3djBFY3BlUG5ZZFlBSURkTll3VmxzandV?=
 =?utf-8?B?UTlHMEc0Z09sc2ZETS9scDJWSEg3UzgycE9PdllJT3VGREU4Z0dJR0MrZ3Nw?=
 =?utf-8?B?d0RpZEFHUDRSc0p3YzBGZFRLS0MrUmpET1hyWGNOdUJQd1A5bXR6d3h0bUFp?=
 =?utf-8?B?eE11NXF6K1FiR2J5UG1tcEpyQzZJbXJkRmxEeHJEdlFQOGlyVkhIUG1XSmls?=
 =?utf-8?B?MmU1STEwb2F2bmlJbkxPRUM2WDhXOEZMREk0WEUvRHp0Q0RVcEZWUmFkR21j?=
 =?utf-8?Q?SGG2OX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a25RTU02Y0F2aGdTMmM3dkZtQ3RLbXhabWpqMEprOGl1RWwzWkVZRUVMaGRj?=
 =?utf-8?B?dUM2VWxwanM5VitidEJFVmtNK0FLVGlIWkdXclo5eWM5QWJoV1ZCNThPMTZk?=
 =?utf-8?B?dzMwejVTdnMvNlRPM3RpYXFJU3pBaE9nMFYzYzhDYjNXMEVFKzBzZjlGTXZB?=
 =?utf-8?B?N1NJdGl5YklpL1pRZHRxTEh5UlB5eUFkUGFHeUtlNDR2Skk0anlRNzh2ZXBm?=
 =?utf-8?B?KzZhRXg3MkMxcUhHcmpLam5PM1NTK2ZuOW1CdHc2QWNibVpwdFF4RC95M2xo?=
 =?utf-8?B?TXh3MGRsM3FVSXQ4VzNWUkw1VWU1RjBLc3Vnd1dIM0QyVUZ4bVZnYmJJekdE?=
 =?utf-8?B?cFQwOVNLbWV2RDZTMUZQSC9CbVNVbkVEaW1vMVJ6cWMzMHhGWnlSMDBvTTlT?=
 =?utf-8?B?SDd2N0JKQXM1a293eFlvUGNmbk9RQUZmZzlweHlaS0dYZjZVMkllOFVKYUNI?=
 =?utf-8?B?NnB3cWdOU0U0eTBNNVJnNlVlTWxoRnhINGFmcW1Lci9xRVhGQzdLY2I2Q3lS?=
 =?utf-8?B?dFljTER2UkN4SklUTVEyRWpvMVM4aVBkQUQzR1pSWDNSZTJGN3BSU0phdzVP?=
 =?utf-8?B?RDNxbFJjZVhleUJBS25Db3Q3NmdTbGxSL3JlNTloQ3VVbzd5VmNPTnFuYlVY?=
 =?utf-8?B?TUdBYk5HSmFURnNCS0NuWWhRTWpOYmU4Z2hZTUFqdWQxSzF1VnlUQTkwNTNh?=
 =?utf-8?B?WjVpRWNxd3lZaGtoOUJIUXJYS3JPelZZbGpDV1FYUnNFc0crUWlHek5RN1dl?=
 =?utf-8?B?NWZrNDdsUytyM2NZNGRCSkJESmFpT0MzZUFyT0x4MC8rMFdxZGlyb3ZhaHR2?=
 =?utf-8?B?RHdPcWdIVzdtM0FWY3g2OUR4OVZHa29vOTdtYXZuRmIrR1hFMTcySWpZcUs4?=
 =?utf-8?B?ZUJhWExiZkdTbCtzL0xadTdqWXJaVTBUNWdLTWh4VVptNjFyeUxBL2RoNnlT?=
 =?utf-8?B?dTV5NEp4TmkvR1JHNVhnYkU4bFFCR2R0UGRLaktKQ29ZR0Q1cDY0RmtnUkRo?=
 =?utf-8?B?ZHpqdkRjcWM3SnlhTkY0VStmOUd3SXVQdG5vY1ZwRitOUWpuKzZES0kxeHBQ?=
 =?utf-8?B?VGJhdUs2aVNya3g2cTl5akxrbHFzZmNTZ21hR050NHhEZHZTLzVGU2lMOVB2?=
 =?utf-8?B?b2xFUzYySXNtQnA3aUVla2pkRXpYN21qU1FyYmVSOEhKVTBOby9Tb1ovZ3Za?=
 =?utf-8?B?VEpxRXhPWjJzS2RpK0JWVm9xM1g1bVNZUzBXSy85Q1pmcXVQMi9LKzk0dmIx?=
 =?utf-8?B?M2hyQ2UwUlRUV1lSdmIwb0RLRUNuaHBOcjNwRXYxeDBUSHpsWG8vMTh1VXlr?=
 =?utf-8?B?T05iVEZ3TitUbFNaZmV4ZW9VVjF2NklMQXJveTBLd1JtaFhTQjkwMHdTVU9w?=
 =?utf-8?B?WHo1T0tFYlkyajRCa2dsUlRrQjZyVlFHdkQ2YVczR1NId1dvLzNHZ3F2azBv?=
 =?utf-8?B?eFZmZXlqWGhCazh6VHQveGN6NzVSQzBNaFFUR3RqSmEwMkYzQk80am9BLzUy?=
 =?utf-8?B?Q0ExQXRFWGpuT0RXVnhsZk94SytFNUZFNm8zODNBUlRrdE5hQTRFcDZrUXpq?=
 =?utf-8?B?dFhSQVA0akNwM2llbzVtb0lEanVHclcyc21pZE5tNDJUdzhOQjNXL2krcUVr?=
 =?utf-8?B?YzFiS21PRUM5dkVhYTJ6YzI2ZFJMOTFFbWpTbzMrWFlGK3F2OEhIV05pc0JL?=
 =?utf-8?B?bDA2bzVJYzExNHhjU01kdFQwM0R1MS90TGVwQXlTRm5HY1Fka2FvR2Y0YXJU?=
 =?utf-8?B?aThaZHVVRlFEdFE1ZUpFMHRubE9hNkNVRHRiTC9rRTNJUmUrMHVhZWNNOG8x?=
 =?utf-8?B?aHdzYjFKN3lNUEJ3QTZWbW55ckVWWTFEU0ZYTzRocnNHWlhuNzZ6SEhSUURT?=
 =?utf-8?B?QzFvUGV4dlUrZVNFUE40RGs2N0VRalhtNTIxa2NlUjdOMjJ0Zy9kNERMem9C?=
 =?utf-8?B?TTZlMTE0WDYxZUlHb0U2eU5LZjdBNldUN01rU3VyT1hMYWpyc1N4enVLL2Rh?=
 =?utf-8?B?YTZVOWhnNk5yY2IxNGY0OTdsSzlvNGJLWjFtOEphd3J3b2dnYVU3OTdNZHZo?=
 =?utf-8?B?VFY4aUJKNlhKbVhaZ1VyWkNmbkgvMFhaUlhEN0ZRWGc2NThrcDl5NnlnV0wr?=
 =?utf-8?Q?8AeAumiLNjmpzejzJ9gUWQioA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e051ddbe-004f-4178-8dc9-08de395f22b9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:16:30.1888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JY2lkEXsw1tIqQxZSD30HdXHe5cTnekPzl+9acmPI+3bfr4lYK33+/wPyAzuK23GJBHmQKkXKe+RZgGXdHCgug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10026

From: Peng Fan <peng.fan@nxp.com>

Add tempsensor node and trim sub-nodes in ocotp.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx91.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91.dtsi b/arch/arm64/boot/dts/freescale/imx91.dtsi
index 4d8300b2a7bca33bd0613db9e79d2fba6b40c052..c08db08ca9607b9780a77e215cdb5997e4daae4e 100644
--- a/arch/arm64/boot/dts/freescale/imx91.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91.dtsi
@@ -6,6 +6,21 @@
 #include "imx91-pinfunc.h"
 #include "imx91_93_common.dtsi"
 
+&aips1 {
+	tempsense0: thermal-sensor@44482000 {
+		compatible = "fsl,imx91-tmu";
+		reg = <0x44482000 0x1000>;
+		clocks = <&clk IMX93_CLK_TMC_GATE>;
+		interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "thr1", "thr2", "ready";
+		#thermal-sensor-cells = <0>;
+		nvmem-cells = <&tmu_trim1>, <&tmu_trim2>;
+		nvmem-cell-names = "trim1", "trim2";
+	};
+};
+
 &clk {
 	compatible = "fsl,imx91-ccm";
 };
@@ -69,3 +84,13 @@ &media_blk_ctrl {
 	clock-names = "apb", "axi", "nic", "disp", "cam",
 		      "lcdif", "isi", "csi";
 };
+
+&ocotp {
+	tmu_trim1: tmu-trim@a0 {
+		reg = <0xa0 0x4>;
+	};
+
+	tmu_trim2: tmu-trim@a4 {
+		reg = <0xa4 0x4>;
+	};
+};

-- 
2.37.1

