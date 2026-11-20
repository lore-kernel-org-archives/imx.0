Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795144577;
	b=b2KK4oKxLERBgq2H6oyI7K2lgvH111lHfkD2f0OIyWMTszOcSQJqxcRLfcntwYz34PrL
	 DUqdGtlJKteHx3zK88uHGymrDpdNHGSauaWfM4W2D7jhaTHFMPkttvkhyi/knGX7iNuFg
	 Cdowsky8qx81qzGkVy9fUrb0k+95scgS7CUmSNIUgR4x1u04L30suPRfQjqUcQUXlTgbd
	 ToqjmTq5ol0J4JhU/UNuGVlEHJqbRtHAu8pg4JUdh1opaO/xWDits3zhck2ZJ0Tsi0bRm
	 /LzfFQTwBY5kw3M7QEjIUBSxBk/4No+Ksr4B7ePdezpnn0svBNcdm5ecLjz4EppHNLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795144577;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:Date:
	 Message-Id:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=/G5OjGi8cBmhZJc/JJABreADWSjQyEOOUMQAUj+noSo=;
	b=h9g6ORQWT0o+TSR1CAGYgrN8ImBQ67Fe8bSnF/HKKIg7fxqyOUfIY8gG0w0ayNO/8xor
	 1leSSVhE7k0mkZfmqMZXzONgpCKlACUMoxSAgFFY8qD6WQn3Vn44ka6gIcH4aal0IXhLF
	 ICeM+TcVK4Cv9fyDAIOgQMeGmlpoPcNjdkcYRSXcW2XZuM/t4DELl6wNmRwLdr1D/HDaK
	 i+e1KQwHPTIxw6+8/he8sEvlQxD0Ty4Uv2sjwZxXN9ftN761JosWcz4SXWTQY4tyYMS3k
	 aFW/nqI27QHVBF9szJ1bW1XyftAU2r1qkK8EEt0Ip21Bc+8eVe41mHon9qmZ25yqbCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="CX2Hlt/I";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.24
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013024.outbound.protection.outlook.com [40.107.162.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1282B60A2600
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 03:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1282B60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=CX2Hlt/I
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BVrmEfvE98YsRJinheLAsvSVDcYNm95Wd/MO4JeuyENq0OGCGkCLyZdfR4r6vBVXt/acww4O+KFUNJH1s5rYHzODhlDYsXeTdt7pIxJWCjLSE8rUGsqTM2Ll3ixH65o+g/yiGsI1+SbYga9ZlA+lKI1UlMJ/kcynjq84nCmkVNx6ddKCBRCOn4eFx89FQ6oFNmtIsbasIJKbzpsDHmkhj1PUc45v/5wRj2teXr7d6B0ZYJLGrURqmXHt3pvX66Y7IJYNHqjvZqCVGwSPL3OmWJQISJdEdh73AfryV80ePEWds4bzABc74+koaKynGccK1o8J/iheq/S7ipwEyll12Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/G5OjGi8cBmhZJc/JJABreADWSjQyEOOUMQAUj+noSo=;
 b=WcLtXgqkDjMECIPxICrAoWbTjWB8R+cu/YKLB4L19xAJAWNa5i4l49ezJ56m+lCqrqzWsXeTCVDvKtSPCFoy+4FAdySiYyUnN7q+lAaECm9nP4x411K8UYL6dsKhKBUPutALDMf5RLLRsU3RsWXKq2kN5QpWTOq9HrLsNdFDehPgJsllZeHmf4ckouHX04Aww/aTHa0zoe0rCKgbV1MmhtvMEHMT8DTe7uwu29YK3w558m92L2eUcxzKU7KlzQzFS6T2dK1q2VYM0xbaiAzxF5HiHZt+ToP/dWY3U4F/C+en6MkcTfuLm5lAhssJTIk9Qq36W11LDveKjQcS8vuOnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/G5OjGi8cBmhZJc/JJABreADWSjQyEOOUMQAUj+noSo=;
 b=CX2Hlt/IdTurfmx9nQ0XJ0g81t9InyBj+lYscht9KZrKisqpNy4l/eaOBUXgMVVRQ7X/hLtKmEwFWk+DXYMTmJw18qf1CDAZI4iZYbTU9amWz1gtkmzojUSufkkc2ZaiffTqjaqHOddz2Sl8Co8hwo6YMQZML/elg3LskNmWO4MSz/g/+KMRuq0Jq+2Ht0fZbl7nogZgUWAs1lH2BhwpFdzheDIbX8NYMqdQFX3gkSn6WnZ9iqf1izz4QzzDwdFeChBl99CqJIH3XD/hyiHhCln2/LZqeW7MGZkgdyICfNd7BBb3u7zCvjO2L/sDD2st57MS159IHRZdi5xU32OGSQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by GV1PR04MB10522.eurprd04.prod.outlook.com (2603:10a6:150:1ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 03:16:09 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%5]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 03:16:09 +0000
From: shengjiu.wang@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	daniel.baluta@nxp.com,
	chancel.liu@nxp.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/7] arm64: dts: imx: Add DMIC codec to replace dummy codec for micfil
