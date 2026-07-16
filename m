Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B2F3F65E0
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 09:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192605; cv=none; b=kEN+Qe9X/RsoEBzABYZkHIC2N3RTpOJC/CBCDOu6/um1FaISgxJlpACvkwhqXYbq9u2SwQIyTKHywbHLb6YjGJ61+pieyE+iEDba5IMCCDrNm3yqZno4FBwyG2cXrPAv3PdCRkYZpfOnYDahXr7gHe5Zt7vB8IDA9QVDwHHHyjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192605; c=relaxed/simple;
	bh=68SyLROdh7gtSjTLnzbueeYHapUemcEJldTPDqGBdBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E1OSxAp+nJfLfoUJdMPUAnJUErqPt0R2jFjIxl7JjW0b8OF0uuEDfd3Yo18/qFohqKu5onJgbEtpZeBa4HUFiqvENICtKYXQlcfdEnQvE+D+OGT8CDqfVTAEja9FA9IlBOxGEaYtdbFU2QlCndXYxo+lA5ImdqHgfTiAyMP9bOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PLzkANko; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hhFkAIlS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PLzkANko";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hhFkAIlS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7Dx8E1882745
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 09:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3gs6ZFn51ViIywPhcgxd9Yb4ROtm55PINNXW4yAOhhE=; b=PLzkANkoIcwLSt8u
	qxHbKYQBqEIGyO2zD8ScRdo116d1xg/kxNzHjH6wRUBPXjaSRWbwhIWprgtUuLPW
	KKXSZZjdsq6P20BmYmWkfRvjGicEbsDDRmbrScs3ts42gkrr6BG7rkMDzXfkQk7R
	XCM6gQv9sUWksFHIu4edURnNQqBEGuvw+hA2qNFkuswKLyLyNE/9rnRq6YmABhoO
	d/UeUHTGoFT6tFDGmMt/J71Jn/g9BodysDeOv4b751VtWPp0lgwJ83kqMdE538O8
	rm+50X8hZFJXBYVKeXh2Iqpxeea25a7lbs8Dt0DH1gJBof+Wx3TcwLyDz6fJjHiX
	xZ3ULw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feehvaxdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 09:03:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc6dd43737so123619785ad.2
        for <imx@lists.linux.dev>; Thu, 16 Jul 2026 02:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784192590; x=1784797390; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gs6ZFn51ViIywPhcgxd9Yb4ROtm55PINNXW4yAOhhE=;
        b=hhFkAIlSLjm8m6mnCCJRdCdd8WUjp8kdVVizNbe4Kr2teHCGjHZa5b0WIbKYvu/2VO
         y954jtw6TzdGCIlPgphCafO5ewbph3tE8l1nceDaAppnBnZSNrI5zH7U31Ffi41Wn4as
         kcMqZe29seOSkXuCb5qVKimV8rpkE/SCLPaxMgZ5hNcSVbsLZ1iCGxnLpzgqaemWCpWi
         WXbLLXwE/GqoVX+pD3SRdaugqXBIzDPOI22XToa7sURviXaPGNkYyG0wkH+/ADEQ+h2p
         5kGSs4Xp9EGKAXhs50KjiVHehChPHv/LwIe78f/J1VhbPMKrm8V6CfnENGCsEYA77CAa
         TWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192590; x=1784797390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3gs6ZFn51ViIywPhcgxd9Yb4ROtm55PINNXW4yAOhhE=;
        b=Gr/vIR3eIsJUGc8+7wc4lOgn6z9UKlGRJ0OeYLTTM2rH9ovQMlWQK1jAdVc67oSQ+F
         2Z89vOGXDca8TeGbBEx/LC554XgrLIRVzTOHMwdckj45oBzh5aNQGjMcucZ1GKgPGuNx
         rWVGf7fxXv8NthMJ/BW4BLJTg6dIoEqu/6EzI5WK6N4HyT/mEqC3GgGq9NB4kJCs1jiZ
         Hh1b1z3QH1JfU5D57rGsT9f6JDkxsgkChBr8ek2wGZJSL5IR3WTTYROgEOx+Ew1ADSmO
         ZCelHmgOHikUtvMeuhlCERkesDLok44zsoEzOu2lmbwcHkxJecDOaFpsseou10hzsmI1
         +b0Q==
