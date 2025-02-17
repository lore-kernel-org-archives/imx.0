Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BC521D5AF
	for <imx@lists.linux.dev>; Mon, 17 Feb 2025 17:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739811645; cv=none; b=rjBQ0/W83OmdQLJAIzyyRP63cT8QQJqaCF+9QVmDbw/nieogahz1egP+QPZmmTbupNj0vZjZPQ/QXcTBpfKBpa0bVfpTyMXmsahE3x6XQNUXy7bhSbELzgIGMpf39MbHD9kbLY0ayWfQ09cSgZOhZHwq1YFS69NjjvTXxdp6EUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739811645; c=relaxed/simple;
	bh=/JSzwAdIp+loq6hHEIIXja0myTWKXKsrmFl5+HQIkBQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ac+J+y806bf+l1jnwWUfU8gwlgsOV+ay0TybGngfc9KC1uwXt6Imqna1R2guphRAyI072XfdLA1YJvAq6WSdNfJe3W60qs5BLP9/KNa/lFyfmh8YPoVoCINXklXUsZSiUCdMudOcUnX3tbvzaJDQK0+hdDKTEFJ/jM1rQ2EwZQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kV4KVXEa; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kV4KVXEa"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e050b1491eso2441169a12.0
        for <imx@lists.linux.dev>; Mon, 17 Feb 2025 09:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739811642; x=1740416442; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rLmL0UWh2UzlPfOvcpQnJu8m6y3UesOtRIguVui1r2A=;
        b=kV4KVXEab467Hp4vjG9GhpAWvH/uaMBtifZTR83HcC4SYCCK1D20zifOnmzMMXJVf8
         wVSGez5+JjWk77B89uK0WjRya+kuuiN0GPWn3JHeKz045VlC/8IxnWbC6rq5yNLotAoT
         LmEAar+/T4p+kf7UwHpOTapKIaBHap1xL9haFTzpkaLfzHRIF/K1f0qR7jFJuuq49NTk
         DCJeEOMaxBbuO2Cqt+w2zvGQbSH0j4OEVEDV8nRPSkW2Lu/9/vJCZEP6TN4/AdU02+W2
         gbuvuUVqlesdMpoln5Q8725lSmnSzgjvE3gzn9LM0/cKHqigaOME7po8U1i7+l6ekV/f
         ICZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739811642; x=1740416442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rLmL0UWh2UzlPfOvcpQnJu8m6y3UesOtRIguVui1r2A=;
        b=FUXPXRXC/W/5+h6ZUKlgJx48ZQC0TKfF00RotOCyIT2HoGuGYVdZTbg+9bEwFwYEHn
         CNFqjQ4TAeVBCaDIF0yyvmL+zxcQgm2qKsp8L6OwnicH4gZiImAsTgIXQQoYVBw94o2g
         f/MZskMdsB5qQWbOGDVxUkP46mvDES3gK4HUEvDeXTIBR+6IIKFhTTeHYuXGJ9qL1zCd
         dm6d+AG177QMxA5ht6OJLMOnb4U0Pr5djmZML+GxjR01XctWbUhG3oiohWzfszw6Kv1n
         QU+Ya2ubazP0iXJuxsJZZpDxTn0crQW8FcDAHOIjkOFphXpdZRVeIqUqOUL4ye+Z69Iv
         X3DA==
X-Forwarded-Encrypted: i=1; AJvYcCXUjcwzQC9yxpOAhaIRF9YpEf0IAQAxLOhLGcQG9Ls0lmjrdMVbh88Lq9MC9W9MUxtHakc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5ZvEe3LL7gAlbF8yIlDqR6OfBFHGloPbvo1SckfQ2xWLbcEcY
	U9KP1Ozu2EwVyIHzU/2ooJNY2hg5aoxof+2qgl2Ibx/VgxavyAGm
X-Gm-Gg: ASbGncvh4T5PTJjhyhnCcauW6zT+c+YXFkrx1T1sqELV2fVRl59mnmUxt4OYsEDCUyQ
	Ui/eCCXa7Tig1RFXhB31LUd2cELoEVS2PmrISHlkzr+OEHIKg7RE9Pe2doGd5cIqc/LaSzTUHjg
	FLhKbVW95xnB4aI7FjLS/ycFssuKDQauhDsL/gmWPtKqZ1ZndvJYMLcyF5hZ3v3YRgSnduCF5c2
	Masg0Iex4aulxHPEUEWlcqlV9j71UrtafRzV4Zcouet+MDxQ0Z8F7HhOCsnoQSVeBusDR9lAFP5
	7kKmIr7TDXHtXF2EfJu/J24MwkSPXuuxjM6amtOsli5Q98INhXrxkQ==
X-Google-Smtp-Source: AGHT+IEQjpAvGijd0ctj4hjtd2+w3lCuwj9m7YB2SsgjG2XRGOIZCHqfT/+w91RWWa9Hip9qD8kxRA==
X-Received: by 2002:a17:907:60d6:b0:ab6:ed8a:3c14 with SMTP id a640c23a62f3a-abb70c8e70emr1013316166b.27.1739811642166;
        Mon, 17 Feb 2025 09:00:42 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53376aa2sm920570766b.103.2025.02.17.09.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 09:00:41 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] clk: imx8mp: fix parents of AUDIOMIX DSP/OCRAM_A
Date: Mon, 17 Feb 2025 11:57:14 -0500
Message-Id: <20250217165718.74619-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Correct the parent of the AUDIOMIX DSP and OCRAM_A clock gates by setting
it to AUDIO_AXI_CLK_ROOT, instead of AUDIO_AHB_CLK_ROOT. Additionally, set
the frequency of AUDIO_AXI_CLK_ROOT to 800MHz instead of the current
400MHz.

Laurentiu Mihalcea (4):
  dt-bindings: clock: imx8mp: add axi clock
  clk: clk-imx8mp-audiomix: fix dsp/ocram_a clock parents
  arm64: dts: imx8mp: add AUDIO_AXI_CLK_ROOT to AUDIOMIX block
  arm64: dts: imx8mp: change AUDIO_AXI_CLK_ROOT freq. to 800MHz

 .../devicetree/bindings/clock/imx8mp-audiomix.yaml     | 10 ++++++----
 arch/arm64/boot/dts/freescale/imx8mp.dtsi              |  7 ++++---
 drivers/clk/imx/clk-imx8mp-audiomix.c                  |  6 +++---
 3 files changed, 13 insertions(+), 10 deletions(-)

-- 
2.34.1

