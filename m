Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96054A2613
	for <imx@lists.linux.dev>; Tue,  1 Sep 2026 20:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788294991; cv=pass; b=Rivf8yHERCie60ps4xWmHJ/32DZ4KhPftBeDfchDw+HgLxQya3WtmXpFbpfdD2LMgMeFwxO5/Fsl/DX5mErovDbTKTfHEaPYW3teGVCDFVTGZ9HeBnvLsJWqrd5NFWzsUl5GU02qAxK7H/Kdf9tLjSoHYjMKIOHIr015VgIDcSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788294991; c=relaxed/simple;
	bh=HdDGW1g39cCl6eGOp/7kmX7YZgzSXGwniWQDRTw+uXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jyXsc9JV5v1nFTA08Sgv6JATxaDypSmbWtL2SSXP3I4qJJ/ExPd5XdKNTs04ra13OoeO2ZZIe6+EHdQbeYkAv1grXLuW5z193Z8G8gV2HRdKzfbOP6oEHZt4XsbEr4at1oDSmHgzU1PaSZwDVpgop7GyJx+IBVDa0LHEEpLL9Lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GILpRr4Q; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GILpRr4Q"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-484362f5c4aso307806f8f.3
        for <imx@lists.linux.dev>; Tue, 01 Sep 2026 13:36:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788294988; cv=none;
        d=google.com; s=arc-20260327;
        b=lgP4NKI6GceOU+cJVvaOXuWKal3wGoZboBLn740DMH8VPPcigYzMv0DA4s0C9e4ZTO
         XAvfqdQUrQ/ZOHHn/B672NImwoxaN/hU9op3kVaCZnZ5b9vg57PyNoEdPVGN/uQqSlIG
         o6M/dFifI+if3TpYn+acmSpdtJu6Do2G7xZc3wK3w1s0to6VCTgyUVQ31ZpizynuUmNL
         +q0SXXRrowAGUTFyqwMdhneuMPBupGfLWlOXH0qV0SIQ4AfKG6E/mvPZqK11T6NgO7YQ
         QbJkSgRfkPmjatTOkzAGxp3EWjq6SY+zeSMsf5rRG65X83AbNjd8kAYo97rP0D5k4sU5
         wryw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HdDGW1g39cCl6eGOp/7kmX7YZgzSXGwniWQDRTw+uXI=;
        fh=NFxHVlhAGCEJ3CP8Rj7TqPB9MiGnycNNxoI3Ld5lRp8=;
        b=eHpdyCdTe2Lr3Fv1mmKNs2N57D/VAY1f+GvoD6jZtQrn1eFDkVYWWWF8hd/VuNT4hh
         5m96GApuQtBW5bbSQRB6tO9MKXNA2FfOal1YOncZy1mf6NKRSxZuB9DqvAPs4mqSGQ30
         HJNOiBLvr8pC+R2yOKwRkOMjJREfjUrB6Xe0C/CA/L2NRr81XebRPi6M3bPdN4nbADQV
         W1W7EERqjHBNSoODGFqSVGZoM2WgEi8oLI9OgCHOYyy+H+g8MCLuQhztw3tOcMj0pxw7
         EK1C1/i7UFEe14W5hpxb9gbn00Z03zAlyENwUMklKuezlE3ZtkU4O2iN5pcfsWKcApAJ
         xIsw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788294988; x=1788899788; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HdDGW1g39cCl6eGOp/7kmX7YZgzSXGwniWQDRTw+uXI=;
        b=GILpRr4QGCIrkoMs582rfPCKAIRbW25kAmaMl8oDgHvVMjoP5Mcgbrj8MRO3oqLIDd
         MvCHXlxwKHfD+bXNuOe8OIw9cFzfD7yRX7omH6qvuH9qIHHsPvvpmodc2FRhKSXk0Nbf
         P0shzhVS0jrM0hxJAeG0C5R90Sk/9OIIdmqmtCYHkum12efVrLWQkeqr8pAq3ZzOhYQS
         kD2pcH507OyT09UI3GJhPU280dr7+IcPKYOKsWx489a/DTHf8Zj0YtEPw/ZBUGtzCxil
         xtUG5V4W7POHCpZcg7tQYBPihZkoUrPoUYasim2i/V9PkE1LLWcUqNJSTNX27LExdysT
         jr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788294988; x=1788899788;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HdDGW1g39cCl6eGOp/7kmX7YZgzSXGwniWQDRTw+uXI=;
        b=bIdLguCy1Fj70qwppxH63+pHrRbegQT4wsdjjpM+O5PYyvhiSaQm3bPFKPL3QwzAK+
         7qKAbfntd/LVsuHXxS4ABCHe218mVkShq79w0rqPhly1ITVl/zaaVV9m0zJYhBYk1SJ7
         iOvHDcqlYY70qIEKRg/9OmH5TQjn7l/hHgABZgcfFga+q2XFQpocm8B1+D0JHH2wrCX7
         epKyvzafFp6eKuFhwRWdQ7+JO25/b9mDZ9JvAixBZYUlkhqp8wyqUj67UA/JLKBZZLVm
         6rtN13B35FqQdRn2gMQJ91I6spJx8Xu06YJJqJXCu9kda3npWjsL6Spd5sQLaZ28HnQw
         muvw==
