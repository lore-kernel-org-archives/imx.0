Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3E6318135
	for <imx@lists.linux.dev>; Thu, 18 Sep 2025 15:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758210774; cv=none; b=pZ3XHd501gR9cldE3Nxul5jXgLDkWwhE5RXsScfbR1pihcF7iZcWQB2tx1ZN0BoxGg/XATdgLDVtHKJzGqWbl8rbDa821XKFNLWBwyYJ9rlz+NaG7RJpo1BWBk1T3vw/aWpzy2Ly0TwW2k2HF83ZphC7EMlTrdf2Je2AI85ipsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758210774; c=relaxed/simple;
	bh=gGgLDa28x4UcF2lKFBKasKuonH4sgYz1s6b2kl6Iy4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=roDKBTGWCLgBspaVLUrIrzAbeJTyDab3ynjLKLeiHv1HHL40h1PD25dme7biwMaNSzUQ3EHsNnmwM40IfrBbM8sa19hibJmHuT0NrST2fEuE4I1lAiEVXZNkSTueo3HJOb888duoP0zaux5EuUq5QNNRlDvNoqKJM4zx8mYL3+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=FIDXyPXh; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="FIDXyPXh"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-62f0411577aso2271361a12.1
        for <imx@lists.linux.dev>; Thu, 18 Sep 2025 08:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758210770; x=1758815570; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KC1/Z5A4C1NKjQ4MKJ5mwlwDtHXXOD1eqAPkjlkCE6Q=;
        b=FIDXyPXhYVypHfdlLQp6XFKbsCiWDpFHXXso1dkMjTfTf88+CDEjkj5Khpm9JdMaO7
         zItfyFIOoOh1Ox/UYHRsWVO8fkDna8Qqd3muQVwmiBbhGofr+aYEawxhTByhVm5Zc3v5
         7n1MWUE+1bXU+n7txwCKs8ZGMR1HFJ4hO2D2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758210770; x=1758815570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KC1/Z5A4C1NKjQ4MKJ5mwlwDtHXXOD1eqAPkjlkCE6Q=;
        b=ESoQjBx+BABeMm9HHPgfRrcuJHmYRJTZp17KgIlhVqppEo52ebzbDyCCkgbCewNh37
         ZQxWA7XBwDeKMt/sPbcQtOg/x6cOt6vIaqNflvhIOWs4CEjzZzA+MkBJY9d34OQW92Re
         jQrfNlx9VoewAzw/J7j9Y26D8HYgDvm1e3YrgFRULrb4loB/wC3HOCoZGoe6jF3+MPI2
         1QC45aOKBLG/fxVndprJfdaMvvpOXACF2MtvVvy/V34vHmhkxAvJS9yCihyKFHkOMApc
         1vhHheWaopAjw+TXixE8Utwkc5iyvPgz5ozHrBu9H2RL4BuuIENlayVBiIFe0UvMXplC
         ff3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXIdBiBduTzaJX7NlcXt5Jvm5ki8R+rMJeTyRId+B92EIlgngTfc2Dzwvp7EbVjAi6SUWc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7rm6k/1lQqT+DcgEDC4QwGlnozT8F58fkOZu7IpPjCcMdosEH
	onLpUkAj4BR77ZcpQFEVSDIKI3jME98Y+yhWJQorHJ7zlkIR23L5bszJlbSjKTIlaNk=
X-Gm-Gg: ASbGncvn1roPwZvr+WjOSbAJ5PsSqvc7I20b+ub7mKuYsCP4klRHK85QY+/WxMplYcZ
	QrI05zNPKmwUdJoDbAMp2bI89axEyLQnqF4yFgmfeHvYb19R3ydtTrIfuZdLzCBkRvC6SOPRq/m
	wtVA1Tx2/j6DcA9hi2ANK2+pcc1Hpxq8htYZKfHVambb9tJXVTZM/wi/vSebJ1Sau9oCqPy7ck2
	Lgmv6p9yIzs8Ksuqh5lxoN/DkNmnC8/qeQCESRaBu95KGE/2WagLtd9m6NPFSaa73BcBaLsk8ri
	szXA/Veun7WaWWO5AHLOQY4YMMTMWs44aVkpKOM0UWX1zdfwMZvX8LtprYF2VLaVS1FNGBaOSsO
	j7ei1v4CVvLNGH99J59IKXQVUAm3/zUMwt9AMjUfahTnlQNaUGZ3lGRF4b4srcaN3x37ktGVmal
	A4QcZVXcGpCkwMo1QxUc8v4Sxj6yoZfh1F552SMBzmus27ikCtQsTfIGrVIh2s6O3AnkfFJZyXc
	/oF3ioi+xg=
X-Google-Smtp-Source: AGHT+IHrrgs1HJChTIyvAVV8Pi6aonRsXlQC1gliMmMRrY60B3FFWCvZ01egkSmZM0VTAEb3+in5cw==
X-Received: by 2002:a17:906:7310:b0:b04:858e:c1ee with SMTP id a640c23a62f3a-b1bb5e56d90mr782962066b.2.1758210770121;
        Thu, 18 Sep 2025 08:52:50 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b23a1227bacsm60449766b.41.2025.09.18.08.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 08:52:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v5 5/6] ARM: dts: imx6ull-engicam-microgea-bmm: set touchscreen glitch threshold
Date: Thu, 18 Sep 2025 17:52:33 +0200
Message-ID: <20250918155240.2536852-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250918155240.2536852-1-dario.binacchi@amarulasolutions.com>
References: <20250918155240.2536852-1-dario.binacchi@amarulasolutions.com>
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

Changes in v5:
- Add Reviewed-by tag of Frank Li

 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
index 279d46c22cd7..f12084d8f2a0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
@@ -154,6 +154,7 @@ &tsc {
 	pinctrl-0 = <&pinctrl_tsc>;
 	measure-delay-time = <0x9ffff>;
 	pre-charge-time = <0xfff>;
+	touchscreen-glitch-threshold-ns = <62000>;
 	xnur-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
-- 
2.43.0

