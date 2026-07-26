Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3732F39B9
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 19:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785095204; cv=none; b=oevA+lbewShV9Uancy+f8rCS0sB2m2xwo54/fOAPWWl67KtFd9jyWIxe5e0SRMP3ig4FADWbxs5QsLaHlSg47prcFXEZMRqXm0/wQdkXqadbtVD8P9JCTi4uCps9mRiWinp9Ij+uRFCM0KHmHuShKCMt5yMCVePLEHM+JnfE9lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785095204; c=relaxed/simple;
	bh=PBi4kPXC6bDPKtTGd5qKGiDifkO/iF7Wup738qwpRwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LL3QDTo1xjeK9y4QTeYZ+A63TPHagu52VWYWSEIVhIhrxHVzw7aPw1KNEfb5Xg6lL7PSfUuf13mspmYqXcgQ8SMD5E9/zxuJ9r/q6Tu9hy49FRtNctjrQGov6ZBLKyrAJCdDiEHS1v27jVdZqsQl+ab6PnQoB6Zb9jHRlw2PsO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KhyqLUah; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b0CzJCR5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KhyqLUah";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b0CzJCR5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH831A1337091
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 19:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wSGeQRwMP4eO9GjmSugudIPnkFmlYP4r8d4tXRAJ/XE=; b=KhyqLUahopd1K+8F
	/i7o6UN4Zy4pvwoukMXxUan1QmeEdB8UIb9Ks8LzYVawYUykG71n98l1/g4JQihk
	zsAB4zh6e/2qkEhaZ/XIaXpbmeevlQ/9AwssdwfNZfZTL8xE70i1bgSpzqNSvVGA
	HEiC9jox5mGm/z3/nHocm7ymikNfv3bMB+nzN9oQLceFfKRH5WE7KehG9KoAucVV
	X1A+rbGBCf2dwZFDvi1gJ8iTE2R/KtK/KrgnYxMpDPG11DrG5ZE0e0pnGcKAJLoL
	yykF0vrX80gwHl2keJetGHSUKwpA2Nfe6p6KfuBq/xXj8lQc2k4WfhcDE+U7jxlR
	7+79yw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmn7vbjsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 19:46:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so41124585ad.1
        for <imx@lists.linux.dev>; Sun, 26 Jul 2026 12:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785095201; x=1785700001; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wSGeQRwMP4eO9GjmSugudIPnkFmlYP4r8d4tXRAJ/XE=;
        b=b0CzJCR5DVYjIL6S33OsvebK+OWW4TP9A3LKFR2g6wWL98KYiwLZKGTS//lOjiwca4
         tPpauuG6Ju4iApweyIpBvstbjrOnLTSWkHocF3B58ybD6DcNMbqAKqIYjzdWWEWajEYn
         modfjQb3DA3TqDYn7100EwhdkXnGzthtMOA1NEnpwfj4mPTCkhuMd7FMCIVuZbyIT9m9
         v7oP82DddEE5+HY4+hdeZC0MvbrAJ5mVMqFQSkORiSiif6dYSOl4nLuc5PpyZ1mzM2Hj
         g/LEZNwAE5WSnxAPatnA7HIVt1/TVw6umft2LWscAlndtlYVpldjTFy+4s9avTr6Q6fp
         z10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785095201; x=1785700001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wSGeQRwMP4eO9GjmSugudIPnkFmlYP4r8d4tXRAJ/XE=;
        b=j5JwpvqaB+iRLsvxzW2SxfHmPYo60dFyEsvTPhr7bLHoDramuZZe0v1WkvFdBvpDTy
         UInR4gpvq6UOGu56l+xHmywUirekKBzqnQQ8VKZzbhd85yMrVDuKtTxadREhjGhtnL7F
         KDNZ+DkaHoI6GnwvyFC5msM3bkI/wksW5xPZlEeZZ3gP0HXUesVZPiJzc6bduXE5rDik
         WErcFin2qYfO69mohIrxCDAl0No8MvlhWqrqDtYiQ9740zujFraeWIZWUcRVcAfYI91S
         aknafkijsgn+npKmWx/r77/5MG7LW/hbb7rztQYk9Ao+rTeSNMBuKYlcmsq71HpwEsip
         Rnrw==
