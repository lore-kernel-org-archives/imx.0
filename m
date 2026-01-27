Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013036.outbound.protection.outlook.com [40.107.159.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B3A2BE03D
	for <imx@lists.linux.dev>; Tue, 27 Jan 2026 08:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769503105; cv=fail; b=HlxdkeSa22Isf84dANIDSqb3+fAePsYcci1Nysl4MG83O1vlxWkx2FDa46T8jIuMSqtiHI1dM0bAax9k5Rr0iwWLDP3+2n3HKbyheXboZqZQGFgAXbJLR+oI+zVojEbGCGg69YK04/9lRxtTQ2MJGIGi4edrhm4YlygUlQwmI1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769503105; c=relaxed/simple;
	bh=szZiKgzHwcf53Uj6FVP9Oy5JDF/+9+UJBN2O+N/U4yo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MIGoPp8a5BRdQcjdK9gLt77fw7eJLAMz6YkT9z6BtNPr1sry9uB4Mw933T8qkpFd++6aIkYs71E2Ksj061qM1yXn3O4FgJvo8sf2Cicln4eVTJP29cHrmW/KSoLOHkipoazPckqZptgk3WqnWj9zU7Gpty4XK6HOe9zoC4JOVmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oOQ/oWLH; arc=fail smtp.client-ip=40.107.159.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oOQ/oWLH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cgdVVHl4bJixO7oVlJwNx/aZBRjhlQs66T8XTrS7q56Msq1rg5KxKwxo6ccVfKfZHfpSKaVSvJCDr7BMdDqkWvbom86LopvF3y2lLsqNrrrgokj6MyvLIPY90XTYx6ydnQmWQxRb4LUQY89OsHz8dAE6Sk3I7/0P8WHdRfxDvXjjaPotyrV2CM5ohLEbRKZSd69dhGDRFMib3eVGhkQIoHouSk2K8qYz3PKUmYj3nqjANAh2+Y3leLoVt1FnlQBAlOqYL0sDTNX9i1qiU+fyR5W5VjyIFETkNQpmHCTyrFz13du4GA1cZAB6jdSWUCyTUX0lkxIs0PucgIbThG4XFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GsO5w+Ag/BmIZSVl2LhGqwRhhpWcWszIJ+Rx5spFeAI=;
 b=fiWs84XC02VJzJDW8l0gKxkSxoZxyOOIvGQWS0g585OCEE2/CvtbC/G1H9yfyyvNU6urqvdVBbUKpBMnkUHlon6Eitcj0Zp0PlfjBMlEmTJWItY5AYglXEZZDsphsYmgfEEyg6Gsbin66KWcf5Sq8SMb9DsHIUIBazhWsTrVyi+jnVpGP68lM/PMAewFvlpFnvhxbYQwoY+v+fZ8shQF4lFWFgEbBf9OXRDp4NQMIxbLzCg+8HKOjxEmoE6OE67wmYXm5ePue69MIdzo16dHD/oTkdUFFl5q4J3t5Bxm/A3RHmEUKeDZXJiOZYswkDM6H1sfUrAa6fh0tV7lEfNZQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GsO5w+Ag/BmIZSVl2LhGqwRhhpWcWszIJ+Rx5spFeAI=;
 b=oOQ/oWLHied44mMOiQrqe9PiwKnppsIV/Lv6n6HdUcM8Slz8jy++SEA0WIr/Hc7fBLmt7j94An09y0pb3khp7ScJQin+X8WtbnmZdwA8ztD/FTzl9W+8EpHkFpCXTcukcO8ku8Z2LuKm7znbEZsrhWFFYY3w8rS6qoTLyuYR+nY98eQzYIM5Pl7DzvYm+hSpX5zkN6ulF0Ia8F9MuZ7OvOCfH+5ZAlAvGgmMDhVSXaZhD756Xgc4Wq4QblIIAT0XvQLsV6gqvpAucE6JcRuY1vlm3OKZOhicdtLIA6jbk/NsYa6pRYUR5XH254h/PStj5vZphnsSMRGKEPZ+EZYMfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AM0PR04MB6867.eurprd04.prod.outlook.com
 (2603:10a6:208:182::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 08:38:21 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 08:38:21 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	daniel.baluta@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com,
	Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 3/3] arm64: dts: imx93: Add i.MX93 Wireless EVK board support
Date: Tue, 27 Jan 2026 16:37:27 +0800
Message-Id: <20260127083727.1839605-4-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260127083727.1839605-1-sherry.sun@nxp.com>
References: <20260127083727.1839605-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0088.apcprd02.prod.outlook.com
 (2603:1096:4:90::28) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AM0PR04MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: e8af0417-3c13-4798-944e-08de5d7f6d92
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|52116014|19092799006|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?YP5mKSDQRcDFmKzP58i3Af5zC1aYnMbuG376mP4OUoHgtlatV8odKHY4AuPp?=
 =?us-ascii?Q?AGuqB1AvystNjqT/4XnVVHJI3cPhaByN8SIwpy8HWiiZqKdRBUyZ19NuV0Bv?=
 =?us-ascii?Q?WgecxfdOKe4X7Rzbt/sKKTo3DdyjNiK2Ak1dnBPgvJOyDU59wiKuUKTuhAVg?=
 =?us-ascii?Q?nrX4uVIUaQTHbUhKbYkRdH5U+2Zw/12QVjcqEhqixVSqbxsyKoT0mMEBPeZ6?=
 =?us-ascii?Q?mKWqk8cFLAbfmFgNqI9NFgoAAyJ2bMT1jhcEmu42huX+NcfO5MAGDZiFOPWX?=
 =?us-ascii?Q?SNKuhLgU7jgMfm8WxNA0wtCEUfCN28MzH1VxBx1o2UYugiMV5IbboWlUoP5m?=
 =?us-ascii?Q?znyoG4JsQSxfowu7w3vRDAsXwHDp99xcPWuia0QAd6hy75N/1nNAF90rHTWI?=
 =?us-ascii?Q?/i8PXsGmLn5LuppkQSU/m8JYj3WswTeVDIJ+VhiWbMYqb/YEh0tKs0kz/5BZ?=
 =?us-ascii?Q?m67jgQGT5NOsYPaGOyu0IhSPTurPDWKkMX9P8uEUsaGiA918pSoIRqIeh4aq?=
 =?us-ascii?Q?K31+RdnJHrOVLdWmpajRiG2nnBbmKiEurC4P4M830KI7Wr6IbNFx61JvGKyG?=
 =?us-ascii?Q?sInHWpNL71QKPYIkbdJs0cyc1UVv03jYYAcLaG8hDcKf/m7fpQIAArBb95Vi?=
 =?us-ascii?Q?PlsitjRChr9dr5zjr8gyH4D23JiXbTJhE4nz4rj72vvbh3eH6q1G1qdtE231?=
 =?us-ascii?Q?SjKY4aZcN0xSAcLRGUSCWDEYgLQMUfrT72IzlJX9/Nm4o6VsPSLV5K9X9tJt?=
 =?us-ascii?Q?7OxJF2gXWQGFIobz7C6sHvxWp4EsmEcfrqjNVZCCwEx85nHI+hFGn6rA5hU7?=
 =?us-ascii?Q?GA5ST9GNHqwCw350j76Bol6EFDlU4TgrYQpa8cvUhJ7J0vBqES7jFATzk1dh?=
 =?us-ascii?Q?FLAAkk1xH9FemHlzB7Jl439Dwm9kzPpyXSaL+Bw18J7WFiAbSpB7FtYBI0QO?=
 =?us-ascii?Q?fPzQxbjfmA9kUxeWIbc7X0aaFSXlg5UPlJg1jkOTjm/iEnvSyQAxFun38jNC?=
 =?us-ascii?Q?AqLwyvEVXM/VU85x8QRB4hFS8hDxXfRYWVHYuq+Bqslwr6kIH0oNXyACTpbt?=
 =?us-ascii?Q?MsoT8sBFiWT2RFK3LBWRRZtkIzQYNsRC1e5G+xZZ2Ie1v8Tc5hEoONjvBa5I?=
 =?us-ascii?Q?Go3jcaN75BEHTlxdQ29GPHP7dybIFpnXeG+8akXewa/tgsx7aXzbgkqODb7+?=
 =?us-ascii?Q?fzwqD5GqanvKLzVOOrLIqA7/caMqyJ2LIaPGND/V0nfO77lpQ+us3mGYZD0C?=
 =?us-ascii?Q?URZgROt8wZLl4OXWCX6f6CoodtfnyD/ScYc3cbe4N/LAg9pyCJ7U6zDQLAh8?=
 =?us-ascii?Q?n/DbAOQ9IZRjkUJZ8dmlLKDbA2+Eg5ZMpQCWPWxxmxyO2vVHRXytjMYT+ONz?=
 =?us-ascii?Q?m8ZM64F7q2g9Blj15H5Sht6j7ll3YeO3GQPMPcLbPS7Je2Oy14N2M6ZJgR2H?=
 =?us-ascii?Q?hNzpb7C1VKYBBA0rpfUQ054SGhGf4S5hYf9oyr0SWZ+qiOo1k8eV+sl+p/+2?=
 =?us-ascii?Q?L3yDTU0S9R9GczUIELqRT9Uvz3PjE0wGLVznYeU0EGOcX3SAWt6jPicRSFhq?=
 =?us-ascii?Q?34NU/CdMRgLKJYoOU0Q7YTiGLnd9cuGuQH+UpEDBX0ljfvQe+pYEeFi1dsew?=
 =?us-ascii?Q?y8qBo1xjU5YHq254voSphDORmVfmvBgsra7rZ1aRsof7?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(19092799006)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?doGyfM+V/wnFLH2sUb779LVw5Xl944IqCSaVJi+hYH/Spu920jz7PGsVexTA?=
 =?us-ascii?Q?uOLTrL1gbqITm3nNmgib8qH9GW/Oki8MT4PlIWZku7Gg/efpFhktiqnA7ipb?=
 =?us-ascii?Q?lKNBWlzbqrl5g3OIfVaBtPc3a/CMK+BXPXeThcgredq3xTdd0k18yejx+N37?=
 =?us-ascii?Q?a4u1VaetIl6u4CRCkoivI1R8UPXexTXRyWWnS/keFHer9JmilVfJvu7hXZHq?=
 =?us-ascii?Q?45zJCzavstNnqGm1MZRJwVvYlsjrbgO0yxf4rE38DUpOJgGF3Cu6FVn8pd9B?=
 =?us-ascii?Q?VYoCDBuiJ+PTjK9bJjxgL79+nl4543AQ84UzAqDMvDacuNVkHmt9eGKrtGaQ?=
 =?us-ascii?Q?I0ABr+/hVbEHtq+PpUcnzu+bXtYgD+qMNm5iFSNcYaTrtog/EQMv/5UzC6kx?=
 =?us-ascii?Q?Vm+H7WjRFhRRIxnmNypxW0EMz75vr6txeHoZK3gwSgDSOdIO4Lxaj6f42wXA?=
 =?us-ascii?Q?CfASSJy4kz1RPKpDIldyHhnGZ99KOf0uVGBf/ljVRXVNO8TejdTwOzG1YsKv?=
 =?us-ascii?Q?BYrvfECd4gtM2C4kc/RoRZUpnQiTsjYdFs0YW1yeFuYhIO/20d8R7pDycdPl?=
 =?us-ascii?Q?XZOUR0/+TK1iHGtIl1Jg0gkj8YECoWHHcbh6kvqvhVFrVVhi8ZJpulaQJcUh?=
 =?us-ascii?Q?aDTvH5eGdfbCs+uVQCXl+wbT20BeN6r3txKDLhmwx1ic2OVWcvPFByRku//A?=
 =?us-ascii?Q?oh0X2pQXslYA02hmZPGdsjvJEF00tgFWLiBj7Gzp0Q6tCiPBoJfwluuNQ89G?=
 =?us-ascii?Q?Ex/YvI54+bok6SgDTiXRtiFaLDhWgxdtxbI0iLquVSzCJz6fgeezpemnEab5?=
 =?us-ascii?Q?nhtyasHi9IHy3o5lqEaw7efoqZr+jvPPrmvbzfEbF78Zzg24QYunMIcgrkRT?=
 =?us-ascii?Q?GL/RqewIYee5PzcQ57cljn2bbDUnXlLUNa+EJcvP+TtO9J+tLlf7tD/iuRcF?=
 =?us-ascii?Q?LlWA9jpeSFkkvAaHMHqMlP40f+SbA7RWZkl8idOtz/+tVfxe1Ps4IpVqgEjZ?=
 =?us-ascii?Q?ANKWhB5cYhBazxbBrDB+rnziBqhKJPKcx8ys+hDiTyhH0ESqKbtY8wBQYilq?=
 =?us-ascii?Q?K92L5oAqC7+zqL2F0YBsxbVs3VU4NhC6kAgxL0YCWCwkZscray2bZQlhtY2H?=
 =?us-ascii?Q?YmnMqBYBLoezHcLkXemFRlT5F1GXe9KZ+dsRfQ0pqaY4nrM3ZBMJ+9dKOYnf?=
 =?us-ascii?Q?MTkPgh3OUOoLMa9yDcoeeNfbmuhfMwS2URM1Rl5q6nj+uuZ2JExsy2YV1lzZ?=
 =?us-ascii?Q?lxVon+v2zKPLTGB3gSWkoSB5HcAvK3Ef3BRafbMMqV26y6qYB2cIV1eI6xyl?=
 =?us-ascii?Q?qpDnn6VJIjoR1NRbB/sTn6XyAdAWtUFkZ2VKyVYBvWKfbZcHT/wxRSmv+Fxh?=
 =?us-ascii?Q?dlNoP6JnWa1zvN40xpmoyDCw+JNTcwGKVnO34t2/FNZuGrLN0SbpqNn+tYed?=
 =?us-ascii?Q?K3e4mmWX0hZyfAeP8l3WyFWaUsCWK7ZXjsdL3GDPdQ+1SLi8lUgdKcgOJ+ey?=
 =?us-ascii?Q?3sfQzJaSJCCWs58b40pPWN9lggYd8snFvktLyO+E3GP5PrdoAIBpKS5KYi0T?=
 =?us-ascii?Q?t4S+SDZbTC8FUNaUpd/bPyLiVCR1JTFCt5gvZMI3AMYtt4eKjKiO4tZ3960r?=
 =?us-ascii?Q?SDQ1wN4lj+LHCg9wvIIk93Yy5louwXFDCHJIuq8Fn7iT0oahDuNKNRCDyrom?=
 =?us-ascii?Q?NpFBQKxVHSjTht4a7RBWuOCd6lQa14VQM3HmDtODJLeZc3kJxKJPOgGsJMNl?=
 =?us-ascii?Q?bjSvjk3EUA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8af0417-3c13-4798-944e-08de5d7f6d92
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 08:38:21.4651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wCzzhK9VjTHvFP/FkW48sVpSMK6zTzoWP0POlJ5f5MpKoQjpK32zr+T/RaukLzUbiphjZR/8DKwoB/yPzEVaKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6867

i.MX93 Wireless SiP is created by integrating i.MX93 and IW610 WLCSP
(Wi-Fi + BLE + 802.15.4). And i.MX93 Wireless EVK board with the i.MX93
Wireless SiP basically reuse the i.MX93 11x11 EVK board, with some minor
functional and pin connection differences. Reuse the new
imx93-evk-common.dtsi and add the board-specific changes here.

Here are the detailed differences between i.MX93 Wireless EVK and i.MX93
11x11 EVK board.

Function differences:
Function	i.MX93W EVK			i.MX93 EVK
WIFI/BT		IW610 in i.MX93W		IW612 M.2 module
MQS		N				Y
PDM MIC		N				Y
M.2		N				Y
RPi 40-pin HDR	Limited support(pin conflict) 	Y

Pin connection differences:
Function  Signal name	i.MX93W EVK		i.MX93 EVK
WIFI/BT	  SPI_FRM	SAI1_TXFS (spi1.PCS0)	GPIO_IO08 (spi3.PCS0)
	  SPI_TXD	SAI1_TXC (spi1.SIN)	GPIO_IO09 (spi3.SIN)
	  SPI_RXD	SAI1_RXD0 (spi1.SOUT)	GPIO_IO10 (spi3.SOUT)
	  SPI_CLK	SAI1_TXD0 (spi1.SCK)	GPIO_IO11 (spi3.SCK)
	  SPI_INT	CCM_CLKO1		on-board IO expander
	  NB_WAKE_IN	PDM_CLK			on-module IO expander
	  WL_WAKE_IN	PDM_BIT_STREAM0		on-module IO expander
	  IND_RST_WL	PDM_BIT_STREAM1		on-module IO expander
	  IND_RST_NB	GPIO_IO28		on-module IO expander
	  PDn		GPIO_IO29		on-module IO expander
	  NB_WAKE_OUT	GPIO_IO14		on-board IO expander
	  WL_WAKE_OUT	GPIO_IO15		CCM_CLKO1
I2C3	  I2C3_SDA	GPIO_IO00		GPIO_IO28
	  I2C3_SCL	GPIO_IO01		GPIO_IO29

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile       |  1 +
 arch/arm64/boot/dts/freescale/imx93w-evk.dts | 52 ++++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93w-evk.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 700bab4d3e60..d0ea746c59b8 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -418,6 +418,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93w-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93w-evk.dts b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
new file mode 100644
index 000000000000..ea76d5df84a1
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+
+#include "imx93-evk-common.dtsi"
+
+/ {
+	model = "NXP i.MX93W EVK board";
+	compatible = "fsl,imx93-wireless-evk", "fsl,imx93";
+};
+
+&reg_usdhc3_vmmc {
+	pinctrl-0 = <&pinctrl_reg_usdhc3_vmmc>;
+	pinctrl-names = "default";
+	gpio = <&gpio2 29 GPIO_ACTIVE_HIGH>;
+};
+
+&usdhc3_pwrseq {
+	pinctrl-0 = <&pinctrl_usdhc3_pwrseq>;
+	pinctrl-names = "default";
+	reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+};
+
+&iomuxc {
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO00__LPI2C3_SDA			0x40000b9e
+			MX93_PAD_GPIO_IO01__LPI2C3_SCL			0x40000b9e
+		>;
+	};
+
+	pinctrl_reg_usdhc3_vmmc: regusdhc3vmmcgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO29__GPIO2_IO29			0x31e
+		>;
+	};
+
+	pinctrl_usdhc3_pwrseq: usdhc3pwrseqgrp {
+		fsl,pins = <
+			MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10		0x31e
+		>;
+	};
+
+	pinctrl_usdhc3_wlan: usdhc3wlangrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO15__GPIO2_IO15			0x31e
+		>;
+	};
+};
-- 
2.37.1

