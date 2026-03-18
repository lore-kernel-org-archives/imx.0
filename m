Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4516137C101
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 21:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773869153; cv=none; b=aVTvxo3zkEdSnLutVzRfOuZymS36UbpY4/hQ1N/l0W3oqvXGAfMgUmuM2C9M+kjHzqUgl2RRcbibRj0ThJNe1Q1FTnxoc/D3ESdqdCWidnBQIp26pz3zFXDjDqN9Xy4WjhSXxiTYZSFJLhTlV/He3xZJkM+vyEQHqOg78Xa3bJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773869153; c=relaxed/simple;
	bh=qbNTmnGKr/iuGm5tPULd9Nkz62g6Y9eeIzF9tr/vt2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=InPo9K1s4JAkaMtc7pOx7Bu9y7RKlg0j+49x4i2KrlYNEv0+9hBt9+5n4ZUDXnTulOSeDPg1Yh4K1elHaClcdRE5FHiuht2hMdpnuupI3mGcxTliXMsak3aAOfMyJyW7Jwu2HsiM2bFEYwGQe6viwl/F4gUS40Tf48+x54LWDmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FQZgk8nD; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FQZgk8nD"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4C0584E426FA;
	Wed, 18 Mar 2026 21:25:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0C2836004F;
	Wed, 18 Mar 2026 21:25:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 29E2910450588;
	Wed, 18 Mar 2026 22:25:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773869148; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=TBfCDwN1NBGh0HHhy5LrBzLxbJJulMF534ZV5O9n5wc=;
	b=FQZgk8nDbmSYHUahG5fhlJPqHfiyXuCpfGGQv9gGbVR9LbH+hXjZib6dUfsG9/3YkfjqrD
	cdlvnwFDU6sClZkX2YmZVrITEq+YWxxDwinJlJTlQgksvIzvp+WCj6zzUCpIFjAa5ZDXFN
	t0iwW87kJI/hbxi2NYmbmeRayAUg8otN8Is6u43SaQazNCXkQ9Is+MNFy50PpUVwI9luAM
	pM3zmzkxxykcSI3wmMDNgYgTQfzUXdcnkGtwAc5C5jlnfTVshMXKQ/f3NThy142uDyoSmx
	3STUn3nk9UYQqkvJgw0aPICa8/HEHUaMgXgGAsJ9wkFMLmaqMjbpb1iOWB2YtQ==
Date: Wed, 18 Mar 2026 22:25:46 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>, Haoyu Lu <hechushiguitu666@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-i3c@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: fix missing newline in dev_err messages
Message-ID: <177386913315.4149699.772834407640388030.b4-ty@bootlin.com>
References: <20260317034015.638-1-hechushiguitu666@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317034015.638-1-hechushiguitu666@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 17 Mar 2026 11:40:15 +0800, Haoyu Lu wrote:
> Add missing newline to dev_err messages in:
> - drivers/i3c/master.c
> - drivers/i3c/master/svc-i3c-master.c

Applied, thanks!

[1/1] i3c: fix missing newline in dev_err messages
      https://git.kernel.org/i3c/c/7ea9bfee2ee0

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
