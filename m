Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DC172907
	for <imx@lists.linux.dev>; Wed, 28 Feb 2024 23:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709162071; cv=none; b=YzZiaxz4+y9aw4/sSyiY6ekvsYTd26/Wi1GoFHx3IxOZ+XM3hLeQ5WVJSHEidlMp9PZ067vBKVdCtnKiN+wB7aGyTK0uF5fDUXgDka746a56xrBzBsdM1AoE9/HPk5oNoVpjiBupXZFQcyv1mdWRKXbe8jBvKqIDkHgZEDKcwZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709162071; c=relaxed/simple;
	bh=8fdh3uYGMPOXqvAOHOoKQAaXXudO0fmxMPdCZHjqsRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lEQzWeurHXBMvV0P9vt/z3Kk/96B/u5JpxLhH6Z8hn6iOVr9+EWpia3ZGoZUxh0Utu5lFzQT2adg0TcJp5Oog7nnngZk0e1yZ5sn/3v28HDqls3e4ft5z7hqVk6IQ0J1ERMS9RGVajDosxZ8JF75Q+o02h4fDCe6qHjsTVJ8NS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfIbdvdr; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfIbdvdr"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1dbd81000b6so162435ad.0
        for <imx@lists.linux.dev>; Wed, 28 Feb 2024 15:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709162069; x=1709766869; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ot4CmQ/hhG4zUoY7ofq6ZiMV1G5BUrp00rn44kQoMs0=;
        b=gfIbdvdruOasdMzFSo7ISVSh6EobzdsEQEI19YNNXuO4PFNKNa7VdT6GaBGaSRwkyu
         gNwDj1Emu3YdDxcWpTirMOrOGiP+iiqVBqTFS361agJgNYGc0UFAKnAb4v7AVgggN3dN
         kxZdSr9G/jL/jVqo7e1qMjMvm1ByXmSDsVc2kvVhoj9Fb5+diGUKDzaQZmisWoY11MAZ
         N2XqT+Pbw36mLTzd+Hsn2+601p7lQ+jTELFapq/eL62BtgRSvzw3e4/meBExoKiXakvJ
         cZx0duguHFqZODXy31SjcM5RUkULHlkh28VY6OmULuL6UMXn6agorzi8NQwABCp2hXNP
         WLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709162069; x=1709766869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ot4CmQ/hhG4zUoY7ofq6ZiMV1G5BUrp00rn44kQoMs0=;
        b=Sx0hnNnF61wal+ZAH9kZQGO0ZZgX2xITBZPXt3sN1QaQCXvOQ30dIrGOm0ktOC5mYv
         fIwnbsqY+zGnLWqtmrr3M4b2uC6N9Tw4IS9MQUm4sWU+qH9aU5g7DmlhQtbNhN+Qqb9y
         VVa1N/NYaR1cgG6PVTb2MQEw95FqfwwcmrxqP5bkPA3+wmJrLg3nurfF5JfDFXjSc76L
         dKZUqGlqoBhQG/Ln5Xg8asmwwfr3fioZEm+SH5w36HSJf14fr1BR+5YU8y+rx1Ymi2XS
         UA5xSTiAp9U21OsCU4HtxC2aGoUu8KWmtWdasDR3sLAoT+muNdxi+YHCJyXFstF+rMIS
         De2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLj/eAFm2k7D7FigvwxCY6Xe06Si3FZ3FHPVDFMlJH8xkgtO1ROU/OgK++5u6ftkWB/4oXu/JZ0W6Rd/GLo97zT+jH
X-Gm-Message-State: AOJu0Yxmafl2fwuYZeLhz8eq1HS9vIJHj77onP6ODlTVth+IrPsoxL4v
	dplNXPFLmH2Dccz4qOtsxVUwzN2V6BqakSbfNJEJzPLf2pb8rcl2JnDiCDcYAdpX4b5KaFG5nBd
	3E/oTkk4a5jdt8aD8ZVb/yUjs3qs=
X-Google-Smtp-Source: AGHT+IGdgZmlOD3uGWnVHJMjyJeA37xtSoParRksvcba8xX7FIeNpPx7PfxE6W9DLFTPkUvcu1cBQtxqPixljO3Quq4=
X-Received: by 2002:a17:90a:3d45:b0:298:b736:ecf7 with SMTP id
 o5-20020a17090a3d4500b00298b736ecf7mr667831pjf.0.1709162069188; Wed, 28 Feb
 2024 15:14:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240227-pci2_upstream-v1-0-b952f8333606@nxp.com> <20240227-pci2_upstream-v1-1-b952f8333606@nxp.com>
In-Reply-To: <20240227-pci2_upstream-v1-1-b952f8333606@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 28 Feb 2024 20:14:16 -0300
Message-ID: <CAOMZO5C-01=jYbJTgQucfD8+pT-chy4xvQMckUee1O+gtE-0pQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] PCI: imx6: Rename imx6_* with imx_*
To: Frank Li <Frank.Li@nxp.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-pci@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 6:47=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> imx6_* actually mean for all imx chips (imx6x, imx7x, imx8x and imx9x).

That's OK. In the kernel, we have lots of examples where the names of
files and functions follow the first chip model.

If this same IP gets used by another SoC in the future that is not
named i.MX, will this driver get renamed again?

> Rename imx6_* with imx_* to avoid confuse.

I don't find it confusing.

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 754 +++++++++++++++++-----------=
------
>  1 file changed, 377 insertions(+), 377 deletions(-)

I think this pure churn and we should not do the rename as it brings
no benefits.
