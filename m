Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41B81CEAC2
	for <imx@lists.linux.dev>; Mon, 21 Oct 2024 15:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729525994; cv=none; b=CoNrHKG0CtH9tAox7lJHxoW9xRY6FfM0AUB/Y2RJSUJlZiJfO5viuY/WmimjAYk2lALEJusZp+LexKTQS94GHbgtpBwdCCEOBen8RAMlZoXR7mP0f/I9PJlg5nCAjH30Jxnj9Tx2BJArbgHKf8oGGtwUHSrGHoS1PFAcmI1+OPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729525994; c=relaxed/simple;
	bh=LOVLjthvbNs+8JH4PocahA1b9cBmmHZO0vdEAllJHeg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fp5+JanojmP0Rwi65YGVo/moCGDUP7Bdf6/B2sFkwBy1pMuYoKCtDzj9jtqwuctBIULA0eXJt+D4tlvYYoIdduCFmmNTBj+NrW6IhKHG8G6ARlXoTaqKt/z9SUGnUU0yGYkOfrNkjNZl1lXIJIP1DktOUCFOlt38Gb6P56kAsjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fiE7lcmK; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fiE7lcmK"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9a16b310f5so608098766b.0
        for <imx@lists.linux.dev>; Mon, 21 Oct 2024 08:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729525991; x=1730130791; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CuD770AfqfA3+1we34OBIdyNk7AWxBeNDLvWt4wIKKM=;
        b=fiE7lcmKUlWIaqDWlK6tmS8gvffwHugN5lTF016cBHl9A4ejpTVVCPFUlP/1kiRdUI
         WuAvwMqOZoonP4J6VlOczSom8uCUPIMS+Q5Z2y7iIxWAPR+fWOkTaz+kL134PL8/9vI3
         ZuArwN6MZbLspRRuqB3vjrQelA5ocKTpFeYVQu3HX84YXftgYRkZZBVMp10GR7aVbe9j
         1A5DdWxiBEvNrulQibJ+5pgOZqocsR7EsjtCWckUz1VO7yK3EfNceBW0VpgBIFwnekCk
         8UYaPqbsLdNLLJx0xbbwtKw4CLJnLg+Qov0Y2cnJqLXNTti85mM3m0ZsRLY9HnBwiVot
         I0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729525991; x=1730130791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CuD770AfqfA3+1we34OBIdyNk7AWxBeNDLvWt4wIKKM=;
        b=J1DwuMnvt/xWwA6KtMnY3TgwQqQjtNEKFWRvJirLze+DF9pMwmEqzMsVSIl40WQL/4
         9TwrIne3CM3zyw+0jbahYoL7WLugzzrnzmSaBmS518WnmQqT/1MuFcnTJlLwqJZWeFrB
         bXgGV/bYHPshtJpk/TwRM6kw3ikPuyn8brOuwjA+kK+ZrlsDl81kmx/FmBYJhbQ+Ov1K
         IKVe6XATv6XfTKVLBCiQy8+pXVzxMLHPr/VA/B+/57rDCXldBNNmkwm5s+967EK3Gnoy
         7j/XVeaF21mvsgS0JXG8B2XcbgC/RQQIa8kyuGhAj3lW7/DBBA9wyoBZFMqmDV6G0pCm
         N4Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUb6gwCG0q9cLDf4YQDap6TkaZ7n/nytAty+8bDKN7QMhQUsEaihWQwCXAErdlkJ9QrnGo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzj+O2tKMPz+K/kS6w5KeffV3X2yyK5B9cWSYBiOpks6QIz7Mr2
	/HLy75NAMeldpW6BkiLr1TSr4VSI0jJQ/uYHaGYeNRf2jyVBUDAs
X-Google-Smtp-Source: AGHT+IF2yoAl368N+XO3JdI5vISlD5ad11UbPnetJqRjyiBddDG9lg6QDzjrGFMhrCckyRSVQHLPig==
X-Received: by 2002:a17:907:9693:b0:a9a:3cf:cdb8 with SMTP id a640c23a62f3a-a9a69ba6e93mr1093227666b.36.1729525991109;
        Mon, 21 Oct 2024 08:53:11 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912edfd0sm218614366b.67.2024.10.21.08.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 08:53:10 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Tushar Khandelwal <Tushar.Khandelwal@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Frank Li <Frank.li@nxp.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 6/6] arm64: dts: imx8qm-mek: enable dsp node for rproc usage
Date: Mon, 21 Oct 2024 11:52:21 -0400
Message-Id: <20241021155221.112073-7-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021155221.112073-1-laurentiumihalcea111@gmail.com>
References: <20241021155221.112073-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Set the status of the dsp node to "okay" and assign and add its reserved
memory regions.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 27 ++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 62203eed6a6c..d51da3b6b3aa 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -92,6 +92,27 @@ vdevbuffer: memory@90400000 {
 			reg = <0 0x90400000 0 0x100000>;
 			no-map;
 		};
+
+		dsp_reserved: memory@92400000 {
+			reg = <0 0x92400000 0 0x1000000>;
+			no-map;
+		};
+
+		dsp_vdev0vring0: memory@942f0000 {
+			reg = <0 0x942f0000 0 0x8000>;
+			no-map;
+		};
+
+		dsp_vdev0vring1: memory@942f8000 {
+			reg = <0 0x942f8000 0 0x8000>;
+			no-map;
+		};
+
+		dsp_vdev0buffer: memory@94300000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x94300000 0 0x100000>;
+			no-map;
+		};
 	};
 
 	lvds_backlight0: backlight-lvds0 {
@@ -640,6 +661,12 @@ &sai7 {
 	status = "okay";
 };
 
+&vpu_dsp {
+	memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
+			<&dsp_vdev0vring1>, <&dsp_reserved>;
+	status = "okay";
+};
+
 &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog>;
-- 
2.34.1

