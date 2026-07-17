Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011048.outbound.protection.outlook.com [52.101.65.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D301A3BF66B
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 12:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290011; cv=fail; b=fgYpUYg5MOD6QK5oGNGrtCQOecfLhvO4tkuncgrcrrX9eYzNmJZ4n/MMkX+dPcF/duahalk/dcq9XsX0IDgNRAmewzu3VFJBOuUQhRqZ//rT3uliqqufEHAOWiyoQbKbqnTBpADoy9olAytM0d3+tMRsffryxeKP91ngphl/IpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290011; c=relaxed/simple;
	bh=iBO20mOIkeQ+BNxxeUJe84jMoafcwYxX1+sn0/75rZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Yg82GA4mf99kpP0o5VspNKQc2WHhkAACiDjjp19DN8PR7dVWzpx5+4myUJ6WFByi60uR6VPKV5Wr8j2o5aziVYIlNFvtazwd3RwtTgOLQRphulp3SSi1/5HeHtmOyq91qJuzaRsADSZHaoayckZpeZJk8ZyPYxPCknMEwRRDdIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fDjWaOD7; arc=fail smtp.client-ip=52.101.65.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fDjWaOD7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PI7fZ0YuMkpMKxexrFAD0eC2fqCgGrXGDdmsqtPH6N2IwizPnh8u5bgAgZVFnivstPri0nJDfVPXMHmA6S5M5iCdkjf6ovfGYz73mnD1C9XQ0XMxVbgZzVvZSsxBx+DAgHQbwRljesQy/MI3B9xPpKzzIX93pmKOmU+UStKx4chptM64IKM3D4NMgTnuNqgY6SGwIZNTvgZbW/ZuJznNbc4pK0Kc6InrdI6CfbPnYhxVBvLwJPUdI5LQleo0pBX3Q8cS/Hx1s6lw2s/L3G16Lnb9b40cT9yVdA/Q+SLzi6uciDlkldIO89PWQNiY06lqMs/vD1R9BIooV6pT/2Lz2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1emgn/47ILomSDWY6IekTb/COWW8oiLTOuIeRTPN6jc=;
 b=D4KgeC9DzOZ6LrvP0uGqHsBe/opFvsefRR0jY11vPKBFSxSBXPmhE6y8c8FN9Sb6sCJrlXWoBKHrCcui4h0Ey1w5j8P1WoLqfyFYArlaTLQggO5qldlpjmtzlOBUDT45rE8JVhfi6Fj6xB07+M7pmYTAkQTBf1GWuEhYR/1IsY2psSTr/YwwEQ+zg+dPaAfdQNf3xGvhNa7qgXAiQ/jU1+B1hRnEQR6roRLR3SqL1tR4JohKwrkGjCsN/19++3IOIKOYF7W69CgFutKPHqh6jdA99Ev84wECP7YnUrctberXDwsTHewo08q2bUYsxgsUUSaCkwOipLptPO9RKHEBcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1emgn/47ILomSDWY6IekTb/COWW8oiLTOuIeRTPN6jc=;
 b=fDjWaOD7KJ+tO5LY3hHBqKBgPHlg9WcmZTlMO6athqxgxYkCKcqnqIY/5DjLJXXD4wHf7dbsLsaphdqHmGZD2oRQzBeIRhOydgZtI7OF2shOBL1Tqx3PyjsbB1iMyjGZuNoe+oXqyauovO8YffgSMEDMZ4fxGYP30D2TZ4Ah9pP0eCMS9jZ/xNPXvRC02zBBEZfpBHUSDyMzlobMqrCdIt0qObfIkm7LshCd4E0hl5vToAC7uENaO0czyHq+FWudaVrS1Bj4zMX9/V++v4RHxTV0a+nbBVE/KLPBB2e+t3fEcozP8vModVoPv3lkRK4HMu7EB7p9+OWLg3eQ5+/YBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by PA4PR04MB7645.eurprd04.prod.outlook.com
 (2603:10a6:102:eb::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 12:06:46 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 12:06:46 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: vladimir.oltean@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux@ew.tq-group.com
Subject: [PATCH v3 00/11] arm64: dts: describe the Lynx 10G and 28G SerDes blocks for Layerscape SoCs
Date: Fri, 17 Jul 2026 15:06:24 +0300
Message-Id: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::14) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|PA4PR04MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: 4319c368-8e42-4709-7bfb-08dee3fbdfc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|3023799007|10067099003|5023799004|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	X+d3T/Q837ZiBR71LjfGGwbm/AyCDD+t1J1YjSq7uapk/yPoPv/dIGX94yZApU7twfqmoeq/T/6jFwb9qyhf+E9rnV16MexcvAcsxxTUOvw9tI4e5j7W2QVdRtvRaMNdVQLAYSA1XcV4GAdUFE7tqV+CB01dylU/qZ+aFeBTEx5NGmNDqdbM16cBunDfNSVo/ByxuCfajyTOpT+POkAKenEi+ytA53Jqq7rexXOqxaiVFpAQgOzQ6ddBiDP8/Hab3EuBjhRKv17E4kG7Pe5ucW7DMsJ51mdyZ7D3jvOFtF3D2jVAa5kzCowAGLUif0JyOfMCZrwi4RoLcr+tSrsLYfe70tYDbwx+WcaAJJfY5mqLSxbXrFUtWM83//W4dYpb+sObf+wvyoeMzDWsIKISaJIt4DNgyQwC1zI9aBDlteeL9VHChtn5Wrg2n0Rvckvck0WsH2tdjXyzWyA66VUYdljUfkaZvg3HvFC669kNlo1A0fWAHVWAUz58F0NzVRRl+KxRkewckW/n3enm4/MKRLDHCVOwWX5Bv1WpgJicEcG+R0+7sZ9Tupn/ftQpwN1rkOo04gQrQMga8DavKb1zetZ1r/Mbz8gjay9cVi3rjlBujrccUVHxzauRMGO+2K5k2oDBH+eIlpV1BdzZS/0dTQR6KkdkCKWh+YS5mN15zGc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(3023799007)(10067099003)(5023799004)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q7gYhTAUDPdRXJ3o1kpKeWFShHSBhIzveaQZ9DHSLyix0aQkd2xfdJldTPT3?=
 =?us-ascii?Q?tuR7LdpY9SeuoyAA4fDCEB5U0JffOatXqRVYpnbuDorpfld6aiA7o8OQ1OlU?=
 =?us-ascii?Q?yRnHm3LJdHfC++zhiyDLgCdU8VT6linQBOP7+rZ2ggbcO9SHxuv6MN3VEkxD?=
 =?us-ascii?Q?HK71f1mW5C79J8h3rhCksziGxlCEPWk5VDFEwCRT8nWV8LWFWevnykH+F/cs?=
 =?us-ascii?Q?wF/8qvAaT16JCgA0kLoMbTIwFGACIz17fNV3J6k9pBhxpg/S2+9byT+mYMda?=
 =?us-ascii?Q?6oreXZQMDEZHr0hbvsymRRnhxXT2NCLEkFl6boXWIGagGVwLAqYywhXQbljT?=
 =?us-ascii?Q?45HCl60TpDU7sernNXDEwECFrFmuMaZZaOW5UbiYCVpcDDPPqs0ntXTgbZXi?=
 =?us-ascii?Q?aGV6V8J0ChhRo/axS/+gfcJTpPZmJRmRNz+ZLi0qozPTfa26g0zBohpmiiTA?=
 =?us-ascii?Q?DB+vFUmWncpcI3Sq0C6SbsNd8/g+jfAw288ruo6WtzUIcxRYJaIykTdIl0N7?=
 =?us-ascii?Q?FsA9afuEhB1H/h9Ll6KJH7eFht9N3h2sp2nomy1fc2MsY5A4dAzJQhZX8mkP?=
 =?us-ascii?Q?r2j/RCrtvksi3RokaGrRWY03+uQGSYjECcOLuJHWGPndlTAGzs7DuioA9BAv?=
 =?us-ascii?Q?DttV8rWVZVBi4MDTPcwXXDjNUSsFFtFySOfQbHh8O8nnYPUnt3jA4yj8lx/B?=
 =?us-ascii?Q?VNXOqjUX4SFG+Jk/X8Wx4VrjgppdGi9VR/AHN3GShqZ+as96CInGUWTgVz25?=
 =?us-ascii?Q?5GcbwcYsFV5kPa4e22bp7I7SmrZZp6RLg/qBlkWAyV5GX963NmGE1Ci8cgW2?=
 =?us-ascii?Q?DC9lxCzDW3m3GUyJ7G5//H9JImrjPBVfnpm1izs+f+ME1E/r956eJVrytkLa?=
 =?us-ascii?Q?hlfcC5joctXgnsn2V4NwIfrkkkbydy7EGgsk/F5WljN0/KsyhsaPvLkiJtzF?=
 =?us-ascii?Q?Af7kKHNL1oVuG40cOFLnx9grT0QLrpb2VY4kF+/hdSt/Gcxih2e3tmZHZbsy?=
 =?us-ascii?Q?ZQh/3sujeNLx8vGAXTmgXqX68slqYLVat/8Zm52azI8/tm5aZjI/pdUCA2Nw?=
 =?us-ascii?Q?BM6G4UUsL+2HpHAA0YgJm1QEY6vdJB/ldISWV6GXXYOCdo5mtK2n6PyqDu13?=
 =?us-ascii?Q?bzQQBYK+bPNxz7rUCNrYaRt5Z98oXPSpbQlEyDrgw/JNWkIvDLSpHnrBgYag?=
 =?us-ascii?Q?HrucQS2TJD9lY2q93EcX4t/y07ghXO1lycWoD7efkuk8FyW9AnJQ3/J71ctM?=
 =?us-ascii?Q?DdRzM/eDEaAIBgsN7kaSPvGpe+3ilwkmwX4/vtQAl3WNP3bbxOHL140qWBLK?=
 =?us-ascii?Q?twoQj6a2Oc/5hDb7ZE5b8faNwGDwc5aMjk1G1O/0e4r3tNNCV/m5Dl7+MWfX?=
 =?us-ascii?Q?BtxmfsQFEwBmVgFwZUwpKBEe+dNeYOqaNGUf4oo8DJE0Y8hwiFk0qUiZ0l4T?=
 =?us-ascii?Q?74gTpCYMqSmT2mVM5D/ASgzEJEQ86eaaK5BWyVDdZA2nQbhdbLkECx2NmTUR?=
 =?us-ascii?Q?keMzjIRyK2+IClf1Dueo6qFEuL8KlcNI2jx/pw04Vdr3UN+gt0iR8K/lLQEq?=
 =?us-ascii?Q?x9brxvXew8H9FKnbI7EH/MrfQUgNhUHC9bz4i0tC1qzS6BD94eA9ZAZjuRBn?=
 =?us-ascii?Q?0mb5JkpkrJz+uA1DO8/Rzl3hWx2rxMJz1aZ4MSpaNJStLnSmydrA+y6fOPLI?=
 =?us-ascii?Q?QwIDB+DIa84rEKFhe7O0YUfr+5O1jLEyZmRDRRBHSNl2uxPb5rYFmwKrawoC?=
 =?us-ascii?Q?vNzynOmYAw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4319c368-8e42-4709-7bfb-08dee3fbdfc7
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 12:06:46.5008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XTmiP8F66+D+PxNNbjecR6bpYiUvDy/gi0QbQBppEx8irIJQ/D1VS69TjwApdjXaYt3V8RYBYWSfY1CC7QLCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7645

This patch set adds the device tree nodes for the Lynx10G SerDes blocks
found on the LS1028A, LS1046A, LS1088A and LS2088A SoCs.

The first 5 patches slowly change the LX2160A DTS support to a new
structure which does not use any delete-node or delete-property
directives. This is a direct result of the discussion with Frank in the
v2 of this set:
https://lore.kernel.org/all/akwAmzAbtg0Ejey0@SMW015318/

Patches 5 and 6 transition the LX2160A and LX2162 SoC dtsi to use the
device-specific Lynx28G SerDes compatible while the remainder of the set
adds the SerDes block descriptions for the LS1028A, LS1046A, LS2088A and
LS1088A SoCs.

Changes in v3:
- Changes how the LX216XA based SoC dtsi files are structured.
- Split the enabling of serdes_1 into a separate patch
- Split the LX2162A changes to another patch
- Move the status property to be the last for serdes_3
- Move the changes to the new fsl-lx2160a-serdes.dtsi file

Changes in v2:
- Enable serdes_1 on all board DTs that has consumers for it.
- Use the proper name for serdes_3 in fsl-lx2162a.dtsi.
- Remove paragraph from commit message which mentioned some consumer
changes that are no longer needed nor part of the commit.
- Change the size of the SerDes region to 0x2000

Ioana Ciornei (8):
  arm64: dts: lx2160a: explicitly enable serdes_1 node
  arm64: dts: lx2160a: extract the PCIe nodes into a separate dtsi
  arm64: dts: lx2160a: extract the SerDes nodes into a separate dtsi
  arm64: dts: lx2160a: extract the PCIe from LX2160A Rev2 into a
    separate file
  arm64: dts: lx2160a: split the dtsi to avoid delete-property
  arm64: dts: lx2160a: transition to device-specific SerDes compatible
    strings
  arm64: dts: lx2162a: transition to device-specific SerDes compatible
    strings
  arm64: dts: ls1088a: describe the Lynx 10G SerDes blocks

Vladimir Oltean (3):
  arm64: dts: ls1028a: describe the Lynx 10G SerDes
  arm64: dts: ls1046a: describe the Lynx 10G SerDes blocks
  arm64: dts: ls208xa: describe the Lynx 10G SerDes blocks

 .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi |  29 ++
 .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi |  60 ++++
 .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi |  58 ++++
 .../arm64/boot/dts/freescale/fsl-ls208xa.dtsi |  98 +++++++
 .../dts/freescale/fsl-lx2160a-bluebox3.dts    |   2 +-
 .../dts/freescale/fsl-lx2160a-clearfog-cx.dts |   2 +-
 .../freescale/fsl-lx2160a-clearfog-itx.dtsi   |   4 +
 .../dts/freescale/fsl-lx2160a-half-twins.dts  |   4 +
 .../dts/freescale/fsl-lx2160a-honeycomb.dts   |   2 +-
 .../dts/freescale/fsl-lx2160a-pcie-mbvl.dtsi  | 176 ++++++++++++
 .../boot/dts/freescale/fsl-lx2160a-rdb.dts    |   4 +
 .../boot/dts/freescale/fsl-lx2160a-rev1.dtsi  |   9 +
 .../boot/dts/freescale/fsl-lx2160a-rev2.dtsi  | 188 +------------
 .../dts/freescale/fsl-lx2160a-serdes.dtsi     | 167 ++++++++++++
 .../dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi |   2 +-
 .../dts/freescale/fsl-lx2162a-clearfog.dts    |   6 +-
 .../boot/dts/freescale/fsl-lx2162a-qds.dts    |   2 +-
 .../dts/freescale/fsl-lx2162a-serdes.dtsi     |  86 ++++++
 .../arm64/boot/dts/freescale/fsl-lx2162a.dtsi |   9 +
 .../{fsl-lx2160a.dtsi => fsl-lx216x.dtsi}     | 181 ------------
 .../dts/freescale/fsl-lx216xa-pcie-gen3.dtsi  | 257 ++++++++++++++++++
 21 files changed, 974 insertions(+), 372 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-pcie-mbvl.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-rev1.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-serdes.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2162a-serdes.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2162a.dtsi
 rename arch/arm64/boot/dts/freescale/{fsl-lx2160a.dtsi => fsl-lx216x.dtsi} (86%)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx216xa-pcie-gen3.dtsi

-- 
2.25.1

