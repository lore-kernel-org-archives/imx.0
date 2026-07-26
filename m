Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A536350A18
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 19:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785095188; cv=none; b=M59z0aRurd7IaN0fmBhrAiK+GJ0HDyg2nsv+ZOTCqi0ND3rOtZDali16U4yw3q6Q466mVZtpVgF+0WYbUzCXRKX8wk62DTCovDcWuE/ka608X51Fp96Z3YqpNz9khLD2uWymHBj0270DJdG7FWk05KDbg92KmvLdYwOGHDjotbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785095188; c=relaxed/simple;
	bh=AAx34gAM0g1XJvks56BpyKPpL86hNGfHkaqmTZ6w6/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mVcm/E7LiXNm8f5iSid9Y2GnZj6sqOsY1O0rL0j0CEIYjdIqYdgK4tnsq9aQ1Q6H1x41VmbuVvdik4Fog8rq1M3hOIq5GlpaqLttovNhvcaoZiG7Ms/XvOB6o3FSabrLnqIrxYtJCyj06p6tXc5+/nergS32+Sn9T4rvMt9PJQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JFD2x2i6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bCHFQsHo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JFD2x2i6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bCHFQsHo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH80DY1421194
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 19:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qYw7YOevf7R1VaLGJE434uj9XUAJ+efhiT66MYE6HgA=; b=JFD2x2i6i050fq5c
	bDN7bgFtTZ7Sfm5SqUnqFm5eluW8Vk6cS3DMjgDr6v9VexxI+t0aU4tSBtrcAvT7
	I/lyXA43IaigZbmeOXdLWxxGDY9+DlgVAjoGjG+ObeQ71Y69u+RPqFXcUWZACs5d
	c28BQkTmfH5Y82NI96ySJY/gycW7qY2IkWbtJyvXyYN2+cYzvFFY4Ctmw+cn4o5h
	0vPoCRRSR9dkSFYNJLGTKliq5XHgo9Z6fNUAVxOzNPxuIHtTJAoSNL7353yWnify
	EzhMbvNba5KKY0r7lV7Ta4kUeMp5Fw3+4oUSiBQY9VPmf6gsV9dVj7v/URc5Zoe1
	UVJbkA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm573ss5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 19:46:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-388cfc4848dso2828946a91.3
        for <imx@lists.linux.dev>; Sun, 26 Jul 2026 12:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785095185; x=1785699985; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qYw7YOevf7R1VaLGJE434uj9XUAJ+efhiT66MYE6HgA=;
        b=bCHFQsHoJRv+f30FRY9JDYth7UBblQBjhPcMvRQuS+evTBziEFcbDG7+4+77YU0VOC
         Zx5QUTUAndzymnwMEEQAMdZp0ocZ1hMDfaQzJ77BQbR6UmmH8qN7siHOKI0vv5Lzf5oJ
         K7zdVSsudj89SXPk0m+oHObqS1lf4hNFNwlm6jSSKfisDm6TKY2hA4ENz8PjoiBVR3DK
         Z1ONU/vx3j2fpMXjKvBopIM9p6RoBJS8UCsMLZY6pt3SSG/CyK+gTrNSOXJaaP5h5AWW
         S1hGfYfg1F3BJd92OcXrgVSx3l4DTcfL/4tHBvNyvSLcxageDAlfXbd6l8Pd2qMrlfQ6
         9LYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785095185; x=1785699985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qYw7YOevf7R1VaLGJE434uj9XUAJ+efhiT66MYE6HgA=;
        b=FXHYmCezp2nMM18JzOTowlaZTX3M7ULv1xMfhPols6DxUWu6juyj+OjRNnT0H+NRMU
         hHyiC1+Qk0DXG2Kvd3YMu+pCWSiddgLaqudCCypJ79aLYiNlg/24slEfsjSPYWBXrvsa
         I4gcsI+040pZ5ziVCALnUQ8d6DpqgpIeFhnl9tEejVZ7qfXmbcQvXOZxmYNaWVbYmDWK
         MsAgwWyljU3ohp9ThXYtsOBnAZ6aaFpYVSx563JBfMd3XrqmAm80GDOlZ+yj4nizAvZm
         Qi9Xra0yp9KXk59EW3qAzISkKyMPgR/UZdPhAmWrmZLtv3haYursfnRGIWL17ZcKe0Ns
         zzZw==
