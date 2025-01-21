Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2081.outbound.protection.outlook.com [40.107.249.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7E01ACEAC
	for <imx@lists.linux.dev>; Tue, 21 Jan 2025 07:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737445281; cv=fail; b=V9c1Ks7Cm12MmaSjwuT6SG1xOJw2lVSMacEKCIQ9LkOU//FdC/OdVMmD/VI/n0/+0zfEr1cSf3EWDQshAuxYIboPZuh1j1lB71uNSkYOvPl8A4kpRUuwlAV5V5AGkHiM3MgIauZIaeItnIg0nEvfPvfv7WQN7b2WN9XnlvpyKwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737445281; c=relaxed/simple;
	bh=3rPH7+Xx7T2kBRJSoyx+wMgkrGoouZRZq7WnlHCqmVc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=jUGs+pO0omnCr8CsnLmbPX+kCpYBDwOlEKsTCcruCDEgZ14gLrzfp83ojouuSxE5Rkv4Sj8Tn62CnYLTb7Lxomiw/SuPO+6zacPBnEeLk89M6VqOBbF5MMW/LLPGRYull1Q+B/tJLWarGMaawXhjMvddthijzLg6II3dhC7B/kY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eJfdCFDN; arc=fail smtp.client-ip=40.107.249.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eJfdCFDN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HnN7gfW/cZnrUmQyvYcYfcxsKJh/1wpt0rpiQ1xLKnPRQ4VYWJ8vSPyVP3cSF6zF6C1vXx9YhUPFZp6GMEmZYC0OqyMHba3Phl6y5yc3LWM0/6l/21snj7gCOwnToQ8xS4qp4s2A7PEtVMnCt3cciUqI32+Xwdp+Z/wuVtpWAcoa1pEtByM1uuBl5mrVxIACLtKTd8eimFjlWa86qN22k6Vh+Wh5XQQsMh++qiWH0wjQSFH1Xhjr2qE80cyxQibPKh73bQ7pKBFdoV5I+FP/QtRVipKMrRG44cqIvF+bPgA2UdlkaAb6lbcbQnPf0YGAisyA7zTumo2jMXZY3gqw/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Fui09+m2rxieRmUSR1nC7VxbpcmBPJkE1Wa9yjl+LQ=;
 b=eApQJrq65871MnIGA9gGrs9K4FL1MhkH9TifgBtIWz+rg7dhjMqZEjmn41Z92Z/+Fa2CNgb6WaSerucbZSKy7PLMzPfIgmDp7UCceXaw4zu2RP+YwJt5hqmxntef4lKUZyn0JGSwsJ6al01a7oh7VK6KejRQ81SlYMRc8xQsM7dGv+rifrvfugn/YcU20tNpXCTu96POny1btkrCy3CVwwVusBODwqnfChUWA1LWELB1LOHvDnW3DMr5UgbOrBU3kEq/3SIfvXOnOBfAAtzxDPz53CJ99uwCvYiSXDn/wS3Q+3wgJT0N1dNOkZ2WUyZ6ht3e1+Yyg+OFDkN+GAr9PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Fui09+m2rxieRmUSR1nC7VxbpcmBPJkE1Wa9yjl+LQ=;
 b=eJfdCFDNWwCYuVVDTmRGiOyQrico5ncfkIGKLh75Oiji83QcBtsqrZb/K6uvjiGxu+LqdP037BAJ3hp/VYa/esHyh2WgOMODEdYtQMUOZnLx1wYuwiLmZXqpNH/Ou9ztXA4LvLJpM71NgXPTMAHAzDORu0JFw7FgP1wxwBd83y05MJiwAj1RowVndcJFSYNHOXU9t31WkiI08OZsNN1WQ4aq1AQ0A9zMAE3UZxCbrMtC1x8VLrO0AoZCYbCpFF05theW6waz9kvEPgs4F/nsGkZiRZzcHRjzLl4oubNWsCYHFTZq6e59pRa0Cll0pTAGqu4rvzNiqNy6kGIphd1OLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Tue, 21 Jan
 2025 07:41:15 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%6]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 07:41:15 +0000
