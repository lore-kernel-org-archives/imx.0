Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9483AF65F
	for <imx@lists.linux.dev>; Fri,  4 Sep 2026 03:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788491511; cv=pass; b=DMTXOkMHxV9cTa9qkbd9LSukUOOn/nej/E/jwa6tL873uReWm2nfJUjmSDke+9X5+ztrcUZeYILi9h20pM19YzQwnrE2gySXuC4J3fNSaRFBQR4Urfqdx9479si6aUe80EfJ6FSorOVBSTGLuChrxYGYfy+62ZBHy6u0AQ8W1qU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788491511; c=relaxed/simple;
	bh=vfRlFYrZG7tQcJDkEgmaPaaxAK6OS6eQsP+WeAvUDW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OIZf3h0FLP95eod5Ig13/l0I9HnP+83Bgg9mWgUJPF3le2OHIa0+B8fmk47K8Nd1kolGuR690ZoWXMd/G59Q3/YlG4n0AM8tD51gl+LuyiBQEyZIV5lSkjR6oY7mwUUbP/IO0bE5DIo8McAbfY0vRl3LXYCvfUQ7OxpJtkRlIJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNu0cri2; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNu0cri2"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d942c7cc2fso4337335ad.3
        for <imx@lists.linux.dev>; Thu, 03 Sep 2026 20:11:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788491510; cv=none;
        d=google.com; s=arc-20260327;
        b=R/hC4aWQuE9qXlNY7Z6zlthpcDy1UWJDiAFp/OTKGa9g8iqevHt0C69vG+uYGdp4Bk
         eiENPySZGbb/jfE0cYi9GV+oCdYMDhcl3f10RNaDr5GclgvaDs/TDLXFIONE5femMD+l
         z7ym1xIgu7QIBV3AtozLgzLTYKkMt3XQtnLJQmfX+RcfMZ4pxZhMleXR/QABzo7NhjPP
         F3OrQgK6rxlfqIR7EBXueRj9hTill//6fds7ZhcJNHHt5oBbgp02GqkKB+43WRuWEVZX
         eTLfK1SgSlq5C2aa7U8cCkavuhnQHdpCyFFATqAORjyypWUuTRpSoiTok8gxmPRip4W7
         TZGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vfRlFYrZG7tQcJDkEgmaPaaxAK6OS6eQsP+WeAvUDW0=;
        fh=I7vUqk6x/8A2YyccFR9s7dgUqNLY5timFbTj9ul35mY=;
        b=psUBDl3hISOopgd7aTqyUXWm8/2rX4wdS1iUp+gtK2b5ys+qMDM+xftLnnfTnkYqp+
         QsoRxj7nwGcKM/E8Or5HTx3na0pg6zNzzRr0ijCAK+xHyz8MYikxdHWQjZz/z11HDSln
         dwEfrKaOyHyWWRU9ebm65ewoZa7kRNajdFHF+M/RfGHxMTtGkrJ2CcuMCASCSBNPo7l0
         PYzAUsYWe42LuVeu1HD3wGUtrJJEonzbmcwI3DOLLGXO/P64Rd4o7cSNiLoHdUHJrH1I
         tfl1ulPFp54aWqFJIHys4GbgCtonNQ4bMNJKITTF7ju0knLyuf8MM0YkWCksbyOAWZ37
         q5fA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788491510; x=1789096310; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vfRlFYrZG7tQcJDkEgmaPaaxAK6OS6eQsP+WeAvUDW0=;
        b=dNu0cri2qOK4KA/sn0Z2TUeCmQUTO2lRZUnrpLFaLMvh6sAts0bNhE/304cuhrh9An
         CPsTRzxnEvaoynOy10gx1G3G5G7dUASx4CX1Iz5IjeMwR7QA7FXa/3EfL8X3M3zU9ZjM
         ingX9LLS0K8j+rukzjvsLiHj4N0P+j0K/1lf/MUkxrdP/Asopw521NDoLQJmdQT+KWSz
         jxDtgfC3Qim6d7xw+WHuRhxpXalu32+1UArELCuCqkDjBnf++oVCRemRzRsJcV07Yktz
         XtRMcwtpfaSI7jZzuuMTZJ97dP6LtABlyZb45W+fXrDZddbA5CUkCX47UcnoaX68S0fN
         rXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788491510; x=1789096310;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vfRlFYrZG7tQcJDkEgmaPaaxAK6OS6eQsP+WeAvUDW0=;
        b=M1DoNOZDgBqHePGhHfAr0EtUYcgz0bGp0eNsoJZvkOKnzvQAyogkeUdyQC68WB41dx
         YfxiaFMPkmTDQp+Hwzn23I4XddeoLogHAFTyKp/Ulph+gD6dBGVg85oXdeFmW2LBdT5C
         Rw6e+/f7kcoT1KCI9Vq5/nV55GH72JWpwhnsHbjMxu5YPAIOj082KS/mZGOetLEtEGcZ
         2hIf0ZPNjbIA753v1pKzsZ4GLbwm/qykUV2g5gb+t7CLha38yln0QHk/ltU+5PMvWZSl
         xuq9FM0e1zQl4IVEO4HkIrn3l8mRqjmhWZlHDws7Givhws0p85iv+a8EMUHkZNF00MGe
         PesQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCjAzhWJVHRPdG7dm3EfcLpufkNQu0JrOquhqcJhtd8Xb74iHOzAoqSn7EYGf11ebMb3c=@lists.linux.dev
