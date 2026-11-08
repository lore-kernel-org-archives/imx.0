Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794130598;
	b=4JXIqFQJREjNQDr7zKyNDoWG7m6B1mdhcZTu4FHN/E5rgyUgieciJKtxeYjPHVLbLDtU
	 HEgNKVUo1uRup/XjAVjpR8dm6c770xMW+oG6pv0lxgpF2h9kVAcKcMG+Y0vAm+xn+LKbh
	 sdGswce9GyFpFZFLmy6uBBZma5dS9zFym5VLPefq6EXUigl+oZq7zi24iqZKW49hoarpD
	 rtGoMDS90vHRnDMwBt1zbDAegp+zp6tmL9kcAZqTDlnqf08iWUnl5wnywZDVLLYK4Qb7T
	 1v4wgMoIYxolPw+XGrwbek0uIG0RtNq8TXfZZl0hQ3ayCuwe1H0wq8wuuazRJuOhSRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794130598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XRvRDso/7nPZytfvh9i/Caaj8XKSnRZSw/8wKdSxLLI=;
	b=uEnlbMkX5qJUg0dhi7DGaFuvvXXFPZ7oFCtCFCN+7gFb71UMfOIURqSQ031BUJ3jaux6
	 VUlDhi7mLopd11wBpDGkN8JuXQFtNe5AdQwIlPzyYXCXiBW8crLixHaGXaO5hHN4hXlDf
	 NYO7DJGGgAwX5ZpZjYFsDKu4cAS3Sne3pKET/o8cv9U7G8Z1Sklagkh+q9u0WQpp7ksns
	 GAcGXUn9t9uc03gykVyfF/efHaL0oQbedu313ZGf3hnDaT8w16U1OrFl1fTKemPUcxkME
	 HgYsG4g52F3urDNm2kRTvA9E6/67rlP19fp1MblJhBx6JQjyz2n9f9DnHZGlBqkkXsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A19jy8yl;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BA8606A33D
	for <imx@lists.linux.dev>; Sun,  8 Nov 2026 09:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48BA8606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A19jy8yl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b467581b98so1928745e9.0
        for <imx@lists.linux.dev>; Sun, 08 Nov 2026 01:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794130596; x=1794735396; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRvRDso/7nPZytfvh9i/Caaj8XKSnRZSw/8wKdSxLLI=;
        b=A19jy8ylfWYUrtygydtoS7F5Q/JfsM26KxbC/FuWVnNHEYbmNSSZntxZ9osPLACQFI
         SPgvMwSKwo777Zll/8MeC+8m5GN/sMeEk8YH6sTBL1PSKIYCz+BCfCCfI+IiMK9NBXk4
         gRgxxHE7kTZ9cdxzDEBAXNLuckZclZpWRganmBvMu7KcOPdYKK7uQF8IeEgccFWj29G6
         ilT5jh6NEsKI55PK6Rd83FSksex70t0FZGYwZzbj38XRjYFVW6aGdai6hr8Pvi4Hmtsc
         DAtB+699m5wZLpUo4l3W4+khXIW35xRcfNJJD+QhGreXnjDEsjocCEpdOqsBxQFnmDRn
         81DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794130596; x=1794735396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XRvRDso/7nPZytfvh9i/Caaj8XKSnRZSw/8wKdSxLLI=;
        b=ob82TYxHI1G+8o8uF8V7JeZLm75cHRBjyZFLEnsCjbCByeEJ/5Th2zl+rebwFnKGF6
         +K7I74okqBjRPSjsR30NUMnBapClJKpz2xHWpwetTp0hNVhZD5B6OFkVP8MbPUla7DZB
         U0DwCiZLqE1r9gM+TguXQofcAXOPog16TFLRLFHQUuMiJqDCpPpFxPNM3NNt2uvnHOzP
         F9fvh34WdbzJaFeJpXNjVXh0Rf8dXuT/fknnQXxyUNrxCIGyOyxt24wTfqWv/ro4W7Fl
         t7BWvLG3FtTN2PFQWAsgPyNsYybBIT01alwzLsYC4P4h7ytnBaZhhMwaTX/uSDxyya/H
         KqpA==
X-Forwarded-Encrypted: i=1; AL+hErGXcFH+QC5rMBO9BhFhiInM4AUovNqkCQ80BSZpYR1Q2d6/IEx1FF4RsiLpuPsR/EQ1IDw=@lists.linux.dev
X-Gm-Message-State: APuU4Z84HdyzWc6nBPl8fMimHQacgB1oavuCzVdboa1ONUshoAYRgVN0
	jmwQnqzGqzHyHg1I5zU+8XtrpryRyaRPO0bQLk8FxFtPQF8XhMEBpCrH
X-Gm-Gg: AYBFou0LHMNCE7tazvze3ReRE+DpgTkeWV9Raz3dTdSS2oPWIL5Lxe0wyiH8mbQtOR3
	z13W/elu8CPuNN4aLBmISQs7G6y5Hl0dIuuLyXNz6YJE3F/7FtTsyYUuEDWBIsa7qFA3PvJo9fS
	Jo5z11/bZWxOoPxI4iuSqGnARETa/j1z+p5XJ2ZcHKVtb/udVN6C/P7/rUxOgZ+Q1CvTWhMhGDh
	7jloNH3qNafvUlrEsbeo+xP5Ggm9mTngLyiEjA7efbyeMB/COujUSsUFzecVY0tvxf1ME/1iFnJ
	Ad1Jl4Uft/fpnEqCdJgTl3R0L921g5Qdd/3X5QD3di4Exq8wKjfL95VedaPqdbdIrN4fep69XkT
	DmjtwQ9gxCc35SJvX0qocvBBgOvG4Kgy4FPSz1AyCpvVzKTydpRUBtSLbyYuOG7jKIUK/fhNlKe
	YfmMb0/F5AOS/E3tqT/eucfPkEh47yq22Nhnuy8a9cguYpvHjh/AAzQl5wq6DZqCc6Vr6Jg2upj
	cRg11AbJw4dvTRqKQq+rmp77Wl00yzizgM+3uEVdGVmyu9UJG0PVMX1coDgh32b3FqGsbaT4hcz
	1SogW93Z8ra4C4espWraUR0wbDVGqrXkrGbPiPjRjUdC1Hm7Y9Fhs1fEHwL3hAw=
X-Received: by 2002:a05:600c:4e05:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4b963c6d1ffmr18967885e9.19.1794130595723;
        Sun, 08 Nov 2026 01:36:35 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e6eca30asm141650355e9.7.2026.11.08.01.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:36:35 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] ARM: imx_v6_v7_defconfig: drop the SY7636A MFD option
Date: Sun,  8 Nov 2026 09:36:02 +0000
Message-ID: <20261108093602.329554-6-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108093602.329554-1-pmazzini@gmail.com>
References: <20261108093602.329554-1-pmazzini@gmail.com>
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

The SY7636A is no longer bound through an MFD.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 arch/arm/configs/imx_v6_v7_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index ed588add8d31..f02b5605e533 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -239,7 +239,6 @@ CONFIG_MFD_DA9062=y
 CONFIG_MFD_DA9063=y
 CONFIG_MFD_MC13XXX_SPI=y
 CONFIG_MFD_MC13XXX_I2C=y
-CONFIG_MFD_SY7636A=y
 CONFIG_MFD_RN5T618=y
 CONFIG_MFD_STMPE=y
 CONFIG_MFD_ROHM_BD71828=y
-- 
2.52.0

