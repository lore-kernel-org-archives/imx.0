Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32BA1EA65
	for <imx@lists.linux.dev>; Sun, 15 Sep 2024 11:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726400705; cv=none; b=f2c9TuPxoGs1xQtpjM+UXwTvyz+Yi3uL85xgWSKsmWFg+1ryjY8MawFD4qz0I7qNZCAiIKk2Oiy6V+apXD5oOxE/PuJkyFurZ+E7x4TL9ig9gpCJQIwRPEpMz+/hDrpUv0PDUfDGHf3Eim1JsvUqfNXiLA245WfcIo38fM9RbXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726400705; c=relaxed/simple;
	bh=trGYvef1NRcTImv2sKMZbzFz6CbygD17mBnDSAM+jLA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q1CmtQNzd1zEJQFZrJaCCcBm7xFGJ5EZaPH6df7heip5wPeiOot5jh+eHet2DPlPzt+WeehrgYHaJZ02mihpy5RKVDWkNANVDm84wb9FCi0y8F2+j1IuxXgqhmWXgbTMjZXASnY+Z0y7xHJcPNUoMWaBXGcHD33+8QCpZ9v+b7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3kL/tJ0; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3kL/tJ0"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a8a7596b7dfso520960266b.0
        for <imx@lists.linux.dev>; Sun, 15 Sep 2024 04:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726400702; x=1727005502; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0P2hxKwdxVDqMdDwluWUiTWf66FQH3XHEjGda3h0CiY=;
        b=V3kL/tJ08DB5sM6ZWc4mmwkYpEyZ4HfNOoiqCOP3IfwiQ8rrZ6kYnNPSTCMPQLeGIh
         cry7aArvTljIMsGgEaWIXPJzQbdbZ3ImlcfcXqHSjgG/vQqiURYZBoGk+BvY0pciItmv
         iduM0FnaY6GbDKelkSzziUuWAR1cD2F5/FOkFdJkBYsH/qYq0sMcSyvvPxkJBC3P7ooC
         dFw/7SmUFvOzRqpvhxdDDt+PGSaMpadW2D0R7VNQo73WqqjuMKES+k0mmwssoVNTSssg
         Ml2EMwepD2oaRtUb433zYcM0hGm4ExXSLgRMTP8VFODEgN24vXAyNj4N8NyTHZIUF6VI
         KK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726400702; x=1727005502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0P2hxKwdxVDqMdDwluWUiTWf66FQH3XHEjGda3h0CiY=;
        b=TxnZ7QFQbZ9Vm+vYfWTipeTXdhuSuRu0DC+Becr7l/udedj841UKkjIPQHH2wdCevS
         cQLmYZtoYvOoeMUFfTouxeql4QKnq7oav33K95dW51kM4MsmjboxE4dziPHjTzYJ/kNH
         MLgjct6dMO4ynCxz/+UXIDA5NovOh0mmZA95ZTAQHIgHUiRNUySTzwEpeWlawRfOla+d
         vErOE8n5sX7wwDimj1jjykB946QaX8sNZ0Bt5f0ATD228EV/J9cHZN0UD0yD8CB0RMOu
         6ZE7cRdM39/TbQdxMt2j7v9WN8j9e0hNC0iXBVcLM7BMbovG4lVjvzDTpPErvnAEmDDo
         9JwA==
X-Forwarded-Encrypted: i=1; AJvYcCUi3sUwwUEkG8ZkkbE/5wGSFRk8JlGKCF1bYJTA3rxTHhPlSPqCVWVZQB+V8LYgwmT7WEo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOfeKdZWWXtxXeQiIFm+AGcRB2T9CfPk1eLaHu+dMJrgmBFaxa
	dTBlmySx5cxmwh5legEc1SuNQJTD/cJmaOp0mOa83502NkgjRENHAvUl5b+h
X-Google-Smtp-Source: AGHT+IHQUf1QLxUkSnrIqQ7HPP67wJOXZ12chmF4CZglFGMRIxAR7mfoNhBT3K0qO2QgAqcv/UJ4Yg==
X-Received: by 2002:a17:906:6a1a:b0:a72:7b17:5d68 with SMTP id a640c23a62f3a-a902a3d11e9mr1210434666b.3.1726400702032;
        Sun, 15 Sep 2024 04:45:02 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a906109676esm188778266b.33.2024.09.15.04.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 04:45:01 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
X-Google-Original-From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liu Ying <victor.liu@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] arm64: dts: imx8ulp: add AVD-SIM node
Date: Sun, 15 Sep 2024 07:43:11 -0400
Message-Id: <20240915114311.75496-4-laurentiu.mihalcea@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240915114311.75496-1-laurentiu.mihalcea@nxp.com>
References: <20240915114311.75496-1-laurentiu.mihalcea@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