X-Forwarded-Encrypted: i=1; AKwUvBx/Vt+AqtXlaExamocOFd2hK3Tbn3ZqH1h6GFqrHlaOCGfM/wcXZKpU8MNu8tXEBuPQWb8=@lists.linux.dev
X-Gm-Message-State: AFuF++nFVGGsoL7jKyLPSG3uIxxe8m6PnFUvBptnSvo6tngMz4jknig/
	z2gIZD0gW8zzX3hHdttX1fI1+rXpUkrzRF3a32pZ/THi131/E5eGN8D5P8a+mhlP8UOa7894A25
	LD8YH4rd3exFq1WXFso5zK6xrXE5owkaFQ/OFIJqM
X-Gm-Gg: AYBFou1f4ZfonkW9VNHNk/bg/inYMy+SLui78QIkSwtPGwyUfhT2LCRrHyPemTPQOZU
	ryNAvUnDMI6FaSipk0svtsu+uteVYo/vXSYdHjUq5LcheJdv0jVsLfhMq3yV1apuUBGmJ3BiLuQ
	uRRjy2rmZUDPL7Q2x30BtrLkVndEHZTFQKCsQxeBWbD7r0LkSP06d/3Qa91Zc6xYkq9oIBsjf1r
	94ALcjsumFgf5nyWfrJuYjecpEsivGn7lYx4Nvl0yglrfSH6S4S7H4iYbMpo/yDglWJLLxCTCgF
	sAf6bk0zi9dtnSis51g7SD8wTq8GizxpupWxxNTqNmprag5c3fzEVl3h4VAeH24m4AgKBV9WUeO
	P3PBxSrXrmORXs7/F0tCv6l15x/dA8N7p+hBdqFtPEA3r0oaJ9dRwBmk=
X-Received: by 2002:a05:6000:4910:b0:482:f61c:7cdd with SMTP id
 ffacd0b85a97d-48488df9e0dmr42483f8f.4.1788294987371; Tue, 01 Sep 2026
 13:36:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <20260827194508.446733-1-linux@yoavmoshe.com>
 <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com>
 <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com>
 <CAKwvOdnA7Ej_uppSL7U2xwxyUQoDMvO+RArj4HCUSOziH0rCqA@mail.gmail.com>
 <CABCJKuezb0HtOcMBsObczS=HBaRvMszagkOZGHyOVbXBqtJi5g@mail.gmail.com>
 <2bd0c842-d0cb-4ad7-b3a3-fed2000dea83@yoavmoshe.com> <CABCJKudb5RegHcNPkXG5p1TcCFAe5_8+hqBP-2GyHVK19oB94g@mail.gmail.com>
In-Reply-To: <CABCJKudb5RegHcNPkXG5p1TcCFAe5_8+hqBP-2GyHVK19oB94g@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 1 Sep 2026 13:36:15 -0700
X-Gm-Features: AcwNN1XLVY2qNNwpmvPqR9vii35HawK0FLdCW7a8C92cPutToPYaUpHoOUGoDJI
Message-ID: <CAKwvOd=OLLO5AXiR54o0nU16e_pTDt_yiEPQ0GgnX8DRGJXYmw@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Sami Tolvanen <samitolvanen@google.com>, "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 12:46=E2=80=AFPM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> On Sun, Aug 30, 2026 at 9:24=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com>=
 wrote:
> >
> > The sashiko-bot's comment on v5 indeed pointed out that imx5, at91 and
> > omap1 might suffer from the same bug: their suspend routines are also
> > fncpy()'d into SRAM without a type hash and called indirectly. They're
> > all ARM, so asm/linkage.h still seems like the right place for the
> > macro.
> >
> > Do you think these need to be fixed as part of this patch, or as
> > follow-ups? I only have my one imx6 device (a Kobo Clara HD), so I'm no=
t
> > sure how to test the fixes for the others.
>
> I think separate patches for the others should be fine.

Without devices in hand to test on, I'd be hesitant to claim 100%
confidence. Maybe reach out to the MAINTAINERS of those, and see if
they have cycles to help test potential patches, before
writing/sending patches that potentially don't get tested?

--=20
Thanks,
~Nick Desaulniers
