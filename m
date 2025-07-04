Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A54B27454
	for <imx@lists.linux.dev>; Fri,  4 Jul 2025 19:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751656106; cv=none; b=lawCrpSPJ0fW6ogEOgoEGP1d6h6Gp+OoJKiDCD1gOJ7NkgqJtTu5QIT2ysHhTZ2U5k7w3euR8DOJoml7BqwVW2e2FZgVaOQ7CBf33ZcxUqNbieZ63PoHFVYxP6RhOpSF8TpuKyDZTZdpNfe0vE0+Z8QsYNm35mUqy86I5qC72eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751656106; c=relaxed/simple;
	bh=M3Q5IsquzgsaUNX7gqIZpQGtVD3PV//UeqAjF1xMMfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oRgOWYV3FjQIKxNroHPClsNcXDMWrbycChteoHBUj3mQEEeypg/1WnSCtXZslLxkRnaSO1gz4wMAOupFy/w4ONenoB+/z7N3I+MNz0rbdaJKCqA74WP+ReZQupTRbxA2thO1/WW1Lnqw8gYkMHALERaQpkzgH7W7tLXwX2Me5yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Irfb7VjM; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Irfb7VjM"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4a752944794so13908631cf.3
        for <imx@lists.linux.dev>; Fri, 04 Jul 2025 12:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751656103; x=1752260903; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HGyFNj1Ny6SfNjSNttjmfgWyIBUWUNO7iH1czi2I1Jw=;
        b=Irfb7VjM2icugFHI2n5flKY0GruOLjp++yyiOeb3lPIxXtCW8Q//KDwWmeGYhDfFYy
         SlPwmTRNBE5GP20MANCw+jQRuQgY+NbokcwiXUB5Rgz4vRxvHifLfA6GcE0PwxDJ/Ojo
         NuJQiE/z1XDHnMRhV3drkwtpDLoJJkHOwEJCF8eUS+gnlCXXm7jjQ/Oz8BYT/SjpIzqV
         emnCVJCb1N8aTgl0nI/kUEJBQQN5i/aAX8YksKZNlQmFUDMcmAF8w6htEEYjSATE42a9
         G99jeY9QmLs00z4AK1UG4oPmcuZwd5zH5P/clN+/Z6oiG0pxPfZ+SVkzSSmnzr2Pt1sL
         UhHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751656103; x=1752260903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGyFNj1Ny6SfNjSNttjmfgWyIBUWUNO7iH1czi2I1Jw=;
        b=CnKjnhiuYDWtI12nzV1PzOkTf2HP3DZQZmohFFrVMcqsKXOrQ6kcrcdjZnegNYInOR
         WmjOjEXFLzKXv4KOwum0Cn7CtLvD/Mv5NyBmYJjufiqpS6OqdSkbvj21rnsyJ9anN1G9
         Fs+mMy9tM5TlvdiRbXq3hKHSB93kprByXUdfXv4eqjskivYxVgNmiaKJHGEH+2O/pBbC
         9ud9JxDLLJU0AuR+p4Oc9Tc6VEJafDeUtNa7V+zjqMYZVs6dDlte6yNe+3/JMyRdfpMW
         8oOgLHXSVObjG+HQKyaiqxojTa3SPCyEIRM5ILdHyJLH+9q4mRozgNeFpOacUaqCDnTh
         Xj8w==
X-Forwarded-Encrypted: i=1; AJvYcCWLUBOPJ1h+mD9IpW8+6oh6GPA0qr9tE+NfvEFtw2g9akOg5OTP0w9VTSlRYMUDI4zhuIY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzNcEcEF+M+yjbK4kM6Di8G0J1838i2Co13B3vXRATHDdorPBpI
	OtUVXRqVRpskuQFaQ7IL+jsRPWzRjpBby1DxI5zCIb6GeQmvm3+SaHWC
X-Gm-Gg: ASbGncv2LiNK8Xcjz63USnPsCPjW8vYShKY0r+bCPd6z6jKr33Iv7tfLuWImDnu6ZOx
	pSCGOzkXZNeencekSCIVL87RkVGH90eorNAExWLmziEztwMynK/uo9TcwNuoJIecIVDrcIH+2iK
	uY0WU/GjloyiAjrxNl9Mf0KYqheb7EXSKhjDn9HVwAWECOCThXZ3UQAle+gFi2mG7gSgmkUohd8
	sZAZlQhG4AmeK+wt4zueSIAkGG2JGO+kQhozI9LcZU9JUNqMhjh/hOuSbXKKbI68zDwWUhF8Mlc
	UcSKWmdweJpPv4jXA8b2b5yQBAyIzzR8EFiqoJrS3e9kbPWsNL8yk8XF0fp7
