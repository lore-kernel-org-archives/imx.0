Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE1137756E
	for <imx@lists.linux.dev>; Sun, 15 Mar 2026 17:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773595518; cv=none; b=FkQ93F1B/TtpT/W3IqFWvhID0965BU5wShy41NbbBfzKpBuhtQiYVU+ynvYQjXrEMvGOIiWgIOBcjDPs786CSz0xHyUDhInug2a5r/uoetMDE0SbOmPWpGjI6uEPPd3PatotSgBWDLF1SVYvP7czo/5E6Iqyaw+vlE3uQhy1Rh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773595518; c=relaxed/simple;
	bh=t4IEjrlPC/zChObroSpygBEwzjH0OsQxo5JZHzvQ1T4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VV26TY3xIMoDnlBNKJvaNku8LvJkAXJd5lNveyrPr/qoWxXfay2RgzOGozBzc5IpjNe9p01Bq07fV7QXZt/6umYLmBBjFRdKuOSqQK13ejoIrmpYqIjOs5PmcqHAsUUhus6G4G0fcK3sm0kFqfpfe7NYW+DhU/IWbe0Qk82iX4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XPh6apC/; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPh6apC/"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852ff06541so42331305e9.2
        for <imx@lists.linux.dev>; Sun, 15 Mar 2026 10:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773595514; x=1774200314; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nwUo5hAkI8FkU3V+3kGLnu098RQoJ8LL+Qih0GJFD4o=;
        b=XPh6apC/lYTxFW/huPhF/Lo4OktRJn5fIElILmZ4aRHsg5nNGvUQQ17nwiMtIDFkdf
         iGePIWCFlRn3vtpeZ0MIRGIKm+bAftwFTMrKmkhDsYyUq89kBE6BdOrXVQVF67kvkuuT
         CYOu9aOZ0uSmD1XDDu4O3oYkAimXXwxmScZYFvU1rGl/xQmNJBf5bXyUAdMYxz8EoPm9
         GU6nTBuQCHaxdMsTdgR0zoYZOfn+n3+BGLCT2nYuuEskUK/XUJIr2f6TrbwahqOx9Cai
         nuYbJ224SQ2zeN5xcf6QgSi366mDNKS69kIkb172fslxcpFWtyRblBem5ERL5I8SI4U1
         DGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595514; x=1774200314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwUo5hAkI8FkU3V+3kGLnu098RQoJ8LL+Qih0GJFD4o=;
        b=brgt2QAPjvDG0/bYz7YnigClPNCLo57tP+E+z/hxfT/dwZLx4ZVF/8Hm/rs612HXJZ
         oyro3PuGLJw9ObcjxgxW0z/JwSpKBbA/MDYpdli4ANKGjDOyYaKejUEdx9FtKlGNenda
         G61d4XJ463hVyA6DVyrBRjQzBx6f56hdRvuBpXLJk4TG6pKGhgXiJkuBNfEufzYcOI+6
         fHLnML7wxnEpHokiIuH2DKbAzEqaFHoFU54liIRsYDXcbJ/5QZ8dXvZ/DdkOtN6084QU
         HBE6kKVGuN220n7MWf8Jlc023FiX+0HAqbl1lZFsk3alj8LZQeqB8rCSivuqr5e9+8Va
         kAqg==
X-Forwarded-Encrypted: i=1; AJvYcCWXNVcoyg/LLa3+sUiRBX9YY0eZuUvM0RBwYXPCnWbgrEURjcPVQ2ZJ8G3midYCX1BfKUA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxLvZPoKW6Krj8CUmPA3YS4g+2c/PMNZ03t7FesAQSxT9An44hq
	w9wwgEVBwZZhzNBiQhygQ+O6m6iiI802u3Bw7IcG1AtVFBm95YhA0xgL
X-Gm-Gg: ATEYQzzVuF+rX8h0zSn2ZAiqKHf7KTQMcfihNzaJ1LG1digmHvyt9UELzARLvfhuaue
	PGoFVVyMiYcA2Ms7zA9EE/9F5V1VAWCui3az+gNA4tM2a4csr7zb37x+H68zQpdT7UXLjhifl7s
	BDHUbTtM/z99pCfKpNgrPcKVS1xBPTRjveZZUECxA2532S+Rs5dfoQF2IUf1u6mYiIHCs88SH2O
	xhOvd09PXgXtnTYTqAAIz/YxGcyPLA6cqZH7fNzqz6oerv2qSRowZ5E+1KRJWtsQ39Fg+g6Ad2a
	zPwfNwMBhVd9Sgwyq4c6Vf2U1N1T7FW+YiMo8hPPyZd8YceIWtUEuJEOP6r6r6sC2gNeAi1QZx9
	kCWIwWQF13AjhdCdZxgvHeSAIs1QzrJAcy5Zk4aAkj2VULPV3Wk0xq0SSR378W7oJM5uuR7VJzb
	sMY/lNwg4Vwg3XWT9R2c8PPcLPHGiqUykMZmA=
X-Received: by 2002:a05:600c:45d5:b0:485:40a6:442e with SMTP id 5b1f17b1804b1-4855649c956mr173044125e9.0.1773595513423;
        Sun, 15 Mar 2026 10:25:13 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aa73easm457168325e9.3.2026.03.15.10.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:25:11 -0700 (PDT)
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
Date: Sun, 15 Mar 2026 18:25:04 +0100
Message-ID: <20260315172507.270480-1-adriangarciacasado42@gmail.com>
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
