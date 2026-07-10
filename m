Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7B13F5BFA
	for <imx@lists.linux.dev>; Fri, 10 Jul 2026 10:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783679214; cv=none; b=IBjq/Y53ydJL4MCy0w0i3CknVb+9lbl/N1WPW6rmf6Z46mA3Z0F8yzwEVBosrI+9W2aScvlmvkJJQnGstbZ6DclbfR2Ju2uY2UBJPVs8vVKPYQSCoRA8ClxkLupReANu+G7CawpIYhjKNAlC0o0QTd9jz3cWgbwZYCj3jaQPakQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783679214; c=relaxed/simple;
	bh=8Lu8OMpVPc16MxdZvSkmOEt9Lvt01fn1EVEQixIYHBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sSFEy39YYFKPL74vSsiyGSyfanX0Fw6OPA7gRAvEcZA4aewcMoFZvvgna6KTqllO/CsjY9iGeNeM6rG5hDbQuou7X7Hu9e5iL7lb88HbbiMAXXa7sURkVXv9bwqvFDQekomE1LKszW4DP3Mf4hLGyF77BfZt1FRucuE0kbZnjS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-80cebd41372so10677247b3.3
        for <imx@lists.linux.dev>; Fri, 10 Jul 2026 03:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783679212; x=1784284012;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HsVN2cPDw+/JUxMMLcOD68aRVLlq59TmevfTz9ChQ+g=;
        b=Y1LomGZba7MuXKYSe73dVpJXzJESFtWhlhRcROswh8hEXWspdNmaiiJEiuTy8VCfdD
         aULvJwJy6XtBTbWTFKlYwDyVVxK6Oc3R5Fx6oPNokt+380jocqB3rS0piXYSnOWeRDUN
         5QicJ7INb43qfOt5vU7HXIDGiwWPsw4ULDFHeudKBtE0tLqQ8vhbOkFhDY/slXHnxYD9
         rDcWR9e9z21HoRlPTXx82GZubWoOXq1k4QhjtknTprmH3z1rqUBsk5CWfs2Kxb2J2iAZ
         WsqhF1+iBB0viuYZvmJLUaHUgozyOhr7wn8G7X2GrFHCinQpifj5OEXTu/KLgq1XuRKJ
         SzqQ==
X-Forwarded-Encrypted: i=1; AHgh+RpNB53nFIizlrSPQiPeE0oJnimlwvlJRxGJz35B540pCKNVCYBwRUMzGSyTbcjhDH1lXqg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxIzj129CgX/7aBJrEZxW3alsYmX/YQGOSTxjuawUCp3z6dQfUH
	7i/VHRcFnpdKs41zjlXvelRt/F0/KpOgrvLVOb/x7iTpct46qvQBELCfT4mTBZ7wF8Y=
X-Gm-Gg: AfdE7cn8pRlbakh9PfTwDTi+BobJBZZ/bmqvF7jU/TOR4qJdyWNNOg73fz0vSTgMrlV
	kTZhkb7jrlQMUFo8EmJiGxiAL+e+ngdAkAKmBL02aP9fB0/5lLX7GWpTV8Qd/vCqoHcIDb+DbBo
	uuPyBOWbXd4PqTLSdlQIhsfg9gkv9P3Y63ov8nD0LIPJnT//G/i0PTk/P9bMJt9eTqP7+/ZPyCm
	O+0DFj2YJhSc7wBKP/QXjbKrYE5O22ClwRp75u77yzWZDSLwOuSNMS/9t8iaW9O8qXGCRE/okM5
	HIhPX7snrVifpSJxuyRjHFUcSkDxM6pcP+UQnsEoLpFaD6gdyfmMVadQIIHNBlKZMFPVuLJT6mX
	Djjns3DUUVJmh2LFqnu0eGGjt33KTRaZ0QX10vjc1xMSUEFVL8CoT6zNVYwWqii3HDHsWwLJs7v
	SvxKBX6bnmfCDRJ2ECq1tyGLECcUHWxkInkKZZhyJeKJv2rWt7Hg==
X-Received: by 2002:a05:690c:6903:b0:81d:2537:1e76 with SMTP id 00721157ae682-81dbe951385mr85470207b3.53.1783679212092;
        Fri, 10 Jul 2026 03:26:52 -0700 (PDT)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com. [74.125.224.46])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6bef1c39sm41445647b3.13.2026.07.10.03.26.51
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 03:26:51 -0700 (PDT)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66771ded50aso1269702d50.1
        for <imx@lists.linux.dev>; Fri, 10 Jul 2026 03:26:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq9QrGDF/Htmkx27Pfi1F5QgwFdg5gCrnt6+n9QPtLvVpU1F6EnZXmtmdFIz4yO5UkqI7M=@lists.linux.dev
X-Received: by 2002:a05:6102:3911:b0:726:e608:6658 with SMTP id
 ada2fe7eead31-744dff43a82mr6415934137.11.1783678885257; Fri, 10 Jul 2026
 03:21:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com> <e5cc82aa51da5f545f745b126923fdd6085a68a0.1783615311.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <e5cc82aa51da5f545f745b126923fdd6085a68a0.1783615311.git.u.kleine-koenig@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 12:21:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW4Thb0en6jeD23KhDp4pTe2F8o5GcBx4fnB+JAxPG-bQ@mail.gmail.com>
X-Gm-Features: AUfX_mxlLApCIjqxIsg4l7Qhe6Rgf_3Xy6YCZC9GZlPPApUQFkmqIVPuBIh_jUI
Message-ID: <CAMuHMdW4Thb0en6jeD23KhDp4pTe2F8o5GcBx4fnB+JAxPG-bQ@mail.gmail.com>
Subject: Re: [PATCH v3 21/23] mfd: Unify style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Chen-Yu Tsai <wens@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	James Ogletree <jogletre@opensource.cirrus.com>, Fred Treven <fred.treven@cirrus.com>, 
	Ben Bright <ben.bright@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Support Opensource <support.opensource@diasemi.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tim Harvey <tharvey@gateworks.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Saravanan Sekar <sravanhome@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
	linux-rpi-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 9 Jul 2026 at 19:00, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
> These arrays already mostly match the most used and generally
> recommended coding style. That is:
>
>  - no comma after the list terminator;
>  - a comma after an initializer if (and only if) the closing } is not
>    directly following;
>  - no explicit zeros in the list terminator;
>  - a space after an opening { and before a closing }, a single space in
>    the list terminator;
>
> Adapt the offenders accordingly.
>
> Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org> # for Maxim MA=
X77759
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

>  drivers/mfd/rz-mtu3.c          |  2 +-

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
