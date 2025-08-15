Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011064.outbound.protection.outlook.com [52.101.65.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D663527A477
	for <imx@lists.linux.dev>; Fri, 15 Aug 2025 09:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755251286; cv=fail; b=Hu/rs+oStvclrhAq1NY0PVKppr3zvesvdzahJJE40RvcL5rSK2gIZl41nGADk55mmsY+mRh0/qouZ46I+omCzib+4ydn6mFdvwBWbUGVU8cCnZkMt9ZrdrmQ1Cid6HfgnLvVjhuCU3fHh3DiGLrRDPL547/Qw0qzvZpAtRnxBMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755251286; c=relaxed/simple;
	bh=59cT7tGtuNqIJmodSFa7fDHI9SWBvCR1uJYWC42hZs4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=mwxy25WVxdnYEyEXuUoUTWbJjf+zxssRpyDryKhA02trZhCSlxYDRcpb9BlUn56Ho1ltEsldH7Iz9WwhMNrjlTxyDt/qgO7Gx0h440vZLUSE/8ZzTrFhbRCut99VUVz/EBjwLSPJjpTSqJWBAQ/6mI5MiIAs4b1NfbtKcfpRMHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=l6P9vAax; arc=fail smtp.client-ip=52.101.65.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="l6P9vAax"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KSBEe71ghI/0EPKQ5i/WA0u/iCxbnU4b+bzwXNTxlR4hz8tZeob9qZBHEGL5aMdx1cn6bAwytWa8QfQXSW9fqDzvtfOVeNieLH3Xmfi55gOCgM1UkmHQjer7dH9uMFc/kHVjuXk+nDsXu0HGXaFDrXXSsRkUl/lS1wnjx/wGc3y+bp+oxyZprGRepmr8gBvCuBuK51JV3TUqY/nN7kmFxgs42FzYEZslysmD6XTFCI/A+6God1tS0ofEcfcuTQETASHJ1CkfNyq1YauiUGRbcBASwYxHC/eu+9Xo8TtDQI5PHxfzmeF4lvJFY0YqZxk1Kq9HnzD3RBaPNL690jfdFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7weeEmwtPq2LLt3u7wf5SGruTMXFJRmUo4QXF08ElY=;
 b=RotrtK+07PVN6p1JPRY1U2CWf2Q6CGFqTfyYyr99ivgMT5knRGDfHCntfNxs3xjl6du3vXMMKvX5Sm7EjAhR3zPYRTX4mbfRniwq8uh4aiMOTv9ukPLv6c1KRvsDov7TIKh/23pvcwCPK9CCJvDJKRugV0zMCcSerptxfFYM0523mcm2CEg8VV4VuBdmKAMpEmDz6OABEIutFF82dXLjK64F0lSTu4KQZboUTbK+gUyoJWIsYRYcoDOXiZLN77uYv01GNO7UHWnjmLvboaCRjj0qgDDjCvUxwM9HbW0Fo872oP3rVObNCC19vIfNejVRc36CJ3oLDUBh66LCLZk87w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7weeEmwtPq2LLt3u7wf5SGruTMXFJRmUo4QXF08ElY=;
 b=l6P9vAaxOz5Chz47fj2balLfGxlPK2qshZ5rPHeVWRYb/2earDz48TCvru9q4WHRqKAXyXur7I9pyDRA+GuIdKy+U3OvOHety47H1mE5CtMyrZHmXq1OVkWGP0ZkePjb7SQ6VN9QsdafPIMsgw5xpwzXkPKRNXw914F+Td08HIdHcQB2h/Fv1ph2xfWcLf3aPnzFo4Oz5IsoLpDeo85oz4hYPENCihQmwzLNwMW56/kzkJqhRH+SigpPbdrsi13zdDZeBIwF+l7Uhvxqk8ElmogB3u5Dnv7Sj8g7T48j0lnz/VfK4gFlw8LtLGVd9a9uVJoCzAK7el1W/g/jvcGtWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS1PR04MB9557.eurprd04.prod.outlook.com (2603:10a6:20b:481::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.7; Fri, 15 Aug
 2025 09:48:00 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 09:48:00 +0000
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
Subject: [patch v4 1/4] usb: typec: Stub out typec_switch APIs when CONFIG_TYPEC=n
Date: Fri, 15 Aug 2025 17:47:30 +0800
Message-Id: <20250815094733.2353916-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-Office365-Filtering-Correlation-Id: b5f37e06-739f-4228-dd6a-08dddbe0d257
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|19092799006|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IZssgCEtC5Hkin4ng9d1mGWRs33Cb3G9/uKtpwJ/KcgBnKlE1BfL4H69m1/G?=
 =?us-ascii?Q?GgZdJjexUUUFiP6hwza8maq18wp3gcBtjYvC4Aq++LiqjIhwKeEPIXGSvgOh?=
 =?us-ascii?Q?76z2EYI+/mlR3BMX2of6aTkqxwerWj7tuXpm3RyQjHRyqQ4vSUsSyqWN9eQH?=
 =?us-ascii?Q?X7rAhbhXPiz89iZiZ1rEntYvF5L9bLOF3zc6pKMgwtCvbYWpFbZdU9nkwDhZ?=
 =?us-ascii?Q?IiOZXREw2vVQqFfuds/bwLd+vw5FeWQToPImiqF1xdGJ0qiTtLD54vByYhLo?=
 =?us-ascii?Q?6rx5sMlDT25iCj2u6xa0DYd/qQMTm+oVfLpa3I2Y2OnKb24/OwDaP7zYHBT0?=
 =?us-ascii?Q?dxVFcrqjouqYkGwTLq+aOm3PaJVxpBgp4by0nleF4B6uvXRl/MrBacTBJmvA?=
 =?us-ascii?Q?0YPU6BOQBbElwQpHo6HAm7RyvlkFf3fQKy6wnCGviEYLFo3bfP9WyV4LR7fw?=
 =?us-ascii?Q?CDRXILrtr30DYjj99h8Rhwufdn97rmaIlm6zGKq0cwqNCpUsACenwiecMDXy?=
 =?us-ascii?Q?VMV1SD6sEkTLA7kspESljdxszGZ4RpGttcVOv3dKrlvHARpkv7gsRww4W7Zr?=
 =?us-ascii?Q?JUzv+p5BBD9RRi4LsNV2ydIeGEoWL90F1/5WPTE5dHhadBRGlEDaRh9BsUO3?=
 =?us-ascii?Q?cq9CliA2fJ9CIffXmqtdIXEr9lcVoi5os7H2bh37JW1iJsaNHzC/Fo/fPKAU?=
 =?us-ascii?Q?ZpQ38hQsWwjtW7HJ3Y35qyErjTqlrUrVMhUCwIfW+WM2zZNeXJ+nPtmaozlb?=
 =?us-ascii?Q?NxNxQIGOyCxSaTt7oJi0+tOJzPCpy7nACrvcYkZ3e+MEnp+Jj0AXOZoewm+C?=
 =?us-ascii?Q?S8cnNFRQ6aUzxYq2/AyQ82W3ReNyWctddx2/Dm73BQQHAKSVRFt4mOkxu9vL?=
 =?us-ascii?Q?uQh9b9vMaW06LYkQZqeI2lkf2zSmvwBEUzb0WSNMOAO77q0l22RcBzfsctFI?=
 =?us-ascii?Q?ZZyk0+o15eVsYXeqP9UayTjZyNR8FRp9tCMoPiL2su7LR043DzXUprau/xjV?=
 =?us-ascii?Q?cD61dxptjoE/t8ZeO0osL70G02+CQ2Irl7H1iyg/HmtnsPy3WI7RHWJmT7CW?=
 =?us-ascii?Q?NSk0S3o+/pjnxkK5ppeAFBMR37c0GZb2DsrkLyXyIw1VIIK8FKVjuB6nD136?=
 =?us-ascii?Q?FDlq4Nuw4DWX9JsBCmve65a75OvRl7c+pSXRlNLF6RPeuFb4sFWjEMlFWh7N?=
 =?us-ascii?Q?pjrieWR3zcbJ3Oqvs+yn9Tf4E3/UCN+N5EPB+DnBzy48KSLGLla2I3JhbKxR?=
 =?us-ascii?Q?AAXlZ5P6dlOV6mzkYMC/YVcqvoV0zdZQRJ/7EXF60bUTvm0vGpYY0L8BwlaK?=
 =?us-ascii?Q?ros69RQbokVgSQSChddvIiUurq2pNSn2nEwD0EJmyoCNF0IUX36W7qgRG1em?=
 =?us-ascii?Q?qujoT0Q8TxvVzg1cDp/216Spkt74Stsun3JTUf66997Y21IrJDRCxFBrXS6G?=
 =?us-ascii?Q?abhsJRWo848dQC3Un7OjA4mhM8vXOo5pK3IuipqwVe0HQNFGJolOsiatSao4?=
 =?us-ascii?Q?35rU6+ZDHuUjRIs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(19092799006)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D1vJ5XgYiPpaQC9yvGH5B/ekxBxEI7V3FK2Du8LV3CzL/Ufiu8KRni4iqTkm?=
 =?us-ascii?Q?oXMMtC3ova36h812g8tAP2nqVdifWE+MAlqE0G3KwjnJPHgM2mO/gZ8AACeC?=
 =?us-ascii?Q?LmP8cy5t4OlAqNMmgu6Ye0v7042fpgQpZ44aaqTY4EQ8uPv1A3IXpHT0iCjh?=
 =?us-ascii?Q?vtALILKLpjihfm5jbJ2YznKv6M0vzeRp3qNkXHS/ZZaiyuriGK/LcNKQhuRh?=
 =?us-ascii?Q?XpBJvUEdMOb+rT9tZRawFHz/sdMcbSjAI3zIb2Jptkm9HsxLym/5jgHAuKjs?=
 =?us-ascii?Q?kqzerjwziFpGnT9DrmSfM/Uc5BtBOBqcpMrqEumOK3lwHgIXFzX93SOUOTBj?=
 =?us-ascii?Q?nlp/zMCJ5chIzGYyxSI4t+PrOa/Snbwhp1hcx6uaOjP9y74E7XZ7Wws/HAUL?=
 =?us-ascii?Q?ol6zkZY5roluCQol7podT2z8X9qDmYoWPG1VXKKkO1+MngahYWYp6vQ4n8SW?=
 =?us-ascii?Q?oAAWD88xcyHEYBk+Hk5z4/aqeO1rc5HWjehuvdHR0IfjbGzJJS2PcjZUlges?=
 =?us-ascii?Q?P9xqW+wmCcoiCDOjT2pwBSxvBRK9oR15N3mVkbmeCt63ne+g41j60TfFjaKx?=
 =?us-ascii?Q?EwpwoRR5ZCkEGyrToOTMt3ueDYzhiDhHM/bnedHBSxEMEdNuXpcMQZKomtvk?=
 =?us-ascii?Q?4nwb2dGmDlGnVK3hbAYbsTKl0ITGuAeRfiTiws+LjZm/LRW4NiHheegOIJH6?=
 =?us-ascii?Q?HPdKZOWiNzCUjiAzYuACi0h1F8yzD9DaxP9zF1scmbLt7j9wllpytBICBPOv?=
 =?us-ascii?Q?WakDuPSFW63srgeM20+Y8Nbuog6m5gw1imNwVBZLRHRM3/VmFU+dbmcnFkp/?=
 =?us-ascii?Q?gj6r5xWHamubvDUlcUMyfwBFQE2uu/3FdSCfNrga/NS9bLelw44L4GxC/D91?=
 =?us-ascii?Q?AF3MRcrKOz49cJYV02WYuUivbJPevKQbYqGArEzjJ126taWz9ikTcgymBi7B?=
 =?us-ascii?Q?QOGub/M/CY+OU3fczPhi/maQmm+e5lPyxx/n7aYY9weyrr3EYSFAqpW2zDNJ?=
 =?us-ascii?Q?Qud2ZoFzO5wBl+geO9Sud7bDPvXQlPn9hrZ3i1UQdBVF3tD1d/klrCX1cfLg?=
 =?us-ascii?Q?ZuW0qmvTtD1qc1UL7qIksNPWuf0blPboVtihAJ4FX95iV4MUZD3HkHW+LbD/?=
 =?us-ascii?Q?VIc1w77GlYKhR59St2Sr7G0/U1nrab17AsTESD4q7RVnNjexUSx1Bg2CM5fz?=
 =?us-ascii?Q?vihaL/Bn6J5GCcA9HctMmA/m8A1QgMINvMUak1h3HjlHw0q4q6kZbgig0sqU?=
 =?us-ascii?Q?/OFx7Ab+Xn3Q1S6D92N34mMC9hNnADA7lEuVRjjXRcCZm7pGxmeZ8gwrepxm?=
 =?us-ascii?Q?ngN9QxvmwCyI5UGs9AmS/8nR9bYe0gDi/jiZYaqJwVPLPh49Vg07RD1JqvF+?=
 =?us-ascii?Q?jM7fljI5MOs1FrfkaXMGs7yIoBmZHhfsMfYHn6IcyNVYVFZXDsltAB/enngQ?=
 =?us-ascii?Q?S00yX0j0EabYTu+RsaZX1TxyRrNWv1C5NuPxM+2aAkDfGZmRga/4ZLfqjpat?=
 =?us-ascii?Q?AJ9LDQE2wdLhYN31mJNogr/a0evKpfOJjTNjsEHyl1tK1nDbUhcq8hbvVYjx?=
 =?us-ascii?Q?n7gzutmfVi17ESqhA8W08dLJHOVG5By/3QYMte4w?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f37e06-739f-4228-dd6a-08dddbe0d257
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 09:48:00.6648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z34p3SbeOl9tfvluruiBZ51qa7hdYXYbVDkplnXhc1DiMiloZJ4SN+wVApoeavJ2M2QOIeKWGMwgdTlGuVcmpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9557

From: Stephen Boyd <swboyd@chromium.org>

Ease driver development by adding stubs for the typec_switch APIs when
CONFIG_TYPEC=n. Copy the same method used for the typec_mux APIs to be
consistent.

Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

---
Changes in v4:
 - no changes
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

