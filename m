Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EF42F8C5F
	for <imx@lists.linux.dev>; Fri,  4 Jul 2025 16:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751646324; cv=none; b=hdQXWJd222TX/MLGPOdJxG8Fx1auW31KkpJ5Wfu4z7zGe8/6n3yQdftZQ9DQy4R9l8nCwNNfNMC+cyXZAJnHdkSeJfTyu3+v5ITvlJrVAwD5SaWB3A6kBf/30J+QCXBaudqmbfmDsEzXaI7EHijlIQlvk1uttwNaULjd9yynbj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751646324; c=relaxed/simple;
	bh=DmkuvrNR0VSL04LmD9dkfnMwSx/b2+d/LUqM5NHqjpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5h9ybQciXoHrRkLL/PXN1bpAIlXq1nzH2de6nvQfR5LcxKVlGXPWI6lPk+VYCJt+lsXJsheNeUNIsV+2O858WgsBbAB+qr4XjpaTcxsaaWUiRrogT6vZkoFr1dkRzv/KW6muM9py35hlhSeTcfZZ+Lpg+ydNPY5GAsegAfOwk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TwFxCIPR; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TwFxCIPR"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-748fe69a7baso997406b3a.3
        for <imx@lists.linux.dev>; Fri, 04 Jul 2025 09:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751646322; x=1752251122; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gLPE6u9pVE9mFKhORQsoD2PjZ8/6f/PPPShr0ovcjeY=;
        b=TwFxCIPRWO1D21AZqNPSEqHJ7bE884pdwPWuS8/XEmlYwjCzP+N6L1/FyWx7xEHZAn
         tdZxaZ8gnyG9OXzkmEhAz+S3MMvJQakWcwrtnqvoc1YCDhx2MCq16vADOiSB4AtwYn4b
         /fvfZjt4y3Q3qrpW5PA9vxnsbhjNY3Hj80PjXgqh/MweCWTmlzNOQBNS33y91vZ40zRh
         eFJnPQgaB+TG22jGkLWTENXmRwsmzKlaJs2MrnVOi2xmf/nW2n9zhCvOLCHUjkE01a2h
         RgbGpMkLmS+0wt7AOUc+Ud2uJD5zBRilscJ+MLRjoPVbxfDU9w6UcPiIEkxl8mP3YFP9
         WJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751646322; x=1752251122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLPE6u9pVE9mFKhORQsoD2PjZ8/6f/PPPShr0ovcjeY=;
        b=n37CGJeJBfiJ2erXibYcZchNj66uq51hgSVJQEDSI7OgpIlhOuOsasnkNs+6MHkhWK
         p2XNwChTTyLceC6kNlMh+rCCV/VCei7Lw2TYbrelTFN1ldZjQRO4x8Oxwk39Kvph6nya
         oZpbpIyNsxuWSPGtJsXmJQgePxncNC+TqiXqVCff+iGud+kRCv6uVrNgGpg63cwcsvf1
         bgOd4tO0W5HeJhqyFgMFUkm21SrGcDZzVCZo0YlRkO6HR4a2xMkrC9x7isHc3txoq2/H
         ZvYL5us34Xy/3H0B0eBpjLfbs5xNK1S80WPGDuyzOiW3gorR3muREMaxFyU+wjoebnoe
         WtYw==
X-Forwarded-Encrypted: i=1; AJvYcCVc8CsVVGnn1oxnyfiKEdD8DBbRRl/KcIyrYpBEnr/turP09zkoIs0AWOYoBpOs6qZkFHw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyVFrffedjBbP1t/107rOMgiTWf8oaEWZ77vmus8lXPOO9ww/m5
	2UcenCmLlEKMoPM8sdkC7wCzifzd5vvbLyd5AQuLBpJnyX9RkoIESlCXNljr0FaK2G8=
