Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2045.outbound.protection.outlook.com [40.107.247.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA12C1B2188
	for <imx@lists.linux.dev>; Tue, 21 Jan 2025 07:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737445316; cv=fail; b=V9T99nKVBUF5B28IoM7W9tHtkVH/cfcKpCLZn9z5ZncUTaOubQirFl+i5Z+uQbRmAk3nboDonv8dTlCjj/at3P7NRkx8XslyD1vWU2vkuaM0bm4lZ9WLirI6B52TXJOOTuppnYYRGzNrmB/PX9f2Vqth115J41LweGPqrFzKNBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737445316; c=relaxed/simple;
	bh=cL/DknDyZCfdp2d4uoc3QNpBdAfhnxloOdiPdpxTpk4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gAi2sdWrxO0a1to4Qs6SMSatYfg7+cwOzy7ywv9lPn/0WZ+Mrfe+BPnr0KxSNU3lkytOOasShp6oqtVONex0ZPJiSE18j+X50YQSkAHe9XE/+683G3XxvmOVdnj6FZMxHX8Alyg9qlBYJYQyJR3gJIQ1IXux6R++YVUwW8CxjEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=e2fLq4vd; arc=fail smtp.client-ip=40.107.247.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="e2fLq4vd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rr3khr+fmF9i+VlU9BsrGgwuqBFML7HNXvAwf293mqiDj9UHGc5DGqzm58p5yNnVdfttYUXBOZI7FDJJlDFSTjc9k47U9RlZ5AknsEjy4N4d5oI2ByXqkcQmZA0EO6bd9BOhp3Q9F4oy3O426rYAgAazA2fXrWJf08b+XbajE7tyy6aJMhH2NGsFVJjyO7c5ToWMe+s/yDsVOnfZAV4izDwnyctEyrFKu0TvsHiRq7TJwHBIHiAZ0DVhYP+sEA4JsVZTTbK8qefwY2lQyh/8DHChl++JL91/7shU3AfTNpuhGC3aTZCqFyiiAJ6JdpYjoVwelUy+tdc/Iwui2Ajm1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LUImQc/Qj9LUbTQF4jeVxMuPRhqvi4Z09e3TCfJk1AU=;
 b=GApfAsbp8gNkuNWaC67ADdQyqNtu+0OU/v3KIalNw9t6cc4jikp7nKqPSgQA+Dr8LQQFaDmQC68YyHx8w9o9LyWbcaWu4rXEZr29fMp5o+8gd0i/ww/vnc+VrnFBn1MaFBrJsjBbT2lijzWhT9QyQOSLTbPi0N0kqneJbyChpUiiRhXZHLE6tx541qVz85zcSmf+VZB3ALnK0/OMyonFSuI0eWVsSpQcBTh6aT+W+OVA/agA979d3NmjbFFzoRI/pGasr1S/emLK7HNAJN+9wQYchmgb1faxI24lj6BkiWntc77/hnNwby1H2qSWtKEqZEsFGYDBN0QmaNgSImhsXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LUImQc/Qj9LUbTQF4jeVxMuPRhqvi4Z09e3TCfJk1AU=;
 b=e2fLq4vdBXoeTkghpN2khFPBiFYb/YtHAJRca9NmbsQxUx4ROol3xdY9hWI9XjUa+en4N732uk4xbx6FirZseqy/VAFjUb/tGLI8eXsr4kTSsWJ6/xzP1rRNh5PX2uGutrV7Iwn6lQKhd7BjIaptvVoeB4GtTPopD858w35TNPMlT11dX+jlZjNOz+1dnnnWWpIjkk9Fr2xsW5NY0IuCyHFaYvYwzPtQM6mLWeiIlborrWre1d8NpjU35mYZQQtFBuJgUTA0VkPYKUCoiAqbej5NWyMFkHYi7YBYGr39516d4j/ymIS1E5r+O3elQhc3NryO9yMQRUdb8F8lTP77wA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Tue, 21 Jan
 2025 07:41:51 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%6]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 07:41:51 +0000
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
Subject: [PATCH v4 3/5] arm64: dts: freescale: Add i.MX91 11x11 EVK basic support
Date: Tue, 21 Jan 2025 15:40:15 +0800
Message-Id: <20250121074017.2819285-4-joy.zou@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250121074017.2819285-1-joy.zou@nxp.com>
References: <20250121074017.2819285-1-joy.zou@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: f3b15ea5-9f6f-4ea9-02fc-08dd39ef1156
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P+hq1X66tkc80VP5HLEPdbrgxTW8WMVRZJ1HRETyVQ79g67ktFxUXUclHXVm?=
 =?us-ascii?Q?uFA9YmViP5PsFg/hH0eHQuIWCRuicfHWThvgl7ml7wyiK/PYmwPQpb7Avs6R?=
 =?us-ascii?Q?HC1IONF+ahMURefyJldW+Ym4Xw7hf8ajv98IttK5u7gWJ03Y39yphkkXyoHx?=
 =?us-ascii?Q?N9CJlx/nwM5Z49fizQQLZxBZacT79/rRfaLhCgBsqn9wF1jyOvt0iMVkg73Z?=
 =?us-ascii?Q?/5OueQPNE2yhb7x7gQpl4jltQcbqjM5lVW9UbGutzvs8anuPM3+mE1wtuxF+?=
 =?us-ascii?Q?wJSh3VLz5oNaL7/26sWfYw7r7RX94jqo2pomUIF5YfNyauL40Tlh1V9Zk1Cj?=
 =?us-ascii?Q?Y/QMu5YG8A9ZgC3uf77aKRWSQOkiVnUHo4ge547ksNwMDY7kmp1Rh+xUmkqZ?=
 =?us-ascii?Q?866TzSqtflpxQuzfU7D2j4MBH3lgpcLcGFTPtRyW0WfkCERBh72d2BxSJVQT?=
 =?us-ascii?Q?32kD4FdG1sg6hs5T+yoDQiMza76EngrG1zTFpI+Ar5V2ZztS5dlkoUtw/sXP?=
 =?us-ascii?Q?i/luKrlbB+pOH+pKdVnVPYz53iwttz3Ptho/F32BCCY4FjPwN7nqTC3dOVnb?=
 =?us-ascii?Q?51aDPNQEiDd3XjaQpEj9XyBCqqBqkepQLut2JVAjRIzGmfD3XoDu7fxc7uf/?=
 =?us-ascii?Q?iqqYhoWwCiu3ie9MP/uXE7ynTjKb/FbXN3aHcLbC0X1NaD37M761v1GJ61a+?=
 =?us-ascii?Q?jc7r+vm38wui2VZ7vnXxqXMopx8yTGRNO8QumrFYq5nKDXpP6mC0SlTZeXES?=
 =?us-ascii?Q?NLcRX8JjndiMkP2fwdcykLlxJU1LT9GLpZ85aSlEnUuAT5deqhIIZa4c9cKy?=
 =?us-ascii?Q?Ij8OZYFzb8nCs9vFAvJt0bBTzUJMoN8plB8ha62RucenTu0OqWEoc07BrRKb?=
 =?us-ascii?Q?Vs+yO67dEQxEx4qMB0RJL6wkuRszzLeBtYeBxD/FNdGbkMUP5csFdoVf8CWV?=
 =?us-ascii?Q?ThR+c6nyjr3CZN419uuDUl9LY5V10AjI8nQf0kB7r+PGhaE7lR3fbW1RAWeA?=
 =?us-ascii?Q?JCK6bsEwHprYYzuxNphLs7CVvwjZeDvshR7YDSQgUdHbaZ/+NND+v08gGfzB?=
 =?us-ascii?Q?r7xFgHpXpU7Q/mDHI8PJwF50eT7Fnnd3/LkBZjGvSu7yDV5ct4cJCjfZTKWQ?=
 =?us-ascii?Q?R0YQMR2wB+WSeRFxhG4cK7quaHoWh103s7kQmhQ2w/oBZiRqVDdYDKG915ES?=
 =?us-ascii?Q?7lF0VdLHw/Xk8Jjb92Lvnn2pwZmn5rUMz3Bik/sP0kCcpndIntuDfO4EX7XI?=
 =?us-ascii?Q?eEJLxExbz5PA/fVc8g3f9awxTtVffWGb+9Z1oJlJdtd/uoyjDEfSl6m7LL1F?=
 =?us-ascii?Q?KHK65NKz1EWPhIhqt4iJ8730uLDEgAaZz/lSPE7T85Z9MAyic3TNXqnu8q0F?=
 =?us-ascii?Q?lBO9ezeEyc7lljK34XYHC13Nh10/v4rGVB7uW9Qa4P4jkZ2LyCE+bjLB3h9A?=
 =?us-ascii?Q?5EecHwNtPng=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jbLoRNuwxR7/mlpsVm7vli6I9q2AHkTa56UFo4vdwJ22uRnD6Ivo+wxzBx3V?=
 =?us-ascii?Q?zVlOmMZ49wtrBC5CPTl+N4g/BpxJTI3nbAya6AIXvWIaLmnUTQd1dJdstTS6?=
 =?us-ascii?Q?T8R9WaNoWR2p5KhvsKJFOTjAbX6bst01P9FvdNDT5sL8FQmspWgpn3BoXY+V?=
 =?us-ascii?Q?UOciF9azKJYK+8qQP8CP/H7TDcVRfuQukNipcbXGtVLpl0HlE2KW/G+qElcW?=
 =?us-ascii?Q?P+vnsL8yzTSyvihHe1nW9mKMg+yjxe2viu6RTXnLtsSIoFEpeW/Tl+6/e47w?=
 =?us-ascii?Q?3JbjP5iI+p+yZxd3AqNBPYGE2HkUSj20uk0OxXN60gV8y1m2Mfs0V9yqi6Aa?=
 =?us-ascii?Q?FcyX4JZHd0YyYZJqS2fpS+eT1aZO1Y+p5jXO/4r64tcSP5ij+W/KplRIwAYh?=
 =?us-ascii?Q?YJWeM+DfWE568uFpvkDDlyPnbhaVsFbBMeppp4qXmYskD9Ur7u15/pKHfrTr?=
 =?us-ascii?Q?pv4DGxt5Asn5+OFBBkKiisxCU5scOyhjDl5dNwVzBnNBPo1r+T24BUi7JQcT?=
 =?us-ascii?Q?sS1IQi+gt6joaxvhdmZ79/tjBAeIudu+WsIMN3SWaWehibV1JqLWyDx3htlI?=
 =?us-ascii?Q?jOs2RYn3Xb9HJQfazwmpP29Shzd5VaszDeMfBns57eV7Mz8i3UzZg84Z7bKD?=
 =?us-ascii?Q?UFDqjOwJCbe/IQ7JyR3wAv1Ahv4m3vMSbPRCf7iYpytvTM60wrKavJa/Bod1?=
 =?us-ascii?Q?NL7cusSqee5sGeDm+t4Z01D1k+pl0gN8FUgfuog0N8irL9UnlwcWyoLj6zoj?=
 =?us-ascii?Q?k/kgAGdLS82pMImeem4NrpBe2l+snEf72YSFhIJ2wOqX2pKZiQ+S39rp1N8v?=
 =?us-ascii?Q?3y41yZlBOrNKLJgOl/rIqgb0j+QUgoe6/Q/ayrTHaO+VL9bsRYldk9WzeFpk?=
 =?us-ascii?Q?W2AgS+z/rxpF4ASNSnzFas80cVgsTXtBvo6/OVdIYXlfcM77mXmwYhWJ/StP?=
 =?us-ascii?Q?9Ritdeh9lVg14cK6kjt85wXb7BRk8J+PbsTSmyXkQ42MCiqZUePmGURFMx4t?=
 =?us-ascii?Q?uw3GV4uKReAttRqvgkDwVz3dtuFHHEQ+0zmeiSZTjrHSsAUKRK0BAZVCN1HE?=
 =?us-ascii?Q?ygL9GvtBfw00MA3AoA5zEotRHQbhq+1PnOU6+ycsHUopPdIiXzpXfbpxdgEP?=
 =?us-ascii?Q?3cpOMZbzci0O57p6Ac9KWPGm2QlNnYCmha2XPyb/pvZlKcPAd0fQWjv6Cd4P?=
 =?us-ascii?Q?WCF5ckVigFTDcuqBT1mH6GamUCksAImOYWjXzoGkpoid0KzMpeUJMIHNaP3J?=
 =?us-ascii?Q?RjzHg+WPUy1buSj6HbUYMb3e49BH3a28Y7kQWLtLAudodN83Yo3QppU8cv+m?=
 =?us-ascii?Q?IA0mVxpSbFVRzB7MJtpWy8zbEEolfasBOCrxsVEwfhQaCRm8i1M9oIW2uArs?=
 =?us-ascii?Q?ZVeO958s3prBhqvYKGjDI4G4RdgBvDzkS6SPbuEUltUpPYUVRXJ3yIS7BpFg?=
 =?us-ascii?Q?sATxSxE3AKeYU+E3WMHy+hwGxCkifRl40gXhv13jbrTBNdm6rmGKjU7JLS3o?=
 =?us-ascii?Q?l4uX7aCTQymM2txtWWScKqQsnBuaWz7hJwK+qS5nxILvjiiX5n+Jh8UhWJbv?=
 =?us-ascii?Q?/SIBd7d/9wEsnWGaveNQah1zssp8yjOfuNAdcsXD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b15ea5-9f6f-4ea9-02fc-08dd39ef1156
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 07:41:51.1249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 16qctpie6e+sc7N03EoZfxkSxUlzsj7hSB3aPQtqMdkReY1H4DuVgT07lR62QsCb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8459

