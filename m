Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AA27F477
	for <imx@lists.linux.dev>; Wed,  4 Jun 2025 17:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749056516; cv=none; b=Np48R0ngT/PiegB9mnXwY02XDm6yMrXrzJV8XN1HG8CmZqwIpJsVo0h23hyqL8G5V2hjVvv1/CagtaJdYrv1r4nebdkxCSs/db1YSS5Ca+qHvD29Aq2UZ6loKVJ+61ERcdXCOWiZ2Lc/G3McMe3Zso6QdmCeKnJ1jcOLEVfwrgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749056516; c=relaxed/simple;
	bh=z4D7BKewdsk6/sKzjeJAuyPQOP5LvNsLtoRKwrLZjwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CdqbYK291Sdq96MJ3G1G+LYzKW5e0Nm40WsBYXAYxrtfGF0+unJsDMxOJSrNjOp7HBs8OQE7e+3dLbrSlDvrpAmqwU1FWNZQJmmheK+TsFuEMMw4XAvSezN+Zn7TEQCP/N+LuTf/fwITHXZ9jtEhflbIvw624YYsGqnBfL2vH0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YA2+Rh0b; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YA2+Rh0b"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-710bbd7a9e2so1034167b3.0
        for <imx@lists.linux.dev>; Wed, 04 Jun 2025 10:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749056514; x=1749661314; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4D7BKewdsk6/sKzjeJAuyPQOP5LvNsLtoRKwrLZjwc=;
        b=YA2+Rh0bpcCY2v4qqhvuxl5eGwNNP/ZOp4UBzmp9YIt+72NT218n/++fWWrlIX7BYq
         vOM5ks2SCHwz3Ku+kp9xowMJx7/QyrTEWGK3XBmwnWUo1wrncveG+lYhyOR/MnCPWQN/
         VrYjYjhaHSPD0T1f/4yAy89oVM86MMQCwRyqXJx3Mh02c9j1tR68KViJFCg56A4iMV9c
         hJNSaKT4t2sQAob6neVUVMQVBCQONt9dM3xRwDy90LBbeuCLcXweDSO6oy86dEf2n0wZ
         wrZP5f/uCHiSkDg0xyWw7o6nP6Rty5XmX6buScnUtHT6WmOspzS4xbHy2EvoVRCUsAqT
         xgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749056514; x=1749661314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z4D7BKewdsk6/sKzjeJAuyPQOP5LvNsLtoRKwrLZjwc=;
        b=A3PXFANhH10gV9Iw3+U+4espVhPeg1490S3Kd2drsDony00Y32vZDA941E0KQR3j3X
         GzMviugmOcAy5SXjP97llGr1rgQjo7ozzz7Jj6br7KwrlKxaaF3MQq83MCIWZSBJJAIM
         HSB6AH4XUTeZInwbF8wZ7DUKPqaX0s61CGeXnunURTSYtA7Tujknc/jb1eKoXFrnPkPZ
         VnXpK0Qu/A4VszGsePD/o/ud+12Q58icSTKXgI7tKllPcMe6ezN3ynrsD+coXLpxkjq3
         Rdj+yijCj5Zho0XidcBQohLWGxa+/VD7qM5corMrJJwhUD2ZVJtxcvV7ukudqksbz29K
         xVZA==
X-Forwarded-Encrypted: i=1; AJvYcCWtk2BXJOgPXLTfql9qw51mgkzPw9H9jYhHth2OdPU2KDvwzdzmC/AowesRNU2RsZOrRco=@lists.linux.dev
X-Gm-Message-State: AOJu0YzNk/MN5Jh/qUKC33PneB2txZl8Sfn1m8T6CgF+Ra0w/agDnVSF
	op5eWrOLiMCLQvaJZv5RxhL/XLvsvcNQocfkCSncVMXwkY24rBLTlxjr1AisH1uW2MhXyLgwHoi
	Ba8YdVhqWABUQQPlqrvjUCs2vi0zEmnk=
X-Gm-Gg: ASbGncu+K220fG++yaBerQHQoFXi/fDWTjM8dPng9Dqt/jlxV+OtC+1tFzU+dKr2+o3
	IMZaWUBBgSI5yyvoWoWk8NPBeMEOrqaKLJAoN2nT72NOno/72gwpdjhZSuLxSumsT6/rWoCKqwM
	5Pk68oe5l8cdFWfbOqLy0bCfiCZPIV4Ls=
X-Google-Smtp-Source: AGHT+IFIhKizpoGLqwiOSIUP8iiRAfmZbXmSeT9TIyueWI/d67XSMiKCYVWQ4BB4rdEMzKzneBplYge2hVU91ufFUJQ=
X-Received: by 2002:a05:690c:9a91:b0:70e:16a3:ce75 with SMTP id
 00721157ae682-710d96a0d66mr49320637b3.0.1749056514120; Wed, 04 Jun 2025
 10:01:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250604153510.55689-1-stefano.radaelli21@gmail.com> <CAOMZO5BYBMq=5ir8WQBEH=h6SPpm4MiUrDoDJvJEH6ioUCB11g@mail.gmail.com>
In-Reply-To: <CAOMZO5BYBMq=5ir8WQBEH=h6SPpm4MiUrDoDJvJEH6ioUCB11g@mail.gmail.com>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Wed, 4 Jun 2025 19:01:38 +0200
X-Gm-Features: AX0GCFsB5wB9ZHZCQ-2HQEOl8VOk15KDbCSQ2np75Eb_OgkyR8kGihI0TyVk6mw
Message-ID: <CAK+owojFg+A-_akaEO5wn=ghQpHBEvtc25bFp9qJX-vHh6SuHA@mail.gmail.com>
Subject: Re: [v2] arm64: dts: freescale: imx93-var-som: update eqos support
 for MaxLinear PHY
To: Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, othacehe@gnu.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fabio,

Good catch on both points, you're absolutely right.

I'll update the subject line to include "PATCH" and fix the incorrect refer=
ence
to the Murata chip (should have been ADIN1300BCPZ, of course).

Thanks again for the careful review!

Best Regards,

Stefano

Il giorno mer 4 giu 2025 alle ore 18:44 Fabio Estevam
<festevam@gmail.com> ha scritto:
>
> Hi Stefano,
>
> Nitpik: The subject line of your path should be:
>
> Subject: [PATCH v2] arm64: dts: ....
>
> and not only
>
> Subject: [v2] rm64: dts: ....
>
> On Wed, Jun 4, 2025 at 12:36=E2=80=AFPM Stefano Radaelli
> <stefano.radaelli21@gmail.com> wrote:
> >
> > Variscite has updated the Ethernet PHY on the VAR-SOM-MX93 from the
> > Murata CYW43353 to the MaxLinear MXL86110, as documented in the
>
> Murata CYW43353 is a Wifi chip, not an Ethernet PHY.
>
> I think you meant:
>
> "from the ADIN1300BCPZ to the MaxLinear MXL86110"
