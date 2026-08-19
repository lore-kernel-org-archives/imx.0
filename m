Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011065.outbound.protection.outlook.com [52.101.65.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882493E00A3
	for <imx@lists.linux.dev>; Wed, 19 Aug 2026 09:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787130365; cv=fail; b=h+97yllFnT02ghxm4kbwkDGmBWnWmcmtFrpEkepurcy8LLpy4YYiNOD0IxTrCmN7hZSbUZjMcrCsUOgKHfB1l+RxgjPMIuR61P38hQcVl4ga5+18Fdke0pWkYy43uTbzZsc+cqbm3CmuP1w9eXYaz9m0BnxbBO4UNoFopLjA9SQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787130365; c=relaxed/simple;
	bh=xexYIT32qfKlv8p1NccTvcZ/9THV89rEhI2l73Btd2I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nKiVtSXilhU9duM5pmrZF3nsCvMBiI1O1Kb6tKF7qIosry1OsjCvPe1GPHnmQFLgO9TWPBAPpjNfFplBtRz19rMII5sqP6GQ03Bexy6JFDUsW07PFDqDalgpSv8ea0vMcKACWFEyTKldCkCL4C6IjzaMoNhLrMPs2W/rgQKfpt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EHHeuvTX; arc=fail smtp.client-ip=52.101.65.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EHHeuvTX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UoYgJHfX6fk91SC+I0WS2RlmWh83U2KpwcdD0jt0M1Qy05AQecQjktpFSveqEjLLxtosxgdIE1UI944EhjzuXZJXpzjAunMUeJjXg8TtmyDu8rv181HavhGEvDtgSjmSRRmtsMcBsS82aJ0q98iVD7c7E96yLqPdkfJ2SVQNXPglpL4QhR+HcYifaoPMZvc0VWRWoWx9X6YeJzcccsDaod9U9olShWolStCCcadmc/1wTH5bVHGvxS2SwC1PnM1Ty1dYXC5/SR1Vt4ZWDAuLtHeEO6fEJGkkk7Y23izC5bVpLEBHDYM2DLHS8seWERQUERAzlKpuPfUfJV58Zc1Eyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JV+E4b71Hw/pNlp1UP3kc6IvJtDlWrOz1bPuCyeoaq4=;
 b=tsczMp6XWy9RSVvOF2GfPvDHysJSka82IgeWQ7GLdnwMUPtTuua7ONTK4NQwEtA+sTXvyM+2QH31so1Zl+xfclbS32UoIPX3ER+4Lm0cBuNeqfKEeaBYFeuV4Cshwi4mti/eDwzwWbhRVUrK89W0Z4uMM4SVGMYBIe6g/9+h+1PyeIKFmSo6GeM8+7XsifXeLG7Y3L619GhwX8/vGj7+QyH0GhYI7SZO4BeeM3jW/Oo9eA/e0/r1PHKbVtEhY3CcPyThSgfp/nkGk4gdhPxJNKaCV36iI75U9ehBVXkOyH4qk2dolQGnxYzjW5pfUCgnX74VzeUqTaMnKpBYuxy8LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JV+E4b71Hw/pNlp1UP3kc6IvJtDlWrOz1bPuCyeoaq4=;
 b=EHHeuvTXxQNjnUDqXLCTMg/5f2PILWqYzMm0sGZO2MONCMSGdh6qZe1cJtnoMYFEuovEIOHvjh/XHweKwQRHBl6EDga+Ljl/czEJA5BPyqt5lIzxqaMTmEsjXUa727SFnYxKCI3Nso9UVOsKdxqOuUPLCPncGzoSuwlfGS2rjjHFMcTFWHhkQy/enx9VF8ABRcCY/kTAy6oNLTLjU4RxDNP1CP8vtVh5RsJphNfxzxRNLMoXM1QzSuzjaGmRJ3Bk4rO8My31qluFoAsjbTwOgXhGsB8EMV4YHE29jTDb6wunXWMa87MKZnTIPIJzBdiNSBZbmkUUNI7/6Wd1dDSiJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by DB8PR04MB7146.eurprd04.prod.outlook.com (2603:10a6:10:127::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 09:05:59 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%6]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 09:05:59 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>,
	xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/5] genirq/irqdomain: Add devm_irq_domain_create_linear()
