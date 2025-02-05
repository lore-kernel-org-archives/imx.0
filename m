Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17EF22068D
	for <imx@lists.linux.dev>; Wed,  5 Feb 2025 20:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738786272; cv=none; b=agcSq+HbaIwkTCUz2FFwEX5NNRpfQ4AHWrA2lbhP/i9andGv0ObqqPzrFUBJo0xmQLzTMaxBosw+eD9D15aGQvapMtn94AMkqVJEvuBCXX84hKA40/UYDy4tjdx6+VOytzIEzgYGlxOmEdrYctUpHjvB4bSxk3mXGiHiMD8FQMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738786272; c=relaxed/simple;
	bh=66gfH4HaVcJzuzQX0NHIOkeT0eso2EOo8AHIoNrPiQ8=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=Tka0dWTvQbgwjLQMnOtFCExaUixLsbGrjKRSWgi+qaOqXlOrcjGWb4Gs5phQ67lcpaBmg9qKYwHtAmRKMPB5lewuAsPeKHkj0NIremDVgqoCpQf+ZDgXBPoAQbfAA1v+WnokY5dss8faPdFKvcOyh+ATVju64hsJA1q7obIi1Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H+4pqROW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H+4pqROW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738786268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WV3CUjfdiDqmiVITg/ki0rg01TIBSPaLDwHXu/1B6+E=;
	b=H+4pqROWvrYCh2BQwhY/hSJCxLlLTfJtuTr64pO1u6+RKAcgWcUu9bamzLt+nCu5cKArwA
	GGrz8y/NOW8XrteVo+Tv1U26oYEb47jmVinaaVoTT29z4Ud1vPS3MTPT1RI04JhvzZmEM2
	8A7mUR5M0zsQQDaZ0znwh1qWCrBZ0tM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-221-V8OTbI5dNI6szj-0skYMAQ-1; Wed,
 05 Feb 2025 15:11:02 -0500
X-MC-Unique: V8OTbI5dNI6szj-0skYMAQ-1
X-Mimecast-MFC-AGG-ID: V8OTbI5dNI6szj-0skYMAQ
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2D14319560AF;
	Wed,  5 Feb 2025 20:10:57 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.21])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A058B19560A3;
	Wed,  5 Feb 2025 20:10:46 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 05 Feb 2025 15:08:05 -0500
Subject: [PATCH 09/12] drm/tegra: move to devm_platform_ioremap_resource()
 usage
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250205-mem-cocci-newapi-v1-9-aebf2b0e2300@redhat.com>
References: <20250205-mem-cocci-newapi-v1-0-aebf2b0e2300@redhat.com>
In-Reply-To: <20250205-mem-cocci-newapi-v1-0-aebf2b0e2300@redhat.com>
To: Joel Stanley <joel@jms.id.au>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Alexey Brodkin <abrodkin@synopsys.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
 linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
 linux-doc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738786137; l=1560;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=66gfH4HaVcJzuzQX0NHIOkeT0eso2EOo8AHIoNrPiQ8=;
 b=M6WZh0GtYS5B4deJ9B3qzO3qNws7WyKrJNpqYJygKF9Hd54wmE5lZ9VrSBMuunB4vSfrq/v+B
 aoMAifGb953DS/z3pxTMJycEfckOvMXSVVatw6+5DoXKTwZ0HpUpzbU
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BjcCzdj-ev0O-KJmao8XTBxUGqbsBSn658aCM0_nD-U_1738786257
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Replace platform_get_resource + devm_ioremap_resource
with just devm_platform_ioremap_resource()

Used Coccinelle to do this change. SmPl patch:
@rule_1@
identifier res;
expression ioremap_res;
identifier pdev;
@@
-struct resource *res;
...
-res = platform_get_resource(pdev,...);
-ioremap_res = devm_ioremap_resource(...);
+ioremap_res = devm_platform_ioremap_resource(pdev,0);

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/tegra/dsi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 4a8cd9ed0a9414b2f40b716fa8c02aff038a53e0..51f1ed897f8e473f45f89ff3e2d99f66d2c80f21 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1564,7 +1564,6 @@ static int tegra_dsi_ganged_probe(struct tegra_dsi *dsi)
 static int tegra_dsi_probe(struct platform_device *pdev)
 {
 	struct tegra_dsi *dsi;
-	struct resource *regs;
 	int err;
 
 	dsi = devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
@@ -1636,8 +1635,7 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 		goto remove;
 	}
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dsi->regs = devm_ioremap_resource(&pdev->dev, regs);
+	dsi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dsi->regs)) {
 		err = PTR_ERR(dsi->regs);
 		goto remove;

-- 
2.47.0

