Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFFC20485B
	for <imx@lists.linux.dev>; Mon, 16 Jun 2025 07:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750059783; cv=none; b=bZElYXSagvxShvllc4v9P9ck5o2Y9o16vKeEpIvI4Hr1ApeQYMKVXC8NepItlEN0wGC1ryOEVByp+rkJEBOpYroVUZQKkVMaCQ/Z+dGZjWAaxgu4DA9BFIBEndZnuG7PLO/+n2gs/Wh7T4d6QN+VyCe4Cin9BLSFCF4tHkoBnxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750059783; c=relaxed/simple;
	bh=XmwoZ/1rXiFFhp5Ery36mi7aKpTwkqPeml15koxIPs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LyoTuwAAcpHjWk7HDmocG0Jwoqsly9tLX4gbA7Jf4mmdfGp0hVgsG2fM3u1a7K0cEinGQwNa1TeLYsoqg+0r82QCjhuaWmf9XvuIBOgDFZmYf/ROfr4Oh8LlvXaIkDGt4lraOhnn/wCy1TORbuyVO42lZcSY7N3AyhpswDhnuqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lR0fAfIv; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lR0fAfIv"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a54836cb7fso2776297f8f.2
        for <imx@lists.linux.dev>; Mon, 16 Jun 2025 00:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750059781; x=1750664581; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTU9Zax5kLpMeKPmyeLAiww8adzxErGgDJ424AqFWP8=;
        b=lR0fAfIv0Mdh82AvLufGjN+ILB0KZ+Zqxk1LXzG8Y+XbOWQVoTK2EsURSClMdw7Xpw
         6eOfBdB69gJFwcdQvzdxrQYWsBLHsRtk3MOoOQeWMLI7MOCHPMAcJguERaNz+9u3KRL9
         RDcTG54X9LdzgnAGQPItfv/sb8AJupmkHmkWVOjqopHOO/7+6BbXN69fd1mrBcA8I4F9
         /r3EzzhjppiFORwUvarRAk6d6rD1nwf994UpHH23Mx03ekHlL5bJcQr2vQuhRLQvgx6A
         96q9Z+x8h3MK27l/QLy7TeLjN73DE+WRPyMMGLnkZAxQg3330IrL0jImd5bqGvpbaXdG
         bTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750059781; x=1750664581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTU9Zax5kLpMeKPmyeLAiww8adzxErGgDJ424AqFWP8=;
        b=J/jCPQPeY2Fo3tO5aS2q8H47osGZ6fW2eQzlJOjxrdls8Bq7qXpnzc0Wl+RsHXDwY6
         MtCcp9drCFtVwDv/xEEx795wFipDm65i8dxh6acGFXEEQERZswt4g22Pp7GSKjuS2Xrd
         9u5ihgk6wTzNqNwfExDKD2e2bllndFPj7IFKMlRn4uz6+zYJi987QGiLCfo9qSv9ua8O
         OLBhX8diaKocg5a86O55ypIP7K3mqe4OZ23ZhPeehYLptCTc5lgarUcuVUXolBvOdkMD
         62UbtQy5BPtgJj5Xs2bMljtzyjlvoWKwdwVacbxZiYiDcTlZV1+SYA16JJbR6kujbvnX
         Rffw==
X-Forwarded-Encrypted: i=1; AJvYcCUFBooftayXlbN1GD2awZE8L4BLbd+pABMrATQIG+Szpmeyx8vhpKUU7AwpN1kp92TDN/g=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyf8WzGJLsG0bjwtTEU2cWyVc3pRBq8Z7N8u/xpRP33RxJeQEM+
	s75hzMakvbHjMHBrMn7KFnANxpYYYRhhrOMKoCmuDbg3xQbDxh5k3Tl0DsOjw0Avh8c=
X-Gm-Gg: ASbGncuvJZzpHaSlp20P51FFqg+eN2MEGSiXzSK8Ggmom302o760dphFhhZmGLadaWF
	YGfodMrxr5c+p4i++DzXAxEEnPrY3ghgPlonYHQ9OkwB1RogW/grCHIi2bSvUuzDmpE+80yQini
	BXBWt+XtvYDZe/GKi4ywTgNa3zoiF7kTJkcqBMfDtIMHv499rzaqRlsnUowHWM3XnjBe50J1qbb
	+zabQ1IUPHyW7agze9gJTqSsCVZ36vTkxhRTZfyFV2czX36WGGTB38sL1Srr75r+/LivA6U8N3e
	ma6zZFOdc5dCc/R2dkaFavKJXWqUzIuPNazoqmaLW9tjD1Nm2nBLxs0O96p3heI=
X-Google-Smtp-Source: AGHT+IGNJS0KEiSwDJqSBbXx8uRkNhJkRtvXE4ajBKXtNWO8NPC5+V6AIpPTIVHjojheL91aJSa8eg==
X-Received: by 2002:a05:6000:25c5:b0:3a5:26eb:b4af with SMTP id ffacd0b85a97d-3a572373c7fmr6714675f8f.18.1750059780880;
        Mon, 16 Jun 2025 00:43:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54d1fsm10151340f8f.2.2025.06.16.00.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:43:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	tglx@linutronix.de,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Keerthy <j-keerthy@ti.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] gpio: Use dev_fwnode()
Date: Mon, 16 Jun 2025 09:42:58 +0200
Message-ID: <175005977568.15490.4738567496048769972.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250611104348.192092-6-jirislaby@kernel.org>
References: <20250611104348.192092-1-jirislaby@kernel.org> <20250611104348.192092-6-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 11 Jun 2025 12:43:34 +0200, Jiri Slaby (SUSE) wrote:
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
> 
> So use the dev_fwnode() helper.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: Use dev_fwnode()
      https://git.kernel.org/brgl/linux/c/7b2c2f1eb3914f5214a5b2ae966d7d7bb0057582

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
