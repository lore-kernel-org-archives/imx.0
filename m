Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420D2357D1A
	for <imx@lists.linux.dev>; Tue, 12 May 2026 07:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778569648; cv=none; b=pSWxt6mVF3Ag08qIg2DtGzghtQ3VF01s5qwOPasqoPTKwV0PH4SzjgXmE0/0poGj+6wsiZOdAQp3hqX/0es0cw6ujC8oAAt4OMDf2VNY/zMaVqkY/b6iVD9QpoH3jnKKBIqFb2Q5tgnr09YpnYZbwWUa/a8bfgwmbT1ROoqYaqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778569648; c=relaxed/simple;
	bh=QOuhUbECchN9O5z4tSuzAVzWrzBcGh/7OTIvurcyros=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SIvWnWfHF40IukU1cNnBs0Bbzbq9Goxe+/GxBQwJpF3FoWxD5Tin6PhrfX3Yb5g4A6L+JEBP64tJ3f2nEpcqCvfqIKt+EPvXuN3IbmoXa9tDMxzGEZ+y7MMdaEJHCZwifQ/w4I0kqzcg65H5f25qImlW3aCrFy2dMR5+MPoyMmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-575212eb419so3715074e0c.1
        for <imx@lists.linux.dev>; Tue, 12 May 2026 00:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778569644; x=1779174444;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FuciPnJNj5AwtRdMcxDTBtjQGaobaVWkr7dCuNdv28=;
        b=hbXVNdaoDZ0WZdltiLY0/ULSrIYGpeEQcNz3DiZ2AjlV+qc7uDL5cq5AEo+spEjI1Z
         myLj2iOSZsARQ6ZvMrRXX7jvId86R46b0qVsbJT1ujwpyVcKxwjzfJ93AwbBgT1mEMU7
         w9dTw+JUH5NxXhYBJu2sVhQMB7+w1eErtwBWsLmcrUnkmUU8LG6AjgNxwnsQWCzzL7gb
         oQH1ChRMzXdsG5owy+z2UM4sHATDGr6TCXpmfLbW8TBScTkhfC6+jjPB6mT30hshW3Ub
         66ZjiMK97Nxk7hV7EBar+KEbtp2pEbD9Fe+O2XpU45+CYeS/beUwBuJ6D6jYAcEFE9qn
         g3aw==
X-Forwarded-Encrypted: i=1; AFNElJ8VqBoghrQdOxjYiqtUohaUAZ2YWf1WqAffFghtc51Ri+MtaCpGLos+QjuBaZ+Fk/Ijbvo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyV0xH9Trm7awLBU0Fw1snj2Xt9b/XfgSmvVepHlDRAcWN6KJRQ
	Ic+Zt+gWHKVaW1sdt76IkHeOLDT8GKQUAroa21g3P4yTWL0xkPY2UZTTlXLhEYni
X-Gm-Gg: Acq92OE0cI/N/9Toa5lqFg1lVh33587T2BT4dGsObpyv6aJwXVlrwhhOnURt61f+RVG
	olwb3uLnAuptPtUt9kxjlw67Ud6I0xHuDmNgktP6/sSjlg1J1WADZ8D+uacdu/bsoIPTAuLRJ2Q
	8JT/tX5iptg9HbXY6h0Fx3fxVnxTp4wXIcaPQXh9fkOF1NKu2MwMTGneQ472Wx02dJuz2HLtom+
	aT8OPBW5lviCzLdAPimFfoiI3cN82eYpN39FxAJN1x6A387kro9C94+ihU4w6TxwWcFtd29vGU5
	oLxNXL/Vw9gIzw2gpGNGZ6ltVT+tRGAegGY++s1U0ipIIHSPWjthlk9CEdHBkMZzMVqPTL20ci6
	x0brfew7poTdcuaTD/D77eAryU7NqdnzAIPHWcathocCPDyzH82ogGPg1At3Kx2nkwXWIv0Ao6E
	czc+WvQVjLeE9usb3rQJcY2h/hPRolWEAFk5aG3ltXA0jyixlxGX9ihoPkBtQs
X-Received: by 2002:a05:6122:d15:b0:575:2ec0:2000 with SMTP id 71dfb90a1353d-575cfe9bfa3mr1010117e0c.9.1778569643661;
        Tue, 12 May 2026 00:07:23 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-57586996d3esm8891219e0c.6.2026.05.12.00.07.22
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 00:07:23 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-6312bdd281eso3722439137.0
        for <imx@lists.linux.dev>; Tue, 12 May 2026 00:07:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+74F/hHU8ywvX7l4TTaTrsYa+5ID332zqGZBzrNSI4VMn+2mkTx+uhebBiawHv0PBTTUo=@lists.linux.dev
X-Received: by 2002:a05:6102:41a7:b0:631:5717:5248 with SMTP id
 ada2fe7eead31-635d27ded2cmr1082007137.21.1778569642797; Tue, 12 May 2026
 00:07:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260511211841.284809-1-ben.levinsky@amd.com> <20260511211841.284809-5-ben.levinsky@amd.com>
In-Reply-To: <20260511211841.284809-5-ben.levinsky@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 May 2026 09:07:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5UjAB35nPA9ghNm3J9oFavuEv3NHxkxxW3nOU5ZsMwQ@mail.gmail.com>
X-Gm-Features: AVHnY4IHIx-N6TjHjhDj_v4IyNJlawKxUXPhLNy1xplrNwtoo77SAjjbsdZbWCo
Message-ID: <CAMuHMdV5UjAB35nPA9ghNm3J9oFavuEv3NHxkxxW3nOU5ZsMwQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] remoteproc: switch drivers to optional resource-table helper
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-remoteproc@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	tanmay.shah@amd.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 May 2026 at 23:18, Ben Levinsky <ben.levinsky@amd.com> wrote:
> Use the shared optional resource-table helper in the remoteproc
> drivers that currently ignore a missing table. This keeps the missing
> resource-table case non-fatal while letting other parsing failures
> propagate to the caller.
>
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>

>  drivers/remoteproc/rcar_rproc.c         | 13 +----------

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # rcar

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
