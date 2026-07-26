Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95583793D2
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 19:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785095182; cv=none; b=dgOn/msNJ28Vy4y1+HzNRTdzr6yK2GYGgfwszEdcXUHBkXR2onKLBW0w9l3AuxI2v/09dS/3J/LJAI8xw+fha1QBwYsuGzEWofMd1slHX8Kz5pWR8vadWBiXfoF8ZSgisubgjHUpb8EPquEjRKBhFCsvGHMlclX+r3KoPFw6m1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785095182; c=relaxed/simple;
	bh=g+MDix2aoww8WVfrNbk1rE7PxKYObabHjKYvIJmxIMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pYtUPaSqBa2MZrJYY1109o1tuBM9kGn2KET0l3hl0aZK9j6Z/udNep8E/pjcQag8/JkkvG+eMaJg1Xi5XrndH6G7Pm907R187xHNgJZYLRbdzjAnFEoRPLOUL+KnKSGBI73x5XM60ppOjs+8fk7JkaSYAKrglysXlPq2ckISeNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eSrHRae+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nzx2fqIm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eSrHRae+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nzx2fqIm"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH7G8h1366237
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 19:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tzBRrJFfWf9nuUSk+Umahe/GXjmEn4PayMptDA8R4co=; b=eSrHRae+4KBJsqzq
	PRmZQmIoQ8J6u9+blj/zwfOFX54m0IOTPrB/iPVShNYnvFDCwzhSKRSqlVKDvuNs
	vA+xR14w273BsD0kDwfefgw+yW4p6AFSBDFMfZ3fpzle9yt2Oi+Vu1hfg1fsXazo
	XKci7DdKH9K+o7gJuy5xA9SXDUa4hrbLKzEXBbgkDODDK679rHG83Fb0Fbcnse/E
	5w82A7Vg9wzAvkzCIPc5pcIvNVdN4FGPG2Nht9vykKbwX1mya0SDeoruIsYgk+FT
	gyUp7CWEzdUcjSXQsYKq2OJwLOpZ2lCCliBingET4Gpo+AiMNbuYYtMb0qCDIR7K
	xDewrw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmmqybn1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 19:46:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so3816715a91.2
        for <imx@lists.linux.dev>; Sun, 26 Jul 2026 12:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785095177; x=1785699977; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tzBRrJFfWf9nuUSk+Umahe/GXjmEn4PayMptDA8R4co=;
        b=Nzx2fqIm6ZBHPBHjlMVxKD+DHCBPQdq40fxLs0XOW6LMLgOcuaR98JSICeX7aojEb4
         O8hCXT2SjlBPMFI2360pItJf8jXmXOEqQGXEhdPtPenNTI2T/+8ESsLdk0RwXaio/amj
         luhNS+9kx/UcYidHoZSAR8c7FIjtfqN1h3HELkjb4wvgAsf8gfNnnAm2IVBtKWMgYcv3
         zHLSwuziq7D9sGQbqnt2om+2agmTqZiy6e0egPkhJXbwA6V0qhhmCHWwnSnLrbvalqdg
         2mas8fGgVQbG+6KjBTAdao/tdBiKY+T9d1qzPh+fuXmxC0I6i4eXksgndDm+mjv0PoEE
         teUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785095177; x=1785699977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tzBRrJFfWf9nuUSk+Umahe/GXjmEn4PayMptDA8R4co=;
        b=huKRL6/W/D5v7aK9q7fVXER99bi1M/Pdjke420R+5dUFdgkNDntQGiQX0OqDdjwyl5
         Ageya4kYKjut6q5RCZvKuZUSc9l90A/rVYMEGA9wtYm53PdNqX++PX4LpFlGgDGB3RR/
         zNzVW4pJT8+9/wYaRhTeJqR9ioRa+msyR3OGY0j+sA83s32RRuLzdc9MNUzI9wFKFOzg
         cDSeVAVPZmr3+D8Jl7lJSSKv7L1fNF0NQBgmTYVfVZZqIlLTkaSxp/HAo9VSTqqghxP0
         WxO4yEPIKhi4tQFcJv0eR0YAV/6D2DQk6tJn7sVAYiVnDvBCFigLlJVZw/PBy/vN8jDO
         Gc0w==
