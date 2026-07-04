Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74302C11F3
	for <imx@lists.linux.dev>; Sat,  4 Jul 2026 18:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783190000; cv=none; b=gtiYUYgUHsGlYoCudv9d3wEOhHI5CkC8QBRmmyWZgRL11tDLxVohmX4NAZERNhRqHXmV6ybqwOl53wJM/8DOThdepmTVkAHiT9hclHA2QuBP3aoP3tHktGGl+oUiULSzfUP8eI4KGwDBw7wVOaP1+u0S9MWI03iCq/iUjWNZdTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783190000; c=relaxed/simple;
	bh=r2DdGfAWLZ7vlivcGlngDUbsQreUWLRRttkb80TMXtg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r17tZkPRhS5aaul56SCw6eSbFb0FARyLJ5z+PA+mcwiRJFASLko3EJVtUJDXoJF/Y98tyAzLIiv7DA0WompkktJbtydPoK5A5O3a+qcO9SyI9FKCZIqyhNfyCFWrEAlHiPIBeNPtr/bC4TL9L44EFIYCMHT82h5Z9AWe78vwvg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=chGpCVDh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GDk2tvpi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="chGpCVDh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GDk2tvpi"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664G9IE63451806
	for <imx@lists.linux.dev>; Sat, 4 Jul 2026 18:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/kuFitKvD+N+j3LNjGp20fDGgGetUmMinD8vCRF2MSU=; b=chGpCVDhexRvJ6rr
	wnmP0f94vr8luGOm/++TME2IvEnl0eKIx55FeM3CXaEiwLRW7vXHIKtqjy4o6v06
	SAHgN+sR0Jj96ZfmMzcgh335WxtjOsMExrklcuQvZl0uYzFXYR3+G1qMf7iQJMSH
	wgjWX8QkGys5zg3B0KSZEaLe+bq/Tq1HzMGUDBzrixKO/XaeUaogKOUhmMN/5fE/
	Bo4+ixv+GyB7BhGd3crg1HcJOQ2aynBeUQUP5g/YAQXiZVkBVQpbEnRJF5Z03g49
	fz0f/Vv79d7TcM4jozs0CKmd2kiry+IbhZSW0rpic/qx3/3xor4rojO9WILwcw0Y
	/TyXkw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4ssfvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sat, 04 Jul 2026 18:33:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-847ac21582cso1690559b3a.2
        for <imx@lists.linux.dev>; Sat, 04 Jul 2026 11:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783189997; x=1783794797; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/kuFitKvD+N+j3LNjGp20fDGgGetUmMinD8vCRF2MSU=;
        b=GDk2tvpi0vF/BSncKGsZc2ULFy2TI0TdzHHwYlNZ9Zz9BfMd/mUyTiZal31Hy5Gcjo
         J2YWXOIq0JZb4z79OvJoa005NthwLHNZQa/XN7DZ8a0F2xDY5mtVHpfxtxMOSmfr3NcX
         cdhHmR6S94iPEUMnVhQLyovTOBI0LCUDWLIQIt1ltgPVLxtthpjYeYKFcsiNXjYSKKzW
         uPJCxKUmRYex9B7gHYK1YIOg+xrMsmz0RTkOh6PQAoJvld0tg4ca8jwN6e0yn/hTWiss
         7UK4USknYbDDWv4rT1ZA/3/VI5Y26oh/cG8swAiHKescXsrnGz1sjtR55Bjk86UEIMxB
         B/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783189997; x=1783794797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/kuFitKvD+N+j3LNjGp20fDGgGetUmMinD8vCRF2MSU=;
        b=OkzJpS3KLobTSXJw3oF2dDxVCb18wVe6jTm/3SLdocasurnYZwMjHSTIVxu5XfS/Nq
         gNcoMa902BkPeo5Sxah17pFgNoqNIv6dEEGhxno1zt5BGUauQdHLWp2aBjW8uFbUIy35
         l+76idXDikAEJufJ3IRLTRPSPA3apjhaQydQURDbVfIWjZYIGYh8u6wsoyuEWUlhc2+H
         m1RR2L4ZOwGl81x7olSqhVuQ+4F3QL8GkVrFq4uDbvJpWm57iXaecPy059nEyF2zyQhu
         BLZVvN+sMjgMBl9h99eav4fhnLx4fvswiAxH0SLiwwqA8407bjgn45AU7z68m/ja1p9m
         gVeQ==
X-Forwarded-Encrypted: i=1; AHgh+RooD+B1jLkYCW0e3wV2oAEU3TSNAnwCTFDemzG8lew/WVvnBfZBnlKYSfpMBUVa9ExGjiU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNtPsiWg/I9H6jG5TPh5n1tDLsZC9OXAW+3rPQIyXkgc6eDhbO
	yXvIDqYuV62qNAa5ayfCxcOUvh7z/ALcPv2m5kMabzy14YLJYpp8r/MsScqI9FZkkiApz9gEr/3
	uStq25JB1T6Qo0timwUnF7Lwil5W2WqIwLUYCWk2C5ysT8+B7xaqVXjc=
X-Gm-Gg: AfdE7clsn0G1lmtQvqg7ct5NYe6HgoRceeXpgMNHZt5esIMAqPoG65mgrf2NcUTaKt0
	XLuIobRNPejBbm9MTcF8VclEOav9DhG6YJa727PRuFAh2lGkTdzq1i4g+0lADmZc7YPiQorrsfr
	mYNyhPxUH0DNQBxrbafHSpZfwQBdPq4vI3vSrzSxFGRUDKqkNH0ox1u+R1tLuHgkW75SI9Q17Ax
	vLbUs0Dsf9lVG+PRJNFl+kftGm8na8u4DNmw0bGzub6cEO9FMqI+ut/SbQEMCYp0i17VHPgqHTV
	0cDMCfSLpCQQQnxf8BxB/LVz2eQgzaW+EPHYEvlpdgZPdeg1ohJPUnTXuDRI/I//XXHSb+2QN45
	dhzFhvXNWrtzhBCDLVLJYW8k=
