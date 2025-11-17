Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021139.outbound.protection.outlook.com [40.107.130.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AECF19CD0A
	for <imx@lists.linux.dev>; Mon, 17 Nov 2025 12:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763383534; cv=fail; b=KobvM01hDcSaPd/dcS1imnua0cz39+9qDYdMMpSvtL3EQCIcuQWNXj2JBWzsMI7ZTi+oe7XnXvsXMqxA8omqUJ9IVwIoL5Jff5cj6LG/9PyuNM21KKYGI9ofn5IcLwmVVy3xa/xwhyiCsVz+ayhzOaglmmnGqvm+6/6Bbqb26Bk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763383534; c=relaxed/simple;
	bh=oVf+UnYXn2q/3HQPPqcVzOwhoOhoD+yp2n9skDh8IOk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AvdpseQN4OVXFIObKuMgWw7wX3oiJqBzLNjz0Dhau2IdMxkh4/feSTU0rKztMblR24XZjNouA3G/rV/BfRcEM3vZBpuzaS0qBqEM2Wql1KGgvjYHbFcojqew3rYG2Wg9q8H0Cgo8vsV+Dwaoj/2LHTXseMHa+ALuTKeEIMqaRBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=bNzgcoZ/; arc=fail smtp.client-ip=40.107.130.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="bNzgcoZ/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVjaCaB0kqpZDL/8GR3u2nb5L/TfuUCZNv3OoMVI+RoYD3XjYsAfgRum5b4a29e4QbaK56SgwMLPK9qW6wYTtCEkXH4TbBKTZxUHW5mUBbdFjFhRhuzhGdbFJOkunMx6d9DFhprZDzt+nQBULC7rFaf72ifi9NTadtcSRs1bCjVxjarYn0Uc4X9har9JyM3UXHpXzB3DH4uoaX3wmC90LQbbu7N6lwTICdaZNLOEt0vAnEqTrzEW8VDowiNUSGR57imeNXzM5CJCa18QCem42wxZXykIKSDdKObSKQGH7ZYRLvXiT4infStsnuAOlJ6Ld02Y/Mn7V3/lcRvY8JJO8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9PvuG8wQq+wwgY2Z6CKpr9vIJIsacXAL3vmiUmjcIw=;
 b=VnoVSMel0UeLdg+jD27cHbOePheynGvcIY3LLrchJRqz8dhONhqvi00g75z2eaMtbNRXgEg/LjXybaL3eCMEG2NwFcT6fi0fsZp/Vkd7z4lCsfRj3FQssR6EPOW0pFePf2f3EG2H39oPV0vhELDYRizi3eZMQlIHfNxaYUBhc9ovk8Rzs/sqjjnS7fdRZnAyLxMupvqLppbPqD/Pnkh7f2j+KZtmNpoogRR0VFf2KcjktMc7CfFEdIPAyTfI6IaR2iIXPfTAy3KDiOTFwFC8FQ7ZXpadKJ/iOL/v0zH4n4H+bShJr5ySZyT5MkzVTSlUV461HS5fb3eVUKpo4aGAIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9PvuG8wQq+wwgY2Z6CKpr9vIJIsacXAL3vmiUmjcIw=;
 b=bNzgcoZ/dwNZP48Y57kWDWnLVq4RWdwJJzLXFi6vBJ46QWgH4cVS4OGg+1M9MdRwQYX3zi2BVLvNuUPui4jwOhMRDUuLqKwC9+dYLMuWbRZxKXUCBJnSoSFLkr3xBz1GZ9p3RrfNqI/MgpTxcmX9JPKXUWRYulhT35AvWqqlNZvK0d0xG9xf4Zs38bZJNq1BoxtNMAt+ZRRlYXZYvkRpR3sEy2idLrFBnWoB3jvPRbC42+qDHkzNqpAsTWkioBEGLAsYusqyCrQq8La+hu1uBpFuBdQApq4+q6qQ76F/DzVWdsKhR9ZO884AtM9X7vE6vfOElb3JchDPTiUEeDTb9g==
Received: from DU6P191CA0056.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::17)
 by AS2P195MB2248.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:59f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 12:45:26 +0000
