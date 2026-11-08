Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794139990;
	b=KY5/paiwNT96mcTlpSMHnCg17G3k2qW8lcpOHsLFIiP8DgMHc+SzJbyKTE+9HCc6QIn2
	 91S6qIfwkbguRYMzgRkc/GwCd2I5Lo11w82Ng8d9ILeCDx1/rJBgj7kGH762LmBHw95La
	 HDcpF0Fv+b6JxT4qugqHB7bmcWyRlIbu4tD4auIEiqHIDPVbwXDGUvN6T/agpxIwNJVOv
	 ShyrcGo9CNGw0+UmcaWhe3OwIXgpmxIN+5/mwKh1lKhFd/9URoVui3FnMOHN45qm+p9/m
	 dMes4gI/7QNWCVDucY/hnTpV5use3EVPOONEqEKMrmF0nO788HevSijGXRxxjP/H7SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794139990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=ygaGJYoEs4KFSYAAlwAVylXljw/N65/5dysb1mPUS9Q=;
	b=UpiB+1K1l95gd3xp1/OQstsTG2G8mmCsqMDwZDFJJp1n4JiKeU5OdYu6EHYy0+kTO8F8
	 /TvB+FoaCE1A1X72z5nnyb/7k1GVeYx6si9yIasUcdUL12c1lofRhUpFpV3OIuoIR9jCJ
	 EgqaMW5303mDR203LUHEBUG6cmTQqdt+/niXwDY8Rrx9lxKk/7NaLlui2biwemPYjq0+U
	 yDJsrvqs4FxvjluNdIHrfJiSIBrF8w9X0AcNnOaKaNWbCE+yTldSsWkdOFzFAnMUoGIjp
	 5uBpx9VRIUcFLbTE5D0e3BKBx8e13jEmUwO954nAV1SGpvc6ee4/BIfdGGcOwQM6KTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GhLRIREw;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7AE606A321
	for <imx@lists.linux.dev>; Sun,  8 Nov 2026 12:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F7AE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GhLRIREw
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so22874f8f.2
        for <imx@lists.linux.dev>; Sun, 08 Nov 2026 04:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794139988; x=1794744788; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ygaGJYoEs4KFSYAAlwAVylXljw/N65/5dysb1mPUS9Q=;
        b=GhLRIREwW7f2eO5FDt1imY+TFeeXIzM6tyFR5H7xXDQO39CP3HlTC3K8TWWvw5OXl5
         M+1N4DSfGCQeA2Os9z379gs2puT3PQeFfOv0a7exPnnNX0PtUqAC2z3TZTcZKBcYXv7+
         w/IhjbcdmPDLvkdeh2Xa6vONZWP23uBNGoKX8JiMHVs2T9iTG+ZR19I+S8ojQi+iUxfu
         59sJVs2+p32aWV5BRqu/XW1+b47t3My3zDkn1PxXDSiCQgiEOJ0ulO5SfIG9+oEgzGE/
         YC02cng4uMk4jFMZs1xcd/HqNEZ1ri989PYCbRPIxuHmD63IbQxdny9pK3tdbFXXUdwN
         fbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794139988; x=1794744788;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ygaGJYoEs4KFSYAAlwAVylXljw/N65/5dysb1mPUS9Q=;
        b=uvmNBW88v1MKWzy0Rr6WwsGuRJFVW0tfeKF9+zFnB3gep3eckKEdTW31DlSO6RcsD0
         dtzq4dMWFG3LMFBPmcfbzdRQ+ARqa1KIrPCf3LMOXXeab4VYmEwq7T2EU1qP+Im5mdeE
         qUMTYbySANcv5BN6yUW4wFOuC1LZ1s2miMo4f2LHl8n8QLXZ6RFq3GXUEF9+B/r9cQQo
         RggNQV45BGrfiW4w2cdFnwMkGsnz8k1NzA1Ag6UEO8edvibln1gdPvpQkUGSdGKMWO0g
         ziIG3Z6GsziNcOA6l2IYM/r6PKL5kmhqTG3H6Nn34T52bx0cIizXZoVAPsESa1xFhaF8
         2Aew==
X-Forwarded-Encrypted: i=1; AL+hErEMThi5xuG9RnDtEMWnvNhg1p0JmxSXj4Z+fNpwzNSaCQaW+yClC9IlSQlwgrGYQeNEemY=@lists.linux.dev
X-Gm-Message-State: APuU4Z9ofU+Vf4Cxn5gceA61GUyCKUez6ADhwRj84XE2ZHEbfKQk1A6u
	q3CWD1fyQ3EgMoHWa2KzPF7VKk5H1GspZPYdZ2vtLnf1i/CsZqdrd1Ww
