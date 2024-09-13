Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF1A1D86C8
	for <imx@lists.linux.dev>; Fri, 13 Sep 2024 12:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726228941; cv=none; b=AWEv4o8T9YyoFOm7xeVUcG628lKN2fPK8CXIpuxWl7r9oGOkQCms7F1Se2X2YRYOkg1ee03ErykipXZHLEdmcwGMinOFAmnx6qJX5u8q0jPtLVAcl7YSC59T+2hAG5rlTqGeNhflTwbcYrcD7ovhfU8gmfU1/eIQnxFuuuoW2Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726228941; c=relaxed/simple;
	bh=WuwqpRmxlM+RziSDik+Xx/cAiRX1REx1Yj/wgaxdIFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HfZdp1HUlad1k0LJgKbArz1j6kA23KAc9Fh5axaLpjNRr+WwoolT/K/e9E0ubyY+nr4q+ucg+npUYph0CaMFSW0rKHwcGevYG8w7ugUy7iqMO0WuTMcfk/NrrtN/1zjC/ghaIm/hPcMSnvEXRXSdBevOplYOC1DgQqJ1oQhh5gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YopH+AKl; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YopH+AKl"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6d44b6e1aebso16581687b3.2
        for <imx@lists.linux.dev>; Fri, 13 Sep 2024 05:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726228938; x=1726833738; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VZUveVe5ug6pUVY95Hk2rZagT2tEgT+khEe5hqljA6o=;
        b=YopH+AKlSxzntmF/hUAa1svHCWjHb+IOULkwHhV74Xy/8mZSCdn5Weqwtb2bKeshNO
         NnmL7odeP2Gq1XZDJU8BelXWwOuu5mAQEeEM66JxFS9JSPIXdL1FTqLnDI/2hHPiyUD9
         K85lmDAoKcKi0koV3yGanLtJSFHLZ74ptBQ6EWLiNprYjurG/KmE/HGMdEDPBcSOK6Xn
         0/qS6N1CqoGVd+h6Djps/mSCH9tbAkYmznGfPAeOccPcqY8tRJ1g5UOEICiIQSPnkPhw
         LrZp3T7KzTd3WyIabUQ6FtMCWeFffiptc4+iTnejyhxEyqpR6IerX/G4/0BZy3OwhgpT
         ukjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726228938; x=1726833738;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VZUveVe5ug6pUVY95Hk2rZagT2tEgT+khEe5hqljA6o=;
        b=wfWqX70RWRrmDtl1Z1Llg0pgBJczL/CT2emAOLFwras76rP8bAh9oaimv7EocXc48G
         yPEyEgKg0QgeCkMKrAroK66G+LHWmsROUqCWxDtF6Uiwi46rINQ39b/cdN+H2GniWJOJ
         atYye4WK8EkCx15hQSIFJnazWPwsIECWh1uKVCwJMUgb/AnbQUb5k2JwFlM3fIYfIKVM
         Rk09heMUl6n/SICOmc8OLq7x6dCbj+SS3VXgYyF3LkKyK9ywN7qbEa3zZqcyDzX5jwDQ
         IB3sKGEo1GRALbM1RE1u6d8OlImM8Fx55FRIVY1OQVBSSspQyYWtBpKdO76A4fKYmcWA
         H2vg==
X-Forwarded-Encrypted: i=1; AJvYcCVbXR/ccZmJ4liX5hgafyxM9sKCciTz3CDHOVSrU63nVzHJem/8H7pZOOWz9fSw0ZwYDZ0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxzNbbPL/NCFZD1ZDgC6vYKN99BB7PT+FECBiY3UnSOm2csY/5M
	M0xYjguuiNYO1/7up0IDeFYnEqrYRAY8fqSnAHxF3wdkCYWRyIjyGDKg1HBRF5lO9nYzkauKUMX
	REv5xpfA3dVpy6x5+eTkdJk3FI/6WPjIb6/Wibw==
X-Google-Smtp-Source: AGHT+IHvWAtjRL3HNkWkaP3coSzhpDLefItiLLMliColzEkeBMjyYypjXfXV6VN6sYk4ULxR/arxmws/Y1dWw592ffI=
X-Received: by 2002:a05:690c:1d:b0:6b0:d687:3bd3 with SMTP id
 00721157ae682-6dbb6b20d8amr53618377b3.21.1726228936095; Fri, 13 Sep 2024
 05:02:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240823-cleanup-h-guard-pm-domain-v1-0-8320722eaf39@linaro.org>
In-Reply-To: <20240823-cleanup-h-guard-pm-domain-v1-0-8320722eaf39@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 13 Sep 2024 14:01:40 +0200
Message-ID: <CAPDyKFr51pccY4Wx3x_NcuVrJcsG0U_xMptdC-2hf_5BnjaR0Q@mail.gmail.com>
Subject: Re: [PATCH 00/10] pmdomain: Simplify with cleanup.h
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Aug 2024 at 14:51, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Simplify the code with scoped loops, guards and __free().
>
> Best regards,
> Krzysztof
>
> ---
> Krzysztof Kozlowski (10):
>       pmdomain: rockchip: Simplify with scoped for each OF child loop
>       pmdomain: rockchip: Simplify locking with guard()
>       pmdomain: imx: gpc: Simplify with scoped for each OF child loop
>       pmdomain: imx: gpcv2: Simplify with scoped for each OF child loop
>       pmdomain: qcom: cpr: Simplify with dev_err_probe()
>       pmdomain: qcom: cpr: Simplify locking with guard()
>       pmdomain: qcom: rpmhpd: Simplify locking with guard()
>       pmdomain: qcom: rpmpd: Simplify locking with guard()
>       pmdomain: renesas: rcar-gen4-sysc: Use scoped device node handling to simplify error paths
>       pmdomain: renesas: rcar-sysc: Use scoped device node handling to simplify error paths
>
>  drivers/pmdomain/imx/gpc.c                | 14 +++-----
>  drivers/pmdomain/imx/gpcv2.c              |  8 ++---
>  drivers/pmdomain/qcom/cpr.c               | 58 ++++++++++++-------------------
>  drivers/pmdomain/qcom/rpmhpd.c            | 11 +++---
>  drivers/pmdomain/qcom/rpmpd.c             | 20 ++++-------
>  drivers/pmdomain/renesas/rcar-gen4-sysc.c | 26 ++++++--------
>  drivers/pmdomain/renesas/rcar-sysc.c      | 28 ++++++---------
>  drivers/pmdomain/rockchip/pm-domains.c    | 25 ++++---------
>  8 files changed, 68 insertions(+), 122 deletions(-)
> ---
> base-commit: e188fd67a69319f3d105d9b90e424b8d1ff9580c
> change-id: 20240823-cleanup-h-guard-pm-domain-35eb491f35f9
>
> Best regards,
> --
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch 1 -> 8 applied for next, thanks!

Kind regards
Uffe
