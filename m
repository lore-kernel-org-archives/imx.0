Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D770F19258D
	for <imx@lists.linux.dev>; Thu, 12 Sep 2024 08:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726129285; cv=none; b=a9sEdPpbGFdQe8UlfSDhDCw2/T24iW5Q0OvuLDzVrLrcpZkukv4pgRML8H2y96Ds9heiQw1XjVYZ1DnSarvo4d9wyuWT7zFLkDZs4VPbrpJf1VV9CZxDUh2NNIuJEA+2M0MISby0oW8TKR6WuacVlAYyWwuEU1+Z8j1BNsfAGwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726129285; c=relaxed/simple;
	bh=uhGeFDmPYMSKAWPD/jrWWFXKl1eEXDz5JCdoInuqcHU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ABb5cpa5vrlju34OoBNMwvfcp65rpkA7a3grCe0Czr3MQBa8VrFY3S/hg91PMcvWU0b6epKjKdWY2VjLFjMAsKvZ4B2vNPStVC627BzVlgl8VcOAAnQrxhWxsJt+KH3HF+lBw4KKhuvfRgTPNXomof1SNgOf236zf7SvEWzDRMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4X49Ns42lGzyRmm;
	Thu, 12 Sep 2024 16:20:29 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 41ACA1800D5;
	Thu, 12 Sep 2024 16:21:16 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 12 Sep
 2024 16:21:15 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <laurentiu.palcu@oss.nxp.com>, <l.stach@pengutronix.de>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
	<shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
	<festevam@gmail.com>, <p.zabel@pengutronix.de>, <robdclark@gmail.com>,
	<sean@poorly.run>, <konradybcio@kernel.org>, <quic_abhinavk@quicinc.com>,
	<dmitry.baryshkov@linaro.org>, <marijn.suijten@somainline.org>,
	<thierry.reding@gmail.com>, <mperttunen@nvidia.com>, <jonathanh@nvidia.com>,
	<agx@sigxcpu.org>, <gregkh@linuxfoundation.org>, <jordan@cosmicpenguin.net>,
	<dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
	<linux-tegra@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v2 4/5] drm/tegra: dpaux: Use IRQF_NO_AUTOEN flag in request_irq()
Date: Thu, 12 Sep 2024 16:30:19 +0800
Message-ID: <20240912083020.3720233-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912083020.3720233-1-ruanjinjie@huawei.com>
References: <20240912083020.3720233-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemh500013.china.huawei.com (7.202.181.146)

disable_irq() after request_irq() still has a time gap in which
interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
disable IRQ auto-enable when request IRQ.

Fixes: 9e532b3ad9a7 ("drm/tegra: dpaux: Disable interrupt when detached")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/tegra/dpaux.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index ae12d001a04b..9646dba950e0 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -517,7 +517,7 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 	pm_runtime_get_sync(&pdev->dev);
 
-	err = devm_request_irq(dpaux->dev, dpaux->irq, tegra_dpaux_irq, 0,
+	err = devm_request_irq(dpaux->dev, dpaux->irq, tegra_dpaux_irq, IRQF_NO_AUTOEN,
 			       dev_name(dpaux->dev), dpaux);
 	if (err < 0) {
 		dev_err(dpaux->dev, "failed to request IRQ#%u: %d\n",
@@ -525,8 +525,6 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 		goto err_pm_disable;
 	}
 
-	disable_irq(dpaux->irq);
-
 	dpaux->aux.transfer = tegra_dpaux_transfer;
 	dpaux->aux.dev = &pdev->dev;
 
-- 
2.34.1

