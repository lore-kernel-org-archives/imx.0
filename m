Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E6F1D9334
	for <imx@lists.linux.dev>; Sun,  1 Dec 2024 17:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733075250; cv=none; b=JgkZuynIclB0sc0nMmeELovztE+pz5srMgWx/qtJu86+3d0CZpJbIMc3C697PkdRSpPzgomF/qNUWd1jfSJYxnMLgCoXByCPRrMUW81f8i21eW8wCx757hHvEdrlivRwGdI3x5uYiKZOdnLOnVnGDXwH4uXneheA6Rz/neJXgCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733075250; c=relaxed/simple;
	bh=pAZvwlhdsPQOXTECn8htnfBSk5QEXWk0LGMj+aO20ko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h8soqBc0839bmYKhYm6RgafRCiwc5WB3xLXauee8w/W4mqMGo2PHbZCBz+JamybRKkyw2E8RKpDw9oaxT+zSZMZnOk2mj9GgLSaiMHwTt0rxmTwhvbHu0Z7nW2WP8XaxUmLRmbbdRMOESfjRSvy08j18BYrHdhoQnXYbxUCaeyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=aYGN+vX3; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="aYGN+vX3"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa5b0d8bd41so373380366b.2
        for <imx@lists.linux.dev>; Sun, 01 Dec 2024 09:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075247; x=1733680047; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=25hkQ29mTLGKqj1oFjf7AGoT1DWsKqPuwzAecsYSYFU=;
        b=aYGN+vX3jN+Bk8Rpr5dbOGLVdszjF7ciMAurWkI5TDMc0mbZtpNabJSecxd+87i1Zz
         vzopRIDV6E9m04BAGRmP4X+XRZGjTh2IfaSYElmqErKRIGGwbw3Lka4QnHFKN5vvg8gv
         Fnrc9eGawBbTMdqo2+3h7+XeOwNT4fWzG8Grg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075247; x=1733680047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25hkQ29mTLGKqj1oFjf7AGoT1DWsKqPuwzAecsYSYFU=;
        b=KfxTypw2F0Ztlj7h+3/aiPb7ymLGurxqq5RiIpqHkSnqanxtnuPk4j5AOjjd0PEXOl
         pjUC8A04pz6zeQViC9ixKs4r4xdeLiWuJqqCgskFKJK9jb3ecA63tdy9bP/hybGiU3vE
         oF9gco7TfeiQh0AmiZ+V1TLXvQ9ZSYwUlQKlW1YnYUmvVRVsABc9Id2MKfLWb97ip+tj
         jFaVZWYjsEYhCOAulXfvUao9S3EMlRsUuDvS2SBvK7hLVF13eovLC/whRCe8bAfDY6FN
         asWplOqwixo5PJpJJYpr/QkT7mZ3vClrflmsBhWNUJgO/1BWVHSd92qVBAHmuliq/diS
         BCJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGqrKKxS0viAGfUWdX29ue4R6RYsnNCZ8P8P025Mt7ybCorE90zcHmxbzhYTZjN6S5Aos=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOebfMgXUbh5tr0AJ/0A35ywQ1zd/gI8R06OWjQgpD+pgyEC7D
	OXfo6yh0S4QMK34qMwBwVJIL//XTtCkZVVEmFNzez3V7MwZYzNR4MgmFBEzB4bs=
X-Gm-Gg: ASbGncvses8to+xqQN8lKzDLPUmYa5DYSDQK6S9g4Z/Ra7Q94ZGFxm+ZBza7rO3ZniQ
	O/s9q9FX+pGi9og0rfWZ0ENr+S3U823A8c3JoIC8FhmyFiN6Q/n+8ol6EnM0tvB4hvzp4Ej5cT8
	qptQmxp61dM3Uf8Fxr59CrGGKLmyFqtD6L9xbpjfvUomIuMezeLLxz7a5SyUKPM+YH9G40J+S9R
	8QTJ3JU+3RJsBCO1Jvs4k0kI0mRCi3UhptZ85JyhwoC1GIyAHGLKqTdpF0OE4vj077EYaGTciFq
	pjw6oqGWTZxkZIMyLuN8h/zK1EdRqT7pZmDN3h3YeSoxeIoAqE427TWulItmWOyNAsmHUw7onLy
	onmk0lASqMAameaeT
X-Google-Smtp-Source: AGHT+IETqWOabkVlO1PkfWKeKFWRO9lagZn7Lq5BjUv+Xpoj3trCPw9o4vBjnJJzR25eaHHFJ7m37Q==
X-Received: by 2002:a17:906:3152:b0:aa5:2232:c8e4 with SMTP id a640c23a62f3a-aa580ee8d1cmr1705022666b.11.1733075247468;
        Sun, 01 Dec 2024 09:47:27 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:26 -0800 (PST)
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
Subject: [PATCH v4 05/18] arm64: dts: imx8mn: add anatop clocks
Date: Sun,  1 Dec 2024 18:46:05 +0100
Message-ID: <20241201174639.742000-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clocks to anatop node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

 - Added in v4

---

(no changes since v1)

 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index a5f9cfb46e5d..49be492b5687 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -606,6 +606,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mn-anatop", "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0

