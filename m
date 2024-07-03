Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC4B142E77
	for <imx@lists.linux.dev>; Wed,  3 Jul 2024 09:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720000760; cv=none; b=g7ix4iNSfByN5vOBlF8sxC4cePuPyslFm0BCzhLiTPZByULMmh+dgJKfq2sK8cbGNxUKn98hqQXWooQDNJdOgnWSk6QBpHMq4ADK+VD142EbJCb9LwpiKCIXAleHszvfFE0/Mhhd4tKfDjEf1fm4HGQWcUGylaAAtIGxNbhldoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720000760; c=relaxed/simple;
	bh=sGAtnatO2J6eXqeP28h5k3NsoxK3kBN+dN2HTxFUaNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=chahuqbNIcFwf8a1A4ysKL0HnCmxJK7E8/pJJJNr0tWbw8RxbiBkxcGrl4qwmw2ob5Lu3hK5Otr9D5SjMBo7LK9wbIj4+tO2LobOMKoz1U0WbMDnT7x9Wgp7Mq+zSuzDpDNG4IHKiX1DqJGz0xGbINk8HdfrIPQcXQDkFuCwujM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=leZufEjC; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="leZufEjC"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4256aee6e4dso37599345e9.1
        for <imx@lists.linux.dev>; Wed, 03 Jul 2024 02:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720000757; x=1720605557; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXjn2sMkd3Qhei4SC2lgBtREpiH+FC34ffCKLhev/MQ=;
        b=leZufEjCMePjUGShwDT1Sc27+8TqK29lTQL126HOvqoGEujJCE9r5tiSnmHi/jDg2D
         5EdEZ81ntPvm1y0o3ist4RHCqTgfI8uWlcCTkXcBolhf1jmj/MNXGUi1FeApdH1/aE+g
         23FFiqKiDE44JU2otT6IG7woXZYBR0teZmyC+71rdYZC0LOY6ZYSpdv7Z4MkrdlKxWGI
         sRkQw3/UwbgjDVvAUQoh6Dl528CYTxV6yiCfnR7jgevN5bBIHOBG/CkwpMQudyTmQVA/
         v692YK9RBXsJ3Kf4O+VQmPKpVN6pDRm3A+SOVFCWK0u3jNMV9V/7Cf0Ro9iHP9SKauwX
         BRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000757; x=1720605557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XXjn2sMkd3Qhei4SC2lgBtREpiH+FC34ffCKLhev/MQ=;
        b=iWuABl9/LOj1mVoUySfnBp9c+ZUhDJWcCQw9xlwnFwH++qqo36LkEJaPa0+eqUPHtq
         U7DYqJEsYBsPo786arxz0gmSRU1rJuqNxk8wm7qRELdyAeftRrkWwPD0laq1Kh9y++bm
         EwhX8/yeNpuZciI0E1efhSeqEAFSfzMkM6LVEFfmOk7dexzaZ9mRpgVGe4W3/wbQ9ipb
         GLR2uM/NnvL3TZach49xCnGjLgo6CsJ4B3vLFLVElgO+fxjGbV8RqQtafDGudDbf/6zO
         ySg9VGGtIEy5jXK9W1YLCPhQNApvjEVhj8Xs4kDn1rHmeNLdkdpQ2PG0T9PgO1ohbCgI
         SFHg==
X-Forwarded-Encrypted: i=1; AJvYcCWnvwOtKg3wTedEhUUOuML5F2ykfKUCFEcBZVuCq0I3DCUkzJXFxB7y83JQgrEK9x507A6l8Lb8MzTXEzpe3wG5RGUn
X-Gm-Message-State: AOJu0YzhG/lIGu6Tmm8xN6Uw/wSJCijd+yXWrUhCnB3fzrghIAY0IVin
	IOVEygmOmrSvJFFdcxC0Z0rCDmDFzrTYM1voV3dtV7EC5+Y4OS7P+WvwPlq1sGI=
X-Google-Smtp-Source: AGHT+IE5t/Pvc5a0A5rMnsuOFd3tzIXs4aS23G7++Z5PDz6z4fb8QnIv+IEonyMakOI8QAVhkpkcDg==
X-Received: by 2002:a05:600c:1c88:b0:424:ab90:ecf0 with SMTP id 5b1f17b1804b1-4257a020ecdmr79604865e9.31.1720000757100;
        Wed, 03 Jul 2024 02:59:17 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c37f:195e:538f:bf06])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af376f5sm232858195e9.6.2024.07.03.02.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:59:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Li Yang <leoyang.li@nxp.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Robin Gong <yibin.gong@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Agner <stefan@agner.ch>,
	Frieder Schrempf <frieder@fris.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Bo Liu <liubo03@inspur.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Fabio Estevam <festevam@gmail.com>,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Joy Zou <joy.zou@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Mathieu Othacehe <m.othacehe@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Tim Harvey <tharvey@gateworks.com>
Subject: Re: [PATCH 0/7] Add support for Kontron OSM-S i.MX93 SoM and carrier board
Date: Wed,  3 Jul 2024 11:59:14 +0200
Message-ID: <172000073641.11832.10658723886073687420.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240702103155.321855-1-frieder@fris.de>
References: <20240702103155.321855-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 02 Jul 2024 12:31:12 +0200, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> Patch 1-4: small DT binding fixups
> Patch 5: board DT bindings
> Patch 6: support PMIC driver without IRQ
> Patch 7: add devicetrees
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: eeprom: at24: Move compatible for Belling BL24C16A to proper place
      commit: d83c217778e7425d10105001150c5670e07f88fe
[2/7] dt-bindings: eeprom: at24: Add compatible for ONSemi N24S64B
      commit: 3a9ba4e32230df6c48cda1fd5cbca6facacc74c2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
