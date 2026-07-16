Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E5D3F4DD4
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 09:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192632; cv=none; b=nFKIZdIeFtZmdu/VnraWZTo7ztg2C0CydATRImVz20eG2EDxT+e67GUYB3Hu8mRdnd70CZ3oTFpMLMFb+JyHtjfwbymlEkjj7sZ3qNZpWeVlLbSkj+GIeiXnLocKuSf/hQnAOdAJyeP7kQPFKehXc0MaWKgu56NIE58kiHeFzQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192632; c=relaxed/simple;
	bh=1viaAX+744S54GCG+tWfVVj2xmjTbnyOumJ6LSWV5BM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lPg4giB1kuAHe3KVD9+Op4npHTCdte6DDMYlFcU6/+Vrgz8tBD0u+xdIzxoJlGED02lSjm/doIAZSFdMEM9su8SnkmjX/7Ir6dmGE1IGhDyIlMxBw6y+I9oUCekR72AWKBykfe24Ttjpe72dkWnY40akQiGDu4zkIDhq0ao9jus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HO+D16pl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kMjoe6mT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HO+D16pl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kMjoe6mT"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7Dl2k1848235
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 09:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cXDzlp0Mz8ahuhkKRd5AdRfYSWy40uSfi+gwEDZHB1w=; b=HO+D16pl5NnizWLT
	EiMKDbufmks1qDlaQmm1bJz9KtHJwjUUnFtC4Me8/8F36stmqHRtBitdEEowis42
	Czjd1k9g6jTFrBIkPRKARjHghPuGlbRrFzUjSyKg4sIRVah6bmHxFnhNggLNKtDN
	6LwFrZ/16Im1HNnxucmuQINDVjXIzrL8otMAYymHT4IbqXFio6vLxD7ML6EUARO7
	h/oK7i6SVbP6XjgA770I5CoABfF8si0W7ccqtMQmYbU2TUT/b2dMzt9sNMKs6+/f
	b7U6y2Np8ogkNabFyqwfqFxd9FMgcDNaN9pWrCBypJwJFv7mZVeE4zlXT88wTA6E
	EEqdlw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetb7rgk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 09:03:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce8a76df2dso112475815ad.2
        for <imx@lists.linux.dev>; Thu, 16 Jul 2026 02:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784192619; x=1784797419; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cXDzlp0Mz8ahuhkKRd5AdRfYSWy40uSfi+gwEDZHB1w=;
        b=kMjoe6mTkHHPaQWSqU6ePklsjTC+aOGIarF5G9TXYcdh/fuIzGv9WmHVBEZLlu6aZa
         WyS+kAYD4ACVZ0b1bXO6SaYT05/iL+Bw8WNjSfxWOIFpX4Bw9QHUJYhb4Qj8uC4gieqU
         eAGHp1EscV7Gl7snwRExbeggImLwxw1TPTqfNm3eEUZmJF90DVTLOJD4lKxjDiwE2jmi
         Z7MFbZ4sDVte7zdezLZuOBk0Z1UIBlhl6N6IBQeyEqR2tG8leGDJbGcRO8ut0wS4U6NW
         EEKRsKFPx+WMdnK7yhaZ7dP26s1Dsd+H7EiTLn/14FOQUtOUS08pFXqYW9Ari21Mfb28
         bKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192619; x=1784797419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cXDzlp0Mz8ahuhkKRd5AdRfYSWy40uSfi+gwEDZHB1w=;
        b=BBSCwMYm+zwJiSFWpt/O0Z7TTHvHyiO/XFHw/hGbo9mY6sDOyoBmDB5xRWy/hbvVou
         g9oeiEvI7k/Vxwc1rPjlspOhWEdAJe2ZLrcHASNkiiGm5WWctKgD8o1gK9gk+DEWp5I2
         g35vXM6dNc50mk2XTvGGQh922poAKrYNBjJAUi6TrWNJ608Oo8ikhu6VA01pvuRco6+E
         j9HWu3MTsfmcnnN2t6wYed7wF0jaSKltMyryCd5IpRMtKcGM9Qtxdx+5BBz+aHByQKC+
         PFRf7nqcBjeJ4Ej4XLEfX8W266+CE2yXWE3UCB8Z4NQEjfZP2QjO2ZPEy19MZBHeIya1
         H95A==
