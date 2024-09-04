Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011016.outbound.protection.outlook.com [52.101.70.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91329126C11
	for <imx@lists.linux.dev>; Wed,  4 Sep 2024 07:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725434249; cv=fail; b=ew6ceoEuaMNO1CcU82aExjXjAyLXbvEwXXbcmg1Vgt0ykb7iPJzONW70NIcanmhWadeAnvDsTQJjDvaoT/7zWjyYE88dCFAhR0QEBNAti8uQLl+VI+rWJ+G4rAbI8ePFj4hT2m3mr+3pEwTVdFxFhysG0yj/OGPsBxt7Ix1cP1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725434249; c=relaxed/simple;
	bh=qbHV5tMpaIMCJfAZumv7FfwXY/WDOp52c86nfffWHEg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=igSZrDLwtlSeyMivx/2hylt1FEXebVKY6XFgPVXF4156WlRh4cZ39US1iWg4vLI6857NYmlWfWcyszFZTHlZmIAUa1oIs8BCED9Z4wOaptJlEYenx+os6E99dryHRHFSlFaxxpqUqLB+mqGOaAc0ffcPorXU/HDkJpuuPAqGTRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=O2C+zGMA; arc=fail smtp.client-ip=52.101.70.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="O2C+zGMA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1sPyNwe1PXfgy8GKKw/mLzdEALNjQhE/RcwO3Lqgtbsogk43fhPH7y+IAKjLMyAFuIcp6jJ/DRXxuLLKLPEdFsdaxgHwD9ppXSRXJ8amY+WCuF9QWb4auswqiuvhfw9FAMcLFPjXJzaxbu2qTIERlQ6Mzo/r5xQknLAuZXvvWsZXGsyevupuTc4QoEZY2eYwtHgYmhbZfFM4MANY7+zBX5Pi3hAe4JJhD7RoEvdp5xMZ3gFDNHiYEfRt1RcLjrw4j4hbWXoZX0YJMS/bCCWVaspIRgja4T5WuFOrltRn9cVniYlzVzHbQdkV0DppeFP3xVPfgGrBGz3sbWwJyFIgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+fHGXX9YQfmsiGJvfLZce8+ZhDOlV4pF6TNH5/o8h0=;
 b=TODfzzGvqa5h+xe7IIZgBeKhyhnuTKW0eBKMUec+S48HOyKx8JrJdN7V5KZHCv/FuxmrB7WVJ/BSAGOAQLTm+snA7Me3XgoAWV8X4MHN3R46H1sYvXMEgIHZpPlQYVo5/0cRdTgYv4XXL5bDlbMRrE6u2NbhoVczldhorSVhH2srZ2d3XLgtSOY/G+TDKIJIbegVyPRUBcviaaG28vI7xxUY/sPFei0YA1lYcWwSAH+gn/3WWhjdqj8YqFU4KSJOMaV2z1Sc7R6DV23AOoWrqW/sdqoUb5iw19KxQLVsdRAVMeyg7+bS2h9hxZ6XsFOJOT3N/s7ilQpFwzWbDAM5hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+fHGXX9YQfmsiGJvfLZce8+ZhDOlV4pF6TNH5/o8h0=;
 b=O2C+zGMAhzuzWuTZbLJOqshwRDpDIaChYumM9f903Cy08385Aqn7/w3qBBr/N1ahtrIiOr0KP69x4EBtUeuHU8eWX3iEzBZ6bKMcBa/5ko0AjpOVQyixWLciSLZP5DjTz1L3lzK8+++DkxZ7GpueC7O4p63MkLmwVOa8XBvn87/TenbURKtsX/7FliE5MJaekhcBGQUkL0tSpxqKVJc7l86wrN6t3t16c3xMNP+ECiGjTIbHI7lkk68nwxEGBv0Qpt5DKpoNSQvG49I3OAbzC1yLYZUTJXl0mAwim20wQ2D8oC8gQno5rYYHh9zSP7By6wmWAiy9u7YYNNhElvkTDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS4PR04MB9623.eurprd04.prod.outlook.com (2603:10a6:20b:4cd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Wed, 4 Sep
 2024 07:17:23 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 07:17:22 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4] ARM: dts: imx7ulp: add "nxp,sim" property for usbphy1
Date: Wed,  4 Sep 2024 15:18:08 +0800
Message-Id: <20240904071808.1565238-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::13)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS4PR04MB9623:EE_
X-MS-Office365-Filtering-Correlation-Id: 7188768f-f620-46ba-585c-08dcccb19ed2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P6dzge5BnRA0VHrLkOHSaxFS4dV+YnU+WqKFG/FtY3+uSO52Yi2iyljsB3ir?=
 =?us-ascii?Q?pDcPU2woEDyvX5ja68balZo9DHYfyUM4B4+gDGgTRJ8RyTEvTN+Z2lHCBXjO?=
 =?us-ascii?Q?FP/N0LMYmZPlBlE4KEwKzXGcKdk5kdlv8+d/fyckkeYrHogV9le11Tg9YTjH?=
 =?us-ascii?Q?BIr+NGRZ0+B0YTHLrIWQtZnam2N4NUTXor0ACD0/Cf1/R3o/9b/Duj0AJ3P+?=
 =?us-ascii?Q?+YeIhPQudAFjtfjhKwzR+//xm+ibFs3tVy1ho8s+tIEAWXjOX5OjKo83UZWS?=
 =?us-ascii?Q?PT03BDTIaoNyTHYNiH/IVujyFcthu6FbY0ZTLYJV+gJ4JpCFWYnz5EPeerNG?=
 =?us-ascii?Q?Ywkv63idxvVu7RZMojr8iz4B6ghCNwf5tjkdmcY024a4HAmwja7LEynje7ZU?=
 =?us-ascii?Q?hVpPk+3YmWDKb37KM/Ag5u79Y590az5D7QdcKvtW0DDZJinmSSpf+FwuTYTa?=
 =?us-ascii?Q?AQbM7mZT+4Qu5csc9BTffveDeKXRq050GaDDwDBFH2oty3OzmLOdC3HisOPu?=
 =?us-ascii?Q?zAKScVPaeWoLv+4MjmrdqeJABJyr0sfVtrJ9wOXilizPPY34StZi/Va/dWbM?=
 =?us-ascii?Q?W0Pkq3OqufnGgNiWb0I39+3CkDkMtDFS2NgnsYNMr3I7qi5XZfJN5xN238tK?=
 =?us-ascii?Q?L12ckjEyTMgVAk6L+BwESLzyWH8zc1pAE0SFrY6q5IQmy/qiW3DziSK/GcET?=
 =?us-ascii?Q?pOZxvvdf2QP6j4p3PBwD0un6yriLP1ocQOMwkGgcrbdDwr8Ww63CbxK/dfgQ?=
 =?us-ascii?Q?tWlUUbsYVbAoT1pFkCh9uGXTqn0qm1yByG3VRNLZ/ual7vEWcFOin8SIaSeE?=
 =?us-ascii?Q?gFMoCU9i50DJ5QO/aymyMgbPFjcIazeBmcnSuEYB0xmiKsh+lFlzcr7EvCPC?=
 =?us-ascii?Q?IyQc43ZPmTI1EOKVat1BT0tZBwIUq3zoThfVWD1YQzLqolpiVJl0Dpc0Umaw?=
 =?us-ascii?Q?5ZCEj14Bz+D8yZ+NoCzoDXP6rpdjDySMfhZpIMSgn3YPtu1Hr+8ebGZC7L4h?=
 =?us-ascii?Q?k3NlfULvEE6Q8Ah8rs1h/pUtFgWF7hD6OHCAw46+zQLbR13oNf8H17bO2G5K?=
 =?us-ascii?Q?RJdmzE12PDrsKvyFxoHJ4O4oU6KYnCpzQVThNehNFAw1sjVkqNNdzetaKUh1?=
 =?us-ascii?Q?6U36Nyy0hOHfwb3/jKdZH8oDGogTlhbxwimfo2cMwxl/b+W/JhNmnX5JBeJF?=
 =?us-ascii?Q?k13KlfswKJgfWeZqpJpaNxRalwaKKEDFokioL0NAC/RrG4UkLotCQCEwwcDO?=
 =?us-ascii?Q?ZaG/Wfbjs8z2hgkCbznkwofjjVjoMs0nPIKz4QMVpYIWZ9us6es91Czn2s2Y?=
 =?us-ascii?Q?fIlJ9vb++52jZ/YGT6auVFELwoV/PjwbFwRhyT2+xlYbhsSHiEb4HnmXQZn7?=
 =?us-ascii?Q?Isbvz0K1oQPTTCs2R+I9Jfn0qX7DczJY8+jqtJ9W5n7u/mZzGQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B4CmNb+YAbQ4jh7ggGy9wkvqGrsFw3U9EBpHDQK0EcOwW9p4/JdSY0Lz64yU?=
 =?us-ascii?Q?5yZlCYwFI/OuFFp7GTrjGqXwDm2wGrQBkiwEifLObbW4ilCmCN3KLaBS5Y7p?=
 =?us-ascii?Q?L8dtR1l3VxjT9ljOjjVueSv3TP5X8Zw5PSBcLnzrgWYZwmvDlOfecS8/Nkt2?=
 =?us-ascii?Q?kQ2N4kYWpbIZwW5sfnR8ZgnQqa3KoxrS48m/UMZ2Gq3TtaqpPtvXUwXJdsbA?=
 =?us-ascii?Q?0c76lLybPhcA26uLG9TwzJRtgbGs/CxcizWdh7rEGH55JG22UQ0sbaner5hp?=
 =?us-ascii?Q?Z/EzPWxxM2/OyXNAs1TCfBn+X8MTQdO6aLa5upY/hVaufFt0j7MFWiNHZFfj?=
 =?us-ascii?Q?wak3HW8Sx64f0c3OugRD1itfIl0TiOLW6eSFEkaDuJnJQJwFMMFgJKRQCFLd?=
 =?us-ascii?Q?EgIHGt1Itnfzkz0eZwc1sTQhL9JXO7m7j0lhtB/Hia++DuSFCqJyZhDyMXor?=
 =?us-ascii?Q?swV/ze3wix2RZuussRYnjmMVmZjXNr3mMOZBdGTZeLKmXdMvUhjk8moTymCV?=
 =?us-ascii?Q?kIquXLlrR25KOnEYXWb6UJQtnYQWJBHNIBsYumm4zzDCxeyJXaGtFSai8IjO?=
 =?us-ascii?Q?c0pq9/bW2bzYuuH59RAfte5/n0C4UYiPHkFm0Yz8XWkwT92vl3gOzhPa6cBI?=
 =?us-ascii?Q?9lM2MI2WHOI80SHLR5X4L3M+CmrZ9YhBuwk8LxS7Ee/nmFJyCdlRNVovDz8Y?=
 =?us-ascii?Q?u8yDLgnLw5FLXXDgCO11cY/EdUpMVsEvehKRg/IpBND2xscojzPdEaDnXjVV?=
 =?us-ascii?Q?bgwHuzJZT7eszLBSL+ZzPR+yni7exPzRc5lYV0/dMCxUXVz7DIAJEznFh61U?=
 =?us-ascii?Q?lt4sQF1VYS9Fdio0AJX7VUx0q6AOZmcoGBUgS7TStMzNDVaXbpyBuLrkEpio?=
 =?us-ascii?Q?O3ArH3Lvog8AV8utelk4tWix23UIPwDEe1ZVAI/YUC2gz+iFHjLEIfhwjZQx?=
 =?us-ascii?Q?1e+87EdMZb61wNE9Qn95es2Fbh8w2AHrTby5JR1tvdb03ABGFTW+eayr7qN7?=
 =?us-ascii?Q?CFyN9OD6rmIkH+bp+e90p4zt4+9OxmqacfNjNC5CqhjB6nlkLJfO+zVGhfnw?=
 =?us-ascii?Q?wz18uZe9KKFBrtu4WeT2zkW8CcYHSSqCqf1obvQZ6x5yKx7DEX5zXdfFAjZk?=
 =?us-ascii?Q?zLKRfDrRDbxFBwI+PYIv6dSVVtl0SNoVSOb27nVXL/I5niIvaWfShgK0HPFh?=
 =?us-ascii?Q?J/nJIEOHfs6VPslKLHoVsh+BAq4ufmt/+/PfDv7b8gv/om+BdMgawl0csPAY?=
 =?us-ascii?Q?HVEHLPb+9/9TMgbVgYYGWT8n9Akp5tQRJslXAFVzT+td6nWNOyR+OJMZPZpU?=
 =?us-ascii?Q?LzI+HkvVtukV+QqqTitcU8FIC27Om62i2MgsaQb9Qibv6+Jtgjcvdmgck57X?=
 =?us-ascii?Q?MiRh4w3QagEWFuJzOS6bnKw7+ZTK9SL1wA9AnwOpd5JZuqBn0rlUieEB1JZx?=
 =?us-ascii?Q?VMi6+J4mTWN+EnS925XZ3wrIsY8Mvs13o5vJfkTI3KInrY3R5JOHJjJf9WvM?=
 =?us-ascii?Q?lTiZY5eAUSK7HgcfG7thA0E0K+cYjnLPExYFcwr33RkpDDc9Lhhgl+eq4OGm?=
 =?us-ascii?Q?L3FGQ5aq+vSkaY6fVxpDc1OwLAQAx9gukX06hegL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7188768f-f620-46ba-585c-08dcccb19ed2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 07:17:22.8489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IIys3lhTF+adaPWOXavjsAzjTqyhNhd53/BENGNlURQh2BVWf8YdMOLMBgz7y/HSbY0I2cSGG2btFDxOdoEhhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9623

i.MX7ULP need properly set System Integration Module(SIM) module to make
usb wakeup work well. This will add a "nxp,sim" property for usbphy1.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - no changes
Changes in v3:
 - no changes
Changes in v4:
 - no changes
---
 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
index ac338320ac1d..b093f2a447ae 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
@@ -214,6 +214,7 @@ usbphy1: usb-phy@40350000 {
 			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&pcc2 IMX7ULP_CLK_USB_PHY>;
 			#phy-cells = <0>;
+			nxp,sim = <&sim>;
 		};
 
 		usdhc0: mmc@40370000 {
-- 
2.34.1

