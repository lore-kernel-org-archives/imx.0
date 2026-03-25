Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010071.outbound.protection.outlook.com [52.101.69.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB09224B05
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 08:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774427444; cv=fail; b=ECW/UHbevP/EXNnRxMPRGr4EiXsneDQEc76BOCsHYBeO+TJcuNS2VL+Frn+ErRsAwPtLjAYKlQ91rmj6frzNv2GR3TtRD1QJYYeRGlqIYrbnXdjNymyjP9aH4mjY0TbjVd7pZx2eDLbn4iQG5aHfLcvhzuSR51yQXLMBbazEfAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774427444; c=relaxed/simple;
	bh=uivByxKKxd/iHqrv4mL1Wdz5fWnS95E2hGuBvA5u1AU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=QGcQYxLgsbde6ol4tEJmhiWFPRzKa+f5W5uJvlIkOsPAH4uNVB+Gs5IaJf4XTDH17W73jwUsLwnd8NprrIxifPPTXwRDOF3KPfHRUpFnhF7bmU8J/fzdV98V9UPZnbM2/DB4DKegzjLbaQ7Nwg29qCt7DJcZXLk5x2254BSAA+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mlQlnsyD; arc=fail smtp.client-ip=52.101.69.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mlQlnsyD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uyml9AWjtFg5dFKIN9RwmBs1nac7i30VG14kQBdtYWSGO6k5rhObSqzbwZTwV8WkcBlWOC2uTrig3rpAIfOCppt5MxZT2x7h4BGjEbVtv/7sXVJpkDaszpeIrP09HqDdN4ZlYPs5r3fG4TH4aYWyPUwV2ncbDI4MltWUd2Gc1z5vIpIsE0m33EolrDP3i/MJyKTBe9/YpN8iQOYS/evtZ7NOFh2jPKEXyu1ROH/CoRlkK75X7XupKOCL6zWP1d9RznvyIvLqUU+T4OB49Ak0m09EqRQHOf73aJt+kDgUDG4WNT1tE6sA6z4E1d0KJfqs5ZYaK+kNr34xlu2aFuw6Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8WtWvakaoFDgbKGfWvkRgtMotvTgdm1aSKOsTfj3rw4=;
 b=HPhrUklt+BPBJWfPE6B0IT96BY36N1bHoJm+CR2y4/62RiQuAchUeAuUR+EG3sz8hQhDbNBeyAwcPEgFRw6V3s/HgtCUh+Blkr/pID2mqR3vLUQgquCAsnyWbV9WDLGxUyo8YdDbPAlh92wO7GkL5+1FF+elbn09YGZLFT2ArTyGlGIfKZYkbSD8VT1hg2W1q15//LFnh5/HUOZ+tEaqj9/UhJXIFuoJNdbUOA3NhMiJmaCdi6MPu6m79jsRqIgC+reV7o8wjlams/VMSyXi9/jI803T8xQtG3cslbOCyEoMWx7E0REV5O76iGyLqvHcXyqqufsd/QYu1cuBZHsnew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WtWvakaoFDgbKGfWvkRgtMotvTgdm1aSKOsTfj3rw4=;
 b=mlQlnsyDqtwuqEaC88BX2K4iQ3QHG0dgAyddpWGW1Sj4rM1q7HnwQCiWrQBhvFVTTAgTux/s8fBsspN1W/5zuaxaF0L6Ui4+Jcy33V2YZmrkXjdNAcm1iI1kxZ6eyU0/u1OxNLEOoHkYzTnJgMhoEPl2X57AVDeeOZxT7ggzbEHHg5ROck2Buvigu6xwnlWJrhBPY4yHz2mdSNHRas0Qs4hq3PAO9xj8V0KN3AqVrPfKtPXBOQRmBS72PdFWMCacdKFDu95JDfMSD8aytkR2/HXuL6O0HUoDa1/6wHRX5cM3r1BUhz9Bj+MXjnPmKaefmmK7n6m5C0CpT1zE6JgY2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by VI1PR04MB7054.eurprd04.prod.outlook.com
 (2603:10a6:800:12d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 08:30:38 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 08:30:38 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hongxing.zhu@nxp.com
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 0/3] arm64: dts: imx: Disable PCIe by default and add overlay support for M.2 connector
Date: Wed, 25 Mar 2026 16:31:58 +0800
Message-Id: <20260325083201.2637520-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::12) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|VI1PR04MB7054:EE_
X-MS-Office365-Filtering-Correlation-Id: eac143e0-3d92-42d7-955e-08de8a48caf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|52116014|7416014|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	ISJVNm2qNUat8MhhSeEntuJ9C9/bKEAASQaW+UMcCbmyo8M8bMo9srgaupT2yI6PMjZM2lZ1YOeDZM8zWxZMItU2OsNjJg2BKwt9fmX9ppXkVSRGCZSgaIZ+BOWAOG1f04YR7E5i1VuoVZ+9dZXid19NkWgtnpdcgYB1L4XHwZGoHWII77Vep6ARQcAVfHXnJSHo4f9tZw6uLR5by1h5MSBqHN/6AITC8bx6e9baNEhz+QMjg3lA/UAlGN8Sd9sZtbFE70ba2QeqdHng66bBlKPF4GpqEz3m1JIAhuLd5iYvQ4yBHGG6Y798VckX7PFrtxHX2mTqJ2s0GQV9fDH6SQN8ztqlKUyM4TMa59TRyItLKl8je29KDF/Ummv/az5PcRobmQooO5uA9Okb+SwINFU20o69xlllC60HW3nGAW5JoOLXku2JdZ9zVEtf7Z1cRfQOMpG6AQ0F41JdqQOs36mwVvx0B6/IDkV2TPZgqd+Y+UpNnynIapJ9UwcWUcK/CcF1bP0ItyzRCd2Hw6NMqmR+BIOro+1OvCQd2npOTIEgE3vkN3ptY30FUInfU8gefwoGUkpH/SG+Kl/Nb0s1mUJN1RbMwFXZm6R8WGuCNNQUCYZ2toXW+7fvU80ovOjI9pe47PRkUneOxw5NmtH7fyRNzcAN8yHX4tYEJ5CzE3K7FWUCBEko3CIiABmeQ5kVbM5Oltnre8aam6H24hMtHmV86wm/rEFKpup8OT19rQt/r75SggkzsByt6rdLYlKS0A+I37uMXuGVNb1M+d46ayuAN+QIZBa9w8pL6nlZu3U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(52116014)(7416014)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cYSIUfFcZmPwOGH5N+4Br/ogpqc1OPVQgJTs2Wg0P81P5UCItWFrpZmvbdyM?=
 =?us-ascii?Q?9A4X05GvZ0ruk0VXVR9fNVCjwFFxUGIF2pc7Y3T7VL/J684lw7thD7ZjczWZ?=
 =?us-ascii?Q?PLRERA/jgNgyghVgFdmSICUuY8TMJ6PscKIUKWd649VoKEiVRyombybB2Hbp?=
 =?us-ascii?Q?LgZp/GP0ElSbEgHQ3jCJUd1GZbLnubu3vl3KZ9Y2/D3sn4QAYsKGLzhaOjZx?=
 =?us-ascii?Q?eSBJN1VhqTkTFUX0KEyyeMVrriodGJfw9HJx16KLozVnDICKgjqCru6Tpt7b?=
 =?us-ascii?Q?Y72Eogbkws5PFjl2vc3dPx54wCF6mhpr794o7TmZ363eeJqD7XDZg4pRUpRN?=
 =?us-ascii?Q?S9s8dXdeIGWFmHZSEDHqdvn5BK2lcHO3ugA8YccE8xQlc8hSV2hrktBqeNEU?=
 =?us-ascii?Q?t/25vsdQEaaisM8DKaIjhTGDJpEOXoyCKkXzt+Uc4PKQWSZmO7N0zw2WM6p2?=
 =?us-ascii?Q?OMR6iljV2NYrI83i6PVEFSxIl0vDMGs52e8aqpLeKlW+dyhZbQH3WxQ351oZ?=
 =?us-ascii?Q?OHVTt+sPxyOrnXcWQ+tNSOQngKCFQ/Z3QiEIW0VX05apQ3aZuQCL5CpWSQNs?=
 =?us-ascii?Q?xyXRqjwyKErwX/ZwV/JvhKQ0nv+6KyFUWxrQknN55zkZbP/NyKwjJ/NWgZ6u?=
 =?us-ascii?Q?iNYAR/NUSgeJP3Zy7pZF2Ucyy4LZrfIJyRq9OKrHrsGiKrWq2gQnC+UXwHHy?=
 =?us-ascii?Q?+qAFtbK4BIAW7O4hvGadWnBtcTtvuuEKkf1w8jSnRDCH8aP8dGS9m85lm2Ba?=
 =?us-ascii?Q?sv+lJwy5JQF6Vc3sxuGSr7WbYZfpVCOuQXvpX7wHo20qJWdQLAq+BG2DTKFu?=
 =?us-ascii?Q?XhI0AX5s3uOJTIf1oqOsGwRzpIhX1DVuuCkwS9a6Ki3t9W0B8QUjO2heNjOH?=
 =?us-ascii?Q?E3OOLlhFAKr/RsYG7BDWHXcbPuNi2bxIv2S45M1Jz5vWdkSYfTTiO2uMTYm7?=
 =?us-ascii?Q?EZARa5WO8Pwd2yRulrOpoRfCpFYZTt2uCqnDsAl+JxKNn81e4YymFqmej7d+?=
 =?us-ascii?Q?nHekpiAJaaPwIsqkB+8v4zPoJVzW0LI14ltzlBpXDkFWPpA7KRfIZWmvDazD?=
 =?us-ascii?Q?ALI2DYL3qUFlBc7KeIzlUqFnFTSNawKKLLhs9A1z7WBdRaBW1IlzZNaiiuiH?=
 =?us-ascii?Q?pVESPaCbz7E0/p1gqDcG//8SNB0n6V2625WI0N/zSK/FU4i2/45hHhua7M0+?=
 =?us-ascii?Q?xbiy/GDAtoGpig1t8wydFoQgPvq15TnNTKW/OGfdvqcSV/IPYfVeiPc0CtPo?=
 =?us-ascii?Q?Ug3I/0rGwRjRc1QikhQ3OXnmvPwAo0Nw2jseMLsnbEk832ulHbgJG7O/os11?=
 =?us-ascii?Q?pX/wlZNkYyY0CZ6JQBnYj5Pj1mbmFjFwlmWNkielKH8JtUglXxihQTNJuGIY?=
 =?us-ascii?Q?SMZP1d43G8ZS1odHrlpcLhW9b87IvH5dVmwrAbJUEJXMhNP8w3LV2LVC68ua?=
 =?us-ascii?Q?12a16QgWHN1Atl0tI4cJwlli+iFNBalpsnHoosvSxnjw215n9DFYx7eShxnB?=
 =?us-ascii?Q?/oBbVol3KkI1Nq1NorNNfqROcmN9ZuL5Btgx8DFeuZMbegFMQ6DWBVIkJN5M?=
 =?us-ascii?Q?17PwdhdKIE9VlvomdCcFCfgvp21eAbfK+GgQSbewvM9+WiDe2gJSQwZ2uS0w?=
 =?us-ascii?Q?w8uaRP/Lf50XOR7bg/UJUaj6n7C/58iLIZouqxIqr4iwVHR+WwLz8LSY1EvE?=
 =?us-ascii?Q?3RTnMmirjjH+U/YLsgVQY4/N/UnYS1yduEXEPLV1Tx1CmbB4ODKHXqLjFWHV?=
 =?us-ascii?Q?bfZsx45a2A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eac143e0-3d92-42d7-955e-08de8a48caf0
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 08:30:38.2511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KZE02XHkxJrGwQ+qGyD0EISnE/Zu1sq2f9qrvZfrD2DIcMUgrXF4PS0h8guDkiVmlBVp7BokzvE3/0gqH1pXcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7054

