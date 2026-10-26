Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793002889;
	b=jrq9oB3Ur81FSGxAmI8Ezae0uDA7F0KfmelxvQlK6sV47k4W/XmZPte2ibFzMvBIkLB2
	 nCIrt87R7YJ1NOfqk1SBcGyoz4gqPVSUIdyvNUS1yAppHsFgpEvotPT1E94SuWMD1ao3K
	 RIbAVLRVPOOZYejMVvHNF9Qcv0hywsMiiIT3auY+EW+R5eUYTo7SzL0lUib3XJIGSPnLU
	 ckUqFNTjIAecWIf9Cxe4P/cHE2e3oiogytPl1KGji+uxBuJNxxq97wZzsvbe3hQVH0hQ2
	 p+k7IBnRDFECJ87C/IVGdWGube6CpnH28fhHmzZWvfS+9vNjuujCrel1sct1rvbqJNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793002889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=x3YIRl+8jG3N04z3aAGjtNPDALZjVxEdDCHikUWgSTk=;
	b=oTYtLqXF2tyw5tA9IE+wa+9uwplYb4UjyfpQaunSI4XozdaSrSQvjc8WUz72ad0vAW1F
	 A/JIfMavS0y32i2e6SQxftKnmWdywZaRVwia0DffGNaP7LjeUsaDFBJPwFLnMWP566SAn
	 EKJOZmigxpD6ptcRUoSNiakvxxG9cLw5dFRZc0HlpLS+F8qnYAXy3acKY2Jll7ZjXVgjT
	 nto7LoSRkrbLhpEv+PsuxxjkyYC38zR3Xu6W8ezJ3zY9JFo1KwmjpG+2KvhEbBEG+HRWl
	 AHsgaAT0XVuvBDVsH0qrbkRK+e3INr/iMWUZZkzHk/k7f2Q7Vq5Xr3XifYjo/dfyXHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AFP+cbn8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7112606A31B
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 08:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7112606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AFP+cbn8
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-886e61fa30fso1045884b3a.1
        for <imx@lists.linux.dev>; Mon, 26 Oct 2026 01:21:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793002888; cv=none;
        d=google.com; s=arc-20260327;
        b=RPTyyqXzJjE7p634OyGixepuR4cTO1uNqHbT5JGm00WKJ+SPWm/aZVzSx3jBh66bsS
         DsT6WtS7fErD6hVwsEG+r9y0MYz8zlZNooATmwr5qvGxYQExTK5j2oc57mbQx96nOXW2
         9LW6fuHzGqNnLOrfQ6NZRWE0A2vS6MB2lrXLUCaZlowVQpgLPnjLzr0xuEjrqLrOmDbZ
         CTLL/q3+dGkFv3nyf0yrv0d8SVLAJijG8/R91i5zRzx2sVPWXinQndfX3gvCFIJMP0v+
         72zpnvPHHwniOL7UDm5OWLfe6cXJtZKuOIB+YmQehphW5APl4MiV/mfWz38EdhLys6+X
         C62A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x3YIRl+8jG3N04z3aAGjtNPDALZjVxEdDCHikUWgSTk=;
        fh=D5NlM7XvPtXmtioIelTQCCIFREqEewPOUXOo8fXzo7g=;
        b=bYwQDRrFSSdaE4m2ISF476BszPrNT/PatDmzhsudvfJjVZPE47jzpCCeCtC/iKgTvI
         ELd+i8+nArKJ0mU0kcC/jsstqW9263lifcRNn+9+o32n9UDkReIAySvreipoq5wxZJn2
         Sh/CzhtnVF9gdAs5zX+PtjPgQvlWof/FvdpgaKok7hFrKYgvrQDpHx3Fp3JDaAkx967c
         buakxTELiXVxnkOv86KMfzgu0xbW8CQiFIjuSAVY3rCzrK5ZvJm+J5hHA/JuIYrH8RT/
         tB+ZUvvf+MsZKceGsrwr56GChMwLQrL6eq1F0Z0Jnww8i9mGcvNummjh3sSNTEpe6tYA
         cS+g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793002888; x=1793607688; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x3YIRl+8jG3N04z3aAGjtNPDALZjVxEdDCHikUWgSTk=;
        b=AFP+cbn84s2av4MCkNRl+cB/ZqP7j37Qwqp05sCxIexcXP9ZijIHaih+TCNR2/otzz
         4YQD+xrTNgZUSp9bkpNcOgIgDYK2g+Qt9PGzHdPnGCdooEL6SjZ4ldtjGwnUC70tIw9t
         UnK04J6sEO9sqZtqAtPCRMcJxtzQMo6pUpNtVdSsoDxRqQQ2ZCLnoS/8QGwH41j00+Z/
         +VDx3p1jjYse4kBz9liy0JQRp62Qih6QDRbvZm825ibwhhhiGwu3OcxyJ22h7Iw/o3v4
         9T/QxWb5Y7BgNXHwFawt+QuM5u3nsnutPPAPV+5jYj8HOH18RaEKqfY8CJiibt0tm5p+
         ZbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793002888; x=1793607688;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x3YIRl+8jG3N04z3aAGjtNPDALZjVxEdDCHikUWgSTk=;
        b=BqZED9JzxJ5rnM4aHlvhSiZhbiQWI11Iocjxrfmhu/QYLdg3N7koMZGa8TtZf+j+1X
         iiQ51UiHN2qsRbPtQAHDU3MauO1vXz/R0/NJM4SV2TmRY9hr7iM4v2JPhcWOf3ATDShQ
         E0AzzIi081E0FfmADQ0xYllTEr1kIs9/8NK/hzJPEDD7jb9owtYo7gW4jwXHkS32v7E/
         SZVLw0UAZxFHG983a3BX1cNeffSpUMvwc1UmG9Eu9HEj+IA7UEDfUU0R1Ln9lxh3X5ff
         m3FnCqIMIv69n6Pu5sAfo1eL8z/+jE9YxSh1J0lSnqa7uGXGd9PAaTEXDx4GLnllqpDh
         pFqg==
