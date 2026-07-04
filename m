Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62273749E2
	for <imx@lists.linux.dev>; Sat,  4 Jul 2026 18:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783190012; cv=none; b=lF8kX/gJ5CeGw5LcANGJriHI2GDIeq4dGbkf39j9UzKXgd4lzRD8tikvDA58bLuEZW1Km54adRTAXu37WfhAtSrZvpMz4uEXv0P0bv6tul062ij/VnL9YLUFEK7c5ytJ9eJvmP1mtWq6oRt4+nYaluenrb47OLDjIlxrj7soi/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783190012; c=relaxed/simple;
	bh=IU9daMuh+wIrKu2A7tjNZQhHlWlCXrpg0Z3XcY9yMsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uu4++QtAS2LnhnQEWhqjYSX6dbly2CR0tz8Xk6c9XUDBh0yWjV3WQc2+ZzC32QvTsB1dObZHm2eVJzHiTqp5hisk4QaiEvC2Y2/InE4EmLzkOHhvA03kEn0ljmqmqRyGckz26hMzWRbAgTzjpL4f1nTXiBE2dcOhA2yDfeHEPMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W6KKvrhm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EEaX5OS1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W6KKvrhm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EEaX5OS1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664G8ZCJ3429554
	for <imx@lists.linux.dev>; Sat, 4 Jul 2026 18:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g0BtnuFOv0FQCXxUBDMLCWTcgE0j6FLXPqatMYGCcJA=; b=W6KKvrhmeJ2fyG7f
	WVeIgvI7yc1jiGCDVMy8ENc4fDLxlrrfJe8IN0O7lmm2B65JmceQegoTuxl0Zy4Q
	OqrwkMJhj1H45TKfCC4YEbJgkLuuqCQWQ+x7QobwEfYeReDSSCL5wWTZivIRfWQf
	ZJvG8MRhzMrHmL/91mXHljlnNhNPpfDOq9WZgplUeCnLLFjKY3B6g8sVRCTh67r/
	N/u3p+SV46iH5sChKzMK/1uJIPHpraflaat1ixydDZW7kQwP9UJMiq81VaHpAprp
	JpC6F9G6ErO9rXO+wqrCAT9MR9ncg2ZJVslkCM+/pUyt+MTHGF3FE+8IziiOj809
	wXvMLA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgspbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sat, 04 Jul 2026 18:33:30 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8478423e020so2625365b3a.0
        for <imx@lists.linux.dev>; Sat, 04 Jul 2026 11:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783190009; x=1783794809; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g0BtnuFOv0FQCXxUBDMLCWTcgE0j6FLXPqatMYGCcJA=;
        b=EEaX5OS16MfhtxE+a/LimfvMLIgnTAmvp6MWqLNkD0tJshJM2lL366qX6gfP1BQG+4
         oHJHxcZZdPkIqOWe/DeApirG27BkBo59MVkab0GzMvBNz2zBf8UsWKdTkofcDrCiUHS/
         aCyW1XGyRY9r/8aYGfJwfIv2bCb4yH6y3qJ+Ev+2Rgd9AaO8wWE+TL+fsMmDPTUdxpHU
         mp5jmOFSnxjzI5ohZ3oJZoDy5kTzxx6eAVK8Ub8twiWPveekdm9CCbMS2+4scz3Ao8cC
         15LAq/APi5VoQUzlT3MQrOKz3GoYbnVcfZ+//upickVCNVQWc3N1ilX3QVjtYua2pKxy
         C4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783190009; x=1783794809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g0BtnuFOv0FQCXxUBDMLCWTcgE0j6FLXPqatMYGCcJA=;
        b=IbLDBSZzipo+O5WAKkVxq5gAzjZguCyqAWccJUKkvXeOkR9NqDOMRondq+PdX2VeJz
         2rUsO8pLn8T7iGqAGNX3J+/xw4bnZsx2FHpPLogAdet1kxue1knj3ExIPUbTuuoHAx6U
         5P3y2holsX8V8q3flrovvPABr8u371gSwq7ZyAEdrLf0JyM/HLwnGgVCofLA49f1IaLz
         auUP7eZh4VS3c3fI6AtozOAIkm5/4sZp0JKIi5SshnHgBVA3BQfyy/5fmS8C6qmYdCey
         f7o7ckkVAyB+EJWIIIYAz0wf9ujHj4yl25q7Fgy0dhXCS1m+AkCxRVdSN5G8nAcPjOKT
         qt/A==
