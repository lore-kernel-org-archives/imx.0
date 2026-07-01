Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012062.outbound.protection.outlook.com [52.101.66.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA9948A2D3
	for <imx@lists.linux.dev>; Wed,  1 Jul 2026 13:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782911508; cv=fail; b=Y/BrInbENUNG0H/B8z9zRXOQL6aB+UXZPwbJ2BmlnMryRRChnvAApMfn1dNfzQXiSvXwAKqk1BodrVUL/VRgqpTaJSFp97iUc0Ifr3YpiwLHLOgGIYPaHVJ5Bh0HrEZ2TYXVZRBrro0znbW0NQzl2+OYX7GpVmpaS2XigFwHhtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782911508; c=relaxed/simple;
	bh=Xp/IkgdwgGuJK+rZoSSqdsQQ6zOaULTC+4HYMGnuqUg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=h6uId1vSLBUB2voUxhIKMWm56rxq6vrZ7VId6ViqfnKGqvQJqNA2ji9tW1iOy9vHWxOWzJQAFE5RwTyn7D2PFSjQRmCZHdI5WK5O0NjFTnhc1CTEB//7+tF9evrp7gQf3lI0rYlSUcFoK9PKfMc3TLM855KniMHdh7WIg+1q05E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QwB3Ref1; arc=fail smtp.client-ip=52.101.66.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QwB3Ref1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gkM0BKOVLGxtp9ljqeOVZkpjY7mGC7wYQ/gXyYZavHagwPXtejJbuQbzA/pbDbodH+9u/+S+u73e/M4Xda4PZ8VU9ayUynlQfxC5cPSSmILNmNU5EoeVF52Whn8B7GVavovrulBFZeTmvzdNQjz+zom6AkBEsGDvKXa6c/05Muf/d2YPNDir6KGrU0+DrGfXB1GtbGI7QH356ww+8W5cLbWZ34+gErnWa8yjSXyOX121L7WSrjWNPhbhanCFCukRBgbsOVE1mNgBJ+g5U93BkPa9ZqAMHktB7i8Mz7MB2TzYlhPAUt8gVqxcy5zXmju5/lC/MzoAlEWfP85qtYJFnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TXHRJSgvYv/9Lz4VWMTGD64HiSOw25IkH1L8qTK16o=;
 b=E2jod2yty1qJaIVVkcvybezTOsYseQwUlCQR5PIYvG51kOVp0t5aITu2YjknHh3ltqy1KGbPJGKZdMfO8kfwPhGrZfg/APqSSjSrL9nW0suhaBo/yrCq84wu6YWLkF6i1cTwuEqi1vWMusmh265IWe9JKl9mpLv3jhNdvfDxhj6Blk99uAHmrWp9DvgNtpuFrpO5gTE3LjlXUrE8rkYdz+XtEQ9REo16lHD/ZBeXAuD4/mgjr2J+3+W38/YCaEelV4hhQK3NgLbOUxxl/zqbCpxbAYCnM9UC2/mBGZFPJay4ANHCo9zfA+tG6F5oHmQxEaGtLz8883BsKVcw7kWeiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TXHRJSgvYv/9Lz4VWMTGD64HiSOw25IkH1L8qTK16o=;
 b=QwB3Ref1QnJ/Z6J+S6w7yY/0zvgalnhJ0itJsAHnezgahReXpZGUPE57p3JX0wDOxbHWKtJPrd6MsvQ3p2qibT7bsQ0/eaLp1/euUprXkF0Ru2Zfcd++V2Lvvv1n32VTmhZsml9CUHObY4QioiYHm0YHABvcVstUxqC/PdyNiyXpkg4oKXe5YXARsimnSdCNdid47XmGY4xUTNOyjeBbhh++xjvgvSGXEsrdsnKh/ZUlUYaprfB8fCHzIcrgp8dfG3YkVM1Lwx36V31Duy5gevWIB2B6HXAwP8GVCzU2faPwpB7sPMMUEZIyJ1mZDwdlPcDIdUF+VBgMdMfBVIYyqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by AS5PR04MB10059.eurprd04.prod.outlook.com
 (2603:10a6:20b:680::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 13:11:44 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 13:11:44 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: vladimir.oltean@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2 0/5] arm64: dts: describe the Lynx 10G and 28G SerDes blocks for Layerscape SoCs
Date: Wed,  1 Jul 2026 16:11:32 +0300
Message-Id: <20260701131137.940145-1-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P192CA0028.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::33) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|AS5PR04MB10059:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a3d9912-417a-4f38-5941-08ded7724c37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|23010399003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	0DH/SUbl0RHdkujtG09jJH+V8+ohL3Eljk2uNQERzA2QNbbjtWHl9JkWc4SxRYM+HRKvHzYmw24pwWdmOnQqnqMdt9UNK1mhNZW382RyCgNdQ+Meda2F/5MW0Mqsdm6CnttCh6OUH+mWnpTbHPXneqL70ewdiBznbl6gI8Jgvt0a0Kudv6XN/MrQWWszm6i69w4aA2GrXbqFtzbh7JfMtMUtUJfKHEbBc1Kr+HBDP3uSkD6i1FW9SGwVNX7uAaGdlmFojzL7Tt++oLOAJyZXcOnWKQpPE4LHOfKBkQWzrGPUjXXC4IgwUir69dp83zU8TDTILAwk2ZtrzF8EcNYfJoQHUhm5PHJtI8UjoS3eApd0U/Op9/Limk6JjwZEgDOVyMOkjJ4OM2vDfrcp9uyGayVuXfvHl0uLxIWlDy+T1M7otgZTI3B9IXA1ekwPJMo5xPA64Hwk9zMLs6j/yfeOvdYNrCcEJ24pCGN4f/NYY3LSNxCYfLmM+qMGOwVuVpk8u/dd6N1QJdAsxXYp2xCfyRrAdl6ebirI1PrJZyyC1GTDDXwW54ss7/YpaZwm//UEN6/tMi/06O37Jxq8LBI0VwqAUnPBhKcEuKuKqv97ATB8i7T+5RiSPWAGpwsh8tR6Y7MGFV5p4JwxkpSeBwKKcSQ2zjup6+8jGt10XXEOnQo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(23010399003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tFdieq3GtW9tODurMyOwp+2UP/vqzPzQMVg7w9dUcWCHkiDbNqSZFQ7qY1Dt?=
 =?us-ascii?Q?3mge5rp/ybt/COixb5isjRKNoMUFW1qK+cRhWBN1zPMXitR2zNntoe4+K7EN?=
 =?us-ascii?Q?+8M2scFjHimfhl7QGbYUOesd+qXzBGimVd6k8yri4OR1DX2BF4XBO1ds+++n?=
 =?us-ascii?Q?i9k7zeT8Gc0RHM+hTUuAfN8VqYmhoJicvUpIKgBfpiCE0XsNLu4UXs2sZeX+?=
 =?us-ascii?Q?p6r8IqIZiE9KEU8FBhkzX+urKqU54YUZFP6FikKu7TRt7fW4hRDEsBZZR5/s?=
 =?us-ascii?Q?tpxsSwrvW7jwtq5xDfIha0keSS2BwKC/SzAqe0J9xGow0sXc60AAdD4Tg6C7?=
 =?us-ascii?Q?Hyj9xDQSOCxW6ZCUsCa1UhWfxGIoJdYfpntQmnGRrh724Lvk0usx7SojivfR?=
 =?us-ascii?Q?YvmR2HBk0K2mCVRoKKzQKvBSyVPNMLdYWHmebDuLveBBCMGXtnoERz7tbqj6?=
 =?us-ascii?Q?YUiWHboMeGWcUvWH4uUsBB56+DtDJEAQVdWSQnWRyc6D6REw8s+EMarP0z4Z?=
 =?us-ascii?Q?MFLNcGByunCP0Hi44Y59wj+XiTt5LC1jkiLVjJXEFW6g3ukxU4WNUZ5f+emB?=
 =?us-ascii?Q?88eWool9Q55+YOfREPsKnLcsoB8MDNWsvWivHjagaPbk5v3dy8NEfJpbdiUZ?=
 =?us-ascii?Q?UIb4qAu7Qtg4ByIIc7xEpCSeeWsauHT616+Q/BexnsNRqiMpQ6lp03PDiYad?=
 =?us-ascii?Q?q2/eenzWwNhIPcPwwWr1byS/ZEwtFx5i2FvB7kuDowAU3hGyvxhrLqju1H5x?=
 =?us-ascii?Q?qfuapU4wFUUPoAjctC3Hk1HS03NqzXW8uzkiyMXIfGhnJMIWzHJ/PXMYjMr7?=
 =?us-ascii?Q?JyvvZlGrHaJDqDC8uNq3oos0liYnpvaueU+4hY6iZ0ETm6Zi/kiu1KXLz8pZ?=
 =?us-ascii?Q?b6IuToBWBujz91Ipr4QDD4qX+PcYxyRr5EnA/TkqW7Uwh/OJ7WUHm+VN+xEf?=
 =?us-ascii?Q?ZtS5gpGyNkYz3qsfO4KhuuzPrx9+EgMLvTVrp7WewqRqDiIDd7ge91jB3PEF?=
 =?us-ascii?Q?ZfsiXVXfV6oGRxBkijoe3+EscWYaRN1XZWaqNA4DVuQf3dfQCAptVhYeDUoG?=
 =?us-ascii?Q?zE2E1t/ErSNTmvppjLx3jU3qehXVHOyI3pkovcUZbdnO9je1nWL5A144ZMD+?=
 =?us-ascii?Q?XLbUXi+uzZgNh4+bqU/2xnBLFPWKu7thX4VjpZy7v5+gfqUwpnSX0stBeG33?=
 =?us-ascii?Q?rX9D6eEiGptvs30/pkM5kPeRH1wFw14ULO4K8t4GdgE713BPHiuiD1M4pKoh?=
 =?us-ascii?Q?nLcWWujb2200hOEPs3VVY+kYMOpp9fOvL7nHr0PVpqrqA+LS5FuXiAow0Inr?=
 =?us-ascii?Q?BZl6PC2ckAE2k1Z7KypbrfalX8486cSL4B+kx26iqiayEfU6J5VFODUpU95w?=
 =?us-ascii?Q?oO3vCcwvifMQVjuWo0W/b7sAWbBbiHE10KMfCN0wDSm3fmdWv87fGuSRyLuD?=
 =?us-ascii?Q?g8gq1a9lfkEiyi6nPm2bHhebEV2muqEgnyyPMiSx+brp0cxfamJXbfXklCRW?=
 =?us-ascii?Q?LtAXNZr+Uc5zVP70a/YEhv+6loAEwErOBHIFbMPykdZw9K2Mg8izhk3syon9?=
 =?us-ascii?Q?+q0foFnZUd5WJv9tfacMs8Hu+dj0iowVN6iBzVswzpr+/Wz8LHIgZ+kOo48S?=
 =?us-ascii?Q?ZnW1044/jlR5s9IdlRjCm829xVjxQDYaTloIlpP9en/mCaOILfYlknIBYZHY?=
 =?us-ascii?Q?5pHzBtoGfZUxJWTpTRBLe3CXhpg8+jJTyy2z8s1nkOZQOBBeGiZ+M3Ju3GPz?=
 =?us-ascii?Q?DFuw7kU3oA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3d9912-417a-4f38-5941-08ded7724c37
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 13:11:43.9421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: snqPTWRsdF7Jf5IWk2FOkxPesTydgsT2ZrHW3h6Dbu5iwwfsaac2DV3zg5KFMNuZochFHT1fVYHtMWZKD2PO+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10059

