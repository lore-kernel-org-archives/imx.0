Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B814DBD84
	for <imx@lists.linux.dev>; Tue, 19 May 2026 10:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187211; cv=none; b=uHyxJzLyMv9+vawj84CkPZyXXkgiV+UXnAEvvuvd0BB4SPJdaF87mshtIQ27sKTOzJu+6vk1OOcrFpJHSm+tM7hoNJoDEwrxa6gSeeww9xKeep2CGs6RfnYyUIdm5Z+9Qb3DkF6wNfiZ4H27IdFmn0Qv+WvhH7hr0bc1zv5YMXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187211; c=relaxed/simple;
	bh=oWK/d/sfIYesmhsqKwdovnoj56fP2QT12deUkChfvd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kQ8tbafY5/YPV0T3PA5f3NEGqdmwJ2OeIGyRLkW6fs0O38ejOUknSaTiQTsbp0N2SWEyU5o7q7Gur8FU/LyE0FPN5TkAM8Ww5cMbKqGjvDiX1nohGfYd6QEOpuo64GRnQIUKzt7OE3SU8eBH6EYeAZSMb3wOcMo0jmVk+T5QqCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UOqU8kAK; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UOqU8kAK"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 186781A3628;
	Tue, 19 May 2026 10:40:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E0E04606E9;
	Tue, 19 May 2026 10:40:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 743AB107E8AF0;
	Tue, 19 May 2026 12:40:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187206; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OkkSgAlsYDBwnM9XbAsNnjeyIYKliFTEgCHfK5ghURg=;
	b=UOqU8kAK9WxaW6HsbFf7Iu6VMHr0gE6JJl8KL5x+H925gM5Qkoe2N35zaGxbWXcMmHpLNm
	oTzpgVU0Zli9HL3Vb9i8GGhHrnWBQ8UG0MW+4jcN96Cha8vogUrF7oEEL9jyMJMhGdIaYC
	zvpnpakc05AMeWd8EWVISs1q/7k96ytRPHfgeAldfdBXVUgD7nhpNuwhYDd/JhzJnAzHEP
	NQtcYPGW9hAcgTn2MioQuJo9k3fbz4Y0T/qjl2wfjmWVAmLRF1BmJ7hMK8vFWBhTfJPTb3
	v4c64Op4MOy6+EKWEwt+5XpJ6DiOEyOWtAA1UPrlXPLABB9wGkbb2ZepDYWl1w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:45 +0200
Subject: [PATCH 28/37] drm/mipi-dsi: turn DRM_MIPI_DSI into a tristate
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-28-45e2bdb3dfb4@bootlin.com>
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

DRM_MIPI_DSI is currently a bool, but there's no reason to not be allowed
to build it as a loadable module.

Moreover being a bool prevents DRM_MIPI_DSI to depend on a tristate module
that is configured as 'm'.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 081660f3a0f2..3093d5f30724 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -43,7 +43,7 @@ config DRM_MIPI_DBI
 	select DRM_KMS_HELPER
 
 config DRM_MIPI_DSI
-	bool
+	tristate
 	depends on DRM
 
 config DRM_KMS_HELPER

-- 
2.54.0

