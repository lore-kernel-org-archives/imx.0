Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFC92798E6
	for <imx@lists.linux.dev>; Mon, 15 Sep 2025 16:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757953643; cv=none; b=R5cdMaSoC3yUf6xAHrCfIBduXs+oGDI67GeOg/Wy+6tpOy/ExFyxUimC+vXjkvSVdMVpFIYUEtA73noXN11Ju3Z9ei/5U2YW2inOAGnk6sWpKzLLlpK6xuPL3YGkgcRgZgLb5CljjyGBBfA2mEZpyxDkloJEhJTY7EOteYNd4uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757953643; c=relaxed/simple;
	bh=0VlPIbvVpTDmLyoSfoRRRH9s5pOp0mu5ypKCH+mS90U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BuU8tuv49Rfhex5ZpwJMU2X5LRRX+NXI+BJqxRNAPuQRlfS8GmhRttC7KBKbNg2ymyENXFUezx9h2qX3PYwUquWWOH9iJHgUbRLwtJtmUIbwH83M4jz+oanGPoZAiTW+7UqhfGhgrmqaUP99SD2+0fqin6WcKavG3XzHGh37eZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vhzlmQlV; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vhzlmQlV"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-261682fdfceso16863455ad.1
        for <imx@lists.linux.dev>; Mon, 15 Sep 2025 09:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757953641; x=1758558441; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Wq0zL/Wc0Htkj+BfsfKHKvDwUIKed8MK8zTT8591bA=;
        b=vhzlmQlVSQGwUHGu+65tu7YrZKGTHQGRoewnSfCgAR93SrSHU+Abjpx/qOSECAW/aC
         94JEWuSpJI/9t1K6bmpfhjW5XG7iO5hGLcCOWNrjnMykO/Tfm42uzDqXUKkNbMMUxEWd
         LV+4NEE84x6mjBlUcIzaAg8tZInVDJns6RLEovkswQgoO0H3sH93gW5bejcoPw/5EDQG
         0TO1pTjx6rSbVTPGgN9lFZmOowfViu2dd7nBJxHghjqBXH1ov4JXwheW/DOCzi+IJc3/
         aUABC6V0WJ6piC+s8s7vZWoHB2M6lUB8Y2yyAjRtWDdg9eoUKFoP1OChWKfqwMqXjE1J
         As8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757953641; x=1758558441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Wq0zL/Wc0Htkj+BfsfKHKvDwUIKed8MK8zTT8591bA=;
        b=il3oQ+B3AfWvHfyewn1qNyjIZmM3BI9PTv/2XfDPAp53wV6N/H0Cj24CCWOMo4MR+4
         AWJ4aX9Qvn8+WaAGcipxWfYzh/tV5/+3bWiZ+O08MMj+gx2oqQOaIGkiZFGZrqEuCrpd
         SJzYbQkohm2ZGavLGcJI23ZHgzjhfEjxUzRi4zZtjmZAtdEOVgvmcvB6dDB54gEXBTCu
         2shGMiRQGIFtuIXKZEXhjSKByCY9RfoQEbrXt1Ohtv3oLt0A/L1VirlolsWAQFuZzWEr
         zUDQdSOmlvu4aXNx5dCAMzX7XOjdLfrM5NqtYsxwfUDrCALTX+4t3m+/5o4TWTxbJUeK
         BXGA==
X-Forwarded-Encrypted: i=1; AJvYcCXzmfvhuDSbreEBGLMx70mr2OntmnpId2S5jI2srV8hAAB/HftcqqYbup5PRyMbnaPAfXE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUCnn04JMOfZy83yh//k/uyjNHWHa2wl/bROLtorAlIjciqYcB
	uq/7h9UAzN3hAwqUHPU+faRiQ3WnPcbNKrziI3h9TWb911aU2BWbz0jaBScC24W1IEo=
