Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08BA442FD4;
	Wed, 12 Aug 2026 14:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786543979; cv=none; b=V8CkqO5I03bBxq/GEfUn/NXf3YP+FlfEYBO7NS7dJfcipsISnt5nhABa6Q9J4qVEsYH1IO4ude+1gmmKH4Vu1TyFup4Vq91ObLuKDQlaKlsoo6XSacDYYc+TOUN7OlsMiUIX9XS+l9vIERiayQSmj6S4jVcB+ZaaE+hLOjlKjsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786543979; c=relaxed/simple;
	bh=xqo7Y0O3XxKCxXDumHvj7IJiME1yacoP9zZvn2maqIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWDjSoaFEidkU/mLD/CZD1wANE3iXXqAUpD3qSb1utz4nxYHmSDxaKEumdnJW3h/xikR2ynPjtU56oEoeKuG5opKY8xM0wF1khMF8YPbVq06OzOFV0jQX0Im1a40AdQxFOpPyPU2yc+/eNC4AlbyY+0PnBADUbjemOdn1YwaATw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CZxvRrRG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CZxvRrRG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D44B1F000E9;
	Wed, 12 Aug 2026 14:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786543978;
	bh=h2cOF3IgNEypu9rcuwe8w2VjzCTCa5SWQVgxjUIzs1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CZxvRrRGikZmrROcbh2rEu6xKqNYz8Q7zJtgczB1DKJgaSbkWIY42g4DkawoLhW+a
	 ZoK/vf7RwBeRAycEhJvwvKV6Rpn9vWvXl56ioXdWOFPv7QrLKVSsBOc4QZaGpG3Mty
	 BNQXNUHi5tImJWJxJODTSnulg0F8yonp24HPdiEZ74FcbXrDeWMdHeU5raQUf52z2I
	 RKnrZsEuf4m7JRfLOs0zJb4ma8OkK4rrSjPAkxuBkYO/eKMiWd5iCizCGtq9y0+gWC
	 9AcTHFQEvV97fTZbjmH0Nj3cKXnIMnjEIwehx165g+3yDoUAkPvEDTclse48Cibi5X
	 qAHXHuWQxBJ9Q==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wu9hQ-00000000EES-0Wq4;
	Wed, 12 Aug 2026 16:12:56 +0200
Date: Wed, 12 Aug 2026 16:12:56 +0200
From: Johan Hovold <johan@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/imx/tve: take i2c adapter module reference
Message-ID: <anx_aEJGbFM6Xosx@hovoldconsulting.com>
References: <20260716131937.1564892-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716131937.1564892-1-johan@kernel.org>

On Thu, Jul 16, 2026 at 03:19:37PM +0200, Johan Hovold wrote:
> The i2c subsystem currently blocks during adapter deregistration
> whenever there are consumers holding a reference.
> 
> Switch to using of_get_i2c_adapter_by_node() which also takes a
> reference to the adapter module so that an attempt to unload the module
> while in use fails gracefully instead of blocking uninterruptibly.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>

Can this one be picked up for 7.3-rc1?

Johan
