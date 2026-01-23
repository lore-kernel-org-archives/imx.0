Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEC6335061
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 09:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162394; cv=pass; b=V0KgQyxVs4hEGDNm3dkd6feyCJPHrLJTCAV6SzvEEuha0720uhFOe1Vs4Z1WoR72g5wTwnlGa3qTw5STD5zTLzoGRlOStkhfXC8WJcNgM+euaHER01BGvKc0GpjHcx2yntgYJgHVe/5RZmP52WV5Hf2FNTjEQDKk2HWM9zCoEzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162394; c=relaxed/simple;
	bh=s2XZ7fExqTRh/OE8agmMNmU2aj+X94krVTGuMQ+dj5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iSlInYPeYSVF2/ZVGIt1Xf/VrdJQAOK7i1kk4MOpoEyhxKZHWZzeIjd77mbSeGxVH2WurUwSK0hDeAdZHHqRPGqkrZHWDw2jGC471nkhJ9UtlfGTHEdD0YN2QLYUfZvPAXg2R6BZjM+bbhtEs/SyhaJDkfgjztm0dl28kuKddI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WQBdd8UO; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQBdd8UO"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c1e4a9033abso1195226a12.3
        for <imx@lists.linux.dev>; Fri, 23 Jan 2026 01:59:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769162385; cv=none;
        d=google.com; s=arc-20240605;
        b=Yb6P72Pm3lfGT6rRCYubVKnVI5yV9pg1Dyor4P1Jyjwioj3Ac3BW2PlmZjyILxlx5+
         8NwGUfxsgonVCZVMQ/v4HjcbyJSgcgZd5R3lyZDxx56bDFp9IcNqxktHH6ocqzklNXoV
         oFnpUW3ucn/ECQcxhpk7o0k5Gzp1zakjlf4nX5wk9fe21y3FjCk38wlc8D7WeN97P15B
         f5TNl0R9sMp6Hr/6jKtDbdZ8nkQI1GEOy3nMC+nXW3e9nj/t3xPd6ggLv6VPPVrs3gDx
         FGRGGKtnR0vqK3TvqisZuwoA5gqNmUw5DhDdcFwHjGeySMEdEUqIn11695d69lgxuLMx
         g2Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3LIzbWVdgCXnrKY5TjdEj2KcXOi2/TbdKDHeIlt1MwA=;
        fh=jnF/3Xq/0eGTItJu1x7uS6zUdRQf0SwR2V4eHYYnTmE=;
        b=cC3Q3XPW+mqG2/nthG96wNf5eW2NG2cj3haV4hQjB4tbsJtnhFFsL3AESLiZvXSHpc
         0Y0ZaEPrZdJjxCHHssRX0Pm1aJpp4usajmOnwyUCraIOlzbZUdq70HxMWH5sIoF2q4JN
         xoVCcxRb01ZHULjxMcDH28mWdXN1w8/DMcoM6q4mOmXqIrWUxPmafyh1xzMLYI5J4kA1
         gDhZg652dq96JNvqm/xl0IK3T3MaKkBLfc5Nyb8ClJrTybdrd9oBqmirf5X54KfcMdMA
         kzDzHCz9+VQsodYu3cX7WlTgcK76hIG2at3PmGO4954jsS4GpM+BfvywZYpLM5a08t8d
         EIzg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769162385; x=1769767185; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LIzbWVdgCXnrKY5TjdEj2KcXOi2/TbdKDHeIlt1MwA=;
        b=WQBdd8UOtOtlTDUacJKhraVo/TyqsQEpiavos/vpTP3+c44lQVL9KfQ+hl8FWS3Srk
         LHdW6VGB+IlJd9AAzU9tyh/5QaWY8DEDFrKaS6f1KliNp0Uaod3Qt/QFkoQoarQSheDR
         iv86mzk0xZAvoNlq/7HHZ1JCMwpNB0mzWbcZUZaDveMLpyBLski1GTZnkoPP0ZldUH3i
         wkJe7CWfIWxE5wZ4bMb57YOJHJC64NpsUJPLwV4LsQE9tBq2tIaZrTh7srY2JwczmmHn
         oBi7W1g4EOCXgORWKU1rp7oS6vYToITrVM+YgcGz9qLEQB9fflf4fa58BEIPkp5wUZ18
         FQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769162385; x=1769767185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3LIzbWVdgCXnrKY5TjdEj2KcXOi2/TbdKDHeIlt1MwA=;
        b=YxjXLKmWcxtOqgro79853AL/hEFE9OF8sCaiASkDsSms5wS86loUREfs5r5RNiTDmH
         T//Er3ws7QhT8e+3HPkcbjkDBZClIV5f0d45YPacXmiKqhKMnIq/JwQvz1ylEJ0ZFct8
         Cby/HG/QIbaghnUHBncYt1BP2mmaxaEuGO6xFGG/FBLk0JWkA6FB8Ur4b/HMLB9R6P9b
         3fdScHt6mJjgCHdT8NTlkykseoDy18mSaE/2Z/0gnbUqjQCtV9UmTodYQMe877S9Oi0/
         la5JptWC6yotuJYWRsEHt/Rf8Ca/08qCpkAwvOKk1uBLfSov7bRGm5LHMge7iyFjX7aE
         S5Ow==
