Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AE138DD7
	for <imx@lists.linux.dev>; Sun, 14 Jul 2024 17:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720977627; cv=none; b=UTHW5nMtnFpD+tbnCTUktJfEa2oRR0/1ePIutYJKgaTfwVw9IUxh/qbcVRbePLslKJFScjGIp0o2vCfrfcgWddsG03L45s5m7YTvG/Mwe2nPkSc/lH/LgQocBeXULcf3MXel/jBa3WEQoWEchBH2Zo33kNGFp9nl2KD24tTqQ3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720977627; c=relaxed/simple;
	bh=A5Bcqn8FRqYalb1UZD9jh+58Ex3sAWvAdNFs//hWPBo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AuNV4mqFQcV5zggO2DdEvcb0oPLJdufHyV+/lZL+1RQPomI63Udw3Y91gNhKO0cFfpuKOJN8jYlRnp82jztWl7YnWjUh6ci0MVChv46bZhSqjv5GQoKyWoqF0ep3vzMTr2bGF9zxTeNhJE5m9mKrGKprn1JRf+lEH76qmWx5gVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mD9SVTC+; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mD9SVTC+"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3856b7be480so13006065ab.0
        for <imx@lists.linux.dev>; Sun, 14 Jul 2024 10:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720977624; x=1721582424; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OlQJVnEnvYtG6Urx8xlXkjHKNYwq7RXhH4sQHIkE5Zk=;
        b=mD9SVTC+SAGFFHVI6tRA3npngkGbbe1/Efa6gKwWBKbtx4PiFvZcMamRmS0K1nFfVr
         Z30SpopGFJUcjQm/GIZ38+utzRRRzoBO7vKHhHgylx/ZZD3IBrQwdxdChz7JbJ1vYrfV
         dbbIZQr80V4gfknfiPomY3kApDg0AEbL7K7Xq31eHYJKsqsvJ/3XYBBlFnSVbsTIBusD
         wkT8FHUoe88958fDmlzmWEZNuonOOXORH/Ah/sv3o9SUQ+xOdksIs7WUu2F0194owV/M
         0bwuXmunCcTP1w1LMw9yq1aOJB3q9Ek5Gh6w4y+tenRFAbAKeRXoxc2aYFux/q6wym+E
         bxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720977624; x=1721582424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OlQJVnEnvYtG6Urx8xlXkjHKNYwq7RXhH4sQHIkE5Zk=;
        b=sD/saetIpexiJm/xVCj0S3+1TwFOq3Sh1nVH/WnTosHe7tgAGMGQ71uycI1c/aq4yV
         nA1AevP+DBkih3nNCoiXb+YYvn+ZD5o1er3t4sSsgvwAncdlgDI7czz7EeG2a2JXeldw
         kxTRYXKX2E7FrdP9udXxslt8kkQJFbpqUZC+HV0q+WxxiGNbYHklLUprq5kWhPZKcxCA
         ro4fT7aHsiJRPMqS3VHWGdF5cEspeSUmCwo0Moljs4SRoE9KgzWP5e7FLH7Wl6pdUi1P
         XnbKM+VjypmsG2mrftgR7sYQd6WJ1GvS3a159SZfJP+UwdklPnWroH/+m/0Rr2zFcQ7h
         KzFw==
X-Forwarded-Encrypted: i=1; AJvYcCVzUfMKM4Xa5GvLVDfyh+ITewImXHuQZEzJCVRHMXuj8CJVrk2f6R4Qqsqp60o8OlOGjuxIQbDgooFwRsZZF5DtFhRH
X-Gm-Message-State: AOJu0YzM+XrxuUlSR2dC8l0KuhZgPGf0SevuRRfXUGz7t3tdUmECwPi0
	UK8715ReqSbnp3mH2pjly1TUW1UYGGh4RXSaP+zx/JOzFgjUTqQL
X-Google-Smtp-Source: AGHT+IF6DTVl/wDe0J/V/t+5rtM8BQuGZZ8qgIqSyMgnG7/Y0BdktL+/90gcxU5w1DRx/MZmfcmztg==
X-Received: by 2002:a92:c546:0:b0:375:a7ee:dff9 with SMTP id e9e14a558f8ab-38a585825f7mr226453335ab.17.1720977623667;
        Sun, 14 Jul 2024 10:20:23 -0700 (PDT)
Received: from aford-System-Version.lan ([2601:447:d002:5be:5d97:4e3d:78d3:be9d])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3900f5280b1sm11357625ab.32.2024.07.14.10.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 10:20:23 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx8mp-beacon-kit: Fix Stereo Audio on WM8962
Date: Sun, 14 Jul 2024 12:20:17 -0500
Message-ID: <20240714172017.422811-1-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The L/R clock needs to be controlled by the SAI3 instead of the
CODEC to properly achieve stereo sound. Doing this allows removes
the need for unnecessary clock manipulation to try to get the
CODEC's clock in sync with the SAI3 clock, since the CODEC can cope
with a wide variety of clock inputs.

Fixes: 161af16c18f3 ("arm64: dts: imx8mp-beacon-kit: Fix audio_pll2 clock")
Fixes: 69e2f37a6ddc ("arm64: dts: imx8mp-beacon-kit: Enable WM8962 Audio CODEC")
Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
index 1871c10f5c12..de5b64fa479a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
@@ -222,13 +222,12 @@ sound-wm8962 {
 
 		simple-audio-card,cpu {
 			sound-dai = <&sai3>;
+			frame-master;
+			bitclock-master;
 		};
 
 		simple-audio-card,codec {
 			sound-dai = <&wm8962>;
-			clocks = <&clk IMX8MP_CLK_IPP_DO_CLKO1>;
-			frame-master;
-			bitclock-master;
 		};
 	};
 };
@@ -544,10 +543,9 @@ &pcie_phy {
 &sai3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_sai3>;
-	assigned-clocks = <&clk IMX8MP_CLK_SAI3>,
-			  <&clk IMX8MP_AUDIO_PLL2> ;
-	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL2_OUT>;
-	assigned-clock-rates = <12288000>, <361267200>;
+	assigned-clocks = <&clk IMX8MP_CLK_SAI3>;
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <12288000>;
 	fsl,sai-mclk-direction-output;
 	status = "okay";
 };
-- 
2.43.0

