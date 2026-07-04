Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EAE288C30
	for <imx@lists.linux.dev>; Sat,  4 Jul 2026 18:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783189974; cv=none; b=kSHcKtGNmgs/8i4MrKPVHw2fufYGn2eUyV/Sw/GmSj/8+Zf2g7SwQNG1+8/e/uHdCfD0AsaMYM6N3YfWGwKFd3aSS3iW3vllFFXU+vYUtiZb8Zb99XXrV7VKneS+/okrDfxqEIiThOAsXIRY3GR8rZ2Ygo7/MCt6yq+V3ikAbhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783189974; c=relaxed/simple;
	bh=suiX1hb7hxWElnQ47l4ZCuVeZgtDba91LFdURswfwJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TNUkPiUy9AxRiDOR/L6dMavQeOUrI1Mf5c1bw31TCST6jUGqeG+QFdHUoiL4zcFMJDFFtriCA3gO1pEeHZgagclkiaC2MvgyHvjnMc76Exth3EyIu3ntrZ8NJqyi+28xFPqdQ0vK49+BHXpkWHAAuUcelxAHRK/zezuRQVW2M6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qrwax7K6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KNijMDt5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qrwax7K6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KNijMDt5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664GA28U3436618
	for <imx@lists.linux.dev>; Sat, 4 Jul 2026 18:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rk9PzaJeJ1EubyHB5y8nJAfHMdVNPP8w0v4lujL2p6c=; b=Qrwax7K6YbrhBQ+0
	pw5YoGjmckdXdtTMrOJifM6TUsW9/L+f3162b/N7ycpx8Q6K05ntOpb20DTDXR35
	y24nTN2BxtwosIAeooPcsvkonEW+KBecNEd9EQYag7gtQ+5oAcJ5brHcHpzyycEP
	Du7bAu+Nm0Xq9MHCBdrk2v/5ROHjYYd/hD/W33tUwjtZ8ttZ73urgo2S9lEOX4Lv
	JzEs62tCpLl8TUZi/j3noo29PbSvnuu4LuxHyuD5vc4oxbsnYaZUo43jiaR7FWB2
	Evjgh7EzPNUfD//h5eFX9KkBxFZbusLStDX4U6M6fIz1gBY/7o9K1/qVkZ+crZRm
	TgA2LQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6srvhdjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sat, 04 Jul 2026 18:32:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8479b7c3adbso2479660b3a.3
        for <imx@lists.linux.dev>; Sat, 04 Jul 2026 11:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783189969; x=1783794769; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rk9PzaJeJ1EubyHB5y8nJAfHMdVNPP8w0v4lujL2p6c=;
        b=KNijMDt5Q7pdXoI4G0MaRAqXso2TEkDPb1Hh7KEVsRdY8H7kvPFYJB+qLZgEvWW2WE
         AfuHZyZAL1dn6LpMLfBvELe2pxdm6KgmLbRvMaNTGD4j2puTCm1NnWnOP7739Kz3ekrw
         3Ho/jXKubmds6TbAdRCpax5Wt9xdD6VvRdVtiS1ISoFFBRKbzNUCb9kW8JhM4b2vxpP9
         ZVzw9CSpexTfBl3yAWjY9KGksDOdY4isZEK/Qdbqe7++GuxYjtap/Q70DKJlSAsXQvKh
         qx5fxQvQ5SzDC6Iwt75IRwoYZ5CoCqn2OB+mAQprZtFO1Kp9MJoomJHYi++bwA5tORqt
         oJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783189969; x=1783794769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rk9PzaJeJ1EubyHB5y8nJAfHMdVNPP8w0v4lujL2p6c=;
        b=htK1BRbKkS48vZYOVohNBpUc9Oq7fFcC68LUNIzUNWsHfFTDFWWuGnxPiCbPPAIOJ3
         4N22sWpCJIsb6JDhAlbw+llPPuh8p3fiPrhOTTDwxwtJfzNUyT/PQExPbOO/UjtLNE3d
         vJAKymR+9Lr5jx9pPNkdFQFTYG1tw/9b2k2vB3B7tG1TlN23YJrJassHpFowjwPt/vRK
         HhGi5FQpZUgE/c+95NnaHpk8pQ67pm1mMxp434NFjlCTfAKI1dm2oOkllZfi3KTBHnJ9
         sBlWEd5/jRLEWAyueeYbqvUdt/7IfW5xu3RiOxyvi1aN7IKPWpgHh4CXlZpKqUE/1DKY
         mHkw==
