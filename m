Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C553B582B
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 10:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772535083; cv=none; b=LlgayDmvoXU6aGA4Znif9BMvTV05aBUcB2KYefmJhUPy4jGW+csnVImUpRHM9NmUTt+s+yOI8kmfDbfz/P0Bol8zpRQ2SSchFyYgYMK9Ey8c5xdLyMVjflNJioB4wtCqwdCApb8KN8Wd9waMaYQEbmYdApzTkef587tJIUMX+Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772535083; c=relaxed/simple;
	bh=FOyo6I+/JBVOMWvLfl9hFvZQVhcgm9DqCEirJlSsFNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ODufqdm6r51f+LY/RznGtN3TYpyak+6R0c73Z/JH/9md3n2iuXAX5g1hZCUaiZyScEgQDug8cvk3bMzDpbGwTeY6yiq/dTwzHKpR8kAt1iK5p1ZXcICO/psn35fU9q6tg/koq2TlO7LDruwJLJQcnaW6Cknl6q6uXWH19Ti6aR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEokWM2Q; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEokWM2Q"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-483487335c2so45856825e9.2
        for <imx@lists.linux.dev>; Tue, 03 Mar 2026 02:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772535072; x=1773139872; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g3SE8o2QxCYBZuJ6zYQoYbch5/wwuKdRU0VaDoGflE8=;
        b=TEokWM2QLK9DXvAJLWsaE5WcGh5q+twGTRSG92Bsz2zxes3edWLrQCzU7eB5JC+p12
         KZFVU79TcBXMnkWVMDNikEIJKRv+aRm1syYYosnxOyw0JEmqBT/iJfjXuyNlGSf6lQxP
         KMIprSdFiiuSmaZYR2qd141Lep+c75pRvdTIA+l7rF9d9U2y2mFMsPGFf204RIr17ZrX
         23Fc/7VlrdhAQmeS93uowEbNv+5nMeqpKiuAXquRwImqcKeLtwYHaoTtZthE3czu2bGA
         BdUcnpe/+f2ph+U2stsrv6e38B4GWbPtPWMk+Bck5xeRYRBr64/glQ5RKnwHeFB6WXnb
         ly/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772535072; x=1773139872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3SE8o2QxCYBZuJ6zYQoYbch5/wwuKdRU0VaDoGflE8=;
        b=ID9QE4Nq7YE74FN1Ue0T1ixf4dDaKBeszslOFKlhl5vohA3noU6l4rEWc/D3fOQTXV
         U1D1L71QNBpyIJKQuKwjYc7mioaCHUUFdyK0W6nTOEgRq//tYBVXP71m7Nf/dthoLcAY
         jvdcRMJ/2d+W9VL18izIU+CbqsZ+M4xz8G+NDtmCzKmu36q4gPNqGJygS0COTidwtRkJ
         xWQIqPIVTHgA+nhqP4Fyy5mOVft+QINQWOvVUV/UlvUzXxpSinDVxNBqixKmkQeh6Wa5
         6sCdpBlvAp1ZYIptyANq6WlXW1jGAICCTFoHpuDCofPioYW0tAGwBOX2iYL/JvSnYZiU
         x/qA==
X-Forwarded-Encrypted: i=1; AJvYcCVUBvNVS+8x70pZo14qFOSla0did6WvWz/YxXBjjJ5VGw1yVLjIYZ9gaORh1fSeYErCOJs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1QhyBCDacg9nKGmnO+AHFQPikU42FyZCHlQkWgYJaqSIPTk2w
	Pj20YCTzgrYXoayfJzO9WuQEDymrhTco1LToFhjap7SMPywQNJWoGe1s
X-Gm-Gg: ATEYQzyDW3iEuW1zQWtztR5XqkKKemsi8JjFxu/40DiCk8V7SUKplTLSeIaDBJoYjdu
	MJPX9LhZBA9UQTL+F4fQBSJXibOorj1+ebwTkNt0m7o+8c1qmO3h5gZSx1xTwqJ5bZE2EHxOPHW
	yEw1FP1E8Mac64Gzp5MYvH+5+7DK2ilNYGXXsRxfHIUJqepAqFlaMBI1KsJeQXRTwzlQqoptt2q
	kxuLdoXcQADIzqfqtlEOK3FHzYM5GACisyw8P21F0LXMFHtXr4o74R0SSkO95RibaoF77ltHmZ6
	mdy+IeoCMmfFQF4o4TXRHDxv3RYZZY8C7YB2rL0tQwkRcfSVkjWPh27PfF2IsR6zKOeE+bhKhnh
	nnIpsoqu5G/dE2/NntZRsnYSThD6FzLqAIHirZa7aNGL9Jg5rglk7fUVKXGI+Mr7oxHc/nQhdKf
	cGs38ef/6JZ3cdLFziRQF9/ZWT54e5iFZIXNyitcj9aCYUp10CHOJ4cZbnuDoL7nZ4V02/QUNuK
	xviuX25sPPTTwHVJuN+aW6Y9ZkJY8GPqZabiB0=
X-Received: by 2002:a05:600c:8b84:b0:479:2f95:5179 with SMTP id 5b1f17b1804b1-483c9bb1adbmr270868955e9.15.1772535072145;
        Tue, 03 Mar 2026 02:51:12 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b3474dsm318916045e9.1.2026.03.03.02.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 02:51:11 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	Yannic Moog <y.moog@phytec.de>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/3] Add support for Variscite DART-MX91 and Sonata board
Date: Tue,  3 Mar 2026 11:50:36 +0100
Message-ID: <cover.1772534362.git.stefano.r@variscite.com>
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
- Device tree bindings documentation for both SOM and carrier board
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v2->v3:
 - Rebased the series to fix DTS apply issues.

v1->v2:
 - Ordering by hex and node name.

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX91 Boards
  arm64: dts: freescale: Add support for Variscite DART-MX91
  arm64: dts: imx91-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx91-var-dart-sonata.dts   | 498 ++++++++++++++++++
 .../boot/dts/freescale/imx91-var-dart.dtsi    | 468 ++++++++++++++++
 4 files changed, 973 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi


base-commit: a251f9ed77f01f16adaaa1b3d2f568fc1b5acbfd
-- 
2.47.3

