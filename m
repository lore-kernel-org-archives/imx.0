Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494523EDE42;
	Fri, 15 May 2026 21:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778881236; cv=none; b=DBb8uPT92HacjRmtYbZCqIxYjA7GeZ4tccuY3d+61cB3YJqchIiVU5k2xIA1rWxI9Kwid4l+cQ5qavWYIPXKA94I9KWxPf8Mou47ld4kI49F+3Hjafo01bQXDAf77MFD79CY7T2OXu5kXWS33Ph4Dn2dr8kAJhHVlTGIetbVco0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778881236; c=relaxed/simple;
	bh=ZgnGA9okakYMuZu+by2Y7wPlPP6A0aJoPJm5SI2Osc8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=q23KRazsLiEIxsakCAySizTKuswIzH/ZQEQUAAJNyNPZFS4TVf1PA6VGEMWJxts7hh+j826tIGgdHfy3EmUQTiXLaPaKHIG0tyfrV4JyEzcaA7CLwWb7NC9GcpJqeX9/eZNiKP1/J/tY/n+TnnVjv2A9hligDVzC1NK51occAeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fzrZbp31; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fzrZbp31"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EBB7EC2BCB0;
	Fri, 15 May 2026 21:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778881236;
	bh=ZgnGA9okakYMuZu+by2Y7wPlPP6A0aJoPJm5SI2Osc8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=fzrZbp31Q1RgLM2hd9K9On1Gj5bXG7Z2aLejiToSnNlye2hdingqRQNcYWzrjeLpt
	 MlbH8sEeCHmbqJ3Tvp+Zm570CaGVFXd4ZbHoAOlK66tHvCOBeY7zGzN02R0LTU3xXA
	 qBrB+bJr7MZifBeCiD86jbVEvFOJksE94RnKrHrjkVdDelsw4XjRUVptoDcqGJsbZO
	 WOKjXyUEnCkEvVIXwZv3Sc4aoxahjkacQhlnF0e4clow/7qGdEieUUgrQetQ7u9lX0
	 17yxaWbyFRUUYUnx3haZb4+UVYNIDwqqpIwn2vdf0AKkaMLSH99GO2zrIss6/S1zcm
	 CzJddF840NAHQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E13EDCD4F3C;
	Fri, 15 May 2026 21:40:35 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Subject: [PATCH 0/6] ARM: dts: cleanup some CHECK_DTBS warning for imx5/6
 (round 2)
Date: Fri, 15 May 2026 17:40:31 -0400
Message-Id: <20260515-imx25_dts_simple_warning_2-v1-0-b06bff192a05@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM+SB2oC/x3M0QqDIBQA0F+J+5ygDjfbr0SI5Z27UC68sQLp3
 5Mez8spwJgJGd5NgYx/YvqlCtU2MH19iigoVIOW+imNUoKWQxsXNnZMyzqj231OlKLTQsnwmF5
 mtNZ2UIM144eOO++H87wAHsckwGwAAAA=
X-Change-ID: 20260511-imx25_dts_simple_warning_2-10d3c75b8889
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778881235; l=2816;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ZgnGA9okakYMuZu+by2Y7wPlPP6A0aJoPJm5SI2Osc8=;
 b=PI91V3n2RjPoohGVCRMOLez5qVgFkw8tTuop8AYUwuwJSz2RX165/XwpLMjxUFDbpPjZULm1Z
 orRGajT2PvHBRw7b2gAyylYqxEdnnZMg7GuuNYN4hU7GvxdLm4RjNq8
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
Reply-To: Frank.Li@nxp.com

Cleanup CHECK_DTBS warning for imx_v6_v7_defconfig. (below 500 line warning
left) after apply pending binding doc patch.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (6):
      ARM: dts: imx: add (power|vdd)-supply for related node
      ARM: dts: imx: remove redundant bus-width for video-mux
      ARM: dts: imx: Add bus-type for ov5642/ov5640
      ARM: dts: imx6qdl-tx6: remove undocumented karo,imx6qdl-tx6-sgtl5000 and keep only simple-audio-card
      ARM: dts: imx: replace undocumented compatible string edt,edt-ft5x06 with edt,edt-ft5206
      ARM: dts: imx6-display5: replace marvell,88E1510 with ethernet-phy-ieee802.3-c22

 arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts            | 11 ++++++++++-
 arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4.dtsi |  1 +
 arch/arm/boot/dts/nxp/imx/imx53-sk-imx53.dts            |  7 +++++++
 arch/arm/boot/dts/nxp/imx/imx53-smd.dts                 |  2 ++
 arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dts           |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dts             |  2 --
 arch/arm/boot/dts/nxp/imx/imx6dl-gw53xx.dts             |  2 --
 arch/arm/boot/dts/nxp/imx/imx6dl-gw54xx.dts             |  2 --
 arch/arm/boot/dts/nxp/imx/imx6q-display5.dtsi           |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dts              |  2 --
 arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dts              |  2 --
 arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dts              |  4 ----
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dts              |  1 +
 arch/arm/boot/dts/nxp/imx/imx6q-var-dt6customboard.dts  |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi           |  2 --
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi           |  2 --
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi           |  2 --
 arch/arm/boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi        |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi    |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6x.dtsi       |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi             |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi        |  2 --
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi              |  5 ++---
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi         |  1 +
 arch/arm/boot/dts/nxp/imx/imx6ul-pico-hobbit.dts        |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-pico-pi.dts            |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi             |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-pico-dwarf.dts          |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts             |  2 +-
 29 files changed, 36 insertions(+), 38 deletions(-)
---
base-commit: d26bfe9856a36453f591b9620dac996ff9f02443
change-id: 20260511-imx25_dts_simple_warning_2-10d3c75b8889

Best regards,
--
Frank Li <Frank.Li@nxp.com>