X-Forwarded-Encrypted: i=1; AHgh+RpvUEQGFDHu5uhXb5OLriBKzZF8/Y4qL8PZBX0lyDD0LPGEBRPU6rvGo1X/gF3tvHfJavk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlqCtbZ7GiXuTjGu+d+SH3Lv7LwPGqrh3gEU8jQnbw0cgZXn/o
	Vg6veXpxytMhKGLF6luvnR5OwDGr2nJXUQjKpPOa3eiD/D5rcIzkHAHmHYJnZfyUeD98cnL3Kl2
	/6VciCy+LQeUQcIQE5zSTyMngVY1xeYKxN/PecDwF8nJrUle+DG/jf/4=
X-Gm-Gg: AfdE7clqToQY3tDrBl8G5h7NhKA9ZGHAdVd3GmLTlPsBAu9lhk1am81dO+DiLoe8/ak
	0uP4faRoodrZ11G5KLrm4EDmxQJ60rruLPl7sTaylKwlVrI/77zlzCVJFivJDQnH5R9jIVbwRAe
	S/nGE4fN4N9DsTKymNvBKRguL5EZYUKPPh+m05gXbUCTu/+85vjkJxWMx+tCZpKDOrvFgrHbKIt
	IkgLg6xC9SP8mXaC5bh9aHuUgBEehwnVCkdhS3t2G8TpkumG8HK4vBAb5o8smtQk7BmFUX8g50Z
	DqGoJIT2lMSNbTGFDZIYFwVMBajslXG9j9mwQJ/b4IfzjySs8NV6CLzO7R8ID/6hx49S/IUIdng
	PDIDnhdtAeat1jWnchcybsAQ=
X-Received: by 2002:a05:6a00:22c7:b0:845:48be:b046 with SMTP id d2e1a72fcca58-847f6f1025fmr3763179b3a.36.1783189969404;
        Sat, 04 Jul 2026 11:32:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:22c7:b0:845:48be:b046 with SMTP id d2e1a72fcca58-847f6f1025fmr3763155b3a.36.1783189968830;
        Sat, 04 Jul 2026 11:32:48 -0700 (PDT)
