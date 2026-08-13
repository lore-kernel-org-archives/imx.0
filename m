Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6F548167A
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 14:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786629967; cv=none; b=fwOZ3bMN1VCHTIDWGsApKEvl5Unf8RXJHFmp5356OlTN7YiPR0DRl7e2y3ROmukA0y3ad//QoDmBC5tIaEOIl1gX2OoKjcsS0w8kbf2kxFa2M+Syw36K71SaoSQKDmiYPuzcoyEkVUE1h5+n5LiYcbfO6d2lZ4UtUvsZRKqOlX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786629967; c=relaxed/simple;
	bh=bEcIOZ3o4/YBQO9AvFUt5JfjZrSfxQHFfPTUj3NXnoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DAMbEkEfRak/I94N9w9XBh2wf+FJiO1X6qQUsbJfR20v896eD5qO6g8MSON+HlB8aUIG2ybUPd+6wbipvwp+mC123+Qiss5/WaWgB4QJtREVUA0hcQYSLKae/VI5TBVxf5uyUPjDZsi9wVZxfoCSPCJh6Fppj9HL68OxIxk8cyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DlcKPYzQ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DlcKPYzQ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-471eeac43bfso667858f8f.3
        for <imx@lists.linux.dev>; Thu, 13 Aug 2026 07:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786629963; x=1787234763; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WAHvpFbJ0JtpWCk4HMUeYX5OKhCmyGZq7qNeYbuxFvs=;
        b=DlcKPYzQyRXq5Qo4R/JwvyoBd1EbY6O9ZV++DIHpYUzlUeIgiTO48cDJ11L0W0Ffrx
         LXxhfirzTxz6fyk8kmXXF/YFb7R+VC0EgnhBImkaocOIw50yEsw4F+7iwNx1vwH1zHPh
         fPdvuMlwXcyeYovJw/caaHE7qKkj2J4XWuDNh1W2MOsKkOoyARbv0awbjsZaccMvLPdz
         +/xvUN4NcBZTEYYUCZfSAbSyjg9rHmx1GkkwE13HEJkhH/0vMN5hT4dvAvbomK3tArkz
         fRAEFs1aFpgQ2qIx2xXkZU0ENEr+shAWXPDzK39hB3ZDKz/1K7BpPdoKIQuvBw/E9jVQ
         XcAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786629963; x=1787234763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WAHvpFbJ0JtpWCk4HMUeYX5OKhCmyGZq7qNeYbuxFvs=;
        b=LmTpTfp7jEvLVWOvSnkpN8me7S5HRodD7+lB/YvtBpbn9JlVXpVbwn8Gr/rzEGOfpE
         ylJFHll93a51vm9ItHXZ9/V+G54x3VCx2PcuugGgCzlNWv6pHbXlesxly+bG4WOlI1hC
         1nU/MmTROhwKFMjACZaJlfeMyx8bZuFuWNt1YD1OuIukv7aLw4iOVEE0Dy19AV5ESFAK
         72mh6Zd6hysEKrPqUEX4s6JGhg5U3DQwqii/EoyYf3uG7bMaWlNSjLFiswXZ2BCQjtG2
         M+XzizteQrfg4rMIzzq+yxfwbkTwEroLNiU3F09UhbMh+TUmPufvEg+j/kRGHLyAyH1C
         MIwg==
X-Forwarded-Encrypted: i=1; AHgh+RowtYVjHuOKB3bokpzKIGQGIfYi+Y1852vMGj4HfiD7cevLk/beuEGTfRGZAVfhYPmzHnA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzfrmcyqpZ6LpwNrlwJU9/l8Jlwocw4HdqGurjvq7m6DDKLRotU
	xypNlVFotjZkm8MgvuoX2tehQy2juXKI3MMqBnY8UBim1T9ub40RHQcF
X-Gm-Gg: AR+sD12Em+EDDNOjDrziQGddkaA9n8LR/lo0awh+7GXrTjIH0Ub+/lL9jKQYbto5ABc
	HDrV23ldI8/MslVGthmLn0lhNHvWnCOkshFJEUDiiN6VVKOSbTAtZdUWATkTdTPIEotibsSpPoA
	fNTD78+Q9brOmIT0cKeSrH35VIflo22/5W/7fl98lkdKXobiKUaH+TN9CwHtTmvTN2fg7NnzqUc
	UqXSakjcvfU67rX2lheGcLBneJdG0NQyyyb8L0FtTj5hMrkxrtbFIF9oH8sXSSblPMTTpN8P6ur
	i2jnkZjGjYa7LYyo/w+s/gyqXecFRLiRmYHaWJZGGw8g4/KfM6pnRejH0XUh6ZhnOUaxqYlz3jM
	5QxyRjzaaMY0FOjm21jLxXgNZiRpnzrJKuTNwp33AfZWca2uJ7LSCTUXxbJ/nWkaD3zDsR/2Ccp
	DYcRdlkvWYDpTIOl6ND8TaKKDzotR3QU16j6u2ZQQ2Szhfmkfc0vdSQi8v4ND+j9bMRw2KEM+v4
	Q1vNizWO9sUhi7n
X-Received: by 2002:a05:6000:1844:b0:47f:e8b9:8b60 with SMTP id ffacd0b85a97d-48159ccd2damr8227155f8f.6.1786629962866;
        Thu, 13 Aug 2026 07:06:02 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a5af191sm6690190f8f.19.2026.08.13.07.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 07:06:02 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v3 1/4] ARM: dts: vf-colibri: apply the EXT_IO pin group
Date: Thu, 13 Aug 2026 16:05:57 +0200
Message-ID: <20260813140600.1824949-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260813140600.1824949-1-mehmet.fide@gmail.com>
References: <20260813140600.1824949-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

pinctrl_gpio_ext describes the three Colibri EXT_IO pins, but no node
references it, so the pin controller never applies it and the pads keep
whatever mux and bias they came up with. It is the only pin group in the
Vybrid Colibri device trees that is defined and never used.

The three pins are GPIOs on gpio2 and belong to no device, so hog the
group on that controller. Referencing it from &iomuxc would work too, but
the pin controller would then depend on one of its own children, which
fw_devlink reports as a dependency cycle.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
index 98f9ee1b0030..74afc7b0d74b 100644
--- a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
@@ -170,6 +170,15 @@ &usbphy1 {
 	status = "okay";
 };
 
+&gpio2 {
+	/*
+	 * EXT_IO_0..2 belong to no device, so hog the pin group here rather
+	 * than on the pin controller, which would depend on its own child.
+	 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_ext>;
+};
+
 &iomuxc {
 	pinctrl_flexcan0: can0grp {
 		fsl,pins = <
-- 
2.54.0

