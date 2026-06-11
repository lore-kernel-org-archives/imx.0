Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010067.outbound.protection.outlook.com [52.101.69.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9A53CEB9E
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 10:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781173832; cv=fail; b=L/XYrndphNHP00afHjSOHqlXoiAy2Jr0Rs5AcLJh9UwuwzY8Qv7OwPA5u3xV9uYuLBFNrRbGz000OTO7EcG4YbXPyoX6q8+JpMY0ALc3e58c6kDPgcm/fSAwt6HvFPeIiQBeAgVqCivXqi4oNte94M1GH0rrbZSDUJzLv+nDbAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781173832; c=relaxed/simple;
	bh=aBgu/6BuNoHhzTHX2qF+gl2WDWvG1Gcgtr/olAtd8do=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=aGiJQ0tkqDbQu2gxZoY41uFHKtGwZdMXRz4Khp7D7T2/zqVA05xk7x0dwkQN5LxKkIQbvSHQcRVRs0blox5eJVsxVHeCfayRsueMoIoEoFkyv7DAfTlSr/2i1qx54bXKbArQ5JddaD83EsONIY0hu9ADGGopS0xx9WM5C/I/rtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Lv8AVYXZ; arc=fail smtp.client-ip=52.101.69.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Lv8AVYXZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G596e0Rd4QgwwLhnFlGgYWy2bB6BOCjwz7xZuTZwVzxE8whRZq6L5dBo/7Uuw/yK3r6tTNeUvrhEbPooDmFezXQFTNCk+rX3Zq7Xf2rEbgKMpnKE6LDiCxGk0zZJcVEtXU62pc/RLGUawDGsqtR2hfq/G+wb+IZ0VGdUD16fy6CbwbXgzGaV5c9i06C3YGCr7YykKY+fJO4TjQ6y37npUVnSx9r/wsTioSBJOpPGUqaD7cK80kWowvIvkhRwgFLzVrgYq891lYiWa8OU1JPzBKd0rBwp5LsUGmqPt5vBbFNzl5IXlYmDtJtALx3iLiRN4lsr9YAQUGTPcKnfASgmug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wIXy/YF13CN0c+n8SNJdVUnqtTX5MSR5CqajXup6zk=;
 b=kY7HfRbQRQGvugPyqX799OSzp8qQOlP1ObsPNduAjdyY1nEt1H23PjSyPi2FyHJ48f8En1mxwUSej90JgoKSmtorouR6QXOFUz9F7Vsf1zO8ozY00uo/E2DvmiFzzfjI03KwMCvnJ8n+dan3a03susHA7oheb48lK9UR4KjIS8hGANO7zU4BoZzzhTuoRWzvGNajobT4BpofjbzcKCKNblHLLIrJz1FyOmkwAGa6jFT5wuTDoy2b975eAJz7Ti8kBBNq80653KqQjkJz7WLtqR2bFRKooQiW8BDpb6jWDooWy9VMCpaPWlJT7U0eL5iE2cJHK9hoF1UpWnliSr+qDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wIXy/YF13CN0c+n8SNJdVUnqtTX5MSR5CqajXup6zk=;
 b=Lv8AVYXZaRZmzui3xAvqvqbnIjHfm7nVDXM931RQ5FSQyqeahpCSTpWlvfuSGu9KOq3v7JWREMoC9sTuLeUP4Ya/6UKvAq1I35AaDr2lezINGD9q10jk9t8qwZA05o7KJv0Tw59stnjs9wdqxH2GoG/nR9/Bmrr3X+UJ8RZMYd9gz0Pi02b+aetHRFLo5vbFaitInYWUqZVgwWF4J/2jPlr380JSBbJa6PvUQYwT5MWhhaJ4WTmxRE2ZN+hp2BPx5ol+SAp6amlw5mXjZ7AN/gxrSTPp7m5EVwDMarzs12SApPqE5M1DinLcGlB1wWyfcXdgHeEKoRtORZ4VDq3F3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by DB9PR04MB9426.eurprd04.prod.outlook.com (2603:10a6:10:36a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Thu, 11 Jun
 2026 10:30:24 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 10:30:24 +0000
From: pankaj.gupta@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	frank.li@nxp.com
Cc: Pankaj Gupta <pankaj.gupta@nxp.com>,
	sashiko-bot <sashiko-bot@kernel.org>
Subject: [PATCH -next] firmware: imx: se_ctrl: bound userspace-controlled response buffer size
Date: Thu, 11 Jun 2026 21:20:32 +0530
Message-ID: <20260611155032.3200428-1-pankaj.gupta@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:194::15) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|DB9PR04MB9426:EE_
X-MS-Office365-Filtering-Correlation-Id: 9244a50c-38c8-49d6-4de6-08dec7a47270
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|19092799006|376014|366016|6133799003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	VbmSHKB2lV5VuaAOPopQJdYuttKRAn8KG66HXd40bM3CAVXbILxsLXJ35A1oOtt4pX7wvscPNrgXCz/PH2ShIvzFfyqa0dBVSIPCXJdu0frEiMP8BoTjZiy/Kc4Qi4PtnOQWg4vsGcfyuNfqckX+/vf1PvpjzIo0rMJMDIKnZ6OFqK7uxSAmo8H8I/aVg8hZOTaOTrA8b+GGLEL2de+yMIaoB7NaMS6xpjFY0SXgIJbtkwVfQNuW6uqbEVgwcOfIHNgSlF1W4bMbLCvQPsIFSp+CZGphoN5zjbfrvTNy1nupHLxSt7lchvur/ZfroHOsl3gvYzXvO9Xd8ouLkG3fIFv0JLYrM8rN2kziDCfV2e81vjfomLfTNVxdDCmek5YqHhHvmd4bl1/rNPEXSYsYb+xtQ9XH5faSNriuQuI4P6nN5I0ZiJhOqEXQumCmkAOVJCKzRjerH0EX08OHnI99lRvef88GqFFHw5ZENlUh4aQE8o6AW95FutqZ1YmYjqrwHvfuMGN4yi3OEwtmusiCdExPEzVM4xN1OaVkLiw//QHt0JwH4sLF13I+QNqUSF3rLN94f8QHtFc9ATAtMH+aiudsEKBsOVh39SHCzl/MFWF6bu+Gs+7U2eMuG2Df2YNubQN2hS8ySljuVhatoXnjdg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(376014)(366016)(6133799003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vGXlGEJIBJQ/s5QwA75mWtdILcNoicmrKq7NJrTlMOpfQMUEr9saGTSjBsIe?=
 =?us-ascii?Q?KeHlQPuUqqhKYg0vlFXILRTI+SOVnfu60Xa0G7F61nsXwp1Hq2I9licqdVM6?=
 =?us-ascii?Q?UhYjNwmuh2ao/parGASDWV2pOfmCN/FoTPc/2Ntv41QfKyV7NOm4mqM9/VKf?=
 =?us-ascii?Q?oUUOnZzv7XCi3J5oFguPG2ewiizLGEqKaWhKC7gVx+HDI8Il9oMQYzfG+bn6?=
 =?us-ascii?Q?2ANE48KmwvFxroGQdfiBGMxWR5eDEcpY2GWkDUGIA6un12Cb3VypO+6OWIbs?=
 =?us-ascii?Q?wTn1yjAIjZFDTF8Lv7tHLsaF/tXyAPAK7h7aVqqq07jmEMi3R/WtQanEjEVt?=
 =?us-ascii?Q?Oxw8WXmWq/teuiuTvvwsb3Y4qU1y9HesuttO9vt4zWj5Ay/ZaCUEYHHSCB6D?=
 =?us-ascii?Q?0yeLMRtKILWVaydC4lQ1RLZJ+8PEUELC9LCQqTpNiGSxqh1joX1ewwduE60M?=
 =?us-ascii?Q?AtXFFi0RPBIeHOUcoFdLsp2eqp8QfMx3fljKKSnYLdLsnuowSlvLr/umM0dR?=
 =?us-ascii?Q?kuCuePpXSZirl4C6cbT0QfsCIMLZFtX9C/ODB+Am97qA3oBAQKcUTr2eyV8y?=
 =?us-ascii?Q?E5zDY+tZgVXJWK1VNTLFfaie/XBgvr8JWG9XDdVgh5PKhkVlApUQz34yuibS?=
 =?us-ascii?Q?ngZHX7rXgiqsb8BBROpFXqbwcAlcANj+zskgVdk+n1dIy/od+MPUsJow9DND?=
 =?us-ascii?Q?lJZPDOM7lunQTdPcxEGLZkI27TZUfqug0IRJZn2QwVcX4G+biLLIY/Vszi1a?=
 =?us-ascii?Q?dTnqvUckBBgC1GNJEIA7QVxYzsEnOFgudSiZF6g7hLU8I1Q+eBa1QRQp0eTj?=
 =?us-ascii?Q?O6UqczetRY4tD6KMkgG4i4/URQ6qUyf17/CekJclBqDWcYA8jKAdt1BoRz+y?=
 =?us-ascii?Q?CUVPjXAOAAKu45oAChz2caJqviAh5fEVibbkU9crd2DHAaoruHqiVFln/Q5i?=
 =?us-ascii?Q?FCZQ23m8qKaMI2Ob98blh0T8F/mc8QJMGxRhn1uDSnDBHiNXB/K/1Vzy5mvW?=
 =?us-ascii?Q?QIyg+jjMY9gftGFSRKBRrBg60pLOOYkNaY64IoN1S3T9ZEad3pKAmzhodLUr?=
 =?us-ascii?Q?HO7hREokQ7D9I/Wvs3OC0MK2pX5zsyxTG20n4iUPAELhWoWsMaXJR3VKoihc?=
 =?us-ascii?Q?yL7UmILZP/4yD5eqPLQPosbNNM6ILHyRIpRDom7wOsPB/V2xfNFEXDmLeRBC?=
 =?us-ascii?Q?nqdQBnYQYOh/9UggrEy9tt3jlazHTGEvR9QYiKcg2zV2zh82ntV/ZAN11C+U?=
 =?us-ascii?Q?p5KgFJVg8UcrvELbdZGf4LUJzsOpgObehCWik1MW0bbYSQNB55flN/9fWph8?=
 =?us-ascii?Q?IiMURI7qjoj9N8myvRqPT26242sO0IiUwC40qYDaUme28e1BSbDmJZzEKH1u?=
 =?us-ascii?Q?emWVzMY6gzDVB4Yhw6xvxaSIQi5/BatHMb+pX8Ia4U1K2IS+Njg4JUxFzUMg?=
 =?us-ascii?Q?gvHWC2H0wxEgRsa91WbTCvO+ggwebx+uAAYDcVNOINANMkBPzfkWkpHlgnDR?=
 =?us-ascii?Q?iKkyypxCluXM0X2nf0xkI68GPW9wTMYW+t8gS4+/IKIcYbphBBD+dC6uSL1V?=
 =?us-ascii?Q?PYoUUgX6rfrUif+TmpuIxKd82cnZLCSGc4gTsfjh10dwxh91P4q++Zj69R3C?=
 =?us-ascii?Q?B5ikvGDtD/nhA/cJG93ynrT8stJMe6akUwLjD6qCyTAcYSo50XfzYSQnjz+X?=
 =?us-ascii?Q?0JzB2Lg1nqKCfpd/PYAprWhtKhwAFdj3d4wCR/okRW4jQUVN5EAZMIhmoJ+Q?=
 =?us-ascii?Q?btJFUk5NXTTvZMSwmxyuRrcn/MdtSLTm8uyVYsKCnY7YRjCcg6Dv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9244a50c-38c8-49d6-4de6-08dec7a47270
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 10:30:24.4429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /MiOd+/8MgPXUOTyEYa/wOL3IIXWAjdwQ6HqUnBQ6WbwwA+Jk6y6sLnbNRA87MBjNwTS1ljlSSm9msHmPQBJ/pRLZs/0BEUt7K3klt3CCrhZuMkDYsmZQfE4wKajLgT5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9426

From: Pankaj Gupta <pankaj.gupta@nxp.com>

The command-send ioctl path allocates the response buffer directly from a
userspace-provided rx_buf_sz value.

Reject response buffer sizes that are smaller than a message header or
larger than the maximum supported debug-dump response size before
allocating the response buffer.

Fixes: b87b30bbdfb2 ("firmware: drivers: imx: adds miscdev")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260528091446.3331006-1-pankaj.gupta@nxp.com?part=1
Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 drivers/firmware/imx/se_ctrl.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index e42e5e23f48a..c9e270288c3b 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -32,6 +32,9 @@
 #include "ele_common.h"
 #include "se_ctrl.h"
 
+/* Maximum response buffer size in bytes for debug-dump replies. */
+#define MAX_ALLOWED_RX_MSG_SZ		ELE_DEBUG_DUMP_RSP_SZ
+
 #define MAX_SOC_INFO_DATA_SZ		256
 #define MBOX_TX_NAME			"tx"
 #define MBOX_RX_NAME			"rx"
@@ -542,6 +545,12 @@ static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev_ctx,
 		return err;
 	}
 
+	if (cmd_snd_rcv_rsp_info.rx_buf_sz < sizeof(struct se_msg_hdr) ||
+	    cmd_snd_rcv_rsp_info.rx_buf_sz > MAX_ALLOWED_RX_MSG_SZ) {
+		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
+		return -EINVAL;
+	}
+
 	if (tx_msg->header.tag != priv->if_defs->cmd_tag) {
 		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
 		return -EINVAL;
-- 
2.43.0

