Received: from mx-relay49-hz1.antispameurope.com (mx-relay49-hz1.antispameurope.com [94.100.132.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDB3345CC9
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 11:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.225
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772709126; cv=pass; b=iVmxUm0T/pgvKsx954rjeyL8gBRRzWbzUmgk86qxpTjy0W4oWX9FCMYONUgSxLS2zsf34Grh79DOp4yXdKadOxTDyUNGjk8tG/P48Let1J4Jf7xHn0mOYTQyWXoO7vZuCpPj3sxnho3YO2JGifaKSJCMSNk+67bY3jro5aQclu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772709126; c=relaxed/simple;
	bh=6fQku8EnYd0/h07xspz1Uq+De0vi8mFMzmdp11LwP1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lp0aej+QEVJ4GxDCA+kQhKyDLSqXoCWy2R2XicLoKDnpnM2s62f9F8L0KoUw/eW9/d5lYVyIbZcP4KsaR7fOdjI4CBOKe/HbWeE4nWjnXht9rrtmJOZFMyugTNaSJ6v94Ibj2d2C+BhIsatjxMWtBM6x+I//9K9cmUBPEOJqRUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=RWppIHy6; arc=pass smtp.client-ip=94.100.132.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="RWppIHy6"
ARC-Authentication-Results: i=1; mx-gate49-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=N9XnppO8FMkdczsYyKMwQiqpcLf9DtxGsFU5Qaw3s9w=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772709053;
 b=cv8O/1UIY98gV1jAY5c+uyCUQi95cDonwm0sJ2ECFLToHj6Ns3/ODR1FH3Mb/KpGQ+GzQMJP
 ojzyff1REvhzJAXigzGfRiGx25rLfIg1Li64BTPI5X7ATl9fVJ+CycYwXuWahPKLMDyPCbFMFrr
 tRJiiWfvQSqlHVFjWMlogRULjyRgVSQRW2mEWrnSujWhRoC3jTg5pqvWTyYuCxquWWdb3DB12PY
 RUfi2mhTjBGUBF3olLQ5z3R2lraeH8x0a/nsKr1aZMVFQ9wchNpjFmqC1hDdsL3JOODTNhLVJZP
 ljgdys8ru9DS3ETy7Mm/g0tYdcsavwbalIGfyw3vHPwTg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772709053;
 b=oDnkG3qtS4/CPvFpRiBVPF/e2e+WVXWDjf2CsNNB1FxLCLlvPscuYXUHvmShpdTPC8lQf2+1
 BN9rAqLvXSzGn726txGhkAIQ/xl0aZrKXdvKTeO+xdqsdm+gO/IAtSjk/eAQuRuIV+OD4kWaKb8
 akXnzNeVDI6ojMa6mUG1R+bBHXsuAfot01Cv0WEWwfWYfN3wGJJnqXY+CQ+lHSF6wwlwxiGf/6X
 U8GkUx2e8nfLrfeYzpq8bfqhA6AMBVmG6vVt1u1MeEzfOiRf6ouGf/JZDJpkiC7Gf3TRPvJ6TJh
 lCLQSExqmMikro2ZgJfgkQzwYGcw/t/SzJs9d/HYbvF/w==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz1.antispameurope.com;
 Thu, 05 Mar 2026 12:10:53 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 0EAABA40906;
	Thu,  5 Mar 2026 12:10:44 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: tqma9352-mba91xxca: Fix Ethernet PHY IRQ support
Date: Thu,  5 Mar 2026 12:10:37 +0100
Message-ID: <20260305111040.1899965-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305111040.1899965-1-alexander.stein@ew.tq-group.com>
References: <20260305111040.1899965-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz1.antispameurope.com with 4fRRfX5Cr3z28hdF
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:d2d564208654f80f3876e3d2097a5623
X-cloud-security:scantime:1.415
DKIM-Signature: a=rsa-sha256;
 bh=N9XnppO8FMkdczsYyKMwQiqpcLf9DtxGsFU5Qaw3s9w=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772709052; v=1;
 b=RWppIHy6CaGChIEF9+0h6fojvVvqbWsau8d2pMQshTpswqXlQtxmFvaCUEIUdnQRCK+n6TsD
 Nh60FeZ/JOJ0s1nwXZhv7OsG74joybmKhdNyUffvHen9CKZSXGuL1yfse1kVaBWAMa7fM5jAaEe
 FhSv5h3832VGzSiVZiuJvtUF7HZk//WeOArj5SbgGPN8GuBfY33AMFtYyBRvGW0rzKL1DVZ5uYD
 CekWcfxGrqnavp4f53/+Kdu8S8C7R4r7rtBYYm7UB3C3TTrK191DgtnedVcKDeq+zxLs78uPA2k
 qMov6nQp+iLxKKwkovY+pNzzVW3p1S2ROpbSYKakzL6IQ==

Ethernet PHY interrupt mode is level triggered. Adjust the mode
accordingly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts
index 2673d9dccbf4b..737326ba1b2a7 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts
@@ -232,7 +232,7 @@ ethphy_eqos: ethernet-phy@0 {
 			reset-assert-us = <500000>;
 			reset-deassert-us = <50000>;
 			interrupt-parent = <&gpio3>;
-			interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
 			enet-phy-lane-no-swap;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
@@ -265,7 +265,7 @@ ethphy_fec: ethernet-phy@0 {
 			reset-assert-us = <500000>;
 			reset-deassert-us = <50000>;
 			interrupt-parent = <&gpio3>;
-			interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
 			enet-phy-lane-no-swap;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
-- 
2.43.0

