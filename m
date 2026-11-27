Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795773009;
	b=A79e4tTw1vBy58Qla/tcfi7cpHM2HtoTX0Dk6b4Dz0UXTmwRbhR7tH6gaBVET1nULUnt
	 zHEmk3Jr97kUKglgYlHplRpAGpa/dxUZyKPPE8b5MkN2nvugrHnEMr+EHWBEG6UqGRsUt
	 xn6hNJrw5kYPB9QRtBFq09phdD8BtZt8XUdlt+2QuzVPpHVCcO9XSi2Jhkp6sYSIzajGw
	 723+eLZB88xX8BmIrmD8LEgx1B5tXKNazHio/SZXDx9dQvQBJuYSrU+UXrowf/tLNKrNi
	 VN07q5Kb19+MTAS8XgTReApeVqRp07VwhtUkaZu2JaHh/mCpNvGuiKVvR6G0g3dmxKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773009;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=zRPaWNHBIkBtjVgxRKLrKws8UEPpB0yJYcJ9pDpPxuM=;
	b=vufC0muv/dvT4BiMq7mW0hwccaJoKACZ5in4poZTUJzI9xbnPcWvjd5nNGsxTqO/Hb/H
	 AFoUk8kU08M8WR0IzCgW34YuXlxWebmlOeq328nWShQlWuZ+CoWkxyfuDkE0LY8iXnEnx
	 JDys+zKr9m8+AtbPjrB8UL0G78FQBrDZru+UZ0bkgivk0QRWGXPwXvj2TnzuyaThjCH7V
	 y8PcvnwUSIlYxorZGLqTJQJ74OWZTH/N26Z9RqV8+n5X327MEBimmpCZNvS3nMDpRGKPC
	 qsEjeaU1hT/p5A81i2ceR4KCz8f7Jcs9lnWAK9c+euJNYgGoCJU9638U5qMpLgS1UvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ToR22x6q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.48
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013048.outbound.protection.outlook.com [40.107.162.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B172606A686
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 09:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B172606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ToR22x6q
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sjCWyxyf1Sl0vXJ7KjryHXVN1EtrrQdTbLqtfHocT88xJHgNfsdgIR08mq11gk2jqdQrE3KdX3yWV1Eyzdf0Oac4dHR9uBYjL1y+wJS9pgpiDWm/n2ILcEdgUKrmrGo7KvGbCYNvtYlpuLBmCBQbfyrT7tI2RvSlc0PxBJhLdmlRF13EGWZ/NmI2NC9ZQzx/qPpyBzcL/PGR3YcAp/2qzHklPFfqEgGyszGy6IemYavyStUyH8J/DFiO0+6fBq4UVLIStoDnBpdUrV+1f5MkDgi1L29ZKmnlmlpMdYmgrbLowuD9d5fuDcM5lMIk/37pFVkE96kAqybE3mvg0Sclag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRPaWNHBIkBtjVgxRKLrKws8UEPpB0yJYcJ9pDpPxuM=;
 b=C24uREtX4nrt1ZiXDgFfYe4AZsq2zO7LU/+2D+pOHdHE5lCONLXVuBN8MEi6iBCuaXEWc/YXA2rGDiRmI2RebXb52EntikN7v1qSIs2Ud7uOpv2HRYSJaoEAZJNd45gZDThv1Yaw9S/+oqbJhHmz4jHDIV17Zznit2QQCnG+63NgZYIYqpHHtLkkAWXGe+fgNGQs2+pdUGCN6Hjr4XATpCjesOUtSvhQ+7IthgORABjUknVx/ofGMEhqk6ItHyRpM5PaIaQsaWjCRs/GXrH8D30bmDFktJr7BGebr83rsmNkJA/UW/ctbVw7M7txgSQDApZv8a+Lck+En6shlphmPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRPaWNHBIkBtjVgxRKLrKws8UEPpB0yJYcJ9pDpPxuM=;
 b=ToR22x6qHAUMIIA6dLWBOTl7qomcTYEWhPZ1bRImk0Jr3fAb2Y5n1qMrWO+2HUpnMbiHZjinXqV+EHnRUQXYUL936dOJ/lI7hBrjiTIz2u9X+EoSX2H6l+ReAoejzafQaGED0kwqarMa3W3DV+cxi/HLYf2nOWzlngBGZOFZLUf6syfDZo1BsaOzH5IcvPwHUHXfmJkpQVhh6CibU5spZQxs7HHC+T7L7hJ8/tZjvkmR3fJzPmj3+RwNZaZ5kKaD6ixqNjdC2mQdNKb4pxXtM7YE0q2orT+NVzQjS4bdhy8s2KJ/XyHuNXR5qa/pZ2WDe4U97WPIw1CNufy+yikcgQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from BR2PPF9D47B45B4.eurprd04.prod.outlook.com (2603:10a6:2d0::cd)
 by GV2PR04MB586427.eurprd04.prod.outlook.com (2603:10a6:150:606::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 09:50:01 +0000
Received: from BR2PPF9D47B45B4.eurprd04.prod.outlook.com
 ([fe80::6e42:6ee4:6b13:69cd]) by BR2PPF9D47B45B4.eurprd04.prod.outlook.com
 ([fe80::6e42:6ee4:6b13:69cd%7]) with mapi id 15.21.0639.012; Fri, 27 Nov 2026
 09:50:01 +0000
From: xiaoning.wang@oss.nxp.com
To: netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	daniel.baluta@oss.nxp.com,
	frieder.schrempf@kontron.de
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Clark Wang <xiaoning.wang@nxp.com>
Subject: [PATCH net-next V2 4/7] net: enetc: add i.MX952 NETC blocks control support
Date: Fri, 27 Nov 2026 17:47:26 +0800
Message-ID: <20261127094729.1061755-5-xiaoning.wang@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127094729.1061755-1-xiaoning.wang@oss.nxp.com>
References: <20261127094729.1061755-1-xiaoning.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI6PR03CA0015.apcprd03.prod.outlook.com
 (2603:1096:4:285::19) To BR2PPF9D47B45B4.eurprd04.prod.outlook.com
 (2603:10a6:2d0::cd)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BR2PPF9D47B45B4:EE_|GV2PR04MB586427:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f7118ff-f9b7-4246-088c-08df4c6bce59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|366016|376014|23010399003|1800799024|11063799006|6133799003|261009223027099003|18002099003|22082099003|3023799007|10067099003|56012099006|261102123227099003|261026121527099003|261028144727099003|261026140227099003|261021121427099003|261022113327099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	xOFwMCQLVziCfVNZdpRxLuWpGKC4v+ZPKOn6x7j2Ac+NEVUixi30A4NwZXnCTwqGGBHq8gZ4ddIXcwqOY9oL3h8oJZtIQ7oR02QQxDZk3F0+kowfIa/bOSSTZfjhWVT2zvc4ESoqjj4pbMOBft3loYGvieAWfw6f4slzJ2UqBNrvKmX0iHA30SELsMK4MB/fMd/a90Ey2JdGeeArlVxQIYROw5FsfcF3aFqVUW3HbBt/c3Yg841sGZTh4sp3iD09E8KBMLN2kxbr84A/hTH/yM5VCqbIlSejZMPq7cg4jUABvCHAQibpk3wpDr5RLtwN8ZgRAr2yrtl3gsMYfVti3Oq/kcPenaXY5rw6dkCmBaoWVWvP1vOiKv0lmhgj/JKCzQ5d9zxaV7dLzWAGUPoxSn0+ush7WTmCryYelMBeftpNQk8AnFuiuDdX7hE23IYmoSIfcWRaCZlmkgk5OqhR156nK68QidDgQL96QwjtsGcvJJHwKuYVp4/xZ3qjWnEyrB0Z8pqQS5MX0jhDW3MD05J5n3q5LeO9tvseD5MsE6k/8j5GC/4XcavZxZj0A+shdsIq75Ai0QMVWXpcf48nWx7QbdAb0TW6hatLxj11DLRQrlIPvs+47eaD8CyYEWNBhEwHktSG189uBxEEhtYoB9/JHKWmNJcu/QUj692t9ms=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BR2PPF9D47B45B4.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(366016)(376014)(23010399003)(1800799024)(11063799006)(6133799003)(261009223027099003)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006)(261102123227099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022113327099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J5UOIUr7m8KREE4h+S6cZc4zyOF+ewC4pZZeAlsDa5nCmBZIL+BE1j0m4VLB?=
 =?us-ascii?Q?AEWpPMiaF8IKnI6y2QAC3P+BkLsJakyquRO3DkWjAFEgD2acweN9KwdiCB1E?=
 =?us-ascii?Q?NkahvOuXvqVeIZDiskk/p8YOcyHUNexOlS0UanDTomP6xfwa46SFR4JSu9cq?=
 =?us-ascii?Q?YBLYXxaE8j+jVmi869FHTirEH6F++j/XKCpKbVkgT0YiQECuLIYoyJqNRi0m?=
 =?us-ascii?Q?Tu6+sfTNOS/2ZaZT1Dv6laWxFGp7RuzBPK9GDTiC9P/j/U8oFm3Edqzosz4C?=
 =?us-ascii?Q?2sEujEJDgk0exIQGEGEvxbv8V1O7IZhGV6qQ1ghYnAyTZQl4nX0vXUs8y8r/?=
 =?us-ascii?Q?h3CYG8s5xki3CVVWml52+jbrWvbson/D0cwupH9pDzHgWM7DStHWdElNt+5Z?=
 =?us-ascii?Q?FDJz8g0JTDW6OY/Ivwdw5pXb+Hf1y8QuXl3ncZaXfiSHwcy/WY/vhcVbfRF1?=
 =?us-ascii?Q?CYVnLtwdHM6nwlU+4mojX7hsoxXI46g0cFgRdclEtoC9oHoYOGJSiqtqiMO4?=
 =?us-ascii?Q?obREqKeIczwSuIblP8vMU19CRKC7Y36eCD+PCP27juIZ9hlTjvJyeqLg8Bq2?=
 =?us-ascii?Q?x66FX/Blkeh7PxPVHCKN2fdG54zhkyY35TIbwJXr2+lT2ev7y+HWrcLcf+Js?=
 =?us-ascii?Q?z0vd6WEfZUQU9hELNAg8RGtUB1HUFY9wAK7geLu8Gti/r4NpR8UIWyJn2noo?=
 =?us-ascii?Q?E4W5tfaqTAkkcHqidwu/ppXDTiv0omPDtOPi1NwD52JNwmKulCsVV0QH2vFZ?=
 =?us-ascii?Q?YHiukrNmUAgCmcOSuppygOkrnwblAibilGQ9jKb/o7lz2cyVC49c89whTBvk?=
 =?us-ascii?Q?a+vhNQ4iVAehKUo+iHQkQa3pUo2LHNtOq+Qb5xtZ13YaU2EHZ0U5LuwljTKt?=
 =?us-ascii?Q?bYJVBcyvtnJSl6bY+xtD+bJtDQJcjz00hSTP+ZncyFoLuMQwniK3fvJNVeGb?=
 =?us-ascii?Q?/NUXCEfHZCCtQqVA2CzIKgC1iWCZbXnoCjHuidtvD+T+HFmMI2/LvyPYE0lV?=
 =?us-ascii?Q?C77m1Z/JsYx8B9SwS/cJ5BKlLj6ntz99HsPMzrrpuQjArZzBzBt5zh6O8Lr1?=
 =?us-ascii?Q?NAISVYP9oxbQTf73Htz5sluCNe8HG7FMTTjquAP29WqiuCojVMSuzw/UTV/U?=
 =?us-ascii?Q?wDQC/BfJCJh6HBV3WihemwPx6rCq7eueBdVJy4HIESYXinPRX/EgAPH3pAR3?=
 =?us-ascii?Q?hkxfEdxwTiIG1kzqZHhYRIyAmTYhf7MluncW6elc/uOn909HYPsepE9M01wF?=
 =?us-ascii?Q?hswTdfygKKazYnkaRcX5dp/0H6xeKd4A/tQTz07eQM4oOL7NfPsuQ49rdE0T?=
 =?us-ascii?Q?LrLjBkwaxTBqtIeyUD6+gc6cwvcbHLfzgaceA7tBgiBui+7CQHRB7OBE5jiC?=
 =?us-ascii?Q?C8D018csX0T8MiX5p8NCBkcCKGzKTF8PnShUQJqkQcjs9EkGXQqsY3ZM7AQe?=
 =?us-ascii?Q?L413rJRHx+/uEzGzn1eeenhDZIsVbk5s1+eJM8yfIm89GiazFHBe1haoyY5p?=
 =?us-ascii?Q?xSkbzIbs1E0Rn1Nocjvzi8jeeOZs9FWH/k0+lxBK0eqBgki835gscYlMwmLO?=
 =?us-ascii?Q?PfMsAmW61mvPObSARZD7S5WF/GZG1BpFCszZkLFSoWWfHHpscjWx4F3k98ud?=
 =?us-ascii?Q?qwZtO9vwURm1gRh7wMZlHQNAa+eQRPj0fpV9tDBCxXtWAglqibJarhtBXBNa?=
 =?us-ascii?Q?4bBHUYeiwHltCDSi723cDJoqmqxPXsEQeVbmpnDnRwvNOYjta+Ck+oXXpI2f?=
 =?us-ascii?Q?IJqVAMjSC1A6NMjFj6hXVwyN9Cjz83nTSGmx0teN6FltQSVDo86jhJYx+FpG?=
X-MS-Exchange-AntiSpam-MessageData-1: 5dlkvv+NdgCwOw==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f7118ff-f9b7-4246-088c-08df4c6bce59
X-MS-Exchange-CrossTenant-AuthSource: BR2PPF9D47B45B4.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 09:50:01.8676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Xu2J0P9du8M6iBoisSfcE+PZWp44t/avY+auOff3lIEEji7Uk3pLsJAemqZZWJNYfJXYFeSnur4skc/VdtPCMmN7A3foANjpw+dKCweruvC7mKUxcIPeCUlxuumzM/i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB586427

From: Clark Wang <xiaoning.wang@nxp.com>

The NETC of i.MX952(v4.6) has two standalone ENETCs.
 - ENETC 0 is on PCIe bus 0 and supports RMII and RGMII.
 - ENETC 1 is on PCIe bus 1 and supports RMII, RGMII and SGMII.
Add the netc_devinfo for i.MX952 to do the following pre-boot
initialization.

1. Set the MII protocol of the links in NETCMIX according to the
   'phy-mode' property of the ENETC nodes. RGMII is used by default.
   The PCS configuration required by SGMII will be added separately.

2. The reset value of the ENETC 0 transmit byte credit registers
   (E0TXHPTBCR and E0TXLPTBCR) is 0x5dc, which is only suitable for a
   maximum frame size of 1536 bytes. When jumbo frames are used, the
   byte credits are exhausted too early, so HTA has to wait for the
   credits to be returned, which reduces the transmit throughput. So
   set them to 0xc35, the same as the reset value of the ENETC 1
   registers.

3. Configure the external PHY address in IERB LaBCR[MDIO_PHYAD_PRTAD]
   for port MDIO usage.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
 .../ethernet/freescale/enetc/netc_blk_ctrl.c  | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c b/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c
index 491340061b19..78a420416a1f 100644
--- a/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c
+++ b/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c
@@ -66,6 +66,8 @@
 #define IERB_EMDIOFAUXR			0x344
 #define IERB_T0FAUXR			0x444
 #define IERB_ETBCR(a)			(0x300c + 0x100 * (a))
+#define IERB_ETXHPTBCR(a)		(0x3070 + 0x100 * (a))
+#define IERB_ETXLPTBCR(a)		(0x3074 + 0x100 * (a))
 #define IERB_LBCR(a)			(0x1010 + 0x40 * (a))
 #define  LBCR_MDIO_PHYAD_PRTAD(addr)	(((addr) & 0x1f) << 8)
 
@@ -91,6 +93,12 @@
 #define IMX94_ENETC1_LINK		4
 #define IMX94_ENETC2_LINK		5
 
+#define IMX952_ENETC0_BUS_DEVFN		0x0
+#define IMX952_ENETC1_BUS_DEVFN		0x100
+#define IMX952_ENETC0_LINK		0
+#define IMX952_ENETC1_LINK		1
+#define IMX952_TX_BYTE_CREDIT		0xc35
+
 #define NETC_ENETC_ID(a)		(a)
 #define NETC_TIMER_ID(a)		(a)
 
@@ -388,6 +396,24 @@ static int imx94_netcmix_init(struct platform_device *pdev)
 	return 0;
 }
 
+static int imx952_netcmix_init(struct platform_device *pdev)
+{
+	struct netc_blk_ctrl *priv = platform_get_drvdata(pdev);
+	u32 val;
+	int err;
+
+	/* Default setting of MII protocol */
+	val = MII_PROT(0, MII_PROT_RGMII) | MII_PROT(1, MII_PROT_RGMII);
+
+	err = imx95_netcmix_get_mii_prot(priv, &val, 0);
+	if (err)
+		return err;
+
+	netc_reg_write(priv->netcmix, IMX95_CFG_LINK_MII_PROT, val);
+
+	return 0;
+}
+
 static bool netc_ierb_is_locked(struct netc_blk_ctrl *priv)
 {
 	return !!(netc_reg_read(priv->prb, PRB_NETCRR) & NETCRR_LOCK);
@@ -756,6 +782,19 @@ static int imx94_ierb_init(struct platform_device *pdev)
 	return 0;
 }
 
+static int imx952_ierb_init(struct platform_device *pdev)
+{
+	struct netc_blk_ctrl *priv = platform_get_drvdata(pdev);
+
+	/* The reset value of ENETC 0 Tx byte credits is too small for
+	 * jumbo frames, so use the same value as ENETC 1.
+	 */
+	netc_reg_write(priv->ierb, IERB_ETXHPTBCR(0), IMX952_TX_BYTE_CREDIT);
+	netc_reg_write(priv->ierb, IERB_ETXLPTBCR(0), IMX952_TX_BYTE_CREDIT);
+
+	return netc_ierb_enetc_mdio_phyaddr_config(pdev);
+}
+
 static int netc_ierb_init(struct platform_device *pdev)
 {
 	struct netc_blk_ctrl *priv = platform_get_drvdata(pdev);
@@ -855,6 +894,11 @@ static const struct netc_link imx94_links[] = {
 	{ IMX94_ENETC2_BUS_DEVFN, IMX94_ENETC2_LINK },
 };
 
+static const struct netc_link imx952_links[] = {
+	{ IMX952_ENETC0_BUS_DEVFN, IMX952_ENETC0_LINK },
+	{ IMX952_ENETC1_BUS_DEVFN, IMX952_ENETC1_LINK },
+};
+
 static const struct netc_devinfo imx95_devinfo = {
 	.flags = NETC_HAS_NETCMIX,
 	.links = imx95_links,
@@ -871,9 +915,18 @@ static const struct netc_devinfo imx94_devinfo = {
 	.ierb_init = imx94_ierb_init,
 };
 
+static const struct netc_devinfo imx952_devinfo = {
+	.flags = NETC_HAS_NETCMIX,
+	.links = imx952_links,
+	.num_links = ARRAY_SIZE(imx952_links),
+	.netcmix_init = imx952_netcmix_init,
+	.ierb_init = imx952_ierb_init,
+};
+
 static const struct of_device_id netc_blk_ctrl_match[] = {
 	{ .compatible = "nxp,imx95-netc-blk-ctrl", .data = &imx95_devinfo },
 	{ .compatible = "nxp,imx94-netc-blk-ctrl", .data = &imx94_devinfo },
+	{ .compatible = "nxp,imx952-netc-blk-ctrl", .data = &imx952_devinfo },
 	{},
 };
 MODULE_DEVICE_TABLE(of, netc_blk_ctrl_match);
-- 
2.43.0

