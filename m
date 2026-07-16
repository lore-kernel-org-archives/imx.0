Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E799D3F54BE
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 09:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192594; cv=none; b=JprndjWk/Srb9L0J0pQ0kjTMk13jrtIufUUuL70crjk2PL1Oupo6wH5z0yqXHw0j4BiDOy/I8Zhbw/rTzknAn9ygNfnReYKNl0ao7BkWEubvTi9YZ+fNlFIPGuP0vWjzA6UAWK/61Da7KosuuiJKbOqRVciJAUrmE6iyzFx3pPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192594; c=relaxed/simple;
	bh=rgxLNMtjqM2teYTKXy4V5myTjAOMrw9ADBn88PQUgl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sHNXM8UWNAKiwkPCWB53odQfs4LW3bESTfFf5LY/p78j7vu6gr2vQo3Hh9nPWGAQJ2pBmpV08XDeGQJ7c8A0lzudpYx6On0XmuU6msRO/MNiV96eZ94vfvRV+6O//E7LWkWzVoRpA1FmDKwABjdlBBnfI19h74mG+nIavy0di70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O9/7xKQf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qdq4ploP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O9/7xKQf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qdq4ploP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7DU2g1994824
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 09:03:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3tiM2Xo9zA0AwLl933KbtXA0+pjiqMOmFkNsBFhqzo8=; b=O9/7xKQfaUdPOLcf
	47Wc9WqOJhDcpZvw6ig8VgPVsE02760Kn1LAnh+w7W5tbwEELiqdLkw41ky4ReK9
	+uPEd0WSzdJqM15s6LaHy27C86zf4WgmqlM9+t+trH8TYGHkUcXZ7hOKUZ29Z7QH
	uKAO5Wsxn/5mz9Sz9cotDVDKJT55oLN9N43wbKPH0QU4LdtdNRhLhHULxOdWBquE
	l57XJ4pJpFkq/Mpob8bIz2vfeD9qfkQIJOQVU/g3uYx5LuTcgwIdRCYO2q9a9M/c
	ugxJveHf6VpSJutCvcgMNTumSBTld04Nb4W5naMOVwDZh6VEw64auKdmcxvhpUuD
	k809pg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feefqjwk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 09:03:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cce02cb769so39805195ad.1
        for <imx@lists.linux.dev>; Thu, 16 Jul 2026 02:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784192583; x=1784797383; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3tiM2Xo9zA0AwLl933KbtXA0+pjiqMOmFkNsBFhqzo8=;
        b=Qdq4ploPHIm9iqvHjzDijol4QAXopWhgXshGFmWas2tIe8rY+b7+zn7eBwDbVLrovt
         BrFGxXpCsRw1w1YEJcmFqCCpWACLhHhCCPsN/mrmMBGvFcpPjRozhZGJiTteqecGTOVU
         y6iee+Ew5Sfkrw25lP92t8EwKa+RreE5DVSFWWDM4L6k+jNKoqUGrS7H8uRtdLN21zLm
         9OEuBBewTvmGxO8IS6OFAy7W4BJ6oWLIQQSVoVgVheRkdYc8guZtvcTG3VLQ3vG/WGGN
         96UOoiGQzcbe3ziSUrpYSwRGMPt44wuArr/ZSM7XfLd8yaLktuMzWifLCNfCmRjCup/R
         ulng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192583; x=1784797383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3tiM2Xo9zA0AwLl933KbtXA0+pjiqMOmFkNsBFhqzo8=;
        b=i+S0A0MbloqpRywZAfimevaWAUByTXgiWuUaABc44xyfbhkYdtdzGNnwzFG+LwrY9z
         GgssNvd7aaG4Jl4z5AHT/x3j+InswSsgnflNcgmAAW7Ofn9+BfErNecrGZ1X3w1QQ1kb
         24Cp62D6z1XteAwzxt82liMjoFBFRVeOFb1RhfsKk9P68eL9YYeUcbbnDK6KqfzI5mq6
         EXinOCKtxTyxJR8txgcF6mw+mKDeR7B2N2T//dY+hpWsfcf5+e5Cq6bp+KcWjC8elAKo
         TJg7U0oZTbYJiCkhG9UlsGzFDkV6ghYieVfmkOubUSmiJawqwdE7HjTCbRXDEvUNzcGI
         LI0g==
