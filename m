Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591241;
	b=WqSEn3ucjSROLD4RSlCdhPWf8Z/jUvjVuLO30Py7XubMZoPl6cJG3PXzoiHClxPxNtMD
	 2h2Ko9PDBnLDFhlKegtvAbep4C+Rzy6locCu+DVmxC9Orx+pSC7IBJrZ4CJA7xt04qfbS
	 vGqNIMF/mNFhtjsrN1mlTZyCM6w+/C4PL5RPEsx7/fBwjbLGcUm6eoh9fhcB7E1fAxGQM
	 u6Tb0l9u/rAmDZVgLVb4EpUysIGZEX5MvEI5w54mWlVpveV2ADHfDCZovZFxjaCPDPlWG
	 b2hZjDa1ORfFS5+52fZSWoy4o90+MZArmRiEEybtbbbSGJ4yu4qa7MVHmg7XPxz+tvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l1SQBJPQH32GaCf6i6Hpvj4B1BS4U8Mq3RY+38E+QYU=;
	b=xHwjcPRCT6/DoQWs2/5C9Zj18Z/+4jUXZGk0Yvj7pFgS+Fa6HNEWRc59ar1c6HJvWvl2
	 yW5FFs9Z5kOIPevjJ+MEYBq6tXgEmtPvpsK3LiLR9qhjffR0fqLGwZtAO55o8KkkuKDl9
	 13Nyh0YIDOpzmexsCJibxtVe5dpm8x0qDNVQgiAalpbmXuQdwntzoQy/5KfNeHxzzH4+d
	 sUoCB/AUU9UfiDIKo2rGRRuLW+o7x3ApJGedFmFj6+td31cQEbmb0v8tmJDU6FXebmjbD
	 ImLH8nQ2vztt8lkur5fWI6RbomF129JodRmTgsBkBZxeaigkm7Lcg0WJQtsUxUbOelA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SsSy5VrH;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90608606A321
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 07:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90608606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SsSy5VrH
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-38190551625so10862394eec.1
        for <imx@lists.linux.dev>; Tue, 24 Nov 2026 23:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591240; x=1796196040; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l1SQBJPQH32GaCf6i6Hpvj4B1BS4U8Mq3RY+38E+QYU=;
        b=SsSy5VrHzUotwg640fwu/DXgIR8/9GYe7A4sHmnomVv6yi3ucZ1V5fATgQu8U2zzsY
         IclaIbn2MxMtHnsiRKwXR1PRoXXyRYFAaWaTrghHxvFFdN9gCYzdQkEbFBRrM/28r0M0
         7bjpzA0eqikLxnh34w2G/oUl2bZyiGqzrEFqbSM0Wu0h4G3EpAVhmnInqVRZBRkKMDpW
         ZyPDBQ56gEfoeLMoEBEydvLBQwpzE5njq8VKS7P+wBJVKkHEZADKPK/i9tLiSS+urhD8
         Lb5d4GnzqHK6PAt51BtUqMIOuOMrk9stUILBRc1dUXd+idhaNbzyN17Nt5gOoFS60w+0
         v1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591240; x=1796196040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l1SQBJPQH32GaCf6i6Hpvj4B1BS4U8Mq3RY+38E+QYU=;
        b=oAmcNVyOwX9W1MH+PKa9FK2/ot2wVFV72to3tMQDSXDuJW5ZsgFxufN8eyl2KxZjz8
         PzhOTMtLiijKMtpwKuQSyvd+K9GXO/yNVVNnkN/k8la971usnOU+bVWeiSvV3SGlRbb7
         XAJbq4p6n6WsEaTM7STpg2A4IhTAS0Pg9qU+nMqbLD9iJ1wGLlzgjOwYNLbfKCpI9ELL
         fe6iSJUXONfb65HFplM9nDX8XBegcDTgBKQvsS42f7u8mI2M4/8ptmhhAk705WUCggjt
         vtUhfSO3usNFoqcwxvUrXkqd9D0IIwoTWeqxrRv7WbJw2ywR9d6b0Q4G9kBESu37Q9I+
         2ZYA==
X-Forwarded-Encrypted: i=1; AL+hErG6tCx+B+2QIQhu5hbihGIrMZwAAhmXiqEBXh2h4+0M4HnJjSIiuEDVJllms2Az7leEE+M=@lists.linux.dev
X-Gm-Message-State: APuU4Z/6cT2uktNjhUiXxJGZFSBdu9gl2EomL5uoHIZZEuTSA0p49w4y
	irRAiYLpt2lD/m0T+A1MTAmpUyRCI/IuYcJK0mZZBdH1rYlrCZ5OxDTX
