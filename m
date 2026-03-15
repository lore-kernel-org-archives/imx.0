Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CA3375AD4
	for <imx@lists.linux.dev>; Sun, 15 Mar 2026 17:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773595676; cv=none; b=G6HEmFkLO6tkBzH3nOCHtaIGKDGeZkV4Q9lttURa3u/RwF9WT5fr4DaWm3inmIa1xA5Y3ljEuR5nDPQ9svEz0SatWnNEWeNgYzPW+jEVVgOsiyywlBng/ad8FApmKiw5zwnEbsZztyxBe2DjBZFLN3wvJKGj7aeIcm1HmjJzulA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773595676; c=relaxed/simple;
	bh=t4IEjrlPC/zChObroSpygBEwzjH0OsQxo5JZHzvQ1T4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uojZ5ggG7hZ7zued4xIP5gQk80OziBtNxcM7At5uYqYC+1Ccwiej2dy6C/OwLpjBidPphn9BB6T1FS/b8hpVFx/hVoBFfrlLneOvs1w92M6ncN7W2cIRUmEoTiD7Uhkwg4sY3DxPiUOqkSn1YNu5SRgRh02IZMfq5tZvoWCJqH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KwB1Qyty; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KwB1Qyty"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-485409ab264so26203925e9.1
        for <imx@lists.linux.dev>; Sun, 15 Mar 2026 10:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773595673; x=1774200473; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nwUo5hAkI8FkU3V+3kGLnu098RQoJ8LL+Qih0GJFD4o=;
        b=KwB1QytyMYF4rVuqu0ghlmxK9VUWhhkIvUqpjGqgLxJ6TOKHO9ZBgVTMHCR3CQTYYV
         tlXcH+SsW2eQFKKh6XBsJBg7uq1RfSUG7cqrllAiKSMuRikP3QnHtmz8V9UImvQuyGqg
         PnMnNTjHN2Sbl42SM8wbw/cgftMeIh4NHZfcdLiUyh6BaUoCBXWvPObz3gBJwcQvckg8
         nu7PXugN5XfJHbZZtVss8mijnnuDcfm7TR6PBIGVQJC2eJUjtykiXxXguPVyniN7LNZ/
         mD8Wk48RxHRp1XwcuMRrlBWHLdIyK2i2BnQRS/IzRRIB/Nfzg5F5xPvIPpWErhMDv1ta
         wRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595673; x=1774200473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwUo5hAkI8FkU3V+3kGLnu098RQoJ8LL+Qih0GJFD4o=;
        b=aoZc4IpQiFgpuFwjx9eg63CfR5NevXmDuS9BwZ5MpgaahXAaa9DRTNvaAQwfnyhXV7
         CkuqykAxC6dX19QPyj993/0/11ws4FWiNbE3ieTI1K5O0jGsCNAp1z1Ucqn2DkWQKaxP
         OgWiVZq8wWF/CIO3btW3SFFEz7lNgMSIjMeXaQ9SDNP/3ScQOrbSdGq3HWCM8dZDY+ml
         ts649+I8v9S3wqzpzaVo9C1gk827sAiyBGheIh2QWCjCMwNRjD97B/Um+M/Yvdlyyz7w
         ooX2HufDXG2WEI2mll5XJDRL729Lj2Hvw3ITuvJfI7mf7uXhu0AnlixgpDwKZX34dB9s
         wmtA==
X-Forwarded-Encrypted: i=1; AJvYcCWN94BHPtqjuDopWas+qWViT95negIph6FcPK91cBO0qPhOLRu30dzIFcQZeMg2hKv6Vzc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzfNVwrxahsSirtIRwh0muRd51kl67EwgoKeckushppVhBsiyCh
	NprFPxcxljTFpt5rMJO3esrpD1yTivElpvjl7JMsQiVJB3Br5LVSFKT9
X-Gm-Gg: ATEYQzzbRNd1SZrTw/t7zrGfrUYv0A05t7cMQYozdlEYvuBGYzwE1DCuximsb8+G2LP
	1QGBMQ9X2ep5FLDh6A+2Rj89jXfWo5vqfqhRtZ7ckbtMWtTAucIlPvRXOG/dGCr/tz5v8nAw8Jd
	yaDU6/jeIMUOp26eRO2JrpPWrMvgfpvIbnQkxV/c3obj1z7QVkUB9V4z3D5VOSDFgGK6refbt1F
	jY+4xEahV9Xz5ssojklBzTp8/YOBBVpYaEetv6x4M231JpuKn8x/uUN8P/CRd3+C6UtgmNE6tdj
	hXlz8V7prKlC6lf6F4fQdjHx6s1kPWcUwfWXcC0W6pbvlz/npsAN7nMB0/xZkgbxbchtAVjklgb
	dmCdDZAIQLt5l1I8UWZEDXrLPxdgId/u+P5h7E6OaY5ZRnk/T5ztU8Tpom1pXuUVyiWF71w+Upi
	4AXE79+NTc9vcgCNGz+nkPLmnb0T96qUTYTcYgnxaaKXTWmQ==
X-Received: by 2002:a05:600c:4594:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-48555acaddcmr154699455e9.8.1773595672220;
        Sun, 15 Mar 2026 10:27:52 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557c6586csm73644905e9.20.2026.03.15.10.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:27:51 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
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
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
Subject: [PATCH v2 0/3] Optimization and alignment for MMC, Rust and iwlwifi
Date: Sun, 15 Mar 2026 18:26:37 +0100
Message-ID: <20260315172746.270734-1-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
- Updated author and email to Adrián García Casado <adriangarciacasado42@gmail.com>.
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

Adrián García Casado (3):
  wifi: iwlwifi: pcie: optimize MSI-X interrupt affinity
  rust: block: rnull: update to Pin<KBox<QueueData>> for PinInit
  mmc: sdhci-esdhc-imx: consolidate imx25/35 data and add Kingston CID

 drivers/block/rnull/rnull.rs                         | 13 +++++++++----
 drivers/mmc/core/quirks.h                            |  4 ++++
 drivers/mmc/host/sdhci-esdhc-imx.c                   | 12 ++++--------
 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c | 10 ++++++++++
 4 files changed, 27 insertions(+), 12 deletions(-)

-- 
2.47.3
