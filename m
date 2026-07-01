Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5623C060E
	for <imx@lists.linux.dev>; Wed,  1 Jul 2026 10:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782900364; cv=none; b=ir1dUqnK5jq+hFTSXtHG9d7vNg35gpjY+XUgz8h8NXPzJquT7wfRvZCM+Qyx+YWUXyk30hHbrsgHsiyimmF7hYZX/y8zDqqkhi38i7STaSmUwNgvO0if8ysXl2YZ9tOWpEld4bxzlhJtRnn7N/FE8A05i4pWNEzx1igDt9VrqZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782900364; c=relaxed/simple;
	bh=OMgFl3mgRw7oi7ee7+ffpJeMPc/deSBSwkR2KYQda/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XgINcbJm31GFhjA383hUG0yAhPmB2rcOFhVqtgpCXKvEimyCtaRIVn3FKs4iS8IaM2vTHJJKoM+uQeOnOq5vfIgNOidyGztdVWURWJdkCYFW9HcCOCnPjcdLfmtt9LIpxul+XDDsxvpAY7659sPuunFwiJ5SP8wfKO0G51nI4Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eq8pBJNe; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eq8pBJNe"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47488efcf30so261159f8f.3
        for <imx@lists.linux.dev>; Wed, 01 Jul 2026 03:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782900362; x=1783505162; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IK0eBtS7c0+Md+AQXziX/hdIdbv0oXutseltgb0KCfI=;
        b=eq8pBJNeEqx7/MgwEUZbz/S/7M/496SR2+sksOuiL0nASZPF93+10LfTs4wV8gHk5d
         2uc5qIsmKNDxg1SJoEZH4TCaVFn5jsqN5RVNhUWk1tqBZ0HxyOrbwUWt32RYHJnGBV52
         mUnNNOcZVbORrz/dcIgFHkMtfXRlwxoUSdyJPqgYoTo9xhoUbCe9nPDyFUk7Be9Vr6CH
         n5CBSkqqW5XcZJSAUw27xJacxNjX1hsiNBMK3UUgK9McnJD5pSffsXrgRkIOd5D2zBOq
         mfSvnuW4niPsF6OEtNB7uRkJZ6zPYF02lzSyREBSQgAQNMT7SlLGKdhVGoS6N7PDoB8T
         G2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782900362; x=1783505162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IK0eBtS7c0+Md+AQXziX/hdIdbv0oXutseltgb0KCfI=;
        b=Pz9pV+4fTgHwa7VbTnSgu4FKbpReN0JaMjcCdNYgIUGKqsoJ3i4ZCjsZOPv4vx3x2Z
         8fW89CImOYJX4maq+O35AxCgHWKKFuU8Ac4YOpLfYqU3QZiH3av/slpo3eSVQUHFS3dP
         CPIINzfCjuwOH31tj4pBnY4CUIjmKh7M8DizpwD5MbsPPePxk61mEU4hGDy+pCO0KQ5y
         qChF+4qW7Hcr66vTx7nC7DdSKcMCUxhymf7rWh2nk2ymCxI5p3Z50L/cuo+LDV3eS6SS
         vDtLkJlDmgZrgdobtwehSpe0w5lGu9YWsPaWSiwnJnFTyjhp8Zo51rzxTMy13veDubBx
         XbWQ==
X-Forwarded-Encrypted: i=1; AHgh+RrwTc5tpQv+faQEt9x1k+Ua0zU6XheljbNA4+O76gJdPr5uK0DlNPSyr8OdogK3yVbd9HI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCfkOLTgSJlndkVnQTvYpfKGQUi5M0yipbA97ja7DUQqy+hTSP
	Y1QauCLEZFHFZiuFqAEoFvDUm8sBCiNqVTycL3auYDb+8zz7qik8MMbAABYEIN8B
X-Gm-Gg: AfdE7clfzWqzIeJp7HmdbfBfn4h26M+j1GorC0Wa5xpfCMR+wcVJxWrtT8swZPEFtQe
	9XihraJTXxLVUaOuDtJZzRm2+NLp5rKz8VGMVzWUVgSv538JP0dUHno9jsbdlX48L9BpO9Q8vAr
	kuNicKC5XoQNa0zTFlqDrx0tAyV1Ui5MXhzzobGzdD0QFKi1W2EaWTQjtypugeiRQZQdby9AYf8
	IpX1Og5figNEJpF9DoVOKo4V+udiVdkeTkUzf+9WJt0s5wVXGt/FaXiUBAevRCVoOjctXXvd3jt
	hjnmHO6eSrP4sFMQ2LGMycvch/uQyqxIOlzeLsMzwVwAZO869jfsOjN2Gx3639D674RKayTe5Fn
	0NC/qziky8DQ25x0ID1I1eXoWkpwTNLNyArfjLOgVoT0EJ4MqiucfRikHdH0nk4GITtVzPpmDuL
	FJHKq22AXRvW9iijEwLEjrfneQkXt46KcqdDAywFtKd7uwla3EfVIp7LqU5ea09LdNIehuuuJkZ
	OCp29UNVORV+85BhFNdHKM2eyPX9v+mPC2S
X-Received: by 2002:a5d:68c5:0:b0:45e:779a:302c with SMTP id ffacd0b85a97d-4775a100e55mr1113050f8f.29.1782900361613;
        Wed, 01 Jul 2026 03:06:01 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf26sm13742935f8f.19.2026.07.01.03.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:06:01 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v6 0/3] Add support for Variscite DART-MX8M-PLUS and Sonata board
Date: Wed,  1 Jul 2026 12:05:54 +0200
Message-ID: <cover.1782898728.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite DART-MX8M-PLUS
system on module and the Sonata carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v5->v6:
 - 

v4->v5:
 - Fix nodes order

v3->v4:
 - Add snvs nodes

v2->v3:
 - Fixed wrong som eth phy address

v1->v2:
 - Fixed wrong sai peripheral reference
 - Fixed wrong eqos pinctrl gpio
 - Fixed model name
 - Added new usdhc2 regulator pinctrl
 - Adjusted irq edges

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
  arm64: dts: freescale: Add support for Variscite DART-MX8M-PLUS
  arm64: dts: imx8mp-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-var-dart-sonata.dts  | 733 ++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-dart.dtsi   | 475 ++++++++++++
 4 files changed, 1215 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi


base-commit: d0c222c2e2ce577d801bdf129dc6c078f29e22df
-- 
2.47.3

