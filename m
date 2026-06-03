Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1FA3DCDA0
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 02:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780455558; cv=none; b=oZ+p4ijXN3HqqJ/7I4TSX65j9z/AgtAKnl3jCTdkYMhuJUYUHj+ZBI7aYaGXRCmEOSEl6ncVJGoDGr0ng59e+KXtoJo2b0ofREZ0Af0/E7P22w2dVW91og4esC/DN3Ftz2MF4Zv4AKfsXod8QnXjAYDiYFPwDx9g0pf+2i4YBuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780455558; c=relaxed/simple;
	bh=gX6a4+NLwKi7rV6ZInPZFYyjhB+ssYjt8EtCqQtXz7s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q8dDGJC64e2RS1VEO/oAEdVZFkpihpEINm0QemDuMH/0F/dT7gMAsFW2n+2tZHL5HeEq++aAhBT4lQAjK4xPMQ1O1kCSRBXCeOckxpy1Y6YeNNt4KpYuSZrwgBdfVIeqF+8piF2fpNT2Z8lhBJrvOkAXDxHb0VSmhHzIrkcDMbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AVxirB8J; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AVxirB8J"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bf20f6be6bso29538155ad.3
        for <imx@lists.linux.dev>; Tue, 02 Jun 2026 19:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780455555; x=1781060355; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3USj/+ztE88i2k2s18GnugDmZKrDU3UbbzkTJE6QuT8=;
        b=AVxirB8J19uWABjU3HhIiYCo+qXaj3MXlCF6niogP82pxhqVhDVHk938WWK+TAcVwJ
         WHBxlaC8F5UEXcX2rY+Irs59yvFauMRbUIbbZTBLg2CxP4dFYOagYlsaE0QqZxo4grfX
         KJzfNmTSZL4/9+puMLiGjWjLnYdLalEmwhIr/CYf8/y2h28pNDvn8uiVDbYniycwXo9h
         92upohy3oP+kvWXC9nASjjf8irq2SvWTxY7iNLPlvpQTtYPwPZeuJU1wlnjRRLsFBQ02
         GV2DJabef9sDqEN7l3Q+3gLiHPN0jh0aNkU2KJfXxslFq0cwPSfyNAexNEtgxz/VDftr
         evVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780455555; x=1781060355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3USj/+ztE88i2k2s18GnugDmZKrDU3UbbzkTJE6QuT8=;
        b=L2MJOtoSMZrHjSRVq4yxdUaDRteE6zwzRo0yRv1xc/5A+/Zays0s5fBZQE+OEjTynV
         0YGXmaBlmNsRVu9bfiylni71aSHidw3YTi5Nd4nH/l93Be5ZsjooNgqbkKL5znJyy2jw
         d5qFVlFK47tT1IS3J2T43QSuPwv/qZfGXjW6qVd6ah9vure7Woy2bqeDUQU4bhA9awbh
         kFASmC+Kyds9Ban3sO/QsT9Hi5sUU5yLp5SgDz85lIigbfYA81MFCInZds58m+UM0YSZ
         WsQZZFSYM44QmCgWdiD9eV8i5U9ttAYbJSnb+ZD4v7Gxr94kLnKN9QFJsjjv2aaK2Mw/
         Lq4A==
X-Forwarded-Encrypted: i=1; AFNElJ8EBsdAc20Z4k1XNDbDNZgiI/ECmu7gAQ3y4+0FaaaXGIsIOS8niJD9iZEkHdNLBkGAo8c=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNEQYfJ3GdocjJKiTNBlM+DQBRtcqfXoAriqiTzuz6HEt5texp
	tOsmf+AaKUEuGy9RyRzf2Lqszvr99FllQDfX/2eCmqRpzMC2qfrDjVvf
X-Gm-Gg: Acq92OEcd83rM9KxGEoN4Cpa3y0cy5gpzb5OKg+6FSXiYOTEqb7mBPMvIiIGtzMnij6
	tStTvJIBv/hnm91zAkedeTcYrKRTClQhggrRhV78Fsk+C0/widsxIU08g7rC9Gkio7A3CVXgLPO
	i9Xp4TSTANgnZq2zWK/tRUVHjlqfi2pOfTqbV/djaXDTcJik1B0FKGPEZKUatV5UfYtc6fj+7S0
	vQxkPpbEdjHXXvuL3MyXUZ9AaX8OFm0slcjrOJqUJtOJs4j+fVlLsdcWOwsPZ0W1101mNMZ2LLF
	CGBWhXqIscrxdwjAOe4ClZ6yb13DjjtpfqtiuTp9wIfdlFD4VIZM3gzJk22PnSJeMwLFKjjEFrj
	CLuUWtR9AYgwXmyXaXCMN0UWYZR3E/23Y/iTxP/i4Qxg65nF+V8yZriLoKMHW7l8J316m8EHOPl
	GtHShGU+NYCIGEyJA9hgXUFub8cNtnyfTMdrvjmKBXDhbtb30e9HE3MuiUjZ/t4U+0j8m3BkwR5
	TH+pdOMbpd1hmPPcWOyO/dkx9/Qm1nu07U7bFC2uDotbw==
X-Received: by 2002:a17:903:2410:b0:2c0:b6c7:2273 with SMTP id d9443c01a7336-2c163a257e8mr14341345ad.3.1780455555160;
        Tue, 02 Jun 2026 19:59:15 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d395sm8093805ad.17.2026.06.02.19.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 19:59:14 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-kernel@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
Subject: [PATCH 0/3] serial: mxs-auart: devm conversion, clock rework, and IRQ ordering fixes
Date: Tue,  2 Jun 2026 19:58:54 -0700
Message-ID: <20260603025857.287148-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up the mxs-auart driver by converting to devm-managed
resources, fixing clock prepare/enable ordering, and addressing IRQ
registration races.

Patch 1 reworks the clock handling to use devm_clk_get_enabled and
reorders clk_prepare_enable after clk_set_rate to avoid
CLK_SET_RATE_GATE failures.

Patch 2 converts iomem mapping and GPIO IRQ requests to devm,
removing the manual cleanup paths.

Patch 3 moves the main UART IRQ registration after uart_add_one_port
so the port state is initialized before the handler can run, and
manages the module clock for console vs non-console ports correctly.

Rosen Penev (3):
  serial: mxs-auart: rework clock handling in mxs_get_clks and probe
  serial: mxs-auart: use devm resources for iomem and GPIO IRQs
  serial: mxs-auart: fix IRQ registration ordering and manage console
    clock

 drivers/tty/serial/mxs-auart.c | 133 ++++++++++++++-------------------
 1 file changed, 55 insertions(+), 78 deletions(-)

-- 
2.54.0