X-Gm-Message-State: AFuF++lD/g2xO5FxwCG7NXKYmvFL91yWMJMRlboEMLF/LRVJdNeYt5wL
	xL1NiYjiBkTCNaVwEYrnab3DgPXsWVtnyB7YD0XqASCd4ig10ZkI4gbdOqhbVG6q/eP+kxwhAz5
	LltKFOvf7/enNJW42bhvOBUNGiAPgrrQ=
X-Gm-Gg: AYBFou2Fwh1lLGrgqOaD6Y0pIFfBH4goHTsCAdEaWuVjskcfKKgF7/IrstkwoBYEq99
	xAkeh2LJAFgN5+Lrr4SIzXXvXsSfuFgKqlZt7S/mJOT63kzwySbKnWes4zoTM61LusPX7sWQRei
	nDvPRsEFJlvCv42YEpqt0zv86Jn2uSpjSHTQ3Ukd9t9xwYRhVbn8gPT2G4YmuXoewbyRGBkrbxb
	nyyZs05DnFfa0DjEkZur5jNnfvYGoDShs3mTks0egomg3MNB5wxmecRSU4z5V/JHVK2sXsj1/zu
	tqo/7PZZMaFYzmhyIQpP8Cs+/MQB+gV7c5tdrCExpPGR
X-Received: by 2002:a17:903:1acf:b0:2d8:da29:da41 with SMTP id
 d9443c01a7336-2db127509bemr55944165ad.15.1788491509602; Thu, 03 Sep 2026
 20:11:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260813070020.719810-1-shengjiu.wang@oss.nxp.com>
 <20260813070020.719810-2-shengjiu.wang@oss.nxp.com> <20260814-lean-classy-hyrax-60aab2@quoll>
 <CAA+D8AOdF08PyOqQX6HTz-bWZmyB0bmKoW2DxYtnGS3g72aWrA@mail.gmail.com>
In-Reply-To: <CAA+D8AOdF08PyOqQX6HTz-bWZmyB0bmKoW2DxYtnGS3g72aWrA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 4 Sep 2026 11:11:35 +0800
X-Gm-Features: AcwNN1VSQJhguJNnq06i_90XVuMC-oTCxeandMzLTYM0L_HXyiYFRb-mCLJw1rE
Message-ID: <CAA+D8AN=ZSPDK0HahaD_Ki9=RSfofpTbphFz_eestpZvmFpYfA@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 3:41=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmail.=
com> wrote:
>
> On Fri, Aug 14, 2026 at 3:21=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> >
> > On Thu, Aug 13, 2026 at 03:00:16PM +0800, shengjiu.wang@oss.nxp.com wro=
te:
> > > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> > >
> > > The i.MX ASRC hardware supports up to three conversion pairs (A, B, C=
).
> >
> > Each one or only the newest? You will be getting the same questions.
>
> Each one.
>
Should I refine the commit message with a new version?

Best regards
Shengjiu Wang
