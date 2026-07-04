Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FA9372B3D
	for <imx@lists.linux.dev>; Sat,  4 Jul 2026 18:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783189987; cv=none; b=WwSmdR4tqYPFyiC3gsvHBqfJl71WG7hTDCsxu2VuFc/HUlIB7uPEZsRrnNcDOc26nmfLknznFDDvHW4cyq4XtmgGbYWFPMZ357z2j+jE13Occg2eyictMs8ckfnOP2E5PGolTdo8rEzNmqMqb9QmbsFU98qm17PTO51E1yLK8H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783189987; c=relaxed/simple;
	bh=Qcol9fj3wcEepZH3ImnK7lH90wrvdzfXhAcRLociBUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OGVtBb/l83GgO+1E43YhaCB3s2caYrFKvw4/EgwtZpSqi4h26VN1boKTG7KGa7e7zZpGIS2un0RQUeZnqlp2RIUHVL1idJW4TKShiUtI+fytFU5gnWrb6n0j8cJXczcSUe4xytMAD3FrtAov7CLGz7jPpNPyBGAlfqHxEhIpPa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=piotc2Xu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZuiNd4E6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="piotc2Xu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZuiNd4E6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664G8RZa3272757
	for <imx@lists.linux.dev>; Sat, 4 Jul 2026 18:33:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eQ2wkGh9OQFPGIh6+CsATSCyNIJhVVQjedvP3yUcR8I=; b=piotc2XuZr1Bos25
	5+otg4KB3av2dGCjMnxed7l9UNU1sVMI2kUsiZRBoFsmF86yqMxA6CL0XqY4mJKJ
	uLWJ26w7JLB6hTr5Y3blAe6hFdllG5Aab+MVAsOysh3S6GhGS15NxNYaOuz0dnQJ
	htQBNF/gMJPFMGVxcqqLNF37XPK2aFHwhZSIAVMt9dTDs/ETvdinooP5J+47b0Hm
	Q9ekeu9T31+WduIFfsCcgQWiIX9OcelaDpS/L77sJM9YzYgVG060Xug0K2nH30TX
	Es+o2G8e7KL9jEKWjSOVlMEZrqiwc2DJvPfilJZMgXagYwb30oTfgLMCrpBA6syy
	Ia0rew==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6tj8haxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sat, 04 Jul 2026 18:33:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88e0d11a3fso1017468a12.0
        for <imx@lists.linux.dev>; Sat, 04 Jul 2026 11:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783189983; x=1783794783; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eQ2wkGh9OQFPGIh6+CsATSCyNIJhVVQjedvP3yUcR8I=;
        b=ZuiNd4E6cEMgxGwXoIJOMyx73/i51ZqP67KALVWV7V3WUiWGKKSnbcEevX4+p/erUV
         KiBzRH+Hwlde1560P19SWJZzr0SlYMJ7RfZKv1S0gxG6hG3agzmdjmKex5Qqj0blCJYv
         cr2gnl1dgnNQgSBdd0MvVj2+ML1fgYMZHexyPiFVZHh6uaGFzOD3eCKL9kTY3cgKlFx2
         judx71BAmszL4xIBwinnoaU829ATKjqa1qeFJWYU+TksGxmhMY/HN9IAzpvhMW38GAxc
         KXmJomw3gLytNGHhpsqxTIW4XgJFIZCJUMsv6JtgrbahwIBQ6PduxdhqOvUMi8QsYsrX
         t4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783189983; x=1783794783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eQ2wkGh9OQFPGIh6+CsATSCyNIJhVVQjedvP3yUcR8I=;
        b=U6HuryQIJfMwHpG+djjlhYrNinABYbQtLIbTUz7XaEMdxJc5i6uhPABOPeRW75ltH6
         wbStakMPwvpAq2WdxKNlqwdx24GvA/0ILEC7zU+MdBophId3bicqEtKv0Y0X8qbEA0Zt
         gAGrgMEK55NlLIPma1W3VbXoXg3i6MM3L3enguQ5EOo+30bRfmNWmEsZozrwOonBs5r4
         ZpQFa95MaIdf5/QX5G9UAOaMv0zKwYAmNf00KrhAbAvijhPOu3s4XvgMuqqiewVJwD3K
         FhH/q09zSa7opcBTtERYZ5tuGrUymbr7GujV4YaqIrplN2dyphb9Yo8l36MMJH11+gnY
         4Ssw==
