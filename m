Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227D0187336
	for <imx@lists.linux.dev>; Tue,  7 May 2024 20:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715113686; cv=none; b=EN+OHyAH07Jha1we3cv6zg9E4YOb8X6QXUoJFTLC2g5ciWllWrnqgrhcpA4kgdikK9sKr8NvUu76ldtslMf3EPEOlYT3EMmk8xvIhTpTmkpGfM+BJq1frtD5XBXfU2xtfyxQgqM1rnwv/AEUAyvTAAjfm5i/l0/J+nZ/V6GiS58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715113686; c=relaxed/simple;
	bh=IYIjBvEOG2icV9qUDpX5BGX4FUW/MIUSLmjw/3yIVgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJHyM3ELtluZWanC74VthBBwOTjjj/j3HKXKMG2TtyNweDhiAH95cS+wHfXUM+RpSPOmUvx9pR23NorditE/9/kbHxXAkBZ+jN7hc6pK0F0gdV2WKOcGslGwYtsWIzHixAV82VWM3M4M5nU5e20XEK0h9PSsiN+bd/6cht6wwkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OuWLybSp; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OuWLybSp"
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8372FF805;
	Tue,  7 May 2024 20:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715113675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GnYuaSYVTcxIbkjcD6lKwaRFkflKMhkDDqSPD7vAAvQ=;
	b=OuWLybSpTWH0HHcK1Ox+v0oS2lcDSwQZ8pfq62CKC2VDoMypz57Wr9S0G6UrxQZQFtaXeY
	KfEzriTwq0HJhOgrtbbrqEl66qcu76jgW7r4iky2lNkeN46FOOlK8JZCxwiomqWhsQsJn3
	ijAinSkGboLigff9z7OjmnuqRkuANElLZ4ylq4WlyNEqb98Tn/ZqwGy2QZwgYXcO/s14b+
	bzK1sODj6tlqvhi06+hk+SDzh/9SIZ/DTr9i4xsM0IdVttSsFW4q4PShlDFla/PprT9BHQ
	LAPZTbfN+woImLj/XebviOl/thEZNygDrtQiwXUzoSX6saapIjHIW30xThyRyw==
Date: Tue, 7 May 2024 22:27:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: miquel.raynal@bootlin.com, Frank Li <Frank.Li@nxp.com>
Cc: conor.culhane@silvaco.com, imx@lists.linux.dev,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] i3c: Add comment for -EAGAIN in
 i3c_device_do_priv_xfers()
Message-ID: <171511365446.810643.1784657313942616005.b4-ty@bootlin.com>
References: <20240506164009.21375-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506164009.21375-1-Frank.Li@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Mon, 06 May 2024 12:40:07 -0400, Frank Li wrote:
> In accordance with I3C spec ver 1.1.1 09-Jun-2021, section: 5.1.2.2.3, if
> a target requests hot join (HJ), In-Band Interrupt (IBI), or controller
> role request (CRR) during the emission of an I3C address in
> i3c_device_do_priv_xfers(), the target may win bus arbitration. In such
> cases, it is imperative to notify the I3C client driver and retry
> i3c_device_do_priv_xfers() after some delay.
> 
> [...]

Applied, thanks!

[1/3] i3c: Add comment for -EAGAIN in i3c_device_do_priv_xfers()
      https://git.kernel.org/abelloni/c/5e45614ef8ae
[2/3] i3c: master: svc: change ENXIO to EAGAIN when IBI occurs during start frame
      https://git.kernel.org/abelloni/c/75cb32046b5d
[3/3] i3c: master: svc: fix invalidate IBI type and miss call client IBI handler
      https://git.kernel.org/abelloni/c/677a7b0e3ae4

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
