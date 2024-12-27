Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED991F9EAB
	for <imx@lists.linux.dev>; Fri, 27 Dec 2024 16:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735318670; cv=none; b=e+hQdr3oIBHrcCGGyj7Z3TjCev/YZWuJZlJgz0UUO9qyl7hr7/+z9GzDIneAI0NWdZKXm4JyX5RCbZ+xoxRZGaMjdmYrPGt9+rYNaVe/nLLuRmw0TfgRMDRg1MGu2ACMcV4uOLxZtsfR19EoRlZGESCXDhWLkmCAWCJwGEHTgNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735318670; c=relaxed/simple;
	bh=iERCf4PSMgPb1a4YxNQInRCexMKauwehhCNuMMlVeNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ti3PIXsbbz+riy/GqnYYSZcshDih/E7d9PExqlSsvXyVF1EaGdTSR1f7haTC2vaJMLU1HQAlY1yS37wA4F64wq5vXJEBbylZhfRcBrYYOBMi5KxqUU/pbdKcahCONYRajfkK9hzDxDtso3DDPDxSgd1o11lMHIjtzVgHwzOyRJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Zgaw7xWC; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Zgaw7xWC"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa689a37dd4so1083999666b.3
        for <imx@lists.linux.dev>; Fri, 27 Dec 2024 08:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318667; x=1735923467; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOKJ3wQvbvnKfy50Gr8I3coc2Gwt+700w35xpJ+3wzM=;
        b=Zgaw7xWCnw/b7sQAM3w3FnCaGBVDYHOQqdX05zKJ0i3sIf0wmglNitXFtImCLvlqbC
         BGxDJlR7yxqTwZmziH0lkykk7L2V9YkRhd/Z4p/tJWrI5m/hKnF6i13jRtjU6aC7Ao+H
         nayN3xEQLL2ZmLHktFyibsbQ011S9QpT996jQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318667; x=1735923467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vOKJ3wQvbvnKfy50Gr8I3coc2Gwt+700w35xpJ+3wzM=;
        b=dkvKc4PHFdIvfcto2cNiSHlonpwO6A7UCRt6g505JO5lCD1eP6Ulkjs5tXvpd540Pd
         jE6y7mNcaNlaRPQp4fLc2CFAFTIRLox7knCn/l6ZNWpf0+HtNj0IicwBVz7OxMFL29kj
         lfOeOuEoErW2F+08Unv10xodH/ASs+qzzJNzbGah6dIblsGdkvYtf7nzLd6g+6wiys1T
         nCqeC7vaOpj3xO6+vTeR+F9DCyj5lxRF8MK4/+HU+hwLBiCGFRTLF7FmLbvXHKb6sq69
         EjiaPKrA+GXPiU8XRtEV1urV9ebRQgC2y8QdUzBq3EcCaFpeNEY7QrIFAnICe6rDvj4J
         HMTg==
X-Forwarded-Encrypted: i=1; AJvYcCX1N+2hpzjvZWxPGo6zNH2D1dRx0pwq3g7xiCjxZE4LqLqTTGNmyKr5GgWI3jObTJTdLwY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3P+5aDeMTh5LXMRM+Xjtl5wvaccyQmVrrMuvfjrWdawrmxmIp
	Gen8S6zPukEDSlk9PljYs3vuVLsLs6a2K1rmRjGscGk5bAW11J0KHP7y5ZuotDo=
X-Gm-Gg: ASbGncs8nw2CUBJ3/h0YoceeOGRf2vWB1qyDk7LumKXi7ATH2DWny4iLSTGLE0mwqTK
	lZx5GIvurN7wqEjvwB1sf4Ldh+wmMsd7YnQHUHizjxfVQks7Wz5PI4QlsIak+mOPOUQsJcZYnNx
	up7Pt8k7VqLgXAfdKHuJbTobPVrwaASGDWu5oMlGKCSm8GPZnpnOBDJsMOBOkhSki55NQdWlgcl
	6phMPD4D+8AleI1zVdWs/dhYocMhP7bIEuLDPmCApsMza7PdBIWB9UYSX1LqsKMphyvPzJ3xJ4u
	zze5IUvx7HWEFHhekAF6VA==
X-Google-Smtp-Source: AGHT+IGgrc+HQYxCKLo2SLlUL/mY7iziyIkQErGfzOsjT9xrluZfeOeDPohhXk9ai5VYtyng9jIdHA==
X-Received: by 2002:a17:907:961f:b0:aa6:abe2:5cba with SMTP id a640c23a62f3a-aac27026cfemr2873979066b.2.1735318666969;
        Fri, 27 Dec 2024 08:57:46 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:46 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 14/23] arm64: dts: imx8mq: add phandle to anatop within CCM
Date: Fri, 27 Dec 2024 17:56:17 +0100
Message-ID: <20241227165719.3902388-15-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the phandle to the anatop node within the CCM node. This makes
explicit the dependency of CCM on anatop for generating the clocks for
the on-chip peripherals.

With this change, it will also be possible to generalize the CCM driver
code, as it will no longer need the platform's compatible string to
retrieve the anatop device node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v7:
- New

 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 1d1424a136f0..6f42e42e13e4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -859,6 +859,7 @@ clk: clock-controller@30380000 {
 				clock-names = "ckil", "osc_25m", "osc_27m",
 				              "clk_ext1", "clk_ext2",
 				              "clk_ext3", "clk_ext4";
+				fsl,anatop = <&anatop>;
 				assigned-clocks = <&clk IMX8MQ_CLK_A53_SRC>,
 						  <&clk IMX8MQ_CLK_A53_CORE>,
 						  <&clk IMX8MQ_CLK_NOC>,
-- 
2.43.0

