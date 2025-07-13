Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD322155326
	for <imx@lists.linux.dev>; Sun, 13 Jul 2025 05:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752386129; cv=none; b=Qd7aQ2I8O7mPoGzFCNSGv+2vZ9xh4u5Fsj1ci+GWg5yxWwB20ju1lo8DYmQCG/9MeC3/rMfW9CG3TxqOxzi58BKkAew0jilrbia0QCqRUcNXr9JEZ+uXup8sJCrxqlh/oj7CHIcjYER8uC+E/UxXdD/PwMT/It4YbE4FEpSDiUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752386129; c=relaxed/simple;
	bh=RglZ0WbdUXX5rtbyruVxgOY/T+e3J1PWxdHcIrXXjKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rEmUzS1+e8BNrDMw2wRnXV6JrchplciDfs+OETQ3c/X9SRuxRZI9ld0YOQw9vhQMeUXUNmK9RdNqqw4GWzNhiLXLY7zf1QOGkLhVIp7rDwnxo7Rkx2SfKdftHmRD4Le8H8/gpY2u0Umfvl0dKSNJa2fOFe0avN8Y6mgbGVuop/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Cow2YGFw; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Cow2YGFw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=/6
	0UA9IHJoOjNHXeYUbDr/UDef8Kd8K619tkfq+D93g=; b=Cow2YGFw3bwniIMQqM
	onqbXku2W3fL5Umiw52cIGZEgytIB71IIT6ccCdhgF2NoEm5KzlAaeFb67P0sTFx
	VkrBQFEyKBs57nBOO3oyRJ7N9hZlySIgTZP4OQFnihTvpI5RT3UsioOfdxl8QC6A
	m+OdeuWbYTQgqAb+X2l4XJYkw=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDXb50mSnNoHrt9AA--.3344S3;
	Sun, 13 Jul 2025 13:54:48 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/5] i.MX dt-bindings change for 6.17
Date: Sun, 13 Jul 2025 13:54:31 +0800
Message-ID: <20250713055441.221235-2-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250713055441.221235-1-shawnguo2@yeah.net>
References: <20250713055441.221235-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgDXb50mSnNoHrt9AA--.3344S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr13Xw43uw15Gw4xKFWUCFg_yoW8AF1Upa
	nIkFnrGr1kJFy7JwnIqF18Ar13XrykAr47AFZrJw10yFW5A3Wvqrs0qwn5ury7GryxXFy5
	tF1UGrnxK347AaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jntxhUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwGJZWhzEWmtRQAAst

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.17

for you to fetch changes up to f794181b723141faa071d73b258a073e2c82d6ac:

  dt-bindings: add imx95-libra-rdk-fpsc (2025-07-11 15:30:01 +0800)

----------------------------------------------------------------
i.MX dt-bindings changes for 6.17:

- New board compatibles for i.MX28 Amarula, Engicam MicroGEA, GOcontroll
  and phyCORE-i.MX 95 Plus FPSC SoM
- A couple of i.MX AIPSTZ bridge related bindings updates from
  Laurentiu Mihalcea

----------------------------------------------------------------
Dario Binacchi (4):
      dt-bindings: arm: fsl: add i.MX28 Amarula rmm board
      dt-bindings: arm: fsl: support Engicam MicroGEA BMM board
      dt-bindings: arm: fsl: support Engicam MicroGEA RMM board
      dt-bindings: arm: fsl: support Engicam MicroGEA GTW board

Laurentiu Mihalcea (2):
      dt-bindings: bus: document the IMX AIPSTZ bridge
      dt-bindings: dsp: fsl,dsp: document 'access-controllers' property

Maud Spierings (1):
      dt-bindings: arm: fsl: Add GOcontroll Moduline Display

Yannic Moog (1):
      dt-bindings: add imx95-libra-rdk-fpsc

 Documentation/devicetree/bindings/arm/fsl.yaml     |  18 ++++
 .../devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml | 104 +++++++++++++++++++++
 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml |   3 +
 3 files changed, 125 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml

