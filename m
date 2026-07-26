Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7792DB7AE
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 19:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785095165; cv=none; b=h1k7xjPxZCR3vPlp43aD5z+4DPs3HgZ80q4f9sP3NOyE4zxxRlNHh9gT2uK/boq34yE2DZL4TdXcu3ZIOmKHvphjFs36BSaBqGaQIweXlwn5N5pBfJ+sD6Z6oMqEvGpyB9KuaxbfLP1SI8bDLPWTMaj6HPPIx5amLUHiNUB+XzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785095165; c=relaxed/simple;
	bh=cG5eqORbwgLjytGSt4bgAB7iRWGJSRJOK/O7QjULDRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qw1F6lx77V+hgzT8F+OEdXYjMvO0ByeApIDO+4KlykSCbSZFtdokhTK6N1sk5TCkjlptzpg/TeVcu1TR7Ev0YkpnpIxiZMp/3BHrkXdBJ8l/fKK0hZH5gBwAngrooMH8ER944Vb4xCRK0Sw2YFEtK4d5tfiNbo0M3wOdo90yisk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O82oYMAC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZT+cP7ab; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O82oYMAC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZT+cP7ab"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH6tmk720943
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 19:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SZXoBChzns6xQdNb4HgZdv4bepAswU/wjM3061XMqlo=; b=O82oYMACwKC0mT9h
	woXRMDLyHeliuxVcUGvUxVvOwEsT6m+/ZqnHT01/XQUDRllrdyST0RVM6BgSdgTb
	3WNWchYfO+bqEH6TdtwTt268lP1N7ns6aiASsHgdzdNujircUG2vLpayIV9Qjek7
	+HGxn/BRlmAEXoqWaHW3sR9Oq62wnupkx68EYs7xvm8X88W1Wzgj0xC/VIsovHzK
	nkUtYsZIKzR+zT3PxPPxvK+LvaLg5e8ar29lnKgKMI9AUdGC5TbSfyHvbSAzUzNb
	JbjO6jMgdRCaVCPbaNi5/Juwd/jQGbDJ2O0Gm5rJEsV8rsJUyLm8gwqM/B/KSUR9
	7Cgd6w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmpajkcjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 19:46:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbf293831so5054973a91.3
        for <imx@lists.linux.dev>; Sun, 26 Jul 2026 12:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785095162; x=1785699962; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SZXoBChzns6xQdNb4HgZdv4bepAswU/wjM3061XMqlo=;
        b=ZT+cP7abeCE9mvirypldMWqQqp91AdnnC1DW+G2tWBDzxsMmyZYfbbHwn7pP9YheXW
         f2THwW46SuabqVsctzqKxRTKR5PiCAnkPeiy/Lo5eQpnPrlyzUiGrXgopS1DXp3982Zg
         /XUVxrYObbfoocCLwl5O5b/FGj47cjoBSl19Frmb+B68TNYShPM8k2ZK+q8KrQ8bEhIK
         cP5D6+6AkUvVTA1yezjxa8JWBMF0UHh+JDzpUQah1rR5oWEXLv9XM69rbD9jmjIb6OZt
         cd7+X0pgSO0El1FizUfzZh8L+/445AuoVAaBwm13a5IUu91Wj92mi1TR5lkaAhle95JE
         wfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785095162; x=1785699962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SZXoBChzns6xQdNb4HgZdv4bepAswU/wjM3061XMqlo=;
        b=meIPab6OCh0Z82+02S1Rgp3OETxKxA1d0IZl9v6Q0Kp9dyHY/tU1Ig5rTpN/aRZ2mx
         WfeGvIYY99S16WeB8aOAuYfXzPB964Qr6+10Jn7egOVbUBH2hNay1DcGstJwfz+WpI41
         JdCUi9Ja2MSx8kim3oCW91xqFI04p2lU7Yx6DQCyVTp73KH+Wc1SZMjRM/hkGj4S4U8c
         wpWEfjo4xzW0VdZHibz8nVA6sWU5iEa+f5y0DVXuJXHO3ypReBuqX49nb2GRcpWvA6OT
         VRJHx8QohHkArHyGU8zSRU+8jL4hQPIecmyo2+t7BrpZz6tIDeA9yfBtvkI3KESvJxzU
         +WbQ==
