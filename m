Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A480D3BB699
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 19:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784834553; cv=pass; b=g9yRjz4Cy5vtUrFV0HHzXq5G96inKivfkINos3WKhG9KB1F9Cs+gTTKoWcKtTW7Yclt+1cSq3C/bxYOhlyZJLsAR6sj4qv/w2aOLvr/MJsC0kuTT1khOggUuo8itEv2QGxiXq8zuzOXJVqAe3aMo3me4VWp3NP48xwFxce3MhF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784834553; c=relaxed/simple;
	bh=CQzDk6eLJ3OVzLdnUWi9gbK+31evwXTddGNItHuRUwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cWCKYIrAh0/8KIZs5ZNbXQPaczc2FRQcIDwQDOgTZx8uac20fX8oGEIo0Zj2LILvveeZKkKEpNaIX3dEP5GSuLfVlRs44sqeikJb3ca7u1n2H4EAErUBR4rljeWDgoK/yHS9uOhqSnLivc3KXPdsxsSOUEKFEQ8kodGZbPh1L7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ljOWnw7S; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ljOWnw7S"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51c01c79467so52391cf.0
        for <imx@lists.linux.dev>; Thu, 23 Jul 2026 12:22:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784834550; cv=none;
        d=google.com; s=arc-20260327;
        b=gz8pl1sLYSKxWHVhbpNyMBlTs8Y/hYT2lZFdCpeNJCPavXy7K3EJC0nOmphGhwgz7Z
         vvLwJz74kRLA48MicXaTmX+sMesbeNl2CBcSxgKDT2WLvB9KKWo340zDGqAVsQH25Mik
         uyiiEKuVSDPIabLS4gkkHtBy6WqC+hblVebxqe4Jr9KQ/Iu/uyyf7jkCNommc/3wx2JL
         WeRTam8OHinmoVoO/H9/dGtBmI01z48oelFLA5SA0Vw/Uodpv3N3zXxNKOy0McGIjI9T
         Qp4/pk8akV11dJgxf6rl5JEH+mVdL34yIlQWVEQnAjBzdRaTAYJ7LPkhE6Q+5abhPKw3
         Z90g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CQzDk6eLJ3OVzLdnUWi9gbK+31evwXTddGNItHuRUwQ=;
        fh=8UNCo7ZwEDZkjpCdfDcTcBXXAkLHqR9Fgtc7Jn1u3OM=;
        b=NtItl+r4p5iJKo+3oInASTEQbTOIoSjq5inbpUB7D4v9s6RJLD/R6x7rvtXtQonJRr
         bSdoKjnZhEB3QrblJuB9HIR5ID1Z6+5nvUS4x6f8SwLI6izlhXtPp9yv3qP+hUYkU37z
         bxhzhOnwl6XuFnGuNVMMlEEuang4bVRZ2qesGEsCxz4EhuagQs0VVT4LikmXlJDa9u9R
         FZSA30HioRCxcNaLgUnOCj7LjucyiYLkIp/ZLFU2gcvQtT4PyzelhVuzi6ZLUYQbEu11
         OAszzleAfMuS3BQuHFN8E7dB9Gq+RsgiN6lbRpIGYZH3yPSpPPKIuxiqr7e90VFrGgPQ
         wOIg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784834550; x=1785439350; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CQzDk6eLJ3OVzLdnUWi9gbK+31evwXTddGNItHuRUwQ=;
        b=ljOWnw7SM0HyJsxzf9duhW3Ip7sOzv3smVZjvb1VDkBeKKlmg23MWzJKs7F9/BUUAm
         pr9c1tmENVGD/QKVMs5UL1zzsT0glF3Z6WaPBV5iMw3jR4edD0bmMpZYRIU2Pz5efG9x
         Giiwm2X0UD65VNL8R7kc0FLeWJVgTwOMoc9FhH5zMoZFB/uMjY3eXuV0/m78WmaARB0k
         L896J8XcDmXZdI8wVDmClatPRQso4uflS1Z76NfZAbYW3SCNjaxmu5DCG0AsIJ1kHnfI
         1bWKH9a7QHZwbFlXCqX1nfXv6G6TEjqfNusxjUoTuihJuG2DHQAzKoIUPJhiAAXOZwqc
         qQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784834550; x=1785439350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CQzDk6eLJ3OVzLdnUWi9gbK+31evwXTddGNItHuRUwQ=;
        b=JGAnu3Q2LwsvoLZKqAzG7DkAcp2Pgqt0yYHeVdW9Y9Z5cYTyXThibjNVOJGC/u5guV
         6ssmwu56wwHywzZ3lB9J2s+Fg+satnfwLqDgkLkE6D0ckoNym5yV6ZIR/fxWfw5QG/yI
         9T8RIwqPERRSxnqRzNToO+rhGXrF4HmbkszfJ5mv/w4eNbW9NuYOOSdI5K5Spn1/Obd+
         g4mnvgEZWLVRgb1GBx3J7cIwTE1/gNDh3FbZ9eNEp4GoEPHYYRvNYYXOPvCox7a90bF+
         ycj0ITwVBoW9aupUWdcLHd5knhwO4NjblB2LFgvLMiDQ4wnQSOUaqNlBeTrLD945+Iof
         9aVA==
