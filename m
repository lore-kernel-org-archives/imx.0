Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5414968E6
	for <imx@lists.linux.dev>; Wed, 22 Jul 2026 10:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784714859; cv=none; b=RJ1sXJVA1r2Czbqy3iaGoez0w3XyRD2315SnugBKuyYi+SwD+KJAqv3k/E+G3k8remlxzPOxRNJ1vbETJIPVCEWvb7nlNonGOieoiJSURe82bfFvgmFGnlkCONfkUi7cLZRt0CXWcOczdnmlvx5VECZ/qOFHiJQpH9b6J/Ws7bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784714859; c=relaxed/simple;
	bh=g7/eALbrieKWG+a53MxxDem/J0HE9S+G/F/iwhj41eQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CwFqieqsR/o6tTYKyvZnnUUMU5O4/aqdGnbJp1dUMM155YlxVcnjk+o0fCdL4+Dxpd1RWVDYp8fBfBocj7nmsWqtLd07BL6OJFywARUd06QcdtITp/V0AqBp6j3s6T5mY2vasFZOgRuBnDtil/fYGLDrj2GMRKB1EaDE7lKB/3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n2QYexdK; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n2QYexdK"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4956869750eso10705265e9.2
        for <imx@lists.linux.dev>; Wed, 22 Jul 2026 03:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784714856; x=1785319656; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3REs2qGjomqbxDR0NSQ8ilL5HrSoQvM8Tf4GumzfTic=;
        b=n2QYexdKELbslolMjZOauNUM4Q1cF9wEeBswC8mdpD8ZCTFgYyZInNWmA0hBYNEUyp
         qRjsETPlHTIC1eT1xgzaExQdgKZzpHwL/WhvOOapGMu7Sf2iD131qqEYO1fWncnLGeaH
         T/LONPCF67GBfaHTRNOJBjrl/D9GALmVWCWB0BmhAeaRfo+pNT3sXd7+S/uk5CIyXQ3Q
         rScABMlLKYKgexYkFkDyH7cOg1xAjrVFDAh6lVEIx/cjGV0goCTqGUH7TeCJ3m0FZvkZ
         si5g9WNfzWxSUQoDJuEFR+ClFT34TN8HdXGgsoBj276feZc6nGsscue+XKZ/CocyOaxi
         hJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784714856; x=1785319656;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3REs2qGjomqbxDR0NSQ8ilL5HrSoQvM8Tf4GumzfTic=;
        b=lPmqyV4mlX3/SwL2H4iAa2u2WJyUyJT27C9feZXvDF9Mqr2cpO0HuxM1L98RMJKil1
         caWOUoIgd4rbde5LR0rLh9NsYexj3mA8WgrR0dHqL8/bB5IepLba5MSAqs90AMi7LHhV
         vbX8+5YMLwfWvWXp1Zsg7tU23XLDVu9ERGLI10KfTWs1jPezaZ1VPA3xPwG9DiTIR9LI
         UehnHgPNd4WF4ZCvPasR2rrEwGW/nclWqBHjJE7Riqc7G3OjwWb4qR9OrbydNTlOm4tc
         lIXpp3z8qOs5jyKtdJUiM0SXBNkyYBVW8vFa4o5cxrrwNmG7X23XspwajmQNvP96q+kQ
         UGqw==
X-Forwarded-Encrypted: i=1; AHgh+RqDypzWSWaVt1PMs4zlIJ/xYFlEvtGXki7hNeMZ47cQC4eT6W55r6kYDbG7LORu2U4mIoo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyk2h3dus+++wLr1Nq8ivlAnGv5VgmTUYta8Ln05yxODqRRACdo
	aMv8Ww5xu8kOuheZks0Ju55D2FBV0ez9TYSH5MWXXhgyahygUwBl4tQ+KTB4vaxXsE0=
X-Gm-Gg: AR+sD13bXeCkICAHs0cWCKL4Gxj8xhQ4rosz9+ylcnReIBiZs0L1Yw17OvsFqwFAOgL
	5YF9w1n4moJG15++ErlhDgJoiHdUBxfFXGKLLrVDcIxuthq//A/pZOGoSz4Ls54fdU58fdsWqYV
	XRCzmgZGIT7oANtD0+TPTf41LRanGT6oIJq32ZrlsxYi8JgCH3DxG0y71DWFm2WbzJ+l2JGj38L
	zLzkS+a8vpi2Cvm9AfXbcC6bItT9rC5k28nVx2gAaKeEOlowqFnkdOiNfjJYVfe4wdr/k/IBAi2
	BA/LZCe+AXjpAfm4sFvano6RpELXzWT9lbzGoJ3TheE6xT5VkflwbA20BBMqKdG1qJ8aD6thm2h
	q19ShFvDgLjgrCoGldNbyIfZJ6iu93YUNgMGv51DMib1TS91QxQvP6lCJhORxjUDFbTko9dYDTq
	teLTfvs7FrJAZBrpxk7QyjrZE=
