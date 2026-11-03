Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732348;
	b=caFxNQufmNGiObSR5qFIaHEq6TPQT/Wvwe1eyTCuIlvyJU4QFza/xFJGjP4V56wnbLgK
	 g3Qgn03fYtFrDMVA/ru2+Xg3i1yZ6EwSJvj+6Q7yszJWV6ULKxiIRra5VhQLLFrovZ+Gd
	 L1Ujm8O3R19ltoIluRfyGfKvv2EdM95sC4JreWCNpfAZjHeNNUuqfmiJ1XiK2ssvwCCFq
	 g8KIJZd+pBIeghaY40agnwCgD5W4YpkkeqnzuS8lOiqlVN7GjYqR8Y/ftcFLOaJ+Q2M4X
	 OuKXhvitZOIH1cQcXC2/dhnRRpkz+3n1TAOOaGH62fSfkkxXUkrYUuFPXXAzeB3W+GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=J7X+N3b/Iozr8Iw7Q9vLqcq+wqZH/CWnHiKVeMbKEmo=;
	b=bwRILyHLLtVUbpja9KfKZ8JRYNmzYApLwUZ8bDM0nmaSwDJxgeqjUrUjslgGBGitb9T2
	 Ut93BmtyNX5+bnQ3+CF/Km/KMlWGM92yWAj3o2q1JuS5Xedto3SI3lynzrDT//OXocVVd
	 6vMg7RusooJ6EjtcEkUUH+na3sH9i9f03VBJpQIUHR5AKlyTMp7azCVi4KjxdFTXo9uyF
	 Fp2BXBxrVYxnVh+gXhcSNS1jAYUmeGSbWbEPOtj4UN+LoGGqNCrY7aGDAkJqr6HjJ472p
	 rWc7TFgdW0vwwq+WxBb2xJZtjTV44oAYNhKKf5qxXD2O+5J4fwrXakWh4iwU7MvMyJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YXYDOqR3;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE55606A31B
	for <imx@lists.linux.dev>; Tue,  3 Nov 2026 18:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFE55606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YXYDOqR3
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso7522331eec.0
        for <imx@lists.linux.dev>; Tue, 03 Nov 2026 10:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793732347; x=1794337147; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J7X+N3b/Iozr8Iw7Q9vLqcq+wqZH/CWnHiKVeMbKEmo=;
        b=YXYDOqR3YTdWjVjMiPqhMmCqYc/01K0PVfuT0MGChqZe9l7AweO69fkSNMx/9KMTE3
         KDn90CTQ8H/P3GB0Nw8wvWWu18E1L1kbeanSnVSOjen1TLCZGEfpt/8cCBR6DfejvXKD
         y6syQk1Le3oFzhMwsJwPM5RHAosnmsomfnPRXyCKE06jn2LBpK++90DvFyqZLROXzyJI
         FDBGusogPlLdXGGYNa0wxHPIenvxGmSJMLkQEV/Lf3Dlnp/Cg1MrDkjgdnVNYTf8f62N
         OHWgJgqg2+c98A67ynn60QZve8Fwy9qy94fJMCSqRQTKf1aee9h77hegeiwBGwaIhAJb
         Fnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793732347; x=1794337147;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J7X+N3b/Iozr8Iw7Q9vLqcq+wqZH/CWnHiKVeMbKEmo=;
        b=jU2edUIvVJdPupyIjsCKTD7pG7CeLslpOFdwxJbY4fMiMgsMHlnKMXETAScls1uHAA
         fICj9X+ZxoVM4I9Xpaj0So7eW3TBo8NIQ3qiQ1VpMOcsNDko6yMwK56lavV2q3Au0JwX
         HgaSoaraYQ9XsMQ9GxLboH247cM8OdJHab169pR43VuW/J8at3kXSZEEH3FtUt8MOZtN
         5b5sZ5wqTZK7rZS/uS6mKJznJAStseT22/m/eBrwptRHGggORbDTn5hpJ1dBAV+ulipY
         b5wglaRsZv0TmGAYMX59clw22xHBTEhELxZ2FTg/CUzLF+BiUP1QTMi+0T0ZQwpn2mJI
         dPKg==
