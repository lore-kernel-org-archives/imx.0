Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010007.outbound.protection.outlook.com [52.101.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE7A3D25A2
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 10:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307151; cv=fail; b=VkGpOPyTe7d+XBqxGXo7i432DSBsLxeEJEDx7Fw1wALXH1DGLDobYGUPWOfhgrTh0Fy4lV+PYLvTvFsnwF55hH8vC3dT5il8WA3nAPJBA1a3gKdlef9h+gF7OGsvd/uPVIUkoBWvEjUG9J6FqeyPFT6J84RqK5prp280WN89O5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307151; c=relaxed/simple;
	bh=UTqvS6QIWsqAcHGC8osbHFsLhRCrfaX+7gnkivybp0A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V5Hya7804q+fzKUcCvUkf0jj1dlOM73mCI+/eeZy+5STFz24n9qHzQ3Kfm96alu2jsepPpNDYtXm7S+v3t1wm947jPGtzMLjrQFj/pTPOkRTm/mX/2hOqJeHJLLGxwfa+KyFaqnPNBStRP4277MCAdhKYSiUSGF7c08izSVOmkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vTcNhe9f; arc=fail smtp.client-ip=52.101.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vTcNhe9f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EXhO1f5CM5lECK5iAQvKAjze0oYnTJ54nYQw1gq3aWP2A/ynMyxWm+xPzaOWX6MvkcEZVtWAIBVbC8QxmAFCDPAIQRR4bHmEYXCLRFaHOF3LDX2B+ZSXNyWItw9YokJ3UpofZF/jHQiy9xKESGAQqOwVPCFV6WKQfwUHhXO9kxmx2c6k3mH6e3+UU+QngbQ6CUOSEoCWa2W/FM504G9DQUtPHHDQK/1XFT6Ortyqh+1dbsdVZi2n+zX6VaVFt6zegM2/Y7lYcQKZo/0N/vjhLTTpJkz75sPn3HeAJclXbm5stLLRVTBTi9/LTGeWJYlhSl8kQuwQX43qP90H2XlCNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HY4zLrJDYEWAnzylnIDGmuMGGMa03zInz6lhsAvzXZM=;
 b=ninPKyu130H80PP0KLgUITbylQ+rCcyDpBHwTuinxQlxuCkkYn1XWdBgdd00EYQlQXtSnkB3591AXVkTfuFNpZ4LVEMGJYpgh6vVXqBljBrRHRO1JFgTuWlmqgHf2DCHHoJo8otIlRIhn3HajU7knNi6ht5YTx7gOj0CBs7iZdGeiLiEF0mrwmBQ7Q6fbhXg+9P7a/Hd8EAXl6g87VxNcK2fNZ8NuuTszTGwUggn3DpbI0ARfbsHaxJjHFsizLL6pSSzOs/h0WLCX6ZgvGpa/zSQgyy+S16HzInXanTrdSEGLAJbg44Vp4fUg4RyTXU/lywZKgulJ8CaVKtMZykfQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HY4zLrJDYEWAnzylnIDGmuMGGMa03zInz6lhsAvzXZM=;
 b=vTcNhe9f1V5MIzK4K2OqgtmB2VlfTf2lhtItr40SFEU5mHwk4jGTTBR5gEdemEd9J2hWlFGikNwwUS6PAA5pRD+mcEv6AB/jAH7lx2qxC2zc1jMDTpwTiDNyKV0hHacgeTSa/g4/cFxm8xq9ceZmkOV16my6W1V6EdYTyR0LwafJv4EUlojbnC0uYeNfwPJLZTAha5UD1ioOtpt1d9JpTnOBqBafNkcKmGP6fwBZs17Z9Crdqq6qzLBIfJX1NcVb2ge44bgPAkj3SSc4UMBPUeov63J996mea5QARSLoWA9jSNCoagcmt96YStr8YsuY9qicDJCcobuomb3N2Y5vmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by AM8PR04MB7971.eurprd04.prod.outlook.com (2603:10a6:20b:234::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 10:12:13 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%6]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 10:12:13 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Radu Rendec <radu@rendec.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>,
	xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 8/9] genirq/irqdomain: Add devm_irq_domain_create_linear()
