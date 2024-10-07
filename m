Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00BF82485
	for <imx@lists.linux.dev>; Mon,  7 Oct 2024 08:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728290925; cv=none; b=Mt9s5SmkriYsRlVh/+vyOHT6a/OwT2x9mCBsdUdxmdGbPPR3vs2B2UFAWGHts2dDV+EAaqLcWgL1SPs88fyq0mGu0Y3ZiteifqGiExBpoAeKoEz6HrvhRBYv9a3A3hflG40UU7Y9UocYrnkIxEVGq91PdfvxptZkHiIqZyXsh+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728290925; c=relaxed/simple;
	bh=WopIqxNCDiLoff/Ze+eAjvtYLdMjmy90+UIfvteCqpw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=t4QDEIntynU/FCAwAJEuy8lEeke+/434/9DMx9vGzfNEi/a67N7la59IvwWjfIo62LCzYlCVWG+2yT31GrtaOykxUQJlHo+3rRmAZiImMx/RKCyH7KSrkUMxkWn91oSahJ6dJ1Jv0CjzK5KijGt+kVmtkZfsJ92FCjsmUueXcXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=felHBiNk; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="felHBiNk"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9939f20ca0so282141766b.1
        for <imx@lists.linux.dev>; Mon, 07 Oct 2024 01:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728290922; x=1728895722; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yhKs2FfCM3Z7w1CzENDRQ+tMB67rwQA/Uj+rq9gCPhw=;
        b=felHBiNk8WWdl8e5Hzw116nKGm+EFEv3pS0hQMJU4ivRXLfrzVo7k/Z9rTxHHu29r6
         JxsLrFJ9x+/u+WJitC9oGVS4wi5GtaM4ZtLBSPMIN/rG6G7O9z6WbdCbtv1bgviq9toT
         lVpKHYfKRXpYBlOw9krcVG2Y87iNPUSAf0XXETKJgWUt5V7E/b78Rp6OnQScXxEYCXiV
         Yq6nRdtMVFKG6+GX7wDUBzxWaeFj9EoRZTY8zoxW9QeLXhWPVeWRB24hmVvOUTxPdAva
         v9dlQemNajv7iGkJP28xXGJk2Kz92FGAcJ5DNIubkNkJzwEJqep3wSfSYVGkhierSAmN
         OpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728290922; x=1728895722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yhKs2FfCM3Z7w1CzENDRQ+tMB67rwQA/Uj+rq9gCPhw=;
        b=b2YKreNh2E39MMdht+9E2aUY+rFFL7obbijvSRRqZqh2DnSX5Idg+gZV1U5oShBSwy
         eMt/za05LyU9hLx4eZd0B0zY/OLANDEsMi4PXfKWmfkmC91BtQr4e8Km3PVHh2F3hT71
         /0O2qcFqsBqUrJNFn4umE2I8P0nlyx2dwyH08dhrPg+57cNZBOpgjwFHYEdnEMR7A9xw
         xiKElvxb/wskTFVAPyKeTNcQM5N49PfRARqZ3v578Gb/J7sKbTu1Iboaza516ePSrWyk
         D59YxiS6tt+tmNSNogc00vsurzw2LNgi4Na11V5sBv6vbp6M0fr1X7gvw1x92s7RCcf8
         r49A==
X-Forwarded-Encrypted: i=1; AJvYcCUnPwok+Ji6MwtAXn3jIyaD9VW33R5AZmmPPLG04qsKVwoxDxySTWM9QKh0nUCtJNZJxa4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyVztif+Mn5ZYmxPSJ53mcsZ3xwVioEEDrZNmo/6vo0xIl/VwjE
	tIAkg1+TZ+krvSYB6T/DiulgEEwYTRydwcR2UCVdmXGpNbvEKDhe
X-Google-Smtp-Source: AGHT+IHKchNuoOAZZvcCsHWGswmIrcJQuFy0gw3grDmvDHvzW723I7g1EoMwqLb5dtqxi5M6N5tpYA==
X-Received: by 2002:a17:907:8b93:b0:a99:5bb3:1237 with SMTP id a640c23a62f3a-a995bb315a1mr139414866b.52.1728290921889;
        Mon, 07 Oct 2024 01:48:41 -0700 (PDT)
Received: from localhost (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9937615e85sm327739166b.175.2024.10.07.01.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 01:48:41 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] clk: imx: pll14xx: Fix potential integer overflow on multiplication
Date: Mon,  7 Oct 2024 09:48:40 +0100
Message-Id: <20241007084840.1167527-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The calculation of fout is using int multiplication and assigning
the result to a u64, this can potentially overflow if the int variable
mdiv is too large. Fix this by making the 65536 a u64 value to ensure a
u64 multiplication is being performed to avoid the overflow.

Fixes: 53990cf9d5b4 ("clk: imx: pll14xx: consolidate rate calculation")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/clk/imx/clk-pll14xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index d63564dbb12c..2afe361fc711 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -107,7 +107,7 @@ static long pll14xx_calc_rate(struct clk_pll14xx *pll, int mdiv, int pdiv,
 	u64 fout = prate;
 
 	/* fout = (m * 65536 + k) * Fin / (p * 65536) / (1 << sdiv) */
-	fout *= (mdiv * 65536 + kdiv);
+	fout *= (mdiv * 65536ULL + kdiv);
 	pdiv *= 65536;
 
 	do_div(fout, pdiv << sdiv);
-- 
2.46.2