X-Forwarded-Encrypted: i=1; AHgh+Rplqb1AbOP8OFlqLyXvwROktm+6z1zYeIMpOtKLBeQR2xvoKa9IB7x0Rid0XiWIEEA3gh8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzE3TUl7na/uu/hH4UP3Yxp6d4RErJgSuKG9pKOeL9eIo3jwyQ9
	XL9ZKcu58mRPZ3k6ZOUDRD0XCNYN2dF2urWauCJXOugQZuSbj9+TV6LjvD3fXqaU8yMLMChhrzA
	z90jqgiqq9L4ZTD60gI/rupK1kd3wjRp9IxSazx5hyFUSlMVu0LCN1Do=
X-Gm-Gg: AR+sD12ibsGxIkiNZhu/lVMSDXNaowKGR0taI5ZAQ+vn2Muv9n5iS90vI4hBC6deFYw
	DQD4oDPoGHHxqZrlRfHRUGQl/tJTHeKKBvTFM73E9AOs3h713+a2Mg9Wo5GQ5yF4E7QO5tTvpQQ
	/sQ99nvHNDrTDKx1W22gQOnoQsv+4mtWx7wDNFCTKAv7WDtTRxxBuBfKIlNl8xrvgv7P3qL24ad
	mYZYwwJyjWQsHgfkraPITEAlMuHBgzNEZzGWAow02mJkehqlsXhuFoyOtDwRUmmlO3XF+RA+FK/
	YaoFzBMVXo6P5lPujCb0r14oT7QbKS9vi8oj3b9Lm9aJYS4qlpIGHcbJXOCV4C/ZXS1uzvNJVu0
	AGqjvEk4cGoCn3oL/LhuU
X-Received: by 2002:a17:90b:2642:b0:38f:1e1a:5141 with SMTP id 98e67ed59e1d1-38f29620a7emr6222267a91.28.1785095184882;
        Sun, 26 Jul 2026 12:46:24 -0700 (PDT)
X-Received: by 2002:a17:90b:2642:b0:38f:1e1a:5141 with SMTP id 98e67ed59e1d1-38f29620a7emr6222251a91.28.1785095184441;
        Sun, 26 Jul 2026 12:46:24 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0eaa8sm4105998a91.8.2026.07.26.12.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 12:46:23 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 03:45:19 +0800
Subject: [PATCH v3 6/8] drm/repaper: replace struct drm_simple_display_pipe
 with regular atomic helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-drm-simple-kms-removal-v3-6-cd5dc89858c6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785095129; l=8123;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=AAx34gAM0g1XJvks56BpyKPpL86hNGfHkaqmTZ6w6/0=;
 b=0wLxQLCaGBQoh2NRb3mNAmGNnyaRnCPadbrAOaKKC67gUQV3goDlvM9OKxsAyvDatXtean6lJ
 GxRtATgRjlEC7duzu8UWemNPnKENa4bCZTwGGNjQcIYvTf3lN+2t4jy
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfX/P63o4bVlE9c
 MySmBDIc22i1ODFwWkUREkhRHi8KXl1QlWepF1y58/nt6VLdX7ZPyNE5BOmXwvUunoS436bDdsD
 1j24Xqf7yu/nZ+qm8Kcz52oDmZtzPm8=
