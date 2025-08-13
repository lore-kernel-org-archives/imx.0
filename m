Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072B22EB5A7
	for <imx@lists.linux.dev>; Wed, 13 Aug 2025 21:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755121576; cv=none; b=tVSDwG07/DoPVuM/nF3cjXl19whxAGNZXD6qneg/zCFh883DFi/Fpne2mM2dYgFak4wToBP0Qlbjvj7gXRljwaj/xJxmuvZU1RSFOmsLtijAnpPykjoCffDv2bBfljloPGDpJnThCVkmr3xBCPv0/BuNVPb9CRdkYEx+bozxz1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755121576; c=relaxed/simple;
	bh=Y8ZT1omRWVh2D9pbGNUAIUVOIcYLDnqbxdj4q0qn92o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P4ui7QGfDmi/kqYbSamubvCZFHhK0rBZ1Kr8G6X3WkUpn6UxagPorhswsrX0P/BV1D7WrbBuzsJiHSqUI+8trjNF2cKBtGj04T3X7Dgh5HE/lyAAzpCuMzQXGRNeDSiqE09uz5U78BmZFspeXTEd9hJQ8C6awA3of1YlRthd52s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=l2/COFig; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="l2/COFig"
Date: Wed, 13 Aug 2025 23:46:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755121569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5/DqFL26+UsS+8mNqc4oz88CmU86CRRwfKfxjUz3a3k=;
	b=l2/COFigXLA1PcXRav9SSuBhtOpmcB4C3+TNzdqWZ85P8fhGNjusU+tWOaepjs787SYydf
	JbhN0MMYtaMMk4D5j+BIOEjj0hN/a/g0XXvHv8ag9/oyQqCq4EfzibWxvJ1ApR/u7dqKCm
	RogDvtQKVyqv7vCZbEjNT32hvzKsMsY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev
Subject: Re: [PATCH v2 0/2] media: nxp: imx8-isi: fix streaming cleanup on
 release
Message-ID: <5szbp7ae7sbfpzvfw73t2l5cwgd7i2hjmeljhmf4mxz32agwth@ycttzoi5ux46>
References: <20250813212451.22140-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813212451.22140-1-laurent.pinchart@ideasonboard.com>
X-Migadu-Flow: FLOW_OUT

Hi Laurent,

On Thu, Aug 14, 2025 at 12:24:49AM +0300, Laurent Pinchart wrote:
> Hello,
> 
> This patch series fixes an issue initially reported by Richard in [1],
> with a proposed fix. I've recommended an alternative approach, and gave
> it a try.

Thanks for reviewing that patch of mine [1].
And thank you for providing this alternative approach. It looks way
cleaner now :-) I previously tought of a similar approach as yours,
but then opted for the "less invasive" one. So again what learned for
me. Thanks!

As I've never had such a situation and wasn't able to find something in
the docs [2] about it: Do you need/want a Reviewed or Tested-By tag on
patch 1/2 of this series? (Altough there's also a SoB from me before
your Co-Developed tag)

[2] https://www.kernel.org/doc/html/latest/process/submitting-patches.html

regards;rl

> 
> Patch 1/2 fixes streaming cleanup on release. Patch 2/2 then cleans up
> the driver a bit by dropping an unneeded structure field.
> 
> The changes have been tested by opening and closing the video device
> while streaming in another process. I have also tested suspend/resume
> during streaming.
> 
> [1] https://lore.kernel.org/linux-media/20250709-imx8-isi-release-fix-v1-1-c47c659ce1a6@linux.dev/
> 
> Laurent Pinchart (1):
>   media: nxp: imx8-isi: Drop mxc_isi_video.is_streaming field
> 
> Richard Leitner (1):
>   media: nxp: imx8-isi: Fix streaming cleanup on release
> 
>  .../platform/nxp/imx8-isi/imx8-isi-core.h     |   3 +-
>  .../platform/nxp/imx8-isi/imx8-isi-video.c    | 156 +++++++-----------
>  2 files changed, 57 insertions(+), 102 deletions(-)
> 
> 
> base-commit: 078f1a7eb48eef9b3cb78bcd2254356f3a332358
> -- 
> Regards,
> 
> Laurent Pinchart
> 
