Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0E13148AA
	for <imx@lists.linux.dev>; Mon, 24 Nov 2025 15:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763998054; cv=none; b=isKYoq4mWHSjtNrKB/GSm3WaIieTzXxVt7cmt3xkSd8CcUEKNXadD+WmaDzk8SNEdXGIg55D//Mlr1hTQEAVSoXoz6LlrCyGII4Gh1jeUx+E6Um5nRasUZNANgnCBgkXgsrBlk6J/ZDC/AsjonMxL//ztoWmddzolp7JA3lfvvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763998054; c=relaxed/simple;
	bh=2/WcYCyzEAtsd7FolRM3lgoT5Al7DMEV9/hgNWettMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Azen97ukkfUTgrjQ0NnvNK13cM9DptK7yanNUAcXPwCb+KYZJU2L5wdXwDcClQhyy2B4Ub0KKuxRZ05S3zRhZjXfDGi5EuSI5hunQA4xESKfv4gY6N4G3Hl8jwV7g9VnD/KllzZvpa1HXFbtu2qsbzQ5B82wXPXJ6tMRBw0Vu/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=An7fwSDv; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="An7fwSDv"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6431b0a1948so7232368a12.3
        for <imx@lists.linux.dev>; Mon, 24 Nov 2025 07:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763998049; x=1764602849; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hPXbuoT8gLmsTcz1LKML8KzSKiAMgBQ+ViKr9I+j9RY=;
        b=An7fwSDvqC1ak93/U6AFf+CgpOgrQ1N6sxiumFRyo3jnQpHRCd5lddsxqDqPSnBgx0
         Rqw2Qvqu7beGFOrSJLWdTm7HUrbZxPf/e9CbGrn/Y+F7Eu+6I9ZO+wXzTz/1i3UErpHf
         CbsgMj53DUyltaCM9xlj+Z8ClvmiJgE2u5Z9KsUwBlE1HhX0kpd2Yk2bKNmtKJ9rHZ4o
         Hz493soKBw47kP+htthqEbc1Q5df2Lq39NoS16yi6ENtRhicTps+WxcCk9Q/xYqvdJYo
         /T4IpbQ0BJlOplSH3HDE10qJWnM6pyc3lB5mAzlRCMoOjKFmnPlenuUZHOQQ9VadQ9yD
         sejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763998049; x=1764602849;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPXbuoT8gLmsTcz1LKML8KzSKiAMgBQ+ViKr9I+j9RY=;
        b=EZRnrGHvE1K/sqOJaEdIKvskUhTmvo1ZT9rFT8dVYgQPQMGetp68hq6ZWd5Rrs5YXy
         +OG3AQmjNdAj5caQz6yPDgoHHm/cHocMixBMY9tDlG+uaO12q25Mb0C19jn6j2eIbd7F
         L1ZyK2QXVYX1ckr10Wd9aJG0Je+2q2WHZs3F4bwiBlC7VfHt+1/j0yftB40ii496LM8w
         Yh4RZbf6kkNlahSqCgE1BwJGjqtAy/EGCT1j6xnzksBGY4Z1F0S9r+L5T3HSxSGEK2ST
         flegmRTevG1vhy6GjLEXGGEkWp9aXQ5HHmelqHDH2MiYXTEZQrgcWXClGtmiZ7D5xX/m
         9QNA==
X-Forwarded-Encrypted: i=1; AJvYcCX3wQcAutumUIxpPhuNGAjcmfyVqU6fvBlfC/RYUqr+OAqYvHFb5CQ/pmT58iET0FlP1a8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yykucw6cVK3dhHO/WoUShotlGGoWFdy2vUdv+NziqINub4PmRSB
	L8PxbuSyOLihhOPlnNxUyBiLswRRkN1Jdh/vPROgK1/l28AB7WDUf+JM1DBycqyvchzfGKj2kTt
	UC5sTypaqjPWrw7GZuX/sefyhbvpD5MzwtmLYQ01mCw==
X-Gm-Gg: ASbGncv1d5NH1mu1fSdisoNWWuesN8Ath6XYAo8mWjgyZz7cwgWxRVMvmY7fk6i9Ff0
	vzliUjYgO/7l4vPpD2faS6IA2tc8JJB7c39JrKnzwE62J1qDPcWjlR1u88zFizuqUpE8lko5XnW
	V6SfM4RhoFJ9bowSfu+Pz4VGHgnkV9Ts/9wAtFT8UcmyfeW9+ArugpH/W+vZz3y2eg6kngfuUZh
	RPJzJdsJfSYnGTztEhHH6far3E5Yqw8kUcs+y2EnGxM+geIUv6c6jGltmM/tFTiqM43CVIuET/t
	xx++kKLYrZWN++eEg99B9B1XCJ1kOkJmLk4A61/U
