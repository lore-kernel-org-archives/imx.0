Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012034.outbound.protection.outlook.com [52.101.66.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F361354ACD
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 02:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769136407; cv=fail; b=d9GdFtLN8cbvHA2yKAT19SYPM5Gfdw87Si0q91m+XvV42TFFux9MzvBZCNPtoOcRhAorXLM+0S3GWgO3SOP2rOnR5NCDdvPkZcT3y31W8OrAzmoztvKcMqReE/X8r5F5PKWW+TbT5QKYQuQbQjb9Lv6Iv1m8ia0zc2Vf8m3npgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769136407; c=relaxed/simple;
	bh=KyD85XG6bKLQUlYtdQusJcSPnUKmgIoXBLT7Ifr79s4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vmpw3Gzt+KtHpXkfVwPDKj3UrGDeEf7MeXX1PcxJ1LELqJeBkvb1nwadEc3OIGK8rKxuW49IgJa06iuJevnsz/1rFitWWY7/Ou5NehDVtt1P1LJYIavTb6qu7JAPrqIi0PEtWODoUVeTL5iI1T2ISHDv7qGfsX4CnnXe+u/PAF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jr5Lk+ez; arc=fail smtp.client-ip=52.101.66.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jr5Lk+ez"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qf8v/mHiTpx1AuM8PWw5zfRiSA5vywoagautUZLOObQhzgd0FcuKrjD4l9dDDkkWuc7y6L5qce38Yc7dhBPp7LZrJQZ2bVlWFbMpy+aE7z97jsxmtwllBxzpSTgMs0+HnXUb7nKeBsYozaKwkZINj6kGuacDfZ+n6aTyvZwHXF8S45IWdYHDuUkRyoXFvwAhQSzA05tfDkm3kHEAJT+eQEwIcY5pzJiWHPZe7Oa/rWGQBOsyb3K0JcBXwvFTwvvMRzUB++e+efM1PG/7SxU7f6kYY/kFm7kyqBZpfqvwMwqvGUNJSUwSgoC3nL2B1oU4/yDO//hCbX11fx3DO8PYuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uW1lG6reGeNg0bYoSREbumOwcVGx+CqFiunedZaoSMs=;
 b=t9sZ6+FgfIn8e/C5GzFFn6X7x1mQmde8/HR7Db0zoS8f22SyQJSfZwLUfdib5aj9mP0lPBShMJWGmc8wJIRrm0/ixCGfov6j1ytPMdIqvnlw8yO3DmAceV4CdK3Z00Mj681jk5n6sFT+k3rcwNsEe6esovy0KSgPaHuhCVT4HbrlRAp+IbnhkqEncEAvkUKEQWHicFCU08PvArYjyb2liMRhMKa0v9j2YxjrExT8LP0vziBYGffXORJ22E8eOvU+NN0FJfh4nEr3ZjtAfd0lquTv2MWmaJAJdZmlJPbng1b/hC0Eys9pUqJzaZI+CBdq6lo1SLFq7lqxzJHdVQsPxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uW1lG6reGeNg0bYoSREbumOwcVGx+CqFiunedZaoSMs=;
 b=jr5Lk+ezmKPRuVyJiTMk9v1pQ+/GU/Ha+wJQ5WVFt4uECyGvr1XdZtly+h7vf2LScCfzLOV/DqsgJs+0uFfIh0cOt9QT7TlcVCX6cIVUs0YyUi8nQ5qMkhmsbgVNJOPALsn0HttcgP5jIuk+Mxlfx6vWbQhElALKsMLZWJ6AZjoHOF74llyT3+9JKs6Oqto62KipdlFJO22Ql5L0Hat/pyiBAE1H3olCkXByh4uo5ey6MVhZI/mAR2V4Zn7uXG+lupYwGhJpxq0BtN2X6p8G1zRVtcIdda3Jc9DL9f2EXyT91zVci32oF6mw5ExknIIx2XTTh16KuwklWmdpKEa8Ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AS5PR04MB9797.eurprd04.prod.outlook.com
 (2603:10a6:20b:679::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 02:46:13 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 02:46:13 +0000
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
Subject: [PATCH V2 2/2] arch: arm64: imx93-wevk: Add i.MX93 Wireless EVK board support
Date: Fri, 23 Jan 2026 10:44:48 +0800
Message-Id: <20260123024448.3909345-3-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260123024448.3909345-1-sherry.sun@nxp.com>
References: <20260123024448.3909345-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::22)
 To VI0PR04MB12114.eurprd04.prod.outlook.com (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AS5PR04MB9797:EE_
X-MS-Office365-Filtering-Correlation-Id: f9fc6bfe-07bd-40fb-c960-08de5a299247
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|7416014|1800799024|376014|52116014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?W4YIp8xpLHnK+6/aTeujooXM3KcZJlYLTqxCCNVQSGuVTzTaCCBWyg8gx1pH?=
 =?us-ascii?Q?8k9PrWnZLMR0xJc8PqmYbp85L/2gmqikzApb2Z+Fdx5fO+YqOm4Up/PsR8V2?=
 =?us-ascii?Q?Fe/mMc1RwJmCDFY5l+FHmMY9D8HDQ3licD04VXptQmmVhPM7aEXDmkVj8NOg?=
 =?us-ascii?Q?MujXDrcfw80338ynKvIkrOQDr9VfqdQy7J6jEBIpRCwIuMHH8CWKM3x5NNp4?=
 =?us-ascii?Q?x9BTuq4GKJKYg/iZ3BAvhxgJaO9sYyEKtImg8RJyu46qv1Y2e4pWzPh97YG3?=
 =?us-ascii?Q?PJx4XKsswRJV6hwkpD7U8epElGS8JXioPOl25fjmebFQfSl8fuA/WL0846+z?=
 =?us-ascii?Q?THBrb1XxbY3BnjqN5mPHxdri6A7DTFwJKNrg5SIuKsoubRpyInl3RWDaFc4V?=
 =?us-ascii?Q?Hc1fnrBScitKo2KiRwRY9XEvPCFnlXvjcb5n4kkOlIYpMCug12l7Xb2cZc8A?=
 =?us-ascii?Q?Ca1m4mLGcA89BU0bE2Je9dnGiKm4laFSZ4rNbGSw1H2Oj5mmn3BGMc2d0aK4?=
 =?us-ascii?Q?eopb7W9ipPTjfOlmN7O21s5J+cEwrVcCTp6Ry67WN0wsLHKOnEwK4JMYHN1E?=
 =?us-ascii?Q?jDjFeITU97gTCRIlpyK70/DS6juKYyOuDUhp2UGu0bNhFSHtDAv3aLySY4Bm?=
 =?us-ascii?Q?JYSL9/EOHyV9qDXbuznSdNqEzzOmtOYWyV3L1vNBZRZdmtIYkeanbK1LTuzM?=
 =?us-ascii?Q?4El9knUJV855wdLx6X6GqxDhGr0JZiKEesvzftqWqeUNMj4pdz7fVLdjLGiA?=
 =?us-ascii?Q?nkZywd7FKuDM13nWRQnwlwzagGj/F3usD0HjYgV+a2EutX2Z5T1I7HE3Vlx+?=
 =?us-ascii?Q?D67H0NIpY/tGpHiwb0BiGCGbBm3LyAy/1y1u4IxJRuc6qyABWrde+0gsRHwk?=
 =?us-ascii?Q?chCM2YyWYTw9nUN1pUhz1CNuTJes+ngGhwhy1FtIoTDXnv3wbaSyG6xH2Yba?=
 =?us-ascii?Q?jk+o0P8Nc3Gvapghycgc7wRECtfWRIg9Abh4Q2sD61XhSwSe7kTGpIHBRyWq?=
 =?us-ascii?Q?cSu0d84YOoRO854YX2Zj7QgK2fqDzLaSwkmWtGlhHzFF+VvEKJ61EFP2Svm0?=
 =?us-ascii?Q?Ye0e7imeOhuZFU8Zu5CRfBb8dGqkqQUqa7Q851wgDiRSgk5R8V0OIcu7fY5U?=
 =?us-ascii?Q?abC8r4sNHrhsSTuZUaBB7wc6ywRNWENnfHMoHmADd9n+0jdHai6boTTgaEnW?=
 =?us-ascii?Q?QBhL/SXloJY98jWO9zKqXmIcruvYGlx4sj0B5ni9mQSBXYYsUdiMnwG3683j?=
 =?us-ascii?Q?iZlVpFsljVNJtwZsTe+cvgGZ/DL/8sVBIBgJUHobTgD2h9OQfOsKkJv5Vd33?=
 =?us-ascii?Q?3a589at0Ka9bdMRMNZR/630qljDg6cuPLgrsY9M5B95rq8mzEqtL6YP1xjZ6?=
 =?us-ascii?Q?KQTJzwORA2RQO+BKTYvEniR3dIFYu5+MK/yohMqKZJpjsdlg2t8LSAi6lvKj?=
 =?us-ascii?Q?+5GMdRxhTxhIhMhR5hRvR3n6YwveXVS0XIGdu98wpTQKIFI7ghtc2YWJPmEi?=
 =?us-ascii?Q?G5dpNeH/iLo7/5Jxu3k1ZXlqc8+XqEmPrKpkfYiCNhy57nI0+E+mZ+xt9+Vr?=
 =?us-ascii?Q?SSIiEfkhI8PcMCUmSeq9dcBWXJxqWB5hG4TxMnQ3yg/ieWBPz7Lbvy2e5pyT?=
 =?us-ascii?Q?AtyKwWk1THT+8c6vt/lj+1gIeOvKjRUnGvF6PwKfVJe4?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(1800799024)(376014)(52116014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?0K+PY2B8QVUGquzevPg01AFjzzjpdnb4NgK225dzeWma8GPd4hzWjeDR2OOy?=
 =?us-ascii?Q?JVroGdHNbsPSEbRRXqPJNMN145eEGQ3eT+hy0RVQHzEKjCK66E/fwsBn9uvI?=
 =?us-ascii?Q?CVNaRS/tokopZIV2Jl/DcUeqUa98sP1JO5r1wcBgWPXMGxrIl6BPKFZPAHVM?=
 =?us-ascii?Q?nd6IDpG7dQ3M4q7IdiFZCrfAHj/PAxex5dJojOavrZoJmHay+8oxVjDs/CQb?=
 =?us-ascii?Q?2Q3WVHdpZ4aLLPLVHkELXSHGOzbdrqkLV3ynHTdiXOtB5MkW6XydGxiHFrKh?=
 =?us-ascii?Q?bpO+lYoWu5szPNsvCrO/TzCUx+gyHLlJKczXUuByTXRmD2a23Dhmu16yDvS1?=
 =?us-ascii?Q?QHyR0Km6A/IMxG8h/9CJ0rTEg5mQmF92cqH8YKtXV/aCS3eC2SGXJKhNK/se?=
 =?us-ascii?Q?gFF4KVxzIGTHLCJWui4YM3LPEwXJ3UC67Kh+vEFBVeJoQjme3PLOrJmh53Xt?=
 =?us-ascii?Q?FljBJMVo3Qun2EnJncaTOyVesYWYI+WLvtzOZS5YtVx7Mw9f/Of/KkxQ/Y3y?=
 =?us-ascii?Q?OYkhy32+ujr2oL5150zHt61IqGgD037pToo8SUEUrpcOKzUqwQsJkiMruQy8?=
 =?us-ascii?Q?T+qoGqcKGU2om/9CrudF7MaoM1kTBIDWVxSm0FDktSNoTHhTvxbz5nEs1Tee?=
 =?us-ascii?Q?xR2REbrdAl55KAcp1vMHKDZ1ljCpeS+aZ/H6m4KISlx4aatYVgdtPzIkYkqO?=
 =?us-ascii?Q?gl4UQg66UxWrByWvcSfm4cXxGc2Jl9OuFmuJdRiIEvPh/0LDmtWK3gtnPoj7?=
 =?us-ascii?Q?z9rvOOtoS+sjWCyprwAYmG0Vu2mw2CRkeW+LQwcDCEiTsLcoM/N0z4jBCLXK?=
 =?us-ascii?Q?6WTKZ7lPTlDcISEatrnUfcd2HNeP8N3M0z4sNh0o8guKyo8FbC+YeQy6yIml?=
 =?us-ascii?Q?sCl7ZSKkTeLEGtqi674UIJ5OmH8IX8xyPvGvYZpIhDHUw7nyZt2pCDeMiLAu?=
 =?us-ascii?Q?S3zcJxemnSQDopHdLO0Plwwx/czUqrsmpvGl0VNNHPdpWcqaSZNsXRhYSVQ/?=
 =?us-ascii?Q?d6ESc6FhD2GUgRXcsaSnwOvxg5CdTD90BGbIIceLd5PnW6Zne2fdr5GRNRbB?=
 =?us-ascii?Q?wkHIsPFpigGuSUXLYldk2RWqZ7C7Ixh93P6O43Aj0yrm1gFs64xXC+rLQK8Z?=
 =?us-ascii?Q?nYJl2GYiSaRWk8/RNq6q2oIwYujsIzScAiWnTNkqqidR2tyfgd3cRNPrfHB2?=
 =?us-ascii?Q?6zwJCYm62PN39aXRoNKizHYHWeIREHma7wN8qmFpi9p+LPSPpfcWbdja2tl1?=
 =?us-ascii?Q?LwscE2ow7ZIM+nAaKZosi8ln1XRQbOqUi4oHnrWEUUzzHvYdk81kX4hBYatG?=
 =?us-ascii?Q?6hsleNTo9qVatK7CY9ptVp3JU/6SiheXAi/OknYMfY03FWy35Tw+n+AK8+CU?=
 =?us-ascii?Q?U5ZFW2HkabO+D0XK9qHokMYNOvNrv8Fscs5i56O3KpyZC43avbCFMQCpY4nn?=
 =?us-ascii?Q?kAfV+Hc0hD5kD4dpsXKMP14rcaz3zF7MNoHOsMmVFiv03Fwuzp6KaYUyRknl?=
 =?us-ascii?Q?eZV045qcdWZHMBxij/Pi7jcODZr8j4uQOAcWjJp9qVd4dgREwp9xgMeTskLP?=
 =?us-ascii?Q?YZOXMIcpOhjdwP8i1WmOCBVGcosY0vL1tweddLgmzzoiOtrPjhA5nA4n+Sgt?=
 =?us-ascii?Q?qUU2hAEti76CZJtGi68JHc8/cf3jsNA385GjyDyHw3tNehkaZ/r1qojxjthq?=
 =?us-ascii?Q?YOOJTJzbiK+BAhmYUcKCh3GXURpt6DbICDrYz7maT6No4LQgJv+kHtmjiSv2?=
 =?us-ascii?Q?No9g7fxgHg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9fc6bfe-07bd-40fb-c960-08de5a299247
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 02:46:12.9784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /MhkNu59yXAS/vRUoI49LDx9qfzvlQiZR+wb2CsHzk2Vbi+S2/+AGA0jWPg1iARLm8MLwBGGd2acJSUvPMrO5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9797

i.MX93 Wireless SiP is created by integrating i.MX93 and IW610 WLCSP
(Wi-Fi + BLE + 802.15.4). And i.MX93 Wireless EVK board with the i.MX93
Wireless SiP basically reuse the i.MX93 11x11 EVK board, with some minor
functional and pin connection differences.

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
 arch/arm64/boot/dts/freescale/imx93w-evk.dts | 73 ++++++++++++++++++++
 2 files changed, 74 insertions(+)
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
index 000000000000..f09587dc74f6
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+#include "imx93-11x11-evk.dts"
+
+/ {
+	model = "NXP i.MX93W EVK board";
+	compatible = "fsl,imx93-wireless-evk", "fsl,imx93";
+
+	/delete-node/ regulator-m2-pwr;
+
+	sound-bt-sco {
+		status = "disabled";
+	};
+
+	sound-micfil {
+		status = "disabled";
+	};
+};
+
+&pcal6524 {
+	/delete-node/ m2-pcm-level-shifter-hog;
+};
+
+&reg_usdhc3_vmmc {
+	/delete-property/ vin-supply;
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
+&micfil {
+	status = "disabled";
+};
+
+&sai1 {
+	status = "disabled";
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

