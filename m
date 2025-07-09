Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EA11E7C24;
	Wed,  9 Jul 2025 03:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752033180; cv=none; b=e5biTm2H8h8fnCW/Vp5gYuLc8ShmSWwehrOM0Sr5bgHnnAQ6Z+To90ihNC62a6tAwk42KPWoe+tYvbPI6/ZNXEs9YEYN4LkJ+iMKXp4C4DJfNX5LRx9NGAHQiPQLumqme16Q28VOA0HyAigdEqVxvhdift5FFrLbW8IsTgq3Uks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752033180; c=relaxed/simple;
	bh=zgBiysRO3o5cVKKfxc6QqBibR6ZB227VIaKeujFCzLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FTdjrXqMGZt36j7alW9M1iEYbC0PEuD9PZlLD0Bm5a+DOOARVXGKNmlR/4lmYDdYhHPcderTTrUSiBqpmT8joE6rjoY0Iw+um/ZfUMW7vM+Zu+t5/IezRjx1/sKnfULDG0gudaDl/g/qNwxx5kmhVu7j5jYBbSj7zWjDA36Yrwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5561ab55c4dso5423794e87.2;
        Tue, 08 Jul 2025 20:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752033173; x=1752637973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2WLrs8UFl83Bka6HJdVR44cmF3Cl8IJgCemJs93MWgM=;
        b=U5O3mJtF7Ebc5Mtju0ezXZ2ndEayrpP8KhgEFPfF2iYBS9ZGVxaK+c3XeDM9FA/9xf
         FSxm6p8n1aNKB5ja7D8Yj4z85/NzCjo+gDkkUrSJ7IK+cRc/kuvU+qHAAhSJvjygom3j
         ufn1cjDsifdwPVnjOg/BAPJpqFnKsIbhLGprNJJOTgbtToesi9P1O5b3Byytjd+IMn+K
         xyJhmap5iY4CQYTMcIs6HDBP8rSjsjHdXYAy3lx1REcz/AFuZB7LHy8cWbdDtBInyl0s
         +SbksMeaZx1uKJiKIR/DTrKbenMxa9kAc2LGq8FtZ1yRGkJIFj50sPntoL0Lk8Bjn4vo
         zitw==
X-Forwarded-Encrypted: i=1; AJvYcCUQncWpihG3gNk2oD++bvjjGCNMJ6gcenDr9toTfMnib2vzGbPaTwePtuspj2aZZXiyPIlaf098jJiTuGg=@lists.linux.dev, AJvYcCVi4UROvT08jT3uQLfGdgrAjqH1awKms0EgBCtgEWNltApxAsAOy8emcXab566jLtT045I=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOS+NJTLX+QYdV2C/Qm/+rKtKb1oVX7L3j20U92sHbi/BCII2V
	p95NZJAraNhgDsHaEHknPgucn2rd80jhzcIYGyeB9hN+MgkDB5jPXpCIHqHxrR/dtpiwBw==
X-Gm-Gg: ASbGncvznJnFsZkVi5HXT/xWjbooqW0InXcb3ON9KaTMy4NkJX+WRwIIGbTDZ+kkiqu
	S/SRxpEChxLVSuJviqQwn/t+rbuYfweFEB7rAyq04O3TswnS62KVc3sWs7GvOWiOplZMBlG1W0O
	Ew9dGDc7QRNlD6+41KvhcQOGCkT96WWOFy+poKb7GLwtpqKt006XzuTSI0+la8FX+AU6JlWvuvC
	5ZxjWCohomPkKVzTAd+xt23UicHJYnbA7c/c4VirnAqYsBYDBkND/9K0mpQxiMEjDqLtVxhGQyY
	hCfZ1d5rX5b+aGc1XMmwTrjXSSrCHQTrxcn5mGbbNt3/IT+KVVFHhGlPtLEl4WKe06g7aOm9ckW
	pOyFb0iP/Xa54M4CQAnB3Ra2iGeFSUQ==
X-Google-Smtp-Source: AGHT+IGsERzvWoVCrT+1/pZGxVabkP9G2B2Sq4UNYjFHsmhbdFWRQDiYDWcCbwr2n2sbEpA1+kp7Yg==
X-Received: by 2002:a05:651c:31d7:b0:32b:9652:2c35 with SMTP id 38308e7fff4ca-32f4851aeadmr1967121fa.23.1752033173229;
        Tue, 08 Jul 2025 20:52:53 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1b1418b3sm17803511fa.76.2025.07.08.20.52.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 20:52:52 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32b595891d2so39126611fa.2;
        Tue, 08 Jul 2025 20:52:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWdtwQ2oeM66rW8FH53XRwaX69KBS6pQvXdJ0YAu0aCwJBun2Nkzs7joMzv6e5s14YNiKo=@lists.linux.dev, AJvYcCXFMaWm1C1Z6mVLE9+sEtcKRv1vtJqm4hwyEzuxFkdSXSg9Dk0+TAMjrel3ADsuR6aonEC4biRqCiIQXIg=@lists.linux.dev
X-Received: by 2002:a05:651c:221c:b0:32a:888e:b30f with SMTP id
 38308e7fff4ca-32f48421a2emr1518491fa.6.1752033172370; Tue, 08 Jul 2025
 20:52:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250708231144.971170-1-sakari.ailus@linux.intel.com> <20250708231152.971398-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20250708231152.971398-1-sakari.ailus@linux.intel.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 9 Jul 2025 11:52:39 +0800
X-Gmail-Original-Message-ID: <CAGb2v67zSf6X5B0rvkKPb1sOna+EW7f5JzqduO1rt1hSUo3p8w@mail.gmail.com>
X-Gm-Features: Ac12FXwreyUxlabds-QeysMrnIp1a5yDkx7pVnlh5FRhGlmU6_2tIIE3jiUb5cg
Message-ID: <CAGb2v67zSf6X5B0rvkKPb1sOna+EW7f5JzqduO1rt1hSUo3p8w@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] iio: adc: Remove redundant pm_runtime_mark_last_busy()
 calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
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
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Francesco Dolcini <francesco@dolcini.it>, 
	=?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Stephan <jstephan@baylibre.com>, linux-arm-kernel@lists.infradead.org, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 7:12=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---

>  drivers/iio/adc/sun4i-gpadc-iio.c  |  2 --

Acked-by: Chen-Yu Tsai <wens@csie.org>