X-Forwarded-Encrypted: i=1; AHgh+RqOHRQBudhfUCArMCt5JklrqU58x/HMknDjsM3M4a8KTFWCFCNWYsS8Zabe7+ZzF9zCXYE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxYvds/I3ZthjUNpgKgGZ3CzUwb+jdBdKH7/4mNXaSmmOW8WxJs
	nTUhyAMr1OacfmU6nvSjq9IMREsgVXw45/JRaA1+X+IV7o73e2Es7iLJ7dksGOz8wqmrSPWD8PP
	NYtS6lIh5cY6n+SKfOSK5lGpyFmUKWMl3SlHrK9BuLPrn+2hhK12Ych0=
X-Gm-Gg: AR+sD12QpAFdpStkHfO0Perq+qWPG0OUVatfd3KEWDLs+SEir34SdO47lGjTsB3hfiF
	c8KI2CDEfyIoR4bBqH8x7gP/ipQbQo/vlJKXdSFGsmYGvgIkub+okcI1AxeatGZVlh3wUn2Qo9o
	0o09dsUNUDyFhxSSJ+UEXrzOmsqbd2Q/D7lxWsx7dhUIqOMlbTqGv9UmEynUQ4vJdYShw/NlHzD
	wJHPNkinWWrtuzSoeJEtvaBRxMzDXASjsrKR2Dt9OIKq6Yag/49qVr+XKOW8Ym6ZXnc0BvbgHpO
	1ymfMG1Dp2AEGoChTxLyXXwquvwBhhjVj+SXsIiPPYGc4FsL3Akd9JLK1RrplJahI0iaQ/T4bwi
	wFNI2TuYudGN8KJFs4waA
X-Received: by 2002:a17:90b:1d44:b0:381:28e0:624d with SMTP id 98e67ed59e1d1-38f29613652mr5757542a91.28.1785095200540;
        Sun, 26 Jul 2026 12:46:40 -0700 (PDT)
X-Received: by 2002:a17:90b:1d44:b0:381:28e0:624d with SMTP id 98e67ed59e1d1-38f29613652mr5757521a91.28.1785095200078;
        Sun, 26 Jul 2026 12:46:40 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0eaa8sm4105998a91.8.2026.07.26.12.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 12:46:39 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 03:45:21 +0800
Subject: [PATCH v3 8/8] drm/xen: replace struct drm_simple_display_pipe
 with regular atomic helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-drm-simple-kms-removal-v3-8-cd5dc89858c6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785095129; l=12894;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=PBi4kPXC6bDPKtTGd5qKGiDifkO/iF7Wup738qwpRwk=;
 b=oinILOU2wbGLYnenfbXSKIYuY97ShWRNCMA98C159D9els3KvEJFV0EOtNDjwTl46s7UQU1oH
 AXM4ZR3zIj+Bsp+yxt1D7aR4Bdwl0q4QKSVjC9zIMUkDziqZf2vfXbJ
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Authority-Analysis: v=2.4 cv=GKk41ONK c=1 sm=1 tr=0 ts=6a666421 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ypIeFc3LJoL4UEiODvkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 21bpALCA9NWvaycjb7m8dpOPLZxHXWw5
X-Proofpoint-ORIG-GUID: 21bpALCA9NWvaycjb7m8dpOPLZxHXWw5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfX+s4ezsIEIxfQ
 p9NA47WaPEdkw0nHRFmcazxFc6RTc2mjN62+w7bcC2tY8I9lwhKKUPtQx7DWtVcNnqSOeMx5GVy
 wg3Ef8py/UAu7xo7EST+20/73gsgDQc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfX1w5qQMkw6LJb
 5jWCHHIRY3r4+kZCqm3T6kgoVHR0n/CpoOWBvypYWuOp0P5D+dz8ExaOU0j9rkrAVhRmrImIOQP
 2kD3JwTtzmR9y3kPdtzfAOYZ+uITpu9bD16VIVGUgZuKX9qA+GekENr71E2Dc29uk8pZ901G+Cz
 vwoq2SmPsLJ3mHOgpcVf7hhBeocGlThAW39SdkzyqP8bcZBBaxtVoz25V6poS+7nKkxdBfvMcds
 KozK1i6jAZd5jf4Efe7ureFz+qYUiPypMWoq5FiswhSmvErY+nXJHGzjq4Q91WXAsJ9ZxicghfW
 N5oQjjkD8fr6Y/c5Sw3nmXkZrrCQVBSDTOwe0ue2mseEC594mnlY6kqWYGKlHBYusIESEP9SKqU
 PbSQzuYRIAGbzfwunXgrL3QZ+srNYKIoujKXitZVgxn2PQjwdWQoyy+xCFuwAVzeydlUqeUyF7m
 bXl4pmJ8N0XDPvjooHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260200