Date: Fri, 21 Aug 2026 19:10:38 +0900
Message-Id: <20260821101039.4037925-9-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
References: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|AM8PR04MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: 207ad87f-3e08-49ca-1378-08deff6caba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|23010399003|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	o/gus9fnIasSuuHiCj2qYsV4IOjMFL92G0KXJ4EGV4QCzUcCiriK65lyZ33MxJ1D79D6OdpvL0br7bsLjSSZVPrk5VKpLjGD9Plg7xOUxU32nuVTKgnGbCSDShL5nt5AXzFF4cKPtYzc1XkMjLqTvMwDZP5vrkgCqu9FTOw7UXYT3lZahOUWAyB/YtQJkmkrfWFEe+BS9IW+hKxCpV2ezUSXv0sBilPNgH5E/al3kzu97J1kDp1gFdUpol8cplhHGIbE/w2QoXJMjfjcK7iLzOJHMG0Hz2lGVw4XtEqVKLDm6a71tsfIg/aq6eQqLKeciC/8BzW4nDvfpytbebEz5R2dVlJr3Cf+0kvL5GSBYxL6E4X0QrprMTvUHruxKDHcOKbrwuvp5pYd6WrtsKJD0IWfZfxzbqF3sxFts0Rl2TzfzcGe+aVDWU3NpaPK6kx5x+pH/brAxhZty60dQDtRZcGmk//OaxVco6W/TL+JXjkMNNGZ9WCLcsuBy0pPKmU5pVlz/2oD43ciJRDyZCsIy/5O2tZBPtSkMGg6wMLd0Wtgji28lhn3sHjuNs8WSgFXz4mqVFuVzlmJtoisuvt4q9BpYnRyIE6q5oIheBZh6v0EFGeawnlnvT31ZVaLnjI/H5Xki5ViPtjvFfHbZQdJIDawjKBIW5d/7nGHKspW2qs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BT6lhW5HKswUkYB4yCogqxrN+eUvzR/SB6HqB+EtFPFbX3sAAGnqvrr/TwZq?=
 =?us-ascii?Q?0ruQd2zAc4w2mCgIOTsjkLE5DBu6KxZOoDo6GQxzOK2IIc0U21gVrm75h35Q?=
 =?us-ascii?Q?5Tv+600zFjA/0OOYMKXiWvYDIxb6wZweU5puOTvjm1MIdVyrLRPQ/EEWpwZQ?=
 =?us-ascii?Q?qxcHGCxTRYebIs27kNNsd8+WoB7qkVs5eySAg/llaBCxiafNhtwfcXYf8t/E?=
 =?us-ascii?Q?gudrhEHoP0FpBkLMkoq8w+Ntvi429iWvOoKn0dTTOC+HPe9VwAe9WW58r7KP?=
 =?us-ascii?Q?zFIzyQmAUzO2BZ9oS6g3ag5g0Zx3IILMULWVpzyLjqTjTsg3rRYCjLOqeAQw?=
 =?us-ascii?Q?kxJ6S4ZC+8X78Kq0REjIVsvPQKqNxgO2GUT4AGO2GJBGOSJvCVOhV/IQQkRR?=
 =?us-ascii?Q?rh3DwaENeHmLMfc1USZq2s9RaXmD1pYJILeMUq/WL4o7YqZIk1jMeVOfhpKf?=
 =?us-ascii?Q?53xvNq83htXqShPHccnlL+0C7eY6qpuWscGrfyqgn77xojspOduQXzs3/QoQ?=
 =?us-ascii?Q?CqtZXSCLQ9E+Aa3CqU9/GdP26hPrDpoX4uXd1WMXgX9L+VQMWvdTn/KfxtaM?=
 =?us-ascii?Q?IOyZ7Y4jF6fWPHFYmj/ChJlonJJ2ixBGXtIkoQwe8ktzfmAg0p9P15j3vhUE?=
 =?us-ascii?Q?sd14Ld5Nfn8KLCwAdRqYWQTCgdr1xqRRqFU5ayd+oj5WOq3aLW5uCX1qGZtF?=
 =?us-ascii?Q?0aqxcGXg13ItrsVgK5qjRWjfGlnF59WJ1MEAdZAybPBg5mTT1orEtx/cbbfh?=
 =?us-ascii?Q?vi8wpauvHhJ/r2HdYTM42GlKut1olzhHaR3MUqd5UpCzoCpJBJ3BKO+iTiZw?=
 =?us-ascii?Q?eKsEe5An/GN97T1gu0gn3GmzGMBTRZmTZ1XI2uvYZDsyD1dq+uXjU0adzAdz?=
 =?us-ascii?Q?QcD/iBOAKOn4eLd7LIEjbBwBPyRfxc/KzEa6tbtZW7kKll36rxzQnPfN3uoU?=
 =?us-ascii?Q?wnqgd2bhOl0mfJXKOjzprgEneey0oC/vlpKO1u5YaZjAQt+5/S5EKdA19sVN?=
 =?us-ascii?Q?sVnP0qzGNoNQFg3Kj3ZI29jp79PCAFbV/NYDcsUqDQOeIf/Ids99emx276Tx?=
 =?us-ascii?Q?5abo6WwJA8UEfq6b2J/Ps764JwOnbPmH42Kv9CPGlEXyO76V8Jllj//3kufm?=
 =?us-ascii?Q?vuQOb8Luu77lNgw9RilTxp+eH8eLjZyU39ZlQcrjeaTITjrABRsQG6iNbjGx?=
 =?us-ascii?Q?gEOvBwGE0SbVwxzWOWsH9XeLUKoAyfTl8CS5UOxdk0xBuEKWIc29KoCXy579?=
 =?us-ascii?Q?Z/a36c0vpUPvE9lzyTLTk44HF9kq9vsm2u6c2/vH+BXa37OSerzTo9GUI9oL?=
 =?us-ascii?Q?AUqQCzc33ugOw1RdGz3hDq1tQ4PQik47foIhVfQ66o0RI4xumPoDPaJ7vr8a?=
 =?us-ascii?Q?Qum7MTZmyNUS3SdBpV7zETi9xf37Zji6a1IYJalKpI5VX7T+4q0OnzvwoYVi?=
 =?us-ascii?Q?2AoFsbetPRi6rRMqVe/VCEez08rdyU3yypuayBc7mZEVWI2CmOXcCB5HIbGC?=
 =?us-ascii?Q?MBlJA8UTopbfJAEIKXmPVsEsh48S6tIQZAZZroRLV0bsHvMPhb0BXd1zB2yd?=
 =?us-ascii?Q?xU4J2Whuccz/tmYtkLTrXIyKeS0hoQ2vmtdifXiYylq3qopakoFyp5bbq6WD?=
 =?us-ascii?Q?GgC7uCtBrOGQOV+eYA0tRPD3HC1cqneCrIs7xEjuCpMwP7KDqnn2VhQIQM8K?=
 =?us-ascii?Q?CEJShBNPG+MQSZYWJrQcoFlxx00gcMzFhvuDOwXkm8x7nqrKrL42TJGeEmc+?=
 =?us-ascii?Q?g+Hr4kYtSz3WWdy1Bw2kTvoZEFC94w1jiTZvKriALrNVxHKqxvhR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 207ad87f-3e08-49ca-1378-08deff6caba3
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 10:12:13.6950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sabQzewE3U7CIurGos2+v9dp778aGDF0MvsLH1Jdu6fBrZRlDTkPYVZ05kBHsV5+eNt/yQqulUBJvMsNI0vXc8bZFO17yrkII6QopMsbDOr/Q/ULSrbJ/BRjJbMzMvGD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7971

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

irq_domain_create_linear() has no devres-managed counterpart, so a
driver that wants a linear revmap domain tied to the device lifetime has
to open-code an irq_domain_info and call devm_irq_domain_instantiate()
directly.

Add devm_irq_domain_create_linear() as the devres-managed sibling of
irq_domain_create_linear(): it builds the same linear-revmap
irq_domain_info and hands it to devm_irq_domain_instantiate(), so the
domain is removed when the owning device is unbound. The return
convention matches irq_domain_create_linear() (NULL on failure).

Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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

