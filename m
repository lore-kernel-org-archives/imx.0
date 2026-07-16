Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD30348C7D
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 09:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192616; cv=none; b=dkiVqdIhyHDmfxEUy6fxtqi+QEcV8TCdBpw9Bddq129HDjynCR6h02tr+3h9F4ucDjZ6upTV4k3oNoZiV5GDZGmjtLsTaAh6sZroDRVtAtMDUnNFnrBccGGdNbBPWdSdNVTu3NE/1S7hLqdhk5zLbAkw7Bki67xzKlGm1XT2Mow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192616; c=relaxed/simple;
	bh=clrd2wPCUImRmnt9dUsqbH/TK0mbxMgUhxeWagkxE+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CtSN/y7LLo0N3xufF2QPdNS8qAnTDU33CgQneTbh1vxJam7aGN4ouWzvDf2NFnse6/BK+Mq7j48m6w9Y7kVPAtuRciUOfwfeE7tne2r37pYuJSEY0wUAUdUDEAZ3Zq+reSqzxNq2f5II8muBlQdNKbxI4ZIXvj4NYEkwi9artKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FXVHZpAG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hiXwEicK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FXVHZpAG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hiXwEicK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7DXsG3122441
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 09:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MeSqLazRYgr33B487FeWpWmBWUCKqNkEYXob2j87zRQ=; b=FXVHZpAGJedoRTh8
	n3RpC40OMzwvSPs0hVWwrGEzYyj8qIUe/ElinbQoYVKUsjih/3bJr0JspEfwiHkT
	Hv/bd0/PKRu0B/lwGk43bnVxZ/sfaN/AkKfYjGhdDh+NH6EgBvQXIjRt/ihZNyEW
	CwM7Yw1OwPFp7rmw44bTwGXrmfddtvT/X6D+PRlQHfbk8X18hGykq59dMxKQjHif
	PVH8MGdgMNItGElve/sqSJW2uUH7S6OEIcwfZfDvhvtGQAf2JJynU6mT4tiMyb1U
	/kl3+u71Qlb7J5NdtCaWqSVRb5DG0q0y07ik4skRubojZqf8kd5kJd51wT3oVoKL
	yNwKmQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feq3ph748-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 09:03:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c354050c34so106207535ad.3
        for <imx@lists.linux.dev>; Thu, 16 Jul 2026 02:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784192604; x=1784797404; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MeSqLazRYgr33B487FeWpWmBWUCKqNkEYXob2j87zRQ=;
        b=hiXwEicK633PzZiXvV3wkoUSzGkEKyhWGX96XjNLCe67WWHLfTcjRS2CKzpbGLu+Hw
         5v9oQhlwxWMMCGCOuOLrHUMY91XYUcrjomAtjA98A3DDzkvubS6xiGVXl0cfx9TrqFGl
         KFUZc9CQ2o41m5GG2Fp+ZwazPbKY0wiIvxiiWxwtZ4QSgs3PUCy9pVwukXzESRtefiOW
         27NRbclhsiTMMi0Ux5aiHV7Jyy5NDCT123sQOpAKx9PWHeOGNyTkOIFLgygFVaoOuGXR
         TngJivBkkhSZWI695nTxNwnz7oiybJY2jCnWbchubLfgzSYpxNygN4MxHfm80iQnu03F
         EuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192604; x=1784797404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MeSqLazRYgr33B487FeWpWmBWUCKqNkEYXob2j87zRQ=;
        b=JWx4fdXVvCZ/AkXsoykUN/wX+muofDukkVuOrILpmS7Ge0PGBvjoYr5Q/fcxYxUZ2k
         pO2lgpzIqnFkEP8G8tFn9F8n3hHrvUaRzvDFRmDfZIYe8nAYqJZJVmXVQ8HOo85s5a8+
         Wbb0DKY9k+a6sLxLoeCe+95VSpmcx/zujZjAgV2qEb6CSp1igyrImig6ox8epczGM3t+
         tOUzJMXp6tvvLL0cuerXT4KhZoqQm3kQX/1JEN1EbXlgSaVKp7MvHghCDBKaVcJzbiOK
         VEHvJI6BBnZVoKJ/e9zkoD2hB50w1qw1tVKtNH6Ruq6hzD4t6MJWX5kfFLsETrEAIRQc
         YMyg==
X-Forwarded-Encrypted: i=1; AHgh+Rq7pFwzYpWFGUbm+F78193NnEyFnxmqwzOJdSxuaTba45TEGe3Vnj3LCnhh5AdEDwiQ114=@lists.linux.dev
X-Gm-Message-State: AOJu0YwjPaC2hT31k5ib0ig4yPZc/X0R7qePw+f3O2ltI8l6fqpJqnfa
	LX2V4Bob1kthQ2/h/RhIz5trX8gG/RpdA5hbuEWClQTjp+fvdHWN9967wzEpfXf+RCgho743rU4
	rFynjRuifX/Ph1jtdrDCGKJupowA/0iXCeUZYe1dB3HvJdnsxYNXarbwH9WpovL8G+Q==
