Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6E614A62A;
	Mon, 27 Jan 2025 16:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737995421; cv=none; b=RXhQhi8HjwoK+W0j97oogzDVsoX4VyaJC8tbnec8YtK3jWyoiTJjiRRTRv8wOiQqsdce507SNWke2Pq7xyVk1yzYqAa8gGiT/3wuX4EYVAemQt8mQr9GIjG683xfWpOAmhyAHjaXoo34pZ/0879fihxJApM4J5EbbuRqK/IQLvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737995421; c=relaxed/simple;
	bh=ZNKSmArHq89j7IClvTYDareVhIHdk3mFzoaiZMHUsD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CVmZydBNPIsSdOyBr7+q/rsebiT7TUBNsu2+ohy0xVpVL3B0jvHfdZLBLirKrVvtvotyKz6JmJdXL3lceopt+MrDB7bWxFNMN7OP0kme3u+mOBr+CVWHS/n55QAmJoXb//ziyasyeumlJ8CEHWidMYo9yigiyjoGT/wwZ7zRR6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4aff04f17c7so3614229137.0;
        Mon, 27 Jan 2025 08:30:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737995417; x=1738600217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WlQ0Imi4TI1g2HJ/WhDlE3//wGfnD+n5Npq7eYW5xxc=;
        b=ktBImqQNAiq6+gw6Dq7qWgEd0ZZkilIS6PEG/rnw7+3/V+WsMCNFYzCy5x49JW9lIF
         WVhRe7VFNnUJqFPHP5tGoMgIW/fzTiLRitANxjvrR8P+LL+jIpA1CXZ9Vxq0kX1Ch77x
         /VFCrIo7ggqT4BBTbtSKZFyHIzKiGn4eBf52x4VIH8fnP3UL1Dl2DkFzWdu6aG/hgeWD
         wQ9TnxbXosL8Ays0UjVq0wvrmh0hrqHNib764l6/Tu2qe0NEK2Em7fVjgxm6gofxSAuB
         aplHtvyo3mCd6o1KudMMEcZ56s1ys6nZZzI6Uz9ex+vbyFM7QFGvc61baP86DHwn34aw
         JGVw==
X-Forwarded-Encrypted: i=1; AJvYcCVcmct8CLgQkydkrhS5eJhlwBuxxd7QPR8kHxPR7Ry5yeKxpMMc40M+QJeuFwQql7Tjq+wX/ys4kaeYpo4=@lists.linux.dev, AJvYcCXgrYGuzEGd4CcCdX5Y9Oh+d/MCLXzKrbV8IeZ+9Umx7+pGLwn+CbY7194stIHL6OVbXGU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxw/wuCU8p0RCdvT/S3/jIqwdUwGMKUmO+ermaQ1ZInGWXlxgaq
	mgcsCy27j+w6PCj3rgsGiInCr6fh89Ep3+LyUniZjyGWAqBCOtfsCwpZn4Q0x1E=
X-Gm-Gg: ASbGncuaNOucWtaWhnUXkFxOUTPWjJwTqMi/XvgNGxN2GkE2Mwe3cnE56Vbc2Hm0Wzv
	t4juS2bmb9zaOvOF4ktoi4qCFtYofxVBALbrks3LpHiwpUJWHcy/bHhvopOp0ZctBnmddl7frab
	HazTstSVU7jnkI376j3+kGlolE2iDjOwL3m/FwyQ5Kqds7sUzxnkXZ9WcnZNR8+Xc5hTQqncHZZ
	i0pbBWuxuMtgG7PavmCZKmHhx0c3Kkpbo97LfrmWb3aX7biNhKQrSBlwXucvZCAdeGsidXmtMVz
	qbTbuEkQCvdXAYu9z5AgXHDNt8pAEjIUikYAmG5RlIY=
X-Google-Smtp-Source: AGHT+IHQqh8ZpgnGqmw8Y0Gfs0rWOvi3lgJJXcPB3FwANWYf6VdAlOHRWeu8C9qpI5icX+qplbaHlQ==
X-Received: by 2002:a67:e2ca:0:b0:4af:57df:8697 with SMTP id ada2fe7eead31-4b709d0b4f6mr11310062137.10.1737995416851;
        Mon, 27 Jan 2025 08:30:16 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-864a9c98e0esm1972574241.34.2025.01.27.08.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 08:30:16 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-860f0e91121so3089181241.0;
        Mon, 27 Jan 2025 08:30:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVecpaNoZSpjFc+UK85czIYowJhcVVS+CQvWM0KJL1qTExICobPbF3pqanRYGGFLthS/Kw=@lists.linux.dev, AJvYcCWyq2EkCajlTC2e51BY6muFSDBZZLrPT47Ee6VQTZ2LbhzGklC0NbAoXMwxSfaomNI6nEe2/8MPjMeekPw=@lists.linux.dev
