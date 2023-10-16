Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2056.outbound.protection.outlook.com [40.107.104.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297DA26E01
	for <imx@lists.linux.dev>; Mon, 16 Oct 2023 15:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="p1NSuLfZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mN4dSZsYVnxL3yEn+1Kji+In1KAgNTJsvRx+MMC5xBxx+wn4esucUjpSmlRqd72uDWtf2JsuWZESxFVYqnbdifKjIL0Ov77sM7zC1SqeruP/814FbwE+x3t2YhEfccTy1u99gJZJqjXwt3R3lWMR2ArJVWjWlWM2R3pmWn799B/F5xxDSZlAmrmsuG2KHcXa2iUSBlXqq3xdPgnZ/Ag9eY5EvGsAEQepYrWFGsl1NX/wYSSNewpDfZPvk6Y+49aBGpWHgm9CZCleFTJeIwY7bLHBlTGezDVXXsFYac4ydV1/xCriFSqUpsjMUewhlYTX8moONXST5sXNRFrdA5BZ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xn4mPAvhPGdHiiCr3YwVziVD/SfIEV3x+7h8xcqcUzA=;
 b=QOyDe1gCVqTaCwcsFgHJNVKH1/gNWX3SdhWoOzzJg24DodPKd1EcPSKn1eXqw1TqkZAa/D1oChXav7RyXSu0Cq0P28KkkRDoOmGiAWa4oFBjPjf3neEEiVeHsdEmw2JIR3voBNZCdAk3tBxEboDcUclxiJEF7MLpfeNuV4LP03rQwM/UPsYR/EVhhe83UE5L5pzbFQ0GmicwcHMJBGrxgYZDY75PCPO9IvTF7cV/9Frjlay6RHE1W31Vjho8VlLZfJS3GjuT/x9RYj0ntdI0THBaneC11n5nUVWxDfJB/n3gPbFZd4Tvo0GC2ormHANTK13h2e3GUaBQT5B67H+/cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xn4mPAvhPGdHiiCr3YwVziVD/SfIEV3x+7h8xcqcUzA=;
 b=p1NSuLfZ6oQTyKP3Z5Fm/Hv+mRMq1tb4vLUeksDExBeNen66yxM/v7Qx+dz7YiBMUb93WeNiVGuk+ZABBpe8Yw/LCF0DDzkOPVqE0m5kBomFdePjIvMEM3bStJcs9pcxJ/EpIi/ozRQptEGT/nwx+/hWy+QpF5bJ0ubQ4ZuWiyo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AS8PR04MB7592.eurprd04.prod.outlook.com (2603:10a6:20b:23f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Mon, 16 Oct
 2023 15:32:48 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:32:48 +0000
From: Frank Li <Frank.Li@nxp.com>
To: miquel.raynal@bootlin.com,
	conor.culhane@silvaco.com,
	alexandre.belloni@bootlin.com,
	joe@perches.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 1/6] i3c: master: svc: fix race condition in ibi work thread
Date: Mon, 16 Oct 2023 11:32:27 -0400
Message-Id: <20231016153232.2851095-2-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231016153232.2851095-1-Frank.Li@nxp.com>
References: <20231016153232.2851095-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::13) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AS8PR04MB7592:EE_
X-MS-Office365-Filtering-Correlation-Id: 26d73f0e-e4e4-4fa2-cd0e-08dbce5d26b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AABSY/doIXSuIx+laH/eQ1V61vf/gnpQIoxEa/IbMyvRDq+iu/X9s+BwH1Un+PGxXii0CYzdZRSAq62jIjfWGvSbupgD1gx+SKmeC4tZTWaGS/wkSZlcR/Rcpqpl9Kd+25J+Vq48dnupXMV4UB1PqjBzoI7nb8tbbSPK7wRCIW2GVvW9imBGMgt6dBwTEQGZ6ZMVcADTqSz2bBPBbZpD38tsF4X2HBTrT5T1RMbrTFX6MBWxXNlwgnKKYhWHiCCIqgHvPcxHhTYBSWEac4aMipcVwavtYQ4pT1B5CqN4oZwSYVQvABKpz33cRXGRA3vvpgqPsOsRc4DMtT79td0t5l5UExLhC4tkFOeRCvgP4Rkc12Kjq6Io5U0ZwH4bs9hUhwq3bUwFOxsc94tWPiM/GxFNxMU2b6zvEwLE+jiW5xf3SSn6Y1ssgoH7TnVsbUyCtlxDBsaYC/+1rjmUP52qJqKWJxgKoCQHjdFkOODmPqBb5ObDVdsimjbGRiYRkpfQEWWN59vY6vWVhFUtWDs4Sfl5acmb0CrLjFZ7QzY6n/rvuYvp9rAcb0MLZxmRZJ155qu0QY3hrbnGszfQnLoWQjQoUpRVsvcpQq8MM45ULb8tZIhw+GNqNDakLOjz4jQd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(366004)(39860400002)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(6486002)(38350700005)(36756003)(38100700002)(83380400001)(6666004)(6512007)(26005)(6506007)(316002)(66946007)(66556008)(66476007)(478600001)(1076003)(2616005)(52116002)(2906002)(41300700001)(86362001)(5660300002)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6Hb7fQ/bCrQpNyRFy3eS7Ipvehe6iM90xZtvB2BiY6/nnLDfLd4E245GcMLA?=
 =?us-ascii?Q?0qxmkuPZHSQ66klwvF6IWLUOfvpzLz1wXLD6zla5mrK+kCpYi1VglYK7ZHbR?=
 =?us-ascii?Q?N8i1kCVS+mxk/dOdKb3Su1sKr9EZWzkEYaDl4SlyBIKjn86fYj7kjMzJvxdv?=
 =?us-ascii?Q?hzc0xHqrB1+8jhFl3s47ObAGHvu5gscfiisTmzNix6q96OmfvmvPlCGKMWK8?=
 =?us-ascii?Q?Xa1J9qqTU3nPrvw4vkvV2LfZKY6px14U6LI7Zf+M/u9vlhp+0RaRFn9P2KIo?=
 =?us-ascii?Q?+BrnBKVdkSObqLkqIQaa5miJLLTkuJdDHTvzngdwnePlS789AM776lYRR5r9?=
 =?us-ascii?Q?/zZ3RwUtiwJlHyA0QicHKj2H0891uM96lC6IFT3lUy4rafCJ4+a0MR+qSF8O?=
 =?us-ascii?Q?IiNcgEnIwNysdRjYXs7Z9+jbpc4RABo2AqJSmpD/Qa+9mJZ143nijTkKugIj?=
 =?us-ascii?Q?2QidszjHeAhmgJn3OkAyyKFxHhFxN30N/nhA7eC/YCXRXOuy9cc1HzcmD8dz?=
 =?us-ascii?Q?PcjAHRDuCIxmvJV+qjAgP9WLDxu8yIrTdv807Au49xYMPd24HJWwnd9PbUHM?=
 =?us-ascii?Q?JUYmZxV1nbDaxPVy1gKwLBmTCDwCuYmpH5aosIC2lQtg4uwLwggTYR134cIZ?=
 =?us-ascii?Q?uvTiS0xWT0yfC7H97fd3h5xFIZzUn08VHhBlPXYvudIHmlWae4ffZGWRFfIn?=
 =?us-ascii?Q?UHSjDy6Hmjgc1FvI14x+jEwGjtyx6rv79X21u3BK7mS66BgD1hzvdKwf5dN7?=
 =?us-ascii?Q?3txuJtaLjyjtyQazWGgZ+XDyUsHzJ0b3B5EvvF66YqRdAh+5dQ35iDrk/Ozz?=
 =?us-ascii?Q?d8rPUxhy6U8ghHFO94atS5EPIbZ8KKqZOaUMAngBObrpZFrlPhLsxOap9qqT?=
 =?us-ascii?Q?Kdyc52o+vbE+LEBNdqsR7xs3+YHEbxji0WIMUjF4MOe2tknZ3DXzW77G7g9N?=
 =?us-ascii?Q?oIF1EMQrOj6Wp89OUCDgiWPN0aiPa1hxcPi1JG1RiYi0jNWYFs8byfsWhhS4?=
 =?us-ascii?Q?5O6UH4D0ICyhuCDBPwwMgqqP3O0o3l76oZUkv7U3m4boJnPb2Jka6n+PMKcL?=
 =?us-ascii?Q?W+8H9mPFkLGbr54NTvASElJb4aSCaguKbJZNmcBuLVPZuDj2Xy9+niXGHNRC?=
 =?us-ascii?Q?HB90Wj3TzlLjhNF6RVeU/q9sM4Q5jdd3CpRfOhbwL5mBxEBOi3I5xmx8H9eN?=
 =?us-ascii?Q?S/uAMLlxYNDxqAxYtko668ET2KzOUwgJdFotByGmzEK8PErABN3K5vyOhoQh?=
 =?us-ascii?Q?YbPMhTd63wSesnW7SVvg+onGzAdhQRnbJUbhPFoNiLWWuOWMaK4e1491HQHD?=
 =?us-ascii?Q?Vc90JskRm3iKLNpTBnIjAUSUaFyuUqgpEK5LBCKIzuCrxieHLqxmzUNWix6u?=
 =?us-ascii?Q?BW/cspn+C0sh0NEljmh5UOcm7afY/hwv05NJmYbg2TeSOVb6rLkKYOZYYnWN?=
 =?us-ascii?Q?QYXPy0OVXqpmhJuwJ0SMqMCisWfXhCwYBbXPlEAWZRDe/t/8ElftDQoeKrW2?=
 =?us-ascii?Q?tjf/TPMCeqqIfQifbRPCL7FHYe1rKSpaE9vIFfB0wBUoTdARF1SeMK9B1rAP?=
 =?us-ascii?Q?90h2EY+uHb3g18IQ9BI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d73f0e-e4e4-4fa2-cd0e-08dbce5d26b8
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:32:48.1604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q3XSOQmhczwsxHwqXMiJuWtIEs8HCTFdcCACjloCZHpkxHGjXMzkX/x9Ltzt2bUySyIzJPRJe/hun17mjCEgEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7592

