Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D56E40BF5
	for <imx@lists.linux.dev>; Fri, 27 Jun 2025 14:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034696; cv=none; b=raHFap64sxeFE+RVLZf6vsELjgOaVeRHF7HNf4E4DZNrj4CbnM1VcSbgc9uFspyzDOQpKnhMZYfnrpOmjYGRV7kkXooaUjQWrs+aWJ0clSJ72o5dcE9QU6sgDnfQAAjIOwyQxC6vkeDwKx1trfdFXFVNqKyrWbjMb3arxvYLtSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034696; c=relaxed/simple;
	bh=B1BdE0J+jY6ME5BrRSZux1zOeKpTZZ4DlpXlyhs8zxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l3mf7f0Dd9UQCodauLSp+Yj8pBBcypk637A1DvCe4kt4fx12YuAt0Y6ceEGliEwtCKk+hTb4bYmfVDvqVeIzUsXELP0UuI33wQJAfaNrG6MSx56eSauf/N3BIb3RQiGwN4bADHKZdhXukKtLqHO9rkzmFVKXWClrd5BeInvLKvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gdbpanrV; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gdbpanrV"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so4042260a12.2
        for <imx@lists.linux.dev>; Fri, 27 Jun 2025 07:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751034692; x=1751639492; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8o5xo7GeehPDbRd+X/7D8FpirwN/TZkXVzx9zL2sssc=;
        b=gdbpanrVoU/2qgjCxQk8KHxJPXqG7C6zbiTxj2M1086cTsmLv/QRsi/+PJmLttgv2a
         pYbvIX/6fgjSqE5t0TMNED58zgZp3HCg1+QdXook/eUeJeKqOUaG/sV4EQnJsFRatCi7
         atgWQvHmRn5zA9iuDgx9+oKbNMQIYPjXlDGNPu/j3xVYSRxtk5nOL3tfV6ErmbXyUmse
         u5lk0gI7w46jFaTMNy05ytvnMAEbyVBisxzCflM4BlDCvMU4dpWX5VxObdec7R9BRTfz
         fA4Eg7Rl4ODhFAN2ejFVbQEdZ3tV4UQuprzbpQQ5zhVbujfNI4TM/Fsexqrrj1cSnNFM
         He6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034692; x=1751639492;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8o5xo7GeehPDbRd+X/7D8FpirwN/TZkXVzx9zL2sssc=;
        b=rbRgP4c36HEe6vFY3ytUcMQzKR5VUMTMTHzHTuXwNhrVZxPCwddU5oDofpFjJPul5m
         jHr2VFsuPhoSFAvTlMqmP5MKhi1x5bFPkIObyr8NTuFEz2AOLvpiA6owFMD2etzid+Z7
         CfMyViIT1UP/Be7Sly+NomjTZVdCffqY2n0sPKfYld8SWKlg1Mw0SMam95jaBYw8XUp5
         7OXOW5GTyK/5iw8/Ee85qlrlmIoxyyd8RRl/yfrMAjj7E2J1tRMd0bKCvzUFkPkLsJUx
         Resua1stzPwQOwaxXs3fYAocuuzdZoN0XxB2r5Q4YyoDlaLvvT3jbJICRLgzs92hEbRr
         mEdw==
X-Forwarded-Encrypted: i=1; AJvYcCXYarxv2awnBz3HljU/bv/2K8ariI5ku7PDNWlzRs9MVs87npCqUN8+M66ciCZtwOtEdQY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZSNBd8xROq1rcL5y5XN6hal3O9cOp71XieZXmmdCbeh+DE8RZ
	VozO3A4uasf99hif9Wfolo3jLRuOmQwqM+UGLHPpWlOvgsjQgvRj4cGBR0i+dyhRk/9zTIp9en0
	3tNZ8v4LtgtD8Woa7blhVLKclZzGa4rUdVUfizt3l/g==