Date: Wed, 19 Aug 2026 18:05:39 +0900
Message-Id: <20260819090543.585131-2-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
References: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::19) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|DB8PR04MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: bb8514f6-9921-4d59-f071-08defdd11626
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|19092799006|376014|10067099003|56012099006|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	5JVBTueME4TmsPXPvGiDSbfz4UOdvYwvwZO9TgipL54pXCZt2rbnGiFt3mGGeMzuOw+L9Ck26gw8T0nsOI+nRkJJA+Ke3g0B65afz3ytY5KuB4YU8zVdH9Ax1ANqC3sVOy616wTMZzs1hdDDkfuKYgYBq3xwJYvB/i0B4ncYyUuXBkTLCTj7rSAaEvxg/TynQrMPv2xWcgZq6sEGCBS/BggjiypIEQvjlwn9mPJ0tf2Xg8xobh/vzlaES5HcBoxoEzV5iZwBUFAd8Le1zazvCnXOfSNI2VOkNrSJc7RwzPRDC2U0TjIqeLsAOPBhpgQRyVbqtbtz2nh9YBiJ54sk2L6QSvgI/rE8dp7b4UdzN3rh3ueydLVjUk5m4v3AxcuQCjvXkR+sgf/u9gawlEi0l7Uiu7XXYKvwhqm1G5mwydK18NCYU3Ai9Ub91RnbHkr3tjyRDMVBZiNqdWDYKPqCtMlAaMcPmtHogS47bloZclsqyNkO0V830L4aH2FEm35j40YPLpBKnjnEpOJ+Ag7VH5Nt+2jT6I+uYU7cIDmyTBi/koY3r1d8EV7Ly0poH4TVEMQ+SIlkobFTyGn3m62KQHJTJxfnPcRzielv25uirs2dsS491aBD97Lnp+XIR7sny905Vzp6rHNiwTVjUvhPX67ubfTB/Mfls5+zTGbHCZg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(19092799006)(376014)(10067099003)(56012099006)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9av/fu9oiW+beNb+S+x3sUPE+vQyUsx5rOUQzAGLFqVWK0qP57GwqiLkTkqm?=
 =?us-ascii?Q?LTlBI0bH874OOub1Q23f6l6AISjFVYmG/Lhn7g5nVHABfO1F060yK3PSikR+?=
 =?us-ascii?Q?x9b8VgmOTSncKnlbOO+FJlIo1qms4VyNaaE7uTjfSSeQAImONarLFONHtWFS?=
 =?us-ascii?Q?Vly3o1XfWbkPAPWQcLdfBDJjy82alCUzhjEcGmrYFJ53tqOgx0Dyf3VhYJs4?=
 =?us-ascii?Q?meZ79M1WBrXIIW/KMuaLdxKucj/YvT99P3N3e53/VwqbpxYmSUgmmH/7vjvA?=
 =?us-ascii?Q?ylW3tzrWdNlQQziKOmBmt2vj4LvIyPDr5eo79sSUH3w/gbgATVUCf9h1ixbn?=
 =?us-ascii?Q?Fcb104td39i8CzUuxsHU0ey/ocgz1IiXFLPyEoTK5/AzFXE4rtTg//l/agZF?=
 =?us-ascii?Q?cW5BpEambDvxrQUHJuQpt1Y1Sq8OZwlZ6Z3DaMYmXKK6tJ3fT5/32W2Z1/e4?=
 =?us-ascii?Q?iK/SBgwdyQsEkbBmI6VYRBnR7dTSwaa7T7f0Qc4nR/92sNiaEGAHnCsaYV7f?=
 =?us-ascii?Q?g3xkni/QJ7hqIYCeDXE7xAFWrApyAIjlxbWPWbXGapJ07xaJqMqF0DxmEe44?=
 =?us-ascii?Q?7/pxBLGaA80FLTEdkh4C0mrtHTuX35y7iXZWGLkC7THjYJenuOg8/SMtd/No?=
 =?us-ascii?Q?LdVV0czstFSdUo23qtQwG53kx+Yxh0O+jqzw41BLSY1Tv+eGjtq8Fszi4mQN?=
 =?us-ascii?Q?kUHsY5h0F4HGEKutggS4BmAFW3QAX8y8C7dLCLiVi2dPqC+tR/lsmmh1AR/c?=
 =?us-ascii?Q?dSTD/08JEQIzaYpAoCga70xuR3HKiVOX3fox65Bq1eA7lbY/PnB90ZYfiu3d?=
 =?us-ascii?Q?x3hkyZMvVMjTbiqWzKLQABwVGiphxjIFcOLc/6WVz9wTwn+enVfE/e0m1uPL?=
 =?us-ascii?Q?bVngLJ6r/uSmdUSKRrm960xopn7+mXUxcKpK3S8C1t0uudVZvMM6KWm9LGXc?=
 =?us-ascii?Q?CBiVRL3kDEZyJ7G0gE8WRt7H+Ba2K20CY2Gg8yzHBwmLSjVvBBslEVzw5Ctn?=
 =?us-ascii?Q?NpdE7DlxfPGCuWL7IP7W3F+3HeZXu5Yv+P7+Il/3tyc3EIjaiR30mQKelcHJ?=
 =?us-ascii?Q?NZYrK3MBSjFzs/C2x+4J5eiuplmYGLq48lXhyzWSMshFHXk4ArCwAaSG05SN?=
 =?us-ascii?Q?rOZp0mV7eclXMq5/N5LvwJ1qE6M1pmVGH5eoz+XOD6MtSN/gLKIkBEp8+XwI?=
 =?us-ascii?Q?SC3zyt3ShpoE994ITNW2hKMCgD8IQsOm7xhdcYFQyv/VhSXj+u/81ODMkXJb?=
 =?us-ascii?Q?f8gTVYmxJoA1k2Wx0Dsr+vTcbsGVui3Ik5jNXKL5GukGn5JV05HwSkeJB+b7?=
 =?us-ascii?Q?2WL541Nymtf+TSRsMJ/Sjg117cvqF0rFCwIAEKSvcOnYrxf+kI7Ly+KO7KZw?=
 =?us-ascii?Q?Z44t6QOZ6Ed5wt3w5rUroSf32PN7AuQMhtlk9iTRv35EaxcDVutzP9VMGLYV?=
 =?us-ascii?Q?Pqn340Io1SE+xcf4/S20pt3aWX2OLVgevz8ln97pZ+ovtVuK/Fbog64Ealqx?=
 =?us-ascii?Q?q2QKwmMyzqJlh0Sd1AxH0rw1Ly/brE+5wjo1y7u3I8hqlOYbMwczkBZOGRpZ?=
 =?us-ascii?Q?97qWRikdZAU79sMyRn/pZsKErIhVesv7l4W7ntX661vLY2Sf/fpgq8dXTz/N?=
 =?us-ascii?Q?TYrft1TghD74I2OOpZO+MVTwt167j5Z4vGAs1pUOCnuOhaZAfobi3J7Abz3x?=
 =?us-ascii?Q?cOizSZimBEORtPzoPZPtjPVn78/361F9GtTUvQc81++9IE2o03pVqfXmWKXz?=
 =?us-ascii?Q?5k0vb3B3lA7ZHxmf13lORC8DXlOL++qrCt1xXDo3yMPskov7qvYE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb8514f6-9921-4d59-f071-08defdd11626
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 09:05:59.5761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gp5nnZ8KSWO4vBD0D++hDd/9J6vJRiNp9VXbJJr8+PRLIJj9eTh3ammH6dFHQKIWYS9ne5LPK8SnTPFt5KvDbiJevwvGYvQBQQGPduGXJFJieODRNsnORUOkP5SbrUdu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7146

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

