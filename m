Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F03F19CC08
	for <imx@lists.linux.dev>; Thu, 10 Oct 2024 17:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728580323; cv=none; b=TIXwjLVw9K33xWRp2vvq6fR6uqroVIF74hrF+sTu4eYBPQMSw9aBvjpUjsmCLTDIhDdUyX0+z8D9WZIfibFT+RegbzjwmGeCXGs2giHacCzZfs7X9e+am+cGFR2AvIj+IQprkRKIRPeWpLLPy6530R+GZyooleh5t79Pl9HWGMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728580323; c=relaxed/simple;
	bh=+tZ0WZhlkSS0O5LQsA2Zhy12Oshwn7a9xwYnSW7Bi2s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kbTISLZF0qpzp/WCBuTPmABApO6zGah1mG2LAmcdBwRzoRFceVe9PIiVjwK3aItKO1nmuksuYyUv3xxG3FRgEkJxw3oRlQT7fiQW22xgtDWrWLEUBohZtBApToohDVTKLP+VM8SGIylRnJ9swxpaHGVcjzjPVJnmt94oJH5cHEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IoRvPEQj; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IoRvPEQj"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7e9ff6fb4c6so1447504a12.3
        for <imx@lists.linux.dev>; Thu, 10 Oct 2024 10:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728580321; x=1729185121; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ew6P9VD3bUbnWlUZQh0TrisKJPF+NxIhwQ05c71NA70=;
        b=IoRvPEQjF+kRGUCKKqkHHnObUdfPd0rJUzkS6ntFoRkjPq4s6vuijzNLNerSSWIpCm
         N+D2pliYiwj7LAFGckOCatnIfVkdKA7ODxCCU54rYNZ+rIZxGtEPSx3Jiy1LxsSgf6tu
         7iFIOQypAzE8gk5BcAGsmfv5HcO6Na5zRsK8sptXZIBzfatFNM0EflgPEk8XH8/03PPa
         JtAz92Y1UYo2eV3MIHa//UFcW3jMuO8SUH4jXi+OBLQmZMtrQA4E3Qd2/QEuaNmJJqMX
         DPpkWsid+96KV2i3mLyxsbuB03WmQ4dS+0LmbkQ7IIBJJvywMbUkGIZ1gJqdiH0MyAUw
         1xNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728580321; x=1729185121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ew6P9VD3bUbnWlUZQh0TrisKJPF+NxIhwQ05c71NA70=;
        b=mzil6K73ykucEJD3r3nqrPP7kEYZDjTPXzpD8hOpuyWm0vMTQNT4i6nLQ2Zz00u9Rd
         rKiGyfKQoDbaFYQc17k21Kxfsrydknxo8W4bOMqJvMvs0XbJHPoxEAEWyY3Pz2yjjYwT
         KwCSC1ZZmAAc7ybZHL8U8rQp54BlN1Jh+CUsqFeyvoh102AE6Fko7SD+848kDqMtf+KS
         3B+N5w60qQB7a0ir0u+y8q5B5Q5dl8CEY+WyvgIGA2/28rgfd6MFYHpLiCc5LyO/qxjz
         VkHuey4Er64S6+Ft+kEhFa/0Da9bcHEE1uL60B3l46lIhTIhqOxNi6V6CBmyppgucYRB
         fvYg==
X-Forwarded-Encrypted: i=1; AJvYcCWZNkTJzkcLKMF7Cq3/l0/KBfHLdbhwBISUE090ZRgJsrQC77yHDGNGb97Adosx0370wMY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2xb3xlcrnrgsHW9ZZ6FsyQyf8vv1/OzxXM2fDP1F2Ig5qcMRo
	TWsmtkKtDo/6PmH3NaaZDGw25uVCan2nlkiQX3TwezlmnGPH/m0y
X-Google-Smtp-Source: AGHT+IFoe4AiBwF4qqm0EwKF3j3qdjAMpwNSuyGy9YP4hjUcQPxBCEe2tbcL+cA0HqjjNPR64AfJ7A==
X-Received: by 2002:a05:6a20:c890:b0:1d6:d2c7:ac59 with SMTP id adf61e73a8af0-1d8a3c001c2mr13205513637.12.1728580321344;
        Thu, 10 Oct 2024 10:12:01 -0700 (PDT)
Received: from hiago-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e2ab0b5d3sm1251245b3a.198.2024.10.10.10.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 10:12:00 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH v2 1/3] ARM: dts: imx6qdl-apalis: Update audio card name
Date: Thu, 10 Oct 2024 14:11:26 -0300
Message-Id: <20241010171128.107819-2-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241010171128.107819-1-hiagofranco@gmail.com>
References: <20241010171128.107819-1-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

Update the audio card name for Apalis iMX6 to match its specific SoM
name, making it less than 15 characters to fix the following warning

fsl-asoc-card sound: ASoC: driver name too long 'imx6q-apalis-sgtl5000'
-> 'imx6q-apalis-sg'

making it compliant with the ALSA configuration specification [1].

While this is a breaking change for userspace tooling, it seems
time to implement it since no ALSA UCM or related configuration files
currently exist and we are in the the process of creating them.

[1] Documentation/sound/alsa-configuration.rst

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
index edf55760a5c1..1c72da417011 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
@@ -191,7 +191,7 @@ sound {
 			"MIC_IN", "Mic Jack",
 			"Mic Jack", "Mic Bias",
 			"Headphone Jack", "HP_OUT";
-		model = "imx6q-apalis-sgtl5000";
+		model = "apalis-imx6";
 		mux-ext-port = <4>;
 		mux-int-port = <1>;
 		ssi-controller = <&ssi1>;
-- 
2.39.5

