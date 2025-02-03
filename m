Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA931F9D6
	for <imx@lists.linux.dev>; Mon,  3 Feb 2025 16:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738598515; cv=none; b=A+KGCaveL1+YoMvFZgHliVatA/Kr7jr7niiM1XUxfEVTQh2UVktNLfPKHKflzgACepaIjR06A/cp24N10uDoa1iAKEt4VFo/LovcChWz1dsKRTzd+GOCrM7zg3LE/r4skSEKGyNvpBR5E+FflEEwkFu7QDs2w8uN2CULpYUOj3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738598515; c=relaxed/simple;
	bh=GRCaqWuU09U3T2jXMnWL1ADrKkzTr/bvXQmYgmOjVmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L5VLD/FrlkbHUSUeqEzTu9QaObigh46AELs0AnHUBsysXmmVaG5b7LnMzXXuvUu0dP3MxQm0AjVAa3uWwfOpY6w3GTR0egzGw+3MUpgwG88pG++Rgx8ozUoDHKKCfWUAOxEykyvhe16OxpZMuu8v4Rf9CV8Wrx2q2QGU6bmfpOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=Q2lI7lzz; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="Q2lI7lzz"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3ce85545983so12893485ab.0
        for <imx@lists.linux.dev>; Mon, 03 Feb 2025 08:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1738598512; x=1739203312; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRCaqWuU09U3T2jXMnWL1ADrKkzTr/bvXQmYgmOjVmE=;
        b=Q2lI7lzz1mR4GsWwq9Y4jk7VMPvWvkMOwcutbCqql6FRPksulPI2nXQTLkrcNGRkod
         7NyLK021iCoP/alFoQ8WyTUp+/YbuldZlECJlTgrUJO0Dglv80nAthx5xB+lqe5KlL/W
         niUIQInwZEIw2nVN5ufFwh+b0Q9qDA9xgbtJXhQxy1MgVb/QYBpR1eMR+34Myt2wKE8z
         UcnfAFXj7XXUTHF76L/eB+McLqe+zCeZbgkGlh/2vGILpSWP9WJnluzf+gMoVzRrUxrT
         C2hT2WnMr+ztKfBCN71G8XAMgujoR21Ti5/1virlOMzUN+i55ejl+vniffMOBKWdPc0N
         wsww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738598512; x=1739203312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GRCaqWuU09U3T2jXMnWL1ADrKkzTr/bvXQmYgmOjVmE=;
        b=V3HhDvofJcyvtGLM+HcGaaDgQVqWlCYbkL7p7mdfBPD11yJzmHvGC6IP+IAD8B6oVw
         UJyOUraTDb9LwgUyvTft0CydrYUUMm5cgNzrGrrrY3PcNddmlahA9AcH8kqO5By54BVZ
         5DyslPwFXAWGzDAnb02U4IERRpApR2yJPFincpUxAnPmtJT2wTNBI+lf3XW4yKXHZnEG
         qvsjK4id5BcqM3+ESLuCMHS2FObblnmPfSVTs4ICtLE/jGWq8TM9NiF7AyWyQmCni5+n
         mApdwO8dXNNIZ6CAGIwufRfLNdTsMKvrC4uZRKk36I8Cg3v1YNSmrgeogrdBs9rGQzup
         f3ng==
X-Forwarded-Encrypted: i=1; AJvYcCW+XH2Mo0zIAPdDKMrWhzCSdIYn4hAIRqDVLUOQSwlLIJ4GLtEYrcE5OrXgl8BExqmTuf8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4GQix0QN8VRUG+NdGkXaJtYcJ5unoVs4+6ETiA2+fSYZ7XVUZ
	1NXxYJOGzWTPE3DsDGLm2hlimEmMXBogJWL5V5BaA/znuedhRRBGtALiRWE3sZnbGA7+yTyzIWz
	2Jux57jahW021lGkZooWQEAbW3HnhbBykjc7hdA==
X-Gm-Gg: ASbGncvvuOn5qam5+sRT8EUUnyQrCniLyqSety9/2ARRTTQHYJu0vpp3eACDrB9vBC0
	B6/yMrkpoXIxl/21Zlva26g/LT0fXSoaH2amL2zMedqRJCNYn7Fq9HAjcgYJutnlF89t9Lh1vlQ
	==
X-Google-Smtp-Source: AGHT+IGh48EGwTYFSKrKDNbwh6iM4EsoVfBSxF4gz8U4VFmSmI9atHaxKvm8zrK7zrd+YcMu62K8X5RTMCsgFSldYNE=
X-Received: by 2002:a05:6e02:1809:b0:3cf:c7bc:4523 with SMTP id
 e9e14a558f8ab-3d008eec85emr149079765ab.6.1738598512548; Mon, 03 Feb 2025
 08:01:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241214172549.8842-1-apatel@ventanamicro.com> <87tt9bnmcz.ffs@tglx>
In-Reply-To: <87tt9bnmcz.ffs@tglx>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 3 Feb 2025 21:31:41 +0530
X-Gm-Features: AWEUYZlO5PZddtosW3YVPDmyhEnZw9_BooCQby6hNDlavzyqwz_yNvI7qNklqJg
Message-ID: <CAAhSdy26zZNOfD8CW_MaYq0PrZCVef6gqD7b=D1KWNZpcqYjrA@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] RISC-V IMSIC driver improvements
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@atishpatra.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 7:47=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de>=
 wrote:
>
> Anup!
>
> On Sat, Dec 14 2024 at 22:55, Anup Patel wrote:
> > This series is based on recent discussion on LKML:
> > https://lore.kernel.org/lkml/20241114161845.502027-18-ajones@ventanamic=
ro.com/
> >
> > It primarily focuses on moving to RISC-V IMSIC driver use common MSI
> > lib and GENERIC_PENDING_IRQ.
>
> Can you please respin this series on top of rc1?

Sure, I will rebase and send v3 tomorrow.

Thanks,
Anup
