Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA23117C7A5
	for <imx@lists.linux.dev>; Tue, 17 Sep 2024 14:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726585127; cv=none; b=immq6hBbvnndo5+7cKT2MuXHBOX0bo0zEhB/5ckA51umu21+0EBMVnWPdhrLGZsSyw5ofW36f5VwJfUNcs3R1euUxifcGqfgfhj3cIMP20k33WSTqBjrsUOGqdhVHJnw739XwYhmx+PyFwf1C3YwLCvbctc5/+Ua9Q6Y6ugO0Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726585127; c=relaxed/simple;
	bh=j4eL6f+uhNSon8LXau+o3kuRUxLLC1CUWIcemQtdj40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6ziiLz062CtT+mpYbcTnkFQJAVTzzygGxLcFhsukaSxNGL/yqqUx+hhI5DcFo93eOabg4yO5QL9oibw7zsEHzTt1qn3sWx8vvTW9C4WwbahUS2/jca+IJkBP1J7IHew2geFccit8q0pfNFCPxbO/Dyb6rBr8+qaCMDcSdA0Jdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=egQHzoSF; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="egQHzoSF"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 10115E0006;
	Tue, 17 Sep 2024 14:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726585116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fxuFezK0xjfMGtoX3SnZWKbCuPTSYzqIfR4UXyDll6E=;
	b=egQHzoSFCzhBvijzyk+MN6mXNHGXSJjNbOHHLIZDVGOataC7fdpqzTryktYsYekOpE47sj
	DushjthwZNV8MorE/+nKHBoYDFf94KkrlNgyFybzJZOkDe01HhSqlfvhl1tGFSqU36SXIW
	hD3PWRyM/wUluObJf6+zylh7ZQvQu92NBn2NMGl8GKXFS4158a3LCDZkp+9QnprzcOLR9Q
	G/GjFsVbHpTjUtFpIsKFNV16npcZW5wscoBKbot8q9+CwWkz0hsR04gLidNFviorATD7Ix
	0FANn1aqhPKi1xVDnuUwiKkFGf3E4Y9gFSxUZalh3Xx1WZl47s88QaMxEQyNWw==
Date: Tue, 17 Sep 2024 16:58:32 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: miquel.raynal@bootlin.com, conor.culhane@silvaco.com, frank.li@nxp.com,
	carlos.song@nxp.com
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH V5 1/2] i3c: master: support to adjust first broadcast
 address speed
Message-ID: <172658508683.68424.12218247032382293641.b4-ty@bootlin.com>
References: <20240910051626.4052552-1-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910051626.4052552-1-carlos.song@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Tue, 10 Sep 2024 13:16:25 +0800, carlos.song@nxp.com wrote:
> According to I3C spec 6.2 Timing Specification, the Open Drain High Period
> of SCL Clock timing for first broadcast address should be adjusted to 200ns
> at least. I3C device working as i2c device will see the broadcast to close
> its Spike Filter then change to work at I3C mode. After that I3C open drain
> SCL high level should be adjusted back.
> 
> 
> [...]

Applied, thanks!

[1/2] i3c: master: support to adjust first broadcast address speed
      https://git.kernel.org/abelloni/c/aef79e189ba2
[2/2] i3c: master: svc: use slow speed for first broadcast address
      https://git.kernel.org/abelloni/c/20ade67bb164

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