X-Forwarded-Encrypted: i=1; AHgh+RpaSjtbKhxgr/7x4/tyOVwiKm9wIyvh59U21W+Zd9I1vUh21Lh998Iu4JfoK5wzBpfFzFs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw25npYPeLiV3iBty0FAWT6nfQVQ5CJVBC5CK8o41iMZfFdxohZ
	iw6ukJTSz7r6vFPU5tsFgVXu1khffxSx9GM9CsZcXCA2X+LhMW0iYujdE/tZ2yMyOzqnmDqDh5P
	rggQtvzjcUrygc7ttHUjlEtitTnNZCZN8cnP4zP+gJCRtyqkShgCCvgs=
X-Gm-Gg: AfdE7clqvl48D3zxKHQlwujCgLIr5XyNu9SFm0xlMDrXXQk1ITS5KpZKhWCynhLjcKg
	I3/z+0R0v+sqx8px0Lu3PSdAA9LJknhal1q+IiGZ6Ch+B/7iDZ2vyh9EGfNMStInxDI4/3/g0//
	KNFJTnc6RmUUXIF1PeRvcomu0XJZ2EUFFQ+jCaEGNE3Lr9BRyC7qvyPVjk75p1NFjuGpl9LrIqu
	cFEhRXQmNs9OQimbzx/W00y4cBfsJKx9qoahY/DubuvZlraFYyxsWCKVIeGtaSisOVCdM8kmv52
	G8NwJElsKe3q+M4DIx7fVi4IYrw2Q22HyRRYxt1Pf1hTChLq3rpNoMKkicXsF9LansowYSv52vD
	IIvecJnxTcJv224TyYFUh
X-Received: by 2002:a17:903:458f:b0:2ca:304:f93e with SMTP id d9443c01a7336-2cee9b58fa9mr109883285ad.22.1784192589918;
        Thu, 16 Jul 2026 02:03:09 -0700 (PDT)
X-Received: by 2002:a17:903:458f:b0:2ca:304:f93e with SMTP id d9443c01a7336-2cee9b58fa9mr109882915ad.22.1784192589269;
        Thu, 16 Jul 2026 02:03:09 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf106b271asm16592555ad.64.2026.07.16.02.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:03:08 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 17:01:55 +0800
Subject: [PATCH v2 3/8] drm/mcde: replace struct drm_simple_display_pipe
 with regular atomic helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-drm-simple-kms-removal-v2-3-1133a8fc3785@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784192560; l=15094;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=68SyLROdh7gtSjTLnzbueeYHapUemcEJldTPDqGBdBg=;
 b=GZwBrZK7hIoCbv3x6DM9/eN8GGXvJVijZFHj5nkZmiajld9kb1tDcEAiNnFrtIIuriqYSY/32
 F3xiVq3FpDRA9RMcdgRY89Bz0rhbKAJEmtJuYqvmpmgQ33WCA3AICwE
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Authority-Analysis: v=2.4 cv=ZpDd7d7G c=1 sm=1 tr=0 ts=6a589e4e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=7TuhGXn_jpZpJwHYtc4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfXxLhO2KYY3pQq
 fir7c/Bb6sKzyRg01RZvO3M3VDYVeEu99uWU1W7pWSPs3NMcuj11iP4MroVWza66/KUpC8EQZjq
 yoQ17pfcO3hG7m/2xs9SgbVubOwNCsf2oeYQcy7R6j66vQS99q/PJbnHzYL/vWl+OPmlNI21Pzb
 iQN91gL1b0UERSwGJLrjBtH8qJuVaFIOWHMhDxB0VOTwnfgB0NteHNJz/g2UZMzhJpCUPrSfP1Q
 xxV6nUYksfaxAvE3r0OSCSBykBBFA9FKTrNIxKuYYsXu7CKI2z7ihx9uQPeoJ0QFpFKRwlZQA+B
 XzBacBY04kOnvSAOpS40Z8J6w2DP0EhJ/siyUs8i6FQSWSNI8SFZFXV7vAZCvO015JbFADh6sVq
 gfAWovGHV/LLcIZcZW966WxrrNF7egsiDrBzgHmEPTx+DMCk4SfUXGnrlKODQ7QWf3e63qhfMpW
 K8NqQM0TWajTnPrWj/g==
