Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378156;
	b=v/iOvFjJ6PKfEwNTeGsOiIfOn+iWHiZVVXGooro+2b/6JqZxpYXfOhQcITgDBIPVyQ11
	 gce5Tyyw5MXBM/RJUQTMgjr3ubIfHwp2lwsyygXE75mACvS1PqSyiuAPCn/NBcco7HHXW
	 zHfDMB+eB89lLJXnnZh4BOJKlEYi+fo1dMozzHG9ss6yHfACnI9SWy89dwmgx5hRMOvMp
	 QljRNGSwX4N7eODTIer4s3kJT6F49NZTOiQqOJIO/aVlNKtaY4w70eTpnOgdu8Y9hd6dW
	 cBsRKK/J+fvtthclpgkxoItYjM4g5K8N6JbV1fgmnRfcoy+VNgUyPbOwB05mRYDdQzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pOuTQAzIAgHcyD+89OKp4L/Cpx4sAMbE9RsI11vwmkw=;
	b=M99DhstHDsh2MuV0QyW0usoQECx7q8vFq4fVP5uU3ltCybsRIpBIaakRnD5GM/JsvNPV
	 lLbiOfYigD3gaz+e8OQN57147CCmgJIopLT91ljbr1LLpxBWy0Xzp0NSv2xyOzDzW1Yk+
	 dMwYekxcNFOYCxH380CHBVWqYrPVhTcRZ9UD9PCT9uQ49JYWZ0sdqw7n5htQIUoSzyL+o
	 LgKz4snIM4CgsP1qsxaN+CQuBXBhmkjCfhTxtfF4Lhd5Et0P1ocfNtyoByuG0dk47SyL6
	 75l0etl+NP27lxO2n0V8p4LCB9C2vYB63R5JA1xbjtX12adgxfwHSvaHxl1Tn5RGEMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=luKMM8ia;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99409606A32F
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 16:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99409606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=luKMM8ia
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so6188015e9.3
        for <imx@lists.linux.dev>; Fri, 30 Oct 2026 09:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793378154; x=1793982954; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pOuTQAzIAgHcyD+89OKp4L/Cpx4sAMbE9RsI11vwmkw=;
        b=luKMM8ianKiD7JChVHODfZh5crkwTkAWTTvStBryQOYwg3eeKy5Kil2EUXzvJLrx5D
         6OHLmcPgpkucQIGEa07BfstvlnObfxIl7649TYv7X0LPnGqh2f0f1aDrK2777ewBrQqg
         Va71DMqfnNTbFkK6A889WtsaGlv2zejVhv22k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378154; x=1793982954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pOuTQAzIAgHcyD+89OKp4L/Cpx4sAMbE9RsI11vwmkw=;
        b=mqbohqNwbQNUiIiypMqhpWZDV2v4TR35d2Dq4EA0ga6PSwBgRLhN5LcY0S4jR/Phe/
         z54wIV/tG96i/u6uPUWe6U24heZOZuUg9EU1FiTe5GyzfeiqRWmC4cJtvW7PIxc3VLf+
         UGO3rlZnZI8otSWZ2qufLa1c25JGWXW8lpAir8sxuWY5NSBvAjtUrKSzMfTIvfIpM5R8
         SCflhnelb7tPvztj3awhTXxYzFB8sWq92jnap1rYLP0taSfMRFKq02JMs8pZsuQwI1so
         44xR7AJkCmK2jQ8JsdypoccAsh1A6YnLJvOfXH7JX5yQcKj2Rh0QDd2gcsm6DEUFGMj9
         UNlw==
X-Forwarded-Encrypted: i=1; AKwUvBwUIvRcyq2EWF8d3+FdjD/S2Qy0Gb4AjpGLQtaPOZWJIOofWE7yxrn7JbMmImoCviLCfaM=@lists.linux.dev
X-Gm-Message-State: AFq9FYK2Mu4ZLEJm+ZYkerM8KIaVu3hM2Lw5257kAlWDzP4x8z0koRkv
	JfTLUqWEGlz3gm+54Cd+0DiGpxtC7dhCU/ZPhxbSjawJOQU039rfgFK/GRp1En94Z2U=
X-Gm-Gg: AYBFou1DE473gts1dQxneZ/RpPaYJMmEiZmNwwwWrW/jx8zFFjkj+lF5wF4+NPLcv2j
	9fuWHFQDVjgU0WjBjextdQVQS4FtRKhvJVVScySQIZlNtQOds4KbhO0d09AEMXS0tcxg6xxByk2
	+6oH85kGSDw9mbt/4EqF12+uPQQdfZxTWYjjWiwaVEuAC1rzkaEJboewoNSbUtoFlLwKZoy6NhG
	TTwBij8T0vyQ2trEx5Dq4CE7nFDj15nbcoIugxTxbEhLAg1jb40dNmSoawXAkCjLFYaGzAd4x67
	OEFjigcKDfkRhvBrMhPdgUJrK9sfyAsuD68S2fmW/nqlIHXFdq6PG0nYe1o/gECrMvbZ3sn7peN
	02jwFDk+XZKFZ3WUs9S1d7P0PR61VIvr6QSP+1pmjV/gr28h010oMWv4x8MH7bBAFv9+ayIQFlW
	uATvgzah2qI3odHY53R7gQSQHzVAU/5wciNB0b/ut6sdgX0YvxSOltj5YERuZEn2PMWh2NokUCS
	dHj3VFCCEVdfXyvjiLeF0u2YUwxU3YDA4ogEcec4ZKPYw7mYUkfmzwgi5ldO7ZLTOaU7QVcffw7
	1WU7ATI+kR7UwMpzJ971KpbRtzqZsxoZZgkgW5+Bvqod/J+7G30WEXm00xarwPSemu0249jPlUc
	Lj4s6kinqIgk6qDuGb9UsGIO2zuhYI0E+OXBuDy973F0nsYTuOWpNNxkyTlQlgh77BTYGV64gvu
	X9vleVPKdNoXmcT3yo1ne2sfKCUw==
X-Received: by 2002:a05:600c:83c3:b0:4a9:18f4:925e with SMTP id 5b1f17b1804b1-4ac174711afmr61029555e9.18.1793378154030;
        Fri, 30 Oct 2026 09:35:54 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723fcsm4084806f8f.14.2026.10.30.09.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:35:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/5] arm64: dts: imx8mp-icore-mx8mp: enable the watchdog
Date: Fri, 30 Oct 2026 17:35:40 +0100
Message-ID: <20261030163547.2682583-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
References: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the watchdog, asserting WDOG_B on timeout. On the SoM the signal
is connected to the PMIC, which resets the whole board.

Tested on the i.Core MX8M Plus Fast Ethernet variant.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../boot/dts/freescale/imx8mp-icore-mx8mp.dtsi      | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi
index affcc20b20c7..33066247cd2c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi
@@ -122,6 +122,13 @@ &usdhc3 {
 	status = "okay";
 };
 
+&wdog1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdog>;
+	fsl,ext-reset-output;
+	status = "okay";
+};
+
 &iomuxc {
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
@@ -183,4 +190,10 @@ MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d6
 			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x196
 		>;
 	};
+
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B	0xc6
+		>;
+	};
 };
-- 
2.43.0