X-Forwarded-Encrypted: i=1; AFNElJ+zN1a7zHMLvU6QTOpUbr3xMkkE9ANRGYbVSXFi2z7AqQA3ieabHi3JXhkGNzmqvglkmoo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwuVfL/xx55iPC67bncV6Ehxt5H4QX86417vTbj1WtCaQmEzG6z
	hXMl1ZzBlgoUwiz6GDFoMvIEvmsq0BP+R2c4AxnVAb166XImoDAogps6CQdIjQm80XKdEz3VWR/
	IcvQiJHcEyzyXooxNFnWb3x95TAviVbY+loK3bWKb5n6svDkI3s4Edlw=
X-Gm-Gg: AfdE7cnKAb5mie0KneLRCngag5F8uAQE5EREpgLXnQ4kMrcjO8+tn3A88RE/MQXP+kZ
	AAnYZinNFosBsQgbB4+iyJjC1Dq1dHVuAcvsQ6+MRzPgGyFKrRfsyIVfmi8V7lMJwGM5tHpvDtY
	9MW2KSjToKKqt5r74+eBzJxfwIse4JgT0UGAnH3S8iQUSu0BBV/YucHHWFmf7a1ISo87zjMuVyG
	/Ig8C1xRBxfXMvUcfm7kbUFS8wemiXJ3Fy43SW2bIR0iUQSWrN9JrQ9i+FPpKtNJV/fvywsfWkP
	jalM2MEVZtfnTF1GkKAXE11dluTYoelY/p04U+qVE0FMI8bGonOnIw8uJIEEYRQ7XlNvZ7SGcSO
	YpT6N/RocKCtSVWZSDh2v3Gs=
X-Received: by 2002:a05:6a00:e05:b0:845:d274:bfa3 with SMTP id d2e1a72fcca58-847f6f96cdemr3661061b3a.58.1783190009294;
        Sat, 04 Jul 2026 11:33:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:e05:b0:845:d274:bfa3 with SMTP id d2e1a72fcca58-847f6f96cdemr3661037b3a.58.1783190008770;
        Sat, 04 Jul 2026 11:33:28 -0700 (PDT)
