Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DC11E1C33
	for <imx@lists.linux.dev>; Thu, 24 Oct 2024 14:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729779757; cv=none; b=qhCQd1YSO2vWJHn2Sw4158FkwpRTHZQp6PgNN0IruGTtZl0BsX02IpE5bsL+zJ86ZSZ/w2sLGHF6gIahLM7hkRumlGQWkteoq3gyaKKt1eplDKu8vN90tqNOMrxXJa7XrDiADCMuQ15iDbOQXk8gW4gnCTf3AlkCkE/oyi4i+jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729779757; c=relaxed/simple;
	bh=IkNGanu8ey3aOoRDoN21CFRMSVo7ePidCr07qRbGzOg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=YqH5wgGhoE7nA8hiQ83m6Cq32JSwAnc9036loTY8YTDQmR3Hty1KZadJ4XXgEAXV05JAfKqZjjVP38DpMgnPqTjIYElNjiH3FNCiK7pd9KVyCJeH79LemAJ33YPeSE4prFVbQPRCLHF+IiSyMknkpugChM/tmYhJcoecIqjNVng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=t2cFi7Rt; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="t2cFi7Rt"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1t3yjL-00AA6C-2n
	for imx@lists.linux.dev;
	Thu, 24 Oct 2024 16:22:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=J378zJcqWPCAas8Dzp0ISGD00hjd/6FaXGndJEzEA1s=; b=t2cFi7Rt+pgvPPajEh7dWgrA/y
	WJhqGXUDXcmuQfVG63VhV4zYbmjMHKQGGqhb7KM5g+m9RG57netT6XGzgBTeJbEjrhiYDLhH6f2zh
	hvrtmRABprxpam44KsZPdDJ+KMXxrlk2nfaEfvOoYlE2TpwmusVzdMEpcm2p7qMYEeBO8cnfW+rQH
	dzWTFtUmRMJ9O5u1KVN8QZTnfuU2xFhgjgIAsHBqr3ZWSV51GY2c4/nGdV26Du9lA0HclU7MusWm4
	6FUVfMl9SPmAqxu1/KYXnolJcXnlXvEtm5xQiyOmWp25qej/O0bEq7iUAVK5b3UVKyMOJiRgvXh58
	V6Xqq3kA==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 0/3] ARM: dts: add Kobo Clara 2E
Date: Thu, 24 Oct 2024 16:22:03 +0200
Message-Id: <20241024142206.411336-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a basic device tree for the Kobo Clara 2E Ebook reader.
It is equipped with an i.MX6SLL SoC. EPDC PMIC drivers
are not ready for mainline yet.

Changes in V2:
- improved commit message about devices without binding

Andreas Kemnade (3):
  dt-bindings: arm: fsl: add compatible strings for Kobo Clara 2E
  ARM: dts: imx: Add devicetree for Kobo Clara 2E
  ARM: imx_v6_v7_defconfig: Enable drivers for Kobo Clara 2E

 .../devicetree/bindings/arm/fsl.yaml          |   8 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
 .../dts/nxp/imx/imx6sll-kobo-clara2e-a.dts    |  23 +
 .../dts/nxp/imx/imx6sll-kobo-clara2e-b.dts    |  23 +
 .../nxp/imx/imx6sll-kobo-clara2e-common.dtsi  | 514 ++++++++++++++++++
 arch/arm/configs/imx_v6_v7_defconfig          |   2 +
 6 files changed, 572 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-common.dtsi

-- 
2.39.5

