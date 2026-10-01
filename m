Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED903DEFF3
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 15:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870059; cv=none; b=k7PBeB9FkdWdmXaBII27DPVIm45kq7Wy7ePa1nLZQQuWxYKaEeAisw+jlWyFL7Oz9fEvoesjMkOwQ7wl0xZNkg6ZHGuuzQAwxsoUEQEnWN9ws7ltNi3NdSnP+rrkigEkXDBnuqmI/ATYXg0hiLAYVA+0x3T+E96fCzBorBnRIYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870059; c=relaxed/simple;
	bh=3G6MctPuFEq3MjP/UFIoNxPCj/ilxJu+9NYiVdYelYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eR6JoetWcqO58uh3Y9otSzFdzC3Hg/iYYXzIOAS76R61XmUiD1KWQAgSj3q/xheix8b2or6MJzDlHybALHL0VpG/j3SaxOX2RqTGoh5aRq/1pMBb95gxStC/yERjGZStzGw6QCVBQfAMp69Gt1QZXEp+WrF2ZePbwoSf4syiAgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=jxkKekKc; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="jxkKekKc"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id C6C8B1FA7B;
	Thu,  1 Oct 2026 17:54:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790870048;
	bh=nldvaWty8I5E20Jn3Utrwqefv4fix1llm1hvljMYchc=; h=From:To:Subject;
	b=jxkKekKcuQjNzIIkOuifbqr+9Mn9hf0cPp3k36cSqiwJdeIqPzcxTstKwWCsWTF4a
	 W2SiyfCqAMDXXWQqmXSgfASqUJ4yJtX/IPlYHdncsRRbRkk9n+3cXM/6Q+p8nNLtmW
	 LWoElcmIZZ5taiwYEKPPxjw4POfiaDjloEXHQIcP3+tbx+fpKl755I+zuKUKe1Irlc
	 RtQ02KUWt7DhhKeK+iqEFgWKrVZd9qtCqg/ah1Un5cwO8D5mvSp9Iyf6JTGLR51V++
	 i8g6QfdnezHG1DvBnJP5kxnPweGzphsjYkfWIT+nKcTb6M9qkZZG+2CdJPD2XjQ0T7
	 1ulx6gGzInDqw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] ARM: dts: imx: enable SPI on Apalis iMX6 and Colibri iMX7
Date: Thu,  1 Oct 2026 17:53:57 +0200
Message-ID: <20261001155401.2584935-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The SPI controllers of the Apalis iMX6 and Colibri iMX6ULL modules are
disabled in the module device tree and no carrier board enabled them.

A device can be instantiated from user space through the spi_master
new_device sysfs interface, so enable the controllers on the carrier
boards where the signals reach a user accessible connector.
The Colibri iMX6 and iMX7 carrier boards and the Apalis iMX8 ones
already do this.

Francesco Dolcini (2):
  ARM: dts: imx6q-apalis: enable SPI1 and SPI2
  ARM: dts: imx6ull-colibri-iris: enable SPI

 arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi      | 10 ++++++++++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts | 10 ++++++++++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts      | 10 ++++++++++
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi   |  5 +++++
 4 files changed, 35 insertions(+)

-- 
2.47.3