X-Received: by 2002:a05:6122:2028:b0:515:20e6:7861 with SMTP id
 71dfb90a1353d-51e4fb68a06mr12748400e0c.2.1737995415897; Mon, 27 Jan 2025
 08:30:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
In-Reply-To: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Jan 2025 17:30:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV7GwMNm5tYvWugehstM07W9JkLdKrE9hwPhxcEab8ajA@mail.gmail.com>
X-Gm-Features: AWEUYZmGy-5V1Zbo64bUIwl2HUW8rq3_GydwTJUAoMljjyEePEDEnt0EQDD7GTM
Message-ID: <CAMuHMdV7GwMNm5tYvWugehstM07W9JkLdKrE9hwPhxcEab8ajA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/14] AHCI power management cleanup
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hans de Goede <hdegoede@redhat.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Raphael,

On Mon, 27 Jan 2025 at 13:46, Raphael Gallais-Pou <rgallaispou@gmail.com> w=
rote:
> Several AHCI drivers expose suspend/resume functions in a way that can
> be simplified.  Using pre-processor operation can lead to errors, while
> relying on automatic kernel configuration is safer.  It also shrinks the
> kernel size when CONFIG_PM_SLEEP is not used[1].

m68k/allyesconfig:

drivers/ata/sata_highbank.c: In function =E2=80=98ahci_highbank_suspend=E2=
=80=99:
drivers/ata/sata_highbank.c:590:9: error: implicit declaration of
function =E2=80=98ata_host_suspend=E2=80=99; did you mean =E2=80=98ata_sas_=
port_suspend=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
drivers/ata/sata_highbank.c: In function =E2=80=98ahci_highbank_resume=E2=
=80=99:
drivers/ata/sata_highbank.c:607:9: error: implicit declaration of
function =E2=80=98ata_host_resume=E2=80=99; did you mean =E2=80=98ahci_port=
_resume=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
drivers/ata/pata_arasan_cf.c: In function =E2=80=98arasan_cf_suspend=E2=80=
=99:
drivers/ata/pata_arasan_cf.c:938:9: error: implicit declaration of
function =E2=80=98ata_host_suspend=E2=80=99; did you mean =E2=80=98ata_sas_=
port_suspend=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
drivers/ata/pata_arasan_cf.c: In function =E2=80=98arasan_cf_resume=E2=80=
=99:
drivers/ata/pata_arasan_cf.c:948:9: error: implicit declaration of
function =E2=80=98ata_host_resume=E2=80=99; did you mean =E2=80=98sata_link=
_resume=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
drivers/ata/sata_rcar.c: In function =E2=80=98sata_rcar_suspend=E2=80=99:
drivers/ata/sata_rcar.c:936:9: error: implicit declaration of function
=E2=80=98ata_host_suspend=E2=80=99; did you mean =E2=80=98sata_rcar_suspend=
=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
drivers/ata/sata_rcar.c: In function =E2=80=98sata_rcar_resume=E2=80=99:
drivers/ata/sata_rcar.c:973:9: error: implicit declaration of function
=E2=80=98ata_host_resume=E2=80=99; did you mean =E2=80=98sata_rcar_resume=
=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
drivers/ata/pata_imx.c: In function =E2=80=98pata_imx_suspend=E2=80=99:
drivers/ata/pata_imx.c:209:9: error: implicit declaration of function
=E2=80=98ata_host_suspend=E2=80=99; did you mean =E2=80=98pata_imx_suspend=
=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
drivers/ata/pata_imx.c: In function =E2=80=98pata_imx_resume=E2=80=99:
drivers/ata/pata_imx.c:232:9: error: implicit declaration of function
=E2=80=98ata_host_resume=E2=80=99; did you mean =E2=80=98pata_imx_resume=E2=
=80=99?
[-Werror=3Dimplicit-function-declaration]

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
