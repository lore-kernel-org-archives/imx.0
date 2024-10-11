Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4CA195FEA
	for <imx@lists.linux.dev>; Fri, 11 Oct 2024 17:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728669224; cv=none; b=L2SG4zeBFxIecJBY0MYiMjYE/cAxRyP3f2ONOsMYxOAyOZKIFKscSxAHwrXkMeIPtqaAOYJug1o6Al/C6eOXNhpqBZnSZiet8FEKqbhCTF68ilyJyOI6SuaErsEvKZ6HcY5ICxx+wSLyFbXe5o84ZB6lc7+6AiKovcGVXxyMZ/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728669224; c=relaxed/simple;
	bh=yi0IOHhsXYP7btvr12gW4x200lHHEqtCf0KvtVlB3c8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mnSTTDm08yK0XQVZoUO9UEEjQoG5YCw27ZRyWqa+kKyGxW3Dir3tdIjiU5jZ3myUrR0avGrdKvPy4cHTTCk4ZtPKm0B0M3JpBlXj4a9U7AO1JfdrPhJVBQxamCm0Z8wYz81bqXSbawTqB0bzeeHD9v3QQO89KaiWAaTYYlVT68Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cKt6JSWO; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKt6JSWO"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5398e33155fso2842032e87.3
        for <imx@lists.linux.dev>; Fri, 11 Oct 2024 10:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728669221; x=1729274021; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yi0IOHhsXYP7btvr12gW4x200lHHEqtCf0KvtVlB3c8=;
        b=cKt6JSWOwn8bxV1sFOyB2HYE6IA1jx4JoASOLHrcdHobyaYRB74ZbAXNJWLpICvUZe
         /UrdHblJtMp4e1eeW8hN36vOJob+kP6PCpV7NUyLZ+PNm6hr9PP5pYhvzjbinaoCSZRU
         DbdSfxAbui5sfWWLWA+EjHKFfrdbCI9fX2Cbmv3ygGs6Lx7u3EI/jXdLYAoPLjBRYclh
         kICGt4HE1i1BSTo/w+apUCfzFrJjGu/1zkqO4zt+qAvdAUgOHcZtOEgFG3iASgzqAqax
         W7LR+vDXcKnbcmjTvyoj4FsK4uA066znm7gjVOlJLlst6rwPRh5Z8RA7NwCxOSG4nv82
         rrww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728669221; x=1729274021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yi0IOHhsXYP7btvr12gW4x200lHHEqtCf0KvtVlB3c8=;
        b=BQdhfPyXQviL8hm8HTLco8ifnn8LTt4cxaAD/CxDzg9C/t6+a5bVCHpG8C9wTxlGEh
         9zZWoofwU2oV7PqGLW8g1bJ+3p/c6FdmAhzU5bdIrWybUR9tK5pUS/vTNEhfk8k9R/Rh
         Hk8fHkQP6exrBXM9nYBxVQ0U7wxv5gh+golNl2iToGrcwGx6Hwo7cfFlUBOvPJWyRJWz
         Ek4BCWXBII8qZHVjPi01hrjJOYG9CZf4sf8H1OlTlWu354nQ/65MW9v9Y3OmGP7EBQbL
         s07zK5WnkRXdAp0qXjtMur6c+d4/bEaU7/+BFWfKw9MAUtTosFM9ow4ghHoE9Pw0KVun
         7o5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWohkc+91bMXWyzRGKwLV0CG6whgIZLc+i1qsUZlYprkawx/o1k0qDQHVf5UmDiyTCVh6A=@lists.linux.dev
X-Gm-Message-State: AOJu0YypqGaEc42xVIrciFo3jbPtan8DYSWK0B2vUzUqz5+nNmba5XM9
	idqHNKvyRfYkz6rp6GpUaym4u/UG61RjowCzgSJebXGnIHX6686SqCnzHzltL/tJDOeJKeleOxD
	/gv5LrGgpSdJ0AJE143BYa9dL3n8=
X-Google-Smtp-Source: AGHT+IEtZAwtQ3Jy0M0nPbX1jfHsYx5J6HKTKpBofyp3A65IBy2lbYIrGATmFKv2yJcksyi9nBkbyNxGrjkEjAtWog4=
X-Received: by 2002:a05:6512:1091:b0:539:8f2d:a3bc with SMTP id
 2adb3069b0e04-539da595574mr1837328e87.49.1728669220393; Fri, 11 Oct 2024
 10:53:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241009131659.29616-1-eichest@gmail.com> <ZwgykRyE+jDU0CiU@lizhi-Precision-Tower-5810>
 <20241010201121.GA88411@francesco-nb> <ZwhY/dtSNPptgs27@lizhi-Precision-Tower-5810>
 <Zwk35efNI4EO1eir@eichest-laptop> <ZwlF4VhRPv6mzURo@lizhi-Precision-Tower-5810>
In-Reply-To: <ZwlF4VhRPv6mzURo@lizhi-Precision-Tower-5810>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 11 Oct 2024 14:53:28 -0300
Message-ID: <CAOMZO5Bi_iAJsx4sQW7YzpJHrNYWs-mC+0cTo0c7w0XjCMunXw@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: imx6: Add suspend/resume support for i.MX6QDL
To: Frank Li <Frank.li@nxp.com>
Cc: Stefan Eichenberger <eichest@gmail.com>, Francesco Dolcini <francesco@dolcini.it>, hongxing.zhu@nxp.com, 
	l.stach@pengutronix.de, lpieralisi@kernel.org, kw@linux.com, 
	manivannan.sadhasivam@linaro.org, robh@kernel.org, bhelgaas@google.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	francesco.dolcini@toradex.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, 
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 12:36=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:

> I have not met this problem at arm64 platform. what's your .config?

Stefan reported the problem on imx6, so imx_v6_v7_defconfig.
