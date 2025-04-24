Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F656296169
	for <imx@lists.linux.dev>; Thu, 24 Apr 2025 14:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504076; cv=none; b=Ta53nVqF1lVfUUIIl0ZcOiA9nMt2CvamGp1JRAozqbsC/1kWpLpDjzkJilTWdDBbHPR4FRytLR3UfhwSG+rtgt+Gg9iTL40KYeS/W+REvsQ2Dt6U+tWmhEGNFMo+z8XObuczE5f/sbQTLsn9YPovxq2Jo6gwygy4qWTSsIdpu7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504076; c=relaxed/simple;
	bh=hc3NuIx//WjHKdboDZgQCca1SVN0OX6YOp4RVVhyM/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RQQq3hAa+nf557oGUGchTP7qfAfX0TkYuzTZrg8n89L7HgEYwlQBwvqYmInPyfzGTq3RlolMn6PNwjryc5cL5WvWTt8oc1IePPERITr3B9HbS62DTxjiW0eVenRm/ZckijyDJou2IhAFU9c7p6I/7xfPY7kHISV2RWr7Z4/32uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Obz9pwVR; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Obz9pwVR"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3104ddb8051so13154151fa.1
        for <imx@lists.linux.dev>; Thu, 24 Apr 2025 07:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504072; x=1746108872; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DIIOezRQ1iEeyh6wP7pxRulzkeF5lSrui5rZPEB2VUc=;
        b=Obz9pwVRoCtSgfHxQvtpF03s4e5lF7d1JxUW/JLOqzLKJFbcJ2cPg4VuAwCCYRAhHb
         BHw1YdiAEK0GgZEMukJdm+I80f1NwKeJ4S6H3u4dFvYN+sGzKIBrLhCtw6hZe+WMYW0m
         s/tm+wCToE3pNdR9N4rftZ/jElvxmD77YCh9E1nETI8FEZ2gl5CcQTB3GWT/pNwCigyq
         b/WLeZn+WXruT9/+AlpxgLxEAMlm8sevNCYY8F6/TDPrk/maU2aqIGMo+crtHe81IdR8
         l33wBmM0P95RQjtp+usAVanTjddwPrwInYyh+1ATZou8X99VlqeLafljKVYT6OzMIr58
         BUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504072; x=1746108872;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DIIOezRQ1iEeyh6wP7pxRulzkeF5lSrui5rZPEB2VUc=;
        b=lq+5iePc7JpYBJDoL5VPrwhmGWOfPcTjOIRRBgLcjTH065cpHacjA+VjOF9J5KAZq5
         girjwdLKauDp6nQfQ0KNa0nJS13pz+ArdNpZH60jwsBG0x0zLULxPue80si4QEd7a4k6
         Dw9oDjMFJdMSK3f8M/IebGXUuKBrJYoM7QwXg0qtSReuijgBa2KuinMEEVFtu+36AlRI
         BX1dSX/XYRIeT/om9y/F9v8qsbaF3XeqyfZmeYXEFKu+1rQyO21wwvKtQT9W9FadoJm2
         GHqISE7Z062Q3dMA2QWcQgVazEEXc8BCtFAIpqtFXgftRSP8F6ky9SuVGdO2vpijGWT7
         VgyA==
X-Forwarded-Encrypted: i=1; AJvYcCVPCzVd3of0O+j00Lqw7ta9/dKaC6NrQgQ2xQnZmmk3ZOAD5eTKtWYcv5PqNJ/uv3a5/mw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxblbAQKp1+SBFot9pDulRioaUYIje5dPLRW1gG0jymxdwVqQpm
	/1wHbXyL4VLDeDpvDBahyvXWKBsDPJ3JKzKEinz0uY5ASImtG//vBUOQ0d550l2gtqFDFzl9OLr
	ldElYOJ/g38E8pGGKeTB2ck4pqpnBV4gu95Rl/Q==
X-Gm-Gg: ASbGncsB7SXB/5XfWWxoGiDbcgmTxANX8jYf2Y9oi77c2t1L+mzPz9XYJlOwux50h/S
	Yop+/b6FHVb9zLjG2qnwCP+QWuhoht/exfW/z11efb16z2NRlbxew+9wTf4GTG9AbFbASTrtg/c
	IVAYgaDdL2RhgOiYG+YxDtm6oJIFg4UOe3xGTBMZyM6Jy8sPadboAGaMxe
