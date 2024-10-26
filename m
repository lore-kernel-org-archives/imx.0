Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F03D1D319F
	for <imx@lists.linux.dev>; Sat, 26 Oct 2024 11:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729941904; cv=none; b=O0euUZ0ZQk/tfNSgt2lSPOuKkBlvt4cX7Zssjfq84rQLvczswdKLUdJKzpVmRehJW3atJspsp2Ba5t97tOZPTI3CMhx0JAhxWPguhOaX9cojH//q+7pmgiU/o7Lp8nymgAmp5aCVq93gkfpzj9In0dc/ARdvnhsxY505sM9zekw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729941904; c=relaxed/simple;
	bh=FBEwKyXQ1EIVJcM05ojaC9yXUFYk3hwgD8fHBQFGoXs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oUTYExHuVWI2jB6IzvMh5bzMFPjqmSMHyS+0qSNBpGmJE4UfrPYEoIDVNLdi5VZDFjEOQWVujxlf2OJYUNSLNrM0efAa/n/dEM9lpyuUgML5SY5HcM/Vm6cwjniwdpa8odnaemtIeDSt3vc2eAgMU3YwWJgwOGylSh5raPRgLU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4XbHP923Rkz4f3jtv
	for <imx@lists.linux.dev>; Sat, 26 Oct 2024 19:24:45 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id B5C841A0568
	for <imx@lists.linux.dev>; Sat, 26 Oct 2024 19:24:57 +0800 (CST)
Received: from huaweicloud.com (unknown [10.84.78.15])
	by APP4 (Coremail) with SMTP id gCh0CgCXysaF0RxnzRWxFA--.6494S4;
	Sat, 26 Oct 2024 19:24:57 +0800 (CST)
From: Yang Yingliang <yangyingliang@huaweicloud.com>
To: abelvesa@kernel.org,
	peng.fan@nxp.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shengjiu.wang@nxp.com
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	yangyingliang@huawei.com,
	bobo.shaobowang@huawei.com
Subject: [PATCH] clk: imx: imx8-acm: Fix return value check in clk_imx_acm_attach_pm_domains()
Date: Sat, 26 Oct 2024 19:24:52 +0800
Message-ID: <20241026112452.1523-1-yangyingliang@huaweicloud.com>
X-Mailer: git-send-email 2.46.0.windows.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgCXysaF0RxnzRWxFA--.6494S4
X-Coremail-Antispam: 1UD129KBjvdXoWrtrW7Aw1fJFy7Wr1xtryxXwb_yoWDWwc_GF
	y8urn8Xr95JFsxAr1UuF1fXryDZrnruan7XayS934fJasxur1fJrs0qF4rXr47WrWUGFW7
	Xrn3ursY9r98CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbI8YFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAa
	w2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
	Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q
	6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
	kF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
	xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
	xUF1v3UUUUU
X-CM-SenderInfo: 51dqw5xlqjzxhdqjqx5xdzvxpfor3voofrz/

From: Yang Yingliang <yangyingliang@huawei.com>

If device_link_add() fails, it returns NULL pointer not ERR_PTR(),
replace IS_ERR() with NULL pointer check, and return -EINVAL.

Fixes: d3a0946d7ac9 ("clk: imx: imx8: add audio clock mux driver")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/clk/imx/clk-imx8-acm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8-acm.c b/drivers/clk/imx/clk-imx8-acm.c
index 6c351050b82a..c169fe53a35f 100644
--- a/drivers/clk/imx/clk-imx8-acm.c
+++ b/drivers/clk/imx/clk-imx8-acm.c
@@ -294,9 +294,9 @@ static int clk_imx_acm_attach_pm_domains(struct device *dev,
 							 DL_FLAG_STATELESS |
 							 DL_FLAG_PM_RUNTIME |
 							 DL_FLAG_RPM_ACTIVE);
-		if (IS_ERR(dev_pm->pd_dev_link[i])) {
+		if (!dev_pm->pd_dev_link[i]) {
 			dev_pm_domain_detach(dev_pm->pd_dev[i], false);
-			ret = PTR_ERR(dev_pm->pd_dev_link[i]);
+			ret = -EINVAL;
 			goto detach_pm;
 		}
 	}
-- 
2.33.0

