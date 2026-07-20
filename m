Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604E4439903
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 16:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784564168; cv=none; b=U6FZVvzq9CXxEUXeYWwftK8C8GoFbVMtBvn4GbGhnhxfEztnVYl7YCEb8HCvYfiAjUK3Uf6zdSeKE9y/7ItNxPCw4uJJi9AtkH5RajsFd4KavCsjWOVYbWsPCfiCzzJrYkfJ9uREpkhNKmPcBL6Tm1IW9GRsodlejalxKSmgqu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784564168; c=relaxed/simple;
	bh=P/ojslEuJM4hNVKRndw9YD2wD/XJjiCB/s+Ribjs3Mo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYk2vUvIq5Wcle5rvf20bHcMGaRKbl9jk1mIUp6OzZKEIDzIV2xXMwMl6o+fAsjwdMjqQx28U9Mf1FD4hhkObcjxCuKVUwYModMntJkm2sqpKwFapZdNK+NoTjn2hBOcoyHKOoT3Uvu2DjM3qAUN0QkgrZ0kKUIOW09+a+Piv10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1Xl27wOf; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1Xl27wOf"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2CB5E4E40E75;
	Mon, 20 Jul 2026 16:16:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D766360360;
	Mon, 20 Jul 2026 16:15:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED2B711BD3CC1;
	Mon, 20 Jul 2026 18:15:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784564158;
	h=from:subject:date:message-id:to:mime-version:content-type:in-reply-to:
	 references; bh=E+KW8apzPeuJJFrU4ZzXm/UBjJRlt54+RYJ6SJW+mtY=;
	b=1Xl27wOfuq3BTeu9UHmjXTLT4Tz0BR4YjxJbZI05DPWE8VT+3t9XfEJe3H9AktcxRzwX1o
	vy8KeVgxwWTMV4hkW2tB2R0acIQdzRNAzvqTTN02LYX+Qw6Fh5QXsh+JJsedt9tegkqXBb
	sycqkWK0gORgnVg7sLZWzqrDseSWqXG4egMTMszLqbsmd9ilJ0gUwThgtENJFrJW0UtB/N
	zjRxbdbLCBenRXU4guB2O5Ae/5fbyhbEPwAxB0OqO0dO6HASJ7i4HC8/AnKm7wKXqFRBJH
	BVj0rUbqxX65us8JrDA7LbcYijPaVwprbPy618/fJ1XNHyjJrOXa8I/eQ6u5Iw==
Date: Mon, 20 Jul 2026 18:15:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jorge Marques <jorge.marques@analog.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, imx@lists.linux.dev,
	tze.yee.ng@altera.com
Subject: Re: [PATCH v6 0/5] i3c: Improve CCC reliability with actual_len,
 validation, and Direct GET retry
Message-ID: <178456413898.83935.17006528519078741282.b4-ty@b4>
References: <cover.1783493867.git.tze.yee.ng@altera.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1783493867.git.tze.yee.ng@altera.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 08 Jul 2026 00:17:36 -0700, tze.yee.ng@altera.com wrote:
> From: Tze Yee Ng <tze.yee.ng@altera.com>
> 
> This series improves I3C Common Command Code (CCC) handling in the I3C
> core and master drivers. It separates requested and received GET payload
> lengths, validates GET responses centrally, and retries failed Direct GET
> CCCs once by default.
> 
> [...]

Applied, thanks!

[1/5] i3c: ccc: Add actual_len to struct i3c_ccc_cmd_payload
      https://git.kernel.org/i3c/c/2805eb4d075b
[2/5] i3c: master: Report actual GET CCC payload length on success
      https://git.kernel.org/i3c/c/295508ae7c30
[3/5] i3c: master: dw: Map CCC hardware errors to I3C M0/M2
      https://git.kernel.org/i3c/c/b5151c6e9cdf
[4/5] i3c: master: Validate GET CCC payload length and retry Direct GET once
      https://git.kernel.org/i3c/c/02cc832191dd
[5/5] i3c: master: Add optional_bytes for variable-length GET CCC validation
      https://git.kernel.org/i3c/c/4a51ae0a1b11

Best regards,
