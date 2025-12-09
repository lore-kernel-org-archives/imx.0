Received: from mx-relay20-hz1.antispameurope.com (mx-relay20-hz1.antispameurope.com [94.100.132.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561402D662D
	for <imx@lists.linux.dev>; Tue,  9 Dec 2025 10:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.220
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765277646; cv=pass; b=bGhTEd3xU2MqWiAfley/DtI5KGdOHz1E3N9RqQJ2YB/qbPHcbOeO3ILGUcpfi/99BYYB+AmcS8xrIw9NqIl3i8whkRBrcH6pQMpprUKxRrM9jjkTqq/xLXEHqkZFtS5oNN2UQHJ8+lUWFlbCiFU+TDGKiLjVMXfH9QXoOfcBajo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765277646; c=relaxed/simple;
	bh=hB0nbX6tYiAHle8PBHNp9gI53FQFd/DI687o3Fj9g4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=prWAr6ADK7s4m0xZONAjqTZKgzYKkLRWJYzi9GGUmFgRYTw/l5pP0O+XoK04l4yv9xHl3R2j1y3eQ7JaMs4pih5iMe9+hzbqqJcahZjxOrfbdAB2gvEGCOemkKb0qXtvL2n+n+Gz0o3wn7nBHvpnp1kBSzrRArAQh9XeUW5ZTXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=lEzRAzkD; arc=pass smtp.client-ip=94.100.132.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="lEzRAzkD"
ARC-Authentication-Results: i=1; mx-gate20-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=yYiuMB4tO54AzIeDH3kmJFpjruAX6cuTTrgN+LVCJSA=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765277619;
 b=CO7kL98VwaMRysXs6DMm/mtdABYWlrjlknHDUGnhNqrermD/S/ifOU466vccxlJUeBf9eCVW
 bxpjK8WxCa8egwF8gnHY2DPA4eE5LG01nI0+3ZL+f1K70GtZLqx2770qD/Rh24A91cvtuSF4f3O
 nplxldrlxYTOanYCbudLJl4fyXSSQxNWofj/AoHS9lQiU+tsbpsZIrHA9ZnTHkrT56ui85+uLmc
 bBvIlGU6h6KD5D8hUTdtGmtVngpcd4Pkeql9Y9OB2mnfMU5bWtY+iUM8CjWV4DrmHe2ivOcHd48
 vcbZUSReeNgbdmeDPhyDWt7YEqYdTZNPtaRjms5o/Hy4w==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765277619;
 b=nDA0kKqRZTe3tMyieUK95o3P9OM6BPEKwfjLQT4xSWqsQ6dS+goHH5KmhSy26vPBdexfbqgI
 ANsL9wg3y26bNFZfaMcBRMSPewY1k8hQnhDjAuSA/cRMykKcUO1VId5/H6WuUTHLlB7RcbsxCcd
 OW5vuokXHq4WCVfKlhTZO68UG8AWW/ofFhzSUyRANVD0gGbnlVe03TCkkiGbnd4rPZ9HFik0zL/
 OkaEFwbKyy8NfkJPgF4s0IcZblVsFjmkFcmTGLZbeods5+RKE4qZ1sfRsAyZF2Wtsk7dNNtCAqW
 cO6qYUu0sU2/mOkorlW7w99hrsl79Riq07ZaWVw1bi7bg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay20-hz1.antispameurope.com;
 Tue, 09 Dec 2025 11:53:39 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 0FEE7CC0E8B;
	Tue,  9 Dec 2025 11:53:30 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/8] arm64: dts: tqma8mpql-mba8mp-ras314: Add HDMI audio output support
Date: Tue,  9 Dec 2025 11:53:14 +0100
Message-ID: <20251209105318.977102-9-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209105318.977102-1-alexander.stein@ew.tq-group.com>
References: <20251209105318.977102-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay20-hz1.antispameurope.com with 4dQbLL55ZWz1FXT7
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:cf2a083042aff1afc5f4aa02c5603dcb
X-cloud-security:scantime:1.605
DKIM-Signature: a=rsa-sha256;
 bh=yYiuMB4tO54AzIeDH3kmJFpjruAX6cuTTrgN+LVCJSA=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765277619; v=1;
 b=lEzRAzkDHroWTenXAxD2yA8FP9BRppy8K6+Sl38iLbTmr4wMkWNFeolUmVy0wmLPcK1SO//+
 KZPY8AdwieotsypzZoHr9kJAapxKIq/iHH5OhvSg6hXAYaK4tz0nEte6v56hecQbF1w12PNDgEM
 rZbr9vHb27jl+jckwEjtItNE0ZXdeYzzoxJpbUXMobYKWxngbtSM8qqhI1Jta42MZUs6W/UlHAf
 uN1EHH6LMRc/pyc1LM8KNBEPv7Kt+Y3TVOyKiokRMx4CvVaOmQ1SV8ZW1ld23UP1UKiDnoEYqLZ
 fVFeLgAmV9gKfaDnO6cAXWIbWXAGzCUjNWjxqRsdhO+Xw==

Add the HDMI audio soundcard and enable necessary nodes.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts  | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
index 30f0e81c4be00..6e927ff1e967a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
@@ -159,6 +159,17 @@ sound {
 			"Headphone Jack", "HPL",
 			"Headphone Jack", "HPR";
 	};
+
+	sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		model = "audio-hdmi";
+		audio-cpu = <&aud2htx>;
+		hdmi-out;
+	};
+};
+
+&aud2htx {
+	status = "okay";
 };
 
 &ecspi3 {
@@ -335,6 +346,10 @@ &gpt3 {
 	status = "disabled";
 };
 
+&hdmi_pai {
+	status = "okay";
+};
+
 &hdmi_pvi {
 	status = "okay";
 };
-- 
2.43.0

