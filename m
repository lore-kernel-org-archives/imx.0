Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AA31B652C
	for <imx@lists.linux.dev>; Mon,  9 Sep 2024 11:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725882585; cv=none; b=OqgrmZszFRAajpsuaRLY8SiOk6/fO9NRM+EQkwvaOJn/XAeB431+bQe/vS1Y50zrSqsAhUhSr0gMUAYnDr3ZtjZSFA1OXGSz/0eUupYaA6QOvxc+EeDd41x+ziHaVOChX/1inTzznvb1xsf/9MAET5LnPJkHE1goj2mvWCIe/dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725882585; c=relaxed/simple;
	bh=MZsa6SYqxrl3ZzgfuYbLQifE0u6uddW87QbRWyNYiIw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lITUUhKws+x2MFppHgZLxN69oDRteWXTzU46GU4VmERha/TKfd9g2cNG/a8OIFePaFfAJCwLBUUo2zukjPm2PBhbeaa9XSEVap22dqXbqKMxQtHggmr+hQl5swHafY0A3xNGQGIPvIie8zdqwLjsIi+LQwifwKBhcfbiN5UhoJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k0e3LSh6; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0e3LSh6"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a8d51a7d6f5so110877866b.2
        for <imx@lists.linux.dev>; Mon, 09 Sep 2024 04:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725882582; x=1726487382; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0FqtYi1iw2vOhsrcvx4Iygrl7+RxYd6jvfQ3jmeOKNc=;
        b=k0e3LSh6eveoswmyb2G1UU6oPpTLsijCE8qKAhWyRjxK+7X3nYEZ2eziHC5TMpxQ6u
         aI/xuBisooaMfnckVFuTRYZQp0HT4t5HTvKzXD4sgfcrxJ6PI7uiP+JDCzhrTw3yYI1J
         lV00dq4w9pwAWJdKa4J/89NkfeGkyfEGNwcL73l9xQpZ8FQH2TlP/L83eGZr0KVurgp8
         3Nkrxuv1t6DJbH7O8MUiGcSz3M7Cg7AHTgnMo016IqFrhNONOjRckcBCV4Vl6uurOeHO
         nNCJcn9MxyzRYN7msnMkZFTCLvSHXsCdYjGhVbtaS6cBfmimZYdamjPSw0RIGG0t8JTL
         ER6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725882582; x=1726487382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0FqtYi1iw2vOhsrcvx4Iygrl7+RxYd6jvfQ3jmeOKNc=;
        b=bIlkVDcktqY0xQumIOfEBhWEMn621aCf3yaeVT94v5FLMT97mG+NQl9lOgeHReLLjT
         hIXzlI5eIP4+GMUQAbuSz8rLlRAGfTuGly5+lixFGJoYEeGLh9cnMfI6ZwMflbuGwOXG
         84/dntb9zSuriZ8h0GsNEC+/sdFgUMx7w7QusMutyAJX/gkk4opPkI27dmofkStbQ2w/
         Gv7sWDyQGNPEhVaEvkQpCKvKP73NNgwK5P42uLtJoRbYp/p+bf6WYYrUFQ4pWwHm+xfq
         7lsTPpVM1a0KAvEFOv4WPIllRO1TX87A6VTh3itsi4HuGIH/mc9I4inbW5PAiaGcO8sC
         zaXA==
X-Forwarded-Encrypted: i=1; AJvYcCXeX0MhwBTWBFDoGwZtBDu4Q3h6mvZu1fG3MabxwvOl9pBh+DUfYl7hHNIe/px1sgJkzaI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4+0Gzqo2O0NIa/j1bSQV30wgDRE2+MRyglHQf6VZJ/5OX7o60
	eNZEdKvtVUVmFE0uk0YZajCuRt+QvDkP4iWsVT21rFWXzKEopL7BN5eRi2TESks=
X-Google-Smtp-Source: AGHT+IF4fgHY75/BQyX+RpiuMPmhFfijUoVKMVSVclMKAAtr7zrwuxZWYAPVtcBG+8zbwSQmOE2r4w==
X-Received: by 2002:a17:907:3e9e:b0:a8a:8127:4a8 with SMTP id a640c23a62f3a-a8a887e5ea4mr831498566b.43.1725882581741;
        Mon, 09 Sep 2024 04:49:41 -0700 (PDT)
Received: from hiago-nb.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25835697sm333258566b.16.2024.09.09.04.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 04:49:41 -0700 (PDT)
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
Subject: [PATCH 2/3] ARM: dts: imx6qdl-colibri: Update audio card name
Date: Mon,  9 Sep 2024 13:49:01 +0200
Message-Id: <20240909114902.82380-3-hiagofranco@gmail.com>
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

Update the audio card name for Colibri iMX6 to match its specific SoM
name, making it less than 15 characters to fix the following warning

fsl-asoc-card sound: ASoC: driver name too long
'imx6dl-colibri-sgtl5000' -> 'imx6dl-colibri-'

making it compliant with the ALSA configuration specification [1].

[1] Documentation/sound/alsa-configuration.rst

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
index b01670cdd52c..9f33419c260b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
@@ -136,7 +136,7 @@ sound {
 			"LINE_IN", "Line In Jack",
 			"MIC_IN", "Mic Jack",
 			"Mic Jack", "Mic Bias";
-		model = "imx6dl-colibri-sgtl5000";
+		model = "colibri-imx6";
 		mux-int-port = <1>;
 		mux-ext-port = <5>;
 		ssi-controller = <&ssi1>;
-- 
2.39.2

