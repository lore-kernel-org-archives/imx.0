Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5440E20A5D3
	for <imx@lists.linux.dev>; Tue,  4 Feb 2025 10:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738664162; cv=none; b=oo+WqAW/QkNj3iUx/dQSmYRr5e+H08WBVupD1tMGQcBLKcUobP/IzlPL3+QhdeCC8bzGhiCAuu7kDMxKSfoDZAlNbD1bbgvVTsZOfimYV/Vzm5Qy4c5f1GzcfQnDmT4c5uiKoq77S26dUrR2KDraCx9J+RQQK8OkgfeH4CD/Zwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738664162; c=relaxed/simple;
	bh=pyI5zeAGo1cg5BRHuCJdzEULznntBdU7+JnQZZUx5Ks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Jy0ny8DXjT2l+4gNnR+UCqBI0akjrFTTb/J6T3OdihA6AT/bWBVJ/9uOEyie4R7tbo4osw+xozSWXlHdG830gHw3D4dPxSHs9Z8NmRuDJGJbdtyU4HRQ5Z6KbUlWX1VCGkqFyeKPFTgh+m1sfGTtpO9lCvTH/nXbQGtxhpvcbR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iapDTkn+; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iapDTkn+"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aa67ac42819so809416666b.0
        for <imx@lists.linux.dev>; Tue, 04 Feb 2025 02:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738664157; x=1739268957; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IWzsE4Lq8l2QV8yxJbGClNJbawPu4UbyHy7mtC5t8To=;
        b=iapDTkn+P85P4gq86A2MmFot8a2TQPRGK6B6sTdjQvdngkdGJAjnmJcI4GJkJciUZX
         LHVwyR+rdHv0wC/ultiDh8r0+Jj88Xr9MnjVUQ4nUNr8+WCm230Ofo5nrw1XZsJKsdOL
         iSoZJX0g+lXuLwQYbvFw3mW6uD+0rePcRrGO/gA0X9M+GPHeXl02SDDTO1IQ3UoMM+vl
         m/ebJIF23aD5ru0UKS4hN2NRba+iNjx0yhciE9NwQL0JjqEAqiSTqROqwK1GDWmNQx4N
         fFHKPO7pCGAGerhc+2DVC0afdjWR9+jDYNcy/0gsORG03fq648WqyY96bc2WnQQi0+9a
         PunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738664157; x=1739268957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IWzsE4Lq8l2QV8yxJbGClNJbawPu4UbyHy7mtC5t8To=;
        b=U3Hc8xf9zbmKrvs56EtB1O9I9sTIi3560Slk5C9Guu/LpAmGkArEpyHb441e7llvUc
         Z7vTyKO78H9lvZRi6YJQX/byNRAlaOkkx0R88/tpws51YGn+XyM6ErTUjBYDIdPqgQpY
         m2uoJV7uZpm9HadPR32Y2A92QMtHEBsMfADy+o4GCr7s+eSbB9hA0x173O4ov5ne8NJM
         TVQns9cGRigzo/vWM2E6Pd2vT1MUOIucsyLqdn5Hxul29Q/2v1JuaLFafJjeqXrXYNXG
         P/QKoutYVDFtF9n1Ng3get630/bDzTzQg5FN+5o1CG9JyoVp8shCaldtcms++rzCM9aY
         8YkA==
X-Forwarded-Encrypted: i=1; AJvYcCVd/5KmvrCCPDZ/WYMzCPviU2pEfW4sNGMEstXeQBN63nYAseJ8hZ9jMqcObeYDJI5kj48=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRJ+IgTfJiwlbMmeFS31H8e+1TrScRac0kTu1gOdEEIoibByvw
	TaTZOCB5Z5UQDEGLeADhnWVz1J4T++gG25v5dKTOQrWWuYxPHcfcy0n9EufLVrI=
X-Gm-Gg: ASbGncve/9xxcrOafkkres41G0LLOtPQPMsGMDi9u4MRC2+yKPRhVUkNYJlkJZKNVIP
	XWNFfqAHx6Cwxapt0y53mou6dIGnh3jXjZyWVUXPbX3quYki7MjpFBUfGzDexKWtSD20kJ8qqo9
	9KT4McwOmjJhf5/Yc+voaVEFl/zcaMA0jAPbN3KLA/8j6YBTyr8IkvJIVztqTXKRS/83hkhcnto
	Qa2LAdEnQ6XxnzVBqqJYeH//zvfWBbZTTn9nSV4scCDI9VfQ1mjrepsHmrwXqXV2hoaZMdHKpZy
	RrLAxgIIYWnHSVP/Id4LOUaJCb/1e4jHGjF3sSXplEfG9qjCqI6XWhNngw==
X-Google-Smtp-Source: AGHT+IFGZ/qAd6VR9nvEmBZmJWy5U6aynPpSgzBtGAYBTtH7dvjRJals94zdqW3miqEi1CA0qhYS3w==
X-Received: by 2002:a17:907:94cd:b0:ab2:fefe:7156 with SMTP id a640c23a62f3a-ab6cfdbc4f5mr3049912966b.43.1738664155967;
        Tue, 04 Feb 2025 02:15:55 -0800 (PST)
Received: from localhost (p200300f65f018b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f01:8b04::1b9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47f1e23sm889444266b.82.2025.02.04.02.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 02:15:54 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Mark Brown <broonie@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] firmware: imx: Make IMX SCMI MISC driver only selectable on i.MX
Date: Tue,  4 Feb 2025 11:15:30 +0100
Message-ID: <20250204101531.233549-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=800; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=pyI5zeAGo1cg5BRHuCJdzEULznntBdU7+JnQZZUx5Ks=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnoejEpJeaH19FkPA6LQtmE3HsCS2KLT0uVt855 KDlWdrfnYOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ6HoxAAKCRCPgPtYfRL+ TlbJB/9s+ed9pSYLeQw2rtTfIEzVKE2VZhGfKuVAZFkCNdWpG+JCsYc+ZdBpkTXzWHZlUxYOqHy qFQzJV8+2IC9l7MEhlfguEG/R3kTvM4QdUD1sZnGtwfKClI65sZhSNW9eVGT6+dCbDsyV/Fg1pg keq2zH1rWhw2nKiP8DUJd0H4sepfnysDOaiMSJrjjNNhFt6MhmqafjrFyDENaePwiFu1/KGZAWl ex1DhB/EQB6VX787dyDGmaMmIvG4RXxFU0PupMQQ2/daMLdDLxNKT0UIgl71hpTR7yaHNSxEnyR C3DINmPM8hUVlMrnLmN688939R8dbnMty0cDbdT/VlylFrtO
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

This hardware component is only available on i.MX9. So don't offer to
enable this driver without i.MX support or compile coverage testing.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/firmware/imx/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/imx/Kconfig b/drivers/firmware/imx/Kconfig
index 907cd149c40a..dc685b94285a 100644
--- a/drivers/firmware/imx/Kconfig
+++ b/drivers/firmware/imx/Kconfig
@@ -26,6 +26,7 @@ config IMX_SCU
 config IMX_SCMI_MISC_DRV
 	tristate "IMX SCMI MISC Protocol driver"
 	default y if ARCH_MXC
+	depends on ARCH_MXC || COMPILE_TEST
 	help
 	  The System Controller Management Interface firmware (SCMI FW) is
 	  a low-level system function which runs on a dedicated Cortex-M
-- 
2.47.1

