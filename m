Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725CF26CE3E
	for <imx@lists.linux.dev>; Tue, 24 Jun 2025 16:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750781709; cv=none; b=J/f6gX/JgQuoepgNVQfghBI6vK5nPAICyVTFJ76uQt+12zrcWD0t/NW84wK6/+H+dRziTyyxT9jNaV2y1MjsbJmnqQhL6VIxjijnyWtCAzXKuDJ6NUk/VQveK3izxGRmel72690Uzp5XtFUBzCt3JRvzOUjMmYzgvbpdZgjqXyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750781709; c=relaxed/simple;
	bh=lvGwQAAObMcMpnGSVKYiVQnRJ15AOjLbSCae8dPzrUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S8StAmCtOIYqMmuLbaqRA5ef6GMQGhHJmLF9UCUXjlhr9lO8HP8LIWAZTR1vkphUbYy6yvPYqJDZ8zv/wd2so6xi6cyOqG/6mOL1XLjFqKvlxVt03SQic7976lIhR9clKLXQvokuj3E+gbOO56G1+Y2YynUj1ksE9/Ij6WyAKbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gC5x/Zb1; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gC5x/Zb1"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-23602481460so7816585ad.0
        for <imx@lists.linux.dev>; Tue, 24 Jun 2025 09:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750781707; x=1751386507; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NOFa14hzPvC6t+oIp0DexT1UxNfRS4Cl15Pgd6Dy9Oc=;
        b=gC5x/Zb1trO52d9Jew/b1cK9EFz8C0BsPABsfklM10mNjjoH+JVzgtYvQjP/gUPEtr
         dtCNsP1a++ONmOO044JwpbF1PZtCguk2L81lyV2J9Yxu7RLA2lcBEdOOfmekqhoZiiGQ
         0u9NlPcTcBMSMXMatoYrYJudouKfCrOHkiy88ZGZQIHfyRYPFsVpe80LHy/bkrunxu9O
         dCnm5AT3Zlkxc6BtywaBOYUdeuyEi2HYe2bhIUM7fyBvPpQ12iC4lDniw73kwEnnIBf2
         wy7xV/0GehfTv9kovbT4VpJqyxaxW9RQzpJ2uuu4O+/mLSLuZ5VJrKDwJ4EsFkM/Hfb+
         S6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750781707; x=1751386507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOFa14hzPvC6t+oIp0DexT1UxNfRS4Cl15Pgd6Dy9Oc=;
        b=cXIp+NMSiZimtU8/CxwGZurzTdQc0YdcwxzDm52Rtqfk+YySvuG5rRsDjOGkCSd5Ue
         EDxggywAPsDGtGDfOIoOL7ZDRK3cfrTRHWE/cuWpUDkMa87jFZuYaJzUIFERg6ym9o1J
         9m9f/UbvWgPUyO47JsJ9ebsw46fmCyOA+5dyceOy84H4jfqVY+ULM3EIxxqJAPSiimyQ
         SJn3X3PcpPJop//hginebk+RdbnRoRKm4zfVw+VYPdBPeBibShZ3zeCrB8KgF20T+Rem
         5c/kmxGMScMfDe79agZz79c56cIdDjxqsFM0aZ3R0AcWoA8yLyzJSv/cgyjEv5ZzWDxB
         FmSg==
X-Forwarded-Encrypted: i=1; AJvYcCWqaZgU7HCbrzrcolig76Xm4W/lt4bcSKycUTBZyGl+swMscffFjQ4KziWo+hOUDQyHDKQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJ+zKgl1/vVoVvZ5GKZMyl3xXi8CEFx2+mClQGMQHm4pHYnZRz
	dpyPhU2AYznlUqLq9TpOep1lOMW49jhdWXWNdoUJ7PDCujsKPB0f+jxK
