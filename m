Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7A51CC8B7
	for <imx@lists.linux.dev>; Thu, 31 Oct 2024 22:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730415356; cv=none; b=AYGQYs9K5ARUfbmefGu4OA+S6IdvzkEsikFSoRzbauuZlkxQNK+E/O6SUgtqeDkDmunD9CITQE1TWsz+wC658GV/xCFWaAhbwZco6h6tGSM/LwPsAYqy1B3OXhyjY9flY6ytJdOcTfs2Ij7JqL9QvIZITKp624GCiisjUYXdZXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730415356; c=relaxed/simple;
	bh=NEWLqxDG/7C24HdYcXnUKC+fUO1Z0ESsfr5iv5uCqsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OZHhUvoQ+GZayeELzB32YgIxmMEX9GIDyQCwSr6qKlB9BcaRSbBzrlR+rjkdzHQ1MRj61vkTva7iaANhk6KrwPd0J+Ys7TNulwpEYVPrQ/jLzv/X+RI3hb5Zi8E/p9Xl/nQcM20afjxNfrOB70SOs1OAI+M5lCJte+NOe2U8FLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=czHwhS0a; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="czHwhS0a"
Received: by mail.gandi.net (Postfix) with ESMTPSA id ABBD4C0005;
	Thu, 31 Oct 2024 22:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730415342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JQA0d1WJrJIdFs7Zvw7Azp27bcFdE29fGgC676nj/eQ=;
	b=czHwhS0aKKP6ir28M751dMssoU/Trd2ZUOKZ5ONNx/mXiun4QOxVtlUQ+NWMAkkh4s2Kgm
	914fRoNAfZ4RrIwBv1J+DL3Rft7St5AKkHCoqCR/287bqeHE06UoCx3AwdPitPabzPSFO3
	b5PQNVtIJ7/6eFqYmhd8PhrcDuF0eMvmFiAueAM3bTvvyVd18w29+FHFJgFztw45D2jWeG
	gwT9Zm5mr9y83+DtkKN3c8vv/GKYGeKAtOJXQ2+UiZDZFQbynV4vBmLE/yUPbx5els16L8
	oRr2rxOB278G2Q5JUBtJRip43tZ0bhBmKOMFZmg2w2+uj3kPSMWkVQVdbaABhw==
Date: Thu, 31 Oct 2024 23:55:41 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, stable@kernel.org
Subject: Re: [PATCH v6 0/6] I3C: master: svc: collect all patches to improve
 hotjoin stability
Message-ID: <173041531797.2391928.6742670173313972551.b4-ty@bootlin.com>
References: <20241002-svc-i3c-hj-v6-0-7e6e1d3569ae@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002-svc-i3c-hj-v6-0-7e6e1d3569ae@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Wed, 02 Oct 2024 10:50:32 -0400, Frank Li wrote:
> This patches is splited from
> https://lore.kernel.org/linux-i3c/ZvrAuOBLgi+HtrPD@lizhi-Precision-Tower-5810/T/#t
> 
> It needs more discussion about dt assign address issue about i3c framework.
> 
> This series is svc driver improvement and bug fixes for hotjoin. It fixes
> all kinds hotjoin problem when 2 devices random hotjoin and A normal data
> transfer is on going.
> 
> [...]

Applied, thanks!

[1/6] i3c: master: svc: use repeat start when IBI WIN happens
      https://git.kernel.org/abelloni/c/3c6684a15010
[2/6] i3c: master: svc: manually emit NACK/ACK for hotjoin
      https://git.kernel.org/abelloni/c/e22405a812a1
[3/6] i3c: master: svc: need check IBIWON for dynamic address assignment
      https://git.kernel.org/abelloni/c/6a12f56f7392
[4/6] i3c: master: svc: use spin_lock_irqsave at svc_i3c_master_ibi_work()
      https://git.kernel.org/abelloni/c/f36f6624cbac
[5/6] i3c: master: svc: wait for Manual ACK/NACK Done before next step
      https://git.kernel.org/abelloni/c/3ca529194e29
[6/6] i3c: master: svc: fix possible assignment of the same address to two devices
      https://git.kernel.org/abelloni/c/3b2ac810d86e

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
