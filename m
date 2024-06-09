Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5C844384
	for <imx@lists.linux.dev>; Sun,  9 Jun 2024 13:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717938081; cv=none; b=iMZDCHqk7RjyVLFAQCFL5DsAtQ7qPsa1YEwCL1zOmLMbrw+JjgfyIYEMeS0SDqay6vJoVKYwfkJEBWCWAxBaYsj3JzG+NyhW+bDNtGRjvSRvAtEvXlCyRoancbiTEuWMXewEvEAZDTgaMoIZ/MtLwB1cvp0Xaaik4ofHnXP9NEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717938081; c=relaxed/simple;
	bh=yy9gl9pQz3F5fgfnipmdtFV0zJl13QipSJnEg+3xNDo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tZVOH7aPuTtLDy+68+QzMUcatqWfiDycMIY6BFgBZ8ys9xGnaJYMA/g7Ti3XJPh8CvYTn+oqLKnVTGnf4z1YBv6erRK6r+VxvpyxwCXOA1kJ1GaEpik4FTxNtphN0Kga3U864lN2Rqz/LcLDQ1wlva5KVtvbNX7P/stc7LZj9Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwucj/hP; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwucj/hP"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a6cb130027aso149799966b.2
        for <imx@lists.linux.dev>; Sun, 09 Jun 2024 06:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717938078; x=1718542878; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXLPtmmwbw0kH9maBt8kI0QUZhZ3U60BovT7L6yY3xs=;
        b=mwucj/hPTXtkerhhGnBve5eHo2SsVrjQirRwo7/ZVmXNwEe5sUtGQO4m2fNgCcjmOa
         MiR/+oY8xo2PLNEvXK7wQ3jj8xacnwQU6+CEP6CnIu9/QwUFGw8YfSMJw67jUjEhoCIB
         I1zmzr2rBBd7idU4LSAzzF06zSK0qMz2eYyCejIZamGAFh0LhZ8EMQUHz+RtIy2IglDj
         UYYfnn8fDChgA/i3wR+eBRnEIIJyv8JVFG1fid7fnzwoKaTmzB1G/i/fNlTzopO6ILL1
         uH//6907LZ1rSHfT6/hM7JNhz5pjf7Q1GC/+YS7Abeah/ucfgeM9DvihxId0iKsRKp7d
         /lwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717938078; x=1718542878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXLPtmmwbw0kH9maBt8kI0QUZhZ3U60BovT7L6yY3xs=;
        b=CiJuwABiLED8lTEWk3dtTQl2MRnLncPrKhOgxayXgHm3CIMN+rLpAUbOpqXcPHyOce
         wXSks/EKFHVm8TBBPEAZVXzyt+cHDo24QF9957ALvLb16MJm1C60IfQwEX2SF7QMBOlr
         mfaRRjMQdJij675ul0J3fgiUo91cM0yqXSXPKMLp+F7EhY6iGaLgwft3riO6R8XdAsTp
         FRqxiHbyqOvKyDyXeJp5TCuNW9jU2rztbHlmPbs+HJdnwU0YNoxEo5wXjr7HH6e4yCyo
         te9rfZ84O6XRbNMJwpOrF4AiFMU1s3qkAwLEms3qf8AtA4qdse/5NyMwcnrB2MkXWNAa
         d4/A==
X-Forwarded-Encrypted: i=1; AJvYcCUDduNNScxvG+zA78hQXS0kB21nCBGK85Jrs0HjYKaSEkYrPty1fNfXmFJ+3/y3MkmStA9WxNK/RZ7uYlBXM5qV9NSY
X-Gm-Message-State: AOJu0YyfoYIpveI/zdxeLC30GjLeQzxs+v0FeqVYIy0dJ7jV+xlQYED9
	NwupAuykhP+VCpw7JztKi60YHyuLUP4Hf06/hrzgJADrtZYHOFUO
X-Google-Smtp-Source: AGHT+IE9cuXF727TvRThgldcemuwA9M4zGggMb69uY2vp+iF779s8nKt7+bEy+hu202ctfIWzJUajQ==
X-Received: by 2002:a50:c308:0:b0:57c:6d89:eaef with SMTP id 4fb4d7f45d1cf-57c6d89f0damr2532005a12.18.1717938077578;
        Sun, 09 Jun 2024 06:01:17 -0700 (PDT)
Received: from lmc-playground.localdomain ([188.25.209.252])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f1841fceasm85961266b.70.2024.06.09.06.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 06:01:17 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liu Ying <victor.liu@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: laurentiu.mihalcea@nxp.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: imx8ulp: add AVD-SIM node
Date: Sun,  9 Jun 2024 15:59:01 +0300
Message-Id: <20240609125901.76274-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240609125901.76274-1-laurentiumihalcea111@gmail.com>
References: <20240609125901.76274-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add node for imx8ulp's AVD-SIM module. This also
includes its children.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index e32d5afcf4a9..1ffa4da23042 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -614,6 +614,19 @@ per_bridge5: bus@2d800000 {
 			#size-cells = <1>;
 			ranges;
 
+			avd_sim: syscon@2da50000 {
+				compatible = "nxp,imx8ulp-avd-sim-reset", "syscon";
+				reg = <0x2da50000 0x38>;
+				clocks = <&pcc5 IMX8ULP_CLK_AVD_SIM>;
+				#reset-cells = <1>;
+
+				mux: mux-controller {
+					compatible = "mmio-mux";
+					#mux-control-cells = <1>;
+					mux-reg-masks = <0x8 0x00000200>;
+				};
+			};
+
 			cgc2: clock-controller@2da60000 {
 				compatible = "fsl,imx8ulp-cgc2";
 				reg = <0x2da60000 0x10000>;
-- 
2.34.1

