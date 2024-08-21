Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D486D1C32F3
	for <imx@lists.linux.dev>; Wed, 21 Aug 2024 11:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724238097; cv=none; b=NG1HVbQZOF3nQMAHysUz1fInwQhjfUATATrp2QawtOom3/B1R+rMdBBlYKbBEWDcChLSzffkquw3UFLqIx+WUVRVyta8K0B1uvUT8sR4lgwPMQm+aq6bQGz8ZGGbmjelSX0zW+vejmFeJjR4+zRYn47th212FNM3ZhMFYDc9F/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724238097; c=relaxed/simple;
	bh=1ATWO0C6NeF9kO9VsONSRBSudFtrKwUszSwK/I+7QXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=egskFr/kL1MgaWZBxxt0ajg8y7gyxfhhy+MZ94n7ylZx/CjG+bDP9GY5pDFVMB71q6BxXlLGM7AwmRTdiAW/lCt3oJOPjWdiSU5OCIR4LeJ/AnlY98wkF1vXzpm7AlPAkQ7jBxJ7bPsH88WHHUTgnD4POVjvv4oIQjMOm7OuANE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ng9T58ES; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ng9T58ES"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e165825ebfdso1604508276.0
        for <imx@lists.linux.dev>; Wed, 21 Aug 2024 04:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724238095; x=1724842895; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBwBSeUXzRzs+yYCt0wfdPJMoqP3GApebhtlrFr3gjQ=;
        b=Ng9T58ESwFB3nQk+1RYC1WECh+uKJv7YmMwItPidu5DXjtwzyY0Qsx0eyqIgPUF4xi
         uSw4Of4JJOcpK5qhvYhHzJhVGmW99e6rLdNXojpPzysIbFwU5if9bKDUgxE3t7UE1efW
         4ErooyOBYHHhgIrID7U8eBroT4wmioprqL6ejxyETRX+Q5VUQWmEEtgly25TWjmymHXV
         b3Y9UISOtmkhtWokS67E5eVd+Fto0/JI9l3HHaoLxUP3EP2DMs0f/52X1J+bARuBvCOL
         r7Ezl/KhQnYWXwLjxggzHdM4BPJXk8Xmx75VBW6fQCp3929+w9EvdafdU2FTAPfwAh4k
         EfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724238095; x=1724842895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XBwBSeUXzRzs+yYCt0wfdPJMoqP3GApebhtlrFr3gjQ=;
        b=gbBlSSNXGV20r0l/Onm6opgzQlCWL821SjYfR1RYVKE+5iC7LAhz26U+2OiWnZ7GK4
         FpVJMegonysQr8EUW2Ovm8Bau1dTwS7Ew2jlsvBWKYfKgdreYMy1p7VsQJplyGf4PEdL
         TVpM/KSbqUYH4katTnquJwHaSm8mIujPUtO398b8EUQlWHUSus0cj0Qg27sq+n2ysj4a
         aP/lhM0uO6XmsEPKeaQ1BfBjIvmXURSPhHBQOGlhxw4uTJUtlbh8SVwqBhSf3nBRdK94
         LUtjiavij+DyC6gsGmJJ1k4if7h9VCePm3UkzhrOl3HANSgji9xmPMw2fIT992SfpSLS
         JVUw==
X-Forwarded-Encrypted: i=1; AJvYcCU3NFSqyJz9rjlTMsKQ1XI5fRZqB380/DRx5C8Nd/YpceLGL8Mg/dogAtBaSCqHT/O4LCM=@lists.linux.dev
X-Gm-Message-State: AOJu0YybFN1AX9yzzUjvHm/hpTNLA6LYdFodDzsTSekh7ZYIjDXvrwo+
	lXBPFP0gHE5vhG9eG0Rhv7JAcldCbWLrAso+7vuHFd1JA+cL/dddwoBOl0fxL8Kg/IjsODWNFSU
	efbwNWJ6u0kurq9+LXdm9Qhl7jiI=
X-Google-Smtp-Source: AGHT+IFflDUPyRh/p1DW4PuCPtZ+YVQiKrj5ChifUTm7Rq3hEzBgJXAAr6Hid38Rs13o9exyvhRkgp1DGzTf+pLUgng=
X-Received: by 2002:a05:690c:6d0e:b0:6b4:3caa:e842 with SMTP id
 00721157ae682-6c09d8dc019mr27805677b3.18.1724238094553; Wed, 21 Aug 2024
 04:01:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240819072052.8722-1-eichest@gmail.com> <20240819072052.8722-2-eichest@gmail.com>
In-Reply-To: <20240819072052.8722-2-eichest@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 21 Aug 2024 08:01:20 -0300
Message-ID: <CAOMZO5CYUNESmBdZBMSMwNraQbqvvsF5fn8i+nHr=MB_T_AG7w@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] i2c: imx: only poll for bus busy in multi master mode
To: Stefan Eichenberger <eichest@gmail.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, Frank.Li@nxp.com, 
	francesco.dolcini@toradex.com, linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

On Mon, Aug 19, 2024 at 4:20=E2=80=AFAM Stefan Eichenberger <eichest@gmail.=
com> wrote:
>
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
>
> According to the i.MX8M Mini reference manual chapter "16.1.4.2
> Generation of Start" it is only necessary to poll for bus busy and
> arbitration lost in multi master mode. This helps to avoid rescheduling
> while the i2c bus is busy and avoids SMBus devices to timeout.
>
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

This fixes a pca953x probe error on an imx8mp board running linux-stable 6.=
6:

[    1.893260] pca953x 2-0020: failed writing register
[    1.898258] pca953x 2-0020: probe with driver pca953x failed with error =
-11

Could you please add a Fixes tag and Cc stable so that this can reach
the stable kernels?

Tested-by: Fabio Estevam <festevam@denx.de>

Thanks a lot,

Fabio Estevam
