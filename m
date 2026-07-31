Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4C741DE0D
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 12:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785501455; cv=none; b=SU+/mORPA0SUVBn4IagaHoQy8Zs+kkfH6nuXk7EKiD1n2OUsR1livXVqMJmg+va4TjfohCfS0EbeoL1/eOGTtOsGWSc7C3WDLecgaNYVPo6twhepHA/JHh7D72hRkHGQFVaKyOVHF7ODYpAdX66k+V1+yFD9ibgCnhdU9vqeGlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785501455; c=relaxed/simple;
	bh=YqebT9clfnPMsC7yqrCtUYusj4Rz5asoem6l5jV5TlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHx1RyZ0I+UyC0AZUY6nKTL/ciCYOsTMsPN3NQegPvpQkmh6iBtdWBBeotn/SP9LxwklhNiy+pFldvaWdK6terChE7d51ZkO7vRvWMVAx75hlYB6++m4juVoBA41DMvRpVgWZ0g9mKjJGK01WUR8eRw4vUiIrSERl3d0fZNbZ1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pk53CtJx; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pk53CtJx"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a097f5ab95so938204a12.2
        for <imx@lists.linux.dev>; Fri, 31 Jul 2026 05:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785501450; x=1786106250; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zxJ+yA42EHLQdUzb/+RpNk8wZMGnUA7//ORKkd+D1IE=;
        b=Pk53CtJx9YdhPw5KOHsv53nPpPlGON2G6Wu8C60ukyxEnhz6M6dr7azD/acuYWFKua
         6KJZLdeuVabkN1ZNwzTsb/pLckXXbpJgG0EM1d9C2jeOsv5NQ2569uPTo5orFC8XLQdi
         yHq/w6GZlw7yJw11iC/qZJPo8wO4NZb+NvXDPt6+cNJu5nZtPJiiDjG3g41xw0l8EAEs
         cOH74SiHxBWiOotie2xfjRBrYuls5RGwWXt36jgV6ppTI33fYr3KXani0s+L6pqbcueA
         VgIjtfpB27M1jlUKrZ3lAAoIX7bAw863Rd4vSVruo6Ndw12SaW5c6p5AB7zmGZvc0erU
         nBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785501450; x=1786106250;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zxJ+yA42EHLQdUzb/+RpNk8wZMGnUA7//ORKkd+D1IE=;
        b=jORem0hzMvyXjODd+Y95FcqB3kqoxtXdN+VgJ2T2c4F8sHMN6zwviA4vUzVa74MXRG
         3QElhfY/nNSlVCXGQX/9MiYFJauIk+saHpW1Pjlf4bvEFV+dMvggPC/wnBuexz/sYklp
         1KNmuRjH1mn+mYALa8thVi619YQ2BTpWhXcqjYcgPCAWAHdYSRj5xfHMAgW3fkFoN1lK
         GRvkdz7RF1fQZfR674zg53MkRbuY8xEWVWjUUGfAs8JB9HdDP0fG3N1OIisHNXMrleCM
         MezhPH6XzZs5SsKA5dbWhty31VhiEFMqvrkoq7Jo+C7ft8yck2Mxt0g3KIK+b3dexs7s
         19fg==
X-Forwarded-Encrypted: i=1; AHgh+RrFfuxjgLQt1IymuTiVEWKReCTPPnTambeeO91OOkbQwGz/FDHuPg1XPdUpKjJz/y8bHPo=@lists.linux.dev
X-Gm-Message-State: AOJu0YybmTPvusbGhJ7AY2RPnqADfU30loqAxZ8GOyFqVM2J3qAiT0jg
	33oNlntBRYcG5s3xoNjTVVOfxu4c1xVQnnTPg1M3HYzlHGcBLRsh3BPc
X-Gm-Gg: AR+sD10hQBP1JhLy9QSe133Qrh1ND66+bV/I+5PlCgYW3yWsO4GWLLQQhvuhLklMk9l
	wks6zLHU25hHBgsdsiGPfmujXGXItdcumbK2ZbsbXT1p/rZSrQsJki/Y3t7PgFRPVLOYDhepz10
	betlCa49iJ3PWwEJsf83KoVGhQmd8y4LN9P68rfkEKqMNTxeecBlBtEem2dfuXoFiNi19ek02cN
	huxBgueipLmYFlYU8Nb19pn2Q6qXrVp1fE70UQqxDNgF5uo1SSNxFW5twEOTLschVidbByjUsXs
	zFcdbm9RjRokvtNuZrKpgRRX3SzzzjETBA85+pjZy7jo9Yez0BwIVWsQNA9U31GhK2a0zyVG5nv
	RuVzdS1hZObA+TaDuDJTqQURKfYTzdX3PCDzm4bk6roEn2J+15Ysy0lmPVdI3Z8PFJRXriSYFK0
	o23yrIJB3Cc8ZkQRxhxPlnBHSKHj8iBDpm7uwTZxPypE7dn4HWTJ+qXy7qwfRx4IK0x90bXw2Pe
	RJ+yFV1xLqEfq15YQoPIdis3cr2JTpgo9fA2xdixuf/0S4n7XdW7z1jjkq1hmmViQ6B7lMNCz3D
	8JN33oR/HvNw3m4JW7oyAtvnsyG6R13mulsoeJKb6mJShunxCbKSwm76EbEqoAls9lqLvwE=
X-Received: by 2002:a05:6402:51c8:b0:6a0:1704:de29 with SMTP id 4fb4d7f45d1cf-6a098d07135mr979233a12.33.1785501450131;
        Fri, 31 Jul 2026 05:37:30 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a8d0-bc01-6d31-3d12-3a11-d2d0.310.pool.telefonica.de. [2a02:3100:a8d0:bc01:6d31:3d12:3a11:d2d0])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c660febsm1308537a12.28.2026.07.31.05.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 05:37:29 -0700 (PDT)
Date: Fri, 31 Jul 2026 14:37:28 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] serial: core: do fallible allocations before the
 console can be registered
Message-ID: <amyWRaZN2kSiv3YQ@gmail.com>
References: <20260719221014.44354-1-kmehltretter@gmail.com>
 <20260719221014.44354-2-kmehltretter@gmail.com>
 <2026073056-embargo-rejoicing-87c2@gregkh>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026073056-embargo-rejoicing-87c2@gregkh>

On Thu, Jul 30, 2026 at 04:28:10PM +0100, Greg Kroah-Hartman wrote:
> > Cc: stable@vger.kernel.org
> 
> As this can only be duplicated with fault-injection, it really doesn't
> need to go to any stable kernels, right?

Agreed, I'll drop it.

> 
> > +	if (!uport->tty_groups) {
> > +		kfree(uport->name);
> > +		uport->name = NULL;
> 
> Why set this to NULL?
> 

It's not necessary. I will remove it.

Thanks,
Karl
