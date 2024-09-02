Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E312187329
	for <imx@lists.linux.dev>; Mon,  2 Sep 2024 09:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725270567; cv=none; b=Jf02mifr/QwZelhs0qqApE+KPrnl5JnSNXQLAe3dMa9QU0VccwPVv9v+4qaFwug2ekc6lv88dtz/w2pxDmuaHGCkyasNJHpg6bncpyLz2usJJoYJ5Fd6JJSAMySeFsNyN2s1B2VVHUBsVHhrcOPXmevISsoEQ5ogQWQ+VRigDto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725270567; c=relaxed/simple;
	bh=5pbRVwtopQ6d3wAPmWATKqqvjPzTOivIPDWsPsi2O8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YQP7/1ckUo6jPXlQ9Drof3kmwYt5rDbUpBGpkYclvixNv5liYdK8d2gV4QUA3LWSgy5uuQNBwrEpEcMhNw8+efQfObOCYcQ0IW0H0ZZSum3DPC6js3cOCXeF0XngT3Ovd4ggMeoryNvbzy2FY6ToXpHdyLS5hRhkvOkHRpELSwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ArZKTGQS; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ArZKTGQS"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42bb7298bdeso44717675e9.1
        for <imx@lists.linux.dev>; Mon, 02 Sep 2024 02:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725270564; x=1725875364; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZJOnRKxxutEChlIW+5PAtmNmotUPz7eaFOc9n7zpMA=;
        b=ArZKTGQSPN6qmlPpxoCcGCnFVaqWgHzrFFJeAkghtNRnQlC/2zGUyiWSv8754F2IZb
         j3tsuNBLe1egyTch9D9h2f6L/Z9ZiYZl559SmEQyz5RskcUf6AyqtdaISWiLEsZuccja
         uv6u4z6xR6UeUMM0x80skWyYQFj/yUP/WaoC73oNJV2+AqfwQOZVfX6b2Inuequ3+z8m
         4sy0/Go0AbE7INjXnj2NTtr3NOpjKFbZjl8VzmEL5+qoa+mL82y8Sr74HggfYsJsiQL0
         4ZaXXoVgAU93G7EqbWf4i9VLePVTSFumEYIw1D1PlzDhEOA9ZEFVeOic1KkPluEY4gN7
         SJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725270564; x=1725875364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZJOnRKxxutEChlIW+5PAtmNmotUPz7eaFOc9n7zpMA=;
        b=ZHhMSkI1Z/gAeCYTjeIuigicxTPHkLanOEt3fz0UC9hXhw0ASK/wMcj90e/oL4iL7Y
         X2f25kbz/UNnz6Ed0ggu6WJ+pM/gmyYl1dZFWztBgkIfxNH3b0WtNoRONkSDFN02Tr7i
         Pi0Aok2q7JQ4AVPb0WLgmt34cJpDgRBe+hnNVmpVNZCZEdH8vu3Lh/8N2nOM4TqR0neJ
         VlB6bm0HXUgEihorpO4MRl28kik654vLs76DfMjyDwkN/BEcceYa8L7HmVyq72rA3v4K
         rZEKre2x9u+4HPxB8gpS+QyZ/bZWDo5UWtTZBpv/a4et9x5usE72okgeKoa44Ck/VkLp
         ePgA==
X-Forwarded-Encrypted: i=1; AJvYcCWsZ41klTUDktU/nL5M9nE6rK+SEh/qlg/WaJkw8TU4OJ4/JcdbZbsk/cUtKEmwXz7GGJI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqHl5GlF+8sx+GxtYbylhNPaDJkw+Ry7Exg+kkqUsp/WXNPjpe
	OMmi0Er5Z0U1ygpaYt/9FbZ1ZkHuYgne3HKlIgHgWlA3QS1reA+6+Y6X1lWjPNQ=
X-Google-Smtp-Source: AGHT+IFPE9DrSMLqeufhX66yLGT0OKavBe2zcsQBz4ANdf9tEN6d/UmYFJCTb/y4f/xkAno+0UHlVA==
X-Received: by 2002:a05:600c:1548:b0:426:59d3:8cae with SMTP id 5b1f17b1804b1-42bb01b9302mr119554325e9.13.1725270563591;
        Mon, 02 Sep 2024 02:49:23 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b496:9e67:73c9:9f5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df795asm131691865e9.21.2024.09.02.02.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 02:49:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 3/3] dt-bindings: gpio: simplify GPIO hog nodes schema
Date: Mon,  2 Sep 2024 11:49:21 +0200
Message-ID: <172527055993.21602.6768562114748623429.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240828-dt-bindings-gpio-hog-v1-3-63b83e47d804@linaro.org>
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org> <20240828-dt-bindings-gpio-hog-v1-3-63b83e47d804@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 28 Aug 2024 11:35:59 +0200, Krzysztof Kozlowski wrote:
> The core schema in dtschema already strictly defines contents of nodes
> with "gpio-hog" property (with additionalProperties: false), thus the
> only thing device schema should do is: define "type: object" and
> required "gpio-hog".  Make the code a bit simpler by removing redundant
> parts.
> 
> 
> [...]

Applied, thanks!

[3/3] dt-bindings: gpio: simplify GPIO hog nodes schema
      commit: 98db29d1b4b7b1fe9b54d11e66a396fc37a73c57

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
