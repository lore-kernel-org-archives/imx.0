Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D45C2F3C23
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 09:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761557553; cv=none; b=ddclL7ynrMR8U2g/WN1MRrGMmysWgfumfofqDUwjeuDFE+AT2KJ+BHqggDKdQowfMBA4b17NZpfZkC49Wnt7d3yF8fxqARy080VkXtBMPJN5qYAbZIvEeflcQ9q769dDjavLT3uMs981mX5XyQIyalBIZAXfv0TgyLQApOeY7gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761557553; c=relaxed/simple;
	bh=mndTbYHhwTUyT5y96dJ86Gw5EG9MAfWXvMDRx3WMfqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DPI+l+5zrEFgnIJjTXoGbNHwqFd7yYN0SuKXek08KVj0fxHnvPtPQV01ToxZozOy3m7ipx8TqL6l4m2TQtVb99dQOkktts84lq62rEjGTOq9CUX2aqUrnMNcECAL52N/X/ZyQgJspTVZuKSt03xIFyq8uN+GQB/+WnH+CsK/cr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSKaYyKX; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSKaYyKX"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-63c21467e5bso297103a12.0
        for <imx@lists.linux.dev>; Mon, 27 Oct 2025 02:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761557549; x=1762162349; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56PhuafYXsirG+UhANSH3mXfKoGfLYzu3y07BccvFzE=;
        b=nSKaYyKXPtmZ9TGCObuBEvObI40yYA7COx1X5si+swSIud1Y7AEXiVg0DrZpRmlAnL
         fFH3Exk3k1hrspsgXaYYTA2YEjB0rERmugIKJ4s/8CdFBEIghrJ3KCPrvbyGJB54l9O3
         zDQwIO1x2Hq8NfsfXKHrcdkjrBTdvLOO9hhkTaLWE2AUYWbUYogrP/EKcWrj0x3AAZKy
         wQvXJke9mywEa8nhutNctolRvzQREzWplqRlHhtAfCcwUulINZcoC9oOkak84blEhDqR
         ATWdO76MtrR9qzrr/sv405FoeX2Hng/i8dH+V2bZISbeTJUWeQudmvYHDnazCu3XBf5/
         pTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761557549; x=1762162349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=56PhuafYXsirG+UhANSH3mXfKoGfLYzu3y07BccvFzE=;
        b=kER9W7QHiTf+Eqc1iT+uVZXyOWiejh8LKAtuEODRfbYi9jAV/mO39iXxmwEjEb6CfQ
         BwkSM5ROvaU+0g5JSSg+IGcypgDrKsbtGAt3lLLcUTglC7UREAVoUBl1LARPet9PT5L4
         VOXVCNwMViPgXnvF4j+a8M3QhQaipfXU9NOYgx43d42vzOlXg8WXT+QKzJWwg3BsWFiX
         VBTTC3udXiKgb6sn8srRFmeCTJQDLqIi3Kku+0qbM1Ydw3o/ffd1MqoB1p664PBijXJM
         dvDgJkWPX29D11UGc0tCtmQEup3cQzoOYWYGpJdGxVPVE8dD1EYraXeERYIvOVWQGIZw
         4V2A==
X-Forwarded-Encrypted: i=1; AJvYcCXMtUvUI4qTOE+2TAto0TlRgrSKnCp0mqOzF5yajs4AVVfs62+6DncjqTpZ509WfXEK3eU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxy247n3fcHnKeMrDHk4qsLmDJi2PDNAWNyHyq0ROB2EOrI1Jyw
	oIH/P+xuNN+g4LVwjQIgrayTXT9Ly/o+t6LILo0ERYJu/QNvQks9Vc8j
X-Gm-Gg: ASbGncsoMq8E5ef+a2lFU0Zr6xnXUJTl8EZ7Q28lt/hq/numttA7PYnVj8GRNQpbfGS
	WcSNhtzWW/BPCjrQnP9xJDqwPwYGh3iW8lg5TkHZVgAFjjIJbMu5KZZorDY4/riEsm2Kzw7z5BB
	dn7qJ7U468YfehAPWbHU+pon8PEkRlecP/QbJlAE92qkPZ0iHygCfprw4S6Qv/6cs94U4hPno2S
	1935EEKraxfClp9se/uzxhpcTtIsOP7pZ6tqbv1DLEOxTLe9UUgUHbkTTJP4zKp1LTI/gfN584i
	uPJrTY6KJ/kKfWXL9vlAQGiOwcFAGjG8iLLWTL+6ggko6uwsPYDWsLlENOhAadQ0Pld527KhgI5
	aR+Z43fdo0v0P+s8VjdNe0u61wipIsGHpKMObyP7OQgqsp2hyUnjcBoqGdfPkjCypFpJYpDTEL2
	UWyK7oggEufCEohtGNw9RWh/h/zfKDAFtb3y2VdSD9ILk9qhximZMC20egRaY91hpheHPVz+mbI
	3TVkKJU+ngsnOL9
X-Google-Smtp-Source: AGHT+IEFwNpP3dTtFNugaADyHzm9NL9na2nqJocl90kjFXsdtQrxoTlQehatWBhcXvoqHgFBklRLfQ==
X-Received: by 2002:a05:6402:2807:b0:63c:a17c:8efe with SMTP id 4fb4d7f45d1cf-63ca17c9097mr22821321a12.12.1761557548713;
        Mon, 27 Oct 2025 02:32:28 -0700 (PDT)
Received: from toolbox.int.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef6be28sm5681014a12.2.2025.10.27.02.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 02:32:28 -0700 (PDT)
From: max.oss.09@gmail.com
To: Max Krummenacher <max.krummenacher@toradex.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/5] arm64: dts: imx8-apalis: use startup-delay-us for wifi regulator
Date: Mon, 27 Oct 2025 10:30:11 +0100
Message-ID: <20251027093133.2344267-6-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20251027093133.2344267-1-max.oss.09@gmail.com>
References: <20251027093133.2344267-1-max.oss.09@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

We used regulator-settling-time-us for the wifi regulator which is
wrong for regulator-fixed. We have to use startup-delay-us instead.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

---

 arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
index 4234289d4012..f2646db74a5f 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
@@ -78,7 +78,7 @@ reg_module_wifi: regulator-module-wifi {
 		enable-active-high;
 		regulator-always-on;
 		regulator-name = "Wi-Fi_POWER_DOWN"; /* Wi-Fi module PDn */
-		regulator-settling-time-us = <100>;
+		startup-delay-us = <100>;
 	};
 
 	reg_pcie_switch: regulator-pcie-switch {
-- 
2.42.0