Received: from [192.168.1.100] ([151.243.38.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b6057dsm1508437b3a.7.2026.07.04.11.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 11:33:28 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 02:31:17 +0800
Subject: [PATCH 8/9] drm/tve200: replace struct drm_simple_display_pipe
 with regular atomic helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-drm-simple-kms-removal-v1-8-b4e1ca053623@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783189912; l=12559;
 i=ze.huang@oss.qualcomm.com; s=20260704; h=from:subject:message-id;
 bh=IU9daMuh+wIrKu2A7tjNZQhHlWlCXrpg0Z3XcY9yMsA=;
 b=wca2bARZyhz/O2pE/2ultazGgfCDL/nXmuhK0zZODTqz3phtgEMU73vuIDTkXkqZJvrB1l2Xi
 pazMWuCMQ9XDkjSq9DKd98nVhHWb8WoQEKSNkWUUn6L6rvw9PKEzFZA
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=pSsISLZF2ubEjJRmslsa6Ps4W3yAuPY7yaircQTlQQU=
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4951fa cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dgwnEUiFKTnKxPjcC9oA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: VHqj-9JKRCOF09tOckexjvKkUodQhSPM
X-Proofpoint-GUID: VHqj-9JKRCOF09tOckexjvKkUodQhSPM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfX6ue6e+yH5//G
 EPeP5SLHE7LPbohPx/szcY9l4iD4nx7IzPC6EuRFJxhMEXvQ1+7rLhduMC3gjmGyB7ZNtoXv2my
 /qxLLh3ynWougdqj0ArzadxR/6YpFww=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfXyALyW2bgXo+P
 26xrQvU0JBgSWdH54AnB0FPJF2CdD2MrgdH4uGWIrCLm0psDvNoQN8cckOHgRR+Ll9jP5De0J9A
 Vm+thx16qZeTJhbHVKUL5EvZSTphzUPGD2/CtU50dgSPKXeSKYXwfrcjj9ciHlTISHI0zeVhR/v
 pzTJYnwMtUCGibvz4EZkI9rB2Pu69WNHcaUDA64fHXKDqm56VZQZyNHEgLFrYewb3rE1AxKGzl4
 g+iCk6tmGgKds0J4wo7zP5Y/fIcdVDrijCoYhX6dQ/MvWoBpXK+BY0B4MBndjgv56FPBwnJy0Hn
 W24hxIoML/7n7c8j8GmgoI3fR9cJlX27uQ6vTQTDUsM3Sd3jQzBSDlJUQfGNZbKsG4ZOkikb8LS
 xzHy7/6IXaq/JhLbOJT+dwonNXImjPh+8tj2DeGvqrBeIvckuWXMfhJgpKhlpJiUBzHdOdLVWHh
 0Bli2p5ER0+PFcbLjrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1011 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040192

Convert TVE200 to explicit plane, CRTC and encoder objects.

Keep generic plane-state validation before TVE200-specific mode,
alignment, pitch and format-change checks, and install GEM framebuffer
prepare helper explicitly.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/tve200/tve200_display.c | 221 ++++++++++++++++++++++----------
 drivers/gpu/drm/tve200/tve200_drm.h     |   6 +-
 drivers/gpu/drm/tve200/tve200_drv.c     |  17 ++-
 3 files changed, 168 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/tve200/tve200_display.c b/drivers/gpu/drm/tve200/tve200_display.c
index 26b6c65ef6fd..8fdf69e8e126 100644
--- a/drivers/gpu/drm/tve200/tve200_display.c
+++ b/drivers/gpu/drm/tve200/tve200_display.c
@@ -15,6 +15,8 @@
 #include <linux/of_graph.h>
 #include <linux/delay.h>
 
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
@@ -52,7 +54,7 @@ irqreturn_t tve200_irq(int irq, void *data)
 		val = readl(priv->regs + TVE200_CTRL);
 		/* We have an actual start of vsync */
 		if (!(val & TVE200_VSTSTYPE_BITS)) {
-			drm_crtc_handle_vblank(&priv->pipe.crtc);
+			drm_crtc_handle_vblank(&priv->crtc);
 			/* Toggle trigger to start of active image */
 			val |= TVE200_VSTSTYPE_VAI;
 		} else {
@@ -69,13 +71,34 @@ irqreturn_t tve200_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static int tve200_display_check(struct drm_simple_display_pipe *pipe,
-			       struct drm_plane_state *pstate,
-			       struct drm_crtc_state *cstate)
+static int tve200_plane_helper_atomic_check(struct drm_plane *plane,
+					    struct drm_atomic_commit *state)
 {
-	const struct drm_display_mode *mode = &cstate->mode;
-	struct drm_framebuffer *old_fb = pipe->plane.state->fb;
+	struct drm_plane_state *pstate = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc *crtc = pstate->crtc;
+	struct drm_crtc_state *cstate = NULL;
+	const struct drm_display_mode *mode;
+	struct drm_framebuffer *old_fb = plane->state->fb;
 	struct drm_framebuffer *fb = pstate->fb;
+	int ret;
+
+	if (crtc)
+		cstate = drm_atomic_get_new_crtc_state(state, crtc);
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
+	if (!cstate)
+		return 0;
+
+	mode = &cstate->mode;
 
 	/*
 	 * We support these specific resolutions and nothing else.
@@ -119,16 +142,73 @@ static int tve200_display_check(struct drm_simple_display_pipe *pipe,
 	return 0;
 }
 
-static void tve200_display_enable(struct drm_simple_display_pipe *pipe,
-				 struct drm_crtc_state *cstate,
-				 struct drm_plane_state *plane_state)
+static void tve200_plane_helper_atomic_update(struct drm_plane *plane,
+					      struct drm_atomic_commit *state)
+{
+	struct drm_crtc *crtc = plane->state->crtc;
+	struct drm_device *drm;
+	struct tve200_drm_dev_private *priv;
+	struct drm_pending_vblank_event *event;
+	struct drm_plane_state *pstate = plane->state;
+	struct drm_framebuffer *fb = pstate->fb;
+
+	if (!crtc)
+		return;
+
+	drm = crtc->dev;
+	priv = drm->dev_private;
+	event = crtc->state->event;
+
+	if (fb) {
+		/* For RGB, the Y component is used as base address */
+		writel(drm_fb_dma_get_gem_addr(fb, pstate, 0),
+		       priv->regs + TVE200_Y_FRAME_BASE_ADDR);
+
+		/* For three plane YUV we need two more addresses */
+		if (fb->format->format == DRM_FORMAT_YUV420) {
+			writel(drm_fb_dma_get_gem_addr(fb, pstate, 1),
+			       priv->regs + TVE200_U_FRAME_BASE_ADDR);
+			writel(drm_fb_dma_get_gem_addr(fb, pstate, 2),
+			       priv->regs + TVE200_V_FRAME_BASE_ADDR);
+		}
+	}
+
+	if (event) {
+		crtc->state->event = NULL;
+
+		spin_lock_irq(&crtc->dev->event_lock);
+		if (crtc->state->active && drm_crtc_vblank_get(crtc) == 0)
+			drm_crtc_arm_vblank_event(crtc, event);
+		else
+			drm_crtc_send_vblank_event(crtc, event);
+		spin_unlock_irq(&crtc->dev->event_lock);
+	}
+}
+
+static const struct drm_plane_helper_funcs tve200_plane_helper_funcs = {
+	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
+	.atomic_check	= tve200_plane_helper_atomic_check,
+	.atomic_update	= tve200_plane_helper_atomic_update,
+};
+
+static const struct drm_plane_funcs tve200_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= drm_plane_cleanup,
+	.reset			= drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+};
+
+static void tve200_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					     struct drm_atomic_commit *state)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_plane *plane = &pipe->plane;
 	struct drm_device *drm = crtc->dev;
 	struct tve200_drm_dev_private *priv = drm->dev_private;