X-Forwarded-Encrypted: i=1; AKwUvBwLWr7xX+cOw3SsW5jVGFCBmPCVNCRfJKw+TA9rC8P0ynmmVjT2Fwtwv36mEqOkoIztvRA=@lists.linux.dev
X-Gm-Message-State: APuU4Z/on7XnFf1Ic6eAczb6OnbpV/jG8N8tgXps5+CXm++Izj83uqRp
	Iygh8UGHQTQxmJE0zLPCVVGhj8cxZ6W43evLTUMEWDYQwlpjh/n1NogV
X-Gm-Gg: AYBFou33OSKvlFQdiPytdNSWVWMXoZa9WwaR1mGOaplhsdlnSC3oHEqBrJMm0KqpWjr
	DKRQIa4EbCLKoczpc8lzInkefFcJEy8fmKhDbMQ71c4pR4q9KAUp8kw3VVtba0ovlzjMC0rXnWt
	x2m86idQNlFVmLX9UuyMspiTTlPotpxSfg/YHJ5/gmFm63URrOBMmByyEamJro79QCqKxQTMfXQ
	FkZQtIWFA0/Lyz9+2wSGLS4Vli3RVkijUVieuGoGL6AAnXKa1lS3+ukKWzIuBiONEUbMtMGKnN9
	prMyGTTuiCSvsB5xFqv+HaoUVAPeyynTzhj25q5f8w6IM7N4mYfn8lsDmw6WP9FIKAYKp2UiC5N
	XSFqfi0/gmPAWoCyVAEFXDb53fGtg5lADx4pA4zrNThGFAH0itJnyH98BMt0YfMPGdVXRRXSA+z
	O7VrSBZ3PHinBGhFTdVbgakCdbdeYsIxTud7kyks7ThRlGekfmeIg/puzG2OSf5qfOh0Af3wx6j
	7jYPSj33w3q/OkhPA1vwk0k0hs5imgpIyonaU1BH/R+U7kJcmMyghFTO4+eaNu/sRVhr7MByB44
	AGnGVf38OMwRlZ3EbSmWvGE6ldH9kXxKQYEYdPS6bZWThf6zoDiYvMUjz/CbpEnYNQJA
X-Received: by 2002:a05:7300:7b81:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-36a42431768mr30787340eec.28.1793732346941;
        Tue, 03 Nov 2026 10:59:06 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b3b7esm49159eec.28.2026.11.03.10.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:59:06 -0800 (PST)
Date: Tue, 3 Nov 2026 10:58:59 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, 
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Lee Jones <lee@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Shawn Guo <shawnguo@kernel.org>, 
	Chanh Nguyen <chanh@os.amperecomputing.com>, Alistair Francis <alistair@alistair23.me>, 
	Julius Werner <jwerner@chromium.org>, Paul Cercueil <paul@crapouillou.net>, 
	Dmitry Osipenko <digetx@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Ray Jui <ray.jui@broadcom.com>, 
	Scott Branden <scott.branden@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, chrome-platform@lists.linux.dev, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-tegra@vger.kernel.org, mfd@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Use hex unit address patterns
Message-ID: <auou2CBiiR6zA0G0@google.com>
References: <20261102135330.2493332-1-robh@kernel.org>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102135330.2493332-1-robh@kernel.org>

On Mon, Nov 02, 2026 at 07:53:22AM -0600, Rob Herring (Arm) wrote:
> Unit-addresses by default (and most commonly) are hexadecimal. There's a
> number of cases using decimal patterns. Fix all of them, limiting the
> pattern to match the 'reg' limits if there are any.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/display/xylon,logicvc-display.yaml      |  2 +-
>  .../devicetree/bindings/dpll/dpll-device.yaml        |  2 +-
>  .../bindings/embedded-controller/google,cros-ec.yaml |  4 ++--
>  .../intel,ixp4xx-network-processing-engine.yaml      |  2 +-
>  Documentation/devicetree/bindings/gpio/gpio-mxs.yaml |  4 ++--
>  .../devicetree/bindings/hwmon/maxim,max31790.yaml    |  2 +-
>  .../devicetree/bindings/iio/adc/st,stm32-adc.yaml    |  2 +-
>  .../bindings/iio/adc/st,stm32-dfsdm-adc.yaml         |  6 +++---
>  .../bindings/input/touchscreen/cypress,tt21000.yaml  |  2 +-

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com> # for input

Thanks.

-- 
Dmitry
