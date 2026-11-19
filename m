Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795074708;
	b=j9v2eajEQ6NwgtH9g3zV86K4KJw//1pp1kFir8AmGQn+0N8znipedMNvTasA1N192M6V
	 x7Hja+7cxgoTHWLP2AhOhaZb8/cPWSGUPv3VlqTWQ03Vd1m8YP+P2ngkjXJB0G9qvuppM
	 owbc4xEEnUVu4VS54jWUxuw0aaRUerCOpOBXZE1v6204ofhY9FqXZAM3GC929KlmjHKMC
	 BgQbcqrEYtKlDrW5TGYFu9NoAoFsVVLGlncv2nxfNaxfkeNfEVvKqTEf6Wh4MdQv8DR6G
	 TzkxQqLd50ToiBuOIrHaTc5psHxdW2oVkY6sSRS9IobfBGaFSAzqh18QvkTBvF1IsuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795074708;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uWbT9SL84xs5jBjXDDyUhjNSR3AIBmd7V8WgJgh/Hd0=;
	b=0k/NPfeELwkda2WuaQpHQZCGZhdKAC49KknRjbj+gImVgo05HgCSD9QZC+ZmLVDoXzQB
	 /e121nkhjy9lx5BfpODlXAw34mpgeRZ4KnzwkF0S4CEyC150Pup9c3YhKEPpyWr/rhBEs
	 EIf1jpzKhlKo9hj7LMW1n8vUt1Sjzf4QCnloO7xKT22Un66wba88qEkLw4Pd+C9L8K+5P
	 UJCYOeuRWh0N842X1402b09Ge9D4hQCey99Zot61BTTDKxbmlxZRerFL4MiEjoIAdKKUF
	 ZoYll7ovVpB18IFLrMnajw9HKAauQ6ExNWVzG6z/jbyDYiHR5UWYZHfpaFutX/PfNMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IkBwclon;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D1D606A325;
	Thu, 19 Nov 2026 07:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IkBwclon
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 495471F000C5;
	Thu, 19 Nov 2026 07:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795074708;
	bh=uWbT9SL84xs5jBjXDDyUhjNSR3AIBmd7V8WgJgh/Hd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IkBwclonItyJFZAOm7Za5D5OICIeFoxsHHrC9JhMLZuPA3JWyF9X2iZGlFCed96rn
	 ED7M87IG1txhxnfoMK6Zx8Rkeri/d63KrpRqyPDY4iwScRRFxWGI9TuNkA+jto1Wcz
	 3YaVOWwacOvjVzsnzd2Nf2ZUu5JItgr15Azkce/r7qQa6fPb1O63f1JyjQhQg1RH31
	 PZkz8yw8ZOhB5V9B9cOAzhDySWkg4qa6zO2lLX+7onOIZhKFBGczB76EcuXDdY6qVV
	 pIhMDUroHLnGaoHwnW9ZBlTL5BaGoNSCkdkQleL7LzA+kV8octV315QnQaXcLbUUAW
	 Sz/mNJfVnDIIw==
Received: from johan by xi.lan with local (Exim 4.100.1)
	(envelope-from <johan@kernel.org>)
	id 1xTwvp-000000056Th-2wpQ;
	Thu, 19 Nov 2026 08:51:45 +0100
Date: Thu, 19 Nov 2026 08:51:45 +0100
From: Johan Hovold <johan@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/imx/tve: take i2c adapter module reference
Message-ID: <av6qkTiuZoPTteMs@hovoldconsulting.com>
References: <20260716131937.1564892-1-johan@kernel.org>
 <anx_aEJGbFM6Xosx@hovoldconsulting.com>
 <ar5Z1TjIceCl-EdS@hovoldconsulting.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar5Z1TjIceCl-EdS@hovoldconsulting.com>

On Thu, Oct 01, 2026 at 03:02:13PM +0200, Johan Hovold wrote:
> On Wed, Aug 12, 2026 at 04:12:56PM +0200, Johan Hovold wrote:
> > On Thu, Jul 16, 2026 at 03:19:37PM +0200, Johan Hovold wrote:
> > > The i2c subsystem currently blocks during adapter deregistration
> > > whenever there are consumers holding a reference.
> > > 
> > > Switch to using of_get_i2c_adapter_by_node() which also takes a
> > > reference to the adapter module so that an attempt to unload the module
> > > while in use fails gracefully instead of blocking uninterruptibly.
> > > 
> > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > 
> > Can this one be picked up for 7.3-rc1?
> 
> Again, can someone please pick this one up?

It's been four months, can someone please pick this one up?

Johan