X-Received: by 2002:a05:6a00:b481:b0:846:2f3d:6275 with SMTP id d2e1a72fcca58-847f6fd61e8mr3673899b3a.58.1783189996848;
        Sat, 04 Jul 2026 11:33:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:b481:b0:846:2f3d:6275 with SMTP id d2e1a72fcca58-847f6fd61e8mr3673864b3a.58.1783189996356;
        Sat, 04 Jul 2026 11:33:16 -0700 (PDT)
Received: from [192.168.1.100] ([151.243.38.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b6057dsm1508437b3a.7.2026.07.04.11.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 11:33:15 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 02:31:15 +0800
Subject: [PATCH 6/9] drm/gm12u320: replace struct drm_simple_display_pipe
 with regular atomic helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-drm-simple-kms-removal-v1-6-b4e1ca053623@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783189912; l=7466;
 i=ze.huang@oss.qualcomm.com; s=20260704; h=from:subject:message-id;
 bh=r2DdGfAWLZ7vlivcGlngDUbsQreUWLRRttkb80TMXtg=;
 b=ZpiamN8SsvzwHpSl4AWbZvzEzxMPS4b0qx+XHy2MamxT7sudsnCfhp6cfZmSMvpCePwkCMiIy
 rN1rIEme/zqBMPX9TVQFYz/cgOxWF7zd0K0T0G1rbbrGY1RY1W5avTu
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=pSsISLZF2ubEjJRmslsa6Ps4W3yAuPY7yaircQTlQQU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfX4EBVrA0h1bhm
 WIcKRZS42QsT1XRykZJPrNyVH7jJfgjIoSiVo+nJyg87TGnq9RYLfjQrJp/ezV5c1pHlJe8YwCL
 KBEj5VzSR/4pTIJ7mTZnCO2d5W3cgNw=
X-Proofpoint-ORIG-GUID: Nx8y1suakaS6LdYeslZgN37g58I-LsAl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfX8VGmfIC9rhsb
 KKXBkjL1FdBkiVLoY/UJlqNpKGm3L8vFqeRWTvqAcuOHknDqpEqPTT7s6N+fTzzfm5WJsMA5gYG
 691suoIeDGZQSC2DoC9HRDpRB6F/x54Q3vM0dZunt9Egr82Z+44ONCi0i/r2cZHIeLWDxN4Wya6
 AvDTpseaYLeBzbqTqhBIrc9krIaTXGYdjWwzsWeuTRNtjGFJhdoZkLwjTtJl9YcQAFnS1iahOp6
 eLYx7+AEWXSiIZgW9XbYknWrbNjDVwXTnj93mnwNp+pIGJ4GySgmeTH8XYUXSV/LUHHFEZOGsw6
 /bFLXcEjT+cvRZ1jWP5eQAJMyAtMF8s50pwmJhdzWTc2t95v+pXVYIkYpu8abWN4wJWChuUBFHp
 4Eus3y7izWHVeza1+WdmgK18NwGbNQf2gqVIbtaHWO7nsdzMxNHtKT0v/WTSRCkB4tD6S3WItC5
 w4Wnz602gyUeMUKSBoA==
X-Proofpoint-GUID: Nx8y1suakaS6LdYeslZgN37g58I-LsAl
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4951ed cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=g95SU4BBbiomblFqym4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040192

Convert gm12u320 to direct primary plane, CRTC and encoder setup.

Keep shadow-plane helper state, framebuffer access helpers and
no-scaling plane-state check from simple-KMS path.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/tiny/gm12u320.c | 128 ++++++++++++++++++++++++++++++++--------
 1 file changed, 104 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index d73dfebb4353..992160ea794d 100644
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
@@ -554,31 +556,33 @@ static int gm12u320_conn_init(struct gm12u320_device *gm12u320)
 }
 
 /* ------------------------------------------------------------------ */
-/* gm12u320 (simple) display pipe				      */
+/* gm12u320 display pipe						      */
 
-static void gm12u320_pipe_enable(struct drm_simple_display_pipe *pipe,
-				 struct drm_crtc_state *crtc_state,
-				 struct drm_plane_state *plane_state)
+static void gm12u320_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					       struct drm_atomic_commit *commit)
 {
 	struct drm_rect rect = { 0, 0, GM12U320_USER_WIDTH, GM12U320_HEIGHT };
-	struct gm12u320_device *gm12u320 = to_gm12u320(pipe->crtc.dev);
+	struct gm12u320_device *gm12u320 = to_gm12u320(crtc->dev);
+	struct drm_plane_state *plane_state = crtc->primary->state;
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
+	struct drm_plane_state *state = plane->state;
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
 	struct drm_rect rect;
 
@@ -586,11 +590,71 @@ static void gm12u320_pipe_update(struct drm_simple_display_pipe *pipe,
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
+					      struct drm_atomic_commit *state)
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
+static const struct drm_plane_helper_funcs gm12u320_plane_helper_funcs = {
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.atomic_check	= gm12u320_plane_helper_atomic_check,
+	.atomic_update	= gm12u320_plane_helper_atomic_update,
+};
+
+static int gm12u320_crtc_helper_atomic_check(struct drm_crtc *crtc,
+					     struct drm_atomic_commit *state)
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
@@ -677,13 +741,29 @@ static int gm12u320_usb_probe(struct usb_interface *interface,
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
2.55.0