X-Proofpoint-GUID: VaZC9GXrcElMS_7aV4skq4kPfNmqcsaT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfXyHWdkTYITMdJ
 XpVTc4Yd4KFBOoF5yfKhM88R6WpkDOJAr2Mpl3R+c6e9KvlxLTyu4YSNxf37KygxcZEBhU20e35
 VMlvPVy7EYb7Kgb39P0CMdK0CDk7yAo=
X-Proofpoint-ORIG-GUID: VaZC9GXrcElMS_7aV4skq4kPfNmqcsaT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160091

Convert MCDE to explicit plane, CRTC and encoder objects.

Handle pending page-flip events from the CRTC atomic flush path using the
commit-local CRTC state, and avoid manual connector/encoder attachment
before the connector has been created by the bridge path.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/mcde/mcde_display.c | 251 +++++++++++++++++++++++-------------
 drivers/gpu/drm/mcde/mcde_drm.h     |   8 +-
 drivers/gpu/drm/mcde/mcde_drv.c     |   8 +-
 3 files changed, 173 insertions(+), 94 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index 257a6e84dd58..86edf94c5237 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -10,6 +10,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/media-bus-format.h>
 
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
@@ -18,7 +19,6 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_print.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_vblank.h>
 #include <video/mipi_display.h>
@@ -132,7 +132,7 @@ void mcde_display_irq(struct mcde *mcde)
 	writel(mispp, mcde->regs + MCDE_RISPP);
 
 	if (vblank)
-		drm_crtc_handle_vblank(&mcde->pipe.crtc);
+		drm_crtc_handle_vblank(&mcde->crtc);
 
 	if (misovl)
 		dev_info(mcde->dev, "some stray overlay IRQ %08x\n", misovl);
@@ -157,40 +157,57 @@ void mcde_display_disable_irqs(struct mcde *mcde)
 	writel(0xFFFFFFFF, mcde->regs + MCDE_RISCHNL);
 }
 
