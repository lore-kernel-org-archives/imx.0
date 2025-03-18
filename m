Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A5020C012
	for <imx@lists.linux.dev>; Tue, 18 Mar 2025 14:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742308933; cv=none; b=Op+Q+dcdd6AlI3eekGZWvLj1r0kwdRN8hTsPf2zAJ3rx5yhO0LpH/LYKxgtzZ19s3fHNGf/Tbws9sYmo5+1kjzvsHTect/8Dg3mAf1sHP3sC4S/30Z9BDb2jiWU1bMOy3okiSvIvHknYEaQmutlxNh9yqrDoZP2wgU7z1Mk0Fu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742308933; c=relaxed/simple;
	bh=JkmZGBvm9dkGoXsxhITYAYPxrVQlvPqXan7A9/G5hIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8KnWlAeCoees0+I8cAKshg84LV2Al6ByR/VhWlSTJDb7l9BdoeAUABhOLQH7YwkgSMvzNrmMJdjUAeJ64Ngb5Wu3XpvKGplAvj3bfxCHFfCEU1BUX4b4GrQq6aWQzuEpqPXFg6ZhWhu1RkF06UsEMWR1p8//2wYGMFCF+C0yb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TP6Po7L1; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TP6Po7L1"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3913d129c1aso4581338f8f.0
        for <imx@lists.linux.dev>; Tue, 18 Mar 2025 07:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742308928; x=1742913728; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FiuJGenS9r4gN4igDCUFwLVXGDsRuGko4IS+9Bv5L2M=;
        b=TP6Po7L1RAOXG3AFLx9skdYVPu2Z95tnjl5/KoQhbBlAffeF479o3c7R5RPhYJL0EB
         71toUlO9HgBoY0Wy0OYsq23qeXE1liCK/xORF1d4NCwNt4vePJz4zYCtfxYo1238ulHk
         0znJbTRgOjikJMesXAEjPlmrKZ20oNVMUCspZ2Dz6HjVCyl7m9yjoWdhh1RnD0hZVis1
         p1wtYP/NPQ4eTlqJkdwng5RGzFg1lwuipF2dZhOWYtkD7rZPAZ4czjyanyIKi3CLk0M+
         jfQiGxOOsoLIPk9mq+kmLrn6ySqv2xCE85u8QdSMeziE5dX1hPq6jfi9XTMbvFLfTzWI
         LhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742308928; x=1742913728;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FiuJGenS9r4gN4igDCUFwLVXGDsRuGko4IS+9Bv5L2M=;
        b=p0yaEf+cYNg3hdk0LvAcb5UgdQhPu4KyzQ8cORYsVEHat4Dm6UL8MNST13UtuvtqWP
         BUsa+/VZ16TmRwYA/aZ+azoP7pICXOykT+NWYPvRe/vYa5qexCdfXvqfixLftXz3nmyn
         zhkbvp1ZTIlDtTX6Z4I12WB5Das11IU2NeZPAG3+57/NuTXiIwFCYXPs18XwRGPUkiMu
         s/jfXM5eoHOhfYufBJNTJ5+r5DkKLMUj6+mlbmnFYqvZwLJ1UA+TJfLMwQft9hLvWeas
         SIxgJFRfUpw3o94LhTx0iHMTa0DO2sVVE0WpRzlLZGK1eild6bIzlqCkF8H4Il96+hKg
         XNNw==
X-Forwarded-Encrypted: i=1; AJvYcCU9KDeZLpS6PCGQRQ9Rz09AJCM/M0pgV6538nBtZXBJYuPelEjCqWJi2oZVhiNJTVNNIjc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJ+3yLWlqXdtajMMDv20wSqzkHpOgVM1e+euXBg/N1cI29Mi7A
	80WCP21qBe1V/DlYEEBPA1doNgkCJZWYds/ocXYnkmWNsyt25G07
