Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C97839098B;
	Wed, 11 Mar 2026 22:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773267709; cv=none; b=Mnw35QPCi216gl2zR38E35F7ykNJAYdmZVo4c6g3oHd6p3AAsD9o0AAKC7zs2rCxVfE3h7fFmWH8dqEUBWj3B5y4oR7ApdYUmyTpnNT5o2VTpOba6NhAXRYOYQUoan9y5Fuyjs7UGiwztTYwHfzKqQZpgWHrQy7YHNrAlCk1hjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773267709; c=relaxed/simple;
	bh=WK3QT8rOLHjpCFW78jHwvfMiwloIaFd16wfM+ic7+OQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KgM6cYHk5pZRD1PAntYHMkOnaM2aQl4t53scsrsT6fi0P7+DYY9IfFl2IpY5mhwMY1/m0OLKbBBrNWqzzZ/HU92MQWzEf8zUQ1Aqs4v01AJy8QycpJXr/4bU6dNnZrInjN5Fvfz38sifop5Lj/DOYFooOZHfoJUEIFPnKMMplsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tkrD9TeA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tkrD9TeA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B426C4CEF7;
	Wed, 11 Mar 2026 22:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773267709;
	bh=WK3QT8rOLHjpCFW78jHwvfMiwloIaFd16wfM+ic7+OQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tkrD9TeAacpCbTlpV9TAeDLGkfF4fHWFTj6DRcwOFitcdOtMln7oUjJAHTm9qjYOF
	 NibmVmwv0tyKrc+UJjv5ebCCpVPdo7u5/pQ4FxH+91sJpsWvYzxgw9qHC0vMUEOZ5t
	 P9zkLDW8P0VXMwVzN1uUFnzcg58I9R0iHs7vPoMGgNyjQRfRS2M9tItEFXQjqByvtN
	 qNg3rRYp8kvXbsI9ZXcCWK9v/GiYVc4KwtDQdaogZTbZ9luZmn+H9lhwjsfASmmR+1
	 IPBYotdafQoHWzPEtjkgzQ7wdr8aXm5UXob7ENNIrQNwfgbW9i5A85yMEoIj07x4aR
	 qY65/2dBPq/5Q==
Date: Wed, 11 Mar 2026 17:21:48 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Larisa Grigore <larisa.grigore@nxp.com>
Subject: Re: [PATCH v6 3/5] irqchip/imx-irqsteer: add NXP S32N79 support
Message-ID: <20260311222148.GA875265-robh@kernel.org>
References: <20260311081154.381881-1-ciprianmarian.costea@oss.nxp.com>
 <20260311081154.381881-4-ciprianmarian.costea@oss.nxp.com>
 <87h5qmraum.ffs@tglx>
 <abGPVJpvXCOtMcCs@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abGPVJpvXCOtMcCs@lizhi-Precision-Tower-5810>

On Wed, Mar 11, 2026 at 11:50:44AM -0400, Frank Li wrote:
> On Wed, Mar 11, 2026 at 10:09:37AM +0100, Thomas Gleixner wrote:
> > On Wed, Mar 11 2026 at 09:11, Ciprian Costea wrote:
> > > From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > >
> > > Add support for the interrupt steering controller found in NXP S32N79
> > > series automotive SoCs.
> > >
> > > The S32N79 IRQ_STEER variant differs from the i.MX version by not
> > > implementing the CHANCTRL register. To handle this hardware difference,
> > > introduce a device type data structure with quirks field. The
> > > IRQSTEER_QUIRK_NO_CHANCTRL quirk skips CHANCTRL register access for S32N79
> > > variants.
> > >
> > > The interrupt routing functionality and register layout are otherwise
> > > identical between the two variants.
> > >
> > > Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> > > Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> > > Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> >
> > I've picked up this one. Can the ARM64 folks please pick up the DT muck
> > as that really has close to zero relevance to irqchips.
> 
> Did you pick binding one?

The replies to the thread clearly say what was applied.

> PATCH v6 1/5] dt-bindings: interrupt-controller: fsl,irqsteer: add S32N79 support
> 
> I have not founnd at linux-next yet.

Please take the binding with the .dts file changes.

Rob
