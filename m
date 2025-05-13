Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6884B28DF0C
	for <imx@lists.linux.dev>; Tue, 13 May 2025 12:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747139851; cv=none; b=MlZSO9qoDzpZfArwHMwA8VN2aDRNzrMrfzXzCpbc7mjjiqijUQKNPEf75KMIP2JoL2Xpzl8ahmLzgTW1lulU8no3Yzt4ekZJzexPEHRN/dImcKNjIqdlWwNova1KwDfWUcSmUKvrf9SrEQZH5wwjiUl2GUIhWB4gn2UvUi2T+rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747139851; c=relaxed/simple;
	bh=3sMnQutBFlPViJp7Hc1+l8Bg0KmvD8Trhn54GPGgYZE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rscL6uuVB0fH+ElLeu6RgWm+PRaAku5fVDl/FEyJ6xQlwy+ReuSKth2XG4ESAe0bU01nziohntiDy8h0sHcoSIkUQfNrTRBPivFQkFQYaMhpjC6LoCzlvFSY+ogAuqhpvxBs+vz2l1nnKr1KUgTp/uC8XrQnYkeiIAPcPEr2jX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=QDnXZ34D; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="QDnXZ34D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=UL
	7uRrHf7AfMhis0KiBAtUc7h4CmxurwrN1nGmPQo6g=; b=QDnXZ34Do4HX+Np1XY
	Vnxp0129+sJL2DkXqzLaa9FR1IauHMsp5At2B3uSIohmxsp2YajyV5r6T0AA+/UC
	KL9jpZPqkx5DKFdiLBWKEIRCpt/uNhPu8wG8ZwBt1PFqsH5+GTjk0MRPgPCcltwV
	vRGY3kKZ/QMvJGIYkEaZYFM4Q=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wBXPCPzPCNojQdqBA--.15182S4;
	Tue, 13 May 2025 20:37:13 +0800 (CST)
From: Yuanjun Gong <ruc_gongyuanjun@163.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev
Cc: Yuanjun Gong <ruc_gongyuanjun@163.com>
Subject: [PATCH 1/1] Add check to ida_alloc()
Date: Tue, 13 May 2025 20:37:05 +0800
Message-Id: <20250513123705.3041311-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBXPCPzPCNojQdqBA--.15182S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFyxGrW7GFWDXrWrCF1rZwb_yoW3AwcEkw
	4xuryI9F18Gr1DKr18tryfAryYkF1Y9FZ3XrnxKws3Zry5Cw10grykArnrZwsrWw4xCF1k
	CrWqkF43Ar47GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRWbyAJUUUUU==
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/1tbiNxpM5WgjNvOQXgAAsE

Check the return value of ida_alloc() in case it fails.
This is found by a static checker.

Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
---
 drivers/perf/fsl_imx9_ddr_perf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/perf/fsl_imx9_ddr_perf.c b/drivers/perf/fsl_imx9_ddr_perf.c
index 843f163e6c33..86da027405cf 100644
--- a/drivers/perf/fsl_imx9_ddr_perf.c
+++ b/drivers/perf/fsl_imx9_ddr_perf.c
@@ -790,6 +790,9 @@ static int ddr_perf_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, pmu);
 
 	pmu->id = ida_alloc(&ddr_ida, GFP_KERNEL);
+	if (pmu->id < 0)
+		return -ENOMEM;
+
 	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, DDR_PERF_DEV_NAME "%d", pmu->id);
 	if (!name) {
 		ret = -ENOMEM;
-- 
2.25.1

