Received: from mx-relay51-hz1.antispameurope.com (mx-relay51-hz1.antispameurope.com [94.100.132.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5376A271A6D
	for <imx@lists.linux.dev>; Fri, 21 Nov 2025 07:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.226
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763710386; cv=pass; b=AcPlSvQ0Ec7v+jGL/brB6cHeLrQMM1qnGsHpJXQWD4CTHnOSls2EGYgkF9VVSpC1LpEep+Vn3Hpepx0pf8N5b+Yl+guE7DQrOVkPWbz0SJl/794qe1NIhlxjwA+UJcfQMtxmmw3UKqJZbfbDMC/3fhlm8MyX9+M5hDMM8nvkrSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763710386; c=relaxed/simple;
	bh=yxLZqcd5zM0Zptc34DEGfIKYPe3PxXkgB686Z8yY8kw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h9C+9zULuaqY4zNcplf4sPvwvUNwBauRy7rkvZZJyw0lW1/6giGAGgcK6uWUCn/MMRhM5FzvbeIHERX4hGg6r0lmF8hOtykqCbXXEMyIO+435hqy72SceJ3EA7CIWbSM7OGRzXkZUOQpwTkiQijctDV55TirGc8k2qrYvkhy9lw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=PHzWghmN; arc=pass smtp.client-ip=94.100.132.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="PHzWghmN"
ARC-Authentication-Results: i=1; mx-gate51-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=SHcSWj72/by64/S98T4wmbPzKNfmbTKpvj8oqcHTQ4E=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763710317;
 b=kIKf5eeOVK3FE+LGURmCcmEwJJhBO9laMQOe7W5sOoYO3372pREewAZrsykzju2u/a6Ekk10
 yBLHoM1awJ4YaOChX4au/qls1u/ez+NzKliL8lyoNYbvBLoyI07WA8scKANOUipNKMUgal1BdCZ
 eqXJ49x/aLE5akV83AIdXIOr0RgsLTnmLuV/8+J/Z1LGzHGJsY3fci0g+Ave4LjISuoeRAJeG1z
 e+o3l+ySqizsyZgjD/AD9PHWByAC8ezXDanri4vkm8ovOrhEzcOLgx0t9EAnpjZ82pxtnm8kCfi
 l3YS5+ZOoPIHmXCB0RmWh3k6I/RTX2KF2P+MN0M+U0d+g==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763710317;
 b=o1F1BTLF8uLGB7DfhoLvj8jEd/RID5G8fGU6jk/uBanOXBTI89EswcNDNW1BJGrj7aGxqSYx
 XzX97gfur2fXukiX5ikost3xgHebUq7jl3Vm4eMFGdaD6CjPT8TUWl9DlFmblrDS+AbJB2NcK4e
 KNLVEw6aWk0wrHbcjFr0W/opDLARlksVmVpo3oQfL7tNB9GNMtTj327fSLwMfmbKMQvr+MgAvhS
 aTUyO+Lan356n8oS+gVaR5yW3ZlMhnrR+1FKCM3st7vYMepQ0AT+b6Gprmbr7wSTWhsmylgJ8CZ
 O08/xBCJqJ6dOUSCGTrBeMGNWMVj4jdhmoJaangjxJ98w==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay51-hz1.antispameurope.com;
 Fri, 21 Nov 2025 08:31:56 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 7DCBB5A076C;
	Fri, 21 Nov 2025 08:31:46 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: tqma8xxs-mb-smarc-2: replace 0 with IMX_LPCG_CLK_0 for lpcg indices
Date: Fri, 21 Nov 2025 08:31:41 +0100
Message-ID: <20251121073142.3367642-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121073142.3367642-1-alexander.stein@ew.tq-group.com>
References: <20251121073142.3367642-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay51-hz1.antispameurope.com with 4dCRjv1PFPz33Nyk
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:4b0d0fc0d52d0a2e82669a6eda2d09f7
X-cloud-security:scantime:1.914
DKIM-Signature: a=rsa-sha256;
 bh=SHcSWj72/by64/S98T4wmbPzKNfmbTKpvj8oqcHTQ4E=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763710316; v=1;
 b=PHzWghmN4ZipjUWkTPlriSBPbst46BADsDn4L6JrlsnhizOe7bS7/N4KCJbKQKIi7EkXbfiz
 LosGMU12IR/KPOFS8GFTyTrwYw0qX4XqAeXgzunuHHSCsWdWetaWlea6vbXBLrfJb9kpvyF3cce
 TLmtFSsxb4qCz+HhCuWn9AUUIaW+GkeZOPL7BuQ33EW5cjXOi7/0IeUxEPuVQz7EADiWNYp77Rn
 9XMgZQEyU1yW6hK+bFfcVC3JoyoTE0wTkBg75sXGcHImR0+sHdIqck3BW9jf0h4SOL/lUDDlDK+
 3L1ECcWET4vA82LDC53cBFS96vulaYPEq7rc5ZRwSFLbA==

Replace the 0 with IMX_LPCG_CLK_0 for LPCG clock indices. Although the
numerical value is identical, the LPCG input is defined as
IMX_LPCG_CLK_<n>, so using the symbolic constant improves clarity and
consistency with the LPCG clock naming convention.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi b/arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi
index 3d20e3bf32ce7..8bfe77113d64b 100644
--- a/arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi
+++ b/arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi
@@ -130,7 +130,7 @@ &i2c0 {
 	tlv320aic3x04: audio-codec@18 {
 		compatible = "ti,tlv320aic32x4";
 		reg = <0x18>;
-		clocks = <&mclkout0_lpcg 0>;
+		clocks = <&mclkout0_lpcg IMX_LPCG_CLK_0>;
 		clock-names = "mclk";
 		iov-supply = <&reg_1v8>;
 		ldoin-supply = <&reg_3v3>;
-- 
2.43.0