X-Forwarded-Encrypted: i=1; AHgh+Roe1/aqqmAD4GZbkNXOIbY/LxG4mOO2qMW7qXSdZY8vqyFDdPSiOuVYBeEg/CzpXJ/GRXk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx54eH6ZaOJqODkbn0C1c5s8DXHxBwhn9Hlsxen66q3kFb/4vq2
	srHQ0Hrg0YvHLp6w1noe+k46E/OOlcJfxm5f5PfU5zzXADI+GHGjCNvefBLpmKek5ffh+1ZUWu6
	jRFCWd1hTblJLSBRQ0htSURIpIheH1tRmaKsYLmmU
X-Gm-Gg: AR+sD11bkyIayqFXStWtvsZ652N5I1UKf1B3gqs9s0BWNWeEJmCe7J/4JQwc9fiHtRy
	s5oLKl/CTE0tVxfAygJY/B1js7uO3GW0vL9XCAl6qSTlvvmqBpEHATo8gtxzHhbgXPeeakD6mgg
	kyakXJjd7H/N31LqZmSrvGAdYbD8SftZCuafzcd0EwPQHkNEvu44DCqY71S5E/FK4YbufkEM6aN
	N9Y6cW8+BazMU4m00wGSwcxfjC4LqH3kXF81VrBakbD3COn7drAyYx0T17jj5sBVJyoZA==
X-Received: by 2002:a05:622a:5790:b0:51c:ad5:93be with SMTP id
 d75a77b69052e-5284a9ed117mr1848021cf.8.1784834549852; Thu, 23 Jul 2026
 12:22:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <CABCJKudqGL+BFFcz3qsuoJB6S_OAt-vs2yqePC_=oy+JzmPpVw@mail.gmail.com>
 <3046e60d-509f-471f-bd15-3ce78c87500b@yoavmoshe.com> <20260721180950.GA3684684@ax162>
 <180001f5-bddd-4e58-8442-f7ef3c979500@yoavmoshe.com> <CABCJKufhvTxmVm8y7xr4RWWKsoZk0h8UGBnem+F5fknnimaqPA@mail.gmail.com>
 <7f273a08-b29c-4e15-b340-898b251efe57@yoavmoshe.com> <CABCJKud+GsBVv+XMTsi_4QAaTHo7jXD2Hyvi9wqKd7x3i2xyAg@mail.gmail.com>
 <415ffa24-a30b-43b2-aa6a-a1cde3bd4ef0@yoavmoshe.com>
In-Reply-To: <415ffa24-a30b-43b2-aa6a-a1cde3bd4ef0@yoavmoshe.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 23 Jul 2026 12:21:52 -0700
X-Gm-Features: AUfX_mwIn057sYLi7onMumtMkCOBiIb6bjljRVwkdb130ocIXYLLv9gbv_H9dWo
Message-ID: <CABCJKud9B8vB-J8f0HLHw6EgEKVWzy+Q1PrNxpO_6yCGtEyi8A@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 6:30=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com> w=
rote:
>
> On 2026-07-22 8:03 PM, Sami Tolvanen wrote:
> > As long as the C prototype for the assembly function matches the
> > function pointer type, the hashes should also match. Can you dump the
> > hash prefix from the OCRAM and compare it to the disassembly of the
> > call site?
> Here is what I saw when checking the disassembly in vmlinux:
>
> 1. Call site expected hash in pm-imx6.c: 0xA488EBFC
> 2. SYM_TYPED_FUNC_START hash prefix in suspend-imx6.S: 0xd4d4d4d4

What's the value for the __kcfi_typeid_imx6_suspend symbol in
vmlinux.o? I would expect the hash value to look a bit more random.

> It looks like because suspend-imx6.S is an assembly file, Clang emits
> the default assembly type ID (0xd4d4d4d4) for it, which doesn't match
> the C call site expectation (0xA488EBFC).

Clang doesn't actually emit type hashes for assembly functions.
SYM_TYPED_FUNC_START just adds a reference to the
__kcfi_typeid_<functionname> symbol that contains a hash calculated
for the C prototype.

Sami
