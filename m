Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229BE47ACC6
	for <imx@lists.linux.dev>; Tue, 15 Sep 2026 10:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468435; cv=none; b=Aaz6Mvz4d8eYLuK+lglLPaM4JHOGFDtHG/O5jx6bNPxNYOkh0Bc6iaCZmt2ABv9piU3AXqj5rl0U0/a/znT59/n08QzHSXDXm+Mnpt8hUco7nuEHDAzbvMlDTI1wlkwuA9Kmo3avr42DIS3dpoESmwleme3GHvcKySZRMK8hZ+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468435; c=relaxed/simple;
	bh=rMBxBiuiDq4omRt4799HznSfkajEM8cXWvJc5zo6Fcw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tRNC/ulrY4MyLtYaQDTUO+bTAk06jyEBfzzR8cRnhJUX/17jvdsIqjLXwYVEbknge1NAYeWLldaRPew6oQ2SdfblHRr8jkvjsuNnpSq20b6Nv7qMiYAWbaEIRsgFRFOTqw/EAOjNtc86voIMiK7cjDQU5tL9MCUQT1UTMsm4Ct0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cocrC/2i; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cocrC/2i"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29d33431c8so19962766b.2
        for <imx@lists.linux.dev>; Tue, 15 Sep 2026 03:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789468431; x=1790073231; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f75fQgzk5PMT2bUGTVE35Rs8Li1ghntLsZOgXFHTcEQ=;
        b=cocrC/2iBuL1TGYYZYAv/Y8CTnYGAV0h7/z1Uc/PXiLybKCgNSbWBse+iddYb3G3Jc
         3gn3vBHIc50OlfVdhIJ1mZ1zbenw6mLHRPNHBMxuN40OorVcVzpodt08I5LzodCmC5wV
         qGmkJEuQNxeWNKOW5pZEIL6iDySTG7sdMOrRLz2mlB9XBiIgPYuObesvPwNPWr+kYfAq
         IByvtQuYmdztyXP9s/mRB6wq0SXgAG2ow3tYd0uMkmqsa5pgy8DzSZHyVReLwFJBF8M2
         pxGpYEasvnhkla1n47W2PjC4rFtED13xHDUF3nA9B9vbBFs5E9r/6s5NlWensFm9V8z5
         jtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789468431; x=1790073231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f75fQgzk5PMT2bUGTVE35Rs8Li1ghntLsZOgXFHTcEQ=;
        b=23hp/XhDyIb8eFNNEuF9qQvoeFVRkiI4f9M9R3xCxAIe+B0TO1no8jHerkED6oavRC
         UJ7mrquvTkW6OkvO5lu2A1315j9vcSS98Ikp3QjE8TRREaW6fEwWVNRHfWBLGmwT8e3H
         ncAlZiMR+BpcJglbaeJW3lSuiF3HlQch1wZuvFT/MY7m5pGmNnTjgOV70SMj3l85McVs
         UTOMVYEcuAOXfU0rPU34ACml1rFytO6BD0qKp00Sm383N6tEXFmI60iwrIGsj5il4+Xl
         ju4CiDsJwmR+5dufNMuZe+ls0Jxs7dlY6Lzp3MVUJ1Rmi6Iv8QH5BHA4IM3MaId9QFj6
         pmcw==
X-Forwarded-Encrypted: i=1; AKwUvBwgdwjOjoq+IKpYCXb3fg3974/08fmK3P1/KnRfvo6YKyJ1dvsGODZsnNQLtrLuFHjNOe8=@lists.linux.dev
X-Gm-Message-State: AFuF++lbAW6r6Ybzpy5W93qEaCQzGc8+E+oWDH++5CCkIOLMIhqjkKH2
	1v/jYs+EcQfPvNU/+LgvQn0fuEVwWpfyt3+SyKn3pfj8CF6cmAWpGZY0
X-Gm-Gg: AYBFou3Jlqot56XKSbzOH9E+hghkMmr8LQRzRlLK04+2Ox2MJkDjeZ4d2aVmgN71kWm
	ehlkidvRt/2ejRkBrxmXytzjbcHiyXkoyUD56q/JFmyQHehtGTJr3URygk5sZklCex/jcYrw6xf
	GTRLRyErzbgQdZodfyHjIg0ZRTFYPAXDoMbpNKK4CE/dhFDwkhQ8m12wrt5JEtycI10AFvOsSZ1
	gZaXUjwgxS7nSBeKt+8zsQZAFhKwme6Qcw52xBqZUc+5IXeVnxXlBFWv420DBp8jTHxfS6Q80GK
	hRWDtYmSh4QF2DQ8WwMC5r51maxHy4czo1bW3HPg7F51zzRZqkJ/sqq0DZZQFIYCIUycN93IT3C
	f9tRjltLXLgq+1OvyZI44e5Szii0E4VjshVVbKY0ZHhfrjpcujEPBSVYBD2Np7oeZJCc4tR84yg
	v0anXgBODtOU2hQvWLDvOnG/Db+t6wswCDB4ANNRBPulp/tW1TlG0945tZZH4lu4sayRXTkHBmX
	M4YHog990u1OksdwX9MHCQ7fYuzI7DmxLgJA9hwNacw9xquc7F89sstnAPFSjpTlWcyzYTd0EBZ
	8BlKhbbu2AMNUiCHi2Bae/SszCT+gHBU8JjCc6wKVWyzgLcyBmpv0uOJnNgr+kkTqZtrEhKYvHg
	hWiutY3KONbLFbhs7JDhmPLQs5jTiK/VNDlDKHoh+ejKxareyxN7Et6Xx40x6s6EX9zv04asxKf
	h/mpFzCqVZVSkAvbyCIyR3bHbMa6dsblHKtOOWJso2O6sKr8MKpNTrSSLuaz5AEMwooPjPD0BcX
	6OMGHztSR7q/JQ1
X-Received: by 2002:a17:907:6d1d:b0:c29:44b0:1428 with SMTP id a640c23a62f3a-c29d79b8aa1mr40465866b.42.1789468430983;
        Tue, 15 Sep 2026 03:33:50 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.oa7bb030819b2a894-tp.internal (219.40.147.34.bc.googleusercontent.com. [34.147.40.219])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4e8a1sm566041866b.6.2026.09.15.03.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:33:50 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] clk: imx: add missing pm_runtime_dont_use_autosuspend() calls
Date: Tue, 15 Sep 2026 10:33:43 +0000
Message-ID: <20260915103345.1334-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several drivers in the clk subsystem forget to call dont_use_autosuspend()
on teardown or error, causing potential resource leaks. This series adds
the missing calls.

The offending drivers were found using a semantic patch for Coccinelle
I'm working on [1].

[1] https://lore.kernel.org/all/20260915064327.1377-1-joshua.crofts1@gmail.com/

Joshua Crofts (2):
  clk: imx: clk-imx8qxp-lpcg: add missing
    pm_runtime_dont_use_autosuspend()
  clk: imx: scu: add missing pm_runtime_dont_use_autosuspend() call

 drivers/clk/imx/clk-imx8qxp-lpcg.c | 1 +
 drivers/clk/imx/clk-scu.c          | 2 ++
 2 files changed, 3 insertions(+)

-- 
2.47.3

