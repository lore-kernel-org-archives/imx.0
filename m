Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.92.39.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793846397;
	b=tzCFWETzYuAgpq/5e/tVkLRW4gcIpJYwCuZncd7Ed4ZgT2V8Vms0yyClgOKf1kBjbahl
	 0YTjNHLfcGnSfzAHfwCVz2NY/gPwcAF3p16+9VKgRehHIta/ivQnS0s2gK6I/XlZezfVb
	 lg7yYUH7lqOic2vvDh2ffy3hERnwIn13PWgNTQfnWWDtlY7lmLltPz3CcB+yBex97utJw
	 EEqp4vaJvQIiI/dJw/a3FH9e6GtU7dCZIib+hTGsEK23+glb9sYEA7C6wGgJZGBUW1+Hs
	 arhwMCvgFP2mESjGg70s5m0IR9czoMaFNHos2GbjBKFTi1bNiqBznrntXsymxF6H3AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793846397;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=8nHg2KK9YdUFsDyCN5OyhUk3RMp8EQBW/fDZ8x8OirA=;
	b=pNxItIZ5XrmHTZGlotcjM4XSIZoOeD356yVrxD8er1zHxXHSt9FvWY+oGUzTgrrk0iPy
	 qaPOXKrRDmC2WyGC1JjKpgD8VCs48DWxlJAJKxTX4A3G/NavmkHzLAf/X5FK9Czwro7qU
	 z+RzU1AZYgsXzv53uXhVxfo8Wcx0zE6v9ABl6SbcPGhxI23D7m/dvy4mLnoazjB7nw+RK
	 dqDwww4yUb6l1HJgC3YuwgCAKsizwM74+Dj9IuBe5vDvowqEqkxW+NFcVzhBtE08/eYGv
	 KHYZn4nSbUj6TkYNIEUUgU3PYGnlqXv7FdfdWQPAlv+RoOtHsUIJvftfZr9ERxc2E4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=CQnGzt4E;
	arc=none smtp.remote-ip=54.92.39.34
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A13606D80B
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 02:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49A13606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=CQnGzt4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793846389;
	bh=8nHg2KK9YdUFsDyCN5OyhUk3RMp8EQBW/fDZ8x8OirA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=CQnGzt4EeAAhH/jwaRdpQJnd6r1AQ8SOk2uk93YTZ3teRIvNdW4uYlmwAXhG7wYFS
	 d6IiLv4hUfLnFd02MWzgJjb2zGh1Wt6Sfa6yv9Uz/F9j7vK1vUB6thl64r+Ubn1laK
	 jfuqPzwsb86Uc9U7Je2CFhCWkO4NNj2gj/+Rzc3w=
X-QQ-mid: esmtpgz16t1793846385tcf6de6e0
X-QQ-Originating-IP: PK2os6PPFPNyqxTSJT9OBm8Qujw5oGBV636VNlPfNMk=
Received: from mail-pj1-f46.google.com ( [209.85.216.46])
	by bizesmtp.qq.com (ESMTP) with SMTP id 0
	for <imx@lists.linux.dev>; Thu, 05 Nov 2026 10:39:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8205989073931256863
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so1226788a91.3
        for <imx@lists.linux.dev>; Wed, 04 Nov 2026 18:39:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzoKXFJLcco7QnddNMQ0BXCC+DWgOkvBpmMkKLQUIN35xTI0udrNXqIfxRJZslVq04T78Q=@lists.linux.dev
X-Gm-Message-State: APuU4Z+gZFdO0qf5plr9PWb6rMIflg4XXhex+WUW1OOSulYrNTkuatFx
	Fg1BEUlhaUFASLDbkerWAClBJOKdPqjgZnaNvIfi8O0U+52bzOsHRuT31uX6R8nVNacrhNDA8a+
	t54myV1UNDbaTmREbX6OmPcknxkk1cAo=
X-Received: by 2002:a17:90b:562d:b0:3ad:a462:f07f with SMTP id
 98e67ed59e1d1-3ae8982c1ffmr16206466a91.45.1793846382617; Wed, 04 Nov 2026
 18:39:42 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102135330.2493332-1-robh@kernel.org>
