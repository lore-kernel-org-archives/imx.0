Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F6137206E
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 14:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783346594; cv=none; b=OTdzel5N7i+wN/02wNQMIuT96pyUh86SGgEoLIznIV2tQLWexIZI+jx7OnsrAk/tKusd6K+C+6iCr6EAggI1ufyyiYDjq3zeBXa4LIE+0Ht3SLJZ0O4TXsKXJ3cAFHQ79Eu9BLDFjuQoXeJNaCMirLxN1+89WgXldsVhcbvw+NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783346594; c=relaxed/simple;
	bh=/jN0mnvA+PYxUB2KjXa3lK7Id7dWIBprChLYQI80lII=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UyextoI5vDW/WeCy/gV5UyMZUGIVD/v9I8n9Bg2xlKdY2dyUiP7no+QD3P0CO7KMdj+bqA3he1VdcY3L7SH/9F/CZXgjKepwDgK9i+JIoSzRGw+vl+4OPS+eFJEYmEdyM1i+tTEoAO7zIPcLHAnnvKgozIOVSw2xChK8eBitOss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YyFCnc+A; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YyFCnc+A"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso1895006f8f.2
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 07:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783346592; x=1783951392; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hr836mBCBDsLn0BsEM+M6uBiXoTgU1y1CRSCGWjay3o=;
        b=YyFCnc+AdtuQqVlGJOYT7zcWMP5N1V88W85NdASDsYsVYU5OlEJOw6GOUp6ElRuNQu
         Md8ZOF9FELZcppLOxGMpb+Ap0il+YYzro0KXtCa9dTiuHIlPGfMuwdqNwK8IXpEOTeb5
         oJUecbpaiksmTDFj8JJxZ/nSgbLM89VsNK6NquvCouPysXFEl5EducbpkrgacG2ro99K
         r1ZXnNmzLF7yONwcQafGjuBrQJ68Bvoi4iA6i9rjrpLJ1+TTbXbRnlzQVR+w4gW61ou8
         NmOovpsbSU+aB+M/8yHRTXdsmgrPxXa/713RsHW9vNb7QBaTOnqWrvmilXiEcBDDKcAt
         QVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346592; x=1783951392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hr836mBCBDsLn0BsEM+M6uBiXoTgU1y1CRSCGWjay3o=;
        b=Q5cXbpeo9LUVeHWquRsTMxkHa9DC6GbWklKZSKV7DNU7pn8008XVKVMoFjBiy/FKH0
         LGB1yWiaVjeqJufvR6xdEw/ZVa3mL0zCHeIOcRnuO6U4uBdXgnVdIYV+HIhRy29KTEle
         gLTiv9QyEMImZdbDYdOwEHyIM50XyCgPXyR93S6rvfe9H5Z9t72YFNg8qR+qbckRyqXh
         fhDDdibWtseI+tkoWnszu2OpbxvVE0G8zV2uOlO6Ze3fBrfV9OZ4D7rf+9lephIy2BCR
         E5lFh9mgblTgXhOy76T2vNOp8CTwvWEr9PjHY9dnwX5SY3w6A5k6qkuLEoBfhtXn+Ar1
         5N7A==
X-Forwarded-Encrypted: i=1; AHgh+RoEQhqixxG10+5BYq4GGcEzZZv/bSTykq8UfuzTcDUktTvFW5M8aIwhxt5erWz/aNgJJsA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzLD+FLoCKHDbwdM+RY0AFuwd3Q2QnHSsHIMJSws2QjojkgPvC6
	De2yuUw2k1vZ/yakz+fgEqUcLtno+kbma/T2cq0tagkXwwSudq6Z5o9K
X-Gm-Gg: AfdE7ckhbIDqgjpSCzRDG+0ZPubn++WsWRXsJfqNa5iJbxStgrQ9GLwvN07RgV5LiMa
	bJvlYMj42xi5rEe4ImMvK+s0biTDb7c4I2bIH9XT19+CIL1ZtovwXUS2VD7FylWReNOFxPoDcNh
	AxZaQdE9agMGW6rls6IAPXDh3zqL9cFUAebXel3/AdC4TtmfM3CX0ISBRA/4UyBAZ2ucsRWf6Xn
	EUUJ8TFyFvIhV+8Q8C9JU4Ttat20AFX5azSj6XtFSNQTf9efWDWfhBIBbRFPtFsxWDWNp1/ZU79
	gQhmgup1Xb73eH7KguxtGyo0kMzPUOn/3qXymA7PLkV43p80E3nKt/EeBwfLaehbL1hmzymzLnS
	cu52G9VdLP7oyYO9ZvQ6FaS0IAejx5+jLmwqRkI+eli+InFzQ4+VosiWJPLDBLdf1WpRV7KI6jf
	Sx+PLXrhh4eHcKo98imvIVfrFnv0qX4f15n4ii/5EA1Tb4ct8wPonXjHTtuqE=
X-Received: by 2002:a05:6000:4612:b0:474:4525:eb32 with SMTP id ffacd0b85a97d-47de668eb7dmr436784f8f.11.1783346591380;
        Mon, 06 Jul 2026 07:03:11 -0700 (PDT)
Received: from osama.. ([2a02:908:1b8:2060:bfda:c630:e88a:7a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d7801sm25653740f8f.16.2026.07.06.07.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:03:10 -0700 (PDT)
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
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] drm/imx: Fix ipu_plane_duplicate_state() OOM handling
Date: Mon,  6 Jul 2026 16:02:45 +0200
Message-ID: <20260706140246.41506-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If kmalloc fails, with state == NULL &state->base dereference NULL
Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index c7ec09e557c1..67f2da7f2b65 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
@@ -323,9 +323,10 @@ ipu_plane_duplicate_state(struct drm_plane *plane)
 		return NULL;
 
 	state = kmalloc_obj(*state);
-	if (state)
-		__drm_atomic_helper_plane_duplicate_state(plane, &state->base);
+	if (!state)
+		return NULL;
 
+	__drm_atomic_helper_plane_duplicate_state(plane, &state->base);
 	return &state->base;
 }
 
-- 
2.43.0