X-Gm-Gg: ASbGnctHXK3/a5x8R0jxZSGhTDxQ9PUVyn0STIBiQ1xUgrHoyUcqC1oJVl8WCS4jSrA
	DZ7poKgsNkAFk1expxEbCxgy4nHgoJqSkhntOAcHhju6/7Xur60JzeddEuv3lZxMJj1H7oB6gGU
	mQ5RVnHeGxkl6DWkiWmIdo3yCUzSfQrMDv5i5dBT43/rg4PzRtuh13v2oF6gTYP3tNLX5UBmE8P
	JcOrA==
X-Google-Smtp-Source: AGHT+IEL785XIeur6WCbc2OIj5nk/sVLVVNkV3GZ+ObEePJ/qNpPBLIGoWwmBJBgA18YqNdBbv+6Y6RgOuBSpzWsw/4=
X-Received: by 2002:a05:6402:5bc4:b0:607:eeb1:b18b with SMTP id
 4fb4d7f45d1cf-60c88d9c37dmr2283943a12.8.1751034691378; Fri, 27 Jun 2025
 07:31:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250626215911.5992-1-hiagofranco@gmail.com>
In-Reply-To: <20250626215911.5992-1-hiagofranco@gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 27 Jun 2025 08:31:20 -0600
X-Gm-Features: Ac12FXyLrcISUGMKifq1LXY0djWn87ywvC4vhLqatRfOsnXR-16wTizuirmCxWY
Message-ID: <CANLsYkzo32BHkxRzSLY1U_PcidMPOaz7xZjDs8HKtTCQ0ZpF=g@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] remoteproc: imx_rproc: allow attaching to running
 core kicked by the bootloader
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Jun 2025 at 15:59, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> From: Hiago De Franco <hiago.franco@toradex.com>
>
> This patch series depends on Ulf's patches that are currently under
> review, "pmdomain: Add generic ->sync_state() support to genpd" [1].
> Without them, this series is not going to work.
>

I thought we agreed to repost when the feature referred to above and
the work in drivers/pmdomain/core.c will be merge.  I'm not sure what
to do with this patchset.

> For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
> started by the bootloader and the M core and A core are in the same
> partition, the driver is not capable to detect the remote core and
> report the correct state of it.
>
> This patch series implement a new function, dev_pm_genpd_is_on(), which
> returns the power status of a given power domain (M core power domains
> IMX_SC_R_M4_0_PID0 and IMX_SC_R_M4_0_MU_1A in this case). If it is
> already powered on, the driver will attach to it.
>
> Finally, the imx_rproc_clk_enable() function was also changed to make it
> return before dev_clk_get() is called, as it currently generates an SCU
> fault reset if the remote core is already running and the kernel tries
> to enable the clock again. These changes are a follow up from a v1 sent
> to imx_rproc [2] and from a reported regression [3].
>
> [1] https://lore.kernel.org/all/20250523134025.75130-1-ulf.hansson@linaro.org/
> [2] https://lore.kernel.org/lkml/20250423155131.101473-1-hiagofranco@gmail.com/
> [3] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/
>
> v6:
> - Added "reviewed by" from Ulf and Bjorn.
> - Fixed and improved commit descriptions of patches 2 and 3.
> - Improved the comment inside imx_rproc.c file.
> v5:
> - https://lore.kernel.org/all/20250617193450.183889-1-hiagofranco@gmail.com/
> v4:
> - https://lore.kernel.org/lkml/20250602131906.25751-1-hiagofranco@gmail.com/
> v3:
> - https://lore.kernel.org/all/20250519171514.61974-1-hiagofranco@gmail.com/
> v2:
> - https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/
> v1:
> - https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/
>
> Hiago De Franco (3):
>   pmdomain: core: introduce dev_pm_genpd_is_on()
>   remoteproc: imx_rproc: skip clock enable when M-core is managed by the
>     SCU
>   remoteproc: imx_rproc: detect and attach to pre-booted remote cores
>
>  drivers/pmdomain/core.c        | 33 +++++++++++++++++++++++++++
>  drivers/remoteproc/imx_rproc.c | 41 ++++++++++++++++++++++++++++------
>  include/linux/pm_domain.h      |  6 +++++
>  3 files changed, 73 insertions(+), 7 deletions(-)
>
> --
> 2.39.5
>