X-Forwarded-Encrypted: i=1; AHgh+RrjmQgXPBVuSfA4J47cGVD9Ik5P70a3GjevXwCEUejQn7zPeuT0b39SsN3C5my8hHhfqgo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxK50HOEADo6yRb0DNj/XgvxLEDW0P9RtpcFy/C81OQRFSEeqPI
	6PfiFj1k7NVZfr/cA69NbBZQ92PNBmoQLZDV9gxOwWdxwcvdi6freL8QnDnonKZZy5hHnqyHmF8
	FaOuAUnFlFdmDL/qN5PRRFNPGTsvSC5JZ85AyWL4nqr59LsVoTxxsK3A=
X-Gm-Gg: AfdE7cmD3NrOCoyOVcAiM71mK5LLJyNOVhWuLyl+OwLBZqf1XqQklWthzkjZSEsk/yq
	OkfsCc0Y53TMIdYW/9+C5PjG3acaKp9QfqrqzKyQfN+ciIp1aHIKQJf57k5c7IAVnNoXRFxOHkQ
	xmFcYXcaSj0+CkJLWd7yzYWzAZWWoRvPGUPehTcUCg4uqc15KM/3UOG61T7ztJ10zdax9fscZsf
	spfOy1PNEj8yYJYIKbz7n3jnTnXD7BZiKjKG4ackCj9cI7udUE3Lr5k4qprqu8QjAsr7RlxZ6SF
	J3OmLrr+ZQ77I8+Lsv1wkNzFitlrB+AKrEvs4TuIZv5e1OXW25oBlqzKF5lkA8n+7NFy7Q+us1O
	7b3NGRBsNglw0IyaqGvys
X-Received: by 2002:a17:902:f607:b0:2cc:ed57:c7c with SMTP id d9443c01a7336-2ce9f02700cmr212712175ad.32.1784192582511;
        Thu, 16 Jul 2026 02:03:02 -0700 (PDT)
X-Received: by 2002:a17:902:f607:b0:2cc:ed57:c7c with SMTP id d9443c01a7336-2ce9f02700cmr212711795ad.32.1784192582033;
        Thu, 16 Jul 2026 02:03:02 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf106b271asm16592555ad.64.2026.07.16.02.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:03:01 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 17:01:54 +0800
Subject: [PATCH v2 2/8] drm/aspeed: replace struct drm_simple_display_pipe
 with regular atomic helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-drm-simple-kms-removal-v2-2-1133a8fc3785@oss.qualcomm.com>
References: <20260716-drm-simple-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com>
In-Reply-To: <20260716-drm-simple-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com>
To: Alexey Brodkin <abrodkin@synopsys.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        Alex Lanzano <lanzano.alex@gmail.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, xen-devel@lists.xenproject.org,
        Ze Huang <ze.huang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784192559; l=12008;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=rgxLNMtjqM2teYTKXy4V5myTjAOMrw9ADBn88PQUgl0=;
 b=ao1ZOxz4FyLpOnjIgILtb38iIdAixsALUtxQDG2VQUbz8T8Og34pyHoZwIWje5N1T6AYfjR5S
 qn1GtR7rJPWCqaq+yohY4PFirxldOeXdvRZrYuYSVbXv6647oU82tUe
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Authority-Analysis: v=2.4 cv=APNfGQ4N c=1 sm=1 tr=0 ts=6a589e48 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=DqWk4Bt2HhJbFETiZXkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfX8w9aELqUzEwk
 VJI/H0vEwES5OOQP5I83jmsw4sWfpEbM26eZNQxMMLs8jxxyVU0ynylx2SPktQ0r6FXNoFbVq7c
 KqfwZ5ycOmQJ6vkA5tWjUxe6zoIz530=
X-Proofpoint-ORIG-GUID: Kkm34NM4shFZ1wj6hwS5a3rDvFmnowrt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfX8Ga420n2Ylb/
 vQuyCTypzuetloLSpEC/dHgeZYsB4gIK1pzk94k7XxBER+AnczyPVeKrvXEiGGSQQmlJ1ZNKQXG
 EylbZ652zohMKRI2vhqDQDLVr71edmzN00itwZrKsE+KEOFmwNK0qrK+yM7KAz2JQRJpdCKcTdp
 bNplpc8d3zZK/hHZmZR+Fd8RoDFIZJlJEwYuDvTRkABnlCze3LTRFcOAalY8bxvqrsPTMyny/0y
 MMkhrGtxcXf+r7qGYJK65v8svtTGjYrAESzM5lhgk1/azhAdmjvPPD7kMukKuiLII8dRhlAyYJb
 f8+r+bRRyl9BO1SO88d/PnnHaaZVHke77HsHPNVi6igp12Sz2EPT5W5Ra9GX2bz3eifuQZDGVOU
 lhw16rRL1VUS2iiACIYpJ/3dTmvbunj+pCoSFZ3NUfmjqOE5A+wk7aF4AHoQkP5dhfyWT4rOHEp
 rHDw+EgjNCw455u6f9g==
