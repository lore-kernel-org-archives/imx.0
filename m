Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32DF2D661C
	for <imx@lists.linux.dev>; Wed, 14 Jan 2026 15:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768402954; cv=none; b=gGTnokBhyaYEwZhRdFuVZTDZjnSlgYMIDRgdSz7QbES6nz3mLaPE+qWLHUQMGjH7LjtOPHw9O4APJFuAYwbNvJ2o0bDFZ3r4za1iYMTgiPpq2hOOkDLP2I16e03moVhwQWiRTYvEZIcwO/gYnBz64hDZHWhjyC9WZUXD6HjeAGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768402954; c=relaxed/simple;
	bh=HsqwE0pSLrZlsXzfR7CicbAuxzImpCyqTJmyHVXjB2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vBHQY3k7kC5GBmwq0mL9rY99V0qf1AFN1kTlZ4yBstbo55PsKgjYIw1s2xPb1AEqxFLigjbPL3FzB4riX5IpgbqceelgkYnSlFlPC3kS3Izf5pXFMrM9XNEMBrJF4UaeFhcgPa9kQw0Ud6WxOB6R5w5iFPU3AasvC5P2GVcD5uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=o+HpzWHT; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="o+HpzWHT"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8AAF8C1F1C4;
	Wed, 14 Jan 2026 15:02:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 34D216074A;
	Wed, 14 Jan 2026 15:02:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 74CFD10B6826F;
	Wed, 14 Jan 2026 16:02:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768402951; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=tWaA948prfAmMRQ9VfzvHVRWnsG1BV8sPk4dRJEpl/k=;
	b=o+HpzWHTnN3SlILpcnlKxedLiXLevc1zuv9d8FWDK6bO5+oEUHyHN/0QfDCDmkZ61AZGJY
	xISpSRym+SiK4A4D+VrGx0M75I6QDk3JJJIWkTUzl/736ZjMSnagaoJ2MebldcRnii2/ki
	12CSNcsXYBuuHqwb69CjTV38Cd0kVjVUrQW3yRt7XcvwLBTt/9IkPYxlPpRLBlbC0N3Ynf
	+epjbDK93wBIV8F5rbAK1WInhggiAzNTc3ZOIjVhENw5+DyXS4RrG9CJPzmVPNE7UpATRZ
	BfyF5mPj4kHbM9J+1nipAkm5NzupOdyHf7t5BpfbVlhFhV+WVISn7psu0M1qmw==
Date: Wed, 14 Jan 2026 16:02:31 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] i3c: drop i3c_priv_xfer and
 i3c_device_do_priv_xfers()
Message-ID: <176840281751.1259180.6949053829974625143.b4-ty@bootlin.com>
References: <20251215172405.2982801-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215172405.2982801-1-Frank.Li@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 15 Dec 2025 12:24:04 -0500, Frank Li wrote:
> Drop i3c_priv_xfer and i3c_device_do_priv_xfers() after all driver switch
> to use new API.
> 
> 

Applied, thanks!

[1/1] i3c: drop i3c_priv_xfer and i3c_device_do_priv_xfers()
      https://git.kernel.org/i3c/c/9904232ae30b

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