X-Forwarded-Encrypted: i=1; AHgh+RpuJPNw+Z2IHmZYKekTQiwMKzP/WDJVJ4M+O5p5q+5ulFVQeTyW6m7OSvQpgFXVQNAAbfg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQvkVSp2mKimQMhEzvDjnm1W4Nbj+5TvsCMkZnDIOAXJQQTMkW
	WWJ1aa3+7D7wbskOIe6kXuYipZyYaIFxwBx6CxQUz9i3HPCWb5qGrd1Dz+Wjmj8deiKS/8yY6M8
	r13O/pcf4WGUpLZq49Y07Xr1FfpOsznHs056/5m2YvmpoZW1NmFCLyjs=
X-Gm-Gg: AR+sD11pb+d77ERTqWYGbyZTvU46cus/fuu2uci5UOmGKo54Ejqym/uqrPtotwljOm+
	F+878Vba2M7U4aES96lW5kX2gcM1Fn4FOGQS95DC+ilAnUvOa30qPelMhJ9ctmNaHSXfnazB2Np
	B669G1FKZ+Ks+H15h8oJ0gD4O4aU79Wezp8FV6lb2cpszJjsWCONiDrdBhqCDlal6sj3UEigdqt
	j3XVoLdPMKn9wTKssVuRbvnyhNCy0SoZff/DxBgSq2TWWhfoc7FDE3ly07+OXwpEuK4dXiTapy4
	S8nE4VqMM8uOXVnyN+jQ4UhpG30ptj8vLozPs+OsvKImoY/nnhzGKkRDd1EJm0CiIT9bu/Ot7+J
	h1NthNcbO0RELGVd7Xfy7
X-Received: by 2002:a17:90a:d607:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-38f294ea129mr5919559a91.14.1785095177314;
        Sun, 26 Jul 2026 12:46:17 -0700 (PDT)
X-Received: by 2002:a17:90a:d607:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-38f294ea129mr5919538a91.14.1785095176894;
        Sun, 26 Jul 2026 12:46:16 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0eaa8sm4105998a91.8.2026.07.26.12.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 12:46:16 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 03:45:18 +0800
Subject: [PATCH v3 5/8] drm/gm12u320: replace struct
 drm_simple_display_pipe with regular atomic helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-drm-simple-kms-removal-v3-5-cd5dc89858c6@oss.qualcomm.com>
References: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com>
In-Reply-To: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785095129; l=8382;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=g+MDix2aoww8WVfrNbk1rE7PxKYObabHjKYvIJmxIMM=;
 b=mVZJXr+XmZgsHgsqa8wml/FP/WY7LcnwyXF2tb9+b/ejFt0L03u0D2Ll1AvyTMa4xxIz1ByxX
 qLo+sDvLyK+DfFgJTfsRiCYyQwCIqSBAsF6iNEqLbnHNKyQJtYM5yyE
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Proofpoint-ORIG-GUID: hbLjUpl3KiVLE7aBo7bwT_rYANTkWAGX
X-Authority-Analysis: v=2.4 cv=drbrzVg4 c=1 sm=1 tr=0 ts=6a66640a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=cqCYvchtcWlsvxqGjdoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: hbLjUpl3KiVLE7aBo7bwT_rYANTkWAGX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwMSBTYWx0ZWRfXyK0M5wOXSv97
 MxPF33G2O9PMCvjsKEjZ8YFXi5YfIueSv+hKvfLwTmVu/1clxpPOB+WaQ3vnropLLWETxvGym4v
 wT7Ev4Vaz8lLBMHhsPABIvPUp2gScIlefzXe6lnWHHYkJ11D3++MI5pqF3lnSKEZcoTCnmsqKvz
 trh6hTTPRMUwufKMiXdoerVt3aWGekxhsh7rEBmRjVeK0jpPa4T2Iwzh77Sg5uLh7DTanLlmE5V
 A9EPzvHGQJSBjiC2OUPK7kfVV9yTnmEAhRvo92lTg6T95K7BpSbC7aiGTxEHLU4ioAqtr92xZje
 ukZsj2T1uZWPPEGYGEx7FYLKLb3NiX1TzOI5I3JHMAecX4z5sGiITtltKb2kO+iYxKcxBeBVlBd
 HVns1RXPxis01qPpSE0CtFi4gD7+uo69NyC77NBoLDtwQdodlNzZtaxC4uSBBJOMj9If8Zdm5fw
 QEGJEDGCekNY1qjr4uA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwMSBTYWx0ZWRfXw4e/461RKn9U
 nxbFWrh1AxA2UpqGb7cmGroVel1yc8TJjz7370q05loas8onM814GtuSkFdvcIT7RjV6eNLT77a
 9VA/5gT/8gtZF57eF09qV0MiL8i2KKw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607260201