X-Gm-Gg: AYBFou05xbBIWJ9YG8yjEkUFlaAppGrc2jBHt4X9RjqwCcd5qUA9KqNoBDQ78Yvjhzl
	cQ4BpS8v199VOMVSR09v/e1hZ6+w/qpjy80T2FDj4oY6AvrzthaV3D16qZmn3gMFXqvLwqi0moe
	8lCahE1IeXSmH7LHwU6AZh5q0KTpz7vmnqEtW3h2S9feybaT1VdR0ofMK7d/Pr0On6pVaehOfw4
	qdmHxc9LmLiSn1m3jS5FNdJybUtxp+DoPAtzbBUKeu1BfPSjJ/Wcxa/D00LBCoYXrLgUJKjMIqi
	JqU3IZhBIi68N/l0/0iv8ZqcVmwQVnGXFYrp2AzPjscoLz7l5WHGcoTfgJdweq9hxppVIhLRVhZ
	XviUWf6/MbIEwttCykwmdACrO0ZT9vwA8sf6zpb4N3hLNAjE2Jy0wrkMv44erp0oralLJifBpyL
	YcbEaZ91+DLBdnlMD4tPMc5PRe6C8VZFjs/mPuLR8Z9vpvNSHjMSUH2aOB4ETQHiTi596jVr/PQ
	aeUtDkOpAihNQoNNXLpiGH4EV1jFSMv+gtYn8F4YJgKJNWp59ywwJgsm27fhmXbrFYteIlTBlEf
	i+0m2dzXDRtfM0wpxun915m29Lu0atkzQhOD9TuPH+kHhn2gJWtN2+JAK+Wrjwp7s6nLHEiguhl
	UeTufo7XAPNOZHUt0yZbPx9wltfvKRumXRwNOLNR7af6l8V5WK/Y=
X-Received: by 2002:a5d:584e:0:b0:488:823d:5086 with SMTP id ffacd0b85a97d-49583ee2ab6mr3013316f8f.0.1794139987564;
        Sun, 08 Nov 2026 04:13:07 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597090444sm3945815f8f.31.2026.11.08.04.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 04:13:05 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Sun, 08 Nov 2026 13:12:59 +0100
Subject: [PATCH] drm/mxsfb: Complete page flips only once the new buffer is
 latched
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-mxsfb-flip-latch-v1-1-ad816b23b646@igalia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avErBtQK4muEi3MxhqwHzQiEO+et
 PwW7yWIFJgiDFWCQA9HPo8CWVdgN3OshLwUgxJKSyl63N/oZnSeL/TmthuS6xrbdkrPRkPJrkC
 O3385Tjl/QGTg9WIAAAA=
X-Change-ID: 20261108-mxsfb-flip-latch-ef53c4526ba6
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Christian Gmeiner <cgmeiner@igalia.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3

From: Christian Gmeiner <cgmeiner@igalia.com>

The controller copies NEXT_BUF to CUR_BUF at the end of each frame. When
a commit writes NEXT_BUF just after that point, the new buffer is only
scanned out one frame later, but the event armed in atomic_flush is
still sent at the next frame done interrupt. Userspace then renders into
a buffer that is still on screen, which shows up as half drawn frames
when a compositor renders directly into its scanout buffers.

Keep the event in the driver and send it from the interrupt handler once
CUR_BUF matches NEXT_BUF, and AS_BUF matches AS_NEXT_BUF for an enabled
overlay. On i.MX8MQ about 2% of the flips completed one frame early
before this change, for both planes.