X-Forwarded-Encrypted: i=1; AHgh+RpbbEWweNCR5cEusVVg124BZsHZvGkFvhnIi3Co9kNx1jiG9NyGBNe0fUG8pswAYft8Up4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRLLElnmz49d1VCGu3aA3FYVN0BrEBCweXhlZdYTl11ou0ynzl
	gbKqLtpyFWIMQSLZf3hLN0D4SsqfOC6C2GRdDrqvdabfdZTnUaZx3LHwZ4g0WmI2jy5nUmLwiv0
	F9UGy6zTksm/tTdaR4nxVImra+/9H1gqBFig7Fl8gLgIbubNAUNCbdzw=
X-Gm-Gg: AfdE7ck6Zn0DPn0msMrLk2Dc3bRuQG8syWG8Uh0qPJVKdjTGyzQY51z96qZyduDDdDf
	wKUB6ozEKq/IX3mt0/EDnt1nEdM8K1b9LZu0S/qK14zbjwKAiUooYpB9YylHk+CdwtkWna+dkFh
	8Yz3B1YoXdx8nT5jA7qgUOvFX8i0meFVIKRhwuw7NkAKeBOJiLztEb/mJ+8H0EnhroHJFS8tVZ9
	EE+wCsJIQec28s/DwJygC1UlK5XzNQxGYXi3qgoSCag48R+/l5eMyF/2Ma9Q3jFzT/Z01WfQUzB
	fknbl2S9wZU8QUT8M3YvrdyG0yhAp1w8xDHpgMfqaNXmwl4FvS3dLTYZd42YShUFFMycjEuPXZm
	cW0UYW3imwhuuwfjJBGibrFw=
X-Received: by 2002:a05:6a00:330c:b0:847:7f7a:dd18 with SMTP id d2e1a72fcca58-847f6d663f2mr3781680b3a.3.1783189982972;
        Sat, 04 Jul 2026 11:33:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:330c:b0:847:7f7a:dd18 with SMTP id d2e1a72fcca58-847f6d663f2mr3781665b3a.3.1783189982458;
        Sat, 04 Jul 2026 11:33:02 -0700 (PDT)