X-Forwarded-Encrypted: i=1; AJvYcCWKzXsrCjmv0/aOq223/GYaaSptBVCxCpa33BKp5PeR80/Bcrwb40B43jba8POsgtomSK0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNPEuOJPfHW5tM53+o1VbNRfxjBtg5sLm5iDIoSLbzSXn6Ucb6
	lXPeRfdU0AKpuL55wwTnzOqI8cOg81BTkaAJMDQwZwmeowgd0WKqtG4vYLncSejWQ+heqtZ0FCx
	uJO4GKgXtOt+Ez2E2xq/d2gOFiw/kIkQ=
X-Gm-Gg: AZuq6aKm5iSMdAd+LM8LAjYjWie4o8fgd8MsYYhwSbhKAROvnE512aX2YpBUWTgPnqn
	leAeov3nPKYkvAVyPaHaABv1q1dPJuSsdK5y2cImyMl/AAWGz1YMJ1SBqft4HjkaBJeDfwfgB50
	HofgnTaLUJQ9nTSQBW9CXohdHcf8roAuApRv2bwo72RkyC5pUOIPEzUosT0/NXWQV9sjDUn/Y1C
	/F27yiP2uGkv3di38am6hC+QFJao/zTmmB9jQDcDYeRm+DlzyQmNhiOXFrKt6P0WBDeHpHaj1Wp
	25SU8Q==
X-Received: by 2002:a17:90b:1d86:b0:34f:62e7:4cfd with SMTP id
 98e67ed59e1d1-3536894da60mr2059229a91.24.1769162385274; Fri, 23 Jan 2026
 01:59:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260123084844.4051570-1-shengjiu.wang@nxp.com> <59773aa2-5949-490c-bced-b8d110152505@oss.nxp.com>
In-Reply-To: <59773aa2-5949-490c-bced-b8d110152505@oss.nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 23 Jan 2026 17:59:33 +0800
X-Gm-Features: AZwV_QjBHIga33vSKBW1pabNQ2XL3EH5NV4mXw7-SfWsbUjsOOrrguhwtZWL6PY
Message-ID: <CAA+D8AOSzBNOoET0_aJRYhf9dsDu4mQqGWso9YNN_HNQU1582w@mail.gmail.com>
Subject: Re: [PATCH] bus: imx-aipstz: set default value for opacr registers
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, laurentiu.mihalcea@nxp.com, 
	daniel.baluta@nxp.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 5:11=E2=80=AFPM Daniel Baluta <daniel.baluta@oss.nx=
p.com> wrote:
>
> On 1/23/26 10:48, Shengjiu Wang wrote:
> > The sdma script app_2_mcu needs the permission to access the peripheral
> > devices, so need to clear the Supervisor Protect bit of SPBA2, otherwis=
e
> > the sdma script can't work.
> >
> > As the imx-aipstz is a common driver for all apis bus, so set default
> > value for all opacr registers, that the peripheral does not require
> > supervisor privilege level for accesses.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  drivers/bus/imx-aipstz.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> <snip>
> >  static const struct of_device_id imx_aipstz_match_table[] =3D {
> > @@ -84,6 +99,11 @@ static const struct dev_pm_ops imx_aipstz_pm_ops =3D=
 {
> >   */
> >  static const struct imx_aipstz_config imx8mp_aipstz_default_cfg =3D {
> >       .mpr0 =3D 0x77777777,
> > +     .opacr0 =3D 0x0,
> > +     .opacr1 =3D 0x0,
> > +     .opacr2 =3D 0x0,
> > +     .opacr3 =3D 0x0,
> > +     .opacr4 =3D 0x0,
> >  };
> >
> No need to zero these fields as they are zero by default being part of a =
global var.

right,  I will remove them.

Best regards
Shengjiu Wang
>
>