The ibi work thread operates asynchronously with other transfers, such as
svc_i3c_master_priv_xfers(). Introduces mutex protection to ensure the
completion of the entire i3c/i2c transaction.

Fixes: dd3c52846d59 ("i3c: master: svc: Add Silvaco I3C master driver")
Cc: stable@vger.kernel.org
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i3c/master/svc-i3c-master.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index c308e22f0ac5..ebdb3ea1af9d 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -202,6 +202,7 @@ struct svc_i3c_master {
 		/* Prevent races within IBI handlers */
 		spinlock_t lock;
 	} ibi;
+	struct mutex lock;
 };
 
 /**
@@ -383,6 +384,7 @@ static void svc_i3c_master_ibi_work(struct work_struct *work)
 	u32 status, val;
 	int ret;
 
+	mutex_lock(&master->lock);
 	/* Acknowledge the incoming interrupt with the AUTOIBI mechanism */
 	writel(SVC_I3C_MCTRL_REQUEST_AUTO_IBI |
 	       SVC_I3C_MCTRL_IBIRESP_AUTO,
@@ -459,6 +461,7 @@ static void svc_i3c_master_ibi_work(struct work_struct *work)
 
 reenable_ibis:
 	svc_i3c_master_enable_interrupts(master, SVC_I3C_MINT_SLVSTART);
+	mutex_unlock(&master->lock);
 }
 
 static irqreturn_t svc_i3c_master_irq_handler(int irq, void *dev_id)