X-Forwarded-Encrypted: i=1; AHgh+RpBmEafUPgsqQGAJ8gv9hOuiM3a+AdacIAszPGjGXWyiSLDxPDJhoEJdkaO7qqiMALhbIQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMMDXJhSKSE3vg7wpIPHj9MXO5hNpL9TckjSCgbK2Duk0X4+Cw
	O4NcQdXhETK/vHxH+iBmtXMx2HopqmFdCGWxPyL3RspWEXJAt+UYsvFuHFjDtALQt6KLlQkjuIL
	2lxJ/Ah/CWQPCFAKTgf1Y9wvLlXjC+/syJXn7n7Yk9KjWpzHo+hI53hk=
X-Gm-Gg: AR+sD12CBZbUrbQAQBq1cnOvnXnUXJx3ZWwB7QGFNAcuO+lrFuJ2Yd+zSgxsNemIFFH
	nflVKUojtMX7kA9vDdYDcHUgFKAadkqY48gQ/cKR/NmvFTpxKMLtM7TU1oLtRRU8OYt5KBxM9xe
	2XmYPdElHZupEQYpeJ8BKxqdiC41eacptR2WSwUXWw2ik+ZuCxVKqlOwiyzX3kj2wE6WEQ0l+aV
	VZx4fPTkBHnDIVJMtPcuG0jAXC9XluJvhJAhvrlnGAWOrEfoptCwB7K+z5gOOjDWmwcg9NpXsks
	6H2Su5xNbcRt5EuvUmc9H0aTGJ37cfXWEy3sOCEO7G363etvFcevr8rsh6+2Z6/IqjS6opnXmT9
	j5LLP2IN5SjBdCl4HceDd
X-Received: by 2002:a17:90b:2604:b0:37f:9ce1:cda8 with SMTP id 98e67ed59e1d1-38f297802c7mr5136043a91.30.1785095161858;
        Sun, 26 Jul 2026 12:46:01 -0700 (PDT)
X-Received: by 2002:a17:90b:2604:b0:37f:9ce1:cda8 with SMTP id 98e67ed59e1d1-38f297802c7mr5136018a91.30.1785095161243;
        Sun, 26 Jul 2026 12:46:01 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0eaa8sm4105998a91.8.2026.07.26.12.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 12:46:00 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 03:45:16 +0800
Subject: [PATCH v3 3/8] drm/mcde: replace struct drm_simple_display_pipe
 with regular atomic helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-drm-simple-kms-removal-v3-3-cd5dc89858c6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785095128; l=15608;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=cG5eqORbwgLjytGSt4bgAB7iRWGJSRJOK/O7QjULDRQ=;
 b=dUv1z+8IsrXCEJL6IHnCBSpQNODfXvTKqNt5CIq2WKVnxYyxmosBGI+eSjoRCN3YWUn8RIHt+
 hGEPH0SXwp+CbxHEcC0emaV04jGmPMLiA/haus+5DmswysajzWCM2NM
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Proofpoint-ORIG-GUID: Nc_wOLVs1CZ6-Y3Rc6Hd94Pdw6V0xKRE
X-Authority-Analysis: v=2.4 cv=A8Bc+aWG c=1 sm=1 tr=0 ts=6a6663fa cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=CXBmYrQIWaHMVGb9AFMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Nc_wOLVs1CZ6-Y3Rc6Hd94Pdw6V0xKRE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfX/bk6ISCncZ9/
 MOc9R77VrOxHWlvxlY+2j7kLzDR2rCn61gcQwk8pT5c1PpFJt+Yi7Ng60DHXfq3LB2W+aEP35C/
 CkTILv0mjS5LHFW9afa+lg41DXSy8t3n7YU1GoTxXYLi99gZrLyN2GnACEJwVSXyaOEjZDD6IRL
 N6WZ0NGmejlB3hrkC7vNBDD8kbuB3dCxU0H5cTbbNyHZUqhesQO7oek4i8j8RHjlAXX7M3VD44V
 sTLd6OBYrz0qz6TQWE9wAOoW0T/DpSEayozt9FZ96vltskiNrQjxIsY3ew4hVY9048l13Cm6RwB
 fltHFQzgaOicnnZAwPoT96gG7Y0+wuNtd/M68i3Z2NDfvVLVjalgY3IB+5x60TTWqqdwXp6chL1
 iwvk6lQ0q1GwvKbt63P6zhmFkih45JUGnlREsk4wNh8w7rpl5nQg/QcRnvq6dzwKsZ95YJA5Dl3
 /cUTCu8Gc6bpmddHTpw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfXwIpQjAsFMdpb
 lH5MTTP0JMYZtRz9DaI9FalJf3MVIxTL03kRvwFi32pAKVnfWldTdzjsXW4pchL0gYUxb6vBgvs
 psrt50B29g8bpquTm66voSS89LumPZM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260200

