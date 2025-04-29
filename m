Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A002BE7CF
	for <imx@lists.linux.dev>; Tue, 29 Apr 2025 11:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745926299; cv=none; b=Pt3nictdQE/X8pXnoZ4CPZvuygtR0MaSXPvnPoaDCNlxwO3TkMxFOz4iek0Xw7fihd1FJA3SL7BiAm6CJtmDKIGSL7cWycTYQgboNFAOSBSFVRqb0rCOhtx9EUqJaxqtvKFjMW8yWXeSqpa4hBoJ4DjPFkUqkoPbLjAX7wx34gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745926299; c=relaxed/simple;
	bh=kt9z5AZF47ZzJNObfpyt1sWj3nrPy9cir5r1m2YwAB0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RqkuG1PmHkh0QmMZ4uS3aItYqtEFcqCZ8x21FIXw9a6Cujw01/W4a7JVz4i+j04rgiUBVSr1gKANKIqhBiKhPaX7r8Y4mIjPQvAFFMJ4vxUR1sTdSDW82tDC6maVmdGlEOt7x+BTrN7x5a/bsKtttpRDkNNSHA6jVaUWQXx1eow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=j/oTH0g5; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="j/oTH0g5"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 027E01F9BE;
	Tue, 29 Apr 2025 13:31:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1745926289;
	bh=PgyhIqI6R7U0FrORGELeeyBSm2wWl3XJdSnlKrJ1GvE=; h=From:To:Subject;
	b=j/oTH0g5UfDISMN+QvKXJ+rgwqoZ2kZ4MN9AEl68nM69lZv2H2keBUjolOPCguvfp
	 PhGcArVPkzaYluRKl8nyer6OfxZfCl/TwssMUg68ADrcQqzKd6PhrdEIsZvuqdKiTK
	 j6gStV5B0WAh1huHcipn/voghQ/1Cg0lwaor6diZgg8yXxKWTS4GoKDnKqZSHM/QpK
	 UOyFTpNDnke00/7iZnXFn9CyFa6gimddEaUdD3YYYKqtvDG19qNdDnV8uvSkjkXgIk
	 hF3cRbxrlM4SouYpXy1xnaDR2yPi68SjfPGEqU85yerGzg68r65bI5WFgcUFZJL8PR
	 RRcEK0oRaBQQA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v1 2/4] arm64: dts: freescale: imx8mp-toradex-smarc: add embedded controller
Date: Tue, 29 Apr 2025 13:31:17 +0200
Message-Id: <20250429113119.124427-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250429113119.124427-1-francesco@dolcini.it>
References: <20250429113119.124427-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Add the embedded controller node to the device tree, this is required
for reset and power-off functionalities.

Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
index 0a8b9eee5ed9..c4ca01ce60d0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
@@ -534,6 +534,11 @@ reg_sd_3v3_1v8: LDO5 {
 		};
 	};
 
+	embedded-controller@28 {
+		compatible = "toradex,smarc-imx8mp-ec", "toradex,smarc-ec";
+		reg = <0x28>;
+	};
+
 	rtc_i2c: rtc@32 {
 		compatible = "epson,rx8130";
 		reg = <0x32>;
-- 
2.39.5

