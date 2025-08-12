Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FEA2E6125
	for <imx@lists.linux.dev>; Tue, 12 Aug 2025 09:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754990236; cv=none; b=qktNWzFF6Z2txaD7l22wupQNVdGX7KqWN2aq62149H79pNk0HpwL+WW3iSiqh0XzENvvrLariR66jz+q/dRAAC6th9cCFuKLXm6L9+94eyrRWGxFKAhgp6KXPQrNvzBWdYwQ4aOVogtBOd+x125j/5sQLUWz4YYuTYx7swO4o44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754990236; c=relaxed/simple;
	bh=FH40Q72Hlv1Q+FKRAVO0gIDPDVp0pGWeafDOUhL/q28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UiARrn1HorsHcddKcrOLn9DhHYRkXgokB/+G3eHwZvHJQpJekBVbF1grxH+RnSN7QQlrTXRIfMCtGSESLbHG+ZuG6HSX/e3KuGMcVxRpVEI62ubLTWWmu3Or9BuTU1JEENUN0iJGnm7TdTEOx0xbbh284tYrzNPzWIr7WuxNE1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XjB3GNMQ; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XjB3GNMQ"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3322bb2ac6eso40322721fa.0
        for <imx@lists.linux.dev>; Tue, 12 Aug 2025 02:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754990232; x=1755595032; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FH40Q72Hlv1Q+FKRAVO0gIDPDVp0pGWeafDOUhL/q28=;
        b=XjB3GNMQ9gCOmD11pj7dbU8OjeCqQ6d+QI8kvgvEi3ZUo/I+hU+rxIREdQKWYxJoW+
         mSjILZuaJnQx/N5pYyxpSDzCBI/Yn977xBpMRBF/Alwp17xN955lq0CkfPRjkPNRVHTg
         84DStNW3KpKsxvccRTx2ZNDeLh1a8mV4/uzS1zzpgNhd052IXLbseBmWBiVM54xP/c1O
         7BwPbPcM5VR/nLX7oCPhBY06m7HfL167QshASdTci4Wf6Uw53G/49wl4MNHu6UCtr8rO
         tVirjmZ/I+OTx/wrExIAc2wG8Kewgw34w01LAbuXH/zjILl/MD8quCH8GdmHKaJ0Aqnp
         /zIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990232; x=1755595032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FH40Q72Hlv1Q+FKRAVO0gIDPDVp0pGWeafDOUhL/q28=;
        b=dHPS5cinoY5bvRZaXIqdPYXkgsVJV9yJXTEaFQ+JYQFcFt+jotHGXpavgzsMrMHbLm
         2peFavpwx5wBz3A4XYKm6Rw7/17J60LPUkMnmGxboHuqP9VBL8TdmlB42PUX1426inew
         SYE4+KN0oZ6DPSAm7tgwD06KFohWQXSLEowY1hTLTQco291RuK8CKKye/Y/15wU+NanL
         8gEXzTlEt+nLtmvtbgPDSQxdAnoMQfd/AwnN+G78Zm4iap7qNRuA9WLbc91YIcOe5Nvo
         yfAi7C2RWWZ7ntijEZnez+oM9MHvEQB+QlRS/2lPUtxFQN7BrKrD7XrNkmwxIFOHli69
         0cBQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9I2HJPkSVoPuGnKW5ji149r0ynuVZSzsCdpKxRx5OEOC6f+9tx2+GX7XmqwNt3JjbdSc=@lists.linux.dev
X-Gm-Message-State: AOJu0YznPaA5L4KnoihYRVACgKifSd7cLNgHH0gCI26/WZSCOosPUcAy
	m6OyDoYZXDcy03DYAw09sB2j99g39camaFjb3HEnRlJPE/dsTfMvzozk7hKCnO1QgCVYOqjjlVZ
	joVk9Na0dfOIYWB85HGbU1g4cznhlc/c=
X-Gm-Gg: ASbGncvPXPDrjbsmnLA3Q9RgqpVTvFSP5ZrCGJ9u9XlhgC5tv/7+goNRNcGkiYpNuL/
	fMs8qpSLl/J218LKTnzs2PY/cGAXDzH5EdI8n1wrk0+WbrgoLZX14DwxBu9HdQ+IpUzUM67i+Ac
	qHhhPLu3C3r3oAqsDbYtZglBVuaAW3Pm5sAsoXlqrq9FXPDr52dubDjMDWjWCKi4+bm5y9AKyJc
	SZJT2+tBA==
X-Google-Smtp-Source: AGHT+IEhcflI5Ydaa1GuiuNmpjFNx5ppiNgejnDAuoNiBIEGufTrSOsbJvRUoZYThN0W3IOGq2XThl67s2szsla47bM=
X-Received: by 2002:a2e:a7c1:0:b0:32b:59d1:7ef3 with SMTP id
 38308e7fff4ca-333d7d29e55mr7575061fa.35.1754990232270; Tue, 12 Aug 2025
 02:17:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org> <20250812-pinctrl-gpio-pinfuncs-v4-1-bb3906c55e64@linaro.org>
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-1-bb3906c55e64@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 Aug 2025 11:16:35 +0200
X-Gm-Features: Ac12FXxOADkY0Kt68GjCLZnzoIn9ZUx9AbefjcCXbQIHx05RgPhrrqXj4qTh3Ik
Message-ID: <CAHp75VecVi9XZ25_qY3vX97xbDndPT+O8z=+V=Jocv_8yOQ=4A@mail.gmail.com>
Subject: Re: [PATCH v4 01/15] devres: provide devm_kmemdup_const()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 10:27=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Provide a function similar to devm_strdup_const() but for copying blocks
> of memory that are likely to be placed in .rodata.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
