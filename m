Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794334888;
	b=vOlh4knGYDN6CUbG4fySdaEc8HmTVrtxG924L0Pt3mLsjOCT9FkL9Uf3NnL3nA3s/vo3
	 m8J741JKHMaR9i3ZHHCjxp5qtxRS9YKkttydPJGkTqZ5EDRq3rej5xp/TwafyL44jhLgB
	 j2EoszBfxgQXVYdjOqJVqJpJsIMoV/9xoevDvQ3Csco0JuvxgSbm6FMFq2/e7SFpAbXFG
	 DcVxaby3fi+YTStyCblS53tXY7C9J58SAriCfPdT61xC5IsfcTrL8bGi1d65SXPTd+g7+
	 e/RHCS/mOOK+n3qL3z9/s7wjpC9RqR45o9+iH0SeUA0T7Xh1/hqXEr9DaLUiukPsDZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794334888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F2RJY2BkqBxCSZFDxPJ5Kj7nqHWBCu+6Ch+FlubSWS4=;
	b=ZVdcyzDGvT82NhKbmZ4cerXlDuTm5HfnpSzw9oSloF/rgqoYzeKfvBlIlSS8DRmlGjG4
	 Qhh7L2iK7PmcgpaEtxnXLJ+pXTLmJa1EURQGkXW2tBSXTJqm/YfOYuKpZHlEZ7/phvkfy
	 4aw/eJZ+PFX4EpgXPYBYljNd8I1jA0K8d3WpuTNp7z3KVXx6BZi2CwlP1NK4FM+d+54gJ
	 SdwsA6FGvjIbHtvbgTnrIcyVrOlyfQRqzGa8ZdGSSjw6ug/OcNRUthpNxnedya4E6g1jn
	 lvYhsUr/DIDaeIuQotJ6gW900/o4samcUqEhis2mKMsdQCY4n73JgBITGhwAiz7aCnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ki5eYPKZ;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DA8606A323
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 18:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79DA8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ki5eYPKZ
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so12149925e9.2
        for <imx@lists.linux.dev>; Tue, 10 Nov 2026 10:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794334887; x=1794939687; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F2RJY2BkqBxCSZFDxPJ5Kj7nqHWBCu+6Ch+FlubSWS4=;
        b=Ki5eYPKZhsY5fPGEuQT+6p+e3+aW3DAHxYv4ZoMnnD5DS9EqWw06enOdA1f5LHILUF
         tMhkyYQpswyKvdm21JDryewmC718mKBbQw69iqMT443HsGOvgZ/+zCVeImOyT86lTMgS
         zfVIAN6rAMpCgpjaV0mVKIr25lGFnWZFqlAiyEvlZeIMsJ7m+Z8sACbe3/qWmDURKrXU
         KCPO//V6vSVEOaNn5oQaHq9zkel9fuNAru+LDWUPZ8lfBevoyD50JTlkcz0qT3LkrP0h
         ftbUOfBpQ0Cj+8bRM3XoOZGVadiy5bwMhvndeqP2ZGYEsukhTiJhRZoVCZDEG67equN4
         oQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794334887; x=1794939687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F2RJY2BkqBxCSZFDxPJ5Kj7nqHWBCu+6Ch+FlubSWS4=;
        b=z8XDgXcsx54YCwUGClTazM4ygisWq9ld3n41uDbEoGgS/GSLxyte9A+yVL3JM1nUfI
         WfHX9MIMNdheMqVnjQVx6nq52dD0s8z966vC1rQxvWz0uR0V8UJGYiWkyv07G6iFIWA6
         pvNaZPu5Ui0CFDZRlDnnb1CXma3VzQyaZjSrLV7VUKkrQ6oZh+zxiLHX7CvqMWoNVA5V
         KDcJJ0aCx+99zVomSRs083bIdfdAYrB3dlb3ornGcw4V8rGnhSzIgrp/l7QxclHV6kMZ
         wm2/a3qqtf75WGLFHa6xSiGVZ4Y6jIYER3aHMcKjzTpUDEOslvGvg+RdNXjG9GvjvjEu
         KBNg==
