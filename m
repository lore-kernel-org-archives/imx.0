Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CD33D76
	for <imx@lists.linux.dev>; Tue,  4 Feb 2025 14:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738680705; cv=none; b=mLz+U+sdNF/CB9Q/wE7+iWRuebfj/RNHME3DDTQw+TOHzOO/fUWsM75GLNiiJBC3r9quByTlrhZOQrYEk08AK+VSM5p5ir9I+nyMmwS5svC79kW+UI0oCpsbt5xP9fN0lo4ISo50uwVWTU79AfFK1uc9CxisZeMFsxOjtyuMFxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738680705; c=relaxed/simple;
	bh=J4zLUjXm4prg/eFxGt+fYgNMmII7NdmBc8I6cT7wueA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XeDkyCdZsgiax1It11KVddkXzq7Dd5xNXIlFUlgD0AGWnHa94jGgrpF4ha+L32nq89ka1o3lmKSoM9rArec75JRcu1+uyZQazDLzm1kdT4bQnTt0s5o9TSnViaK/4Qq9FCXwTnRAyKt14DkAyoO6WaAxa1ZAJYlpxFoKIenM00g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=fP3CrzA/; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="fP3CrzA/"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so6020660e87.2
        for <imx@lists.linux.dev>; Tue, 04 Feb 2025 06:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738680702; x=1739285502; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4zLUjXm4prg/eFxGt+fYgNMmII7NdmBc8I6cT7wueA=;
        b=fP3CrzA/0Sg6AUX7p3OU1hWvBxeFYiQk/sNxOhVC9ny+S/36MB52U8Y2Nxml/zXY1n
         vk0qPU9f7LCUGrvUbqv0yckAGx9nxz9VSKhur02I31NYP9MSRewOxnPNz+gOlCkpsRYA
         fLueEAZHZt70ChDuofiJGamR2u3yz6Mi5VPbKLsm6LoPooCCZdbrzu4/NZY8ceRGvvpK
         7W8+uSwxtNQ9rdoMSqk7VhFvY1hdkPbMgXC5SlB7Xl3yZY9Q85VEBOhF5djpvqE3U3fd
         QJEZksdkSkmv0CdrEv44zRhIc+pBP+DXwGaX03KRHu5340PCN0HpvVQMMDPSzx0Z4UH+
         fCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738680702; x=1739285502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4zLUjXm4prg/eFxGt+fYgNMmII7NdmBc8I6cT7wueA=;
        b=lWrEjqBJkH1/cVT72ctM4j3YR/fQxfeJZb3NiQBZ/fDq8a+mSwryNMuvwz9LfTa3gF
         RKbTzt9AufWNy2WzE1yFtPzb3T1z0mdRVUB5RP7U3xRZYJuH585ObB/55gSg0VYJcHC2
         kpagEh/WHK7J7oCiWMwRx6WcqYXxLRsUgpKAolw8jY+TyrsHF87vIdnPwakPEonYm9JP
         BEnPVgjxdg/gXKRb26RpKtvMLFwxvo7ftWnf7pA3kQWvLSbOzbucICRcGXWz7ER4bb4O
         n86XVMlS4GYJCZouM9mlnfMrf60wywgPc+21pZn5K4mCNJOk+jYkqbN5aPL0tEkBTONF
         nDHA==
X-Forwarded-Encrypted: i=1; AJvYcCUPtXF3k6WWlEuSfp06ba23na6Qrh3jd/oCcxZPjnKl/l+BWTnAqbMuCro+CggjMgDra/I=@lists.linux.dev
X-Gm-Message-State: AOJu0YzyrvQ8RlAFvvujVuNcpZWfp9DfiXecs9FgjHRWDnX5cOT9Sfgk
	CWbtkj587bXMvOwCQbrux9jIrIgd1wvybDBMSCNCt+sqFctbtuMq8bA3GhroNi8W2lfmJdMkvtv
	o5dB7WUH4lzazl9080xbaFpbGwFw09TSMp7qp+A==
X-Gm-Gg: ASbGnctsiGjbe5WuAZpqwwtjfcFVmysBlufd0yBrdBSWJiFUpHjWveXbT1wHgnn9uAd
	s5khWWIA0abnQqPkRNNdQCKwetiAszjal8dsH8DYR1lsdMjn5uAO0SZe0OebV5UlaGYlUbIWjkg
	==
X-Google-Smtp-Source: AGHT+IFWTKRZ04zHi9yazDmOAR+9nHPiC9DLDSwxIssSS1/sYlKHwCu1qRW2q05nuJpua/OP5aauc8pAw8aEMUpq3to=
X-Received: by 2002:a05:6512:239e:b0:540:2f59:7561 with SMTP id
 2adb3069b0e04-543e4c3c98cmr8359830e87.50.1738680701650; Tue, 04 Feb 2025
 06:51:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250204075405.824721-1-apatel@ventanamicro.com>
 <20250204075405.824721-2-apatel@ventanamicro.com> <87frktoo16.ffs@tglx>
In-Reply-To: <87frktoo16.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 4 Feb 2025 20:21:30 +0530
X-Gm-Features: AWEUYZmlBEyFq7UPY0VRDrxJd2P92k6Zjc43uE6bTATPsZOqON-E7U5h2zWhfaQ
Message-ID: <CAK9=C2WOnB9g55r9bfWW4X-BjrST8WArDT8+wLwt7B=TDwYjdg@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] irqchip/riscv-imsic: Handle non-atomic MSI
 updates for device
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
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

On Tue, Feb 4, 2025 at 6:38=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de>=
 wrote:
>
> On Tue, Feb 04 2025 at 13:23, Anup Patel wrote:
> > Device having non-atomic MSI update might see an intermediate
> > state when changing target IMSIC vector from one CPU to another.
> >
> > To handle such intermediate device state, update MSI address
> > and MSI data through separate MSI writes to the device.
>
> As pointed out in the other mail, this intermediate step does not fix
> the issue. It requires that the MSI message write happens on the
> original target CPU so that an interrupt which is raised on that
> intermediate vector can be observed.

Okay, I will drop this patch and instead have the last patch do
the intermediate step.

Regards,
Anup
