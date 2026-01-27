Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3624F35FF4F;
	Tue, 27 Jan 2026 15:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769529568; cv=none; b=pRuMwbpPsXiW66iFFUNC/MKtvO+OKl5kqSfau82OnQJv6s67CzbLYhYhsDIY6eLHmMdkcVm1sT8xUVezvIuNIoFv51Yg2ltld9D0i65EGDRd2+EO0zcGmLuyT7hlqrovd00T52+76gnwr8zkZ3Ui0IiCmZ1i1jnXpi14mabmDQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769529568; c=relaxed/simple;
	bh=7Kk/UgKEDwgrwdHPW1Qb4FsfRBGa894DRsv61HEBlPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fvCQtGfOpMsLHfjXXHhf95f9oG4nTCw6u5CXwFdqa1cxxK/5h85/0IZFaNax67/qMg9FXgrWtDEKVWdkdz+k3/jRdnxJq/lsMCc9zbh10zYEd5FW41yPBULaLJkRnYZh24hb3O0yRBElTqUnEWtSuW5ak56a66E69g2UaRVnnkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T/E/D/dw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/E/D/dw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ECDFC116C6;
	Tue, 27 Jan 2026 15:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769529568;
	bh=7Kk/UgKEDwgrwdHPW1Qb4FsfRBGa894DRsv61HEBlPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T/E/D/dwBt5kVbbO8bwnkCjjkCAq3PpXqmisYsbKBkm0ZcKh81GU73LIt5Zcm4a78
	 l5GykXn2JhUe04/5ff9tTKqmUP44V7K3ipY7ELJzk+RmY7SYlStzSa+DrTW7g8wJ0I
	 eD287DqKnKscPd2bDn2BC7RZe2bobC34DK1ZEIdoFGSymaks+oKZ4z/+ZGnkzc3VC+
	 De4BDYbqW59bLOEoZiydufhmE0E6YFo1dFZLto3cg7ls/ywsFzWzO/b20tJ2SQueYb
	 n/cmw+Mdriht+8UqbF3bJuuGkAD9Ma10uqidau23CssVi3zQrf+cKblHMgcmBW0LnL
	 bsIO3L35A8C5A==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vklTM-00000000754-2PMD;
	Tue, 27 Jan 2026 16:59:20 +0100
Date: Tue, 27 Jan 2026 16:59:20 +0100
From: Johan Hovold <johan@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2] drm/imx/tve: fix probe device leak
Message-ID: <aXjg2C0XeVGEtdDy@hovoldconsulting.com>
References: <20251030163456.15807-1-johan@kernel.org>
 <aR8TWJurF1a0LLGJ@hovoldconsulting.com>
 <aWd2xizOQAnVRaSs@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWd2xizOQAnVRaSs@hovoldconsulting.com>

On Wed, Jan 14, 2026 at 11:58:14AM +0100, Johan Hovold wrote:
> On Thu, Nov 20, 2025 at 02:10:48PM +0100, Johan Hovold wrote:
> > On Thu, Oct 30, 2025 at 05:34:56PM +0100, Johan Hovold wrote:
> > > Make sure to drop the reference taken to the DDC device during probe on
> > > probe failure (e.g. probe deferral) and on driver unbind.
> > > 
> > > Fixes: fcbc51e54d2a ("staging: drm/imx: Add support for Television Encoder (TVEv2)")
> > > Cc: stable@vger.kernel.org	# 3.10
> > > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > > ---
> > > 
> > > Changes in v2:
> > >  - add missing NULL ddc check
> > 
> > Can this one be picked up for 6.19?
> 
> It's been two more months so sending another reminder.
> 
> Can this one be merged now?

Can someone please merge this for 6.20?

Johan
