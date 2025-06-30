Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8002D27FB10
	for <imx@lists.linux.dev>; Mon, 30 Jun 2025 14:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292996; cv=none; b=D5Or3N4sCNf09J8Yh9/lXhNdrllouYmLsUScfyKt/4Ajh+ueiOlbsBIln7w05n8nVfu67Uru6ik+OrYsVTK2Hk/5eq+k+TQhoZVA69Ymr9iRqIRcPe2VCIyGOF2zXe9v3jBz6HEBlIBbsD3GKcuzilLUvu0vPumGWnO+i7lOrv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292996; c=relaxed/simple;
	bh=uU4NWYJg1V5Vn9H6OG3dYNvVtaH+6cljDRAzH8j8WGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IMNftT2wSdddfYYN5lkrPHmtxdlXaLRDcyvp60AJaEk37+avp6fmEsKZIrg5Jr27jr6jHE49ynHsg59oL8yvjFo2+qq35ITy/RDHcK+E1QJF05t9yYhCA5ailYtD2fsePQ2h054Xczg0dKQLwPif2QpCurcB04DmR3z9hcSyZZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=qnSAhwzK; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="qnSAhwzK"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-701046cfeefso13231226d6.2
        for <imx@lists.linux.dev>; Mon, 30 Jun 2025 07:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751292993; x=1751897793; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2s8kDcioPxvpOzyItFHoM4iqYzDE+tvgyvsTlB7SpgQ=;
        b=qnSAhwzK+e6lbWQqxPjLWu0j3MIFitBqOTeuhTgVi85bxk3Ye5OcVbc4C73YEMJleY
         RbJA8elFwuHPdS8W64F5cecYduvP+Z46Yty17T7e5566OQw9C/ZQkIrbfonrRR2o7mZm
         SEryeih6OWitcB86J7oysrHB6XvIzsYI5NG8C+7Li+oALvCkk8nRW29GHGnf7YYIFYOS
         hQxOwrg/SxRBfl01JdAkATkocP7dpl5AzZJcTJv28YBDDn97oTh4uPUaP57Mcn389rP2
         cRHDCgxNTK2db1+xfAkau8mIqD5LpoPdzC/jkbF2qiVuEW2Yy6TDl5MrFLnX4mLfJDJL
         FaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751292993; x=1751897793;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2s8kDcioPxvpOzyItFHoM4iqYzDE+tvgyvsTlB7SpgQ=;
        b=T1WGHiagnPp4h7EVmPAXQgPrxPnUxpr/hE0DeSESiGnI2PUKHM9Jro8cYWUSguYwHf
         KZZevA8Xe4t8IFNDU/6B7N8y7kEMD7WgzkqU+d3ni9i9nHA69h3XDzocIaOEmWmljhIZ
         K9EzskbdqighSIY3ivGu+b3whhFxYuveNENxrXhknVkTm4oIHFRjFIlBaoSa0hVECMTx
         eGcW6oBsYWicqgv69qK7AGmeL9W05YXRxXMwIMjGFUFr6pD8XkNlkYir8S2Qcfz/rnbL
         l4R8txPG8QQm6DEue5jEdy/nAIU6sBYqb2pIdxI/dhjC+e/8rF2GiMdGRfQ1jKSp011e
         QAWA==
X-Forwarded-Encrypted: i=1; AJvYcCWJddgFADf7+2HzboZMwYipZ6wawkwTWeA5hGw6Yehe4L/eLjbz/oyvFmurnCKX/SnKj9k=@lists.linux.dev
X-Gm-Message-State: AOJu0YxF+K/YEBuAflUXVE/WGxveSXd0LgUS71JZdCjNIP9MqsWbbWth
	+iykkWKx7vTVI4bloaRMGSe5UcB7rXO8VlQNzClEeQyHIaC8nxl3X5VdTy5R/oGEbA==