X-Proofpoint-GUID: YZLEMYMCdlyS86aRsvATPThlxbpRPXhp
X-Authority-Analysis: v=2.4 cv=FOErAeos c=1 sm=1 tr=0 ts=6a666412 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=pkK3EMrqy3vWcbFnmDwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: YZLEMYMCdlyS86aRsvATPThlxbpRPXhp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfXyR1qIDIxytko
 I62mU4mE2xCj+jV9KWdGPTezoRW0r1N5yQRqH/fXEWPPbbw9GcEj01UXVrnb3y0KICvzZLLvbsD
 n6ctygFXz8LdhwWepBw2RiTfUgAHfjxAT3sOF4c3KaGWudSBQCMUY3K8O9g6ypQL2FzXUI6VQ28
 6OVmQV+WSwCWoQPwGTqacHsWqiyUE9tXSYydhOurkuKWT6QdScoNAaZ7uX3C5chvfH9Eoz6C5V4
 SpuUgrHn4zLyA8mAz1yG9RaCFmaaHZYVpUtWWDclQTQ3MInzxuNdcWIW5ugUaSPHxHKJBhoG7KT
 yYW+Ap5ql/e+ThSCy7lIiYKYbRbWxWJwUw+72CV5VOf79knx+IkUsxP67vabQaD1JBi2uIwX1Vj
 PRycSzC5nU3P0mxj5cvD4JyhTXN8FUDnMVPuR0Y4QSv5oTZgg/EAwPqikhAIBaxv7rF60dpHlcH
 IMkyl5sOLFzGk0uFDqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260200

Convert repaper to explicit primary plane, CRTC and encoder objects.

Keep the shadow-plane helpers, framebuffer access handling and
no-scaling plane-state validation from the simple-KMS path.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>

---
Changes in v3:
- Skip damage updates unless the CRTC state exists and is active.
---
 drivers/gpu/drm/tiny/repaper.c | 138 ++++++++++++++++++++++++++++++++---------
 1 file changed, 110 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index c8270591afc7..f225e38fd404 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -22,6 +22,7 @@
 #include <linux/thermal.h>
 
 #include <drm/clients/drm_client_setup.h>
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_damage_helper.h>
@@ -38,7 +39,6 @@
 #include <drm/drm_rect.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #define REPAPER_RID_G2_COG_ID	0x12
 
@@ -65,7 +65,9 @@ enum repaper_epd_border_byte {
 
 struct repaper_epd {
 	struct drm_device drm;
-	struct drm_simple_display_pipe pipe;
+	struct drm_plane plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
 	const struct drm_display_mode *mode;
 	struct drm_connector connector;
 	struct spi_device *spi;
@@ -622,26 +624,24 @@ static void power_off(struct repaper_epd *epd)
 	gpiod_set_value_cansleep(epd->discharge, 0);
 }
 
-static enum drm_mode_status repaper_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
-						    const struct drm_display_mode *mode)
+static enum drm_mode_status repaper_crtc_helper_mode_valid(struct drm_crtc *crtc,
+							   const struct drm_display_mode *mode)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct repaper_epd *epd = drm_to_epd(crtc->dev);
 
 	return drm_crtc_helper_mode_valid_fixed(crtc, mode, epd->mode);
 }
 
-static void repaper_pipe_enable(struct drm_simple_display_pipe *pipe,
-				struct drm_crtc_state *crtc_state,
-				struct drm_plane_state *plane_state)
+static void repaper_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					      struct drm_atomic_commit *commit)
 {
-	struct repaper_epd *epd = drm_to_epd(pipe->crtc.dev);
+	struct repaper_epd *epd = drm_to_epd(crtc->dev);
 	struct spi_device *spi = epd->spi;
 	struct device *dev = &spi->dev;
 	bool dc_ok = false;
 	int i, ret, idx;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(crtc->dev, &idx))
 		return;
 
 	DRM_DEBUG_DRIVER("\n");
@@ -771,9 +771,10 @@ static void repaper_pipe_enable(struct drm_simple_display_pipe *pipe,
 	drm_dev_exit(idx);
 }
 
-static void repaper_pipe_disable(struct drm_simple_display_pipe *pipe)
+static void repaper_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					       struct drm_atomic_commit *commit)
 {
-	struct repaper_epd *epd = drm_to_epd(pipe->crtc.dev);
+	struct repaper_epd *epd = drm_to_epd(crtc->dev);
 	struct spi_device *spi = epd->spi;
 	unsigned int line;
 
@@ -827,27 +828,90 @@ static void repaper_pipe_disable(struct drm_simple_display_pipe *pipe)
 	power_off(epd);
 }
 
