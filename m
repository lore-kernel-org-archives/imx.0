Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ABFE22617F
	for <imx@lists.linux.dev>; Fri, 16 May 2025 07:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747380819; cv=none; b=PCZpee+dyfVA+ZOCC6FRoNJKUXcOSTJK2CRCfuJjfviM+ADVvqIBo77iKie/nPyNF/JsetX/ssbJkTflGmXQ6hl8+WuMpHoFm4odlToYJRvDHEoI68MSZRo/spouIR+e4S4UeaJy01c8XUPCvqP52TT0OK+mBLgKXKVPNCUg6Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747380819; c=relaxed/simple;
	bh=APTrBqsqoMH5Jgr4KQ9aRzo6eqI2bgUU7s+Crod5uwQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LoVIpoSNw0+cDTcDkTChvtt1caJLx38c3rGw5KMDx7WZ/Z/Gnsq1LfHT5LLYllEYsGYEVflzdp9ubsPOw0HfRUPWKiA8NsvSF5sbjjZA3rh7bhYY65E8aQ3KCPZv2KHwc15dChSFjh0Lu8GxVN7w1dD8k6wY0RgArpRA8M7l1cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=VSyLDwjD; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="VSyLDwjD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=hP
	S8M0yw3gXsPQ2qWqBayExQJe2YTt5XmWjma+o0HX8=; b=VSyLDwjDhhlqOIZzXI
	8eWanTq36KwztEft++jx959BtGQP9uvR6RMMBSoR0BqFt52lVSYF3D5TN7j05jYU
	TfPQr5P3iRcKgU8DMphtl5hcvHdrNI7UTDe/e2lhqvK+U4zUhxTr8EL8wR+yCjb/
	/Qx9WnOUMFZ7sUJ5CEWus1fsA=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wCH7V8v6iZoNymPBw--.55742S4;
	Fri, 16 May 2025 15:33:10 +0800 (CST)
From: Yuanjun Gong <ruc_gongyuanjun@163.com>
To: imx@lists.linux.dev
Cc: Peng Fan <peng.fan@oss.nxp.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Yuanjun Gong <ruc_gongyuanjun@163.com>
Subject: [PATCH v2 1/1] Add check to ida_alloc()
Date: Fri, 16 May 2025 15:33:01 +0800
Message-Id: <20250516073301.3144450-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250516035904.GA28759@nxa18884-linux>
References: <20250516035904.GA28759@nxa18884-linux>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCH7V8v6iZoNymPBw--.55742S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFyxGrWrtw4kJFyUWF4kZwb_yoW3CwbEkw
	s7uryI9r18Cr4UKr17G3ySyrya9Fn0vFZ7ZrnxKanaqFy5Gw4jqrykArnxZrsrWw48CF1k
	CrWqkF4fAr47WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRA-BM3UUUUU==
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/1tbiNxRP5WgmosuSfQABsA

Check the return value of ida_alloc() in case it fails.
This is found by a static checker.
---
 drivers/perf/fsl_imx9_ddr_perf.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/fsl_imx9_ddr_perf.c b/drivers/perf/fsl_imx9_ddr_perf.c
index 843f163e6c33..226d5d13063f 100644
--- a/drivers/perf/fsl_imx9_ddr_perf.c
+++ b/drivers/perf/fsl_imx9_ddr_perf.c
@@ -789,7 +789,11 @@ static int ddr_perf_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pmu);
 
-	pmu->id = ida_alloc(&ddr_ida, GFP_KERNEL);
+	ret = ida_alloc(&ddr_ida, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+	pmu->id = ret;
+
 	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, DDR_PERF_DEV_NAME "%d", pmu->id);
 	if (!name) {
 		ret = -ENOMEM;
-- 
2.25.1