X-Forwarded-Encrypted: i=1; AHgh+RrZFnzUJeEDWOkw3atIczGNjN7IHiNyFsFJ0zfHYmtqjyC4oUeQCwL5+1JIc6ygzgOfsmU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxXshk/JzsElEa5SG1+yhBDUupx3Mc10tHJwSs3fiIxWGPUFnfp
	e1/Zgohkj9keyKzXNNjrfYoMVgqqNge35FTuByRRtha64We+UwMiZiMj7WkUGSU+Ro8to6phCSL
	Hf0/fZAeYSAS5gmi/pBbg19+v+kdqsukMjyRikaZZcnRj/05DCah3wr4=
X-Gm-Gg: AfdE7clDdLtM2rAJHGyOOmkd2I0QHEUGWJiRU4cSMdJgPnIrRYD2wDhxLxksKWJnI/d
	bE89y2EfAeYTps5bdhKIypYK77elCbhm4nx9pXvdId/0gSvEojbaVoENS99VJ09Cb2OqqEpYmhI
	Lb2KJKO0ZgHFPqxb27UkUXamK0YfaUFicYMqvdzNKfREUzbxOYunP7zMkF/DNczR0Y6W08n2VHf
	s0De2VF7DyChV1w3ZRMpKu4X243YmyOA+QdiAhZyABNwG3q7GzmJhkWfTa0L+y0D6M1bABuLRpV
	Zpa3jTvuxZLTfn/3isNLB6b5TjFQ+uG+i3VTyEfELcXX/og4Fd04h2d2Mt9lVo5dEkzqusLwGCC
	ZVliDyiqbTdd8gYPUEDgz
X-Received: by 2002:a17:902:fda8:b0:2ca:4b7a:4a02 with SMTP id d9443c01a7336-2cef1370d34mr95423275ad.43.1784192618511;
        Thu, 16 Jul 2026 02:03:38 -0700 (PDT)
X-Received: by 2002:a17:902:fda8:b0:2ca:4b7a:4a02 with SMTP id d9443c01a7336-2cef1370d34mr95422605ad.43.1784192617798;
        Thu, 16 Jul 2026 02:03:37 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf106b271asm16592555ad.64.2026.07.16.02.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:03:37 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 17:01:59 +0800
Subject: [PATCH v2 7/8] drm/tve200: replace struct drm_simple_display_pipe
 with regular atomic helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-drm-simple-kms-removal-v2-7-1133a8fc3785@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784192560; l=12710;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=1viaAX+744S54GCG+tWfVVj2xmjTbnyOumJ6LSWV5BM=;
 b=O8lpuoMTn2tkvb1RSrnDKTTQNtcFREO2jObb3WocoCvGUqjOl9Y9c3xswWhyXseEslHU7pcEk
 GcfaTN4aIRaAKXobRA8r0gDPuaWc00NDSyh2r/gWBxcdWV2JfOEcbIS
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfX2O9Qn7Ghpami
 ovG5se9ApM78X4pHV3XapFd98Srlb58vIzsvpOjvqDrl8xCncbBizGlIi/3QStDjs20u/3+xt6C
 /pe0TrUD6eEyrkZ1U2uBenclRmHI934=
