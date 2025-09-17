Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E6E2C235A
	for <imx@lists.linux.dev>; Wed, 17 Sep 2025 14:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758120461; cv=none; b=FtqHWNHkrTHPh0pVqnVs6mBl/NNWeO2btsqfBjJk6yapNcdNK3HncJta/KxRMaxlAAqmU+mKmLgvLQa0dxhpSu80EWVQdDwQDlBpUhYiQuvY1/Nlggbde9fa7fAZf99U/1vJqzzUs4jj15Pob2Dqg8uFYWOUYTKGAjXJ2MW23Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758120461; c=relaxed/simple;
	bh=qfM/YHmtVWu3yzoUzyK/MCLy8fZrVNf1eUAi6FFeqgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BgI2rGjjasSea+562LfMyuM6kgFcbNqJZybAq6N0KErM1QH3TrlA61hK71bvTXFJJOpVi2/H0BwoPiYQ2xc59Fl56YYa7JuS1JOcbFg2nwLmW1LHLkGEKzU85E/a6PNAOw9hNHLGKECRsliBdMPBigr86HUFGmGAcN2nBwJeeqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQZfgLOu; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQZfgLOu"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-ea5bdbe191bso791535276.3
        for <imx@lists.linux.dev>; Wed, 17 Sep 2025 07:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758120459; x=1758725259; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1CAbzYUL8MS01KvGQ7W+ucZcOWy6JzeZgcC8xTWGjlU=;
        b=VQZfgLOu80XCtHGoBOq9BAcEmj3WrG36QBie6Zsxd7PfdlGHzrUvIgYbFZxuJ5aFnk
         3y8UFv5T6zNz4DLY9P0SPFPYekyB6Zg8ESWZh1k6xe29VxymCg04qdYMvXTwvgXYtNv2
         4xmkyNAQ+O1yjSqmlISPKj5+6P0wAu2TMrKYxAmUmXi+aT9maeAln276bnjrd5Etga0V
         occh8u/Eif59imwyVcFeZfWUZoB5GXbBfxgsBiIKqWjNU+AtPBG6u5jsohUmc5KOpMVq
         JzR2YHhoq7lpONY5L/aTfifCq78U9AZoIaldEKvRk/Tgd2XkoOOqa/Lc0q48dtoGZ7a0
         28dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758120459; x=1758725259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1CAbzYUL8MS01KvGQ7W+ucZcOWy6JzeZgcC8xTWGjlU=;
        b=wj6wbI6Ur6h19NHKvxiMx4PFuWXMpDWxWPwVNx4G/+ptrFC3HqwVy030CbdQdPpvJu
         H26seBxGAN9aTA29zRW0RaLQPUNjj2rKrjBAUss2TWW6cZ9TskO+TS+DkxD1/4b8jnhE
         HYC0CJlVB1v1DgxRh6qv2lnhr+9stxkmyg0orQ41oC8ASQzIX6pfNiqeUw0mw2xGOawp
         7Wg5hs5uNus/LL7gGqZjyzAwPKQP5Acd1f8YQ6Y0OcHb4NjuIPG1Q/aPkCwPV7i4c+U0
         L6FedJ2cihHWIHn9hYNCxslAdFnOzqQ8SJRm/8cAWsHUDxMxiHa3FePpnswQG5plP72D
         JM8A==
X-Forwarded-Encrypted: i=1; AJvYcCVhMm3wLtc05yLi0PkoSq3AVdo+npuBwy2Gpj3eIQYaWhssrpFuqu+M4SpKvDupiETlLy4=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywb2CqOl9K11HJIKe3R11wvOl1vH8UP7o0bJ38O7xYj7Z7AecfZ
	i3ClMRhHlcqoAYiEMHs4VDjpzfgDsQrnzWkjJeLfQtBHzIJLPNqIFe+y
X-Gm-Gg: ASbGncss9tWrSXswr3+vAhJKQu3F5KNavLK2m0IpcfCEIGlTggCnTMIi8yLMA80KWFv
	H24z60o+txSREY7z/XLZIV52j1+cUZPvYmOfGScbDO7zCx/oj9cj/pTWy+JeGbGVWVu5+vvpNoF
	Y4kObzFpkNL86YUSxfSCrgYZxOnYTFzzN9DOg0p5Lm+MNBoHx2KzhUmjVHYEr7JJIexPPdAc7r+
	v3gvdOPTXdnQIRDeDkJfhu7E+snmeoX3pWVJqSQtJj53/FABLcSDtfQ+bhscG3RiUg5HPsAXUyu
	VHwmAfHwjmFROlwLnizNSoNWbFhWxZGwMu66h1EnAfX/7XCLb5B0rhw4o42Fu1vbvokufAdX//x
	fkITLS3G0rhfaMbD2KCNbZ+vLJCzbi5bH5AjKiTb77A==
X-Google-Smtp-Source: AGHT+IFkCUo8yIzooLYfXMOUMBxzTZH14qdmK33q31MankNnsUTy2IG/YdXpSknLnQlKrcxKcNDVoQ==
X-Received: by 2002:a05:6902:2b85:b0:ea4:156d:2cab with SMTP id 3f1490d57ef6-ea5c024a104mr2411587276.0.1758120459223;
        Wed, 17 Sep 2025 07:47:39 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2600:1700:2430:6f6f:e2d5:5eff:fea5:802f])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-ea576bb11absm1747671276.12.2025.09.17.07.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 07:47:38 -0700 (PDT)
Date: Wed, 17 Sep 2025 07:47:35 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Woodhouse <dwmw2@infradead.org>,
	Eric Dumazet <edumazet@google.com>, imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Jonathan Lemon <jonathan.lemon@gmail.com>, netdev@vger.kernel.org,
	Nick Shi <nick.shi@broadcom.com>, Paolo Abeni <pabeni@redhat.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>, Yangbo Lu <yangbo.lu@nxp.com>
Subject: Re: [PATCH net-next v2 0/2] ptp: safely cleanup when unregistering a
 PTP clock
Message-ID: <aMrKB2qDCTXURtxj@hoboy.vegasvil.org>
References: <aMnYIu7RbgfXrmGx@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMnYIu7RbgfXrmGx@shell.armlinux.org.uk>

On Tue, Sep 16, 2025 at 10:35:30PM +0100, Russell King (Oracle) wrote:
> (I'm assuming drivers/ptp/ patches go via net-next as there is no
> git tree against the "PTP HARDWARE CLOCK SUPPORT" maintainers entry.)
> 
> The standard rule in the kernel for unregistering user visible devices
> is to unpublish the userspace API before doing any shutdown of the
> resources necessary for the operation of the device.
> 
> PTP has several issues in this area:
> 
> 1. ptp_clock_unregister() cancells and destroys work while the PTP
>    chardev is still published, which gives the opportunity for a
>    precisely timed user API call to cause a driver to attempt to
>    queue the aux work.
> 
> 2. PTP pins are not cleaned up - if userspace has enabled PTP pins,
>    e.g. for extts, drivers are forced to do cleanup before calling
>    ptp_clock_unregister() to stop events being forwarded into the
>    PTP layer. E.g mv88e6xxx cancells its internal tai_event_work
>    to avoid calling into the PTP clock code with a stale ptp_clock
>    pointer, but a badly timed userspace EXTTS enable will re-schedule
>    the tai_event_work.

Thanks, Russell!

For the series:

Acked-by: Richard Cochran <richardcochran@gmail.com>