@@ -1203,9 +1206,11 @@ static int svc_i3c_master_send_bdcast_ccc_cmd(struct svc_i3c_master *master,
 	cmd->read_len = 0;
 	cmd->continued = false;
 
+	mutex_lock(&master->lock);
 	svc_i3c_master_enqueue_xfer(master, xfer);
 	if (!wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(1000)))
 		svc_i3c_master_dequeue_xfer(master, xfer);
+	mutex_unlock(&master->lock);
 
 	ret = xfer->ret;
 	kfree(buf);
@@ -1249,9 +1254,11 @@ static int svc_i3c_master_send_direct_ccc_cmd(struct svc_i3c_master *master,
 	cmd->read_len = read_len;
 	cmd->continued = false;
 
+	mutex_lock(&master->lock);
 	svc_i3c_master_enqueue_xfer(master, xfer);
 	if (!wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(1000)))
 		svc_i3c_master_dequeue_xfer(master, xfer);
+	mutex_unlock(&master->lock);
 
 	if (cmd->read_len != xfer_len)
 		ccc->dests[0].payload.len = cmd->read_len;
@@ -1308,9 +1315,11 @@ static int svc_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
 		cmd->continued = (i + 1) < nxfers;
 	}
 
+	mutex_lock(&master->lock);
 	svc_i3c_master_enqueue_xfer(master, xfer);
 	if (!wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(1000)))
 		svc_i3c_master_dequeue_xfer(master, xfer);
+	mutex_unlock(&master->lock);
 
 	ret = xfer->ret;
 	svc_i3c_master_free_xfer(xfer);
@@ -1346,9 +1355,11 @@ static int svc_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 		cmd->continued = (i + 1 < nxfers);
 	}
 
+	mutex_lock(&master->lock);
 	svc_i3c_master_enqueue_xfer(master, xfer);
 	if (!wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(1000)))
 		svc_i3c_master_dequeue_xfer(master, xfer);
+	mutex_unlock(&master->lock);
 
 	ret = xfer->ret;
 	svc_i3c_master_free_xfer(xfer);
@@ -1539,6 +1550,8 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
 
 	INIT_WORK(&master->hj_work, svc_i3c_master_hj_work);
 	INIT_WORK(&master->ibi_work, svc_i3c_master_ibi_work);
+	mutex_init(&master->lock);
+
 	ret = devm_request_irq(dev, master->irq, svc_i3c_master_irq_handler,
 			       IRQF_NO_SUSPEND, "svc-i3c-irq", master);
 	if (ret)
-- 
2.34.1

