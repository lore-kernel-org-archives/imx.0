Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494288;
	b=J4QFZpLyS9tz6wVC+RQ/6Dmtsze0RcOuxvxksxOo+UYaS2WPYSfLuJS2Aif7FiKAFwdk
	 yeC8gKPd4DbrVn2Yg8fBdoPaOsQgGrBhufBumW8JWvgR7duaWIq0oYX6id5rYmE95ViO8
	 Stj13BYyIqeThcnwOKRrxuyBWYZrjN3N6Li8BsYUcJlvvzUtUhNCeNjMqp45y0AtmRqhP
	 Jj6zetHkAiWmx1I4clGmKHwzjQYub2LOhHMbfExztgDYqZpkvKk+YoOWyGAzwgZUFvrm6
	 TXcozod/pBK9k2yBHnu7LsBMliHm23gaPkfY3Txh8eXY7zJLgxIz3JqiSzrviI0MwAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Y2IsT0Jg+TbimKFRjyF/8T2AxcX0fGduIv2EOCoI08Y=;
	b=ndAKjGx7TuBiyE0xfsLFNBlHcWjKDobLIwUCw7GLJkgbnya9QyA4jrhNArUCy/BaBtYE
	 O+9QAQJI8M56qfe2UFT8WjlJ+kK1Cpet68EDwmKRQjaWSBZtfQ2Y2SDPbzVubkJNm2XN7
	 7Q7SBmq5m69lad+firxBmrReOstfPCrRqV7hgsQq67sjNKyfPePBF6BWSoC8Emfxms3sj
	 Xhiz8+/536l+e53VySc0KT4t/2NdZOuw0N3p9Bw95ZIbQnU0WrK96L2gy7uixXh+apnF9
	 fpCAdJd9G2C1FIY2JbR7aUcwO9K5gr9Yq8W43KStBQcC2H+DVYQRaibugGofXsnWyyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UCYw3QOh;
	arc=none smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00D1606A327
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 14:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F00D1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UCYw3QOh
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7d2dbe5c4b0so1465798137.0
        for <imx@lists.linux.dev>; Thu, 12 Nov 2026 06:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794494287; x=1795099087; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y2IsT0Jg+TbimKFRjyF/8T2AxcX0fGduIv2EOCoI08Y=;
        b=UCYw3QOh3E0W3bpkkEfl5LkGDXBGiNjSh87ZI9lCZo7AC/UUlxdOQ950XMCwd6NTlE
         o7m6GICo2IJqru8Y+me63i5KXrWv8yM+z0VVLcV/eW9eJxaGcT3n8ksFvRG/wJt8X4dd
         2BnRL61Qv1ApsylZNR5KoaQzMImbjBXQ3qXr0kCy9tSLDlj1qsyeFx6t+NEGJ3xb/LCp
         zz3rXi7j1LaSJamzP03X6SbmQpvhPNSUQJW7INYbn1XViEKBYmg/dAryb1G8lOv1w4Uv
         9UdZnvNt5H/mv4TJ/S3oVyQd2prHh+V4cR7LDn+FjnawieGwYD6cWrkwATFgoC3QZucO
         RurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494287; x=1795099087;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y2IsT0Jg+TbimKFRjyF/8T2AxcX0fGduIv2EOCoI08Y=;
        b=u0dc4oK1BOzc7ACCxf0MKXmWq8aM6jP6erejvqH+4x5KmkjV+m1+k5WD+f/luZUDH+
         +GApv8GMDuRH5ux/0ej/0pCUVIKX/VIjbza+e2ms5kahc27BgnCeN779r0sPNvXRCfdn
         e6AFWs0rbIvexvfvRa1OKTOq29p9aj6AAamf41EYNpnL/BW6w+z9vt129NCOc7KlVUKY
         ewCfazjMl+58tK6qEp/ShSOXDDfQHNtES2k8PcQ4KhPJyFIR1l5VjvtfmC/OjkcTEzjm
         IlWMQQTxniWLda3qpX0BzInq/rBY6FnqkX+GGuscuE0VRjYHPt7142of4Bcp87I0NuHC
         Kq+w==
X-Forwarded-Encrypted: i=1; AL+hErFNJucr8mxLjV6pg2W+NTS78Up7OlEAXGAh1qX+XGFJOLwSuBBSmwqHO3pn0WFIJdGlWec=@lists.linux.dev
X-Gm-Message-State: APuU4Z/ZkMu4y1Fv0Y83zBbiAufyyYJJO2l/+dvZ5KgXO7zb4X1OhBWu
	JYw1CERJYdIG7bNRwXGaZtdYyWbx76pnNDtifh0Kuw6u42K+ADkAMv+C
