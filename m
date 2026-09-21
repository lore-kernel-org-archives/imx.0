Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E42B3AE715
	for <imx@lists.linux.dev>; Mon, 21 Sep 2026 07:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974821; cv=none; b=H6xqFIk8S9jMttB4phe5y3v7u4Lcjh8u2BZ6NQ3dSahm2DQb09VCdhEXYVcsMcNyINkrWkLyDPVbhLd6dTpP9vBBjhK0+2VwARkKbvwoebJWNedi19wVWdL1bQHJv+710lejNxMZZv+QgioxCY2dnKgLccIvDqk0p2qA8YNocJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974821; c=relaxed/simple;
	bh=mlXvSVm/Lq7qa7w+AV7HA/L3OjWuvTwojTve2NS37ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qy45d3ds/E2a+WYPVZVH0jsb9F/AOhcS+HnarIOvqCt8NfKSlqYPgQyGQbby+qTxHmSpu0vxt2+YvcBWEY2sK8PH/QHJLRgRKaqChpEzfUORzN8Rq442N5CkrfrEJ1oYKpcE+h1R04jYps+fc5C/PrQHQl18/qJRf+wupzxtYU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910c9ff1cso218300585a.3
        for <imx@lists.linux.dev>; Mon, 21 Sep 2026 00:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974817; x=1790579617;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HB8j5/kP2XPOkdK+SCbhJLf9Uj+WB32C7OC3D9kNjGQ=;
        b=GfMRBm8VdbLXdumSZ3YWxw7SJPWzRcYsdIjyBwdOzoy9PYX1Inyj9MsG6o8pBNCvi5
         rOAJhy4rcXhBE/jCy5dOnfUvCrzzgCnvYtzNX9JAwBAUza944iHRQ5WzM3JrINq4TUPz
         KNLye/eIe1GsDcD5iYqqrUw63JKO41dg4O0tgRsVD6zMELN2N/JPGBY+C+yrvPlmIqje
         Li4fyB/dpmziLCVUJIIg0mI3qhTk+QRe0ZS/+pbKLNC9C1aVWYYFePOD6Eadpn1w00S/
         hWsIDdnTp8VUaG1HqARub8PJPkY3ggmevhdnzs48jte3JGEIc0SmEdEQdAhZpFI1UoNQ
         dUhA==
X-Forwarded-Encrypted: i=1; AKwUvBwmLtCXFQYTCq2paW07imvyzvi6Eb9hdHJ5WXdjQaHX8/4kOhXV+4PZC1TwXzu+6DMGDag=@lists.linux.dev
X-Gm-Message-State: AFuF++mjbAQ1U6qnzQw8DQWwgmxt50uzC23GWgZEHs05TjdwVYrki3Uk
	/v38ufvcS4YKxpBRwRLdrS3R6p6Vj9TNl6EkDM7uP3CCv7jStwyAYJ3vUDxDhpM9
X-Gm-Gg: AYBFou0gnMf5PI4333U+EfeBfblqiIbhi/z/pB6loR2sNLSU5yElp3aEggNEKRNIIhW
	8xBt3H94B3lxB0XJg6uZzIJhV1ImVgiFeVqH8D3UrEo5JP5YNwkogXbUV1DNteX2h9CdAujO9O7
	+sl0B408ku0XfHy4P6SsQoh4g9eQ2+SwutjG/kP2VB+JRy0bmRkDSDIgfkyr808Au62anuSb+pS
	D5OikggQBHrO71NvZTigSkMZ72evTgivW7aKQJC4k5Ok9Op+Ie1CqYBIqXs91r9YtNG1MaARCME
	dtuSe8I1LpE2i8FaZQlk92ddzPmPeF992jIgdNsZI8Em27keyATtaT2IFT4CuVouQHtpiPUXLQK
	/wcgAxLB2pKNlvcYzeKTjsSefwOSSYt4JPTp+2rOD1jODPGhXAFVd0QzthiyJTjnw93R02QRwTV
	k3Qwl74oe7wE6xnkmOAdnXRob/+bauSrMxEBc+QKiWSRAjDmsyH3bYr/hiO8n7D1XVCKJR/dQ0c
	t17834OhG0H2gyKr8fl6Yi4Wxnf6gQMfys0EQ==
X-Received: by 2002:a05:620a:2699:b0:939:de6c:cb45 with SMTP id af79cd13be357-93bf572993bmr893330385a.47.1789974817263;
        Mon, 21 Sep 2026 00:13:37 -0700 (PDT)
Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com. [74.125.230.140])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260a878absm60592016d6.31.2026.09.21.00.13.37
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 00:13:37 -0700 (PDT)
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-910537b51a0so23781336d6.3
        for <imx@lists.linux.dev>; Mon, 21 Sep 2026 00:13:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBztCnLwWYmYvBGthLabfpLvxsF0x3bXaV+9hA8UxokkgfKtUJkrtDn0DCD4fqYTf6ZFu2Y=@lists.linux.dev
X-Received: by 2002:a05:6102:b02:b0:7a4:da60:acfb with SMTP id
 ada2fe7eead31-7a55af3177fmr4503081137.8.1789974432591; Mon, 21 Sep 2026
 00:07:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com> <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
In-Reply-To: <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Sep 2026 09:07:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVhK0vm_Ksze_=jG8D_=8Q45v+ezNbxwL7JntTt_v_fkg@mail.gmail.com>
X-Gm-Features: AcwNN1XBDwh6z17IsaQFiDrYFydSgUDFMGU_5lJeAdoD724Pjbvrq8QmlAe59_g
Message-ID: <CAMuHMdVhK0vm_Ksze_=jG8D_=8Q45v+ezNbxwL7JntTt_v_fkg@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] dt-bindings: Orientation defines
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Martin Kepplinger <martin.kepplinger@puri.sm>, 
	Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Richard Acayan <mailingradian@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-tegra@vger.kernel.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, David Heidelberg <david@ixit.cz>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 09:05, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Kieran,
>
> On Fri, 18 Sept 2026 at 12:55, Kieran Bingham
> <kieran.bingham@ideasonboard.com> wrote:
> > Add a new dt-bindings/media/video-interface-devices.h header that
> > initially supports the Orientation types and convert existing users
> > throughout the code base.
>
> Just noticed these are already in since commit 6ab5acfb8dd38729
> ("dt-bindings: media: Add macros for video interface devices") in
> media/master (next-20260903 and later)?
>
> > v3 collects tags, and fixes the typo, but drops all hunks that do not
>
> [...]
>
> > v2:
>
> Interesting changelog order ;-)
>
> [...]
>
> > v3:
>
> [...]
>
> > -v4:
>
> [...]
>
>
> > -v5:
> >  - Definitions now accepted in linux-media, rebased to get conversions in.
>
> Oh, you say so here ;-)
>
> >       arm64: dts: renesas: Convert to new media orientation definitions
>
> So it's been safe for me to pick this up since v5?

No it's not, there is a hard dependency.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