From: Joy Zou <joy.zou@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	catalin.marinas@arm.com,
	will@kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: joao.goncalves@toradex.com,
	marex@denx.de,
	hvilleneuve@dimonoff.com,
	hiago.franco@toradex.com,
	peng.fan@nxp.com,
	frieder.schrempf@kontron.de,
	alexander.stein@ew.tq-group.com,
	m.othacehe@gmail.com,
	mwalle@kernel.org,
	Max.Merchel@ew.tq-group.com,
	quic_bjorande@quicinc.com,
	geert+renesas@glider.be,
	dmitry.baryshkov@linaro.org,
	neil.armstrong@linaro.org,
	arnd@arndb.de,
	nfraprado@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	ping.bai@nxp.com,
	ye.li@nxp.com,
	aisheng.dong@nxp.com,
	frank.li@nxp.com,
	carlos.song@nxp.com
Subject: [PATCH v4 0/5] Add i.MX91 platform support
Date: Tue, 21 Jan 2025 15:40:12 +0800
Message-Id: <20250121074017.2819285-1-joy.zou@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::17) To AS4PR04MB9386.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|PAXPR04MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: 6763685a-31e9-4068-50d0-08dd39eefbe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VncUm4XhWNWK2MmHPg6OA+zf1K7zgAU4tP23zbPjt9kRV9ORsrMApJ/Sa7za?=
 =?us-ascii?Q?2FnAUD7SXrpyIoSiMWq9FM87wi1PVk6ReV8s1nfdPWDudcxHvG9vibD2O/BV?=
 =?us-ascii?Q?sgj9YUVjelt7DyxrfW0Fe8z1Wn6e4RKVHbP+OTYg/4NPKXNuu/SBWHRlB7C4?=
 =?us-ascii?Q?L6OSdoB0e3KVUjFtfKifRGPifLAYzS3kAUhsmcmz/V71jSwPS4+Dd8iJ/qfZ?=
 =?us-ascii?Q?ImBonnxJ4hqzVSUzrcBpSjlyMc1So+84SrELUDnjJvoCKj/N1NfVOyClbvrm?=
 =?us-ascii?Q?fntUyHxab+4OjxjldzLecyGZRr8ZoKlLyZuabPlYbNKQWGkWAJf0Ea8oHtzO?=
 =?us-ascii?Q?E0oW237mbweaUBGhaNk2paAK3SfUwDVAgu1i3dWwe2e4dfG9I7kdOT7fkM++?=
 =?us-ascii?Q?BGCXKGZYR0qO5J6ZgUH5vNA6RhcaXKnm6t+q76Vrpxx0XgVanJcZB41BCVkQ?=
 =?us-ascii?Q?caq0CKkbU5WEGh6OgdP75q2iLFVWWY4FajEKfhBX6z0xwt2NsQDbU+V+UFbr?=
 =?us-ascii?Q?7ijeJMiAT+bN0IwDx4Xv/nfNVVWiOvAwtPesv7NK6OIMcjXIi9zb6k2N5wbY?=
 =?us-ascii?Q?DMoNeUjG+FzTpX7cyoDF8UPxQVo/YA3Aydjjh0K9irTfS+b35IdT46q6MHic?=
 =?us-ascii?Q?wnuZv726H1FpnfB8Dvi5GRSENipTdmIILsXjKLZC4MDKMVfe50cqOI0+xldM?=
 =?us-ascii?Q?clGg8R/HlLqkxwObFR4wH3jBon0LPCeE9FCh7jUcqZQAQ73iA4fsCxebplYq?=
 =?us-ascii?Q?1M55DYaMrov5HjVZ9ORVuAOT/SKGtD9E/Scqc8gPoi2GsU6SWTR406taGFPm?=
 =?us-ascii?Q?j1z++F5vH2HHi2GkTKnGCQPbfF8pi8ZtgCI+zW8IYvVx16k5KJXSnRqKtH4X?=
 =?us-ascii?Q?B8hn9B4LVzbrucLCkbQjxqXpUu2ImXQ04rDVyt33y//R69/s/FCt2CkO3QHc?=
 =?us-ascii?Q?96L8g+GUoHGigWguGIPz3jkIXU1grnc7MdvbZgRKbmPZ9o2E4LAyt9fgzz5D?=
 =?us-ascii?Q?rbBREAZ25CHC/AwxZKcrwyT8PTmr/GM1M/8N4z7k+ylTJDJZJfGlu5FAqELW?=
 =?us-ascii?Q?FRUj3dzxEepY2tqm1UUqs9ph4cXZKhJ+PS3xc8ExFTrWVkgRB/i0bNxIbYyi?=
 =?us-ascii?Q?Zv569G7cf7NiXduaeCdyNiGKI9Zirnt1cYBBAeKCNkNjHEQzwIFiK0qcl4Dh?=
 =?us-ascii?Q?pMYMbupJxwKWascCZyljgtWTVChnSfGzUsfZTmq+WtLAjGEYbx1nfU47MMR6?=
 =?us-ascii?Q?XNcpXBVHjN5elYkT2AzfTY4hvJGa3Rg3zOEd8HnMK+LHfR74YGqtHO6Vo/ha?=
 =?us-ascii?Q?V0RhGp0UNVYgddYZQpM3glfPNlajGiiUXAXXI+wE6+xx3ahkGt+ITlJ4Wxws?=
 =?us-ascii?Q?fffYWz/jg2BPspVczNeVddsfqfJCmL8JTOho1njCSzo1MvPUtlmYCySY6lER?=
 =?us-ascii?Q?dzylI0vNsog27mfvmL8WKmxQCNLES1nn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8H7J1EfKiPyR8NGyk6a0TZpz/c4Wyyd7LWvsHs6MJmp2OHWepyxfzEB68B/V?=
 =?us-ascii?Q?rNFE1QgI6T4tpXS8tRQWK/RAALR1+W3q2luyvncEb6L1BljFkLqMShVzz/bA?=
 =?us-ascii?Q?RkWImMciY2kRzIqNkELYlB7LBxz+uRN4KAe8SrEJBS0lXTIF/WTFZagl1zsZ?=
 =?us-ascii?Q?KEQE1PBorhGTRxpfW6HKZIT/SBWBj1yProQuN5MGWMRrlYAMJBhHbLIc553d?=
 =?us-ascii?Q?Auc352vPHSFA+yZKo4c4DTGwC3pVZlVnyj1vtIr9SfaaQ1LZflzT8cBQwVix?=
 =?us-ascii?Q?OyQOaPiT2XBxW95KseWTdOk156YmGppVUin6OS4tzIQfbnRD1RikDKK0gB5g?=
 =?us-ascii?Q?WXYJ91wseL3LXN3ywsR+eKTIiy+QFj8+wgSSYoahXoF9DBiXo3Uc/UCc5ht4?=
 =?us-ascii?Q?50x6QHuoWEicy+kDD2VvrgAXDIvhcG/W4u9SvdFdhDtOLEdpiaA1cmXVgaip?=
 =?us-ascii?Q?F9jtSCQtysqrk9Fj8JTYkqGTyLIvNQlC/WAetnf1ICZS089mzpS5af+139Jy?=
 =?us-ascii?Q?TkV4hhrMzbSPhQB7Vw2Cul7yGyNL4CP4YfUghcxqf3xisbTo8kUzhxvkuOjH?=
 =?us-ascii?Q?11liKgt6NZ6eofb+Kin6czpwHoQTc8a0HSy2Rh8+I5veZWd7w6a4VabXQITg?=
 =?us-ascii?Q?Fp55vOiepU8Auh0AOUcvnWc5PxAHSwMPBTlk2kb/KV/Ke46Mxc4a4oggEVID?=
 =?us-ascii?Q?NmObK8RJuK+q+/M1jAXTWXR8T1HXBxhcOVN+21oi/imR1B7YQaOB28e9luCb?=
 =?us-ascii?Q?oVZrDLrKzFGvYRWZabupD8FpVmTQvvRlB4AxG6iFkQbYGG4yorBclvoBY0QJ?=
 =?us-ascii?Q?pTupH42BKgt0BNcW3UNnaCcwFNmHeFVFZaLkRcFdau2Pi2+rIndaak3tFogC?=
 =?us-ascii?Q?xbMUFvmC474DWoMWnWebNzDxfFolamhl8DA+YWI7MUTrQjRlLFBZXuz5K9t0?=
 =?us-ascii?Q?cZbqpBXrYMJfoew3B3+f7kvtgrnGt8RljAx7++DuE3qzRyfbRyvexZpSOfbb?=
 =?us-ascii?Q?m8YrJZmqCw6U+joyYJtnswhfAUJLxyCkt3mCXcpVuOwFYPHNgvTIy7qI51qE?=
 =?us-ascii?Q?hEqWblLQAP35O2Bn52voec4o6dEowGAliC6Ncr8NMF9kmbYea4Ew2akZbhoM?=
 =?us-ascii?Q?+UdmLEhiaxzStQlDnGEfIdEBUjlLeiysrPsKzIhCyvFlZxdZSh2rSsVGFaUU?=
 =?us-ascii?Q?hkOQeLJI+NwyMaADwnuvyAJI0epNpX9rmS4YEBwX7Va3iy3a6ND8TXU/Q775?=
 =?us-ascii?Q?oteHZrLrh/g4Gu+yyDf2WIcILarxbQBEz2fQByxv70GdWtcsg1RjAppvtax5?=
 =?us-ascii?Q?TmoeZXtzJxiT6VMjArmObOSj31Mu8KFio8sfpQgKT7Lpor5h8g0Uzcm+Bxec?=
 =?us-ascii?Q?4gVaJ8yHD+48/CetGyYbGqA5O0vlB4oqksH7JpF4xYlUpDNJVpA/LLCnE4QZ?=
 =?us-ascii?Q?EBoFuBU6HH0bLtJz40Zsux/lduIxLhDpuRxvjD7j6ZG57Vvp1qRXnQsrgmZG?=
 =?us-ascii?Q?5HYpyARoYqtgY74xP86kgy5ZPMF/J6DOSYi4xCvRWyz3+kfDp9OITpwufsc/?=
 =?us-ascii?Q?COO0j6mPAKjoh0NPSsLlZ3l1EEX7suVB2XOrmld9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6763685a-31e9-4068-50d0-08dd39eefbe5
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 07:41:15.0639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sp9qlbzNqWYLX6B4j8LIkoI6C3gB4R0sHPjETiL+KdXsIW8Ta7BYq2+dceopFNo2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8459

