Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24CC3890F4
	for <imx@lists.linux.dev>; Sat, 28 Mar 2026 11:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774697878; cv=none; b=GjNUZvCR/bmFZcXsUcJkJY+nrXAjQas9XfuxsG50z+M/urgDHWOHSmJNbKh4MQanb8g39kDgUaTQYACuWqGEHd8wpbILHlzLqPM5v2DLFpbLUKvdaagWanlYhwRH10+qkLsrlw5y2nXlC9yFZeHcwERlKuK9xZGfb/3ZOnNgoDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774697878; c=relaxed/simple;
	bh=LkDJmadL615W4q00l7NDdJK9EtbSo9KpRQOXiC2c5hU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eovKj+pbZuuGiZURNpjmT9RKwmvr3apbzBJUZJT3r8ZzvCMJEcTe40bQddJGKaupoqarStwax00mndEc0OQC68nrK0mG9H78s1C8ArFZ0Sp42Mh/7JGIlMmpDJcKBBZ3IIkQmz0jhuXVOsPr4SWSrUD9Gi6pf9KsKTg9rcyDl78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=PHmaBbPs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=2J/acEMG; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="PHmaBbPs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="2J/acEMG"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id BBAAE1D001A0;
	Sat, 28 Mar 2026 07:37:54 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Sat, 28 Mar 2026 07:37:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774697874;
	 x=1774784274; bh=PTd2pk8Y/+znmp8P0psuOqPXJpEyyacbHu+SbMYHSN8=; b=
	PHmaBbPsV2OTbR9JWMgA7ehBXInZwrFnFkGFb/FMRYDmyFG5A7d/Q22juhsdoe+Y
	IUYUU0vuEeDoPIqV+hwcft232ghe4xI4VLdOT3/sILW+Mp5QtTUNAdnZJkSjZoPU
	xjCX6zQBMFAkVDUa22Ed7SMqKnFTr0/RPjv642UrM4oQ8CEWsKS0loHGQWEcAkhD
	IeCqXW8BfHG7HzVaTFsFXcEP8vXT0+50BKryOiiN995zzLdjbt7EZk+U8UzXrJn6
	FqEZyPFsyG+j9Xe8SoCIlVqmDc19XwlntkTbXhThTH2OMEh/OpKeXuCTlASTzJOM
	PRJOeIU6aDqV3MSVQz4/Aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774697874; x=
	1774784274; bh=PTd2pk8Y/+znmp8P0psuOqPXJpEyyacbHu+SbMYHSN8=; b=2
	J/acEMG0Ka3barJs0x/+zf07nOlQbuUxjxoTAetzASOoav6S5VeVVO03AbpGRUzN
	7KXxW+gXG/CVdFF6001CHGsxR0QFvQdqs6pQI7swXZTQKgQgrXjWdoraQmt83Vps
	GIfeidqt05tmYA1WtWvJk4xONG/VkP8YDKxnHNw1WzGCSkdTwL5TQpb1+Me1txyg
	lgUy3U34J/BB4ExQsRN7HUEYbA3yRhc26I+8XV+TIFhzh9nZEsp3jY7I6Usj+aL4
	fpqyEtBLEiNIrNGQndiMziTd58WvoOoCXSMZJPjr8JwaES4OxFj2ucldSwDDP5/C
	3B5EgJIBF6crpIMV0f/jA==
X-ME-Sender: <xms:kb3HadCU7DHeZ4UDxdr4eDTyAxV4-U6ByQIkEZOWx7-tVhpVZuDFCw>
    <xme:kb3HaVMfuzwlEFuU0cR3G1-K74we4GBOEGGwNfQCTtZgJOz64U_273HP0Ap1utl80
    ynqm7ugaJbgYyhtcK13mrsoXtH6wq5Wyo6MEaEFkCqvH65NFA>