Received: from [192.168.1.100] ([151.243.38.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b6057dsm1508437b3a.7.2026.07.04.11.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 11:32:47 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 02:31:11 +0800
Subject: [PATCH 2/9] drm/aspeed: replace struct drm_simple_display_pipe
 with regular atomic helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-drm-simple-kms-removal-v1-2-b4e1ca053623@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783189912; l=10745;
 i=ze.huang@oss.qualcomm.com; s=20260704; h=from:subject:message-id;
 bh=suiX1hb7hxWElnQ47l4ZCuVeZgtDba91LFdURswfwJM=;
 b=5HcbGp99V2Yint2Jmx7p8cBU7PhrqcJUqaDUpsMgk9Dpg7lpIs6PwliMmRMT1Cqd+Ytp1FY6y
 1+s74fAS33WArqXbTG0K/2A23KDYGxAhQXpnwL68qGMAyrr2jzcMy3Z
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=pSsISLZF2ubEjJRmslsa6Ps4W3yAuPY7yaircQTlQQU=
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a4951d2 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=QAKNwy68QAf-n9tFDZYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: i1-O65jYNpGQKBriDXrTs-w0Elo0_6at
X-Proofpoint-GUID: i1-O65jYNpGQKBriDXrTs-w0Elo0_6at
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfX+9kAHvE91/LN
 Cktl9+YDzA5KY0WTOXokvR6k64sqLddQkomjq35l1Pzsu0zIHxTM5e50pUmKzkllwiUeOU6dJLj
 kyb1Gj4WTuZFr1z5lZHetQMZUi4Ebco8O4g6l+PwYMw3Brw8TuhhwjHkGocAo7ryEBz71t5zsse
 LjrcJYnatIDsaDeXiQf1JUtMhqMgApJsGSh0moBPJkhPS2Kxbi9Z18pCRdW0M+GouwGbZ/G+PRo
 pbd/SxnlWP/7Kkv/BxcptKoPDp1hgydiUCNcSN6ub5RJp/bB/CrtWAodWzjFIMGBSwlaxcR96nb
 fUBl3B9zlHtU/irJTjFujmf+n2LAjVD3WoyvTQpEfrQP4cXWcSPn/cgaRqFY4Fncqtl4hOCiTxD
 PDAenYjDHsuM35+xfIQ91CoMoe2uNoFrHmL20teLkP5AD6j7E+hWHFA7kKOAQbE0BIlmRAwics+
 EHNXMI0Y7LBOJu4pxhA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfXw1pCicepgJ54
 hbCUm6RB0aGUR3T1tiJfkR05jU9obHnCH6fZcI1p4VkZmJDW7JaqJS37U0BxDBgN1HkCa1GYc1r
 3qJ++GYB/eGAPiJV3hFq46h+2WSde5g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040192

Replace simple display pipe with explicit plane, CRTC and encoder
objects. Move callbacks to plane and CRTC helpers, with vblank handling
through drm_crtc_funcs.

This removes intermediate simple-pipe layer and uses standard atomic
helper wiring.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/aspeed/aspeed_gfx.h      |   5 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 156 +++++++++++++++++++++++--------
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  |   3 +-
 3 files changed, 123 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx.h b/drivers/gpu/drm/aspeed/aspeed_gfx.h
index 4e6a442c3886..a34811564c0d 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx.h
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx.h
@@ -2,7 +2,6 @@
 /* Copyright 2018 IBM Corporation */
 
 #include <drm/drm_device.h>
-#include <drm/drm_simple_kms_helper.h>
 
 struct aspeed_gfx {
 	struct drm_device		drm;
@@ -17,7 +16,9 @@ struct aspeed_gfx {
 	u32				throd_val;
 	u32				scan_line_max;
 
-	struct drm_simple_display_pipe	pipe;
+	struct drm_plane		plane;
+	struct drm_crtc			crtc;
+	struct drm_encoder		encoder;
 	struct drm_connector		connector;
 };
 #define to_aspeed_gfx(x) container_of(x, struct aspeed_gfx, drm)
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
index 7877a57b8e26..3294795c31c4 100644
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
@@ -12,20 +14,13 @@
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
 	const u32 format = crtc->primary->state->fb->format->format;
 	u32 ctrl1;
@@ -79,7 +74,7 @@ static void aspeed_gfx_disable_controller(struct aspeed_gfx *priv)
 
 static void aspeed_gfx_crtc_mode_set_nofb(struct aspeed_gfx *priv)
 {
-	struct drm_display_mode *m = &priv->pipe.crtc.state->adjusted_mode;
+	struct drm_display_mode *m = &priv->crtc.state->adjusted_mode;
 	u32 ctrl1, d_offset, t_count, bpp;
 	int err;
 
@@ -139,33 +134,31 @@ static void aspeed_gfx_crtc_mode_set_nofb(struct aspeed_gfx *priv)
 	writel(priv->throd_val, priv->base + CRT_THROD);
 }
 
-static void aspeed_gfx_pipe_enable(struct drm_simple_display_pipe *pipe,
-			      struct drm_crtc_state *crtc_state,
-			      struct drm_plane_state *plane_state)
+static void aspeed_gfx_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+						 struct drm_atomic_commit *state)
 {
-	struct aspeed_gfx *priv = drm_pipe_to_aspeed_gfx(pipe);
-	struct drm_crtc *crtc = &pipe->crtc;
+	struct aspeed_gfx *priv = container_of(crtc, struct aspeed_gfx, crtc);
 
 	aspeed_gfx_crtc_mode_set_nofb(priv);
 	aspeed_gfx_enable_controller(priv);
 	drm_crtc_vblank_on(crtc);
 }
 
-static void aspeed_gfx_pipe_disable(struct drm_simple_display_pipe *pipe)
+static void aspeed_gfx_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+						  struct drm_atomic_commit *state)
 {
-	struct aspeed_gfx *priv = drm_pipe_to_aspeed_gfx(pipe);
-	struct drm_crtc *crtc = &pipe->crtc;
+	struct aspeed_gfx *priv = container_of(crtc, struct aspeed_gfx, crtc);
 
 	drm_crtc_vblank_off(crtc);
 	aspeed_gfx_disable_controller(priv);
 }
 
-static void aspeed_gfx_pipe_update(struct drm_simple_display_pipe *pipe,
-				   struct drm_plane_state *plane_state)
+static void aspeed_gfx_plane_helper_atomic_update(struct drm_plane *plane,
+						  struct drm_atomic_commit *state)
 {
-	struct aspeed_gfx *priv = drm_pipe_to_aspeed_gfx(pipe);
-	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_framebuffer *fb = pipe->plane.state->fb;
+	struct aspeed_gfx *priv = container_of(plane, struct aspeed_gfx, plane);
+	struct drm_crtc *crtc = &priv->crtc;
+	struct drm_framebuffer *fb = plane->state->fb;
 	struct drm_pending_vblank_event *event;
 	struct drm_gem_dma_object *gem;
 
@@ -190,9 +183,9 @@ static void aspeed_gfx_pipe_update(struct drm_simple_display_pipe *pipe,
 	writel(gem->dma_addr, priv->base + CRT_ADDR);
 }
 
-static int aspeed_gfx_enable_vblank(struct drm_simple_display_pipe *pipe)
+static int aspeed_gfx_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct aspeed_gfx *priv = drm_pipe_to_aspeed_gfx(pipe);
+	struct aspeed_gfx *priv = container_of(crtc, struct aspeed_gfx, crtc);
 	u32 reg = readl(priv->base + CRT_CTRL1);
 
 	/* Clear pending VBLANK IRQ */
@@ -204,9 +197,9 @@ static int aspeed_gfx_enable_vblank(struct drm_simple_display_pipe *pipe)
 	return 0;
 }
 
-static void aspeed_gfx_disable_vblank(struct drm_simple_display_pipe *pipe)
+static void aspeed_gfx_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct aspeed_gfx *priv = drm_pipe_to_aspeed_gfx(pipe);
+	struct aspeed_gfx *priv = container_of(crtc, struct aspeed_gfx, crtc);
 	u32 reg = readl(priv->base + CRT_CTRL1);
 
 	reg &= ~CRT_CTRL_VERTICAL_INTR_EN;
@@ -216,12 +209,75 @@ static void aspeed_gfx_disable_vblank(struct drm_simple_display_pipe *pipe)
 	writel(reg | CRT_CTRL_VERTICAL_INTR_STS, priv->base + CRT_CTRL1);
 }
 
-static const struct drm_simple_display_pipe_funcs aspeed_gfx_funcs = {
-	.enable		= aspeed_gfx_pipe_enable,
-	.disable	= aspeed_gfx_pipe_disable,
-	.update		= aspeed_gfx_pipe_update,
-	.enable_vblank	= aspeed_gfx_enable_vblank,
-	.disable_vblank	= aspeed_gfx_disable_vblank,
+static int aspeed_gfx_plane_helper_atomic_check(struct drm_plane *plane,
+						struct drm_atomic_commit *state)
+{
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
+	return ret;
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
+					       struct drm_atomic_commit *state)
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
+static const struct drm_crtc_helper_funcs aspeed_gfx_crtc_helper_funcs = {
+	.atomic_check	= aspeed_gfx_crtc_helper_atomic_check,
+	.atomic_enable	= aspeed_gfx_crtc_helper_atomic_enable,
+	.atomic_disable	= aspeed_gfx_crtc_helper_atomic_disable,
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
@@ -232,10 +288,36 @@ static const uint32_t aspeed_gfx_formats[] = {
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
2.55.0

