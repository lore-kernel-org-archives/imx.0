Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22681B9B25
	for <imx@lists.linux.dev>; Mon,  9 Sep 2024 12:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725886476; cv=none; b=uU+zt531yZGz0RM9qC3Hg59DPlHgO/PL/qtESn4du4YC4ltX0aBmQZETAoM8iv9k0nfAvrRKPz1+JTOSY5cuH+qV4ioRXDXhjTG1zY3W52Lyj+L+a9q8VlITNIRBzhdgNWSTkmGio2lMdWF2X1wTszj1i+BwHcYpw8IsKQ/a2Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725886476; c=relaxed/simple;
	bh=9w0sSJFSbDZblgKV2bqF1IwJcU9aE1btO0FgCad6Mc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfqkIIufv8J2KpcyPBa0PLF4T/uvcqsmQ1eVcN7Hnz4yAexYgcH/l1PmDgUHUmnJ3Q5ZzbLwW/2DdjZXWJsa9zOMO5g8zCrcKEoKz9H43/7B/4Jknz8MQsmD9PzItuterTLH7GJ+gVceQMInV8HYdxejk8pGumjdofHWdfPDwQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=eACSEQnT; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="eACSEQnT"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 213641FCD1;
	Mon,  9 Sep 2024 14:54:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1725886464;
	bh=N+n+sNoWLrte5yaPsNU7QlZO/lCcS8hz3s32YZuFi0U=; h=From:To:Subject;
	b=eACSEQnTt45lSSQdZN0JawLzeNSnTQkZKSICFVuzeO6IvA9l4wuG12yQlgINGcKyS
	 2VavSq7wIprqvAsg46uvSbdRHliwhik0WYPhXCPPHz9TYOPK4fak+JU0C2AtoaBfL/
	 kcQsJMm4u9PQ4CHtGLpThdg8vw4CXAN2oemXuMfqn1/Z+jB3xBE/aaacwx/990zUz1
	 7ViGthwWIbjE9cQkA9ZA3rPQXOKEktSria73wfaNDTZNN8uImKhRWwqaz8n+cmlCVG
	 C6M1YDsJ6AkRxTdqXsBTb7pwkw7zE0wdd4a/aus7ieP92Zh52aA9xb2wJF1jbBPVIL
	 9ywlFJHZAjNnQ==
Date: Mon, 9 Sep 2024 14:54:19 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hiago De Franco <hiagofranco@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [PATCH 1/3] ARM: dts: imx6qdl-apalis: Update audio card name
Message-ID: <20240909125419.GA33114@francesco-nb>
References: <20240909114902.82380-1-hiagofranco@gmail.com>
 <20240909114902.82380-2-hiagofranco@gmail.com>
 <25873dfa-fe70-4ef6-b840-795faaec1f07@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25873dfa-fe70-4ef6-b840-795faaec1f07@kernel.org>

Hello Krzysztof,
thanks for the review/feedback.

On Mon, Sep 09, 2024 at 02:09:11PM +0200, Krzysztof Kozlowski wrote:
> On 09/09/2024 13:49, Hiago De Franco wrote:
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
> > index edf55760a5c1..1c72da417011 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
> > @@ -191,7 +191,7 @@ sound {
> >  			"MIC_IN", "Mic Jack",
> >  			"Mic Jack", "Mic Bias",
> >  			"Headphone Jack", "HP_OUT";
> > -		model = "imx6q-apalis-sgtl5000";
> > +		model = "apalis-imx6";
> 
> Doesn't this break all the users? E.g. ALSA UCM and whatever
> user-space-parsing stuff you have?

I am not sure about "all" users, but for sure it's a breaking change.
There is no ALSA UCM for this board (and also not for the other twos in
this series), we just worked on it and we thought that if we want to do
such a change the moment is now.

What should we do?

Francesco



