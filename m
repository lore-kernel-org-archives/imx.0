Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361446;
	b=s3Ed2PRCyAzjBs9L7KE3bdCrkxDbELy9imZu7zhfBGVTUR374omqEKcmdqyMMTdiwsp+
	 0sKGUDd8Bd6JI6ChLANZtMC8pfxIdT2sdUjuAuEcumggfFXkeRb1Tnec52hMPzn7Dduo2
	 jzMynCEGh7VYFI1EOHYBICYXrTwHqqpoj8og3nEANjLv9cO7HnBeyyDxSluPHRl9nauQm
	 yuUL5q7qRH0HbQSuvlgo3PoQFN7QjHikXBugsEryHF6N53zp5CXmmMrLfLFh3INLdViKp
	 Wn5LYI+91IuL3Jw9UbuZQORdgvakjjZ1llVUV2qw/XaBGafz1WybiOwLeDTERzWTpTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AcE23n4pwXrPvICR/OBmKOqECG6PQtTg4meGhVNm1yI=;
	b=litpJLhhLuS9B4Ny2qMgQwYfEFwIR2BXTGDStwvZGYcFyEHTxSXU2ytf9igkQ44bnykX
	 IUxyUTn0oiubrrLOXUC1NFdzM+DUkvJpH2JqWHPIGr1IsglkbEgbPksyMAfovhdJaupkG
	 7/2Tobq8jbhlFbBk1ljascoP8OZXGf2Pfv93BVknccoPxhjF/jAEzpPzphUdiL/10BO/f
	 3/k0M2ATwrjc+qp8MKKh194aJka16tGoIEBkcckRuPOi8Zd0tAT6Ys3QoFzoSaFVk2FRi
	 umH0MNUBzzgQI5azKrnXlwJxIXerQdEyIVryt2o1Rya1e/simUn8QwEyFKefkh+ZLrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=jiFsbvCe;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078B5606A32C
	for <imx@lists.linux.dev>; Sun, 22 Nov 2026 15:30:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 078B5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=jiFsbvCe
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so18477935e9.3
        for <imx@lists.linux.dev>; Sun, 22 Nov 2026 07:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795361444; x=1795966244; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AcE23n4pwXrPvICR/OBmKOqECG6PQtTg4meGhVNm1yI=;
        b=jiFsbvCe+yzY993QrFLoUy9EixzV9FgzlD5ZONHN554B9GLIZQO+tUgWFO2zBSW1yK
         i9M51VKNaU9mkhyAPoXUHrBjji9zzC+MOqDDsUDUENEKzvhjzJh9aZalfJeaozkS36DP
         wXNPirIl1g9JqnAjjz0edtqZX8zrwrKApqQa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795361444; x=1795966244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AcE23n4pwXrPvICR/OBmKOqECG6PQtTg4meGhVNm1yI=;
        b=nPB8ZXeXFbGCtc+8XZPZHQyU2KtT8OiZ35cvOmsg+BJhu95k5eurtN9eLPWH4ioNU4
         XCY/1UA/7hP37fbdo2Ni+a07QFd0hJHyrVxzaibDYpaEWBtqun6Zh/hb45HVTgWtUVrF
         b1QL5rO6Z0Oi5E2sFlNJi1Tm093FcDMz6qlJjxPExnoNbHGsXDuCUuGepfjDWRQFLMRg
         dM3i/vDytpSwtWgI7UBsTdK4FzR24d3UOZqWlNPy1kJQwn/JQCnSOGhx7bPmMTjTu3IH
         WaGOuXEE4MlOKlW0OYEhegsuK70sxHBJerzA6fTXdNPmBZzEvxA/qNuJ5fCa5qd/t2bA
         BVdQ==
X-Forwarded-Encrypted: i=1; AL+hErH6byUzq4RDX6GEOqbZjU6mBgR+VlO3VgPW1G9TpwTAvssktXxGSKgQcRWWUV5xhSQ9s8U=@lists.linux.dev
X-Gm-Message-State: APuU4Z9ZOm0HbHaTHqOvw6Bv32q53d/PyWZPLzCNzY6OBsJy8tt1S6eV
	g6hJVl0/wt5PeRy3Xd3aaIERtgxm4NQbiPgrYc/H49SOaz0462fcUXSZAp7h8YjtKSc=