Convert gm12u320 to direct primary plane, CRTC and encoder setup.

Keep shadow-plane helper state, framebuffer access helpers and
no-scaling plane-state check from simple-KMS path.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>

---
Changes in v3:
- Use commit-local plane state in the CRTC enable path when marking the first
  frame dirty.
- Make the gm12u320 container helper static inline.
---
 drivers/gpu/drm/tiny/gm12u320.c | 138 ++++++++++++++++++++++++++++++++--------
 1 file changed, 111 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index d73dfebb4353..afcf0dfff14b 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -8,6 +8,7 @@
 #include <linux/usb.h>
 
 #include <drm/clients/drm_client_setup.h>
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_connector.h>
@@ -27,7 +28,6 @@
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 static bool eco_mode;
 module_param(eco_mode, bool, 0644);
@@ -87,7 +87,9 @@ MODULE_PARM_DESC(eco_mode, "Turn on Eco mode (less bright, more silent)");
 
 struct gm12u320_device {
 	struct drm_device	         dev;
-	struct drm_simple_display_pipe   pipe;
+	struct drm_plane	         plane;
+	struct drm_crtc		         crtc;
+	struct drm_encoder	         encoder;
 	struct drm_connector	         conn;
 	unsigned char                   *cmd_buf;
 	unsigned char                   *data_buf[GM12U320_BLOCK_COUNT];
@@ -102,7 +104,10 @@ struct gm12u320_device {
 	} fb_update;
 };
 
-#define to_gm12u320(__dev) container_of(__dev, struct gm12u320_device, dev)
+static inline struct gm12u320_device *to_gm12u320(struct drm_device *__dev)
+{
+	return container_of(__dev, struct gm12u320_device, dev);
+}
 
 static const char cmd_data[CMD_SIZE] = {
 	0x55, 0x53, 0x42, 0x43, 0x00, 0x00, 0x00, 0x00,
@@ -554,43 +559,106 @@ static int gm12u320_conn_init(struct gm12u320_device *gm12u320)
 }
 
 /* ------------------------------------------------------------------ */
-/* gm12u320 (simple) display pipe				      */
+/* gm12u320 display pipe					      */
 
-static void gm12u320_pipe_enable(struct drm_simple_display_pipe *pipe,
-				 struct drm_crtc_state *crtc_state,
-				 struct drm_plane_state *plane_state)
+static void gm12u320_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					       struct drm_atomic_commit *commit)
 {
 	struct drm_rect rect = { 0, 0, GM12U320_USER_WIDTH, GM12U320_HEIGHT };
-	struct gm12u320_device *gm12u320 = to_gm12u320(pipe->crtc.dev);
-	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct gm12u320_device *gm12u320 = to_gm12u320(crtc->dev);
+	struct drm_plane_state *pstate = drm_atomic_get_new_plane_state(commit, &gm12u320->plane);
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(pstate);
 
 	gm12u320->fb_update.draw_status_timeout = FIRST_FRAME_TIMEOUT;
-	gm12u320_fb_mark_dirty(plane_state->fb, &shadow_plane_state->data[0], &rect);
+	gm12u320_fb_mark_dirty(pstate->fb, &shadow_plane_state->data[0], &rect);
 }
 
-static void gm12u320_pipe_disable(struct drm_simple_display_pipe *pipe)
+static void gm12u320_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+						struct drm_atomic_commit *commit)
 {
-	struct gm12u320_device *gm12u320 = to_gm12u320(pipe->crtc.dev);
+	struct gm12u320_device *gm12u320 = to_gm12u320(crtc->dev);
 
 	gm12u320_stop_fb_update(gm12u320);
 }
 