-static int mcde_display_check(struct drm_simple_display_pipe *pipe,
-			      struct drm_plane_state *pstate,
-			      struct drm_crtc_state *cstate)
+static int mcde_plane_helper_atomic_check(struct drm_plane *plane,
+					  struct drm_atomic_commit *commit)
 {
-	const struct drm_display_mode *mode = &cstate->mode;
-	struct drm_framebuffer *old_fb = pipe->plane.state->fb;
+	struct drm_plane_state *pstate = drm_atomic_get_new_plane_state(commit, plane);
+	struct drm_plane_state *old_pstate = drm_atomic_get_old_plane_state(commit, plane);
+	struct drm_crtc *crtc = pstate->crtc;
+	struct drm_crtc_state *cstate = NULL;
+	const struct drm_display_mode *mode;
+	struct drm_framebuffer *old_fb = old_pstate->fb;
 	struct drm_framebuffer *fb = pstate->fb;
+	int ret;
 
-	if (fb) {
-		u32 offset = drm_fb_dma_get_gem_addr(fb, pstate, 0);
+	if (crtc)
+		cstate = drm_atomic_get_new_crtc_state(commit, crtc);
 
-		/* FB base address must be dword aligned. */
-		if (offset & 3) {
-			DRM_DEBUG_KMS("FB not 32-bit aligned\n");
-			return -EINVAL;
-		}
+	ret = drm_atomic_helper_check_plane_state(pstate, cstate,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, false);
+	if (ret)
+		return ret;
 
-		/*
-		 * There's no pitch register, the mode's hdisplay
-		 * controls this.
-		 */
-		if (fb->pitches[0] != mode->hdisplay * fb->format->cpp[0]) {
-			DRM_DEBUG_KMS("can't handle pitches\n");
-			return -EINVAL;
-		}
+	if (!pstate->visible || !fb)
+		return 0;
 
-		/*
-		 * We can't change the FB format in a flicker-free
-		 * manner (and only update it during CRTC enable).
-		 */
-		if (old_fb && old_fb->format != fb->format)
-			cstate->mode_changed = true;
+	mode = &cstate->mode;
+
+	u32 offset = drm_fb_dma_get_gem_addr(fb, pstate, 0);
+
+	/* FB base address must be dword aligned. */
+	if (offset & 3) {
+		DRM_DEBUG_KMS("FB not 32-bit aligned\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * There's no pitch register, the mode's hdisplay
+	 * controls this.
+	 */
+	if (fb->pitches[0] != mode->hdisplay * fb->format->cpp[0]) {
+		DRM_DEBUG_KMS("can't handle pitches\n");
+		return -EINVAL;
 	}
 
+	/*
+	 * We can't change the FB format in a flicker-free
+	 * manner (and only update it during CRTC enable).
+	 */
+	if (old_fb && old_fb->format != fb->format)
+		cstate->mode_changed = true;
+
 	return 0;
 }
 
@@ -1149,16 +1166,15 @@ static void mcde_setup_dsi(struct mcde *mcde, const struct drm_display_mode *mod
 	*dsi_formatter_frame = formatter_frame;
 }
 
-static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
-				struct drm_crtc_state *cstate,
-				struct drm_plane_state *plane_state)
+static void mcde_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					   struct drm_atomic_commit *commit)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_plane *plane = &pipe->plane;
 	struct drm_device *drm = crtc->dev;
 	struct mcde *mcde = to_mcde(drm);
+	struct drm_crtc_state *cstate = drm_atomic_get_new_crtc_state(commit, crtc);
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(commit, &mcde->plane);
 	const struct drm_display_mode *mode = &cstate->mode;
-	struct drm_framebuffer *fb = plane->state->fb;
+	struct drm_framebuffer *fb = plane_state->fb;
 	u32 format = fb->format->format;
 	int dsi_pkt_size;
 	int fifo_wtrmrk;
@@ -1298,9 +1314,10 @@ static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
 	dev_info(drm->dev, "MCDE display is enabled\n");
 }
 
-static void mcde_display_disable(struct drm_simple_display_pipe *pipe)
+static void mcde_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					    struct drm_atomic_commit *commit)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
+	struct drm_crtc_state *cstate = drm_atomic_get_new_crtc_state(commit, crtc);
 	struct drm_device *drm = crtc->dev;
 	struct mcde *mcde = to_mcde(drm);
 	struct drm_pending_vblank_event *event;
@@ -1318,9 +1335,9 @@ static void mcde_display_disable(struct drm_simple_display_pipe *pipe)
 		mcde_dsi_disable(mcde->bridge);
 	}
 
-	event = crtc->state->event;
+	event = cstate->event;
 	if (event) {
-		crtc->state->event = NULL;
+		cstate->event = NULL;
 
 		spin_lock_irq(&crtc->dev->event_lock);
 		drm_crtc_send_vblank_event(crtc, event);
@@ -1381,44 +1398,13 @@ static void mcde_set_extsrc(struct mcde *mcde, u32 buffer_address)
 	writel(buffer_address + mcde->stride, mcde->regs + MCDE_EXTSRCXA1);
 }
 
-static void mcde_display_update(struct drm_simple_display_pipe *pipe,
-				struct drm_plane_state *old_pstate)
+static void mcde_plane_helper_atomic_update(struct drm_plane *plane,
+					    struct drm_atomic_commit *commit)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_device *drm = crtc->dev;
-	struct mcde *mcde = to_mcde(drm);
-	struct drm_pending_vblank_event *event = crtc->state->event;
-	struct drm_plane *plane = &pipe->plane;
-	struct drm_plane_state *pstate = plane->state;
+	struct drm_plane_state *pstate = drm_atomic_get_new_plane_state(commit, plane);
+	struct mcde *mcde = to_mcde(plane->dev);
 	struct drm_framebuffer *fb = pstate->fb;
 
