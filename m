Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E831F172BCE
	for <imx@lists.linux.dev>; Mon,  9 Sep 2024 11:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725882584; cv=none; b=BazgG9Yy/8SrrArp8FnKv/CnVfXuI3WZitF5QfnDttcNeTQ4VfuYEuiixrjvgEAVP/DZNxeHx2HnQ/ooFUECQ6FUxGKnFykj2WyygRmA3gKK9rAYWiLDZ+wamyO/RriYOUaftRI7rdn7KXUEB7UzdZACsn8rKNhlUdD4/WpTFsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725882584; c=relaxed/simple;
	bh=UjUQdhF28S5e2gkfA9iAi3YHEU8wzz5waE49UWZUlkk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I6HGg00WuY9vDXOJohvCVnfR26jqaZYfJ4PPQ80Ac/2VFn1IKohwY84IupiyqTn3yS04s0Tz8dKt9aIAEtjCkE4od3bUw4x7apsL828o71gtfDQlE9SN3/Yh0PckawkB5qRR4iwhQICuQt8OCFc7ngkQTJKhOjYWvWJBHmWBpko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UlVIbYi9; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UlVIbYi9"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a8d2b4a5bf1so211785266b.2
        for <imx@lists.linux.dev>; Mon, 09 Sep 2024 04:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725882581; x=1726487381; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5Q59M5UcS9lYEyHTKOxDWIK9dPVLxcWx8Bc90Z64lw=;
        b=UlVIbYi9CpXwoAsXVbO9Jnl9rEU/BzazqVcU1TslcOTa8vSobCefkKnSKwDF4hZe5e
         IABUf6XzT5aTzCwLnaGXBSUreMrMK2e8MI4A6lc1lpdwKYOB1r/45/h9MRq8NkK2MZTP
         zaUgKjgySkF2VHYVNX4aTeQGFm6xzQqRCo/ImOhle7cvf9DjVXRQulZbFK3/Zn+Zkdnm
         4eE4I5eHOVeHC5VD4X6+2dR6JIyjnk96535BN0W2DxQDt6+jAM/fYPDBhpcMhRMhdJRY
         wHtVviktIwmbkwJRaVFI+uWtrRBUlvBI6FwZWacKHErMFMIdpjWTlqC8JUjNhQxeRZwG
         Hfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725882581; x=1726487381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y5Q59M5UcS9lYEyHTKOxDWIK9dPVLxcWx8Bc90Z64lw=;
        b=hCSjH6Yl7pm2ufF2J5h8JLW1gjfCB78SWKSuZoFjgxTBj/tbWlho2IxeFaRb1UFqZh
         WSEzwtPxLgLS+i1ryV8yKn6v2YamTELEgfJCY99IIqeeUJh31EdRN/BWxWEKVIa3TWh6
         rNUWmW+745kk/iW1UXdUonr3saNAXhWsARIZ7XOp+638u0+fgw+iEblJufnm4+BYSpdC
         jrvZnHLZpJbc7Nwo/Frhsf2StD1yP6+2qzK/hU81wJt3VS4J+2Bt6nCP0uM8DpRXLe/O
         9CmhEiZC/0hB6aRslL7j47q/O8pNC1lcweyAcH6+twOrb+6jhPpW7Zy/MzIVuQZelpM9
         ttHA==
X-Forwarded-Encrypted: i=1; AJvYcCXdbv+7KAvrIzD844/6kn81hc/fzVytqv4xU4rK+1HIX5XZQAntEdmMmczutCGi2GKeV8E=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7Yea+6jFvb5AqfIZ9n5E0mleBdKFXL5w18nFq1640pgPcXwoz
	HNDDoUFc2nHRznzaXzr9L+iOVGju+kEocLLmAL8vxjWRRO9mFKJ2
X-Google-Smtp-Source: AGHT+IGnn12OpKnei0SyDRHdvhXGAiS4aMiBJVCWCDSQABP9+v/izyXiR5wcq+A4VAgRd0gbzZIy4Q==
X-Received: by 2002:a17:907:2daa:b0:a8d:48c1:2c5b with SMTP id a640c23a62f3a-a8d48c12e94mr369797566b.59.1725882580234;
        Mon, 09 Sep 2024 04:49:40 -0700 (PDT)
Received: from hiago-nb.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25835697sm333258566b.16.2024.09.09.04.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 04:49:39 -0700 (PDT)
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
Subject: [PATCH 1/3] ARM: dts: imx6qdl-apalis: Update audio card name
Date: Mon,  9 Sep 2024 13:49:00 +0200
Message-Id: <20240909114902.82380-2-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240909114902.82380-1-hiagofranco@gmail.com>
References: <20240909114902.82380-1-hiagofranco@gmail.com>
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

fsl-asoc-card sound: ASoC: driver name too long
'imx6q-apalis-sgtl5000' -> 'imx6q-apalis-sg'

making it compliant with the ALSA configuration specification [1].

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
2.39.2

