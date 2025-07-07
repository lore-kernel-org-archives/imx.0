Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870CF21B9D6
	for <imx@lists.linux.dev>; Mon,  7 Jul 2025 16:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751904788; cv=none; b=qty8OY+6iWMXd1HS4lGDFpg/Iru2HKA83U1PlvZs6ie00xwVaGI1Hcxl8KqlIrraK2p9m0eH8PJzjBGBaO7m8eYH1W/XbQqa5XchMUyLazQm16aDW3ZLbbsU7KIkNPk0JzfimlHBB2SnqJ07XtsrbOD+VX+u0ukrPT+zTGVarYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751904788; c=relaxed/simple;
	bh=0h2aJlmPnSWDsdCU/F4A5RMFeDhbcjsspm212YRtJYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tirgHpGlYOpA/SKkWky+21mLDrHRC7gFQMRd4qTl1cCC5BNwFgnBdE0aLfG2NYtSFHs+f6j7CGiVoTJ4O5BFE9QOGUr/eD76jOO3bxEBI/h7O9M69F6kpOJn8OXTFZsHMgonDOvI/B3HtmID5gjlYzN3JED2JdWSvFrRgH8T2Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cCKEjC+a; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cCKEjC+a"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-23526264386so31908805ad.2
        for <imx@lists.linux.dev>; Mon, 07 Jul 2025 09:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751904786; x=1752509586; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rTB9AhUzbXze0SvlJXhNv6ywJb1Le3/qXDwCwOY7m50=;
        b=cCKEjC+aqkZMu9GsQg0VPoRGVT7SeVmLqO1PvYfV6/HzalT8XXsTcDImi8Lwi5sUHE
         D3QHm17O9RdXDRkrebDSnYyfknfIDy9/x2LRsmtgsHndy/exXJ9Rumd6V8RlcOId6lM9
         SOd5xqRGd3nrYg8wK+NyhBnO2+k2puEHt4JgQzACPlj9n2mKshS16VUaPTv8j6ySrHvZ
         n1cpyYu4AQtY+F8N9Ak6hJ7zEvprblBz7/T8YlpEpWWEERBA8njysG4LV95uW7WtTUuk
         LMo/zFyJj3RHHCYsDRrgTX68XBDDijwcCnoZzOk7n+zj1sqRW7CrYFJNBtYtNNhDVWqo
         cUhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751904786; x=1752509586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTB9AhUzbXze0SvlJXhNv6ywJb1Le3/qXDwCwOY7m50=;
        b=vpGJZXMrkjxRaeIoJR4WBLsjNLZjLhmfDdwIUUEkHrxpjqLs6wRr1OGEEViqobpmFi
         aHg75o8C6SktLvL9oL75koECDuX9NMroOjmhbduE+sHmwDbSDcPjzdXvYtTGLK3zWEHi
         dwZT2HkEMbruB+yurNilrF3P/HGW/8YqLcjeFhqz9xfyyupaVxh8RM3URv9C6dwrzLTg
         4ws/fGzywybXp8/g6/RwZw3gWtP1Hfu7l92wI5m7sSsdc69v1N4oP81FXLX6RobmKVXx
         xV88+ZCmj56esqxDBQ4G8/RQzD/fWlyRU+aDfpqDqBGEW/eyc0Lqi+wsJhHtM5FX2YOF
         TmPw==
X-Forwarded-Encrypted: i=1; AJvYcCUJO9lpnQCuaAoCfZ3ib36U6prDqfJ1hqyT8lENsDtQOiK/d1HIwkDByrgmqwlWAfJYpak=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywy1kojzDrFdw2Q5CRpOQqWwGeudzwdu5/trX28ujQizPSdXpmr
	0u9k5zf68eG7mYVY5I2nz+2KUWE+fI6pUg97ahTI4Uo7aY8c/Vhb17CwZIPN4Roiq6A=
X-Gm-Gg: ASbGncsipOKIh46Jjd0GwV0OQIlYi36nKIAqfrO2Ipf9yS3HhIDHkY9f8dCUncGtRAn
	c3qOzl9qIrQA92DDWAj100Ws8/ErawvBNzrUdusz6FgGMIJP3BgRhoO3rVOhtIG2Ogo3im4AgPo
	r5PTFn0Aaz7YiHtYf/CiyLzW7bqOH/btH7Y4+mrVwnxduhupBUdUNheYhL3CQ60nCiNZtc0fYqS
	BiC8n24udVaF69qd1i1mDTTuwKTaHdp9f2Z5giU/1qK01mIVdVvCmOKwCrG3hzeleiWHPbFJBuV
	eitL82+cCiOlN/aCu8s6rQ8eSkTTN1PP7k2S9CtW1OpmX0oU4uboIeNtMtQz65JAZw==
