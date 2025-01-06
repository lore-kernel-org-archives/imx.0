Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1AC1474B9
	for <imx@lists.linux.dev>; Mon,  6 Jan 2025 21:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736197719; cv=none; b=CK1KJV9kr1Vr1TyzirCBluiV1gCJoj9KB6/kFqZcdqq9d8C+MifY2/57n1s636eWu5x/fHNdRkBrovrLKCjnPc1EGg3qOi+Nsd9YE924ru9ge7hDDKSOh5df+8olyhtJKuDVH3U2VaWV5KBR1Za00TRDZ+3JGp81RJysFOSclq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736197719; c=relaxed/simple;
	bh=pn4WwrIZl4q3yZbVPGmoGodJ5pv0OBWYacthkC8dikw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GXOR7cpU23K1OGU2PkREuLyX3gs0FNo5IY6M+VvUAPkyW978Gt1FkEVUr0cHfex6izPN98j90pHyxveeKzhTr80/NXRrkWbPxrumdLoqR9YPcOMi5K/qaMoxfl3gTFfbhi0L8L+004taZyOkizfTDtg3X61lR9ZpwM+95m3BhX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ed0SQ3SW; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ed0SQ3SW"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3862b364538so8504116f8f.1
        for <imx@lists.linux.dev>; Mon, 06 Jan 2025 13:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736197716; x=1736802516; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pn4WwrIZl4q3yZbVPGmoGodJ5pv0OBWYacthkC8dikw=;
        b=Ed0SQ3SWy+HYTRMBOx3XqULLFpJn1zPCcebkNUPRseY79vh1oQfL9w9xRv3cQGULpX
         tGv5KtgmP2cTmSFHdzqIbLT0SY6UkRxYwMdEhmfMP0O3Zwd3+9DW+3qLo/5Z4sdFNedu
         Jjp43puV1Q73ousZyxdS5fTJ6/EoDj0cBLaFeoyLr31/0Dft71ebbzn0+r8G74MNfbkV
         Ejfl6l1YKEZmPrQZlnxxu9BxOWPXrwTmAHjC9xYKkhvm+Fw6weE+xuff+CBxVNooy7xN
         5qtnMiQ0SzBbtk3PyM1COpSqkF1iNWI7rag6Vg8ZBhm6PoFmf6tV/yrrdUEk0Xx6zAwV
         ftlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736197716; x=1736802516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pn4WwrIZl4q3yZbVPGmoGodJ5pv0OBWYacthkC8dikw=;
        b=VtibaM5MKWRIPR6Jr3D3JpJggvNTaA7ir+imUlyeUbTerlJbnm8cutFz+A16FiNTw+
         U44hnF/X73HowRMH6aQNxEMnebVLjsrzhy1lskVylw1VmsHPfPK9dxWEVjU3ndsuHVho
         L6Mjut/gWzWA4gB3jgo98JEjow5fXgGKgqt5G9jlwhw3iquPAMfNCFB9WNKhEwDTJ57K
         ZBHscQpAVBrEaJOuVll5VcKfpDAKrPyUMItHqZ1f9tCo2ZTdztUoJ5LS0yRwe+pU/W6R
         NbQ/F3qmrwIkPFgRC80VUXs10SIHPdIY2YgNUFbOAiLTrCp/NtIOt27f+1oU7QGIPkER
         3t3A==
X-Forwarded-Encrypted: i=1; AJvYcCWbTAMRkyV5MWdWivUXbBtxSgnsGZV3jeXiQ2t2oSQop/8B+q/UhoMxFIOfdQ2aLKP2ccg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzcgosIIcBDtUANINHjLYM5McEHFdfd3lpOwdAWJE483DZ0Yx2B
	a2CAVKIjuyhTiVwhu17E8494bRUeK8FV4LnYoDTzMdOTVdzJcGa22a4cH8hVmoj/YmK+CvJNMFY
	40VygCa4PyFCgFLtd87bzHvJRtbY=
X-Gm-Gg: ASbGncvxfYOL2B5xFmWQbExOTPvObzAQ7Ja0CuXXKsW0jvgLf69CHf1ZsNqnvkFS1Kv
	3G6Dhwgzjcl7xAN1J93uw704IQxOEtdxZBLToQw==
X-Google-Smtp-Source: AGHT+IFpb3vDJfP232azjpEU+8oSssPqo6K1SCqKB3P53xPN/L3f6eNng72pkwnRi0gFWGBCmZvu7mJXcvKfZqRicbQ=
X-Received: by 2002:a5d:6d8d:0:b0:386:3d33:a61a with SMTP id
 ffacd0b85a97d-38a79244741mr521665f8f.27.1736197715562; Mon, 06 Jan 2025
 13:08:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250106205635.2177321-1-Mr.Bossman075@gmail.com> <CAOMZO5DDDFAWoTsujKuUsvRews4dez=rc6a3+Hnaq5iyoL6T6Q@mail.gmail.com>
In-Reply-To: <CAOMZO5DDDFAWoTsujKuUsvRews4dez=rc6a3+Hnaq5iyoL6T6Q@mail.gmail.com>
From: Jesse T <mr.bossman075@gmail.com>
Date: Mon, 6 Jan 2025 16:07:59 -0500
X-Gm-Features: AbW1kvZB24N2etW-yV-pwtC9S97WKTC4_Kq8j5gim8H_zQaiASlwEuz7cyMaGoQ
Message-ID: <CAJFTR8RYt0v+4WOLthdPUaLYHJeBcUFMz5HE=eA-Dx9cDo8Msw@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] ARM: dts: imxrt1050: Fix clocks for mmc
To: Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linus.walleij@linaro.org, arnd@arndb.de, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Frank Li <Frank.li@nxp.com>, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 6, 2025 at 4:02=E2=80=AFPM Fabio Estevam <festevam@gmail.com> w=
rote:
>
> On Mon, Jan 6, 2025 at 5:56=E2=80=AFPM Jesse Taube <mr.bossman075@gmail.c=
om> wrote:
> >
> > One of the usdhc1 controller's clocks should be IMXRT1050_CLK_AHB_PODF =
not
> > IMXRT1050_CLK_OSC.
> >
> > Fixes: 1c4f01be3490 ("ARM: dts: imx: Add i.MXRT1050-EVK support")
> > Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
Thanks!
Replying to fix the CCs and add Frank Li