On both i.MX8MP EVK and i.MX95-15x15 EVK boards, the M.2 connector
shares a common regulator between USDHC (for SDIO WiFi) and PCIe
controllers. The non-deterministic probe order between these two
buses can break the PCIe initialization sequence, causing PCIe
devices to fail detection intermittently.

The out-of-box module on i.MX8MP EVK and i.MX95-15x15 EVK are SDIO
WiFi (IW612), this series changes the default configuration to
match the out-of-box hardware (SDIO WiFi) and provides a device
tree overlay for users who need PCIe functionality:
1. Disable PCIe in the default device tree
2. Keep USDHC enabled for SDIO WiFi
3. Add 'm2_usdhc' label to support overlay
4. Provide a common overlay (imx-m2-pcie.dtso) to enable PCIe and
   disable USDHC when needed

---
Changes in V3:
1. Add a common overlay imx-m2-pcie.dtso for both i.MX8MP EVK and
   i.MX95-15x15 EVK. 
2. Add 'm2_usdhc' label to support overlay.

Changes in V2:
1. Improve the commit message to clarify SDIO WiFi is the out-of-box
   module on i.MX8MP EVK and i.MX95-15x15 EVK.
---
Sherry Sun (3):
  arm64: dts: imx8mp-evk: Disable PCIe bus in the default dts
  arm64: dts: imx95-15x15-evk: Disable PCIe bus in the default dts
  arm64: dts: imx: Add common imx-m2-pcie.dtso to enable PCIe on M.2
    connector

 arch/arm64/boot/dts/freescale/Makefile            |  9 +++++++--
 arch/arm64/boot/dts/freescale/imx-m2-pcie.dtso    | 15 +++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts      |  4 ++--
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts |  4 ++--
 4 files changed, 26 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx-m2-pcie.dtso

-- 
2.37.1

