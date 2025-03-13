Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2040.outbound.protection.outlook.com [40.107.241.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F71D1FBCB2
	for <imx@lists.linux.dev>; Thu, 13 Mar 2025 07:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741850119; cv=fail; b=g7MFIdJGNXI1WHGAAMAdPh3tHhvcvgzLBLczrTUOWmLwPJpF5y2l4vW6GvRgAbtWThvct6cueT8LL7AaCLsOK68tg7GdPuMtCyppfpKpaOYEWsvlnsXEBCkHTEElnlV0jQNigdjNPoSdTrh1MQvEvkBpKipSNCkqaEFCIM86XJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741850119; c=relaxed/simple;
	bh=SYr93ttZSOdwo3I7lCD82l0wJ0TKlm9Xmhqniiic21M=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=S3oQZhQUSaTj5tfMlIumjYFQ45wGJjpmCY8F8ZnyMtN29g+R7A/WQu95Tx0pPTDwGsO/BUhuml4dNaOdAtSWdvLDhx1SIIZ5K5L2OMW3/XYOZ/vOwe31cVVPcneM8q3Ub6py2lBekMEksxPaFvlk8gd1OdiA8Qcsd0SQ1UChhCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=G+aZCmBQ; arc=fail smtp.client-ip=40.107.241.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="G+aZCmBQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aF0Iejgimg3xODa0sNhVqJBXUGIQawQlIg8e6W6DWUu9ShQujbaf6i19sjZG9vMuQ+vcG4NNgeWHMGy3ZLcY7by74CyA5ai9EHP1lWx7t4EZa4esLoWCQCXMpPk/+EoAUZx92/cvHpFiLuWWlYEx2XF+h/3MSO8vIQwMY+KLIl8Q7vXo8bP5WR3vjLk1F11O0AjOxDYCzlywjU559l4i4SHBtp4yVGrfrFKjZ0YE4xRNz4zNp2s+k2ecFTxAiNRGbFrLsKrhVTs/6Xn64OWI5GMDn0AN6tCUHDBxd8ux9ryAkYOCf3KGzKJWkgOx07TFmZeLRoZSXCspur3k6IXidg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2vv0E3H1PR67cnL+aN9uEvajkMAWj4ZsKzJeJ5E+V0=;
 b=F1dqL3Z/i94zZOWBAS8BlTtubHtXpscLlFou8kECxRv9zmtM8/2jdKFpedKv5X9uclJ7V1dpu/Nz7kvbIfW3yg7pPYFHtNQz52FXNKO/GnISRPi0ivYtYqPE+zEl/FCBxKgAe1A78y+D1040/ilzDAdZRqrmtWiK0GQYH98AiyuDv97sPibcZ1EXiQFKHUrpvy15qX6bmY9IVj2CsdupTt08wdvIepsZFi6tcaTX3AsrWaR0aCrYmt/JvP9EwPtZQkaU5cfAIJbLyZzkTHOZsC7AMMpUjHWiJjVzH/pk+Mq1Pg1eb4EF72ln9QuHEf9eLYRM/MWT/UDqeztTGwFKUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2vv0E3H1PR67cnL+aN9uEvajkMAWj4ZsKzJeJ5E+V0=;
 b=G+aZCmBQBJd95sA56PgKAtelFt5hZDnZPgFny5m+kyQY6Gg43N2tbssP45rK3wtcGSYUbOeFvwlIh4pOA5gM5N5JpSH63WJwSJ2FgTCAgpVbkdC1IUPBpfIDVx+3RYt2S76Y3Rd51Ypsa5IeNeIkxS7iBT693dGoQM1cl2u5tQuyUNoJzKYtRNLmp3ajEtRGIjqXfSmlb9JnWOXh0vOtP+3sXH00mAqZL/0TvzzGNpcqXC4b+kWSU8VpVk57jVupXPKeKfJVGzSZfdUGxPoik5bWaA8buca7f6T3guH3Vwp+hDS/Z7ZI8ehYKxwZDbX9AlrtzzVhJc/7lgUFWiiv0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by PR3PR04MB7228.eurprd04.prod.outlook.com (2603:10a6:102:8c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.25; Thu, 13 Mar
 2025 07:15:11 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%7]) with mapi id 15.20.8534.027; Thu, 13 Mar 2025
 07:15:11 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: krzk@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	aisheng.dong@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com
