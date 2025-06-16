Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B12C2882D6
	for <imx@lists.linux.dev>; Mon, 16 Jun 2025 10:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750070553; cv=none; b=SIkYTY9ybGmJ5Yun9Iaz4uqn5wl8PJTBSaZW1yW4Q0m9wnrVZorPNacx+J4kTrUQF6rAEJbLca5ORF1Afx88B96Fu941ShARrRYQQxVn18Ptix+Bw4se1Tna7gQqzYRcc/5MUk7LPF+4/JLSsC6wzIvfzv08KMw08qmlGXmNme4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750070553; c=relaxed/simple;
	bh=Fhsd6q/hRQwGHerpb6eGxJc9LhHttkXql2QisPijFJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h9PFdOyhP/K5ex3dSL1+DvgEIY+c9Eggn9Ya6cUJBq0FGO0uGjny2EUitm/CBNkOaqb52p+Q4KIww+WgcTUcQLmfpCGZnndDZVNPOn45GbbGvSdsqfU+O+bPqsRWf1qKDt2xy75P/U1Nwf3la3vnJWI89LOTGJOZHEyJkSriLKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LwgMrHV0; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LwgMrHV0"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3137c20213cso5345601a91.3
        for <imx@lists.linux.dev>; Mon, 16 Jun 2025 03:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750070551; x=1750675351; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTabLOpgCLwYv8rCyGl7CwHdWBc3RbnKBwJmaj/inH4=;
        b=LwgMrHV0xn6bqGJnrF8SpUjzZuol1+escGfqk4ZTM3xhMsJhpNB5oYM0O2IOvNjflc
         trGmANryPPJ2WQM6nlqBJFYg4wOWLEr/uI1EXa0gkso3CDzXaQOr54HaPVUhhji4IpoP
         STAEj8bfp4vTt1CNHo3h6jcNoAG5hvz7myCvEsOm05JG7fsLZTouGwfpivjSc20ppbGi
         rOcHaFYJnUe1Kfya71X2Rnappp2hhwyUdcypW3hlWtuVQHtwGrANDm0ZR4LMl/ks2HHJ
         xnZdEQY0oo/c9jMSmquT+QHRYHyK/3s2fnc1592r6AynG8aom28ModW7HybQyo4Me6mR
         T2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750070551; x=1750675351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTabLOpgCLwYv8rCyGl7CwHdWBc3RbnKBwJmaj/inH4=;
        b=eslP/tXauzMtOpTCBZAL1gyQarDNx0XNuvn2EFNEe2mTj2sSKQDTU4ny93ZsnDMcPb
         EWE89FAVHiNOkbGcYXd8Tye1G72L8IWjaa3wXIrLzjRrXVBMMbcpxGYcAYN5Xgi3Myn0
         UHS5EstwF0HbcJZsMfrJ7lZW3s8LpdkwRCQazwlUF8DFIKXXHY4X5xF2GVf6waznVlOo
         WNkjmm2iZGGq8rGCwtvJGDZ8Jv/cUJOZKlnD1wAwVE21AJfLDDmpTUxtNsrzOmmWXyhG
         eHSzowhFtJGHfLKb+6r11aWnjReu35RPD/iGNlm3kNxT5yJUjmB5CTiJ+Y1fPJHnK11T
         o0rw==
X-Forwarded-Encrypted: i=1; AJvYcCVPZAIwXfGWDLZ4zgUBdUtTVIKJWWRAhCq0YvuUyz5HFXlDEmOFtaSFR6jLHOR1hOGvkq4=@lists.linux.dev
X-Gm-Message-State: AOJu0YynzSQ275IE0+PF15f5umRPWwfUQAlLdN+ax02dB2kwTJr7f9uD
	hbHcWEezCPArfkI4ffES3xtQTOoiigxiyZQ1BkkSndz8wNFlR7nUlHyXa4swKLfcohCnp+tuDIo
	usLUM3u102V1BEOur1aSYKoiJU3L5TVA=
X-Gm-Gg: ASbGncvyJ4I2w3ON6WvPxAg4fbPcTzNhZXuOZ4zFs1paKFY3sScx9ujCGg7Xo+JxovU
	bm9Q9OHIpptptfb4xwlWgigQE0DW6RSTDiiOeEtEzoyk3JAR9fhnJZIjHVx3afP45J4VB/2EkkL
	wLq1tZyZtBbz9yThJYsbhCbMQpfIRkEEaUFjG6ID4o
X-Google-Smtp-Source: AGHT+IGdvq4Jz7wCl7O5nLF8AdUqsnNZK/jUgiSEfeGbfX1YCA4ekJ6+LuyEXZu02NW4N5RvWGmagNrrauMC8JexM5M=
X-Received: by 2002:a17:90b:274d:b0:311:9e59:7aba with SMTP id
 98e67ed59e1d1-313f1be899bmr14937709a91.2.1750070550782; Mon, 16 Jun 2025
 03:42:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250613100255.2131800-1-joy.zou@nxp.com> <20250613100255.2131800-5-joy.zou@nxp.com>
In-Reply-To: <20250613100255.2131800-5-joy.zou@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 16 Jun 2025 13:44:31 +0300
X-Gm-Features: AX0GCFu6L7Akim9BySCPjWCa7aS9JinLbW1qVZSuSXFVwqMzcBMNsyM6unHsnmE
Message-ID: <CAEnQRZAp8TX84AygSjWGx-cNiLyZXZwUx5C-DLDuyB6hO3gXMw@mail.gmail.com>
Subject: Re: [PATCH v5 4/9] arm64: dts: imx93: move i.MX93 specific part from
 imx91_93_common.dtsi to imx93.dtsi
To: Joy Zou <joy.zou@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, catalin.marinas@arm.com, 
	will@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	ulf.hansson@linaro.org, richardcochran@gmail.com, kernel@pengutronix.de, 
	festevam@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-pm@vger.kernel.org, frank.li@nxp.com, ye.li@nxp.com, ping.bai@nxp.com, 
	peng.fan@nxp.com, aisheng.dong@nxp.com, xiaoning.wang@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 1:08=E2=80=AFPM Joy Zou <joy.zou@nxp.com> wrote:
>
> Move i.MX93 specific part from imx91_93_common.dtsi to imx93.dtsi.
>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> ---
>  .../boot/dts/freescale/imx91_93_common.dtsi   | 140 +---------------
>  arch/arm64/boot/dts/freescale/imx93.dtsi      | 155 ++++++++++++++++++
>  2 files changed, 157 insertions(+), 138 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/ar=
m64/boot/dts/freescale/imx91_93_common.dtsi
> index 64cd0776b43d..da4c1c0699b3 100644
> --- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  /*
> - * Copyright 2022 NXP
> + * Copyright 2025 NXP

This should  be Copyright 2022,2025 NXP,  as per NXP internal guidelines.

Am I missing something?

thanks,
Daniel.
