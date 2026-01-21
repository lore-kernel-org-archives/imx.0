Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C0C3382E2;
	Wed, 21 Jan 2026 07:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768982361; cv=none; b=K8XBfJW1ziaLOPRaPEGbcWoEvYz5AoXc2yW0BlaC1mEcQFDSg79HZknnKum4yDR+H05jUT4wtRInEtKrt3MKYX7pDXkeX7uB0BuV025wAJ2KcKhC9lC7ClIOyseMX5YrT+RIVi9H3h9KoYQqe3OFT+G9tHfaq9C1+0V78GJUp9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768982361; c=relaxed/simple;
	bh=B/7SxcFDchYAOxBFM3nekD6F3BNUoh6xpZYaOFcjPWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZnh2/gq+jJ1LMdSMOhi9PJZurmuN1Hk9jnugAe4RdNy/XddH2or0aSNsiqqQTqwIzNHR2nM9Wvf/xJ2N44cmTaag8IxU2H7BlL2oJ7F35wibvnayjrleF3MUK7PsZsQ94b0KINRHOhYy6eXsTLNJNTOfq4yGCEe1fCodrrHJV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZddl4+4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZddl4+4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3865CC116D0;
	Wed, 21 Jan 2026 07:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768982360;
	bh=B/7SxcFDchYAOxBFM3nekD6F3BNUoh6xpZYaOFcjPWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RZddl4+40tnL7hWPWTaNGYdQMXa2Iw5iaLuiEt06W7iElk1M3kUOr+OXOXVx+SLuh
	 6ZemwgMGYVzfaH7MS9JcRXM4ZE6blUG8ZB8iwrRs0DcDft/A8L9S+eh2A4u91jvGG0
	 TZS7Sn24xKexfKOqcrX84UhWlZEJEcnjt5eeEPM3i0w1njHAEX8FkAohIwT8H17FSW
	 Sz6NxzyJclSwoct9qszl2ONMxltY9ItMshi0FcyIhD6fMy8vP2ILkQA2fKOU/l6rOW
	 PNttevoIvyYCZRzpkLo+xGlAgA5xdAe4Aao/LK/Atv3h/jnshApMG5Q+ZAsJCPJTsz
	 OFg02BDz+AhZQ==
Date: Wed, 21 Jan 2026 08:59:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, 
	festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] ASoC: dt-bindings: fsl,audmix: Add support for
 i.MX952 platform
Message-ID: <20260121-uber-adder-of-radiance-0ebda7@quoll>
References: <20260120035210.1593742-1-shengjiu.wang@nxp.com>
 <20260120035210.1593742-2-shengjiu.wang@nxp.com>
 <20260120-fractal-lemming-of-chemistry-6f21df@quoll>
 <CAA+D8APePw6BnRP=Wnw+zna+oc4_aoMWZewYC7yx-XYLBrSKbQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAA+D8APePw6BnRP=Wnw+zna+oc4_aoMWZewYC7yx-XYLBrSKbQ@mail.gmail.com>

On Tue, Jan 20, 2026 at 07:07:48PM +0800, Shengjiu Wang wrote:
> On Tue, Jan 20, 2026 at 6:31=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> >
> > On Tue, Jan 20, 2026 at 11:52:07AM +0800, Shengjiu Wang wrote:
> > > There is no power domain defined on i.MX952, so make power-domains to=
 be
> >
> > There is no defined or there is no power domain? If the first, then this
> > patch is incomplete. Please read writing bindings part about complete
> > bindings. If the latter, then you miss constraints ":false" and commit
> > msg phrasing is incorrect (and remember that in such case you won't be
> > able to add power domains later because now you add complete binding).
>=20
> Thanks for pointing this out.
>=20
> There is a power domain on i.MX952 for the mix system of AUDMIX.
> But it is enabled by default,  AUDMIX device don't need to enable it.

This should be explained in the commit msg.

Best regards,
Krzysztof