Replace the Xen frontend simple display pipe with explicit plane, CRTC
and encoder objects for each pipeline.

Keep generic plane-state validation before Xen-specific checks, and
install the GEM framebuffer prepare helper explicitly.

Use commit-local plane state in the CRTC enable path and pass the new
plane source position to the backend mode-set request. Handle pending
page-flip events through the commit-local CRTC state in the plane update
path.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>

---
Changes in v3:
- Use commit-local plane state in the CRTC enable path.
- Pass the new plane source position to the xen_drm_front_mode_set.
- Make the container helpers static inline.
---
 drivers/gpu/drm/xen/xen_drm_front.h     |   6 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c | 188 +++++++++++++++++++++++---------
 2 files changed, 142 insertions(+), 52 deletions(-)

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
index 48772b5fe71c..9896ea35b743 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
@@ -30,10 +30,16 @@
  */
 #define FRAME_DONE_TO_MS	(XEN_DRM_FRONT_WAIT_BACK_MS + 100)
 
-static struct xen_drm_front_drm_pipeline *
-to_xen_drm_pipeline(struct drm_simple_display_pipe *pipe)
+static inline struct xen_drm_front_drm_pipeline *
+xen_drm_pipeline_from_crtc(struct drm_crtc *crtc)
 {
-	return container_of(pipe, struct xen_drm_front_drm_pipeline, pipe);
+	return container_of(crtc, struct xen_drm_front_drm_pipeline, crtc);
+}
+
+static inline struct xen_drm_front_drm_pipeline *
+xen_drm_pipeline_from_plane(struct drm_plane *plane)
+{
+	return container_of(plane, struct xen_drm_front_drm_pipeline, plane);
 }
 
 static void fb_destroy(struct drm_framebuffer *fb)
@@ -94,7 +100,7 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
 
 static void send_pending_event(struct xen_drm_front_drm_pipeline *pipeline)
 {
-	struct drm_crtc *crtc = &pipeline->pipe.crtc;
+	struct drm_crtc *crtc = &pipeline->crtc;
 	struct drm_device *dev = crtc->dev;
 	unsigned long flags;
 
@@ -105,24 +111,21 @@ static void send_pending_event(struct xen_drm_front_drm_pipeline *pipeline)
 	spin_unlock_irqrestore(&dev->event_lock, flags);
 }
 
