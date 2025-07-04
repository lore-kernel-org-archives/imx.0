Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6B02ED85A
	for <imx@lists.linux.dev>; Fri,  4 Jul 2025 08:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751618578; cv=none; b=twGa1WQe5cg3Y4kDdrUrQfyEQd2sgNrPI+WUaiwjbTaFp7v/5IX5ZbUMKxOlkmyvdkh7K6qkswtU0tVHIAGz2UkZUTEENUd6KicNLIHReIQ8YwfljlHrBjq8XiQ7pyUpoerYO6FY113VX4QTuHznDuICM07sx4g8mwMPFMtDfm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751618578; c=relaxed/simple;
	bh=XWPuLH+r945MMXMKIDI54FYqxlY/reitRUTj8Ejgnuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d8/c/LSPxPWUp6SIBMSgu0isvlw6X8Sb2+X0kXBtJMc14om3ZfCM1dZ7nvRxBEErjmU+yVh92t5wQFFaAIDbfCiAS5pRRFHJ/7R5COs2MfO2fFHKEJGGmGq9F96iQsdjbLxsZo7JDXHxLSQgqa79mu+2HBkR/jE9/nUHZssOfts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fjTWaIMa; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fjTWaIMa"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553dceb342fso732251e87.0
        for <imx@lists.linux.dev>; Fri, 04 Jul 2025 01:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751618575; x=1752223375; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWPuLH+r945MMXMKIDI54FYqxlY/reitRUTj8Ejgnuo=;
        b=fjTWaIMaydhQZiaFpnlwhMBwWy34hy2r8kDoGIjI5TIvwIxEHUSsYDuu7LyNanyyV6
         CCwbjuitrH5n9VkZZP5PoIw3/2DhX4AlnLN3emQx0jXk73eY/AUGkLA6MEov9GqNNrTP
         qk4YB3fmdRMG9i8OJFcg1g4fsXdK1NwQ4jJzTQcKl2i4UUBCoRO8/f+2XMPMMQXbs0+n
         qiHW9+EfoobWP75XOTGpVWEX5wSsqVUuzs99cyWbYEWUO8RBlTYvU06nyQhmciaw0+yI
         qF+CXK4ODg+nt22/a7BS0WgyxnaCJEJMoP8LsMYRD3MBURHpeE71wyh8r34i0rg/tVPW
         8PWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751618575; x=1752223375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XWPuLH+r945MMXMKIDI54FYqxlY/reitRUTj8Ejgnuo=;
        b=GP6OsR1dRN0lm+fiHwZTWZUh4B9VhPjSGXNyxygEFccjK6dnCS+CDqLWUnlhZoFP1N
         QloD8t3L7brT9nuZcaLaHE7vOLP83VggCndn3p3kUVPXH3R14dwKVZUm0oqJYmdqQjM/
         cRNSc5vOLbrhjQhGzNt3S+WrXIl5W+0LehYPx542/raLa1Dwme2VCGq8IRcnn74/liH/
         8pmRO1JSkZuLAd0DT6+XrmkoazRdiFcllDyvI7VecUgIFRQQLEpeedLdQpPtt3C82a6g
         r+AtRQeKjcr0mDFSEMwtgLZSHgmhEA3Z3YD68Zk68X0hdTUzmTNxzAP/PgMj72JJlRmQ
         cCCw==
X-Forwarded-Encrypted: i=1; AJvYcCUvDARP4eVbSrm8rXa6GdbEg9dHyPt+IjbB5ZYlSYIspifmtbmWtdqlQCBT1+ACksW/VUg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwGSpF88AJwbXbkv5SbVFItw9cTWDDNz8QRjfZxFGydOI8p3QIz
	l/t9XdVutN/VaFOQXWHCriT9M+TEOt3p68Clc/8BvTkuH3Bqz3OFiK1oYN8pQWwzOMOnvlawzgp
	na3MW9Kt5+zbUFL+htdyMYHR5Iqeuu6jgK6ZGH8ZGGQ==
X-Gm-Gg: ASbGncsWHDFKoLi9k2f/HAoF5hnTDXw5aFw0GZiz9rZC8aXtuhPMQoL0I7pOtGOI/7p
	8iAmuVyIQGrx8PO5wZ1QxjeiHQE3vTWhPeNgNrXxzz5Q4SXpCjxkBTaqcQJVxjatv7F//XxM49d
	nWIScNJxHK3HjcPNr+z3AeG7HE+weiOb1pAV+mRuCJ3Ik=
X-Google-Smtp-Source: AGHT+IGodMjqDkDesQdG4Hjakhr0TOM9xUbyJgILsRTpZGqTHkPFTfySztIXo8nEvUZyWt2JWT7aRKctMeet0pwrsBw=
X-Received: by 2002:a05:6512:3e1b:b0:553:35e6:393b with SMTP id
 2adb3069b0e04-556e684bda8mr524787e87.45.1751618574621; Fri, 04 Jul 2025
 01:42:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com> <20250704075420.3219092-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20250704075420.3219092-1-sakari.ailus@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 10:42:43 +0200
X-Gm-Features: Ac12FXznXJQ0ImElx8AS_65o16qEpHJnw8V0OHvMEe3Y5zyTtUuH2rGO4fQjXsY
Message-ID: <CACRpkdb8Z3oLwmB26q1xdHMwa2xTm1sz5g8_a0BHMK8oHsiF1g@mail.gmail.com>
Subject: Re: [PATCH 28/80] iio: adc: Remove redundant pm_runtime_mark_last_busy()
 calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Cai Huoqing <cai.huoqing@linux.dev>, Haibo Chen <haibo.chen@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Marek Vasut <marek.vasut@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Francesco Dolcini <francesco@dolcini.it>, 
	=?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Mike Looijmans <mike.looijmans@topic.nl>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Stephan <jstephan@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 9:54=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
