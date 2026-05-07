Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013065.outbound.protection.outlook.com [40.107.162.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5732134104B
	for <imx@lists.linux.dev>; Thu,  7 May 2026 06:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136919; cv=fail; b=n+rHDQbUMDdv/Q9ZcgFg0TuUoOL7EQGF9Etkv95F+pNJFciKeDXwCLYJsar7BYSvE6dqPyeIsBiA9e320yKq4WybyjRrTpUOXnVPHhwMh8Lii1/1y9e/jcVbYel4t0PU3puIfHcJllNuauZ2uEH0tpSH6IYWcZEHK3Qw20Ja2hY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136919; c=relaxed/simple;
	bh=ofT3x27RrENITIVvyqfUYyuw+RYLYYMTvIjKnvHK+AU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=T8IteNMC/6Gchn46bGB3zhg1oLdRNvWDXjgxzxKjy5qz/W1gAYjwGk4L/bvPx7tz1iQfug34s/DIhAc4SE2CK3isZgeLYbQafXZjKeSS1iHVoKNnBnYVCB8yUk0dH/FVT+pQA6F5a+0v4SYMQHYx2nGDe1rpiq3KZuEuQjNsdik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ieZbY706; arc=fail smtp.client-ip=40.107.162.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ieZbY706"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GhrypdtPbM1CEffBWaVo6Q0V10QIiDynNys02NPxZ3zLSmlqOyw+qlAzOIf9dHOrJdmF2y7WxHVkS6PJSTpmQExPE3v9Vz7/GymxCVFmA8fg6SReyuaNIQCjyylMLWQrUGEtlc53ouuo5NGJC1QUMT2QV1o70oV76b3cKun3vM8zIPfEGBatn5M8idzXfDV//W9lt/GKlA+TU1An9Ju2LdTA91pweA8JeAOcokzZgsmbnIdwKeSmqouqOAJE4wxdjcaUbeB6ObPhqA3UOZraoCl/j14vRYPY3jNUZ8eCEcln9/ln5IoOagBlOmx5VJjckF7GNckPTJw7C/0agAxuiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nBouAI5BVEDdrU/5fuN3tZJqW3YVdpoiphMdhktrH48=;
 b=r998MKHFdzRivJdZEExkWQmdZcLnsbwQJ8WGhtV032v1vg5IsJZbzat9g80S5PvEr/UwZHp3os4CPYCfQofLuRnKxQ2nVBkBZnaJBAeJ3Pfuz16+w7pyrkamstZ9iy5Oco7zO1p9V4+DEYdxqPMSKnXFprQ46E4ATdwzMx1gQjeElUgJJQI2FCwIEmblV5qLjT/ycWdd5rOrQcWvglXdMn7jR2jFUcyLS1lNfbUdMmFTOfvVOLlkP1nTHwuDDUs1Am1rsYCmmLA+67a8DQ33k810q0/eLeKeho3GRMdkqzJfN4LtaLFBDXlhTRvTSGvLWf2coTymohHJyL2x315rlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nBouAI5BVEDdrU/5fuN3tZJqW3YVdpoiphMdhktrH48=;
 b=ieZbY706cYQRh7ouQxE57nEtEHhiLbLDwumYnzgOW2QKMU8rWqQpSyI2lYk842xndksyowGa8DtCOunZQ2b5Pu/MdIfMaH2l/I1ZMp9Ix4qmZNgOgPleilGGulRh74nPzboNGa+/ceHi1kwloP7qybV8d/CIbUCttA6NQXBjhwy7lrVMZIadj7/uKDH0n2mqa/r2Zq44FZ6jz/hYhkvd+ycamA1a8tocXebujrVFrWm4W+SDZEXdGpaNJxylDL/S3QVf0GuvmTtlczfNMaUCW5sVoPC7KZCHi/D4fGrWZnRDhDhub0D891QjHByqGd6WZDkgCj0ITzNttbo5VuxIrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by VI2PR04MB10859.eurprd04.prod.outlook.com (2603:10a6:800:278::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 06:55:10 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%2]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 06:55:10 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: linux-kernel@vger.kernel.org
Cc: frank.li@nxp.com,
	imx@lists.linux.dev,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH -next] firmware: imx: secure-enclave: avoid casting userspace pointers