From: Pengfei Li <pengfei.li_1@nxp.com>

Add i.MX91 11x11 EVK board support.
- Enable ADC1.
- Enable lpuart1 and lpuart5.
- Enable network eqos and fec.
- Enable I2C bus and children nodes under I2C bus.
- Enable USB and related nodes.
- Enable uSDHC1 and uSDHC2.
- Enable Watchdog3.

Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx91-11x11-evk.dts    | 873 ++++++++++++++++++
 2 files changed, 874 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 839432153cc7..53496afe9888 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -269,6 +269,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-iris-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
 
 imx93-9x9-qsb-i3c-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-i3c.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
new file mode 100644
index 000000000000..ae6e365a9754
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
@@ -0,0 +1,873 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/usb/pd.h>
+#include "imx91.dtsi"
+
+/ {
+	compatible = "fsl,imx91-11x11-evk", "fsl,imx91";
+	model = "NXP i.MX91 11X11 EVK board";
+
+	aliases {
+		ethernet0 = &fec;
+		ethernet1 = &eqos;
+		rtc0 = &bbnsm_rtc;
+	};
+
+	chosen {
+		stdout-path = &lpuart1;
+	};
+
+	reg_vref_1v8: regulator-adc-vref {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "vref_1v8";
+	};
+
+	reg_audio_pwr: regulator-audio-pwr {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "audio-pwr";
+		gpio = <&adp5585 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		off-on-delay-us = <12000>;
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "VSD_3V3";
+		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_usdhc3_vmmc: regulator-usdhc3 {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "WLAN_EN";
+		gpio = <&pcal6524 20 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		/*
+		 * IW612 wifi chip needs more delay than other wifi chips to complete
+		 * the host interface initialization after power up, otherwise the
+		 * internal state of IW612 may be unstable, resulting in the failure of
+		 * the SDIO3.0 switch voltage.
+		 */
+		startup-delay-us = <20000>;
+	};
+
+	reg_vdd_12v: regulator-vdd-12v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <12000000>;
+		regulator-min-microvolt = <12000000>;
+		regulator-name = "reg_vdd_12v";
+		gpio = <&pcal6524 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_vrpi_3v3: regulator-vrpi-3v3 {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "VRPI_3V3";
+		vin-supply = <&buck4>;
+		gpio = <&pcal6524 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_vrpi_5v: regulator-vrpi-5v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "VRPI_5V";
+		gpio = <&pcal6524 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0x80000000 0 0x40000000>;
+			reusable;
+			size = <0 0x10000000>;
+			linux,cma-default;
+		};
+	};
+};
+
+&adc1 {
+	vref-supply = <&reg_vref_1v8>;
+	status = "okay";
+};
+
+&eqos {
+	phy-handle = <&ethphy1>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&pinctrl_eqos>;
+	pinctrl-1 = <&pinctrl_eqos_sleep>;
+	pinctrl-names = "default", "sleep";
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clock-frequency = <5000000>;
+
+		ethphy1: ethernet-phy@1 {
+			reg = <1>;
+			eee-broken-1000t;
+		};
+	};
+};
+
+&fec {
+	phy-handle = <&ethphy2>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&pinctrl_fec>;
+	pinctrl-1 = <&pinctrl_fec_sleep>;
+	pinctrl-names = "default", "sleep";
+	fsl,magic-packet;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clock-frequency = <5000000>;
+
+		ethphy2: ethernet-phy@2 {
+			reg = <2>;
+			eee-broken-1000t;
+		};
+	};
+};
+
+/*
+ * When add, delete or change any target device setting in &lpi2c1,
+ * please synchronize the changes to the &i3c1 bus in imx91-11x11-evk-i3c.dts.
+ */
+&lpi2c1 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c1>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	codec: wm8962@1a {
+		compatible = "wlf,wm8962";
+		reg = <0x1a>;
+		clocks = <&clk IMX93_CLK_SAI3_GATE>;
+		AVDD-supply = <&reg_audio_pwr>;
+		CPVDD-supply = <&reg_audio_pwr>;
+		DBVDD-supply = <&reg_audio_pwr>;
+		DCVDD-supply = <&reg_audio_pwr>;
+		MICVDD-supply = <&reg_audio_pwr>;
+		PLLVDD-supply = <&reg_audio_pwr>;
+		SPKVDD1-supply = <&reg_audio_pwr>;
+		SPKVDD2-supply = <&reg_audio_pwr>;
+		gpio-cfg = <
+			0x0000 /* 0:Default */
+			0x0000 /* 1:Default */
+			0x0000 /* 2:FN_DMICCLK */
+			0x0000 /* 3:Default */
+			0x0000 /* 4:FN_DMICCDAT */
+			0x0000 /* 5:Default */
+		>;
+	};
+
+	lsm6dsm@6a {
+		compatible = "st,lsm6dso";
+		reg = <0x6a>;
+	};
+};
+
+&lpi2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c2>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pcal6524: gpio@22 {
+		compatible = "nxp,pcal6524";
+		reg = <0x22>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		interrupt-parent = <&gpio3>;
+		pinctrl-0 = <&pinctrl_pcal6524>;
+		pinctrl-names = "default";
+	};
+
+	pmic@25 {
+		compatible = "nxp,pca9451a";
+		reg = <0x25>;
+		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-parent = <&pcal6524>;
+
+		regulators {
+			buck1: BUCK1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <2237500>;
+				regulator-min-microvolt = <650000>;
+				regulator-name = "BUCK1";
+				regulator-ramp-delay = <3125>;
+			};
+
+			buck2: BUCK2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <2187500>;
+				regulator-min-microvolt = <600000>;
+				regulator-name = "BUCK2";
+				regulator-ramp-delay = <3125>;
+			};
+
+			buck4: BUCK4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3400000>;
+				regulator-min-microvolt = <600000>;
+				regulator-name = "BUCK4";
+			};
+
+			buck5: BUCK5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3400000>;
+				regulator-min-microvolt = <600000>;
+				regulator-name = "BUCK5";
+			};
+
+			buck6: BUCK6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3400000>;
+				regulator-min-microvolt = <600000>;
+				regulator-name = "BUCK6";
+			};
+
+			ldo1: LDO1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1600000>;
+				regulator-name = "LDO1";
+			};
+
+			ldo4: LDO4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <800000>;
+				regulator-name = "LDO4";
+			};
+
+			ldo5: LDO5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "LDO5";
+			};
+		};
+	};
+
+	adp5585: io-expander@34 {
+		compatible = "adi,adp5585-00", "adi,adp5585";
+		reg = <0x34>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#pwm-cells = <3>;
+		gpio-reserved-ranges = <5 1>;
+
+		exp-sel-hog {
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_HIGH>;
+			output-low;
+		};
+	};
+};
+
+&lpi2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	ptn5110: tcpc@50 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x50>;
+		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio3>;
+
+		typec1_con: connector {
+			compatible = "usb-c-connector";
+			data-role = "dual";
+			label = "USB-C";
+			op-sink-microwatt = <15000000>;
+			power-role = "dual";
+			self-powered;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+				     PDO_VAR(5000, 20000, 3000)>;
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			try-power-role = "sink";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					typec1_dr_sw: endpoint {
+						remote-endpoint = <&usb1_drd_sw>;
+					};
+				};
+			};
+		};
+	};
+
+	ptn5110_2: tcpc@51 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x51>;
+		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio3>;
+		status = "okay";
+
+		typec2_con: connector {
+			compatible = "usb-c-connector";
+			data-role = "dual";
+			label = "USB-C";
+			op-sink-microwatt = <15000000>;
+			power-role = "dual";
+			self-powered;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+				     PDO_VAR(5000, 20000, 3000)>;
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			try-power-role = "sink";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					typec2_dr_sw: endpoint {
+						remote-endpoint = <&usb2_drd_sw>;
+					};
+				};
+			};
+		};
+	};
+
+	pcf2131: rtc@53 {
+		compatible = "nxp,pcf2131";
+		reg = <0x53>;
+		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-parent = <&pcal6524>;
+		status = "okay";
+	};
+};
+
+&lpuart1 {
+	pinctrl-0 = <&pinctrl_uart1>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&lpuart5 {
+	pinctrl-0 = <&pinctrl_uart5>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&usbotg1 {
+	adp-disable;
+	disable-over-current;
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	usb-role-switch;
+	samsung,picophy-dc-vol-level-adjust = <7>;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	status = "okay";
+
+	port {
+		usb1_drd_sw: endpoint {
+			remote-endpoint = <&typec1_dr_sw>;
+		};
+	};
+};
+
+&usbotg2 {
+	adp-disable;
+	disable-over-current;
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	usb-role-switch;
+	samsung,picophy-dc-vol-level-adjust = <7>;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	status = "okay";
+
+	port {
+		usb2_drd_sw: endpoint {
+			remote-endpoint = <&typec2_dr_sw>;
+		};
+	};
+};
+
+&usdhc1 {
+	bus-width = <8>;
+	non-removable;
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	status = "okay";
+};
+
+&usdhc2 {
+	bus-width = <4>;
+	cd-gpios = <&gpio3 00 GPIO_ACTIVE_LOW>;
+	no-mmc;
+	no-sdio;
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-3 = <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_gpio_sleep>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	status = "okay";
+};
+
+&wdog3 {
+	fsl,ext-reset-output;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX91_PAD_ENET1_MDC__ENET1_MDC                           0x57e
+			MX91_PAD_ENET1_MDIO__ENET_QOS_MDIO                      0x57e
+			MX91_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0                  0x57e
+			MX91_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1                  0x57e
+			MX91_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2                  0x57e
+			MX91_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3                  0x57e
+			MX91_PAD_ENET1_RXC__ENET_QOS_RGMII_RXC                  0x5fe
+			MX91_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL            0x57e
+			MX91_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0                  0x57e
+			MX91_PAD_ENET1_TD1__ENET1_RGMII_TD1                     0x57e
+			MX91_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2                  0x57e
+			MX91_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3                  0x57e
+			MX91_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK  0x5fe
+			MX91_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL            0x57e
+		>;
+	};
+
+	pinctrl_eqos_sleep: eqossleepgrp {
+		fsl,pins = <
+			MX91_PAD_ENET1_MDC__GPIO4_IO0                           0x31e
+			MX91_PAD_ENET1_MDIO__GPIO4_IO1                          0x31e
+			MX91_PAD_ENET1_RD0__GPIO4_IO10                          0x31e
+			MX91_PAD_ENET1_RD1__GPIO4_IO11                          0x31e
+			MX91_PAD_ENET1_RD2__GPIO4_IO12                          0x31e
+			MX91_PAD_ENET1_RD3__GPIO4_IO13                          0x31e
+			MX91_PAD_ENET1_RXC__GPIO4_IO9                           0x31e
+			MX91_PAD_ENET1_RX_CTL__GPIO4_IO8                        0x31e
+			MX91_PAD_ENET1_TD0__GPIO4_IO5                           0x31e
+			MX91_PAD_ENET1_TD1__GPIO4_IO4                           0x31e
+			MX91_PAD_ENET1_TD2__GPIO4_IO3                           0x31e
+			MX91_PAD_ENET1_TD3__GPIO4_IO3                           0x31e
+			MX91_PAD_ENET1_TXC__GPIO4_IO7                           0x31e
+			MX91_PAD_ENET1_TX_CTL__GPIO4_IO6                        0x31e
+		>;
+	};
+
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX91_PAD_ENET2_MDC__ENET2_MDC			0x57e
+			MX91_PAD_ENET2_MDIO__ENET2_MDIO			0x57e
+			MX91_PAD_ENET2_RD0__ENET2_RGMII_RD0		0x57e
+			MX91_PAD_ENET2_RD1__ENET2_RGMII_RD1		0x57e
+			MX91_PAD_ENET2_RD2__ENET2_RGMII_RD2		0x57e
+			MX91_PAD_ENET2_RD3__ENET2_RGMII_RD3		0x57e
+			MX91_PAD_ENET2_RXC__ENET2_RGMII_RXC		0x5fe
+			MX91_PAD_ENET2_RX_CTL__ENET2_RGMII_RX_CTL	0x57e
+			MX91_PAD_ENET2_TD0__ENET2_RGMII_TD0		0x57e
+			MX91_PAD_ENET2_TD1__ENET2_RGMII_TD1		0x57e
+			MX91_PAD_ENET2_TD2__ENET2_RGMII_TD2		0x57e
+			MX91_PAD_ENET2_TD3__ENET2_RGMII_TD3		0x57e
+			MX91_PAD_ENET2_TXC__ENET2_RGMII_TXC		0x5fe
+			MX91_PAD_ENET2_TX_CTL__ENET2_RGMII_TX_CTL	0x57e
+		>;
+	};
+
+	pinctrl_fec_sleep: fecsleepgrp {
+		fsl,pins = <
+			MX91_PAD_ENET2_MDC__GPIO4_IO14			0x51e
+			MX91_PAD_ENET2_MDIO__GPIO4_IO15			0x51e
+			MX91_PAD_ENET2_RD0__GPIO4_IO24			0x51e
+			MX91_PAD_ENET2_RD1__GPIO4_IO25			0x51e
+			MX91_PAD_ENET2_RD2__GPIO4_IO26			0x51e
+			MX91_PAD_ENET2_RD3__GPIO4_IO27			0x51e
+			MX91_PAD_ENET2_RXC__GPIO4_IO23			0x51e
+			MX91_PAD_ENET2_RX_CTL__GPIO4_IO22		0x51e
+			MX91_PAD_ENET2_TD0__GPIO4_IO19			0x51e
+			MX91_PAD_ENET2_TD1__GPIO4_IO18			0x51e
+			MX91_PAD_ENET2_TD2__GPIO4_IO17			0x51e
+			MX91_PAD_ENET2_TD3__GPIO4_IO16			0x51e
+			MX91_PAD_ENET2_TXC__GPIO4_IO21			0x51e
+			MX91_PAD_ENET2_TX_CTL__GPIO4_IO20		0x51e
+		>;
+	};
+
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO25__CAN2_TX	0x139e
+			MX91_PAD_GPIO_IO27__CAN2_RX	0x139e
+		>;
+	};
+
+	pinctrl_flexcan2_sleep: flexcan2sleepgrp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO25__GPIO2_IO25  0x31e
+			MX91_PAD_GPIO_IO27__GPIO2_IO27	0x31e
+		>;
+	};
+
+	pinctrl_lcdif_gpio: lcdifgpiogrp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO00__GPIO2_IO0			0x51e
+			MX91_PAD_GPIO_IO01__GPIO2_IO1			0x51e
+			MX91_PAD_GPIO_IO02__GPIO2_IO2			0x51e
+			MX91_PAD_GPIO_IO03__GPIO2_IO3			0x51e
+		>;
+	};
+
+	pinctrl_lcdif: lcdifgrp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO00__MEDIAMIX_DISP_CLK		0x31e
+			MX91_PAD_GPIO_IO01__MEDIAMIX_DISP_DE		0x31e
+			MX91_PAD_GPIO_IO02__MEDIAMIX_DISP_VSYNC		0x31e
+			MX91_PAD_GPIO_IO03__MEDIAMIX_DISP_HSYNC		0x31e
+			MX91_PAD_GPIO_IO04__MEDIAMIX_DISP_DATA0		0x31e
+			MX91_PAD_GPIO_IO05__MEDIAMIX_DISP_DATA1		0x31e
+			MX91_PAD_GPIO_IO06__MEDIAMIX_DISP_DATA2		0x31e
+			MX91_PAD_GPIO_IO07__MEDIAMIX_DISP_DATA3		0x31e
+			MX91_PAD_GPIO_IO08__MEDIAMIX_DISP_DATA4		0x31e
+			MX91_PAD_GPIO_IO09__MEDIAMIX_DISP_DATA5		0x31e
+			MX91_PAD_GPIO_IO10__MEDIAMIX_DISP_DATA6		0x31e
+			MX91_PAD_GPIO_IO11__MEDIAMIX_DISP_DATA7		0x31e
+			MX91_PAD_GPIO_IO12__MEDIAMIX_DISP_DATA8		0x31e
+			MX91_PAD_GPIO_IO13__MEDIAMIX_DISP_DATA9		0x31e
+			MX91_PAD_GPIO_IO14__MEDIAMIX_DISP_DATA10	0x31e
+			MX91_PAD_GPIO_IO15__MEDIAMIX_DISP_DATA11	0x31e
+			MX91_PAD_GPIO_IO16__MEDIAMIX_DISP_DATA12	0x31e
+			MX91_PAD_GPIO_IO17__MEDIAMIX_DISP_DATA13	0x31e
+			MX91_PAD_GPIO_IO18__MEDIAMIX_DISP_DATA14	0x31e
+			MX91_PAD_GPIO_IO19__MEDIAMIX_DISP_DATA15	0x31e
+			MX91_PAD_GPIO_IO20__MEDIAMIX_DISP_DATA16	0x31e
+			MX91_PAD_GPIO_IO21__MEDIAMIX_DISP_DATA17	0x31e
+			MX91_PAD_GPIO_IO27__GPIO2_IO27			0x31e
+		>;
+	};
+
+	pinctrl_lpi2c1: lpi2c1grp {
+		fsl,pins = <
+			MX91_PAD_I2C1_SCL__LPI2C1_SCL			0x40000b9e
+			MX91_PAD_I2C1_SDA__LPI2C1_SDA			0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c2: lpi2c2grp {
+		fsl,pins = <
+			MX91_PAD_I2C2_SCL__LPI2C2_SCL			0x40000b9e
+			MX91_PAD_I2C2_SDA__LPI2C2_SDA			0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO28__LPI2C3_SDA			0x40000b9e
+			MX91_PAD_GPIO_IO29__LPI2C3_SCL			0x40000b9e
+		>;
+	};
+
+	pinctrl_pcal6524: pcal6524grp {
+		fsl,pins = <
+			MX91_PAD_CCM_CLKO2__GPIO3_IO27			0x31e
+		>;
+	};
+
+	pinctrl_pdm: pdmgrp {
+		fsl,pins = <
+			MX91_PAD_PDM_CLK__PDM_CLK			0x31e
+			MX91_PAD_PDM_BIT_STREAM0__PDM_BIT_STREAM0	0x31e
+			MX91_PAD_PDM_BIT_STREAM1__PDM_BIT_STREAM1	0x31e
+		>;
+	};
+
+	pinctrl_pdm_sleep: pdmsleepgrp {
+		fsl,pins = <
+			MX91_PAD_PDM_CLK__GPIO1_IO8			0x31e
+			MX91_PAD_PDM_BIT_STREAM0__GPIO1_IO9		0x31e
+			MX91_PAD_PDM_BIT_STREAM1__GPIO1_IO10		0x31e
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		fsl,pins = <
+			MX91_PAD_SD2_RESET_B__GPIO3_IO7                 0x31e
+		>;
+	};
+
+	pinctrl_sai1: sai1grp {
+		fsl,pins = <
+			MX91_PAD_SAI1_TXC__SAI1_TX_BCLK			0x31e
+			MX91_PAD_SAI1_TXFS__SAI1_TX_SYNC		0x31e
+			MX91_PAD_SAI1_TXD0__SAI1_TX_DATA0		0x31e
+			MX91_PAD_SAI1_RXD0__SAI1_RX_DATA0		0x31e
+		>;
+	};
+
+	pinctrl_sai1_sleep: sai1sleepgrp {
+		fsl,pins = <
+			MX91_PAD_SAI1_TXC__GPIO1_IO12                   0x51e
+			MX91_PAD_SAI1_TXFS__GPIO1_IO11			0x51e
+			MX91_PAD_SAI1_TXD0__GPIO1_IO13			0x51e
+			MX91_PAD_SAI1_RXD0__GPIO1_IO14			0x51e
+		>;
+	};
+
+	pinctrl_sai3: sai3grp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO26__SAI3_TX_SYNC		0x31e
+			MX91_PAD_GPIO_IO16__SAI3_TX_BCLK		0x31e
+			MX91_PAD_GPIO_IO17__SAI3_MCLK			0x31e
+			MX91_PAD_GPIO_IO19__SAI3_TX_DATA0		0x31e
+			MX91_PAD_GPIO_IO20__SAI3_RX_DATA0		0x31e
+		>;
+	};
+
+	pinctrl_sai3_sleep: sai3sleepgrp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO26__GPIO2_IO26			0x51e
+			MX91_PAD_GPIO_IO16__GPIO2_IO16			0x51e
+			MX91_PAD_GPIO_IO17__GPIO2_IO17			0x51e
+			MX91_PAD_GPIO_IO19__GPIO2_IO19			0x51e
+			MX91_PAD_GPIO_IO20__GPIO2_IO20			0x51e
+		>;
+	};
+
+	pinctrl_spdif: spdifgrp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO22__SPDIF_IN		0x31e
+			MX91_PAD_GPIO_IO23__SPDIF_OUT		0x31e
+		>;
+	};
+
+	pinctrl_spdif_sleep: spdifsleepgrp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO22__GPIO2_IO22		0x31e
+			MX91_PAD_GPIO_IO23__GPIO2_IO23		0x31e
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX91_PAD_UART1_RXD__LPUART1_RX			0x31e
+			MX91_PAD_UART1_TXD__LPUART1_TX			0x31e
+		>;
+	};
+
+	pinctrl_uart5: uart5grp {
+		fsl,pins = <
+			MX91_PAD_DAP_TDO_TRACESWO__LPUART5_TX	0x31e
+			MX91_PAD_DAP_TDI__LPUART5_RX		0x31e
+			MX91_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B	0x31e
+			MX91_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B	0x31e
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD1_CLK__USDHC1_CLK		0x158e
+			MX91_PAD_SD1_CMD__USDHC1_CMD		0x138e
+			MX91_PAD_SD1_DATA0__USDHC1_DATA0	0x138e
+			MX91_PAD_SD1_DATA1__USDHC1_DATA1	0x138e
+			MX91_PAD_SD1_DATA2__USDHC1_DATA2	0x138e
+			MX91_PAD_SD1_DATA3__USDHC1_DATA3	0x138e
+			MX91_PAD_SD1_DATA4__USDHC1_DATA4	0x138e
+			MX91_PAD_SD1_DATA5__USDHC1_DATA5	0x138e
+			MX91_PAD_SD1_DATA6__USDHC1_DATA6	0x138e
+			MX91_PAD_SD1_DATA7__USDHC1_DATA7	0x138e
+			MX91_PAD_SD1_STROBE__USDHC1_STROBE	0x158e
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD1_CLK__USDHC1_CLK		0x15fe
+			MX91_PAD_SD1_CMD__USDHC1_CMD		0x13fe
+			MX91_PAD_SD1_DATA0__USDHC1_DATA0	0x13fe
+			MX91_PAD_SD1_DATA1__USDHC1_DATA1	0x13fe
+			MX91_PAD_SD1_DATA2__USDHC1_DATA2	0x13fe
+			MX91_PAD_SD1_DATA3__USDHC1_DATA3	0x13fe
+			MX91_PAD_SD1_DATA4__USDHC1_DATA4	0x13fe
+			MX91_PAD_SD1_DATA5__USDHC1_DATA5	0x13fe
+			MX91_PAD_SD1_DATA6__USDHC1_DATA6	0x13fe
+			MX91_PAD_SD1_DATA7__USDHC1_DATA7	0x13fe
+			MX91_PAD_SD1_STROBE__USDHC1_STROBE	0x15fe
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX91_PAD_SD1_CLK__USDHC1_CLK		0x1582
+			MX91_PAD_SD1_CMD__USDHC1_CMD		0x1382
+			MX91_PAD_SD1_DATA0__USDHC1_DATA0	0x1382
+			MX91_PAD_SD1_DATA1__USDHC1_DATA1	0x1382
+			MX91_PAD_SD1_DATA2__USDHC1_DATA2	0x1382
+			MX91_PAD_SD1_DATA3__USDHC1_DATA3	0x1382
+			MX91_PAD_SD1_DATA4__USDHC1_DATA4	0x1382
+			MX91_PAD_SD1_DATA5__USDHC1_DATA5	0x1382
+			MX91_PAD_SD1_DATA6__USDHC1_DATA6	0x1382
+			MX91_PAD_SD1_DATA7__USDHC1_DATA7	0x1382
+			MX91_PAD_SD1_STROBE__USDHC1_STROBE	0x1582
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD2_CLK__USDHC2_CLK		0x158e
+			MX91_PAD_SD2_CMD__USDHC2_CMD		0x138e
+			MX91_PAD_SD2_DATA0__USDHC2_DATA0	0x138e
+			MX91_PAD_SD2_DATA1__USDHC2_DATA1	0x138e
+			MX91_PAD_SD2_DATA2__USDHC2_DATA2	0x138e
+			MX91_PAD_SD2_DATA3__USDHC2_DATA3	0x138e
+			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD2_CLK__USDHC2_CLK		0x15fe
+			MX91_PAD_SD2_CMD__USDHC2_CMD		0x13fe
+			MX91_PAD_SD2_DATA0__USDHC2_DATA0	0x13fe
+			MX91_PAD_SD2_DATA1__USDHC2_DATA1	0x13fe
+			MX91_PAD_SD2_DATA2__USDHC2_DATA2	0x13fe
+			MX91_PAD_SD2_DATA3__USDHC2_DATA3	0x13fe
+			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			MX91_PAD_SD2_CD_B__GPIO3_IO0		0x31e
+		>;
+	};
+
+	pinctrl_usdhc2_gpio_sleep: usdhc2gpiosleepgrp {
+		fsl,pins = <
+			MX91_PAD_SD2_CD_B__GPIO3_IO0		0x51e
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX91_PAD_SD2_CLK__USDHC2_CLK		0x1582
+			MX91_PAD_SD2_CMD__USDHC2_CMD		0x1382
+			MX91_PAD_SD2_DATA0__USDHC2_DATA0	0x1382
+			MX91_PAD_SD2_DATA1__USDHC2_DATA1	0x1382
+			MX91_PAD_SD2_DATA2__USDHC2_DATA2	0x1382
+			MX91_PAD_SD2_DATA3__USDHC2_DATA3	0x1382
+			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_sleep: usdhc2sleepgrp {
+		fsl,pins = <
+			MX91_PAD_SD2_CLK__GPIO3_IO1             0x51e
+			MX91_PAD_SD2_CMD__GPIO3_IO2		0x51e
+			MX91_PAD_SD2_DATA0__GPIO3_IO3		0x51e
+			MX91_PAD_SD2_DATA1__GPIO3_IO4		0x51e
+			MX91_PAD_SD2_DATA2__GPIO3_IO5		0x51e
+			MX91_PAD_SD2_DATA3__GPIO3_IO6		0x51e
+			MX91_PAD_SD2_VSELECT__GPIO3_IO19	0x51e
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD3_CLK__USDHC3_CLK		0x158e
+			MX91_PAD_SD3_CMD__USDHC3_CMD		0x138e
+			MX91_PAD_SD3_DATA0__USDHC3_DATA0	0x138e
+			MX91_PAD_SD3_DATA1__USDHC3_DATA1	0x138e
+			MX91_PAD_SD3_DATA2__USDHC3_DATA2	0x138e
+			MX91_PAD_SD3_DATA3__USDHC3_DATA3	0x138e
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD3_CLK__USDHC3_CLK		0x15fe
+			MX91_PAD_SD3_CMD__USDHC3_CMD		0x13fe
+			MX91_PAD_SD3_DATA0__USDHC3_DATA0	0x13fe
+			MX91_PAD_SD3_DATA1__USDHC3_DATA1	0x13fe
+			MX91_PAD_SD3_DATA2__USDHC3_DATA2	0x13fe
+			MX91_PAD_SD3_DATA3__USDHC3_DATA3	0x13fe
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX91_PAD_SD3_CLK__USDHC3_CLK		0x1582
+			MX91_PAD_SD3_CMD__USDHC3_CMD		0x1382
+			MX91_PAD_SD3_DATA0__USDHC3_DATA0	0x1382
+			MX91_PAD_SD3_DATA1__USDHC3_DATA1	0x1382
+			MX91_PAD_SD3_DATA2__USDHC3_DATA2	0x1382
+			MX91_PAD_SD3_DATA3__USDHC3_DATA3	0x1382
+		>;
+	};
+
+	pinctrl_usdhc3_sleep: usdhc3sleepgrp {
+		fsl,pins = <
+			MX91_PAD_SD3_CLK__GPIO3_IO20		0x31e
+			MX91_PAD_SD3_CMD__GPIO3_IO21		0x31e
+			MX91_PAD_SD3_DATA0__GPIO3_IO22		0x31e
+			MX91_PAD_SD3_DATA1__GPIO3_IO23		0x31e
+			MX91_PAD_SD3_DATA2__GPIO3_IO24		0x31e
+			MX91_PAD_SD3_DATA3__GPIO3_IO25		0x31e
+		>;
+	};
+
+	pinctrl_usdhc3_wlan: usdhc3wlangrp {
+		fsl,pins = <
+			MX91_PAD_CCM_CLKO1__GPIO3_IO26		0x31e
+		>;
+	};
+};
-- 
2.37.1

