Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378154;
	b=srYjlvXqDfXx1V9Le6cedtnF32opI0CiPaKNNaDW8NBZKVTFQzxdNFBKQYvaw2Ei3J3n
	 3J/zDSVuWNvG/nKzexYYhNgP6rQ3ZM8jODH02AfA//eRO88FtnO68w7EVzB8iuawUBZ8O
	 XzZNSpuzJuzJ7VVNbfrC0FW+G3VhwFeJMEGwnnzfgpqmQmkNO4IIKPQjzMQ04YHnq7XZh
	 1NKTkbp8cs/r/GIY1/J5j/k7b8oHOareFf4UbRSEnLnrenS4v3G8GI8LzmWNz5hp9Hg7Y
	 aHEZkutNkj4NmaqiggwJAJUMQYvjaA8PqStnc5pgTZxtjVDXIKb9PQGTGyQSxft21Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C27CPAIU3rCWv1caX+bgOf8gRpTTIO2oZucMeDYt7Ag=;
	b=q3RfTJF19VKaglW/JoEIq+ger+T84MVp2waBfTpElMOxNvLiv8ALkMnVhgA4yeny37LC
	 /Ayg4QBXBMvAq8YPWLtq7HXCQG+pqkKEls3k8jd+N/fFjt/VJw/+jP5R+bhv4LXqtN9zw
	 Ua1kXiTz0Hrl2LHd7frSwjUjddeZzcRra8TgVIB5DQ5Ay07/mkqSFP2Dm1E2v+7DP5GPP
	 u9DeWRROsLZA9ZIYDEFbn4wwucPKEj59394KZ1cBOLLdvl3i4aabp+AfkGRU4VJNM9MvO
	 69WFl54i3rNrmX41ysZJ0DY7h7WXW94AWRVz9M5BcYsNaqNFShYqE8vaud7RvOmisAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b="IP/B9MHc";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF29606A323
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 16:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DF29606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=IP/B9MHc
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso8438415e9.1
        for <imx@lists.linux.dev>; Fri, 30 Oct 2026 09:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793378153; x=1793982953; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C27CPAIU3rCWv1caX+bgOf8gRpTTIO2oZucMeDYt7Ag=;
        b=IP/B9MHcpLg1Lk5BPiIkgtHt+lJDGdh1mfjOo79iT3NJGKoVNJuiryFjs7NuA47UTs
         4c9PmD5YHLt/NL7SAfGIiSHlBDNMSBvQa1Zvtvk2ToOt2WSwuugXk9Be/tyiTsjoJnNG
         OaAcemaaSV0u9K1H6k8d80QCHa2KVQWeEb1zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378153; x=1793982953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C27CPAIU3rCWv1caX+bgOf8gRpTTIO2oZucMeDYt7Ag=;
        b=YbBu1FuHWZauwRwxvj+CI8xBv7RqVayDDexq+hese71r9QLpW/m5f+swdx2nm3XvGf
         RXh5CSS7N7LO15GRc8hPAwtOfnxhbGRld7l8L5/aBAaDQBoDcsawE7ccBruxIb+JBPqe
         lRbFbGNUtie6weGwXjRaH3a1XJhuHRHnhnJFPgEyUhHQjHxjR7zC98Ep3riAFsPTDj06
         h/KXrjWAvwuBamw4CqocD+ly6s/lHQhQs+Kt1Vild7qmJXDJgRnDkDN+boqyGijBufR6
         GwhRpkklXjqL8K6CsrfLqUVs6+Q+wRTl08ngPTn1OGAl/G2rZ0KGpepB+DCrH6gGILxd
         1F2g==
X-Forwarded-Encrypted: i=1; AKwUvBxwhMC8S0oFTgu4B1U78pKfULlYc7wwVoBoZp+YiIPtcnURbRtY08OtzvlMeXV01Rwo+R8=@lists.linux.dev
X-Gm-Message-State: AFq9FYIXQLinPViTCr0eQ3it24cYrytlSoxjsuG/hUMXuEUrHI1cTFIC
	ZtxtalLvQxB7omk1SFer+/c9hlfSwCPSFMirNTEel8aTMzZLEfAALDojAgP00LqxSA8=
