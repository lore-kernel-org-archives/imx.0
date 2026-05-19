Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67C34DBD81
	for <imx@lists.linux.dev>; Tue, 19 May 2026 10:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187180; cv=none; b=CBp/fZ2iZDyX3jOq3n7eT3h0f29xuC3DAf/DKEPaQ+CX2CWq8XIGCtx11tsp/RNq/VHsEuC+7WDLpKX5SG/6mUewsQPsXwDwnSo0hd7qRcWp23qtHOy5o8sdQwhblxQYgu3+cIbsvaWEOJcKL9wyhpUMsfnGVUQckh9Js1oQdsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187180; c=relaxed/simple;
	bh=ypAF8onyduAdlKexEaakk8l44WdGCnROVdCvJ1bcoxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cnlz0kKb5VSG7HoMFmtbpxIv6tuHDH4UY1RFzyhXCbGcX2Tt9UXskQ2WhdWGgwfTThwPQB5/yw8CrjJfo58GuERZ+AWx9OyjMJw1VIP6BR9mIoQrt4hy+pFuyPIomxhqIijPnJwdi2brAAxRh3fitn9QptQoImr6+gg+Id28Hng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fds5ptX+; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fds5ptX+"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BFB61C2B9DB;
	Tue, 19 May 2026 10:40:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 95B0B606E9;
	Tue, 19 May 2026 10:39:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1F29C107E8AEA;
	Tue, 19 May 2026 12:39:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187175; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Sao0yuOn9cKu8y1mwI62QTwKuextTxc4wrqkEYzJgG8=;
	b=fds5ptX+ISSKYE732a+mWt2C3yJ0bk/EOQU5Yg8lFWoWyvrrpHoft9W6zIvZp0p1qS/+Pj
	u2RTS20ixBQv2nQhXkkimN9FDNyYOQhlrO86b9HmB6xDbZESgY6d07ajiaLmcpsnh7UV5u
	lRSIl1YZyPCRT7fqlZNjB3BtFSWV1edY4ZN0v3JoYJYTd4eNDmJDoWbkBPq8jP9qyek1eu
	7z9tc9phH/NEJ4nXXVR8L7kmBHrbKyjKulqYnXnkVUY6VrzavivWqWJtHfqTogVgDfxDdJ
	aePNkGH1yIdz5mpmp/IOM0FwuzVV9HxIii1pXp6X8L2vw2VvSbbpGTQi8lHqtA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:38 +0200
Subject: [PATCH 21/37] drm/bridge: initialize chain_node list head on
 allocation
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-21-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
In-Reply-To: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

In preparation to add a check to detect whether a bridge is not yet
attached, ensure the chain_node list_head is always empty [as in
list_empty()] since it is allocated, until it is attached.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_bridge.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 687b36eea0c7..657f6609d7b1 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -378,6 +378,7 @@ void *__devm_drm_bridge_alloc(struct device *dev, size_t size, size_t offset,
 		return ERR_PTR(-ENOMEM);
 
 	bridge = container + offset;
+	INIT_LIST_HEAD(&bridge->chain_node);
 	INIT_LIST_HEAD(&bridge->list);
 	bridge->container = container;
 	bridge->funcs = funcs;

-- 
2.54.0

