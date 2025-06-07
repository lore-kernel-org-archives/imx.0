Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFEA184F
	for <imx@lists.linux.dev>; Sat,  7 Jun 2025 09:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749288831; cv=none; b=AeoK4zT5FXpaSVsb89TFOjwFlAudZlTbwJcFbARv13kZiO9x9Sy5VrH8TvNCU6RocHT9K7zU3qO4OaXwYyezc6vl2MatdENMOm7H9K+uEqo041cEfXmrvx0i1Hn7/DjpYb2zRATHXDD3zvd+ZqrGjIL0WJfaovkhNVkYDjXKWHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749288831; c=relaxed/simple;
	bh=r/p8vjTholAGUnw7ennp4sAfJrYAwEt+Ralg6aU1yrI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZjI9HmIENLKxD0EB7H9LHkCeS6BSlfXxZUETwPR+SWSEr37eydElnPK9TVZhyHGTDazT471PRbxZ0vH3kk/WGtpKd5bK8boCF3ut3iwZmLA9iUWvGBqSERBqEmE9B7j3GLLNDJxN6AydHBG32yMv60tmfpd9MXNVvz8PqB9scyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=HN4CrKL/; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="HN4CrKL/"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ade4679fba7so28571066b.2
        for <imx@lists.linux.dev>; Sat, 07 Jun 2025 02:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749288827; x=1749893627; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xn1CB+ZLcGxV8ZFV2HSZz3RsXenQLkjSfas4c7S2PdU=;
        b=HN4CrKL/aqwPBV5dld5idM8UvNNdon53CUq4c6DdmsVzneTHKmwTdkaQHlovcwsk8b
         846VMDBHie6zy/KYsZ/Msq6uaLyme9we7CG1HKAJQ0raaaZeNEVJqeB+Hwe7AooOItJJ
         W/d6xfwpoO2cpX/o4gMF8fZ340wHlQLoiir34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749288827; x=1749893627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xn1CB+ZLcGxV8ZFV2HSZz3RsXenQLkjSfas4c7S2PdU=;
        b=k2brFvL6O4/LSeZekIlV2PTEK+tcuOKeT75dzfYgCQ2znBOHT51ZAYRwQ4X5a73x+E
         F1AuTmO25r+JM7IXBzFjSLLiVd/hSxL98FtTUe4icST3nYgrNNUJjCvOnGcSMWYsnkBn
         LDRuvNH6UAh6TBGxjlFi6q5AuXqAWSg59QwXLx/H2bnncv96FJVnqa1nppVYA/tGOzGY
         fAOIkstZ/v5J+P5UB8d3VUcU/Lo0zuI8z8n4YG7DMGG4Q2kfR3/yt8bxNz80bXl5t3LM
         kDm9K3WyarU7FpeQ6ajhmIpOXOGiA9BdUKh1Bab7M9dwzwcuzi9CzDCawM1c6tdY0fiz
         HI5A==
X-Forwarded-Encrypted: i=1; AJvYcCWmbjXa1faLglc7VSd9Op/HYuB8oF9kJIE7lsXU6O9bJXQZAeZUVgueuN5ZmvC622DgMes=@lists.linux.dev
X-Gm-Message-State: AOJu0YyA6WWzB92gp+X+YmGyBtDqJJz9a/rO2aTAqQOT3vkTpsWC4w8J
	ULNQm9PTmaBd5VIBJWstqHTDL/iWoXQ8qOANStomuDhoEAgIcU0u4nxIFRJZzmUxQB0=
X-Gm-Gg: ASbGncu0TugGBxFQLNhaYmN2gas6mswJEtRlPvwjkwTWyNWBr+LHURFIyKdMllZgMT2
	GCSmzlm1kKGGOiuTQFXgotx08eCGkBBRaDoQfyJnz4az/AapjWutF98ub/8xmc471oZxw8fA6X1
	J6uiZYQWFe2QpV9OqQUQA1okvVB0uciowkrVCSdc4BITqehPlfN1POQYRijllYo/mHHWtiq13vb
	yZgQCpchmv6ZrzOuJCmZJZPq/18cIUkA9lqzk8L9uXeMcU1Hb1TUBFatbVzmi2GFTUsPPwgz8i2
	wn+9xi8Suh/8sQ5cycZVOdt04mFSfnR+SElqIZWRfHGvtIOCSFXC8AxLaLmu1szPTUZONB5BxyW
	bIFPG3AFs46kPYOwnXEGNdeLE6+uRLuliVEZIljtvwbICF0/f/qnDD/E60KnIj31QH+knY8nYRH
	gYDvdxb0IUkJRB
X-Google-Smtp-Source: AGHT+IFSjDnmW2EWNA+L7rjZYf/CeSyJkQ7tNtchDLVj5RAdGtBJa7XPtmYoEbrLf4khxRuwgaXdPQ==
X-Received: by 2002:a17:907:9491:b0:ad5:42bd:dfab with SMTP id a640c23a62f3a-ade1aa8db96mr547985866b.30.1749288826712;
        Sat, 07 Jun 2025 02:33:46 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c316sm251541066b.98.2025.06.07.02.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 02:33:45 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 00/10] Support Engicam MicroGEA boards
Date: Sat,  7 Jun 2025 11:33:12 +0200
Message-ID: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series adds support for Engicam MicroGEA boards:

- BMM
- RMM
- GTW

based on MicroGEA-MX6UL SoM.


Dario Binacchi (10):
  dt-bindings: arm: fsl: support Engicam MicroGEA BMM board
  ARM: dts: imx6ul: support Engicam MicroGEA-MX6UL SoM
  ARM: dts: imx6ul: support Engicam MicroGEA BMM board
  ARM: imx_v6_v7_defconfig: cleanup mxs_defconfig
  ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
  dt-bindings: arm: fsl: support Engicam MicroGEA RMM board
  ARM: dts: imx6ul: support Engicam MicroGEA RMM board
  dt-bindings: arm: fsl: support Engicam MicroGEA GTW board
  ARM: dts: imx6ul: support Engicam MicroGEA GTW board
  ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503

 .../devicetree/bindings/arm/fsl.yaml          |   9 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   3 +
 .../nxp/imx/imx6ull-engicam-microgea-bmm.dts  | 306 +++++++++++++++
 .../nxp/imx/imx6ull-engicam-microgea-gtw.dts  | 164 ++++++++
 .../nxp/imx/imx6ull-engicam-microgea-rmm.dts  | 362 ++++++++++++++++++
 .../dts/nxp/imx/imx6ull-engicam-microgea.dtsi |  96 +++++
 arch/arm/configs/imx_v6_v7_defconfig          |  27 +-
 7 files changed, 946 insertions(+), 21 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi

-- 
2.43.0

base-commit: bdc7f8c5adad50dad2ec762e317f8b212f5782ac
branch: imx6ull-engicam-microgea
