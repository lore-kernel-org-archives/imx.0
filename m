Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D7C12C530
	for <imx@lists.linux.dev>; Thu,  3 Oct 2024 07:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727941132; cv=none; b=rDVWWuVNtzSK2ee2clzrpNP5kcqKA4DhE5xl7OFeRhCUVG1EuLjM237KVE4tdelZsDAZrgTZ32DibBVejNZCKjJDw6rJeRlLdfjvGTSrO2kThu55fS7XZMjSTjN3kcpfe1Yg62jEFbjQcREGEPA+stE1XNIsCvRrtD827UM8ZmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727941132; c=relaxed/simple;
	bh=Mdk7wdBlUKPSKm6vqlfmFbVbC3NUDs7dOL9N3hbHRV0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Atwodisr53VsohyLQi2moosZqjRBm47wRAHKOJwry0L9gdec1p5VTuNhd4z5FWU3gjHSztYFigWMdNxopeqmlCMiCuddJxBjFw1wyfbCceGuRLX7TD0Olyz+eR99EYV0seVv00Gm+GFfEVQnAr6AByitOlQv/hqSk/Mn1TmWrwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Bqs7lguP; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Bqs7lguP"
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF29BC000F;
	Thu,  3 Oct 2024 07:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727941123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mBrqkKvGl4kLLjZgTx5geh5hlpljwKGXfB3/2Okw3cg=;
	b=Bqs7lguPte2uKhNCq2dF+fhZHHYwARQ+M4Eup1PWFlpbRybJm16S7QBsU6Iq9vw9M2MZeY
	do6eHkuT6zQ5AmwlQ401Lm7ctzrPsxuCHO1Ml91lXCJK31PA3GxDrmn7z0S2TQDvBLCaNl
	RDV8duvykWVybkpvdlTegP7v4aidlfXOvF9DLVONQpUPLQuOABJ9dkNtwHWHlYdutP1D47
	/HQh+RCvI/zSIuXvN2PYlHZvaWKgqQT0ITMYE5lZ809gNgDZhAtH1lHdFPLEj9yK4T/s5f
	Lf8rgw/MPT5gQQfzBhUEbArx3IxS16ZwvgX5+AHBhvHias40tEKrRP2MBNCWjg==
Date: Thu, 3 Oct 2024 09:38:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <han.xu@nxp.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, imx@lists.linux.dev, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mtd: nand: raw: gpmi: improve power management
 handling
Message-ID: <20241003093840.2965be20@xps-13>
In-Reply-To: <20241002153944.69733-2-han.xu@nxp.com>
References: <20241002153944.69733-1-han.xu@nxp.com>
	<20241002153944.69733-2-han.xu@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Han,

han.xu@nxp.com wrote on Wed,  2 Oct 2024 10:39:44 -0500:

> The commit refactors the power management handling in the gpmi nand
> driver. It removes redundant pm_runtime calls in the probe function,
> handles the pad control in suspend and resume, and moves the calls to
> acquire and release DMA channels to the runtime suspend and resume
> functions.

May I know the motivation to acquire and release the DMA channels
during suspend? In general it seems like a different change which I'd
prefer to see in its own commit with a justification. The rest looks
ok otherwise.

Thanks,
Miqu=C3=A8l
