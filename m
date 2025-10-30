Received: from mx-relay172-hz1.antispameurope.com (mx-relay172-hz1.antispameurope.com [94.100.132.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCFD3446CC
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761828670; cv=pass; b=HOhkYG5gIBjPAHuDYtKKU94Bkg863WGwSB+trSE0Fd3yECHlVwomKlqwVrx2C2YHTeJEE+94kfGGYpYEkMwAkD9VwO4E6hwo3KYfcA1IPsJkk+rc/XIlc7tuXFNVJShoBaw/2J6h0teO2x52nTWwdomVYwO60ixOEVY2swDiLRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761828670; c=relaxed/simple;
	bh=SBO7GNLcfMbKloOhhNir70H2TF40KEEU8NLb1BkwWh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mRGbikY245TKISPXgOgMyQZ44vjNsNav92DHHO2+QRCAl78XvRdfq/6gHIEwbFr/HzTCfBSyXSzOv6PrpoHDurO4LVwQh+CZyrhki8HIf7jXuN0YQPHn0YV4thHpuY7dBJYHO6UPZNtip+1XEieehSeBqU9OY9kzqpb40nnnvb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=nK9fC9+M; arc=pass smtp.client-ip=94.100.132.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="nK9fC9+M"
ARC-Authentication-Results: i=1; mx-gate172-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=yQrnZtKYkTmoOqZMGCIOD6/kHXaWhNyn+TUU1owbG/U=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761828604;
 b=FyG3sipBagXEe+L4w4oRvQLIWwaCax+Vu02E4YCDckegtQSmLkw27XFhRVDsfXb8qR8LYcYr
 W9WlfADlXjPBr6JGZfhm5FZt2+6Dixg5Be9JitbnSwxkjGWuIJ5fkm8ahlm6XVe6NG7CVYiVj0C
 0wZWZA5kHrCJp4EzwJxlMVEvgJelpo0Mwk3oIkgWIWEhIzYuMaOAH8vNECUDAYri9BMOBFs7qXT
 XYsnFdJKXXU1y4QbwfnknO2S/KpglFryqvoCTA+Zr7vwhIFrHzAV6B7rH03iPVmbtp7YxrkWskE
 Nd1TLrgq1m2KwhumJTUPzuPqm5hPMqbMMRL+lvFVedxKw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761828604;
 b=Tx7IZ2iYE6N2lFDE8vqP5PASMUMnYUXUUtqxkeIfPG27XBC6x4HUYqkuUL3EX88MJpt8NEHP
 Lb93eZ8/XHscZUOiubBD4AiVB+3HLcC3C3IsbIanyyMHO1ibq1pqgMzKcgu/aGXZEh58u5MZQG3
 rjM3LO0lCElg7T4/pZ1dqdYoS+IOvEXDeRCEGEyOh29ooR6WfyRAzvVUP9J7JcXtqvI3owXSImh
 Ju8xdPjS2RFBUH2gXIUfaZWNmR2DvK8VyTRVyR4Q9bMX8R7kWzRp+AmszPa1SkkYMIk+bibDGqa
 oilRZj2zNqS5Qw75h4Cp2x1hWuTN3Iv3foz3BcLlpT62w==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay172-hz1.antispameurope.com;
 Thu, 30 Oct 2025 13:50:03 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 9E58A220D24;
	Thu, 30 Oct 2025 13:49:52 +0100 (CET)
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
Subject: [PATCH 02/19] arm64: dts: imx95-tqma9596sa: reduce maximum FlexSPI frequency to 66MHz
Date: Thu, 30 Oct 2025 13:49:09 +0100
Message-ID: <20251030124936.1408152-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
References: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay172-hz1.antispameurope.com with 4cy3q51zVyz1Z1pc
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:22167396eefe238fc1584f087a1c054f
X-cloud-security:scantime:2.247
DKIM-Signature: a=rsa-sha256;
 bh=yQrnZtKYkTmoOqZMGCIOD6/kHXaWhNyn+TUU1owbG/U=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761828603; v=1;
 b=nK9fC9+MruZl79opQ/SQomuQeZY+PSgo/lRgh93T+cDmThkdmOA3qu77u60igKK7+DHlDq0O
 lXD2HPaIxJXpqRRvFS6CBknLhG+7HHcGyhODvAnv4HgjKSMQ5nCon4Qpugofx9VeQIVtIpQEi8z
 LWtXF1ayBqcEkP7Yy4GEoJx/aOEiff0Ar1ibqJBZtyXyFk2ZQQekH/EIo+tk75OxPotwRQm3Roa
 2pPm0FDoSWZ/LjUoOWCBH9R+EKj7+ULevn8CHSuDwI2ut2Nax9wisEaZHRPeU40D1aa5DS/9mSx
 qsoOHF5ijbsHWkrhio7PBEEdaO9JGcuZxmGX1IKUgpoGg==

66 MHz is the maximum FlexPI clock frequency in normal/overdrive mode
when RXCLKSRC = 0 (Default)

Fixes: d2c4d71b6cde ("arm64: dt: imx95: Add TQMa95xxSA")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index c3bb61ea67961..16c40d11d3b5d 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -115,7 +115,7 @@ &flexspi1 {
 	flash0: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
-		spi-max-frequency = <80000000>;
+		spi-max-frequency = <66000000>;
 		spi-tx-bus-width = <4>;
 		spi-rx-bus-width = <4>;
 		vcc-supply = <&reg_1v8>;
-- 
2.43.0