irq_domain_create_linear() has no devres-managed counterpart, so every
driver that wants the domain torn down automatically on unbind has to
either open-code an irq_domain_info and call
devm_irq_domain_instantiate() directly, or register a manual devm action.

Add devm_irq_domain_create_linear() as the devres sibling of
irq_domain_create_linear(): it builds the same linear-revmap
irq_domain_info and hands it to devm_irq_domain_instantiate(), so the
domain is removed when the owning device is unbound. The return
convention matches irq_domain_create_linear() (NULL on failure) so
existing callers can switch over without changing their error checks.

Suggested-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 include/linux/irqdomain.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 73c25d40846c..b6b360cb6525 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -457,6 +457,36 @@ static inline struct irq_domain *irq_domain_create_linear(struct fwnode_handle *
 	return IS_ERR(d) ? NULL : d;
 }
 
+/**
+ * devm_irq_domain_create_linear - Allocate and register a linear revmap
+ *				   irq_domain tied to the device lifetime.
+ * @dev:	Device that owns the domain. The domain is removed via devres
+ *		when the device is unbound.
+ * @fwnode:	pointer to interrupt controller's FW node.
+ * @size:	Number of interrupts in the domain.
+ * @ops:	map/unmap domain callbacks
+ * @host_data:	Controller private data pointer
+ *
+ * Returns: Newly created irq_domain, or NULL on failure.
+ */
+static inline struct irq_domain *devm_irq_domain_create_linear(struct device *dev,
+							       struct fwnode_handle *fwnode,
+							       unsigned int size,
+							       const struct irq_domain_ops *ops,
+							       void *host_data)
+{
+	const struct irq_domain_info info = {
+		.fwnode		= fwnode,
+		.size		= size,
+		.hwirq_max	= size,
+		.ops		= ops,
+		.host_data	= host_data,
+	};
+	struct irq_domain *d = devm_irq_domain_instantiate(dev, &info);
+
+	return IS_ERR(d) ? NULL : d;
+}
+
 static inline struct irq_domain *irq_domain_create_tree(struct fwnode_handle *fwnode,
 							const struct irq_domain_ops *ops,
 							void *host_data)
-- 
2.34.1

