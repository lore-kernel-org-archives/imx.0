Received: from unicom146.biz-email.net (unicom146.biz-email.net [210.51.26.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DE91FE471
	for <imx@lists.linux.dev>; Tue, 25 Mar 2025 07:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.26.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742889317; cv=none; b=K8MpDcHRjhELbMn+SmCcLjbNSg+MrVgWLCSmdYbdX7nyxJtu6xyiE2//7oBZfQtK/8D+AHlUSG3nuZf9UcAZgB5KmV1iLQpw1D1oyhMFkskqf0dZzXU83ptlS467C6MRkBbzHJqmNzKrnZcGmlFZSRRGj1ljmo5LldvIWqs+zSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742889317; c=relaxed/simple;
	bh=Xnpvn3GB0yvJoLSlTxEHrnTkhA3BtP2tRDX7Q/arrZA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RK4SMh1E7UP4ZjzEIwHRqIJgwRYN9N6W1kbXIatUuCJJzZanMmTaliD03vtU0rvm8j/P4gkIcOisZSHI7V+awz1wPrpjcLnO6nFQoiu1mCi4O1sNGo+OC1WEzwgXyAx0rhiSgArcbfCByK3h+82g7GPQEDhgGWz0OtJJq/h+2kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.26.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from jtjnmail201611.home.langchao.com
        by unicom146.biz-email.net ((D)) with ASMTP (SSL) id 202503251555056539;
        Tue, 25 Mar 2025 15:55:05 +0800
Received: from jtjnmail201607.home.langchao.com (10.100.2.7) by
 jtjnmail201611.home.langchao.com (10.100.2.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Mar 2025 15:55:05 +0800
Received: from locahost.localdomain.com (10.94.16.22) by
 jtjnmail201607.home.langchao.com (10.100.2.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Mar 2025 15:55:05 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <victor.liu@nxp.com>, <andrzej.hajda@intel.com>,
	<neil.armstrong@linaro.org>, <rfoss@kernel.org>,
	<Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
	<jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
	<kernel@pengutronix.de>, <festevam@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Charles Han <hanchunchao@inspur.com>
Subject: [PATCH] drm/imx: legacy-bridge: fix inconsistent indenting warning
Date: Tue, 25 Mar 2025 15:55:03 +0800
Message-ID: <20250325075503.3852-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Jtjnmail201613.home.langchao.com (10.100.2.13) To
 jtjnmail201607.home.langchao.com (10.100.2.7)
tUid: 20253251555055fdb3c6ea51ffa8c946f4d24c6089682
X-CorpSPAM-Fhash: Yes
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

Fix below inconsistent indenting smatch warning.
smatch warnings:
drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c:79 devm_imx_drm_legacy_bridge() warn: inconsistent indenting

Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c b/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
index 3ebf0b9866de..55a763045812 100644
--- a/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
+++ b/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
@@ -76,9 +76,9 @@ struct drm_bridge *devm_imx_drm_legacy_bridge(struct device *dev,
 	imx_bridge->base.ops = DRM_BRIDGE_OP_MODES;
 	imx_bridge->base.type = type;
 
-       ret = devm_drm_bridge_add(dev, &imx_bridge->base);
-       if (ret)
-               return ERR_PTR(ret);
+	ret = devm_drm_bridge_add(dev, &imx_bridge->base);
+	if (ret)
+		return ERR_PTR(ret);
 
 	return &imx_bridge->base;
 }
-- 
2.43.0

