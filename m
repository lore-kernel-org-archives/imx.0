Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D38E2F7AB4
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 10:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764154516; cv=none; b=h9xsgM5dez13sbIJWGwXn0iCSHt+B6XVaQ90oVo4tIBXI62MH7iFEtKzzJ0Oq0Xz80pg1j7yhX4Tq2PsdR2KYjE0s6F/Pm6CWPXZYEktv8z7W6NZ1J3FbI5lQeLpa+isAS4h1hBS6zsnLJUyHt6Hozk8QuQJg/79oyY92YdHN3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764154516; c=relaxed/simple;
	bh=ox7MSuzPIeIIE7aLoA8rsi8xRs8yOy1dZB8ukDyKoNo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E/fg8m8CZZIRI6Bpyf5IZvujyr46QDiLjL/F6BRY7eDTZTkiwysLvKlirfKVhN4VREU7QNjjt68wnGAjYKSwr0+5VIcVDIAbWUdRQpDx39PovFSHtRL+bcJv4HYp02bc2vTjwY8bwmxNBUE2EPlnXvQt+H0Cxlifg0BMzzlVRxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GkzlRKdg; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GkzlRKdg"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso28116765e9.2
        for <imx@lists.linux.dev>; Wed, 26 Nov 2025 02:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764154513; x=1764759313; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ox7MSuzPIeIIE7aLoA8rsi8xRs8yOy1dZB8ukDyKoNo=;
        b=GkzlRKdg6Ct0mrYu6WGu3iwfJFEh3GIflPcCvohA4FwUW5KKBlWBKx8m01AIMkRwsf
         JrW0yP4d/qB4eIAs5DX7TFEOWPJarCzQQ1n18QUo4BKlJVe1kpI34/b3colbOxlDkFkw
         q5XZ41FueycqB/SnKDI3NQknFeBJ+KIjGaOahNJXiLn31Cr7BzoHCfWPd2H11Ag3n7a/
         aS4NlQxq0MXwBamcfczoieocz+xeKfUxktJvyRcz+BCNgeT6Z8blTo5A0sBPMGwSdbMy
         FnAf/RJ/37EyBYzN+g1JyxpObVmIYfIAyLNzz0or4DejOKAQJu2vXjohxv8GY0fh7sJx
         EYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154513; x=1764759313;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ox7MSuzPIeIIE7aLoA8rsi8xRs8yOy1dZB8ukDyKoNo=;
        b=foDMG/n01ExRhTzAnub2arjMMkh1vTfJZnBdGqwdlVKzE5ERe9SquxmPhN6BoqEd91
         hXE/fxobUvKy0yOJ2RTpRyhpHEHocZMp57WxmTtDP2x0F4t23iyWVEkgeaHsWWVqsUoR
         xUBijI9dQvVaVIHb9/deri4MI0V1ylZYnZ33QvTRbqRZ2wE+jVoIPy+yza3UqVb4DMx9
         5R67wWi8TeEMdYvSkN9bGdPoIzAoJdDThFQz+6JBFxLevQcKVGpwUQ9Kgb4zlrWrKqfv
         AuZfFThJLVNmYAlwaoG3a5nOW/dQFRotNDhTRj2jzPY8KtKLp9BdzGXFQcxJCdZYp+wq
         zzTg==
X-Forwarded-Encrypted: i=1; AJvYcCWLfoucS2MwW/UR1Ii0JNt9kG8cUeU4sb9gJK+XTUgQYXQGQhLD8Ksc2RPNNYVxJeFBC4Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YzU343mt5uBuVx/QhLWzO61HXaCrAIYmR4AMUbkRTUD1PNHkyfJ
	inz82abTxiISmcBH6Suugvd6x5n2JvjKmprJa5dinLmF59izL1hF5yNU
X-Gm-Gg: ASbGncsvDidpeJhf2mROIOAH3peyGGii51FOoy0WCXEtJ6OFacBlGXjGYcNyAVB6mLg
	5UF4sceiewHiXBPaqIPHh066WSe3MHhvD9vX++906ZXpz4vNs1HaATqH8LefTTfD5opG6519xHS
	eUdgu8RCobF9qCE72rVyV4apA3anmwL0PR9PLS3fCuBsuQ3HXtujopL/EH3sTHl0geXzUEyHRv6
	LioOW3OQR+meMkypf6JTLdcY7zl1xO1wCa4k0TJxjuBvdhVvXenyaPpT0O3nyGHoWDLb4U3tGbc
	q126yR8TkNA1IAKgpQzX2GfZMzEnbEpHhgY7xcCvH6KrrSLxctjGxc+D6g05zAiyNbvZGvA5fvU
	0E5NBCf9t0jXGxXuXNx39mPBvr/wmJQLJMHo5QROtCtsQebt4/TmDmOqCorvtxoiBiL7Cce8gSC
	dHv+X6xxQkz8bQe5MhRf0Bn2Bq6pGAfd/+LQ==
