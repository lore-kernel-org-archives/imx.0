Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961612C11F3
	for <imx@lists.linux.dev>; Sat,  4 Jul 2026 18:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783190018; cv=none; b=KxUTpr9RUNMwOUQbdH6877orYqyg1RvSsLwebjpY98guPomOQJCBzSCMOuI1r5hBMuLRd7cG6qSr0DRogEklCWAb2Go/vMzjMW2L1KrczdS59JJUA2lC6SyeLOVF/+Wifuu1LisDDa4xZl68Lfi0dSnuAY0Fn02HvQUNoeaQsxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783190018; c=relaxed/simple;
	bh=jES7nUSVZBQKhOgvari+mSaMEA9hK9OzE4xbZwzc1Wc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L/lxIp3UESYI6BQLXcNaKGni8TYc+fR3kjqlQfSc7AH3ErXo9hZN6l+OssLRbABDK+kVDSzdPEz916miJq5A5+go51LE6va4wDRqWEUAVCXJqfJ838u7KDgS2uw+jZ5WkQiA7N6CtBPPxmtP9D1G6hFNyKs7QE1F1bAVh0c9xdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ECvd+FOX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qu0+QSD4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ECvd+FOX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qu0+QSD4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664G8aME3292257
	for <imx@lists.linux.dev>; Sat, 4 Jul 2026 18:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IGXwZHbQah8WajNXtsa2tZqdRDir4hma/P5IIaHQ79g=; b=ECvd+FOX6m7m+uK6
	znPdHfToJCGz5vNdP6tV4GzW8+gWG/emNUZmGO/Rxywzfrha5unEY40pl2LXO59h
	7JXv5BMnvdyYquNsxkHqexO5Aqt/ozoQqMvQZkR6SmIcjSk/KX09cknpXg/SmD4y
	hP6befM9yAWltSsaHmCWvED4/fNXwWB77sN5NX05AUqZLG70NP16/tIDoYPnLcE2
	EH04DJfiCX6/0wgXIsEVPx0mePP3/mRq6UkdeWFfub4bU+t6MlFqgUKWB0nt0To0
	f3F3hcil7VXRNQY8Rzd+7aj/3W2ujxhjIQiNl0U335fTz9dmXSjkNMM560EDCcCr
	drpp9A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6uf817f1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sat, 04 Jul 2026 18:33:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-847a5f03ff9so2434583b3a.0
        for <imx@lists.linux.dev>; Sat, 04 Jul 2026 11:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783190015; x=1783794815; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IGXwZHbQah8WajNXtsa2tZqdRDir4hma/P5IIaHQ79g=;
        b=Qu0+QSD4wBoBb5tGKCsB0Tt9+UYOCVzzqS6L5Tbac51A9DiHe0m7vf+Bp9PSeD0sDb
         eB3dxuytLQqdYpF4PvjhVXUerAGN/llefoWN/laEhSYcUGC8sXDDxzAcgyvINjA5a0G6
         gkUdzEZ6t/QJYcwM1E/dG3GSeg16Q4ikaygfyYxtJTHG4ecOdSruR5+xUSrxfRih0z6t
         anT0vF34NaKl+ExnYKnw1Hchhul+TKSogK1UTH9yVQ8TJpXlOX3vU4htBIg4MNVaYg9q
         yGhvngQF8VvkiQ+y1JF4MlXmJUfC2t1pBI5JJhYD3umE7NwDZ3Rxh/5JOvqHSefvDeVe
         81BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783190015; x=1783794815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IGXwZHbQah8WajNXtsa2tZqdRDir4hma/P5IIaHQ79g=;
        b=AZiZJATW19ebDotOeDL7EdDoLAcAUxcbr+DvqCItkYWqXuJDgUohQZKkl0iw1rjTBe
         WQhspc1ITKjTCAMQL/w80k31T1LffzUgBdKompLwLClLI7O+t3+Cjc0VJcofm63ZrKEX
         gtnW/0pMyiVHO7v0+6F/JdM7N3PhNv2nDMZZOejm2D5XleCLsjtNUJMdn/jihltgVaao
         1vVypfyjr+688BQkjtmJMQ19jOaGoW3E89c4hwPYQeYbAe/aeX16uxmNLm2rk47m8NWi
         +S1EZ/kVL7mdrbewaT6nqRBrm8D8+vmgTC+PTj1+Ngn35R7+lzvhCXs8wr7vQuvsWruA
         +XOw==
