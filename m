Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916D123A989
	for <imx@lists.linux.dev>; Tue, 23 Sep 2025 14:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638967; cv=none; b=qAkwlz9vVp9TGsTtWsEhwgY0spPYnSL5/TFfkLp0QxU8fPY4IY3iV7R0JH7CdAohZNLEwzyeCEa32OwQE6nzdngLBn/2tCf5hclabrcxzSia1X3gTulEydWHepZHY9D/lFNKxGlWTnmb9UsQ+bik5ZHQjqxaoDTsP9wntpCEvCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638967; c=relaxed/simple;
	bh=DNqQwxK29Us8xfmOHYcY1uinDcMdwRcq4PUlWc2Tuv0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rY5W+V5Sy3DsJDVcRFVOwc2pQFBuaR5NcqGZimFboeHQbg7P5l/zbmdC0IXozmpeWzSNMCOz7IIhioxmHj8ylSS5U1rI2f0hHYR0+/HIwStS8RlZ2Ud+JG8Y5yWB/f4+L2t2pz7OuVgFaSQxLvy/NHPJK5cn4lx+PXpRO9JzZLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Wc14mpE5; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Wc14mpE5"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b0787fdb137so880702066b.0
        for <imx@lists.linux.dev>; Tue, 23 Sep 2025 07:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758638964; x=1759243764; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xur5ogzlO3BxY7k/WpoKiidJ69mrTNy6lGE5CvTWMk4=;
        b=Wc14mpE5alLSyIu1ZWocMbr73edW5oB2wN4eqgCE99fzBfdHgUseWUvF0qlLuTvqy5
         23cAihSZzpUE/DrHnm3ImELn78sBek0jOmYr7mYuZXETPyWXaSdhQUd1KSAbqvQ5xALI
         89w5BGAJT44hMsNeRCDh7eemK69AiQMmQin5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638964; x=1759243764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xur5ogzlO3BxY7k/WpoKiidJ69mrTNy6lGE5CvTWMk4=;
        b=S8L1lHqb1q22DY3aN3OmlwUgHZfj/HhkAeuhxwJ6Z+YT52afxCgkfgZXN2uBj73yoe
         4W1WqiCkwsQMQ0NZtDycERhf0WlxMCyS+hzifZgky34HbEOiCu+kzZFNuBVU2zChmCQ0
         ol9zRlKY7M1D7ACOQRXKMZ0rPO3QNU0KTKpFEopiCkmjkPJvQAyTOsyfmgvpkH7sZqoC
         kFC9aoPn1ilTnfFw2v0CC74Z9KmdnxiAlJvePrQwePIUFKVEs8ZFppAx8eQ5LFo9EcZB
         3ANd8434m6G/mUzCyoTtB7mVwZXNjYoNSiceBbhfnqYNDhucvtHQTcvEYk2qBJKvf1ft
         LsJg==
X-Forwarded-Encrypted: i=1; AJvYcCU94Af1NhGeEXHKHmfAD6yVyiO8clkaKAFA4qEXi2W8xr+4X7r8hJ5kRvXQbQdZ5DP9gyo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNMRjj9WubbVxTBDT65fvAhR2U+NjfywEaf1vSRzmJREIkC8J3
	3wJ0F/EVWB09xdev1OIVR2cIQ6PuYBNoKd+TrVq2mb18mDKJOOlqzBRhPjYw7Zf+bzVATlxIhT/
	lEMlY
X-Gm-Gg: ASbGncuMOSyd3p0ImmMWEYDxqjeo4v0K+FF/KoFDjdYru5MAGxyD/41p8Q2Zt2wLk6v
	9FjAy7SZ27gT5DPwaKQsshdlS9t3BsuH5QAOrMbijoloLWhEcGM9an1EHQjnD39K2yHcN3T9ME7
	Wfla0HGDi9fcUYPpj0jTzws3UH2PgRIgungTLmkYgzCkZJRVHdvWVNg9PvLPSI//XGveSRfbBiT
	m2OQxJg6gHD1013Wk2+1/d9ad4TnlpSp+cE9OYH2a1WwDTuzP0vbAgFjfsGJmRAFEIb53tG5lI0
	bVd3w6HiMubAsaXzvIhW3cugFA9rjvItU1ScnYtRBSy4YQrdrcd0agTuyIU8rUxvLZVs7XLVCNB
	WM1LmSog7+JSXjrghY8zXf5n5B08Jc9GvmJyHH5vBkkFsvf9NkV56ohDbvfjaHUAS5ZDORra/uK
	d3XmDDDqhOGJp6tEIkPCML+JPhUp7hwSxVRpzH9Ct1QtlPXKRgci4pZ+Ei7+TiFgR2
X-Google-Smtp-Source: AGHT+IFdTyE8sOB500lABprpHvm3+W8fwHKLli2EEJnbWm8PCy1bRjTjWqFurJ5b3114azHIHI936g==
X-Received: by 2002:a17:907:3f92:b0:afe:87bd:da59 with SMTP id a640c23a62f3a-b302a07b5demr278688766b.42.1758638963797;
        Tue, 23 Sep 2025 07:49:23 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2c0e7f7b01sm515746166b.91.2025.09.23.07.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:49:23 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH] ARM: dts: imx6ull-engicam-microgea-rmm: fix report-rate-hz value
Date: Tue, 23 Sep 2025 16:49:10 +0200
Message-ID: <20250923144920.2858693-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'report-rate-hz' property for the edt-ft5x06 driver was added and
handled in the Linux kernel by me with patches [1] and [2] for this
specific board.

The v1 upstream version, which was the one applied to the customer's
kernel, used the 'report-rate' property, which was written directly to
the controller register. During review, the 'hz' suffix was added,
changing its handling so that writing the value directly to the register
was no longer possible for the M06 controller.

Once the patches were accepted in mainline, I did not reapply them to
the customer's kernel, and when upstreaming the DTS for this board, I
forgot to correct the 'report-rate-hz' property value.

The property must be set to 60 because this board uses the M06 controller,
which expects the report rate in units of 10 Hz, meaning the actual value
written to the register is 6.

[1] 625f829586ea ("dt-bindings: input: touchscreen: edt-ft5x06: add report-rate-hz")
[2] 5bcee83a406c ("Input: edt-ft5x06 - set report rate by dts property")
Fixes: ffea3cac94ba ("ARM: dts: imx6ul: support Engicam MicroGEA RMM board")
Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
index 5d1cc8a1f555..8d41f76ae270 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
@@ -136,7 +136,7 @@ touchscreen: touchscreen@38 {
 		interrupt-parent = <&gpio2>;
 		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
 		reset-gpios = <&gpio2 14 GPIO_ACTIVE_LOW>;
-		report-rate-hz = <6>;
+		report-rate-hz = <60>;
 		/* settings valid only for Hycon touchscreen */
 		touchscreen-size-x = <1280>;
 		touchscreen-size-y = <800>;
-- 
2.43.0

base-commit: f975f08c2e899ae2484407d7bba6bb7f8b6d9d40
branch: report-rate-hz-on-microgea-rmm
