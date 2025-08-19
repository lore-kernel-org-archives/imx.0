Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E992927D780
	for <imx@lists.linux.dev>; Tue, 19 Aug 2025 14:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755615396; cv=none; b=LR0oiNpdpVpA10ED5/gLeC+r4peCH7fuXGwkxZSY/hIoPfxK5OVLQ6ObG1ZfWIRF3a3mUy2eSMYprUHgjoTJgyVhgU9e13Aav6ulx5AiEOpfmSH2tl1RqLI9I5BV7NgXbZlxJ7hQht3sXy9PAXOOExs5lT9c1EWuqosZrizXmWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755615396; c=relaxed/simple;
	bh=SxK/8o8TYuy9PyLKW/7vylp/E9GnFz21EyXlXO2+pIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DdC/Y/wsRwq9TKX5r/uyc0mb49emTCffblATOGI6VCwBmS6cteQqx23eMAC/JGfTKaNNePdNMIiOwkAGY8zaTOWf+uvvlWuS5ldnbB7LglRtNxCoOwsjcSPACHcA/vWeK6XIdjbENVbnIPuIGM8BVSVJFuR9nFA9kVnQXrM9Jis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBe97cNI; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBe97cNI"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-323266d6f57so5373680a91.0
        for <imx@lists.linux.dev>; Tue, 19 Aug 2025 07:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755615394; x=1756220194; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxK/8o8TYuy9PyLKW/7vylp/E9GnFz21EyXlXO2+pIQ=;
        b=PBe97cNI6rCQkesKwBsHQA+Fl6VyIHUjYFmSn+3JFKHTqvztNd3HUVEocLa6hODHHp
         qgYFwtc6GYzUW/c+CbTFAIWYqgUE5MSurGhh5UJZvbGywF1WtN17zgpVxn0zaF+c+I0J
         4tz8Xh8wQ8In44VbhaSxVsPHa0S3gCsqao9BigErm42w/2vZeBrQmBFidPOGVcKCELzS
         LmWHF4/soV+ciG70LMvtp+C55SoUDX3nDJJv3etxkEh5dM29j5SF7y06Qnrc8aZGvCd2
         y74fxMZaYPn0DdVW7CXNHsPGBY0pDZDjrtwQwjbmV+Qq9vqGP5s541rEZFMRI/Tdnexc
         t/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755615394; x=1756220194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxK/8o8TYuy9PyLKW/7vylp/E9GnFz21EyXlXO2+pIQ=;
        b=fyiXqwQIJ7S6bfZuMJ5USfG9hTJnkaNB1zGJfzjQuCXNItzf1fEDryLc4v9YZ1DX3T
         Ppre48Pd6RG98lHO9tm1qNFGVR9ygG8GgSr7dsfJC9TURYODE62RrdIjMmd8caYR/r+u
         fdngQ7EKNUu9XJkCfcmUJrq4BY3QLrg9ElBA5T8dIL3ebyNs0X0wGskwKyB1EfNQVcvR
         Bs80SLisbmuC2DJDFDAYWQ10a40JCXma+t8yMmVJV18BPe+M0zmoY/VtH91GncJIt3ck
         9PB2EbHnwl1KMlJTPKpNdNIW8ZjBV9fPTwcN81J0Mnbieag2/J93h0Rqd0MiP5ehWv8n
         RAQw==
X-Forwarded-Encrypted: i=1; AJvYcCX2F33XIXcXiJfRW/h4S0RwcwGgkKDEDPkNrgLln/UvNXeDNq3HimvoUjSEjKKJT9H74rI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyySM3Nf9akZikbInyNEVR5BJUpCgSWfjXYuWon0r5OpV2Gi/eP
	M18MlLioVPs+jiMMWjwtd4XRdJZcKixuJIvMlKfKUNHUaiZMvFH8wPQOYqjMTBiuhJ4dJjy5UrB
	Ywo18cNCMMZgMJ0L0MC7WWbDqCD6wMFo=
X-Gm-Gg: ASbGncuwwFsHrBeW0OrRZ7IKD+HmoumVskOkZOHKw3asmAwXUk6WbiYDdg4fy+jAQbm
	fNtJ8uuJKulUlu+71MmikN6RW5LH5zcLq6caODTqBw+O0BF74ConngSTh6nXMBHwLGnLhC6MOg0
	0umRHjiGseAyxvVDSlEBBm/wemitW47VihnGA0BkhgJUnmq0+BTSEMmQinYedzozJMTyI294o8W
	uGVopJVV9XgH+s=
X-Google-Smtp-Source: AGHT+IEpjmZ8XVkcuZKfCV290Wvmbyt6Tv4cR0Fg/t2sSiijLaZh9EFM7KMO1OHNGRVKT1fRGi1Jac5EIi6kT1CFbYs=
X-Received: by 2002:a17:90b:37cf:b0:31f:3cfd:d334 with SMTP id
 98e67ed59e1d1-32476a1d6d0mr4123679a91.4.1755615394148; Tue, 19 Aug 2025
 07:56:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250819131800.86990-3-krzysztof.kozlowski@linaro.org> <20250819131800.86990-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250819131800.86990-4-krzysztof.kozlowski@linaro.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 19 Aug 2025 17:58:45 +0300
X-Gm-Features: Ac12FXwVQ1C48dlhpVxnCgyHSgql8U6XY0RR1RKOzS1VLcKJpTIqytqaU50CpkI
Message-ID: <CAEnQRZD-Ph+HUWp=X50YcaU1LRbz3KxJWopBRt7+3RQnG8oCGA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: freescale: Minor whitespace cleanup
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 4:25=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The DTS code coding style expects exactly one space around '=3D' or '{'
> characters.

LGTM,

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

Do you have a script to find this kind of issues or just manual inspection?