Received: from DU2PEPF00028D0A.eurprd03.prod.outlook.com
 (2603:10a6:10:53e:cafe::38) by DU6P191CA0056.outlook.office365.com
 (2603:10a6:10:53e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 12:45:21 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DU2PEPF00028D0A.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 12:45:26 +0000
Received: from llp-varakala.phytec.de (172.25.39.183) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 17 Nov
 2025 13:45:25 +0100
From: Yashwanth Varakala <y.varakala@phytec.de>
To: <shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
	<festevam@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<upstream@lists.phytec.de>, <peng.fan@nxp.com>, <y.varakala@phytec.de>
Subject: [PATCH v2 0/2] Add and Update display overlays for libra
Date: Mon, 17 Nov 2025 13:45:13 +0100
Message-ID: <20251117124515.26675-1-y.varakala@phytec.de>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0A:EE_|AS2P195MB2248:EE_
X-MS-Office365-Filtering-Correlation-Id: ee6deb98-f0cf-43d1-cd1e-08de25d72eae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J3zaMbA0ZsIdLHFHDkS+953yVx2i9z3V83MoCbv5DDMBL7Gu6xklUpAQ41VA?=
 =?us-ascii?Q?PV+J3UN0h6XKi9/EK8/BZ2rYNTHonotALgQdjlFfEpGjR3KauAjdrTx75AFD?=
 =?us-ascii?Q?sNjwHE655Wi4OBsIeRNd7ZSYVYo3yk2u0SRzh+0yqNPzHDeKKTmQfwncM5Ah?=
 =?us-ascii?Q?bdWA1v6J+1YT0Lvu8zvD8TGiUg4sfwOphF4tISqARY4GIl1Ecug1Vd4E8Mly?=
 =?us-ascii?Q?aI1WyIVBhYhazzFnxs7k9yLFYr0O7undo6RI9FDZKIAbcF/NR3x7ExG1CLUA?=
 =?us-ascii?Q?HwZ/yMSqndKAXGrRa0Z/w5dR7UgWdAUDbi1CwQlhVqvOmyDbmMP7YFlSxmdJ?=
 =?us-ascii?Q?aEdfekCZvSYQyRLw6uQ33xdOiP4XyQZl3qG8b/6Za12A52xBPoZIz5csuysB?=
 =?us-ascii?Q?1a7sv3tPwpO2+4BhwDBNSPJXVc+MDMqZawAHhm2CR9qrBF3oOQmyXC6ZwO80?=
 =?us-ascii?Q?VumWAKyViiDDjAacW7UvZTxV9PqPZy/+VnPmJWYeHE0MV75Tlb5qcc1t9VXu?=
 =?us-ascii?Q?T5/tlg2J3vyrMFCYYEtlmKsoz2dVynwPIEsAs9k6ug/AyhipVeq2YD9dp4yh?=
 =?us-ascii?Q?Mtyz+sDWIwueiZFogsRUGYdVs/yegNvot0ZiJiKse+qI+TLEAqBwBtoyU2Uc?=
 =?us-ascii?Q?pwzi8m4I/Lgrxm3RnuyLmdurdgB4VMQi66zcmUOoSlU0DTCcubhDPu9k0aKa?=
 =?us-ascii?Q?9S6VTotVrYtCh5PspXESLMc4O35qlzbEO8443GYQXz+qrWEm6kNgm4mjE7Xh?=
 =?us-ascii?Q?1aELw7daCKIbyP+XExp0BXguw8k/xr90gYXfH2lqQsQs6Ord4bFSZsxoFYdq?=
 =?us-ascii?Q?oXdqaWc4UYFk/MV981luBAhoEqd2Z4cYyCFfp4iF/RvZMbBO+NC63P3ryPJW?=
 =?us-ascii?Q?KftE4ILLKwG4/qHBh8QZOSCONu6n3229RhVqbBx9dz0rCMXZ0ntpE/jJ53Ye?=
 =?us-ascii?Q?+N7S+WJHqK/Bg9EpUXIT+qGPFuNV3Qpao5ZYQxLg7sfQVa2mrAGSTe8kyc+N?=
 =?us-ascii?Q?mnJPCgB6a/wjYRg1PE/MIN49xhCd54ax79iyxqqOiICac9n8VBVk97LZF/ZK?=
 =?us-ascii?Q?oAOq3VuLcts1w0MV+1UNGgsl8C6u5MQOMWgC03DuIr7oCxZrrBJVV0vuKG+T?=
 =?us-ascii?Q?sVE6hI0XolkLvm/kzAtcArZnsAbUvgvlVEXA0Ms08lxelaId5LmYSS8rMWRP?=
 =?us-ascii?Q?01fo2ku8eIhVKmb0S0bTSysPxnv24/pR4VBihbGz/863ObQpHNCGX0HOQOfB?=
 =?us-ascii?Q?bRdQE7fkW6DOSPjWbXx3cChpvtJQpwzPzShJ2zsEMiohdepQ4SqBpb84uRON?=
 =?us-ascii?Q?0dfSd7aqVJgd6bIoS1WkiGNPrin0qXYl+PMnDC8ZL2dO4tzCQd7PJxUcOvDp?=
 =?us-ascii?Q?UJ98IlJpyN/oWBW6kJDcar4eax5PtO0kSsaREoCbmaeRrGwIwyzQHsUuyG5Z?=
 =?us-ascii?Q?sE3LsjJVHPOVgqfoYNVxLjCDbhSuOJTVYXjovoHEVarLe+WfbTGsBAaghoSi?=
 =?us-ascii?Q?m2VCYb3sy1KdThmBwVP797VENNciDc/SjRVMG1LjYdH337/QvIfQuX+BvJRW?=
 =?us-ascii?Q?m9VwMJxZGSEoFGccXXo=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 12:45:26.3845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee6deb98-f0cf-43d1-cd1e-08de25d72eae
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0A.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P195MB2248

Add ph128800t006-zhc01 multimedia dispaly overlay for the onboard imx8mp
libra. Update panel node naming style in etml1010g3dra onboard dispaly
overlay.

Also add the PEB-AV-10 expansion board overlay that can support audio
without the display.

Update panel and backlight node naming style of the i.MX8MP Libra RDK
devicetree.

Yashwanth Varakala (2):
  arm64: dts: imx8mp libra: add and update display overlays
  arm64: dts: imx8mp libra: add peb-av-10 expansion board overlay

 arch/arm64/boot/dts/freescale/Makefile        |  11 +-
 ...8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtso |   2 +-
 .../imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtsi | 196 ++++++++++++++++++
 .../imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtso |   9 +
 ...ibra-rdk-fpsc-lvds-ph128800t006-zhc01.dtso |  44 ++++
 .../dts/freescale/imx8mp-libra-rdk-fpsc.dts   |   4 +-
 6 files changed, 261 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-ph128800t006-zhc01.dtso

--
2.34.1

