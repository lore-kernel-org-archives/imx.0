Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F3A262D0B
	for <imx@lists.linux.dev>; Sun, 19 Jul 2026 19:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784490015; cv=none; b=pQxABvOWhHo9Y6M9dS4r5QRVhzLP3aEs5faz79I/dkxC3wmhhZQmtji2TIPvWdx/ORLGqsQOdpJWDFhdfAxJ0uQhKKjW1h97Tc1Fa28siRoFJJKUYAFScMc6uieDTbY/ssJjag2Ib5ryXeFo9D1Zm7Sy92MjGlQmqYDtlgd+5N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784490015; c=relaxed/simple;
	bh=aAF/T3Y8hCzCHm3lKRZATEXl7G4mF8YMLRaOfUViMSU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KunMfxjlYGJ5GzNwA6iuw8via7jmbLbN0hTIuVOHIf+ayrUMTj5Wh/jKfSLWS5JBUtlwSzUrHnIjKoivtXvEmxJqFnQ4XNREa6m8vpCErf4dVDI5XRYtsl6UDZz4QMuF3kZY/wEVZZ4CgoN5qTOQxpjkgXRKptGj4wcXYq601o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=omJdmPVu; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="omJdmPVu"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso7050681a91.2
        for <imx@lists.linux.dev>; Sun, 19 Jul 2026 12:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784490013; x=1785094813; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G937/UZ24uNo9RJH5F1RTklgc3d2mOnFL2BoYh6wUVA=;
        b=omJdmPVuIecHaQFaiqo7ADr4cGAtleL90rppdTBHCcw8umyez43GC5jdnk9v8Pul/H
         y2K4Z+oldpzZLaM7mAz6TnVaVK56HRjMRr8xIsvitRfUimJuEeeDrf8naD0ids3NaUzy
         6Is/43QwzA0PJvmbj23OuuKlPbZ3oDCG5Exm+worZaHGK/rs1qLFEQk5C/c6H17bCnAL
         sr3F/58uNfRvljGmn9YeYpg8kOYi5tUVKlc517VuJjZjHw2/gvBF4ZKCmOHJ4/Pys/vk
         zT8ihQV9jP5Z0myn7P45QZ5+ow1QS4etpMluuVAmaxslG/mymoY+EGg4SFV4flnzxQVh
         uzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784490013; x=1785094813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G937/UZ24uNo9RJH5F1RTklgc3d2mOnFL2BoYh6wUVA=;
        b=qvEfFpS9evy3OGogSckx0mOPf+DhbkuDaue0oY/jC/wq9T+yjdodKRguGhM2Ouu/ID
         FwRyTpw0bmPPvN4FbQT5wJBI75JXXJG4jazuasHz4iLTzVdnrFyBBpouNFToFTBGnf1f
         yHTXuq3Jy/BiC+Bsc+UaKj3rvlkXbMAjM9mhkgO2Tl+rMA44n1WcLSxmf7oPliukgopM
         4CEb3AhNtL4j6EWBcANrmVjbW6rxRUZyldnySdAue9b4bRARhWAGoS/9cbhV13HnDFcg
         tPu/vDKF2h+AJ0LFxYMHHoAvboFbEVDtxPfd/YVabRTDfjuQ17ECvgvRoNli+1JEjdHt
         YDJA==
X-Forwarded-Encrypted: i=1; AHgh+Rqqa7CmD6Md409AZ0mXfIDQS6CT8vMNoFS389wMgLm2RuMe9yqh9lxqXLmo+8g8kWVPNYI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxz/hSpeG6eZ57wEdoxvCHqL1wS8muv4wI4YRWeI+q6k7Xbovgj
	UCgW7dKyV0H2sPlxIOsPfClh5LGALxjxT2tKUgVhUd4y0eHmxFulPlGF
X-Gm-Gg: AfdE7cnqUMmj8jWPj3GRVFhflsKaXMz6i/HkaseHcwFD5Ss22ZTlOCzvaMYgiInY9Cp
	evCtM9jtsnnhOigJ6ilwX2GMkx6DtRAaRpvY+MLMAm/f1PX/WoUnYLWFe893fTYivBwKyjEi68W
	KSXJ7mQ/XuJm1IpbY551fk3cXZELtidr2m7qqgjRSZK3Sk+mHe7F+pbsM1XtrH/CSqcmku9uUbQ
	2B+mLOyrSzAbJJweC7L+VBmXRthAXh7lFFC7qTvHFwgUJXu8GRigTln6+USs6ynp159ziSjDrQe
	XVpVin4punipjw5WpHBI2gwZxFJ/fFMw6SvrBhF358yipN+G4QR2Y02hMzvDwP/WtBFth3bDE0D
	hr9z/WQUGH8nUudLlzCmlxB4g8rYCY3vghqnJdY+w7xh6iMzHvV2GMaVWQRklcwtRwdMagmjuTj
	BRtCa80+fzrEBGCfmKiwTSLSGRxLZqXPkP2Dr0RL9pjuEaepCuB7uHvzPqIob+ixoRk2ElpryxU
	E+HWiY6QQevqbTzH5dfBen6ZLZAOr4OQVUo3KUrVEVVZEvbL81ynycRczF/5doD3Q==
X-Received: by 2002:a17:90b:3942:b0:37f:9ce1:cda8 with SMTP id 98e67ed59e1d1-38e4b59469cmr11738666a91.30.1784490013570;
        Sun, 19 Jul 2026 12:40:13 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e3a0fb993sm6308126a91.15.2026.07.19.12.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 12:40:11 -0700 (PDT)
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
Subject: [PATCH 0/2] EDAC: fsl_ddr: probe failure and remove lifetime fixes
Date: Sun, 19 Jul 2026 12:40:07 -0700
Message-ID: <20260719194009.117532-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes two lifetime/error-path issues in the FSL DDR EDAC
driver (drivers/edac/fsl_ddr_edac.c):

* Patch 1: On probe failure, fsl_mc_err_probe() leaves the memory
  controller hardware configured to generate interrupts (DISABLE cleared,
  INT_EN set) while no handler is registered, which can trigger an
  unhandled interrupt storm on the shared IRQ line. Restore the MC error
  registers in both error paths.

* Patch 2: The devm-requested IRQ passes mci as context, but
  fsl_mc_err_remove() frees mci via edac_mc_free() before devres tears
  down the IRQ, leaving a use-after-free window for the shared interrupt
  handler. Manage mci lifetime through devres so it is freed only after
  the IRQ is released.

Both patches are build-tested for arm64 (defconfig + CONFIG_EDAC_FSL_DDR)
with LLVM=1.

Rosen Penev (2):
  EDAC: fsl_ddr: restore MC error registers on probe failure
  EDAC: fsl_ddr: manage mci lifetime via devres to fix remove UAF

 drivers/edac/fsl_ddr_edac.c | 42 +++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 16 deletions(-)

-- 
2.55.0