X-Gm-Gg: AZFdTZeScY0MNP5N08sXfhaVrGWz9bCT82hnaSAXB8b6OwCJCrvmzpbT181za7qnXi3
	UWDp7l+HdIM6+RnuC73BSruSnwRKD7JLostGJ/jc6TOlqS2Jv3IJ65eccXFdgVAHOlDXkqTJxDs
	iJ2JkqRqwW+/KCp2a4FaoBW7QRaTsAWs9YK4ndehIkucIrCGsVEMyzGMcy6s1Gmk0IHS58Rd2Bf
	HxtkDwi4wyOJY8cJsj99ZetYR08Ti6JLejpdEtJ54WR8fQ9zhRynX02M6e5IEkMrdAZXOhN+9DM
	Np6+HEpc0L7a1wl5i/F+qO3rWI9lncewkc9LxiSe6PhBjjcBo0Tmobk7rI5IJgP0Fl6fbIj7/ZY
	wD4k8xfo1ozDUush2MyJnU3Pixt2P9c/ex5Xu7lKCXZtAjqQO1m0I9kxiIcrL247lR89CAXus/o
	TKlmKrjnJJyrK0tQIfub1BpwPyZhXZAiDHxxZ2NhNE+eM1KvJ1f5NqQ0n2gvRFIERAJirMQuKGv
	yLDoAvdM98h37jNGfbGHD91ftqQcGOxMhG85fFjh272PFHPmqN2+52qdJC1U2Ww1UE4CwgTQSQZ
	cqs8ELWM0nn/yb0dDrSx5TDJxBoJF5U4vA4n1mdzy7LWrxirDWm04adj1s9wUqm9aGdIG60c20K
	mfn+HE4pcTBLOwMYN7sV6KMFjYVCnfTcWLz/Jn2ziSf9u4o++hIGrtNfEeHndQsQhuYzuA4J996
	iizxnWlG+WCqGvyixYCqiQELYZwHifm2v3blGtJmk6vkPJugQ=
X-Received: by 2002:a05:600c:468c:b0:4bb:6d61:af7c with SMTP id 5b1f17b1804b1-4bb88944bf5mr182002275e9.35.1795361444382;
        Sun, 22 Nov 2026 07:30:44 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm237833815e9.9.2026.11.22.07.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:30:43 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Inki Dae <inki.dae@samsung.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Marek Vasut <marex@denx.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Robert Foss <rfoss@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/8] drm: State readout for the i.MX8MN display pipeline
Date: Sun, 22 Nov 2026 16:30:00 +0100
Message-ID: <20261122153032.2782768-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
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

This series implements the hardware state readout [1] for the display
pipeline of the i.MX8MN (LCDIF, Samsung DSIM, Synaptics R63353 panel),
so that the splash screen shown by the bootloader stays on, without a
modeset, until a client draws.

The first two patches add the hooks a bridge and a panel need to
acquire their resources (runtime PM, regulators) when they are found
enabled. They are a proposal, since the drivers converted so far
didn't need them.

The series is based on [1] and needs [2] to keep the power domains of
the display on.

Tested on i.MX8MN (BSH SMM S2 PRO).

[1] https://lore.kernel.org/r/20261106-drm-state-readout-v8-0-cbe78624e1bc@kernel.org
[2] https://lore.kernel.org/r/20261122095927.2631909-1-dario.binacchi@amarulasolutions.com


Dario Binacchi (8):
  drm/bridge: Add atomic_sro_install_state hook
  drm/panel: Add sro_install hook
  drm/mxsfb: Use the bridge connector
  drm/mxsfb: Switch to drm_mode_config_create_initial_state()
  drm/mxsfb: Stop the controller in hw_reset
  drm/mxsfb: Implement hw state readout
  drm/bridge: samsung-dsim: Implement hw state readout
  drm/panel: synaptics-r63353: Support hw state readout

 drivers/gpu/drm/bridge/samsung-dsim.c         | 125 +++++-
 drivers/gpu/drm/drm_bridge.c                  |  41 ++
 drivers/gpu/drm/drm_panel.c                   |  16 +
 drivers/gpu/drm/mxsfb/Kconfig                 |   2 +
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  31 +-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c             | 394 +++++++++++++++++-
 drivers/gpu/drm/mxsfb/mxsfb_regs.h            |   3 +
 .../gpu/drm/panel/panel-synaptics-r63353.c    |  33 +-
 include/drm/drm_bridge.h                      |  20 +
 include/drm/drm_panel.h                       |  10 +
 10 files changed, 642 insertions(+), 33 deletions(-)

---
base-commit: fe97bd8df0365f5aa27ea88b621e3f475bdd544d
branch: drm-sro-rfc

-- 
2.43.0

