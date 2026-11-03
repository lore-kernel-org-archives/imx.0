Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703215;
	b=AEtk+Lh8KUIOgS/G1VKiUF1zhzTIeo8IW2FL4u7mALjNSdKC6BLQTaPZaIGBZ+117HKk
	 hSWVSIM4U2o7T6QUM7rt7WZehS6TOjA1hyNN62XWDt0WR0v/xfk1TxJ0ZLtlSjIA2Qmsh
	 Epk6Sej1k/f12yhe3QTNvyDbLN/m9qTHG8l3oAWuT/77K3XRbmHemCwavOMQQq2TBZAL3
	 CoLgopUdVmCFScmSewiCxL5W+HQuTPpN5iWG2kErjChPVHK6ZNFJQSyaEwciaETr7NhmQ
	 banj0x0yqwxIm3FCr3S98bSRKujk6SoQCIDHYyMHapNuMAP5G9Hm8I5sAxBcMlfteZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703215;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=yZULAJenn5FpHFmW4iJ5T1lRKnAas/th6WVGZ4q3kuk=;
	b=ZvcVjvewbqp9XhHX4vPH3X991s+0itx+zYqLNTRK2iZNDnsq3K0GJ02AsRgbe63ryTy1
	 fCrx2iJ5jGLjime3k0xVueqc306DOgg10nzHiw7CpTsxb6hK0jZUbzR9zhVDQt8x/jRmw
	 UzfIWeAzsJxB35pjMVAVddw1p4PN3c1VZqLJ8jgDoEhHPgihkthvQRTH4KGENO5rQW1T7
	 UfHHw30HsqiAbQEa7AdiJ739qHYnOOLzrfmfgtO9hfklQMJcNL9hgNR7OGOj+s6l2QR/+
	 j3sRdxfxZafvpPJzKugEqASuC84o1tFjLh6TJ/2LbP0ZZkD72JMmnvCwJ4kIBfjnc3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b="JrI/Tnsa";
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1D8606BFB8
	for <imx@lists.linux.dev>; Tue,  3 Nov 2026 10:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE1D8606BFB8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=JrI/Tnsa
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 4A7991F9E7;
	Tue,  3 Nov 2026 11:53:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1793703211;
	bh=yZULAJenn5FpHFmW4iJ5T1lRKnAas/th6WVGZ4q3kuk=; h=From:To:Subject;
	b=JrI/Tnsa0kSXWpKhwtP3yZXkHs8CvwVT15jM+DkFLfbHf0Zc0trrLBgE7ncGtxlhI
	 587POREeU2MVGpUlWuN4qMBFYQvZWl2oC2f5WtZ38SmKcJ5S07F4V0OldOmDhVYlsp
	 ecXD6nYfUXr2s9pAmNNwR3wry4M1O8tcH3OImosm9a+50tM8njMia776EhcCG1aVVd
	 1iWIhGv5rBIFGQZN1yQvx4ZLwIm5V7+zArjdqKEGFDT4w6LCc984wZ8v6Sm1wWTvfX
	 Sdf2kHKBR0hnlPCLeSD1mgNtHqN4PxLedWeianJDHbexeviuvwLJ3WzpTuYh0zSJZe
	 HemnP2pmBvW/A==
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
Subject: [PATCH v1 0/2] arm64: dts: freescale: imx95-aquila: Keep DP_PWR always enabled
Date: Tue,  3 Nov 2026 11:53:14 +0100
Message-ID: <20261103105323.2394012-1-francesco@dolcini.it>
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

DP_PWR on the DisplayPort connector powers active DP cables and
adapters, which do not work without it. Keep it always enabled, and mark
it boot-on so that the firmware, e.g. U-Boot, enables it at boot,
whether or not a display driver is available.

Francesco Dolcini (2):
  arm64: dts: freescale: imx95-aquila-dev: Keep DP_PWR always enabled
  arm64: dts: freescale: imx95-aquila-clover: Keep DP_PWR always enabled

 arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts | 2 ++
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts    | 2 ++
 2 files changed, 4 insertions(+)

-- 
2.47.3

