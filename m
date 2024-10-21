Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBED21E5719
	for <imx@lists.linux.dev>; Mon, 21 Oct 2024 10:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729504945; cv=none; b=blxBydz7yRg0nnc0wnS2uLY2UDnmu/R/Pq8lBIqwVo/nOsZ0yyFbeuL0K+ZBHQNBgP/dJigBI8+6do+KdtJjXa/k7IHfmLo7wvINUSjktdMCzRxPEACb1/u9d6b2pm8ikAUwrv9HHSjoAvZkCG6Ke6hpxb01JWfJGHGzbXz4SfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729504945; c=relaxed/simple;
	bh=Y69u180EiHITWa8zp97o1zqMOgEBQPqr0jrzjpaTr9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oFVunY/kTkxh7+i8pNL9NR10igwogE0JdKJYjelhGvd17xPU/7xapFATXKD+mEsepooZnWRgP2glJmlsbQE6eUwwEAi12AZzb1WhEiYduhS9VHO3rriqOBT71jCPfMwvuowVfb+C2EHd04MVigZERood7G9rfU03MzXJ8ZyDIRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NNGjL8Wf; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NNGjL8Wf"
Received: by mail.gandi.net (Postfix) with ESMTPSA id B1DBD240003;
	Mon, 21 Oct 2024 10:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729504941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BvxIJEkIpMCFwUT4H7ccPVTQW18WobfYy9Wn/MtPQ18=;
	b=NNGjL8Wf/4yaEvDBev+kCrUwCIuqjGRKdH0A9lYnUdoctZi28bmg9XOuOQNGcByqZLtFTa
	gEp6E6nxLO1r8/XR8k3NswL2IirEMEuXTOyZxxhwo/mUlbhswM/HpcSQ+nWp8WSj07TIR2
	kTSzJI276lI73kjrzlsjKnV1fd0gCW+X3M6aNNampGrvEQFvgHtw6fslZeEJqe0DV+/dxc
	flGxFkDnlmS7fyQ3tw1w33OUOb/pA24ZVZVP+QJyCVvYL2Y8REh+J5/QJQKmSi/bqnIe47
	IKIDQV8AFHW6rEz8M830Bgrc071fSIRj1pn6t98E95nG6uisqk6yr+j6paqYHQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <han.xu@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	imx@lists.linux.dev,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add mailing list for GPMI NAND driver
Date: Mon, 21 Oct 2024 12:02:18 +0200
Message-ID: <20241021100218.173185-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241011182603.346435-1-han.xu@nxp.com>
References: 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'7b2e57c26d45d55aa00d9f2904db12633596ffdb'
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com

On Fri, 2024-10-11 at 18:26:03 UTC, Han Xu wrote:
> Add the imx@lists.linux.dev mailing list for the GPMI NAND driver.
> 
> Signed-off-by: Han Xu <han.xu@nxp.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
