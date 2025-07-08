Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E51219D8A8
	for <imx@lists.linux.dev>; Tue,  8 Jul 2025 17:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751995805; cv=none; b=jbHEDu2w1hMsv675+pr3YC+QcRzdyI4oU0lbZVvYJhPiGMyWQI0U4T83SmD60Ni6kpKmllUkuq37BSNLHH+RGdnucjvxm6u6hXFt6nxGFzXZ9SY6S9FmYfzYVcK3LZAEzBGFMl+JUCY3p0QtTrA5ljqrqBNWPJFBj74rJfhZPI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751995805; c=relaxed/simple;
	bh=vlMsyk8PePj05/Qp9smxa7jsagrQmzRpKk6M8DQUZX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EyNPGf2aTIR6afVdRnLjKl4DXU1/jBuAmPvmHk0xZxB3Gi9NSYIlySUHlYAYKtEKTR9YBXhMvHsKkUbYIqo0HqgSgcsfQJXTrALwH/kcsUKtxIZgRmgkBSqUZVBIlC/VukjVYrCQLEADHQJinJlpEQKO0DG1rM01QJlHp3ZhBAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0Zbdkmx; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0Zbdkmx"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7d5d0ea6c8dso347976685a.1
        for <imx@lists.linux.dev>; Tue, 08 Jul 2025 10:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751995803; x=1752600603; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KDWmvBi+xrTnEZOGiVtOCiEcPvDY+R/VmkacimBElWU=;
        b=B0ZbdkmxV0INdhu1BGoUThkER/GFlMEAwilkXBrn5qvIFgb1tntWICadUn/meGNv4N
         FYmPZiJHiGTlYne7LOi6t+RjME+DGWsiX7bCDy4+o6a3bDpoMP32nhULOcs0RmI6ZgUX
         yPIQDhId7vVfdYe6hV1rUjYHwmPyyDeA4G4U8AbRNl3sUGapsTkK9sNShHdmcZIHby8A
         qclOi0g+L3U9bDc8CoaK2U/qq10z3cJWaWoSNhl9Hx5WnoeXfxRGyUcpLJoF0kNHmSKb
         uaqAGqBjkt8G327FXq4eJBBwVw+uZXNzNbEwnFIbObjogJseD89wLh4rcsDjh7esYzD7
         Ezzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751995803; x=1752600603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDWmvBi+xrTnEZOGiVtOCiEcPvDY+R/VmkacimBElWU=;
        b=neOoOaxxitG+2WdSNMQZv9Y/PLDyfxqei2suxwjILIsvk5t5VebkhNpj1Hgj13rCVH
         qqs9E+WWuXbZmlxRP9wFJXl+j9HRnyScKaXoO0KVIMB4zFq0G3cOd2kfHaLT4vIIGNvv
         HnLhwPaGZ1iP9CvJfT2+nSjTO5QWjY7f7rLDgYmB4GeYhQ/Tl7etziBJHt5GtDuO6slv
         t6FBguyVgqERxGTD+fv1HV+NjlpPWddvw/jrLN4MQ9Th+snb9hdCtSxqzJx96DqY83fF
         Zy8IWwK48Rqzvbmn7/LofFy836s/BwXjD84FsOQsg/yBwzDBona0HdziNy9ZD8NHCRHP
         HKXw==
X-Forwarded-Encrypted: i=1; AJvYcCVTQASYs3HJDfWjBp9R5VuI+n7pixAgaHpkiFiccQzOt0v3XHLHZm92ssppyQ0MLaRzBA0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzk6Yk1RVyP6Xj9tfwWMfjIw03wbWmMgx9ex+qDjs8aRuea1dVe
	N+pQKTyhOKR1ITrUesDr0nMCthZt39ecjN1aCskJ1MU1ZaPWEgjYrmzg
X-Gm-Gg: ASbGncsO+7OmlPeR9KzqwDZwJIT6HylKsBnIiCkF+tUPftn9jiK1FVz2KdraT5gJQI9
	U2Jsc/nkSaRqYnpmv4ooTAQIhn5r7f6LO2o2xksMfipNUdkC3V27HedyNqA8vmI/0EQWZtnRtEo
	If+M4c2tTk+0/PBdLojTa7a1y78Vy7xwEWqv3X0pWC8DVzsO4ncZj/vTvJeiy0paX+UmUr9BWsq
	Ca2Y7TvkrhVkkDZUwcPAI551lC3Hh83bFmeCnu4Zef7FnupQz2a18Y69YHp9hyDbt+++vISVCTS
	p6ue6f5h+C/G//cNRHn4Ym+lX7s9kH1un2L1U4Y1xypzDQh5Vq3taTfxiA0=
X-Google-Smtp-Source: AGHT+IHpicuys1It3Yx8+rY+BPbIsN6Cyx0b4XZQ3+D2q9CPqUCHLJrwgcMoTXm4g+kFQQ5etcBEyA==
X-Received: by 2002:a05:620a:4304:b0:7c5:a463:397b with SMTP id af79cd13be357-7d5df11dcbamr2094173085a.20.1751995802972;
        Tue, 08 Jul 2025 10:30:02 -0700 (PDT)
Received: from hiagonb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbe7baedsm809718785a.57.2025.07.08.10.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 10:29:59 -0700 (PDT)
Date: Tue, 8 Jul 2025 14:29:53 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>,
	Ritesh Kumar <ritesh.kumar@toradex.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: merge ITCM and DTCM regions
