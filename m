Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300B61D5174
	for <imx@lists.linux.dev>; Sat, 24 Jan 2026 21:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769289657; cv=pass; b=YS4+V6UZJbX8YvRDLGXOo71hzPNw7ANWwCLErmBhR7dh38xjsJSPy6rFVKw+qDxPkuPwF4byUJxQmXnzoMFYpC27G/TrYTc91yNHlSn8l7Mjq5GuJxUqY1vxIVPlnO2Sj1Uo/61IMBsEv2BxRHxMaVDlryzuPwgvB3qcDM6OivI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769289657; c=relaxed/simple;
	bh=eUW+Nn1xQDwW+fDL2+2weYSRCbL1Ugg4lN7x4qKedq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n/m+cocNmwJTdpxB7rGN9O8kA6Uq8zHlwG/KglkklR1MVDjkkzfzsTWwGlY+b1g4U7shG848nQ+cA7H9g/Te5Bgq/6ZdjFIr/f41KgOrL20cC2+ic4RuyZ+cJ5NMmGFucB0bOi/eA05XviwvPR+eRpi12M5WGnpzigzvENSdaAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQ8Uux5w; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQ8Uux5w"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-382fa663249so30988171fa.0
        for <imx@lists.linux.dev>; Sat, 24 Jan 2026 13:20:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769289654; cv=none;
        d=google.com; s=arc-20240605;
        b=hS02P0MH+f7bpeEC8x3aXmMDtri0FgK/tqCLncAnsDlGbUXk8Y2cW5uIIBrOShe3DA
         zU5RxJiooASnxcX1nczKVzjxKOs3xd03iYrNbb0/NbcBW/AuENNPAVFvWdyqXR33MvVM
         VSL4A9/t6FUHMmJM2ywDHFZCqWR3AtlndvSD2agXBRLfDUrz+IE6eYKZd/JHP8VCa21Q
         sp7hz198+zYEAzn6vJ8zX+fN8XoKgmNH3JuiEg9jj6bQHylHvbwBZDvEc1SuePUuYXkM
         kk2rTB6BLVutRDzOhRUUqtBZAZIXfZI5GYRLNoBCcDHhZ/2mIlnFG/o3oBX3S3Ku6bQM
         lvnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eUW+Nn1xQDwW+fDL2+2weYSRCbL1Ugg4lN7x4qKedq0=;
        fh=Dafq8T9i4XJ/lO4w3Sf3EM+aFYLVMXdo27JCBW7vJeE=;
        b=BwV2e4N1rDYSImVfwm/1qbQCI52sxjR15luA0gNiiYTVY7rEpKa2QtH7GGQE4d2X5Q
         2jxubj9Nb6KdBGq5/kuC+keVUCKJvWKDHifyIcazK918R0ZFkhxYwNPGybsU/pzFcGZE
         m3xhioVZvBX9tbROfPtS55Z5tmpj58AdUstGK9u+t49D3A7m69FTrDoYc+jkRubVUPYK
         NFmErp7Sc5/z3tcbbsR79pi8mfYHy92IK36TW2+ZpMq4pPH1z5XM7m3HQPP0NdFhuTAj
         FxegbN7xco9nYZD8HgbuRaTMr0Ue00wsRlUoEloUNtjnHBVv4HGhMwmSEgm4SI0OcYNf
         oJ1A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769289654; x=1769894454; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eUW+Nn1xQDwW+fDL2+2weYSRCbL1Ugg4lN7x4qKedq0=;
        b=VQ8Uux5w3/Rn3rQq80Md2fNXpElKamstf6T18p2kZznCupJAwsi3Apul64YQoQxrXa
         tJtWyckc1plRkCzk1/pd1PwY6LMo+babBITa+2q92MFsXjziEugSVFLZs0WPR23+WBbr
         aQ+oKA5mYpRTyG4y99dDOEuM5lJXSNBi4eRrelfb7jqnmshKcBdBSfvmj+jIAPXIH1wn
         3McZ4FKkd2AVuLsKjkzffMNMo2HciMsrK7yToxIAy8CZ20TyxYJ8WJTCbs4QAKa1ZwL0
         M7VXQScso8D3jsr37lyfnh2t0pWjWdtCPCK/h9EDmA1YgxwnFRvS6u4aeqF2ByLjYvsM
         G3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769289654; x=1769894454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eUW+Nn1xQDwW+fDL2+2weYSRCbL1Ugg4lN7x4qKedq0=;
        b=C/csQRfo6lQ8ST1/zAqocvNzUqEVERm+PxEzcy4pSoWRrq+ZJ9O3o086BDhiCmxnSz
         3wofkehEBQcDWpo8gh5jkB2nNtsjypV+Ve3JvCiN2eltYdtnn+dRUkQaTrtMdQJT7aid
         IGlesyhbk9dC/jzOj7Z+ey8H7Zx6a8HuLg/51K6mscFFpL7F5AVgt3bcQ2aA7qsmGgkT
         PaAFmtETlRjobJLp4ya0H5AnvLB0L+fmUMRUNX+P/4loc+cpb09W47MUFj2MnLn/2NW5
         sxe5y1Wn/pVEbps1Y8V9Cqqom59nlNc5PLDW/Nf3dmPzeZz750hCLCmlLtjveMJVy1a4
         Bd3A==
