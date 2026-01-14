Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7E92DE6F9
	for <imx@lists.linux.dev>; Wed, 14 Jan 2026 15:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768402940; cv=none; b=ewQ6DmaBE0o78eZ4U3fCsn56blrLZul+2SjDQAjSwfkadUztR6kyHIqX/Eulv3b+bRbVErI8xaJlcfZc35xPPTtANPKgyObQcMpohU0kBHvTXzmtj5uoj2WDen1reSWOkKMxdRKBk276cZ2BZ8/gNPJo+O77tzURBawcl2J9Png=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768402940; c=relaxed/simple;
	bh=f0/NZAQCXaAez+eDWSZDhHY+tOPXQO3CpjuvkMdhPH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XeHXziOxTA5aVrRQgrRwVJQFn4gvTzBbzHMGibGT3DQ9lEENwUrC5OuqSVWKiruqnpnhMz5+0NDnMUgaNnoJo8THP2vzu83AyHYMHe56VhPlhOx0jzSzXlTnWdOCgxHHcrtQ4v/e5Z0GzGaf9UrOhzpEXh3TGfKv62e7B2tvuiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xUmDNh9c; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xUmDNh9c"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1233D4E420D7;
	Wed, 14 Jan 2026 15:02:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D61D86074A;
	Wed, 14 Jan 2026 15:02:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C36BF10B6826E;
	Wed, 14 Jan 2026 16:02:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768402937; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=0DFs2Rg3lXB0cEBk2s5kxFKlNKHYbbCyQP7ha4dj3/8=;
	b=xUmDNh9cP4fG4Fy9i54/gnrazVh7GmKyj6kZhVrI90p5VhIP4IDU6WRFbdPSF6zGn4qnEx
	YN8gqY0t2afFEPHkKhcAgYzbiWtr7xWQ5VZAqDEUV9m2NmMbBFwZBdB0jXNsE10X2Odf+q
	862EgtQA/QDjLY80t8z635OdLOWQ5gp4GYXIXe6BYiiqdAoswWdrNeOq+F0mMTIiJHQbRQ
	cJZwkRwZOczxRy1zNTwSVuB697dNTxEQELoK6Zm/LOTGeePvFqXJABuQHMhz6iQhUaVayi
	B/Be1RRjEKt7Xroh17YuwO/BKAocRC0AiP5qw0Q76u1sAh1gMMoIKFcSzz8oYA==
Date: Wed, 14 Jan 2026 16:02:16 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-i3c@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Subject: Re: [PATCH 1/1] i3c: master: svc: Initialize 'dev' to NULL in
 svc_i3c_master_ibi_isr()
Message-ID: <176840281752.1259180.2305157652667385666.b4-ty@bootlin.com>
References: <20251215200852.3079073-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215200852.3079073-1-Frank.Li@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 15 Dec 2025 15:08:51 -0500, Frank Li wrote:
> Initialize the 'dev' pointer to NULL in svc_i3c_master_ibi_isr() and add
> a NULL check in the error path.
> 
> 

Applied, thanks!

[1/1] i3c: master: svc: Initialize 'dev' to NULL in svc_i3c_master_ibi_isr()
      https://git.kernel.org/i3c/c/3c9ffb4db787

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