Date: Thu,  7 May 2026 12:24:03 +0530
Message-ID: <20260507065403.1716178-1-pankaj.gupta@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0058.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::17) To GV2PR04MB12271.eurprd04.prod.outlook.com
 (2603:10a6:150:32a::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12271:EE_|VI2PR04MB10859:EE_
X-MS-Office365-Filtering-Correlation-Id: b4f39223-43a0-4e54-3f1e-08deac0594b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|19092799006|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	DFo4vH1ZEl1rod9NVyuynmpFH8oHiyr72srHR3X4B5nDGzlRSx0aeHWfkRY05z25stRvFkx9pobNMIGunjzlsXpsf26P7E6zqOxRRRrydzIS5+9TswpSzAhUDfBPrT2nQj+FfgXnj8dTvYmVo3a9DToRUNC8AU2bC5ww/lVGxKWCYCscCwL93ezmorGI07sIZcwkpvTSUOUOlsuBiD70PnORVuBbBdWYZpJ+i6T7w8ou00Fp8ZhQ3iW8+0V5FSGOyk5dQrgCimgbgU0IHEpcZLGIX7RB+x6ShhiPSJop3WiDWMO07xz40Ll1yZIe7UC8sKEYIxb/RPRyAQetYGU+tD1Ck3eO1f+uEHsUqgaV7XdwB9cuDVcPeN+vRT3vSRt7fBnCJv6vB1VnH3HY5qt1yI4QszIAypCxOuI74+j/Ieva/UbT2EnNU0/t8lBuh9TE6DuF2Io5LlBi6JkynlnMDN1wzTbJOvtUqPgjo6tH0DIAJTxuWih3C5HfwXFrHrvXLWVKVCi9QPRTR1zsqnQ0erCAAaO8/Ti1MvfcHcTJYjYVHb1Jiw7JfOyE3gVO35paF3IpyLc0rxcpFX0eteuQFfRg8qFnVmOqm2EtJb+VzNp+hUJaHmOHtlNmU1J92stEfVHMy73NaduL5aGPgWv4RL4xLUR/yO2eX+j+3s4lvo5RxjO1Kd4iBj9YD+xINC7jwghPYcPc1CRYLGVtnJpPz9K5ga5xYW7UC5hwf+Xhv8yj7Oel3CccDGO3vT11oXMe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(19092799006)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zKNe/zBcMT2uHSxx6pawir6R4rGRCzsi4o853wxREDjwRSos1wwAEev6C+HG?=
 =?us-ascii?Q?f5+XaSykHBBy/H8z0i9TuuROlFyGZamUpAFSEztai7VvBQ771l+PSPf8pMbR?=
 =?us-ascii?Q?cONSDdRRUzQoHwHSQavKO3OsTNLSPYSCjaC7RXS89Y41schs4s6ff6GjB8Az?=
 =?us-ascii?Q?ArXKM+WB+aAiWJYuOHdING3v1GEWyZpYbYoA1Vlw9aoad4ouZl7f42PCSOrG?=
 =?us-ascii?Q?+3N6Z5yXF6AodSFRMcnua4/DrNZV5t88sn5wltfj37pJ91+FW7xg/+3+u6oM?=
 =?us-ascii?Q?HBVL4cKjwjW3KKfN+IaAqbSz1IOS55Zwq7YTC8XJAGwEEGJcU/yZ1D+EVGEa?=
 =?us-ascii?Q?AvGpO89L3j/3J48E4MJsjBDj9+4s0B4ibe9AUC4NsfqhMaeqqZTZ6KMjeQm6?=
 =?us-ascii?Q?RAzeaJDuus//VJpiJhGh2FYSCIOO2NoGx5YMCcFK9x3DXlNXy6+zzPmx71OB?=
 =?us-ascii?Q?wsKXKpWXZVhCSH2JWB9JxMHHTlsP/QAQs9MOl3As/2Uwe1s0HyIRqZwaOzaC?=
 =?us-ascii?Q?yXNPPujLIExj7UJEf24kRllq14qrbEKZkL0W/j3nDAXEVPtpKmJmtyJC8mNN?=
 =?us-ascii?Q?NATDdv0Ix57BwBoJLC5Et/v8nyQPEnaa4pLssp2rXcBJWnddSwkgRKxiUXUd?=
 =?us-ascii?Q?QVUeVwDH0ScEF5Kxlrg8251CfSJHbmvAYVcOheDOe7oCJvO70cRGwuH+UDgL?=
 =?us-ascii?Q?V512NFHRtjvD5ouMZZevxvx5RMllc04zBrKlhAL+DDJPS5BxuB80i7+pSqF+?=
 =?us-ascii?Q?O4WjRC5nQsZbMJ5WBDjIS0vaIcaGxfbUa5PIKC+t8lxn60NyqgX1sqgDObY8?=
 =?us-ascii?Q?cQXZxUHeCy8D/QkihlQDIOkJvWv6fEWC0cIAEUtj+UN7XAS/J4YIwg4lGH1F?=
 =?us-ascii?Q?CstS9254Mxdnkp8gRBInEBSGDG2nS+7wBY3EWKxLsgpa7m0e6c1rQ7dVB0Kf?=
 =?us-ascii?Q?cLsYfBOmOhQaVr2xJmxvsJD+5Befx/DbkKTDpDy/5PFlG/pmzU+++L2fxzJz?=
 =?us-ascii?Q?95spkzHp0AdKvRXk06PERoQl7YrdZgvDyEcA4VsBo8aX3u1VjPJJ8RyDbYUr?=
 =?us-ascii?Q?zTXYmaBCCKnsrXRIUhEraUkD1NLf8aWg0reVHadHiqJvjNreDc1mhho8PPuL?=
 =?us-ascii?Q?Sf8iQfyC9mWnxAbQXBB8pZOUDpIgyQkb2FMVZCsnh3D4c4ORZjcrBmmCsSKe?=
 =?us-ascii?Q?ztc+vjFeqODwECYJnLK6ykBi8ICO5xxuzpCWAkdbncGIVNnRwM5IAXITNgCg?=
 =?us-ascii?Q?cq+OzLw0+3dMynWP5p73v/QelXj8w9xx/KwIvM34G+o9btJNiv9f/ebtm1wW?=
 =?us-ascii?Q?WpQxrnjrZMt0OX6B/TUZuxxF4Lr3JluudFEZ2jlu5z8eJLaU6CkUYu7fTodd?=
 =?us-ascii?Q?iIDLhrz5EZ7OHG4bvq66j90qXn122JiY8nzPdrb9oo7porNUkuzB+QAK+0xv?=
 =?us-ascii?Q?SWMf91iRm8JjxtjApLaoJypjOm7W4yJrFwN8yBhp7McxmYgXMViNlfyIKXsd?=
 =?us-ascii?Q?jJdstqafSlLqlEZ0tHql+XtEksHxButPyJS5CXyEcLN9bD3eNAnRRV1tmctq?=
 =?us-ascii?Q?SnuB+Fltxn/OwyGiVrv+r64joJugXQu+lXhgbai2M8kfxqWho818pelsABr4?=
 =?us-ascii?Q?zAh4lu+rps13cVNMMes/HyBBmHUQhf0oU9jUbJ6w05Ic8IPfZQxvPVDAbp3X?=
 =?us-ascii?Q?LsGT4rNl4bd3DZklLyqoFkK36sRvr1JYdbPLQxJf7Iq1iJ8x21MKiE2fdfcJ?=
 =?us-ascii?Q?q/2w3QvCUw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f39223-43a0-4e54-3f1e-08deac0594b6
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12271.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 06:55:10.4684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: onQw5HToKdaHV7O81nAh4ytT6ucxm7tYWfCKPs+ocGd9cRPVjVTCuWtqorMwMytLmm5Ab9pxqY8VzsPXyppcAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10859

Sparse reports warnings where userspace pointers are cast to kernel
pointers, dropping the '__user' address space annotation.

In the ioctl and write paths, the transmit message header was validated
by casting userspace buffers directly to struct se_msg_hdr. Fix this by
validating the header using the kernel copy obtained via memdup_user()
instead.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605062306.sx2OL0Ul-lkp@intel.com/
Fixes: 4de71839142b ("firmware: drivers: imx: adds miscdev")
Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 drivers/firmware/imx/se_ctrl.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 2ba0a6988a39..d2f7780054a3 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -532,19 +532,6 @@ static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev_ctx,
 		return -ENOSPC;
 	}
 