X-Authority-Analysis: v=2.4 cv=dM2WXuZb c=1 sm=1 tr=0 ts=6a589e6b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=dgwnEUiFKTnKxPjcC9oA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfX+0eck8VOR+Ny
 nxZ/cZFBy39uqulLO6vIHzNYcWy6xB60q36v44ftDox9ORZGkVohzhaNsYAR0giaTocaZGHj6fo
 f+zgku61pDt5RakVqH/dggOpDTYG0tlQG9Yr6xcMj8t9M0PWvGMhK1fEOj1a5Mjozxzb/0Vvo+X
 bc1p8nBO+TMS/paKMyeAl9iGIqWmTP4vZEKOX5tNE3jK0VVr3P0ZtuXMCZoeBsmttYhr1YC7vLj
 8S+6RHVJN+LbbmDv36S3IsK6/nBxpf24EOJ2r44hh+KLT1ELRUyz8PnjBGaYT8irQ2lPuhz1pmt
 5KAi02qvwqvWBm+4gYxhQPpKuF1TwtBd8ZlqLcA2n2MfTDSB0hee3opQ/TmSE8OqOr2BP1jq7hG
 rLZx4pVWBuqYtcx2s6YGPhKDyaK6Y3Aa/TcJkKPc6j9o8TbqZC8WAZPaitj65fTdMxfhjtdjoBH
 URxnXhgnM1/rQ+26suA==
X-Proofpoint-ORIG-GUID: ZiEZj363mN44r5s883LuVzYEqpsa3rCi
X-Proofpoint-GUID: ZiEZj363mN44r5s883LuVzYEqpsa3rCi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160091

Convert TVE200 to explicit plane, CRTC and encoder objects.
Keep generic plane-state validation before TVE200-specific mode,
alignment, pitch and format-change checks, and install GEM framebuffer
prepare helper explicitly.

Move page-flip event handling to the CRTC commit path and wire the CRTC
vblank callbacks explicitly so events are not consumed from the plane
update path.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/tve200/tve200_display.c | 217 ++++++++++++++++++++++----------
 drivers/gpu/drm/tve200/tve200_drm.h     |   6 +-
 drivers/gpu/drm/tve200/tve200_drv.c     |  12 +-
 3 files changed, 161 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/tve200/tve200_display.c b/drivers/gpu/drm/tve200/tve200_display.c
index 26b6c65ef6fd..6021f90d8531 100644
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
@@ -69,13 +71,32 @@ irqreturn_t tve200_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static int tve200_display_check(struct drm_simple_display_pipe *pipe,
-			       struct drm_plane_state *pstate,
-			       struct drm_crtc_state *cstate)
+static int tve200_plane_helper_atomic_check(struct drm_plane *plane,
+					    struct drm_atomic_commit *commit)
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
+
+	if (crtc)
+		cstate = drm_atomic_get_new_crtc_state(commit, crtc);
+
+	ret = drm_atomic_helper_check_plane_state(pstate, cstate,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, false);
+	if (ret)
+		return ret;
+
+	if (!pstate->visible || !cstate)
+		return 0;
+
+	mode = &cstate->mode;
 
 	/*
 	 * We support these specific resolutions and nothing else.
@@ -119,16 +140,72 @@ static int tve200_display_check(struct drm_simple_display_pipe *pipe,
 	return 0;
 }
 
-static void tve200_display_enable(struct drm_simple_display_pipe *pipe,
-				 struct drm_crtc_state *cstate,
-				 struct drm_plane_state *plane_state)
+static void tve200_plane_helper_atomic_update(struct drm_plane *plane,
+					      struct drm_atomic_commit *commit)
+{
+	struct tve200_drm_dev_private *priv = plane->dev->dev_private;
+	struct drm_plane_state *pstate = drm_atomic_get_new_plane_state(commit, plane);
+	struct drm_framebuffer *fb = pstate->fb;
+
+	if (!fb)
+		return;
+
+	/* For RGB, the Y component is used as base address */
+	writel(drm_fb_dma_get_gem_addr(fb, pstate, 0),
+	       priv->regs + TVE200_Y_FRAME_BASE_ADDR);
+
+	/* For three plane YUV we need two more addresses */
+	if (fb->format->format == DRM_FORMAT_YUV420) {
+		writel(drm_fb_dma_get_gem_addr(fb, pstate, 1),
+		       priv->regs + TVE200_U_FRAME_BASE_ADDR);
+		writel(drm_fb_dma_get_gem_addr(fb, pstate, 2),
+		       priv->regs + TVE200_V_FRAME_BASE_ADDR);
+	}
+}
+
+static void tve200_crtc_helper_atomic_flush(struct drm_crtc *crtc,
+					    struct drm_atomic_commit *commit)
+{
+	struct drm_crtc_state *cstate = drm_atomic_get_new_crtc_state(commit, crtc);
+	struct drm_pending_vblank_event *event = cstate->event;
+
+	if (!event)
+		return;
+
+	cstate->event = NULL;
+
+	spin_lock_irq(&crtc->dev->event_lock);
+	if (cstate->active && drm_crtc_vblank_get(crtc) == 0)
+		drm_crtc_arm_vblank_event(crtc, event);
+	else
+		drm_crtc_send_vblank_event(crtc, event);
+	spin_unlock_irq(&crtc->dev->event_lock);
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
+					     struct drm_atomic_commit *commit)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_plane *plane = &pipe->plane;
 	struct drm_device *drm = crtc->dev;
 	struct tve200_drm_dev_private *priv = drm->dev_private;