Subject: [PATCh v3 0/3] Add i.MX943 basic dts support
Date: Thu, 13 Mar 2025 15:16:25 +0800
Message-Id: <20250313071628.729168-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0097.apcprd02.prod.outlook.com
 (2603:1096:4:92::13) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|PR3PR04MB7228:EE_
X-MS-Office365-Filtering-Correlation-Id: 692fb8d1-a51f-4685-071f-08dd61fecb22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/XE4j9kXuzpO+J1J4LqUMgPtlCz+mKjKsO1Dzt8+pYX2jHdEtv3dzbO8m/SX?=
 =?us-ascii?Q?IPGiFk7e9vzRHqDpbS496UJl8n965h5k0EmQn86os20FgWqlq35UXp65fcYn?=
 =?us-ascii?Q?31uTT3dhqSg4ISiagZ+8UHAO4KcdzGS/X6ouI51oWWUe+fOjYJeILCHzrIxq?=
 =?us-ascii?Q?4FW28EHACDuTUa3U7z/L5oU7koX4rD7zyx1s8NRAUM1rtXsVaGKu6ocbEzUn?=
 =?us-ascii?Q?tflU4zPC8nXTRrm00Y3wHF2u6ChZcV5s9bxAbt8yaSgJ3167FjMULqknmDW2?=
 =?us-ascii?Q?BNFYGA/x8CVcEEU4LKLSbNWcXhDWjzFJxaieTQXsLmfNIHVVCr0LwTM8yuyu?=
 =?us-ascii?Q?7vl1QNB5ANSj0LVebOb1TO1CISOsbxu3Xt4xl9Yvy6sDSshXqSiecXr4NKyb?=
 =?us-ascii?Q?kCAZML8ovBLP7ygneRbah/CM5xsH5U0ycdtYDWjrOeYoFfFTtxDjlWf8kiJP?=
 =?us-ascii?Q?L4Uaj/500srWHNHQHNA+1Saw+lmwuviIIUflrfvM5nAAD5iPjsWyeqp0mkXL?=
 =?us-ascii?Q?hAD1l2BmFyMF9adFj0/f9VpggcEu0B35V7shOetLDWyyKgHEgI80+K4J77wg?=
 =?us-ascii?Q?xlAQhBGqpgqX0JMkqsA8j42q8q8zFifJ86n9O1SypZ3d1hIftdnb2IvpEgiA?=
 =?us-ascii?Q?q0pOrXNAhhfOy7Iksje/zIJxtP9uU1jIg/Td/NAW/NKVn11AX/BkUeTi04uH?=
 =?us-ascii?Q?7Pv1irZ6BzYNfZcsL+TVsbyc9O98PnsSozhxkFAr8OzNLIqlJUpvQLDyMa0B?=
 =?us-ascii?Q?Vw1NEvFPYu8kVqS1PM7vB4s1jgKps/Vcgxcu+K3zbF+74wFgIyFQalIkVpLG?=
 =?us-ascii?Q?NTPRDW1NLorF0JKNkidpqblyEdphtVw59827wbsYCBN7YcU009mte2+TbRW3?=
 =?us-ascii?Q?Hwm/WxZJDm/smDmOQFFRzyg3bc61pUVyo3Y51YN0Jo5dZI8lXh6LH5R02jSa?=
 =?us-ascii?Q?SvczqMyUmd6SfDlpH54Ccugkeiitkvsmqp5RJ1zr0Ri0FsYzvJv6Z93fXehJ?=
 =?us-ascii?Q?ktqeJxyRJebSC0EdXyKs086Ymn80TONLS20LAO46PvQvZnA4SRa8VK5HnXRa?=
 =?us-ascii?Q?ErhJOFgAMB611z6E9SiIYLiKKTrie9pnRNpexVwUbr4pTNHqLE3nljYT5oMi?=
 =?us-ascii?Q?DWOY5ZjbrC7iFB63IBNXHNnhgLeWe7XrXJ3IpgYI5VubSULWcDzSeuaP52y/?=
 =?us-ascii?Q?sxm27L++lWOPE4N7iD6XJJAbbxtNi+KjwZCT+Ds140Yq8j10ZhRNOWGa4wZs?=
 =?us-ascii?Q?X9/csKwscct4QVnzLHR6ulKlpq1QjCK1c7g9eonjgzJhkiBwDZ6S90FDE6On?=
 =?us-ascii?Q?p14EaJJPTeqViYohyZtfSR3iGuZHumVrBXRCeWBpRo/ii+RNktdqfpzcEf1g?=
 =?us-ascii?Q?O+DLnJ3K/nJKBXusRmQxfu9rx87R?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AnJbD8qOiVCmQjomPZAwBZAroY7RtTZu0nVYBNHXlxLBhGRiEDn6BPxVtNKz?=
 =?us-ascii?Q?5y0xOJ14ijMT6K3EIHKh5n/cmvmbMO9nQldkB3zo88QeAG/G/+HnOTrTXcZh?=
 =?us-ascii?Q?JKLJwl/n90KzlP0ywFP40Gw7Ex0WNlXo0Jo0btyIOVR3Z1Ij4hP6qyQ82BR1?=
 =?us-ascii?Q?cDMMghj4bTdfS14jnmAxR3mLluDHYyKG/RMKC9pNh4QVSdrgPtrtdXmAF0Vn?=
 =?us-ascii?Q?T7tXw1U/LieIHzVPZOXb4kA2Z2IPsC1bGuezxYJZlxnwHmwe6MaLjW+BeXsa?=
 =?us-ascii?Q?lEuGsNhmsJADA3M1+/J8uucF0KZakWoQCuRmRTUMqPKKX9WBPte/PRjVFvFd?=
 =?us-ascii?Q?OgPdoX+1n/RsNiQCDT+ndcHRJb0CbQn2uwKczFQVuluPqhl3ApG3UN+RaB1G?=
 =?us-ascii?Q?HovMpKCG47dC2Qe9CYrPDxvUFEoXz2kjmxJizv2O+fjaIyUjel1mQHy0rgmu?=
 =?us-ascii?Q?W38+q5asd7WDLTEyci36z+9aOvE5O/BDiZiJp5ZQro7tpq1s+LU7Y0rQw3hc?=
 =?us-ascii?Q?LhOyW6uitzemLHX0Qjr8RYgrjca+bw3/Khgdy9T/L7tWMVueAo/KRGDafuWu?=
 =?us-ascii?Q?rbwt4JGVrh1Xm99ny1atF8zfZxgovx2DE8a07t0c7e3FUyWXEPvRvwuUMP9k?=
 =?us-ascii?Q?4NrYmUQb5jeZI3Ol6PjJEWu3Osv7OpqAKsLyd3KaPDvshIBUtIBt1ZV82pNX?=
 =?us-ascii?Q?24Iy+X32ysYsh1ZjMaAmdQmjJBgk4Vt4+udLpDJUIvRFEfxj78GnLIJghhhI?=
 =?us-ascii?Q?VaNVfA6CcDCKvUg0n1JrJHAp/W+0na7URVMKvLAv720R18ydPGnn91H4zwWX?=
 =?us-ascii?Q?klmHXz0czKsxujs8voGdTZ+rOhLGTk1lc6e/mav2R2C5mp4QEVpcfjxf6yMP?=
 =?us-ascii?Q?hoBJatKU5yS76MlguP0n8wxTAYidfx2NA9suOhMNi8XcbUKbxJ1j8acs+LkZ?=
 =?us-ascii?Q?E9jq25z03uszGAP9jmVsr5jHIVnUXCMxAFJLPRe/iXpuW97+iaJCHsNJfcH0?=
 =?us-ascii?Q?/bSsLRJoegXBpkQ2gZpwSInPnGKUEf1NzrTMXhDpcXEHZ1rrmUemZQ4Y0DbY?=
 =?us-ascii?Q?d3LyW1whQH8hw40gevCpHP7RGXuSr79pbziP9s8MSKkazuvi39rTL4u9vn8G?=
 =?us-ascii?Q?ZVgcrOXnNLyX1MuIQmpeP3Xpqz2vM4xni5qfrUkPdZK7PxcXMIcWaemq20wF?=
 =?us-ascii?Q?6OTWC57uBJi16lF3VLces8RkD63nY1qVSmbg5cESD+3GRB/qNZWxr2PkScXf?=
 =?us-ascii?Q?E3G7UiXCtyRpSVWYG+gQo7nwMes8cjQCbnACTD3MnrhL30igwhDRxjGpMHXL?=
 =?us-ascii?Q?+mx8PptHEwZWNKd/YqLtYTPVQ59L2sEziA/vvlj109OrfZ12ZQPVPpUArZUD?=
 =?us-ascii?Q?SxO6v2tcBH38n5cWSs7W2PmsMLHzwLCSM14f0REsKU+h7x4s9J8etF96WinH?=
 =?us-ascii?Q?HOdX83LowlS20j8UNpEJE6Z3xVno5gZ8nCHU0u5keirLKDMbYw0CxsjYFIjE?=
 =?us-ascii?Q?YGaJozR0hu1gX/ln7/q5EDVStBt2jIf5/PvC+j3XreG+6wDAnuzyQylX1+00?=
 =?us-ascii?Q?TwOtTy4UaOtaNsIhmJCPGEVI+B0CIYPH5cyCSKiu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 692fb8d1-a51f-4685-071f-08dd61fecb22
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 07:15:11.6230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WqqWq/XCJrtQw1V3SQOGhTbCWK4S55XLlnN9HSBDyhv8ExqzjYiCvqC0w4L0+yE59QswP46kDsJELyzeNljkTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7228

