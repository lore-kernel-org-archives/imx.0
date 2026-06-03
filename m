Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001C13A3E78
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 08:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780475111; cv=none; b=c3coTlJkp6ehNpXSeYgl7moyUyafcrWqqtNDZoGi5YcMDUlXxGDIlc6IY/voEMW8Uq6dq35oA92iitOVoil4PYIuh+ppB1RATkkdCKFpFdF640kHiXztNKGPMorEXwYtUeTBJbMvt3X1D2IPloZdvDYm2gHXPV43dma1rKmsJV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780475111; c=relaxed/simple;
	bh=H7Apo/wyT1cuOzi9mmTzmIGJyBfo7WIHLat/+zpVFzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SwPtdfROgRosM5wzN5lkK/g0oqzxmZSROm1fckO/6w5UlB4LpfkF8+30p7OMLZnwAaR52ND+3f7aWiZQ5K5e+u7qyzPp5lXLaNKmCLKLYKyNU+TvZOQPn6oZ9ZiylLzzD+hhZF+CteqczxSnZUrr/YGITgFPAfOXBUuzvkjbSyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ccx2OMZV; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ccx2OMZV"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso112047475e9.2
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 01:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780475107; x=1781079907; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zPqZJh4lrGWaEtR1Sz6JxGrxryGpEZ6DtkLfnuyqJQU=;
        b=ccx2OMZVpO07brSzFrneCUtOz9wy+fcVcOD7VIrbh8lmhYFA8EICEaJaiXGQsuH2h1
         QFyvrbSRAWqfT/Xh//3ik0i5w6uCUWlh+SFdnqgRdHDn+cZwxyRym0FJhLoRiJ2iPbSb
         lz5BtmgWIU12O4x4S+wovgYi9QO3fsokOykakmIlQsXVcMqpocjooKAAQOxVDbrqZ3s3
         wvQ4145mDJmaf0Kt1jkkCk1QGj5OSQsg/5ZdD8l0N/BZr2Gb6omz2DUNwWjE2MlbZrC3
         EsLiPGHnr0mb7D/LR2SSqHxVlp2Cx3W4Aa62B189DTczgUbAmDQivILBUy72UIUyujOB
         6OUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780475107; x=1781079907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPqZJh4lrGWaEtR1Sz6JxGrxryGpEZ6DtkLfnuyqJQU=;
        b=AI1nlcuQexRPAPTPmXr0lYLrIF4Bh1W96fkL0yLG1bkonXsRu0IhCeqZ5dpJcqo072
         TttQiyuzqrIUf42HeNY0umWlhqNvFxH2qY+0aaIv6cB9MoAPVfelSnDjw74lNG2IGJom
         bjre/1/KxO/h8n19HiLa3Fw63KTg7YsgLODSulo/eoS+IMnHW1d4Svli+A4c49epfV6q
         JtvipYBhh8rbGM0pS4g9HE5N9mIycoiP6nIRDGETn5UX0OhJOAzniNUfCYvjqqrb+22P
         zpVEBh4gYGI/O1IeYCkXRIOvWpsnV/QUhh7z/hp5jLFZkM3TC+HapVDbD3MJypuHUUN0
         Y5eg==
X-Forwarded-Encrypted: i=1; AFNElJ8jBuCk5yTK7r94Es02pCTrs2MI3pRpkHSwtEK7loPItnoHxcVYPmw8MMRi+14dR1Hx0vQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywn5Dg8S+QyvwkrReXmTC+zMsB1VlguGRYCNSPn8tVgeNL59Md7
	1ITwvavoj3WvoEnZowAg/6o0hSKDlV39bLMyLTxRM9vahZV1Dd1/bCkN
X-Gm-Gg: Acq92OGNw3dovlK/3Fd07Kxc00JVcf92ooTXYfOwOHJxTalKkitY5gMV6Q9IYQ8N2uH
	NpZ/MhPVD9ZeIpiipGz9fGL/UaMAI0N3Qsr1mWwlx0cur1IVc0Mz/uPrf75tQx5WkV1TG6EvN8P
	vorjmIkD0Jqp1eNYuXfYuMRFWgEEClq2uDkrGiPKFAlpFtmiQpCbsFMNzOUFLeKHhLoMnLr1hBa
	zkrjuNPfVdMgYX6MGid6O23PKLnDWiNRdbiT19PLOBvzOE4DhwbpgX1YUSHTUQAcajFarERhnft
	fAhFuu/ajmt7ErRLItqGx4FB45Kr7GHNugzjXJOe8PK4j2EY8I1xQeQj8nfFEP9W6Vp7F1DsENw
	vPLZIl3st9QsV6UFp7bnDnTkpWHAspv517/sq8f7yWakBxYLqv+YfoabP4APnbHWJkC1k1MtJtj
	sDFycW8wh2SK2dJk1SUU1xVUp9npTA7f2nuMgFeFq2g/0B2tixxmx8hkpGXb43BxqrVmXyfdrXk
	FeUiu4nDYoK3NIDt4MX6svniiRgwKvu+95bPl6StLmZCI3y
X-Received: by 2002:a05:600c:6290:b0:490:b9d3:a9ce with SMTP id 5b1f17b1804b1-490b9d3aa4emr14885625e9.30.1780475107253;
        Wed, 03 Jun 2026 01:25:07 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm33175305e9.11.2026.06.03.01.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 01:25:06 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 0/5] arm64: dts: imx93-var-som-symphony: align DTS with hardware revision
Date: Wed,  3 Jun 2026 10:24:59 +0200
Message-ID: <cover.1780474803.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series updates the i.MX93 VAR-SOM Symphony device tree to match the
latest carrier board hardware revision.

The changes add support for onboard peripherals and complete the board
configuration with the required GPIO, pinctrl and PWM settings.

v2->v3:
 - Use reset-gpios for the TPM instead of a GPIO hog
 - Add ADC1 support

v1->v2:
 - Rename pca6408 label to pcal6408 to match the compatible
 - Clarify that the TPM enable line is a board-level GPIO hog

Stefano Radaelli (5):
  arm64: dts: imx93-var-som-symphony: add TPM support
  arm64: dts: imx93-var-som-symphony: enable UART7
  arm64: dts: imx93-var-som-symphony: keep RGB_SEL low
  arm64: dts: imx93-var-som-symphony: enable TPM3 PWM
  arm64: dts: imx93-var-som-symphony: enable ADC

 .../dts/freescale/imx93-var-som-symphony.dts  | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)


base-commit: b3c1d1631f097619f8091f0293e027c4301285d6
-- 
2.47.3

