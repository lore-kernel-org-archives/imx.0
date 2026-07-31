Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2CD175A64
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 01:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785460894; cv=none; b=EbAN/5vym+vCEjtxiLXCpPyWtKa2g+RB6ymwiy8zpl7Egt5ZZNMCFLNzcbaf/gRJRP0VP3Ke43ylwnX+wy+DJECV/1XLwSTl21Zx07+zFnvCY6Yiq/zlGeCpWg+W/pP+4ToPlNOBMZ/gMMeFr0Jpzv2XeVMrzOpt96bFQr8Jres=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785460894; c=relaxed/simple;
	bh=+4rmNqUCv5cZ7pndOhXrQMHAQ4UxfWW+wlQP/2xHpmA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=StjcfHBya2bUZSSMUOdbYIb/wjhaVuPeCF0WHON8e8RaZBfFrSzshNJ7KcNaNrTnMvWsnOMMUT2jCw9GgA0utfDyyypJuKOtkCC/VyqVrCag/EpenT7NVWXF9JiihnNV7zJ2ADrENGO74yPhG1kKYGmmmZu6HCh9hZWVrBWXlm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gi2wK84m; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gi2wK84m"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso416642a91.0
        for <imx@lists.linux.dev>; Thu, 30 Jul 2026 18:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785460892; x=1786065692; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M0IyVD+1y/522lnq/7Lp1HsNfM3GsCs6wBHZ3/ZAaR0=;
        b=Gi2wK84mmh7CpHuAO7Q5dHUrQxqdiCq1sBAU8NjmpDZ2ZoGXUCG8Qh5ucoobzC13ui
         sX8jK8LV7TAUqopC7HgToA2/KSm51OpZPW8r2EsQ1LyuMvqN+bMZraRgBVcOcXJ2uOU8
         gke7Sm5q/bVyTH/5R1Xoms0wg5PL5cn9r9LfZiXGM3sr1E8nGfzLSNsZPf2hVMGWvDms
         yG8jlVDkVGK8mZwTN9uvgJvhBBSYklvCo2HNaqkIycIQD8rEbvOqowei/yHArMdRDZbm
         bKWCow3eyyQMNaA7noUjvCWhltJRT+oh0xd6QZU6Krd8Q0zl0xaK+/v93iyD2ZN+XxQs
         nPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785460892; x=1786065692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M0IyVD+1y/522lnq/7Lp1HsNfM3GsCs6wBHZ3/ZAaR0=;
        b=Du6o415BsZQ9H8355ELlf/FaiEs06LZyvKne+V8icbiX6xUwUaZ61GjKckOb42KJma
         pdGKjV35L/OCsy/WgvseoAx3lmd4PCCe5zcFZ9fV/ALt5Ycsu9gu1QaHazoWL/KIwlOG
         vEETEKl4fL/49pZ397V4oWJVacyQIocSqQeAPFFCxd66kpV/1nzs1aF00+VbFh/j/Pqo
         kSm+HN/8sd54eazJgMoQAYoZUzQ4OqquOamXRaACF0C5aslika9VL1nETiYUSEhYeTlh
         MLJS2b73OTBWn3k0ptG+nmiRq7d7MVMo9xYmfqLb+ilbMi/biASeDEL3qua+ZLF8wlDA
         zCfA==
X-Forwarded-Encrypted: i=1; AHgh+RpcbhLrIZLBhSJ0vlT/bVViH31rKLwPJUQ/4Izj0UJDEDH1kS9R7ceTLp558WwnfSAeO7Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxl2tu6maCMRaG1SW4TrFEMdOejJ7uS/UBd1C7pKji8quuIGOE5
	SgEthHAoMqtOzjSPT95OTtjbwp6G0+izza3OHGCP6jR1xDDHFS/ZETUZ
X-Gm-Gg: AR+sD13Gcysi3c9iR5o4ckmDvToJAWn+AB7TmhqA4sEQshZHGreZo21hZjhBZr7gAcD
	uo+YVHttEEXS5TrTKcXgv6B/+/PWKxkxY8+p2P6uWxbJCgZ0JGPgJKGeWvZNuOsUUDui6BceX0n
	ODrP7N2B77jCSEPnQYNJT61kfoOCkMzA9Ez6GpObyTo8dyf+ZaDD89yfBXPiDKNNfRZnd8CK9yW
	VgLK8BXqi6TBLRNvdUju8QUXpEgpJVQVV3retTeR/uCrb6ZzAMNMeZ1tdygPMUvmPgaL6nByGcl
	siC5iLQ5Xx8f10lt9q+4KZWuRLlymg1V3XwX8/e/5X7rCx61qxxVA3viCVKUSh1AdYkmwggNkvh
	v15vtWCQ8jtT7RB11i0HuE/PjXaxpeEvjnBFrBciSXb+UcyM4QPeNblfRf7e1sRS+jKbBd4HKkC
	VbxHf+mKjvYuLxE3qcjwLO27HVJ+t9prBK47T+THty1qavB0dyeDGoJBvBKUoB7RgSQT9aanV24
	yNax1u3G4yPTRZy3BqJeCpeuNxNwGL/9aFoyzsB3E0ymHtszXijbzW/24HCNFfQ3ABYbjztNild
	V8gTS5eECg2qErqdwCvBkhfXAjhX3+Fc63/vXg==
X-Received: by 2002:a17:90b:5188:b0:387:e0db:3d8d with SMTP id 98e67ed59e1d1-38fb14917afmr92506a91.40.1785460892423;
        Thu, 30 Jul 2026 18:21:32 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38facf50124sm198867a91.3.2026.07.30.18.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 18:21:31 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	York Sun <york.sun@nxp.com>,
	imx@lists.linux.dev (open list:EDAC-FSL_DDR),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv2 0/3] EDAC/fsl_ddr: some cleanups
Date: Thu, 30 Jul 2026 18:21:27 -0700
Message-ID: <20260731012130.1212640-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First one is a cleanup for devm_platform_ioremap_resource() and some bugs.

Others are issues flagged by sashiko.

Rosen Penev (3):
  EDAC/fsl_ddr: use devm_platform_ioremap_resource()
  EDAC/fsl_ddr: use non devm for request_irq()
  EDAC/fsl_ddr: restore MC error registers on probe failure

 drivers/edac/fsl_ddr_edac.c | 56 ++++++++++++-------------------------
 1 file changed, 18 insertions(+), 38 deletions(-)

-- 
2.55.0