+	struct drm_crtc_state *cstate = drm_atomic_get_new_crtc_state(commit, crtc);
 	const struct drm_display_mode *mode = &cstate->mode;
-	struct drm_framebuffer *fb = plane->state->fb;
+	struct drm_plane_state *plane_state = priv->plane.state;
+	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_connector *connector = priv->connector;
 	u32 format = fb->format->format;
 	u32 ctrl1 = 0;
@@ -240,9 +317,9 @@ static void tve200_display_enable(struct drm_simple_display_pipe *pipe,
 	drm_crtc_vblank_on(crtc);
 }
 
-static void tve200_display_disable(struct drm_simple_display_pipe *pipe)
+static void tve200_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					      struct drm_atomic_commit *commit)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_device *drm = crtc->dev;
 	struct tve200_drm_dev_private *priv = drm->dev_private;
 
@@ -255,46 +332,8 @@ static void tve200_display_disable(struct drm_simple_display_pipe *pipe)
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
 
@@ -304,22 +343,48 @@ static int tve200_display_enable_vblank(struct drm_simple_display_pipe *pipe)
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
+static int tve200_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_commit *commit)
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
+static const struct drm_crtc_helper_funcs tve200_crtc_helper_funcs = {
+	.atomic_check	= tve200_crtc_helper_atomic_check,
+	.atomic_enable	= tve200_crtc_helper_atomic_enable,
+	.atomic_disable	= tve200_crtc_helper_atomic_disable,
+	.atomic_flush	= tve200_crtc_helper_atomic_flush,
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
@@ -346,13 +411,31 @@ int tve200_display_init(struct drm_device *drm)
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
 	if (ret)
 		return ret;
 
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
+	if (ret)
+		return ret;
+
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
index 562f3f11812a..0b8096b1e600 100644
--- a/drivers/gpu/drm/tve200/tve200_drv.c
+++ b/drivers/gpu/drm/tve200/tve200_drv.c
@@ -105,16 +105,20 @@ static int tve200_modeset_init(struct drm_device *dev)
 		goto out_bridge;
 	}
 
-	ret = drm_simple_display_pipe_attach_bridge(&priv->pipe,
-						    bridge);
+	priv->panel = panel;
+	priv->bridge = bridge;
+
+	ret = drm_bridge_attach(&priv->encoder, bridge, NULL, 0);
 	if (ret) {
 		dev_err(dev->dev, "failed to attach bridge\n");
 		goto out_bridge;
 	}
 
-	priv->panel = panel;
 	priv->connector = drm_panel_bridge_connector(bridge);
-	priv->bridge = bridge;
+	if (!priv->connector) {
+		ret = -ENODEV;
+		goto out_bridge;
+	}
 
 	dev_info(dev->dev, "attached to panel %s\n",
 		 dev_name(panel->dev));

-- 
2.43.0

