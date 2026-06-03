Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E36748BD47
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 14:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497462; cv=none; b=gyJDEUWZldqN/P3ROldHyA1vjaMCSXu0zrEOI7S14XH13EXQIzDw4XRQw3BOuqeZkhyZWHZLlrO64QA/DSw026f9lCQov7OvXDUIFix9iVB2YDgEsHUHU33cXiGZTMJSqJASoMOkVzBZlndbGE98SE8zNdoVd+K3nyWiZ3fUnhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497462; c=relaxed/simple;
	bh=40kREAfC/QNvMf2+8nmzJQuLMvLg9WZ3h0FgrQyV1kI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hGs/Yp9Eb8r9skiWh0dI6htEBxDx1EWiYFw2IPNj4fVq4ZL70/OPIDbP7J411Jpwf6f/LCu3N27x75oTFhYYvLuKx/HOgPX1UFWmNv/WwUdEVSxwZqP5JWl49K6f3cAG6/UI16TmFfD5zzuBHEuz7XZC7oT17s/1GAUbildeID8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r99i975g; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r99i975g"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490ac357c55so35469315e9.1
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 07:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497459; x=1781102259; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lK0+ywjBOh+XN+VJoI8pFkPksQ/EGbIta4VIkH+QnrU=;
        b=r99i975g9fIMaT/MjRXvlFki821MV8fHE87vmCdYZmmu0oAyk+CGDr6I3uF5oojjy/
         2RVbWO30PJVSJz2sgxiEnrxSWacYxRSehtpQYhZDTtafx+lz67h6r2SI+VN1UoZzl4xV
         m2H7Q2a1FRd7NeE51+BAtwI38nxkab3xDMEHjI0s/n0i4gjB9WzXJsnCflM7wZTZsKdb
         znTTy74Ci1oLlNySRAuo27D7X3xsGRddBzOyFyQHfIpn3DjhbxEmUkGqO48rvYPjaMBv
         C4p0xUJ5KQgQhst9/Tv1uPmN5uJhvRrvWwn70gSCsUFCFZrS8xipXPvPNFe88IKtwTgu
         Tk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497459; x=1781102259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lK0+ywjBOh+XN+VJoI8pFkPksQ/EGbIta4VIkH+QnrU=;
        b=BNQyBR6D//GBr0fvuPxLLm3iv/RAsLFtnQ/CAllEzP6IQY5CBHB8fTI1N/oeNbyNyb
         kEsEZKu/WJGSad/SC8/uO9rl+SQY8QGGRot+yyIDlEgdCTN49hvGuGTqyjq0JzxVrXx1
         8bSccIIG2prGLHqRDKZhiKRBXR+er+EkzOINUAiLmgwssJcKvnvIb6ljS+MiYHQBnNBV
         xg/fDjNFY1l4G7G0X3yIAGliRYL+MHLNr/WBng5CNNyQKTGl/9XwtoyNcKYqJWqfjC5B
         nrJYTTLwfDnwxU19k/r5IlT8zrwQmDxzId5qvbeHJ/lYnHWzVIiyOHERn/x5lTKKKlqc
         8Eeg==
X-Forwarded-Encrypted: i=1; AFNElJ+KZk1IIkWbyBNb/QppobUB6a+lp/Q0IEugm8JptSZ9AQ7QVx1E+jsrTrmthQNnX7MwAng=@lists.linux.dev
X-Gm-Message-State: AOJu0YzAJqrUOkDQZnVdYy4QYd0ty8TOYAX2BD3SKb/QeCtWljiHZG22
	TmSN4aUDu96dQwICSNO7OWh1nAofQC+yWCuKf6DEbTKqnrZ9ys989RoA
X-Gm-Gg: Acq92OGzqezbjuKRplj6xIueEGuw2dFSADjoczigOxN+XXBtaxII3aOD94Hb7E8LWRp
	ZudiwBBtQYEqSJK2bXXYvsIXq6e8awGtego9jl/3tp7wqCpJ/lMbEoz39G+gQZsEkC4EY4yUj7b
	AMAy1EAwaYPFyNl5BGzdMPN1TpZ4PktiE16waK2Qo7g36m0Q0vzOSLLgqg0WLjyWgPo6fkqIFNv
	dwIN+NlHDQ9McQAxUdwnkdyiKxDqa6N8rItmCrDJmwM4CI+/KqOtXytEfcpW4OTw5ZEEsI/qRLt
	6kAzhlMExTLmDBMEiU4yaeCNT7n7oVsPatTYoaQvESg4IyGZZiHpFxq5xHJgo/+sHwzO7jCrS3x
	ImM0PvAOV0f0FCJNKbY8Xukvk/Rs06WrKFrPGQW/VMlh8aUedd0wRQ49qBE8PM74AGgTQnWBwpI
	D47cE62Km35MnqyUEmapHCg7bSSWDSiP4nB8tqYWUshm/GCi1yvdu2nDER5IMkCW89a7ZioCek+
	fXIyUx9fBKsMnmSEi5Fl8Du0f3m5+BNCi+J1P3yZ6fQ2SC/
X-Received: by 2002:a05:600d:2:b0:490:b99c:9337 with SMTP id 5b1f17b1804b1-490b99c943emr39485645e9.10.1780497458788;
        Wed, 03 Jun 2026 07:37:38 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:38 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 11/14] arm64: dts: imx8mp-var-som-symphony: enable PWM1
Date: Wed,  3 Jun 2026 16:37:18 +0200
Message-ID: <04c8d4b2d184c210d24a0ae40e0eef7d47101c63.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780497188.git.stefano.r@variscite.com>
References: <cover.1780497188.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable PWM1 on the Symphony carrier board and add the corresponding
pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../boot/dts/freescale/imx8mp-var-som-symphony.dts   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 06d8dd7a5b54..28424c2405cf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -247,6 +247,12 @@ &pcie_phy {
 	status = "okay";
 };
 
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm1>;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -399,6 +405,12 @@ MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05				0x10
 		>;
 	};
 
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_EXT_CLK__PWM1_OUT				0x116
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX				0x40
-- 
2.47.3

