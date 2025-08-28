Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB16283C90
	for <imx@lists.linux.dev>; Thu, 28 Aug 2025 13:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756388217; cv=none; b=MkQO/cZXaPhCLjOozF8/9ZmFk6KisRaQR+cAenZkvZS5FbLqkk3+VR6Qm6SghKNWCRVBRMvb498XBhJ4ysPJkuDmDtyppQYjvG72Lk2XouOVoxFrjDMXZapFVsZ0WO26+JmkqG5GjzJIULBcN6ymqX6jvQ6AWS7GpZAjpm5pWxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756388217; c=relaxed/simple;
	bh=Dhz0H3gxyGM+rtfeLPQ0WqeuSnXhqTSw/EjNYLEea7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t/kcbeViBafQTVpoHlSjXj0JtXklT/0KkYvM54lKNWvX7GtH/fKtt/Su59SrhR8KkEDhBORQwG+w8wTooVVhzXaNBHaJgip/sTisLzyOQqrX8E7ETroGgpqdYNFs5FKBPBFbVdplO/OYjiWJorI4Q9gNy4g4pK95nEdJKFMojWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=R2UJeZL7; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="R2UJeZL7"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55f39c0a22dso1087448e87.1
        for <imx@lists.linux.dev>; Thu, 28 Aug 2025 06:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756388214; x=1756993014; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vO3s8KTMvJZFdHoHnp5Qdx1sAV4PfJarnSm1ctLLZ3E=;
        b=R2UJeZL7GV+qpHFgM3IhwdVy/zvPtOujdKpMtK5H8/nIYclbYEeshGZPMKQBR9fnRT
         WpCt5ACaKj8RRJIV6JH0VwlvYGtxjnGN3SBB03eO+BD6nxycaiyeQsHK5XTHyxNWzx33
         5icbbN1euYqF0pMXwuAMOl9ydTOpAZSX4aSU1QYVoVhXET+DX+kU3sBbNrQSIZpCw1pB
         gHl17nxpn7Xzm/kU/Ks2bUcWqEwUTR/H0FdVqvjOy4LUIB4WBK/U16iNqTatDlHrlTH4
         zKeATNWyfM+BhUZOtHYto1IJ6g4QaNXK35aZBzResRvlpGlYMEQB8G7D9fP06bIsWUJj
         Az9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756388214; x=1756993014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vO3s8KTMvJZFdHoHnp5Qdx1sAV4PfJarnSm1ctLLZ3E=;
        b=TJd4GZ8TdSgXi/zpbjLG3SulB43BiH4OoFPLnDO9qytElorRXrlXD+vtvx/Sz+hnFy
         loCbkBVmYE21yKztk+TYg09Pp0R/6A7X2H89NQvmZiBeF3JLhmderds5uPqdRWY4fJrL
         SLHh1KF8E3YWijjwTZonF1ycdNZ8Hlzs4b/pRQicWLv2CFmmxQpxFcu/TPAoDQX0ul2K
         YSljMTDPoChYf6HSptA907XNF3wdgYfjeZjf58KGnFcCe8VC7ENoAG66/FG5fU/kGkiW
         Nn2VbdPe/0KoDlTtdo86TkieMkp8dfA8htjr4kly8Pg5s5RhLjL+m5a98T1MWdgcwvyo
         Iepw==
X-Forwarded-Encrypted: i=1; AJvYcCUKrBiMK2Tq6uT5rXN3Ko0R0wXild4nt2YmjwoksMr4Cyxakb6pzoQlow/tNEBAhVDheiY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz454oxIEF9EAHcS4vfmQIC8VVUGQEPUk4eUx/g96FHVm6F4H9s
	GlroI05DQHYsr+eMC+1C+XNt07USKURofjw9hClzPMwiqdd3zYpS/XSDq+bZJzTar2wA/zBJyky
	Hs4THgFyL59Mv4fjuY7+08TP4wAWqx/KW8WO6SGI0Rg==
X-Gm-Gg: ASbGnctBZVMSxihupKJIs/CmdxSZaHWF2gJN8cjXLGIjAZLdVbt7mnxn/NkNxcA8/Q4
	l6sleQEW3EuEA1kuhy5gE6h8W3SX7zu039CS3aCPgigogOhc/XcCqIMkemc7Cb7Gq0cetTi6A0s
	cZQK/WnzhNfC3NIll5x5jUFVlC/aJuzlhNdXX4O13XJqxx/LHYg/teBJG0cu9w2pYDu+Rtz42IN
	OwywV35l4do+06n+3jyYUb0Yuc9+WqVAQ9pr6E=
X-Google-Smtp-Source: AGHT+IGjT2OYHV9mzILkObbuSFLpi9Xf+oP+6Uws6rzp7smTv5kAfs8i0u8RIWSnII9gINWFQq3zddWVjDxSq4eH8MM=
X-Received: by 2002:a05:6512:245b:b0:55f:51b3:9419 with SMTP id
 2adb3069b0e04-55f51b39621mr1791521e87.50.1756388214118; Thu, 28 Aug 2025
 06:36:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
 <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com>
 <CAHp75VephepLq61HrVy=PX2oKUQd5NK2qS-vOC5h_NR65td3Uw@mail.gmail.com>
 <CACRpkda4soRCLF5=W=6R4wnwT3pjk743j022XfJxjTTQzuarAA@mail.gmail.com>
 <534ad082-08fa-42c0-9c24-f0c11af7d5b2@sirena.org.uk> <CAMRc=Mdn0_yPXyYq4sbvH4P9-h71vEc4arLPBfSk1PiEFaB7jQ@mail.gmail.com>
 <1804d9dc-8814-47d4-af88-c819c3f17bc0@sirena.org.uk> <CAMRc=MdKgqa+vjhHvD2+Tjw5NwBtFv-0aUivi5UuEQd+n4KxmA@mail.gmail.com>
 <aLAYoDyz8Xie4Dhb@finisterre.sirena.org.uk>
In-Reply-To: <aLAYoDyz8Xie4Dhb@finisterre.sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 15:36:43 +0200
X-Gm-Features: Ac12FXwlaqUs0TeuR0_lKNQwkWNyJ4q4Po7liyAa4ioyozolnG0jRU9pqqtYG0I
Message-ID: <CAMRc=Mdd3fmKjFAfbUB-AAhx-5_CR+c7f36pePkF1k_2LDoORw@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
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
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 10:51=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Wed, Aug 27, 2025 at 06:46:28PM +0200, Bartosz Golaszewski wrote:
> > On Wed, Aug 27, 2025 at 12:22=E2=80=AFPM Mark Brown <broonie@kernel.org=
> wrote:
>
> > > I've just got the log I linked above.
>
> > So, I've been looking at this bisect email and clicking the links to
> > LAVA jobs and I can't find anything. Does it fail to build? Fail at
> > run-time? I'm not sure how to read this.
>
> It's failing prior to putting any output on the console.  I was also
> seeing an issue on i.MX6 so it might be all i.MX boards, same issue:
>
>    https://lava.sirena.org.uk/scheduler/job/1697667
>
> so it's possibly all the i.MX platforms failing.

Not even with earlycon? That's weird. There are no smatch warnings on
this patch and I can't see anything obviously wrong upon visual
inspection. I fixed all other issues but this one I can't test. :(

Bartosz
