Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2073.outbound.protection.outlook.com [40.107.21.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A641F1514
	for <imx@lists.linux.dev>; Tue, 28 Jan 2025 21:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738098989; cv=fail; b=LgH7dO77/a60CrkyB0Rmh8L/XO5MLTc64hk4ucNg2vmPrMELwjSTEP7fY9pUUQolFHa//VI1bBQUnhOfo4/NMn9A+Wwcb+gnf4YHfVvAmHM4zY0NgaQn4OpeMxqiNf5Y1rCdFTQkwORODVM3GZcHdnYxPbCsqoYM5lJCaFUHgQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738098989; c=relaxed/simple;
	bh=T2AwA4bXXbcWoxw/hYGw6i/KTMieW52565VYVSvCHoE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fPk/44NezsyvT0HKJumGThvEUEzqiekN69x2dnvfDvC+iajxBC+/iZLV2lBMBTy4DAt4qZ3CQVN+R72OEmLzGmwrNOTsmc5hsECX35pvihX1PqEmZa5q07toF8FBmB9AZjO3KQlV6wMIfkAPY6cJ0mPDtL8OngrHQB/Qkj8BspE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JxZR91eF; arc=fail smtp.client-ip=40.107.21.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JxZR91eF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wHvpH0HJewMDcyW+/U+EPI6NcHyo8c75w66Q4ZxES9jTpveiQCy6HRGnwVhMi6Chiij+zjPcgAfwJvOIWeKsUcrmOuiK5TMb3+U19cOJsqYWpJF7dXmkYGZlv76U2QrV0NTRXcJ0PeAr5iIJZTezTbePs14C5wjLYFUrP43LQFl1dOV9bgwa+fojtZK7RamHC8HlmXbHxO6YwA+xrdNCshE8hYOT92jseEF8nc6GgyDlmcZQ1HfkuuVTWrkIRODDdsvpO0rkjCc+hUqjjfV3hFpLOnpiNYlvnQJo8GCC9QG9ucImrhhxnMxPvW4NTDiQ7ibi6DQakbmmN3Cdi5tdyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9ju6L9Y97oThTQ3TAswFI/MbXwMq/vygrgzs5iGJI8=;
 b=LR0MIX2xJ4X5eKoqSaiWKnDs2uPjmk9UC1KI3YgY09PK5qVdj7/s2C0D6LeDVEjEix+WGOFAzUKmiJFJYOpdd0POlYBSWOIvUXOly8nqXrY/+MtJA17nRvZTd2VkDTqCPXukzgYXh0mhFB1pYMyJLVg3V1yul7+0tAbjaBSoqygJ68PsZnjbDRCUlifAZiyFFEj1wOmCtBghzUyqdUBRTBveIdcTkHqoWZ9P7INQFsxS+PDpUAZ2C+uPd/T7GrNjZSWcFMGTn0UThj/0NQba6q5hw17SCOCQve5qhyx6Xcb95uttQqM3qERUOr6IG7bPX8ZxCr2KGEglHudRPH9X8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9ju6L9Y97oThTQ3TAswFI/MbXwMq/vygrgzs5iGJI8=;
 b=JxZR91eFtzEYJkDk9qWF5R6k37TlK5f7OqnSfcldPCmvjugl/8uhXkBYi/6Os1yDsG8B/+zLv8WcPK0DzwGx/nxZVp5GX/eIcHKcTratJTkxBEYsJr+fevHFDV0KQ3iiIkQtrVOKYOLD9iU5Deuv2pXjCfrSc3LE2CHLHdscZ/s++z0nlWo66xXmYDKcgLVvsylh3uiadt6wkrrro3t5+MMp0KsvWXDNolQiM1ZgnaBuKTkY7HebZ5z5O0FRSdbDEkTmUb/N9RfxnQp6k1TRgkD63QTm/EWnvo1CMNFIfEqa+JmIrwDB5uI+ihehNoyS+GyAw8kgPkfXuMcUpZP4rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8490.eurprd04.prod.outlook.com (2603:10a6:102:1de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 21:16:25 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 21:16:25 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	hongxing.zhu@nxp.com
Subject: [PATCH 3/5] arm64: dts: imx8q: add PCIe EP overlay file for i.MX8QXP mek board
Date: Tue, 28 Jan 2025 16:15:57 -0500
Message-Id: <20250128211559.1582598-3-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128211559.1582598-1-Frank.Li@nxp.com>
References: <20250128211559.1582598-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0229.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8490:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fd5c840-06ed-4619-805a-08dd3fe10572
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|366016|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mHX4EhDY5JMIkjdJsCG8YEbKyYkHOAsbBh6d+T9GWersTeejc1/lD1GpkI5I?=
 =?us-ascii?Q?X7974SSMIqAO1txmLLNq5Au3HOU3pSb/9SceJP9bv7nH+czF9uIXOXfzTtmr?=
 =?us-ascii?Q?LZ2gdhhQ/x3CnlrOrkqGrQOoBwf7kUzhm7wtaPFBkmJg/9p5QiVDi3yEB1At?=
 =?us-ascii?Q?UwS5+L5kEnFKcV6m5g3uUbrg7tESz8dnyg2oRmw4FpBgimu3St28sWkmVU/k?=
 =?us-ascii?Q?62gJKMo0F5J4JJY1fgQmFL5V8CEhfh0bo3LbsE0FeLuyorqwvpZEWlAgDGOz?=
 =?us-ascii?Q?3EtjeHgziVOb4DJ8BizmVvsmGudx7rM8u24tzgNgZx3DjRVX15YSV1CnF+fk?=
 =?us-ascii?Q?CmTs4e1oUL5DXLApr/LeIZ6r1ZtiTlcs5F0Z/QcZidXEKTdox/anogb76K96?=
 =?us-ascii?Q?LkU+2qqx6sYVfItD+vt5KuhWjhNgUy8+QUxjtg6SZcUvO3feNwRHDzcEiEX1?=
 =?us-ascii?Q?mOtNhxJQQlK3/MsRpLVNJZ5uC35ckaL5/jrpJiURu9ZeNew55c67yDFdn8NA?=
 =?us-ascii?Q?iJ8MU6vG6d/4xwzT2kM2nelM0lpAHA9sQbi+hKhF94tezQMYF5UqIVndfqgG?=
 =?us-ascii?Q?Y9QXl6TdpMiBT8R7A5nEoB7D3pyoNv0WaQ7LP/ZqNd0XzkymrPBnNlPdR3sL?=
 =?us-ascii?Q?bS2loZ3GBOtJGNURtLc6+UmPeiGRlDOJaFqUiLS5yJwM+FxEJnRbmjoScmHK?=
 =?us-ascii?Q?qDgDWAL5hp3JXWBPHKfMh88+YyZ3MJSWZmLXnYAucGV3ByRRYCinxJZQGQWJ?=
 =?us-ascii?Q?PYP4nNYF9VoSxm4q5SHsobET+wPRicWnXx1md3abaqi2nRMWeU8sREWPRsSr?=
 =?us-ascii?Q?rqcQd3E7GEv9PX596eF4+8ReRqsxYwa5lVmfLac7PoJofMFbh0EqHqsoZ5BE?=
 =?us-ascii?Q?yGURntXBfIB7CvDippBvSDieKSt3UkpgtjETfHci61QBu8N3Q0knR14BFRiO?=
 =?us-ascii?Q?aWouSdtNkrRJZkiCn6evRhW1d0U+X7yuqmCuBNAGdXZorkCZpNEtqQUo4Ofd?=
 =?us-ascii?Q?43SP+hRjZEvszKNpqFHIMUpt5Q0NfC5I9thaYTMwXzwh4ICWai+NDaTsEt9p?=
 =?us-ascii?Q?T2KxxLSgYhPz9CAArr1FMf+qFMSFcFLlAFyf4ATQOGMIRWSf4VlsAKknBbEl?=
 =?us-ascii?Q?RR4tjaddYTGCiBcJExo7XGxHYqbnW0amIzXjo+jSd/vMTbNnKRBJIFDTFjJ1?=
 =?us-ascii?Q?pykeLamO0W0FUfNuKiMMP++GiNVyte9tA/ci+jz0chycrqIU9GBpF9UGCrZf?=
 =?us-ascii?Q?OHnuQmyjL8i9ACO4lfpsU2MRkeYzQtiAxFpYfRb1bZMNpORDiz26MZ+Y5mSW?=
 =?us-ascii?Q?MWPEYHEiJ4uy4HnLvS2GuCkasrU8QlL+KiUWTGa91vwK2JBNG7VPUjPSSC/L?=
 =?us-ascii?Q?S9cGAWe4ijxmCJNpBHE50XDqp6V71TjIAnxELS1RMre/OvWPykXePmg0BNnU?=
 =?us-ascii?Q?X6HdJGm0SuJ2bc1OcsojteNOOV0HM+Cvy/1lEInWZav/quMb09JtPA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(366016)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k8q+rxY7OMrpkoQH1BExLm/Nr2hkONBQOYYq5MUDI/WHjuZC9G8sU8Iir3Ne?=
 =?us-ascii?Q?3NzRSYaeqq3+E4PwQKkw6mpadq9uNIjTTcl7Km8gkTIc+VumMFTo0D+k0KM7?=
 =?us-ascii?Q?ZwdYkJ3SHS8QOlclTps9RzaCG3dl3ZiX34/gDQeCyk/12uRjPzZ6Aaz8d9i0?=
 =?us-ascii?Q?gBC6U7sA+ePAoaQ5i9csPT9jSvzUq0J85NcjJSCHFSz9tg0qkCNrmjmif6io?=
 =?us-ascii?Q?kBIF8nzS3v02gxYnoxiMY4UtP8vIi0KXaR1XFMgapdB9jnsyAlLGHGWCboPK?=
 =?us-ascii?Q?bTZIt8JDwFWDF2q0owT4iCeOBVP0tOHK4JXE/kF+ds/7928GGSA2g1aiQjte?=
 =?us-ascii?Q?1BTntMt49EkqWmdCVuj3QgMbgYLw0QjSzMA27ZbYd58d5hbhGxVbdbujCtS1?=
 =?us-ascii?Q?zByQTzubgy26NCPGn2KziB5PlvilEyCldz2H3BmiJezINWPU+nklHJdTyITD?=
 =?us-ascii?Q?hnTjMWUdad15/5pwW5OfBL8xbHXtqG07d/e8HbnFa6faMQV3p2WJVJc/0OOt?=
 =?us-ascii?Q?7aVJozHA9e3LvUTjfMbW4aqa//ztVrM3pOd76lj1vmdSHVEkF5NgMCxu2vh6?=
 =?us-ascii?Q?R/OFXJPmplpHUUWko8eeJ3/4jN9JVgWtOLE6bdQZJaDhO9dGxGC466wcvoFP?=
 =?us-ascii?Q?vHtZ/unWMIZjHHU524EmpxBliwtPFaN2Ir3+b93co1lV0R4/wRaZOWtfzW/z?=
 =?us-ascii?Q?omlFjDKX7OgUadJdjgVj++AOHAfksR0XLv+2nCq9rmYjNBZ6mnGPKlpOj4hG?=
 =?us-ascii?Q?aHb1klSuYVF9oGxuWTp1pHFZdrZYG2JH7irGVmSQA2EawKuWTpETwW11VPlX?=
 =?us-ascii?Q?bwpXGpvaBu+/5PS1oD4cbQMLhis4F4aXJWXg751poT9Jk9WouPM6qsT7Q+2c?=
 =?us-ascii?Q?SVpVBgpDmsiQmFSB0qWRAIG7GKJxjCgStEaxoJVZU8ga6wHGarXT4wb9KQn3?=
 =?us-ascii?Q?rQmCydzDHEjh5w6DXwydFgqgJWFnn/CNUVd00YK3BrCO3yxFu6vt6XMCKUkP?=
 =?us-ascii?Q?HVce/5mfiaK00JFQyiqwNPBA+o9tpSS3WN7sti6Z+m0U/n9rlgRwN0xpfexa?=
 =?us-ascii?Q?SriE4vqRoupPDhO32x7DFuD+Y8x+HBpQC6Da6zjGh2AzHpF4tWbsTj1Nhyu7?=
 =?us-ascii?Q?50MxkmITnlQT0o7lg6mjEcpIeojaz0+1vEvPrvuyWFhx5bJyAHCtj7UiWFPE?=
 =?us-ascii?Q?9p/h8qRqpglyVclf7bUhBU6r2sxQCbfGj14VhJPGza5ld6cL3vGCUc+VDlZ2?=
 =?us-ascii?Q?3O5n4i3h5sy4K8SsoAfXuAt9UffIvtD42njUU7Bqpb7mMjMhJnVAWmpaPf7c?=
 =?us-ascii?Q?P0G7coRJwu3HXzCWeuh2lOHbgu53A4XGXeLhlUU8SM00ZnvwVltlsKQgSoxu?=
 =?us-ascii?Q?MO85p1+jGzJHFzRGBigAQc08jSBW2OBVc64NEPkfGAupG6lp0CB44i8BgJ25?=
 =?us-ascii?Q?iqBWnLeRJw9WmBv7eEYpltSneaJSyBNWdH5CyYgOXC6OJ9ynf/UYLoxI6cU8?=
 =?us-ascii?Q?Rm1I1b9zcbr6nAGN+MULWiZVNSsTpHXx7cYwRvuu8OcnY1HVeOcNIs8/oril?=
 =?us-ascii?Q?FXRt1k0A4Pr0Um3UUG4=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd5c840-06ed-4619-805a-08dd3fe10572
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 21:16:24.9644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ov8/C7H3hcOjq5x19nbIme3Ro6NJnUjql7owBk6YxZlCIQ5gKQq84sATTqMabultPCP/I8UZHtJxtmEkr1juGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8490

Add PCIe EP overlay file for i.MX8QXP mek board to let PCI work as endpoint
mode.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  4 ++++
 .../dts/freescale/imx8qxp-mek-pcie-ep.dtso    | 22 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 839432153cc7a..9bd32ec898c25 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -267,6 +267,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-eval-v3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-iris.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-iris-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek.dtb
+
+imx8qxp-mek-pcie-ep-dtbs += imx8qxp-mek.dtb imx8qxp-mek-pcie-ep.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtso b/arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtso
new file mode 100644
index 0000000000000..4f562eb5c5b1d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtso
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <dt-bindings/phy/phy.h>
+
+/dts-v1/;
+/plugin/;
+
+&pcieb {
+	status = "disabled";
+};
+
+&pcieb_ep {
+	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
+	phy-names = "pcie-phy";
+	pinctrl-0 = <&pinctrl_pcieb>;
+	pinctrl-names = "default";
+	vpcie-supply = <&reg_pcieb>;
+	status = "okay";
+};
-- 
2.34.1

