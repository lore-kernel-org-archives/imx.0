Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012041.outbound.protection.outlook.com [52.101.66.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02035342C80
	for <imx@lists.linux.dev>; Thu,  7 May 2026 06:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136704; cv=fail; b=N5yhR7H7wXCq7zbxcjAQampnRQ9zTOHWNt68X+O7zeUG1YiN1NDPy37GCP5pQZw14ZeaY7Kv/LxFUyQ8nMi4Vhm6x4OD9cE2uUDj4P8BxKrXGnOk9l/WoaPsb/KBiKj7u9ONgW5FtlGYvmLcIVHDe6LeCIo99PtOJ/S5wF9I0to=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136704; c=relaxed/simple;
	bh=lKtj+zNKUru8GFjeZeDuzgVPxYyZEAHz2FbD4XvoLzQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HXC1/Djy5dCOP/SrYk9qiIWgto1dj/joKv7P/X7ABzyG/bQnfumAtaZc3Jr8FU9dpjhUJJ3RIt2uv3EEsTf6kSvqTqewElVmd7S39+gOKvX14V/SFfgOfpaJBKPTGA+kDtDaNg73leJaY6yHtY9why/xRvqPkOPXhcMoHWXrNTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=idbRNM9z; arc=fail smtp.client-ip=52.101.66.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="idbRNM9z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7uERH4Pt/Me1eivj8g+9mts0QD5AVJj+8+Z/6e0beym0fML0fOL6Ve4jC8WUaQNlUqWU/6vk9RQtCuaPAxptWsyPDQUzM82kD8wnIf/9pRlu2dVshh8uVCYkjSjXBttxqe/m5/d3uRpbdauW6X5EXlo2vLTDQ5ktenOn27Ch9RuMLYrfqU7HBoSMQ1W6ipdRheCsma4MfczwCg1v2wENXnESHQuQiWrIhubYss+ITSiJSfmMIuUh8EvMvl4yXyC8iVLcmiIv/wZX7Kh2bPRgnBxLAzhXVhTj22+0BBRsize5dm/RphEhZaFCWlslZdQsxe5B0b677AQKjwWn/f3cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AxxvHwONd9P+EaQUZPZ71WJ3EiYSNPVYWMxFUC/phOw=;
 b=tR4/ftf8R0JndQx5vJzGakp00RlvWNj7GJZ5qN2vjIUJokYheq17U8bW3gAGepbqO0WKOTYd6BpEmtLTuowuPcVzG/4iH63BcV2NC5p6+IpztmODAZ6idOXz/7Dqz6bWrcIYRlZzHYSfqW4D9gWT7ruQt2MljgPrCwoANgRI2kd0kHp9xQrlIXpk7kbwliQv3ELbz1yO6wx2zdeaOPAdTtr8O7dYSYKsjhkCB9+TAWWfQ1kSxH8lXszu97dEvn3Rvpdi/EHYAEo9H2l8j67Fc5Nv/WvUevT+dsTPij2d3evXuSl5ovN3oqCsLE0I/r7G5T2GiTfjhQpwhyAPkWQ7kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AxxvHwONd9P+EaQUZPZ71WJ3EiYSNPVYWMxFUC/phOw=;
 b=idbRNM9z6KauyW+bJoHIToxzRd6hrjWIsQMjFLsZ2iZPCxGfFTNOoc4pUSf0EdIQYEZEKv9hMU/rdXlansK6td1MWSZmwI2DHISaf25UxSHwzboWOEahW0lYzZt6Ug0EcM3yPpt7ZMlEJz7Sy8/PvSLehMtVThDimWXhrb+/rH9h2AsukUsw34oShq8bhIbEhJlDgsc2LWdrWhLSBwx/YY7SSezoPIU7Olp68A6dW2lIwd4qbFfuglfV8vPdhMf+7PuUk6o2JPYz8qi+aDJ4fJl4oi/AtB0thuzG/MukbBSazZ6VWkit2ugDrcoI4DUtYn3ECc5d41aqc7CNH9MFHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by GVXPR04MB9759.eurprd04.prod.outlook.com
 (2603:10a6:150:111::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 06:51:39 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 06:51:39 +0000
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
Subject: [PATCH V4 3/3] arm64: dts: imx: Add common imx-m2-pcie.dtso to enable PCIe on M.2 connector
Date: Thu,  7 May 2026 14:53:30 +0800
Message-Id: <20260507065330.516142-4-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260507065330.516142-1-sherry.sun@nxp.com>
References: <20260507065330.516142-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0054.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::22) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|GVXPR04MB9759:EE_
X-MS-Office365-Filtering-Correlation-Id: d66775ec-5272-478a-8b68-08deac051715
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|19092799006|366016|376014|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Kct6JDl4NuYDpm02G6JVVythqMXoD7Ou0rZ3GlGM5bFUuRAttTnEwfXs4+GzEavbWsEepbH0EbeBv0cZKHi5SanntWjBK1ZPAkhyTY93NM/h1Hc8sa9YiNReqVDgxOa3nQHlfWfE51ng7q4IeR2ZcQRXrWQbBEB0uZRbeY/2BOTJjqqzTbGWPt8eb2cH7ph7zcQAxqGqFA8sUjhoCprBWaYxp1YcsX/i2aZf28BBwm96/rvdBykIK7aN9Q2Kec2Pt/ESBzsnBftqVJo8H31ChX+ijjWOOlHW0IRb3pgCnzpXLUu5VYcc5/poXWEugjxwqbRpID3sYA8Xd1VVKWMBF+5bWbtsa4O1DsPrV7s5SBRlFGHL8T1w5PmvNOU4mHEbUYgBtWK2LfsFuvQKoPcl1F5PqT0wtLb9bzyWft1HhFzPCfvWP70ueygsRhE7/eplt5ddqcK+/hu8b/pCMi5JJuiLYToHZjBkwgTbLVdh/HrUKLlZkmFUxPOH2+ZEE2DyJlNew9ccvdgkr6Q/FT4tQDwu+/KnuhgFtUMRS0OMZkJe2CAFtS+/q2xZ8eBifAYVGkLy1HfpiMM89p6y921nymeO85ubBXYP08oj9BkF7CcXFwqRehcVuCp0+LJt+0uLq2BT71b4upWdKIIf+WBjI2atZ44NB0dKm39Ri0nVuRbfs/LMgWbBdN5B3CiBNYl+dTjjSAI62c9PN3wgsBkhcfBpSXA8PvKUgsVap+8SMHtFBLYtY+2OuSVBuFrZHaHB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(19092799006)(366016)(376014)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wT/uVoQOuwCbsah4KAy8oE7xMVxA1NsngSMjzTmEIlyxo0ZYEOCYLR9fxuSG?=
 =?us-ascii?Q?Ou19tpyI31oxMYMwmMfhtkEqV67+1FrpNjM/YR37ApSCoszxFjO4EHf8GRCT?=
 =?us-ascii?Q?MlUGkqiZrHbXhRZc+mUm6e9dhOPjGQsEe9TZ7lDMb9wajmMB5DlSbIBivUzS?=
 =?us-ascii?Q?XLS8aIRaOj/m6W50SlJhRnGUJNO8+emo/rZtTt0548OBDn3bWQUmdliXYGsQ?=
 =?us-ascii?Q?ygyqTlSanfORQW71t1R9QFxkyykn60LfOtavIe5Z0MAVcHhT8+cBZWBEJ3w9?=
 =?us-ascii?Q?/FDQTbTl4DcKBPUMj/8wFOCnn4GB5EFHQi/pXtJFm76LEhP81QlRuoYtmR54?=
 =?us-ascii?Q?2K+Mw2XjXmvec/gYVDY5FlqO8I24nj0zYlWzYPq2D5T99RPXhVu/8umCiF1v?=
 =?us-ascii?Q?tEjf28rROt83y/AKJS/qUyPDqkePcW2YRje2W57p6le/FX1Uj34mjjQY/sWf?=
 =?us-ascii?Q?qEz4eIlqHumihsdHPsPDHLJEi3oF/TcAGkYLN1wll1IjxcRgLHpfbDKl3MvM?=
 =?us-ascii?Q?1Vh4suR53DGQ5BMvLvuyt1syBDrq89r170v1ab1PZuZaWfAZiYRnA+rrS6f6?=
 =?us-ascii?Q?jO6SQrSi/g6d+Qwr4JG2ZdBwHQK3uSI6wMm4pNuSHsRdnztPjq1d4lri4toN?=
 =?us-ascii?Q?nlNd+3qd+x6RkOq/X9gpymjtUwI/V2mZCLf96jfzhKxPsCDCarpn+02fLxnL?=
 =?us-ascii?Q?0e4RyxhSpY0nKiku8E2CY68G5FGPJQt+BBddo7B2sJqu9mglRwPIYdE/3ARE?=
 =?us-ascii?Q?UhxX9Eso2RxednPe1AuF7QCv+GzEDisvmHCvSHJksAfV0iJcdfVTqFf4WI/A?=
 =?us-ascii?Q?p0DXsYvB9dMRh8ufGMVd0hyF7DvgXZ0I0x3ZPICqt4RezIyUg0MJCqLk7b8f?=
 =?us-ascii?Q?T02WF2NX42HkoLxltmaU8uJGBwaIlTUfMZn7QSR2nGlcoUgs1J3u0/Cfaaf7?=
 =?us-ascii?Q?S0+VoU8rspFJFGr6XWH4mbJkylrNyipB5TsJk2cRnusY3EMG+BpQ6zqkCC+N?=
 =?us-ascii?Q?twk4/oM0yOwDMg+kOVtbPLjhOvvWcIwLsuDChVXbw0ginJll8MmJi4fr1rbU?=
 =?us-ascii?Q?LmVCXoNAgZJqmKZIz+ux23tTyRq6PpOHBZJI8VJuD91aLTdWw6wR+4Q9zCqI?=
 =?us-ascii?Q?WNxLxCSv8agQ8xVtkCNlxhtVB1O0SsmUZHQGeBcBjKXOXTQatK5wYaOwh3si?=
 =?us-ascii?Q?wt116ZCpfFTQ/c+PbwXD5QI1rwzFsWxctbu7e8Gio3q9fyeXbIXXnvFZ1Vg2?=
 =?us-ascii?Q?PRhh+2C8s2wcehB4vzVwlei8N9tnbpfxqibk11u+iozJ2qeFWictaud31MBq?=
 =?us-ascii?Q?1EwBTuGFf2itSqsWCxOFqyTYfzgiQ99yny+BoXWn3LH+3K8yN4erfe+VNePg?=
 =?us-ascii?Q?+o00KBVKkALYV5TAraBhLjn9I8XlU60/l6zoXzgQgMheGFzMa9FZFW2OeKON?=
 =?us-ascii?Q?6uHpc+RO26XLvxDA6ftY61qbdjHAuxHDsOnMdxPM6KJoRj99GVG5XWUSjamH?=
 =?us-ascii?Q?0Dcj0IhqM5BzOH5G+DjG1DlDZ4l282XjaDtYl22IVPgz54gFZ9pSuVe6wWxV?=
 =?us-ascii?Q?7741ltrgioZkxp60VXTctDMTz/ic+ZHOej8smNyYEweV1pfd/bFqzZZ4766W?=
 =?us-ascii?Q?k2B9+0ChDkunoUyfpthA2zE2LRLFFgsh+3OOex5DrWiB40ltsQzo4+iXs9SL?=
 =?us-ascii?Q?Jni9/VmC9QvHqQMpZGvnh3kQ5O37TnrGkYVRfzQVGzzB/FOH8KvV6YqXU7Km?=
 =?us-ascii?Q?dGPUKqyY5A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d66775ec-5272-478a-8b68-08deac051715
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 06:51:39.6836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 77G0x/f18z9jRI4WcMp532WDjabnC8N2wcVkFaHKgBxnwfMTf8ABlx9xh++vuN0H+kf4irW0DWjqPS6pIP3dSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9759

Some i.MX boards (i.MX8MP EVK and i.MX95-15x15 EVK) have M.2 connectors
that are physically wired to both USDHC and PCIe controllers. The
default device tree enables USDHC for SDIO WiFi modules and disables
PCIe to avoid regulator conflicts.

Add a common imx-m2-pcie.dtso that can be applied to enable PCIe and
disable USDHC when a PCIe module is installed in the M.2 connector.

This creates the following DTB files:
- imx8mp-evk-pcie.dtb: i.MX8MP EVK with PCIe enabled
- imx95-15x15-evk-pcie.dtb: i.MX95-15x15 EVK with PCIe enabled

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile         |  9 +++++++--
 arch/arm64/boot/dts/freescale/imx-m2-pcie.dtso | 15 +++++++++++++++
 2 files changed, 22 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx-m2-pcie.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index d8378ae07093..56110c1e695b 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -360,12 +360,14 @@ imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-
 imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds1-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-lvds-hdmi.dtbo
 imx8mp-evk-mx8-dlvds-lcd1-dtbs += imx8mp-evk.dtb imx8mp-evk-mx8-dlvds-lcd1.dtbo
-imx8mp-evk-pcie-ep-dtbs += imx8mp-evk.dtb imx-pcie0-ep.dtbo
+imx8mp-evk-pcie-dtbs += imx8mp-evk.dtb imx-m2-pcie.dtbo
+imx8mp-evk-pcie-ep-dtbs += imx8mp-evk-pcie.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds0-imx-lvds-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds1-imx-lvds-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-mx8-dlvds-lcd1.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-pcie.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-pcie-ep.dtb
 
 imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtbo
@@ -530,7 +532,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
-imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk.dtb imx-pcie0-ep.dtbo
+imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
+
+imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk-pcie.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie0-ep.dtb
 imx95-19x19-evk-pcie0-ep-dtbs += imx95-19x19-evk.dtb imx-pcie0-ep.dtbo
 imx95-19x19-evk-pcie1-ep-dtbs += imx95-19x19-evk.dtb imx-pcie1-ep.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx-m2-pcie.dtso b/arch/arm64/boot/dts/freescale/imx-m2-pcie.dtso
new file mode 100644
index 000000000000..1930de058a08
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx-m2-pcie.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+&pcie0 {
+	status = "okay";
+};
+
+&m2_usdhc {
+	status = "disabled";
+};
-- 
2.37.1

