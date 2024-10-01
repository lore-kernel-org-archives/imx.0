Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D0F188A01
	for <imx@lists.linux.dev>; Tue,  1 Oct 2024 12:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727786742; cv=none; b=UfTVgMBTaQNi1mmpYjx9KDBWAmkPF51IiWN6rsHnhu2nWsB7N/bPRp86OKdn3Ciz/iNENsNGk/40RBetb6t/K/IrwEBT06tMmbbhFAJMDpI02lrjHA99kiLOp5yXjYxo/dbA2GYsjHkIS3kuW6L+jL7OS/TiCVplsK45rgcRuoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727786742; c=relaxed/simple;
	bh=vnIjzu3vAzCdCo844dtM4r6u/3MWehbPx+m6h+TFQ+s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ls3vyi2YGLqtFVjP23z4UtFbL8cwbTu3muKPokS0Smoj+3m4eq2xoY4xz/OolJE9m6Jezntj2vmQtLddQelugb/FGvOf4nPoZVoj/5KHaofwYlBFmCwoDT3JciAX4w/wSScOUmB9sLopXYUOOAe+B4Cv5Q94jLKC+bdB1BY7Qzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZVO2Ls6; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZVO2Ls6"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2e07b031da3so4081138a91.3
        for <imx@lists.linux.dev>; Tue, 01 Oct 2024 05:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727786740; x=1728391540; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8wlAFhzxdTYEQzjtgnSwbzACavm6jOlYsQFniq7mmU=;
        b=TZVO2Ls6szdJo5ONF3xgeVfN4qya91HvqQgN0CtWzVRGVoWqXXqZ8+Ju3Qmtv2BP71
         sNTD+k/DqRt0fPqUK2D1Fhe70eeYpJbDwek7uzCiw+GI6usWRthjGWmv2P1DpC05y/6u
         uv8M6V8xVzzb6aQNcVSVZlV7CVDe5bVnxlvBnSilUKr6cW4thWMAyYzpXxAEavGs/U5y
         QPtpkM7QwANX1h6EvCYPUOQyAZFIM9cXtcl28dAakq5+VqX2/vcrmEtRNbSyo2G8HlgU
         dwjOdINByEU5Ck+cCyoM79PaZolufL6Qmvmhfq0f7b+aDJV7lJuAH88QrUFK8H3vRwZv
         VfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727786740; x=1728391540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o8wlAFhzxdTYEQzjtgnSwbzACavm6jOlYsQFniq7mmU=;
        b=mfkmPkT9HBi0OM8fvbFCdjZMTsIhARO93HbEAZUL59AMvFkt32Ovvv6Q+MVOR/YDK9
         z6EJqdHfd/hzso1lh5fg229BLndw0vO/Xbq0AEMfb9Ti7K5PPm2FrbpK4dN/7kdxoUp8
         r3a9A9QblcldNJFkKLK1XH4tMiaRVaBKeWpArLDxVbCfIdbllY4EwEj5FmcHDGUK8eFt
         khUHQX7eT9CL1AQIf5vYFbNXwFmTgkzeK/+PAeBRNynt1r8q0xWMpP8P4SMw6oYki1OW
         16KFsfyY5zYf9D+4lleG8cWbfZ6rUWpfGKlvqcTLtmynNmYhAM/BecAKWlw4iiQDgKlW
         n4Zw==
X-Forwarded-Encrypted: i=1; AJvYcCUUay4TH1S4KiVLeWvIJUpXhqgOE2yUyKyHELkzx4yHCa3JVWpvS2MVnOgixyfqa5gtcD0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2Bki5gyYm/OMBEjTGSONV2+p6Ae1/W9SgMW+Wl2cc2IIYDa4R
	HZIfp/MPfSYNYzyhkMweelhFINuSfKol0usNb6hKZdZLIMi/au9y
X-Google-Smtp-Source: AGHT+IGq5rqNyL03YVDgSvUuIMn2ZcUhfKCHvcVRRWmSSPeVDHl44rYiJKc7riRgJVSVOLTwjCvt5w==
X-Received: by 2002:a17:90a:66c8:b0:2e0:a0ab:7fd0 with SMTP id 98e67ed59e1d1-2e0b89eb8f5mr15842411a91.16.1727786740274;
        Tue, 01 Oct 2024 05:45:40 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1704bdsm13629171a91.5.2024.10.01.05.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 05:45:39 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: =?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] arm64: dts: imx8mp-verdin: Update tla2024 adc compatible
Date: Tue,  1 Oct 2024 09:45:03 -0300
Message-Id: <20241001124505.73857-2-jpaulo.silvagoncalves@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241001124505.73857-1-jpaulo.silvagoncalves@gmail.com>
References: <20241001124505.73857-1-jpaulo.silvagoncalves@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: João Paulo Gonçalves <joao.goncalves@toradex.com>

With commit f1c9ce0ced2d ("iio: adc: ti-ads1015: Add TLA2024 support") a
new compatible was introduced for TLA2024 ADC. Update the device tree to
use the correct compatible for the Verdin-iMX8MP hardware.

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index a19ad5ee7f79..db46763d3751 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -592,7 +592,7 @@ hwmon_temp_module: sensor@48 {
 	};

 	adc@49 {
-		compatible = "ti,ads1015";
+		compatible = "ti,tla2024";
 		reg = <0x49>;
 		#address-cells = <1>;
 		#size-cells = <0>;
--
2.34.1