X-Proofpoint-GUID: Kkm34NM4shFZ1wj6hwS5a3rDvFmnowrt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160091

Replace simple display pipe with explicit plane, CRTC and encoder
objects. Move callbacks to plane and CRTC helpers, with vblank handling
through drm_crtc_funcs.

Move page-flip event handling out of the plane update path and into the
CRTC atomic flush path.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/aspeed/aspeed_gfx.h      |  11 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 187 ++++++++++++++++++++++---------
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  |   3 +-
 3 files changed, 145 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx.h b/drivers/gpu/drm/aspeed/aspeed_gfx.h
index 4e6a442c3886..61588f4273a0 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx.h
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx.h
@@ -2,7 +2,6 @@
 /* Copyright 2018 IBM Corporation */
 
 #include <drm/drm_device.h>
-#include <drm/drm_simple_kms_helper.h>
 
 struct aspeed_gfx {
 	struct drm_device		drm;
@@ -17,10 +16,16 @@ struct aspeed_gfx {
 	u32				throd_val;
 	u32				scan_line_max;
 
-	struct drm_simple_display_pipe	pipe;
+	struct drm_plane		plane;
+	struct drm_crtc			crtc;
+	struct drm_encoder		encoder;
 	struct drm_connector		connector;
 };
-#define to_aspeed_gfx(x) container_of(x, struct aspeed_gfx, drm)
+
+static struct aspeed_gfx *to_aspeed_gfx(struct drm_device *drm)
+{
+	return container_of(drm, struct aspeed_gfx, drm);
+}
 
 int aspeed_gfx_create_pipe(struct drm_device *drm);
 int aspeed_gfx_create_output(struct drm_device *drm);
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
index 7877a57b8e26..5946af36cc69 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
@@ -5,6 +5,8 @@
 #include <linux/reset.h>
 #include <linux/regmap.h>
 
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
@@ -12,22 +14,15 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_panel.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 
 #include "aspeed_gfx.h"
 
-static struct aspeed_gfx *
-drm_pipe_to_aspeed_gfx(struct drm_simple_display_pipe *pipe)
-{
-	return container_of(pipe, struct aspeed_gfx, pipe);
-}
-
 static int aspeed_gfx_set_pixel_fmt(struct aspeed_gfx *priv, u32 *bpp)
 {
-	struct drm_crtc *crtc = &priv->pipe.crtc;
+	struct drm_crtc *crtc = &priv->crtc;
 	struct drm_device *drm = crtc->dev;
-	const u32 format = crtc->primary->state->fb->format->format;
+	const u32 format = priv->plane.state->fb->format->format;
 	u32 ctrl1;
 
 	ctrl1 = readl(priv->base + CRT_CTRL1);
@@ -79,7 +74,7 @@ static void aspeed_gfx_disable_controller(struct aspeed_gfx *priv)
 
 static void aspeed_gfx_crtc_mode_set_nofb(struct aspeed_gfx *priv)
 {
-	struct drm_display_mode *m = &priv->pipe.crtc.state->adjusted_mode;
+	struct drm_display_mode *m = &priv->crtc.state->adjusted_mode;
 	u32 ctrl1, d_offset, t_count, bpp;
 	int err;
 
@@ -139,48 +134,33 @@ static void aspeed_gfx_crtc_mode_set_nofb(struct aspeed_gfx *priv)
 	writel(priv->throd_val, priv->base + CRT_THROD);
 }
 
-static void aspeed_gfx_pipe_enable(struct drm_simple_display_pipe *pipe,
-			      struct drm_crtc_state *crtc_state,
-			      struct drm_plane_state *plane_state)
+static void aspeed_gfx_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+						 struct drm_atomic_commit *commit)
 {
-	struct aspeed_gfx *priv = drm_pipe_to_aspeed_gfx(pipe);
-	struct drm_crtc *crtc = &pipe->crtc;
+	struct aspeed_gfx *priv = to_aspeed_gfx(crtc->dev);
 
 	aspeed_gfx_crtc_mode_set_nofb(priv);
 	aspeed_gfx_enable_controller(priv);
 	drm_crtc_vblank_on(crtc);
 }
 
-static void aspeed_gfx_pipe_disable(struct drm_simple_display_pipe *pipe)
+static void aspeed_gfx_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+						  struct drm_atomic_commit *commit)
 {
-	struct aspeed_gfx *priv = drm_pipe_to_aspeed_gfx(pipe);
-	struct drm_crtc *crtc = &pipe->crtc;
+	struct aspeed_gfx *priv = to_aspeed_gfx(crtc->dev);
 
 	drm_crtc_vblank_off(crtc);
 	aspeed_gfx_disable_controller(priv);
 }
 