X-Forwarded-Encrypted: i=1; AJvYcCWyi+sUkyp0HqbUOy67HFdUWRWdDmxcu4SEuIb7SrCBp7bmrHPb77UAG8JrBYhujtGsP7s=@lists.linux.dev
X-Gm-Message-State: AOJu0YxpPMZzM669+SuQwETJLBjk3YsCRoBk2agst02TkxOFtk0bnR6s
	5d0J642+k65E4w0b1q3QIDI0snKV+ZNZjOJ1vBWxF6L3IfMcg3Bcx9HXPXiOId76IOn++JwTSuh
	4vLG/Brry8MkKpsHO3+DHGKpqvpV6bA8=
X-Gm-Gg: AZuq6aKtn57OxQHrrp0fHUKTer9d2gj0au3Ii0eWPXJOTlIQ1F61jwza9OsZMEdoDh/
	FSt7z0ql0NVZs4L21aDtvOWknmPHK1hx79xkE4AkdJDkATL3iv6ejHWTjDm4CSWunJyLeb6zmWv
	XSeV6zOVZXysx75y9yuqxXdOJdMmT8b+G2kv+Y4RilI7/qq1Cq0LQv1RBA/Xvjk6kB21wDM6Wum
	1lJgjVALh5kmIOhnPZwNo1INhZyrKQwCpNLapnmylh8b9GkILpwI9qi0+A457KZKraUvKT7SVFR
	AeZy17NJv4gdOWNvTS43wE6RzqiXqtqIX+Yn
X-Received: by 2002:a05:651c:31dc:b0:383:18fb:fdf0 with SMTP id
 38308e7fff4ca-385fa18a1a7mr202501fa.22.1769289654024; Sat, 24 Jan 2026
 13:20:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260123-imx8mm_gpu_power_domain-v3-1-3752618050c9@nxp.com>
In-Reply-To: <20260123-imx8mm_gpu_power_domain-v3-1-3752618050c9@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 24 Jan 2026 18:20:42 -0300
X-Gm-Features: AZwV_QjYUVpRsQS5aWPwAi-rYkpNXVxY9EFDkrf6zt0nUDYNEKpxxlUFDNbm7q8
Message-ID: <CAOMZO5Ag6jtVqeXW30QNy5+1ykmGTt4G8DxcsyOUMvNaeJf5Ug@mail.gmail.com>
Subject: Re: [PATCH v3] pmdomain: imx: gpcv2: Fix the imx8mm gpu hang due to
 wrong adb400 reset
To: Jacky Bai <ping.bai@nxp.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 11:51=E2=80=AFPM Jacky Bai <ping.bai@nxp.com> wrote=
:
>
> On i.MX8MM, the GPUMIX, GPU2D, and GPU3D blocks share a common reset
> domain. Due to this hardware limitation, powering off/on GPU2D or GPU3D
> also triggers a reset of the GPUMIX domain, including its ADB400 port.
> However, the ADB400 interface must always be placed into power=E2=80=91do=
wn mode
> before being reset.
>
> Currently the GPUMIX and GPU2D/3D power domains rely on runtime PM to
> handle dependency ordering. In some corner cases, the GPUMIX power off
> sequence is skipped, leaving the ADB400 port active when GPU2D/3D reset.
> This causes the GPUMIX ADB400 port to be reset while still active,
> leading to unpredictable bus behavior and GPU hangs.
>
> To avoid this, refine the power=E2=80=91domain control logic so that the =
GPUMIX
> ADB400 port is explicitly powered down and powered up as part of the GPU
> power domain on/off sequence. This ensures proper ordering and prevents
> incorrect ADB400 reset.
>
> Suggested-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>

Shouldn't this have a Fixes tag?