X-Gm-Gg: AYBFou2jivQfybBpawD0yXSKeUXVKkckfEF5PrTIjzFRyB8wO8HNQOnXjgYS81rbEoB
	EP6w85OSiBjSpK4p+1jHytfCcYZFsLgoNqAnx0XR7FUGzSwBpQS1gb/YlDCKe1ayvWJOsvmmSPQ
	l4n0JgGeHodspkRn5AafsV8hQV3yzCu0K6JuW33aMJ692MINQwMLvMzNdv1lLAY6PUmjPDvCDOQ
	ta8XLGgjkVlVsS6UokACUbpXbGx6MYesdI/c/fHjlgWpDSWlPALu1z7t52SjmqA5w0nEVMLHuD4
	NjuYW5nV0kwUfRmsJxekVE24VqvZBxHnLIQoaDfS71dzz2sa75SzAbH9h65+VK9/roGehWkFM/a
	0314znQotN1xPVs1J91BlwLFobU5Vis9IZLbZ6kWQKq8yKUL06bwEEr/Wocyyg8jn022GAkhaf/
	NH3EzzelPdX8rkPhnzEpYneYa0Q16/Tnzy4imTtoeChimaahfjkN7A7ZoyLK7kAnmBVqQ6IgKAQ
	frNQg5XCkXhc9lRygN/hTNlVefiFUtZ8dhoK8JAA/KJgsAtgUK/HHx0KAUFcOyBH6ZKKfDyhjx4
	EglX5ANoZx3fH8wxzeHe1H5kYL1P8FoBKpoqDmqZdguZtNB0J+Kxx7NX+V29Y80EMCb7qGI2ON+
	FIWny0fHqqcErBrUTOCICWsnu4yUbe2jSlbIQhLpGtKj8MOQ6P4howTLsyL1041grPqUMapObln
	dqbcrHNqvs/+gQppDlqxW+W1RLLg==
X-Received: by 2002:a05:600c:4715:b0:4a3:598e:e7a8 with SMTP id 5b1f17b1804b1-4ac150b28bamr66801575e9.4.1793378152471;
        Fri, 30 Oct 2026 09:35:52 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723fcsm4084806f8f.14.2026.10.30.09.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:35:51 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frank Li <Frank.Li@nxp.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefano Radaelli <stefano.r@variscite.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/5] arm64: support Engicam i.Core MX8M Plus FE C.TOUCH 2.0 board
Date: Fri, 30 Oct 2026 17:35:39 +0100
Message-ID: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial support for the Engicam i.Core MX8M Plus Fast
Ethernet C.TOUCH 2.0 board, based on the i.Core MX8M Plus Fast Ethernet
SoM.

The support includes device tree descriptions for the SoM and for the
C.TOUCH 2.0 carrier board, together with an overlay for the 10.1"
LVDS display (C.TOUCH 2.0 10.1" Open Frame).


Dario Binacchi (5):
  arm64: dts: imx8mp-icore-mx8mp: enable the watchdog
  dt-bindings: arm: fsl: support Engicam i.Core MX8M Plus FE C.TOUCH 2.0
    board
  arm64: dts: freescale: support Engicam i.Core MX8M Plus FE SoM
  arm64: dts: freescale: support Engicam i.Core MX8M Plus FE C.TOUCH 2.0
    board
  arm64: dts: freescale: add Engicam C.TOUCH 2.0 LVDS display overlay

 .../devicetree/bindings/arm/fsl.yaml          |   7 +
 arch/arm64/boot/dts/freescale/Makefile        |   8 +
 ...ctouch2-overlay-am-1280800w8tzqw-t00h.dtso |  53 ++++++
 .../freescale/imx8mp-icore-mx8mp-ctouch2.dtsi | 166 ++++++++++++++++++
 .../imx8mp-icore-mx8mp-fe-ctouch2.dts         |  17 ++
 .../dts/freescale/imx8mp-icore-mx8mp-fe.dtsi  |  62 +++++++
 .../dts/freescale/imx8mp-icore-mx8mp.dtsi     |  13 ++
 7 files changed, 326 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2-overlay-am-1280800w8tzqw-t00h.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe-ctouch2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe.dtsi

---
base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
branch: engicam-imx8mp-icore-fe-ctouch2

-- 
2.43.0

