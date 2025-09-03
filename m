Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD883148CD
	for <imx@lists.linux.dev>; Wed,  3 Sep 2025 15:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912109; cv=none; b=AtoZyWyfOMrnkFxb5ihXQOovKYPx/3avBg2/PjrTFT3GBtJxuSzejgo1kGLAbXD04hihUXxgJqxflzOW/BkUXX1uSKCJYQbqpa3BGyZb5vOpWj4faB2ezHGZZ20phYwJA59KlvW4MfuQ3uT41ku7Y+qm8OmsV+FcTYY5zo6dyhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912109; c=relaxed/simple;
	bh=96YaeCpb+HKVPG3JA2d5NfvcGaCRpyQaoylvRtxb4uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hGrCjQoryGGzM0Yh5p+NFEXOhcgKIh4s9go8czwMxN2k3NP6I/wwSuzx6FQdcJTRvcAw6X9mMITV0S/4RjS4Th3iyU9YVZaS+oz8LkV0Qv5ycWHfUIYGsJpcG/S6ly9L+02TU593RW3TOgNcMBwMTf91ogR2tdbHANvDZVE3Zbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z8HRhLNy; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z8HRhLNy"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-61e8fdfd9b4so2272762a12.1
        for <imx@lists.linux.dev>; Wed, 03 Sep 2025 08:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756912106; x=1757516906; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96YaeCpb+HKVPG3JA2d5NfvcGaCRpyQaoylvRtxb4uc=;
        b=z8HRhLNyyFhufdG3taVS3wLiQBNVnMcXas9C+LdF9OA5JYt7JrVgzyqBqcwbU5xYbc
         7qs3zCvygr5WumWyVqy5Ccpr5aU6U1f4OfWv/66eRjsSKUqSeod8oHkr9y2+NedvyjMj
         Wa/AOjvY0dLIY3+fvd2xcQsrmOGK2X8CnTRVsiqSv8EFyVVwtgWWTa7gaPN688Xte3lh
         rWl7uyMyA1MB+fOhujhG4qypGL3WZh00iu5kJkTC9ja6yy2lnljARlgI9UCQpFXgOjFq
         fQJPxb1TigweNhQXxnidEDjjoeUPemLZHAV3JOh20W4eT/mM02oFflOq4888WfGCu0Ii
         BzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756912106; x=1757516906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=96YaeCpb+HKVPG3JA2d5NfvcGaCRpyQaoylvRtxb4uc=;
        b=DhxqPIhgbgkg38yO11vgQALEla5PbkhkiGOj2YBv/L4xzLoZH73U18e+TEm0vBbUcM
         WN1dBHfYPTvdPCRVAM1wO5ZVWB168k9dmhl2az1DvUBCI4h6mbIqo+X0PU1fiKDOoOYG
         2NAfogFE28taHBioaqqNLDsljyeyvep8LX1/c5PctSS+mf6Tl6LVhg/JfzS8P43T9wnG
         m8o/6Mqy2WcCDJFDO+0hh6toqpjCq4DbqGbtoanmMjJ5AZjvHXq2wYV+ZAtI6g8ZmaFZ
         Fx4CbbHuYCwl2sb3kwACrmZfVmpmnpSKAhowthvbGuW1iL7sosoaaFk4CyaGj7Z0Mabo
         uiZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWJRoLBO6RgMl7C1v6MU68HBxikbevpSSIchrDpH0q2DuqdJQXEpLUyajLT3/MZTdqc5U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0Zm9Al/1anhDCKg9mtsop5NFvx6ttbu22Kynxos+ls7MAeDzJ
	ZLhEOfFDTEhRCzvEXXLG/hIZbbSYm2NkhWdXLsik0l/f9q2nRvqdYk8UYDM7B8zsNItUc5jPR7U
	8Da8jPgeHubQgxrTiQbcqTkKQl60z3aGNReJE6Dkegg==
X-Gm-Gg: ASbGnctfVjNQnpGeHrzkGhbL5V390WGTdxQCkgW37v6MHB0MSBSfrV/lTA5nG9C+srC
	yIDtohw6PM8dnY1s9T/E3ZqEweQPvridnd+VMDvEpj/P55wPuM17ikt08nbxWs1I1EEi8PBDdK4
	UcogJKT4KoUZSUWoXSBhxM4+bxMF2/vRNyKgtMNx07spetBxGZZJ9+Hss56iiNq0MdloM4Tfm2r
	/u0y8+BAYCWnrgt9PpUs3V2zI2/QEV4DoJ7JJNrTlfl75+lSzqJ9sW4o1dXlzlAziX6zfPWDOkz
	WOuKu1CkUiit+gH0
X-Google-Smtp-Source: AGHT+IFn7BWyhxyqlF2KcZUxCc0qBvV63/yqKBt2qJWo0WsCdrH2xfKlcteVT3gnPfYsWlvKxJ4MQhTpAo8e8ENe2Tc=
X-Received: by 2002:a05:6402:504b:b0:618:3521:6842 with SMTP id
 4fb4d7f45d1cf-61d26d9c52dmr14417866a12.16.1756912106252; Wed, 03 Sep 2025
 08:08:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250821-imx95-rproc-1-v5-0-e93191dfac51@nxp.com>
 <20250821-imx95-rproc-1-v5-2-e93191dfac51@nxp.com> <aLHOhKpAQbVCC76-@p14s>
 <20250830125208.GA22718@nxa18884-linux.ap.freescale.net> <aLcdmY-gqd5cFOYc@p14s>
 <20250903045611.GA8860@nxa18884-linux.ap.freescale.net> <20250903063915.GA18615@nxa18884-linux.ap.freescale.net>
 <CAEnQRZBCxp4rT=es3fDh2w1Ut=i4u3GCnyoOFjqJEMj3CLWPWA@mail.gmail.com>
In-Reply-To: <CAEnQRZBCxp4rT=es3fDh2w1Ut=i4u3GCnyoOFjqJEMj3CLWPWA@mail.gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 3 Sep 2025 09:08:14 -0600
X-Gm-Features: Ac12FXyQRSgi-B9_MD_FBGgX_7saidUAIRI9AwJxOjtr7PuEWmGlg5OZDn0enLY
Message-ID: <CANLsYkwE+6B_CgCJQdYF_n-XOH7AkDF_e2KTJnK4EtNtHRX__w@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] remoteproc: imx_rproc: Add support for System
 Manager API
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 3 Sept 2025 at 01:20, Daniel Baluta <daniel.baluta@gmail.com> wrote=
:
>
> <snip>
>
> > >Please give detailed suggestions, but not a general comment.
> >
> >
> > @Daniel, @Frank =E2=80=94 since you've reviewed and R-b'd this patchset=
, do you
> > have thoughts on the latest feedback from Mathieu? Would you agree that
> > further simplification is needed, or is the current structure acceptabl=
e?=E2=80=9D
>
> Peng, please trim the message when replying so that you keep only
> relevant part of the text.
>
> I think you are both right here. I understand your frustration :)
> but also Mathieu's point of view is reasonable.
>
> For a person who doesn't know the internals of IMX remoteproc the code
> is a little
> bit hard to understand. Peng I've given you my R-b because even if the
> feels like
> it is getting complicated it is still manageable and you are the
> maintainer for it.
>
> Allow me a few days to see if we can simplify the logic.
>

Excellent.

> thanks,
> Daniel.
