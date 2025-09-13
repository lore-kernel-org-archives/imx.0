Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A344428313A
	for <imx@lists.linux.dev>; Sat, 13 Sep 2025 09:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757755007; cv=none; b=Jnpj3SO1FEv9dSYwa6poQ2pKhM+T0vqDnJw/BvgS1hd/P+jFE5fNP161zfLPLQNB0jHo6xd9B0hoUcO5T+56xSGObDJHJQf72axNU7stbAMKnZXFBsHG9C1mGnHsq3OlmX7Z5eo82qDaCzAnKThpQLGAYLrNBXZ6FSxSKAVHKZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757755007; c=relaxed/simple;
	bh=50Wf/YvHyWAiEJIWnMiIPPQnOr1Oksxk5KmrCQPjYKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jmsBx/NZGWYeT8/kZHcRotlquUB1b94sVkQMJihQS4x6WcBhydhURaqOZAMol6kOD/5Cz6mwvEoWTffPK6eJqKMWc/fw/8Z6fmZaTKdbbXRcUEFCtM2WC90g4rlLxq51G2mmKsjm6aq+O0UDj/ZVeGMZ4nkQEYn+j+8jsM65Qbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=J1A6FuRQ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="J1A6FuRQ"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b042eb09948so565506366b.3
        for <imx@lists.linux.dev>; Sat, 13 Sep 2025 02:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757755003; x=1758359803; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=woVp7FNEkX/bwtVc5utqy3tuJJ+oPzZT5NUOh8DxvE0=;
        b=J1A6FuRQ4wm9UlRPdi+ArEB8q2hI2Hw/ykTTsXcd5klew2wSWEtIuTWPoCDAjctgw/
         y5QNSX2+cSETU19Ld3AFV2LXCdHdgP2Ew0reTlFLjwYvl0r+cklkCi7c1ynsEvVPehbu
         qMYd5GDEeAiPzTwQ052hZw5Isg9EW4+7nBKNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757755003; x=1758359803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=woVp7FNEkX/bwtVc5utqy3tuJJ+oPzZT5NUOh8DxvE0=;
        b=IZj42yrgcbyCzJofngJYRAYlShJhYJ05ncVjPGukU1qQP4QBLEYIDbBsQZEwnkZpCO
         9yRrTopAtwNe8pIR+yEfEj01i5OxlEVx3BUU6cN08WPhZoetsbEHzASNJ3ppDT/QIpUS
         IJhVpmpzEE4elqxXO9B5LppSHh717VgPP6sg9vHuBnevrMk2dzDaafqXHdG8zbj03hGV
         q9vWaqmB8sODozC4Ymv2BLU1RKcq8A6cexUhNNaUXh9VqF+KQ6WbdisqTlh3Gn83rovM
         v72C1qdFVOAF8aG7dcSdQQoo1jrqtiAWZpYCrmXd/YdaBtpJ+Ss6I3tpCPA+phuXl63s
         BLjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvscaebMmcOeTFfs/cTJXLbIR4lj+3HFLEZ1/RKaU+bCXJLh0cxyyJc14p5Q8RHqsv1W0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxUBkA3qGr+uUIODCnywMZZ28Qjd1tK5EwsGqEslArJiQozOerI
	850l/IwGt2oLoSQcFqp8NU2cRx7xCRuOiLy0jZXXHTFsPMqvFjPHSbKPjSLklqNwbMs=
X-Gm-Gg: ASbGncumSlWkGuFnCTXlsmatgLSoneW/ESVWMDxtRoR126i0xVQorWDmDGeuj2gWGzb
	YA0413wV903koO0icd9J44xx+9ph7LPTd39yIoKPxopHCFk103mXFQjWX+LnPBhYMkmKKZ59F5I
	eRK1OshfEAn67e1L7jmxI9dj991LzBE78GscUJMmTwNshI8pOrTlZz9ayEXXbT/RYOz2E6DLXdt
	VoVbSjZ9gfdvEwQoSyAkXUwbUgxh9ar7BzUQdNJ6Z0DgXBCbzOg/jOJ0lxdPBFaSaBGYJuyZOcR
	SMBTDNAHvAD7evbwAF9yMCtwfPOvnCC+Jb9BDxg/OdHTRxvVBDjAZP3/e9aAJ2vEzC2isQZGwQK
	+T/q0ec9FEh8eCk8hc6CfPKGdNLNzEi/VWHOLVRHStkI2Zxqtd3Xk76ERlzXdN1xo0rDa5VU8Dr
	2KKxeqPkatB1YeNcWokAMcFmW7apuuZMV7ZrN5FQE0kbQjANFzDaXr1aPqtFPzudSC
X-Google-Smtp-Source: AGHT+IFLQcrw9kq1ufoEVqOgFBOrdye9rBnznBZUzXL2tY70bbUV8mzf6aopgG578A5tsns/4TRC0w==
X-Received: by 2002:a05:6402:44d9:b0:628:e750:85d with SMTP id 4fb4d7f45d1cf-62ed8410affmr5076000a12.21.1757755002961;
        Sat, 13 Sep 2025 02:16:42 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62efb5b8b0asm1593089a12.20.2025.09.13.02.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 02:16:42 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: dts: imx6ull-engicam-microgea-rmm: fix report-rate-hz value
Date: Sat, 13 Sep 2025 11:16:31 +0200
Message-ID: <20250913091638.1003563-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'report-rate-hz' property for the edt-ft5x06 driver was added and
handled in the Linux kernel by me with patches [1] and [2] for this
specific board.

The v1 upstream version, which was the one applied to the customer's
kernel, used the 'report-rate' property, which was written directly to
the controller register. During review, the 'hz' suffix was added,
changing its handling so that writing the value directly to the register
was no longer possible for the M06 controller.

Once the patches were accepted in mainline, I did not reapply them to
the customer's kernel, and when upstreaming the DTS for this board, I
forgot to correct the 'report-rate-hz' property value.

The property must be set to 60 because this board uses the M06 controller,
which expects the report rate in units of 10 Hz, meaning the actual value
written to the register is 6.

[1] 625f829586ea ("dt-bindings: input: touchscreen: edt-ft5x06: add report-rate-hz")
[2] 5bcee83a406c ("Input: edt-ft5x06 - set report rate by dts property")
Fixes: ffea3cac94ba ("ARM: dts: imx6ul: support Engicam MicroGEA RMM board")
Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
index 5d1cc8a1f555..8d41f76ae270 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
@@ -136,7 +136,7 @@ touchscreen: touchscreen@38 {
 		interrupt-parent = <&gpio2>;
 		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
 		reset-gpios = <&gpio2 14 GPIO_ACTIVE_LOW>;
-		report-rate-hz = <6>;
+		report-rate-hz = <60>;
 		/* settings valid only for Hycon touchscreen */
 		touchscreen-size-x = <1280>;
 		touchscreen-size-y = <800>;
-- 
2.43.0

base-commit: 22f20375f5b71f30c0d6896583b93b6e4bba7279
branch: report-rate-hz-on-microgea-rmm