X-Received: by 2002:a05:600c:4585:b0:495:3eb2:b763 with SMTP id 5b1f17b1804b1-4954a50c51bmr246233625e9.21.1784714856416;
        Wed, 22 Jul 2026 03:07:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a4f25b6sm56086095e9.2.2026.07.22.03.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:07:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 22 Jul 2026 12:07:30 +0200
Subject: [PATCH] drm: fix missing header include for drm_panel_put()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-panel-fix-kms-panel-put-v1-1-ebde56446ee5@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGGWYGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyMj3YLEvNQc3bTMCt3s3GIor6C0RNfYItnA3NLE0CjNwlgJqLugKBW
 oCGxydCyEX1yalJWaXAIyTqm2FgBMJKMtewAAAA==
X-Change-ID: 20260722-panel-fix-kms-panel-put-38c079412f83
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Albert Esteve <aesteve@redhat.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1966;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=g7/eALbrieKWG+a53MxxDem/J0HE9S+G/F/iwhj41eQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqYJZnXQr6E0bZ+prdCer0OHkH30wy9EoEP5dhovRB
 +qgdEB+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCamCWZwAKCRB33NvayMhJ0e1OEA
 CcwEihOXsJfN3H92DygMrdNgASLoPt8ng4ShFdeyVmwcjH8KAOi3alcKUuGqlI/uYLI1vQkeuFDoYx
 np3ywKiZ6jvYrYwGnysbJ52twLrF7lLrnT8yISsZckIsN60fckNkkfIaJhufdLhGnUM+pdf6pGiofI
 vKy4+ZCidkkSLe4/YgWs6gIMWC6YAiKPH6BuwjZNv3UlCKG8XOOSp4+cUN6o8fnHZ2WVJ7vN6s0XMY
 Sf0a4Tg2IBuQxUMMGiNR/5Fi84os8S8gjs5x2b+xYGOO5m3HrpdGJaC2PRTxevHKW6R9CSEEHGKG8r
 1/INHJX3YzTuFVTM04IFizTk5WA2W3lOnsQhAq1Hh3yEV04VP91kO5mVBd0LBLkzRytLhoxyQG0HiX
 6u1+iqwpf+YGMlvoljOeDydqSqTMp6ATkk6da1Hl9EYEy/CeCU2ot2/bQQGq2xo0usQwxBST89AQen
 VqoZSjf4fMZHm+X7MHc8DgbOdPqag2vg5bfWaxEjL4oq/Wuj49t88YE5ugb1oEKdSz/TMd7uztn00p
 qWIzKj1vrbKRCTwspahUEKbqt8GsJtVIRCbq9Ct5r24qvpr4RjCT+puehfixjtrKyKul26i/UrUvzL
 LvXcG3SJjZYTaoj7YDfveJ1zPlTP4kvr33BPm0gtjqCv2B1rcPV9cMGO2t7w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Some DRM drivers lacked the drm_panel.h include to use drm_panel_put()
after the commit b71a623598d3 ("drm/panel: of_drm_find_panel() return a counted reference").

Fixes: b71a623598d3 ("drm/panel: of_drm_find_panel() return a counted reference")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/imx/dcss/dcss-kms.c | 1 +
 drivers/gpu/drm/mxsfb/mxsfb_drv.c   | 1 +
 drivers/gpu/drm/stm/ltdc.c          | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
index 01e0c10b6ea1..7c5a6e2bc89a 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
@@ -13,6 +13,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 7cb19c15bf39..8b4a500347fb 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -29,6 +29,7 @@
 #include <drm/drm_mode_config.h>
 #include <drm/drm_module.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index daf198edb42f..8818dcf98da7 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -34,6 +34,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>

---
base-commit: 0f065acf44aeb8c32691d88cc87004fd2e54e902
change-id: 20260722-panel-fix-kms-panel-put-38c079412f83

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

