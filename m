Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB09B2BF009
	for <imx@lists.linux.dev>; Tue, 14 Oct 2025 15:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455186; cv=none; b=dO252RDXZVEtF/wJXhug6QyXaAEuXV+lAeVo24MkjLqJHFa4FPTDNZyvRQDjDUlACb3PxJ0/9AN+0C8fI8C0+j1xz5W9qcTIQktQHWUcdorYA5di7hgk+wSzTetjMoB1ZWifkRrE31mmed5PRAYgekrJvgfNdBhNmd2rKtf34oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455186; c=relaxed/simple;
	bh=yO2ygkBHkX0cwFC257fCD00j1go4wNKJ735oVxo9cj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ke0IZq9b6+AHeWsH0XH0E5cCCHobmF01/l/6rltgF9v9NaYW1P+QXt1NQyy4Jqebu4/BkjkHyd2K5mAMSI9YrE3ODMRKJ9NRPvfgKeGbjN7g23UJfqVgTJNafzofUYhhybBK94wz7odnRDKRn00dxTR6bpsUT8J6J8fMV6en0wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DOwBtvLj; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DOwBtvLj"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-782a77b5ec7so4916552b3a.1
        for <imx@lists.linux.dev>; Tue, 14 Oct 2025 08:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760455183; x=1761059983; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ir76BHl669cEuMaEpM03W9flQt3ajXteIgC+QNdmFc=;
        b=DOwBtvLjf5iFPT+dfZHrbqDZ1b6Ox/2/W42relObpKGSFnjdehdN7jQYWMCX9/X8yS
         TFIItdscE4kZVXHYMEW3o4ZqXmIIyiWG3mUIZHyVznumnafLuwtC1SkCRqbKZ6d3qCyx
         6PeQ8JN/fcQSMNmGjbU1q9xI4362lgi0xWBMrybIpHkvenyn4BStgmqiX8yEHUGqB5S8
         xcQTnrwm9ftlf1fUnKS+5Y3DKC0T4IfunuhbHIBZST5PRZJMYAxsruk/oXs+tsM0LsMS
         Oua0esOSUjSM2EXYfldOOI/jbus3eAc6sYRe+slvg5Ha6/jBbrATTSIzrQZp/rPcRACF
         yy9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455183; x=1761059983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Ir76BHl669cEuMaEpM03W9flQt3ajXteIgC+QNdmFc=;
        b=nl1N0vk1Xr0SZLYuJadh969yjo8zIL6oXVpuCfHOhx5wYM/dvMiPuHJzQlcp6/aFak
         WUWOpghtL4sHFXg7wVnoyBTQA9VV4yIDq/mOZhWbvoHVHGrPqqw+0bbnGWF9ZopWh6wv
         dgVFHrEP2lEPiuwWg8nF/ODy+9QkDeHl8XhLZ8CHg/DXvJSftVojeAylI/FZOO3rFh9m
         civbnCyC8QRaZuXn106fMBfjUGlmp/1vCaFAhn2WuCu/lxuXT9Yva+kCCVJlu+HgGlFW
         IErPw54H3hFoeH/idD6fcYx4mbITWtn7nwcVK/T6igU0SjU01Y/9TP3aLg5sJXE2mCkZ
         KiSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvMtz7pXTtMotbR/2svpetRqXvSl+Be8Tyo12IkPLZdgQmHWUmZ3U4uvMik5G0jnC82N0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyKWNuZcFkWSF71tZzmYwMwbi8eO+/rsdZepV7lyfe07oyILswA
	9ajd2ZIrmfONaDzpZYX/KPhdRgMufD8Omr+mwjxV5QMrtiApLlyhFfXvRFU07PSJgFs=