In-Reply-To: <20261102135330.2493332-1-robh@kernel.org>
From: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
Date: Thu, 5 Nov 2026 10:39:06 +0800
X-Gmail-Original-Message-ID: <872B2B4EAE847E62+CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
X-Gm-Features: AclHuK-lEE7dv-iC1Lsio6aPGOufL5hgelB1hFojisk2-zoMsjC0hhsp9HraOXA
Message-ID: <CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Use hex unit address patterns
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Jiri Pirko <jiri@resnulli.us>, 
	Ivan Vecera <ivecera@redhat.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Lee Jones <lee@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Shawn Guo <shawnguo@kernel.org>, 
	Chanh Nguyen <chanh@os.amperecomputing.com>, Alistair Francis <alistair@alistair23.me>, 
	Julius Werner <jwerner@chromium.org>, Paul Cercueil <paul@crapouillou.net>, 
	Dmitry Osipenko <digetx@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Ray Jui <ray.jui@broadcom.com>, 
	Scott Branden <scott.branden@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-tegra@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MIv0RLIR86Aq5YS/uolFVjNlkPKMNwasrPyfO5e+4uD7pVxlWDzlFHjv
	79CZIvPKLPyCtB2IKsWCHBMc3vrZtj9GU73/hw3HWcozIEPwsMNIpLoqP7Y91Tx0Y3aBigV
	t0GIHlzeQ0oT7RhkWxE3yeU3uejR5O8EPrYyq+4mbPfyZrh1kZe21ZzPstmhjvgg4uhSPlx
	74829sQOs7W7SxPHygIaF/uAGCT4NXAQer/Wac8SITl0XWYULToUIA8Dn8KodH3ECEICv47
	DyU1nf8AnmRNBFn0Me5A7ACinTLbnM0Q5/YFtgNcCi7ePMueZQmIjo3XdNv0f/nMc7Wlmbz
	ugArcqoDOib7klH1gfD4Ox0aMy6NvX0+fPvW0xJmLLM/WFshOCz6hzelI85O/+Lxh1qVn8s
	6/ubCtDVQb0PrWKU7SsSSLWdiDGhlqYR7ZbB2wdVdWww1yuJle4xXO8t5WQKinUr3HGmD4N
	Z1/8ur44Y/A9KyUR73FhgRTD9Qpw0JeeN2nLtOsZ4ug2HX9PqlR9YLTpvLYtKFM+K4ragD/
	BdMe2V6tS9LgNFiyvxnLkPA23fXZUmI7hKkVdjxDH2TYmdWbCd4AvJ57+47C9uE+zKJEW8t
	sRJFPbmDz5tPV3i/IBgoTNgVj/KfVQDrQ08Ex0+qKSR0SRX56/3RuMl98VTawcg/1NtWDKo
	syhG/4h/yVVhWT48KjbpqWNbFuHZY+ew4cbo31YSFejWwjBheFbRiI8apzVC5VIXwbm8vS6
	vgPl40ZQnsEVykVnGv/8pxzlLwBAFTFmofYeqzhx8Q6QYznyAhJqpisnq3TtOn6357OdUIc
	0lUTBpOsdFNzHyEuBDYXh6RD4yMu3VOaVlOoXTaMpzdeqIo3168qVkkKjArQFMk//25ktYA
	L6yNvQFaRJxg6vYoou0t2OytlPNipWLsl8f4tO5aT9QLK2Xk2Vw5VQF+t5SYTVldf5ZeYDe
	xD4pcTX17h5ZSTJawX2EsgUHob6+BWgPMNWVP4CJWcJftBpWP9Ac2gCeFjUDkt+Xithcq+0
	EZ1zQc1Ww679PghXYaJOgtHKdlM3qhty8EfO4cQ+AkewHyzLzU
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

On Mon, 2 Nov 2026 at 21:53, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> Unit-addresses by default (and most commonly) are hexadecimal. There's a
> number of cases using decimal patterns. Fix all of them, limiting the
> pattern to match the 'reg' limits if there are any.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

[snip]

> diff --git a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> index afa551f6185f..222d70baef1e 100644
> --- a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> @@ -47,7 +47,7 @@ properties:
>      const: 0
>
>  patternProperties:
> -  "^([a-z]*-)?sensor(-section)?@[0-9]+$":
> +  "^([a-z]*-)?sensor(-section)?@[0-9a-f]+$":

Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

Thanks,
Chunyan