Received: from [192.168.1.100] ([151.243.38.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b6057dsm1508437b3a.7.2026.07.04.11.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 11:33:02 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 02:31:13 +0800
Subject: [PATCH 4/9] drm/mcde: replace struct drm_simple_display_pipe with
 regular atomic helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-drm-simple-kms-removal-v1-4-b4e1ca053623@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783189912; l=10718;
 i=ze.huang@oss.qualcomm.com; s=20260704; h=from:subject:message-id;
 bh=Qcol9fj3wcEepZH3ImnK7lH90wrvdzfXhAcRLociBUs=;
 b=Mx6Ue7MKCfC0JMWj0BrhEUBH/ynLrlUW5+zwyXd6XNRIoOn78c9YTfhlfyKIIkBbAjhKd8rqo
 rj42P/bhNkcBIPjnFtFAre0a4wkLVPMpB+ZD6+uq3vfaTAz3vXXq5qV
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=pSsISLZF2ubEjJRmslsa6Ps4W3yAuPY7yaircQTlQQU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfX7Qhg5SOREhBC
 kzbViYfEYMukHB6f988zKKbMfswDWPp+mHgyVBauRb05ON2EIzrrzx7gA2BSlEyXtNJb0pR3KCK
 k8pm0ML8JENisblVnPVwipjN882TpY8bluUzEwt8r7pEIMJMyAnwR6HifhVaXYCFwBm2hX+FovF
 zQYn8FyGxUJD91SZrE1wr+AAgeAfM0FfH3JpKW9u2gkDfPNKqpKxIi3M0FWR85PukMySUM2hreU
 fZ/i1zAP98/Rc97EmMFlsJGhbffIyDWSEeeODz4KIXH7CoOlFU1CRi3qP2s59BLK3dmrt4vSUyQ
 L8WtruEAF588ejvYRLDsttFG6JTGYozbI8nBAa6/+/f2CDsnCIC1DeYaY4394z4bh3NTVyU1sTR
 DkSZ4ReCilEDvZNYVtkWQ76ddZx0NWr2CpX+KlUQlGVner6WnQx+l40/p+m889yCcl8AjaTjwhH
 KXnoIynk699KCnHLUmA==
X-Proofpoint-ORIG-GUID: DGKFGI-T9KK8vrkv-fhy24o90CgHjObv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfXwCvKDp8P/5Ke
 dzF/aKXMV3lrJu8Wow8PWXGIS1asDWcJr6epWnUzSZJx8jp7VdJF1+B8/BNi+ZTo9rK58ezX28p
 f4OcEYyTF0wuwDhsbcKFekKOVg2USS8=
X-Proofpoint-GUID: DGKFGI-T9KK8vrkv-fhy24o90CgHjObv
X-Authority-Analysis: v=2.4 cv=H6TrBeYi c=1 sm=1 tr=0 ts=6a4951e0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=T3BUC5bxBd2b0rxqrJgA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607040192

Convert MCDE to explicit plane, CRTC and encoder objects.

Keep FIFO, event and framebuffer update sequencing intact, and install
GEM framebuffer prepare callback explicitly.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/mcde/mcde_display.c | 162 +++++++++++++++++++++++++++---------
 drivers/gpu/drm/mcde/mcde_drm.h     |   6 +-
 drivers/gpu/drm/mcde/mcde_drv.c     |   3 +-
 3 files changed, 129 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index 257a6e84dd58..4d86fa5030eb 100644
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
@@ -157,13 +157,35 @@ void mcde_display_disable_irqs(struct mcde *mcde)
 	writel(0xFFFFFFFF, mcde->regs + MCDE_RISCHNL);
 }
 
-static int mcde_display_check(struct drm_simple_display_pipe *pipe,
-			      struct drm_plane_state *pstate,
-			      struct drm_crtc_state *cstate)
+static int mcde_plane_helper_atomic_check(struct drm_plane *plane,
+					  struct drm_atomic_commit *state)
 {
-	const struct drm_display_mode *mode = &cstate->mode;
-	struct drm_framebuffer *old_fb = pipe->plane.state->fb;
+	struct drm_plane_state *pstate = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc *crtc = pstate->crtc;
+	struct drm_crtc_state *cstate;
+	const struct drm_display_mode *mode;
+	struct drm_framebuffer *old_fb = plane->state->fb;
 	struct drm_framebuffer *fb = pstate->fb;
+	int ret;
+
+	if (!crtc)
+		return 0;
+
+	cstate = drm_atomic_get_new_crtc_state(state, crtc);
+	if (!cstate)
+		return 0;
+
+	ret = drm_atomic_helper_check_plane_state(pstate, cstate,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, false);
+	if (ret)
+		return ret;
+
+	if (!pstate->visible)
+		return 0;
+
+	mode = &cstate->mode;
 
 	if (fb) {
 		u32 offset = drm_fb_dma_get_gem_addr(fb, pstate, 0);
@@ -1149,16 +1171,14 @@ static void mcde_setup_dsi(struct mcde *mcde, const struct drm_display_mode *mod
 	*dsi_formatter_frame = formatter_frame;
 }
 
-static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
-				struct drm_crtc_state *cstate,
-				struct drm_plane_state *plane_state)
+static void mcde_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					   struct drm_atomic_commit *state)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_plane *plane = &pipe->plane;
 	struct drm_device *drm = crtc->dev;
 	struct mcde *mcde = to_mcde(drm);
+	struct drm_crtc_state *cstate = crtc->state;
 	const struct drm_display_mode *mode = &cstate->mode;
-	struct drm_framebuffer *fb = plane->state->fb;
+	struct drm_framebuffer *fb = mcde->plane.state->fb;
 	u32 format = fb->format->format;
 	int dsi_pkt_size;
 	int fifo_wtrmrk;
@@ -1298,9 +1318,9 @@ static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
 	dev_info(drm->dev, "MCDE display is enabled\n");
 }
 
