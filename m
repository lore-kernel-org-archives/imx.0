Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2069.outbound.protection.outlook.com [40.107.20.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEDC221FDC
	for <imx@lists.linux.dev>; Wed, 16 Apr 2025 10:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744801085; cv=fail; b=PJjrh2haD9UXGvtig0Src7TTek/vWJ9o57bm64MEkNKrxXY48yG/uVblDtrcEByyHdRIyrSzws/Pa+VcsylWdxoios3iGmN8wwZEilrOp9z0Sk6pEIARU2M8CrRrnQWRGaFiEUOM/bvPcZCCTqJsYjuKqNkT2ev5XHupUgyxp5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744801085; c=relaxed/simple;
	bh=7iaxQTZGK+jPWczsNlqh3ov7sGKepOFv5doYfu+3qi8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=boq0SAW+0idz7E2d5N/BRpKOAf9IhLQsPguGIGPv+LtNdM/c7B26YTlqYPjJmfhVwDUQaOXAPi9q3DZw/CDkMnN752Ua8rzz/X8JxkSPVSge1jTcxcdB5AafYaZbMQwUx8qq2bUwROWyBLbYTvCGXYcorGxL5N0wJf2r0ZRKbeY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EmtJqGFR; arc=fail smtp.client-ip=40.107.20.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EmtJqGFR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gvYUg/whlUx01HMjtG2kTdrKuPIQnLYZySzZKVQlgUKwgbPxdqTVz7y1pLOzCIm8/RdT7DQ62jx2C5COFDvnLMhOarOTh5Vr6tPjTBh6P4pEcFlVorpJ3dM3LYEVDnBW2v9xE6pnwR55x1w1ldKIdooBrftAIXbrpntYyEvR6cq9jgEaLBMk9qYpbrylboGKRT5cvATXcwnLCh7FRoj06osd2rjWbit1+2wUjodJXSN1JK+Pfj6S/uP+sbNFzu/1fPETH/G2UqehSP3lNzTYpvTAk/oYm6mF0LrIU2yGbMCh0tXt0Nuh8yFg+M6NTW2wdgOTQw0KZR7c5jBNbybmTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVNh1G9HAeCCKhQCCsO3NUigF0wY9EanSod4XZYPtgs=;
 b=Hg+byDBe660gZ7gmtboAdzLD2IWK0RdlzDLCw1cEe2T3qIVRug63XDPE6SxKZim7/TWiwEx1Qcnc4rHsaZDQz5/2WwIhEZIHDiRU+1XBX8T/0KfkNr+gA+GKJcHFrKtE2rW5wVnsBq86hYy6A0Z/BROWTpG3zN3TDaZKR/lNVl2wQR2/XUGQ6MttE9lFXPaxoaaj8W99CwINWddZ0a1KksoaR1Nip1sH2zMmATZjac5sPOs7ha+XrH5Ctoq1alZW8jxLsrdynIRhQ3x6++UxN48sFYH4GemeaS16sLyEgnxmiujy0fe04Hkngaoev++o7WD9JnnZrh1DyC+U6LM10g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVNh1G9HAeCCKhQCCsO3NUigF0wY9EanSod4XZYPtgs=;
 b=EmtJqGFRnlr0U6o3POT+y2RSHfSSI1O3bli2P+cycVYXhHl+EVxjk2AK3hmAFn7M9IH2GU6tptJSN6V5h093sz8q+/7pruYvxVfmRWS8L6MNbaZz2+WZmqEexqWGf1kXMkc8095mxpzZJoIzRBph1RjfqNIGthudCSkICz99Akq7wAMegM96SkYzLTHT+LzR3SivRQ91S9WhHhY0QyZ/Ql7qWSeFBCRO+RsIGoQVV4WFQv+8No4/oUkUcKGrHce+gufQ8HaLKzhLg0lkUIm0/4KvWkN9TIhFKf7sKtoSmFp0ov2pRSt2UwSEdBPzKs0KqKCq8wcQ7N4kFGenfcscdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV1PR04MB10106.eurprd04.prod.outlook.com (2603:10a6:150:17d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 16 Apr
 2025 10:57:59 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 10:57:59 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: krzk@kernel.org,
	myungjoo.ham@samsung.com,
	cw00.choi@samsung.com,
	robh@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH 2/3] extcon: ptn5150: Add Type-C orientation switch support
Date: Wed, 16 Apr 2025 18:59:39 +0800
Message-Id: <20250416105940.1572672-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250416105940.1572672-1-xu.yang_2@nxp.com>
References: <20250416105940.1572672-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:3:18::21) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV1PR04MB10106:EE_
X-MS-Office365-Filtering-Correlation-Id: 4af7a2f2-0cd0-4e6f-b9a2-08dd7cd58d07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ec9QJ7eZtcO+/JMa/znF1ql7lMI/9ne3i/XlFwtBBKzyMQdLvWATd+439HQT?=
 =?us-ascii?Q?dA6k26Mp84eDX3pVL1ifA37PD6QyKO2++k8hEtvYHATHK17BF9XoxFF23lfQ?=
 =?us-ascii?Q?CokbEPSq85KJulJl7Lnpexn3TpmZU/kToUSivhcZUSOZ07MyFrXTVrrS05q2?=
 =?us-ascii?Q?ANZyZKj+FbxdCkZoVHcI4etJqR5aizhvcmGxk5QOnjfiZkztXesBiwmXS5Vm?=
 =?us-ascii?Q?5Fq5U3aydLWEY7M17ur306sfcWfcuvNNAywNfApyOlr8wkOx71jzy6sJ38yX?=
 =?us-ascii?Q?MaCjnvscW8DDVCws/UVRVmad4Hxn++KTWULmTlXUGAPvESY5G4d/f6V3DbOA?=
 =?us-ascii?Q?oOcihlJLlCPhjJgJnZ6ml+1sIOFTq9hNFv0znjjOOd8X8A22WytWoDc5qx0X?=
 =?us-ascii?Q?kMr0mjruCu8aqZmJQt1ZW9/4FA5J9qhvBpzsBEJ7dkhBd6m+NEkfwM8qyEl8?=
 =?us-ascii?Q?1dK60ABYXA5M9VRsyXFBYvQctCIe2Nd8/RLb35Hpl5U6Rswv3DYywxIRNUo/?=
 =?us-ascii?Q?KrXZiCyX7K9mOJunL6MYcZsQml1R5AKYBPoL2d6n9hMUz4HIxdYNpo9055Wq?=
 =?us-ascii?Q?iqjFcBHEGQ0KtIWd67et01LhyMEVr8+wpsznHDSTPsAWxB6HyigGBb6LqScz?=
 =?us-ascii?Q?dExgQhQ1XLkQIQCPD4lIbHSXfJzZfnJGwEcFWfAhpGwlScMOaVUi/B+2elyd?=
 =?us-ascii?Q?gsD5vWZguu8pcv6wVQWIAM/WjvgnrYr8fqOzgQt+wPhrtyMhx1kiB2EUXQD+?=
 =?us-ascii?Q?cMlqiCYic5OEwE062NC5VlHDGNMNYY3//c5x0ljfrEz6toHKQj7n7RDkpVp/?=
 =?us-ascii?Q?KkkZX10JwC4wYINiskpMuY+nkpXmjB5qbc9S2eAJ9vIthdsJ3iiJy/JENeW4?=
 =?us-ascii?Q?8lNRpq+pTpnrYpUi3nOq3/kTRdN4GIYK6Of+6hYN8LY+FOK+nfc3VxAMYKnV?=
 =?us-ascii?Q?eJy8vogHPH1rZai82+jJ9vdCNNZprQdxNBokX016VBma6KELe/xaIupXbqN8?=
 =?us-ascii?Q?M89ZBfp9rBXjv/pXb17IPZOUOOP8hwBaJ3DUOJfmbsinmDXweFNHH3fH/X8L?=
 =?us-ascii?Q?WDuwF/SO3gEVbq+diNG3v/mX0MFSfBesVyXXnbM7mHv/zUrv6CPXhGmRet+t?=
 =?us-ascii?Q?UvfDf6du2qHDKEL1SPF3V/1B8NZyop4XerIWXEYfO3V1S1xEqGMyWeW4xoFW?=
 =?us-ascii?Q?kqmJexmSS9VDuMdZn5YDA06pwEjGqeC7GVL/64geLwpMTpu4/CfjB8xmBybT?=
 =?us-ascii?Q?w4S3PEvWcdscitLvx7V7wovfbhwpi2dRneJxZBdZeMbc50CAcJvQMupeo503?=
 =?us-ascii?Q?Qx3fmu/N7ubnXx7GMW4nLXFowJKq73Ofi3MXnXdbjvhnGO0IRKENjDt4Sjh0?=
 =?us-ascii?Q?Bmvd2WUGbu2j0EuPPHY8sUC5lizZaDuJO7KiVFMwrWhXDRA2rgEuW4GisWp/?=
 =?us-ascii?Q?oTa0wmXqzZvfm0VqJLWR68WTZvUZbZiDS3q4cqHeBQXIAo/QSFFkWw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?irTd8WZGHYIQJ2p7SC+vi6aW2v6fmAXlqXh0weyVkLfc3v+KNc7uP+I/yqKd?=
 =?us-ascii?Q?kJ9A4KyIBLl8P4oHFf4CZaX6WCXFaM5s+/0EevzfObFiTnfDfM4Sswsibykx?=
 =?us-ascii?Q?vfrsTVW/pdI41cxtfTVPq5wOqP4wOse9DWd2UbVXRZXUlhSaWh6fmTFIQY/F?=
 =?us-ascii?Q?ciw4FoHgkt0iKlU/P9n3RdBBteAOnjwE/iJ3/FjJJ+Fbe+XE//tJjoX9ZOUx?=
 =?us-ascii?Q?K/JV8kF92jQfrggZETnMRv1DB2Hj+i/RJ4iiOWaHJuBMM86YwCSUbcDdjqyt?=
 =?us-ascii?Q?wYe5Ou2VdtZNTKfns1pZvN1Xu0G85u2WkIDAUUuycq7T2JlRgE1p8hWmHajV?=
 =?us-ascii?Q?QJk9Labuqg/g2Pq0XDI1do2m9eZtRJV6kQ2MVfaEXcwKTKuLpDCQa/FC27/m?=
 =?us-ascii?Q?chX8SFY43RrGqOzFyE7m4peY3cXhwLkWgroi+KrRVPjvOKSwD+TfK3UrHb+Z?=
 =?us-ascii?Q?LorSunKpeDNXx43hFTCor9sGyY32LbQ7al//3aFBVottbFRIxNTbUidZ6oGi?=
 =?us-ascii?Q?/0s8r16pNY7DCwndpWdULBWK+hi4LmPEKj27DGROQ27HPlFrXwKKQtoXM3VV?=
 =?us-ascii?Q?Wzff65KW4EY6859XlmV+WV5l3fYE5cLW9ApvIQ8tSnBJJe2ZKXrq3K63EX/K?=
 =?us-ascii?Q?l+Os3zaVEx5SvRaZRm3+TeDf7k0KBPfiNTnkc0bqCCcgKtwONbKIkz8awcns?=
 =?us-ascii?Q?CYM3XVVg64tzgccUVKFLNBuy8PCwsOkHmLyPZTRD0DbXnAVdQQ4SCOw76dfH?=
 =?us-ascii?Q?gJlrIBNuj99mrfKTRvkQl6qaYEgPWgOI7oLts+xoKbWTSSPgQJuSer6YtJ9x?=
 =?us-ascii?Q?q6xebKzdHnA9SjC7wFa3peftLPMCJl5Nw8XYTd0suMXfRPys2wpMGXqNY4Y/?=
 =?us-ascii?Q?6+KF6NQ0jyUrRCs4OMtjNWda8y+c9HD/o8G3PeIDDhY7ZvyHOldhrKhcQREj?=
 =?us-ascii?Q?fhyDtolgxRGlq6n4l8A2C7gyPi20C8MW1eNGhrsN+0dyHNkbwuxZXGnNHmDh?=
 =?us-ascii?Q?PFkYRKOvJPoC2dPmAShUW2El6Q/RQq+lC1GONXPjA2pcDZr8FBEIIkMxr6YX?=
 =?us-ascii?Q?IWMZTsJSStE9IOTBs7u/0zIrWC62s1pqJWlnF51etZYHvoJWKkFViVhkqBu4?=
 =?us-ascii?Q?3fTn0+cyW58jUwUz/uyI/xJ2eOPZccGepT8v4uTNt3N1lrCfRDTgDJIIxDIa?=
 =?us-ascii?Q?b9CNrUaSzjD6j/RE6gcwEJyFdfpHTn13JkmYT4CMOjqHD3KbiY+m+3IwjuDR?=
 =?us-ascii?Q?GvD7o1I+kNLQgEyC1nHJT+H322LNuNSToqYpG4mgHDqwl5Bcnr9ciYUCTrFT?=
 =?us-ascii?Q?zU5XsGbcZdHWY3NedYtGJonvNJV1QQui2mCZvXlGrznD8sMSjvQc8825IKCG?=
 =?us-ascii?Q?0Y1gmwK9fyng/T3NHrb5QqEW65AdIW4jDQm/4lefKsKT10DWoeoDFCi0wl/g?=
 =?us-ascii?Q?ngf3qAYgr/KEPM2dvTFekrMd19aPeVPjnt4/qeO5IF9xJwwe3Q+gIAL8ttUv?=
 =?us-ascii?Q?rznfrDKg+uOh7UEObcn8iMDDlpZ9G0CCOUf58Z6bwSPfjMYOZJtIX+Gu0fwW?=
 =?us-ascii?Q?tm0QVy+xeXB9SH6LYHC8try1cealD2kWH1olqHAG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4af7a2f2-0cd0-4e6f-b9a2-08dd7cd58d07
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 10:57:59.4518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EzMXhBlgqEYP3FhumYR0JyZCvXK36KEpP6u8URvEF8bZ/4kEubYVzgZgnEdIQWnFj30zL7YAeJPBpxk+K3DqJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10106

PTN5150 is able to detect CC polarity. The field[1:0] of CC status
register (04H) will keep the result.

  00: Cable Not Attached
  01: CC1 is connected (normal orientation)
  10: CC2 is connected (reversed orientation)
  11: Reserved

Sometimes this information is necessary, so add orientation switch
support to correctly set orientation of multiplexer.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
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
index 78ad86c4a3be..b7e05d921c79 100644
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
 
@@ -72,6 +78,7 @@ static const struct regmap_config ptn5150_regmap_config = {
 static void ptn5150_check_state(struct ptn5150_info *info)
 {
 	unsigned int port_status, reg_data, vbus;
+	enum typec_orientation orient = TYPEC_ORIENTATION_NONE;
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