X-Forwarded-Encrypted: i=1; AHgh+RqdUCM3GEd7rMCmyjVKzdElpodAPBLSLKK8h8Yg6YfIOdGBmEQME4+BP1dsBCZ0xvzX89M=@lists.linux.dev
X-Gm-Message-State: AOJu0YwH+oMRAcbZ1e4bNKNdRMiifMd1JnLgRJ2DkF9T1X6mO/9fgThU
	izzVOwz0TB0EX8dllFxiEaKcR00oa8yyEL6zJVr0MqhDGEb0RvD9qun5Go3cAYVb0jKCeF2pMLh
	rzwZBLLc1p8SJPzZC2DMnEO3kpKQyqc5HR8OBQP7cNmnzFjmnKhipqOI=
X-Gm-Gg: AfdE7clGtIy2uZfmuU1UU3uBsE2UGxaQ7JMbxkIuRdJgQKE3Pqfi0u84fp6gecwHqPG
	plIVe9LKZPIx32PhOaNnJsWrcjdCFhFTDpo2YNUlgV7+rDB75EhHOrvBydmY+NAMKagAkZ8rOco
	GgNM8llreCR0tWmJuwTw5Fi8LhBKCfi0bdq0atysoTb0kGnBokHrxZMtSFgvF+Zc3bZ5V0/wMD0
	lByE+y4MAgADqJDMUVI0UlFGw6JfNmsMsxxQBSo/F66chX0nq2d4bZ0pV/aLTPK2GXGtP2ZemBJ
	hPml6wM8vdAO3Q53m4+fwo3aefemu3F7oQpxC7zSOeZtqJjNARFz7CXZwH+pUQDvvLzWQ3NkE2X
	/HX7w1f7rrwvGqhiNrykthzM=
X-Received: by 2002:a05:6a00:a16:b0:845:e34d:f226 with SMTP id d2e1a72fcca58-847f6da5228mr4452844b3a.16.1783190015055;
        Sat, 04 Jul 2026 11:33:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:a16:b0:845:e34d:f226 with SMTP id d2e1a72fcca58-847f6da5228mr4452818b3a.16.1783190014533;
        Sat, 04 Jul 2026 11:33:34 -0700 (PDT)