+	struct drm_crtc_state *cstate = drm_atomic_get_new_crtc_state(state, crtc);
 	const struct drm_display_mode *mode = &cstate->mode;
-	struct drm_framebuffer *fb = plane->state->fb;
+	struct drm_plane_state *plane_state = priv->plane.state;
+	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_connector *connector = priv->connector;
 	u32 format = fb->format->format;
 	u32 ctrl1 = 0;
@@ -240,9 +320,9 @@ static void tve200_display_enable(struct drm_simple_display_pipe *pipe,
 	drm_crtc_vblank_on(crtc);
 }
 
-static void tve200_display_disable(struct drm_simple_display_pipe *pipe)
+static void tve200_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					      struct drm_atomic_commit *state)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_device *drm = crtc->dev;
 	struct tve200_drm_dev_private *priv = drm->dev_private;
 
@@ -255,46 +335,8 @@ static void tve200_display_disable(struct drm_simple_display_pipe *pipe)
 	clk_disable_unprepare(priv->clk);
 }
 
-static void tve200_display_update(struct drm_simple_display_pipe *pipe,
-				 struct drm_plane_state *old_pstate)
-{
-	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_device *drm = crtc->dev;
-	struct tve200_drm_dev_private *priv = drm->dev_private;
-	struct drm_pending_vblank_event *event = crtc->state->event;
-	struct drm_plane *plane = &pipe->plane;
-	struct drm_plane_state *pstate = plane->state;
-	struct drm_framebuffer *fb = pstate->fb;
-
-	if (fb) {
-		/* For RGB, the Y component is used as base address */
-		writel(drm_fb_dma_get_gem_addr(fb, pstate, 0),
-		       priv->regs + TVE200_Y_FRAME_BASE_ADDR);
-
-		/* For three plane YUV we need two more addresses */
-		if (fb->format->format == DRM_FORMAT_YUV420) {
-			writel(drm_fb_dma_get_gem_addr(fb, pstate, 1),
-			       priv->regs + TVE200_U_FRAME_BASE_ADDR);
-			writel(drm_fb_dma_get_gem_addr(fb, pstate, 2),
-			       priv->regs + TVE200_V_FRAME_BASE_ADDR);
-		}
-	}
-
-	if (event) {
-		crtc->state->event = NULL;
-
-		spin_lock_irq(&crtc->dev->event_lock);
-		if (crtc->state->active && drm_crtc_vblank_get(crtc) == 0)
-			drm_crtc_arm_vblank_event(crtc, event);
-		else
-			drm_crtc_send_vblank_event(crtc, event);
-		spin_unlock_irq(&crtc->dev->event_lock);
-	}
-}
-
-static int tve200_display_enable_vblank(struct drm_simple_display_pipe *pipe)
+static int tve200_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_device *drm = crtc->dev;
 	struct tve200_drm_dev_private *priv = drm->dev_private;
 
@@ -304,22 +346,49 @@ static int tve200_display_enable_vblank(struct drm_simple_display_pipe *pipe)
 	return 0;
 }
 
-static void tve200_display_disable_vblank(struct drm_simple_display_pipe *pipe)
+static void tve200_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_device *drm = crtc->dev;
 	struct tve200_drm_dev_private *priv = drm->dev_private;
 
 	writel(0, priv->regs + TVE200_INT_EN);
 }
 
