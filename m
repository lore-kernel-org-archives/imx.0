Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9B637C937;
	Sat, 16 May 2026 09:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778923272; cv=none; b=Nsadhjl1DStIdoMTvOsWEeVSE8JjCHexLcEUmDAKCf0s5GlBcNH+PsyFUB2eIA/iqH9BjHu/GfzxxhYLCrNfurrXBAy5j3sAahoilG+8EC03tY/woOpSkjjcG31H638LQhmRKLSWdbt1maQVEQtPvPwFerL/VS5hZvTPAG4Xtsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778923272; c=relaxed/simple;
	bh=RptzUI/9dLkuw+X2YVD/z/myI/ty916as3fpPLYgGAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qeg6IVFajov7hxlHIbK8R+AoPd4oMtEaNCN7D1EyVd3DL4mcDDY7x6ywDYu0nW8aRPJkiAy8C6Zd2ojihvM2ZO00OD+JucX9rgy91sz1jlmvMIBR32m9Whxu1lJ3erSRhBd5LJZVYQpk9FjvFYDa5MvGKbPD+gxmNaFogHrSmeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jz7wK0GG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jz7wK0GG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA68FC19425;
	Sat, 16 May 2026 09:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778923272;
	bh=RptzUI/9dLkuw+X2YVD/z/myI/ty916as3fpPLYgGAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jz7wK0GGMPUK9P9chAnahfGDsKfQrsotbIj4xw3k9+dtLr7Tt/K6vft7Vlw79il/w
	 6CcJRtPsPh1bRiPFYNQZB6/Bwv/lzN4PE/3KVmqy/kFCPqwaJLQZQv+dYSIgrEIgcu
	 AJW1aXCKHHPsePjCHluoNwc3X8Sg8rBP+9rWE9ws=
Date: Sat, 16 May 2026 11:20:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Stepan Ionichev <sozdayvek@gmail.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, shawnguo@kernel.org, hcazarim@yahoo.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: imx: scu-irq: accumulate wakeup sources via
 sysfs_emit_at()
Message-ID: <2026051656-corral-edgy-290c@gregkh>
References: <2026051633-doorstep-sequence-6782@gregkh>
 <20260516090726.38362-1-sozdayvek@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516090726.38362-1-sozdayvek@gmail.com>

On Sat, May 16, 2026 at 02:07:26PM +0500, Stepan Ionichev wrote:
> On Sat, May 16, 2026 at 09:15:54AM +0200, Greg Kroah-Hartman wrote:
> > This is a horrible sysfs file, and breaks all the rules.  Why not just
> > delete it and use the proper api for it instead?
> 
> Yeah, fair. The sprintf change just papers over the real issue, which
> is the interface itself.
> 
> Quick check: no Documentation/ABI/ entry, github code search returns
> nothing outside the kernel tree itself
> (https://github.com/search?q=scu_wakeup_irqs&type=code), and
> codesearch.debian.net also shows zero hits. So removing the attribute
> looks doable.
> 
> Frank, Sascha -- any out-of-tree readers of
> /sys/firmware/scu_wakeup_irqs/wakeup_src I should worry about?  If
> not, I'll send v2 that drops the attribute and logs the wakeup source
> via dev_info() instead.

Close, but no, don't use dev_info(), when drivers work properly, they
are quiet.  Make it dev_dbg() so that if anyone wants to see it, they
can dynamically turn it on.  Or make it a debugfs file.

thanks,

greg k-h