X-Google-Smtp-Source: AGHT+IF8QEkzWvf4ABwZ5746O2obgVPWntwD+fd5/y1Lc5h5RDwaFcxXgvVKNe3CbF15J7X0KGPpVRchdEIoJn8QTA8=
X-Received: by 2002:a05:6402:2552:b0:63c:3c63:75ed with SMTP id
 4fb4d7f45d1cf-64554685163mr11501766a12.22.1763998049271; Mon, 24 Nov 2025
 07:27:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251122-imx95-rproc-2025-11-20-v3-0-9ae6ee619a78@nxp.com>
In-Reply-To: <20251122-imx95-rproc-2025-11-20-v3-0-9ae6ee619a78@nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 24 Nov 2025 08:27:18 -0700
X-Gm-Features: AWmQ_bmPua71P-c3C9amQu2EA6PcheE8Yz3sJ-xba42mtqxFzXSsE84-oyqxRX8
Message-ID: <CANLsYkynN2xSShAKXAcRsGTeS2YX1qhO=83xCScaaonJN=2hFA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] remoteproc: imx_rproc: Support i.MX95
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Good morning,

Please note that due to other patchsets that need to be reviewed,
Linux Plumbers and the upcoming 2-week December holidays in the
western hemisphere, I do not foresee being able to look at this
patchset before January.

Thanks,
Mathieu

On Fri, 21 Nov 2025 at 17:58, Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>
> This patchset is pick up a previous patchset [1] with rebased on
> next-20251030, and some changes applied.
>  - Add runtime ops to separate cpu ops and lmm ops
>  - added more comments
>  - moved some check imx_sm_rproc_detect_mode() from imx_rproc_sm_prepare().
>
> No changes to the dt-binding patch, so R-b/A-b are kept.
> More info could be found in commit message of each patch and below.
>
> [1]https://lore.kernel.org/linux-remoteproc/20250821-imx95-rproc-1-v5-0-e93191dfac51@nxp.com/
>
> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> one Cortex-M7 core. The System Control Management Interface(SCMI)
> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
> Manager(SM) includes vendor extension protocols, Logical Machine
> Management(LMM) protocol and CPU protocol and etc.
>
> There are three cases for M7:
> (1) M7 in a separate Logical Machine(LM) that Linux couldn't control it.
> (2) M7 in a separate Logical Machine that Linux could control it using
>     LMM protocol
> (3) M7 runs in same Logical Machine as A55, so Linux could control it
>     using CPU protocol
>
> In patch 3, Use LMM and CPU protocol to manage M7. More info could be
> found in the patch commit log
>     Current setup relies on pre-Linux software(U-Boot) to do
> M7 TCM ECC initialization. In future, we could add the support in Linux
>
> Patchset was tested with below boot images when the patchset based on next-20251030:
> imx-boot-variant-rpmsg-imx95-19x19-lpddr5-evk-sd.bin-flash_lpboot_sm_a55 (Use LMM protocol)
> imx-boot-variant-alt-imx95-19x19-lpddr5-evk-sd.bin-flash_alt (Use CPU protocol)
> imx-boot-imx95-19x19-lpddr5-evk-sd.bin-flash_all (M7 not under A55 control)
>
> Also tested i.MX8MP/8ULP-EVK.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v3:
> - Add R-b for patch 2,3,5
> - Patch 4:
>   Rename imx_rproc_ops_sm to imx_rproc_ops_sm_lmm.
>   Add more comments in code
>   Simplify if check in imx_rproc_sm_lmm_prepare()
>   Update commit log
>   Use dev_err for failure path
> - Link to v2: https://lore.kernel.org/linux-remoteproc/20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com/T/#t
>
> Changes in v2:
> - Patch 2: Change to const pointer for ops, update commit log and add R-b from Frank
> - Patch 3: New patch, introduce prepare ops
> - Patch 4: Rename imx_rproc_sm_prepare to imx_rproc_sm_lmm_prepare
>            drop IMX_RPROC_FLAGS_SM_CPU_OP and IMX_RPROC_FLAGS_SM_LMM_OP
>            Add a bool for dcfg->lmid and info->lmid check.
>            Provide separate plat ops for lmm and cpu setup.
>            Move LM permission check to a separate function.
> - Patch 5: Drop macro IMX95_M7_CPUID and IMX95_M7_LMID
> - Link to v1: https://lore.kernel.org/r/20251028-imx95-rproc-2025-10-28-v1-0-ce9e7db9edcb@nxp.com
>
> ---
> Peng Fan (5):
>       dt-bindings: remoteproc: fsl,imx-rproc: Add support for i.MX95
>       remoteproc: imx_rproc: Add runtime ops copy to support dynamic behavior
>       remoteproc: imx_rproc: Introduce prepare ops for imx_rproc_dcfg
>       remoteproc: imx_rproc: Add support for System Manager API
>       remoteproc: imx_rproc: Add support for i.MX95
>
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         |   1 +
>  drivers/remoteproc/Kconfig                         |   2 +
>  drivers/remoteproc/imx_rproc.c                     | 245 +++++++++++++++++++--
>  drivers/remoteproc/imx_rproc.h                     |   4 +
>  4 files changed, 238 insertions(+), 14 deletions(-)
> ---
> base-commit: 88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
> change-id: 20251120-imx95-rproc-2025-11-20-3b9369670d6a
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>