X-ME-Received: <xmr:kb3HaX4pttNIG2iOi_yBDr4REp7gjRsHTsCYbb7YKv8GuwAA94JImy6AEeA5kR9b8VR9znO2l3GfRnvquA1PlJ_P-SXluv020mqLssvm-aM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeffeeftdejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtugfgjgesthekre
    dttddtjeenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheq
    necuggftrfgrthhtvghrnhepleekheejjeeiheejvdetheejveekudegueeigfefudefgf
    ffhfefteeuieekudefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomhdpnhgspghrtghpthhtohepfedtpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopeguvghvnhgvgigvnhesghhmrghilhdrtghomhdprhgtphhtthhopehlrghurhgvnh
    htrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohep
    mhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhhrrghnkhdrlhhise
    hngihprdgtohhmpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidr
    uggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtph
    htthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopehjrggtohhp
    ohesjhhmohhnughirdhorhhgpdhrtghpthhtoheprghishhhvghnghdrughonhhgsehngi
    hprdgtohhm
X-ME-Proxy: <xmx:kb3Haf38_2FPlxhNNos9IFMbsBN7LOQO-Oi0s8NMTdV8ibfL2TY9XQ>
    <xmx:kb3HaWpaTrM1gkArlHVQeyD67VVQly80TeBsp6X4T9ftX_JXaxkk3w>
    <xmx:kb3HaW9fSaDcLgREkK2tgn6UhzupkHJ8ZACymagJoYkJ9cqrLp6dHA>
    <xmx:kb3HaZ65IoRqWDf-4etebvhEwAHDI1yhOX8fQ8uoI5p_YtxDHdMyLQ>
    <xmx:kr3HaSvVLQgFq0nvqlCVieN6KT3kjY4cXPuvIF7FW8eAzJdnJVLYc6EL>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 28 Mar 2026 07:37:52 -0400 (EDT)
Date: Sat, 28 Mar 2026 12:37:29 +0100
From: Greg KH <greg@kroah.com>
To: David CARLIER <devnexen@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	jacopo@jmondi.org, aisheng.dong@nxp.com, guoniu.zhou@nxp.com,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] media: nxp: imx8-isi: fix memory leaks in probe error
 paths and remove
Message-ID: <2026032832-reputably-bankroll-1205@gregkh>
References: <20260327222711.268132-1-devnexen@gmail.com>
 <20260328100010.41236-1-devnexen@gmail.com>
 <2026032803-tree-stubbed-1e9b@gregkh>
 <CA+XhMqw+pR3fLGbysq3FnfpH+b2GtmdhSjjgCKhTwfZFrF0_0w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+XhMqw+pR3fLGbysq3FnfpH+b2GtmdhSjjgCKhTwfZFrF0_0w@mail.gmail.com>

On Sat, Mar 28, 2026 at 11:15:18AM +0000, David CARLIER wrote:
> On Sat, 28 Mar 2026 at 10:21, Greg KH <greg@kroah.com> wrote:
> >
> > On Sat, Mar 28, 2026 at 10:00:10AM +0000, David Carlier wrote:
> > > mxc_isi_probe() allocates isi->pipes with kzalloc_objs() but never
> > > frees it on any probe failure path or in mxc_isi_remove(), leaking the
> > > allocation on every failed probe and every normal unbind.
> > >
> > > Additionally, when mxc_isi_pipe_init() fails partway through the
> > > channel loop or when mxc_isi_v4l2_init() fails, the already initialized
> > > pipes are not cleaned up — their media entities and mutexes are leaked.
> > >
> > > Fix both by adding kfree(isi->pipes) to all probe error paths and to
> > > mxc_isi_remove(), and cleaning up already-initialized pipes in the
> > > err_xbar error path.
> > >
> > > Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> > > Signed-off-by: David Carlier <devnexen@gmail.com>
> > > ---
> >
> > <formletter>
> >
> > This is not the correct way to submit patches for inclusion in the
> > stable kernel tree.  Please read:
> >     https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> > for how to do this properly.
> 
> Apologies for the confusion — I wasn't submitting this for stable
> inclusion directly. The Cc was added based on CI bot feedback since
> the Fixes target is in the
>   stable tree, but I understand the correct flow is to let it go
> through the maintainer tree first and let the Fixes tag handle stable
> backporting.

If you read the above, "Fixes:" does not guarantee backporting at all,
so NEVER rely on that if you know you want something applied to a stable
kernel tree.

thanks,

greg k-h
