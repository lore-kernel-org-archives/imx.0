Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2042.outbound.protection.outlook.com [40.107.247.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131D226D4C6
	for <imx@lists.linux.dev>; Fri,  9 May 2025 06:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746773017; cv=fail; b=QcGz5zOqRT+fqGPZyNtY8//nCtMl6wWhGEm4k93XzMed8tn3SzJ8+tRLve8TvoABKgyYmalB/RTS5bT+mZmRl2pyB6mJYn0oWIW1sBcgm9C6BgzZPJGR7TivIBmixqtv5fV4Q1Mgqgwdwv9w8T1g27U/GA/cZ/wtz2Wbe5pxuyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746773017; c=relaxed/simple;
	bh=eruk6oH/KXd3sxjHZCBBkNnd5bVIJgQJEOn1hOXYlUM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Bv/ua8rNzHo64W4gnygZJGaaN0EoAuq4C1h0ltGyp77jY1b6xTLIUN7chZamdy1oVgePRMvLKkZLT+Yl33mCfcxYuHFTyoiJ98Bm2V43qs/pcXmWbPuQqWpH0kB/FBkVfXMe5LJvrSr/1JrTpva0oSLUQ3/XGGAn4vE2PjeeFJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=M15/ZXg+; arc=fail smtp.client-ip=40.107.247.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="M15/ZXg+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XD+9P+p4wLe3zF1TqO9cY8dX1OowWTgt/z0+TCNcLKHRLWF7uft4ugc8Qd1XtErgqTvIq4J13UFHceyNulWbFgojXHCMhg8olM1TyrP5s+QxOcnu0xhVAZa58Jcs5PH6xyiiRtoYA9QOjIs6PirPack77eh+/h8nUXvYnACAfg1uGI1SSv7BEwCSL/+ItVRDiQQoiv5BFWN8F8nkqN9fcIKJkSiBfgZiloEMbP5toURaSQHaoN3cZpMocO+Lkoivi9Z650hNhrOim8tDCyIoyLBAHbEuNn5r0RWeWwo+cboZ0ABkcTfDdTDckXkKXfYa4jbqeKLOmh3bMDbPU4zfNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrJf9w4FwnFey9cpTWtm+raIFBIKZQxDDMAJZzFPqVo=;
 b=Fi8Qhs4Oq2y9nlprHFYTBv4EYGx8V2Cv+h4xgFA3yaeVraknlTkgZnHNI4FvNT2ifCmorwCgMDhtkWFscSILK1dtCDdVJT/soX1Od6Ok7Mph/QA6aYKEewzF9gxIC1811luHSR6xjeVonbMIyxxg0u4P8GWHWA/KeFvSjBBRat+bFW2PaSzmwPZRQs+r20xUPbo2M8VaWHgNIxbUzoTwi7bAjFmVMRGlaAAM7ZWkQjv19g+xU4mVZ8frHIWSfsVQBI2bQKv4R9ytiX1coY5XMJAjrOHFfs3OUAsPpWLpHUfToychx+/zQRDshqdA06E96VmeGcebp9GFdH0+jvK0xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrJf9w4FwnFey9cpTWtm+raIFBIKZQxDDMAJZzFPqVo=;
 b=M15/ZXg+UIbUBGoOQpurh0fOwXe9JEawIhsRpNcycXp+BCJ//c0FfNKIA6sSE0KJcY2N6WZUTKRpM4jwa5RXIGh448SpKKCxd4bb4DwoeS6/F1P7MaBzBvoxP3Tc3Ah3PqgvCjrzOMShIvkq4e1AxWqpwQLuid0bzhBZ+RpyGwOGfsMFuZOlJ8QqghYtXbdHvZIuGHc1WFX7Fpq9AALwiv48q4wojJpsD54oqEz9YN234hEPuWFKaOUCfEOvgCcLBpIblU6+HiCQv0vKloH58XY6gRH+eOFmQ5RwbzNazbquQd2sSTRYVyBlX87GVF3Mw2a7v1vS2HSmU5NB2nEZ+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM8PR04MB7763.eurprd04.prod.outlook.com (2603:10a6:20b:246::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 06:43:31 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 06:43:31 +0000
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
Subject: [PATCH v3 1/4] usb: typec: Stub out typec_switch APIs when CONFIG_TYPEC=n
Date: Fri,  9 May 2025 14:45:23 +0800
Message-Id: <20250509064526.3767729-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-Office365-Filtering-Correlation-Id: 124d0d4c-af5e-4f71-6493-08dd8ec4cfe8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XpIG1oFiyVB8xMrceyuBUuA85OxCUxze6BwYhOpXlFipChZXKSkIC1WvwK1R?=
 =?us-ascii?Q?ay9qozRoNs+tJ4vbgk2B2Ab3cDCwDsoYgM3ixSFJR7GVOfVJTbbAlwolpR5R?=
 =?us-ascii?Q?F1Zkyt1Dq1GTHORH6Pfabks+ZuV9fhejOQQeA6Yi7Y4+knTRGGXMxrOZOkPZ?=
 =?us-ascii?Q?jKUF7pHTTPqYJwI/s7JfINXN2+qGEhOQIXEzIwBSxika4tit0oMTsN1sVkdA?=
 =?us-ascii?Q?RahTq6QJr8BRieTz1UtmpxkqjyolSdZQWOPuRT22Mu5Cte6AFU18Wb4TTgRt?=
 =?us-ascii?Q?iPDcp4EXBoHtoYtngyPQ1m1vCPr1XghgOK3g29JQB7rAxOLf4ORkAWxGGqGp?=
 =?us-ascii?Q?ynwCmPUz+iVjH2hQW87hi/ccohHozHKbHyUwt4T2Twe2DwPXZ4Tpx9Ir2XU4?=
 =?us-ascii?Q?knMZ0HpDL6gkIz+8id8OevvGLU3Kb39BwIa3p8lIL1UBp2vL0RtJiggnmgMo?=
 =?us-ascii?Q?EwBv7+5AcJWMGXe/wFMQNiulfXWG/ev0YReaGzLpJxBxU3ILKMAJF+5etwnO?=
 =?us-ascii?Q?9XIEJdkkwMOJk37odNFuE5fKGVz3rlb9fZEUv7bzicdjMQPqPziP6xvMHWKs?=
 =?us-ascii?Q?evMoxkVtog79oBzNPyZkzD+6/Ap3JQyjQUC1WyhwD31uPc9F/DsGWMdqEC0v?=
 =?us-ascii?Q?LsnOH/RZ0AFcFIOZ/wTAE7qK7tRpAjq8Vtkppy/X3Plr9pYPBqDZPMgUhZP6?=
 =?us-ascii?Q?UyRaLjhJRgC1km1VXhUW97v8m07dAEvqc3Bcz+6/jhOz7YJsh6nnj3me4bJy?=
 =?us-ascii?Q?ARt3Z4UsZHFuP+PNqw8lqgZ6xhk6uDZbT7jJmRIffPoVqbrj/7N4IFh1IP34?=
 =?us-ascii?Q?eWwKUtvIUAUgVF++lTWH0yuw/AmdbW9T04Atp0uRpu1Onz9Ju1ntTyJWuyRr?=
 =?us-ascii?Q?GmusRS4R5welPF/nqy3fQFKR0C1rgsEqOM5/Mt3jLXhsq24NENWfKUbF0b5T?=
 =?us-ascii?Q?fqhYwXkILeIBHuWritkH6HHtdqQVANb+S0Jlw6PKCjxQ4uX9kA6AXrJFWJsx?=
 =?us-ascii?Q?go2vy1rX0OKsom+YRPDTnQiozZAlnXNSG+BaKDQJwe8EzmUWGk1U5Tn8MkFf?=
 =?us-ascii?Q?JCzW6ukhMWBS1sKrO59E2axjPK2QFmsYfz968WNkM8BHcEu6CXVwcQe7ayuC?=
 =?us-ascii?Q?229ouwznaWqGXB9lQP8PM4xIBUjEoJWFG4Ke+jgYqYW2mvRALCJMp/o7ZQoc?=
 =?us-ascii?Q?/5yUyNvlDxU92ZBY6HCCP+7/7BxyBgQ1FkNMCNmMCJkktC4FJmKt4ba9kT2O?=
 =?us-ascii?Q?BDkXMslYaqOxTqmUzNAO/UG/dotP6ic89iMZnUySyeZaZq9/fXr1BjYqWTd7?=
 =?us-ascii?Q?5lqpNi6JUzlaT2ht3uWER9t73LmbAgVQKAlB7gLIc15cGvUZ/vLBu5mGJ4WI?=
 =?us-ascii?Q?rOKfNHfRWCSRF2lP+7islrjFCBsM+W1VtFiJl4/n3b/x/IJBDptoq1dRFc56?=
 =?us-ascii?Q?aT8plpj6EpjIUsXJQeLyvD9RmmWC1xWY/aWBQNd3amK+ivv4l0IWThZms3WU?=
 =?us-ascii?Q?c51lwguerRFBzpM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RFWnFDKA5zjB214e3HtPZrcp0IrbQ797zCZQW/GScVSBrZgUYMEuC8iY9Hos?=
 =?us-ascii?Q?Lq2O4PTqU8WxPhAwF+quqeQRCrnDS070nHPkjJCFYBgfvkzL2Uyc9wjhozja?=
 =?us-ascii?Q?bjGhFPbl2erE0uBCWUrhTX8/gVkfAyCDP+x8qIrvdg968Lsl0/Ff9+NgX4cK?=
 =?us-ascii?Q?y2Y6j0UwkUKZ9c5baSisCTrnZY9j+Icf4qAaBz7mDyain+49zuvGkwDFWG5R?=
 =?us-ascii?Q?Fts5LPE7HeMaqIGBc7h4hwvUJxHcgU8vylHfWWns6yUJpI0DzTfvEucr7Xyt?=
 =?us-ascii?Q?VbpjDfs6dOtH2sQLh6GZy/f7HBjwbvSGhTv3vtHzzRH0+lbvktRbAvKW8xdb?=
 =?us-ascii?Q?Th3CsjsKHWuLjBmsLNXVnugFMVfxzpJXUqjlb+o2ayAfsXTJM+6R0qa+2gia?=
 =?us-ascii?Q?b4O8TOaMI+PQc74oxI59dnNsKp7sxC6asxEvpAgh7SUGImHhQPpFEjUPvCgZ?=
 =?us-ascii?Q?sjYHxIoy6GVmDUitcb6k5C/NmN9eyG8gw0gSHsayA4D4a5EGz2kOggypigbo?=
 =?us-ascii?Q?Nrd5b2SqjagrCqcbpjgP2vb5KOnagnBxycy7hS1MFMqoeoCJlOIEK2sKLylA?=
 =?us-ascii?Q?vu5O8J1GE9t430ErlWY5YB70DLgiLV/zMXAti9CEAEKouXBZ41ie1Ey26pYR?=
 =?us-ascii?Q?/7u6UoeKW6dKqeH74alCDRuzqXHO9fcHIjHdIhqC9LNox85gqRc+urorP7My?=
 =?us-ascii?Q?j4PjBaKROwhZgBmcuDlzktieRPuUi5mNMii77jZVYXQGL7W6M2hXxb+Pn7Gx?=
 =?us-ascii?Q?TKTLRNhClMOshXZy2Gwqa+OgLUYrz6atg6CG5BnpVQToGmWCUB0d4tcuCDYx?=
 =?us-ascii?Q?NjWsElWKr7mYFTE8QHRzDY2GkmT+V3e2yVz7MVDSbncCdnqMSkcWn74dM6ls?=
 =?us-ascii?Q?R3edWzkDPMhM0q6pXXNtgCQih85vrtV8VmJ5rhJDkvakwRnatDuK6aVvx3B8?=
 =?us-ascii?Q?nAa3LNW+LL8xejVkk5ghXgd+449FgIsDfNC/pztJ67zP9N5swDRAkksVHSIl?=
 =?us-ascii?Q?EXsQ3o7BFxh6/iSwzvO8xpX617+58iCJwmjtSH5/MPPPdgbHpn+/xE/LR64X?=
 =?us-ascii?Q?oCwb/M1veJpTlpYvWWkTzihN0RHLpeNooeceTwOk68q6TtN56TetTK2aHkFr?=
 =?us-ascii?Q?3DknzQu+JJOUXTJ3+giIS0HCukkmyxgFiSs02LpHuXpnI7EWppaYotN3qVDa?=
 =?us-ascii?Q?0VZoQssVN94nI/XmU2ms6NMiiItZJThFwjDZoIi8A0QCExplRYVREAXpRF3f?=
 =?us-ascii?Q?SM/+VmSt+ilT/hr+1KPC9Wnrs2D67M6s4czt7XhvR+LJWKsl2N4TZUnkckEz?=
 =?us-ascii?Q?1TCMdpNPOu7dRN4neYGLmmZzrdSAK5DJzUtP+vOwAu8QLRLrTpBmXdYX3WXd?=
 =?us-ascii?Q?rFcAlxj7QGmHFqWx0KeOz0EkWiZ6+99M/cwSbec5qVikZTLxi747Qhu8yX/7?=
 =?us-ascii?Q?4QQcgQkBeBxsE0L0g1W/R7hrf+RtTYYX+Al0KEoSEMOsYnAOKocufJKjZp7j?=
 =?us-ascii?Q?1+XaBx8ikkHs1bqD+DKgwSvdB258ImXuv7X91P+1PrdKgyRnRSDlIcIzr5ij?=
 =?us-ascii?Q?9nuh4KlRp+KE99XN7dHoDJg89mH7o4WGEXXwPjhJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 124d0d4c-af5e-4f71-6493-08dd8ec4cfe8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 06:43:31.5589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oxTgjoL6WiW7IwpIA/z1Trr8SBnllwMM32IFez8TAl3lXHYz3QD4oC8j+b+SBx2zjGTgk5iZ+vcW5SUIbr8/SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7763

From: Stephen Boyd <swboyd@chromium.org>

Ease driver development by adding stubs for the typec_switch APIs when
CONFIG_TYPEC=n. Copy the same method used for the typec_mux APIs to be
consistent.

Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

---
Changes in v3:
 - add my Signed-off-by
 - add Acked-by tag
Changes in v2:
 - pick up this patch to fix build error in v1
 - refer to https://lore.kernel.org/linux-usb/Ztb1sI2W7t5k2yT7@kuha.fi.intel.com/
---
 include/linux/usb/typec_mux.h | 43 +++++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/include/linux/usb/typec_mux.h b/include/linux/usb/typec_mux.h
index 2489a7857d8e..efb5ed32b813 100644
--- a/include/linux/usb/typec_mux.h
+++ b/include/linux/usb/typec_mux.h
@@ -3,6 +3,7 @@
 #ifndef __USB_TYPEC_MUX
 #define __USB_TYPEC_MUX
 
+#include <linux/err.h>
 #include <linux/property.h>
 #include <linux/usb/typec.h>
 
@@ -24,16 +25,13 @@ struct typec_switch_desc {
 	void *drvdata;
 };
 
+#if IS_ENABLED(CONFIG_TYPEC)
+
 struct typec_switch *fwnode_typec_switch_get(struct fwnode_handle *fwnode);
 void typec_switch_put(struct typec_switch *sw);
 int typec_switch_set(struct typec_switch *sw,
 		     enum typec_orientation orientation);
 
-static inline struct typec_switch *typec_switch_get(struct device *dev)
-{
-	return fwnode_typec_switch_get(dev_fwnode(dev));
-}
-
 struct typec_switch_dev *
 typec_switch_register(struct device *parent,
 		      const struct typec_switch_desc *desc);
@@ -42,6 +40,41 @@ void typec_switch_unregister(struct typec_switch_dev *sw);
 void typec_switch_set_drvdata(struct typec_switch_dev *sw, void *data);
 void *typec_switch_get_drvdata(struct typec_switch_dev *sw);
 
+#else
+
+static inline struct typec_switch *
+fwnode_typec_switch_get(struct fwnode_handle *fwnode)
+{
+	return NULL;
+}
+static inline void typec_switch_put(struct typec_switch *sw) {}
+static inline int typec_switch_set(struct typec_switch *sw,
+		     enum typec_orientation orientation)
+{
+	return 0;
+}
+
+static inline struct typec_switch_dev *
+typec_switch_register(struct device *parent,
+		      const struct typec_switch_desc *desc)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+static inline void typec_switch_unregister(struct typec_switch_dev *sw) {}
+
+static inline void typec_switch_set_drvdata(struct typec_switch_dev *sw, void *data) {}
+static inline void *typec_switch_get_drvdata(struct typec_switch_dev *sw)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+
+#endif /* CONFIG_TYPEC */
+
+static inline struct typec_switch *typec_switch_get(struct device *dev)
+{
+	return fwnode_typec_switch_get(dev_fwnode(dev));
+}
+
 struct typec_mux_state {
 	struct typec_altmode *alt;
 	unsigned long mode;
-- 
2.34.1