X-Gm-Gg: ASbGnctoengjO3x23i3N0O826h0tWat07f9r0lm2B4wupyoBzgY54kJQXmHB1MdH+uM
	mXxyFVlxPAMJrucpE357XcgiTMyaBlnOVDoWJp9Po0+eW8dCDVburu0i7Jc7A884xuZcUic6cQ+
	J8x2lX77kSMvx5Rb66MtDcMsK9h09pbDvcIpTOdgwLRYjogbHfwwNTENy2kf+kZhJNPgfc/OX0x
	QGfCoy0oUpr4XUVBdgV5N/WjhCATVkB1q4iHJaM1tmnk5qHF13yTS8Y253p8C9Sh0nGlN6IXb0S
	ncjyLce2tsH/oaympDD1ZAH/vqc7up8xxbX8W7xNm66EGY0rnoU01/d/HodlSbgrew==
X-Google-Smtp-Source: AGHT+IFBiad93Pn2/FAtXLpWzkQ49cPn+B6HjvtiH5Apy3jz1Cm6ZSX7XnZ5N4+nL8xIggbIhrfCsA==
X-Received: by 2002:a05:6a20:548d:b0:215:eafc:abda with SMTP id adf61e73a8af0-225be8d93abmr5288088637.18.1751646322493;
        Fri, 04 Jul 2025 09:25:22 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ebf3:da99:de93:f600])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce35cba78sm2572801b3a.57.2025.07.04.09.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:25:22 -0700 (PDT)
Date: Fri, 4 Jul 2025 10:25:19 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>,
	Ritesh Kumar <ritesh.kumar@toradex.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: merge ITCM and DTCM regions
Message-ID: <aGgAbwToGhsc5VV9@p14s>
References: <20250703130831.18830-1-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703130831.18830-1-hiagofranco@gmail.com>

Good morning,

On Thu, Jul 03, 2025 at 10:08:31AM -0300, Hiago De Franco wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 
> Merge the contiguous ITCM and DTCM regions into a single region to
> prevent failures when loading ELF files with large sections:
> 
> remoteproc remoteproc0: powering up imx-rproc
> remoteproc remoteproc0: Booting fw image rproc-imx-rproc-fw, size 151824
> imx-rproc imx8mp-cm7: Translation failed: da = 0x1f48 len = 0x1fcb0
> remoteproc remoteproc0: bad phdr da 0x1f48 mem 0x1fcb0
> remoteproc remoteproc0: Failed to load program segments: -22
> remoteproc remoteproc0: Boot failed: -22
> 
> This approach is the same as commit 8749919defb8 ("remoteproc:
> imx_rproc: Merge TCML/U").
> 
> Suggested-by: Ritesh Kumar <ritesh.kumar@toradex.com>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> ---
> Hi,
> 
> The ELF I tested had the following data section:
> 
> Memory region         Used Size  Region Size  %age Used
>     m_interrupts:         680 B         1 KB     66.41%
>           m_text:        6984 B       127 KB      5.37%
>           m_data:      130224 B       128 KB     99.35%
>          m_data2:          0 GB        16 MB      0.00%
> [100%] Built target hello_world_cm7.elf
> 
> Which triggered the error. After this patch, remoteproc was able to boot
> and work fine. Thanks!
> ---
>  drivers/remoteproc/imx_rproc.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 74299af1d7f1..bbf089ef48ee 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -166,8 +166,8 @@ static const struct imx_rproc_att imx_rproc_att_imx8qxp[] = {
>  
>  static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
>  	/* dev addr , sys addr  , size	    , flags */
> -	/* ITCM   */
> -	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
> +	/* D/ITCM */
> +	{ 0x00000000, 0x007E0000, 0x00040000, ATT_OWN | ATT_IOMEM },
>  	/* OCRAM_S */
>  	{ 0x00180000, 0x00180000, 0x00009000, 0 },
>  	/* OCRAM */
> @@ -180,8 +180,6 @@ static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
>  	{ 0x08000000, 0x08000000, 0x08000000, 0 },
>  	/* DDR (Code) - alias */
>  	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
> -	/* DTCM */
> -	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN | ATT_IOMEM },

In commit 8749919defb8 "dev addr" and "sys addr" were both contiguous, but in
this patch "dev addr" is not.  How will this work with new kernel that use old
FW images?  Am I missing something?

Thanks,
Mathieu

>  	/* OCRAM_S - alias */
>  	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
>  	/* OCRAM */
> -- 
> 2.39.5
> 
