Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05D63750C9
	for <imx@lists.linux.dev>; Tue,  7 Jul 2026 15:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783436721; cv=none; b=e+B0t9vGsdRQSnfLY9DtsXiRhccdXCoFrQBdoWYQdMua7WQ7ig5Q2OuaM4gck8lnCmK0MvT1NYN+zQQ76zccY0AqvAriuUXkYfGzW1TayRbxcV14lFVq2bIofGB6AiNZEFO7ykAhfIIn3fBFp07oeYCb7gVT1DhRDe8IaSE9+xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783436721; c=relaxed/simple;
	bh=wCwdT+MCVwlDfg5F3ZYmVPpwSAOE6JBBtrXsacrrEBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TRGl7KUKtJ0FHdTn7uXG/7r6lX2V5e7TgVjeow9ZVId2tyZKSFeuf8/5Vb8D8+GT+RKIkxpSKH+PQbd0H/kLVnldBWX8tVwIa07g7sNS3iwRfoc6G3uTZsL/gFjNsO9iZ9yp2TcwwE1jYbe/sVggyPqXdNEU9ono7DqYOzGth4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VblNaNmX; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VblNaNmX"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cace91f112so37422545ad.0
        for <imx@lists.linux.dev>; Tue, 07 Jul 2026 08:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783436717; x=1784041517; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JGVhoJBTQ+C/shIBMcaZxxiUzHSDCbdKbDb/tDZozNo=;
        b=VblNaNmXUz0xZqrYfSOFc06+QI6DkgNsKuW0vf3/1zo/N5pZ3mRz4I9XKUQeQWEoMB
         c6AifEJRch+y9CpPHmrMuNJfNbibBNZuSYP6B+7OTo6XN9oJH8750bAVUyT3NC27Jvba
         /FTyTv2McV/zdAoHtJMOaHa6Ddl9G2LysP+CM0081NQy/mw1tFoBNWeQpr9fKfDH1Nd2
         sktenP0SczPoFtSll9haltsP7NISIhYHpteRk5iGfqLKn9kuUFoiTmpg8I8r+8NLzJmU
         9e/hgfBaeRJqo/AuZUuUHXKrhayXz92xYfwTdkunav6W9RZvPCTnKokIy7ponb2svRHK
         OZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783436717; x=1784041517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JGVhoJBTQ+C/shIBMcaZxxiUzHSDCbdKbDb/tDZozNo=;
        b=K448PAPO1O74McSFT0fhLRoRMBHvZq9x35oeW2Hd08EOI+1kHReiNt4Wa2Jn+tzHQF
         d1AIkju1DgV/MQsQ6mG02vyg+ZLHsHRdPasoS5Vtxt9U8aSb3rPwBmpkPXZtEAmk1QgH
         oWLpUIP/V32qpjW8h1I7f19R0F9HGTJ9+NGlrDmNa6M0rH8zBVnho0cMey2V2+g4At/g
         F9QbdGBhQEMIm3fPeKlJj+MBp6JjCNr+zVzSe/xH1MjAsFl+I8yIeY8IR6rBycoLQjpi
         pH6y8S7wYGD+a9Sg4zEvAlEOGWkraOhdO05G1F46N4ss1F9lCr4IrKv3soIeatD6vKO8
         c/8w==
X-Forwarded-Encrypted: i=1; AHgh+Rqh9aiH18ebFF5Xebe+5VHnLsuGGAMYcbrElfQ7ZetLMVE5uT4n2RdT4vqJCtqVSvlSJyU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyl5OhuzE6k6dNeGAPtdfz/cG8tYtFs/Q+QNIFTCBlIEUslSFi/
	S3KgghphTICoo0SRoZlddl6oZp7YepzvR52LU+dfnqDOQuvBCzs9VBK2
X-Gm-Gg: AfdE7clAX9L3XOk6Ae4zCqEuZcPGPc8zP/YIzbDOLMy34kXohrnUX7SubSiFGHZw7+y
	YdRnpBpycsKM7D/hNGU5/WbEL4gkMOXLbqxrzzRrrBUrAB9qznwSRHAJVxd1KgBjapH7vvxKJfm
	ZGjem7ces9NluwRiUZ5VEqPDxSt+gcQ4gPREyt8xXN4SOftKom6M5wnIiwQTIqBSNtZ1XouXQvS
	eNQxo90/ekS4YuGysL6KQoI+k55SjqJaATNPSQSdnvc6vQd0glQzLkBLES6xXgzDZTA2CBQht0U
	OL4Tv4n9OID7D7QEsFNJSNsZ2FFjNgAYU6+XbAzgl0pM30RdTQiXRNQKromT0+tXfTTej+WeNcO
	dwnrGc4OkQomEvTN3W4AitEtCjL+Fq0ODV0GHU+3pLGEPHq0VjF3mgDlpJEidRxIAWYDKDd2m8f
	9MWn1uidn89u/u840a555FoiDOGO/ulOHzmm8l861BS0c=
X-Received: by 2002:a17:902:ef44:b0:2c9:cf62:6f61 with SMTP id d9443c01a7336-2ccbe616252mr55602255ad.17.1783436715990;
        Tue, 07 Jul 2026 08:05:15 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:239e:a31b:1d0d:374f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bc42sm13598865ad.63.2026.07.07.08.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 08:05:15 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] drm/imx/ipuv3: Check CRTC state before freeing
Date: Tue,  7 Jul 2026 23:05:08 +0800
Message-ID: <20260707150508.2267884-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx_drm_crtc_reset() destroys the current CRTC state only when
crtc->state is non-NULL, but it always converts crtc->state to
struct imx_crtc_state and passes the result to kfree().

When reset is called without an existing state, container_of(NULL, ...)
does not produce NULL. Keep the imx state free in the same crtc->state
guard as the helper state destruction.

This issue was found by a static analysis checker and confirmed by
manual source review.

Fixes: 8ed5dcf966dd ("drm/imx: Use __drm_atomic_helper_crtc_reset")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
index 1405e50ee56b5..e4f0c91dc7610 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
@@ -111,10 +111,10 @@ static void imx_drm_crtc_reset(struct drm_crtc *crtc)
 {
 	struct imx_crtc_state *state;
 
-	if (crtc->state)
+	if (crtc->state) {
 		__drm_atomic_helper_crtc_destroy_state(crtc->state);
-
-	kfree(to_imx_crtc_state(crtc->state));
+		kfree(to_imx_crtc_state(crtc->state));
+	}
 	crtc->state = NULL;
 
 	state = kzalloc_obj(*state);
-- 
2.51.0