X-Google-Smtp-Source: AGHT+IHcPF0epYh2bEm/K740kTshZZxOutEcCiBSHjKyRJe4e++z7TJFlmqECQ+Kf/wg6K+2S4I8ww==
X-Received: by 2002:a05:622a:304:b0:4a8:182f:3518 with SMTP id d75a77b69052e-4a99671a092mr49834771cf.45.1751656103140;
        Fri, 04 Jul 2025 12:08:23 -0700 (PDT)
Received: from hiagonb ([2804:1b3:a7c0:b293:bc62:f957:108d:1060])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a994a8cdc4sm18670251cf.60.2025.07.04.12.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 12:08:22 -0700 (PDT)
Date: Fri, 4 Jul 2025 16:08:16 -0300
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
Message-ID: <20250704190816.kth7bdf34ufc2ht6@hiagonb>
References: <20250703130831.18830-1-hiagofranco@gmail.com>
 <aGgAbwToGhsc5VV9@p14s>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGgAbwToGhsc5VV9@p14s>

Hi Mathieu,

On Fri, Jul 04, 2025 at 10:25:19AM -0600, Mathieu Poirier wrote:
> Good morning,
> 
> On Thu, Jul 03, 2025 at 10:08:31AM -0300, Hiago De Franco wrote:
> > From: Hiago De Franco <hiago.franco@toradex.com>
> > 
> > Merge the contiguous ITCM and DTCM regions into a single region to
> > prevent failures when loading ELF files with large sections:
> > 
> > remoteproc remoteproc0: powering up imx-rproc
> > remoteproc remoteproc0: Booting fw image rproc-imx-rproc-fw, size 151824
> > imx-rproc imx8mp-cm7: Translation failed: da = 0x1f48 len = 0x1fcb0
> > remoteproc remoteproc0: bad phdr da 0x1f48 mem 0x1fcb0
> > remoteproc remoteproc0: Failed to load program segments: -22
> > remoteproc remoteproc0: Boot failed: -22
> > 
> > This approach is the same as commit 8749919defb8 ("remoteproc:
> > imx_rproc: Merge TCML/U").
> > 
> > Suggested-by: Ritesh Kumar <ritesh.kumar@toradex.com>
> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > ---
> > Hi,
> > 
> > The ELF I tested had the following data section:
> > 
> > Memory region         Used Size  Region Size  %age Used
> >     m_interrupts:         680 B         1 KB     66.41%
> >           m_text:        6984 B       127 KB      5.37%
> >           m_data:      130224 B       128 KB     99.35%
> >          m_data2:          0 GB        16 MB      0.00%
> > [100%] Built target hello_world_cm7.elf
> > 
> > Which triggered the error. After this patch, remoteproc was able to boot
> > and work fine. Thanks!
> > ---
> >  drivers/remoteproc/imx_rproc.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > index 74299af1d7f1..bbf089ef48ee 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -166,8 +166,8 @@ static const struct imx_rproc_att imx_rproc_att_imx8qxp[] = {
> >  
> >  static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
> >  	/* dev addr , sys addr  , size	    , flags */
> > -	/* ITCM   */
> > -	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
> > +	/* D/ITCM */
> > +	{ 0x00000000, 0x007E0000, 0x00040000, ATT_OWN | ATT_IOMEM },
> >  	/* OCRAM_S */
> >  	{ 0x00180000, 0x00180000, 0x00009000, 0 },
> >  	/* OCRAM */
> > @@ -180,8 +180,6 @@ static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
> >  	{ 0x08000000, 0x08000000, 0x08000000, 0 },
> >  	/* DDR (Code) - alias */
> >  	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
> > -	/* DTCM */
> > -	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN | ATT_IOMEM },
> 
> In commit 8749919defb8 "dev addr" and "sys addr" were both contiguous, but in
> this patch "dev addr" is not.  How will this work with new kernel that use old
> FW images?  Am I missing something?

No, you are correct, I think the use case I tested was not good enough.

If I understand correctly, this will break older firmware expecting
.data at 0x20000000 because dev_addr is no longer mapped for DTCM entry.

Do you think it is possible (or reccomend) another approach to fix this
issue? In this case to keep using the TCM, instead of going to OCRAM or
DDR.

Thanks,
Hiago.

> 
> Thanks,
> Mathieu
> 
> >  	/* OCRAM_S - alias */
> >  	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
> >  	/* OCRAM */
> > -- 
> > 2.39.5
> > 
