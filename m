Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C191B4C40
	for <imx@lists.linux.dev>; Tue,  2 Jul 2024 14:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719930165; cv=none; b=mDWovAhZFtB1ZgZ6xqGBSV+HmAIUZ7G1fK/hV5UEuRM6vEOlYag74dL8Hp2mMwVycdG2k2ezI7O9r58TFOVvojMDB9Dkg00kHHIUxo0fi2VaevAx1D9Qx9Qn/vedpE2Igh1nN/TyNgpg8uzz8sR2UloM4Z5pXbAG4E4EMERnpFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719930165; c=relaxed/simple;
	bh=dSqA0WJwONdnDRjPyfgrxIbFkf0TgYNjP+WX6fcFj/s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JA7B99fmIZ4H/50elbXIhyAEIwgebufYeFcxU/PdNSflTRma1JYw4RFS8S7JTGCfb6DBHS6GDnL9AAuNAIvYR7hSLW6yOEaWa2R6C4IRa864O4tmx1BEkKqcKscDlUz+WeYrDsqKSkXQmD5hf5N3ALsrKpJvyj3C0BYgowm3U0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=EcFmQWyQ; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="EcFmQWyQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=RgNsx
	IBTnRixaco0TSES660SEZfQ7LzHwlkGOUI+uHI=; b=EcFmQWyQ4to1zBGv+6mCu
	pcjU0ul+p95rrUCnloVkHqE1D97Vl6wwGLeVQD5BOib/XOA2uGdBRaOr1lFinbsX
	tFEkzv7nccNTnJb1wdWd16WDGvUE4sitL+zGBCKYzY9shr7ITzx032gCOfl5dm9b
	MN2uLmue1i7CQ+QXiMQ6n4=
Received: from localhost.localdomain (unknown [114.218.218.47])
	by gzsmtp3 (Coremail) with SMTP id M88vCgC3H+0TDYRm7sMJAA--.947S3;
	Tue, 02 Jul 2024 22:22:13 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/5] i.MX DT bindings for 6.11
Date: Tue,  2 Jul 2024 22:21:50 +0800
Message-Id: <20240702142153.413061-2-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240702142153.413061-1-shawnguo2@yeah.net>
References: <20240702142153.413061-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgC3H+0TDYRm7sMJAA--.947S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7uryktw15KFyUur4ruw4kZwb_yoW8XrykpF
	sxGFnrGry8JF17Jr1fXr1DCw15XryxAF13JrnxJF1xAay5Aw1jqr4rtwn5Zry7GryxXF1j
	yF17Crn0g348Zw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnNVkUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRUQZWZv-d9IagAAsg

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.11

for you to fetch changes up to 189375a4b36ac4b845541acce20485116f137ec9:

  dt-bindings: arm: fsl: document Kontron SMARC-sAMX6i boards (2024-06-27 15:22:18 +0800)

----------------------------------------------------------------
i.MX DT bindings for 6.11:

- Add compatible string for various new boards
- Drop Li Yang as maintainer for bindings as his email bounces

----------------------------------------------------------------
Alexander Stein (1):
      dt-bindings: arm: add MBa8MP-RAS314 SBC

Fabio Estevam (1):
      dt-bindings: arm: fsl: Document Compulab IOT-GATE-iMX8

Michael Walle (2):
      dt-bindings: Drop Li Yang as maintainer for all bindings
      dt-bindings: arm: fsl: document Kontron SMARC-sAMX6i boards

Peng Fan (2):
      dt-bindings: arm: fsl: add i.MX95 19x19 EVK board
      dt-bindings: arm: fsl: add i.MX93 9x9 QSB board

 Documentation/devicetree/bindings/arm/fsl.yaml     | 32 ++++++++++++++++++++--
 .../interrupt-controller/fsl,ls-extirq.yaml        |  1 -
 .../bindings/soc/fsl/fsl,layerscape-dcfg.yaml      |  1 -
 .../bindings/soc/fsl/fsl,layerscape-scfg.yaml      |  1 -
 4 files changed, 29 insertions(+), 6 deletions(-)

