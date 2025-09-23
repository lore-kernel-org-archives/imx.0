Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66AC264A92
	for <imx@lists.linux.dev>; Tue, 23 Sep 2025 14:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638281; cv=none; b=qovdnnUq/s3SxzLf6B2+2Hr6+IUmPwJg25mNFNoabqwVSUsO9tJgZZRTnvgHtKiYHliucA2DLiprDVJLN0O6AOkII28gmMnywRONz6gIjiHhA/hKYzMwYnRcXqUTx2LWNlOVCfqSbkRL55lwNy74WyIY+RDupNoG7hp3zLSBel8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638281; c=relaxed/simple;
	bh=vk6FwPi++rlEIdnq7B8swuH4Hfip4zJuCa4DgVBSD4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rBI8btimg8amQxUeC+kZ0m4aAvZUl4vEbWg+QKq0GivsQaTHleif9s/BrbRiSb9vm3tUWnYmmblVRM+RYUZgnau7N5JHcHt/CApE4zA1a3MOhmBrJuLhykKkC6SZGzN9BsnAK/6YkULHSxrEnQXs8TvfP/3HQuwvgwnifB0FjxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=YG6l21o4; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="YG6l21o4"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b2b4318a202so394013966b.1
        for <imx@lists.linux.dev>; Tue, 23 Sep 2025 07:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758638277; x=1759243077; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIxVfZFoAEsIwCtiKpIw9ltXsqh5nL/d8yl3mBu/8Nc=;
        b=YG6l21o40CBF8inTrtGMpOutNjP6lZCQDLuTzv/xMb/OM3xdhAy/L8Y68Ozv1Yoz5z
         3DoUvowZBdqEgRzP9wEcv66mWYkOINdLoY1VFueaEYj1MoGG4oK2AnCEgjoTXcqL/gU2
         A7wZCkwjwT8oMSqa3j0WyLKezUT1EWT+91NUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638277; x=1759243077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BIxVfZFoAEsIwCtiKpIw9ltXsqh5nL/d8yl3mBu/8Nc=;
        b=cAUYbp5HsDdx3Yxq3u7xswnIYoz9+9lQOn31WdEAuqL0y0VZSlJxrHgMCvh13ytUka
         s5WYPP6qe+AxllnpEIWkSq2HEJ/ZwMCqrF2v1d2yLm0pU8YaIKq1DoYFhQUIgbCBc+wg
         IVxHPkdGNitClNA6l6W0XnwV5o3UzjwLJSudLvSjxeR/zDcpQ7A9/evGq0NUFDz7ONYr
         SfgG2HpvuCjoyA2xG39h68FnyhAh4jSScL9EXIS+8FCeAoFjMseUNB8koPT4SfxGgDiu
         q5GZb3QFyvuUMLPJv2FIvk6AwBhXh5JKrEoXg5c8ZvKzW3W5OMS7yDcIoZn0uBC/uaYi
         YFZA==
X-Forwarded-Encrypted: i=1; AJvYcCV+got7E8K4h+RbCyiy6v27rrjv748AuTD5D2DswLrlNIt8VsPYc46IAhr+jwQkYI+lQ7I=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLrzeO2HuN2Rjdt502VdBSLRGKLc249Yaa6bJLzkLXl2zcGEI9
	aHrPYhZIWy+VrECcV33TSDXuoIe22obCxyb0IUOO03N7SYPKlIoyua7Xf0GjFMVRBHA=
X-Gm-Gg: ASbGncuxeIN/mOPebkkLq+HVfhJWca4a4IrBM0tWmG1xufCzMAEf5MLOavFKCkVjBC0
	v7+5Q5zw2SU6tVGj/qV4M2MqifhQrDMwGwZIW/kQbnMU+nKgsm+NZhpuQRAD9JqGIXfHuzAcBPU
	avWeQh1Y/MqxnvoyMrsVYTxw9BivOHz0ntp93Glq8ydChaa8coI9+NNgQSBalayvhePmFkAUexN
	sxU1UR3cA7chFSXaMDlt/KR2/b/bhEI/KQ1E1+glBxkHHEEdO6X5ImFlnIIpnz0iFIfNHgqXMmm
	L02G2ijnPCHwQexjZbojN8veoiIpPwXAwT/KR1E6/0Qguv/ynHaFHNmFzu2t8jURLUnJZPZZxzU
	Xi7PUZGwFWWJ8ZapoFiNaw1N2+0ioAQ8UwwTC2864z6fcy4XA8xOfjS+UCWTD0CK585eRnFgRQB
	gWYnVnkyx9CykFHUOoqyEXSTup9C75Rdo9qG5HwhLUwEwh3v7MIVlqzkYfdXeHehXP4Z7soHYL/
	pQ=
X-Google-Smtp-Source: AGHT+IH9SMkFkR71Kx+KKn5T55TYlat8HlxhxiB+GViGIA9Vt0hQfUrdnZ3e8AKspkcyGYH3r9r1+A==
X-Received: by 2002:a17:907:3d8d:b0:afa:1d2c:bbd1 with SMTP id a640c23a62f3a-b301e5ad661mr314613866b.30.1758638277092;
        Tue, 23 Sep 2025 07:37:57 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2a2a5f6c7asm665204666b.28.2025.09.23.07.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:37:56 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [PATCH v6 5/6] ARM: dts: imx6ull-engicam-microgea-bmm: set touchscreen glitch threshold
Date: Tue, 23 Sep 2025 16:37:36 +0200
Message-ID: <20250923143746.2857292-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923143746.2857292-1-dario.binacchi@amarulasolutions.com>
References: <20250923143746.2857292-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This way the detected signal is valid only if it lasts longer than
62 µs, otherwise it is not sampled.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---

Changes in v6:
- Rename touchscreen-glitch-threshold-ns to debounce-delay-us and
  update the value.

Changes in v5:
- Add Reviewed-by tag of Frank Li

 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
index 279d46c22cd7..f251a1028355 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
@@ -154,6 +154,7 @@ &tsc {
 	pinctrl-0 = <&pinctrl_tsc>;
 	measure-delay-time = <0x9ffff>;
 	pre-charge-time = <0xfff>;
+	debounce-delay-us = <62>;
 	xnur-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
-- 
2.43.0

