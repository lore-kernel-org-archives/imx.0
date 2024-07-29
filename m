Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB523155751
	for <imx@lists.linux.dev>; Mon, 29 Jul 2024 14:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722265163; cv=none; b=fg2MpgShNCLABDeM+R/H/ipKQo/VvUaw1P9viBgBQb5BpC7hsmolnNhIofnlgeFYpF3WTaF31847eV8g9Ey8AkNkxTf0KXaZCGNIkoaIPIdj3NtqSfvFPFEslkjmeWmk0JjrtKNNnhPfDZ9oyAcOXkDrPagRiYBXipepw6IVbtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722265163; c=relaxed/simple;
	bh=BNOXPZtZKWW/vqL54/YmXApUaSlHoTjVustBzHzHkRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NhsCLdR4ccOkBsCktjU3Mpf4xbLvMLtEAbofB+6TS6t9nZgVSP79tZkK3WwFSDdjNbxK7APHapBXGIVoQU2FyEFf/ySAB6aHhUoY8beBODfRShU814foXr4NYVAnYTNU/6HGoBo49gdgTh1MSA9/GOwUxHUJXpB2saIlaTePYLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vxseU6gm; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vxseU6gm"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-261112c303bso2536268fac.1
        for <imx@lists.linux.dev>; Mon, 29 Jul 2024 07:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722265158; x=1722869958; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2dhV9pLkwnO6TngFTZ6PEmd1aRr+aIvv72OqFegZv0k=;
        b=vxseU6gmdGxP73/BpSlm13aDK3TiTfz4c6BZmBDyi5PKJYF90PMSP/HdoOc13dSQ+E
         dl8pP1NgxDoxvm/w3MfPjaHfgVHEx9Ci5ZdWhtpG/xR4tLylH4Y0YDEwAzcAPeIcL6pk
         puq9sZPXMGFIOy9Af2Wd0A8Pqjcj9SRYCiZT0wnCe47L6aiingj7RDwtAfwxFMLnE9cr
         VCO4bC7rcH4dALeJ0EygFW7DcIVxBFN0O7pmMvd4g1AxFKOUyG8k7aQLZkP5Fpt8Bh+f
         ZVVMj1u6nmMo31rDtGetgAsuLplx7lV+T0PTx1PbmNcxL1DPcw9lJT/4UCpYfIo+rSrS
         8frQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722265158; x=1722869958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dhV9pLkwnO6TngFTZ6PEmd1aRr+aIvv72OqFegZv0k=;
        b=MfQYqD752YKc7Al2hqMqar9qZsqRHJ/q3cfiwApNgmPCpCv6NsuBNhBBDFAYLrqf6i
         I84n0q+2KLRZ9qVl+dqjOc+drZXPLlECxoVxI2B7/O8BcyAcAJhuZyGkhnf1MI/QHsL6
         SkDIwFWNmf4YXu27eH7fkzcnV3HA6zny2d6qK2ro0NLdZko7PYKiMyGG0+i/VneUiXQ5
         OaEDisHMSA3/PQIQB5fpGgkTGyutz+yrk79Jk85AhE5Q2R+EbfGSvgVq299kTumDYjzr
         z58IUYXiQ6KGN0Y75nPpegT4uBF5PsLehpa4YVwvYYwNQvhdfEWSW/8vad7rgtvmQo8R
         ykKw==
X-Forwarded-Encrypted: i=1; AJvYcCWHaRd4bhHbsFOjVM7OFJvHrRP9IVH/Tu5FIaNCUUPXtvD0wk+W1wlhyhCfa3CaA0BPv8gowKBqjbaa4HS4PI8GRT5z
X-Gm-Message-State: AOJu0YzV4IFBgb2QZuoeqVMGRzl/I+QvUKJ5ITUSE2Pc8BBYThXLOytC
	3KrqE+jnBr878M0ySg+YFI3foM9kafkclKqOsweOm8zKgfcS3W1gjnsRdGHzESc=
X-Google-Smtp-Source: AGHT+IEdbCnGqwPNsJw9sRMXxW9hssPlB3eNzpMfeFiqhxqlaGC54wLTPHxF2sPrKmY2qW30e4vafQ==
X-Received: by 2002:a05:6871:520f:b0:25e:368:b5a4 with SMTP id 586e51a60fabf-267d4d0a47cmr9601699fac.18.1722265157961;
        Mon, 29 Jul 2024 07:59:17 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:b771:7ecc:900e:e070])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f7b7b1besm7398510a12.2.2024.07.29.07.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 07:59:17 -0700 (PDT)
Date: Mon, 29 Jul 2024 08:59:13 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Marek Vasut <marex@denx.de>, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Terry Lv <terry.lv@nxp.com>
Subject: Re: [PATCH v2 0/4] remoteproc: imx_rproc: various patches for misc
Message-ID: <ZqeuQSNUA1X1wlD2@p14s>
References: <20240719-imx_rproc-v2-0-10d0268c7eb1@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719-imx_rproc-v2-0-10d0268c7eb1@nxp.com>

On Fri, Jul 19, 2024 at 04:36:10PM +0800, Peng Fan (OSS) wrote:
> This patchset is to upstream a few patches that in NXP downstream for
> quite sometime. For patches directly cherry-picked from NXP downstream,
> I keep the R-b tags.
> 
> Patch 1 is a minor fix to DDR alias.
> Patch 2 was sent out before,
> https://patchwork.kernel.org/project/linux-remoteproc/patch/20220111033333.403448-1-peng.fan@oss.nxp.com/#25144792
> this is just a resend
> Patch 3 is to avoid mu interrupt trigger earlier.
> Patch 4 is merge small area to support elf that has large section
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v2:
> - Add R-b for patch 1,2,4
> - Add Fixes tag for patch 3
> - Drop downstream R-b tag
> - Drop patch 5,6 which will be in a new patchset for 7ULP
> - Link to v1: https://lore.kernel.org/r/20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com
> 
> ---
> Peng Fan (4):
>       remoteproc: imx_rproc: correct ddr alias for i.MX8M
>       remoteproc: imx_rproc: use imx specific hook for find_loaded_rsc_table
>       remoteproc: imx_rproc: initialize workqueue earlier
>       remoteproc: imx_rproc: merge TCML/U
> 

I have applied this set.

Thanks,
Mathieu

>  drivers/remoteproc/imx_rproc.c | 37 +++++++++++++++++++++----------------
>  1 file changed, 21 insertions(+), 16 deletions(-)
> ---
> base-commit: f477dd6eede3ecedc8963478571d99ec3bf3f762
> change-id: 20240712-imx_rproc-25f3ab753c58
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 