-	/*
-	 * Handle any pending event first, we need to arm the vblank
-	 * interrupt before sending any update to the display so we don't
-	 * miss the interrupt.
-	 */
-	if (event) {
-		crtc->state->event = NULL;
-
-		spin_lock_irq(&crtc->dev->event_lock);
-		/*
-		 * Hardware must be on before we can arm any vblank event,
-		 * this is not a scanout controller where there is always
-		 * some periodic update going on, it is completely frozen
-		 * until we get an update. If MCDE output isn't yet enabled,
-		 * we just send a vblank dummy event back.
-		 */
-		if (crtc->state->active && drm_crtc_vblank_get(crtc) == 0) {
-			dev_dbg(mcde->dev, "arm vblank event\n");
-			drm_crtc_arm_vblank_event(crtc, event);
-		} else {
-			dev_dbg(mcde->dev, "insert fake vblank event\n");
-			drm_crtc_send_vblank_event(crtc, event);
-		}
-
-		spin_unlock_irq(&crtc->dev->event_lock);
-	}
-
 	/*
 	 * We do not start sending framebuffer updates before the
 	 * display is enabled. Update events will however be dispatched
@@ -1443,9 +1429,40 @@ static void mcde_display_update(struct drm_simple_display_pipe *pipe,
 	}
 }
 
-static int mcde_display_enable_vblank(struct drm_simple_display_pipe *pipe)
+static void mcde_crtc_helper_atomic_flush(struct drm_crtc *crtc,
+					  struct drm_atomic_commit *commit)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(commit, crtc);
+	struct drm_pending_vblank_event *event = crtc_state->event;
+
+	/*
+	 * Handle any pending event first, we need to arm the vblank
+	 * interrupt before sending any update to the display so we don't
+	 * miss the interrupt.
+	 */
+	if (!event)
+		return;
+
+	crtc_state->event = NULL;
+
+	spin_lock_irq(&crtc->dev->event_lock);
+	/*
+	 * Hardware must be on before we can arm any vblank event,
+	 * this is not a scanout controller where there is always
+	 * some periodic update going on, it is completely frozen
+	 * until we get an update. If MCDE output isn't yet enabled,
+	 * we just send a vblank dummy event back.
+	 */
+	if (crtc_state->active && drm_crtc_vblank_get(crtc) == 0)
+		drm_crtc_arm_vblank_event(crtc, event);
+	else
+		drm_crtc_send_vblank_event(crtc, event);
+
+	spin_unlock_irq(&crtc->dev->event_lock);
+}
+
+static int mcde_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_device *drm = crtc->dev;
 	struct mcde *mcde = to_mcde(drm);
 	u32 val;
@@ -1462,9 +1479,8 @@ static int mcde_display_enable_vblank(struct drm_simple_display_pipe *pipe)
 	return 0;
 }
 
-static void mcde_display_disable_vblank(struct drm_simple_display_pipe *pipe)
+static void mcde_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_device *drm = crtc->dev;
 	struct mcde *mcde = to_mcde(drm);
 
@@ -1474,13 +1490,55 @@ static void mcde_display_disable_vblank(struct drm_simple_display_pipe *pipe)
 	writel(0xFFFFFFFF, mcde->regs + MCDE_RISPP);
 }
 
-static struct drm_simple_display_pipe_funcs mcde_display_funcs = {
-	.check = mcde_display_check,
-	.enable = mcde_display_enable,
-	.disable = mcde_display_disable,
-	.update = mcde_display_update,
-	.enable_vblank = mcde_display_enable_vblank,
-	.disable_vblank = mcde_display_disable_vblank,
+static int mcde_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_commit *commit)
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
+static const struct drm_crtc_funcs mcde_crtc_funcs = {
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+	.enable_vblank		= mcde_crtc_enable_vblank,
+	.disable_vblank		= mcde_crtc_disable_vblank,
+};
+
+static const struct drm_crtc_helper_funcs mcde_crtc_helper_funcs = {
+	.atomic_check	= mcde_crtc_helper_atomic_check,
+	.atomic_enable	= mcde_crtc_helper_atomic_enable,
+	.atomic_disable	= mcde_crtc_helper_atomic_disable,
+	.atomic_flush	= mcde_crtc_helper_atomic_flush,
+};
+
+static const struct drm_plane_funcs mcde_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.reset			= drm_atomic_helper_plane_reset,
+	.destroy		= drm_plane_cleanup,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+};
+
+static const struct drm_plane_helper_funcs mcde_plane_helper_funcs = {
+	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
+	.atomic_check	= mcde_plane_helper_atomic_check,
+	.atomic_update	= mcde_plane_helper_atomic_update,
+};
+
+static const struct drm_encoder_funcs mcde_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
 };
 
 int mcde_display_init(struct drm_device *drm)