Received: from [192.168.1.100] ([151.243.38.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b6057dsm1508437b3a.7.2026.07.04.11.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 11:33:34 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 02:31:18 +0800
Subject: [PATCH 9/9] drm/xen: replace struct drm_simple_display_pipe with
 regular atomic helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-drm-simple-kms-removal-v1-9-b4e1ca053623@oss.qualcomm.com>
References: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com>
In-Reply-To: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783189912; l=11508;
 i=ze.huang@oss.qualcomm.com; s=20260704; h=from:subject:message-id;
 bh=jES7nUSVZBQKhOgvari+mSaMEA9hK9OzE4xbZwzc1Wc=;
 b=naeMyylZbpop3bZogsF4t3ncusoDzSV5MAr4bFahQ9OZoV1nX45pewAGKcoP51qwspHbJK4qL
 CrLEMD+vWkoAPiK+s51b/vLkl6FeLtlnVwJdSWw0mdLqi6JOcjJSi+K
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=pSsISLZF2ubEjJRmslsa6Ps4W3yAuPY7yaircQTlQQU=
X-Proofpoint-ORIG-GUID: gIbOyeTHimOs2U57XCZaOT90-YCLFDmq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfX272haZAnae4n
 hsAIOQwsQQ2j3WtaQOh4cgqID1RAuFy+6fQIki4s3PkEpUG1ubR6k58hgQHfpPZRGUgAsxloMAh
 SYmfI+720UvTYTUsyN4GRIy4u9YxSXM=
X-Authority-Analysis: v=2.4 cv=Z4Tc2nRA c=1 sm=1 tr=0 ts=6a4951ff cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=yt2wVW2Sl_HzNKkdQ3QA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: gIbOyeTHimOs2U57XCZaOT90-YCLFDmq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfX4DmhuP+c1rtg
 ajO1EvkcMt81xJEYmlk6zML+Dnu1O5NI3fADrKSsXzW748mOHt2BMUz6rGsd2hOmRUcBTxIOzC7
 38jv+EvUSNXCgb9Rh3PgrSdG9VR++69wAtu+j/3jl1cP5yFee3C+0U360IabuWTSu4wZJpV/yx0
 k1PF38QBPzL89ORiaSwOvrWYwMjes7jLJbZULpc2U7OmIu1YiApFioW5dp3+a3ZiIidNGuXaDPv
 /Me60ScygUKwrgDBoWzc/Rc2aZvxAOQYONneXm0BxcoK0Ao483ztHN79P/aE5zSlj9b5gxLRLqG
 VE1BPnoReHKSz4zJDzPvRCv+2y7uch5Kc+prf1+csveq8lWtnV21g7kSaRQTRObuWMi6glGxxCm
 XPkmg/pTdY/Uu+9HbZVZzQQ0ff2XGukBB2srMzR4uT5SjyyPrsKpfPDXPGQrfay5ikfRvXJV9To
 kWDFcfjz53cT1efKxvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040192

Replace Xen frontend simple display pipe with explicit plane, CRTC and
encoder objects for each pipeline.

Keep generic plane-state validation before Xen-specific checks, and
install GEM framebuffer prepare helper explicitly.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/xen/xen_drm_front.h     |   6 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c | 177 ++++++++++++++++++++++++--------
 2 files changed, 138 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front.h b/drivers/gpu/drm/xen/xen_drm_front.h
index a987c78abe41..02138b5abef5 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.h
+++ b/drivers/gpu/drm/xen/xen_drm_front.h
@@ -14,7 +14,7 @@
 #include <linux/scatterlist.h>
 
 #include <drm/drm_connector.h>
-#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_encoder.h>
 
 #include "xen_drm_front_cfg.h"
 
@@ -100,7 +100,9 @@ struct xen_drm_front_drm_pipeline {
 
 	int index;
 
-	struct drm_simple_display_pipe pipe;
+	struct drm_plane plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
 
 	struct drm_connector conn;
 	/* These are only for connector mode checking */
diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/xen/xen_drm_front_kms.c
index 48772b5fe71c..57e1bef452f8 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
@@ -31,9 +31,9 @@
 #define FRAME_DONE_TO_MS	(XEN_DRM_FRONT_WAIT_BACK_MS + 100)
 
 static struct xen_drm_front_drm_pipeline *
-to_xen_drm_pipeline(struct drm_simple_display_pipe *pipe)
+to_xen_drm_pipeline(struct drm_crtc *crtc)
 {
-	return container_of(pipe, struct xen_drm_front_drm_pipeline, pipe);
+	return container_of(crtc, struct xen_drm_front_drm_pipeline, crtc);
 }
 
 static void fb_destroy(struct drm_framebuffer *fb)
@@ -94,7 +94,7 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
 
 static void send_pending_event(struct xen_drm_front_drm_pipeline *pipeline)
 {
-	struct drm_crtc *crtc = &pipeline->pipe.crtc;
+	struct drm_crtc *crtc = &pipeline->crtc;
 	struct drm_device *dev = crtc->dev;
 	unsigned long flags;
 
@@ -105,17 +105,15 @@ static void send_pending_event(struct xen_drm_front_drm_pipeline *pipeline)
 	spin_unlock_irqrestore(&dev->event_lock, flags);
 }
 
-static void display_enable(struct drm_simple_display_pipe *pipe,
-			   struct drm_crtc_state *crtc_state,
-			   struct drm_plane_state *plane_state)
+static void xen_drm_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					      struct drm_atomic_commit *state)
 {
-	struct xen_drm_front_drm_pipeline *pipeline =
-			to_xen_drm_pipeline(pipe);
-	struct drm_crtc *crtc = &pipe->crtc;
+	struct xen_drm_front_drm_pipeline *pipeline = to_xen_drm_pipeline(crtc);
+	struct drm_plane_state *plane_state = pipeline->plane.state;
 	struct drm_framebuffer *fb = plane_state->fb;
 	int ret, idx;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(crtc->dev, &idx))
 		return;
 
 	ret = xen_drm_front_mode_set(pipeline, crtc->x, crtc->y,
@@ -131,13 +129,13 @@ static void display_enable(struct drm_simple_display_pipe *pipe,
 	drm_dev_exit(idx);
 }
 
-static void display_disable(struct drm_simple_display_pipe *pipe)
+static void xen_drm_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					       struct drm_atomic_commit *state)
 {
-	struct xen_drm_front_drm_pipeline *pipeline =
-			to_xen_drm_pipeline(pipe);
+	struct xen_drm_front_drm_pipeline *pipeline = to_xen_drm_pipeline(crtc);
 	int ret = 0, idx;
 
-	if (drm_dev_enter(pipe->crtc.dev, &idx)) {
+	if (drm_dev_enter(crtc->dev, &idx)) {
 		ret = xen_drm_front_mode_set(pipeline, 0, 0, 0, 0, 0,
 					     xen_drm_front_fb_to_cookie(NULL));
 		drm_dev_exit(idx);
@@ -177,12 +175,13 @@ static void pflip_to_worker(struct work_struct *work)
 	send_pending_event(pipeline);
 }
 
-static bool display_send_page_flip(struct drm_simple_display_pipe *pipe,
+static bool display_send_page_flip(struct xen_drm_front_drm_pipeline *pipeline,
+				   struct drm_atomic_commit *state,
 				   struct drm_plane_state *old_plane_state)
 {
 	struct drm_plane_state *plane_state =
-			drm_atomic_get_new_plane_state(old_plane_state->state,
-						       &pipe->plane);
+			drm_atomic_get_new_plane_state(state,
+						       &pipeline->plane);
 
 	/*
 	 * If old_plane_state->fb is NULL and plane_state->fb is not,
@@ -193,8 +192,6 @@ static bool display_send_page_flip(struct drm_simple_display_pipe *pipe,
 	 * sent to the backend as a part of display_set_config call.
 	 */
 	if (old_plane_state->fb && plane_state->fb) {
-		struct xen_drm_front_drm_pipeline *pipeline =
-				to_xen_drm_pipeline(pipe);
 		struct xen_drm_front_drm_info *drm_info = pipeline->drm_info;
 		int ret;
 
@@ -224,10 +221,30 @@ static bool display_send_page_flip(struct drm_simple_display_pipe *pipe,
 	return false;
 }
 
-static int display_check(struct drm_simple_display_pipe *pipe,
-			 struct drm_plane_state *plane_state,
-			 struct drm_crtc_state *crtc_state)
+static int xen_drm_plane_helper_atomic_check(struct drm_plane *plane,
+					     struct drm_atomic_commit *state)
 {
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc *crtc = plane_state->crtc;
+	struct drm_crtc_state *crtc_state = NULL;
+	int ret;
+
+	if (crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+
+	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, false);
+	if (ret)
+		return ret;
+
+	if (!plane_state->visible)
+		return 0;
+
+	if (!crtc_state)
+		return 0;
+
 	/*
 	 * Xen doesn't initialize vblanking via drm_vblank_init(), so
 	 * DRM helpers assume that it doesn't handle vblanking and start
@@ -242,15 +259,19 @@ static int display_check(struct drm_simple_display_pipe *pipe,
 	return 0;
 }
 
-static void display_update(struct drm_simple_display_pipe *pipe,
-			   struct drm_plane_state *old_plane_state)
+static void xen_drm_plane_helper_atomic_update(struct drm_plane *plane,
+					       struct drm_atomic_commit *state)
 {
-	struct xen_drm_front_drm_pipeline *pipeline =
-			to_xen_drm_pipeline(pipe);
-	struct drm_crtc *crtc = &pipe->crtc;
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+	struct drm_crtc *crtc = plane->state->crtc ?: old_plane_state->crtc;
+	struct xen_drm_front_drm_pipeline *pipeline;
 	struct drm_pending_vblank_event *event;
 	int idx;
 
+	if (!crtc)
+		return;
+
+	pipeline = to_xen_drm_pipeline(crtc);
 	event = crtc->state->event;
 	if (event) {
 		struct drm_device *dev = crtc->dev;
@@ -265,7 +286,7 @@ static void display_update(struct drm_simple_display_pipe *pipe,
 		spin_unlock_irqrestore(&dev->event_lock, flags);
 	}
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx)) {
+	if (!drm_dev_enter(crtc->dev, &idx)) {
 		send_pending_event(pipeline);
 		return;
 	}
@@ -278,19 +299,19 @@ static void display_update(struct drm_simple_display_pipe *pipe,
 	 * If this is not a page flip, e.g. no flip done event from the backend
 	 * is expected, then send now.
 	 */
-	if (!display_send_page_flip(pipe, old_plane_state))
+	if (!display_send_page_flip(pipeline, state, old_plane_state))
 		send_pending_event(pipeline);
 
 	drm_dev_exit(idx);
 }
 
 static enum drm_mode_status
-display_mode_valid(struct drm_simple_display_pipe *pipe,
-		   const struct drm_display_mode *mode)
+xen_drm_crtc_helper_mode_valid(struct drm_crtc *crtc,
+			       const struct drm_display_mode *mode)
 {
 	struct xen_drm_front_drm_pipeline *pipeline =
-			container_of(pipe, struct xen_drm_front_drm_pipeline,
-				     pipe);
+			container_of(crtc, struct xen_drm_front_drm_pipeline,
+				     crtc);
 
 	if (mode->hdisplay != pipeline->width)
 		return MODE_ERROR;
@@ -301,12 +322,55 @@ display_mode_valid(struct drm_simple_display_pipe *pipe,
 	return MODE_OK;
 }
 
-static const struct drm_simple_display_pipe_funcs display_funcs = {
-	.mode_valid = display_mode_valid,
-	.enable = display_enable,
-	.disable = display_disable,
-	.check = display_check,
-	.update = display_update,
+static int xen_drm_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_commit *state)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	int ret;
+
+	if (!crtc_state->enable)
+		goto out;
+
+	ret = drm_atomic_helper_check_crtc_primary_plane(crtc_state);
+	if (ret)
+		return ret;
+
+out:
+	return drm_atomic_add_affected_planes(state, crtc);
+}
+
+static const struct drm_plane_helper_funcs display_plane_helper_funcs = {
+	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
+	.atomic_check	= xen_drm_plane_helper_atomic_check,
+	.atomic_update	= xen_drm_plane_helper_atomic_update,
+};
+
+static const struct drm_plane_funcs display_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= drm_plane_cleanup,
+	.reset			= drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+};
+
+static const struct drm_crtc_helper_funcs display_crtc_helper_funcs = {
+	.mode_valid	= xen_drm_crtc_helper_mode_valid,
+	.atomic_check	= xen_drm_crtc_helper_atomic_check,
+	.atomic_enable	= xen_drm_crtc_helper_atomic_enable,
+	.atomic_disable	= xen_drm_crtc_helper_atomic_disable,
+};
+
+static const struct drm_crtc_funcs display_crtc_funcs = {
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+};
+
+static const struct drm_encoder_funcs display_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
 };
 
 static int display_pipe_init(struct xen_drm_front_drm_info *drm_info,
@@ -331,10 +395,37 @@ static int display_pipe_init(struct xen_drm_front_drm_info *drm_info,
 
 	formats = xen_drm_front_conn_get_formats(&format_count);
 
-	return drm_simple_display_pipe_init(dev, &pipeline->pipe,
-					    &display_funcs, formats,
-					    format_count, NULL,
-					    &pipeline->conn);
+	ret = drm_universal_plane_init(dev, &pipeline->plane, 1,
+				       &display_plane_funcs,
+				       formats, format_count,
+				       NULL,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+
+	drm_plane_helper_add(&pipeline->plane, &display_plane_helper_funcs);
+
+	ret = drm_crtc_init_with_planes(dev, &pipeline->crtc,
+					&pipeline->plane, NULL,
+					&display_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+
+	drm_crtc_helper_add(&pipeline->crtc, &display_crtc_helper_funcs);
+
+	ret = drm_encoder_init(dev, &pipeline->encoder,
+			       &display_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
+
+	pipeline->encoder.possible_crtcs = drm_crtc_mask(&pipeline->crtc);
+
+	ret = drm_connector_attach_encoder(&pipeline->conn, &pipeline->encoder);
+	if (ret)
+		return ret;
+
+	return 0;
 }
 
 int xen_drm_front_kms_init(struct xen_drm_front_drm_info *drm_info)

-- 
2.55.0