Date: Fri, 20 Nov 2026 11:18:46 +0800
Message-Id: <20261120031853.1175454-1-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0014.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::17) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|GV1PR04MB10522:EE_
X-MS-Office365-Filtering-Correlation-Id: f0b3f399-02d1-45e7-35c9-08df46b49f3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|23010399003|366016|18002099003|6133799003|261009223027099003|921020|11063799006|56012099006|261102123227099003|261021121427099003|261026121527099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	OA6VHNDmYr6vylAzz19jb7qnjTL5jnJyUAlGZmbaM9P3blxTZXdEllJgV1yOfycSe0PWaKdNSVnGPAdkYQJdkC/djdHN3iXV2s4QNeoPqAcUwhwCx2UgOcN+9BJAIpfNW6bcGcMgTGIyaTs3PAeemMAN+oDDw2fnY5YJecdNhjJ0T85deSgYl9xbkYpKokhvelzw20DeRVrxNktsr5wbKjp0Y2pMkGDk3vxtRAZECzIneeP4dx3SXY6poXv/o7k3zQrGcElBisinEJB57D6mrm9LEYRyDqaU8wavecy8YII2kEqTqy5i7S6SZi3jF9LC0kaa1pU31D22EQzp7tkMoyoA2DM8VL9o0jR5pD6zZWZb7CmU6acWYsBP1ET8qv2YeJS6MJoyBBpoeLmpxoPDbA7FMpb2cSOZgzB/dCm4igW3V4AvouOZwmI2okvw67RP8sRM+zh7malfsK4x2Ne7Ju5g3xQ8drtISVuwNQ8ZQk/e6N8mviDK+W2MRi7MAuX7qtUfsY+3r+cIxkOt/JLLjVcV1uuyrIHrvwkl4WCijX24J7NiX369Teej4SJn1RJcMvmWyG+6nVKMk7nySFsE9K8E76lROLcrALETjGLbeejK/VWbVvuRQ4/ceFc8uz2/bXgzCb0Cf4g6Svhln7W++sEfAlD9kX2YY2waALIwe5DdDOXx2kIZOD63u0nk6kdn/El+laxp94RIhBV3jOLDZA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(23010399003)(366016)(18002099003)(6133799003)(261009223027099003)(921020)(11063799006)(56012099006)(261102123227099003)(261021121427099003)(261026121527099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pnmiM+p1jGv8DP1Z2OuBCbihDqBQzxCvSnYj+Be+GJg7nNzBNCbWdIslUqlj?=
 =?us-ascii?Q?vA9nb05Zn/roUPaVh6j6MPOZ6yzWvrD087SNpCGy5WVkD2tA4v1zF+RGkgqZ?=
 =?us-ascii?Q?yfw5zIzvjA4JaoHEfGrl+pRwXh8s6KHRov67TXSrt5SBp6D93CrsxAYCNo2d?=
 =?us-ascii?Q?Y4Iv8JaFX2YFPe0GZjz0F1S9R/eii9KoU43gcIWqPBVS4v9jxuwTygLHyACm?=
 =?us-ascii?Q?3TYWSHkBQvYbdd0qkJivSIjrO1GnbIuKBJsyR7mZKlG7MBXkZkSTS+3M6Yld?=
 =?us-ascii?Q?GhA7jxJ4EUjiKuDVz/YKxA4RmLdFXX0Mjw69i4aUYOgcdWm0AnWFoZKc5kab?=
 =?us-ascii?Q?MVLQnshL30wRf5p5tMfqtJWmnqII3U3EkQghqgisXNLehW9fEeBCozuV03oH?=
 =?us-ascii?Q?Pi+L8gJL840Nbm1Zk+4bXnebssWC8MYDIw1ceN76t0Ry4+y+Ogc9Jok9Z09W?=
 =?us-ascii?Q?Er2kXcQukbb3k/4BSZ9w5eHWYtMIFOq1J97O+kPi5mnCJvIDf1rc0iXKM0rG?=
 =?us-ascii?Q?DuyvV7C4yxkxS/Kq9lExyZTff/9Eo1pNAsz56b4sbcKQ4/gilj8ukX4HaIYP?=
 =?us-ascii?Q?wuA+e5dF3hHvnoVH8FocV5Puo0JfvUdVaNopWX7FGMY0YAuGEawGzpwfVJWX?=
 =?us-ascii?Q?J/B7m6+wYCTmPJchhiqo5iRrd9ig6pdXAhVgwTrZiQ23yUwoMLx5ZYGwlxWj?=
 =?us-ascii?Q?5TpOkfBJ68fkwOETVO2TThwIJ/JgI+fjFpw2MKdTM21h7RlE2d88y+k1/7x5?=
 =?us-ascii?Q?ujecaeucjZB2aDoh2NWQkf1FIy5RvWbaV0RNj8mGu1nATgaZp9PjwdXyRUg/?=
 =?us-ascii?Q?ulZvL9VKMgwFZXVSsceCp9c5xbtWNSoHFdm8NRzhjDr1YRqkRAhKlz38HIRc?=
 =?us-ascii?Q?mEIBOz6vC/Bkrw/+FtAjZAM6hshl3Mpl3Mmmb4Ims96q6mauJO2TmQZlqyi2?=
 =?us-ascii?Q?M5dGJ8rVf9pYDIChxzKBhRgjD1cPQ8a0F4N2ObjFW183eVWBZzkrAXWEdSjm?=
 =?us-ascii?Q?wGVn0mGPryws/oBOug1t4ZwSf0fLYmoqf9ZMhP0bwefxWMSvrsVLvREiTDZx?=
 =?us-ascii?Q?MSb95q2KPZepg/OKCtcgh4mJuVZVyqsXo3LRb+tRao0dVlRhT09rMdIPhPbI?=
 =?us-ascii?Q?BaHXYo9cq1/hmzRXg4u8Vojb8jFy+0ovXKcJxiuL4UqCSMB8k5g+d+a7xjYw?=
 =?us-ascii?Q?3c0khGBkafKXoAFr3YmICCCJOeKK7L3OGzkqLpMGPNGPBiRTSKiXKhqewiKI?=
 =?us-ascii?Q?Px0JkEh4ToBE56o1s+e8j/KpduFvX4X7RJI2+okcFmPRVGI1fmoPPQVmyQBp?=
 =?us-ascii?Q?gDwhy83lfiAXhnokMslgMPJZP0yZy+zJ7cC4buch3KlTYTAtd/0/iL6Asno+?=
 =?us-ascii?Q?MCm8idtH3VLMGT9j9QBPon2YbeBDLMu1qhluRdvZ1VlztoKyNJB0I7HThyvJ?=
 =?us-ascii?Q?cUrzPr4YTheRfoYeCgr797n7pWAcfRn/AHssuGuQgfUd3yTh0x8v32vG6Hbr?=
 =?us-ascii?Q?UpxTaywQxe8Egd+0ub+3oRUurlcxRc2/N33hDD6xO4jsYgtAejA+AKKGqYXO?=
 =?us-ascii?Q?hAmf3J5q2SfuLPVr1ux9kNO7tRIGjFftdG4s5/lSGIpHxGUB+TLVNbuliPnE?=
 =?us-ascii?Q?dvtalqV8dt6I7QnkJojO4Lfv8m6Xc0ebojep/z0aJSIGFV/DvoTJLujtyUmO?=
 =?us-ascii?Q?ji1EWHPQBUmRvSjNUap/dvWmZYajz2Bg2tnVvXkeEeWPmcgKAJA0W6vKkiWe?=
 =?us-ascii?Q?/RkihVJswGn8poqu5zv+9aj6OXTFknGWpxXbaYDRuiBAEdwWrsnD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0b3f399-02d1-45e7-35c9-08df46b49f3f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 03:16:09.5335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lq7/Bzo5JZW7/sc/NB4QZlq6KAhPQOo6yZySoBAHAd03XsnVnokLfwgtNzf6DZetnY0p2rVZoiFT5HJYUKAbjWBuKTqOaUGGIaaw+MvI/3F2ETpVmy6UyDRDBD9t6332
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10522

From: Shengjiu Wang <shengjiu.wang@nxp.com>

The micfil audio nodes on several i.MX SoC-based boards were previously
using a generic dummy codec as a placeholder. This patch series replaces
the dummy codec with the proper DMIC (Digital Microphone) codec node,
which accurately represents the PDM microphones connected to the MICFIL
(PDM microphone interface).

Using the DMIC codec ensures proper audio routing, channel configuration,
and compatibility with the ASoC framework, rather than relying on a
generic placeholder that does not reflect the actual hardware.

The i.MX943 EVK patch adds the missing num-channels property to the
already existing DMIC codec node, aligning it with the rest of the
boards covered in this series.

This series covers the following boards:
  - i.MX91 11x11 EVK
  - i.MX93 11x11 EVK
  - i.MX93 9x9 QSB
  - i.MX943 EVK
  - i.MX95 15x15 EVK
  - i.MX95 19x19 EVK
  - i.MX95 19x19 FRDM PRO

Shengjiu Wang (7):
  arm64: dts: imx91-11x11-evk: Add DMIC codec to replace dummy codec for
    micfil
  arm64: dts: imx93-11x11-evk: Add DMIC codec to replace dummy codec for
    micfil
  arm64: dts: imx93-9x9-qsb: Add DMIC codec to replace dummy codec for
    micfil
  arm64: dts: imx943-evk: Add num-channels to DMIC codec node
  arm64: dts: imx95-15x15-evk: Add DMIC codec to replace dummy codec for
    micfil
  arm64: dts: imx95-19x19-evk: Add DMIC codec to replace dummy codec for
    micfil
  arm64: dts: imx95-19x19-frdm-pro: Add DMIC codec to replace dummy
    codec for micfil

 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts     | 10 ++++++++++
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts     | 10 ++++++++++
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts       | 10 ++++++++++
 arch/arm64/boot/dts/freescale/imx943-evk.dts          |  1 +
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts     | 10 ++++++++++
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts     | 11 +++++++++++
 .../arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts | 10 ++++++++++
 7 files changed, 62 insertions(+)

-- 
2.34.1