Fixes: b9f5937680a8 ("drm: mxsfb: Enable vblank handling")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c |  2 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.h |  3 +++
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 47 ++++++++++++++++++++++++++++++++++++++-
 3 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 641691fc92c8..d21f12074a81 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -166,7 +166,7 @@ static irqreturn_t mxsfb_irq_handler(int irq, void *data)
 	reg = readl(mxsfb->base + LCDC_CTRL1);
 
 	if (reg & CTRL1_CUR_FRAME_DONE_IRQ) {
-		drm_crtc_handle_vblank(&mxsfb->crtc);
+		mxsfb_crtc_handle_vblank(mxsfb);
 		if (mxsfb->crc_active) {
 			crc = readl(mxsfb->base + LCDC_V4_CRC_STAT);
 			vbc = drm_crtc_accurate_vblank_count(&mxsfb->crtc);
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
index bdc47ce5be79..9264ca53999d 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
@@ -49,6 +49,8 @@ struct mxsfb_drm_private {
 	u32				bus_format;
 
 	bool				crc_active;
+
+	struct drm_pending_vblank_event	*event;
 };
 
 static inline struct mxsfb_drm_private *
@@ -61,5 +63,6 @@ void mxsfb_enable_axi_clk(struct mxsfb_drm_private *mxsfb);
 void mxsfb_disable_axi_clk(struct mxsfb_drm_private *mxsfb);
 
 int mxsfb_kms_init(struct mxsfb_drm_private *mxsfb);
+void mxsfb_crtc_handle_vblank(struct mxsfb_drm_private *mxsfb);
 
 #endif /* __MXSFB_DRV_H__ */
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index bbc2a2df9f16..c7e516758a1a 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -328,6 +328,7 @@ static int mxsfb_crtc_atomic_check(struct drm_crtc *crtc,
 static void mxsfb_crtc_atomic_flush(struct drm_crtc *crtc,
 				    struct drm_atomic_commit *state)
 {
+	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
 	struct drm_pending_vblank_event *event;
 
 	event = crtc->state->event;
@@ -338,12 +339,54 @@ static void mxsfb_crtc_atomic_flush(struct drm_crtc *crtc,
 
 	spin_lock_irq(&crtc->dev->event_lock);
 	if (drm_crtc_vblank_get(crtc) == 0)
-		drm_crtc_arm_vblank_event(crtc, event);
+		mxsfb->event = event;
 	else
 		drm_crtc_send_vblank_event(crtc, event);
 	spin_unlock_irq(&crtc->dev->event_lock);
 }
 
+static bool mxsfb_crtc_buffers_latched(struct mxsfb_drm_private *mxsfb)
+{
+	if (readl(mxsfb->base + mxsfb->devdata->cur_buf) !=
+	    readl(mxsfb->base + mxsfb->devdata->next_buf))
+		return false;
+
+	if (mxsfb->devdata->has_overlay &&
+	    (readl(mxsfb->base + LCDC_AS_CTRL) & AS_CTRL_AS_ENABLE) &&
+	    readl(mxsfb->base + LCDC_AS_BUF) != readl(mxsfb->base + LCDC_AS_NEXT_BUF))
+		return false;
+
+	return true;
+}
+
+static void mxsfb_crtc_finish_page_flip(struct mxsfb_drm_private *mxsfb)
+{
+	struct drm_crtc *crtc = &mxsfb->crtc;
+
+	drm_crtc_send_vblank_event(crtc, mxsfb->event);
+	drm_crtc_vblank_put(crtc);
+	mxsfb->event = NULL;
+}
+
+void mxsfb_crtc_handle_vblank(struct mxsfb_drm_private *mxsfb)
+{
+	struct drm_crtc *crtc = &mxsfb->crtc;
+
+	drm_crtc_handle_vblank(crtc);
+
+	/*
+	 * The controller copies NEXT_BUF to CUR_BUF at the end of a frame. If
+	 * the commit wrote NEXT_BUF after that point, the new buffer is only
+	 * scanned out from the next frame on. Complete the flip only once the
+	 * hardware has latched it, otherwise userspace gets back a buffer that
+	 * is still being scanned out.
+	 */
+	spin_lock(&crtc->dev->event_lock);
+	if (mxsfb->event && mxsfb_crtc_buffers_latched(mxsfb))
+		mxsfb_crtc_finish_page_flip(mxsfb);
+	spin_unlock(&crtc->dev->event_lock);
+}
+
 static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 				     struct drm_atomic_commit *state)
 {
@@ -425,6 +468,8 @@ static void mxsfb_crtc_atomic_disable(struct drm_crtc *crtc,
 		crtc->state->event = NULL;
 		drm_crtc_send_vblank_event(crtc, event);
 	}
+	if (mxsfb->event)
+		mxsfb_crtc_finish_page_flip(mxsfb);
 	spin_unlock_irq(&drm->event_lock);
 
 	drm_crtc_vblank_off(crtc);

---
base-commit: 19e67d977d3d4d0c54f03906ef578578190db9e1
change-id: 20261108-mxsfb-flip-latch-ef53c4526ba6

Best regards,
-- 
Christian Gmeiner <cgmeiner@igalia.com>

