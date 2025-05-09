Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2042.outbound.protection.outlook.com [40.107.247.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97A626D4F4
	for <imx@lists.linux.dev>; Fri,  9 May 2025 06:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746773022; cv=fail; b=joSmYkr61mL3rLF3DUxpuIT1RyYjTDNy7nPpugjVMLidIJjFF3/Lmi7Utqw49p9UN4MJndsEU/YrcBwgbe04qwjQ9+EzIMWmE9UbLsQY+eLjcROgbjBVifjQl4v84RYgpvCmgSIhc41sasLKuiZhYZJWuOCHvuWOXl/juf82xfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746773022; c=relaxed/simple;
	bh=IDUEbe5+Z8AndkjLoKhtHW9KeFLV/5ttYm80Pwohz5o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ihCyfsKUrXsNRyTxCUXEz4xoL3Qm35b0zdOEEp8DLzaRcMGeVKpuzU4RT+3o/qdIRj6Ee75Sk/nB5IlttAaHUXUQMb3eFYtJojnvytjVvsXC6qpZDZ+jhvUZqk43NEBvjIoHUoLP8M+E0mM5ZZ291V8xpydUw4v6TbAAzpiboFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=F8sn9Y3M; arc=fail smtp.client-ip=40.107.247.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="F8sn9Y3M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHvZCkX15elXZ3GDQN/Kgt1p9ZbvBgf8IckKaOByQXKCzIE2Vp8ELCx2tgZroT1Qdrp1r39KhpPEraO+2VIBJ+4DxcGR94zBL09wVGhv/p8N0rSZHDsQ9NjeUlWMkUQfhEOjck0UqYOLPtQujPZq2yhEdCjumJe3nsbOktSF+iDCzD0Y8zOGQG+A6qh6FyuTSxm4ETAyjANOQ0NeTKAcRSvU3P8wuByz357b7xs3m3W3p4sZsDsoxCYhf4bPuROiuHQN/3pyUlDV4GR9NMPjjIDTOW8fGHVrYelj7tqRTLTQBv7ZsRwjJ0RnIHyvd5xF2RNtCOFqgX3IN2tbA89PJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZG1AMGczW0QQgiwr/9BCgHjLSwwtXEf2sQ2qz8oP7c=;
 b=L9WB8N9r8JYORHbrOZ23d2wRKilkfoSRj2rQOOioLW6y4mbKr6l5HnHQCMPtctj3hwzDtXSYyCPdQLcNDqJjQGbQu/Wc1XdJkRi8MCCVzDw1Rio4UNhnJLKpwzjnU5MaWEy1kRa2XifuumPKnk5dSo/7GqmxAbHFKL57bjP3hFqDFP7ji5B1VO2gcEI1OIHe0Kt88Mk/m3jtsk6PuwA2q9sQS2ZSeSKsD4B/L0OLJqngXhMgsusZ0UkG5MLrr//e7HM7ARYiNRSQZNpYKXuyFrjt7pkkioOwdlS/2YVSRp8uqpaW9p7205vQh6bkaFBd8n3a65gAJpOoGetwe1WmuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZG1AMGczW0QQgiwr/9BCgHjLSwwtXEf2sQ2qz8oP7c=;
 b=F8sn9Y3MFiL5mIW47xQQ560FU7RMGKO5hIlpPvmwcu2WmMQfX95KgHheqBA2DrCeF0Oqm9HnmGTRTIQsuc9JgR8OdYY7/0yc1DKNx/vdles81aO4ZDNvgESnBjaCI5fw7SstNBKvmL0XRfX0tE9TYyv+H025QqfjPmguoIxPdSi5fTlH/Q06Jk+5xxC60DbM+/pVgXFw5PRGJHn4AtHkuZGzATxZ15yfPhYnK8n9M8wE0+/hXHxq3LL8T+wxMvLAaTiuHLxMUcsf6GdYNrgBM1mrXJAGIRgE8Fr6knCnk1zviC9S08P7J44qGhp3Qkh8DWenzvrag0bpRzC+7gxQHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM8PR04MB7763.eurprd04.prod.outlook.com (2603:10a6:20b:246::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 06:43:39 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 06:43:39 +0000
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
Subject: [PATCH v3 3/4] extcon: ptn5150: Add Type-C orientation switch support
Date: Fri,  9 May 2025 14:45:25 +0800
Message-Id: <20250509064526.3767729-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509064526.3767729-1-xu.yang_2@nxp.com>
References: <20250509064526.3767729-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM8PR04MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: 99d68ca6-fbe0-4cd0-4974-08dd8ec4d498
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qp7L9BINz+T71Z1G+w5lee3qn2yqxMd8nDXIQVQDFzAQG7uoqSJS/HzT6GQT?=
 =?us-ascii?Q?x/F19XAb33lHLfV1jytRjPb5VhdczbZV5a2luGvv/cxwtNiUieaiwVePwl8g?=
 =?us-ascii?Q?ee1ea4SyNZrh+fQffGsR9szpPulxTRWPYRRDJIMn8fxDsiyQC8Kjx0q6jYXj?=
 =?us-ascii?Q?+5d+o3pXohMZ1oxW8qHUFYQkp0npfxPXtYgeE6uxrwNWvbl7sWpQrRttxnV7?=
 =?us-ascii?Q?DVXs+2yxjQX1i6hjxwSjTbRQj6EkXu/noE/BIXK5MoLyO+61ub5Ijt76XHph?=
 =?us-ascii?Q?LDpEAjASGXR8b9+pCVI37C7mkmdSBS12sx+9HXA479WNnlvAp6it5j0Ig2WM?=
 =?us-ascii?Q?dRJg2OfqYYA+lpCsGH0B94gk5ahE/CGIiAaaVHzQzQJ3QTg7kBNu8yAVSHLs?=
 =?us-ascii?Q?AJ0+YVlAsdXhOoLKnaEM/izgx+mu8FTiAQiGMTQSe1Dl7v/TQCLYwk2JqyIX?=
 =?us-ascii?Q?WukdVEhVG5knitKoL5VDLeRUExsun8PPgC36XDYhL3vsCysnm7sKHTlcVmL8?=
 =?us-ascii?Q?0/YHEm72eiSgK4QvSRNOUb0lr2IWMCwClF2EKzz9lOI2BvEBF21YSSYtz3cE?=
 =?us-ascii?Q?pBtc31yUPD/JdaSZWbe/UQnVzlMB0xQ9UpW8ydagi6znI1sD+RtC5M1i+jpv?=
 =?us-ascii?Q?f+Yqc262Zc37f7i1QfnhRmPQCE5QYjh/2/xUP5LLl0iV/GAA8KpAWCSYf3Vw?=
 =?us-ascii?Q?5cSm9hHzkLQrtMw4noxaiNaXaCL68yOJfqUOY/TRyaGxOmjwUgY6nR9NE36Y?=
 =?us-ascii?Q?EwzI6mkoEN0hX1AGSyVAGj7f20uxoSmFPp3GgSQ5VvOGi16fmBOjnHb8F41j?=
 =?us-ascii?Q?uga8ZbWyOWq190QytE3MPHMRJDKXvWQBDye51yNkENnpTBKmM2XNp+AAIxi1?=
 =?us-ascii?Q?aIpMujEuh5N3D+mNcrATGJWrk8wBht1WcEXgClXVuxxtVuHqsOEnMEohhLV+?=
 =?us-ascii?Q?swjVS0Qu1/S69PK9R2wmCwpxeWyn8qGhjD4cxuv09WBMNBi5hZluoSg6RSCv?=
 =?us-ascii?Q?/0Ea3QTJyRCHReYaAbUaziwO4Hxf1i5na8PqTividqr8pxdTDrxm9jcFf8Br?=
 =?us-ascii?Q?+p/PoiRsxqUxeVcwAIJ8CmaT3ycdTuiQVqRETwo78s+x2y15FCqH+6Pohb/6?=
 =?us-ascii?Q?P1zn4PT8BVObh295TMcYmEf9Tud8AXX8B4zKnQ0fPYGRMhbPIGQjOWgkxCJa?=
 =?us-ascii?Q?i0lSFc5GdUbrq/VCI6w0UHDuq/r621J8uEm1dzsH6LhECbH+0yuoKO8lXfly?=
 =?us-ascii?Q?Mx7cgmXEClKiMGT1lRzl5RJkIjVZFkCv6NOk4Ja0LgqPM1jlLxX9GYdPKWlU?=
 =?us-ascii?Q?MI3jqJwdvzrj+cjnDLjohrnbLHzxAP/y4ay+d0WfYIx8/J9PPmmP+lDTst59?=
 =?us-ascii?Q?xS41pLqHlrvz6dERcrHl/mSB/cRJe3b2/7Zljf37b2SwOhQkSLPNg38M9Uzw?=
 =?us-ascii?Q?NtCfWnRlNhrYj/z35vzjIec+sraMvpsqOsDloSlFtoIC9siULb2a1Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DrZ9e5v03iQV0/xbSJFvw6feuf/sU/3m2TSLfv9/mboKNOcVFbiw3Hgg1W6d?=
 =?us-ascii?Q?M6CLj839Kx8Ir5qCWTE2YAnsJglFzmj/aEmZpGVD78RvCAXhf16T3K4rqD4l?=
 =?us-ascii?Q?psOqW4CrVLlrS3ZYRe7PrSf7q8RyD1wPjG12KnbBRncoG3prujs2nha3+KTJ?=
 =?us-ascii?Q?636Rol7WT443gagnzM0+ktqk/mu42xiuRjiStkWqYwkAxazgovoe5Ki3z1v1?=
 =?us-ascii?Q?6mcrI23l/xOf3J95blKsDmA15cUKQf08k/OvoexZkkH2zY94KiWwosy1Tdr0?=
 =?us-ascii?Q?MOZjr7EamqH5aJhkjf0c5IrMd9LgBQRxlMnEl9FtnihHQglgI1ZJm9MUl+zY?=
 =?us-ascii?Q?uOthkAONrB7pincxcVRpWOV9wLpLh1sVA3xEs8vGcLCMcInfFZdeJ92PVYSk?=
 =?us-ascii?Q?FwOgMLXdkjBeoRwbQeJgbg+tsDlXpyZr1YsVeY/+SxOIm5w/wd7sJKAfsrY8?=
 =?us-ascii?Q?mpt4EGbt8t+edi3XWjZbjIAtbd43nvcPIt1qOvPWzytvzHrH/h65kFveB3Tn?=
 =?us-ascii?Q?6TghbVULuYKe/4XmWwvZ+3sFhDKRYEn/xPh6sxUlTH3G/T2HQVhNosVXSQji?=
 =?us-ascii?Q?CW7nU2bO0jFsirb+mrT/pMCs/JKgVdTzRuBpfrYv0G0Nap+md9vRMS7ipjgR?=
 =?us-ascii?Q?9be+W1FvV4IAffvYMjdHuIpaRSDUF4uWIHV+mp3dGgUf5v9JiRHl4qoDzYnR?=
 =?us-ascii?Q?8Em00gWKg1cXXg603oYzP/5OyqQseAX2Gm/I2dFaBT2M4MEadf7GpC0gM55I?=
 =?us-ascii?Q?o89KsCIwuh0tjC3EUHC9svSwtNCUT/dMYPbfyyTPQys/su2axdclUCiDqJUn?=
 =?us-ascii?Q?uP46+Z/ALs/AvEdoCbhEvDcB0GAZ1fQX4MTK6v7qZ+vmGb98cRmf2PHvMMQW?=
 =?us-ascii?Q?a1Gf0xU8pOrJZgBCxpF4byv9LCmA2pR46+gPbevztYQRKOUcMy2rG0kLUagG?=
 =?us-ascii?Q?SKrQxCcfKYfFxP6S2ERni45IsFq6OT0rx0ZQ8Re6w4H7mQSFql7EgL0Gl5pC?=
 =?us-ascii?Q?28foo9Z2WuW0sXAGH0w7r1gTbHkZxsxsw5MePcHPTuoLrNI82YAyHSYhhQow?=
 =?us-ascii?Q?XbMOEWxxmsh7HNzO779rJDdWG9l4/BsX+ZVQgghv9HfN0ej3EKPIxohbGYix?=
 =?us-ascii?Q?em3s8meD2mWU0KIL342fUqsyegrTLL5QbB57I93VuNueKV97CQ7z8aD1qvC8?=
 =?us-ascii?Q?Sq2RkSff2dPpGQJM/3t5TxuQw4es5Po7D9UNsQccqkE0qhqbzfo6mOlTMy4R?=
 =?us-ascii?Q?B4Yh1+QHe+wrfcUFRQkr2AytuSBGGU09uwyvogmvFd8XxKMeHTiMJlA8rt3S?=
 =?us-ascii?Q?mDsKSl4Lnl35EUEkKbsmqYimZO7O+WLjiCT0wzfconHzkDfyyCtyoQgiYZ59?=
 =?us-ascii?Q?yjq4OUOHVgV390OVp9JtDYAYnvUmFnlx1ZjBqpess0Mx/I+PpLtKk4VuVGum?=
 =?us-ascii?Q?3wAGQmbSrtD+V80W8p+vpcs8q8QtwB9Yeq/vrVwRNpRtx2giCDGbdfqWHxFA?=
 =?us-ascii?Q?a2y7Gvtk0HgjdRhozC54zi/nyaFfC2zvVIVvIWIGFxSH48gInzTrPw33DUzY?=
 =?us-ascii?Q?ZMkG76H/GBp0HTyy6849p9Zf7EveIJXCvr5GRyfg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d68ca6-fbe0-4cd0-4974-08dd8ec4d498
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 06:43:38.9728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: At5BlXIHLVk+GKVW8TUsjNlaPyxwPeOJVA93Nayk+l5qKoevDEz5UV3JqGxNfGbnTQYbYhd8T4eC/UmRjL7R+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7763

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

