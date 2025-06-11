Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6610626E709
	for <imx@lists.linux.dev>; Wed, 11 Jun 2025 12:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646458; cv=none; b=YhHs2w2BXWyxtmKgkmiRMIb0pik0dKn+Ew9VOnEjACFxcuMwNvPnGUg4Uy2Fzkdt8rvC5cd9ecOPbOMVUUbw6PMo4oYd2LBs//Pvb6szwBnZiuENhrqwpJaosocsENxiNNFvHtzMRWTwrPN68xr3hXoOQzQwYPKzcChhALeTtZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646458; c=relaxed/simple;
	bh=MwCg4L2h46PDOS0g7q2n/0TFp7dWTy5pPJdpMQqZbyo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jpA9h9ikGNKj6gbSyPdDzzQBDFg75bxlt92Jl0dTA798VidvqhRiBDskxFxYnjhGl7CdwR9bMvInBzw66b1T8CXYRmDGoK1fwJTryZo9q+q3spB/xguyQnMTIiwuw7LyAY6BJcQeT+iKwMNd1KNzi5hCPoy1WCuD8ghO2SVEjgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=MoIc1cmb; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="MoIc1cmb"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a5096158dcso5593422f8f.1
        for <imx@lists.linux.dev>; Wed, 11 Jun 2025 05:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749646455; x=1750251255; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3hcVPfIPjKgnN/jxAK+0iuHy/Mp3frsm9eTH/rmctjg=;
        b=MoIc1cmbbuj4YeasK6Hhut8VxTtnDVLpl0GW7bH1vW8dXksWD61IIlvU/kRbb/GonG
         UTemQh/hfNkBhcY941Pyu+7huRBrpHaKayEvh2m6gVKSW3Ne4daux/KSCFuYCQglkuYk
         zIwwhmA02A1iDa37zF42mu3ZLbPGoQKCBfL2tH1PhpPMnLHAoPkxkKXqZH9ZJyQTKP9e
         Ihu5QjHlI6S+amqdCTz0WkQZJbmN1+N8t7lq82YvYDjMwTn2kZwlkSSGnxnqX0rrdAn4
         RpV4feTO3cx7+J76tZYHHoSeeB3xTK2QOkILRPQXk9OjRExG6aFNyI3+cHR58zAyenwT
         vafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646455; x=1750251255;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3hcVPfIPjKgnN/jxAK+0iuHy/Mp3frsm9eTH/rmctjg=;
        b=sEArBHobbsHLErIucSs6wb+Kefuf/8Ds2KSBoav0cWEB0uqi8XTPT0NpRa1XokMLsg
         EFifae74FTC6JiOy0FlARugqM5CKciZVOoGVLE3h8MtaMftmVPwjM3z482Yl5vsriZMQ
         tdRmFV9QR+g3w9NQeBPllrR+48gYoFJm6SxXv91bsR81NI1YvJDIclgE2xRvsJci/7WM
         D0llLR4Si4976WbDqRhNOHmekT8897lVD276I/JSPdPDUz7dQU2k6KEwiHII0QUZHv+q
         rW2RnEvmmBZ28clQDpBVZUD2unbtnuErx1y+Gw08qg03trUH39Dy5uXmBgdYaQLvNPcc
         DAJA==
X-Forwarded-Encrypted: i=1; AJvYcCWLFpHbJA51Eg0OCkrGsqPWp2nEczheKRV2KyyblVmCxQfUf2uCGhBXI+nfNq2fqEV5RJ0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwbpssnPleLg9LmQWE47GqcKUfbWTWLE82wa4Hb3oBMU/O2dxqb
	DTFvzT3YKxf4q1o/XQ8wIUthnpxebN0OUjHecFrwMqFhJuWCMs7w/Jk7Xn1XCkQxWJM=
X-Gm-Gg: ASbGncty0NWDrRx2Lp460tII5d8RJCCyrSIL28wkCoyB0VTm8ZJ7i7PBXvPYNjto0Xv
	NMV4w98LUTTBs4dCRt8wdvCHGEl7ARrVAyy8R0uSjjMy4H3Q7nDMD+YWD9ISAiuAkwa7GunaLZH
	bonH+FBK2SgdsJWBoWyNBzZJnTIU5SZYAvS88t/2sMLsR/+POP91N7X3jsrl/B/Sc7d7FDSZBX1
	oEAuOsWbS2ZAt/jR+m46HazJ5DmN2a1PIhzkAoauV3nSqm4YRPauaU56kqsEM0FtINBgjBxCyXQ
	HWRxwJ6xJl1B70gKkZMxaMh/4/SZ7D2c0mg2B7JAdG9HXlMoW9vLH9LDHqixRebHWkJB9zf0CgY
	8
