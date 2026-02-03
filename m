Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1B6222599
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 11:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770118744; cv=pass; b=qYuWflC+Ivv3w+IvmWo+fkO+jHMoy0yt5Op4iO4n9xrp5dujhbfK6nN5Od4xMrH3s1qPoQlORGOle2ZLwbGyUO2vBa4iFo9Y6CD4ld663p6yg7XS0q8h8lkvD4OjhHq96wY8UmXFS5lthQ2Eku1DU4VEswMI9CyWVMg6bi5WlJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770118744; c=relaxed/simple;
	bh=ZSFEUNpKLwpxZ1tSep7zK984BWz6j4OqWs1gmb3de4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XqTTMsUX9a++ufEVw6FCMmY0rebm9MBLGrEgykWK3e9OPp/A9W/dI+xiW36FQpR94HW5Rr6zQV8Pldv8Jorm6C0iUV6OTCEzQtd+pJb8iBfFhBVsI0mdj3dNbIyaMk4EJOPNnphBaXf165Z1VCghdkG9OO+T0XRFGKbvP9fqhmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nlf0/BTn; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nlf0/BTn"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1249b9f5703so7300113c88.0
        for <imx@lists.linux.dev>; Tue, 03 Feb 2026 03:39:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770118741; cv=none;
        d=google.com; s=arc-20240605;
        b=ZqS9IdMT+0dM2mSPfxKeA93tY1yIcQ/ImCcitTfwaYUS4gDqt4GFN/9i3nrTo31j59
         +laJ9S5DDRGDbgP9Xz9patlSX0NE+dTwDae0kuOBInSB2gapP0GiocCEJLELzMe2V8aU
         9Z+UX2kEbsqJtWyY67JNgxvIR8QCQ1bS61kYMV/IucSldemqxVnD8r1hHC3ETwFVrYVc
         LXxxnSmXs1BhVPdLm37yOeUAjughZ0i54BcNzRc8KkNBnarHT3V6Zc6nLaw4jRxZ8apY
         LMEFpuWTwib+PK5BeupTxJFDKahLgZGksAhpAY0dUCGBm1RjGzP12pWXmYkHM2diIGWD
         3OvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZSFEUNpKLwpxZ1tSep7zK984BWz6j4OqWs1gmb3de4s=;
        fh=/Rr9W4t2KGhsMcj2oocD8RE1ILJSUh6B+sCy90bXTjU=;
        b=kI6lWVURPBcoDvGzoh1K4dl0pzO6fip5EPqUD2K/NtKLX0L7sjC5H6fdg3cETiDvkX
         WYvsFuHBdi6qVglU+1TewqDiWfj87HxK8nPkB6SiDAZYsV6eKMu7OzgDWKP9/okk578q
         NIcd3crJSx5vd9LLUrvTaS3RYmV4RT1oZq6JPuZkbOg2Zzf0yY6+W9CraVxN9gOELlpa
         oRx4IctJJhjdKps5PuvFZEZshuJFxofa9uAFuKFVJIVE6r3n2AyoNXdmKMMBEML/vXX9
         e/RGnhR2gs2BRsz6dxq4thccS4J2g7lqEN44H/TKw6BIud+o3SAiuOIcDmUvT1hYF9eR
         1PjA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770118741; x=1770723541; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSFEUNpKLwpxZ1tSep7zK984BWz6j4OqWs1gmb3de4s=;
        b=nlf0/BTnznBkLXbzK+RD6yEUJHY2O8AINKSUoj2DEecx0K9ZxcApGE9/tdg3Q8jmEj
         wklvrDR6hn1eoKVRhdxnTrjbBlduwdYUgyPovfspkFX5DxTap+YZkn6R8bU1cB1+Bbde
         Qcb4pqqeHjcZ8DOLC4udMwNvuJXlsUyZaRgEn5JHax41Kqum31V5pWcHllbao4dZrbdL
         dLpEDz26ueouNQSFAnA7b7y5UmMvcCRctvWBGFXmHBQHCyp9Rao7sK17PagnfIvxBFGU
         phNXi/Y6MyQLuawuiy+K/9JN0SI1D9212ez68FOOUpuRKLDpRheULkBDMRVuWU14Ei3V
         un8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770118741; x=1770723541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZSFEUNpKLwpxZ1tSep7zK984BWz6j4OqWs1gmb3de4s=;
        b=Ih/F0ft37wb5IL7R40v6LNWZ/DaevSVFWS4QH2d8oqf+Sv8pm8G9pf8r4qehMYYkC+
         LA3YZMh4quIwKpG9ul+HTscb+HRrI1QCmo+dIzqtmrQlod0s2hC1Vkqupub0r8xyYoP4
         OOjHwj69BGIgv0OYpDhMAYFR/oLBaBf7tr/itItlpIiRRSjbBPxcfm2K0O7pNbAiUjbN
         cTMc9/RdQ0+BnCA6bGmyEXVXfxqWhgzicEC853ZUUbza7Y+RORK8klpGGaEzfa0TnSUo
         SR8/Ui7Fvo7Qsngc2eUegyKFcoVSNZD1dFrWvHG1CGc1Jw0vc8mFx358tqLREL2RHGXW
         /fOg==