-static void gm12u320_pipe_update(struct drm_simple_display_pipe *pipe,
-				 struct drm_plane_state *old_state)
+static void gm12u320_plane_helper_atomic_update(struct drm_plane *plane,
+						struct drm_atomic_commit *commit)
 {
-	struct drm_plane_state *state = pipe->plane.state;
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(commit, plane);
+	struct drm_plane_state *state = drm_atomic_get_new_plane_state(commit, plane);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
 	struct drm_rect rect;
 
+	if (!state->fb)
+		return;
+
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
 		gm12u320_fb_mark_dirty(state->fb, &shadow_plane_state->data[0], &rect);
 }
 
-static const struct drm_simple_display_pipe_funcs gm12u320_pipe_funcs = {
-	.enable	    = gm12u320_pipe_enable,
-	.disable    = gm12u320_pipe_disable,
-	.update	    = gm12u320_pipe_update,
-	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
+static const struct drm_plane_funcs gm12u320_plane_funcs = {
+	.update_plane	= drm_atomic_helper_update_plane,
+	.disable_plane	= drm_atomic_helper_disable_plane,
+	.destroy	= drm_plane_cleanup,
+	DRM_GEM_SHADOW_PLANE_FUNCS,
+};
+
+static int gm12u320_plane_helper_atomic_check(struct drm_plane *plane,
+					      struct drm_atomic_commit *commit)
+{
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(commit, plane);
+	struct drm_crtc_state *crtc_state = NULL;
+
+	if (plane_state->crtc) {
+		crtc_state = drm_atomic_get_crtc_state(commit, plane_state->crtc);
+		if (IS_ERR(crtc_state))
+			return PTR_ERR(crtc_state);
+	}
+
+	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   false, false);
+}
+
+static const struct drm_plane_helper_funcs gm12u320_plane_helper_funcs = {
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.atomic_check	= gm12u320_plane_helper_atomic_check,
+	.atomic_update	= gm12u320_plane_helper_atomic_update,
+};
+
+static int gm12u320_crtc_helper_atomic_check(struct drm_crtc *crtc,
+					     struct drm_atomic_commit *commit)
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
+static const struct drm_crtc_helper_funcs gm12u320_crtc_helper_funcs = {
+	.atomic_check	= gm12u320_crtc_helper_atomic_check,
+	.atomic_enable	= gm12u320_crtc_helper_atomic_enable,
+	.atomic_disable	= gm12u320_crtc_helper_atomic_disable,
+};
+
+static const struct drm_crtc_funcs gm12u320_crtc_funcs = {
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+};
+
+static const struct drm_encoder_funcs gm12u320_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
 };
 
 static const uint32_t gm12u320_pipe_formats[] = {
@@ -677,13 +745,29 @@ static int gm12u320_usb_probe(struct usb_interface *interface,
 	if (ret)
 		return ret;
 
-	ret = drm_simple_display_pipe_init(&gm12u320->dev,
-					   &gm12u320->pipe,
-					   &gm12u320_pipe_funcs,
-					   gm12u320_pipe_formats,
-					   ARRAY_SIZE(gm12u320_pipe_formats),
-					   gm12u320_pipe_modifiers,
-					   &gm12u320->conn);
+	ret = drm_universal_plane_init(dev, &gm12u320->plane, 0,
+				       &gm12u320_plane_funcs,
+				       gm12u320_pipe_formats,
+				       ARRAY_SIZE(gm12u320_pipe_formats),
+				       gm12u320_pipe_modifiers,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+	drm_plane_helper_add(&gm12u320->plane, &gm12u320_plane_helper_funcs);
+
+	ret = drm_crtc_init_with_planes(dev, &gm12u320->crtc, &gm12u320->plane, NULL,
+					&gm12u320_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+	drm_crtc_helper_add(&gm12u320->crtc, &gm12u320_crtc_helper_funcs);
+
+	ret = drm_encoder_init(dev, &gm12u320->encoder, &gm12u320_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
+	gm12u320->encoder.possible_crtcs = drm_crtc_mask(&gm12u320->crtc);
+
+	ret = drm_connector_attach_encoder(&gm12u320->conn, &gm12u320->encoder);
 	if (ret)
 		return ret;
 

-- 
2.43.0