X-Gm-Gg: ASbGnctr1Mwh1f2UcQIATKaas5rIgJRxBUgt1V5kYea7sBnolDZ4Pbd9VaH/2UXeIbn
	uUYgWeKpPAmmizrAaAS0pezStKtN3Qi8J65ope9DD1xu9XazlUbY8CpILyyKcsQF0RoI9gWgLm6
	WtmByIW0nCc1lc/mDuyoBOMkNXDVlbTrIx+8NjgBUdzTeqU7jKNCc5m7PUwGrBp7fGJ58EWWr80
	MbxfmWZIONGjhRXBBCY0hSUBgPWjzXihqeta4uN+/ybuvAFCNVRyaZdfj6Ih04/VfphKFv98rbn
	bXknZ2AlrL6J3sSJXyirI3koyqvmov/zzquc/qCdP3NlfGUY1DFrm3LyEXma4L5bPymQjAGUbav
	niDWl
X-Google-Smtp-Source: AGHT+IGaIIkTev/B5UEJVGSeX7xX1oX3gVRWMPdbwKe6ttPOQvsQWLp4rii4GvhcrE/sVorKmumxgw==
X-Received: by 2002:a05:6214:4b10:b0:701:894:2b91 with SMTP id 6a1803df08f44-70108942c74mr23152286d6.14.1751292993290;
        Mon, 30 Jun 2025 07:16:33 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772fc8f3sm67860476d6.84.2025.06.30.07.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:16:32 -0700 (PDT)
Date: Mon, 30 Jun 2025 10:16:30 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>, Christoph Hellwig <hch@lst.de>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk,
	thomas.weissschuh@linutronix.de, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <e908261b-2acd-46ac-b3ef-92691eb50f88@rowland.harvard.edu>
References: <20250627101939.3649295-1-xu.yang_2@nxp.com>
 <20250627101939.3649295-2-xu.yang_2@nxp.com>
 <1c4f505f-d684-4643-bf77-89d97e01a9f2@rowland.harvard.edu>
 <wddmyx4lccthln7mbngkd4zbh6y7mwetdba5e7ob6u4xevecmj@zopp65eqbeuu>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wddmyx4lccthln7mbngkd4zbh6y7mwetdba5e7ob6u4xevecmj@zopp65eqbeuu>

On Mon, Jun 30, 2025 at 04:18:51PM +0800, Xu Yang wrote:
> > Also, the material that this routine replaces in the uvc and stk1160 
> > drivers do not call flush_kernel_vmap_range().  Why did you add that 
> > here?  Was this omission a bug in those drivers?
> 
> According to dma-api.rst:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/tree/Documentation/core-api/dma-api.rst?h=linux-6.15.y#n664
> 
> "Once a non-contiguous allocation is mapped using this function, the
> flush_kernel_vmap_range() and invalidate_kernel_vmap_range() APIs must
> be used to manage the coherency between the kernel mapping, the device
> and user space mappings (if any)."
> 
> Possibly the uvc and stk1160 missed calling it, but since they won't be
> the only user of the USB core, so we'd better call these APIs.

Documentation/core-api/cachetbl.rst says:

  ``void flush_kernel_vmap_range(void *vaddr, int size)``

       flushes the kernel cache for a given virtual address range in
       the vmap area.  This is to make sure that any data the kernel
       modified in the vmap range is made visible to the physical
       page.  The design is to make this area safe to perform I/O on.
       Note that this API does *not* also flush the offset map alias
       of the area.

  ``void invalidate_kernel_vmap_range(void *vaddr, int size) invalidates``

       the cache for a given virtual address range in the vmap area
       which prevents the processor from making the cache stale by
       speculatively reading data while the I/O was occurring to the
       physical pages.  This is only necessary for data reads into the
       vmap area.

So invalidate_kernel_vmap_range() is not needed for data writes, that 
is, for OUT transfers.  And ironically, flush_kernel_vmap_range() _is_ 
needed (but only for OUT transfers).

On the other hand, Christoph may think these call should be included 
regardless.  Let's see what he recommends.  Christoph?

(Actually, I would expect dma_sync_sgtable_for_cpu() and 
dma_sync_sgtable_for_device() to handle all of this for us 
automatically, but never mind...)

Alan Stern