X-Gm-Gg: AYBFou2PsCdYoV7lrBhXDTCE0dPzoz8zYQWxSzn++hRS1nMLFyue5eg/a7b6MfgQr6x
	2pk8mLBMOi5FiKEa5FBHHEzc6eYJrJekFnx2Rq3qy3l2xU/Ip7jEoKQcokOFOp4+yV9jE7mIy0m
	A9WXq4Nl/2OHFeHsABlKXJ81xpwlpeOsHEC4PEtgTUnTe6bsqCWJvI92RuzYLpOHqAp78BdsqAd
	gaFDj6cd57F4lLCqwo8X7r+7/UfDxbCR0PMRh1/bXsafe1aN62E9E97vZfEIdorxAKLCzofCSbO
	FRVStiASbUNFbtxmb2f7mdaqyiRXd7HebgEz2ZvCvo3yEke4usPZbP3AVLUHLAamQgfIg7qe5mT
	lvdSuScsOjlctaXWD1TNX6WGUN+XwY82hJZpRDVZ+U6LajurHTVeunkzsvfV3ayVE2Sr1SaA4+j
	+rK0hNT6uRooWnfdl4BUKH6lS83tRHWPXi83hlpWxgRXuM7rRu9zB/jiCo7dWmU9Arpz37H5OYX
	mPhMIYMsQYp/eD+vAPmA28fsFVlhVQGhnpxakGkH5fe9yWl+TCiMZ8SgEn8fBMum0vmpQP2dI/z
	UnECx41CoUbKYRqOmzsjDB0GnfW9hwv2Gg==
X-Received: by 2002:a05:6102:149a:b0:7d2:d194:3de6 with SMTP id ada2fe7eead31-7d5061175femr2125294137.35.1794494286681;
        Thu, 12 Nov 2026 06:38:06 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fffe12dsm5177230241.5.2026.11.12.06.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:38:06 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Subject: [PATCH 0/3] Add Lotus Carrier Board with Aquila iMX95
Date: Thu, 12 Nov 2026 11:37:32 -0300
Message-Id: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACzP9WoC/x3MQQqEMAxA0atI1hNoSu3Cq8gsokYNFJ1pVITi3
 afM8i3+L2CSVQy6pkCWS033rYJeDYwrb4ugTtXgnY9ELuAQ8CLk76mJMe3HaTgdg6Fzo5fQMnG
 MUOtPllnv/7l/P88PWp6GYmkAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794494281; l=1750;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=Fyhoh2gvGk3Ft2hHZ7zQnpX2e5GJIorXgz24xXGeA8c=;
 b=wJ/LS0jpHT8LcyyR5TSXkc6mSkonP1SS8IhsBv4qtGJ5gdoAYFflJJigSL5SExYpGh6YgMZ1U
 yfhxpkJMDaqDqYK8caPbJ0/huMKaV14HbWGQ3RhMaeUGivztiMEcHxk
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

This patch series adds support for the Lotus Carrier Board with the
Toradex Aquila iMX95 SoM. Lotus is a carrier board for the Aquila family
featuring a small form factor (Nano-ITX 120mm x 120mm) and built for
volume production.

The board features:

- 1x 1Gbit/s Ethernet
- 1x 10Gbit/s SFP+ cage
- 2x RS-485 (Isolated and Non-Isolated)
- 4x CAN (3x Non-Isolated, 1x Isolated)
- 3x isolated digital I/O
- 1x CSI
- 1x DSI
- 1x TPM 2.0 chip
- 1x microSD slot
- 1x USB-C DRP
- 1x USB 3 hub
- DisplayPort through a Mini DP connector
- A mini PCIe slot with USB / SIM card connector for a modem

Additionally, this series adds pinctrl groups to the Aquila iMX95 SoM
dtsi, muxing the I2S_1 and PWM_4_DP pins to their GPIO functions. On
Lotus, these pins carry the SFP+ low-speed control and status signals
and the isolated digital I/O readback signals.

Link: https://www.toradex.com/products/carrier-board/lotus
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
Leonardo Costa (3):
      dt-bindings: arm: fsl: Add Aquila iMX95 with Lotus board
      arm64: dts: freescale: imx95-aquila: Add GPIO pingroups for the Lotus Carrier Board
      arm64: dts: freescale: imx95-aquila: Add Lotus Carrier Board

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 .../boot/dts/freescale/imx95-aquila-lotus.dts      | 365 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi    |  61 +++-
 4 files changed, 422 insertions(+), 6 deletions(-)
---
base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
change-id: 20261104-b4-v1-aquila-lotus-dtbs-00c2e45a1a66

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>