X-Gm-Gg: ASbGncs5y8/jIKw7wTB6sFJjepP+FUfYHSn0Z5PMJQedb53/VbZVKd/G7qiifMLFjtA
	i0k8YjdufCsHdih1D9sAkmXEEW6UJoeaSVdgEBZ843Mynt8UygzZmsmCK9u/c9I7IObJiMq1Ulm
	g09bUQegxALVQxI86gKz4UOaNbESQ4eOQQ7zoyPczKo+S4krOZ+IO4GVK0mciIHrxWtwpta5o+X
	LzxgQARZ7W6EHnBWimn2AnJC+W/3WMaiiADYeCaItIdMs2QM9N8fzvFd9lSZNIBnx1ldw40rKbk
	FZojKebopbW1viqrFHTBO7SbwR7MnAmS7NNtIWgXQ6OJOiSFGXRWBJ5BC7QLN5un8AdGaACQO4M
	C0kqFJKo4auYzEdtuGoMA59Ih8LaaFcfmOAXsX4uKecvB5yRv
X-Google-Smtp-Source: AGHT+IFyB19tBrRI78lBip24cgwJen4HE5EwQh3gPEKFeov+dsUsLURXmK6mh2xyEaOoeOtVoeTxeQ==
X-Received: by 2002:a05:6a20:734b:b0:2e2:3e68:6e61 with SMTP id adf61e73a8af0-32da820723dmr32624654637.16.1760455182842;
        Tue, 14 Oct 2025 08:19:42 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:68ce:31e8:3a83:30af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d9932edsm15282751b3a.73.2025.10.14.08.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:19:42 -0700 (PDT)
Date: Tue, 14 Oct 2025 09:19:40 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] remoteproc: imx_rproc: Use device managed API to
 clean up the driver
Message-ID: <aO5qDExs3j8k5cjf@p14s>
References: <20250926-imx_rproc_v3-v3-0-4c0ec279cc5f@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926-imx_rproc_v3-v3-0-4c0ec279cc5f@nxp.com>

On Fri, Sep 26, 2025 at 08:33:14PM +0800, Peng Fan wrote:
> Tested on
> i.MX8MP-EVK, i.MX8MM-EVK, i.MX93-11x11-EVK, i.MX8QXP-MEK, and i.MX8ULP-EVK.
> 
> Retested all the patches for V3 on above platforms. And pass build
> with patch incremental applied with ARM64 defconfig. pass build for
> imx_v6_v7_defconfig with all patches applied.
> 
> This is the 2nd series to cleanup the driver.
> 
> Patch 1:
> Fix the runtime usage. This is not critical bug fix, so it could be
> defered to 6.18.
> 
> Patch 2-6:
> Use devres managed API to cleanup the error handling path and remove path.
> 
> Thanks to Ulf for the suggestion on the runtime PM fix in patch 1.
> Thanks to Daniel and Frank for the internal reviewing.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v3:
> - Follow Ulf's suggestion to address the runtime PM in patch 1, and add
>   Ulf's suggested-by tag. I dropped Frank and Daniel's tag in patch 1.
> - With the changes in patch 1, the remove() is kept, then there are very
>   minor conflicts when picking remaining patches in V2, so I still keep
>   R-b tag from Frank and Daniel for patch 2-6.
> - Link to v2: https://lore.kernel.org/r/20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com
> 
> Changes in v2:
> - Address a build warning in patch 4/6
> - Add R-b from Frank and Daniel
> - Link to v1: https://lore.kernel.org/r/20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com
> 
> ---
> Peng Fan (6):
>       remoteproc: imx_rproc: Fix runtime PM cleanup and improve remove path
>       remoteproc: imx_rproc: Use devm_add_action_or_reset() for workqueue cleanup
>       remoteproc: imx_rproc: Use devm_add_action_or_reset() for mailbox cleanup
>       remoteproc: imx_rproc: Use devm_clk_get_enabled() and simplify cleanup
>       remoteproc: imx_rproc: Use devm_add_action_or_reset() for scu cleanup
>       remoteproc: imx_rproc: Use devm_rproc_add() helper
> 
>  drivers/remoteproc/imx_rproc.c | 100 +++++++++++++++++++----------------------
>  1 file changed, 47 insertions(+), 53 deletions(-)

I have applied this set.

Mathieu

> ---
> base-commit: 8e2755d7779a95dd61d8997ebce33ff8b1efd3fb
> change-id: 20250926-imx_rproc_v3-a50abed3288a
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 
