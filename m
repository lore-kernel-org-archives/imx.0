Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9053633938E
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 20:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784926179; cv=pass; b=GFHAzfyRSoMr0z7oD4YlrCHaFjHkqr6f78ZKVG8aj1jd8ATVV00J3vz/ZrxEf9JA5IBV3dKPPyNDdxXoQpoO1goUcbIPsOtCffS0E5gQ98aFFyf4QHNL4YvnHiNBXhkpXa81g+bHyIuACW750lpzXx4Obc8dZZBk5bG8qJ+Nqug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784926179; c=relaxed/simple;
	bh=gaeGWLc1DkhoMVhCoeTTtFJMXVnVmf3wALfJxA2LuRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQ6GuuNhr8sSiP+SFPxxpjyUSKvlSRdAE1h6pKRHkdj/vYZ1k6bHHo1IJGwbZwcrQb9B+RRiJTUaKQV1KU5z0rxdO/s4SYRi+8FgFth0EO/A0yRdVNd2sfqh9nLUnB7IN/L8pHktzslxlBkeoxiAL0ilctght5qt12pVMGVhu6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bK+JnZtN; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bK+JnZtN"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c197e7e4e94so161606666b.2
        for <imx@lists.linux.dev>; Fri, 24 Jul 2026 13:49:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784926176; cv=none;
        d=google.com; s=arc-20260327;
        b=JSrqnOb7fGhN0cQDOk3gtxVyYhzAq6IySd7v9wJocolNR8+Mf9VpwJVsd1BYK4OsVz
         iqEhMZSPSrCAaivJ5ju9/QG7+5VdEofzz6BRgs5RtwQDYkh/clchV3NsWXifSNJLgVrg
         6wf3irm5XK07CNBB5a3bWsVEeUdnrH1Euel0HVmaSXlWdKsiWA8h+J4m9zQbZ9Cpnlib
         fACcuN2UaOJS8sSE9nOFv9zUcx2nD5D4eHvmpYY2RwAdb7LEBjL8rA+INIJo7Cr/UDRY
         NQxxSg4BMHmGztZYlvovvKILq+wlf3wdQN/UHzwT0s7hhuD8YLwJf2mZ3vbmrGkjmsJN
         YkVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ir3cBbA+grq0RW9ubbM0IgTXxYQsKBl5GJdSxtKNd+o=;
        fh=L2hmkxbCcju2mwsgLFX6Vx+OiiCdNzcOTkxLziD6wvU=;
        b=Da1arUvDXg7XnG7F2Gseg7pvLRXxBKjSmB6EbjqHCxiwJ30+eFQLSFDwhoXXMTYkHu
         zIUBvV/WBUPQZvy7tmLEDAQSaC7BFl42iDA+Sbc3l2a1E6I32EJaqX4ImkdoSVTjWpjl
         cCqTa5Z7ytwzt4Kz69B9XL8COJOmiNV9aHZzq5W9zrj6Rckw14pe3l1FNj8L4jpX/VY7
         UmbvQTNQpD7jzf4mXrgvnh5x03EplyNWhrCUOgbxIGcA2sNYSFeoQJJv5IQ6dGmhUuei
         sER5R3h6dPRa7nJ+00fL64JDoWFaG4cYhtlYB+gbuMHMXB1Y8ouLZ4+cWaGIeXfVEHCq
         /7XQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784926176; x=1785530976; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ir3cBbA+grq0RW9ubbM0IgTXxYQsKBl5GJdSxtKNd+o=;
        b=bK+JnZtNpJQyt8c0317T9wHIGQ8jubOKuHjuJjgcD9z+7ujCb9zJFcRdAVi8UqC07i
         aiIZOretcOGnN8TJ942kr9CWRxW0oZZZzqu1nWlkMBzfFSCvddzL8DYM5CE9VpHztWcX
         2Nf2Wdr49Ig7E8l0L2piaBVLJ32EgcYpfg9cj3GmAxFg4BdTscUHUKX516wa1aOzUwwj
         tdiK1cXmoUhHMH8mijIKtMtT1htFjud1spKGmbUsVmTlC5dZOXcvx/E5zo2QriWnPumC
         R+XRs+rQjf5VKGCTNgUAGOl8A8CT9iyAe+yPG4R4oyiJfvnXdKLUpgdjsVrumuxcROEC
         aj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784926176; x=1785530976;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ir3cBbA+grq0RW9ubbM0IgTXxYQsKBl5GJdSxtKNd+o=;
        b=SL5vHgB46wtqPOmpbWa2J20ALKiMH9oFngSWrxRlrOxcuNhtQ+oxDtwXOZ4CJPNkre
         byOddoEkJ+AXc+axoMvHQsH1eBttB8AVBWK57LqG80E1VdmU9p2eMYn0feKT6rFcSIwS
         HdP+XpGC7oSbt24R9qTO/Fh34j6MEXycGlDdxrSk6/0e8PPV6hv+DDQxBr0fz/TG4O0p
         2PLGs30fO1F/gW6L4C9TSNMfmPW2OhotSwDQU/WmV9TNjZuGzvTjkv3AMk+M6BXbO92c
         qy5sH1XvQiU73Zh0eTaPp5JuKllWB3R6r72YMEEMIA87unADEblqjllNUlG9WtxQeicn
         +zCg==
