Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011014.outbound.protection.outlook.com [40.107.130.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2292F3ED5D5
	for <imx@lists.linux.dev>; Thu,  7 May 2026 13:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778160694; cv=fail; b=M8Km1pyXBYMplxI8fsuj95bC/tReKMJrntQI0ojQb9s3O6u5Qbs0ppRdOuRebU6SR4dRhsyGa1dwdh2fVOJrECc1C8G5w3cyXu/lJx7KMtCuwED2gk9S7zCJaVLNQaW1HfeNLuWL2SrpWAVrNDBw3ArXtioHeZGIJXUVqdh1ulU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778160694; c=relaxed/simple;
	bh=4Yz3F2AAYVCV/uGdu3OixungPU+NtZB5DxptzNq6iU4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=SZ7dbOK1COVLhejghGZoldg8MzUvKS9gjseaXBFoCuVhwDcGFvhPIEO/8q0XLzfR3IAFnCiWcLz7s+e1m1jLL3GVa8t91M6txnpA1axve3+XILGa7jHIOJu2NARASSC05IlGOqj20plc/Jy6s4nYvPWjUoX7LSlEi3ll6BzkAKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iEtxcaYK; arc=fail smtp.client-ip=40.107.130.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iEtxcaYK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=avoxxfgocC2EFebz1JgHk6nAwkYg0xygpYe2cSC9rc1cbDtQw1bA697wo6gbh/2Zf1eIFfwPnp4hoPwE8UgZQBKPe1peGafx4VvB/qlNw/MESDbvlfyMe9qgbe+UL4B84RpK3HwV8sPbzJCNivoinzQk3HnA9+LX4gy4M6Mb0oJt1IqofX9h7CbQ3+RVSGwMdhw7l66r+abFEv2HiPNHgRLkcMD+B10cWcKMjxqNQsikhuJL+MjLLSp4M+eo3kwODu/NChrR6zF/StJC0Qr0jdbQ3VRbiSe4uNxPfLwaaWJ585yybC3O7AeIbTs1b3quf2XbNEzQvm61RHgwt+qyNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iabyJModF8A8SBEo0OE9rM/Gy67Zzd1LaCW3GnQM24I=;
 b=hikTgd3UDsMXX0/AiO4vYG8DuxvOjjp2NgsveZMxBcW0pPt1WmeBgeXTx3GqQfMV+duqLxivU/Iooctd5R/tmXqTQsZM2RptuMeMhgzmOZh2uX5V6QtJ2rZqGXQaEg8C7m54y2S8N58RIUWzwDBQbQuH9yZ6PQEMLxENB4+hGKBgxLdbWB/J80EXZbQQghmk+un61l8w5CWNmKFJcw6EjpN+UJoPsCTNjARrunWB5z2Uth61glDKsP0Cg9Jyteh2M0x0zzg64VfR0YIzboZaR0FIlvlTZzVdkTg63yCVuLRQv+ICKdiuO2sPE7a0epcW3xZXZc+7SUpys8RclxJFhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iabyJModF8A8SBEo0OE9rM/Gy67Zzd1LaCW3GnQM24I=;
 b=iEtxcaYKDR4wrsmv3nGS9/s31/Xec73u5OURrhuVJqFpyH78gtAX4b7A+OBBLxJjAlPccNKS/85e0jxk4qVAyM9EtRqH5/pdyLgwQKQAjNxXlAUCxc20h0S+jH/UkyXPaU3vkAhP8zJifJnwRGYOvshIBivKoXrw5NXBhvFCnKTPSdrICKCR2ydbU5I+2cKLx6OP5RrI3TeMSPRRF+e/XzOeJk/sbAg7aIa/Qn6O4M77m3ww4khzuPcCZUMAcJYB5w0+7VnABTh6GwPh7u/CUvZN/MO4B166eiutYCzw6qpBFY1mw0FKuApitJLqPNaJJYP9eLW+i7E7HRUIZqj8hA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by AS8PR04MB7525.eurprd04.prod.outlook.com (2603:10a6:20b:29b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 13:31:29 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%2]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 13:31:28 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: linux-kernel@vger.kernel.org
Cc: frank.li@nxp.com,
	imx@lists.linux.dev,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH -next] firmware: imx: secure-enclave: bound read copy by user buffer size