i.MX943 is the first SoC of the i.MX94 family, all the SoCs
of this family are pin to pin compatible with only several
peripherals differance.

For i.MX943 device tree support, we split the dtsi into two
part, one for the common dtsi that shared for the i.MX94 family,
and an i.MX943 specific part.

This patchset has dependency on Frank Li's below dt binding changes for i.MX94.
those patch has been reviewed & acked.

https://lore.kernel.org/imx/20250307190816.2971810-1-Frank.Li@nxp.com/T/
https://lore.kernel.org/imx/64d7d06b-337e-498a-87dd-03ae41e6a2de@roeck-us.net/T/
https://lore.kernel.org/lkml/20250306171052.244548-1-Frank.Li@nxp.com/T/
https://lore.kernel.org/imx/20250306171013.243332-1-Frank.Li@nxp.com/T/
https://lore.kernel.org/lkml/20250306170902.241057-1-Frank.Li@nxp.com/T/
https://lore.kernel.org/imx/20250308143214.6dcc41ac@jic23-huawei/T/
https://lore.kernel.org/lkml/20250306170810.239489-1-Frank.Li@nxp.com/T/
https://lore.kernel.org/imx/20250306-immature-ether-d92fb5b8f18a@spud/T/
https://lore.kernel.org/imx/20250307-scion-comprised-03e8ea95abed@spud/T/

Jacky Bai (3):
  dt-bindings: arm: fsl: add i.MX943 EVK board
  arm64: dts: freescale: Add basic dtsi for imx943
  arm64: dts: freescale: Add minimal dts support for imx943 evk

 .../devicetree/bindings/arm/fsl.yaml          |    6 +
 arch/arm64/boot/dts/freescale/Makefile        |    1 +
 arch/arm64/boot/dts/freescale/imx94-clock.h   |  195 ++
 arch/arm64/boot/dts/freescale/imx94-pinfunc.h | 1570 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx94-power.h   |   41 +
 arch/arm64/boot/dts/freescale/imx94.dtsi      | 1140 ++++++++++++
 arch/arm64/boot/dts/freescale/imx943-evk.dts  |  196 ++
 arch/arm64/boot/dts/freescale/imx943.dtsi     |  148 ++
 8 files changed, 3297 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx94-clock.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx94-pinfunc.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx94-power.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx94.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx943-evk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx943.dtsi

-- 
2.34.1

