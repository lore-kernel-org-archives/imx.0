Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08EF47ECD7
	for <imx@lists.linux.dev>; Tue,  5 May 2026 13:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777989110; cv=none; b=GnXxsaUwOOQhajEZpPeaWW/uKfOLPOa3f0bb682rtBEDdNazeK0l6unLWdeBZqs3qF/IDTvsadIjvXY7hM0vj2AxtQ8VoSAOMtk8wgJrtth8Ggc9/n0Fl7TfX3ai42NsyPSve1vF8Zb69hkjU1u+RWQi81t7fmE/6yllKYizEqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777989110; c=relaxed/simple;
	bh=xo5umndcEyLGiWOJhHMf9q3v4XEGsmwU7lViijkWpXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uFsbhlUol1MSA2oxhshw/HU5d3TqxiGAzzgI4Lg7WoQPdavAwQRsV7V+bsX8iEKnIcCDI71oJTM7K5jrke5KwEwje+SjaI5p8PIenEn0kdx69JQsumq6mco+Upj1v6+7VPkXB+l9F1mjRUZx4wjGlR1Y774F/LwxIE9YksePzAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dltLJJY9; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dltLJJY9"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E62B4C5D739;
	Tue,  5 May 2026 13:52:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EA4576053C;
	Tue,  5 May 2026 13:51:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47E0411AD0190;
	Tue,  5 May 2026 15:51:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777989105; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xo5umndcEyLGiWOJhHMf9q3v4XEGsmwU7lViijkWpXM=;
	b=dltLJJY95nTFBOjhnhLmFVlYQMKVPbsLzwwbT8GLD4la63Nvrirx7k7dZ/oZHPVo+q4Y4l
	RRg66/ed60XEZZgEIzIgjjHYAepLfvRJxwSPvkyWe/I+hh1F6bspOJDTx4Q8jho8zXoGO4
	GQ1bvcQBpxuud1GES7Eq5/fg9CnWW2NdgOVdMGusW4NQmujr0HkJn3mPbiGiMWF9HBpsUg
	ZrOB10stqv1DjM+1AXWsSzdBjl4vfBRTK16EpxfkwYRZbVa8YPSx2TJ7dKoHqwbYzTy4uO
	WfjJx1k/m4/Ig4XyQ1th9yghakZdGq7cdWMYbUI/hFckfw8eZ6udrbmpoCCYQA==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Frank Li <Frank.Li@kernel.org>, imx@lists.linux.dev,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH RFC 1/2] dmaengine: fsl-edma: Implement
 device_prep_peripheral_dma_vec
Date: Tue, 05 May 2026 15:51:43 +0200
Message-ID: <BXbYyeoYQ824UWckgqlzqQ@bootlin.com>
In-Reply-To: <afjCEG_Do01eVBBO@lizhi-Precision-Tower-5810>
References:
 <20260430-fsl-edma-dyn-sg-v1-0-4e0ecbe2df66@bootlin.com>
 <20260430-fsl-edma-dyn-sg-v1-1-4e0ecbe2df66@bootlin.com>
 <afjCEG_Do01eVBBO@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

On Monday, 4 May 2026 at 17:58:08 CEST, Frank Li wrote:
> On Thu, Apr 30, 2026 at 11:49:32AM +0200, Beno=C3=AEt Monin wrote:
> > Add implementation of .device_prep_peripheral_dma_vec() callback to set=
up
> > a scatter/gather DMA transfer from an array of dma_vec structures. Setup
> > a cyclic transfer if the DMA_PREP_REPEAT flag is set.
> >
> > Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>
> > ---
>=20
> Please remove RFC for this patch.
>=20
Ok, will do.

Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



