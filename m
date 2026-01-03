Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BE5202997
	for <imx@lists.linux.dev>; Sat,  3 Jan 2026 19:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767467098; cv=none; b=kWRONRxLNMJYzDtdpOO2CzIfK0hXSycLgh6fjTsq/XROSXnhkluN+86KiW8+R0JYs7txWNzMuYk4SYbbmFtfkWIIX6mE/OY/Jt1S+pAT8wr22G0SQhuBTJkUJIhI6bp43CYNx1xMERxtN+4Ph9A6aKLUI64l7NWQ1QMJ3nDrrIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767467098; c=relaxed/simple;
	bh=1ocYjoxF+BmL+4lAR0aruV6XJ3WNgsR/AMGWfp36r6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AhVyY5QkMhxzeNS3GN0w4f7bO8HdH/5sRH1pkkrkJ0nzjJjMJh4Uzw8unLyiD7V2IlMjEE6Vlzsm+0EC3eWrGp0UkqNbbmzG37L+vVZy9Xm/AKehPHZLtHvJDvTmnLhV/JvYiZ7IL5BCfb/b3J4t/GsUR0Di8jVE8pp7fiClRag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=atupu6XD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="atupu6XD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4581C19424
	for <imx@lists.linux.dev>; Sat,  3 Jan 2026 19:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767467098;
	bh=1ocYjoxF+BmL+4lAR0aruV6XJ3WNgsR/AMGWfp36r6k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=atupu6XDFP7652PVUmPfZud6aDwhqa/ShrQ05Y5wN5/LaENexfNbtOJpU21SLDuad
	 /JrplqpISURr8E0EFo//+aQfbu0WpIEwBnc//lv7Fk6eSisrxTDRuDyHClC57/KLhe
	 /PeqMO9Ar+QLK45G0k5H6a3Ht7wKy9LTSU5M2GIFfjkpUqRd03FbSazoqC5cxl5Uts
	 atpvL9HfSGux6SeoYUEWTVxQH/JAnmUVCSzk3JlV1e2aeGlSW3Za+5BPso5xXwwaiI
	 728xCJ9TWLDA6INS8x/bI26MpiCFM8uxprYdwhOvarojhbHJ9H3MaoLuaeZw8MBQUv
	 VllevLzEnt6Zg==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79045634f45so39687377b3.1
        for <imx@lists.linux.dev>; Sat, 03 Jan 2026 11:04:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUi3Yw9ihFpNlzV1D9tucie55OXJZfcILCRHBnA2xNfEZAH9pKTB2IGi1HpYEZzYeV4NPA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwwC/6gSdRtVsPTEVbMFw/7SaQi10jruU6RQxO2sutzqBUUDSoc
	H+ANjSOaL/oCuLcWIHVtzrLaVNmpH9sg3T7EHMfJTwlsny9Hme/aWAiZP28QBlDOikPI35MGiRk
	58SrzqLt3n3UHnOH/QzS+Y96Y8UtGXKk=
X-Google-Smtp-Source: AGHT+IHbZhHaHEdWDQjutRDr8SPOwbSZ030Zf28/79XflrWl5n95Y1lTs89sR/aKwmdnEx8TvadlNTwYTO0FXJaNx3U=
X-Received: by 2002:a05:690c:c93:b0:78f:a7aa:b67e with SMTP id
 00721157ae682-78fb3e6370amr383069257b3.0.1767467097982; Sat, 03 Jan 2026
 11:04:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com> <20251223-i2c-adap-dev-config-v1-11-4829b1cf0834@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-adap-dev-config-v1-11-4829b1cf0834@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 3 Jan 2026 20:04:47 +0100
X-Gmail-Original-Message-ID: <CAD++jLn+vWZ=BrHEcYLDVKkOjt8W7NcVziYgFkeyoC7ZBYHOWw@mail.gmail.com>
X-Gm-Features: AQt7F2o3USLd11IPN75yO0DWWTRzw0lHx5hiKCrp6xftEOAkEo84jaNFImuzgt4
Message-ID: <CAD++jLn+vWZ=BrHEcYLDVKkOjt8W7NcVziYgFkeyoC7ZBYHOWw@mail.gmail.com>
Subject: Re: [PATCH 11/12] i2c: nomadik: set device parent and of_node through
 the adapter struct
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 11:05=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> Configure the parent device and the OF-node using dedicated fields in
> struct i2c_adapter and avoid dereferencing the internal struct device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Provided the overall concept is deemed sound:
Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