X-Google-Smtp-Source: AGHT+IGTSgfmE4C9KUY01cBQCa6U+zujjBr3JQn5JFHu87otSRTtbM+9TibC6Ub/YfaplbG5HQdBpJHJtYPG69/HM40=
X-Received: by 2002:a05:651c:885:b0:30d:e104:cd56 with SMTP id
 38308e7fff4ca-3179ffc1202mr10727731fa.39.1745504072212; Thu, 24 Apr 2025
 07:14:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
In-Reply-To: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 24 Apr 2025 08:14:20 -0600
X-Gm-Features: ATxdqUEG7UgU0b-fYJDsj-X6YeibPATP71Sc8xsrfndaXkHmANCAN6IFo1WtuOI
Message-ID: <CANLsYkxKHhCHYrbAGzQ48QGpL_DbuLnX3=ppmpyu0vjuuvvODg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] of: Common "memory-region" parsing
To: "Rob Herring (Arm)" <robh@kernel.org>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
	"Andrew F. Davis" <afd@ti.com>, "Shah, Tanmay" <tanmay.shah@amd.com>
Cc: Saravana Kannan <saravanak@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"

Arnaud, Daniel, Iuliana, Andrew and Tanmay - please test this patchset
on the platforms you are working on.

Thanks,
Mathieu

On Wed, 23 Apr 2025 at 13:42, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> While there's a common function to parse "memory-region" properties for
> DMA pool regions, there's not anything for driver private regions. As a
> result, drivers have resorted to parsing "memory-region" properties
> themselves repeating the same pattern over and over. To fix this, this
> series adds 2 functions to handle those cases:
> of_reserved_mem_region_to_resource() and of_reserved_mem_region_count().
>
> I've converted the whole tree, but just including remoteproc here as
> it has the most cases. I intend to apply the first 3 patches for 6.16
> so the driver conversions can be applied for 6.17.
>
> A git tree with all the drivers converted is here[1].
>
> v2:
> - Fix of_dma_set_restricted_buffer() to maintain behavior on warning msg
> - Export devm_ioremap_resource_wc()
> - Rework handling of resource name to drop unit-address from name as it
>   was before.
> - Link to v1:
>   https://lore.kernel.org/all/20250317232426.952188-1-robh@kernel.org
>
> [1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/memory-region
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Rob Herring (Arm) (4):
>       of: reserved_mem: Add functions to parse "memory-region"
>       of: Simplify of_dma_set_restricted_buffer() to use of_for_each_phandle()
>       devres: Export devm_ioremap_resource_wc()
>       remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
>
>  drivers/of/device.c                       | 31 +++++-------
>  drivers/of/of_reserved_mem.c              | 80 +++++++++++++++++++++++++++++++
>  drivers/remoteproc/imx_dsp_rproc.c        | 45 +++++++----------
>  drivers/remoteproc/imx_rproc.c            | 68 +++++++++++---------------
>  drivers/remoteproc/qcom_q6v5_adsp.c       | 24 ++++------
>  drivers/remoteproc/qcom_q6v5_mss.c        | 60 ++++++++---------------
>  drivers/remoteproc/qcom_q6v5_pas.c        | 69 ++++++++++----------------
>  drivers/remoteproc/qcom_q6v5_wcss.c       | 25 ++++------
>  drivers/remoteproc/qcom_wcnss.c           | 23 ++++-----
>  drivers/remoteproc/rcar_rproc.c           | 36 ++++++--------
>  drivers/remoteproc/st_remoteproc.c        | 41 ++++++++--------
>  drivers/remoteproc/stm32_rproc.c          | 44 ++++++++---------
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c | 28 +++++------
>  drivers/remoteproc/ti_k3_m4_remoteproc.c  | 28 +++++------
>  drivers/remoteproc/ti_k3_r5_remoteproc.c  | 28 +++++------
>  drivers/remoteproc/xlnx_r5_remoteproc.c   | 51 ++++++++------------
>  include/linux/of_reserved_mem.h           | 26 ++++++++++
>  lib/devres.c                              |  1 +
>  18 files changed, 339 insertions(+), 369 deletions(-)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250423-dt-memory-region-v2-a2b15caacc63
>
> Best regards,
> --
> Rob Herring (Arm) <robh@kernel.org>
>