@@ -1510,14 +1568,29 @@ int mcde_display_init(struct drm_device *drm)
 	if (ret)
 		return ret;
 
-	ret = drm_simple_display_pipe_init(drm, &mcde->pipe,
-					   &mcde_display_funcs,
-					   formats, ARRAY_SIZE(formats),
-					   NULL,
-					   mcde->connector);
+	ret = drm_universal_plane_init(drm, &mcde->plane, 0,
+				       &mcde_plane_funcs,
+				       formats, ARRAY_SIZE(formats),
+				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+
+	drm_plane_helper_add(&mcde->plane, &mcde_plane_helper_funcs);
+
+	ret = drm_crtc_init_with_planes(drm, &mcde->crtc, &mcde->plane,
+					NULL, &mcde_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+
+	drm_crtc_helper_add(&mcde->crtc, &mcde_crtc_helper_funcs);
+
+	ret = drm_encoder_init(drm, &mcde->encoder, &mcde_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
 	if (ret)
 		return ret;
 
+	mcde->encoder.possible_crtcs = drm_crtc_mask(&mcde->crtc);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mcde_display_init);
diff --git a/drivers/gpu/drm/mcde/mcde_drm.h b/drivers/gpu/drm/mcde/mcde_drm.h
index ecb70b4b737c..10dd79893811 100644
--- a/drivers/gpu/drm/mcde/mcde_drm.h
+++ b/drivers/gpu/drm/mcde/mcde_drm.h
@@ -4,7 +4,7 @@
  * Parts of this file were based on the MCDE driver by Marcus Lorentzon
  * (C) ST-Ericsson SA 2013
  */
-#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_encoder.h>
 
 #ifndef _MCDE_DRM_H_
 #define _MCDE_DRM_H_
@@ -72,7 +72,9 @@ struct mcde {
 	struct drm_panel *panel;
 	struct drm_bridge *bridge;
 	struct drm_connector *connector;
-	struct drm_simple_display_pipe pipe;
+	struct drm_plane plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
 	struct mipi_dsi_device *mdsi;
 	bool dpi_output;
 	s16 stride;
@@ -95,7 +97,7 @@ struct mcde {
 	struct regulator *vana;
 };
 
-#define to_mcde(dev) container_of(dev, struct mcde, drm)
+struct mcde *to_mcde(struct drm_device *dev);
 
 static inline bool mcde_flow_is_video(struct mcde *mcde)
 {
diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 5f2c462bad7e..01787b923520 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -109,6 +109,11 @@ static const struct drm_mode_config_helper_funcs mcde_mode_config_helpers = {
 	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
 };
 
+struct mcde *to_mcde(struct drm_device *dev)
+{
+	return container_of(dev, struct mcde, drm);
+}
+
 static irqreturn_t mcde_irq(int irq, void *data)
 {
 	struct mcde *mcde = data;
@@ -186,8 +191,7 @@ static int mcde_modeset_init(struct drm_device *drm)
 	}
 
 	/* Attach the bridge. */
-	ret = drm_simple_display_pipe_attach_bridge(&mcde->pipe,
-						    mcde->bridge);
+	ret = drm_bridge_attach(&mcde->encoder, mcde->bridge, NULL, 0);
 	if (ret) {
 		dev_err(drm->dev, "failed to attach display output bridge\n");
 		return ret;

-- 
2.43.0