-static const struct drm_simple_display_pipe_funcs tve200_display_funcs = {
-	.check = tve200_display_check,
-	.enable = tve200_display_enable,
-	.disable = tve200_display_disable,
-	.update = tve200_display_update,
-	.enable_vblank = tve200_display_enable_vblank,
-	.disable_vblank = tve200_display_disable_vblank,
+static int tve200_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_commit *state)
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
+static const struct drm_crtc_helper_funcs tve200_crtc_helper_funcs = {
+	.atomic_check	= tve200_crtc_helper_atomic_check,
+	.atomic_enable	= tve200_crtc_helper_atomic_enable,
+	.atomic_disable	= tve200_crtc_helper_atomic_disable,
+};
+
+static const struct drm_crtc_funcs tve200_crtc_funcs = {
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+	.enable_vblank		= tve200_crtc_enable_vblank,
+	.disable_vblank		= tve200_crtc_disable_vblank,
+};
+
+static const struct drm_encoder_funcs tve200_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
 };
 
 int tve200_display_init(struct drm_device *drm)
@@ -346,13 +415,31 @@ int tve200_display_init(struct drm_device *drm)
 		DRM_FORMAT_YUV420,
 	};
 
-	ret = drm_simple_display_pipe_init(drm, &priv->pipe,
-					   &tve200_display_funcs,
-					   formats, ARRAY_SIZE(formats),
-					   NULL,
-					   priv->connector);
+	ret = drm_universal_plane_init(drm, &priv->plane, 0,
+				       &tve200_plane_funcs,
+				       formats, ARRAY_SIZE(formats),
+				       NULL,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+
+	drm_plane_helper_add(&priv->plane, &tve200_plane_helper_funcs);
+
+	ret = drm_crtc_init_with_planes(drm, &priv->crtc,
+					&priv->plane, NULL,
+					&tve200_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+
+	drm_crtc_helper_add(&priv->crtc, &tve200_crtc_helper_funcs);
+
+	ret = drm_encoder_init(drm, &priv->encoder,
+			       &tve200_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
 	if (ret)
 		return ret;
 
+	priv->encoder.possible_crtcs = drm_crtc_mask(&priv->crtc);
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/tve200/tve200_drm.h b/drivers/gpu/drm/tve200/tve200_drm.h
index 5420b52ea16b..631a9f5d9aa6 100644
--- a/drivers/gpu/drm/tve200/tve200_drm.h
+++ b/drivers/gpu/drm/tve200/tve200_drm.h
@@ -15,8 +15,6 @@
 
 #include <linux/irqreturn.h>
 
-#include <drm/drm_simple_kms_helper.h>
-
 struct clk;
 struct drm_bridge;
 struct drm_connector;
@@ -107,7 +105,9 @@ struct tve200_drm_dev_private {
 	struct drm_connector *connector;
 	struct drm_panel *panel;
 	struct drm_bridge *bridge;
-	struct drm_simple_display_pipe pipe;
+	struct drm_plane plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
 
 	void *regs;
 	struct clk *pclk;
diff --git a/drivers/gpu/drm/tve200/tve200_drv.c b/drivers/gpu/drm/tve200/tve200_drv.c
index 562f3f11812a..e2e8346acbb8 100644
--- a/drivers/gpu/drm/tve200/tve200_drv.c
+++ b/drivers/gpu/drm/tve200/tve200_drv.c
@@ -105,16 +105,21 @@ static int tve200_modeset_init(struct drm_device *dev)
 		goto out_bridge;
 	}
 
-	ret = drm_simple_display_pipe_attach_bridge(&priv->pipe,
-						    bridge);
+	priv->panel = panel;
+	priv->connector = drm_panel_bridge_connector(bridge);
+	priv->bridge = bridge;
+
+	ret = drm_connector_attach_encoder(priv->connector, &priv->encoder);
 	if (ret) {
-		dev_err(dev->dev, "failed to attach bridge\n");
+		dev_err(dev->dev, "failed to attach encoder\n");
 		goto out_bridge;
 	}
 
-	priv->panel = panel;
-	priv->connector = drm_panel_bridge_connector(bridge);
-	priv->bridge = bridge;
+	ret = drm_bridge_attach(&priv->encoder, bridge, NULL, 0);
+	if (ret) {
+		dev_err(dev->dev, "failed to attach bridge\n");
+		goto out_bridge;
+	}
 
 	dev_info(dev->dev, "attached to panel %s\n",
 		 dev_name(panel->dev));

-- 
2.55.0

