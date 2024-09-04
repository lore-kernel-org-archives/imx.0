Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F9E29402
	for <imx@lists.linux.dev>; Wed,  4 Sep 2024 14:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725460563; cv=none; b=G2eQMoSwpFAwmCJYWyiK9hU3SLg4EJiRPj6d9No5mj9wEh+khjYvzKnIPjAodMu4//vksOkJU2K5iFZmO49qotXMKUzwIGkDbXDeourdR63XMWGyjDWdUh1jwK4XRfmRIP3BiVL7Kda7YiYQrC0jPQk3ZcgFqAn+IkOIsf32iaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725460563; c=relaxed/simple;
	bh=wdVsegfusX2RIb8J0wvf2wFd0NhiQoOTaTTelQYPYGI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AQTG7xd8XsIrnR2vRtG74PdVCmDR7tCvVAruCDTWaoPCsh6G+pqPEdP7ehAgiipcsVtMCQMUSrF3nRYyPt7Shql7i+YhRRqQCi19+mt1GFYcW74aXNjQfJbB+pIQc4YmSyEkSg/yxfaJK41Uv9Hbt+Uyjmq7BXWz6+bxZ3CiS+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=WpjtCQ2u; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="WpjtCQ2u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Xibod
	xPLudd8SOYJocGFkxXHI4rleVeme0jx2R7d6J8=; b=WpjtCQ2u0pEDqWF4oidkM
	VpxYsi8Hiku6Ror/Hkp+d3GwgMzsUcoqaqgK7ogBs/YwJ/o5G3NQ1s9xB24n6jKD
	VUaNoOgIfdElPjDDMb+4CcvA4xv1N3jb9zyR6de5SFH25ZRU+Yx/V4cuvvWil42A
	RQRA2L8jHMUWOKL27i6ylY=
Received: from localhost.localdomain (unknown [114.216.210.89])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCHd9UEcNhmUkhrAA--.17423S4;
	Wed, 04 Sep 2024 22:34:47 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/6] i.MX dt-bindings changes for 6.12
Date: Wed,  4 Sep 2024 22:34:36 +0800
Message-Id: <20240904143439.211552-3-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904143439.211552-1-shawnguo2@yeah.net>
References: <20240904143439.211552-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgCHd9UEcNhmUkhrAA--.17423S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFW7Cw1UGF17tFy3uFWfZrb_yoW8Wr1xpr
	sxGF97GryUtF17Jr1aqF4DAr1rX3W8AF13Jr1Sgr1rJa4UA3WqqF4rtwnY9r9xJryxXF1S
	y3WUCrnxK347XrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jDhL8UUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERdQZWbYQmJzkwAAsN

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.12

for you to fetch changes up to 7dfb497191f0d87c3b3ccfd3039df4c03d6769f6:

  dt-bindings: arm: fsl: Add Variscite Symphony board and VAR-SOM-MX8MP SoM (2024-09-03 16:37:54 +0800)

----------------------------------------------------------------
i.MX dt-bindings changes for 6.12:

- New compatibles for boards: Kontron i.MX93 OSM-S, i.MX93 14x14 EVK,
  Variscite Symphony and VAR-SOM-MX8MP, etc
- One spelling correction on TQ-Systems
- One renaming of gw7905 to gw75xx

----------------------------------------------------------------
Frank Li (1):
      dt-bindings: arm: fsl: add fsl-ls2081a-rdb board

Frieder Schrempf (1):
      dt-bindings: arm: fsl: Add Kontron i.MX93 OSM-S based boards

Krzysztof Kozlowski (1):
      dt-bindings: arm: fsl: drop usage of VAR-SOM-MX8MM SoM compatible alone

Max Merchel (1):
      dt-bindings: arm: fsl: correct spelling of TQ-Systems

Peng Fan (1):
      dt-bindings: arm: fsl: add i.MX93 14x14 EVK board

Tarang Raval (1):
      dt-bindings: arm: fsl: Add Variscite Symphony board and VAR-SOM-MX8MP SoM

Tim Harvey (1):
      dt-bindings: arm: fsl: rename gw7905 to gw75xx

 Documentation/devicetree/bindings/arm/fsl.yaml | 38 +++++++++++++++++++-------
 1 file changed, 28 insertions(+), 10 deletions(-)