The design of the i.MX91 platform is very similar to i.MX93.
The mainly difference between i.MX91 and i.MX93 is as follows:
- i.MX91 removed some clocks and modified the names of some clocks.
- i.MX91 only has one A core
- i.MX91 has different pinmux

Therefore, i.MX91 can reuse i.MX93 dtsi.

---
Change for v4:
- Add one imx93 patch that add labels in imx93.dtsi
- modify the references in imx91.dtsi
- modify the code alignment
- remove unused newline
- delete the status property
- align pad hex values

Change for v3:
- Add Conor's ack on patch #1
- format imx91-11x11-evk.dts with the dt-format tool
- add lpi2c1 node

Change for v2:
- change ddr node pmu comaptible
- remove mu1 and mu2
- change iomux node compatible and enable 91 pinctrl
- refine commit message for patch #2
- change hex to lowercase in pinfunc.h
- ordering nodes with the dt-format tool

Joy Zou (1):
  arm64: dts: imx93: Add labels for the references easier

Pengfei Li (4):
  dt-bindings: arm: fsl: Add i.MX91 11x11 evk board
  arm64: dts: freescale: Add i.MX91 dtsi support
  arm64: dts: freescale: Add i.MX91 11x11 EVK basic support
  arm64: defconfig: enable i.MX91 pinctrl

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx91-11x11-evk.dts    | 873 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx91-pinfunc.h | 770 +++++++++++++++
 arch/arm64/boot/dts/freescale/imx91.dtsi      |  70 ++
 arch/arm64/boot/dts/freescale/imx93.dtsi      |   4 +-
 arch/arm64/configs/defconfig                  |   1 +
 7 files changed, 1723 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-pinfunc.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx91.dtsi

-- 
2.37.1

