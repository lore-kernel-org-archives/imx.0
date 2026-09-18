Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5094A0937
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 07:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789716350; cv=none; b=NrcJadfa/dxH4Gyb1HvmZ1HnUGDMoUEDwAOXMoBoSGhER95GLi8vd45Jftdfy6mn5Wyh1XbnvyMHn0yTT7PviRfQ3OJGar/R9fUk0uSNn9f3EHlTXjo6TC4FTgb1JgGAo32/Xa5JtR979u6H8fPwedP9kFSGujgBuqMct+DqIGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789716350; c=relaxed/simple;
	bh=Sbz7BcqVKJ42/8y+BPUpR0K8j+ChkS6WaFPNfZpm+dM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pv0XRvswmKcy4lcPsQiQU0IThgwNFE9dpWCyED64CW6JYty6Kwbl6yrks/zfYYzNZnRf5QlWL/LjQbYLuAaZD+RqjDM+0rwQmvgJdqdh/AFm10v+MuPuS7WdwxVaFyKTMJSnuDuJdp45T7dGlRIyCLUQXpfQWWXNgHSv9TjdyE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ejJW1wTc; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejJW1wTc"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e2406so1995235e9.1
        for <imx@lists.linux.dev>; Fri, 18 Sep 2026 00:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789716336; x=1790321136; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ukkkk1BOu2H2mNX0r4yxWxK0V7RNJdbdGm1o4o23Fno=;
        b=ejJW1wTc4xTjwiYXfBB73IfaBha5bY1IxeU7C5mHJmihoRrAIobFoBeX6z+By7tWza
         yhxyD/sfMZMDQdFFr8++eCOSk9KwKwr4vu88VSpfP9V3rdnE8QJuHh+m/87hD3rm8egy
         nYPLvpqbxVD5z3Le07Acmry3fjEAzsIRlqym17RTM/LIlcgOHKAz3QzGx8hUWbQUuxZs
         bsaTJluPr+1DrdG2HlhOpYG4a/troSlgvpHuzDR4X6M+iubBvN6v0nrBAcR4fqWTf3b+
         ue9SNQZstUFCOiiHCSmtBNM1O31iKfYVo+4cQ37bcoSXcCQQq41yoR+z28TCQ7FKrSKf
         9txg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789716336; x=1790321136;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ukkkk1BOu2H2mNX0r4yxWxK0V7RNJdbdGm1o4o23Fno=;
        b=xrl2DLgCkDIS372ECcbfQB0+a5t7ewatOuSx7rLpWleMe8NQs7DHNg4kS6x+B0X49T
         lPkwoPbIzKksVpvIo9YdFSutUe9kQgbJ03EWQXZBwL3YU3S8RmYFOgoS03pJUedFnz7l
         1JnLoWuqrTH3WFFHG/R3ut3rBAFP43/SV1Hp3K56zljQDe5RSMacNx2LMNgNel8c9QFm
         BG0NEOW6DBOD1m6xwtgvp/B/OvedCmvJvjVoNkXRhVB4NyCk+Bb/Sopaa4TG26zxrUyl
         KG5uF2OsdXt4iNNOYHqh27nNZHc0Lihh/0cCd40IgTu53oRft56XodZ9ffSpA93g5DnY
         YPog==
X-Forwarded-Encrypted: i=1; AKwUvBxhFg7cfkyg24AEPFhvbs8PhY/DACVQvaEG24bmbB6Rr8V86Si42TJ0VBkCiAD6UOvdkFY=@lists.linux.dev
X-Gm-Message-State: AFuF++kGb3AKObAGJcGI7SYFHo5eDtaXe5eHgCMlhD2UrTCP8sG1atX6
	4mFB33AFb6d76OHM3UL7s0xvYX8Hf+UhYHYmcykEKRkWGiYtlA48oFk9
X-Gm-Gg: AYBFou1utgGMnlaO7DF6EyjbSgl9zmjQt37//wKcK5LUh6h/4+/cr4MneQEPhz0CBT8
	qsY1TjKep51iawpCP2MHEl53s7IGEDa9iBJDM6Sbq4jVCKI7CfK2e6xIaJK9C281bvGO/0GnSIa
	8dDXgusdgr4c3XvFYc8IdYM6T1DnZRJ8B8cavCHWNL/a738QfkLb+63tGgnrkKVP1OFqZj2Duax
	9lCRlyrEYfU0IL1Z0qNrDtOo9wxdUT82AV/ES5/jLsDf/EmxohwhJjb07/xaYXdhMWyRt5GE7NR
	oQVcvs4SihQ46IH5LFbXAcW+oUCubPEtSQ99juX5VMt1CRnLYQXweuztAoz11RfLVRgBf9DefWo
	yRN3r2+l2xwbC4+QfUmMDtRqzt5D7N3ipLgOmYR/9n9mwHt+cuaA6gA9E+lI1GqxQPrXPn1EE0C
	t1g5yKFz6VeX/+cpjhGicm713lBKDABIJ8dORTY26r/xI7J59dQqux1MpZWbbUrcBskqH9xb1Uh
	ztI9PhfLgEt5Ez1BC0dfa0NEoakWbJLiZib4JHxf5LbCv+GfczwXRfEOKjA+s1xpyqOxuDURdy9
	EcNFDAP4E8pAvUYS8DZQ0WRleeHj9qY+Hty+MMqXSODmG+r0iJVGcrBxgm1FyPGJMmOnXUfVEa4
	6MFFfwPMPG3+wz3Sebpezn4CE9ZPcQAelE8ZEu9RHc6EDeVzBwNt+eWQ/vO+seh8uKbXQ5sx+pj
	jtQIe5