X-Forwarded-Encrypted: i=1; AL+hErHpfP9fOuRcUY0olq2wOV+z6dmN0qRCpksWmGYVhpaCfoWB4qgbP9OEX3YUipsRdyl5TAE=@lists.linux.dev
X-Gm-Message-State: APuU4Z9gvDtGOxQV8ykf3a2lipeOZvgAI3Xw/Un4CvOruevb8UNAuSeL
	vU8HRO24eGdx18gMfqi4rk9wKiX/T5nblWoiz3PPfBs6Ncvv/KqHJtV+
X-Gm-Gg: AYBFou0xKSAp5ipHu4ub1FybpCCIh0x2bAxRr05QMVpvgTsdUVu00jtYQ4jTmWrSV2k
	eH646LwFT9C7+NynejPqsEMK1pJVt+0UhNvTUB/ujVqbnYsplB+Tz+l2QXux5TfwFGvV2xjGOny
	neM1ZRfNCqkmcJNCqWfXcSgJ3p30n0Ru+FyOGJxdcd48VAmM1IDe7hCxhUWEZxJ4L3BryLKWQJz
	duxVJsoY1QOWwf5I1/ym+HlT6tlAqer8vpcVoMlpvj4WKip+lJUUFTF9SnhyOeKqUCLVa8lJgbK
	fHmXblA+PJ77PTjrdNciSa/dxxOgPGJsnuQQcGTdbUdjO90ENFj5JpVQH+N5Uskk0N9yrHut37W
	X+cdqMoOn9TjT9FqhEjJzWjpaVdZcTKYVqxWVsO+hSVIpUA8604WGEP4ngQ9fEMA8FYoRRhKZRr
	xmFX8MsaqP9izAyQN5Bu10e1bD6zQODCqs3J7+6Nwf11Ns0a41ei4efveaC2FyKRcklssZfcM88
	LDzVIT+KBT9r6spn4fw86GyT7VFZJ5H9NxSiBIlc6yl8/V7VuENcBOICHZ37B2b01LHa6nHimJK
	zZL7C8RZmqqbVyoRXgZY+br0H0HkFUXotWDo8y81/D3ECssBZYXc6D6krijsi1oTCtuY0RbPvjH
	NnE21XvZrK88vgS1SEilPeH3T7G3NYc78x6EHJJQTCtFi5y9PaVyw2Lw=
X-Received: by 2002:a05:600c:8b84:b0:4a7:6bc7:f778 with SMTP id 5b1f17b1804b1-4ba02355aa5mr62875845e9.30.1794334886677;
        Tue, 10 Nov 2026 10:21:26 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01d9df5csm95507825e9.0.2026.11.10.10.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:21:25 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v1 0/3] Add support for Variscite VAR-SMARC-MX8M-PLUS and Echo board
Date: Tue, 10 Nov 2026 19:18:10 +0100
Message-ID: <cover.1794334398.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
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

This patch series adds support for the Variscite VAR-SMARC-MX8M-PLUS
system on module and the Echo carrier board.

The series includes:
- Device tree bindings for the module and carrier board
- SOM device tree with on-module peripherals
- Echo carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

Stefano Radaelli (3):
  dt-bindings: arm: fsl: Add Variscite VAR-SMARC-MX8M Plus
  arm64: dts: freescale: Add support for Variscite VAR-SMARC-MX8M-PLUS
  arm64: dts: imx8mp-var-smarc: Add support for Variscite Echo board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-var-smarc-echo.dts   | 647 ++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-smarc.dtsi  | 640 +++++++++++++++++
 4 files changed, 1294 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-smarc.dtsi


base-commit: a62533fb6362e6424a7bb4ecd4b5afe1a3355849
-- 
2.47.3

