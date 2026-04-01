Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013040.outbound.protection.outlook.com [40.107.162.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD62D339A8
	for <imx@lists.linux.dev>; Wed,  1 Apr 2026 02:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775009025; cv=fail; b=vE1Ajq6K9bZavGFs0nnvK6XuFfVMj9ZOfSAptjLk+gHiPOkyqNgFdkkaUPhyqHd5Ez6317WQGCJKRy6u8dNlTjHHyvTRE17hY1d8D6Q3ZFJESaxA8CyfD0RudNTInR9duZuf9KRZ2sRCCphBvRCuT7Hh2zPH+kKOsDfhg4EvUeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775009025; c=relaxed/simple;
	bh=GYZ/k47VPnxXcBB8949i/OpCs3JOz0zR5D2z0AYlxZA=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=e5hwtazSi4WygCfEtla2C5BXN2H9teHz85zaRDjnxBFXOdSjWNyC0oMaQAKpp8A1vG0zRQKYx9OUEIs7/M+4QxWpGvi3XByeP8FYvaiqR7bY/tdQokc3qYlUSnDn/EBOgbcMn4RyYfOLPvVP3VjfuMGTOkf1mBPBJiWP8hHTCCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CZIdLyWe; arc=fail smtp.client-ip=40.107.162.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CZIdLyWe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=otNucf1CbvxTDugbVOuw+V7FYibqRgyV41TW+xJRJ3TpAj4zv4RH7edN41Dt2I5wNiMtRPx2xQ+36nlzgrjN6FPyVvOUyiUqA2/VsfPIKIRMmUXK2bAC5MQXQ9JtvmqzkKsAgRy6nPkWUgjYMLKc+Ui+qn9azXIOkTv4JYQBLp6VsS1ppi/GKHJ6zh8vn/ltogItKkP3nIkM8ARv2bL2++d6GDvSrL0PwXhygZrJJ6eMRF9ncMG+ttSUfz8nJodm88qV84aA9S8xHHPiiEHmoMKRm3qY1rGiSjLptbwqpGo4rwz4I2VImAVeJDJs0er9IZOrQ5OJUb3bGeLuAoF3rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klWUuVMy6+BguySjcuMPSi02R9MG/QFXSpqloz1eTnU=;
 b=POM1ezyPtAx64WALMcBvIEDK2HZjZiKE1NIxN6VAGuQJAlKkWs/bKHfYiKnrjI8kpNCr8ndBd8/VRv/QfEQTkx1ocWzQh1yRLe9YKgc3yuv7Lu4TTvHTPejqmcuyBTOs2vLPRN+C2ughcbLNR3DcMt7wtrwm+o+2Mgi3of9nEDC07sQP4XdnlR+bW+v374FnvRkYwX/1xw4nzGvwkYA03BjwhZD+EO3cDgkyDSvGD4SKTL8Lqc1sxWvdKZK5YnrhP9+7Lt68gaV4GEgSrr3n3aXpisC8X2ECT/m4H8VL1H0BMflirSkOnF6NsQZ9wwyRdQg6knS3V0KKBiJ82BXcdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klWUuVMy6+BguySjcuMPSi02R9MG/QFXSpqloz1eTnU=;
 b=CZIdLyWeAUEHrppFa8rwEM23kdjOF/UoIuaz006FqC8PpW6xTMXcn8HsBkNjY2k6Wzfew/bALR5D+FlpiXGDD55oTgsLSMuS/tHKtRg4sj/jrjJh/HEa+qCgsZinEDWoJCbQgFG+MmBU1gUmzboz/2WPhJvQinhRqFq5+D8NsjvyTxHQk9GDHyc1mquunONY2lI12j5/gcvF9ABuoHEolinixKhpsbzapEd1RgWIkdbWnuSPTZod5lh9/SqOHj5eM7CfJMvLRvZLmOE1SfveoWWIQiiQbT4L77bFWrtt2buYubWjJ7Ij9NW7BtXEAeBJSvRPErwAEvllBmbdgIQWeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10762.eurprd04.prod.outlook.com (2603:10a6:800:26e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 02:03:39 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Wed, 1 Apr 2026
 02:03:08 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/2] arm64: dts: imx8m-kontron: Revert reading SD_VSEL
 signal
Date: Wed, 01 Apr 2026 10:05:07 +0800
Message-Id: <20260401-imx8m-ldo5-v1-0-1b1c1381babd@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFN9zGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyNL3czcCotc3ZyUfFNdS4NUYzNLAzMzI0NjJaCGgqLUtMwKsGHRsbW
 1ANTnAIhcAAAA
X-Change-ID: 20260329-imx8m-ldo5-90e369066213
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA5P287CA0167.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI2PR04MB10762:EE_
X-MS-Office365-Filtering-Correlation-Id: 35abac0a-70a0-402c-ed36-08de8f92d19e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|19092799006|366016|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	eNOL+3VKSZGElO5Tp9Pmb2wCPwD48vtroBgrZswj8Pg9edo2lU/mSnL34bdXX9pR78WX6SeHyxTrWe2JrY3x3lGQ0p0RDzlbCp2nfvYVo2hoLz9ikzz0bgYE7ZwJsqoYtfKgoM7rLtpFFGPevvz1y2UvLfW0KaDQf9MeOrM88hR3BYZjvMOSIM+og3EOTUMtacrlix5CGpgj5pwyPxUF2cODymfGdxcXrHhlwE2Cq2O4P1BNdNeo0cDPrEkBi0H2+5lAX3CzkFdPx8ofNMzP1iPtyCEu+hoJSDdeYh+KzRBbBMUyyZGW+e3hgm4nZeO50D864MsS6hO6hR1pph1DZxPtqTn6jGJGLrr4Fd/WxGuC+1w6c9LxWyrUGl4P9479aJEGdXKi6+XzLmxdGVNthIDViYY32P8jUlqVBanVUj6RwSKEREb9bhC8zMa1SGL43707mG3K2cksPQLmtFPwUz0pdc+QwiresMuoTNVFF0wffs9DPDIwi5Ee/qvz7AZrxdOJx/URoUL2y/hcy4hWOjUtbCPL62lFX32mtBh3A6ZHaCzEiWpy0Rnhaw2UyoYEbNBfrNBERdtc1P9W1eNzBgSCm0YZ8hLoykeRam3ZU2j3rYyWF1rZUQa3TdGspX8p/e6NZw7cOwp7PXoXjj2aYXeW8ozJUv34SconIjcg33L76LuhzWr+EV34SHWya+/d+MeUX7MJhB482ltFW3L6Ddzvlgs8ZOaFYeVyT388pIcel6hrrWa7DVbU3ypbI1m2AWi5zNkcZRWlH0dvPtD9kajEl4nltYuHWKTiKZ2t/As=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(19092799006)(366016)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vi9RSUZvdVZiVFJDQTNEcjgvdUhEaVZPZlQ1b2VkSTYzbkVwVjNHUzU3dDFW?=
 =?utf-8?B?NUwyQlU2aC9uVk9yUDBQMVFjSXJvb0Q0eWdsN0x0c0k3d2IyOTB3cE5vRXMr?=
 =?utf-8?B?R0JIVGF2QVRzN1ZHYklhYnVTVWw3ZUpBcjF3UUZFRjkvUkhBVWh4MFVZTEIx?=
 =?utf-8?B?SWVLYWVaMXFDZmlITVp6ZUFMY0hneW1NUlBxYTlNamdrbjBaSHlvWFFlaWVn?=
 =?utf-8?B?VWtoLy9ocTNYRXc3ZU5TY2NNMnM2czdKODJCU0pIQ3J5cDVLZTdlYkk5OEV4?=
 =?utf-8?B?K0RROVFBNHlFUi9FN1BkYWNjRGRCaFc3THpvWmlhbkVTQWRrMjV5S2poTHQw?=
 =?utf-8?B?ZWMxYzJEZDFqNXVmWnpHT2hTcEkrUnF3cVpndVdBc2lxanliOEhYMmxyQjRY?=
 =?utf-8?B?N1lqd1lKRTUzSEJtbjRwcGYrbkN2UjIzRDdJeTNkek56ME93RXN3UWZXd0NJ?=
 =?utf-8?B?bUdXNHd4dnFWM2VKWldyT3VibVlmMmFHNGllOTZWemw5SzJGVTE3TE5kQTlW?=
 =?utf-8?B?VnhPUFBsb2V0OTlYQ2FEUE03T0xpK01CTmZhc2NOcmFQbU9EWUFnTFdxZGlK?=
 =?utf-8?B?QXFwd2RqbUtHS3AwaXRCbnF6OUpHMitBcTdDMVh2SlAxWWE3dEVZdzBqTy90?=
 =?utf-8?B?L2l2MWtWTS9SVGY0VXBLcW1nZ0txaW1yTTZFQW82bG10bjhvdTBSaHVRRWdL?=
 =?utf-8?B?clQ2c1E4VDNrS04wUXQ3VWQ4TkRtWFRxTnZ1RkFPNTFaR1h5VmdTVzZwZnNa?=
 =?utf-8?B?QmZtMTZiOGtPWnl4UmRZREZiMXJQMzZPeWZYU3lQbEVPMXdoUXVMWlNwcXVJ?=
 =?utf-8?B?Vm15S0VuQURPM09NaWR6SDVnMEZnRTlYMWF6eHNJTkFzaHJ1YUxmeGc3U0R3?=
 =?utf-8?B?QmlLNTJXSWhQL1RZcmE4TXJsSmNTbks2bW9GQ3hmSGVQTlFYcVR5bGNYcTRR?=
 =?utf-8?B?KzVIZHZlUUdOeUZOeWF2dWtTWHlCWlFrbkM3SE51R1h3SzZucEduSHIyTEZR?=
 =?utf-8?B?T2pNTDJNTEdKS3VhRHo2TWMxZVhzWGJwcTdNYkx6dlFSZzhYRDhJdjczNVZ5?=
 =?utf-8?B?MFgvNW1DOXBOZzIrOFlsZXJiVHRKbU5vWjVLSlFtV0ZLdTNDNUFPUnBkYkta?=
 =?utf-8?B?bVVnbHhYUlNLdFZKNnk3VGtac1gzRFpQYjFadHYyK1FBWE1tQXVMNk1Fb3dl?=
 =?utf-8?B?L21FNnUzbVJDbTZvSEJ4YXNpUExIN3g0aVQyYUV6TWRLYUhUTFlSL2pVZ2or?=
 =?utf-8?B?VHNIc3F1Sng2Z1JKa3NqZUpneFp2MU81K0pncDRPWERqNUM2NHN1ajRXbG43?=
 =?utf-8?B?VHNGNXRmOGhDUDZEUzlySTYyNHlXcThWZHkvRnU4QlBmaEplQXBFb3UwVURx?=
 =?utf-8?B?L0tiZXlwMmNjdDRyMDRjcEh0TE9pVTBMQUw1eHBoK2F5OG9ZenFrQ3pDZVBB?=
 =?utf-8?B?UjBDUy9ocnJ6WWhrUlQyOEVmK0pEckRhK2FTSjJzMi9IWDNhczdzTmpUY0Iv?=
 =?utf-8?B?bWUwV0Fuc29UZzdNVkgrNnA1WHFweWJUVGFKc1lOSWtaSmhPZ0pUZk1pRkhL?=
 =?utf-8?B?WS9NZFRObWpPc2lWd2lCNnJMR1F2emV5VWF1RjVuTFk4SWdCay9uc08xTHNa?=
 =?utf-8?B?aGpEY0s5SzAwNDVlVkgrOGp5NGNVM2liK3hES244U1QxckJWWktZTFIzd3VS?=
 =?utf-8?B?R2xpaXFyVSs5NzRUU0tOd2RkZ1pBeFZjYXU0Q0R2RERNcGwzYTAyM2lHQ29p?=
 =?utf-8?B?ZjRpdzAwRUtoQ2c4OS9oTVdSYytaTWFpMWp4ak1NMlE1WndzVjlYS3FFWndr?=
 =?utf-8?B?a2UrSEFDVG1MbTJQczZaTXljZ0RYTVg0YkxDT0VvRXA1OHlLZ0ovUXdVNVJ6?=
 =?utf-8?B?eVBzd1krWitQaC9ZRTJWb3F2M0dad2ZwTERwU0ZhdkVzUGdJVFZYK09DL09y?=
 =?utf-8?B?c3h3UU1kWmppcVYyYjBmN3JuQWYzTkZ6Y2t5bmJFSVpkaDFHOTM1SFJGS2M3?=
 =?utf-8?B?ZVNoZklJRHA5cUFXUGRtUkI2ZkxtQWY2Ly9YQThMSXJXMytWeGJNdUUvUzgy?=
 =?utf-8?B?K1N6Yjh3NjFMT20vc2NEK2hwVisxZzRkQUtraHEzTUVIQmZybXpIck5RTzZp?=
 =?utf-8?B?MzI1SXlpWXJRcnBVcU1MSi9NYythQ3IzM3FzNWQ2ZnhhdHI5djNJaitaVGRi?=
 =?utf-8?B?MW1BQzRDU1ZUOXNCQ2ljb0paTCsweEhMNWQvOEpkbWZHZXZzbjBRRFNmazVa?=
 =?utf-8?B?eW8zOXMrOUh0eS9SYW1Ia3BBSSswc1pySjFjWXhqU3NqQlRNMzByUmZEL3hF?=
 =?utf-8?B?bFU1ZUVoNkphdU9WZkNwQ280L0R3YXlNRVFEWml3eFFMTW1PTXVTdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35abac0a-70a0-402c-ed36-08de8f92d19e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 02:03:08.0198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKxiT6g0duJXbptT3KJ0tejSM7D0plV0Q1b55RJJxa4etdVlfjdM2Hkx8DM6JC4ycgATgumg6N2duPnI6wtftQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10762

When MUX is configured as SDHC VSELECT, enabling SION is not able
to read back the SD_VSEL value. SION is used for force input path,
not to redirect the PAD value to GPIO(the other mux).

This has been confirmed by reading i.MX8MP RTL. we have not check
i.MX8MM RTL, but it should be same.

Not sure whether need to add Fixes commit for the patches, just revert
patches.

For the U-Boot support, either drop vqmmc-supply or switch to use gpio
control to replace vselect control.

And below patch should also be revisited.
commit 3ce6f4f943ddd9edc03e450a2a0d89cb025b165b
Author: Frieder Schrempf <frieder.schrempf@kontron.de>
Date:   Wed Dec 18 16:27:27 2024 +0100

    regulator: pca9450: Fix control register for LDO5

To supporting read back signal, need the MUX set as GPIO and support
in/out, not set mux as VSELECT.

TBH: I have not test setting MUX as GPIO, anyway we need to fix DT.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (2):
      Revert "arm64: dts: imx8mm-kontron: Add support for reading SD_VSEL signal"
      Revert "arm64: dts: imx8mp-kontron: Add support for reading SD_VSEL signal"

 arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts     | 10 +++-------
 arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi |  7 +++----
 arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi |  7 +++----
 3 files changed, 9 insertions(+), 15 deletions(-)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260329-imx8m-ldo5-90e369066213

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