X-Gm-Gg: ASbGncugr/NtmIFn7A7DhDHPfqat6fucHve3JacQlVb03dOcOq8XDlkKTz6cRYjbaAf
	g5Qr0cOrxit2JFut8iXe4iOn2j1c/pYR30chfZTkVvKmrFYQVwSdW5OgjocO6e+RFU8quSFAhKh
	NBckU5rsKbE65naYMRlBQ2LTuuSt8TGE6/HCAKF9IxflGvhmNIA21zbpbg2RIpbp8ngyKRpEdIp
	hE0Pp2/FjqnmHjJX3D0K55uEzACxkbxrKCc3JpCbogOBksIkK1rROhOwzOLw+uiRcRIfN8RrEfF
	na2+AP6P1gGCn7ACYZn5oKJO4RAAfSouWz/KHbL6RcDUN1M=
X-Google-Smtp-Source: AGHT+IHLX8HZZ+2Wci446kRf3mvfpCskR7WDvTO3CsK1JjrNl/z1w3XNrCzriB+PrYbZGTzvp1a7CQ==
X-Received: by 2002:a5d:5986:0:b0:391:386d:5971 with SMTP id ffacd0b85a97d-3996bb51fb8mr3191605f8f.14.1742308928282;
        Tue, 18 Mar 2025 07:42:08 -0700 (PDT)
Received: from qasdev.system ([2a02:c7c:6696:8300:c99:9d6f:1130:510f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7ebbc3sm18157908f8f.88.2025.03.18.07.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 07:42:07 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:41:47 +0000
From: Qasim Ijaz <qasdev00@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: svc: fix signed/unsigned mismatch in
 dynamic address assignment
Message-ID: <Z9mGK0x8fsWvbTvo@qasdev.system>
References: <20250317101516.19157-1-qasdev00@gmail.com>
 <Z9l3waI5EdrWmYC3@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z9l3waI5EdrWmYC3@lizhi-Precision-Tower-5810>

On Tue, Mar 18, 2025 at 09:40:17AM -0400, Frank Li wrote:
> On Mon, Mar 17, 2025 at 10:15:16AM +0000, Qasim Ijaz wrote:
> > svc_i3c_master_do_daa_locked() declares dyn_addr as an unsigned int
> > however it initialises it with i3c_master_get_free_addr() which
> > returns a signed int type and then attempts to check if dyn_addr is
> > less than 0. Unsigned integers cannot be less than 0, so the check
> > is essentially redundant. Furthermore i3c_master_get_free_addr()
> > could return -ENOMEM which an unsigned int cannot store.
> >
> > Fix this by capturing the return value of i3c_master_get_free_addr()
> > in a signed int ‘dyn_addr_ret’. If that value is negative, return
> > an error. Otherwise, assign it to the unsigned int ‘dyn_addr’ once
> > we know it’s valid.
> >
> > Fixes: 4008a74e0f9b ("i3c: master: svc: Fix npcm845 FIFO empty issue")
> > Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> > ---
> 
> Thank you for your patch, but similar one was already applied
> https://lore.kernel.org/linux-i3c/174225158210.1593610.10018812780731849409.b4-ty@bootlin.com/T/#m5120e1c362e7e57f4cab139a45410fde421c2f37
>

Hi Frank 
 
I sent a fix for this issue on the 9th March, which is before the patch
you linked which was sent on the 10th March.

You can view my orignal patch here:

https://lore.kernel.org/all/20250309164314.15039-1-qasdev00@gmail.com/

Thanks
Qasim
> Frank
> >  drivers/i3c/master/svc-i3c-master.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> > index f22fb9e75142..eea08f00d7ce 100644
> > --- a/drivers/i3c/master/svc-i3c-master.c
> > +++ b/drivers/i3c/master/svc-i3c-master.c
> > @@ -998,9 +998,10 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
> >  			 * filling within a few hundred nanoseconds, which is significantly
> >  			 * faster compared to the 64 SCL clock cycles.
> >  			 */
> > -			dyn_addr = i3c_master_get_free_addr(&master->base, last_addr + 1);
> > -			if (dyn_addr < 0)
> > +			int dyn_addr_ret = i3c_master_get_free_addr(&master->base, last_addr + 1);
> > +			if (dyn_addr_ret < 0)
> >  				return -ENOSPC;
> > +			dyn_addr = dyn_addr_ret;
> >
> >  			writel(dyn_addr, master->regs + SVC_I3C_MWDATAB);
> >
> > --
> > 2.39.5
> >