X-Forwarded-Encrypted: i=1; AJvYcCUlu4ZSq0sM9grLSJdFhBP0BNY0CQBWLTK4wQSF1SnuXbTKTVa/Yk1SuiFzb7sCoFU0Q6g=@lists.linux.dev
X-Gm-Message-State: AOJu0YyR3KSJDU7a09YE4TtYDZ3+kR/FF+Wb4049+Gi15++fVvvdVYqg
	BmLcFAXSZUEON3fzYXeS0vIR/VhkjIUHEIR6i71/kVKq7qTlXrCn0X5zb7+id4AQB1tsycXC2cm
	i/tkmv3kz0pSUSKxCWlj6hRz3WegAPpk=
X-Gm-Gg: AZuq6aKRX8OY2chM72vgG/hOw4LOeZ5zFXSYUi7Kf8Cm0z8L3TmisLRS6DYcATClyWP
	hrO78OPJ38qLcvHJqLJaDJIrwxyq7lcowCoo+RWYeeFul88iF6HJyPdgchkAMjBKkz0yrjxA7rY
	zhSM81wfFtt8TkU5l/+76V9E3DGdO278kOUJIJo3ZR+GOqsY3yl4ZZA2Fdc4Y0LT4H7czRo/kLK
	9mVCUMd+yr+cABJLVcBIpz6aUJ13yk1ycTiVXdHweAI0EHwydSO9OoeSd4F9gbeLStotWPhPkR/
	/8dTEPrLmBLJ52eXT10aC6nPktyIvY13nsvRmVeKMoCl1RA5hc+3qUNs+SFbMSueYdIf0OU35Pr
	shx6bFdVkdFSvO2cwIq18
X-Received: by 2002:a05:7022:248f:b0:119:e569:f611 with SMTP id
 a92af1059eb24-125c0f8c372mr5953978c88.10.1770118740841; Tue, 03 Feb 2026
 03:39:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260203100332.915-1-laurentiumihalcea111@gmail.com> <20260203100332.915-2-laurentiumihalcea111@gmail.com>
In-Reply-To: <20260203100332.915-2-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 3 Feb 2026 13:41:42 +0200
X-Gm-Features: AZwV_QhBOKTPtjPqk1VVfZoLbXmghqFVzoBkIlS-QuEoUHDWcA62f6VGa7sfNWE
Message-ID: <CAEnQRZBXQTOp-suG=ppatfyGzUQdeKkV0ZsOYjih=yVjjhTuYg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: imx95: add AONMIX MQS node
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Chancel Liu <chancel.liu@nxp.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 12:05=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add DT node for AONMIX MQS (i.e. MQS1).
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