X-Google-Smtp-Source: AGHT+IEQezXaHRglxK6u+wE7BwHS5SdjM0yKB0UdNJiBREdoJn93Iqgm0TzBfL2Hm1mR3xJxK3359A==
X-Received: by 2002:a17:903:41c1:b0:235:c781:c305 with SMTP id d9443c01a7336-23c8755c92amr199352805ad.24.1751904785665;
        Mon, 07 Jul 2025 09:13:05 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1746:c463:9d35:6eed])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee475a3asm9236671a12.17.2025.07.07.09.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 09:13:05 -0700 (PDT)
Date: Mon, 7 Jul 2025 10:13:02 -0600
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
Message-ID: <aGvyDp36iWv5UQ19@p14s>
References: <20250703130831.18830-1-hiagofranco@gmail.com>
 <aGgAbwToGhsc5VV9@p14s>
 <20250704190816.kth7bdf34ufc2ht6@hiagonb>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704190816.kth7bdf34ufc2ht6@hiagonb>

On Fri, Jul 04, 2025 at 04:08:16PM -0300, Hiago De Franco wrote:
> Hi Mathieu,
> 
> On Fri, Jul 04, 2025 at 10:25:19AM -0600, Mathieu Poirier wrote:
> > Good morning,
> > 
> > On Thu, Jul 03, 2025 at 10:08:31AM -0300, Hiago De Franco wrote:
> > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > 
> > > Merge the contiguous ITCM and DTCM regions into a single region to
> > > prevent failures when loading ELF files with large sections:
> > > 
> > > remoteproc remoteproc0: powering up imx-rproc
> > > remoteproc remoteproc0: Booting fw image rproc-imx-rproc-fw, size 151824
> > > imx-rproc imx8mp-cm7: Translation failed: da = 0x1f48 len = 0x1fcb0
> > > remoteproc remoteproc0: bad phdr da 0x1f48 mem 0x1fcb0
> > > remoteproc remoteproc0: Failed to load program segments: -22
> > > remoteproc remoteproc0: Boot failed: -22
> > > 
> > > This approach is the same as commit 8749919defb8 ("remoteproc:
> > > imx_rproc: Merge TCML/U").
> > > 
> > > Suggested-by: Ritesh Kumar <ritesh.kumar@toradex.com>
> > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > ---
> > > Hi,
> > > 
> > > The ELF I tested had the following data section:
> > > 
> > > Memory region         Used Size  Region Size  %age Used
> > >     m_interrupts:         680 B         1 KB     66.41%
> > >           m_text:        6984 B       127 KB      5.37%
> > >           m_data:      130224 B       128 KB     99.35%
> > >          m_data2:          0 GB        16 MB      0.00%
> > > [100%] Built target hello_world_cm7.elf
> > > 
> > > Which triggered the error. After this patch, remoteproc was able to boot
> > > and work fine. Thanks!
> > > ---
> > >  drivers/remoteproc/imx_rproc.c | 6 ++----
> > >  1 file changed, 2 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > index 74299af1d7f1..bbf089ef48ee 100644
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -166,8 +166,8 @@ static const struct imx_rproc_att imx_rproc_att_imx8qxp[] = {
> > >  
> > >  static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
> > >  	/* dev addr , sys addr  , size	    , flags */
> > > -	/* ITCM   */
> > > -	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
> > > +	/* D/ITCM */
> > > +	{ 0x00000000, 0x007E0000, 0x00040000, ATT_OWN | ATT_IOMEM },
> > >  	/* OCRAM_S */
> > >  	{ 0x00180000, 0x00180000, 0x00009000, 0 },
> > >  	/* OCRAM */
> > > @@ -180,8 +180,6 @@ static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
> > >  	{ 0x08000000, 0x08000000, 0x08000000, 0 },
> > >  	/* DDR (Code) - alias */
> > >  	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
> > > -	/* DTCM */
> > > -	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN | ATT_IOMEM },
> > 
> > In commit 8749919defb8 "dev addr" and "sys addr" were both contiguous, but in
> > this patch "dev addr" is not.  How will this work with new kernel that use old
> > FW images?  Am I missing something?
> 
> No, you are correct, I think the use case I tested was not good enough.
> 
> If I understand correctly, this will break older firmware expecting
> .data at 0x20000000 because dev_addr is no longer mapped for DTCM entry.
> 

Correct.  Older firmware would still expect DTCM at 0x20000000.


> Do you think it is possible (or reccomend) another approach to fix this
> issue? In this case to keep using the TCM, instead of going to OCRAM or
> DDR.
>

To me the best way to proceed is understand why using the current mapping is a
problem.  The changelog describes a failure condition when dealing with large
sections but does not indicate _why_ that is happening.  I think that's what
needs to be fixed rather than trying to move mappings around.
 
> Thanks,
> Hiago.
> 
> > 
> > Thanks,
> > Mathieu
> > 
> > >  	/* OCRAM_S - alias */
> > >  	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
> > >  	/* OCRAM */
> > > -- 
> > > 2.39.5
> > > 