X-Forwarded-Encrypted: i=1; AKwUvBwlufKPY7y96LEPlbc5pOj4MIoTNYfFzfwSAWhzaClZYBxuBRvKItH471D8jnr12ZZcXsM=@lists.linux.dev
X-Gm-Message-State: AFq9FYI7a/L7J090CjU62eXY941TXCPJF8LK0JsRhxkBZzSQd8gJqHa3
	k3nHp8NkCkslpPMjKgBTafIcQ+Uyvb3ffX36i8a7X5U5OolfTF5ikdIYcYnnlnd4QVknXQ1xAQo
	BNSXPKN9quhsKmrzWIjhHwFqAM8s9cZdxG4+S3ccERRb/
X-Gm-Gg: AYBFou3CBLh7YIcyPQZOIeJ8NvliQRpDSsDrfTzQBzBRc0sovre3kx8nGu1pgQIOA9b
	J64EqzD4urk9AiIVd0VbSNhFVqW+GlvwruWwoKO3Ru2yFvSuoLCLQTkGj1KjX+eRJAUuDLdNZSS
	tQQ8g6mcRCCKRbtO+oZ4uJdl5Ia1AYesctL84bjzVucVsFzX4aTV+zTD5f77LorwAOKu/UTrYyF
	n5vLG74522n5Jl3VRpqxfoLz+HzmLJnJ3WwXznytfs2ebg+odxXDy9dK7ZGxk05oH/KktlpLuYg
	k+NeK/DKPP1ojteI/A/ZAPIg+NDKMIxyL8Xc7bL/kAHJNNVteZ3DiuvLLgySTFzQFUWgv9tFUZq
	2BKFUYfNUARMDZwyfQma0G3TWa0D3gPpV31AbOacPFXcsc2UkqP1H
X-Received: by 2002:a05:6a20:db8e:b0:3dd:85a8:cad3 with SMTP id
 adf61e73a8af0-3e7bfa95ca3mr4905748637.42.1793002888123; Mon, 26 Oct 2026
 01:21:28 -0700 (PDT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261026003918.155321-1-pmazzini@gmail.com> <20261026003918.155321-2-pmazzini@gmail.com>
 <20261026083058.04173f10@kemnade.info>
In-Reply-To: <20261026083058.04173f10@kemnade.info>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Mon, 26 Oct 2026 08:21:18 +0000
X-Gm-Features: AclHuK-pzB2ukAo43D26PIOQvYip4LrlulkX87-Zh2YxM609r20rprIHYc6RIYc
Message-ID: <CAAxh=jvGJVNTU6o9L-8-AeHDVHBcBwJDxwwoNZDwMN3tjRk1pg@mail.gmail.com>
Subject: Re: [PATCH 1/7] ARM: dts: imx: keep the SY7636A VCOM on
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alistair Francis <alistair@alistair23.me>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, I will drop this patch in v2, so VCOM stays off until a consumer
enables it.

On Mon, Oct 26, 2026 at 7:31=E2=80=AFAM Andreas Kemnade <andreas@kemnade.in=
fo> wrote:
>
> On Mon, 26 Oct 2026 00:39:12 +0000
> Pablo Mazzini <pmazzini@gmail.com> wrote:
>
> > The SY7636A hwmon driver turns VCOM on at probe. The reMarkable 2, Kobo
> > Libra H2O and Tolino Vision 5 have had the rails on so far. Mark VCOM
> > always-on before the driver stops doing it.
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >  arch/arm/boot/dts/nxp/imx/e70k02.dtsi           | 1 +
> >  arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts | 1 +
> >  2 files changed, 2 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi b/arch/arm/boot/dts/=
nxp/imx/e70k02.dtsi
> > index dc7ff108aa85..bd9c6c6fa117 100644
> > --- a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> > @@ -154,6 +154,7 @@ sy7636: pmic@62 {
> >               regulators {
> >                       reg_epdpmic: vcom {
> >                               regulator-name =3D "vcom";
> > +                             regulator-always-on;
> >                       };
> >               };
> >       };
> No, please not. That regulator is in practice used with a not yet upstrea=
med
> driver for the EPDC on that platform used to deal with the current kernel=
s
> fp9931 / tps65185 drivers. So it is very welcome to have it not always tu=
rned
> on.
>
>
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts b/arch/arm=
/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > index ff9d50942884..6cf5603c0752 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > +++ b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > @@ -327,6 +327,7 @@ sy7636a: pmic@62 {
> >               regulators {
> >                       reg_epdpmic: vcom {
> >                               regulator-name =3D "vcom";
> > +                             regulator-always-on;
> >                               regulator-boot-on;
> >                       };
> >               };
>
>
> Here the situation is a bit different. If I remember correctly, there
> is some special EPD logic in userspace on top of some ordinary kernel
> display driver. But thesse things are missing is devicetree?! But
> that might need to learn to deal with regulator enabling/disabling.
>
> Regulator always on is probably not desired here, either.
>
> Regards,
> Andreas
