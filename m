Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3278002A
	for <imx@lists.linux.dev>; Wed,  7 Aug 2024 14:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723041854; cv=none; b=PuqBXYZiqRIOxXV8mmNeyhhXuZhIPBT0ViTStqi/O7oWvY6d2IShvfqoCVQZxH8ti42l4h4Bj6gkapp/BNDge9+6BMsmusAUIvZod1/u078dH5QIxO2MurEDMPVoBJoPjCw3+mCVHKkf3fXP5AQvJ5jkR3Kf7BQDDMWsrFnb/rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723041854; c=relaxed/simple;
	bh=1wXFUXacdcHmdJuCUAN7seSMcROJHTTZ5paLr1YkhHM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Aj5AWRxT8C4Mkgq3iCZgPyByV03Zcw9EnzGjx9+faYaFEGrjXg/Fh19Q0+TloClBDmJthKK1csWmE1+CQS1fPP8Z9OuLQja/DsC+qG4wXtL2G1V+QJuMIwFO+KJp7ZT+F0vCJb4QO0ez2Q4UDedK+BUeNbeSbGQGkQg02sb6aQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=ig9zCT+1; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="ig9zCT+1"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 4B19020AC2;
	Wed,  7 Aug 2024 16:44:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1723041842;
	bh=cHf+pzsl9aGQ+dz9I9/zj5VztDDS+JqbQhQaGmEg1xg=; h=From:To:Subject;
	b=ig9zCT+17m5MwRBH+dUzQyLjjIJ2yWRKdJSBoaaF44p3YNS9eBm7ePHpBd6wxa+VD
	 XlvWaumECRH/dmt2n3oqLfzNOCj7h6vhrUnxKAOkqD7aT5RGrMiwcpU0ZoKHCdDCST
	 sGoknX1DdEH/YLrmWyyzhAK4HBYwsc9Uh9zlpvarGB34+3yovDMWO6KMKf0R3jtTpa
	 qpArh12stl+tH+yqJP5Q8wBdnrdQh5OlJYoveHB2U4p4XrQbmOs2CgZ9qlpLZbFBI8
	 FiVLCjIdDb/cmfQH3aivxmnZlYMEIjtxr+/P2PMIb50ET6+W3TnhaDGXHXUkt+ZVRK
	 8Dol75w7uDqJw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Wei Fang <wei.fang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Linux Team <linux-imx@nxp.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 0/4]  net: fec: add PPS channel configuration
Date: Wed,  7 Aug 2024 16:43:45 +0200
Message-Id: <20240807144349.297342-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Make the FEC Ethernet PPS channel configurable from device tree.

The current code hard-code the PPS channel to be 0, however on i.MX8 the
channel is 1.

Francesco Dolcini (4):
  dt-bindings: net: fec: add pps channel property
  net: fec: refactor PPS channel configuration
  net: fec: make PPS channel configurable
  arm64: dts: imx8-ss-conn: add PPS channel to the FEC nodes

 Documentation/devicetree/bindings/net/fsl,fec.yaml |  7 +++++++
 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi    |  2 ++
 drivers/net/ethernet/freescale/fec_ptp.c           | 11 ++++++-----
 3 files changed, 15 insertions(+), 5 deletions(-)

-- 
2.39.2