This patch set adds the device tree nodes for the Lynx10G SerDes blocks
found on the LS1028A, LS1046A, LS1088A and LS2088A SoCs.

The first patch also transitions the LX2160A SoC dtsi to use the
device-specific Lynx28G SerDes compatible.

Changes in v2:
- Enable serdes_1 on all board DTs that has consumers for it.
- Use the proper name for serdes_3 in fsl-lx2162a.dtsi.
- Remove paragraph from commit message which mentioned some consumer
changes that are no longer needed nor part of the commit.
- Change the size of the SerDes region to 0x2000

Ioana Ciornei (1):
  arm64: dts: ls1088a: describe the Lynx 10G SerDes blocks

Vladimir Oltean (4):
  arm64: dts: lx2160a: transition to device-specific SerDes compatible
    strings
  arm64: dts: ls1028a: describe the Lynx 10G SerDes
  arm64: dts: ls1046a: describe the Lynx 10G SerDes blocks
  arm64: dts: ls208xa: describe the Lynx 10G SerDes blocks

 .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi |  29 ++++
 .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi |  60 +++++++
 .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi |  58 +++++++
 .../arm64/boot/dts/freescale/fsl-ls208xa.dtsi |  98 ++++++++++++
 .../freescale/fsl-lx2160a-clearfog-itx.dtsi   |   4 +
 .../dts/freescale/fsl-lx2160a-half-twins.dts  |   4 +
 .../boot/dts/freescale/fsl-lx2160a-rdb.dts    |   4 +
 .../arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 150 +++++++++++++++++-
 .../dts/freescale/fsl-lx2162a-clearfog.dts    |   6 +-
 .../boot/dts/freescale/fsl-lx2162a-qds.dts    |   2 +-
 .../arm64/boot/dts/freescale/fsl-lx2162a.dtsi |  24 +++
 11 files changed, 435 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2162a.dtsi

-- 
2.25.1

