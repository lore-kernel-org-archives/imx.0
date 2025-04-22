Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2043.outbound.protection.outlook.com [40.107.21.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319F01F17F7
	for <imx@lists.linux.dev>; Tue, 22 Apr 2025 11:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745322556; cv=fail; b=WhdQD1tBbQU2p2Nc3O9yTavpYODeKMH/HASpZpf6Vke5ph8STLiTDE1vIRyEMhGqr5P4vdgq7CuyAplC2ldT+wHq5J8ttU2R23kYp45CpQDVMDiUSJNPRVvZFg5/w8IvAGO6tZlHbkjxZvJ88/H749+VYhof8XV5HOgVEYrnvCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745322556; c=relaxed/simple;
	bh=oPLWWJgUny0EgQt7AFjrxlRLus9pX0hnvBzBdlk+Mbo=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=lvp6D7xFxQoRvSdcyLMfUFzz0GK4zh/EorcbaaH9ukiBw8WwGsnZC85zJ3KVsujBSTVe+D9i49On0d85D2iX0VjbAFYIWlPy96gKmVemmOTXiIqz+rlZKnVh1Vak2dCq9TelifspTJnoMPWJ+8wTiCd0aQRLfM0LbQJmxf8obzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IuvDjEpx; arc=fail smtp.client-ip=40.107.21.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IuvDjEpx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UuAm+V6kjf5BcqHnASCcO1ckyNVNTuq2pF9Dphm9sKFW2tj3fXljb+PcrceIaTCKcxKQEsGR2h/ZY4xfXZozLQFSyG4W4fc34p8JJXlmqxset+ZuE0iSlrI4DvcI4hqDEOdKgxF9fPJmqZgTydQkWnjZfT/Hy32aUSMabZ+YZRY7wIythPTb8DS9Ws0kEKPcoHEJDnlcV094Heom89cOcg8+dy9l7ETJngeTvT0sOqmbKps8zFZ2P/vP/LaW03l1WzURtDrdUYetnYnpWWF1RydHD7n7o+lq5NWDa2L/krdSTqqpXItPCzPiY+60YUyNoPbW2gd3/Y/KXQhrN4zGTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Lf11j/trWm3R8ZM7oVrzXY7jn06kVbljcmIpkjIPR0=;
 b=ps8PbO+SW+3bIQuJSi329kPcS0OjfHrFSS78X1Dfqs9LpTcHh5CKg1MUmV46PICFkCA7bucooYogOVySWC77OYyZOGAhvkHkSvKxSP4eA7szQDO5viHfscp8nhkLIFKDy4T8oFF3yq3RsRkRWI5krQ6n2Lll+V6MCn6nx/PpPk943szE1l+EBRkoHmlRVWOQrkUucxm76j+IgfJKFOZLMVtUr3+ycu3nyHQLrin9OGJjcIAccblR6VDd9u+DwP0O3iQgvYl3/e+CRiwZOGOz6nd+QIILWFAdPxeswBECdnfXWdibwbGAkscyGQ/1Jp+4aMhLm6vKZyb9FDx1l4SA/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Lf11j/trWm3R8ZM7oVrzXY7jn06kVbljcmIpkjIPR0=;
 b=IuvDjEpx0CCzV+7yHD1sx9JJblbz6bSE3YHUPvK/iZVt/9sNMZKeWSwp1x5vwko3FSUysamH9CDTJMc/OeaUObCP5xlAvnAT4QIne4ieUFkYiksxEgysUtEimw81YFLarWv3pFP1WmpJWk6JggYYC6cupG17Q1xz8cpMITWveA6DpaWmHRcxfoIlZQpZ6QBOuGH0XWfenJxa22iXbKwds2m61v9VlOYEtcSpHgaz7AvJPtoFfyQ4cmIpUX4FtgRZO5a/AzjhI/26o0DALcjXDRajWGzyi38QaG+Pha1yOZkGq+nX6DzO5mZhAlxVWEy8QSSChB60Sp7jSunWnL/kQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB7736.eurprd04.prod.outlook.com (2603:10a6:20b:2af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 11:49:09 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 11:49:09 +0000
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
Subject: [PATCH v2 1/4] usb: typec: Stub out typec_switch APIs when CONFIG_TYPEC=n
Date: Tue, 22 Apr 2025 19:50:52 +0800
Message-Id: <20250422115055.575753-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-Office365-Filtering-Correlation-Id: c443a7b4-c9ff-4e15-d2f8-08dd8193b10f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?amh4pZUVsHDEyXha1TmUx7UM4V8fAqq8k9QNhaKsyZ+Jj72O+qGFiBW8sHrh?=
 =?us-ascii?Q?hFGzLCkf9bFnJbVh08LKa8z2L20brCmA2fHtlfZkCE3VB4xgwLT1FBehVZXB?=
 =?us-ascii?Q?w86mKv/LccdB5lBdAtsXn4nfPtWULUUP0kkcbunPelTOC09XrdTMNnjlPC/g?=
 =?us-ascii?Q?qJE9PlbxKKAjaJR0C8CmUm37TfU2oDizKyTvK8VjrDhoyom5khXxtqEWrSHG?=
 =?us-ascii?Q?Dwt7QYg1+tsOkFeQhvZmnoSOfFH08YxOgP5cCZy7U5y7NmeeD4Fw02ofavaw?=
 =?us-ascii?Q?lrWutGH9SOx+Xk2a6hSY5RiU9USpF277i539LJ/eMl9PHnVwI0lxAvd0Bm2I?=
 =?us-ascii?Q?JyTqPUv2oKYcse0A5/YRYbXupSd3aFpC0GnbFREsxA4DtkX4czjNme9SQXPZ?=
 =?us-ascii?Q?+pcKhIVNamGPzGMTo9hezDHP8bCJ0KdX3Xzw3yatkHAzxNjepySMhDUb7G5u?=
 =?us-ascii?Q?3lJxcgCgO+QhUGqPMAEDp31NqIqmevHIkuD/2A8TVd3JnEyZUki0HiH/0M6q?=
 =?us-ascii?Q?KTSYSN7pkYZNW9ByYfN2Go+ioKECrv9Qxoy5CjdfsM6Muv2arfckj1FDqAH2?=
 =?us-ascii?Q?x58dUcrtTbdRNMaWa+izlK3dWELGeuxTE4vp+SnkbgGVI0t8goGKNiFKdCak?=
 =?us-ascii?Q?FgDbLZXoLC26bLliH03aFREMeOx7z9PkcNmMzOM8kD1LePr3fUUVSZW9HPeV?=
 =?us-ascii?Q?JD+8HW8y9MRYgKIyanBTh53lpTGT6KOrhOQi1zNcy4krJ5HhpJ6l0rU6h6fC?=
 =?us-ascii?Q?bJwlRV49pJ20xPM7NOtkeu8iIwNaeIoR0n37Xry6oyYt8Px6ifyUTKXHxSob?=
 =?us-ascii?Q?YvYR+0KWPPWwMFYunvLtxPRAGakjHpks0TQZxLePQKAbYwlYZX9ZXd6uuNIS?=
 =?us-ascii?Q?irFFC5DEiVnyMd60cx4vmmiCr8HWuaGHCKyB2ryC8Cbf0iGBZobguWBR02k9?=
 =?us-ascii?Q?LSeSCJl8+C/T//Ygw2mIJpw9w8CcQGM+yQNj4S25to64ZYiC3Q9tE3ORKIUl?=
 =?us-ascii?Q?x409T1ha0Wh1egdPwqMwh8uvGwJxCOkBx8QaiqqY+vUD+4Noe5sUV7Rn+E8N?=
 =?us-ascii?Q?frAovgNXaHucvm/IhoGfrMaZ+Gn80G5DsqDbsBiqABdRIP9QiBMb1mZ5Xibq?=
 =?us-ascii?Q?B8cjt6+6VUhKo7bcuLBXEKK34gZW7SE7f4fzpF/QAoBrWYHFtsXWS5gsJckw?=
 =?us-ascii?Q?zHSBJWVfTa6QJYIiz47vuWk1zzjPeGXvm6ITJdowWDTHUIQ4ZD0wj9tDXCcI?=
 =?us-ascii?Q?6SLYZuZT/lOvoQl6+WYkzLFslLZCjgNMK1+2Ng4TL8obImKI0lyYaxoaerAS?=
 =?us-ascii?Q?Y53cQhP619jpYngex4J6RE8C+td4AI+yW9U9M7cxrwG9z4reYjDYkUe/tQdI?=
 =?us-ascii?Q?rjof9xTTr9kTpj2I9rvyEzhYuLpzblHSowuBno8bgfIlMefd7sRXhIWZmtvY?=
 =?us-ascii?Q?MSHLE41Bsts0hPWe1EHx5U312WXX5Fe3uU/PbNLpg1VBd+vFGOIqn/RH5g6r?=
 =?us-ascii?Q?8ZB+aV110/xG2n4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OjNed5dr2g0IK2qNFZF8Z23giC0+gl1euT4A+1rohp2JzwJ+tfvqgubMbLje?=
 =?us-ascii?Q?KUvNMe0gVdAxxN3YtaU3tb33tuSfVd5Mj/cchljXARLXnbQaUxqJ8zfbT78v?=
 =?us-ascii?Q?QBZeGcOcNhFaHgYqIfz9F4ggUbIESCRixC3j9wzEjV+IjfIF6xuMb15vo6D5?=
 =?us-ascii?Q?1HSvVKD7Ifd3K8JoK7cwFUrMMtdYBOgxl7GUqSpTycT8lcjkMRWdUN8HRAm1?=
 =?us-ascii?Q?6hBSTt/e+pGvFJrgv1LcpJIILAPG7Vah/sQz3qTveVFAzQvJNc5GCsY+hldl?=
 =?us-ascii?Q?82tQdJXm9863ZFdwYeSSGIKxHxQwkE1u6ExYO7DdGnrJPpfuh28mDV9NVb93?=
 =?us-ascii?Q?F/MLP62vAfazBX1xEkX4OkV7+7MLN1QSjbSK7VzUONUh2nNcpGF1bo7i3lMs?=
 =?us-ascii?Q?t0ddjWNOnbYmfOvJfe5GyoLJJwu015S66XTha2hxc02lw0M8ZYvK6SnTzldX?=
 =?us-ascii?Q?IeVylJ7ob4Zne0WTi+bAWlOL/H0PM8f3uhg1UGxWp9viek0DI7w6lhaNkw26?=
 =?us-ascii?Q?hmvZHY9S6aVOk7BJSk/9Ntvx7hWEpTgZGaw184RqnNXQejk06igdZ/exgHjR?=
 =?us-ascii?Q?sNqOGhl6MeY5JeiKaoG+nLaL8W2+eVb/zuXYd3Bmr4RbYZvETh3pdrdsseJx?=
 =?us-ascii?Q?dIZzuIdysqfSbqV95NVObwwy1O/e01cuFCfGmdyU8KEWciT3EBFUNKKL9Ssl?=
 =?us-ascii?Q?6xrSCnaGQ6F136MA4ew6QFfzQjl1ANvwX3iRmw0dONdAGiwVjr5leFchOuGj?=
 =?us-ascii?Q?3SPoGGitdxjD4qEux36hnPTyKkj3OHJoWpMAN7WHlcNc2AzUs7OxiibfcRP2?=
 =?us-ascii?Q?IEwjC4viHsW7gBeCVfw8Rzk15SBj6n+6qLoLvvLOX9B6WAQMSoc6rTmoX6Lw?=
 =?us-ascii?Q?N2nxxvDh1N+216lOEhnjsVqmfn6wci3T6ACk6A/CtAi0hvu8kdG6hTOqQOFw?=
 =?us-ascii?Q?h8Lv6PYlUXedI4Il920WJ8w9G4vLl+Cc3gQDJAXWFHBVuE1vbobp9Ax0azkG?=
 =?us-ascii?Q?MsroOHOtAa3t7WCfdbXV32r2Z9fDzsYpsI+X7TKXAITcm8SSw8Oy+Gbm2zji?=
 =?us-ascii?Q?396ZDXgF+ypUo2ZA0tJF5fJKsyywRdYtDxTZ2oTna2l0eqcmXVbVRXkO3Bnk?=
 =?us-ascii?Q?fpoX7wXRSDoQ4VUehTvhL6ySiZemG09YcMZeMO4NWG5ccEd994URGp1oSqFH?=
 =?us-ascii?Q?UUiwNdoXb48tqs21RsfMMW7V0nKrtSOHpy9soDTJvdvZ8/8Vo8gI/87mgIYX?=
 =?us-ascii?Q?try8jKB7l9XbfvmsdU0zQKNW4itv1rUg7H9Ypisq7q+zSLqIGwz4NlPWdZoz?=
 =?us-ascii?Q?3HpXWQT+DZIGv7PTqiSMLftvZIGWGnwqZ+3BtET9x50i1iooDmukCofm3Nww?=
 =?us-ascii?Q?g63dN3y1O/Qmtpl92e+pZLxvbv758jeOm2/A0cVN4VSgmmtsLm0tqaCHffoI?=
 =?us-ascii?Q?teU4ni/NIQ+J2JGpX9g5qL8YZjWt1yWftGPzsvKMuVCzoh4kjEvcYiW0Qb44?=
 =?us-ascii?Q?JKayxOm6nKOsn8lcXEvJMok3JGNY00viVps+pxLFry4Nl63A7dKL2O+X1ieG?=
 =?us-ascii?Q?sK0yLXVrsPzLo5yO99HBHxdtjWpR0odyOE2ZXtkp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c443a7b4-c9ff-4e15-d2f8-08dd8193b10f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 11:49:09.3951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GLbqS7RgtOM8okl1zvPhsL6BaZvt2lyZ7oj/jEzrsCFZY9cRxn3zcG7SUyAlIH2YzU7SrJ/Zen7Gae5y0UNlYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7736

From: Stephen Boyd <swboyd@chromium.org>

Ease driver development by adding stubs for the typec_switch APIs when
CONFIG_TYPEC=n. Copy the same method used for the typec_mux APIs to be
consistent.

Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

---
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