-static void aspeed_gfx_pipe_update(struct drm_simple_display_pipe *pipe,
-				   struct drm_plane_state *plane_state)
+static void aspeed_gfx_plane_helper_atomic_update(struct drm_plane *plane,
+						  struct drm_atomic_commit *commit)
 {
-	struct aspeed_gfx *priv = drm_pipe_to_aspeed_gfx(pipe);
-	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_framebuffer *fb = pipe->plane.state->fb;
-	struct drm_pending_vblank_event *event;
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(commit, plane);
+	struct aspeed_gfx *priv = to_aspeed_gfx(plane->dev);
+	struct drm_framebuffer *fb = new_plane_state->fb;
 	struct drm_gem_dma_object *gem;
 
-	spin_lock_irq(&crtc->dev->event_lock);
-	event = crtc->state->event;
-	if (event) {
-		crtc->state->event = NULL;
-
-		if (drm_crtc_vblank_get(crtc) == 0)
-			drm_crtc_arm_vblank_event(crtc, event);
-		else
-			drm_crtc_send_vblank_event(crtc, event);
-	}
-	spin_unlock_irq(&crtc->dev->event_lock);
-
 	if (!fb)
 		return;
 
@@ -190,9 +170,9 @@ static void aspeed_gfx_pipe_update(struct drm_simple_display_pipe *pipe,
 	writel(gem->dma_addr, priv->base + CRT_ADDR);
 }
 
-static int aspeed_gfx_enable_vblank(struct drm_simple_display_pipe *pipe)
+static int aspeed_gfx_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct aspeed_gfx *priv = drm_pipe_to_aspeed_gfx(pipe);
+	struct aspeed_gfx *priv = to_aspeed_gfx(crtc->dev);
 	u32 reg = readl(priv->base + CRT_CTRL1);
 
 	/* Clear pending VBLANK IRQ */
@@ -204,9 +184,9 @@ static int aspeed_gfx_enable_vblank(struct drm_simple_display_pipe *pipe)
 	return 0;
 }
 
-static void aspeed_gfx_disable_vblank(struct drm_simple_display_pipe *pipe)
+static void aspeed_gfx_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct aspeed_gfx *priv = drm_pipe_to_aspeed_gfx(pipe);
+	struct aspeed_gfx *priv = to_aspeed_gfx(crtc->dev);
 	u32 reg = readl(priv->base + CRT_CTRL1);
 
 	reg &= ~CRT_CTRL_VERTICAL_INTR_EN;
@@ -216,12 +196,91 @@ static void aspeed_gfx_disable_vblank(struct drm_simple_display_pipe *pipe)
 	writel(reg | CRT_CTRL_VERTICAL_INTR_STS, priv->base + CRT_CTRL1);
 }
 