X-Google-Smtp-Source: AGHT+IGrOsdxa4zJCbGnTi4fEsX+7CHAps/JT+rDRqNsXkWOF1cXauuh0d8YfM1q6aZsNyF7ST0Luw==
X-Received: by 2002:a05:6000:1448:b0:3a4:f52d:8b11 with SMTP id ffacd0b85a97d-3a5586f1905mr2571117f8f.20.1749646454734;
        Wed, 11 Jun 2025 05:54:14 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8ef3:a82f:ccaa:91b5])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a53245275esm15225486f8f.76.2025.06.11.05.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:54:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/4] clk: use the auxiliary device creation helper
Date: Wed, 11 Jun 2025 14:53:55 +0200
Message-Id: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGN8SWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0ND3eScbN3E0gpdA0tDs1QDMwvLJMM0JaDqgqLUtMwKsEnRsbW1AFE
 JXr9ZAAAA
X-Change-ID: 20250611-clk-aux-0916e0689b1f
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1358; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=MwCg4L2h46PDOS0g7q2n/0TFp7dWTy5pPJdpMQqZbyo=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoSXxt57wn6gj2MMaDJqXctxiVe/tEY4F+6WgSm
 BnehdmmFCqJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaEl8bQAKCRDm/A8cN/La
 hV6kD/4mGMjR2Csvf4Ac7+0h9kIkcrt+1BCIsyu7vwlVO5wjBbzWtmF7BE6DQqByhYj1kk2WBcj
 y167kxXU9BFQ41uDY1MCnyPCp3WYUj3c+RR93vorROw+S1ly382yPWEBrE8uhY+rHiiBTrdOwsI
 h/SJbofzfUdCnCYA1Nzj8mbOnR/F0Le8LFdXtcHEjXvHu7tq9YJg64XwjXCQ1NBndkGclowoBQ1
 YXn9L/WM6qXhVilWbeMq4pDMMoE2EKP7gIuj93iNbtuHqqSyTPTJBCbrYCXSVaJ8KOwKRzf/4S9
 KoiKe+nPFlHxM7fCBW65F/BrfxwBqjPhp7epi9iZvqIFg7OlDW69nCy+UogWg1lb62tAIA5lEjT
 kf+omgPU5kR9UgjbG34eKbe30yHput+jherUVzyWZAWJENmL3uEOt4BoTV45navcvdaIBPdJ96W
 8qq8vlmjdnwPqPZDOBj6/tPBre4GYpgxDIwrhlwRiqTrxRKlHe0V8yGGewu5ARh3Zu6oTVZrRCv
 pPJr05s++w6148vJUMNhFcTkuyQpIKBg7Ca+Qyt2Bh0YxKw3m+KF3YCU6Lr14zr6RmYPD1S8pVv
 0+xW+vylPjCd8KSajuG7qkmLX2dzHXoY2NDlPGSG6DcicgVxfEMbtP7apQ358uzjYH1c6uSy0mn
 RNqdkBmE81/FQ+Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

This series is essentially a resend of the clock related changes of this
series [1] sent a few months ago.

The necessary auxiliary bus support has now been merged with
v6.16-rc1, so this change should be safe to apply.

I've included the reset change from Theo. It has been reviewed by Philipp
and it is probably best if it can go along the eyeq clock change to avoid a
WARN() in reset.

[1]: https://lore.kernel.org/r/20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (3):
      clk: eyeq: use the auxiliary device creation helper
      clk: clk-imx8mp-audiomix: use the auxiliary device creation helper
      clk: amlogic: axg-audio: use the auxiliary reset driver

Théo Lebrun (1):
      reset: eyeq: drop device_set_of_node_from_dev() done by parent

 drivers/clk/clk-eyeq.c                |  57 ++++-------------
 drivers/clk/imx/clk-imx8mp-audiomix.c |  49 +++------------
 drivers/clk/meson/Kconfig             |   3 +-
 drivers/clk/meson/axg-audio.c         | 114 ++++------------------------------
 drivers/reset/reset-eyeq.c            |  13 +---
 5 files changed, 37 insertions(+), 199 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250611-clk-aux-0916e0689b1f

Best regards,
-- 
Jerome

