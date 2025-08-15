Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012067.outbound.protection.outlook.com [52.101.66.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E097D2FA0C0
	for <imx@lists.linux.dev>; Fri, 15 Aug 2025 09:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755251292; cv=fail; b=gor7oJytCb5b+63/ZUXGdRoEsN7HLH6juMjHvZYIAfVn4Yoz2sFUxj5EPGF/5PN0BS0S0kcSUbW26n6ybGEw1nFWmMPDlHWGj9y0e1GpKyighfkgrntc5/gvRQOzyZkPNOIzabUf77NOcbtCHw9Ypnp+2qyTHOC4QfBh0O5WLXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755251292; c=relaxed/simple;
	bh=rjSf3ZdWVz8hYEegkQ650TuMGI47g7pph17R6yZyoyQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y5TEWm9W/nXkf2mKubSZVm56OkwX1v8U0YRibyHql+U2P/sBJD41UWoQRUOetShPts01FekDLSlk9m/Y5JP/2OO672T/RrrR1KhlhwOqqW2eR3RxMzLrOFT8vIkFlV94LdFXeSDSTUTjiAE5zpmVlzuKt3sUwvxrVZN/L6KJhO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jvYpwNez; arc=fail smtp.client-ip=52.101.66.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jvYpwNez"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kc0ouOLOMtq4v4iwWJFW/dkSx/YgT2HL5fVknmqLC9/2oVi6+upJuUy/Om50wFPJI0g8YLcMsiNvo6P50rYlk2qE4Ev5OZ55yB1APHVRwwd4WROpefTguW9tp77TwfMQM63bJ0y2Y4eEQfeseJXh5nK/mikRHaUOgV/FyFb8TbQo5zFTDpXBjtnnc2UVH+BJEVKCtcSpPsgCBYxJnalGR4F69m3aO1fun63BPNjaQUdbsJTJDToRRSB+XLFyFeyHxzSyZ3zhpl5Fr+SfcldDZvivCaf1+10W2sEskrXPStgFYtT/8j+IWlIYxGVQDpY6A7R+mUjJK7pIOku7eAjl3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09bHrGXgM1TBoMD0bKBorFn5qTwKDAH4w72acWRRyag=;
 b=iOvXOEF5hYsrgWjRm9wc2Xi86LgGDqvDiKyc+mud39ZwE09kVRgWpjMp47vSqGmE9QqKAO60PDs5nhw8NcDisXagOxFM8munoMUkeIGfIRJ+fTCHsk5XHU4UqeYd6kFZs88tJngk7+CA3DFJge7T2rXX6lq+HIR9Mu/s12ZmpQ27iTgpqy5rhA3shkMJ49/PeHVOecOrtx2DBGL16w/WVD6E7HuSdTTT78iBtFJptx9MFoFV8v3AuK2f98uapweQmhdCyBdKdvj7bqAj7OJpGKEpWsRI9FsnkaBYPFhPuWyTR5f4IlwJgxjvSxjTLlug5k7jFkAyOsJC0EOHbeKycg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09bHrGXgM1TBoMD0bKBorFn5qTwKDAH4w72acWRRyag=;
 b=jvYpwNezu7XyfDMICqQL5POsHLIP2pFMDqMuyPTCGDrREVjX4/8C60gQXFcD2Buq+0hDYFJC94YDDAt+Dm52xPX4OBHfO1BDiBOGVYEU5q7ZUFIsixnl1uVFLXaZuNyVjOvFVAkkO+0P9u8cdMsKWMb+Citr8elmRj43p0KuWaZX89X2k0gn9C8KXGOvA1SMiXUgXn3WNTLtF0fhHGVIKfsy76zagdm49Pfxx6U0I4lT+6x2/MHoYgpeHzbJxMkeuaLLGHbjPeG4oYT31dinXFTfLsqcd0o5nt3Q6lz6iDJbigfRHgJdOguFl3TZqFLjqBzsGVge364S4YGT/JpE4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS1PR04MB9557.eurprd04.prod.outlook.com (2603:10a6:20b:481::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.7; Fri, 15 Aug
 2025 09:48:08 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 09:48:08 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: krzk@kernel.org,
	myungjoo.ham@samsung.com,
	cw00.choi@samsung.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org
Cc: swboyd@chromium.org,
	heikki.krogerus@linux.intel.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [patch v4 3/4] extcon: ptn5150: Add Type-C orientation switch support
Date: Fri, 15 Aug 2025 17:47:32 +0800
Message-Id: <20250815094733.2353916-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250815094733.2353916-1-xu.yang_2@nxp.com>
References: <20250815094733.2353916-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0052.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::21)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS1PR04MB9557:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce0360e-1d27-44b0-933c-08dddbe0d6c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|19092799006|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4DGfHaXCPdLRXBfm4ZgOrnkJaTbq/b1soEbasNoQHy0ihN4YR/7c2mN1GB6h?=
 =?us-ascii?Q?1dQMAFEPsAGYcJDYuX7xjUV7lp9ZRZyXZPyfBRlKk0XIGRyU/f244eH0LfAH?=
 =?us-ascii?Q?THWckuLtrFoc1I4bKAc6Hs9DcafsQaH6PYXlNvH4gKHdX+4mMu1Tn/isr7DJ?=
 =?us-ascii?Q?DIM+S/N3J/i/4JpQQN0UjpfmGfy1uxWz0gblWcDbMNTW+QpRmUhwH4lixfJq?=
 =?us-ascii?Q?0U0q+YLys+oWy9Lkccpt1nm8VhaoSDynir2CYYALxrAeur/ov7ApH7LsCzXd?=
 =?us-ascii?Q?9Pa3ZkZFy2n23xf/dtXv0ALRt0DhuqEM4T+/AHHJUBqGOF1xAityXyeZeb3u?=
 =?us-ascii?Q?SXIT/JScnXWWAMC8Xe0LGnNy4zXhHBH9pWP2BKUE7R9xmx3Kr6/lNHJVN1sp?=
 =?us-ascii?Q?3a+8TLJXLpYng0FqYeUly4eaSiZckfmzwMjbd0aj/+POgEQlIWZhiz+xPegW?=
 =?us-ascii?Q?dnrS0W54vN3PSYWkLbelTH2DOoHvGlZ9JALjvlSbd4ga7XzWZ7Aqd2go97ln?=
 =?us-ascii?Q?A3rTSsn6Q54ReIWXgWCz/LBSm4/2gznyICy0srFfcnbpSXtvLKwgPLHYbwJk?=
 =?us-ascii?Q?AAVnUTF9XVnn6+wT0jY4CayUStGpqU28PcMOSS4K6wz46ur+zEhjrVVkEGmk?=
 =?us-ascii?Q?smjIhfEiPwgJAEWFiRl0kHL9kEJU6oZIa/T82O7uaW8FeCvINxXIRCYtiLUa?=
 =?us-ascii?Q?UWMEwKGyfC2zNSqmDNnQcM1hKFHr5dLlTvU0Uflg766cn57YIebh3Tn7wKFt?=
 =?us-ascii?Q?+E1X1Ju0JOKEHG9lDx4xBE4EkWiF8YnZjbElmv5O6tv+fGDx4zzV9ty+dwdp?=
 =?us-ascii?Q?IHdM9vMkZPwhqNBAlvzbcjDvGQTCTCcfll6UJp4ADJV0jEGLySr3xhjjOZHO?=
 =?us-ascii?Q?E5xBc0FusH+vvvibV30H02HY0Ai9RrAYA4XvEFwSSJvhcDsu56YQNLUs7R27?=
 =?us-ascii?Q?UaOC7Jjtujos7lS0JX6tyhxrtQjQrCnB4c3IEWFAz2H4xnXyMeSc89UxvS2F?=
 =?us-ascii?Q?MDdNHlidpx6c3hFf99sPCG8b4aAinAsqoV3H/w0Iwlte4l0J7+kJy4balAtI?=
 =?us-ascii?Q?tEJKnA4HvUIBn2SqamXi9Vj6hYm/sTSpdymVuO+BVErfiDqx9q0+89guTRXT?=
 =?us-ascii?Q?K9SAnckQuG94l0kVrLPMDB66XCWJlB2p00DhwWP4mIZom8qsD4HMhgAp58RE?=
 =?us-ascii?Q?ttUWcssSdYhx3piTolwfBSuUMS5+u29UtmHnB/h5wOOtES/cneX/y+trZn9u?=
 =?us-ascii?Q?BSV7WOJejW0RAteTo55/kSD16IU7YpXDkrq9dQa1xFmJnocmX/RT5gEarYUy?=
 =?us-ascii?Q?0UMHN94gdXaZgrKcwLEeUtjAf2QWdv4Bw9OxnHjAGrV/0aM9195Tn7dUHJW1?=
 =?us-ascii?Q?C1WBuvUHb90EUZ0eiIOZW0B2nBn79T9dEV3RDzroEsiZCAIDSMVA+PwZofA/?=
 =?us-ascii?Q?JDx3hNRDHTtLhQDpHFnyphbEiUIrFoBOFyCCYVwSgTiXUFPHq8Tfpw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(19092799006)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+3KnydP96IdyYGa/1yJpCPL3oGpG3a7oFNmVRCthN3VCqX7s/rhbk+Jbhrd4?=
 =?us-ascii?Q?aGuFfqllUwFhAw5bP2Bxyt2e/csX1oWQtfekUOkCg2gQLqZ1bAq40wKFHKer?=
 =?us-ascii?Q?uPFN2B8SLNhZCkwE6eu766GT3ZkMCJlw+pwuC/eDMBdDgn8KLD2fYz8s2NfO?=
 =?us-ascii?Q?Z/8bgJ2HFBHEp/W/WnLQzOihnbawwVfxG3WNrdMj8JPfXT6dZKyRghvSV0uR?=
 =?us-ascii?Q?vJsGV8qkne3UGOFNsqnqeBpaGizIZtRLvyJ16Stilt3hUWdqW5ayHbNuT1+C?=
 =?us-ascii?Q?2e2G26qokbraXYDZSShho8MSWzq/+oKL/38twPmgd+nDncqnflRtfK1iBIUl?=
 =?us-ascii?Q?ZrE+nbXcj67K+lQL9m6M+PQE/r1RF96K2TqunleUgbmc1U2BW5+5pYLl459k?=
 =?us-ascii?Q?rQrtWp+t9mTLBLzFY2J2sRKep8AgHFj8cUjBysalu/+o3jFn3vBUnAE5PJYp?=
 =?us-ascii?Q?j2Um22/JFNCcEO0Lv4uX1bnqp13a7YGnCLxlbmABblH8tVvwnLyH0JIcWroe?=
 =?us-ascii?Q?tmMoCMVDoLhe6cMd/2RgiTryZcT6zMk1b4h2ezqeUY5v5yYa0OGTIkqfwc+0?=
 =?us-ascii?Q?ukkPSsmAIdiV7A53xoyPdxLnbAsUjS6e8r2/89eZz8a7H5Hjpl8Fke8f2udR?=
 =?us-ascii?Q?e3g9anISuq0beBMJ7x1Dq7XKBREKCA8qY/kcwYQ3MGXU0FajhtmQ9lVsuVaV?=
 =?us-ascii?Q?S6FSCCED0a0dkEWmK/Fw6zKxBLtSODThi93JIPdpjD4gon5ch+CxfIi9J1/i?=
 =?us-ascii?Q?zjQBKTzY+nHeO8VLtXYCW6tExp57U8tnemK/RrSnvEFheOHoEGgvQB38Ju2C?=
 =?us-ascii?Q?Nd0vCg9nwhHJPaoobAieVE6Wb6TgjSGvY443kUAFAo1We/TPp4l/VsGwbW3b?=
 =?us-ascii?Q?t8dEc/V708CSwzfre8QVrPQK8kwzx+ZHkQE1VSRFI+B2fqX5KBzeJYXe6Wxh?=
 =?us-ascii?Q?EL4bz+KtoB4GozGRAz4jYhzD15f1sHELUAdLN1JZ/AZrfBay9qkSzuJDO1rN?=
 =?us-ascii?Q?aakHs+yk0aLvVq5Qof2pA0KgoZgjSidh1OpsVzDpExN7O3xzHq7G4c8evhPt?=
 =?us-ascii?Q?yIB0qzjcuggJ8Ycp6dITdHuoaWC8B4vhYfNdsqWHqnm6iQ1oZTfI3+nuERyH?=
 =?us-ascii?Q?6+nRbvt6CJl+zXIQRXU23KI+fVyyuuH99T/oom1ocrnd6/JBbtJJth6ia6I5?=
 =?us-ascii?Q?DRwijDolx/FKVXnIvPPkRY2icThaP6Jc+aZWtCIWowvBiUao3ta1nJ1QZJgc?=
 =?us-ascii?Q?BfCnwaMxf24wL2aJTN7ugYiZlP3c2LxIMwrshBXE5MtKLIYHu9mrVN5bmy2U?=
 =?us-ascii?Q?VtcJ47IdPet6uFq57IPuMvGRZu0JZ8fcPRSuuEkhuTbFi5qTlrSI6GKyNoXh?=
 =?us-ascii?Q?j7tqnI9TYPUdXfW3OgRJPei7ClE5ylekdZUM7dP/soodmJNxygVPbS1rIBea?=
 =?us-ascii?Q?+KmLXWz40k/Amkc1BbbeRM959552gjvyHWzX3Q2ri2dL78rKtaTkfHW6o40j?=
 =?us-ascii?Q?tSSfaTGP34JJx/m5mhw1FoQuyesOp/RNYcFYTjOTJAzCCZkcicsoWT1tRbVu?=
 =?us-ascii?Q?BQjihVpBVKo66/wFQtNtVMRIT9TeBMPyhT8eopre?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce0360e-1d27-44b0-933c-08dddbe0d6c3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 09:48:08.0668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kmlixwi8QaGzeXr7Xi1XogYQ8SRxFGSOb2m73TtHwlVlvQUzR86KDC41Vy9uNoizvxCRH3e1t/U8TsNmf1EBDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9557

PTN5150 is able to detect CC polarity. The field[1:0] of CC status
register (04H) will keep the result.

  00: Cable Not Attached
  01: CC1 is connected (normal orientation)
  10: CC2 is connected (reversed orientation)
  11: Reserved

Add orientation switch support to correctly set orientation of
multiplexer according to CC status.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v4:
 - add Rb tag
Changes in v3:
 - no changes
Changes in v2:
 - move "enum typec_orientation orient" ahead
 - improve commit message
---
 drivers/extcon/Kconfig          |  1 +
 drivers/extcon/extcon-ptn5150.c | 40 +++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/extcon/Kconfig b/drivers/extcon/Kconfig
index a6f6d467aacf..fd4ec5dda0b7 100644
--- a/drivers/extcon/Kconfig
+++ b/drivers/extcon/Kconfig
@@ -145,6 +145,7 @@ config EXTCON_PTN5150
 	tristate "NXP PTN5150 CC LOGIC USB EXTCON support"
 	depends on I2C && (GPIOLIB || COMPILE_TEST)
 	depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH
+	depends on TYPEC || !TYPEC
 	select REGMAP_I2C
 	help
 	  Say Y here to enable support for USB peripheral and USB host
diff --git a/drivers/extcon/extcon-ptn5150.c b/drivers/extcon/extcon-ptn5150.c
index 78ad86c4a3be..768428d306ce 100644
--- a/drivers/extcon/extcon-ptn5150.c
+++ b/drivers/extcon/extcon-ptn5150.c
@@ -18,6 +18,7 @@
 #include <linux/extcon-provider.h>
 #include <linux/gpio/consumer.h>
 #include <linux/usb/role.h>
+#include <linux/usb/typec_mux.h>
 
 /* PTN5150 registers */
 #define PTN5150_REG_DEVICE_ID			0x01
@@ -38,7 +39,11 @@
 #define PTN5150_REG_DEVICE_ID_VERSION		GENMASK(7, 3)
 #define PTN5150_REG_DEVICE_ID_VENDOR		GENMASK(2, 0)
 
+#define PTN5150_POLARITY_CC1			0x1
+#define PTN5150_POLARITY_CC2			0x2
+
 #define PTN5150_REG_CC_PORT_ATTACHMENT		GENMASK(4, 2)
+#define PTN5150_REG_CC_POLARITY			GENMASK(1, 0)
 #define PTN5150_REG_CC_VBUS_DETECTION		BIT(7)
 #define PTN5150_REG_INT_CABLE_ATTACH_MASK	BIT(0)
 #define PTN5150_REG_INT_CABLE_DETACH_MASK	BIT(1)
@@ -53,6 +58,7 @@ struct ptn5150_info {
 	int irq;
 	struct work_struct irq_work;
 	struct mutex mutex;
+	struct typec_switch *orient_sw;
 	struct usb_role_switch *role_sw;
 };
 
@@ -71,6 +77,7 @@ static const struct regmap_config ptn5150_regmap_config = {
 
 static void ptn5150_check_state(struct ptn5150_info *info)
 {
+	enum typec_orientation orient = TYPEC_ORIENTATION_NONE;
 	unsigned int port_status, reg_data, vbus;
 	enum usb_role usb_role = USB_ROLE_NONE;
 	int ret;
@@ -81,6 +88,23 @@ static void ptn5150_check_state(struct ptn5150_info *info)
 		return;
 	}
 
+	orient = FIELD_GET(PTN5150_REG_CC_POLARITY, reg_data);
+	switch (orient) {
+	case PTN5150_POLARITY_CC1:
+		orient = TYPEC_ORIENTATION_NORMAL;
+		break;
+	case PTN5150_POLARITY_CC2:
+		orient = TYPEC_ORIENTATION_REVERSE;
+		break;
+	default:
+		orient = TYPEC_ORIENTATION_NONE;
+		break;
+	}
+
+	ret = typec_switch_set(info->orient_sw, orient);
+	if (ret)
+		dev_err(info->dev, "failed to set orientation: %d\n", ret);
+
 	port_status = FIELD_GET(PTN5150_REG_CC_PORT_ATTACHMENT, reg_data);
 
 	switch (port_status) {
@@ -152,6 +176,12 @@ static void ptn5150_irq_work(struct work_struct *work)
 				dev_err(info->dev,
 					"failed to set none role: %d\n",
 					ret);
+
+			ret = typec_switch_set(info->orient_sw,
+					       TYPEC_ORIENTATION_NONE);
+			if (ret)
+				dev_err(info->dev,
+					"failed to set orientation: %d\n", ret);
 		}
 	}
 
@@ -219,12 +249,14 @@ static void ptn5150_work_sync_and_put(void *data)
 
 	cancel_work_sync(&info->irq_work);
 	usb_role_switch_put(info->role_sw);
+	typec_switch_put(info->orient_sw);
 }
 
 static int ptn5150_i2c_probe(struct i2c_client *i2c)
 {
 	struct device *dev = &i2c->dev;
 	struct device_node *np = i2c->dev.of_node;
+	struct fwnode_handle *connector;
 	struct ptn5150_info *info;
 	int ret;
 
@@ -311,6 +343,14 @@ static int ptn5150_i2c_probe(struct i2c_client *i2c)
 	if (ret)
 		return -EINVAL;
 
+	connector = device_get_named_child_node(dev, "connector");
+	if (connector) {
+		info->orient_sw = fwnode_typec_switch_get(connector);
+		if (IS_ERR(info->orient_sw))
+			return dev_err_probe(info->dev, PTR_ERR(info->orient_sw),
+					"failed to get orientation switch\n");
+	}
+
 	info->role_sw = usb_role_switch_get(info->dev);
 	if (IS_ERR(info->role_sw))
 		return dev_err_probe(info->dev, PTR_ERR(info->role_sw),
-- 
2.34.1

