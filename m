Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013032.outbound.protection.outlook.com [40.107.162.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD4C3BB9EB
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 19:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783538786; cv=fail; b=GnDq27jfvlHI2AKtV1zFNP9C5WSM8fP+Jwska92kJGwQB9vV0DWVIy11WI4jPoFSFfjralnfun26egPpiaEluL6uR/dcirvd8fFz7VlRjJZRZJtGZwLfvGqakV+faBlNlYyu4ZobmJKQVVdi4LsV7JDXWYnZyD+t5zLb6AJyin8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783538786; c=relaxed/simple;
	bh=AAUAoSs13NQmCLPeZV2vcfjvTVMBRlqHquyGZ82okI0=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=P6IvNRUFLtAcecLtPwqHqr3uiAiqP3lxEmGgIXsf1xmWMVhgKwqcd/5o2Wo2cshb3gnlxBQ0paKAxJ/GqGbZhta8SoAjxVE8V0JqYnrHeNu9YXKt2WXuC2bQS4zUOwqT6tX5IoJjl8Mxa0oUzctZ68BpibiyxzS9/dE9OlaFlEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gZ43YMJ4; arc=fail smtp.client-ip=40.107.162.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gZ43YMJ4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kH9ryOhJKENpRZFrJtnonf3LfKJE6JJrEj8xh+5f+RlIbbPZijbjHD/H89nkY2dJhuY4Vx+sX9HLkAuXR624Ks0JsTpV5K1Vnw9OEeh9zV7P+I8O7rKAUH92CkMvZn8jF5vT48udZgDlZMsjCm/rt1+D1GCEnihhiMKCWHTVJL4duW82/tSKwOr9OxcdlbGAj81OKg7ijJD5lAiotADP1QOX/SCPhei5QKr3Y9QHtrWtNfJZuw9t9+gtxfmzDibMpa+AVZajKY4oN12XnSKVma1KY2CMnjar6Y9RBr3aaQdxWM9sr/ntRD7RzWTw/z4JpuRRM4wFKtQcMy+y4mAVzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u0s4kE6hgHeDDBI7oPmQ+3BHJJ+qwFq9vFzxaLBArkk=;
 b=whV+PgLidvkKmnJkje2/T07H8aeMauPLtVq8/zjjdXNbvKJ4yo2v3SFHu15JwrIBKT25zJmvxQP2SK2qzHhgziTDWOMnGepDDZoVn56s9QfsPA1yDMJffxgZi0a0f5xN8itBlliaADyNC95h+IUdSTaEBQsOR1UMCFTDqHcmLfoAYs4WvxavD76JG9OVjofLZIVTejIoyZYkJFUjAc2wPfUDUQwFne97X9Dp8z1qO84wKu448CAqzrBnmbFvSQM8elJxJPSsgJ7lO4mJ3N6mPG/O/KBdnKm01mT7O1GPwMYzNPj/ZkUgZmds0UAlwCycOsdER2VwHWMdQ24Tsyf2Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0s4kE6hgHeDDBI7oPmQ+3BHJJ+qwFq9vFzxaLBArkk=;
 b=gZ43YMJ4tmggasUGgSR7lOqc1FortjS5O7VB6Jb/+vv+Aut7Jxj48BZPOEMV2tdpa4gdXi8qc1cCheHY1yNn3ji42Hvcq4lIZGAPNjzibrs2fk/7G+VvZpYtiLLw62CY8WGMsRUjv61om5tMPSPMkrcyz80uD46KOAaAcyfZ5nws2o6FNWqLuyEcaf7EGfq7tlS9KHp4QH+JpNJkLTWWZe9vfXjkHSnxPaRdCCU+5at+E/648aB7NX2MY/ci5ocQKkdV1s83e6/2pvoSwzaBtVz2hvjEifLM7QEAV1lfEsMLg7voEWWw40pPSsocYCSY7H1TkwQ5F+0RsUFh/qlHJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB12342.eurprd04.prod.outlook.com (2603:10a6:150:31a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 19:26:20 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 19:26:19 +0000
From: Frank.Li@oss.nxp.com
Subject: [PATCH 0/5] ARM: dts: ls1021a: dts CHECK_DTBS warning cleanup
Date: Wed, 08 Jul 2026 15:26:08 -0400
Message-Id: <20260708-ls-dts-warning-v1-0-5daa24061c31@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFGkTmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwML3Zxi3ZSSYt3yxKK8zLx03bREM0MLSzMLE+NEIyWgpoKi1LTMCrC
 B0bEQfnFpUlZqcgnIFKXaWgBg2irJcgAAAA==
X-Change-ID: 20260708-ls-dts-warning-fa61896843a2
To: Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ioana.ciornei@nxp.com, vladimir.oltean@nxp.com, SZ Lin <sz.lin@moxa.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783538774; l=888;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=AAUAoSs13NQmCLPeZV2vcfjvTVMBRlqHquyGZ82okI0=;
 b=0VQQ9mcV7872/Ols3gTxHmEm+jUqFaT6dnfUI8nzdpm3rVqlssArGxd8Djw+tNiCnmLFHY6yG
 o0YMUI4+lAIDH8KBH/OWEsg8t7PKvZLRc6guijXFVeXeTROqfhaTC2A
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR22CA0022.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB12342:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ce08c6a-7304-43aa-9c17-08dedd26c995
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|7416014|366016|23010399003|1800799024|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Rbn69Jj3wO/Xq2TRsvI7LwhVyTAMkvngVIgTQO/X58JY5gyUeCYZZyVXIiFbsqECSp8zDjhyizm3xeZ1Wh1LLFIxD/FWREnl+tOCf1THYPdQbA3rKiS3t6f6FUVTle0q/kLKUhmMDIkPvJ5gMuWzWFpO3kAkHq8n0eVW0ocKd4FnOytO3cKObVqTg3CY45EaWDEXaKe1LuNNaMK703lhs5SdE3CBda4dEZTYM/L4+bUu2eZ0pp3ANeIkHTw2SG5oNiedYX05zIypkvpEvgVW4jLfP6SSoPxRypMnJkaxBHcW6Z1iSFObYsaqzv3TljYzNRw2FheCqZ7e1TYa8gbUB7St/ZiCdHC71OUKrwefOg31puN4N7mZoPY12awX95WDFMQC5oRk6+oIQJiXlN1iUSVDWDWXXgQ4WQkK78Zci7U9QmKVmUYL+ksHNXkGsOyHjJ0BKJWT4iesFSpVcF+ZGwMyqM7TA7fqEnezSoA+OhKA+wKL+AvngsqMENHR4s14Mtwfw5JT7pwbApx1nT8qULQSBpGKPwLNQP3KtVReMefOtiaM8yKy23zbkcccq7YJbOcUAzq8BsDAFplbXWTq7PQb6+tXLQXQqFBXwZoIlJZehZxOkkPPphdBU6pw3+78U8HvwglYpZf9cd9FQpyqJnrPdSmNXfh4oGvQOp0yaRc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(7416014)(366016)(23010399003)(1800799024)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3VxODkrRGdRNEw1NHdRaFFTZGVaTkNWdVhKWHdIZHZXSllxSjFQVmRyckdw?=
 =?utf-8?B?ZjFFaUVxMFVyY0lSME5FbGkxVVJDVUt6R2hTMC9FL3lQdGZlRG1ZSUw4RnBM?=
 =?utf-8?B?aHJ2MWhUUk5CTjhPdW9CclE4RWZSeWhaYWt1M0pmMXZWeWRpcm1Lb3NmRzZk?=
 =?utf-8?B?ZGQyN0Y3RDhNVUJVU2ZJZ3ZmYmtLa2RJRW8rT2NQYkFCK1Yrc2dsSTFmTi9y?=
 =?utf-8?B?dFlnUjNxdHBTaWNTMFluKzIzZUtBWjJiYzNEbW1yZUxlKzZHNEI1d1IyOFNH?=
 =?utf-8?B?N093WUpuUnRmenVFR0NhYkl4VDZ5cGlKMm5iUEZnZ2F6M0FUU2ZMeEE4OWgr?=
 =?utf-8?B?VmZHTDc1MXE4UEJiaG5na0ZoOTd0ZDJ5LzQzZ0lPVmNzMmxKRzE1ZU9jTWwz?=
 =?utf-8?B?Z0tPZU1yeFFaWWVTNEFrZ2puV1VINXhHVG9PYkZ5L0syQVdtbjZqaS85aXJp?=
 =?utf-8?B?ZzhtdnZZWGpjRDdWaC9ZNkNCeHFXQ3RuTUxnRG8zMTc5SnhmSlRoNGZYUWlJ?=
 =?utf-8?B?Y0RKUU5kUXo5WXBJL0M5VHhLaGVHd0lWc0FLZHBsL3RPcVZjYm1wUVJTR3Y1?=
 =?utf-8?B?TXViSkR3elpMWEltaXcvNlJaZEx4c0tXUzk2YURwTUxOcUw5bmlNN3hMQ0pU?=
 =?utf-8?B?ZG90Q20raW04emRpMlhuM2MrQklkT1l5RXo5RWNMUVNDLy8yQTNMVjFScUtD?=
 =?utf-8?B?Z1JTbVJxczc1bnhWK1ZURHZlK2FRQWszWURXY3htRTdQT2ZHdnY3aVRTSzIx?=
 =?utf-8?B?R282VURRcGJ1dW9JSkJuTkRTVC9QWDFaa3JycjJOTFRJby9LTzErdGVZZjFD?=
 =?utf-8?B?NUJ1NFk0cFE4QmtpWDV5dldWTzZEWXBYNVBDMjF4aktaMHBJeDlIMFRVdzMv?=
 =?utf-8?B?ZDhxUmgzQi9qVzZKSXVEamZybS85Q2doZytpNDVzRVYwSi9xek1HT3gzcFB0?=
 =?utf-8?B?V1Vkck1MM2sxODYwVHk0RkNtbWt3MGtkZUZsR0orbmVMVWVvL0YzbmNuY2Iz?=
 =?utf-8?B?bzExQUUyc3QyV1VycGpNelBaVXQwVVJILzE1aTFONzRDNXMrUklUNVNRTFlz?=
 =?utf-8?B?UExzeGZxTmFZMjhXalpFWis1VUFVVXkzQ2ZIbzNzRERQZFZYZWdKcXNhRkhE?=
 =?utf-8?B?RFB6SDNqUGdyTENiUEtoWWtwemRSejRYSDloV2JiT25zd1RBSi9aVmJuNENk?=
 =?utf-8?B?YlRPTkNJTXQ1QSswOTZwYk5jQmlUTGtrTzFKZXpCeUxjQVlDV0JuMzROblRz?=
 =?utf-8?B?Ym5hb1ZGeDlCa0Y3ejlBaTNnUW1YNmZzNmlyTmtYVy94dDQ0TC9IYTdJWFZu?=
 =?utf-8?B?clk2Vlp2SmE0aW1Ea1pla1ZiQXRGbE5ZbTRMYWZPM0lQaVZzeWNNb0h1TkY4?=
 =?utf-8?B?N0k4NXM3WUY3K3pzYlcyNkk4WFB2dmovb2lIMWpCMkJJZEJBa0wzQzV5d2xK?=
 =?utf-8?B?MEpSNFFDankwMDVlbTZsOW5JUGl3Z0oyU3BQSUtDcWxIT05RN0hCK1VHRHlv?=
 =?utf-8?B?VmtmZGFIRTI5UHFNcnVzLzdFSTZHNnVPNitaTExBWnQ3dGRpY29MNTM4dzRG?=
 =?utf-8?B?SDNvL0RRRW1FWGE2THE3Q000M3RRQ1JZam0yZytRTHVweUZIR0JBeHprZ203?=
 =?utf-8?B?aEgzK2o0d3lYOHNNSFJIbHhyQlFjSGJhMDdqd0ppTWJsRG1Fa2MvanZ1NHBa?=
 =?utf-8?B?Skc1Vmc2TXBNOFpla1JWQmJiczBLQlExVjE0WWJYUk1yOVM3YVhGc1U1L0Fr?=
 =?utf-8?B?L3B0K0xldStMdytWcEpiUkVGbzBGK0tDMXVwdGQ3d29BeHNNL1lYa0U4aFAw?=
 =?utf-8?B?YVljcDhkYkZOdURDR1lkK1VEQ1hKeFc3RjJBV0hFQ0pSUW04U051VzUyc0pX?=
 =?utf-8?B?bjlqd2VNVC9yN0kzZXJjaThEMlNyQXZqSjQzSC94cXNYVVJUWUgrL2VtSnMx?=
 =?utf-8?B?SSt1TlVmVzIwQVFkR1ZhVXAxaGhsdm9iVlRsRE50T1JhMm10SU91WGhGcVdP?=
 =?utf-8?B?Y3hVSlY1T0ZvY05sckY3ZjA1V3AvUXBxNExWVlhnVXRJSzRySUZaUWJUVmJy?=
 =?utf-8?B?OFYvL0pMRTB6RmhESUdQcStpOUtXVTlGdDBqajNJWStjdGNpcWdLdFpwK09v?=
 =?utf-8?B?SzJZL3Y0Vk8wa28xRUdIbW92RldGbmpzWk95S09rcTdMWnVaeG1QRFJCM01o?=
 =?utf-8?B?dkwvWHZ0bE1UN0tEWGVLdTg0R1RsSVZ1TmpKSnNCcXpOclZKUVhnbm92STg1?=
 =?utf-8?B?SzFieS9lYU1VZ0I2cy9qS2FURnlHbXZvdlNWeVlGQXh4K0hEMlpPTWl0T1Jl?=
 =?utf-8?B?MldWV21LeTJIUVhVMG5xY2VhYWVkd1NvcFFHdGRFeWl3SzFHN080YUVETERR?=
 =?utf-8?Q?ZwvJowaML9KSRNOQCDfNeHVPc6oQe5qW3WwMj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ce08c6a-7304-43aa-9c17-08dedd26c995
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 19:26:19.8288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WqzJUuONGRNvmaRoEtQXUa4KcHr+6jv2ECWp8xDG5w/nLPHEhFDsApQh4/+OWaIpBX/pnzP5XZdPfDtKW7Y1lVN7C8ZUI8jV45gWssc2dX2qGdlOcqgs3nNOtz8SXmUZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12342

Collect dts changes to clean up CHECK_DTBS warning.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (5):
      ARM: dts: ls1021a-moxa-uc-8410a: add led suffix to fix CHECK_DTBS warnings
      ARM: dts: ls1021a-twr: add power-supply for lcd panel
      ARM: dts: ls1021a-moxa-uc-8410a: use compatible string ethernet-phy-ieee802.3-c22
      ARM: dts: ls1021a-moxa-uc-8410a: replace spansion,s25fl164k with jedec,spi-nor
      ARM: dts: ls1021a-moxa-uc-8410a: remove undocument property default-state of gpio-keys

 arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dts | 29 +++++++++++-----------
 arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts           |  1 +
 2 files changed, 15 insertions(+), 15 deletions(-)
---
base-commit: 6c94b38b83a04c43ea49004275f0391404051093
change-id: 20260708-ls-dts-warning-fa61896843a2

Best regards,
--  
Frank Li <Frank.Li@nxp.com>

