Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170B8313E1B
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 16:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773418833; cv=none; b=ceWvi+UwEhR6PyoNPOIaQn2tuRjD7g5rOy3oI6N4EL5633FLzbtMc7zm+3OIp9rsMifbEXdnyXAsvHglSUgzscMI8V0DaMRtEfVfFQoZKOJJ37BvS+GmKq9bWXHwYx/V3rQSMCEOM9PalKUp3chUQ82d9pnCXykF8Kwerwnk1kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773418833; c=relaxed/simple;
	bh=k4VqZ9j+t+GnkOhNITqT7e/LGKQWEezXmuYDUIu2N0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iBGE95dWAlrz1VexJhqd/TceGpxhwBE8kzAmauRUOfv1rrnyRgRyRaqA18RcHf0tLOkIbbZnGg7PFXz8aouWS1YYLxvB1+l2vHyTYBiawdmoPNsedQJ2HcYzIC3I6OmpUlnm5vk7ijI4lPxAjUcjnNuiWtQcdaGhDy1CGOSAA00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VeiEwKBb; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VeiEwKBb"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852fdb36a8so26915385e9.2
        for <imx@lists.linux.dev>; Fri, 13 Mar 2026 09:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773418827; x=1774023627; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Tsdn7+1vCyaUHmngCU3ZIyKBw6uVtjSNrsm1j3NeCc=;
        b=VeiEwKBbQMXrq/nQYHkCd7SD2w0X4Ml6ce0XNruh7m4m+i9oRjg/ZZfceloOx2LRJJ
         Czauhmr3NnRsJOECC/d3qDqUBpqkWII462akJ0bqBqhf/RhdnXZcYw2I188bxtxgM6oI
         uCRRoBMqfYb3EHVOUTYUV/6lqvZuDPVKdCd7ywF7vzYuwfi8NfBS2mxUqZDeaOdj/Epf
         OwlA0Lvt1KLMbQ2JKQiuJTfoWzpfnZkLJ8wHzkX0aI465wgtwXIKgZO8WOPCl4/oU8xB
         zBU9H2jCfTnvLB9HkroIgg8v8S3IMp4qvHcOfydAnssUZ8rghjC7ojWdqKZlDJ1FdNjc
         mNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773418827; x=1774023627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Tsdn7+1vCyaUHmngCU3ZIyKBw6uVtjSNrsm1j3NeCc=;
        b=BqPm25yOvb48q6kdgoECEv5W7Vi5n64pj07RoQrwGX3oZ5vQX8sfpr4eS4DXhW8I3e
         I1Hy1gHgzqj4tSIVDQWsjcf9gq/5LX7IK9tCwXrK5Gs5ED/7RPTVqm0p7tC4A9dQBgDN
         5636Vf910dtxNn1a0x6gU0kxSR2YutNzZkHmz1Ii0qH3LWeCiKiStwwQ+b0uGLoniAil
         WNHV2VQDlrX6wNP87obGaj7D+y4tJqkeAJB2DwKWI03w4RuUaxRNfzOvJK4QSEyvgnYX
         Y9t/LRUxrpxoVpw0wC/3tyRKxqcfBlnchu22KeKJFWY3ZYmA63obRLe4HHlPcms94NkZ
         c2bw==
X-Forwarded-Encrypted: i=1; AJvYcCWjDPTdIPeJ2bE3CUrXlp3nQsyYB7CupagWwthLZ9+YCbzaMX3o0cplWLohGVn/2ZOivUU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzgYaDyDvG/Fkh5WogW0mZCJXLeeaFpx2th23d9pveaP8ztuidg
	ow4m+n5sFYiEOTlAw6vfm0e98nwEmiF8wDjF4BnkBS7REfOdGZQiIkuM
X-Gm-Gg: ATEYQzySzcWM5hqBl6FfQmblRk/Pa6PlJo3/HDdRQYTWxrN5ST4KnLu7rkb+sZw0md1
	OD7V5FtPSZfLbldS3ShEEA/+gGMMZpGt8HMpJNZ97jLRTKN0srz0QKsJlVx+LlrzrM1JcaXAhV6
	Zy93pITfAe/s9KyIb2fnRULgtTPx9067Qm9dtyS8Ij3YespjjjlFpC3H3iHXFnyuIDzL8otphW4
	wCBCxzkHif61OCAoE5LYrT5Jf4vA8VoE4z/yLTM55a3bbMfn1P1zrifaOOd+S3vkHJ1u0ojRGXJ
	pJ2h9z7acj317fiOaFTZUN/CGZSmRuFLT81M/vf6iM1xqu+rhoa8ZYt+AaEVeVGqrveswSGndqr
	bFf2sGOaC3tWQ5CKJGzIubSxSywqfcFwpdZaw9HYhVjAOFrrMXvgqKq8nkziS5hHNi+GO4ncAoR
	8Zmf/s2eG+Lj957PA2Q/wIDbyFTX68EWKOhP6AA03HEDZPAyXvAFB7S18YSCKoBjtyM95l++ySS
	056aSDwyZjUQ2H5Lcfq3VJhvWPbpxj7QL64U0M=
X-Received: by 2002:a05:600d:4453:20b0:477:a54a:acba with SMTP id 5b1f17b1804b1-485567031a2mr49499595e9.17.1773418826939;
        Fri, 13 Mar 2026 09:20:26 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b65fd3dsm219944515e9.10.2026.03.13.09.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:20:26 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 0/2] Add support for Variscite DART-MX91 and Sonata board
Date: Fri, 13 Mar 2026 17:20:01 +0100
Message-ID: <cover.1773417666.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite DART-MX91 system on
module and the Sonata carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v4->v5:
 - Rebased the series to for-next branch

v3->v4:
 - Fix space between BUCK4/BUCK5 aned parenthesis
 - Remove unused pinctrl groups

v2->v3:
 - Rebased the series to fix DTS apply issues.

v1->v2:
 - Ordering by hex and node name.

Stefano Radaelli (2):
  arm64: dts: freescale: Add support for Variscite DART-MX91
  arm64: dts: imx91-var-dart: Add support for Variscite Sonata board

 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx91-var-dart-sonata.dts   | 471 ++++++++++++++++++
 .../boot/dts/freescale/imx91-var-dart.dtsi    | 468 +++++++++++++++++
 3 files changed, 940 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi


base-commit: 04faa34bb5e68338cc2568da78f6535f685dd4a7
prerequisite-patch-id: f5c8d966fa1a6b246f7eb1c249e7d6c353b2d71f
-- 
2.47.3