X-Gm-Gg: AfdE7clNzKpTKnQ4Rw3GY59oFIERc3z7w/+Bg5RrFh9bcWHX5T9WhDcLbH3NwdpKpVN
	6dkxe1rWdh2FnYpqu8FJX4RiOsi6CdmxWNJtQBpcjELpLpH0GYw1VPAa1glxQ4wzheFuywL4Huh
	g5kXesstakZotZgcFPYGsNgblohXo2eb1PwMYXW5g0SqsQdC1KPLr8klJgv7jkUTz+S+4XASkZ6
	PbR0MdyslXi9Tl+ESAtQIKv+jA44IHwmzpW4UVAVFrEpGJxrC0J0i/TBXqfuxm5ThjqmEleBr+2
	BB3/gVVd5Tv3/2eiPOR4Xb65pBE9EwW60N6iZmoUrZ1fSRicm6mZA7Ma0yBTIip/TuYOoiqTbBk
	WvNVjWqreWVAT3xx3LOZI
X-Received: by 2002:a17:902:ecc4:b0:2ca:b8d:e65e with SMTP id d9443c01a7336-2cf03dc62b5mr62673145ad.37.1784192604103;
        Thu, 16 Jul 2026 02:03:24 -0700 (PDT)
X-Received: by 2002:a17:902:ecc4:b0:2ca:b8d:e65e with SMTP id d9443c01a7336-2cf03dc62b5mr62672665ad.37.1784192603523;
        Thu, 16 Jul 2026 02:03:23 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf106b271asm16592555ad.64.2026.07.16.02.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:03:23 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 17:01:57 +0800
Subject: [PATCH v2 5/8] drm/gm12u320: replace struct
 drm_simple_display_pipe with regular atomic helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-drm-simple-kms-removal-v2-5-1133a8fc3785@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784192560; l=7964;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=clrd2wPCUImRmnt9dUsqbH/TK0mbxMgUhxeWagkxE+4=;
 b=0oRyaLEkb6eanKq6iqSl6wa+hGMmW3tOf5ZzNUvdnQ1H3jNsbTzi9cLXyJD2dE3oAeyIW6luo
 TPO40xg3wNsAgnlI+cgNB4ljxIOqwV95/AiRUDhwKVkGVCOsCip/o0W
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Proofpoint-ORIG-GUID: UgEnTVk1EK7TLsUqeJd25-t4QG7drRGU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfX+Dd2fSjnxC/E
 looFJaa/hb/tvlwPh+dK/vOiW2FO2k3h+1kYXl3RFS/83IcwGBrs/WSAP2TGlE6C8+I7l9j2nb7
 Q+UxYd+wVsPSPbgoVEo8ac3I5xKtD24=
X-Proofpoint-GUID: UgEnTVk1EK7TLsUqeJd25-t4QG7drRGU
X-Authority-Analysis: v=2.4 cv=PN8/P/qC c=1 sm=1 tr=0 ts=6a589e5c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=g95SU4BBbiomblFqym4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfX2R73zFKtDsuL
 DI+5CGTGmxPhPgudnScxO6vWmSY+4Kwk0kZoScogtspWqr1kF/rjWJBT4EL6YmT6d4RnDiQWoEQ
 VbzfYWImgqVzzW8Pn1d+y84fsq/O7E+tg8w+pgZlccvfKEfy+94HnISXMxkmpkXqtzoABinGXCc
 QlYCZHPvTSfT2f7B4tljItKB3lZfPe3eZHdE3c0/SVOj36snCGQioSImyBIAjEQ4blZ7lozKQro
 F1k1/6mBRJVTSrFZR8Au88AwtSwSNFtu2OBRotkrMB8aLGY6UaMEuLa/wetLQj6ybuMFdo1PLmH
 VLgfWEFfGGLD9GcJrysa2IeBEBaRFChcrHnMOdoMq1+vL3HdEYaZ6HLQbuT/8lxeMD0TIxXGlp3
 pKX0hTJox9ZikiyA/H4miYAdAKVKd2i6Px3C91D8kzJ500H6uTHQctZoaBn+T9kZIjyHFJEfkGx
 plrR+d4Swf6SFslNSOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160091

Convert gm12u320 to direct primary plane, CRTC and encoder setup.

Keep shadow-plane helper state, framebuffer access helpers and
no-scaling plane-state check from simple-KMS path.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/tiny/gm12u320.c | 132 ++++++++++++++++++++++++++++++++--------
 1 file changed, 107 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index d73dfebb4353..df60968856e5 100644
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
+static struct gm12u320_device *to_gm12u320(struct drm_device *__dev)
+{
+	return container_of(__dev, struct gm12u320_device, dev);
+}
 
 static const char cmd_data[CMD_SIZE] = {
 	0x55, 0x53, 0x42, 0x43, 0x00, 0x00, 0x00, 0x00,
@@ -554,43 +559,104 @@ static int gm12u320_conn_init(struct gm12u320_device *gm12u320)
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
+	struct gm12u320_device *gm12u320 = to_gm12u320(crtc->dev);
+	struct drm_plane_state *plane_state = gm12u320->plane.state;
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 
 	gm12u320->fb_update.draw_status_timeout = FIRST_FRAME_TIMEOUT;
 	gm12u320_fb_mark_dirty(plane_state->fb, &shadow_plane_state->data[0], &rect);
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
@@ -677,13 +743,29 @@ static int gm12u320_usb_probe(struct usb_interface *interface,
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

