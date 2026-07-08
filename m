Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3753876B8
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 20:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783542196; cv=none; b=s7zpYflA15nojoA4fsuRVtlpyyPZODu0BYjWdgH9CkIxJmh2XiFGfl6A5X75NARiophBXA2my0msy0+CLwDO5fQuecnij9XHB7SRZ4ak87NnOvb508opyEX1vUzx3YtMfc3gHuAOg1U8BViZHv0SmyA/UaN9bROtn09tgypLsAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783542196; c=relaxed/simple;
	bh=Dh7op/D6y72KqSKFeOFfXlBif3+8TipGaZ3CMsbhypI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F8lKLsbF7u+lcvYT4qAI2Ot/CifOssQgAk6+IqqGuJZ0eVszRws9Usuye+0jy6vPeSb+8JVYL+exOphLRCX05IFjxBZPgVa+I+E3ZDoxZO0SbI4n46oQ/vjU+T+eKTNDBBIOBb3v9PZ2RR4Dk9KWOdPmI9a0jzP7UgMdOA0rH4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I5AhhM54; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I5AhhM54"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493b779003fso1028205e9.3
        for <imx@lists.linux.dev>; Wed, 08 Jul 2026 13:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783542193; x=1784146993; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xGPWKT+T/Sc4FxhkqkRyahjTyPdMRSTRlzX+JKb5mbQ=;
        b=I5AhhM54x9ZqZHzEbZBvp3llEe0a3uEhuzRzPY+chGaspbqGGEjXiO9wGt8Br9kHvh
         Qjm8FLviZL6LF6C7KwBpkENpQ5fE3LQsfFGRQhwxopSmSAG1JdQbTpOnWw6Ua55EL8H4
         qgHg78EA9Za7xR9yH7Qn5Eyi+cyHLsn3BgCIcfphZas4Hbmi/yzmyGIruEs+wpeH6nao
         msZw5YgWP2rNm59ZehLotTLVcV1L0DdDF9/zG5q1BhNXMS7lZnpbWIfyT90AuFr0q3jj
         9khVbSSe32ksN8DRHGL83QZC8EYXVuZ1RZXsnqaBJuy6jE63ko1Lienb1pqbW68Yk07P
         zoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783542193; x=1784146993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xGPWKT+T/Sc4FxhkqkRyahjTyPdMRSTRlzX+JKb5mbQ=;
        b=SS/HpJ2j92WHre3LHZoXNEndGZq8+NDVvPgaU6v3Jy2MAxk+dHE3lsJmPtcdHWtPFd
         1SFmRh2cEQ37aW22/rFrM5lVU1eLmt0a6YaQ0KZ8q9dtxX7dgRIn6m63LR4Df94eEFQ6
         Ge4vhE0V+AUZdYz5/vcby0eMZbgD5fi9F0erukNKfaimzCjxAkKdsTQNdRuT6U43tGW7
         CPmcWLQUdQpjb5g/weN98hYMxvyNXC4XN1tb7wuhZ7uwgQ4XXgaHjKpMap5eNpOT30Ai
         unDwyVz+pJ5lHaCs0J0V0L33xyJ7PJxJg8EcVlidRHmxHZJHrMG4bsgBT0SubqUUlNEr
         msPg==
X-Forwarded-Encrypted: i=1; AHgh+RogbwSxm096SoyaWdRL4swq28NCMr4wXQ9xM/QFJwEfYuNt2QrfUTyPSXOK2zm3Z3bTUAc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1BOrih1fYZHYI5DZQRZwYOIMCDLPdK7ROlpU5F1pei1SuWGYD
	UmaGf4Bcrpn4KEwUd2LGjwMwASQeSkXw9AiBF3+lZkO2TmhMUGZS9Pup
X-Gm-Gg: AfdE7cl8d6FClFEG/4nXOenBBpBRQtd0j9U/xy+r0aPSJoxbfuOMw1yEzguvLf7vl3B
	JIvPvGk4UiosRpurrnr/o8fUae2issX0HvwR4Qa8zeNuFjOHZbZPIaJ8DHkPRrszP8P3MkgzCxA
	V5MVS2h3GKDBuvQsWLqV8Kw2yXBRvz+tZb+gXtMJnf4pC3LNIeoEoh8J6xzQW+hOXfL2MtHC8oG
	mk0ZtKbjhy2HymK2K1L+4IhzxORNEdB4QPV86uFvWrIQjrb14QxVZjmcM7EbjGGX0JTh2Wulz4x
	AQcMBgq40m4jXHlEo+1nHO71XyeYgHevbN/zt7C4ryk97BlVGRUkuQHC9MJRb8MucJFO9mv5aAp
	6EOEAM6Yn8g3skk42diGXJXg4uqS9sy2z9GLn1EZDDeLlcImuM5F0E3ssso7H1jp+Mu36bYwCBb
	3b1EWWduvspbi1bk/jlvxZEUX8KIAd28aAieoDWxrz6zGcjkMXQw==
X-Received: by 2002:a05:600c:528e:b0:492:4363:e7eb with SMTP id 5b1f17b1804b1-493e68f03damr41743525e9.32.1783542193163;
        Wed, 08 Jul 2026 13:23:13 -0700 (PDT)
Received: from osama.. ([2a02:908:1b8:2060:2b86:7192:b44e:9f03])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a5d174sm101663785e9.2.2026.07.08.13.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 13:23:12 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] drm/imx: check parallel-display drm_bridge_attach
Date: Wed,  8 Jul 2026 22:23:09 +0200
Message-ID: <20260708202310.12971-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706142732.49397-1-osama.abdelkader@gmail.com>
References: <20260706142732.49397-1-osama.abdelkader@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx_pd_bind() ignored the return value of drm_bridge_attach(), so a
failed attach could still proceed to drm_bridge_connector_init().

Check the return value, as imx-ldb and dw_hdmi-imx already do.

Fixes: f94b9707a1c9 ("drm/imx: parallel-display: switch to imx_legacy_bridge / drm_bridge_connector")
Cc: stable@vger.kernel.org
Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
v2:
- add Fixes and Cc tags
---
 drivers/gpu/drm/imx/ipuv3/parallel-display.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
index eb75827394f8..fd48845877cc 100644
--- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
+++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
@@ -210,7 +210,9 @@ static int imx_pd_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret)
+		return ret;
 
 	connector = drm_bridge_connector_init(drm, encoder);
 	if (IS_ERR(connector))
-- 
2.43.0