X-Gm-Gg: ASbGncsFJsjvQBtHD5ayqDmw68nSh/lkLj6JaqENzziuj6sivIW10iOKqv3tkwY6bz9
	i9w5vg8gxu/HaNg4hXk3Vl+N9B9Tp6KWtUHQUF5ihX8fojRSzZLUlzl4XjoRm9gk0ctmu80cS9Z
	szdo/K/x7aiSuPGEBkCiQ9sMqVWVtvoA+itUrlIBdWrrbcH5uUkcpbt2rLoPaVbvQFNaqmABfQ8
	Jbi3kYB4IgXgYp7lwDBs0CInOi2SxL7LHlAuH4o2PF1lNAHHmeWt0FN4X8SjiwpHYKPg2NZPY0c
	SBUCH9PbgCQc3v8UDXc7jFMAu/pyySfVGjLVBkumCQz/GW9qObWU6PeTjRc=
X-Google-Smtp-Source: AGHT+IHG7rYkinFLRzsG4MwI6gkoEJZsqgBi83L3LCSzHE9voyWIDchNPTp5X+xH8/2vrw7ovBDS3g==
X-Received: by 2002:a17:902:f54f:b0:235:ea0d:ae23 with SMTP id d9443c01a7336-2381ddd180dmr3846685ad.6.1750781706256;
        Tue, 24 Jun 2025 09:15:06 -0700 (PDT)
Received: from hiagonb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d839618esm115515765ad.33.2025.06.24.09.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 09:15:05 -0700 (PDT)
Date: Tue, 24 Jun 2025 13:15:00 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v5 2/3] remoteproc: imx_rproc: skip clock enable when
 M-core is managed by the SCU
Message-ID: <20250624161500.odnopjv5jqvyyus2@hiagonb>
References: <20250617193450.183889-1-hiagofranco@gmail.com>
 <20250617193450.183889-3-hiagofranco@gmail.com>
 <aFlvqK6SHvWHIpMn@p14s>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFlvqK6SHvWHIpMn@p14s>

Hi Mathieu,

On Mon, Jun 23, 2025 at 09:15:52AM -0600, Mathieu Poirier wrote:
> Hi Hiago,
> 
> On Tue, Jun 17, 2025 at 04:34:49PM -0300, Hiago De Franco wrote:
> > From: Hiago De Franco <hiago.franco@toradex.com>
> > 
> > For the i.MX8X and i.MX8 family SoCs, when the M-core is powered up
> > by the bootloader, M-core and Linux are in same SCFW (System Controller
> > Firmware) partition, so linux has permission to control M-core.
> 
> Ok
> 
> > 
> > But when M-core is started, the SCFW will automatically enable the clock
> 
> I find the "But when M-core is started" part confusing.  Started by who?  And
> are you making a distinction between "powered up" and "started"?  It is not
> possible for someone that doesn't have HW documentation to understand what is
> going on.

Ok, understood, I will improve this in the next revision. Just to make
clear, I am talking about Cortex-A bootloader starting Cortex-M (U-Boot
bootaux command in this case). This means powered up, started and
running.

> 
> > and configure the rate, and any users that want to enable the clock will
> > get error 'LOCKED' from SCFW. So current imx_rproc.c probe function
> > fails because clk_prepare_enable also fails. With that, the M-core power
> > domain is powered off when it is still running, causing a SCU (System
> > Controller Unit) fault reset, and the system restarts.
> > 
> > To address the issue, ignore handling the clk for i.MX8X and i.MX8 M-core,
> > because SCFW will automatically enable and configure the clock.
> > 
> > Suggested-by: Peng Fan <peng.fan@nxp.com>
> > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > ---
> > v4 -> v5:
> >  - Unchanged.
> > v3 -> v4:
> >  - Unchanged.
> > v2 -> v3:
> >  - Unchanged.
> > v1 -> v2:
> >  - Commit description updated, as suggested. Fixed Peng Fan email.
> > ---
> >  drivers/remoteproc/imx_rproc.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > index 74299af1d7f1..627e57a88db2 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -1029,8 +1029,8 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
> >  	struct device *dev = priv->dev;
> >  	int ret;
> >  
> > -	/* Remote core is not under control of Linux */
> > -	if (dcfg->method == IMX_RPROC_NONE)
> > +	/* Remote core is not under control of Linux or it is managed by SCU API */
> > +	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
> >  		return 0;
> >  
> >  	priv->clk = devm_clk_get(dev, NULL);
> > -- 
> > 2.39.5
> > 
