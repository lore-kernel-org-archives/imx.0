Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A1947CC8A
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 12:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488015; cv=none; b=BJeQYNdLCuUWcDIbUCGOSd1945BHyRmbeqeoJgJia91zr4jFrmoZpkn0J9DKhWrtUaO7cQI/utl89iReVXgIesvSAZ2tP5xEuhGyRygAh1Ns9o5ggvXf6rMSl//u4cDSFjg53p14COaA2V4tKvcau8Qp+vPyFLceEp7pv13odeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488015; c=relaxed/simple;
	bh=Ex52IU8CCRR0vjuhVjGGFQn3zY3V8dmQNs1+Pd4lmvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qsKktivk5OD/gOcFXw96FRPR06MvCUaprmN+7WU/mi5k5YGuMo6G7S0wIO5Mhx3mbs4xGOLSUZVfdnRJUQO+FQf5vH6sKjSXbHBCaL0kzJ5oSp5a6SQjAau91E0KPcR0gIflfNVhWXEbhSEhiacxfrp42rXdXXqrBP6UanItN1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gww7Itbj; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gww7Itbj"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-460166910e6so1712086f8f.2
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 05:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488012; x=1781092812; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRj4oVY66h5BGZjSvCJPxniyCWvCDKuiAB40WEEr1xc=;
        b=gww7ItbjVOSHcM4TI6rzrVXq7gaKAvyhGC2VVUM05rvOXVsFCc3GnOq0Yn0d3/ol1X
         1ZkASoGJVmOKs++o+CyXkoAGTRtJX5QfMAVpgD4ftKOgM9LcQ3Nnx5icNHWsTVkLG3KW
         bmZH+NRWsI9rWek6b/RkVdoK10YanhCA++AE+xldlUaQrjA2moZ3YynsEOqN4d+x0FNK
         oTaxEF0AP92oWDzlhP4bpjkyfnpWBajwPraRrsCUltLsISunOajPz9xWm4eYbHPQU1GJ
         W9EXSFYsGJKX9/+/BMBCLtucMzw53obS5QTO/MBZE4eza3fT8XRQ1+30WTsM/nrKkboK
         ZaUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488012; x=1781092812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SRj4oVY66h5BGZjSvCJPxniyCWvCDKuiAB40WEEr1xc=;
        b=rPcRQTCXqS0Mko5iGUQ+Laj3x+jeRgnEqHTlcvJ84cMRgC6ZoA6k8sBYDCwpRTyuNU
         NdH5RHOt9/iRJmM9oa2xMSxufyOYq4IGyiRp9yY6AIeBIecFfkeimqbJ1YfMkgYKgYPk
         Ui4IRMsEV/kBMj7XqJSM4ntHkfIk6dHX5xz+/qiPByA42Z+t2LhEn6xvRvMgh+03W9nT
         reiwvB3+QglpO5w830+gLfL3/yrBkO4QdgHamIf+E6o4pt8Tq8zy7rdNxq7pigzMkRK1
         UDR7wJ/b4ohFMuZfYJQs+VJNl+eldn21YMbvDv+BSJqA0mStErWG8l2JPNW58A6UQrUV
         /hkQ==
X-Forwarded-Encrypted: i=1; AFNElJ9HCRHu7Meg5LK18aEwzMrMc6y2g2F7qOD0ThzP+wS7RLDCvXxTXMBkJLZI9qnSNwgMpQk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzjkNLm5G1uh+pL2MhgOHZyzKWtrvtpu1vOG3h7inCWeNiAs/gH
	bQhYRfMKqypQ/KfJ8GmPcoBgIrgMRp4p5lgh3HjFF9nlm6u9JEMxF5+C
X-Gm-Gg: Acq92OFhNqgLpD+lbzyYe0d5ByseFBsaUksM8uqAxk1H4eypYbm5mDarJpMpIPT3bF7
	Lfpcs3WVd7bvXkMojd664DkGgufLVfU4AgirtsoyPSBj7QhPUEul33Hszd139mTOb+5LrQLhWXR
	ZTaU2Nv6vVxTWH/mcngFS0aKKqPlIUjzzvFUKEm51ENZJ+yHjV9IiQSj/x0gVVbNIwF67TeZvU9
	tA/WjyEr4ogG3ihR2rYTiK8hVpUHN3k6GSYGSuubVP938Rar578y2ZkMO+jNVjGNt1IL5+k3PIn
	/Uodsgtw9NtY04ImnLVSfzjnPZX8uJiCtwgUw5a1p6h4Oq3Ca9yIkzshIGMTuAW8L7YQFPXkxSL
	OWl8ARLWzlLoW3FH2zRdtEm+jclQk5jwVC9UD+XS3r/orXEw6n6JX9tJoxY0qszhCgmraXV9Hc8
	gCrzfAXGcl2ogoD6t+UlArL7DLWEVCuHREvYxJfJRebtYGDZGcCIWAz/JtLRArR+qog/QQnQRtC
	crIV+kPLMfkrlZqNLznQxwGJRLDRhsu1GnLB3Bf8an2ASzY
X-Received: by 2002:a5d:42d1:0:b0:45d:b14b:2409 with SMTP id ffacd0b85a97d-46021783ce1mr3641063f8f.2.1780488011988;
        Wed, 03 Jun 2026 05:00:11 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:11 -0700 (PDT)
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
Subject: [PATCH v1 11/12] arm64: dts: imx8mp-var-som-symphony: enable PWM1
Date: Wed,  3 Jun 2026 13:55:49 +0200
Message-ID: <f5c19fe05ced09f638953cba857c3694f494a72a.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
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
 .../boot/dts/freescale/imx8mp-var-som-symphony.dts   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index d796c32f50cc..06baa19d79c8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -241,6 +241,12 @@ &pcie_phy {
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
@@ -385,6 +391,12 @@ MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05				0x10
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