-static void repaper_pipe_update(struct drm_simple_display_pipe *pipe,
-				struct drm_plane_state *old_state)
+static void repaper_plane_helper_atomic_update(struct drm_plane *plane,
+					       struct drm_atomic_commit *commit)
 {
-	struct drm_plane_state *state = pipe->plane.state;
-	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
+	struct drm_plane_state *old_pstate = drm_atomic_get_old_plane_state(commit, plane);
+	struct drm_plane_state *pstate = drm_atomic_get_new_plane_state(commit, plane);
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(pstate);
+	struct drm_crtc_state *cstate = NULL;
 	struct drm_rect rect;
 
-	if (!pipe->crtc.state->active)
+	if (pstate->crtc)
+		cstate = drm_atomic_get_new_crtc_state(commit, pstate->crtc);
+
+	if (!cstate || !cstate->active)
 		return;
 
-	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
-		repaper_fb_dirty(state->fb, shadow_plane_state->data,
+	if (drm_atomic_helper_damage_merged(old_pstate, pstate, &rect))
+		repaper_fb_dirty(pstate->fb, shadow_plane_state->data,
 				 &shadow_plane_state->fmtcnv_state);
 }
 
-static const struct drm_simple_display_pipe_funcs repaper_pipe_funcs = {
-	.mode_valid = repaper_pipe_mode_valid,
-	.enable = repaper_pipe_enable,
-	.disable = repaper_pipe_disable,
-	.update = repaper_pipe_update,
-	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
+static const struct drm_plane_funcs repaper_plane_funcs = {
+	.update_plane	= drm_atomic_helper_update_plane,
+	.disable_plane	= drm_atomic_helper_disable_plane,
+	.destroy	= drm_plane_cleanup,
+	DRM_GEM_SHADOW_PLANE_FUNCS,
+};
+
+static int repaper_plane_helper_atomic_check(struct drm_plane *plane,
+					     struct drm_atomic_commit *commit)
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
+static const struct drm_plane_helper_funcs repaper_plane_helper_funcs = {
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.atomic_check	= repaper_plane_helper_atomic_check,
+	.atomic_update	= repaper_plane_helper_atomic_update,
+};
+
+static int repaper_crtc_helper_atomic_check(struct drm_crtc *crtc,
+					    struct drm_atomic_commit *commit)
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
+static const struct drm_crtc_helper_funcs repaper_crtc_helper_funcs = {
+	.mode_valid	= repaper_crtc_helper_mode_valid,
+	.atomic_check	= repaper_crtc_helper_atomic_check,
+	.atomic_enable	= repaper_crtc_helper_atomic_enable,
+	.atomic_disable	= repaper_crtc_helper_atomic_disable,
+};
+
+static const struct drm_crtc_funcs repaper_crtc_funcs = {
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+};
+
+static const struct drm_encoder_funcs repaper_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
 };
 
 static int repaper_connector_get_modes(struct drm_connector *connector)
@@ -1102,9 +1166,27 @@ static int repaper_probe(struct spi_device *spi)
 	if (ret)
 		return ret;
 
-	ret = drm_simple_display_pipe_init(drm, &epd->pipe, &repaper_pipe_funcs,
-					   repaper_formats, ARRAY_SIZE(repaper_formats),
-					   NULL, &epd->connector);
+	ret = drm_universal_plane_init(drm, &epd->plane, 0,
+				       &repaper_plane_funcs,
+				       repaper_formats, ARRAY_SIZE(repaper_formats),
+				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+	drm_plane_helper_add(&epd->plane, &repaper_plane_helper_funcs);
+
+	ret = drm_crtc_init_with_planes(drm, &epd->crtc, &epd->plane, NULL,
+					&repaper_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+	drm_crtc_helper_add(&epd->crtc, &repaper_crtc_helper_funcs);
+
+	ret = drm_encoder_init(drm, &epd->encoder, &repaper_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
+	epd->encoder.possible_crtcs = drm_crtc_mask(&epd->crtc);
+
+	ret = drm_connector_attach_encoder(&epd->connector, &epd->encoder);
 	if (ret)
 		return ret;
 

-- 
2.43.0

