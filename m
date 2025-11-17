Received: from mx-relay157-hz1.antispameurope.com (mx-relay157-hz1.antispameurope.com [94.100.133.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045AE32E694
	for <imx@lists.linux.dev>; Mon, 17 Nov 2025 12:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.197
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763383087; cv=pass; b=li+BItRPLgklk4EbpBk2eDck1IxxGxq5y544fbJgHSXGJxp3WB7YQeKHcTTpETfjuISIu+qh3m+ezA+Cc+pjrYzNOSqX+cX8QyBSduyYJrw2snZwvWqgsj159gNDrhldxp726OAT7OHcXSTWhNuI4MLjmub97lHeyYs4wYAfjVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763383087; c=relaxed/simple;
	bh=hB0nbX6tYiAHle8PBHNp9gI53FQFd/DI687o3Fj9g4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D6rDJ2vvYMFEMaZLqqCzhXnLO06PPklXUWXPQ41PJH4lOArIwQ3pgCcviZq55Bm3XI8utYUs44zG/TUlEk8LWWwEBYoce3QmQkzmQcNwdPMr0TCdDPcN8dNfoJ/eUpmXNfffXeiJCycBX6uwdSG44w39gfkAcs94juPA7Dqls5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Hjb6tbEq; arc=pass smtp.client-ip=94.100.133.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Hjb6tbEq"
ARC-Authentication-Results: i=1; mx-gate157-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=yYiuMB4tO54AzIeDH3kmJFpjruAX6cuTTrgN+LVCJSA=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763383032;
 b=Wq3KtkkIF8BNe+6oGAg1m2HIJVHFEYkC7muqfgKtA+XxEorddYDoPiqlw9j1MyCIoCfoj1sh
 8hu+K6vPknNCZdA942DptjtCwrwEta+e0+0qCgYFmoWBxWilgd5F/TL0L67XNUQmaIK/ID46qiD
 m8UhOqhPTxy0v4+Mj7Oq8GXhVY7RcKLRUyVnbO3yG1+3qZ2g9GQ7uldakGu6Dmf0of8JSaK692e
 +XQ2kkAAAbF9IuCTRiCF36ad9Linv6jT3Jh7rCJ3c5e1z3KiUaytsVehwlgkDkrcZvrfwefEoXd
 0JTQTCrODpjrqv9wpqwCCsKdf6S6RL5gWeDTygPRAlRjg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763383032;
 b=VP7yfkZ69pd6RdCQDgguG5cfpkeupGA4eNTQEEaxgAktPmP9xmRxe8JW4No9T9QeaZ3fnRwd
 4KHTbp4Kd6CyCn7qBxn7PxS0mm/dDKHQEBNpXUQ5h9ek1l6WgkSlQZPxLMkRxv3J6otgeAT+u5I
 RdPxgJFz6+WZ0w8Tp7i+cK795CjPjd5FJPHPEohgtycNlXHQzNyXe8uMhxTRK/VPWmJ01aOguuA
 /29guWLQJpKNdOB0B6gQqlvv8CULcm7qZfIluDOFX5lgoZ+KPMzjovsktGcQRjLeTmCASEkI0FY
 R1EID2bCgX4rmEGnszKaGHC4m0uvTvBAhb5aPE3mtMWSA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay157-hz1.antispameurope.com;
 Mon, 17 Nov 2025 13:37:12 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 031D9CC0E95;
	Mon, 17 Nov 2025 13:37:00 +0100 (CET)
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
Subject: [PATCH 8/8] arm64: dts: tqma8mpql-mba8mp-ras314: Add HDMI audio output support
Date: Mon, 17 Nov 2025 13:36:35 +0100
Message-ID: <20251117123643.711968-9-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
References: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay157-hz1.antispameurope.com with 4d96gx555tz1nrwT
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:022db60f12a529ac8f262cc02b0b2722
X-cloud-security:scantime:2.246
DKIM-Signature: a=rsa-sha256;
 bh=yYiuMB4tO54AzIeDH3kmJFpjruAX6cuTTrgN+LVCJSA=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763383032; v=1;
 b=Hjb6tbEqtQoIrfIQPNbY7jffMBWurn6JbcuGBaGi6ZQ50SnEpacZfM6SCMORWZPaU/cLJgJf
 ioCmIUUwwuhe1jPzBX3SDjfD42MF1dKav7sDheWyKCTjdiSl/Md6MgS1Trt7SKJZ8q1KgGz/Cs5
 MSxcY5VuDTbDq37Q8rFWvjmcCt4dTkkWEGM4k5htaRjo2laeYIso/irb2EAVjDQ9a3MvKGltmeA
 c/r5txtEHrhCvWeIJ6+JNTErcszZhHsxjfKiWAT/PMRYrUl3oavO/6MWw2rCpAu3BDS7ngBj4+w
 aD3Yf9ir0gIYYV1IjycfxsZogmbO+ckiws8wzeuR5wjVw==

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