Message-ID: <20250708172953.rbsvk6gy4xuxo42l@hiagonb>
References: <20250703130831.18830-1-hiagofranco@gmail.com>
 <aGgAbwToGhsc5VV9@p14s>
 <20250704190816.kth7bdf34ufc2ht6@hiagonb>
 <aGvyDp36iWv5UQ19@p14s>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGvyDp36iWv5UQ19@p14s>

Hi Peng, Mathieu,

On Mon, Jul 07, 2025 at 10:13:02AM -0600, Mathieu Poirier wrote:
> On Fri, Jul 04, 2025 at 04:08:16PM -0300, Hiago De Franco wrote:
> > Hi Mathieu,
> > 
> > On Fri, Jul 04, 2025 at 10:25:19AM -0600, Mathieu Poirier wrote:
> > > Good morning,
> > > 
> > > On Thu, Jul 03, 2025 at 10:08:31AM -0300, Hiago De Franco wrote:
> > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > > 
> > > > Merge the contiguous ITCM and DTCM regions into a single region to
> > > > prevent failures when loading ELF files with large sections:
> > > > 
> > > > remoteproc remoteproc0: powering up imx-rproc
> > > > remoteproc remoteproc0: Booting fw image rproc-imx-rproc-fw, size 151824
> > > > imx-rproc imx8mp-cm7: Translation failed: da = 0x1f48 len = 0x1fcb0
> > > > remoteproc remoteproc0: bad phdr da 0x1f48 mem 0x1fcb0
> > > > remoteproc remoteproc0: Failed to load program segments: -22
> > > > remoteproc remoteproc0: Boot failed: -22
> > > > 
> > > > This approach is the same as commit 8749919defb8 ("remoteproc:
> > > > imx_rproc: Merge TCML/U").
> > > > 
> > > > Suggested-by: Ritesh Kumar <ritesh.kumar@toradex.com>
> > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > > ---
> > > > Hi,
> > > > 
> > > > The ELF I tested had the following data section:
> > > > 
> > > > Memory region         Used Size  Region Size  %age Used
> > > >     m_interrupts:         680 B         1 KB     66.41%
> > > >           m_text:        6984 B       127 KB      5.37%
> > > >           m_data:      130224 B       128 KB     99.35%
> > > >          m_data2:          0 GB        16 MB      0.00%
> > > > [100%] Built target hello_world_cm7.elf
> > > > 
> > > > Which triggered the error. After this patch, remoteproc was able to boot
> > > > and work fine. Thanks!
> > > > ---
> > > >  drivers/remoteproc/imx_rproc.c | 6 ++----
> > > >  1 file changed, 2 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > > index 74299af1d7f1..bbf089ef48ee 100644
> > > > --- a/drivers/remoteproc/imx_rproc.c
> > > > +++ b/drivers/remoteproc/imx_rproc.c
> > > > @@ -166,8 +166,8 @@ static const struct imx_rproc_att imx_rproc_att_imx8qxp[] = {
> > > >  
> > > >  static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
> > > >  	/* dev addr , sys addr  , size	    , flags */
> > > > -	/* ITCM   */
> > > > -	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
> > > > +	/* D/ITCM */
> > > > +	{ 0x00000000, 0x007E0000, 0x00040000, ATT_OWN | ATT_IOMEM },
> > > >  	/* OCRAM_S */
> > > >  	{ 0x00180000, 0x00180000, 0x00009000, 0 },
> > > >  	/* OCRAM */
> > > > @@ -180,8 +180,6 @@ static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
> > > >  	{ 0x08000000, 0x08000000, 0x08000000, 0 },
> > > >  	/* DDR (Code) - alias */
> > > >  	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
> > > > -	/* DTCM */
> > > > -	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN | ATT_IOMEM },
> > > 
> > > In commit 8749919defb8 "dev addr" and "sys addr" were both contiguous, but in
> > > this patch "dev addr" is not.  How will this work with new kernel that use old
> > > FW images?  Am I missing something?
> > 
> > No, you are correct, I think the use case I tested was not good enough.
> > 
> > If I understand correctly, this will break older firmware expecting
> > .data at 0x20000000 because dev_addr is no longer mapped for DTCM entry.
> > 
> 
> Correct.  Older firmware would still expect DTCM at 0x20000000.
> 
> 
> > Do you think it is possible (or reccomend) another approach to fix this
> > issue? In this case to keep using the TCM, instead of going to OCRAM or
> > DDR.
> >
> 
> To me the best way to proceed is understand why using the current mapping is a
> problem.  The changelog describes a failure condition when dealing with large
> sections but does not indicate _why_ that is happening.  I think that's what
> needs to be fixed rather than trying to move mappings around.

Thanks for the information you both provided, sorry for the noise, so
please Mathieu ignore this patch. I will work around this in a different
way.

By the way, Peng, I noticed the DDR linker from MCUXpresso does not work
if the firmware is larger than 128KB, since the .data is placed right
after .text and loaded later to DDR. The imx_rproc driver should instead
have a way to do the other way around: starting from the firwmare inside
DDR, we could set PC and stack from M7 to point to DDR and start the
execution. Probably will be slower, but it would make the DDR case
possible.

Correct me if I am wrong, but as my current understanding the DDR linker
is broken without this change to the driver. Anyway, maybe something for
a future patch.

Thanks,
Hiago.

>  
> > Thanks,
> > Hiago.
> > 
> > > 
> > > Thanks,
> > > Mathieu
> > > 
> > > >  	/* OCRAM_S - alias */
> > > >  	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
> > > >  	/* OCRAM */
> > > > -- 
> > > > 2.39.5
> > > > 
