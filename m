Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD49158558
	for <imx@lists.linux.dev>; Mon, 24 Feb 2025 08:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740385262; cv=none; b=Z2EfwHM5XHE2nrvF7yOVx864K/ZWf6EYJ3OyvIpvAKhhtKvgRQHtXSo47nBrV1Q2Xv0L+JG+5euM/lTdqS9W+DuhSzEloc+IgvqGgAq4tHe0kI/Mkw4IbKBVqDJiTwr4g9d8acdJfpzyA00yPpdyuA72F/O3gIe43RniIbvZjjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740385262; c=relaxed/simple;
	bh=4yXsV2/LB2SciH7nkwJ9VHcDfoQGnZX60SaMgs0Jh/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XOt+WgcSiQ9SYPEzmCyoDzeySKySlcK/fupNOAfZ2i6qSNuo/7aQ9rKZsTPBRLoXkFB09DyZ/ZB8f1cm9ZiNFqgoZYL4v/YT4OdzXKGz0UwZLKG8dqBbJxZMdQOG2kJ04FyoZFhZhFIU+oQKrkLbJ3Tqn1PvIQFR8MK6Y68wZiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DKt/lA0G; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKt/lA0G"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2fc20e0f0ceso6159859a91.3
        for <imx@lists.linux.dev>; Mon, 24 Feb 2025 00:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740385260; x=1740990060; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yXsV2/LB2SciH7nkwJ9VHcDfoQGnZX60SaMgs0Jh/U=;
        b=DKt/lA0G0m/Nmd7rCm6ct9L2qedjVxrfQ2z+h0XGjP85ntTzedUx6tcyMOGHDGyt7S
         BCeiSCA5gUmV+q7+1wvo8IzuIDwnKoC598hf5z39yIEbXJnfNgm71565TgOk7cCxc+wi
         tnyRXqHeChx5Wxu9DgY1gUNl6B3kPUL1poqcvjvw+saqLEQV7UDXiewM75pvfsqtYdyF
         ILXPFW7OafB71X1K/dAXYpSLB58fNJ4vXYZ8nYo2+la4SIV82GbX5SSf0+S5+OffBDTA
         zXJeAhWkpmO0rL+d7TxA6PF5JliAK+H1W27aONbc9RigLp4YjszB3mlJGvdLqU1Icbgj
         v3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740385260; x=1740990060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4yXsV2/LB2SciH7nkwJ9VHcDfoQGnZX60SaMgs0Jh/U=;
        b=E5x/iYtzUJwbnJksC4RJ0DR0dk+aipuKmYU9hmQQUtmGa0g5p1K0HYAvR/UJSX7ze0
         HnMc/nEgrXDaDGH9dcRCi9sHDHbbLHPoIP2Wn3RMdmSYql0at0oJkTnZOTtJdqjkdvpg
         W9kFEXRFM2XLXJ2IvxSQ1dgfex2pYU3D4rxRLOp/bZasvnyvxVjfIbaNgE+DUYef0kUd
         P+qwyTgrSKl2w9uioLYdMpb1IA9ZaHMGjeEOwr5I+/iSZS+H3oSoalCJL2ob3xSvElli
         mz8YrLScOcIiZq+P6uNsiorUb/UQzwfaLviGz6ibDp2C6yenAFsc2iES+mC+NH10brnP
         Wguw==
X-Forwarded-Encrypted: i=1; AJvYcCX6l8dPc6wyqnraYdiSRl2Y3Q19HVkt0421IbCZ1348kRzumgStsN+c6Pc3rauwdynnjG0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxURBEOoAdsyeo1wzaJUiPGNetiJi5Dw+VHjMLxvzdPl4Z0i6wt
	5EDLdzbMq8+KGIvLX370nDby1SKfyJwJMA0j+kNJroTaWBIKBTK/l1nIQ14nMhgsGS0uw63Y0Mt
	gA0DJImWhTOW4V0MCQEbXLKb4zqQ=
X-Gm-Gg: ASbGnctW8JcyyMpoFbjeJRa99NUDT+X2H/3bCf1NKJf0nKnhn1Zj47L7qmtBPmHvOwe
	pE6L9n3grvF7bVA8UtJATGb4tBZKJAXivjI8rQHVpWp35yqbfrUuYOnOOgNDHkLrHIpzJ5L9fED
	e+4ZSW
X-Google-Smtp-Source: AGHT+IFSIoZtx5tOAmzcah9AyzKdcvqgQQFQ3kwXEXdt9bo6IsFtTyTRuheP5O2mOJ7Yg+7fM9dG3dpRP3aMlab/o44=
X-Received: by 2002:a17:90b:4b06:b0:2ee:a04b:92ce with SMTP id
 98e67ed59e1d1-2fce7b354d8mr18309742a91.32.1740385259942; Mon, 24 Feb 2025
 00:20:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250220-imx95_15x15-v3-0-247777ed91c4@nxp.com> <20250220-imx95_15x15-v3-3-247777ed91c4@nxp.com>
In-Reply-To: <20250220-imx95_15x15-v3-3-247777ed91c4@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 24 Feb 2025 10:22:36 +0200
X-Gm-Features: AWEUYZm8TV1XLlsHGFmvB7e9AgvFyAGTWUyACsVmTUYTvwHG2UC3MRv44aFAl5Y
Message-ID: <CAEnQRZDHage3=xzN6bqbMjHjxuX1aPPQfTrRjicu=8qxoSToRg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: imx95: Add i3c1 and i3c2
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 6:27=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> Add i3c1 and i3c2 support.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