X-Google-Smtp-Source: AGHT+IHcHI6170B8NfKQQMp8egrR1vGwUk5xF9DhlZO/uq9fy+Xjr5nT4MGqEAz9VgSn2UVWyQL5GA==
X-Received: by 2002:a05:600c:1d0e:b0:477:bb0:751b with SMTP id 5b1f17b1804b1-477c01c4d79mr178895815e9.27.1764154512550;
        Wed, 26 Nov 2025 02:55:12 -0800 (PST)
Received: from vitor-nb.Home (bl19-170-125.dsl.telepac.pt. [2.80.170.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790add2648sm40933725e9.4.2025.11.26.02.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:55:11 -0800 (PST)
Message-ID: <ac727d79bdd7e20bf390408e4fa4dfeadb4b8732.camel@gmail.com>
Subject: Re: CAAM RSA breaks cfg80211 certificate verification on iMX8QXP
From: Vitor Soares <ivitro@gmail.com>
To: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev
Cc: horia.geanta@nxp.com, pankaj.gupta@nxp.com, gaurav.jain@nxp.com, 
 herbert@gondor.apana.org.au, john.ernberg@actia.se,
 meenakshi.aggarwal@nxp.com
Date: Wed, 26 Nov 2025 10:55:10 +0000
In-Reply-To: <b017b6260075f7ba11c52e71bcc5cebe427e020f.camel@gmail.com>
References: <b017b6260075f7ba11c52e71bcc5cebe427e020f.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

++imx@lists.linux.dev

On Mon, 2025-11-24 at 19:03 +0000, Vitor Soares wrote:
> I=E2=80=99m currently investigating an issue on our Colibri iMX8QXP SoM r=
unning kernel
> 6.18-rc6 (also reproducible on v6.17), where cfg80211 fails to load the
> compiled-in X.509 certificates used to verify the regulatory database
> signature.
>=20
> During boot, I consistently see the following messages:
> =C2=A0cfg80211: Loading compiled-in X.509 certificates for regulatory dat=
abase
> =C2=A0Problem loading in-kernel X.509 certificate (-22)
> =C2=A0Problem loading in-kernel X.509 certificate (-22)
> =C2=A0cfg80211: loaded regulatory.db is malformed or signature is missing=
/invalid
>=20
> As part of the debugging process, I removed the CAAM crypto drivers and
> manually
> reloaded cfg80211. In this configuration, the certificates load correctly=
 and
> the regulatory database is validated with no errors.
>=20
> With additional debugging enabled, I traced the failure to
> crypto_sig_verify(),
> which returns -22 (EINVAL).
> At this stage, I=E2=80=99m trying to determine whether:
> =C2=A0- This is a known issue involving cfg80211 certificate validation w=
hen the
> CAAM
> hardware crypto engine is enabled on i.MX SoCs, or
> =C2=A0- CAAM may be returning unexpected values to the X.509 verification=
 logic.
>=20
> If anyone has encountered similar behavior or can suggest areas to
> investigate=E2=80=94particularly around CAAM=E2=80=94I would greatly appr=
eciate your guidance.
>=20
> Thanks in advance for any insights,
> V=C3=ADtor Soares

Following up with additional debugging findings.

I traced the -EINVAL to rsassa_pkcs1_verify() in the PKCS#1 v1.5 verificati=
on
path. The check that fails expects a leading 0x00 byte in the RSA output bu=
ffer.
To investigate further, I poisoned the output buffer with 0xAA before the R=
SA
operation. CAAM RSA operation returns success, but the output buffer is nev=
er
written to.

During debugging, I loaded cfg80211 multiple times and observed that
sporadically one of the certificates gets verified correctly, but never bot=
h.

I confirmed that other CAAM operations work correctly by testing hwrng via
/dev/hwrng, which produces valid random data.

Given that CAAM reports success but does not populate the RSA output buffer=
, the
problem appears to be somewhere in the RSA execution flow (possibly in how =
the
result buffer is handled or returned), but I don=E2=80=99t have enough insi=
ght into
CAAM's RSA implementation or firmware interaction to pinpoint the exact cau=
se.

As noted previously, blacklisting caam_pkc to force rsa-generic resolves th=
e
issue.

Regards,
V=C3=ADtor
