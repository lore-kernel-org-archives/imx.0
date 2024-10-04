Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D673C158214
	for <imx@lists.linux.dev>; Fri,  4 Oct 2024 15:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728055474; cv=none; b=Vafe6uvuFKKdK+U+hG3Sq+qPAuv4w+eVWOwzce5d7jyH2j9TCQ9ZGRjudJm8TAp9AGRn4yhpbhBcU3FlU6Rp+WSzLXoKhkIoh/hNgOGb+pVtFMBGIgZuuK7Ph6B19LSeSUnlYR/dBmTRQ6r2sz2Eo25gz21gehQ1RB/89Q3Nzhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728055474; c=relaxed/simple;
	bh=mF0ytZUOp+zHuTIvmRftY/eWQJGwMOyJ5Up+N1Timyg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EuH7DUwrCkwGHmSgJUkK0CeN9V9Z9PKMqbEiQtObEWMDaFfR7z+8aBH6MYyXGCOvEsa7uwJA9FUpEQ3n9uXugZPZP132uNW3OH0Ixp2g5s3dnNV/AZsCbnPWjsadfErtbSz3ugjo2WOZCZE+voXQq9/5rEncfCfJbiRyGY9kPjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=ev327ajw; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="ev327ajw"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id B436520B56;
	Fri,  4 Oct 2024 17:24:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1728055469;
	bh=AN99eWFy5DCpc/BofOA9jLbZhN/pi+s1+FsVn+0x0QI=; h=From:To:Subject;
	b=ev327ajw0SKAkeipdyEidX+l1kmP6HWJkWOL2JPYwXHebOuQXPfuXLh25m0wn4JmB
	 uLTl+0DamftStquYEBRjskysJtz27FTT7N6nhlBVxZUtuG/RC0nwdkuXi65enBDQ5G
	 o9MCCeJV5P7wkujDc1ZeYO0zKUVgzxCfgY7CnjretOOMF9/MoQEazCyqatouc6MMoR
	 INfHypRt5n2iI+S2aGEmOwdlBtb3erpJ8ildNmazjt/eSdmlL+8lLZ05YLEOY58UBE
	 ztEyCyXpvh2LiGXRt2+X+33tma0LVWlGPDqNXMRpl7/4UYZP9XHB0zlU8ogJw8a3ug
	 MsK2kxHYaD02A==
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
Subject: [PATCH net-next v4 0/3] net: fec: add PPS channel configuration
Date: Fri,  4 Oct 2024 17:24:16 +0200
Message-Id: <20241004152419.79465-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Make the FEC Ethernet PPS channel configurable from device tree.

v3: https://lore.kernel.org/all/20240809094804.391441-1-francesco@dolcini.it/
v2: https://lore.kernel.org/all/20240809091844.387824-1-francesco@dolcini.it/
v1: https://lore.kernel.org/all/20240807144349.297342-1-francesco@dolcini.it/


Francesco Dolcini (3):
  dt-bindings: net: fec: add pps channel property
  net: fec: refactor PPS channel configuration
  net: fec: make PPS channel configurable

 Documentation/devicetree/bindings/net/fsl,fec.yaml |  7 +++++++
 drivers/net/ethernet/freescale/fec_ptp.c           | 11 ++++++-----
 2 files changed, 13 insertions(+), 5 deletions(-)

-- 
2.39.5

