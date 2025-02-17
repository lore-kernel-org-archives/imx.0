Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D358781E
	for <imx@lists.linux.dev>; Mon, 17 Feb 2025 04:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739766379; cv=none; b=puAO96ynKaXsF1MzrPiqTB/g5xyJYZzxNpj3M0+Pk7fw9jciCakOAFq5BB+2Vs6FjGAcqw8kI+VXFiToHMJKwj1to54zab5/7lO7F4ZUdT8W1cuPhYxaJYtqYygAOXMFQWc/u1AlCVJXJqiclWwwLta38eqdaHiNy9zr4FxQSOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739766379; c=relaxed/simple;
	bh=vtNX/UFCEi6pYMVsqVg4FqhekriRTyUXH4F+kZ06Zmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZVKc6ndWES+ncnpWlRYuSVo/xHhHIFnra1nxyyqE4KvXqknK4xsHiA3op8VN0mNZXLq3N9aKsY2rrfndY7akLqqnrsYuTBZtRZe/dog25ZOChgULAnSQi0iFihGK9gMwexbPKkMtETTdUw0mU3IK2vsKsOG6wQ4DHgq5npRlc0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=IbdbzKFV; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="IbdbzKFV"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aaedd529ba1so461992266b.1
        for <imx@lists.linux.dev>; Sun, 16 Feb 2025 20:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739766375; x=1740371175; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtNX/UFCEi6pYMVsqVg4FqhekriRTyUXH4F+kZ06Zmo=;
        b=IbdbzKFV4asZ/goKkC5qFaIdGgrE+dowlRlOvpMI9mjk3x/L1sE2TLuuAU3VpRXfUm
         ZznKkBORrmB/ki4tRbnVSyjVXw7BmIdqUX9a1o6wLVtaIRf2p6dtzEUELMFkzvo8POOe
         Ao5c7/lKBbqW+Nqig6eamndC24el+A2sbtDF+jSxmgUHZMUcqgDirTkYG5vP7PSYL5Kh
         CD2PBiTK25RWnZyU0Twau5CNShGLlr/p62pRNt7me7RtmpK64mxmiK99jddfvsOTDVft
         hyU+/18qvlqT3I35XeamI9RJs7B2CbVjLq+8J4LMDEQj7iPROHHhB8/fcRYDzUtIRPf9
         CREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739766375; x=1740371175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtNX/UFCEi6pYMVsqVg4FqhekriRTyUXH4F+kZ06Zmo=;
        b=Qr4bPrIydRYyemYKeZyJzfXZlXa1+MsDgbc0BYdlYwsRUYQR3qp/RcvZ00TNRDvkin
         XpvDBhvNAMn7ZCflL6+zreHOA2w27qUUjH9g3uQiYkzSph/u8D/RBjHRUFKJnaT/JdjL
         snuSQPzEzeICdziza017gqCDqCJw3nWNO/GTxE1PrH1490wLZaHo3d4XbhZK3oaVN3du
         SFlEDBqhzkcz+IJFt5ujsEljR2PmzYqcL3QON2B3KoGMo0CY8nszJpjQinoYtaL7zVtw
         Gtpd3UA8xuEE5B8owDIMaW9poCHw/XZG8aO0+9gcglYKIvl6JkbsGHdsHhCM9Z7EE3GZ
         05lg==
X-Forwarded-Encrypted: i=1; AJvYcCUkZ8Ocmp1LH4yBBGFUN78bbA4v4Pn/3ksn1BWt5QqtSntxh45PtETq97p8Ga6GG8vgB4g=@lists.linux.dev
X-Gm-Message-State: AOJu0YwKBlEPH2DOWWp4WX6ClYtMhAhZdsXxrLPjjRM4AhmHxyFVMppL
	FSjceRX4IL49SQLMuSEv9ZTgmm0zZZa1gz7lVKyCqzoFduT4+VuMlDNj3R7EwWm3QNddjOmt6LK
	j8ZzhUmqpausBWEncCPGIev970E6mYWMkDSqBkA==
X-Gm-Gg: ASbGncvg0LCtAGwycnuC011jo1QZfsfCXdLTHvqDRjaknx9v7c7UrW1vCT67KCOquDR
	TnkqVLsK8CMbpJMj3JeJXiLQtLKd9QKsshyI5TDi/tY9sXf6bPkbatfI58oBVXsguUixSRHwx8w
	==
X-Google-Smtp-Source: AGHT+IGqR09ncd7RtDiYCHnqel0IwA8/KPIVmtCxbKbZIlJpbL6zVOLcVJ6dwuzAFLdjeOGKZ9qI9z1ate7AXjr0ds8=
X-Received: by 2002:a05:6402:5201:b0:5dc:d8d2:e38f with SMTP id
 4fb4d7f45d1cf-5e03618307amr20113776a12.31.1739766375048; Sun, 16 Feb 2025
 20:26:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250209041655.331470-1-apatel@ventanamicro.com>
 <20250209041655.331470-2-apatel@ventanamicro.com> <87seoijb5q.ffs@tglx>
In-Reply-To: <87seoijb5q.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 17 Feb 2025 09:56:03 +0530
X-Gm-Features: AWEUYZnsLDuB-_3nJekaV0ZQ27JIbe7lpoXoicZXgPN5kJR_Ra7fWK8_x1q1rco
Message-ID: <CAK9=C2UyC1bOaRuvjUcZ=YWyOGhne8Yt5X7aYSAjQUPiUUUX5g@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] irqchip/riscv-imsic: Set irq_set_affinity for
 IMSIC base
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, hpa@zytor.com, 
	Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@atishpatra.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 5:42=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Sun, Feb 09 2025 at 09:46, Anup Patel wrote:
> > From: Andrew Jones <ajones@ventanamicro.com>
> >
> > Instead of using imsic_irq_set_affinity() for leaf MSI domains,
> > use imsic_irq_set_affinity() for the non-leaf IMSIC base domain
> > and use irq_chip_set_affinity_parent() for leaf MSI domains.
>
> This clearly lacks an explanation of the purpose/reason of this change.
>

Okay, I will improve the commit description in the next revision.

Thanks,
Anup
