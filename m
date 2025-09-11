Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB81163CB
	for <imx@lists.linux.dev>; Thu, 11 Sep 2025 02:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757556083; cv=none; b=PlUsd6KIOY1OrugRy3tdok7wipvB2/eneuucvK3BVa+PqSig3KvlZjmdaBIwXD5m5GrvYE535ss5sd3t8QI2bVhUUyf/TUjXMDoXG/+FixkRTteJJMOyJTwNiWNJJ2nSNGSEkBh6z67FdWFonmp26zj2mmJfSOpNqWFTGBvhDPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757556083; c=relaxed/simple;
	bh=SjQ0VuRrX/wj/9VRm7fBxQNQb2Vk6Qm0wEkiK82lHHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l6Vyr6xYStagzaaXT0Ip1wjDxd0mE+oO/K36rYzgeNtycV7mI5sMvyh0DE/UenzpeE0LjNUQ2YAEha3LmomUJKzwJ+GndWIWlccMfqsOSOeUGcVkKiwVHaYt4aqw3xa5kheR7S9emHE3bTH7W+YqJ3VnPKDxQKzVoWaO7qSqAro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=fGALOccq; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="fGALOccq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=MJkHWNhg96u/bWwhWBm9dtQDm3fe+lYmlVB+NnrOYTw=;
	b=fGALOccqq3/HB3aYedK7mhGWYXFRFcdVOtp+ZXVnxng+uZtQ9lkUnW2zJL3vr7
	ruXARSF/uRxQSVqXlXYKRRvjrsqimVa+QAWhA3jb0fLInqUyGVj3xMtaunG8FWjE
	ECxl9GnpqSVUMpHOUI0/wPF5HqfRZp9G7TD3BO+aAedQQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDHNdtTLcJoC6dfBA--.50379S3;
	Thu, 11 Sep 2025 10:00:52 +0800 (CST)
Date: Thu, 11 Sep 2025 10:00:50 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Peng Fan <peng.fan@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] firmware: imx: Add stub functions for
 MISC/CPU/LMM APIs
Message-ID: <aMItUoCIhGpF7tIK@dragon>
References: <20250825-imx9-sm-v2-0-0bae0265e66a@nxp.com>
 <PAXPR04MB845910056A522BC1DD5D0F168806A@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB845910056A522BC1DD5D0F168806A@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CM-TRANSID:Ms8vCgDHNdtTLcJoC6dfBA--.50379S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7jg4UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBUrkGjCLVXWFQAA3L

On Tue, Sep 02, 2025 at 01:01:39PM +0000, Peng Fan wrote:
> Hi Shawn,
> 
> > Subject: [PATCH v2 0/3] firmware: imx: Add stub functions for
> > MISC/CPU/LMM APIs
> 
> Is this patchset good for you to pick up?

Ok, picked it up, thanks!