-static void display_enable(struct drm_simple_display_pipe *pipe,
-			   struct drm_crtc_state *crtc_state,
-			   struct drm_plane_state *plane_state)
+static void xen_drm_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					      struct drm_atomic_commit *commit)
 {
-	struct xen_drm_front_drm_pipeline *pipeline =
-			to_xen_drm_pipeline(pipe);
-	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_framebuffer *fb = plane_state->fb;
+	struct xen_drm_front_drm_pipeline *pipeline = xen_drm_pipeline_from_crtc(crtc);
+	struct drm_plane_state *pstate = drm_atomic_get_new_plane_state(commit, &pipeline->plane);
+	struct drm_framebuffer *fb = pstate->fb;
 	int ret, idx;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(crtc->dev, &idx))
 		return;
 
-	ret = xen_drm_front_mode_set(pipeline, crtc->x, crtc->y,
+	ret = xen_drm_front_mode_set(pipeline, pstate->crtc_x, pstate->crtc_y,
 				     fb->width, fb->height,
 				     fb->format->cpp[0] * 8,
 				     xen_drm_front_fb_to_cookie(fb));
-
 	if (ret) {
 		DRM_ERROR("Failed to enable display: %d\n", ret);
 		pipeline->conn_connected = false;
@@ -131,13 +134,13 @@ static void display_enable(struct drm_simple_display_pipe *pipe,
 	drm_dev_exit(idx);
 }
 
-static void display_disable(struct drm_simple_display_pipe *pipe)
+static void xen_drm_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					       struct drm_atomic_commit *commit)
 {
-	struct xen_drm_front_drm_pipeline *pipeline =
-			to_xen_drm_pipeline(pipe);
+	struct xen_drm_front_drm_pipeline *pipeline = xen_drm_pipeline_from_crtc(crtc);
 	int ret = 0, idx;
 
-	if (drm_dev_enter(pipe->crtc.dev, &idx)) {
+	if (drm_dev_enter(crtc->dev, &idx)) {
 		ret = xen_drm_front_mode_set(pipeline, 0, 0, 0, 0, 0,
 					     xen_drm_front_fb_to_cookie(NULL));
 		drm_dev_exit(idx);
@@ -177,12 +180,13 @@ static void pflip_to_worker(struct work_struct *work)
 	send_pending_event(pipeline);
 }
 
-static bool display_send_page_flip(struct drm_simple_display_pipe *pipe,
+static bool display_send_page_flip(struct xen_drm_front_drm_pipeline *pipeline,
+				   struct drm_atomic_commit *commit,
 				   struct drm_plane_state *old_plane_state)
 {
 	struct drm_plane_state *plane_state =
-			drm_atomic_get_new_plane_state(old_plane_state->state,
-						       &pipe->plane);
+			drm_atomic_get_new_plane_state(commit,
+						       &pipeline->plane);
 
 	/*
 	 * If old_plane_state->fb is NULL and plane_state->fb is not,
@@ -193,8 +197,6 @@ static bool display_send_page_flip(struct drm_simple_display_pipe *pipe,
 	 * sent to the backend as a part of display_set_config call.
 	 */
 	if (old_plane_state->fb && plane_state->fb) {
-		struct xen_drm_front_drm_pipeline *pipeline =
-				to_xen_drm_pipeline(pipe);
 		struct xen_drm_front_drm_info *drm_info = pipeline->drm_info;
 		int ret;
 
@@ -224,10 +226,29 @@ static bool display_send_page_flip(struct drm_simple_display_pipe *pipe,
 	return false;
 }
 
-static int display_check(struct drm_simple_display_pipe *pipe,
-			 struct drm_plane_state *plane_state,
-			 struct drm_crtc_state *crtc_state)
+static int xen_drm_plane_helper_atomic_check(struct drm_plane *plane,
+					     struct drm_atomic_commit *commit)
 {
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(commit, plane);
+	struct drm_crtc_state *crtc_state = NULL;
+	int ret;
+
+	if (plane_state->crtc) {
+		crtc_state = drm_atomic_get_crtc_state(commit, plane_state->crtc);
+		if (IS_ERR(crtc_state))
+			return PTR_ERR(crtc_state);
+	}
+
+	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, false);
+	if (ret)
+		return ret;
+
+	if (!plane_state->visible || !crtc_state)
+		return 0;
+
 	/*
 	 * Xen doesn't initialize vblanking via drm_vblank_init(), so
 	 * DRM helpers assume that it doesn't handle vblanking and start
@@ -242,16 +263,17 @@ static int display_check(struct drm_simple_display_pipe *pipe,
 	return 0;
 }
 
-static void display_update(struct drm_simple_display_pipe *pipe,
-			   struct drm_plane_state *old_plane_state)
+static void xen_drm_plane_helper_atomic_update(struct drm_plane *plane,
+					       struct drm_atomic_commit *commit)
 {
-	struct xen_drm_front_drm_pipeline *pipeline =
-			to_xen_drm_pipeline(pipe);
-	struct drm_crtc *crtc = &pipe->crtc;
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(commit, plane);
+	struct xen_drm_front_drm_pipeline *pipeline = xen_drm_pipeline_from_plane(plane);
+	struct drm_crtc *crtc = &pipeline->crtc;
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(commit, crtc);
 	struct drm_pending_vblank_event *event;
 	int idx;
 
-	event = crtc->state->event;
+	event = crtc_state ? crtc_state->event : NULL;
 	if (event) {
 		struct drm_device *dev = crtc->dev;
 		unsigned long flags;
@@ -259,13 +281,13 @@ static void display_update(struct drm_simple_display_pipe *pipe,
 		WARN_ON(pipeline->pending_event);
 
 		spin_lock_irqsave(&dev->event_lock, flags);
-		crtc->state->event = NULL;
+		crtc_state->event = NULL;
 
 		pipeline->pending_event = event;
 		spin_unlock_irqrestore(&dev->event_lock, flags);
 	}
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx)) {
+	if (!drm_dev_enter(crtc->dev, &idx)) {
 		send_pending_event(pipeline);
 		return;
 	}
@@ -278,19 +300,17 @@ static void display_update(struct drm_simple_display_pipe *pipe,
 	 * If this is not a page flip, e.g. no flip done event from the backend
 	 * is expected, then send now.
 	 */
-	if (!display_send_page_flip(pipe, old_plane_state))
+	if (!display_send_page_flip(pipeline, commit, old_plane_state))
 		send_pending_event(pipeline);
 
 	drm_dev_exit(idx);
 }
 
 static enum drm_mode_status
-display_mode_valid(struct drm_simple_display_pipe *pipe,
-		   const struct drm_display_mode *mode)
+xen_drm_crtc_helper_mode_valid(struct drm_crtc *crtc,
+			       const struct drm_display_mode *mode)
 {
-	struct xen_drm_front_drm_pipeline *pipeline =
-			container_of(pipe, struct xen_drm_front_drm_pipeline,
-				     pipe);
+	struct xen_drm_front_drm_pipeline *pipeline = xen_drm_pipeline_from_crtc(crtc);
 
 	if (mode->hdisplay != pipeline->width)
 		return MODE_ERROR;
@@ -301,12 +321,53 @@ display_mode_valid(struct drm_simple_display_pipe *pipe,
 	return MODE_OK;
 }
 
-static const struct drm_simple_display_pipe_funcs display_funcs = {
-	.mode_valid = display_mode_valid,
-	.enable = display_enable,
-	.disable = display_disable,
-	.check = display_check,
-	.update = display_update,
+static int xen_drm_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_commit *commit)
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
@@ -331,10 +392,37 @@ static int display_pipe_init(struct xen_drm_front_drm_info *drm_info,
 
 	formats = xen_drm_front_conn_get_formats(&format_count);
 
-	return drm_simple_display_pipe_init(dev, &pipeline->pipe,
-					    &display_funcs, formats,
-					    format_count, NULL,
-					    &pipeline->conn);
+	ret = drm_universal_plane_init(dev, &pipeline->plane, 0,
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
2.43.0

