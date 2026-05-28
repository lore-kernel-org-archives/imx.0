Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010004.outbound.protection.outlook.com [52.101.69.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D435C3822B5
	for <imx@lists.linux.dev>; Thu, 28 May 2026 08:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779957140; cv=fail; b=qxNjwlzyTbMUO0EoMMzVANLZKHhXLa064UXaRRdROFXQd7m9uD88m+Yu85J1l5uZS6AoKeIpZ4DXjTSybxMvhEef87apbdsuAeHZcn7TlVszF1CE7SUCN+nZNTJs7oTnNTyyxO/UCrfahDucpb6p+T27FCgbms+mgcaVXA3v/WE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779957140; c=relaxed/simple;
	bh=o4t6V/SYjcfMg9uVfCVPjA7RKKpPyrUMrHA/OPB6NXE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=uLHmOl6yom+ZfL80Jg01k44f1OcvN4+i6cB4fO7hSUD4SRZteiMWfjOznSXUfFiojf2rgfYpXhioI3WelWeMjytJK+ZQA9DycpF2OrZD77ECSxgkjGnOIDsparIc6PKy7FgypX1+O6vZPL4+ne7rm0v4m6E6L55bNMEelsq2/Xo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=c4PhdcwC; arc=fail smtp.client-ip=52.101.69.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="c4PhdcwC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vNjPo8X/m5TWH++L7OMfO/iZC0JIX4pzjFYta+P+DR/S2ZYtptYQn6lrKovZ8smziPyxLeTVgfZyppy778E//zNYQ0Pu1YRsYq4+4X5YdIYP43ufXH0+NdEbh+SoMDh2r1uGhytxt5tM3Xq6R+GCvEZxn3JP3Rn0SazqRE0OqJk9X8W7V+7vPNvQwvcYrE299AU/BWAy388rj6OCA/aoFGCrrFIueXUrrOXpc9e5Jdbho51m6sBE+3Zh7a5PC27aRL9a54oskzQpacIfr/mEDzWOIOxZ17WvZCGX6OAn2WyqI7wXNuk4zdmtbjO3mRlij3XyZWGOLDqQ4LGo78N9Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y3wSKH/S+IVyo4XrCALEKhT5ay/5Vb3lWMfqsQ6Kvd0=;
 b=mQjRK2OabufGX8i4K87a9mZqa+QPmana0L34IDyc0I3cqSDYvzEccGBRjiMB/8ubRt7r9Kl1PCta4JJENlatNtnFbn0SEY+3bgB/UNQ1WB8wXcTA5ZzGymkodpB6f0BHv1mBFftc9gjHXObGgTefiE0hAFiXjVtC1NK3ZZEkoHg48sE6V2Ufm5jdBcYG4QPNNDvoxG2MMMXjF7/tak8l1LrKZP0J6trtkVgyFhHccENi+UAkV3sOn/BzbsBhv18DAvdQXqJlxYRCXWI4oPXTgMcO25Z5c96av1fRoM/5V9ER7r/RRcz1Eb44NsRH+l3Q42mfVxduPfDm3hHQRAKL3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3wSKH/S+IVyo4XrCALEKhT5ay/5Vb3lWMfqsQ6Kvd0=;
 b=c4PhdcwCIf9pLJJgi5+TC3IGruaxtkgoYSjd22X5Rh9/uj+Cn/ANsDcr4CuiWEB5C5mkhAhWzO0kHNG6VcSXIEINF9Rq5tBeiQw0nR/1oeY8Y0NxoX9IFpBQpIwixTcyT9BhrdZyx7LAaBnaTIG1MV+/pmB9IrC01Yu4aPIzQJR48wko5lRwJcIqVl/LWKvfHnOCJ+Vy4Ftd2W32OU6WqzJzsif0O3guLFNLxU/PE693iUO4GSiDMkslgpgTgsuHKopBG07bikPDiowSlCDebUYzePV5FIyuNaz6VLeZBrs3NMLKoQg52AnzR6WizhWCQs8g5n6al0cb1zkKIXP74A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Thu, 28 May
 2026 08:32:14 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 08:32:14 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
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
	Enric Balletbo <eballetb@redhat.com>
Subject: [PATCH v2 0/1] add PWM DTS support for S32G2/S32G3 SoCs
Date: Thu, 28 May 2026 10:32:12 +0200
Message-Id: <20260528083213.1399401-1-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P189CA0037.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::8) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|DU2PR04MB8616:EE_
X-MS-Office365-Filtering-Correlation-Id: cd9022d3-e03c-4ec1-6e38-08debc939eb4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|19092799006|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
 rNSrq8du1gzL4Qy9H3xKdTbeV+//Js5czCjux8ieJUM4FWiKkFF4CfllCXrBaxgsHt+ib8gKehYacumFoqGthJKXkPVr4HUgKlrtkOApZkM+30dm7PXHKsgnbJaFSHeWVTG3/+y7vmHjiaWgtVZG+pVrtuWvRLMNNz0vNuIuycpaOL52L9r2EjYjJDGYxxI3nTgcQnnRgy7LFsVde734leAQUCh4noxGxm2BD7/DULsSy87DthPOXC65OElakAePZdg1bswTiOmHk/5kBlmBiD1jBFv/XJK+vpFe+vwM2d53kQWmcwMhc+oSVgYEvAUW0orAnvoUZ3hFn8AKtGm3XkSyDkkKV2PkZxRVGR2EPC7s1hioCg4SRIUwmbAjQL61rsaEuoafr4Q2H1aWNcCPmzI9YCeoX0c0O9TOELtvOFHD1H+CEbDqI7/OVJp0q6CZboJEYgfwWR9VUW4Pn/Ou2o+onqMCcWCkcllqv5Ag8vOk4cyxeh9G72eoJugxXUKeEz4L3hzK51IpMu3vibrg6n9TO+2VxLcl4r6dFt26J0bhm6yqcuaI3utrdTabcA923o4YEMDB2QQOysWdIdPszRx02qqIO/b8Ct/oEaiPynv+dZ1An9gKSqPON1GYlH28YUGOoj1bJ9CgUWG/lF9mrQvFmcPKohzbCJuAPEn3Dv2WVe4Qd8fu3ExtGCsUeqUO
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WERXWEVmc2UzemkrQ20zVEVacjQxc3BiVXhWVXFTbVNDOGtkQ25KTTNsTWlL?=
 =?utf-8?B?THg5bHpqRjY3YjVJZ3hCV0JWUFBsMHFldFdsL0dvQUR6RlVMcktpZVpyaWF0?=
 =?utf-8?B?VERRY3ZHVTNhM2RqMWxraEY3aFBvR1pOaW1NZTRvUzFIdE5XT2I0QXBLamNX?=
 =?utf-8?B?T0NJd2hhMWJPMmZLcTZXd1c2dHp2T014dDA3anoyMlV0dnJQNzFKelVPVE1Z?=
 =?utf-8?B?akRjV3pxdE0yS1RUckM4NVRXTWdhdEx5RGZ1TTdabkpOMk5td1Y0MFJadHAw?=
 =?utf-8?B?MTgzTE5JTVBOWkJPZzJ1Z0l6WVBnZmZzOExKY2cvNmN2N3Fsd1A5aFZsZlVB?=
 =?utf-8?B?cDlqY0p5Z0M5aU9Ic0FuRDFIMysramtKOE9aMkJqeVltR2pDeTBDd1VrYUlD?=
 =?utf-8?B?ME5GZEJRKzcxVVZ3dm5lb2I3anpvZlg5SkpqUm1yUVA4R3lrZllrRWN0U2wv?=
 =?utf-8?B?Um9WWEpLbUFSNUZ3VlJRdmJDUnJBcENKQlBCYm93cXNEaHVSZ0g5aTZVMXZx?=
 =?utf-8?B?S282bG1QVCtSZzQvdkRoT0xueG9yU3hJQUU0UWcyYzNyQmxXU0h5RUZvL0J1?=
 =?utf-8?B?ZmNpUTNMeFhDdk9DQVFUUkNyaElEd3huYjhlWVEvOUIzRUZPbWt5TGdFaDRo?=
 =?utf-8?B?ZlBOTWxpdjhraEsweC8wYjdEdWdhQ3hZckhnaWp6a2RGK2dablNBVFl1SHNV?=
 =?utf-8?B?YXhMdXA4b090M3YyYjJ4d3A3QnFid2VjV1dtTzBUdWdZbTJuOUVFMUFBRENS?=
 =?utf-8?B?blhSUThnaXNaR0M5MERZLytWcGRyeUwrQ1dMY2pQR3dGOVU0UWE0Qkg5MTBm?=
 =?utf-8?B?dFQ0SnhxY0RScGV5NGVCczBydzFnWTNKK2diWE9WbWZGTnFuRE1FK3VqVm44?=
 =?utf-8?B?ZnU0WG9hNmE2eXhkMzVvL1E0MzJ1cWFxS0pzWFJBT0VOR1AzcHNjeE81Ymxi?=
 =?utf-8?B?OHBkclB1ZEh4WG44UnVUZjlYeEcwMVJPRWVCaEgrMVlsRDFYMTN0RTJYc1hx?=
 =?utf-8?B?c001c1RheGg5eDYxeWxTNTYzN3U5UTJtTmEwOC9WZllDRkRUQmhxTWplNzJk?=
 =?utf-8?B?WDMycDlQVWREMjJJU2dOalRaMnQvU04rMCs1MkJ5T0RjRGdIdmt4QTRCUUNr?=
 =?utf-8?B?WEorT3hpNjVJV1RvOWhwaENMVmhWWE5VQWFZcFplVllWRllObkpJNVE0TlBi?=
 =?utf-8?B?OU16UWJjdmg0QmNUNXM1QjFXRWFPVEVWL3hmWWVpSlc2R0pFYVltcnZjK3RK?=
 =?utf-8?B?ZnhMRXhld2xmWWxYZlJkY21rOEhtbjZLVTV2cktRUXVVbGxEZFM2aFBiei9Q?=
 =?utf-8?B?SzFpelo0dUlxb1pTbWdUN2lBVjc5STdPcGkyeGRpekhtM2J0dzN3cnJTSzY1?=
 =?utf-8?B?QXNoV1h1SVlSQkc2czFPdVVSUmN2T2haSzBacGozS2d6ZG13S1pQUTNQYUp5?=
 =?utf-8?B?ZGkvZXNoUEdVREwzelJ2QlBiaXg3NHJBWmVhb040NUV1OUlsK1ZNdk1ETWpG?=
 =?utf-8?B?dXcwckxyY0ZsVjlpcnhleUpmTnJRaVFsNjBYeTNiNXplQnVBUm5DbXN5NHV0?=
 =?utf-8?B?ZlV3eWh3VlcyNUUzd1FqMUg5QktyY013ZkJTbENnQXZONmxpbDk2Q1JMUGMx?=
 =?utf-8?B?MktpckhaNFA1TUFNKzRJd0pQdlJCd0w4cTl0dHR5cFJPM1RDMTQyZldSM0xV?=
 =?utf-8?B?UUtUSmJJUUZjTklIa21sRkg1cHNkeUMwNWRsWWllc3NZRG4vQ0k2M2JmS0NG?=
 =?utf-8?B?a043N3ZqdGlRTGVMSjJrTzZJdngzMG8reVhCSndvZElyYWtoblVySFNkQjZv?=
 =?utf-8?B?ZWU0RUJMN2lHMllQTEFrTEY3MzMvMXZRaGp0bnVSeHAweXNyb21oZlppakh3?=
 =?utf-8?B?U2NzMVRBaGJPbnhyb3Rlbk04SkZIRVBLR2EvYVV3MnozRHNwck4zb0FSRE9W?=
 =?utf-8?B?NGw1N1hkODEvdmtJbitmRnREUERicDg3N25qbXZjRHE5cTRCRFpiVVRRell4?=
 =?utf-8?B?R0d6RWUzUWtyYkdUME95SCtiOENvcmhxRmoxb1ZiTHVmZTBpbnZEUENaQzNa?=
 =?utf-8?B?NHNMQzdaYVBkQWkwamN0ZFhIMjkvZWFwUVhWaFEzMWMzV1hhbDh6YjlmR3dk?=
 =?utf-8?B?M09pU3RRTnd3VjI1UytOSTZILzN1ZFQ3WkVlZ0h5NG9WeGNneVNHQktXWGxu?=
 =?utf-8?B?V3VmTWtYTzdSS0c0YWtuWUxHQkpCeHpDMU5adWt5Vjl3TnhvYThsL0VCejI5?=
 =?utf-8?B?dE5jRnZKZnExMkV1bG1SWmFLeTJQanhuTWdaamtlMUZoeXRCa3c4YVV4WkUw?=
 =?utf-8?B?bGJmSE0rNk1pZVg1U2dlei9UK1ovSlpOcFR4UGRyM1RXMFE3bmV0eVI5Q1VO?=
 =?utf-8?Q?EVHutAh0BIjMubjT8UAt3wDrvRGor2AAL/wTr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd9022d3-e03c-4ec1-6e38-08debc939eb4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 08:32:14.4323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7H7+URGcQEZDXTnOiJnq5VppYZt8hMtOC86/affEL0EUqcU0X19MyGp1iHwTTvdjMa9t6DlwGld8hbBjbL4Dg8AhKk5npNFtzcxYyLZnExIMiJLjTA1AUDzE4DA8KXWW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8616

This patchset aims to add one change to the S32G2/S32G3 dtsi support:
- Add PWM dts support for S32G SoC based boards

v2 -> v1:
- fix indentation alignment
- use hyphens for pwm pinctrl nodes
- sort pwm nodes alphabetically

Khristine Andreea Barbulescu (1):
  arm64: dts: s32g: add PWM support for s32g2 and s32g3

 arch/arm64/boot/dts/freescale/s32g2.dtsi      | 28 ++++++-
 arch/arm64/boot/dts/freescale/s32g3.dtsi      | 30 ++++++-
 .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 78 ++++++++++++++++++-
 3 files changed, 133 insertions(+), 3 deletions(-)

-- 
2.34.1

