Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012047.outbound.protection.outlook.com [52.101.43.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12F9411670
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 13:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782825640; cv=fail; b=mxX8c9a9ROr3g62djd6hrxoMNEdR9s2kKKPmtB1oMvoZcxy8/4lk/fURkT1Enlc4IZXrVDkFMUHaDeD+qrU7khH3gHuHc9O3COIjCasSaoRQeGJR+rmWlrJilsTM+Q15wt08fn8IiEqmaT8VNWV379UgH3M1NtGzPBwvehcsCg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782825640; c=relaxed/simple;
	bh=SbIz8HRGl30q/LcqCdx5wVWzZGW+kRRlewU8AtyTL4A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CSz/5DWojwmL1XiFxayMnMEhMXAIvhKDo6Yx9T94JrBhtpKS/UmdyeOi0QB8YSOvxL0FjltIGyXZZ8wOxRE1z25p28T2Xr0w+sPt5u3bwzU6C0PtqtV1e6YA0T8/bzAgwl8E8C842AO4wb6BGtQWuJWncbHY8UdzYAfD1yQhsT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=kCW713lx; arc=fail smtp.client-ip=52.101.43.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="kCW713lx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VFLCsxzoWxl42T+2M1M/SgyDFNdyiL5Hmk0oP7XHU216MUg3kIcGtid5GGBoXddIDgwVeI0zaht0g6gtoD0f6f3BYOoGZG+/SgwmGTl4IgiF3QuyB3aLXvf7kRWUJhx+TdxcGid8a8bMZUp1iq8ErVSCxxwtc+AcvZABZ2fbRZZ9c8RH4JrxvW9labrp4/Ehf4RooOLa7BAW0aM+1XorzLYgyEqSIdeEprJm3BXOmPnkOjtl56t1aHPE1xGlZT0WtbhgQpx4T1YUcjQlraYogxUIvU/hI9iJOLPAPr7Fef1Qzaj1xNQaeKFB55XhJGdwKlK0qDOK72XXig5alNcU2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRw8c6t9VOg3qmoTmdBAUxYDXkc/YqmdatcBpwcVSaY=;
 b=aaooyfnBmYPfaLK+s9y0fYCglVTRTfEEKtU0RVmUHo38+ICPCFUJX6qBF4Hd2uTrAcHEA6f4DB4PFZ49/abXf9riyOefYOe+HjA+1/eNpnT7a0uE8ZquiI3CO9oQ1E2quk83pdzzDOy+/1vOsKtttAowVfYlqh9BHo65W5zYtwFcErdcCvIxScPlsd4q0hu/f+oZSL9ovjaJ7scvC7F59YxeEITRe0XfO9L5gbHv/lEDVyqnd1cSrP+wsrT98lfU9ChXm4rQNRasyq/8xRXkltj3EAINNUfBBp5tnksDR9T/L5H67MlS/OaBYSED/xTUw4O+7iu3H6uczjm00x+QEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRw8c6t9VOg3qmoTmdBAUxYDXkc/YqmdatcBpwcVSaY=;
 b=kCW713lx9EM6RtjUE0KBGlFsTxNad6Kk3W381jVGmQu9ZX1T4UT57F8zfBUZuvxMIO8mUb9o6TU2hjJnvP3V2mae8ODxGmlm99NceSLMCC5APvjLGyaN0h7xud4FLV7YNQqEG5UtYlRnPDWlfEcun/ypQJoKjyqHNX9A347aTV+9UmhBmD08IsdE3wGsdBHw8Zho14bCV7up3INIatCGMrV0lurZ5Dxf2CEDyy5is9Hp3ZMjlCxy2I3Gd2b3bn9olhQQBW6nH7UNGlrQvd7VgZrCE0PfUrPF36YbHKq4Tl2jaHLf5RM5BOx9CbNKmFhyGs99JaCGgKI/M5G9iv1dGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from CO1PR03MB5937.namprd03.prod.outlook.com (2603:10b6:303:6e::18)
 by MW4PR03MB6394.namprd03.prod.outlook.com (2603:10b6:303:121::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 13:20:32 +0000
Received: from CO1PR03MB5937.namprd03.prod.outlook.com
 ([fe80::f970:684e:8c80:91c3]) by CO1PR03MB5937.namprd03.prod.outlook.com
 ([fe80::f970:684e:8c80:91c3%6]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 13:20:32 +0000
From: tze.yee.ng@altera.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Jorge Marques <jorge.marques@analog.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	imx@lists.linux.dev
Subject: [PATCH v4 1/3] i3c: master: dw: Report actual GET CCC payload length on success
Date: Tue, 30 Jun 2026 06:20:25 -0700
Message-ID: <b99393b7761ff249dfd147b5ac028ea2e48915ce.1782824628.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1782824628.git.tze.yee.ng@altera.com>
References: <cover.1782824628.git.tze.yee.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::14) To CO1PR03MB5937.namprd03.prod.outlook.com
 (2603:10b6:303:6e::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB5937:EE_|MW4PR03MB6394:EE_
X-MS-Office365-Filtering-Correlation-Id: 179a7a83-9800-4519-2e62-08ded6aa5c9a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|11063799006|56012099006|18002099003|22082099003|55112099003|921020;
X-Microsoft-Antispam-Message-Info:
	wgYLJ06CEkwIjB0YzbyiVKkJbeFG56KgEa9QXHfFXiYlCaqhMfvA42/0D0b05whTUYFIWuqhIbKvQw2ty3W6oorX7F7mKWpX3oo6J197fi8tZJFI3bUzPusRW7kQAOSXYj1+kl7K25zUksH0VwN6eA1LmZsWE6X0WbkQB+n/Hj620DUlFHrgupAXRmElPH5I8FkihY267s8gUf4P1bTP/tB28W95xFJ/Y+U+hqzio45i/lqeOsmlkCq+in7YKIgFhze7jqMDpId7YSqJ6JNd1gp6u/lT1Gam3JXVBXw4hEjoyrnjqlUi2PBNcZCft250IdLrHVqYgiBTs6ZBDhnvkipfy6iRCUKJWIGkAJpnRiOkYWgUHQfVpDGTt2tdCoyt//Q8j4k3Hwuh4vcfeimKjqDtOp65Q5kqy2VOIjU/gdhPsGScr6EfEpsWwLK3HnURM1eE24A2sJzWPpdY8zwkdt2zTmT/DVfGB4AzIBJq+c/edk2UV1KnavNbFCOxUynuk6hB9SbWHXaM8WU+kFk89OVUGzuMxjWYnbQSZNXZhwpmAtBwtk/wkKq36AnZT5ckiTT38qJS8GQKwS6eotehZrGFkVgtDzX5Nl3UW7/QVU8OeZ1g+Zna0BsLcx8MfbfIQoT/sSwEObPpAsvs+rjnjQuDNeDs8ACP29YRct/PvFKpHJKA+4KL5ucVdACl/Moi8W0UGXmlVB9U6SaTz7m+Ww==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB5937.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(11063799006)(56012099006)(18002099003)(22082099003)(55112099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7arcfhswqir/DNa36as/wKtFEI9mXk2RLlE+8Rgy/CqO7TP6cgGd/WuC3iEG?=
 =?us-ascii?Q?S7pUmTRDULIN1CJmS6v3pxli8cH35y1pAYffXlFOY9gAtZZPRztIyjUUUvgu?=
 =?us-ascii?Q?TGyrqU1dmsdaNqesziO2/zGLFUme5v6Gjpyu8XwUcvw571wCOMXCPoMDK9TZ?=
 =?us-ascii?Q?u0HSo5iXfOwqJYCebAIdHkQFdmg6oSs/7Zk6h9iqzv8kykc2ZoE8f23VX8Yy?=
 =?us-ascii?Q?ddhKmg85HpzOqgorfp3ZoCzRGFo76a19eS5/lT5ms63Kpuj1K34LHpQneXeC?=
 =?us-ascii?Q?/PZ/GuiDnLkGuKuxcUh4HnFzxTzBCqj19JQemH2+Fap5Th8qLdgkq2DdmgFl?=
 =?us-ascii?Q?q5LDwHW7OUsfApjp+85HkFzP1N033dGL8txr48WoHus0BCVnok8d5D/ymDq8?=
 =?us-ascii?Q?2sdReZbDbNuzxY9lvocXF2Sn+A0w2c6J/TUl42xBMOzVmuCHKhu57k10w2jF?=
 =?us-ascii?Q?ypUr4Rb7VmnBvxyqjWaoSsL5e8SRbixY79bB82HnTD4lFxM5qtRspAr9QgM/?=
 =?us-ascii?Q?2vKxTQ5igm3SvfQF68Ru1yhg6ojc50H3htFNNQvmM5tt+Xw2u2mQ6kzbCzWb?=
 =?us-ascii?Q?9P5rjGExBBXLxkTj5SSwQjscQLJFsVxviZWwCv8CyiGGQ8zKFCsEwDCFEhPP?=
 =?us-ascii?Q?NsNBzV8ePlSZ1BHqzYCvQv39D5Vu/L6OWbDc9N1+Yl+ZPpIMv10RchfsKeVn?=
 =?us-ascii?Q?Vc9BXNnn9grXKyUp5ZwpJWT8gWcRetC4d8ze9OfBQMigUwYgk3AGx7WQs2Ru?=
 =?us-ascii?Q?+kND7bb7aGcA8MisvScAkPwvrjjvH4cGNo/jTNarHNaHQuaiaKinGmszjaFq?=
 =?us-ascii?Q?KXn4wP6prGE8amFITmP6QBQM5tU9VUj3qX7y/UORzxU5uHE4MaPLUia7HlHg?=
 =?us-ascii?Q?PrWJr8OdQUcQHA6GkrBWMOPfG9ui5CzFc2ArVyhdWIJKkcoK5YAJ4pKxGp19?=
 =?us-ascii?Q?ziTMunJRvkUUex16dA0QK9RYj+9AMFhaeI9WtFGgJN3iJWXl4UkWUcR+IpaN?=
 =?us-ascii?Q?v/q2I/rgjvkBohNg0YgdfnxaJB+0XD+qQ4dRAKuoDWSUKAJFNMZI2twg9AXi?=
 =?us-ascii?Q?iljaQOS2pruFglCCSfIqzk8ciKrKVF2lBRCPaYlkb52ZYg4aDVCpWw8lcrXF?=
 =?us-ascii?Q?y0aZ/HAd8kkXv50cXURlo5Mv97bw9qUUJTSzavntqb2nxa6IyzcT4im6+CEU?=
 =?us-ascii?Q?FGBP6640oyYxxul3HRKFnzAIkS1i1JD7/MCvsSN3Aoiq267uUoLufacDV75n?=
 =?us-ascii?Q?HszR5EtI4Gz7UOS/fZlX33bvmAtigPqTWYyWt33SBW8pX+ngylB3zCaPrRKh?=
 =?us-ascii?Q?koxtNgx+DE7NCeFLCP1Wudm6Ym9dH93g23kzozL4zS0sNm5n3X7X7930OP8I?=
 =?us-ascii?Q?rSBffGZTMgKlUpbXVE9EzVP0u/7GnOTlmcEX/sgmfE24WHdiBQSmKaxRIW3P?=
 =?us-ascii?Q?xHJwqlmFpPWsMmj8kmUZQHMZbPsTlItQFhROml0Yv62LUk0OZKcvvtTtxRcH?=
 =?us-ascii?Q?5PONNfnauOH3aP3YXWqi7YFSlc3G+FcvY4TXe/dbG0gZQnxWVwVv0xSQKE6q?=
 =?us-ascii?Q?U9tsayjMW/9nHFEhvwYo78EXqglrbZlftTT3W238iOnMMRmbzSACUeHoehbN?=
 =?us-ascii?Q?8FEeVPW35sBReWjOM512xFVYMJQGJi8CqC/IQxneAtGwHCm5YpRaiLyMX31O?=
 =?us-ascii?Q?3RPJ/c8LA4rdmeS5Xdpn0nZDXC9Dj/CRsE8kMLYyy7uVTVuKGbSD8wcqkX0a?=
 =?us-ascii?Q?PPQl5IuxAg=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 179a7a83-9800-4519-2e62-08ded6aa5c9a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB5937.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 13:20:32.1671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5f7fpSeHFCE3nzMYNcOYJz+kjMNIxTbRjpDxg6qu3tLk6y61OwkVnHPE7wfe47gbCW560ss1pQ407vfUs1mCwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6394

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

On successful GET CCC transfers, set dests[0].payload.actual_len from
RESPONSE_PORT_DATA_LEN so the I3C core receives the number of bytes
actually read. Add actual_len to struct i3c_ccc_cmd_payload to keep
the requested buffer size in len.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
 drivers/i3c/master/dw-i3c-master.c | 5 ++++-
 include/linux/i3c/ccc.h            | 4 +++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 655693a2187e..856961da1827 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -742,7 +742,10 @@ static int dw_i3c_ccc_set(struct dw_i3c_master *master,
 		dw_i3c_master_dequeue_xfer(master, xfer);
 
 	ret = xfer->ret;
-	if (xfer->cmds[0].error == RESPONSE_ERROR_IBA_NACK)
+	cmd = &xfer->cmds[0];
+	if (!ret)
+		ccc->dests[0].payload.actual_len = cmd->rx_len;
+	if (cmd->error == RESPONSE_ERROR_IBA_NACK)
 		ccc->err = I3C_ERROR_M2;
 
 	return ret;
diff --git a/include/linux/i3c/ccc.h b/include/linux/i3c/ccc.h
index ad59a4ae60d1..d8052949e57e 100644
--- a/include/linux/i3c/ccc.h
+++ b/include/linux/i3c/ccc.h
@@ -343,11 +343,13 @@ struct i3c_ccc_getxtime {
 /**
  * struct i3c_ccc_cmd_payload - CCC payload
  *
- * @len: payload length
+ * @len: requested payload length
+ * @actual_len: number of bytes received on a GET CCC (filled by the driver)
  * @data: payload data. This buffer must be DMA-able
  */
 struct i3c_ccc_cmd_payload {
 	u16 len;
+	u16 actual_len;
 	void *data;
 };
 
-- 
2.43.7

