Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2059.outbound.protection.outlook.com [40.107.20.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A88F1F17F7
	for <imx@lists.linux.dev>; Tue, 22 Apr 2025 11:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745322564; cv=fail; b=uZPonZsq/IlYvIX+5oW7rFArXPi7EFlWxYQpFFdnwl33GrcStvDilTSVcv9OmJJWWKZdyyE71/3fLfU/PNaCa7Kwg8BG9Bhfmnxa+d7fGeujB4u2SjN9g55neHyo/AlWvO+aIgnvCxORKgubJgAC02gczDmbwPhq5gfi+yodPsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745322564; c=relaxed/simple;
	bh=a6EyLYU/MDGXSRXHoWYrVl8+StzgL3p5KAJiBL2V7Kk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aJbdObCaztzIXxl45rhyjBgoVc+7fOJsqwcR+uKjh1Nw2TkGTa0wZEYdupieWpQ28veekIeMP9peo3LIk3PW0bOHsZVR9e5A0kz2/G0iOb7TxPPNZzRebzrD3G6SgUx52qYLi0nt6DZ94n2tV2Mo0Dmpr9jusp5TYZLacSL5ccw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WQN8XsoG; arc=fail smtp.client-ip=40.107.20.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WQN8XsoG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uK2DEAoXbfXFSwD20C12z9M0ttqoGCuQw0a8w4p75L8280SqCXjTuu/OZT2EtoQhKTrZi9Lhy6hF+/OHH/OpMjgYxsSYPggt8QGo5NmuQR26mfV/wyrSPFnCVizrgKhtRjomg3SHsZmt3Py1XQLFG1rzEsy5zdXKa3CzeljqsbXYkYPRksCAL/feGTe4rK+UeaQpExtpUgoue5XD0z/DfxD632ml42iPyNPw0kmPkkofDSMmwwGaG9NYftXIVS1i9AUHwh7/htE6/Fk6hOiPFwwhppWh0n2g7sBtIY6oIf3w2Us0hW58HGz7nulV5ORkYnd4VJZkZtPn9+RSbARsAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8alfYTa0+dXC8jdx2T8UPf6GAsoyPF7Lzavam5H/9Y=;
 b=DzoB5cX4XwgwwtIqqKqC1rwt7xYy0jYDEccFqtgfRLr95aoapaMQHAPVezk//c/Z/QFVFB4Fk6P6Od1igHEji5FeJhWbyzC8v353vd0WDkOfH1TYtR+t/Rgz69UJa5BPqP4hwguF9J6NtzGgEVVjK2gyCKoISb9oSAKW1+nSPeZyvRJisZVwuH2uqmTjRAhdZqCNauo4SKO9K10YgVefD71Zt8J6sJK8uQccLurayhA4hAuCL1f1QrMbq9SJFzqA2eNcl2TTn+nIS4Ia9N+G3fqVZYMWLjkgzuqsWAsjFP3K00JmipqJxS2KBRfyTGSfNEnh8z/OtZOb/vm8zFmw0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8alfYTa0+dXC8jdx2T8UPf6GAsoyPF7Lzavam5H/9Y=;
 b=WQN8XsoG31dB+vZWbZd58jr3MjX6ZOFao1bUVQbTE8odU1dyzx9ha456XAVjSzpvM1GGqb+t9awzQWXJZ+30foso+dRiPHAX3SiI6YdyTfHwSbndlsblSg9lC128LZPj6pe0RJtsjGn2K+9fhM9YDq/7tmuxlO4oMfeHRK+g272+0iQGcc/XqUJuDvOlKwTHBU72RD/duGHiARL/knju1CCjBjvMkS0IsXTM9Nn1tS/ZU3NspIYPStxmYFfpTuD4aaqLHcIPY2WYKy1fst1H+Z/00TPOES0aysWtSDg33M/PlBUAyeGVWPacUx40znHUUanNXo6XpaeI7MqoUPc62Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB7736.eurprd04.prod.outlook.com (2603:10a6:20b:2af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 11:49:19 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 11:49:19 +0000
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
Subject: [PATCH v2 3/4] extcon: ptn5150: Add Type-C orientation switch support
Date: Tue, 22 Apr 2025 19:50:54 +0800
Message-Id: <20250422115055.575753-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422115055.575753-1-xu.yang_2@nxp.com>
References: <20250422115055.575753-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::9) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB7736:EE_
X-MS-Office365-Filtering-Correlation-Id: e5f759a0-8256-49d4-43e9-08dd8193b6d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mfiq9Mt5D7epcDa2QhFhlD2GfybiFAn7qMOVZylutlhVBJZ+cUJEoK06R7eF?=
 =?us-ascii?Q?NnESaVStDmPrNmfQQ4UGoHjinuOpUc1dJkan0nfL2h6y3M5Yr5Mt1dxpViF3?=
 =?us-ascii?Q?EaqAWx8/FyQEuNWnsi9Q485oBkqCkE5hI+zRboeMhtFZgc36E9b+p//CDZJB?=
 =?us-ascii?Q?gPfyHJX4rXUNcnpOHkJ4KLr3UhY9l7V/E/8HHcq8RyJ/4du1RoQ/uE9tM84m?=
 =?us-ascii?Q?geSwqabsU8WgSCUI+PlBewxC1x16zNQ87z0+moaOr+giAzYm+4kfRc+CSpJF?=
 =?us-ascii?Q?FVRj0in8zkjC4j96JwXsxasFF/yzRtUZpw8e7SokJdjpLbLyOJgZAJPZxkn5?=
 =?us-ascii?Q?srTIlnt2RgH8JrT38sE/eW2dpE0MnWaijjpSWPwW4+xj5mDLALLc6/FqByVR?=
 =?us-ascii?Q?u6+jJsGYJIGX0uyWAMw/mUngBVOH4FR7IMvcHXRq5jSBatj2a/ptjAN19Ihy?=
 =?us-ascii?Q?fd9MD3rTuzDG2UiQRVJSsAu0uvVQq+GXB3X+g6SZIUNS6hfaIE/anVl2xL6b?=
 =?us-ascii?Q?GOptA+HiHJ5inlmPUhNKyXWgVlC8VXrb1kkhIEsnq+SBC61155XA0f4Q0r70?=
 =?us-ascii?Q?JlRHEbQBjfDyrmzoyyiz7kIHtDZGC7N5xnVO6Cd7bLIYm0btGhiKIPV4Orxk?=
 =?us-ascii?Q?NorrwIZM7uC6gJNx7H8LZxyN25OcnyJ4BpyV5N5i3UygJbxrUooZUitWWU7g?=
 =?us-ascii?Q?0eqLrAB3yb9tTtQ/oCTqNq/+lLAbTnAx3Eq+8aLKc6IibrJWbjvasF8pO4Uk?=
 =?us-ascii?Q?ZmCbKRDaZUw33YGagb8wS2BWvv3yriY2zdoTSJxKn1gTZUiKzlkbchUBCZKR?=
 =?us-ascii?Q?Gw6/irQkzIze57JzdNPjtQMCM7gWogAJEcWKFiR2Ral69uTEt5J/3i2dYVz/?=
 =?us-ascii?Q?WBBKkGGaBQLOgj/FYp8DWFEOgPP7tAR+3UNOF5ezChOKyz7D2uuNIYu3njhH?=
 =?us-ascii?Q?oU27TbjrH9l6L5omJ9/iHVii/VAne5vavKO7d/CEutr1lgrs5QpF4QklRy8O?=
 =?us-ascii?Q?YqIVWEP9yO7RT01lJSYMt69PXbPZnUbuKszvZStjCC3oCIOLvxo7GXYBd8sN?=
 =?us-ascii?Q?5rWC1J7hGUkxshj0VVKOCfzrE+a9sGIjtHmCCqsk7zPFD/YAuedCP+N1dSus?=
 =?us-ascii?Q?3TLg7RCnPqduwFxg3wmdY7VdX6l+5Ou84ExBeWXCfBmbh3gpsBoFJv6DJ03O?=
 =?us-ascii?Q?dXpbVcosSGwXKkdStX6jqvBamLqCrjPm0XeClC7IR2MlzaosC9328P26Os/C?=
 =?us-ascii?Q?XdCnNPHcTOjkBy0SQda3eiJvkyKk8VmVDduKzEhoa4Sj/l5b71XZKW+Eh3d0?=
 =?us-ascii?Q?OfJqhwBhqhz6kEvyJo/MFDYdbDgsx9GAoZO3GmXrCYhW5y15uPhg8uX5Xew7?=
 =?us-ascii?Q?jHkilWP9HzyujWmrZq2HyXR42rOtRCOrQALTZ+WkqAAJ7Se01M+M/oezkUu8?=
 =?us-ascii?Q?B1nNhWTHDSTePhTp5UlkjQZsbIOp3KQUPsgIJ+YZF4XHkYrXeZX1Sg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zUnCFl9ld6+6/hB2KUwYuXm+z5H6AZ9ACqqE4BxVfuvcnx1yz8P3O11/AeLg?=
 =?us-ascii?Q?SvxzPsl9UAV7YE04vrCIPyyyoETvX1/2+/x1Pows/lgvM7RWWbiRuYVRs+Uu?=
 =?us-ascii?Q?vWc4wwKekmPVpOP1hOeShXXspTYi/ZKSeWiN7efqI81U3zqih4PFTPSjE5D6?=
 =?us-ascii?Q?QK7MzPr+SFcjvvk9jB8pzXW59/x5bCYr/LQv9haWDdMtERCG08lb6zFEUpK8?=
 =?us-ascii?Q?QP6Utf60L/BiOq7MuRJCSca6/FFj16AigBWr9xa7mMhZO707t9pJHUPY6FZS?=
 =?us-ascii?Q?6dp2oVuUB2bVr2SKYTdNYMY5jyO3WA7lJkv6PfUkGwh9Us5LGUGfVGeJhTzo?=
 =?us-ascii?Q?4ekrU2Gpxb+cqUBPmsQ9++RuyE/yKQ5yrXZ19pPseWAhrALys5KaSxjT/pUB?=
 =?us-ascii?Q?Rn8LCUEF5vWvBzieW2VJKMRIFKBzFl/FYTcNqSXqS2lY0Dwci3TQqu3oqSFP?=
 =?us-ascii?Q?zKegfufkgTT70qoaGWdVkPxaKRvQdIOdwmPb0LHc4vBzWH75cFmpcHGyOFV7?=
 =?us-ascii?Q?K7NL+/jJTVbv0DO8vQJltgIGIeTSLnMNTnRJGJzLZ0ZDgC+TA8MrX3t52OMi?=
 =?us-ascii?Q?SiYmRB0grnMpNW9uQHrDswVlsXgdGUKiUlreG/uHObFtdzAPWOwrfQE3cU6W?=
 =?us-ascii?Q?zgKULbMvxpWBxAvwuTZsRJR0LkuVt4dD8t1bcckn14IHm7eihnBxuOwm5SQJ?=
 =?us-ascii?Q?0dW8Sibbd9larrtj6TgxarubrX+xMmaAbt/smeW/F8Swdhz8xl2Hgkk6jyyA?=
 =?us-ascii?Q?86C+TVh9PWkgZUxAdK68K7C1fZdQxoUttvTAZ1Kf9DJ9qsuqf90nuAEh1pqt?=
 =?us-ascii?Q?rLxfH2uWApHfSpfht1WY7C6TvZw0YYm5bMVT/p1vc4bBWWVIv9Pvcdfijc6a?=
 =?us-ascii?Q?0iROYf1Mydepy45czF4eHQqfphDbtJRja5x/1kDVR+Vh+kA8jWWgWQtvdVW1?=
 =?us-ascii?Q?iUWvkplZYoJ8x1zxrXQK0Y1r1MY6F/NkHTJRiDLDdwgiCJXGISXAytVgezIQ?=
 =?us-ascii?Q?kXZxmjTiQgAwisc9fIbMT3GOuLfAATJpH+N03Ku1/6JmMOiCygJzgOGfNuPQ?=
 =?us-ascii?Q?7158X9lbHkAMkCFHnU0Amq+RQez/8p6EDbKIwDMcvAORCJl0CVCbvER32aYu?=
 =?us-ascii?Q?2GuVshwUjvoCpVX1EVlr7UPWkAQVbb1qslrIZWSlmtmyhsCzrE3aahmFIXyA?=
 =?us-ascii?Q?peqhHhxD2t2WBOVL4bv+K6tUy0TBbvT4NiYN5LyFxn/MLkhvAwVOmg1rRQfw?=
 =?us-ascii?Q?GMEJIBjt9gSd9xfZ8BfSRY3h6/xBhUSCWLzHX3rNC83BTQmevOi8qybQawli?=
 =?us-ascii?Q?WHOrjvpcVDdEzQZ+a2RcHb63LvfiA8badahUYHXed0V22cVoP1jsQrFyhvrC?=
 =?us-ascii?Q?qOEAXiwNOw3AbhxyWpaKv4pzx1k5xxvDgEOy0g9jbzY18pUdtDkMvBrrJp4O?=
 =?us-ascii?Q?OGad/1L2afoPIdBEl+OD5Jc3J0HgEVh2okBW4QLGmWPagkYl3s+d4cyzjONL?=
 =?us-ascii?Q?xQ9d/jp8Sy2YmI8T6fDmNk60UustOMOQ6PFSAXmqNdGksaOFVutAqe22+DVZ?=
 =?us-ascii?Q?qyv0M/nmTkzfTrGIKIaUuGa9d7s2DxVAiZ1n5zRJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f759a0-8256-49d4-43e9-08dd8193b6d4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 11:49:19.0658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /WjsoE1E6Hi8So6agw0Fp2zzfJXhG9xLLRK1Yjjy1XA+RrSfqXZ1C/+XSA39qvhuHP7vAPejTZXTcVkNKB0Nhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7736

PTN5150 is able to detect CC polarity. The field[1:0] of CC status
register (04H) will keep the result.

  00: Cable Not Attached
  01: CC1 is connected (normal orientation)
  10: CC2 is connected (reversed orientation)
  11: Reserved

Add orientation switch support to correctly set orientation of
multiplexer according to CC status.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
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