X-Gm-Gg: AZFdTZehyj5808jHylQ+HhYX92FQFYto2WCC+MnAcP3OF0UwG7WGVqdAhUOYxxncnTi
	aTLIC7cXqZwAoxThFZ9CbTZyNjtDPJba8KjIyJx+tW5RGVdnFv/+OvjQRJ1aseGhDBgesEx5I52
	ZR7xCZzYDHcNzZ+1aKFFMSdBZxVu/pU7A3DvEiKTmYBs98Wk6jY1DWXVzHKPF7Q2/iK51PmjGaZ
	l7bANhrrJBcW9BdAkMysyA2TIhArmGJQdqDREIkF3lWphYrYrOIhUck5+DXXuj6sXX+QbpenSdC
	jVO4+Rg7nijrT0g5kfWigXQlSs/RYwvsCkAJ/ZwJPTgz+jnAvYTBjYbHtNEkAZgUnKgXH9xWVgk
	l+xYf/ZwNDr5ITAx9A2qUHWlH44TEC6dO/DpWePnCAJygH4R64RhZa4wuUjNJ5yiDylR1qLbgED
	/wrEAunG/vBWzQ14uTZfQUeOb8F1U+fGI8s/iFcOb1+XqGsQ8ciOjmZKiMw+YaLYyIx5UnffvUd
	yg23ImeDaQQNLHM0gGrq8xB5/zzvdqmNa44e7Ap5J0EkopGrHJvXFf82EYF5Qy4hHCXEt2v4sEm
	h3D/yoOlMRnw1L1KnTHTqhyqEOJFvexunPOEKpwihj3ifN05fWpLdndlkNQC8eRW
X-Received: by 2002:a05:693c:6010:b0:385:2057:eb95 with SMTP id 5a478bee46e88-3857073f2a3mr22650185eec.31.1795591239429;
        Tue, 24 Nov 2026 23:20:39 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:20:39 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
X-Google-Original-From: Prasanth R <prasanth.r@lineo.co.jp>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Paul Cercueil <paul@crapouillou.net>,
	CL Wang <cl634@andestech.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	Prasanth R <ragaprasanth@gmail.com>
Subject: [PATCH 00/12] rtc: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:14 +0900
Message-Id: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
X-Mailer: git-send-email 2.34.1
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

From: Prasanth R <ragaprasanth@gmail.com>

These drivers set a wake IRQ with dev_pm_set_wake_irq() and never clear
it. After unbind and bind, dev_pm_set_wake_irq() warns "wake irq already
initialized" and returns -EEXIST. For jz4740 and atcrtc100 the probe
then fails.

Switch them to devm_pm_set_wake_irq() and devm_device_init_wakeup(), as
was done for rtc-pl031, rtc-stm32 and others. Patch 3 also fixes an
unbalanced clock disable in the mxc_v2 remove path.

Patch 1 is tested on an i.MX6Q SABRE-SD board by unbinding and binding
the driver through sysfs. The others are compile-tested only (ARM,
clang, W=1).

I used an AI assistant (Claude) to find these and write the changes.

Prasanth R (12):
  rtc: snvs: clear the wake IRQ on unbind
  rtc: mxc: clear the wake IRQ on unbind
  rtc: mxc_v2: fix unbalanced clock disable on remove
  rtc: mxc_v2: clear the wake IRQ on unbind
  rtc: imxdi: clear the wake IRQ on removal
  rtc: da9063: clear the wake IRQ on unbind
  rtc: fsl-ftm-alarm: clear the wake IRQ on unbind
  rtc: jz4740: clear the wake IRQ on unbind
  rtc: atcrtc100: clear the wake IRQ on unbind
  rtc: pcf8523: clear the wake IRQ on unbind
  rtc: pcf85063: clear the wake IRQ on unbind
  rtc: rv8803: clear the wake IRQ on unbind

 drivers/rtc/rtc-atcrtc100.c     | 8 +++-----
 drivers/rtc/rtc-da9063.c        | 4 ++--
 drivers/rtc/rtc-fsl-ftm-alarm.c | 4 ++--
 drivers/rtc/rtc-imxdi.c         | 4 ++--
 drivers/rtc/rtc-jz4740.c        | 4 ++--
 drivers/rtc/rtc-mxc.c           | 4 ++--
 drivers/rtc/rtc-mxc_v2.c        | 6 +++---
 drivers/rtc/rtc-pcf85063.c      | 4 ++--
 drivers/rtc/rtc-pcf8523.c       | 4 ++--
 drivers/rtc/rtc-rv8803.c        | 6 +++---
 drivers/rtc/rtc-snvs.c          | 7 +++++--
 11 files changed, 28 insertions(+), 27 deletions(-)

-- 
2.43.0