X-Received: by 2002:a05:600c:1d06:b0:49e:8222:3451 with SMTP id 5b1f17b1804b1-49fc5001358mr21569505e9.14.1789716335748;
        Fri, 18 Sep 2026 00:25:35 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc6ca43edsm33027395e9.0.2026.09.18.00.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:25:35 -0700 (PDT)
Date: Fri, 18 Sep 2026 09:25:33 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Johan Hovold <johan@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Peng
 Fan <peng.fan@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Frank
 Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: imx: add missing
 pm_runtime_dont_use_autosuspend() calls
Message-ID: <20260918092533.00004dcc@gmail.com>
In-Reply-To: <aqwzG_24bZSSQhTS@SMW015318>
References: <20260915103345.1334-1-joshua.crofts1@gmail.com>
	<aqpgUPWUGZp5Cjzt@hovoldconsulting.com>
	<aqq_ymTi1I951uQp@SMW015318>
	<20260917102429.00002faf@gmail.com>
	<20260917104233.00007a85@gmail.com>
	<aqwUky1jSMGbiXCf@SMW015318>
	<CALoEA-zMXhy1VX1MLVCy3d9pmC0fx22sJULamLhMmBX6xHutwg@mail.gmail.com>
	<aqwzG_24bZSSQhTS@SMW015318>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Sep 2026 13:36:11 -0500
Frank Li <Frank.li@oss.nxp.com> wrote:

> On Thu, Sep 17, 2026 at 07:15:29PM +0200, Joshua Crofts wrote:
> > On Thu, 17 Sept 2026 at 18:26, Frank Li <Frank.li@oss.nxp.com> wrote:  
> > >
> > > On Thu, Sep 17, 2026 at 10:42:33AM +0200, Joshua Crofts wrote:  
> > > > On Thu, 17 Sep 2026 10:24:29 +0200
> > > > Joshua Crofts <joshua.crofts1@gmail.com> wrote:
> > > >  
> > > > > On Wed, 16 Sep 2026 11:11:54 -0500
> > > > > Frank Li <Frank.li@oss.nxp.com> wrote:
> > > > >  
> > > > > > On Wed, Sep 16, 2026 at 11:24:32AM +0200, Johan Hovold wrote:  
> > > > > > > On Tue, Sep 15, 2026 at 10:33:43AM +0000, Joshua Crofts wrote:  
> > > > > > > > Several drivers in the clk subsystem forget to call dont_use_autosuspend()
> > > > > > > > on teardown or error, causing potential resource leaks. This series adds
> > > > > > > > the missing calls.  
> > > > > > >
> > > > > > > No, as I've explained repeatedly elsewhere, it does not cause any
> > > > > > > resource leaks. [1][2]
> > > > > > >
> > > > > > > The autosuspend setting leaks if you will, but that only matters in the
> > > > > > > theoretical corner case of someone rebinding a different driver (which
> > > > > > > will soon also taint the kernel).
> > > > > > >
> > > > > > > So don't exaggerate the impact, this is essentially just a cleanup,
> > > > > > > which is fine in itself.  
> > > > > >
> > > > > > Is it possilbe to create/improve runtime pm API, let runtime_pm enable/disable
> > > > > > include these pair functions.
> > > > > >
> > > > > > I get many similar patches since scan tools is more powerful now.  
> > > > >
> > > > > I suppose that could work. One would still have to scrub the kernel of legacy
> > > > > use/dont_use_autosuspend() calls though, so it could end up being a large
> > > > > patchset.
> > > > >  
> > > >
> > > > On second thought, some drivers do tend to disable PM runtime system sleep
> > > > etc. so it probably isn't as simple as adding the autosuspend stuff to
> > > > enable/disable.  
> > >
> > > if runtime pm disable, does autosuspend still work? suppose it should be
> > > disable also  
> >
> > If we add dont_use_autosuspend to disable then every time the system suspends
> > and resumes we lose the autosuspend config, meaning it will never autosuspend
> > again.
> >
> > I guess adding dont_use manually to the driver's remove() function is the only
> > way (which according to my cocci script it's 195 drivers that should be patched)  
> 
> Extend with exist pm_runtime_enable() and passdown delay value. if delay
> value is 0, actually it is no autosuspend version.
> 
> and merge dont_use_autosuspend() into disable function. And actually
> I don't understand why need two varible autosuspend_delay and use_autosuspend.
> 
> when autosuspend_delay 0, means take action immediately.

Actually, what about putting dont_use_autosuspend() in pm_runtime_reinit()?
https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/base/power/runtime.c#L1865

driver core calls this in device_unbind_cleanup(), meaning driver core would
just handle it.

-- 
Kind regards,
Joshua Crofts