Date: Thu,  7 May 2026 19:00:16 +0530
Message-ID: <20260507133016.1737279-1-pankaj.gupta@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To GV2PR04MB12271.eurprd04.prod.outlook.com
 (2603:10a6:150:32a::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12271:EE_|AS8PR04MB7525:EE_
X-MS-Office365-Filtering-Correlation-Id: 67969f19-c378-4a7b-53a9-08deac3cf1b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|52116014|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	nQUlp3TiExRJDjrQ0GVtgHeDLzghf3fzt2YAgUUbMfTwoTwfLxox3JtSu6wspMtX+0rjSGbTAmwK627LCHmFcGzxZ6wOQY04mX4Msx7ztkz3rVATzg3WvsL/M0p2rwg6Sdbo1ZwlOVAN3c3E5pncYRZDuZz7P9FUcoLYEqvnu8yqA7tC0JC0QAgVOuQelYeX50joYztBpPULhRZx/zMMnnIFbCWbUz+QIuIxePB71DbRcFag56dARDPACTSyTGHsVDeKdw0bqxvmIjlCaH+ABDBnzkjoRX36rTSlzz/BY/+6lUQi9xdGg+OHSJTAcnLnLqsq43rykXd/or1hDd+Xmpcd3QBNLvsRSNkKcf84LK/pnOSZ9MMPUyi21pXwhPoByH4lBvHZFkB5WqGDSUtnV36MQOVOmStOdHl5bADQJ6Bq34X9yP9v4ab7SPx5Xqc65Jy0iSZusN3gfAELPqdiMRZfo3LX4TpI31EpSa7PJTO1mN6dqKEEe3IChfMrfM5fl7T56X5/u5p4aVrPdqssLtpPUdynRhMwDrHpvmKZGD+jFUHzbFqUaRK8GGnFG0kwmU0h1kTrZoA3xYpbQ4W3epwv3EPSwkUmxUUe2bOX+io9UGAGI/79fkvuLDs944mvSKL9/MV6gCsmrTwRwbuQxD19CBlwm42CRPBlnBDoFyuj0jP28EZzsJTySmOP7xpzIzYT0lrWt3RXj/EhzZgT/g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(52116014)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7NtcRzT9MYqnzxv4QU+GYBW7+RqafTmpAfndAAYAwulwT7PZ8agKR9HtSNe7?=
 =?us-ascii?Q?prdvcdKoPtzTxU6bH8hd9FjdvwqYCBDsHFPVt4IVXPxlNP7/LMG0deQ6yXZC?=
 =?us-ascii?Q?YkLxl5Qt08eftQNdXhszjFTYg3OM9/CA70PJU8EWw2JsIc11SdU/b05chqlf?=
 =?us-ascii?Q?FRp+zkuyKeesWSi88OQc5o6DDBnpVsO/Inl3i56MV3EQnRQnleNx5C2H70iK?=
 =?us-ascii?Q?TCH3aGMHK4OOhdh6FRkrbxdZMAEfwVC8jh9SiDB896O4u9Whn7veellgLh4z?=
 =?us-ascii?Q?i+ZaFTKCzshSEZY46jmpg5tBCfnI6jyyWhcpsBZGVv1Xbr85PpEpS8OE2OiN?=
 =?us-ascii?Q?MUJVMwisfGdlxjnl76YsOdqOtjLhXv4tziRbxZX3AaZ3Ic7Ba+yDg7IwmVh+?=
 =?us-ascii?Q?a8Nh1g1erjgTGn72GvPUSUr9von5BfhL2YsyouS3JAAtdYwEI7AvqOcq2i0I?=
 =?us-ascii?Q?ANL1ejOVqKxvq4S2n22dUKiwo1cATiDLqiogXs3A7PD5DK4KIFvOSbny8Kc9?=
 =?us-ascii?Q?xeP69Bu5sWa9DJYbz4RoOGjTGNzgE0dEZZI0BR0LDSysqSoZHhZvxeINf6qN?=
 =?us-ascii?Q?a5ErM/XY1Wog3q2mHwoyjQaX8L7ROeiQDtqpKQBiHf5bkS7ONabAbHBdd6Qx?=
 =?us-ascii?Q?oQCJMwVgKd/PCG3+yJ2vn4f5Wl+pP6aWNDQladlMcVq4Xwif1dUfaDDCHd3s?=
 =?us-ascii?Q?p8LQSDjRP1t+W1OBSLMITmFkqfrmqA+6c4iGJUHXq8ZmQpbKqqoRCfyPut9Q?=
 =?us-ascii?Q?plHo3y6ESzQarJHtK3qqzJlK732TDb8rs4WBrcPTsIInmqIcJBhs/8IxZZd3?=
 =?us-ascii?Q?nGmfDff+0ZmhxRfCTOeSNTCi6Nt/C24eRSGjcAmUZ0rolnzFRiU/HV305/Zm?=
 =?us-ascii?Q?BnluPZy/49riWUQTUTjRLjw8z4wGMg050+7CbOy5YKqBmBtqOGeHdj5bL4YC?=
 =?us-ascii?Q?Tl8G3TlAte7gmw+BTsnaF27Z9cf1UWGT/vspW4dYzx+/uVQ+gsNGVFTWcbuP?=
 =?us-ascii?Q?8Pgt37fRf5KhHypdnbeWkWchk+jOB1CrTze26f/1+XnsJ6JV80En97L5YaL0?=
 =?us-ascii?Q?LyfODESyuMqRS7M36I341i373xlSO2vUWahIKMtp5r754xfmG2HtXFblEa4B?=
 =?us-ascii?Q?vQfLUGLPnanUjLPwp0nPMVNOG+omspjq+w9mu4xozdNj8zF0hkeyiNJ75smp?=
 =?us-ascii?Q?4c362gbHZOM5Q4So7AxWpKF2T+5WHNPoltSJvQtrfZFPfrU2qFbydECmnZVg?=
 =?us-ascii?Q?sXo4u7d0k2hscDHunQRpzS8WYFRnEMNLzOb5TbJOIu0HjAYornhHp58N/2Uu?=
 =?us-ascii?Q?qI41S4jhZN7IX5BvhUNDD7FvH1OXcsa28OGeRq4F2h7TEl/Dl+1l5yUJSkPm?=
 =?us-ascii?Q?yPlc+AagrCFyVMRVfJUwX9s3nFtH09qIb0ZGzPnyCZ9xdFZEb9h+TjQqOnaA?=
 =?us-ascii?Q?PStxyHdq5ndO5RTpaJpzZYC8h0gtA4OcaTOpHqG9qzaPIgBHrQw+5qgv6YKE?=
 =?us-ascii?Q?naLNkc3HbbliBkWJ4RR7gbQJZ2MlJeM9P3mtT1DpL2bUMtw0VxxK7JImLTEU?=
 =?us-ascii?Q?aWnhNrCbQEIPPSxotOqy2b/V1E3Vrmmaxu6Y4RwHZJUirf5kqjeZOMsaICL1?=
 =?us-ascii?Q?i+99jI3Q7FSF95UXR3p2bZGRRPTIT2tmR7WKSa/3trXi35tOUuSnRrfzWvfu?=
 =?us-ascii?Q?2r32GbEpnvwrs1MUI0aUAkPhCvkdOfxKrdEK+FBRKz7teCFQL3BAmCAkay+2?=
 =?us-ascii?Q?07n3b/NabQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67969f19-c378-4a7b-53a9-08deac3cf1b3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12271.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 13:31:28.8068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iRq/Ds0ZH3sB2kqopLXR0zUZ84iioWVXGeeRyrA98EWnjBcLFTI3NN/alk03BQ+SgwMuabd/Az7rWrbRor0yVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7525

se_if_fops_read() copied the full received message to userspace without
checking the size of the user-provided buffer. If the receive message
was larger than the buffer passed to read(), this could overflow user
memory.

Fix this by limiting the copy length to the minimum of the userspace
buffer size and the received message size. Also drop logging on
copy_to_user() failure, as returning -EFAULT is sufficient.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Closes: https://smatch.sourceforge.net/
Fixes: 4de71839142b ("firmware: drivers: imx: adds miscdev")
Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 drivers/firmware/imx/se_ctrl.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index d5cc37273d8e..3a1e0c6a942b 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -799,6 +799,7 @@ static ssize_t se_if_fops_read(struct file *fp, char __user *buf, size_t size,
 {
 	struct se_if_device_ctx *dev_ctx = fp->private_data;
 	struct se_if_priv *priv = dev_ctx->priv;
+	size_t copy_len;
 	int err;
 
 	dev_dbg(priv->dev, "%s: read to buf %p(%zu), ppos=%lld.", dev_ctx->devname,
@@ -831,14 +832,13 @@ static ssize_t se_if_fops_read(struct file *fp, char __user *buf, size_t size,
 				     priv->cmd_receiver_clbk_hdl.rx_msg_sz,
 				     false);
 
-		if (copy_to_user(buf, priv->cmd_receiver_clbk_hdl.rx_msg,
-				 priv->cmd_receiver_clbk_hdl.rx_msg_sz)) {
-			dev_err(priv->dev, "%s: Failed to copy to user.",
-				dev_ctx->devname);
+		copy_len = min_t(size_t, size, priv->cmd_receiver_clbk_hdl.rx_msg_sz);
+
+		if (copy_to_user(buf, priv->cmd_receiver_clbk_hdl.rx_msg, copy_len))
 			err = -EFAULT;
-		} else {
-			err = priv->cmd_receiver_clbk_hdl.rx_msg_sz;
-		}
+		else
+			err = copy_len;
+
 exit:
 		priv->cmd_receiver_clbk_hdl.rx_msg_sz = 0;
 
-- 
2.43.0

