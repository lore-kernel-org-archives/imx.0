Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6291A1C7669
	for <imx@lists.linux.dev>; Tue,  3 Sep 2024 09:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725354771; cv=none; b=PIgJQ9mTvNQYCD9xbtp/qDubM9TMXYrQIa5iWDWHrGfmRrE90QqjVrK1FAT4KjLQsGYbxIC4iMG1OPQn+pmlwmzAGpf3xJHwNZV+iTpFwoDRGwVLqAM3N6KwJKXg8zVyytOb4Vq5onnWF8+CSB0jAGcXF0YrcOdatCeIfZ1c7zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725354771; c=relaxed/simple;
	bh=vGwP0yWHIRZQh5ybTnwESUm3/xJyNJD/bJzGLmfxUp4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=hBl20a8ZqKFhvEnWUapQrpAwLNB5MgipvlXhxUEQVlz7lF9n6Y/oBIeIQzZugtfcV6QIVc/XUeZc//0//nx1GdL/nNxMWFDmMdKCvJG8a8CwCEBcFnK7mvobSOaTR+c0VUG/WKj06m9j0CaCkYsjtMRHDh7XqocoDSnDizvMmjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=UJh5feOF; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="UJh5feOF"
Received: from francesco-nb.corp.toradex.com (31-10-206-125.static.upc.ch [31.10.206.125])
	by mail11.truemail.it (Postfix) with ESMTPA id D6922211FF;
	Tue,  3 Sep 2024 11:12:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1725354762;
	bh=TKa+NUiDEXY9sgVcRsX2pMmhkw/pTOpi2QU6kSg6znk=; h=From:To:Subject;
	b=UJh5feOFXFMi6N7GarscxJQKZlYPWQVrKoueVMUAX2RfO76XFDAX+MimsB5b0sdCP
	 o5OplpWzQrJ9lMTq+xkcG8ZwTASz+b4wH5VGRrW1huM8Ar9z7myE0eAN8193mb1Oe+
	 5Brg1pxGhboBePn6vywoAX9e2/qUE8/eZEySWRmV+jqjXRZnrOAI1TTtdgoOqa+GLE
	 AdBoY+WsFpz7Rw9OLY6wP8HCAZp8hst9LVNedqwonWhsse8KEUMwbA8KuYMMkFRMs0
	 DXSBXNSLdbf04DOdLyvTtFoXGt6SzGpLKK1XDKXlhudnb9LuAoEKKrhWXra20FylOe
	 Xn33quKQJ9Ulw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] arm64: dts: imx8-apalis: Various improvements and additions
Date: Tue,  3 Sep 2024 11:12:26 +0200
Message-Id: <20240903091231.20035-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

This series improves Toradex Apalis iMX8Q support adding:
 - correct thermal zones
 - analogue audio
 - USB Host (Apalis USBH4 interface)

In addition to these it also removes the adma_pwm from the i.MX8QM SoC dtsi, as
this IP is not available on this specific SoC.

v2:
 - Keep I2C nodes sorted by address

v1: https://lore.kernel.org/all/20240826221541.15669-1-francesco@dolcini.it/

Andrejs Cainikovs (2):
  arm: dts: imx8qm: Remove adma pwm
  arm64: dts: imx8-apalis: Set thermal thresholds

Hiago De Franco (1):
  arm64: dts: imx8-apalis: Add nau8822 audio-codec to apalis eval v1.2

João Paulo Gonçalves (2):
  arm64: dts: imx8-apalis: Add audio support
  arm64: dts: imx8-apalis: Add usb4 host support

 .../dts/freescale/imx8-apalis-eval-v1.2.dtsi  |  69 +++++++++
 .../boot/dts/freescale/imx8-apalis-eval.dtsi  |  31 +++-
 .../dts/freescale/imx8-apalis-ixora-v1.1.dtsi |  31 +++-
 .../dts/freescale/imx8-apalis-ixora-v1.2.dtsi |  31 +++-
 .../boot/dts/freescale/imx8-apalis-v1.1.dtsi  | 135 ++++++++++++++++--
 .../boot/dts/freescale/imx8qm-ss-dma.dtsi     |   3 +
 6 files changed, 273 insertions(+), 27 deletions(-)

-- 
2.39.2

