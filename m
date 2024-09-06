Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41C93C463
	for <imx@lists.linux.dev>; Fri,  6 Sep 2024 08:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725610493; cv=none; b=btQ3Mwm8ET4C4qL5X99Xr9aycVTO6ThHJeO5nQ7AngiQVzOVknU9GltPcZOPeNzSscAG09S+84QR2ZYMbEn3PXSoZ0ZrsHnEFDFw/KcJa8Lp2C+MRP5J0LELNdpymFNBdGnt8HdCeC4qfSExGcRd1AlKi91clgMvR5aoC6bCKJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725610493; c=relaxed/simple;
	bh=7xqe5Gr7gKNhtbOi4IUUabnUAJrk+xYWSpSgfXz4Hy4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=azyEwMbK5+rd7OGFTjjhOnpiRrqavX6JHP5qO/V14QF6C3rva+mV9U/jKfYxbapsjYKpAJIG4n8yoFu28+n6n2GHW2C7ULJ66Qmzs1DVDbO9bBAl1aTwHsKz3SY29ixl/phE53ZjykEzidEbe46G8A3Qkam0ZedVmsLzCgIxC2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4X0TRK2wz5z20nb0;
	Fri,  6 Sep 2024 16:09:49 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 89B471A0188;
	Fri,  6 Sep 2024 16:14:48 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 6 Sep
 2024 16:14:47 +0800
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
	<linux-arm-kernel@lists.infradead.org>, <freedreno@lists.freedesktop.org>,
	<linux-tegra@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH 1/5] drm/atomic: Use IRQF_NO_AUTOEN flag in request_irq()
Date: Fri, 6 Sep 2024 16:23:21 +0800
Message-ID: <20240906082325.2677621-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240906082325.2677621-1-ruanjinjie@huawei.com>
References: <20240906082325.2677621-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemh500013.china.huawei.com (7.202.181.146)

disable_irq() after request_irq() still has a time gap in which
interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
disable IRQ auto-enable when request IRQ.

Fixes: 9021c317b770 ("drm/imx: Add initial support for DCSS on iMX8MQ")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/imx/dcss/dcss-crtc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-crtc.c b/drivers/gpu/drm/imx/dcss/dcss-crtc.c
index 31267c00782f..af91e45b5d13 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-crtc.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-crtc.c
@@ -206,15 +206,13 @@ int dcss_crtc_init(struct dcss_crtc *crtc, struct drm_device *drm)
 	if (crtc->irq < 0)
 		return crtc->irq;
 
-	ret = request_irq(crtc->irq, dcss_crtc_irq_handler,
-			  0, "dcss_drm", crtc);
+	ret = request_irq(crtc->irq, dcss_crtc_irq_handler, IRQF_NO_AUTOEN,
+			  "dcss_drm", crtc);
 	if (ret) {
 		dev_err(dcss->dev, "irq request failed with %d.\n", ret);
 		return ret;
 	}
 
-	disable_irq(crtc->irq);
-
 	return 0;
 }
 
-- 
2.34.1

