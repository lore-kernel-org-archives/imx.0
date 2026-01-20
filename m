Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8288419F13F
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 01:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768872012; cv=none; b=MlSjU2AooPjzETEbKAHHy8N3c3jE1vBqb5iHID4VdiMRCfVXaewve7xFSIk9mDGcbrz8HnlZ6+aXD+CSFkaDleqd7TKNUYtovjlcSi+1qvXynMlNn+Kw+yhLRXTc6ReB3vgPxhSVyWgo9LsnnXwbAPzZ7RgKT3MP61WITldlEw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768872012; c=relaxed/simple;
	bh=R/J30TZlRaSKTXttQe9rQwnffB2LzAeC7c2M5H8/EeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kNKDEw0a4GD1e/OwbP3O1i4zRsccNRHdpVoIFDuDoaaZj7jrOjhAe/hXKvMwCekE6/hzGtJvKwdYafk3Via5MD3yK2n3e9beZENWmZi4KSms20I92Hx2uhQyI2Hj4ZlJ4GfF4S9IJW5K2yVVXCWBo7KNo9U6l74Exf8kOhIuH78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=CTkhLRB3; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="CTkhLRB3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=jp
	T1nLhGnFv6A5fusm6D2cp7RtnDUnwy0dy2T6ZVIno=; b=CTkhLRB3TA9MDfcIDf
	DhJzoQZtSJSkFO1nrqklp8mDEzeumU8mjqN/Fe+XeQ8iPxqea+KcDiLFsLc7ff+j
	Rp5TbJRbiNOi59XnZvMCFWWxoaqkJH13g8KUqVBIx2ahcA4/u+Bx1sCFciQiR3ov
	tL+X1nxvWMERGMGYQ4ogZ5lmw=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3_+V71m5pGbEbAg--.16504S3;
	Tue, 20 Jan 2026 09:12:30 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/5] i.MX dt-bindgings changes for 6.20
Date: Tue, 20 Jan 2026 09:12:15 +0800
Message-ID: <20260120011221.4387-2-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120011221.4387-1-shawnguo2@yeah.net>
References: <20260120011221.4387-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgD3_+V71m5pGbEbAg--.16504S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFykCw4fZrW8Xw18CF48WFg_yoW8ur4kpF
	sxCF93KryktFy7twsxtF18Cr4UXry8A3W3JF98Jw1kAw45CFyqqFWrKw1kZry3JryxWa42
	kF1Ikr1Y9r18CwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j50eQUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNR7KMGlu1n68VAAA3W

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.20

for you to fetch changes up to b17171492e9897f2c283d7b62d7a283cbbeee6d0:

  dt-bindings: arm: fsl: Add compatible for i.MX95 15x15 FRDM board (2026-01-18 14:39:15 +0800)

----------------------------------------------------------------
i.MX dt-bindgings changes for 6.20:

- New board compatibles for i.MX93 11x11 FRDM, Apalis iMX8QP, i.MX91 FRDM,
  ifm VHIP4 EvalBoard v1 and v2, TQ-Systems MBLS1028A/MBLS1028A-IND,
  i.MX952 EVK, i.MX8MP FRDM
- Add vendor prefix for ifm electronic gmbh
- A couple of small changes for fsl,imx-gpc.yaml and tcg,tpm-tis-i2c.yaml

----------------------------------------------------------------
Alexander Stein (1):
      dt-bindings: power: fsl,imx-gpc: Document address-cells

Fabian Pflug (1):
      dt-bindings: arm: fsl: add i.MX93 11x11 FRDM board

Francesco Dolcini (1):
      dt-bindings: arm: fsl: Add Apalis iMX8QP

Joseph Guo (1):
      dt-bindings: arm: fsl: Add FRDM-IMX91 board

Lei Xu (1):
      dt-bindings: arm: fsl: Add compatible for i.MX95 15x15 FRDM board

Marek Vasut (3):
      dt-bindings: tpm: Add st,st33tphf2ei2c
      dt-bindings: vendor-prefixes: Document ifm electronic gmbh
      dt-bindings: arm: fsl: Document ifm VHIP4 EvalBoard v1 and v2

Matthias Schiffer (1):
      dt-bindings: arm: fsl: add TQ-Systems boards MBLS1028A and MBLS1028A-IND

Peng Fan (1):
      dt-bindings: arm: fsl: add i.MX952 EVK board

Rogerio Pimentel (1):
      dt-bindings: arm: fsl: Add i.MX8MP FRDM board

 Documentation/devicetree/bindings/arm/fsl.yaml     | 34 ++++++++++++++++++++--
 .../devicetree/bindings/power/fsl,imx-gpc.yaml     |  3 ++
 .../devicetree/bindings/tpm/tcg,tpm-tis-i2c.yaml   |  1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 ++
 4 files changed, 38 insertions(+), 2 deletions(-)