-	err = se_chk_tx_msg_hdr(priv, (struct se_msg_hdr *)cmd_snd_rcv_rsp_info.tx_buf);
-	if (err) {
-		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
-		return err;
-	}
-
-	struct se_api_msg *rx_msg __free(kfree) =
-		kzalloc(cmd_snd_rcv_rsp_info.rx_buf_sz, GFP_KERNEL);
-	if (!rx_msg) {
-		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
-		return -ENOMEM;
-	}
-
 	struct se_api_msg *tx_msg __free(kfree) =
 		memdup_user(cmd_snd_rcv_rsp_info.tx_buf,
 			    cmd_snd_rcv_rsp_info.tx_buf_sz);
@@ -554,6 +541,12 @@ static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev_ctx,
 		return err;
 	}
 
+	err = se_chk_tx_msg_hdr(priv, &tx_msg->header);
+	if (err) {
+		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+		return err;
+	}
+
 	if (tx_msg->header.tag != priv->if_defs->cmd_tag) {
 		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
 		return -EINVAL;
@@ -570,6 +563,13 @@ static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev_ctx,
 	}
 	set_se_rcv_msg_timeout(priv, SE_RCV_MSG_LONG_TIMEOUT);
 
+	struct se_api_msg *rx_msg __free(kfree) =
+		kzalloc(cmd_snd_rcv_rsp_info.rx_buf_sz, GFP_KERNEL);
+	if (!rx_msg) {
+		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+		return -ENOMEM;
+	}
+
 	err = ele_msg_send_rcv(dev_ctx, tx_msg, cmd_snd_rcv_rsp_info.tx_buf_sz,
 			       rx_msg, cmd_snd_rcv_rsp_info.rx_buf_sz);
 	if (err < 0) {
@@ -759,10 +759,6 @@ static ssize_t se_if_fops_write(struct file *fp, const char __user *buf,
 		if (dev_ctx != priv->cmd_receiver_clbk_hdl.dev_ctx)
 			return -EINVAL;
 
-		err = se_chk_tx_msg_hdr(priv, (struct se_msg_hdr *)buf);
-		if (err)
-			return err;
-
 		if (size < SE_MU_HDR_SZ) {
 			dev_err(priv->dev, "%s: User buffer too small(%zu < %d).",
 				dev_ctx->devname, size, SE_MU_HDR_SZ);
@@ -773,6 +769,10 @@ static ssize_t se_if_fops_write(struct file *fp, const char __user *buf,
 		if (IS_ERR(tx_msg))
 			return PTR_ERR(tx_msg);
 
+		err = se_chk_tx_msg_hdr(priv, &tx_msg->header);
+		if (err)
+			return err;
+
 		print_hex_dump_debug("from user ", DUMP_PREFIX_OFFSET, 4, 4,
 				     tx_msg, size, false);
 
-- 
2.43.0

