Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361464;
	b=5iDXtKUy/Yfpu3j9nxuBSJ1aXuXcvKTQoL/lVY2DvO8tmdrZIr/+jk2dUVdRcdjNuBa/
	 fu/Z9EknojdkG0Svq+b3CgIp5JpyIk+zn4FF6scDrZtChRccwQS5v250gxRh/9cz6JGZB
	 hL1Dbea85UeghfO4s6aiI+jxOb9q6/sAcTvyRieJpB4yo1ofr7bonfJDHS3gabJw2uDua
	 djN76lxRN+q73rVHxCV69qZU6iy4P2XG12I+hCkLJcxic3W6vOoOyrp4mLXovzlKoBQHY
	 B9cwAPrPa0GwQ4vm6vww36ovIHFCubPpAbqPvUtksxl2kWBVZ7CJhqOSdBl2llnzUqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NKlfL/cIMbCShlnoUQAoP1Uep9RrtGH8SZf3MvBv2hw=;
	b=XHd+JJ++PAcGyS7VJB8DBwFNGO8Fd9hdYJYLF3yeQtdfv3QfKCrEuc0BopptaaB7mftR
	 AXdxp1pCAi9REcVX9YnMEs96ZB61GFVyLVi42AvoYUEEJGoUNejj0NssN78p9AodmgoqO
	 Nnc4QrCMSaaAvaPcUw2xsMHWvu8EKidW8KO9dcBds085FzuGa7EyC0XiOwfON3KM11evs
	 pEof75qvWaxJqO91cl2HEQMH1jGkptho2uYtoHzIs8Ru3hx7ONmkbixo5WGI05X7frJvx
	 RUycwPtzU7vOgDC2Q9StGUAL4JIj3ErazRkJv1jw/O3hejFrAOzK48oGlSZggLB2mYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=J42035r6;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5822606A32C
	for <imx@lists.linux.dev>; Sun, 22 Nov 2026 15:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5822606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=J42035r6
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso13176005e9.0
        for <imx@lists.linux.dev>; Sun, 22 Nov 2026 07:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795361462; x=1795966262; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKlfL/cIMbCShlnoUQAoP1Uep9RrtGH8SZf3MvBv2hw=;
        b=J42035r6CXT/09Lm9yT3YWAdTAsmYSF6mSUYISIpq4oCFLBRun1YDsXrm4NAFf29PS
         ipMhnA9enRKObLXvebq0Oq+hjdd+hlafVzVsxclCf0XizgFgo+AVw54xx+ARA1FkXgXk
         23trg8EddTXzHiHhYdZKoTmPNGgxvYjOQfiz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795361462; x=1795966262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NKlfL/cIMbCShlnoUQAoP1Uep9RrtGH8SZf3MvBv2hw=;
        b=0PORhKj0ZyZPUYiFHWY3P5OyoBQ6jDbYvmu7Xtgklf79gsZvxY/IwH6gUVRRaD6QEv
         VwFEPddXgdgDWMmZbxMOrJpiZyleQZvtcLhHF7jOUqbvku6qv3pz1obbpJwJXP5UpKz4
         PJf9//te9BYFjdWWorO/87Md4K/JzI/8QGDh4kJ3JFR7QEIZ1TkTtoybOGa0giGkB9qm
         5eOMMyYXPjZjuIfJsrUvrQgL2wyttCT5IgLdMogQI9SCnvQ3Fd2ptMAn9b2ARTRkjT4o
         MGd+h0ntR+mRuVlwiLZ7ouLKIUONmXH5sU2R2jrUPyrtZmIf4rTF4w8yuQqIsYASMkZw
         SNdA==
X-Forwarded-Encrypted: i=1; AL+hErG6Wb3bmPRpr1ZPnkKIAtFG+vVeNhAfj8vpuBMMIqh+tEy+0Q7qQiHMHtNYsaAGg4cX8Sw=@lists.linux.dev
X-Gm-Message-State: APuU4Z8fOWPZtXsUlO3+6U8f8yMqUpv7qEp+uRY+cEHClWKdQoY1y8vH
	dTBgH5CyCiYIz/7Gx/9R0k8tWMBPSwr/NBTqcwkBUyC/HQl7vpCQRrwwED4kLQtiD7I=
X-Gm-Gg: AZFdTZdRJ45n2QeQifyuXu7UYjF5MOV7VwsMQ3fHXCtUMJgWq7DKSClxbBe4LrSnzUW
	RQqnshqoDC8e8mbLJMa2+Xky/BT8Kbkz/kL3u8dGHhv6ZzYtLvhKtw9eTHgXHma8uCOO6YbTyxJ
	0Pwj+f2DZTwdKq62vwleAcyowWFMwPfJZyT5WEwtjLOJON3Br03OKAgXChlREyfN1vs+B0ZSHlr
	prtPY5nYg8C+4+boj3XpEhnoJXSTdWT3wfPTgRF0+z1zfhTKDMV/GgKE3azuUBT7rf30crly/1j
	hbUaHomhZQ2coYfm11ob0FAadaBA+RtCLWJze804unfkr5gAs8RtJcvIF4l5EJ5l56VyxkFXbB8
	D0a03h+hFPM0/CtaM+e02EoCoaaWFwCFSj96/7//NOuSd2W/NF7DAaTzMSYc1RflJ0p1btXEhhq
	N+5c336cm7UPsMffA7ovNaQFa4PPC0uN6DbOozupawsEvV/XJsnvBplWw6qw0HZ4Y2epVQynMz6
	/WD3l94Ova/wLBr8oSImRD7L+SejxoHk+Rb9ebIA7GIoFguRpdoXQeExODpzgmYoUnZyhWmnzSc
	HgPrFUaVDeGZxM0ajEoxr8yIUdcvKC+lvhNmfliIM4ijczf9MzQNx9IM4ofP8s4482dp1xn9NMt
	xpdoGo4Sf5yvHuukiS6wT57WRugVphKMEtPWVbw7pWMJ7ePqoZQSkyLvoZo2g52FhEO72pl2GN1
	wMk1179eprg5QnAwEX65vQnT/9Mg==
X-Received: by 2002:a05:600c:4584:b0:4bb:5de1:e90f with SMTP id 5b1f17b1804b1-4bb88819bcdmr186394735e9.31.1795361462157;
        Sun, 22 Nov 2026 07:31:02 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm237833815e9.9.2026.11.22.07.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:31:01 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Marek Vasut <marex@denx.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 4/8] drm/mxsfb: Switch to drm_mode_config_create_initial_state()
Date: Sun, 22 Nov 2026 16:30:04 +0100
Message-ID: <20261122153032.2782768-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122153032.2782768-1-dario.binacchi@amarulasolutions.com>
References: <20261122153032.2782768-1-dario.binacchi@amarulasolutions.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hardware state is read out only when the initial state is created
with drm_mode_config_create_initial_state().

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 038f5c896dcb..c8bc79264361 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -322,7 +322,11 @@ static int mxsfb_load(struct drm_device *drm,
 	drm->mode_config.funcs		= &mxsfb_mode_config_funcs;
 	drm->mode_config.helper_private	= &mxsfb_mode_config_helpers;
 
-	drm_mode_config_reset(drm);
+	ret = drm_mode_config_create_initial_state(drm);
+	if (ret) {
+		dev_err(drm->dev, "Failed to create initial state\n");
+		goto err_vblank;
+	}
 
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-- 
2.43.0

