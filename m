Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB633286D52
	for <imx@lists.linux.dev>; Mon, 30 Jun 2025 13:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751290661; cv=none; b=gbKWkg6JCl2Y8AA6rTfYKUsMyj251kNSqlqo+enI+kiwypN95yMazAAktwcV2COoEaMOskY2gLkywy6o0qSn3UAwsyCThBj9vDp9ltspnrUyOtpA6Y3Uvcg0pMan1cqXoDOBhcLYJYqURtlxBjUd3fkOGyU2FK7gQQNpmnWISNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751290661; c=relaxed/simple;
	bh=O4qRLRexRAuK+5ApxruyQ2/Nu+qVASNZCX7hgb3Bh1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FdTp/akoRsx7V1RSO3Q/6yMG7s6q7mKUATpy3BZLbzIA9fKWLSHCP6hpjNVQmAk1u4nRcFZFN5SAa/CHv3HBpQCdyGrC1qV2RlklBqwaRrBi6w3IUGyNugh56R5IXkiMXHnpXs5mr9h7GxDAue2HbJTfHY40a2/LWsz0mfn/6Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id DB46968AA6; Mon, 30 Jun 2025 15:37:34 +0200 (CEST)
Date: Mon, 30 Jun 2025 15:37:34 +0200
From: Christoph Hellwig <hch@lst.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, Christoph Hellwig <hch@lst.de>,
	Alan Stern <stern@rowland.harvard.edu>, Xu Yang <xu.yang_2@nxp.com>,
	ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
	hdegoede@redhat.com, gregkh@linuxfoundation.org, mingo@kernel.org,
	tglx@linutronix.de, andriy.shevchenko@linux.intel.com,
	viro@zeniv.linux.org.uk, thomas.weissschuh@linutronix.de,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <20250630133734.GA26768@lst.de>
References: <20250627101939.3649295-1-xu.yang_2@nxp.com> <20250627101939.3649295-2-xu.yang_2@nxp.com> <1c4f505f-d684-4643-bf77-89d97e01a9f2@rowland.harvard.edu> <20250629233924.GC20732@pendragon.ideasonboard.com> <CANiDSCswzMouJrRn2A3EAbGzHTf88q_qQ=DC_KX7dbf_LJzqBg@mail.gmail.com> <20250630082313.GB23516@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630082313.GB23516@pendragon.ideasonboard.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Jun 30, 2025 at 11:23:13AM +0300, Laurent Pinchart wrote:
> Christoph, you mentioned
> 
>   Right now we don't have a proper state machine for the
>   *_kernel_vmap_range, but we should probably add one once usage of this
>   grows.
> 
> Has there been any progress on that front ?

None that I'm aware off anyway.

