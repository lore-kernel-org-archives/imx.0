Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012047.outbound.protection.outlook.com [52.101.43.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488C4411687
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 13:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782825641; cv=fail; b=MVDVjaGFWCGllFUBxU/RG4f2p3vN4HNjui9obHIUq90C0sfg3fsk9Ki1/KqpmEhrJ1e6s2OfWC98vS05tPcaNx9CUZE91+8LlouFP+kPtxMRsp6jCMOemF+ysJ0reElqnzqlxVwTPzgv7WoFy9WDrFp1av1QiaVbwc8WQEqy1go=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782825641; c=relaxed/simple;
	bh=vWqpBLdjlmioFmnGLTbPM5B+hj4hWBJZfcO7kmd0mys=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f0iNkRCUVQBxGEvMAAU5MPd5W2Usk1+c7nd9qcvSE8dwZPOZFKoMNYUN6n7BusqU88HYxU6i4BHvx0vRf+qdfAWTGmSa3OZ4EDKkWkfgVKdE3nId6wO7sWf6GyWvybAbzjlumS0xxOdlUasu2/xOrbshbklX2wSZka94qx6JpEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=odHENFtG; arc=fail smtp.client-ip=52.101.43.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="odHENFtG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XbK3j6kKPSh89r+TzgFNDzv2wlzdomG2ObSA7nFlkdauyP1AElHu6rxmsB/bptUm5JyjIMsVwEG5es7Dspr7htagxo8RcUGTXeCV/jtCgzVZr1yDRqpyQ2QhcAxeWpIoXdfe2PGDnMI6/RT22ouUeXMMGr5sQ24Kq+7TKo3/KTjBdPjoaG118niMa+620frrhsutyogIi03pA+ZhqhAsZnBO6kz3VSID/pAOvGC6hdHPKV1N+m9WbAkXDqA0EKIS1ICeJzPBtIctS9Vvwvxqm3HgV95BE0op67pne3Y4kOsnCSvdTcACwAGEyOOPxc4Y0a776n4LLSP25j+htQPSRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugaU0wvfnu7GqstFd8BDea9pRWCQnwPLnVZJkyxnbWA=;
 b=ILMly0EeT9zPsKOr2EoqVFIQRpsHmDUU/mxPl71Ouw7a5PtgdYwTIjBlCwfnh8nOa7JO14fadOn60e5vzYipVafBSAth6dkZvIUBU0xsnAoMj74dLE/KbD26lFwVgIt0alMKG9PuJ3QURRR/iC19QieRUQn9kXWg3s/0NaatTKUSePlOCDQd6jfriOjKjfaiN3DJnGuSbukdGP4ASXOZ0De3EqE1784LhCgpFt4+fXPkit80b3Vr2Z0v8aSUNUy8IT98aMa46KhN2hDFDLqg2NMuHH3BKsOVdCcjdsnKkjTNg0S6BRIuf6s6eFoKCWBirHkTLhWDD2pjowWlSA018A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugaU0wvfnu7GqstFd8BDea9pRWCQnwPLnVZJkyxnbWA=;
 b=odHENFtGZkzGLJt1mgp8gnpLL6RRvRO17VtXmHB0cirvUUa2MeN9V5tCXhIgI+5uEBrgNEyW8F4RKldKOL92GHP4wFzIX5NY1fgtLXQ7MxdS6uslhHMpDf2O5bN4WoNLpNDTCWg2hBB+YeWZrN6zlB0Ok8EtJMTfI5bidLgW7LjiB6weZ2BkSG4slShOghGgiZCP7tn+/3WwuKDwP1Ke/LffiEDCr0sDPrlfAoumA26n6pvS17teqMEKovCPC4pjCQcI0LYIMZRVwOlCLJVq1dIeaLI+stsTK94A6Su0qfsbw+N6gC1EOD+xS3fSCvxzMTPMcHjZ1lvmdUTdd5mKaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from CO1PR03MB5937.namprd03.prod.outlook.com (2603:10b6:303:6e::18)
 by MW4PR03MB6394.namprd03.prod.outlook.com (2603:10b6:303:121::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 13:20:33 +0000
Received: from CO1PR03MB5937.namprd03.prod.outlook.com
 ([fe80::f970:684e:8c80:91c3]) by CO1PR03MB5937.namprd03.prod.outlook.com
 ([fe80::f970:684e:8c80:91c3%6]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 13:20:33 +0000
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
Subject: [PATCH v4 2/3] i3c: master: dw: Map CCC hardware errors to I3C M0/M2
Date: Tue, 30 Jun 2026 06:20:26 -0700
Message-ID: <56a59c5ac9a09692f9ac8a74d1d3afdce553a7d1.1782824628.git.tze.yee.ng@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: 14c5cc00-e38e-4fa0-62ef-08ded6aa5d58
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|11063799006|56012099006|18002099003|22082099003|55112099003|921020;
X-Microsoft-Antispam-Message-Info:
	VwALoui4keYaVukuwRMOQw3KV8utx/6zxO3SLVWBcoBu5J0WYk4A9ymTXr9jEzOlKP4qfmfk8Ffy8yD5df5Y9Pjw/88Vn2ug6MUoIIbjc5e4bjxiZusfuPYd6Hu23QtHwB66KEq8vWCxSdyMZg52wPreztGHDcFmLBCzRs5/euDIRLAfusbPP5NqaqfoBmSKNirltoNROgH3xshLDR5tbsc8J/3QOT1HTZ5DQxFzLz/2cXaDy8R2/+4VjstVatmtxaqvK4vvJROBeWmhraqaJXAJv/eOA0qo7oqlcuWk5+c+awhiV1uh76iBO4ITmIHmNf+jrQHXlhKQtTEQENfaq5JrUh9IVzuX7S3hQMg/ci/lX0HKGWKj6gGi2/rhCnPcBThgqW+A3XMfkvNk+ah+JoZjjHKhDAPtiCQEYpLgyQYIYh/D+clW9KlCUGmNs9PHRWg8NzN75xqsqjoglylNSG82hBzxi2Er4TsxxoN1pL/SSAWC98wqrEnyOommdI/RPGPuyVU6FbJQipZDEozKe2kxT332olUZylyXkiNCBnEEYKBI1W2NZASvmL/w/Ouc3ADHLlsqRDwaY7THz+0nPDRiCEf0jL0buTpoHBQp7HghobgSaIq3J6vhYzQAi4vXD1weYpLy0a/CZFlmZoAL2MZi6bL4zwW0znAFTY9YE4WQEh/iCN9jEBu6VDMyPtd56sOzT+E5sQZ30B8JmjGcRA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB5937.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(11063799006)(56012099006)(18002099003)(22082099003)(55112099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wTaBSrwkPax7YmXJi3I9w+0RIcNhEm1HuJ5yj7X7KEolKdMhjOJ/MaRL0ir0?=
 =?us-ascii?Q?DJU8BIrhfaVpJFwDSJ0vkO8/znganxaAnnh/NdCl2nAWH65J0PdiyiJ7jYFA?=
 =?us-ascii?Q?DNk3LoF3Pw2T6k0JnX2I9gbphIvrk6KVE4ECZ4978dG2u/HZKkWdh9xPi66C?=
 =?us-ascii?Q?mQCfWEE3in9jZc6lejGxumI7M/oG7+Ya/oBZXDiZcv3BXgK7HqJ3USu1waC3?=
 =?us-ascii?Q?5uIDLqu/BueU6h2fxb1QoM/yIsVtHHEy79BUIcF2xy4zc5Ou6s/aiBWGKMg3?=
 =?us-ascii?Q?jYTzy+tonUpDQvUBqVZoC8BmaO8BDedk0ji8VCmn/Yhhhs1dBLKljH2bbNcI?=
 =?us-ascii?Q?2pWGei/ADOji3G4xiF3Jg+jZXd/4tFKAt85Z6kx+RnN4RxF1XSM8s1ncX79V?=
 =?us-ascii?Q?RflA65Edo35Gg/8xNYKdK/xTyuwkN5EuVQdmTMuchrLI30OW+EFcZ+ANJ+Sb?=
 =?us-ascii?Q?2UfJeBw9FDoFy4yRUVeEZOGDtY7S8LRHb8BKF3lNguj6Pk9WNhFrPNw+pQKn?=
 =?us-ascii?Q?DIlSLgRUYpFgsiPyI3UUBvXGY9RzzI0ySguFYoboK0lOKV30kSEirAMf7uxk?=
 =?us-ascii?Q?ziOVh4d0lbKvvOHlgBMnnaDBxP1Qn+VTRRHcxArTZ/kyse8Xc1xHIH66YgRZ?=
 =?us-ascii?Q?kOWe9n1W/OiRXSzHfYH9iGBAx7PoiBP8rv20P0pwTUOAJVK5pgHr2o+A/o9k?=
 =?us-ascii?Q?u/XsbUBhfd3+gpLQeLFYbGs9tC4VGowjgI5LCpXdnhKyX0789X+VDYlP3gUz?=
 =?us-ascii?Q?Hdb0PMmKLnPMO4q+QfLYZQCNH9MgIkH3Q9jgtep+IilIh8AvxepQPilPLRMs?=
 =?us-ascii?Q?WgbZu5dBuP6Nn2+KeS1V1WNUEAKExVZnU9pSZQBomgHM3cJTCGHSsGEeJ0GR?=
 =?us-ascii?Q?HYDSwN50o4ZTQNencpBakFYg0eArtWvH/lySSk1BWP01GmkgeMPCRhPGFWi5?=
 =?us-ascii?Q?uXm0jDYiR9l7IIRwYp2HNQmeo8jIRSOqIRwynTCRAxosqZS56zloNYllx/Lt?=
 =?us-ascii?Q?WvLPULRquOr9GpaJEbmTiNeH+3cMsjsfFatB4lscvkPfUpRpKY6m4EOxPhl7?=
 =?us-ascii?Q?kls7g1IP0R3ANGHEH7vXPdmYiQPt+u1BUBki3ifTzjsqljrTEbaKUIjbZOL8?=
 =?us-ascii?Q?KqM1Bo5Vuv81Chyfdqt4esgcPJBTLt0578WPbc8HNefXUoisRIJ9ZBRHfSLr?=
 =?us-ascii?Q?OY+vlowTL7yxKlW+pSmO5Xa6Q16OYq443PDtIlgDePn92Lm5k0tk2ruwdyhZ?=
 =?us-ascii?Q?tZfD8+m3mRyBAmS2Jikl1x6xW7Gl+icoCPop+oV4IUH3H8kc55mzyqnqMoGU?=
 =?us-ascii?Q?ozE/PPCAV+8T1qsp9inPJtBhuon0JR+zW1gRrvIueGmtKkUfQT6dyWoTCCQC?=
 =?us-ascii?Q?iGtbdqszsFUrtUkb8bFvCtAK2lzfocdEreE5pDkI8Ur3jBra7YbiSzaG1Sbv?=
 =?us-ascii?Q?630wjyXYVlOeMUhulx9YFCGZ/5eXWcFJUFTK5qNTVl/IdoHh4RYfiwM5SZsc?=
 =?us-ascii?Q?vcxsykFi+CMeT2wt8Gu19c/vo9GF+2FoPrA6Jp4KKzkuTuavaxAS/g6UQChk?=
 =?us-ascii?Q?0JO0jUxc6EU98HKYppT0lYapcNEAeIj05dkB8s2cSMDuISqHVpMQ7TTmu/e/?=
 =?us-ascii?Q?q+bdAb9lhIK0t/j+MgNt2n9Naqsr1bWk2NG+LiWS4OYkf9ip8eU8cMpBbcWk?=
 =?us-ascii?Q?uwIM9jYLOdCTJmwff/45xBMFwTaR1ZVH9OZPcHf/0FzusWeFVJOn1biNg/vc?=
 =?us-ascii?Q?2Lq9VdkpdA=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c5cc00-e38e-4fa0-62ef-08ded6aa5d58
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB5937.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 13:20:33.3296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XFIKc46znuSdrVcHsByHUkwZIMpyVPcBCrte8QpK9enHxCagIaIn9K4zme2UR3p3VHlJzCChDVU86/DtGzWl0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6394

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

Map DesignWare response-queue status to ccc->err:

- RESPONSE_ERROR_IBA_NACK -> I3C_ERROR_M2 (broadcast address not ACKed)
- RESPONSE_ERROR_CRC, RESPONSE_ERROR_PARITY, RESPONSE_ERROR_FRAME and
  RESPONSE_ERROR_TRANSF_ABORT -> I3C_ERROR_M0

Per the I3C spec, M2 is the case where the master does not receive ACK
for the broadcast address (7'h7E). Target-address NACK is not reported
as M2.

Return -EIO for RESPONSE_ERROR_ADDRESS_NACK so bus NACKs are not
reported as -EINVAL.

Reset ccc->err to I3C_ERROR_UNKNOWN before each transfer.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
 drivers/i3c/master/dw-i3c-master.c | 32 +++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 856961da1827..c70f6876bd38 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -493,6 +493,7 @@ static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
 			break;
 		case RESPONSE_ERROR_PARITY:
 		case RESPONSE_ERROR_IBA_NACK:
+		case RESPONSE_ERROR_ADDRESS_NACK:
 		case RESPONSE_ERROR_TRANSF_ABORT:
 		case RESPONSE_ERROR_CRC:
 		case RESPONSE_ERROR_FRAME:
@@ -502,7 +503,6 @@ static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
 			ret = -ENOSPC;
 			break;
 		case RESPONSE_ERROR_I2C_W_NACK_ERR:
-		case RESPONSE_ERROR_ADDRESS_NACK:
 		default:
 			ret = -EINVAL;
 			break;
@@ -708,12 +708,29 @@ static void dw_i3c_master_bus_cleanup(struct i3c_master_controller *m)
 	dw_i3c_master_disable(master);
 }
 
+static enum i3c_error_code dw_i3c_ccc_map_err(u8 dw_err)
+{
+	switch (dw_err) {
+	case RESPONSE_ERROR_IBA_NACK:
+		return I3C_ERROR_M2;
+	case RESPONSE_ERROR_CRC:
+	case RESPONSE_ERROR_PARITY:
+	case RESPONSE_ERROR_FRAME:
+	case RESPONSE_ERROR_TRANSF_ABORT:
+		return I3C_ERROR_M0;
+	default:
+		return I3C_ERROR_UNKNOWN;
+	}
+}
+
 static int dw_i3c_ccc_set(struct dw_i3c_master *master,
 			  struct i3c_ccc_cmd *ccc)
 {
 	struct dw_i3c_cmd *cmd;
 	int ret, pos = 0;
 
+	ccc->err = I3C_ERROR_UNKNOWN;
+
 	if (ccc->id & I3C_CCC_DIRECT) {
 		pos = dw_i3c_master_get_addr_pos(master, ccc->dests[0].addr);
 		if (pos < 0)
@@ -743,10 +760,7 @@ static int dw_i3c_ccc_set(struct dw_i3c_master *master,
 
 	ret = xfer->ret;
 	cmd = &xfer->cmds[0];
-	if (!ret)
-		ccc->dests[0].payload.actual_len = cmd->rx_len;
-	if (cmd->error == RESPONSE_ERROR_IBA_NACK)
-		ccc->err = I3C_ERROR_M2;
+	ccc->err = dw_i3c_ccc_map_err(cmd->error);
 
 	return ret;
 }
@@ -756,6 +770,8 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
 	struct dw_i3c_cmd *cmd;
 	int ret, pos;
 
+	ccc->err = I3C_ERROR_UNKNOWN;
+
 	pos = dw_i3c_master_get_addr_pos(master, ccc->dests[0].addr);
 	if (pos < 0)
 		return pos;
@@ -783,8 +799,10 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
 		dw_i3c_master_dequeue_xfer(master, xfer);
 
 	ret = xfer->ret;
-	if (xfer->cmds[0].error == RESPONSE_ERROR_IBA_NACK)
-		ccc->err = I3C_ERROR_M2;
+	cmd = &xfer->cmds[0];
+	ccc->err = dw_i3c_ccc_map_err(cmd->error);
+	if (!ret)
+		ccc->dests[0].payload.actual_len = cmd->rx_len;
 
 	return ret;
 }
-- 
2.43.7