Convert MCDE to explicit plane, CRTC and encoder objects.

Handle pending page-flip events from the CRTC atomic flush path using the
commit-local CRTC state, and avoid manual connector/encoder attachment
before the connector has been created by the bridge path.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>

---
Changes in v3:
- Move the one-shot flow start to CRTC atomic_flush(), after pending event
  handling.
- Move the MCDE container helper to the header as static inline.
---
 drivers/gpu/drm/mcde/mcde_display.c | 248 +++++++++++++++++++++++-------------
 drivers/gpu/drm/mcde/mcde_drm.h     |  12 +-
 drivers/gpu/drm/mcde/mcde_drv.c     |   3 +-
 3 files changed, 172 insertions(+), 91 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index 257a6e84dd58..50c90cf84a9a 100644
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
@@ -157,40 +157,59 @@ void mcde_display_disable_irqs(struct mcde *mcde)
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
+	struct drm_crtc_state *cstate = NULL;
+	const struct drm_display_mode *mode;
+	struct drm_framebuffer *old_fb = old_pstate->fb;
 	struct drm_framebuffer *fb = pstate->fb;
+	int ret;
 
-	if (fb) {
-		u32 offset = drm_fb_dma_get_gem_addr(fb, pstate, 0);
+	if (pstate->crtc) {
+		cstate = drm_atomic_get_crtc_state(commit, pstate->crtc);
+		if (IS_ERR(cstate))
+			return PTR_ERR(cstate);
+	}
 
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
 	}
 
