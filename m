Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A3B1C84A2
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 10:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771842064; cv=none; b=ni2MHX+Ogl8l1uUFNfRgb9ys9WkV3ey9zrZRHnRknd+PDJfdN2j2TfmMbAUyA+R+i73IjC1cDm8i6S8JC+YX13FDwuOyP8SUDh4nsSO2NoZikUSTrOe9le6nukYo0kYvXVpgigFd5biJRzcKjLmQDmNE3Y+rxXf00wU1d7fTF60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771842064; c=relaxed/simple;
	bh=qmklrboQIpSfdlDZ2hHPRPuP8NQIz98sLqpsBfIp1xk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=asNdvElN98PLhlZ4HT9MLPNdwaBSs2oHCd+NX8lKITyVBu0X+ycjoIFmREJelUzJwuJctVzcZCzLYRBHqcxt9orWgzrWhTyZlQ4JQYoJDbW8sSL8rTzjQv3U40f4WJLcaT+bFpHXxeOxc3/lj40qLKGIF5s1av5VRWTOPc/5RrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8230f8f27cfso2152872b3a.0
        for <imx@lists.linux.dev>; Mon, 23 Feb 2026 02:21:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771842063; x=1772446863;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYufON41haCPAAlB17VyKfqSryTL2wR1KeTBsoMTWuQ=;
        b=AA+7zblwHWyGimn1bliHhDcLh5Dy6ImmqYDfeMrVwAYQW7JDtIX8BLmt3B7a47XThK
         BaSunmusP0+/Gt4u88jVMT6DVPIJQifRsRDMqdyr0D7/nFAGvW+1Kh4Z0r9fW825QJgF
         8yILxSQKT3dzbgr4d5x27Y6gmCSkPQzyR3XoElm+USmSzfOXU9v/reTV8c+6I5MMShVn
         K+l4Iu4QT+C0e1Af1XG54/vQHl+EEuIxxASXc7MYxZooRNuuYVWpZYv6g55zygO5iNPp
         87lK2vzr2xA+JvGqpNYBHmFCg5n2vB6gRp/9eKVb2qfgEoTEEvc11jM2jPbo8p7JBQBi
         Qz8w==
X-Forwarded-Encrypted: i=1; AJvYcCVm5fdjCbtwetagy9jEbNCoCvF8mCvPkTRuZhjYpVGI1WWGBDQd2T366D/RCDVZVGPNRJM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWOVNuhcId5d2bHoYlUzqU9ixM+ffvhAvDTtTriqgyAZ4oHHHE
	CFl1npHfNTm4CtOYoUQc+XnMMQumPdlUWEUQa4clMMJ8RC9RyKkoCnWST2PIc6SY
X-Gm-Gg: AZuq6aKjDpPd6eWiWJJ9CiISqGWD6axC9q55Nd8sVP/q8cZaEB8rDyzQy5FWU9vzsHb
	CXbmEqKLDUTdund21CfBeVhbaI1CPeS58UhHCrPM0Jh40prJtRI7wS7ilpzBj/fdZAkj4EztGsa
	Kvhmfm98Qtcofk/EGRA+ztgY0JjC1JW+ln4U7U0XK8/OtSpDFpvvIMDhVk6ANCFbH5CIbskLybu
	gpge9Wb3MUgDOhiwoGwCiKzeziDIqvws1h1Xj6n6SMKdI3uRHPgbN5vj3CCivB0JmJtHTATXuXh
	Yptfm8OzGd/5S2RHavyhU7N7/jhO8HxzncWxNyzm0u3q22LPk4zLOvphP5jTfuXS74mdPc5f3dL
	yKOc1vkQc7UQpjgprIITej8kJelxVvL33/WzUQrMqHSSxs17jlaykT04xR7veXeyu64gwyN+Cww
	DX1ZE1LfEtjAH1tgavmBRtKLNHN9TGuMzJqVHCUApSY8rQau+uLoHGYcDnLqJDd27I2dzzmA==
X-Received: by 2002:a05:6a21:9d91:b0:38e:54b8:60a1 with SMTP id adf61e73a8af0-39545e54632mr6988163637.4.1771842062654;
        Mon, 23 Feb 2026 02:21:02 -0800 (PST)
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com. [74.125.82.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f5e568sm69929125ad.32.2026.02.23.02.21.02
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 02:21:02 -0800 (PST)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-126ea4e9694so5356384c88.1
        for <imx@lists.linux.dev>; Mon, 23 Feb 2026 02:21:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXWxF7iQuWAvBSZ7tbEL/TI8MgBes/9as+EdRbvYX3BVlN8XpcdKFj1URo+X0qhhf06AdA=@lists.linux.dev
X-Received: by 2002:a05:6102:38d3:b0:5fd:8175:2eb7 with SMTP id
 ada2fe7eead31-5feb30db471mr4509289137.34.1771841684922; Mon, 23 Feb 2026
 02:14:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260217212707.2450423-11-cassel@kernel.org> <20260217212707.2450423-12-cassel@kernel.org>
 <aZTkLiUaMTC7H1kB@lizhi-Precision-Tower-5810> <81af7f88-b9c1-457f-9a21-a7b15a13d374@nvidia.com>
In-Reply-To: <81af7f88-b9c1-457f-9a21-a7b15a13d374@nvidia.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Feb 2026 11:14:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVTY=tV_3qq3gDuAHPjXnexT0Qq9SK39V-U2ACbvLRsaw@mail.gmail.com>
X-Gm-Features: AaiRm52HvurLndDwor1bgpbfCcI9wH1Ckd1tYC4oQp0RsW6za3e41CkVlZ_fe6s
Message-ID: <CAMuHMdVTY=tV_3qq3gDuAHPjXnexT0Qq9SK39V-U2ACbvLRsaw@mail.gmail.com>
Subject: Re: [PATCH 1/9] PCI: endpoint: Introduce pci_epc_bar_type BAR_64BIT_UPPER
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: Frank Li <Frank.li@nxp.com>, Niklas Cassel <cassel@kernel.org>, 
	Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Srikanth Thokala <srikanth.thokala@intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Koichiro Den <den@valinux.co.jp>, 
	Damien Le Moal <dlemoal@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Manikanta,

On Mon, 23 Feb 2026 at 04:57, Manikanta Maddireddy
<mmaddireddy@nvidia.com> wrote:
> On 18/02/26 3:27 am, Frank Li wrote:
>
> On Tue, Feb 17, 2026 at 10:27:07PM +0100, Niklas Cassel wrote:
>
> Add a pci_epc_bar_type BAR_64BIT_UPPER to more clearly differentiate
> BAR_64BIT_UPPER from BAR_RESERVED.
>
> This BAR type will only be used for a BAR following a "only_64bit" BAR.
>
> This makes the BAR description more clear, and the reader does no longer
> need to check the BAR type for the preceding BAR to know how to interpret
> the BAR type.
>
> No functional changes.
>
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> Tested by: Manikanta Maddireddy <mmaddireddy@nvidia.com>

[...]

Please do not send HTML emails to the list, as they are rejected.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