X-Gm-Gg: ASbGncvD1UY1XCSuCfWquOJJHb3lVKXAqCq7259o4J4uhJcOPkTZJQAJoNMeSHoDljH
	My7wWqhht95hNJ1O4DL5FdD+9wv7KxmTT2PyDaemJKVvrhwK+KmazYgIj+SS6OFP+BXyvQ5aTZC
	Z/F38jilKJZHcGJlrOXdtIP3eW6wqcnOCW0Dpok7UfVTcDzH2AusO+x5+l9vAh/4lvwh5oYKcaj
	JTGtKu+N5SUPwufzYO7zd9f/OVVPDkcI3Is50AJKWPLwYYvKBJGhLoX86GXWQdas9m8iykQwZ7o
	sBo4wBl7l9n161JYkTY90pCkGuN+mYfr+GuD2WvQ0StZNry60REVnh2UV/zNMX/0FlIPgJ1Q+v+
	4F9KGyWlZu1YxlX6OboUaCP/A+n7MfbWvsKKlQ53GtLNSfQue3f6LpfXWdQ2RRvHbVFVwNkCIcG
	gYz6k9aHomqvG35yomZoyesgkt4WFpee8ddw==
X-Google-Smtp-Source: AGHT+IH31zRCUDSkqS9JLKhdPK0Ywp1tQqr2PiZwav0DNP7t0zDxlTNym5N+G+H44epmJz9G3i3bdg==
X-Received: by 2002:a17:903:41c1:b0:262:3e45:4c88 with SMTP id d9443c01a7336-2623e454f01mr114037935ad.18.1757953641028;
        Mon, 15 Sep 2025 09:27:21 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:67c:a85d:f066:9008])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-267a1d2eccdsm22392055ad.97.2025.09.15.09.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 09:27:20 -0700 (PDT)
Date: Mon, 15 Sep 2025 10:27:18 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <frank.li@nxp.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] remoteproc: imx_proc: Simplify driver by removing
 the switch-case
Message-ID: <aMg-Zg6juddLZwfO@p14s>
References: <20250910-imx-rproc-cleanup-v2-0-10386685b8a9@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-imx-rproc-cleanup-v2-0-10386685b8a9@nxp.com>

On Wed, Sep 10, 2025 at 03:11:44PM +0800, Peng Fan wrote:
> This patchset serves as a preparing patchset for i.MX95 support.
> 
> The current code logic is complicated, with mix the usage of switch-case
> and if-else.
> 
> To simplify the code logic:
>  Introduce struct imx_rproc_plat_ops to wrap platform start,stop,detect_mode.
>  Each imx_rproc_dcfg data structure is assigned a ops pointer.
>  The common imx_rproc_{start,stop}() directly invokes the plat ops, no
>  need the switch-case.
>  mmio/smc/scu_api ops are included.
>  No functional changes.
> 
> Thanks to Daniel and Frank for the help.
> 
> Test on i.MX8MM for MMIO ops, i.MX8MP for SMC ops, i.MX8QM for SCU-API ops.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v2:
> - Simplify the if/else in patch 6 per Frank and Mathieu
> - Add R-b from Daniel and Frank.
> - Link to v1: https://lore.kernel.org/r/20250908-imx-rproc-cleanup-v1-0-e838cb14436c@nxp.com
> 
> ---
> Peng Fan (6):
>       remoteproc: imx_rproc: Introduce start/stop/detect_mode ops for imx_rproc_dcfg
>       remoteproc: imx_rproc: Move imx_rproc_dcfg closer to imx_rproc_of_match
>       remoteproc: imx_rproc: Simplify IMX_RPROC_MMIO switch case
>       remoteproc: imx_rproc: Simplify IMX_RPROC_SCU_API switch case
>       remoteproc: imx_rproc: Simplify IMX_RPROC_SMC switch case
>       remoteproc: imx_rproc: Clean up after ops introduction
> 
>  drivers/remoteproc/imx_rproc.c | 449 +++++++++++++++++++++++------------------
>  drivers/remoteproc/imx_rproc.h |   7 +
>  2 files changed, 265 insertions(+), 191 deletions(-)

I have applied this set.

Thanks,
Mathieu

> ---
> base-commit: 3e8e5822146bc396d2a7e5fbb7be13271665522a
> change-id: 20250908-imx-rproc-cleanup-6f3b546b9fdf
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 
