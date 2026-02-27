Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010031.outbound.protection.outlook.com [52.101.69.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E41F27F4E7
	for <imx@lists.linux.dev>; Fri, 27 Feb 2026 01:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772157443; cv=fail; b=s4gbendncuC3pzLfm/rOiZrR+m/ltdq2lZwGkTinrb9+EFeJgmlo3OFJJryTGCwa1CIWi4We6qWj1u4GysmTklqsuNoQkYzLGrJ13/UE3gbYuJTweJRjDt0qKdg/qOliLunWtf7lHcnFR+A8xLTqavLmp0U6gEvKKVmmfMxber4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772157443; c=relaxed/simple;
	bh=HrNGeAJEJFaPcBBKW1g9Fll4GVbwJqj6mR2qorQuHq4=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=YnFPLcBFlY0wMWGB4HEt7pSc3XvlMiFv/CRu/1if9DypZ2Y8UXK3i/SuzwvVmA3t2BvPar8bo5KbxRqGPlvsnF8jUg2ZpZT6CigR2AM3IPrXYSsN3nmoUGzsJNgiA0ouIOxVtbG3TpimSccL+aXyMGv5W+hxZaQmyGfEw46hdZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=N6eNF/a1; arc=fail smtp.client-ip=52.101.69.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="N6eNF/a1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kcEMoWKG4+j02u8GHNTTSnyNbmsTzzedz/L9qxVYd33P7frYPcwL4pSKlFx/oRa0lVP+P24Pp5x+eq+wyTIjOVnX9lOBI/v0vWrWrGLid0ZGmxx2iVwUhiw/b9As5bLnUsvG4F6bn37/uR4IPWdSht0j3laq6z+yTIsy8e9Ve+rkBHLGl+bqv2Q4aUhnZWFMK4yJOL4KfcXJVZioPns1W2iEMNMD7gCkOApa+7zX7Js4rcfl3tLNHPOn9AnwAY4/X8xnimdTtgs8SZib34W/T+mKBJQKnu9JXfib32DnYMi+09Jz+CR+GutpjM9mqgyyNfH/GwgTw4UkHcBXAdIJNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47teUjZVX50OQMGjMTd3BbkABFnYtwJ2K3JVeYdKlQA=;
 b=xQN1NVFhpUtjmTkJH7O7U74uzeQWHVn5NRIMo80pOq933yFOs4F4A20wReDt+cbzE9YPMsDRr1ZnElOLM7TZ6uSl01D/RoBQfUlEfcUe5HrgavmzZty6Svqw7v6xGe0G/72HCpTVmhLG+jSo1AFPMDYY1Si1z29dOrhmwEWgDlvCy1KG8XnJr15uFjwfY8eXAtLzFX9BfwA6/leQPBw31ctcv1LQUQsnuUYx7wo8l2uOiUqTFqjQ/opNOF8wLkqlTz0nrD55iaY1IJQI8dKqGAZ9lkcTVx1pKzRqei3J9n2ZOvq1H1S7KOxjoKxU5g2DEdOO8l+V35idpJz7h+jYWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47teUjZVX50OQMGjMTd3BbkABFnYtwJ2K3JVeYdKlQA=;
 b=N6eNF/a1aQkaLxxa3ediCqz0e6NCf3bylmVq2d1RNGiiSuyJN2cv5NLFkgmHF0uayrMM+r04Y8/bxuZlh5/DYfawFJyJkALVHjntXkyi7hQa8XRgks6FlrvkcpcUNY9rjCf0pgAmVepvJi3vcCkeDaSXLo+v62i+DeX/Wf0uptOWLMSs9OWvtvRb4u2krdX/0RlbLMTk+MZfz3EHjUSXfDtQYWZPk+PfCNLuY3KaNPujbaFMNNY+HrDOOUQ2Nm6MT8iPqaEfdXmgTkF2qa8aLFzqOpv5MySFUavFpuRsyJWFJ6R/efPrFzZ6dD4WBE5U5LeBu1d5PYoKayMBOBIeCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB9PR04MB11512.eurprd04.prod.outlook.com (2603:10a6:10:5e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 01:57:19 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9654.013; Fri, 27 Feb 2026
 01:57:18 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	daniel.baluta@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com,
	Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH V2 0/2] arm64: dts: Add NXP i.MX8MP audio board support
Date: Fri, 27 Feb 2026 09:58:35 +0800
Message-Id: <20260227015837.1915384-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::16) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DB9PR04MB11512:EE_
X-MS-Office365-Filtering-Correlation-Id: 67523074-1764-4c73-c086-08de75a389c7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|376014|7416014|19092799006|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 IzYuNjs6/zlzCYZtKK9jtuoHEYRm/TznMOYiWZoAb4lNkX1bPeAhFuJ+l24C8D5vBYoQNq3uFbXsEJIfLjNIopADCSUw4fR+QTcuKO+V1dPrueC+8ksovL97eLRhF6+Lib2Uin97+gME6Yb+jsQINsuPcrpaPmLD2z3q2EgQyvQa1D8AWHwr4Wf994SInSadN7+X+odiYb+usPyGGceNm4S8oq40ZoNuvEpDiTdZcw4msMlBipOuKgPDrG3iDXDNIdBNWd+3t/lEdrVAQjl6UTUwtUzLyFN7mDo2uclbszyS7v5/GsDuZV2ui9/m6gLwQ9Zud59u8LqmYTu7rZqzGQ0y23Q2ZiclfWEG2qGSo1EykiaSDBpq/Wha6uj7LzfxQUHf2yvH6alHZ75VKG7vRE2FWzkcUmEg//q2C1E9duB11x6K943iLXXLpomOjhgz+SmD8yM/DKtZH1318JMlG8ZtopWBPv2HZj5leiRtJMVPjTgBTkYuqsFXCMmHh20SSfTkPUvvWwJj0WrWvNS8XGRW5e77NYFYoD5QUXKdpjNMOtQx9/D6YE8y3oOZPpbJOvMVNLVytAe+WTC1UBSJwttkI927MaCz0OiJbDagqZmW0A4gcqkcbIAUOYyVxGcOMgHerR5401HLOcI399y+Ov+wxdUt/1XJYkqsyGGMgmULUmJgAG5+UFUaBOPU1toL871ZXdHhZdl46bqG8/x4qnZz2n1aYJxi0SW6V9HrdkAP1ABWUuzkIHT5bXjLWL6bir2BV3FqH1IrjTEoIaqyqFS4j+MvdvxDVWpE6qk7Xl+TgXYXVm8pvFW8XYpxBz9v
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(19092799006)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?iP0HaI+IzdxDY4Ft0Pni07jpWw0n1TxIaVAtR+pv+QPtf0bU6nBHoRgatKNn?=
 =?us-ascii?Q?65FWU+gSM83GbSsWR1/XbBqDKSoyKioJTjYrvm/jadQaVGDmCiKhNVEq6g+D?=
 =?us-ascii?Q?/Ma0he1ndrlRR6/MKi2md7ifo6PhbcsdDFpvcwEFca6iol1CcxloW73zzX2p?=
 =?us-ascii?Q?vPl0MxwBy/CWDg9BTf80JE2x50BzYd7y/Axd2xhBvswdYsHcCnGbAAc1cIEk?=
 =?us-ascii?Q?ckPyZ0FKSh5q8lo+2kcK7S8/gpUcctikCBAxYuZiM/C0auktyKu8Ekpqvvr4?=
 =?us-ascii?Q?nFNX91GAwUR0+acEBMtJxyktzHM6Np8V5Dak+t2NJnOvfrGFbr3OjzEWkHzE?=
 =?us-ascii?Q?vF9Lziq4NAeyWszc3MBgEaxzn1JU1MTk6BOBzi5R/eiyHABiwXQmspINcsMp?=
 =?us-ascii?Q?T273gHgcmQ2SkqEKdNCdDlsy/nB2uSe3ryQDvaJqQ3haxg3j7v47wT11MVlE?=
 =?us-ascii?Q?/wKApajSh6xMGOqkiQUzJav0BsJM2h+KJ0MKihRhuYSghdKXbbu7rjdkmHwl?=
 =?us-ascii?Q?GQ/VPZnbG5ZuIxiRtFLCx48E1h7/sPxkPOSIc2MzJXDboj4V9KxVDWx0Rie/?=
 =?us-ascii?Q?qXL0CVkf8CbmFa6DCKEUaM4q/8/uEvRsTRQHrc2DLB4lP3qwscSsV3KXfaYp?=
 =?us-ascii?Q?5PLvpVfy8eFu4KVGtFjNQ6T6/RtzC6vlXn5thaibluwueI77WQHhYxa2ykKo?=
 =?us-ascii?Q?oT332OLN09qUyac81JGwkjgmGLwhNFclCMVoPk5QeALrLl5pC9Aja9UbGuqn?=
 =?us-ascii?Q?y4W/9w8E8WBX6lg/t3qLyfXhIG60hviUJ0BP43FWRVUUAOxVKkZfdzfq8Z0B?=
 =?us-ascii?Q?YiroYb3HU1WXXwhh/NOJDlnHOAXkBlBhIN0ZmB557miywXxK+9WkuwHJA7Hx?=
 =?us-ascii?Q?XfpC0iNgSDUCrOpiPzoY+cMqWnpRtrYsZE4wV8KcGR4zg+DoHaebFn46ApaJ?=
 =?us-ascii?Q?Fm+aN32R3q10KtPKr5NkD9C8Vs8AQxtSiDSXSjBtutUn2FrspdQ5SrSJPqIB?=
 =?us-ascii?Q?koUXydpzBTKmHvLbOUJdChb0km3b3Ci5tSGoRL8c8DAz7SNE/DRQYs6b5/BS?=
 =?us-ascii?Q?hu0wzewkH906vi7VhChZXUmMCN9NmJvRjz/idOBlDp6EvoURNiz5vs1JqMdY?=
 =?us-ascii?Q?ZDu+/Vqrriin+RLY5P9zy3uK07vwF6o7Xa0czP1FeJN6d2JzhvAS/GrBRYsR?=
 =?us-ascii?Q?w9uOmShg5/OdMEAZdiNtWBMO8/zqzHIjGdMFyRmZpLtJWiiNzJbIJD4VNTaU?=
 =?us-ascii?Q?FFyOJxEGSen95x/Woik/bqp2mGouMQPbN8YcHR135g8+iZtL/m0PeVfURJdZ?=
 =?us-ascii?Q?GUux/KymfQmoZw87oN07Wjh5xkKfCX2h86AkrkXSWMZNBkv1lgQyS5BEghDy?=
 =?us-ascii?Q?XH6KJKtNpdJSF9zhiWkUimaudmMbJwKovmD6+CWhk0a6jItr5+ajZtpnAS7j?=
 =?us-ascii?Q?gHC4owZrCjKITlY9MU3NsrrpSr8eAKn/8K2me0kbrkGwA8ZNc7J2SzNeEVmZ?=
 =?us-ascii?Q?B4hTIy7nsunG/RMUFq+E3qn11LV3UkTFikEdZJN6gix778fPD3vg7SfCV4k3?=
 =?us-ascii?Q?rxusrDpie1Mw07vt9am90fGnhiO00yPyRTlxk7Q9JoZulwl8TolYLUam7d3K?=
 =?us-ascii?Q?cKdydp7e/04dPJ0CKjYg0rpEG/GeqNKPZz+7D3TkPwRlvq9sQJPxJlFjdsAE?=
 =?us-ascii?Q?lOlTzMCNKu+CrJJsAQfsuBw0T/rooJehiMQJ7gddV4po+kOWndbdEEkO3o2p?=
 =?us-ascii?Q?j0l+k1lCmg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67523074-1764-4c73-c086-08de75a389c7
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 01:57:18.8560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aC9jjeYdlAspQUoXV+CclXgd2S50uKvSojc8ieldHzQu31q43Z7akV5MnnFCOvHj2r3lCBWBh0W9TjlBFWnXjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11512

Add NXP i.MX8MP audio board (version 2) compatible string and device
tree file.

Changes in v2:
- Add acked-by Conor Dooley in patch 1/2
- remove ecspi2 node in patch 2/2 for it is fake device
- modify codec node name to 'audio-codec' in patch 2/2
- modify pmic node name to 'pmic' in patch 2/2

Shengjiu Wang (2):
  dt-bindings: arm: fsl: Add compatible for i.MX8MP audio board (version
    2)
  arm64: dts: add support for NXP i.MX8MP audio board (version 2)

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 arch/arm64/boot/dts/freescale/imx8mp-ab2.dts  | 912 ++++++++++++++++++
 3 files changed, 914 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-ab2.dts

-- 
2.34.1