-static void mcde_display_disable(struct drm_simple_display_pipe *pipe)
+static void mcde_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					    struct drm_atomic_commit *state)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_device *drm = crtc->dev;
 	struct mcde *mcde = to_mcde(drm);
 	struct drm_pending_vblank_event *event;
@@ -1381,17 +1401,23 @@ static void mcde_set_extsrc(struct mcde *mcde, u32 buffer_address)
 	writel(buffer_address + mcde->stride, mcde->regs + MCDE_EXTSRCXA1);
 }
 
-static void mcde_display_update(struct drm_simple_display_pipe *pipe,
-				struct drm_plane_state *old_pstate)
+static void mcde_plane_helper_atomic_update(struct drm_plane *plane,
+					    struct drm_atomic_commit *state)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_device *drm = crtc->dev;
-	struct mcde *mcde = to_mcde(drm);
-	struct drm_pending_vblank_event *event = crtc->state->event;
-	struct drm_plane *plane = &pipe->plane;
+	struct drm_crtc *crtc = plane->state->crtc;
+	struct drm_device *drm;
+	struct mcde *mcde;
+	struct drm_pending_vblank_event *event;
 	struct drm_plane_state *pstate = plane->state;
 	struct drm_framebuffer *fb = pstate->fb;
 
+	if (!crtc)
+		return;
+
+	drm = crtc->dev;
+	mcde = to_mcde(drm);
+	event = crtc->state->event;
+
 	/*
 	 * Handle any pending event first, we need to arm the vblank
 	 * interrupt before sending any update to the display so we don't
@@ -1443,9 +1469,8 @@ static void mcde_display_update(struct drm_simple_display_pipe *pipe,
 	}
 }
 
-static int mcde_display_enable_vblank(struct drm_simple_display_pipe *pipe)
+static int mcde_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_device *drm = crtc->dev;
 	struct mcde *mcde = to_mcde(drm);
 	u32 val;
@@ -1462,9 +1487,8 @@ static int mcde_display_enable_vblank(struct drm_simple_display_pipe *pipe)
 	return 0;
 }
 
-static void mcde_display_disable_vblank(struct drm_simple_display_pipe *pipe)
+static void mcde_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_device *drm = crtc->dev;
 	struct mcde *mcde = to_mcde(drm);
 
@@ -1474,13 +1498,56 @@ static void mcde_display_disable_vblank(struct drm_simple_display_pipe *pipe)
 	writel(0xFFFFFFFF, mcde->regs + MCDE_RISPP);
 }
 
-static struct drm_simple_display_pipe_funcs mcde_display_funcs = {
-	.check = mcde_display_check,
-	.enable = mcde_display_enable,
-	.disable = mcde_display_disable,
-	.update = mcde_display_update,
-	.enable_vblank = mcde_display_enable_vblank,
-	.disable_vblank = mcde_display_disable_vblank,
+static int mcde_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_commit *state)
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
@@ -1510,11 +1577,30 @@ int mcde_display_init(struct drm_device *drm)
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
+	if (ret)
+		return ret;
+
+	mcde->encoder.possible_crtcs = drm_crtc_mask(&mcde->crtc);
+
+	ret = drm_connector_attach_encoder(mcde->connector, &mcde->encoder);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/mcde/mcde_drm.h b/drivers/gpu/drm/mcde/mcde_drm.h
index ecb70b4b737c..6123afb1e3b8 100644
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
2.55.0

