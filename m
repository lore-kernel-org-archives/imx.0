Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71654317D
	for <imx@lists.linux.dev>; Sun, 15 Mar 2026 17:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773595020; cv=none; b=HSKIiCMP0yYe5sPrHcuhUZ8bYyZdh6EspbPC4jLhkZ3Ixf1TOXZeeZxsiTE3W3iQVvj+eW/Pkmnf96pCVKnlu9Z89ESeSB+3T99In1juWaCZu5UopAuGWZA0GFS5CSprROmKt957wPxuGVloQyOJ7HfHZQWY89Xr7XiCoUy5VtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773595020; c=relaxed/simple;
	bh=Da/cK6OQrHU3pcAlgLxrLXJu8wvJOC9tkJMNybOwlek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NIJLPkGWtxXFE6l0UFvCouq7L48LDDMZ4pxXLNQBl504uQYjd6G7X+p0W4WV1BEhhPZiJTPnJOTt0dQdudJ/WLcMKlq3/dqSsihVd0VvSKkksb3g0C8Aaf/pCCTeuK7GTytBZN9eH3PLRhCr2XShI189g9qjA4jawQFDXcpzez0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ciLNr0m/; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ciLNr0m/"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-482f454be5bso45698545e9.0
        for <imx@lists.linux.dev>; Sun, 15 Mar 2026 10:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773595017; x=1774199817; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MVyBXQRSzr9/lSeks120us8HXOhp+dnwI23FH9hEtAQ=;
        b=ciLNr0m/U+YCVO+LF4gcPr655Wtm+/j+8oWfaR/Y0BLRQs9Y8YwRDw6gjKGkf8np4n
         enZGfx8pn9n8sEeTlML+fhWyxqCj5uR6q9eQLuIsCxsnHQnQKqbwc9SgZerzXgQ8hNtX
         +jSmdFqNME0A0Gy/lG7V10l7iMYPvosZtMDdxSfdUN4iVR1l1GNtHaMZkzniSwNReXVZ
         J4S668bEVDfRKNBdljLafbQ/fbcWQ9zQ5MtRu4tjX2TX8g8enKZvvcEcAydG3xTb/fas
         UTiyo5vuKNo6ztNPYHaSew20DvLHEd7kDbxCQWzzWOhcHNgCadEv8ZyfxozEsiMNGhgL
         NaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595017; x=1774199817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVyBXQRSzr9/lSeks120us8HXOhp+dnwI23FH9hEtAQ=;
        b=qb5J2DN5yV3xLh/lagcmD1N6FHx1YEiLxKA4C5MkYFgeADrWQ5A+KT30UboBdorwBK
         MwBKwMHXemeMyoP1Rfld3nm8Av/Bw0zSyfKYFipzeqQJoz4P2gtvchs85/9D3OtWMmBu
         hky+bCSdl4nJKcR+VLhu03y1CMqNUVvcFt0+UCVwE7a5tg+kNkucQVpBMrQhFDXW3AQO
         x6EK7pOe0b2QjHyHvbKmAtPls2F2B/zpISUDFRmZSXHI8A4xBptKbbubRosqp1B8Sm3w
         CxIXUXuSXR6uevqoBOpjBQ6FoKB0xc04laG9k0U0owk3vwE1n9N2GmQ1FFYTh4H6HhXk
         S30w==
X-Forwarded-Encrypted: i=1; AJvYcCVZ7i7wkRe9v2u0X0gXcbjxeF2qNri81Lt+GKJSyZzTdO1Kwop0KI6QHpb/E51CJ5vnHz0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIwXp8ViQj7V1GsOkFhx6iwgBUMKQau8bBQSCRjgxwae95v8pR
	48+GN+fTzpCmF0yq2+30chI/KOXHtGNDz6QYYvyyU/EK6DPRYRsAp+k5
X-Gm-Gg: ATEYQzxoYtnwTJNumdheM/KHVIUrbx+la9Uh7/8C9B7UkvaT6+N3J8csfdiiBhUlpWK
	QWzQmGTgOQ2brx7w0oVOZDCrgdG7thYLA8nsk5kr4BprNWVisfqKuleX15ZVjFSZlgeAm4NkG+a
	IA8yZSyeS59ujBmoJ30V+OyRs/s1+maCAVWtHwhcqIB2p0r8u9zRFmTzu8Zq4NXT/EGpNeO2liW
	UyJF+iI2hjc/ti4UHVt/cYv1VoXF2TRefg9fXD7amcxPF+b4X+sjDR7vd1qXVJO+3MUKVpRXeMf
	XvChxJadyoey5SBp4oRDls2X9F3cM53GLFaaoEyL5beRc1+53gYZEoreYqEVahzrnwgTRUEPRLM
	9a2/HSDcxaRykLIeChB2g33TtccTlJLq0BLxNl++hPYVcG9N7EbPc32ypPltt16IDi9SY53Ivpv
	RCMbUcd9cKfqZvRZ7r/88eIOw35oPK3wZIZQ==
X-Received: by 2002:a05:600c:230c:b0:485:3a4f:8bfb with SMTP id 5b1f17b1804b1-4854f56bf7bmr178045195e9.6.1773595016983;
        Sun, 15 Mar 2026 10:16:56 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe21b631sm40536429f8f.27.2026.03.15.10.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:16:56 -0700 (PDT)
From: Adrian Garcia Cicuelo <adriangarciacasado42@gmail.com>
X-Google-Original-From: Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Boqun Feng <boqun@kernel.org>,
	linux-mmc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
Subject: [PATCH v2 0/3] Optimization and alignment for MMC, Rust and iwlwifi
Date: Sun, 15 Mar 2026 18:16:49 +0100
Message-ID: <20260315171652.269020-1-adriangarciacicuelo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series provides functional optimizations and alignments for 
multiple kernel components, specifically targeting MMC quirks, 
Rust block driver abstractions, and iwlwifi interrupt affinity.

These changes were previously submitted as a single monolithic patch 
but have now been split into logical, atomic commits as requested. 
The code style has been verified against checkpatch.pl.

Summary of changes:
1. MMC: Consolidate imx25/35 quirk data and add Kingston CID support.
2. Rust: Update rnull driver to use Pin<KBox<QueueData>> for alignment
   with kernel 7.0 zero-copy initialization.
3. iwlwifi: Optimize MSI-X interrupt affinity mapping by skipping 
   the boot core (CPU0) for high-rate RSS queues.

v1 -> v2:
- Split monolithic patch into logical commits.
- Removed accidental addition of nested kernel repository.
- Fixed Rust code style (line wrapping).
- Fixed iwlwifi white space issue.
- Wrapped commit descriptions to 75 characters.

Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Haibo Chen <haibo.chen@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Boqun Feng <boqun@kernel.org>
Cc: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: linux-mmc@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-block@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org
Cc: linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Adrian Garcia Cicuelo (3):
  mmc: sdhci-esdhc-imx: consolidate imx25/35 data and add Kingston CID
  rust: block: rnull: update to Pin<KBox<QueueData>> for PinInit
  wifi: iwlwifi: pcie: optimize MSI-X interrupt affinity

 drivers/block/rnull/rnull.rs                         | 13 +++++++++----
 drivers/mmc/core/quirks.h                            |  4 ++++
 drivers/mmc/host/sdhci-esdhc-imx.c                   | 12 ++++--------
 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c | 10 ++++++++++
 4 files changed, 27 insertions(+), 12 deletions(-)

-- 
2.34.1