X-Forwarded-Encrypted: i=1; AHgh+RoSgJ0LjqGjEtyiyQG7SyWwi/d98n6L30LthziIUA1yt+j4mVXhxad41QgYjo79ExIw0gA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/DsaMn4Di3b56Ga1C6tHP/2is+TniC+0Y7+w6fQfLVdUI/xpi
	EeNxLfZYMHW8uqXufjNA6jS7CHSAi3/Ep8M1cBLoP3UNH9emu/9mljW16Qj7uVe+9TCaicKq/Me
	0+7StDklxTDrgIK8DcCFdBEuOFKrXF+Dw1JS1x+Ax
X-Gm-Gg: AR+sD10oqUkXuLB1vBg4F6icpniUFB2u8afqr6h3tB6sh3KQKbZ/WGeZk7ss4TK3fNO
	IWtB7z7irFGx7FkhfXNeU2Gtw5kLu/6eORqXc2j4ddHw/t2rLvrBcNb7ml8DWVu105Jv4Nb54p1
	h9gO5rMXrkPgmbffuXKWGXP8EFNUKOhVyofVttc/yWr9Se772mAd6Q5tChhD/lU2K8C6dhiE3Js
	TLKup20qGtQkG187mx7unkidxsEdN38+53ruAYSTYXQZ+2U8puHvlaz4bHzJri2Y5FuX629E7Og
	5X9dzBeWc46jGrSAEEQAQ18lYVZSJp1P1fhIGzQPh6JfSo4HmsFq7bhMCxZUyLEfKB1XnnZH2t4
	=
X-Received: by 2002:a17:907:608f:b0:c19:5db0:edd3 with SMTP id
 a640c23a62f3a-c1c50cf9265mr356852666b.58.1784926175176; Fri, 24 Jul 2026
 13:49:35 -0700 (PDT)
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
 <415ffa24-a30b-43b2-aa6a-a1cde3bd4ef0@yoavmoshe.com> <CABCJKud9B8vB-J8f0HLHw6EgEKVWzy+Q1PrNxpO_6yCGtEyi8A@mail.gmail.com>
 <12a46993-82a5-4109-87fa-61b8fcf764aa@yoavmoshe.com> <CABCJKufoQ0fX797M01t7CkTgMEwNCELY1=ptZsxr=jWOR-KAyA@mail.gmail.com>
In-Reply-To: <CABCJKufoQ0fX797M01t7CkTgMEwNCELY1=ptZsxr=jWOR-KAyA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 24 Jul 2026 13:49:23 -0700
X-Gm-Features: AUfX_myzXob-BTOm6ceAaY-cqbzmlciva43qU3JWJWtP-y4nEwp_xtUIj8U2zQo
Message-ID: <CAKwvOdnaOy-nyZ=8oLw4N-_hA9JZVdP2BhR8cweCAOhsy4VG6w@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Sami Tolvanen <samitolvanen@google.com>, "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 8:54=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> On Thu, Jul 23, 2026 at 12:56=E2=80=AFPM Yo'av Moshe <linux@yoavmoshe.com=
> wrote:
> >
> > On 2026-07-23 9:21 PM, Sami Tolvanen wrote:
> > > What's the value for the __kcfi_typeid_imx6_suspend symbol in
> > > vmlinux.o? I would expect the hash value to look a bit more random.
> > Checking vmlinux.o with `llvm-readelf -s vmlinux.o` indeed shows:
> >
> >   a488ebfc  0 NOTYPE  WEAK  DEFAULT  ABS __kcfi_typeid_imx6_suspend
>
> OK, so the hashes should match. I can only assume that the hash prefix
> doesn't end up getting copied to OCRAM for some reason then, or

Yeah, Yo'av did you test further modifications that explicitly copy
the hash prefix? I assumed Nathan's change _plus some additional tweak
to copy not just imx6_suspend to OCRAM which I assume the code already
does, but I would imagine you need another change to copy
__kcfi_typeid_imx6_suspend into OCRAM just before the function.  Was
that tested?

> perhaps the source of the copy operation doesn't have relocations
> applied? Either way, if this turns out to be infeasible, I think the
> __nocfi approach is reasonable in this case too.
>
> Sami



--=20
Thanks,
~Nick Desaulniers
