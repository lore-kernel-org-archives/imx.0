Received: from mx-relay16-hz2.antispameurope.com (mx-relay16-hz2.antispameurope.com [83.246.65.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F79E33F362
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 12:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=83.246.65.158
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761828667; cv=pass; b=oo82IN6I4lU5P4mMzwbkbnTOi5oA8SQ6o/d4oeuoUETKM/JR9dMqfX0gaPYZpz5IpgUaFEBS6zwdmxZRqkWACInVPi9Rs5/fU7y0oOxcDQptr5kEWS2LxjALCIcmRn6Z9hGjGnDeh4nD/zKECPkp8G2tdGxzauehC7yVhI6skHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761828667; c=relaxed/simple;
	bh=f+RxHNX/PkgtqpUObsVvi3CaeeKjaEaIpLrIKPlMWiA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dMmAc8hv4zRRePx/ZUT20MeSbXQDPaI2x0aTs1Y2X3GnbaRgnss8ojhOcj9u0RyHekSBFTFnI+TbsvEruiHC8UC/NtnnKt9H1QEnN1ZIPI13yLB2D90TZ7JeTzZMktWO+p+UTWkD9xVjPuLcL6YKTiPd6OEhMo7r6mt//tpZC+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=qKmkJJ1s; arc=pass smtp.client-ip=83.246.65.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="qKmkJJ1s"
ARC-Authentication-Results: i=1; mx-gate16-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=hEveejQ5LezW2cXHJne2TGfo1ZNO0O+jmUKcv/3d1g8=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761828599;
 b=GKTMRyNrHH5x8pxuFz8A1nKiD51ijVYMZz2Mk608WTCDWLV6Wi2FzEJtm04/rQBo6kjtiYGJ
 PVftdEDJGl4IX1kukLp3IQjsYDtInNdkLL9D2wkUU3Cn6MqJ71OgQjr4MXVHc+slRPfculL2Dm7
 +6i2YMQUT753p9wR1XpfzRxRA+nlXryQuLh9RBjQz5OlVm5MSxT2Omw72U6xDJskYEJhRkBLkBR
 DhpwWttSWZPkdlgXsVuj7TbZAdk6JNOI5Vf8pETfnrKAoYui7a1o9HNwoYNwTA+vYEKBiY/1nJQ
 gkW7y0iwzcJ903ZBx+t0w4L92NEKUhXmQiUq+8wNIrkAQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761828599;
 b=d7b9Z43IYldBa3F7bFsN33avbvTw5YibWrmiUpSML+sFOND6KTbW/ARdbB8TdtrAIVi5KBuk
 Ytyi7xdUf2HyEn5nhQ17lqmX160w4RXUePvJV3GX3h2avL7pvIkIy/PGW600/fjcttRqUXMkvnA
 8RawRTvMDg+tk0HrfcHRypH/JsK+VHrXjelgFpYdghTLqPm/Y8tmUh4WPOPPSYZagYn8RNSSqcZ
 uUkiNAbsTrWeZcG8eBa+1DlBzWE/kiBBFZKgDZhBdGwxJEdRHKBb34Cz5jpxXpdxSjHNukVxxHO
 mMjoZg0VXDdpwifc7CGidV6Pa5KvuHQIBel0+uKJ9Iy8A==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay16-hz2.antispameurope.com;
 Thu, 30 Oct 2025 13:49:59 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 1D6A7220C5A;
	Thu, 30 Oct 2025 13:49:50 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/19] TQMa95xxSA DT fixes and cleanup
Date: Thu, 30 Oct 2025 13:49:07 +0100
Message-ID: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay16-hz2.antispameurope.com with 4cy3q25g17z29yQ2
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:4af8d990a1c9f7c4fdb1574041f6d9a2
X-cloud-security:scantime:1.686
DKIM-Signature: a=rsa-sha256;
 bh=hEveejQ5LezW2cXHJne2TGfo1ZNO0O+jmUKcv/3d1g8=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761828599; v=1;
 b=qKmkJJ1szVF863rOZDua3FbmH/i+75OQh2HHddtZkXIvzHQi11lWQFScDRJKZUQm7z+372Bm
 e/A+C+UJ8hk+klwOfgapv0DwPEVGnx2uGZdIg/qRFv8cJCxdWS/kjhVoDe1ITkpUHm9xyzD1w4B
 0HoBhO4HaIcri0FzIbxd8LYScZ/9IVJ75CG2HuJfyV1ZrQppdCKtQDIbci9GV+x1CMeHKRi7Zmo
 24OxkRjDCyGZfFaoGO/tWsZ5Sxv87nIEtswOGK7uervdqJuYoKzOFs8SwVqqJ5QT5HGJbHRnkJz
 9B0RqYazKfvizi5G+fFuY6sJbOL3vlgFgazyDS+N7Q/lA==

Hi everyone,

this series includes two fixes for TQMa95xxSA. Having a Fixes-tag I put them
at the beginning. Following patches are DT cleanups:
* move pinctrl/config to module .dtsi as SMARC-2 already defines the pinout
  the mux is fixed already.
* Remove 'sleep' pinctrl settings as they are identical to 'default'
* Add I2C bus recovery
* EERPOM page size is increased to 32
* Whitespace fix
* Add MicIn routing
* Mark LPUART1 reserved. Unique control of syste manager (SM)

Best regards,
Alexander

Alexander Stein (14):
  arm64: dts: imx95-tqma9596sa: reduce maximum FlexSPI frequency to
    66MHz
  arm64: dts: imx95-tqma9596sa: increase flexspi slew rate
  arm64: dts: imx95-tqma9596sa: move flexcan pinctrl to SOM
  arm64: dts: imx95-tqma9596sa: move lpspi3 pinctrl to SOM
  arm64: dts: imx95-tqma9596sa: move sai config to SOM
  arm64: dts: imx95-tqma9596sa: move pcie config to SOM
  arm64: dts: imx95-tqma9596sa: update pcie config
  arm64: dts: imx95-tqma9596sa: remove superfluous pinmux for flexspi
  arm64: dts: imx95-tqma9596sa: remove superfluous pinmux for i2c
  arm64: dts: imx95-tqma9596sa: remove superfluous pinmux for usdhci
  arm64: dts: imx95-tqma9596sa: add gpio bus recovery for i2c
  arm64: dts: imx95-tqma9596sa: whitespace fixes
  arm64: dts: imx95-tqma9596sa-mb-smarc-2: Add MicIn routing
  arm64: dts: imx95-tqma9596sa-mb-smarc-2: mark LPUART1 as reserved

Markus Niebel (5):
  arm64: dts: imx95-tqma9596sa: fix TPM5 pinctrl node name
  arm64: dts: imx95-tqma9596sa: move USDHC2 config to SOM
  arm64: dts: imx95-tqma9596sa: add EEPROM pagesize
  arm64: dts: imx95-tqma9596sa-mb-smarc-2: remove superfluous line
  arm64: dts: imx95-tqma9596sa-mb-smarc-2: add aliases for SPI

 .../freescale/imx95-tqma9596sa-mb-smarc-2.dts |  75 ++-------
 .../boot/dts/freescale/imx95-tqma9596sa.dtsi  | 153 +++++++++++++++---
 2 files changed, 139 insertions(+), 89 deletions(-)

-- 
2.43.0