-static const struct drm_simple_display_pipe_funcs aspeed_gfx_funcs = {
-	.enable		= aspeed_gfx_pipe_enable,
-	.disable	= aspeed_gfx_pipe_disable,
-	.update		= aspeed_gfx_pipe_update,
-	.enable_vblank	= aspeed_gfx_enable_vblank,
-	.disable_vblank	= aspeed_gfx_disable_vblank,
+static int aspeed_gfx_plane_helper_atomic_check(struct drm_plane *plane,
+						struct drm_atomic_commit *commit)
+{
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(commit, plane);
+	struct drm_crtc *crtc = plane_state->crtc;
+	struct drm_crtc_state *crtc_state = NULL;
+
+	if (crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(commit, crtc);
+
+	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   false, false);
+}
+
+static const struct drm_plane_helper_funcs aspeed_gfx_plane_helper_funcs = {
+	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
+	.atomic_check	= aspeed_gfx_plane_helper_atomic_check,
+	.atomic_update	= aspeed_gfx_plane_helper_atomic_update,
+};
+
+static const struct drm_plane_funcs aspeed_gfx_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= drm_plane_cleanup,
+	.reset			= drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+};
+
+static int aspeed_gfx_crtc_helper_atomic_check(struct drm_crtc *crtc,
+					       struct drm_atomic_commit *commit)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(commit, crtc);
+	int ret;
+
+	if (crtc_state->enable) {
+		ret = drm_atomic_helper_check_crtc_primary_plane(crtc_state);
+		if (ret)
+			return ret;
+	}
+
+	return drm_atomic_add_affected_planes(commit, crtc);
+}
+
+static void aspeed_gfx_crtc_helper_atomic_flush(struct drm_crtc *crtc,
+						struct drm_atomic_commit *commit)
+{
+	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(commit, crtc);
+	struct drm_pending_vblank_event *event = new_crtc_state->event;
+
+	if (!event)
+		return;
+
+	new_crtc_state->event = NULL;
+
+	spin_lock_irq(&crtc->dev->event_lock);
+	if (drm_crtc_vblank_get(crtc) == 0)
+		drm_crtc_arm_vblank_event(crtc, event);
+	else
+		drm_crtc_send_vblank_event(crtc, event);
+	spin_unlock_irq(&crtc->dev->event_lock);
+}
+
+static const struct drm_crtc_helper_funcs aspeed_gfx_crtc_helper_funcs = {
+	.atomic_check	= aspeed_gfx_crtc_helper_atomic_check,
+	.atomic_enable	= aspeed_gfx_crtc_helper_atomic_enable,
+	.atomic_disable	= aspeed_gfx_crtc_helper_atomic_disable,
+	.atomic_flush	= aspeed_gfx_crtc_helper_atomic_flush,
+};
+
+static const struct drm_crtc_funcs aspeed_gfx_crtc_funcs = {
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+	.enable_vblank		= aspeed_gfx_crtc_enable_vblank,
+	.disable_vblank		= aspeed_gfx_crtc_disable_vblank,
+};
+
+static const struct drm_encoder_funcs aspeed_gfx_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
 };
 
 static const uint32_t aspeed_gfx_formats[] = {
@@ -232,10 +291,36 @@ static const uint32_t aspeed_gfx_formats[] = {
 int aspeed_gfx_create_pipe(struct drm_device *drm)
 {
 	struct aspeed_gfx *priv = to_aspeed_gfx(drm);
+	struct drm_plane *plane = &priv->plane;
+	struct drm_crtc *crtc = &priv->crtc;
+	struct drm_encoder *encoder = &priv->encoder;
+	int ret;
+
+	ret = drm_universal_plane_init(drm, plane, 0,
+				       &aspeed_gfx_plane_funcs,
+				       aspeed_gfx_formats,
+				       ARRAY_SIZE(aspeed_gfx_formats),
+				       NULL,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+	drm_plane_helper_add(plane, &aspeed_gfx_plane_helper_funcs);
+
+	ret = drm_crtc_init_with_planes(drm, crtc, plane, NULL,
+					&aspeed_gfx_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+	drm_crtc_helper_add(crtc, &aspeed_gfx_crtc_helper_funcs);
+
+	ret = drm_encoder_init(drm, encoder, &aspeed_gfx_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	ret = drm_connector_attach_encoder(&priv->connector, encoder);
+	if (ret)
+		return ret;
 
-	return drm_simple_display_pipe_init(drm, &priv->pipe, &aspeed_gfx_funcs,
-					    aspeed_gfx_formats,
-					    ARRAY_SIZE(aspeed_gfx_formats),
-					    NULL,
-					    &priv->connector);
+	return 0;
 }
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index 46094cca2974..b2d805f0c16d 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -21,7 +21,6 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_module.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_drv.h>
 
@@ -130,7 +129,7 @@ static irqreturn_t aspeed_gfx_irq_handler(int irq, void *data)
 	reg = readl(priv->base + CRT_CTRL1);
 
 	if (reg & CRT_CTRL_VERTICAL_INTR_STS) {
-		drm_crtc_handle_vblank(&priv->pipe.crtc);
+		drm_crtc_handle_vblank(&priv->crtc);
 		writel(reg, priv->base + priv->int_clr_reg);
 		return IRQ_HANDLED;
 	}

-- 
2.43.0

