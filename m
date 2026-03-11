Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFEE27CCF0
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 13:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234083; cv=none; b=fR2RepY/9IxDirDQ+nwEYuuvjv1pa+T2mhmnKb1InpMmFYo/6zMnDzUEi60TXn3zOAKx/edQgG6AZPH9OpQd1xf2Tp+gOveTdRtY6fGI31Zavp10LIdDjTfYpLz1o4K5wzUQD/jHFsezKXeY0CKNjVApxoY2EOjcOFVwlSWWez8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234083; c=relaxed/simple;
	bh=5omYf3UBejq4qWG7tPFgWTcjtBLBdAAToujIJ2lCAvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s1bB6QMOEJ8tSTewbPx/0BlwsdbcZXWKb5i1c8T8EkYN7/Rh8Rj7T6M4lcmgMGArVmSW50+GYeVWiJQdyfaYIxPcqTDmYZfTgm5WJdCFZRahjbpQWtO/OKBhT2JP1KaSmxOH2OzQxH9w5A94fCZocpYnaoaIRPXVzzyYWwiHdwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XHkvyqmE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XHkvyqmE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773234081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5omYf3UBejq4qWG7tPFgWTcjtBLBdAAToujIJ2lCAvg=;
	b=XHkvyqmELEw+fCQ3ak49pu/VkoANmVmwFR/5arG/JzO8JenFbjr8g6/UXvnIuefiEuQePI
	4sCIgCM95DH81zU16rF1yex1oQCEYMcA6bOC2+nzj3EF/DSj0ayeE8cqqAzf/MUeTyS4dF
	t8wl21REFbo3N1LASnqzNZe3p6V0Z4k=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-3b0BqnwcOg6HSlXcnR1vZg-1; Wed, 11 Mar 2026 09:01:18 -0400
X-MC-Unique: 3b0BqnwcOg6HSlXcnR1vZg-1
X-Mimecast-MFC-AGG-ID: 3b0BqnwcOg6HSlXcnR1vZg_1773234077
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b8f5bce308dso1235490666b.1
        for <imx@lists.linux.dev>; Wed, 11 Mar 2026 06:01:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773234076; x=1773838876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5omYf3UBejq4qWG7tPFgWTcjtBLBdAAToujIJ2lCAvg=;
        b=WIkExJ2TGUZgJYMOTWisDr3oDSGbtPtYYAfhNkzANTXsncG0SlTwFK/Aya7qZovEBp
         DMo+Wwo90h4YCt/hBNQllThRAB/KKNEHGudXrzhjXb/G0efP+Nhh6rR5lMcppGiDU7V6
         ZMtJg6ve5/ynTQsUszO+YkRRBr4ngUzg7ePY910C7Y5BWnMjCMdXE1vIVkH1HLj6IWUL
         DpAKDpfQKdJZR7+Lfya669KEm6CvbNx42Os+DfLgmnqz5/0e2sd2qciWfHX5jZFeCgBi
         P8GYAFHHvV+qFu6Dy0ekk1S7e5C2GF0ced4/U+rJ30kTldl/rS4VL7wOLKET6DWA+dK9
         MvvQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9lgU8ikJhFdO/wStvmkjGFim0PT82D9s7b4t8+BzlDnGSXJIDla8p6fWQ1ew4FcxPGFI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxaa+iIbvqp35zT/UFQDSPT523nN7EoLFxZeizsZrjiM5BAHMuN
	bst6SEai/25cglvwg5so2AN2PsyiTR/3SgbqrKUtwMkcs2k66cEhIwKX+EsTVomnlVsyF4N1RRs
	4u8oVWiS8gEv2+CXjjFYx74pfAl3/emezVyXuCNVjvSwXtcKOvl8boUiHxZN/NeqiYtJooXauvw
	+hBG/sBfCZmUFwIw2xHnNCpFOufk7m
X-Gm-Gg: ATEYQzyvoz7HYvmG8Per8laCckbCbFs9bBkd07m47Mp/6o85VKoieJmm4jq4s6wuyCq
	CLvjSGTDRoYVwKm4epCLn6hLk758/TIfj5NaOlDVaWH8oV5sBCppc7cw7+uCr/1QB42W9JPmrl9
	Ww04Libibv4lEqzFpYFuqG4uYBQTp0hCVqU/RlXyX2GUvwsFBJiVz35VBlOYVn1+k7GE9qqiX6w
	Z95lw==
X-Received: by 2002:a17:906:7314:b0:b93:edc0:e2e8 with SMTP id a640c23a62f3a-b972e6069a2mr143085566b.48.1773234075178;
        Wed, 11 Mar 2026 06:01:15 -0700 (PDT)
X-Received: by 2002:a17:906:7314:b0:b93:edc0:e2e8 with SMTP id
 a640c23a62f3a-b972e6069a2mr143080266b.48.1773234074508; Wed, 11 Mar 2026
 06:01:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com> <c7d47b6d-caf7-426b-944e-7debb7d69045@linaro.org>
In-Reply-To: <c7d47b6d-caf7-426b-944e-7debb7d69045@linaro.org>
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 11 Mar 2026 09:01:02 -0400
X-Gm-Features: AaiRm52EdqmkwN8CGi7SEvZrCO9M1f6Y7hYTKKNfjOzM3D3aXhP9MAnWBZaRjqI
Message-ID: <CABx5tqKC_KocCp+_uJ-t7AhJNa9MZOG=5Dry4UoZXzUvSryiFQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] clk: add new flag CLK_ROUNDING_NOOP
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Andrea della Porta <andrea.porta@suse.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Bjorn Andersson <andersson@kernel.org>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Orson Zhai <orsonzhai@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	arm-scmi@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WMjZKhau6WscYMlUmfeQTmiBqvAF6kbGKRMy_8nqCdE_1773234077
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 7:51=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
> On 3/9/26 4:38 PM, Brian Masney wrote:
> > Note this series depends on 3 previously-posted patches in this git pul=
l
> > to Stephen for v7.1.
> > https://lore.kernel.org/linux-clk/aZuK4-QJCXUeSxtL@redhat.com/
>
> There's no tags/clk-remove-deprecated-apis-v7.1 on
> https://github.com/masneyb/linux

It is here, unless I am missing something?

https://github.com/masneyb/linux/releases/tag/clk-remove-deprecated-apis-v7=
.1

Brian