+	/*
+	 * There's no pitch register, the mode's hdisplay
+	 * controls this.
+	 */
+	if (fb->pitches[0] != mode->hdisplay * fb->format->cpp[0]) {
+		DRM_DEBUG_KMS("can't handle pitches\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * We can't change the FB format in a flicker-free
+	 * manner (and only update it during CRTC enable).
+	 */
+	if (old_fb && old_fb->format != fb->format)
+		cstate->mode_changed = true;
+
 	return 0;
 }
 
@@ -1149,16 +1168,15 @@ static void mcde_setup_dsi(struct mcde *mcde, const struct drm_display_mode *mod
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
@@ -1298,9 +1316,10 @@ static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
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
@@ -1318,9 +1337,9 @@ static void mcde_display_disable(struct drm_simple_display_pipe *pipe)
 		mcde_dsi_disable(mcde->bridge);
 	}
 
-	event = crtc->state->event;
+	event = cstate->event;
 	if (event) {
-		crtc->state->event = NULL;
+		cstate->event = NULL;
 
 		spin_lock_irq(&crtc->dev->event_lock);
 		drm_crtc_send_vblank_event(crtc, event);
@@ -1381,24 +1400,46 @@ static void mcde_set_extsrc(struct mcde *mcde, u32 buffer_address)
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
 
+	/*
+	 * We do not start sending framebuffer updates before the
+	 * display is enabled. Update events will however be dispatched
+	 * from the DRM core before the display is enabled.
+	 */
+	if (fb) {
+		mcde_set_extsrc(mcde, drm_fb_dma_get_gem_addr(fb, pstate, 0));
+		dev_info_once(mcde->dev, "first update of display contents\n");
+	} else {
+		/*
+		 * If an update is receieved before the MCDE is enabled
+		 * (before mcde_display_enable() is called) we can't really
+		 * do much with that buffer.
+		 */
+		dev_info(mcde->dev, "ignored a display update\n");
+	}
+}
+
+static void mcde_crtc_helper_atomic_flush(struct drm_crtc *crtc,
+					  struct drm_atomic_commit *commit)
+{
+	struct mcde *mcde = to_mcde(crtc->dev);
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(commit, &mcde->plane);
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(commit, crtc);
+	struct drm_pending_vblank_event *event = crtc_state->event;
+
 	/*
 	 * Handle any pending event first, we need to arm the vblank
 	 * interrupt before sending any update to the display so we don't
 	 * miss the interrupt.
 	 */
 	if (event) {
-		crtc->state->event = NULL;
+		crtc_state->event = NULL;
 
 		spin_lock_irq(&crtc->dev->event_lock);
 		/*
@@ -1408,7 +1449,7 @@ static void mcde_display_update(struct drm_simple_display_pipe *pipe,
 		 * until we get an update. If MCDE output isn't yet enabled,
 		 * we just send a vblank dummy event back.
 		 */
-		if (crtc->state->active && drm_crtc_vblank_get(crtc) == 0) {
+		if (crtc_state->active && drm_crtc_vblank_get(crtc) == 0) {
 			dev_dbg(mcde->dev, "arm vblank event\n");
 			drm_crtc_arm_vblank_event(crtc, event);
 		} else {
@@ -1419,33 +1460,12 @@ static void mcde_display_update(struct drm_simple_display_pipe *pipe,
 		spin_unlock_irq(&crtc->dev->event_lock);
 	}
 
-	/*
-	 * We do not start sending framebuffer updates before the
-	 * display is enabled. Update events will however be dispatched
-	 * from the DRM core before the display is enabled.
-	 */
-	if (fb) {
-		mcde_set_extsrc(mcde, drm_fb_dma_get_gem_addr(fb, pstate, 0));
-		dev_info_once(mcde->dev, "first update of display contents\n");
-		/*
-		 * Usually the flow is already active, unless we are in
-		 * oneshot mode, then we need to kick the flow right here.
-		 */
-		if (mcde->flow_active == 0)
-			mcde_start_flow(mcde);
-	} else {
-		/*
-		 * If an update is receieved before the MCDE is enabled
-		 * (before mcde_display_enable() is called) we can't really
-		 * do much with that buffer.
-		 */
-		dev_info(mcde->dev, "ignored a display update\n");
-	}
+	if (crtc_state->active && plane_state && plane_state->fb && mcde->flow_active == 0)
+		mcde_start_flow(mcde);
 }
 
-static int mcde_display_enable_vblank(struct drm_simple_display_pipe *pipe)
+static int mcde_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_device *drm = crtc->dev;
 	struct mcde *mcde = to_mcde(drm);
 	u32 val;
@@ -1462,9 +1482,8 @@ static int mcde_display_enable_vblank(struct drm_simple_display_pipe *pipe)
 	return 0;
 }
 
-static void mcde_display_disable_vblank(struct drm_simple_display_pipe *pipe)
+static void mcde_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_device *drm = crtc->dev;
 	struct mcde *mcde = to_mcde(drm);
 
@@ -1474,13 +1493,55 @@ static void mcde_display_disable_vblank(struct drm_simple_display_pipe *pipe)
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
@@ -1510,14 +1571,29 @@ int mcde_display_init(struct drm_device *drm)
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
 	if (ret)
 		return ret;
 
+	drm_crtc_helper_add(&mcde->crtc, &mcde_crtc_helper_funcs);
+
+	ret = drm_encoder_init(drm, &mcde->encoder, &mcde_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
+
+	mcde->encoder.possible_crtcs = drm_crtc_mask(&mcde->crtc);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mcde_display_init);
diff --git a/drivers/gpu/drm/mcde/mcde_drm.h b/drivers/gpu/drm/mcde/mcde_drm.h
index ecb70b4b737c..edbb4580a7d8 100644
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
@@ -95,7 +97,11 @@ struct mcde {
 	struct regulator *vana;
 };
 
-#define to_mcde(dev) container_of(dev, struct mcde, drm)
+static inline struct mcde *to_mcde(struct drm_device *dev)
+{
+	return container_of(dev, struct mcde, drm);
+}
+
 
 static inline bool mcde_flow_is_video(struct mcde *mcde)
 {
diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 5f2c462bad7e..401cf8ab83bc 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -186,8 +186,7 @@ static int mcde_modeset_init(struct drm_device *drm)
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

